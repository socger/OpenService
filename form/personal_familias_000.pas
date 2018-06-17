unit personal_familias_000;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs, Buttons, StdCtrls,
  variants, utilidades_general, utilidades_bd, ExtCtrls, utilidades_usuarios, DBGrids, DbCtrls,
  utilidades_datos_tablas, utilidades_rgtro, Grids, ComCtrls;

type

  { Tform_personal_familias_000 }

  Tform_personal_familias_000 = class(TForm)
    BitBtn_Filtrar: TBitBtn;
    BitBtn_Imprimir: TBitBtn;
    BitBtn_SALIR: TBitBtn;
    BitBtn_Seleccionar: TBitBtn;
    BitBtn_Ver_Situacion_Registro: TBitBtn;
    ComboBox_Filtros: TComboBox;
    DataSource_PerFam: TDataSource;
    DataSource_PerFam_SubFamilias: TDataSource;
    DBGrid_Principal: TDBGrid;
    DBNavigator1: TDBNavigator;
    Edit_Descripcion: TEdit;
    Image_Confirmado: TImage;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label_Ctdad_Rgtros: TLabel;
    Label_Fecha2: TLabel;
    Memo_Filtros: TMemo;
    Memo_OrderBy: TMemo;
    PageControl_Filtros: TPageControl;
    RadioGroup_Bajas: TRadioGroup;

    SQLQuery_Personal_Familias: TSQLQuery;
    SQLQuery_Personal_FamiliasChange_Id_User: TLargeintField;
    SQLQuery_Personal_FamiliasChange_WHEN: TDateTimeField;
    SQLQuery_Personal_FamiliasCuenta_Contable: TStringField;
    SQLQuery_Personal_FamiliasDel_Id_User: TLargeintField;
    SQLQuery_Personal_FamiliasDel_WHEN: TDateTimeField;
    SQLQuery_Personal_FamiliasDel_WHY: TStringField;
    SQLQuery_Personal_Familiasdescripcion: TStringField;
    SQLQuery_Personal_Familiasid: TLargeintField;
    SQLQuery_Personal_Familiasid_personal_familias: TLargeintField;
    SQLQuery_Personal_FamiliasInsert_Id_User: TLargeintField;
    SQLQuery_Personal_FamiliasInsert_WHEN: TDateTimeField;
    SQLQuery_Personal_FamiliasOT_descripcion_familia_superior: TStringField;

    SQLQuery_Personal_Familias_SubFamilias: TSQLQuery;
    SQLQuery_Personal_Familias_SubFamiliasChange_Id_User: TLargeintField;
    SQLQuery_Personal_Familias_SubFamiliasChange_WHEN: TDateTimeField;
    SQLQuery_Personal_Familias_SubFamiliasCuenta_Contable: TStringField;
    SQLQuery_Personal_Familias_SubFamiliasDel_Id_User: TLargeintField;
    SQLQuery_Personal_Familias_SubFamiliasDel_WHEN: TDateTimeField;
    SQLQuery_Personal_Familias_SubFamiliasDel_WHY: TStringField;
    SQLQuery_Personal_Familias_SubFamiliasdescripcion: TStringField;
    SQLQuery_Personal_Familias_SubFamiliasid: TLargeintField;
    SQLQuery_Personal_Familias_SubFamiliasid_personal_familias: TLargeintField;
    SQLQuery_Personal_Familias_SubFamiliasInsert_Id_User: TLargeintField;
    SQLQuery_Personal_Familias_SubFamiliasInsert_WHEN: TDateTimeField;
    SQLQuery_Personal_Familias_SubFamiliasOT_descripcion_familia_superior: TStringField;
    TabSheet_Busqueda_Concreta: TTabSheet;
    TabSheet_Filtros_Generales: TTabSheet;

    procedure ComboBox_FiltrosChange(Sender: TObject);
    procedure Filtrar_Principal_Sin_Preguntar;
    procedure Editar_Registro;
    function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
    procedure Insertar_Registro;
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
    procedure Presentar_Datos;
    procedure no_Tocar;
    procedure BitBtn_ImprimirClick(Sender: TObject);
    procedure BitBtn_SeleccionarClick(Sender: TObject);
    procedure Seleccionado_Rgtro;
    procedure BitBtn_SALIRClick(Sender: TObject);
    procedure DBGrid_PrincipalCellClick(Column: TColumn);
    procedure DBGrid_PrincipalDblClick(Sender: TObject);
    procedure DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure para_Empezar;
    function  Filtrar_Personal_Familias_SubFamilias( param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
    procedure Filtrar_tablas_ligadas;
    procedure Refrescar_Registros;
    procedure Refrescar_Registros_SubFamilias;
    procedure Cerramos_Tablas;
    procedure Cerramos_Tablas_Ligadas;
    procedure BitBtn_FiltrarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RadioGroup_BajasClick(Sender: TObject);
    procedure SQLQuery_Personal_FamiliasAfterPost(DataSet: TDataSet);
    procedure SQLQuery_Personal_FamiliasAfterScroll(DataSet: TDataSet);
    procedure SQLQuery_Personal_FamiliasBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_Personal_FamiliasBeforePost(DataSet: TDataSet);
    procedure SQLQuery_Personal_FamiliasCalcFields(DataSet: TDataSet);
    procedure SQLQuery_Personal_Familias_SubFamiliasAfterPost(DataSet: TDataSet);
    procedure SQLQuery_Personal_Familias_SubFamiliasBeforeEdit(DataSet: TDataSet
      );
    procedure SQLQuery_Personal_Familias_SubFamiliasBeforePost(DataSet: TDataSet);
    procedure SQLQuery_Personal_Familias_SubFamiliasCalcFields(DataSet: TDataSet);
  private
    { private declarations }
    private_Salir_OK             : Boolean;
    private_Order_By             : array of TOrder_By;
    private_Order_By_subfamilias : array of TOrder_By;
public
    { public declarations }
    public_Solo_Ver           : Boolean;
    public_Elegimos           : Boolean;
    public_Menu_Worked        : Integer;
    public_Rgtro_Seleccionado : Boolean;
  end;

var
  form_personal_familias_000: Tform_personal_familias_000;

implementation

{$R *.lfm}

uses dm_personal_familias, menu, personal_familias_001;

{ Tform_personal_familias_000 }

procedure Tform_personal_familias_000.FormActivate(Sender: TObject);
begin
    If public_Elegimos = true then
    begin
        BitBtn_Seleccionar.Visible := True;
        BitBtn_Imprimir.Visible  := False;

        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    if public_Solo_Ver = true then no_Tocar;
end;

procedure Tform_personal_familias_000.BitBtn_FiltrarClick(Sender: TObject);
begin
    if PageControl_Filtros.ActivePage = TabSheet_Busqueda_Concreta then
    begin
        Filtrar_Principal_Sin_Preguntar;
    end else begin
        RadioGroup_Bajas.ItemIndex := Filtrar_Principal( true );
    end;
end;

procedure Tform_personal_familias_000.FormClose(Sender: TObject; var CloseAction: TCloseAction);
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

procedure Tform_personal_familias_000.FormCreate(Sender: TObject);
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

procedure Tform_personal_familias_000.FormDestroy(Sender: TObject);
begin
    Cerramos_Tablas;
end;

procedure Tform_personal_familias_000.RadioGroup_BajasClick(Sender: TObject);
begin
     Refrescar_Registros;
end;

procedure Tform_personal_familias_000.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_Personal_Familias.SQLConnector_PerFam,
                      DataModule_Personal_Familias.SQLTransaction_PerFam,
                      SQLQuery_Personal_Familias ) = false then UTI_GEN_Salir;

    DataModule_Personal_Familias.Free;
