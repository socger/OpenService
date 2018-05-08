unit users_000;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs, Buttons, StdCtrls,
    utilidades_usuarios, utilidades_rgtro, utilidades_bd, utilidades_general, ExtCtrls, DBGrids,
    utilidades_datos_tablas, variants, DbCtrls, Grids, ComCtrls;

type

    { Tform_users_000 }

    Tform_users_000 = class(TForm)
      BitBtn_Copiar_Usuario: TBitBtn;
      BitBtn_Filtrar: TBitBtn;
      BitBtn_Imprimir: TBitBtn;
      BitBtn_SALIR: TBitBtn;
      BitBtn_Seleccionar: TBitBtn;
        BitBtn_Ver_Situacion_Registro: TBitBtn;
        ComboBox_Filtros: TComboBox;
        ComboBox_Tipo_Usuario: TComboBox;
        ComboBox_Permiso_Total_SN: TComboBox;
        DataSource_Users: TDataSource;
        DataSource_Users_Menus_Permisos: TDataSource;
        DataSource_Users_Passwords: TDataSource;
        DataSource_Users_Menus: TDataSource;
        DBGrid_Principal: TDBGrid;
        DBNavigator1: TDBNavigator;
        Edit_Descripcion: TEdit;
        Image_Confirmado: TImage;
        Label10: TLabel;
        Label6: TLabel;
        Label7: TLabel;
        Label8: TLabel;
        Label9: TLabel;
        Label_Ctdad_Rgtros: TLabel;
        Label_Fecha2: TLabel;
        Memo_Filtros: TMemo;
        Memo_OrderBy: TMemo;
        PageControl_Filtros: TPageControl;
        RadioGroup_Bajas: TRadioGroup;
        SQLQuery_Users: TSQLQuery;
        SQLQuery_UsersChange_Id_User: TLargeintField;
        SQLQuery_UsersChange_WHEN: TDateTimeField;
        SQLQuery_UsersDel_Id_User: TLargeintField;
        SQLQuery_UsersDel_WHEN: TDateTimeField;
        SQLQuery_UsersDel_WHY: TStringField;
        SQLQuery_UsersDescripcion_Nick: TStringField;
        SQLQuery_Usersid: TLargeintField;
        SQLQuery_UsersId_Empleados: TLargeintField;
        SQLQuery_UsersInsert_Id_User: TLargeintField;
        SQLQuery_UsersInsert_WHEN: TDateTimeField;
        SQLQuery_UsersPermiso_Total_SN: TStringField;
        SQLQuery_UsersTipo: TStringField;
        SQLQuery_Users_MenusModulo_Permiso_Total_SN: TStringField;
        SQLQuery_Users_Menus_Permisos: TSQLQuery;
        SQLQuery_Users_MenusChange_Id_User: TLargeintField;
        SQLQuery_Users_MenusChange_WHEN: TDateTimeField;
        SQLQuery_Users_MenusDel_Id_User: TLargeintField;
        SQLQuery_Users_MenusDel_WHEN: TDateTimeField;
        SQLQuery_Users_MenusDel_WHY: TStringField;
        SQLQuery_Users_MenusForcing_Why_Delete: TStringField;
        SQLQuery_Users_Menusid: TLargeintField;
        SQLQuery_Users_MenusId_Menus: TLargeintField;
        SQLQuery_Users_MenusId_Users: TLargeintField;
        SQLQuery_Users_MenusInsert_Id_User: TLargeintField;
        SQLQuery_Users_MenusInsert_WHEN: TDateTimeField;
        SQLQuery_Users_MenusOT_Descripcion_Menu: TStringField;
        SQLQuery_Users_MenusOT_Descripcion_Nick: TStringField;
        SQLQuery_Users_Menus_PermisosDescripcion: TStringField;
        SQLQuery_Users_Menus_Permisosid: TLargeintField;
        SQLQuery_Users_Menus_PermisosPermisoSN: TStringField;
        SQLQuery_Users_Menus_PermisosTipo_CRUD_Descripcion1: TStringField;
        SQLQuery_Users_Passwords: TSQLQuery;
        SQLQuery_Users_Menus: TSQLQuery;
        SQLQuery_Users_PasswordsChange_Id_User: TLargeintField;
        SQLQuery_Users_PasswordsChange_WHEN: TDateTimeField;
        SQLQuery_Users_PasswordsDel_Id_User: TLargeintField;
        SQLQuery_Users_PasswordsDel_WHEN: TDateTimeField;
        SQLQuery_Users_PasswordsDel_WHY: TStringField;
        SQLQuery_Users_Passwordsid: TLargeintField;
        SQLQuery_Users_PasswordsId_Users: TLargeintField;
        SQLQuery_Users_PasswordsInsert_Id_User: TLargeintField;
        SQLQuery_Users_PasswordsInsert_WHEN: TDateTimeField;
        SQLQuery_Users_PasswordsObligado_NICK_SN: TStringField;
        SQLQuery_Users_PasswordsOT_Descripcion_Nick: TStringField;
        SQLQuery_Users_PasswordsPassword: TStringField;
        SQLQuery_Users_PasswordsPassword_Expira_Fin: TDateTimeField;
        SQLQuery_Users_PasswordsPassword_Expira_Inicio: TDateTimeField;
        SQLQuery_Users_PasswordsPassword_Expira_SN: TStringField;
        SQLQuery_Users_Menus_PermisosChange_Id_User: TLargeintField;
        SQLQuery_Users_Menus_PermisosChange_WHEN: TDateTimeField;
        SQLQuery_Users_Menus_PermisosDel_Id_User: TLargeintField;
        SQLQuery_Users_Menus_PermisosDel_WHEN: TDateTimeField;
        SQLQuery_Users_Menus_PermisosDel_WHY: TStringField;
        SQLQuery_Users_Menus_PermisosId_Menus: TLargeintField;
        SQLQuery_Users_Menus_PermisosId_Users: TLargeintField;
        SQLQuery_Users_Menus_PermisosInsert_Id_User: TLargeintField;
        SQLQuery_Users_Menus_PermisosInsert_WHEN: TDateTimeField;
        SQLQuery_Users_Menus_PermisosOT_Descripcion_Menu: TStringField;
        SQLQuery_Users_Menus_PermisosOT_Descripcion_Nick: TStringField;
        SQLQuery_Users_Menus_PermisosTipo_CRUD: TStringField;
        TabSheet_Busqueda_Concreta: TTabSheet;
        TabSheet_Filtros_Generales: TTabSheet;

        procedure ComboBox_FiltrosChange(Sender: TObject);
        procedure Filtrar_Principal_Sin_Preguntar;
        procedure BitBtn_Copiar_UsuarioClick(Sender: TObject);
        function  Filtrar_users_passwords( param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
        function  Filtrar_users_menus( param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
        function  Filtrar_users_menus_permisos( param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
        function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
        procedure FormCreate(Sender: TObject);
        procedure Refrescar_Registros;
        procedure Refrescar_Registros_Passwords;
        procedure Refrescar_Registros_Menus;
        procedure Refrescar_Registros_Menus_Permisos;
        procedure SQLQuery_UsersBeforeEdit(DataSet: TDataSet);
        procedure SQLQuery_Users_MenusBeforeEdit(DataSet: TDataSet);
        procedure SQLQuery_Users_Menus_PermisosAfterPost(DataSet: TDataSet);
        procedure Presentar_Datos;
        procedure Filtrar_tablas_ligadas;
        procedure Filtrar_tablas_ligadas_Menus;
        procedure Cerramos_Tablas;
        procedure Cerramos_Tablas_Ligadas;
        procedure Cerramos_Tablas_Ligadas_Menus;
        procedure FormDestroy(Sender: TObject);
        procedure no_Tocar;
        procedure Seleccionado_Rgtro;
        procedure Editar_Registro;
        procedure Insertar_Registro;

        procedure BitBtn_ImprimirClick(Sender: TObject);
        procedure BitBtn_SALIRClick(Sender: TObject);
        procedure BitBtn_SeleccionarClick(Sender: TObject);
        procedure BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
        procedure DBGrid_PrincipalCellClick(Column: TColumn);
        procedure DBGrid_PrincipalDblClick(Sender: TObject);
        procedure DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
        procedure DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
        procedure BitBtn_FiltrarClick(Sender: TObject);
        procedure FormActivate(Sender: TObject);
        procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
        procedure para_Empezar;
        procedure RadioGroup_BajasClick(Sender: TObject);
        procedure SQLQuery_UsersAfterPost(DataSet: TDataSet);
        procedure SQLQuery_UsersAfterScroll(DataSet: TDataSet);
        procedure SQLQuery_UsersBeforePost(DataSet: TDataSet);
        procedure SQLQuery_Users_MenusAfterPost(DataSet: TDataSet);
        procedure SQLQuery_Users_MenusAfterScroll(DataSet: TDataSet);
        procedure SQLQuery_Users_MenusBeforePost(DataSet: TDataSet);
        procedure SQLQuery_Users_Menus_PermisosBeforeEdit(DataSet: TDataSet);
        procedure SQLQuery_Users_Menus_PermisosBeforePost(DataSet: TDataSet);
        procedure SQLQuery_Users_Menus_PermisosCalcFields(DataSet: TDataSet);
        procedure SQLQuery_Users_PasswordsAfterPost(DataSet: TDataSet);
        procedure SQLQuery_Users_PasswordsBeforeEdit(DataSet: TDataSet);
        procedure SQLQuery_Users_PasswordsBeforePost(DataSet: TDataSet);
    private
        { private declarations }
        private_Salir_OK           : Boolean;
        private_Order_By           : array of TOrder_By;
        private_Order_By_Menus     : array of TOrder_By;
        private_Order_By_passwords : array of TOrder_By;
        private_Order_By_permisos  : array of TOrder_By;
    public
        { public declarations }
        public_Solo_Ver           : Boolean;
        public_Elegimos           : Boolean;
        public_Menu_Worked        : Integer;
        public_Rgtro_Seleccionado : Boolean;
    end;

var
    form_users_000: Tform_users_000;

implementation

{$R *.lfm}

uses dm_users, menu, users_001, users_006;

{ Tform_users_000 }

procedure Tform_users_000.FormActivate(Sender: TObject);
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

procedure Tform_users_000.FormClose(Sender: TObject; var CloseAction: TCloseAction);
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

procedure Tform_users_000.Cerramos_Tablas_Ligadas_Menus;
begin
    if UTI_TB_Cerrar( DataModule_Users.SQLConnector_Users_Menus_Permisos,
                      DataModule_Users.SQLTransaction_Users_Menus_Permisos,
                      SQLQuery_Users_Menus_Permisos ) = false then UTI_GEN_Salir;
end;

procedure Tform_users_000.Cerramos_Tablas_Ligadas;
begin
    Cerramos_Tablas_Ligadas_Menus;

    if UTI_TB_Cerrar( DataModule_Users.SQLConnector_Users_Passwords,
                      DataModule_Users.SQLTransaction_Users_Passwords,
                      SQLQuery_Users_Passwords ) = false then UTI_GEN_Salir;

    if UTI_TB_Cerrar( DataModule_Users.SQLConnector_Users_Menus,
                      DataModule_Users.SQLTransaction_Users_Menus,
                      SQLQuery_Users_Menus ) = false then UTI_GEN_Salir;
end;

procedure Tform_users_000.FormDestroy(Sender: TObject);
begin
    Cerramos_Tablas;
end;

procedure Tform_users_000.BitBtn_FiltrarClick(Sender: TObject);
begin
    if PageControl_Filtros.ActivePage = TabSheet_Busqueda_Concreta then
    begin
        Filtrar_Principal_Sin_Preguntar;
    end else begin
        RadioGroup_Bajas.ItemIndex := Filtrar_Principal( true );
    end;
end;

procedure Tform_users_000.RadioGroup_BajasClick(Sender: TObject);
begin
    Refrescar_Registros;
end;

procedure Tform_users_000.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_users_000.BitBtn_SeleccionarClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
end;

procedure Tform_users_000.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    If public_Elegimos then
         Seleccionado_Rgtro
    else Editar_Registro;
end;

procedure Tform_users_000.DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    UTI_GEN_Dibujar_Grid( Sender, SQLQuery_Users, Rect, DataCol, Column, State );
end;

procedure Tform_users_000.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if Key = 13 then
    begin
        If public_Elegimos then
             Seleccionado_Rgtro
        else Editar_Registro;
    end;
end;

procedure Tform_users_000.SQLQuery_UsersAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'users',
                       DataModule_Users.SQLTransaction_Users,
                       SQLQuery_Users,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros;
end;

procedure Tform_users_000.SQLQuery_UsersBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Users );
end;

procedure Tform_users_000.SQLQuery_Users_MenusAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'users_menus',
                       DataModule_Users.SQLTransaction_Users_Menus,
                       SQLQuery_Users_Menus,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros_Menus;
end;

procedure Tform_users_000.SQLQuery_Users_MenusBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Users_Menus );
end;

procedure Tform_users_000.SQLQuery_Users_Menus_PermisosBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Users_Menus_Permisos );
end;

