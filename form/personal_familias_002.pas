unit personal_familias_002;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs,
  utilidades_general, utilidades_rgtro, utilidades_bd, StdCtrls, Buttons,
  ExtCtrls, DBGrids, DbCtrls, Grids, ComCtrls, utilidades_datos_tablas;

type

  { Tform_personal_familias_002 }

  Tform_personal_familias_002 = class(TForm)
    BitBtn_Filtrar: TBitBtn;
    BitBtn_SALIR: TBitBtn;
    BitBtn_Seleccionar: TBitBtn;
    DataSource_ArtNOSubFam: TDataSource;
    DBGrid_Principal: TDBGrid;
    DBNavigator1: TDBNavigator;
    Edit_Descripcion: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label_Cambiable_1: TLabel;
    Label_Cambiable_2: TLabel;
    Memo_Filtros: TMemo;
    Memo_OrderBy: TMemo;
    PageControl_Filtros: TPageControl;
    RadioGroup_Bajas: TRadioGroup;
    SQLQuery_Personal_NO_SubFamilias: TSQLQuery;
    SQLQuery_Personal_NO_SubFamiliasChange_Id_User: TLargeintField;
    SQLQuery_Personal_NO_SubFamiliasChange_WHEN: TDateTimeField;
    SQLQuery_Personal_NO_SubFamiliasDel_Id_User: TLargeintField;
    SQLQuery_Personal_NO_SubFamiliasDel_WHEN: TDateTimeField;
    SQLQuery_Personal_NO_SubFamiliasDel_WHY: TStringField;
    SQLQuery_Personal_NO_SubFamiliasdescripcion: TStringField;

    SQLQuery_Personal_NO_SubFamiliasid: TLargeintField;
    SQLQuery_Personal_NO_SubFamiliasid_personal_familias: TLargeintField;
    SQLQuery_Personal_NO_SubFamiliasInsert_Id_User: TLargeintField;
    SQLQuery_Personal_NO_SubFamiliasInsert_WHEN: TDateTimeField;

    SQLQuery_Personal_NO_SubFamiliasOT_descripcion_familia_superior: TStringField;
    TabSheet_Busqueda_Concreta: TTabSheet;
    TabSheet_Filtros_Generales: TTabSheet;

    procedure Filtrar_Principal_Sin_Preguntar;
    procedure Presentar_Datos;
    procedure BitBtn_FiltrarClick(Sender: TObject);
    procedure no_Tocar;
    procedure BitBtn_SeleccionarClick(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure Seleccionado_Rgtro;
    procedure BitBtn_SALIRClick(Sender: TObject);
    procedure DBGrid_PrincipalCellClick(Column: TColumn);
    procedure DBGrid_PrincipalDblClick(Sender: TObject);
    procedure DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Refrescar_Registros;
    procedure Cerramos_Tablas;
    procedure Cerramos_Tablas_Ligadas;
    procedure FormDestroy(Sender: TObject);
    procedure Obligar_como_Filtrado_Principal;
    procedure para_Empezar;
    function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
    procedure Filtrar_tablas_ligadas;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SQLQuery_Personal_NO_SubFamiliasAfterPost(DataSet: TDataSet);
    procedure SQLQuery_Personal_NO_SubFamiliasAfterScroll(DataSet: TDataSet);
    procedure SQLQuery_Personal_NO_SubFamiliasBeforePost(DataSet: TDataSet);
    procedure SQLQuery_Personal_NO_SubFamiliasCalcFields(DataSet: TDataSet);
  private
      { private declarations }
      private_Salir_OK : Boolean;
      private_Order_By : array of TOrder_By;
  public
      { public declarations }
      public_Solo_Ver                             : Boolean;
      public_Elegimos                             : Boolean;
      public_Menu_Worked                          : Integer;
      public_Rgtro_Seleccionado                   : Boolean;
      public_id_familia_que_no_tiene_que_aparecer : ShortString;
  end;

var
  form_personal_familias_002: Tform_personal_familias_002;

implementation

{$R *.lfm}

uses menu, dm_personal_no_subfamilias;

{ Tform_personal_familias_002 }

procedure Tform_personal_familias_002.FormActivate(Sender: TObject);
begin
    If public_Elegimos = true then
    begin
        BitBtn_Seleccionar.Visible := True;

        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    if public_Solo_Ver = true then no_Tocar;
end;

procedure Tform_personal_familias_002.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
    if private_Salir_OK = False then
        begin
          { ********************************************************************
            Intento BitBtn_SALIR de la aplicación de un modo no permitido.
            ********************************************************************
            Pero si desde el menu principal está a true la variable
            public_Salir_Ok, significa que hay que salir si o si pues se pulsó
            cancelar al preguntar otra vez por la contraseña
            ******************************************************************** }
            if form_Menu.public_Salir_OK = False then CloseAction := caNone;
        end
    else
        begin
          { ********************************************************************
            Fue correcto el modo como quiere BitBtn_SALIR de la aplicación
            ******************************************************************** }
        end;
end;

procedure Tform_personal_familias_002.FormCreate(Sender: TObject);
begin
    { ****************************************************************************
      Obligado en cada formulario para no olvidarlo
      **************************************************************************** }
      with Self do
      begin
          Color       := $00C2C29E;
          Position    := poScreenCenter;
          BorderIcons := [];
          BorderStyle := bsSingle;
      end;

      private_Salir_OK := false;

    { ****************************************************************************
      Solo para formularios que traten con datos
      **************************************************************************** }
      public_Solo_Ver                 := false;
      public_Elegimos                 := false;

      public_Rgtro_Seleccionado       := false;
end;

function Tform_personal_familias_002.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
var
  var_a_Filtrar : TStrings;
  var_SQL_ADD   : TStrings;
begin
    var_SQL_ADD   := TStringList.Create;
    var_a_Filtrar := TStringList.Create;
    var_a_Filtrar.Clear;

    Obligar_como_Filtrado_Principal;

    // ********************************************************************************************* //
    // ** AHORA PONDREMOS EL RESTO DE LOS FILTROS QUE NO SON GENERALES                            ** //
    // ********************************************************************************************* //
    // ** Primero buscaremos en el nombre y apellido el texto a buscar                              ** //
    // ********************************************************************************************* //
    if Trim(Edit_Descripcion.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pf.descripcion LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Descripcion.Text) + '%') );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
      y que por lo se debe de permitir modificarlos en ningún módulo }

    Result := UTI_TB_Filtrar( private_Order_By,

                              // Delete_SQL,
                              '',

                              // Update_SQL,
                              '',

                              // Insert_SQL,
                              '',

                              // var_ctdad_Rgtros,
                              -1,

                              DataModule_Personal_No_SubFamilias.SQLTransaction_PerFamNOSub,
                              DataModule_Personal_No_SubFamilias.SQLConnector_PerFamNOSub,
                              SQLQuery_Personal_NO_SubFamilias,

                              // name_tabla,
                              'pf',

                              RadioGroup_Bajas.ItemIndex,

                              // SELECT_SQL,
                              'SELECT pf.*,' + ' ' +
                                     'pfs.descripcion AS OT_descripcion_familia_superior' + ' ' +
                              'FROM personal_familias AS pf' + ' ' +

                              'LEFT JOIN personal_familias AS pfs' + ' ' +
                              'ON pf.id_personal_familias = pfs.id' + ' ',

                              Memo_Filtros.Lines,
                              Memo_OrderBy.Lines,
                              var_a_Filtrar,

                              param_Cambiamos_Filtro,
                              false,   // param_ver_SQL_despues_Abrir : Boolean;
                              true ); // no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

    var_a_Filtrar.Free;

    //Filtrar_tablas_ligadas;
    var_SQL_ADD.Free;