end;

procedure Tform_personal_familias_000.Cerramos_Tablas_Ligadas;
begin
    if UTI_TB_Cerrar( DataModule_Personal_Familias.SQLConnector_PerFamSubFamilias,
                      DataModule_Personal_Familias.SQLTransaction_PerFamSubFamilias,
                      SQLQuery_Personal_Familias_SubFamilias ) = false then UTI_GEN_Salir;
end;

procedure Tform_personal_familias_000.SQLQuery_Personal_FamiliasCalcFields(DataSet: TDataSet);
begin
    // ********************************************************************************************* //
    // ** PARA DAR VALOR A CAMPOS CALCULADOS                                                      ** //
    // ********************************************************************************************* //
end;

procedure Tform_personal_familias_000.SQLQuery_Personal_Familias_SubFamiliasCalcFields(DataSet: TDataSet);
begin
    // ********************************************************************************************* //
    // ** PARA DAR VALOR A CAMPOS CALCULADOS                                                      ** //
    // ********************************************************************************************* //
end;

procedure Tform_personal_familias_000.Refrescar_Registros_SubFamilias;
var var_Lineas_Filtro        : TStrings;
    var_Lineas_OrderBy       : TStrings;
    var_ver_Bajas            : ShortInt;

    var_id_personal_familias : LargeInt;
    var_descripcion          : String;
