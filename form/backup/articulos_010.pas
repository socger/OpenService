unit articulos_010;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids, DbCtrls,
  Buttons, StdCtrls, Grids, ExtCtrls, utilidades_bd, utilidades_general, utilidades_rgtro,
  utilidades_datos_tablas;

type

  { Tform_articulos_010 }

  Tform_articulos_010 = class(TForm)
    BitBtn_Filtrar: TBitBtn;
    BitBtn_SALIR: TBitBtn;
    BitBtn_Seleccionar: TBitBtn;
    ComboBox_Filtros: TComboBox;
    DataSource_ArtaRfEleg: TDataSource;
    DBGrid_Principal: TDBGrid;
    DBNavigator1: TDBNavigator;
    Edit_Referencia: TEdit;
    Label6: TLabel;
    Label_Cambiable_1: TLabel;
    Label_Fecha2: TLabel;
    Memo_OrderBy: TMemo;
    Memo_Filtros: TMemo;
    RadioGroup_Bajas: TRadioGroup;
    SQLQuery_Articulos_Referencia_a_Elegir: TSQLQuery;
    SQLQuery_Articulos_Referencia_a_ElegirChange_Id_User: TLargeintField;
    SQLQuery_Articulos_Referencia_a_ElegirChange_WHEN: TDateTimeField;
    SQLQuery_Articulos_Referencia_a_ElegirCodigoBarras_o_Referencia: TStringField;
    SQLQuery_Articulos_Referencia_a_ElegirCodigoBarras_Referencia: TStringField;
    SQLQuery_Articulos_Referencia_a_ElegirDel_Id_User: TLargeintField;
    SQLQuery_Articulos_Referencia_a_ElegirDel_WHEN: TDateTimeField;
    SQLQuery_Articulos_Referencia_a_ElegirDel_WHY: TStringField;
    SQLQuery_Articulos_Referencia_a_Elegirid: TLargeintField;
    SQLQuery_Articulos_Referencia_a_Elegirid_articulos: TLargeintField;
    SQLQuery_Articulos_Referencia_a_ElegirInsert_Id_User: TLargeintField;
    SQLQuery_Articulos_Referencia_a_ElegirInsert_WHEN: TDateTimeField;
    SQLQuery_Articulos_Referencia_a_ElegirOT_Descripcion: TStringField;
    SQLQuery_Articulos_Referencia_a_ElegirOT_Descripcion_para_TPV: TStringField;

    procedure Cerramos_Tablas;
    procedure ComboBox_FiltrosChange(Sender: TObject);
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
    function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
    procedure Filtrar_tablas_ligadas;
    procedure Refrescar_Registros;
    procedure Cerramos_Tablas_Ligadas;
    procedure para_Empezar;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SQLQuery_Articulos_Referencia_a_ElegirAfterPost(DataSet: TDataSet);
    procedure SQLQuery_Articulos_Referencia_a_ElegirAfterScroll(DataSet: TDataSet);
    procedure SQLQuery_Articulos_Referencia_a_ElegirBeforePost(DataSet: TDataSet);
    procedure SQLQuery_Articulos_Referencia_a_ElegirCalcFields(DataSet: TDataSet);

  private
      { private declarations }
      private_Salir_OK : Boolean;
      private_Order_By : array of TOrder_By;
  public
      { public declarations }
      public_Solo_Ver                              : Boolean;
      public_Elegimos                              : Boolean;
      public_Menu_Worked                           : Integer;
      public_Rgtro_Seleccionado                    : Boolean;
      public_id_articulo_que_no_tiene_que_aparecer : ShortString;
  end;

var
  form_articulos_010: Tform_articulos_010;

implementation

{$R *.lfm}

uses menu, dm_articulos_referencias;

{ Tform_articulos_010 }

procedure Tform_articulos_010.FormActivate(Sender: TObject);
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

procedure Tform_articulos_010.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
    if private_Salir_OK = False then
    begin
        // ***************************************************************************************** //
        // ** Intento BitBtn_SALIR de la aplicación de un modo no permitido.                      ** //
        // ***************************************************************************************** //
        // ** Pero si desde el menu principal está a true la variable public_Salir_Ok, significa  ** //
        // ** que hay que salir si o si pues se pulsó cancelar al preguntar otra vez por la       ** //
        // ** contraseña                                                                          ** //
        // ***************************************************************************************** //
        if form_Menu.public_Salir_OK = False then CloseAction := caNone;
    end else begin
        // ***************************************************************************************** //
        // ** Fue correcto el modo como quiere BitBtn_SALIR de la aplicación                      ** //
        // ***************************************************************************************** //
    end;