end;

procedure Tform_personal_familias_002.para_Empezar;
begin
  { ****************************************************************************
    Solo para formularios que traten con datos
    **************************************************************************** }
    if UTI_GEN_Form_Abierto_Ya('DataModule_Personal_No_SubFamilias') = False then
    begin
        DataModule_Personal_No_SubFamilias := TDataModule_Personal_No_SubFamilias.Create(Application);
    end;

  { ****************************************************************************
    Preparamos los diferentes tipos de orden preconfigurados
    **************************************************************************** }
    // Personal FAMILIAS
    SetLength(private_Order_By, 1);

    private_Order_By[0].Titulo       := 'Por descripción'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[0].Memo_OrderBy := 'pf.descripcion ASC';

    Memo_OrderBy.Lines.Text := private_Order_By[0].Memo_OrderBy;

    Obligar_como_Filtrado_Principal;

    { ****************************************************************************
    Filtramos los datos
    **************************************************************************** }
    Filtrar_Principal_Sin_Preguntar;

    Presentar_Datos;

    // ********************************************************************************************* //
    // ** SOLO PARA ESTE FORM                                                                     ** //
    // ********************************************************************************************* //
    PageControl_Filtros.ActivePage := TabSheet_Busqueda_Concreta;
end;

procedure Tform_personal_familias_002.Obligar_como_Filtrado_Principal;
var
  var_SQL_ADD : TStrings;