begin
    // ********************************************************************************************* //
    // ** Solo si la cabecera está en modo EDIT se abren las tablas hijas                         ** //
    // ********************************************************************************************* //
    if SQLQuery_Personal_Familias.State <> dsEdit then Exit;

    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_descripcion          := '';
    var_id_personal_familias := 0;

    if SQLQuery_Personal_Familias_SubFamilias.RecordCount > 0 then
    begin
        var_descripcion := SQLQuery_Personal_Familias_SubFamilias.FieldByName('descripcion').Value;

        if not SQLQuery_Personal_Familias_SubFamilias.FieldByName('id_personal_familias').IsNull then
        begin
            var_id_personal_familias := SQLQuery_Personal_Familias_SubFamilias.FieldByName('id_personal_familias').Value;
        end;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Clear;
    var_Lineas_OrderBy.Clear;

    if Trim(SQLQuery_Personal_Familias.FieldByName('id').AsString) <> '' then
         var_Lineas_Filtro.Add('sub.id_personal_familias = ' + Trim(SQLQuery_Personal_Familias.FieldByName('id').AsString))
    else var_Lineas_Filtro.Add('sub.id_personal_familias = Null');

    var_ver_Bajas := RadioGroup_Bajas.ItemIndex;
    if UTI_GEN_Form_Abierto_Ya('form_personal_familias_001') = true then
    begin
        var_ver_Bajas := form_personal_familias_001.RadioGroup_Bajas.ItemIndex;
    end;

    Filtrar_Personal_Familias_SubFamilias( var_ver_Bajas,
                                           false,
                                           var_Lineas_Filtro,
                                           var_Lineas_OrderBy );

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;

    if Trim(var_descripcion) <> '' then
    begin
        SQLQuery_Personal_Familias_SubFamilias.Locate( 'descripcion;id_personal_familias',
                                                        VarArrayOf( [ var_descripcion,
                                                                      var_id_personal_familias ] ),
                                                        [] );
    end;
end;

procedure Tform_personal_familias_000.Refrescar_Registros;
var var_descripcion : String;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_descripcion := '';

    if SQLQuery_Personal_Familias.RecordCount > 0 then
    begin
        var_descripcion := SQLQuery_Personal_Familias.FieldByName('descripcion').asString;
    end;

    Filtrar_Principal_Sin_Preguntar;

    if Trim(var_descripcion) <> '' then
    begin
         SQLQuery_Personal_Familias.Locate('descripcion', var_descripcion, []);
    end;
end;

procedure Tform_personal_familias_000.SQLQuery_Personal_FamiliasAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'personal_familias',
                       DataModule_Personal_Familias.SQLTransaction_PerFam,
                       SQLQuery_Personal_Familias,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros;
end;

procedure Tform_personal_familias_000.SQLQuery_Personal_Familias_SubFamiliasAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'personal_familias',
                       DataModule_Personal_Familias.SQLTransaction_PerFamSubFamilias,
                       SQLQuery_Personal_Familias_SubFamilias,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros_SubFamilias;
end;

procedure Tform_personal_familias_000.SQLQuery_Personal_FamiliasAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure Tform_personal_familias_000.Filtrar_tablas_ligadas;
var
  var_Lineas_Filtro  : TStrings;
  var_Lineas_OrderBy : TStrings;
  var_SQL_ADD        : TStrings;
begin
    var_SQL_ADD := TStringList.Create;

    if SQLQuery_Personal_Familias.RecordCount = 0 then Exit;

    if SQLQuery_Personal_Familias.State = dsInsert then
    begin
        Cerramos_Tablas_Ligadas;
        Exit;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    // ********************************************************************************************* //
    // ** SUBFAMILIAS                                                                             ** //
    // ********************************************************************************************* //
    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'sub.id_personal_familias = ' + SQLQuery_Personal_Familias.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_Lineas_OrderBy.Clear;
    Filtrar_Personal_Familias_SubFamilias( RadioGroup_Bajas.ItemIndex,
                                           false,
                                           var_Lineas_Filtro,
                                           var_Lineas_OrderBy );

    // ********************************************************************************************* //
    // ** el final de los filtros de tablas ligadas                                               ** //
    // ********************************************************************************************* //
    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;
    var_SQL_ADD.Free;