procedure Tform_users_000.SQLQuery_Users_PasswordsAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'users_passwords',
                       DataModule_Users.SQLTransaction_Users_Passwords,
                       SQLQuery_Users_Passwords,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros_Passwords;
end;

procedure Tform_users_000.SQLQuery_Users_PasswordsBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Users_Passwords );
end;

procedure Tform_users_000.BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if SQLQuery_Users.RecordCount > 0 then UTI_RGTRO_Ver_Estado_Registro( 'users', SQLQuery_Users, DataSource_Users, DBGrid_Principal );
    end;
end;

procedure Tform_users_000.BitBtn_ImprimirClick(Sender: TObject);
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
                            ', con Nick %' +
                            Trim(Edit_Descripcion.Text) + '%';
    end;

    var_Ordenado_por := var_Ordenado_por +
                        ', con tipo de usuario = ' +
                        Trim(ComboBox_Tipo_Usuario.Text);

    var_Ordenado_por := var_Ordenado_por +
                        ', con permiso total S/N = ' +
                        Trim(ComboBox_Permiso_Total_SN.Text);

    // ********************************************************************************************* //
    // ** Configuramos la llamada al generador de informes                                        ** //
    // ********************************************************************************************* //
    var_Ficheros := TStringList.Create;

    UTI_GEN_Informes( var_Ordenado_por,
                      SQLQuery_Users,
                      DataSource_Users,
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

procedure Tform_users_000.no_Tocar;
begin
    BitBtn_Imprimir.Enabled := False;
end;

procedure Tform_users_000.Seleccionado_Rgtro;
begin
    private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    public_Rgtro_Seleccionado := true;
    Close;
end;

procedure Tform_users_000.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure Tform_users_000.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if (key = 40) or
       (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

procedure Tform_users_000.DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
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
                UTI_RGTRO_Borrar( 'users',
                                  SQLQuery_Users,
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

procedure Tform_users_000.SQLQuery_UsersAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure TForm_users_000.Presentar_Datos;
begin
     /// guardar por lo que pueda pasar
end;

function Tform_users_000.Filtrar_users_menus( param_ver_bajas : ShortInt;
                                              param_Cambiamos_Filtro : Boolean;
                                              param_Lineas_Filtro,
                                              param_Lineas_OrderBy : TStrings ) : ShortInt;
var
  var_a_Filtrar : TStrings;
begin
  var_a_Filtrar := TStringList.Create;
  var_a_Filtrar.Clear;

  if Trim(param_Lineas_OrderBy.Text) = '' then
  begin
    param_Lineas_OrderBy.Text := private_Order_By_Menus[0].Memo_OrderBy;
  end;

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  Result := UTI_TB_Filtrar( private_Order_By_Menus,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Users_Menus,
                                                          'users_menus',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Users_Menus,
                                                          'users_menus',
                                                          'i' ),

                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_Users.SQLTransaction_Users_Menus,
                            DataModule_Users.SQLConnector_Users_Menus,
                            SQLQuery_Users_Menus,

                            // name_tabla,
                            'um',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT um.*,' + ' ' +
                                   'u.Descripcion_Nick AS OT_Descripcion_Nick,' + ' ' +
                                   'm.Descripcion AS OT_Descripcion_Menu' + ' ' +
                            'FROM users_menus AS um' + ' ' +

                            'LEFT JOIN users AS u' + ' ' +
                            'ON um.Id_Users = u.id' + ' ' +

                            'LEFT JOIN menus AS m' + ' ' +
                            'ON um.Id_Menus = m.id' + ' ',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar,

                            param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_a_Filtrar.Clear;
end;

function Tform_users_000.Filtrar_users_passwords( param_ver_bajas : ShortInt;
                                                  param_Cambiamos_Filtro : Boolean;
                                                  param_Lineas_Filtro,
                                                  param_Lineas_OrderBy : TStrings ) : ShortInt;
var
  var_a_Filtrar : TStrings;
begin
  var_a_Filtrar := TStringList.Create;
  var_a_Filtrar.Clear;

  if Trim(param_Lineas_OrderBy.Text) = '' then
  begin
    param_Lineas_OrderBy.Text := private_Order_By_passwords[0].Memo_OrderBy;
  end;

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  Result := UTI_TB_Filtrar( private_Order_By_passwords,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Users_Passwords,
                                                          'users_passwords',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Users_Passwords,
                                                          'users_passwords',
                                                          'i' ),

                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_Users.SQLTransaction_Users_Passwords,
                            DataModule_Users.SQLConnector_Users_Passwords,
                            SQLQuery_Users_Passwords,

                            // name_tabla,
                            'up',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT up.*,' + ' ' +
                                   'u.Descripcion_Nick AS OT_Descripcion_Nick' + ' ' +
                            'FROM users_passwords AS up' + ' ' +

                            'LEFT JOIN users AS u' + ' ' +
                            'ON up.Id_Users = u.id' + ' ',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar,

                            param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_a_Filtrar.Free;
end;

function Tform_users_000.Filtrar_users_menus_permisos( param_ver_bajas : ShortInt;
                                                       param_Cambiamos_Filtro : Boolean;
                                                       param_Lineas_Filtro,
                                                       param_Lineas_OrderBy : TStrings ) : ShortInt;
var
  var_a_Filtrar : TStrings;
begin
  var_a_Filtrar := TStringList.Create;
  var_a_Filtrar.Clear;

  if Trim(param_Lineas_OrderBy.Text) = '' then
  begin
    param_Lineas_OrderBy.Text := private_Order_By_permisos[0].Memo_OrderBy; ;
  end;

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  Result := UTI_TB_Filtrar( private_Order_By_permisos,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Users_Menus_Permisos,
                                                          'users_menus_permissions',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Users_Menus_Permisos,
                                                          'users_menus_permissions',
                                                          'i' ),

                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_Users.SQLTransaction_Users_Menus_Permisos,
                            DataModule_Users.SQLConnector_Users_Menus_Permisos,
                            SQLQuery_Users_Menus_Permisos,

                            // name_tabla,
                            'upe',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT upe.*,' + ' ' +
                                   'u.Descripcion_Nick AS OT_Descripcion_Nick,' + ' ' +
                                   'm.Descripcion AS OT_Descripcion_Menu' + ' ' +
                            'FROM users_menus_permissions AS upe' + ' ' +

                            'LEFT JOIN users AS u' + ' ' +
                            'ON upe.Id_Users = u.id' + ' ' +

                            'LEFT JOIN menus AS m' + ' ' +
                            'ON upe.Id_Menus = m.id' + ' ',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar,

                            param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_a_Filtrar.Free;
end;

procedure Tform_users_000.SQLQuery_Users_Menus_PermisosCalcFields(DataSet: TDataSet);
begin
    with SQLQuery_Users_Menus_Permisos do
    begin
        FieldByName('OT_CALC_Tipo_CRUD_Descripcion').AsString := '';

        if FieldByName('Tipo_CRUD').Value = 'A' then FieldByName('OT_CALC_Tipo_CRUD_Descripcion').AsString := 'INSERTAR / CREAR';
        if FieldByName('Tipo_CRUD').Value = 'M' then FieldByName('OT_CALC_Tipo_CRUD_Descripcion').AsString := 'MODIFICAR / EDITAR';
        if FieldByName('Tipo_CRUD').Value = 'B' then FieldByName('OT_CALC_Tipo_CRUD_Descripcion').AsString := 'BORRAR / DAR DE BAJA';
        if FieldByName('Tipo_CRUD').Value = 'I' then FieldByName('OT_CALC_Tipo_CRUD_Descripcion').AsString := 'IMPRIMIR';
        if FieldByName('Tipo_CRUD').Value = 'O' then FieldByName('OT_CALC_Tipo_CRUD_Descripcion').AsString := FieldByName('Descripcion').AsString;
    end;
end;

procedure Tform_users_000.Refrescar_Registros;
var var_Descripcion_Nick : String;
    var_Permiso_Total_SN : ShortString;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_Descripcion_Nick := '';

    if SQLQuery_Users.RecordCount > 0 then
    begin
        var_Descripcion_Nick := SQLQuery_Users.FieldByName('Descripcion_Nick').Value;
        var_Permiso_Total_SN := SQLQuery_Users.FieldByName('Permiso_Total_SN').Value;
    end;

    Filtrar_Principal_Sin_Preguntar;

    if Trim(var_Descripcion_Nick) <> '' then
    begin
         SQLQuery_Users.Locate( 'Descripcion_Nick;Permiso_Total_SN',
                                VarArrayOf( [ var_Descripcion_Nick, var_Permiso_Total_SN ] ),
                                [] );
    end;
end;

procedure TForm_users_000.Refrescar_Registros_Passwords;
var var_Lineas_Filtro      : TStrings;
    var_Lineas_OrderBy     : TStrings;
    var_Password           : String;
    var_Obligado_NICK_SN   : ShortString;
    var_Password_Expira_SN : ShortString;
    var_ver_Bajas          : ShortInt;
begin
    // ********************************************************************************************* //
    // ** Solo si la cabecera está en modo EDIT se abren las tablas hijas                         ** //
    // ********************************************************************************************* //
    if SQLQuery_Users.State <> dsEdit then Exit;

    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_Password           := '';
    var_Obligado_NICK_SN   := '';
    var_Password_Expira_SN := '';

    if SQLQuery_Users_Passwords.RecordCount > 0 then
    begin
        var_Password           := SQLQuery_Users_Passwords.FieldByName('Password').Value;
        var_Obligado_NICK_SN   := SQLQuery_Users_Passwords.FieldByName('Obligado_NICK_SN').Value;
        var_Password_Expira_SN := SQLQuery_Users_Passwords.FieldByName('Password_Expira_SN').Value;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Clear;
    var_Lineas_OrderBy.Clear;

    if Trim(SQLQuery_Users.FieldByName('id').AsString) <> '' then
         var_Lineas_Filtro.Add('Id_Users = ' + Trim(SQLQuery_Users.FieldByName('id').AsString))
    else var_Lineas_Filtro.Add('Id_Users = Null');

    var_ver_Bajas := RadioGroup_Bajas.ItemIndex;
    if UTI_GEN_Form_Abierto_Ya('Form_users_001') = true then
    begin
        var_ver_Bajas := Form_users_001.RadioGroup_Bajas.ItemIndex;
    end;

    Filtrar_users_passwords( var_ver_Bajas,
                             false,
                             var_Lineas_Filtro,
                             var_Lineas_OrderBy );

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;

    if Trim(var_Password) <> '' then
    begin
         SQLQuery_Users_Passwords.Locate( 'Password;Obligado_NICK_SN;Password_Expira_SN',
                                          VarArrayOf( [ var_Password, var_Obligado_NICK_SN, var_Password_Expira_SN ] ),
                                          [] );
    end;
end;

procedure TForm_users_000.Refrescar_Registros_Menus;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
    var_Buscar         : Boolean;
    var_Id_Users       : Int64;
    var_Id_Menus       : Int64;
    var_ver_Bajas      : ShortInt;
begin
    // ********************************************************************************************* //
    // ** Solo si la cabecera está en modo EDIT se abren las tablas hijas                         ** //
    // ********************************************************************************************* //
    if SQLQuery_Users.State <> dsEdit then Exit;

    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_Buscar := false;
    if SQLQuery_Users_Menus.RecordCount > 0 then
    begin
        var_Buscar   := true;
        var_Id_Users := SQLQuery_Users_Menus.FieldByName('Id_Users').Value;
        var_Id_Menus := SQLQuery_Users_Menus.FieldByName('Id_Menus').Value;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_ver_Bajas := RadioGroup_Bajas.ItemIndex;
    if UTI_GEN_Form_Abierto_Ya('Form_users_001') = true then
    begin
         var_ver_Bajas := Form_users_001.RadioGroup_Bajas.ItemIndex;
         Form_users_001.Preparar_Memo(false);
    end;

    var_Lineas_Filtro.AddStrings(Form_users_001.Memo_Filtros.Lines);
    var_Lineas_OrderBy.AddStrings(Form_users_001.Memo_OrderBy.Lines);

    Filtrar_users_Menus( var_ver_Bajas,
                         false,
                         var_Lineas_Filtro,
                         var_Lineas_OrderBy );

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;

    if var_Buscar = true then
    begin
         SQLQuery_Users_Menus.Locate( 'Id_Users;Id_Menus',
                                      VarArrayOf( [ var_Id_Users, var_Id_Menus ] ),
                                      [] );
    end;
end;

procedure Tform_users_000.SQLQuery_Users_MenusAfterScroll(DataSet: TDataSet);
begin
     Filtrar_tablas_ligadas_Menus;
end;

procedure Tform_users_000.SQLQuery_Users_Menus_PermisosAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'users_menus_permissions',
                       DataModule_Users.SQLTransaction_Users_Menus_Permisos,
                       SQLQuery_Users_Menus_Permisos,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros_Menus_Permisos;
end;

procedure Tform_users_000.Filtrar_tablas_ligadas_Menus;
var
  var_Lineas_Filtro  : TStrings;
  var_Lineas_OrderBy : TStrings;
  var_SQL_ADD        : TStrings;
begin
  var_SQL_ADD   := TStringList.Create;

  if SQLQuery_Users_Menus.RecordCount = 0 then Exit;

  if SQLQuery_Users_Menus.State = dsInsert then
  begin
      Cerramos_Tablas_Ligadas_Menus;
      Exit;
  end;

  var_Lineas_Filtro  := TStringList.Create;
  var_Lineas_OrderBy := TStringList.Create;

  // ********************************************************************************************* //
  // ** SQLQuery_Users_Menus                                                                    ** //
  // ********************************************************************************************* //
  var_SQL_ADD.Clear;
  var_SQL_ADD.Add( 'upe.Id_Users = ' + SQLQuery_Users_Menus.FieldByName('Id_Users').AsString );
  UTI_TB_SQL_ADD( true,
                  var_Lineas_Filtro,
                  var_SQL_ADD );

  var_SQL_ADD.Clear;
  var_SQL_ADD.Add( 'upe.Id_Menus = ' + SQLQuery_Users_Menus.FieldByName('Id_Menus').AsString );
  UTI_TB_SQL_ADD( false,
                  var_Lineas_Filtro,
                  var_SQL_ADD );

  var_Lineas_OrderBy.Clear;

  if UTI_GEN_Form_Abierto_Ya('Form_users_001') = true then
       begin
           Filtrar_users_menus_permisos( Form_users_001.RadioGroup_Bajas.ItemIndex,
                                         false,
                                         var_Lineas_Filtro,
                                         var_Lineas_OrderBy );
       end
  else
       begin
           Filtrar_users_menus_permisos( RadioGroup_Bajas.ItemIndex,
                                         false,
                                         var_Lineas_Filtro,
                                         var_Lineas_OrderBy );
       end;

  var_Lineas_Filtro.Free;
  var_Lineas_OrderBy.Free;
  var_SQL_ADD.Free;
end;

procedure TForm_users_000.Refrescar_Registros_Menus_Permisos;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
    var_Buscar         : Boolean;
    var_Id_Users       : Int64;
    var_Id_Menus       : Int64;
    var_Tipo_CRUD      : ShortString;
    var_ver_Bajas      : ShortInt;
    var_SQL_ADD        : TStrings;
begin
    var_SQL_ADD   := TStringList.Create;

    // ********************************************************************************************* //
    // ** Solo si la cabecera está en modo EDIT se abren las tablas hijas                         ** //
    // ********************************************************************************************* //
    if SQLQuery_Users.State <> dsEdit then Exit;

    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_Buscar := false;

    if SQLQuery_Users_Menus_Permisos.RecordCount > 0 then
    begin
        var_Buscar     := true;
        var_Id_Users   := SQLQuery_Users_Menus_Permisos.FieldByName('Id_Users').Value;
        var_Id_Menus   := SQLQuery_Users_Menus_Permisos.FieldByName('Id_Menus').Value;
        var_Tipo_CRUD  := SQLQuery_Users_Menus_Permisos.FieldByName('Tipo_CRUD').Value;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Clear;
    var_Lineas_OrderBy.Clear;

    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'upe.Id_Users = ' + SQLQuery_Users_Menus.FieldByName('Id_Users').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'upe.Id_Menus = ' + SQLQuery_Users_Menus.FieldByName('Id_Menus').AsString );
    UTI_TB_SQL_ADD( false,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_Lineas_OrderBy.Clear;

{
    if Trim(SQLQuery_Users.FieldByName('id').AsString) <> '' then
         var_Lineas_Filtro.Add('Id_Users = ' + Trim(SQLQuery_Users.FieldByName('id').AsString))
    else var_Lineas_Filtro.Add('Id_Users = Null');
}
    var_ver_Bajas := RadioGroup_Bajas.ItemIndex;
    if UTI_GEN_Form_Abierto_Ya('Form_users_001') = true then
    begin
        var_ver_Bajas := Form_users_001.RadioGroup_Bajas.ItemIndex;
    end;

    Filtrar_users_menus_permisos( var_ver_Bajas,
                                  false,
                                  var_Lineas_Filtro,
                                  var_Lineas_OrderBy );

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;

    if var_Buscar = true then
    begin
         SQLQuery_Users_Menus_Permisos.Locate( 'Id_Users;Id_Menus;Tipo_CRUD',
                                               VarArrayOf( [ var_Id_Users, var_Id_Menus, var_Tipo_CRUD ] ),
                                               [] );
    end;

    var_SQL_ADD.Free;
end;

procedure Tform_users_000.Filtrar_tablas_ligadas;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
    var_SQL_ADD        : TStrings;
begin
    var_SQL_ADD   := TStringList.Create;

    if SQLQuery_Users.RecordCount = 0 then Exit;

    if SQLQuery_Users.State = dsInsert then
    begin
        Cerramos_Tablas_Ligadas;
        Exit;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    // ********************************************************************************************* //
    // ** USERS_PASSWORDS                                                                         ** //
    // ********************************************************************************************* //
    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'Id_Users = ' + SQLQuery_Users.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_Lineas_OrderBy.Clear;
    Filtrar_users_passwords( RadioGroup_Bajas.ItemIndex,
                             false,
                             var_Lineas_Filtro,
                             var_Lineas_OrderBy );

    // ********************************************************************************************* //
    // ** USERS_MENUS                                                                             ** //
    // ********************************************************************************************* //
    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'um.Id_Users = ' + SQLQuery_Users.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_Lineas_OrderBy.Clear;
    Filtrar_users_menus( RadioGroup_Bajas.ItemIndex,
                         false,
                         var_Lineas_Filtro,
                         var_Lineas_OrderBy );

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;
    var_SQL_ADD.Free;
end;

procedure Tform_users_000.Insertar_Registro;
var var_msg              : TStrings;
    var_Descripcion_Nick : String;
begin
    with SQLQuery_Users do
    begin
        var_msg := TStringList.Create;

        if UTI_USR_Permiso_SN(public_Menu_Worked, 'A', True) = True then
        begin
            if public_Solo_Ver = True then
            begin
                var_msg.Add(rs_Solo_Visualizar);
                UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            end else begin
                Insert;

                //Filtrar_tablas_ligadas;

                FieldByName('Permiso_Total_SN').AsString := 'N';
                FieldByName('Tipo').Clear;

                Application.CreateForm(TForm_users_001, Form_users_001);

                Form_users_001.DBGrid_Menus.Color          := clSilver;
                Form_users_001.DBGrid_Passwords.Color      := clSilver;
                Form_users_001.DBGrid_Menus_Permisos.Color := clSilver;

                Form_users_001.RadioGroup_Bajas.ItemIndex := RadioGroup_Bajas.ItemIndex;

                Form_users_001.para_Empezar;

                Form_users_001.ShowModal;
                if Form_users_001.public_Pulso_Aceptar = true then
                begin
                    FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
                    FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                    var_Descripcion_Nick                := AnsiUpperCase(FieldByName('Descripcion_Nick').AsString);

                    UTI_RGTRO_Grabar_Antes( 'users', SQLQuery_Users );

                    Form_users_001.Free;

                    if var_Descripcion_Nick = AnsiUpperCase(FieldByName('Descripcion_Nick').AsString) then
                    begin
                        Editar_Registro;
                    end;
                end else begin
                    Cancel;
                    Form_users_001.Free;
                end;
            end;
        end;

        var_msg.Free;
    end;
end;

procedure Tform_users_000.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_Users.SQLConnector_Users,
                      DataModule_Users.SQLTransaction_Users,
                      SQLQuery_Users ) = false then UTI_GEN_Salir;

    DataModule_Users.Free;
end;

procedure Tform_users_000.FormCreate(Sender: TObject);
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

procedure Tform_users_000.para_Empezar;
begin
  { ****************************************************************************
    Solo para formularios que traten con datos
    **************************************************************************** }
    if UTI_GEN_Form_Abierto_Ya('DataModule_Users') = False then
    begin
        DataModule_Users := TDataModule_Users.Create(Application);
    end;

  { ****************************************************************************
    Preparamos los diferentes tipos de orden preconfigurados
    **************************************************************************** }
    // USERS
    SetLength(private_Order_By, 2);

    private_Order_By[0].Titulo       := 'Por la descripción'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[0].Memo_OrderBy := 'u.Descripcion_Nick ASC';

    private_Order_By[1].Titulo       := 'Por la id';
    private_Order_By[1].Memo_OrderBy := 'u.id ASC';

    Memo_OrderBy.Lines.Text          := private_Order_By[0].Memo_OrderBy;

    UTI_TB_Rellenar_ComboBox_Orden( true,
                                    ComboBox_Filtros,
                                    private_Order_By,
                                    0 );

    // USERS_MENUS
    SetLength(private_Order_By_Menus, 2);

    private_Order_By_Menus[0].Titulo       := 'Por Menú'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_Menus[0].Memo_OrderBy := 'um.Id_Users ASC, um.Id_Menus ASC';

    private_Order_By_Menus[1].Titulo       := 'Por la id';
    private_Order_By_Menus[1].Memo_OrderBy := 'um.id ASC';

    // USERS_PASSWORDS
    SetLength(private_Order_By_passwords, 2);

    private_Order_By_passwords[0].Titulo       := 'Por Password'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_passwords[0].Memo_OrderBy := 'up.Id_Users ASC, up.Password ASC';

    private_Order_By_passwords[1].Titulo       := 'Por la id';
    private_Order_By_passwords[1].Memo_OrderBy := 'up.id ASC';

    // USERS_PERMISSIONS
    SetLength(private_Order_By_permisos, 2);

    private_Order_By_permisos[0].Titulo       := 'Por Password'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_permisos[0].Memo_OrderBy := 'upe.Id_Users ASC, upe.Id_Menus ASC, upe.Tipo_CRUD ASC';

    private_Order_By_permisos[1].Titulo       := 'Por la id';
    private_Order_By_permisos[1].Memo_OrderBy := 'upe.id ASC';

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

procedure Tform_users_000.SQLQuery_UsersBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Users );
end;

procedure Tform_users_000.SQLQuery_Users_MenusBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Users_Menus );
end;