begin
    var_SQL_ADD := TStringList.Create;

    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'pf.id_personal_familias IS NULL' );
    UTI_TB_SQL_ADD( true,
                    Memo_Filtros.Lines,
                    var_SQL_ADD );

    if Trim(public_id_familia_que_no_tiene_que_aparecer) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pf.id <> ' + Trim(public_id_familia_que_no_tiene_que_aparecer) );
        UTI_TB_SQL_ADD( false,
                        Memo_Filtros.Lines,
                        var_SQL_ADD );
    end;
    var_SQL_ADD.Free;
end;

procedure Tform_personal_familias_002.FormDestroy(Sender: TObject);
begin
    Cerramos_Tablas;
end;

procedure Tform_personal_familias_002.SQLQuery_Personal_NO_SubFamiliasAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'personal_familias',
                       DataModule_Personal_No_SubFamilias.SQLTransaction_PerFamNOSub,
                       SQLQuery_Personal_NO_SubFamilias,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros;
end;

procedure Tform_personal_familias_002.SQLQuery_Personal_NO_SubFamiliasAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure Tform_personal_familias_002.SQLQuery_Personal_NO_SubFamiliasBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Personal_NO_SubFamilias );
end;

procedure Tform_personal_familias_002.SQLQuery_Personal_NO_SubFamiliasCalcFields(DataSet: TDataSet);
begin
    // ********************************************************************************************* //
    // ** PARA DAR VALOR A CAMPOS CALCULADOS                                                      ** //
    // ********************************************************************************************* //
end;

procedure Tform_personal_familias_002.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_Personal_No_SubFamilias.SQLConnector_PerFamNOSub,
                      DataModule_Personal_No_SubFamilias.SQLTransaction_PerFamNOSub,
                      SQLQuery_Personal_NO_SubFamilias ) = false then UTI_GEN_Salir;

    DataModule_Personal_No_SubFamilias.Free;
end;

procedure Tform_personal_familias_002.Cerramos_Tablas_Ligadas;
begin
{ ESTE form NO TIENE TABLAS LIGADAS

    if UTI_TB_Cerrar( DataModule_del_form_000.SQLConnector_de_la_tabla,
                      DataModule_Users.SQLTransaction_de_la_tabla,
                      SQLQuery_la_tabla ) = false then UTI_GEN_Salir;
}
end;

procedure Tform_personal_familias_002.Refrescar_Registros;
var var_descripcion : String;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_descripcion := '';

    if SQLQuery_Personal_NO_SubFamilias.RecordCount > 0 then
    begin
        var_descripcion := SQLQuery_Personal_NO_SubFamilias.FieldByName('descripcion').asString;
    end;

    Filtrar_Principal_Sin_Preguntar;

    if Trim(var_descripcion) <> '' then
    begin
         SQLQuery_Personal_NO_SubFamilias.Locate('descripcion', var_descripcion, []);
    end;
end;

procedure Tform_personal_familias_002.Filtrar_tablas_ligadas;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
begin
    if SQLQuery_Personal_NO_SubFamilias.RecordCount = 0 then Exit;

    if SQLQuery_Personal_NO_SubFamilias.State = dsInsert then
    begin
        Cerramos_Tablas_Ligadas;
        Exit;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;
end;

procedure Tform_personal_familias_002.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    If public_Elegimos then Seleccionado_Rgtro;
end;

procedure Tform_personal_familias_002.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure Tform_personal_familias_002.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_personal_familias_002.DBGrid_PrincipalDrawColumnCell(Sender: TObject;
    const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    UTI_GEN_Dibujar_Grid( Sender, SQLQuery_Personal_NO_SubFamilias, Rect, DataCol, Column, State );
end;

procedure Tform_personal_familias_002.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then
    begin
        If public_Elegimos then Seleccionado_Rgtro;
    end;
end;

procedure Tform_personal_familias_002.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

procedure Tform_personal_familias_002.Seleccionado_Rgtro;
begin
    private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    public_Rgtro_Seleccionado := true;
    Close;
end;

procedure Tform_personal_familias_002.BitBtn_SeleccionarClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
end;

procedure Tform_personal_familias_002.DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
begin
    //Filtrar_tablas_ligadas;

    case Button of
        nbRefresh : begin
            Refrescar_Registros;
            Abort;
        end;
    end;
end;

procedure Tform_personal_familias_002.no_Tocar;
begin
    // No hay nada para no tocar
end;

procedure Tform_personal_familias_002.BitBtn_FiltrarClick(Sender: TObject);
begin
    if PageControl_Filtros.ActivePage = TabSheet_Busqueda_Concreta then
    begin
        Filtrar_Principal_Sin_Preguntar;
    end else begin
        RadioGroup_Bajas.ItemIndex := Filtrar_Principal( true );
    end;
end;

procedure Tform_personal_familias_002.Presentar_Datos;
begin
    // No hay nada para presentar
end;

procedure Tform_personal_familias_002.Filtrar_Principal_Sin_Preguntar;
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

end.