end;

function Tform_personal_familias_000.Filtrar_Personal_Familias_SubFamilias( param_ver_bajas : ShortInt;
                                                                            param_Cambiamos_Filtro : Boolean;
                                                                            param_Lineas_Filtro,
                                                                            param_Lineas_OrderBy : TStrings ) : ShortInt;
var
  var_a_Filtrar_Plus : TStrings;
begin
  var_a_Filtrar_Plus := TStringList.Create;
  var_a_Filtrar_Plus.Clear;

  if Trim(param_Lineas_OrderBy.Text) = '' then
  begin
    param_Lineas_OrderBy.Text := private_Order_By_subfamilias[0].Memo_OrderBy;
  end;

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  Result := UTI_TB_Filtrar( private_Order_By_subfamilias,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Personal_Familias_SubFamilias,
                                                          'personal_familias',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Personal_Familias_SubFamilias,
                                                          'personal_familias',
                                                          'i' ),

                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_Personal_Familias.SQLTransaction_PerFamSubFamilias,
                            DataModule_Personal_Familias.SQLConnector_PerFamSubFamilias,
                            SQLQuery_Personal_Familias_SubFamilias,

                            // name_tabla,
                            'sub',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT sub.*,' + ' ' +
                                   'aps.descripcion AS OT_descripcion_familia_superior' + ' ' +
                            'FROM personal_familias AS sub' + ' ' +

                            'LEFT JOIN personal_familias AS aps' + ' ' +
                            'ON sub.id_personal_familias = aps.id' + ' ',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_a_Filtrar_Plus.Free;
end;

procedure Tform_personal_familias_000.para_Empezar;
begin
  { ****************************************************************************
    Solo para formularios que traten con datos
    **************************************************************************** }
    if UTI_GEN_Form_Abierto_Ya('DataModule_Personal_Familias') = False then
    begin
        DataModule_Personal_Familias := TDataModule_Personal_Familias.Create(Application);
    end;

  { ****************************************************************************
    Preparamos los diferentes tipos de orden preconfigurados
    **************************************************************************** }
    // PERSONAL FAMILIAS
    SetLength(private_Order_By, 1);

    private_Order_By[0].Titulo       := 'Por descripción'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[0].Memo_OrderBy := 'ap.descripcion ASC';

    Memo_OrderBy.Lines.Text          := private_Order_By[0].Memo_OrderBy;

    UTI_TB_Rellenar_ComboBox_Orden( true,
                                    ComboBox_Filtros,
                                    private_Order_By,
                                    0 );

    // PERSONAL FAMILIAS SUBFAMILIAS
    SetLength(private_Order_By_subfamilias, 1);

    private_Order_By_subfamilias[0].Titulo       := 'Por descripción'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_subfamilias[0].Memo_OrderBy := 'sub.id_personal_familias ASC, sub.descripcion ASC';

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

procedure Tform_personal_familias_000.SQLQuery_Personal_FamiliasBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Personal_Familias );
end;

procedure Tform_personal_familias_000.SQLQuery_Personal_Familias_SubFamiliasBeforePost(
    DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Personal_Familias_SubFamilias );
end;

procedure Tform_personal_familias_000.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    If public_Elegimos then
         Seleccionado_Rgtro
    else Editar_Registro;
end;