end;

procedure Tform_articulos_010.FormCreate(Sender: TObject);
begin
    // ********************************************************************************************* //
    // ** Obligado en cada formulario para no olvidarlo                                           ** //
    // ********************************************************************************************* //
    with Self do
    begin
        Color       := $00C2C29E;
        Position    := poScreenCenter;
        BorderIcons := [];
        BorderStyle := bsSingle;
    end;

    private_Salir_OK := false;

    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    public_Solo_Ver                 := false;
    public_Elegimos                 := false;

    public_Rgtro_Seleccionado       := false;
end;

procedure Tform_articulos_010.FormDestroy(Sender: TObject);
begin
    Cerramos_Tablas;
end;

procedure Tform_articulos_010.para_Empezar;
begin
    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    if UTI_GEN_Form_Abierto_Ya('DataModule_Articulos_Referencias') = False then
    begin
        DataModule_Articulos_Referencias := TDataModule_Articulos_Referencias.Create(Application);
    end;

    // ********************************************************************************************* //
    // ** Preparamos los diferentes tipos de orden preconfigurados                                ** //
    // ********************************************************************************************* //
    // ARTICULOS REFERENCIAS
    SetLength(private_Order_By, 1);

    private_Order_By[0].Titulo       := 'Por la referencia'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[0].Memo_OrderBy := 'arf.CodigoBarras_Referencia ASC';

    Memo_OrderBy.Lines.Text := private_Order_By[0].Memo_OrderBy;

    UTI_TB_Rellenar_ComboBox_Orden( true,
                                    ComboBox_Filtros,
                                    private_Order_By,
                                    0 );

    // ********************************************************************************************* //
    // ** Filtramos los datos                                                                     ** //
    // ********************************************************************************************* //
    Filtrar_Principal_Sin_Preguntar;

    Presentar_Datos;

    // ********************************************************************************************* //
    // ** SOLO PARA ESTE FORM                                                                     ** //
    // ********************************************************************************************* //
end;

procedure Tform_articulos_010.SQLQuery_Articulos_Referencia_a_ElegirAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'articulos_referencias',
                       DataModule_Articulos_Referencias.SQLTransaction_Art_Ref_Elegir,
                       SQLQuery_Articulos_Referencia_a_Elegir,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros;
end;

procedure Tform_articulos_010.SQLQuery_Articulos_Referencia_a_ElegirAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure Tform_articulos_010.SQLQuery_Articulos_Referencia_a_ElegirBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Articulos_Referencia_a_Elegir );
end;

procedure Tform_articulos_010.SQLQuery_Articulos_Referencia_a_ElegirCalcFields(DataSet: TDataSet);
begin
    // ********************************************************************************************* //
    // ** PARA DAR VALOR A CAMPOS CALCULADOS                                                      ** //
    // ********************************************************************************************* //
end;

procedure Tform_articulos_010.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_Articulos_Referencias.SQLConnector_Art_Ref_Elegir,
                      DataModule_Articulos_Referencias.SQLTransaction_Art_Ref_Elegir,
                      SQLQuery_Articulos_Referencia_a_Elegir ) = false then UTI_GEN_Salir;

    DataModule_Articulos_Referencias.Free;
end;

procedure Tform_articulos_010.Cerramos_Tablas_Ligadas;
begin
    // ********************************************************************************************* //
    // ** Este form no tiene tablas ligadas                                                       ** //
    // ********************************************************************************************* //
end;

procedure Tform_articulos_010.Refrescar_Registros;
var var_CodigoBarras_Referencia : String;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_CodigoBarras_Referencia := '';

    if SQLQuery_Articulos_Referencia_a_Elegir.RecordCount > 0 then
    begin
        var_CodigoBarras_Referencia := SQLQuery_Articulos_Referencia_a_Elegir.FieldByName('CodigoBarras_Referencia').asString;
    end;

    Filtrar_Principal_Sin_Preguntar;

    if Trim(var_CodigoBarras_Referencia) <> '' then
    begin
         SQLQuery_Articulos_Referencia_a_Elegir.Locate('CodigoBarras_Referencia', var_CodigoBarras_Referencia, []);
    end;
end;

