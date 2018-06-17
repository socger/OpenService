unit vehiculos_tipo_cambios_000;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids, DbCtrls,
  Buttons, ExtCtrls, ComCtrls, StdCtrls, Grids, utilidades_usuarios, utilidades_bd, utilidades_rgtro,
  utilidades_datos_tablas, utilidades_general;

type

  { Tform_vehiculos_tipo_cambios_000 }

  Tform_vehiculos_tipo_cambios_000 = class(TForm)
    BitBtn_Filtrar: TBitBtn;
    BitBtn_Imprimir: TBitBtn;
    BitBtn_SALIR: TBitBtn;
    BitBtn_Seleccionar: TBitBtn;
    BitBtn_Ver_Situacion_Registro: TBitBtn;
    ComboBox_Filtros: TComboBox;
    DataSource_VTCambios: TDataSource;
    DBGrid_Principal: TDBGrid;
    DBNavigator1: TDBNavigator;
    Edit_Descripcion: TEdit;
    Image_Confirmado: TImage;
    Label10: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label_Ctdad_Rgtros: TLabel;
    Label_Fecha2: TLabel;
    Memo_Filtros: TMemo;
    Memo_OrderBy: TMemo;
    PageControl_Filtros: TPageControl;
    RadioGroup_Bajas: TRadioGroup;
    SQLQuery_VTCambios: TSQLQuery;
    SQLQuery_VTCambiosChange_Id_User: TLargeintField;
    SQLQuery_VTCambiosChange_WHEN: TDateTimeField;
    SQLQuery_VTCambiosDel_Id_User: TLargeintField;
    SQLQuery_VTCambiosDel_WHEN: TDateTimeField;
    SQLQuery_VTCambiosDel_WHY: TStringField;
    SQLQuery_VTCambiosdescripcion: TStringField;
    SQLQuery_VTCambiosid: TLargeintField;
    SQLQuery_VTCambiosInsert_Id_User: TLargeintField;
    SQLQuery_VTCambiosInsert_WHEN: TDateTimeField;
    TabSheet_Busqueda_Concreta: TTabSheet;
    TabSheet_Filtros_Generales: TTabSheet;

    procedure ComboBox_FiltrosChange(Sender: TObject);
    procedure Editar_Registro;
    procedure Insertar_Registro;
    procedure Filtrar_Principal_Sin_Preguntar;
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure Refrescar_Registros;
    procedure para_Empezar;
    procedure no_Tocar;
    procedure Presentar_Datos;
    procedure Filtrar_tablas_ligadas;
    procedure Cerramos_Tablas;
    procedure Cerramos_Tablas_Ligadas;
    procedure BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
    procedure DBGrid_PrincipalCellClick(Column: TColumn);
    procedure DBGrid_PrincipalDblClick(Sender: TObject);
    procedure DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Seleccionado_Rgtro;
    procedure BitBtn_FiltrarClick(Sender: TObject);
    procedure BitBtn_ImprimirClick(Sender: TObject);
    procedure BitBtn_SALIRClick(Sender: TObject);
    procedure BitBtn_SeleccionarClick(Sender: TObject);
    function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RadioGroup_BajasClick(Sender: TObject);
    procedure SQLQuery_VTCambiosAfterPost(DataSet: TDataSet);
    procedure SQLQuery_VTCambiosAfterScroll(DataSet: TDataSet);
    procedure SQLQuery_VTCambiosBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_VTCambiosBeforePost(DataSet: TDataSet);

  private
    { private declarations }
    private_Salir_OK : Boolean;
    private_Order_By : array of TOrder_By;
  public
    { public declarations }
    public_Solo_Ver           : Boolean;
    public_Elegimos           : Boolean;
    public_Menu_Worked        : Integer;
    public_Rgtro_Seleccionado : Boolean;
  end;

var
  form_vehiculos_tipo_cambios_000: Tform_vehiculos_tipo_cambios_000;

implementation

{$R *.lfm}

uses dm_vehiculos_tipo_cambios, menu, vehiculos_tipo_cambios_001;

{ Tform_vehiculos_tipo_cambios_000 }

procedure Tform_vehiculos_tipo_cambios_000.FormActivate(Sender: TObject);
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