procedure Tform_personal_familias_000.DBGrid_PrincipalDrawColumnCell(Sender: TObject;
    const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    UTI_GEN_Dibujar_Grid( Sender, SQLQuery_Personal_Familias, Rect, DataCol, Column, State );
end;

procedure Tform_personal_familias_000.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then
    begin
        If public_Elegimos then
             Seleccionado_Rgtro
        else Editar_Registro;
    end;
end;

procedure Tform_personal_familias_000.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

procedure Tform_personal_familias_000.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure Tform_personal_familias_000.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_personal_familias_000.Seleccionado_Rgtro;
begin
    private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    public_Rgtro_Seleccionado := true;
    Close;
end;

procedure Tform_personal_familias_000.BitBtn_SeleccionarClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
end;

procedure Tform_personal_familias_000.BitBtn_ImprimirClick(Sender: TObject);
var var_Ficheros     : TStrings;
    var_Ordenado_por : String;
begin
    // ********************************************************************************************* //
    // ** Configuramos el título del listado                                                      ** //
    // ********************************************************************************************* //
    var_Ordenado_por := rs_Filtros_Otros_1 +
                        Trim(ComboBox_Filtros.Text);

    if Trim(Memo_Filtros.Lines.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            rs_Filtros_Otros_2 +
                            Trim(Memo_Filtros.Lines.Text);
    end;

    if Trim(Edit_Descripcion.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con descripción %' +
                            Trim(Edit_Descripcion.Text) + '%';
    end;

    // ********************************************************************************************* //
    // ** Configuramos la llamada al generador de informes                                        ** //
    // ********************************************************************************************* //
    var_Ficheros := TStringList.Create;

    UTI_GEN_Informes( var_Ordenado_por,
                      SQLQuery_Personal_Familias,
                      DataSource_PerFam,
                      Nil,
                      Nil,
                      Nil,
                      public_Menu_Worked,
                      public_Solo_Ver,
                      '',
                      '',
                      var_Ficheros );

    var_Ficheros.Free;
end;

procedure Tform_personal_familias_000.no_Tocar;
begin
    BitBtn_Imprimir.Enabled := False;
end;

procedure Tform_personal_familias_000.Presentar_Datos;
begin
     /// guardar por lo que pueda pasar
end;

procedure Tform_personal_familias_000.BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if SQLQuery_Personal_Familias.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'personal_familias',
                                           SQLQuery_Personal_Familias,
                                           DataSource_PerFam,
                                           DBGrid_Principal );
        end;
    end;
end;

procedure Tform_personal_familias_000.DBNavigator1BeforeAction(Sender: TObject;
    Button: TDBNavButtonType);
var var_id          : ShortString;
    var_dar_de_Baja : Boolean;
    var_msg         : TStrings;
begin
    //Filtrar_tablas_ligadas;

    case Button of
        nbInsert : begin
            Insertar_Registro;
            Abort;
        end;

        nbEdit : begin
            Editar_Registro;
            Abort;
        end;

        nbDelete : begin
            if UTI_USR_Permiso_SN(public_Menu_Worked, 'B', True) = True then
            begin
                if SQLQuery_Personal_Familias_SubFamilias.RecordCount = 0 then
                    begin
                        var_id := SQLQuery_Personal_Familias.FieldByName('id').AsString;

                        var_dar_de_Baja := true;
                        if not SQLQuery_Personal_Familias.FieldByName('Del_WHEN').isNull then
                        begin
                            var_dar_de_Baja := false;
                        end;

                        UTI_RGTRO_Borrar( 'personal_familias',
                                          SQLQuery_Personal_Familias,
                                          public_Solo_Ver,
                                          public_Menu_Worked );
                    end
                else
                    begin
                        var_msg := TStringList.Create;
                        var_msg.Add('Este tipo de personal, tiene asignadas otros tipos como subfamilias suyas.');
                        var_msg.Add('Hasta que no se los quite, no podrá borrar este tipo de personal.');
                        UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
                        var_msg.Free;
                    end;
            end;

            Abort;
        end;

        nbRefresh : begin
            Refrescar_Registros;
            Abort;
        end;
    end;
end;

procedure Tform_personal_familias_000.Insertar_Registro;
var
  var_Campos_para_Existe_ya : Array of TCampos_para_Existe_ya;
  var_msg                   : TStrings;
  var_Fecha_Hora            : ShortString;
  var_record_Existe         : Trecord_Existe;
  var_descripcion           : ShortString;

begin
    with SQLQuery_Personal_Familias do
    begin
        var_msg := TStringList.Create;

        if UTI_USR_Permiso_SN(public_Menu_Worked, 'A', True) = True then
        begin
            if public_Solo_Ver = True then
                begin
                    var_msg.Add(rs_Solo_Visualizar);
                    UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
                end
            else
                begin
                    Insert;

                    //Filtrar_tablas_ligadas;

                    Application.CreateForm(Tform_personal_familias_001, form_personal_familias_001);

                    form_personal_familias_001.DBGrid_SubFamilias.Color := clSilver;

                    form_personal_familias_001.RadioGroup_Bajas.ItemIndex := RadioGroup_Bajas.ItemIndex;

                    form_personal_familias_001.para_Empezar;

                    form_personal_familias_001.ShowModal;

                    if form_personal_familias_001.public_Pulso_Aceptar = true then
                        begin
                            SetLength(var_Campos_para_Existe_ya, 0);

                            var_Campos_para_Existe_ya[0].Campo_Valor  := FieldByName('descripcion').AsString;
                            var_Campos_para_Existe_ya[0].Campo_Nombre := 'descripcion';
                            var_Campos_para_Existe_ya[0].Campo_Tipo   := 1; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                            var_record_Existe := UTI_RGTRO_Existe_Ya( 'personal_familias',                          // param_nombre_tabla
                                                                      'ORDER BY personal_familias.descripcion ASC', // param_order_by
                                                                      '',                                           // param_id_a_no_traer ... Estoy insertando
                                                                      var_Campos_para_Existe_ya );                  // param_Campos_para_Existe_ya

                            if var_record_Existe.Fallo_en_Conexion_BD = true then
                                begin
                                    form_personal_familias_001.Free;
                                    Cancel;
                                end
                            else
                                begin
                                    if var_record_Existe.Existe = false then
                                        begin
                                            form_personal_familias_001.Free;

                                            var_descripcion                     := FieldByName('descripcion').AsString;

                                            var_Fecha_Hora                      := DateTimeToStr(UTI_CN_Fecha_Hora);
                                            FieldByName('Insert_WHEN').AsString := var_Fecha_Hora;
                                            FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                                            UTI_RGTRO_Grabar_Antes( 'personal_familias', SQLQuery_Personal_Familias );

                                            // ***************************************************** //
                                            // ** Refresco el resto de tablas ligadas porque han  ** //
                                            // ** sido creadas automáticamente                    ** //
                                            // ***************************************************** //
                                            Filtrar_tablas_ligadas;

                                            Editar_Registro;
                                        end
                                    else
                                        begin
                                            form_personal_familias_001.Free;
                                            Cancel;
                                            var_msg.Clear;
                                            var_msg.Add( 'Tipo de personal repetido.');

                                            if UpperCase(var_record_Existe.deBaja) = 'S' then
                                            begin
                                                var_msg.Add(rs_Rgtro_Borrado);
                                            end;

                                            UTI_GEN_Aviso(true, var_msg, rs_Ya_Existe, True, False);
                                        end;
                                end;
                        end
                    else
                        begin
                            form_personal_familias_001.Free;
                            Cancel;
                        end;
                end;
        end;

        var_msg.Free;
    end;
end;

function Tform_personal_familias_000.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
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
    // ** Primero buscaremos en el nombre y apellido el texto a buscar                              ** //
    // ********************************************************************************************* //
    if Trim(Edit_Descripcion.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'ap.descripcion LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Descripcion.Text) + '%') );
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
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Personal_Familias,
                                                            'personal_familias',
                                                            'u' ),

                              // Insert_SQL,
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Personal_Familias,
                                                            'personal_familias',
                                                            'i' ),

                              // var_ctdad_Rgtros,
                              -1,

                              DataModule_Personal_Familias.SQLTransaction_PerFam,
                              DataModule_Personal_Familias.SQLConnector_PerFam,
                              SQLQuery_Personal_Familias,

                              // name_tabla,
                              'ap',

                              RadioGroup_Bajas.ItemIndex,

                              // SELECT_SQL,
                              'SELECT ap.*,' + ' ' +
                                     'aps.descripcion AS OT_descripcion_familia_superior' + ' ' +
                              'FROM personal_familias AS ap' + ' ' +

                              'LEFT JOIN personal_familias AS aps' + ' ' +
                              'ON ap.id_personal_familias = aps.id' + ' ',

                              Memo_Filtros.Lines,
                              Memo_OrderBy.Lines,
                              var_a_Filtrar,

                              param_Cambiamos_Filtro,
                              false,   // param_ver_SQL_despues_Abrir : Boolean;
                              true ); // no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

    var_a_Filtrar.Free;

    Label_Ctdad_Rgtros.Caption := IntToStr(SQLQuery_Personal_Familias.RecordCount);

    if SQLQuery_Personal_Familias.RecordCount = 0 then
    begin
        Cerramos_Tablas_Ligadas;
    end;

    //Filtrar_tablas_ligadas;
    var_SQL_ADD.Free;