procedure Tform_users_000.SQLQuery_Users_PasswordsBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Users_Passwords );
end;

procedure Tform_users_000.SQLQuery_Users_Menus_PermisosBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Users_Menus_Permisos );
end;

procedure Tform_users_000.Editar_Registro;
var var_msg : TStrings;
    var_id  : ShortString;
begin
    with SQLQuery_Users do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
            begin
                var_id := FieldByName('id').AsString;

                if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
                begin
                    var_id := FieldByName('id').AsString;

                    if UTI_RGTRO_isLock( 'users',
                                         var_id,
                                         true ) = true then
                        begin
                            Exit;
                        end
                    else
                        begin
                            if UTI_RGTRO_Lock( 'users',
                                               var_id ) = true then
                                 Edit
                            else Exit;
                        end;

                    Application.CreateForm(TForm_users_001, Form_users_001);

                    Form_users_001.RadioGroup_Bajas.ItemIndex := RadioGroup_Bajas.ItemIndex;
                    Form_users_001.public_Menu_Worked         := public_Menu_Worked;

                    if public_Solo_Ver = true then
                    begin
                        Form_users_001.public_Solo_Ver := true;
                    end;

                    Form_users_001.para_Empezar;

                    Form_users_001.ShowModal;
                    if Form_users_001.public_Pulso_Aceptar = true then
                        begin
                            if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( SQLQuery_Users ) = true then
                               begin
                                    FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                                    FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                                    UTI_RGTRO_Grabar_Antes( 'users',
                                                            SQLQuery_Users );
                               end
                            else Cancel;
                        end
                    else Cancel;

                    Form_users_001.Free;

                    UTI_RGTRO_UnLock( 'users',
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

procedure Tform_users_000.BitBtn_Copiar_UsuarioClick(Sender: TObject);
var var_msg          : TStrings;
    var_Nick         : String;
    var_Tipo_Usuario : String;
    var_id_Usuario   : String;
begin
    var_msg := TStringList.Create;

    if UTI_USR_Permiso_SN(public_Menu_Worked, 'A', True) = True then
    begin
        if public_Solo_Ver = True then
        begin
            var_msg.Add(rs_Solo_Visualizar);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        end else begin
            Application.CreateForm(Tform_users_006, form_users_006);

            form_users_006.para_Empezar;

            form_users_006.ShowModal;

            if form_users_006.public_Pulso_Aceptar = true then
            begin
                var_Nick         := form_users_006.Edit_Nick.Text;
                var_Tipo_Usuario := form_users_006.ComboBox_Tipo_Usuario.Text;
                var_id_Usuario   := form_users_006.Edit_id_Usuario.Text;

                form_users_006.Free;

                UTI_USR_Copiar_de_Usuario_Privilegios( var_msg,
                                                       var_Nick,
                                                       var_Tipo_Usuario,
                                                       var_id_Usuario );

                if Trim(var_msg.Text) <> '' then
                begin
                    UTI_GEN_Aviso(true, var_msg, 'PROBLEMAS', True, False);
                end else begin
                    Refrescar_Registros;
                end;
            end;
        end;
    end;

    var_msg.Free;
end;

procedure Tform_users_000.Filtrar_Principal_Sin_Preguntar;
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

procedure Tform_users_000.ComboBox_FiltrosChange(Sender: TObject);
begin
    Memo_OrderBy.Lines.Clear;
    Memo_OrderBy.Lines.Add( private_Order_By[ComboBox_Filtros.ItemIndex].Memo_OrderBy );
    BitBtn_FiltrarClick(Nil);
end;

function Tform_users_000.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
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
      var_SQL_ADD.Add( 'u.Descripcion_Nick LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Descripcion.Text) + '%') );
      UTI_TB_SQL_ADD( false,
                      var_a_Filtrar,
                      var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Con Permiso total si/no/todos                                                           ** //
    // ********************************************************************************************* //
    // ** 0.- TODOS                                                                               ** //
    // ** 1.- SOLO CON PERMISO TOTAL                                                              ** //
    // ** 2.- SOLO SIN PERMISO TOTAL                                                              ** //
    // ********************************************************************************************* //
    if ComboBox_Permiso_Total_SN.ItemIndex = 0 then
    begin
    end;

    if ComboBox_Permiso_Total_SN.ItemIndex = 1 then
    begin
      var_SQL_ADD.Clear;
      var_SQL_ADD.Add( 'u.Permiso_Total_SN = ' + UTI_GEN_Comillas('S') );
      UTI_TB_SQL_ADD( false,
                      var_a_Filtrar,
                      var_SQL_ADD );
    end;

    if ComboBox_Permiso_Total_SN.ItemIndex = 2 then
    begin
      var_SQL_ADD.Clear;
      var_SQL_ADD.Add( 'u.Permiso_Total_SN = ' + UTI_GEN_Comillas('N') );
      UTI_TB_SQL_ADD( false,
                      var_a_Filtrar,
                      var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Con Tipo de Usuario                                                                     ** //
    // ********************************************************************************************* //
    // ** 0.- TODOS                                                                               ** //
    // ** 1.- OTROS                                                                               ** //
    // ** 2.- PERSONAL                                                                            ** //
    // ** 3.- CLIENTES                                                                            ** //
    // ** 4.- PROVEEDORES                                                                         ** //
    // ** 5.- REPRESENTANTES                                                                      ** //
    // ********************************************************************************************* //
    if ComboBox_Tipo_Usuario.ItemIndex = 0 then
    begin
    end;

    if ComboBox_Tipo_Usuario.ItemIndex = 1 then
    begin
      var_SQL_ADD.Clear;
      var_SQL_ADD.Add( 'u.Tipo = ' + UTI_GEN_Comillas('OTROS') );
      UTI_TB_SQL_ADD( false,
                      var_a_Filtrar,
                      var_SQL_ADD );
    end;

    if ComboBox_Tipo_Usuario.ItemIndex = 2 then
    begin
      var_SQL_ADD.Clear;
      var_SQL_ADD.Add( 'u.Tipo = ' + UTI_GEN_Comillas('PERSONAL') );
      UTI_TB_SQL_ADD( false,
                      var_a_Filtrar,
                      var_SQL_ADD );
    end;

    if ComboBox_Tipo_Usuario.ItemIndex = 3 then
    begin
      var_SQL_ADD.Clear;
      var_SQL_ADD.Add( 'u.Tipo = ' + UTI_GEN_Comillas('CLIENTES') );
      UTI_TB_SQL_ADD( false,
                      var_a_Filtrar,
                      var_SQL_ADD );
    end;

    if ComboBox_Tipo_Usuario.ItemIndex = 4 then
    begin
      var_SQL_ADD.Clear;
      var_SQL_ADD.Add( 'u.Tipo = ' + UTI_GEN_Comillas('PROVEEDORES') );
      UTI_TB_SQL_ADD( false,
                      var_a_Filtrar,
                      var_SQL_ADD );
    end;

    if ComboBox_Tipo_Usuario.ItemIndex = 5 then
    begin
      var_SQL_ADD.Clear;
      var_SQL_ADD.Add( 'u.Tipo = ' + UTI_GEN_Comillas('REPRESENTANTES') );
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
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Users,
                                                            'users',
                                                            'u' ),

                              // Insert_SQL,
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Users,
                                                            'users',
                                                            'i' ),

                              // var_ctdad_Rgtros,
                              -1,

                              DataModule_Users.SQLTransaction_Users,
                              DataModule_Users.SQLConnector_Users,
                              SQLQuery_Users,

                              // name_tabla,
                              'u',

                              RadioGroup_Bajas.ItemIndex,

                              // SELECT_SQL,
                              'SELECT u.*' + ' ' +
                              'FROM users AS u' + ' ',

                              Memo_Filtros.Lines,
                              Memo_OrderBy.Lines,
                              var_a_Filtrar,

                              param_Cambiamos_Filtro,
                              false,   // param_ver_SQL_despues_Abrir : Boolean;
                              true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

    var_a_Filtrar.Free;

    Label_Ctdad_Rgtros.Caption := IntToStr(SQLQuery_Users.RecordCount);

    if SQLQuery_Users.RecordCount = 0 then
    begin
        Cerramos_Tablas_Ligadas;
    end;

    //Filtrar_tablas_ligadas;
    var_SQL_ADD.Free;
end;

end.