procedure Tform_articulos_010.Filtrar_tablas_ligadas;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
begin
    if SQLQuery_Articulos_Referencia_a_Elegir.RecordCount = 0 then Exit;

    if SQLQuery_Articulos_Referencia_a_Elegir.State = dsInsert then
    begin
        Cerramos_Tablas_Ligadas;
        Exit;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    // ********************************************************************************************* //
    // ** NO TIENE TABLAS LIGADAS                                                                 ** //
    // ********************************************************************************************* //

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;
end;

function Tform_articulos_010.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
var
  var_a_Filtrar : TStrings;
  var_SQL_ADD   : TStrings;
begin
    var_SQL_ADD   := TStringList.Create;

    var_a_Filtrar := TStringList.Create;
    var_a_Filtrar.Clear;

    // ********************************************************************************************* //
    // ** AHORA PONDREMOS EL RESTO DE LOS FILTROS QUE NO SON GENERALES                            ** //
    // ********************************************************************************************* //
    // ** Primero buscaremos en la descripción del artículo                                       ** //
    // ********************************************************************************************* //
    if Trim(Edit_Referencia.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'arf.CodigoBarras_Referencia LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Referencia.Text) + '%') );
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
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Articulos_Referencia_a_Elegir,
                                                            'articulos_referencias',
                                                            'u' ),

                              // Insert_SQL,
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Articulos_Referencia_a_Elegir,
                                                            'articulos_referencias',
                                                            'i' ),

                              // var_ctdad_Rgtros,
                              -1,

                              DataModule_Articulos_Referencias.SQLTransaction_Art_Ref_Elegir,
                              DataModule_Articulos_Referencias.SQLConnector_Art_Ref_Elegir,
                              SQLQuery_Articulos_Referencia_a_Elegir,

                              // name_tabla,
                              'arf',

                              RadioGroup_Bajas.ItemIndex,

                              // SELECT_SQL,
                              'SELECT arf.*,' + ' ' +

                                     'a.descripcion AS OT_Descripcion,' + ' ' +
                                     'a.descripcion_para_TPV AS OT_Descripcion_para_TPV' + ' ' +

                              'FROM articulos_referencias AS arf' + ' ' +

                              'LEFT JOIN articulos AS a' + ' ' +
                              'ON a.id = arf.id_articulos' + ' ',

                              Memo_Filtros.Lines,
                              Memo_OrderBy.Lines,
                              var_a_Filtrar,

                              param_Cambiamos_Filtro );

    var_a_Filtrar.Free;

    //Filtrar_tablas_ligadas;
    var_SQL_ADD.Free;
end;

procedure Tform_articulos_010.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    If public_Elegimos then Seleccionado_Rgtro;
end;

procedure Tform_articulos_010.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure Tform_articulos_010.DBGrid_PrincipalDrawColumnCell(Sender: TObject;
    const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    UTI_GEN_Dibujar_Grid( Sender, SQLQuery_Articulos_Referencia_a_Elegir, Rect, DataCol, Column, State );
end;

procedure Tform_articulos_010.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then
    begin
        If public_Elegimos then Seleccionado_Rgtro;
    end;
end;

procedure Tform_articulos_010.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

procedure Tform_articulos_010.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_articulos_010.Seleccionado_Rgtro;
begin
    private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    public_Rgtro_Seleccionado := true;
    Close;
end;

procedure Tform_articulos_010.BitBtn_SeleccionarClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
end;

procedure Tform_articulos_010.DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
begin
    //Filtrar_tablas_ligadas;

    case Button of
        nbRefresh : begin
            Refrescar_Registros;
            Abort;
        end;
    end;
end;

procedure Tform_articulos_010.no_Tocar;
begin
    // No hay nada para no tocar
end;

procedure Tform_articulos_010.BitBtn_FiltrarClick(Sender: TObject);
begin
     Filtrar_Principal_Sin_Preguntar;
end;

procedure Tform_articulos_010.Presentar_Datos;
begin
    // No hay nada para presentar
end;

procedure Tform_articulos_010.Filtrar_Principal_Sin_Preguntar;
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

procedure Tform_articulos_010.ComboBox_FiltrosChange(Sender: TObject);
begin
    Memo_OrderBy.Lines.Clear;
    Memo_OrderBy.Lines.Add( private_Order_By[ComboBox_Filtros.ItemIndex].Memo_OrderBy );
    BitBtn_FiltrarClick(Nil);
end;

end.