procedure Tform_vehiculos_tipo_cambios_000.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
    if private_Salir_OK = False then
    begin
        // ***************************************************************************************** //
        // ** Intento BitBtn_SALIR de la aplicación de un modo no permitido.                      ** //
        // ***************************************************************************************** //
        // ** Pero si desde el menu principal está a true la variable public_Salir_Ok, significa  ** //
        // ** que hay que salir si o si pues se pulsó cancelar al preguntar otra vez la contraseña** //
        // ***************************************************************************************** //
        if form_Menu.public_Salir_OK = False then CloseAction := caNone;
    end else begin
        // ***************************************************************************************** //
        // ** Fue correcto el modo como quiere BitBtn_SALIR de la aplicación                      ** //
        // ***************************************************************************************** //
    end;
end;

procedure Tform_vehiculos_tipo_cambios_000.FormCreate(Sender: TObject);
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

procedure Tform_vehiculos_tipo_cambios_000.FormDestroy(Sender: TObject);
begin
    Cerramos_Tablas;
end;

procedure Tform_vehiculos_tipo_cambios_000.RadioGroup_BajasClick(Sender: TObject);
begin
    Refrescar_Registros;
end;

procedure Tform_vehiculos_tipo_cambios_000.SQLQuery_VTCambiosAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'vehiculos_tipo_cambios',
                       DataModule_Vehiculos_Tipo_Cambios.SQLTransaction_VTCambios,
                       SQLQuery_VTCambios,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros;
end;

procedure Tform_vehiculos_tipo_cambios_000.SQLQuery_VTCambiosAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure Tform_vehiculos_tipo_cambios_000.SQLQuery_VTCambiosBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_VTCambios );
end;

procedure Tform_vehiculos_tipo_cambios_000.SQLQuery_VTCambiosBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_VTCambios );
end;

function Tform_vehiculos_tipo_cambios_000.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
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
        var_SQL_ADD.Add( 'vtc.descripcion LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Descripcion.Text) + '%') );
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
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_VTCambios,
                                                            'vehiculos_tipo_cambios',
                                                            'u' ),

                              // Insert_SQL,
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_VTCambios,
                                                            'vehiculos_tipo_cambios',
                                                            'i' ),

                              // var_ctdad_Rgtros,
                              -1,

                              DataModule_Vehiculos_Tipo_Cambios.SQLTransaction_VTCambios,
                              DataModule_Vehiculos_Tipo_Cambios.SQLConnector_VTCambios,
                              SQLQuery_VTCambios,

                              // name_tabla,
                              'vtc',

                              RadioGroup_Bajas.ItemIndex,

                              // SELECT_SQL,
                              'SELECT vtc.*' + ' ' +
                              'FROM vehiculos_tipo_cambios AS vtc' + ' ',

                              Memo_Filtros.Lines,
                              Memo_OrderBy.Lines,
                              var_a_Filtrar,

                              param_Cambiamos_Filtro,
                              false,   // param_ver_SQL_despues_Abrir : Boolean;
                              true ); // no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

    var_a_Filtrar.Free;

    Label_Ctdad_Rgtros.Caption := IntToStr(SQLQuery_VTCambios.RecordCount);

    //Filtrar_tablas_ligadas;
    var_SQL_ADD.Free;
end;

procedure Tform_vehiculos_tipo_cambios_000.BitBtn_FiltrarClick(Sender: TObject);
begin
    if PageControl_Filtros.ActivePage = TabSheet_Busqueda_Concreta then
    begin
        Filtrar_Principal_Sin_Preguntar;
    end else begin
        RadioGroup_Bajas.ItemIndex := Filtrar_Principal( true );
    end;
end;

procedure Tform_vehiculos_tipo_cambios_000.BitBtn_ImprimirClick(Sender: TObject);
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
                      SQLQuery_VTCambios,
                      DataSource_VTCambios,
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

procedure Tform_vehiculos_tipo_cambios_000.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_vehiculos_tipo_cambios_000.BitBtn_SeleccionarClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
end;

procedure Tform_vehiculos_tipo_cambios_000.Seleccionado_Rgtro;
begin
    private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    public_Rgtro_Seleccionado := true;
    Close;
end;

procedure Tform_vehiculos_tipo_cambios_000.BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if SQLQuery_VTCambios.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'vehiculos_tipo_cambios',
                                           SQLQuery_VTCambios,
                                           DataSource_VTCambios,
                                           DBGrid_Principal );
        end;
    end;
end;

procedure Tform_vehiculos_tipo_cambios_000.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure Tform_vehiculos_tipo_cambios_000.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    If public_Elegimos then
         Seleccionado_Rgtro
    else Editar_Registro;
end;