end;

procedure Tform_personal_familias_000.SQLQuery_Personal_FamiliasBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Personal_Familias );
end;

procedure Tform_personal_familias_000.SQLQuery_Personal_Familias_SubFamiliasBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Personal_Familias_SubFamilias );
end;

procedure Tform_personal_familias_000.Editar_Registro;
var
  var_Campos_para_Existe_ya : Array of TCampos_para_Existe_ya;
  var_msg                   : TStrings;
  var_record_Existe         : Trecord_Existe;
  var_id                    : ShortString;

begin
    with SQLQuery_Personal_Familias do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
            begin
                var_id := FieldByName('id').AsString;

                if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
                begin
                    if UTI_RGTRO_isLock( 'personal_familias',
                                         FieldByName('id').AsString,
                                         true ) = true then
                        begin
                            Exit;
                        end
                    else
                        begin
                            if UTI_RGTRO_Lock( 'personal_familias',
                                               FieldByName('id').AsString ) = true then
                                 Edit
                            else Exit;
                        end;

                    Application.CreateForm(Tform_personal_familias_001, form_personal_familias_001);

                    form_personal_familias_001.RadioGroup_Bajas.ItemIndex := RadioGroup_Bajas.ItemIndex;
                    form_personal_familias_001.public_Menu_Worked         := public_Menu_Worked;

                    if public_Solo_Ver = true then
                    begin
                        form_personal_familias_001.public_Solo_Ver := true;
                    end;

                    form_personal_familias_001.para_Empezar;

                    form_personal_familias_001.ShowModal;

                    if form_personal_familias_001.public_Pulso_Aceptar = true then
                        begin
                            SetLength(var_Campos_para_Existe_ya, 0);

                            var_Campos_para_Existe_ya[0].Campo_Valor  := FieldByName('descripcion').AsString;
                            var_Campos_para_Existe_ya[0].Campo_Nombre := 'descripcion';
                            var_Campos_para_Existe_ya[0].Campo_Tipo   := 1; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                            var_record_Existe := UTI_RGTRO_Existe_Ya( 'personal_familias',                          // param_nombre_tabla
                                                                      'ORDER BY personal_familias.descripcion ASC', // param_order_by
                                                                      FieldByName('id').AsString,                   // param_id_a_no_traer ... Estoy insertando
                                                                      var_Campos_para_Existe_ya );                  // param_Campos_para_Existe_ya

                            if var_record_Existe.Fallo_en_Conexion_BD = true then
                                begin
                                    form_personal_familias_001.Free;
                                    Cancel;
                                end
                            else
                                begin
                                    if var_record_Existe.Existe = false then
                                        begin
                                            if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( SQLQuery_Personal_Familias ) = true then
                                               begin
                                                    FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                                                    FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                                                    UTI_RGTRO_Grabar_Antes( 'personal_familias',
                                                                            SQLQuery_Personal_Familias );
                                               end
                                            else Cancel;
                                            form_personal_familias_001.Free;
                                        end
                                    else
                                        begin
                                            form_personal_familias_001.Free;
                                            Cancel;
                                            var_msg.Clear;
                                            var_msg.Add( 'Tipo de personal repetido.');

                                            if UpperCase(var_record_Existe.deBaja) = 'S' then
                                            begin
                                                var_msg.Add(rs_Rgtro_Borrado);
                                            end;

                                            UTI_GEN_Aviso(true, var_msg, rs_Ya_Existe, True, False);
                                        end;
                                end;
                        end
                    else
                        begin
                            form_personal_familias_001.Free;
                            Cancel;
                        end;

                    UTI_RGTRO_UnLock( 'personal_familias',
                                      var_id );
                end;
            end
        else
            begin
                var_msg.Add(rs_no_Hay_Rgtros);
                UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            end;
    end;

    var_msg.Free;
end;

procedure Tform_personal_familias_000.Filtrar_Principal_Sin_Preguntar;
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

procedure Tform_personal_familias_000.ComboBox_FiltrosChange(Sender: TObject);
begin
    Memo_OrderBy.Lines.Clear;
    Memo_OrderBy.Lines.Add( private_Order_By[ComboBox_Filtros.ItemIndex].Memo_OrderBy );
    BitBtn_FiltrarClick(Nil);
end;

end.