procedure Tform_vehiculos_tipo_cambios_000.DBGrid_PrincipalDrawColumnCell( Sender: TObject; const Rect: TRect;
                                                                           DataCol: Integer; Column: TColumn;
                                                                           State: TGridDrawState );
begin
    UTI_GEN_Dibujar_Grid( Sender, SQLQuery_VTCambios, Rect, DataCol, Column, State );
end;

procedure Tform_vehiculos_tipo_cambios_000.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then
    begin
        If public_Elegimos then
             Seleccionado_Rgtro
        else Editar_Registro;
    end;
end;

procedure Tform_vehiculos_tipo_cambios_000.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

procedure Tform_vehiculos_tipo_cambios_000.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_Vehiculos_Tipo_Cambios.SQLConnector_VTCambios,
                      DataModule_Vehiculos_Tipo_Cambios.SQLTransaction_VTCambios,
                      SQLQuery_VTCambios ) = false then UTI_GEN_Salir;

    DataModule_Vehiculos_Tipo_Cambios.Free;
end;

procedure Tform_vehiculos_tipo_cambios_000.Cerramos_Tablas_Ligadas;
begin
    // ********************************************************************************************* //
    // ** ESTE form NO TIENE TABLAS LIGADAS                                                       ** //
    // ********************************************************************************************* //
    {

        if UTI_TB_Cerrar( DataModule_del_form_000.SQLConnector_de_la_tabla,
                          DataModule_Users.SQLTransaction_de_la_tabla,
                          SQLQuery_la_tabla ) = false then UTI_GEN_Salir;
    }
end;

procedure Tform_vehiculos_tipo_cambios_000.Filtrar_tablas_ligadas;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
begin
    if SQLQuery_VTCambios.RecordCount = 0 then Exit;

    if SQLQuery_VTCambios.State = dsInsert then
    begin
        Cerramos_Tablas_Ligadas;
        Exit;
    end;

    // ********************************************************************************************* //
    // ** ESTE form NO TIENE TABLAS LIGADAS                                                       ** //
    // ********************************************************************************************* //

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;
end;

procedure Tform_vehiculos_tipo_cambios_000.no_Tocar;
begin
    BitBtn_Imprimir.Enabled := False;
end;

procedure Tform_vehiculos_tipo_cambios_000.Presentar_Datos;
begin
    // ********************************************************************************************* //
    // ** Guardar por lo que pueda pasar                                                          ** //
    // ********************************************************************************************* //
end;

procedure Tform_vehiculos_tipo_cambios_000.para_Empezar;
begin
    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    if UTI_GEN_Form_Abierto_Ya('DataModule_Vehiculos_Tipo_Cambios') = False then
    begin
        DataModule_Vehiculos_Tipo_Cambios := TDataModule_Vehiculos_Tipo_Cambios.Create(Application);
    end;

    // ********************************************************************************************* //
    // ** Preparamos los diferentes tipos de orden preconfigurados                                ** //
    // ********************************************************************************************* //
    SetLength(private_Order_By, 2);

    private_Order_By[0].Titulo       := 'Por la descripción'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[0].Memo_OrderBy := 'vtc.descripcion ASC';

    private_Order_By[1].Titulo       := 'Por la id';
    private_Order_By[1].Memo_OrderBy := 'vtc.id ASC';

    Memo_OrderBy.Lines.Text          := private_Order_By[0].Memo_OrderBy;

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
    PageControl_Filtros.ActivePage := TabSheet_Busqueda_Concreta;
end;

procedure Tform_vehiculos_tipo_cambios_000.Refrescar_Registros;
var var_descripcion : String;
begin
    with SQLQuery_VTCambios do
    begin
        // ***************************************************************************************** //
        // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                         ** //
        // ***************************************************************************************** //
        var_descripcion := '';

        if RecordCount > 0 then
        begin
            var_descripcion := FieldByName('descripcion').Value;
        end;

        Filtrar_Principal_Sin_Preguntar;

        if Trim(var_descripcion) <> '' then
        begin
            Locate('descripcion', var_descripcion, []);
        end;
    end;
end;

procedure Tform_vehiculos_tipo_cambios_000.DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
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
                UTI_RGTRO_Borrar( 'vehiculos_tipo_cambios',
                                  SQLQuery_VTCambios,
                                  public_Solo_Ver,
                                  public_Menu_Worked );
            end;
            Abort;
        end;

        nbRefresh : begin
            Refrescar_Registros;
            Abort;
        end;
    end;
end;

procedure Tform_vehiculos_tipo_cambios_000.Filtrar_Principal_Sin_Preguntar;
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

procedure Tform_vehiculos_tipo_cambios_000.Insertar_Registro;
var
  var_Campos_para_Existe_ya : Array of TCampos_para_Existe_ya;
  var_msg                   : TStrings;
  var_Form                  : Tform_vehiculos_tipo_cambios_001;
  var_record_Existe         : Trecord_Existe;

begin
    with SQLQuery_VTCambios do
    begin
        var_msg := TStringList.Create;

        if UTI_USR_Permiso_SN(public_Menu_Worked, 'A', True) = True then
        begin
            if public_Solo_Ver = True then
            begin
                var_msg.Add(rs_Solo_Visualizar);
                UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            end else begin
                Insert ;

                var_Form := Tform_vehiculos_tipo_cambios_001.Create(nil);

                var_Form.para_Empezar;

                var_Form.ShowModal;

                if var_Form.public_Pulso_Aceptar = true then
                begin
                    SetLength(var_Campos_para_Existe_ya, 1);

                    var_Campos_para_Existe_ya[0].Campo_Valor  := FieldByName('descripcion').AsString;
                    var_Campos_para_Existe_ya[0].Campo_Nombre := 'descripcion';
                    var_Campos_para_Existe_ya[0].Campo_Tipo   := 1; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                    var_record_Existe := UTI_RGTRO_Existe_Ya( 'vehiculos_tipo_cambios',                          // param_nombre_tabla
                                                              'ORDER BY vehiculos_tipo_cambios.descripcion ASC', // param_order_by
                                                              '',                                                // param_id_a_no_traer ... Estoy insertando
                                                              var_Campos_para_Existe_ya );                       // param_Campos_para_Existe_ya

                    if var_record_Existe.Fallo_en_Conexion_BD = true then
                    begin
                        var_Form.Free;
                        Cancel;
                    end else begin
                        if var_record_Existe.Existe = false then
                        begin
                            var_Form.Free;

                            FieldByName('Insert_WHEN').AsString := DateTimeToStr(UTI_CN_Fecha_Hora);
                            FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                            UTI_RGTRO_Grabar_Antes( 'vehiculos_tipo_cambios',
                                                    SQLQuery_VTCambios );
                        end else begin
                            var_Form.Free;
                            Cancel;
                            var_msg.Clear;
                            var_msg.Add( 'Tipo de cambio de vehiculo repetido.');

                            if UpperCase(var_record_Existe.deBaja) = 'S' then
                            begin
                                var_msg.Add(rs_Rgtro_Borrado);
                            end;

                            UTI_GEN_Aviso(true, var_msg, rs_Ya_Existe, True, False);
                        end;
                    end;
                end else begin
                    var_Form.Free;
                    Cancel;
                end;
            end;
        end;

        var_msg.Free;
    end;
end;

procedure Tform_vehiculos_tipo_cambios_000.Editar_Registro;
var
  var_Campos_para_Existe_ya : Array of TCampos_para_Existe_ya;
  var_msg                   : TStrings;
  var_Form                  : Tform_vehiculos_tipo_cambios_001;
  var_record_Existe         : Trecord_Existe;
  var_id                    : ShortString;

begin
    with SQLQuery_VTCambios do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
        begin
            var_id := FieldByName('id').AsString;

            if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
            begin
                if UTI_RGTRO_isLock( 'vehiculos_tipo_cambios',
                                     var_id,
                                     true ) = true then
                begin
                    Exit;
                end else begin
                    if UTI_RGTRO_Lock( 'vehiculos_tipo_cambios',
                                       var_id ) = true then
                         Edit
                    else Exit;
                end;

                var_Form := Tform_vehiculos_tipo_cambios_001.Create(nil);

                var_Form.public_Menu_Worked := public_Menu_Worked;

                if public_Solo_Ver = true then
                begin
                    var_Form.public_Solo_Ver := true;
                end;

                var_Form.para_Empezar;

                var_Form.ShowModal;

                if var_Form.public_Pulso_Aceptar = true then
                begin
                    var_record_Existe := Existe_vehiculos_tipo_cambios_Ya( var_id,
                                                                           FieldByName('descripcion').AsString );

                    if var_record_Existe.Fallo_en_Conexion_BD = true then
                    begin
                        var_Form.Free;
                        Cancel;
                    end else begin
                        if var_record_Existe.Existe = false then
                        begin
                            if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( SQLQuery_VTCambios ) = true then
                               begin
                                    FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                                    FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                                    UTI_RGTRO_Grabar_Antes( 'vehiculos_tipo_cambios',
                                                            SQLQuery_VTCambios );
                               end else begin
                                   Cancel;
                               end;
                            var_Form.Free;
                        end else begin
                            var_Form.Free;
                            Cancel;
                            var_msg.Clear;
                            var_msg.Add( 'Tipo de cambio de vehiculo repetido.');

                            if UpperCase(var_record_Existe.deBaja) = 'S' then
                            begin
                                var_msg.Add(rs_Rgtro_Borrado);
                            end;

                            UTI_GEN_Aviso(true, var_msg, rs_Ya_Existe, True, False);
                        end;
                    end;
                end else begin
                    var_Form.Free;
                    Cancel;
                end;

                UTI_RGTRO_UnLock( 'vehiculos_tipo_cambios',
                                  var_id );
            end;
        end else begin
            var_msg.Add(rs_no_Hay_Rgtros);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        end;
    end;

    var_msg.Free;
end;

procedure Tform_vehiculos_tipo_cambios_000.ComboBox_FiltrosChange(
  Sender: TObject);
begin
    Memo_OrderBy.Lines.Clear;
    Memo_OrderBy.Lines.Add( private_Order_By[ComboBox_Filtros.ItemIndex].Memo_OrderBy );
    BitBtn_FiltrarClick(Nil);
end;

end.

{
function Tform_vehiculos_tipo_cambios_000.Existe_vehiculos_tipo_cambios_Ya( param_id,
                                                                            param_descripcion : ShortString ) : Trecord_Existe;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
    try
        // ***************************************************************************************** //
        // ** Creamos la Transaccion y la conexión con el motor BD, y la abrimos                  ** //
        // ***************************************************************************************** //
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Connector_Open( var_SQLTransaction,
                                  var_SQLConnector ) = False then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Creamos la SQL Según el motor de BD                                                 ** //
        // ***************************************************************************************** //
        var_SQL := TStringList.Create;

        var_SQL.Add('SELECT vtc.*' );
        var_SQL.Add(  'FROM vehiculos_tipo_cambios AS vtc' );
        var_SQL.Add(' WHERE vtc.descripcion LIKE ' + UTI_GEN_Comillas('%' + Trim(param_descripcion) + '%') );

        if Trim(param_id) <> '' then
        begin
             var_SQL.Add(  ' AND NOT vtc.id = ' + Trim(param_id) );
        end;

        var_SQL.Add(' ORDER BY vtc.descripcion ASC' );

        // ***************************************************************************************** //
        // ** Abrimos la tabla                                                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery      := TSQLQuery.Create(nil);
        var_SQLQuery.Name := 'SQLQuery_Existe_vehiculos_tipo_cambios_Ya';

        if UTI_TB_Query_Open( '', '', '',
                              var_SQLConnector,
                              var_SQLQuery,
                              -1, // asi me trae todos los registros de golpe
                              var_SQL.Text ) = False then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** TRABAJAMOS CON LOS REGISTROS DEVUELTOS                                              ** //
        // ***************************************************************************************** //
        // ** Si el módulo no se creó, no se permite entrar en él ... Result := False             ** //
        // ***************************************************************************************** //
        Result.Fallo_en_Conexion_BD := false;
        Result.Existe               := false;
        Result.deBaja               := 'N';

        if var_SQLQuery.RecordCount > 0 then
        begin
            Result.Existe := true;
            if not var_SQLQuery.FieldByName('Del_WHEN').IsNull then Result.deBaja := 'S';
        end;

        // ***************************************************************************************** //
        // ** Cerramos la tabla                                                                   ** //
        // ***************************************************************************************** //
        if UTI_TB_Cerrar( var_SQLConnector,
                          var_SQLTransaction,
                          var_SQLQuery ) = false then UTI_GEN_Salir;

        var_SQLQuery.Free;

        var_SQL.Free;

        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    except
         on error : Exception do
         begin
             UTI_GEN_Error_Log( 'Error al comprobar si el tipo de cambio de vehículo existe ya.' +
                                'La tabla ha sido ' + var_SQLQuery.Name + ' desde el módulo ' +
                                Screen.ActiveForm.Name,
                                error );
             try
                 var_SQL.Free;
                 var_SQLTransaction.Free;
                 var_SQLConnector.Free;
                 var_SQLQuery.Free;
             except
             end;

             Result.Fallo_en_Conexion_BD := true;
         end;
    end;
end;

}
