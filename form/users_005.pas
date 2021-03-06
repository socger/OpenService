unit users_005;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Buttons, variants, ExtCtrls, DBGrids, DbCtrls, Grids, ComCtrls,
  utilidades_bd, utilidades_general, utilidades_rgtro, utilidades_datos_tablas;

type

  { Tform_users_005 }

  Tform_users_005 = class(TForm)
    BitBtn_Filtrar: TBitBtn;
    BitBtn_SALIR: TBitBtn;
    BitBtn_Seleccionar: TBitBtn;
    ComboBox_Filtros: TComboBox;
    ComboBox_Permiso_Total_SN: TComboBox;
    ComboBox_Tipo_Usuario: TComboBox;
    DataSource_Users: TDataSource;
    DBGrid_Principal: TDBGrid;
    DBNavigator1: TDBNavigator;
    Edit_Descripcion: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
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
    TabSheet_Busqueda_Concreta: TTabSheet;
    TabSheet_Filtros_Generales: TTabSheet;

    procedure ComboBox_FiltrosChange(Sender: TObject);
    procedure Filtrar_Principal_Sin_Preguntar;
    procedure Presentar_Datos;
    procedure BitBtn_FiltrarClick(Sender: TObject);
    function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
    procedure no_Tocar;
    procedure BitBtn_SeleccionarClick(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure Seleccionado_Rgtro;
    procedure DBGrid_PrincipalCellClick(Column: TColumn);
    procedure DBGrid_PrincipalDblClick(Sender: TObject);
    procedure DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Filtrar_tablas_ligadas;
    procedure Refrescar_Registros;
    procedure Cerramos_Tablas;
    procedure Cerramos_Tablas_Ligadas;
    procedure para_Empezar;
    procedure Obligar_como_Filtrado_Principal;
    procedure BitBtn_SALIRClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SQLQuery_UsersAfterPost(DataSet: TDataSet);
    procedure SQLQuery_UsersAfterScroll(DataSet: TDataSet);
    procedure SQLQuery_UsersBeforePost(DataSet: TDataSet);
    procedure SQLQuery_UsersCalcFields(DataSet: TDataSet);
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
  form_users_005: Tform_users_005;

implementation

{$R *.lfm}

uses menu, dm_Users_Elegir;

{ Tform_users_005 }

procedure Tform_users_005.FormActivate(Sender: TObject);
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

procedure Tform_users_005.FormClose(Sender: TObject; var CloseAction: TCloseAction);
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
    end else begin
      { ********************************************************************
        Fue correcto el modo como quiere BitBtn_SALIR de la aplicación
        ******************************************************************** }
    end;
end;

procedure Tform_users_005.FormCreate(Sender: TObject);
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

procedure Tform_users_005.FormDestroy(Sender: TObject);
begin
    Cerramos_Tablas;
end;

procedure Tform_users_005.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_users_005.para_Empezar;
begin
    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    if UTI_GEN_Form_Abierto_Ya('DataModule_Users_Elegir') = False then
    begin
        DataModule_Users_Elegir := TDataModule_Users_Elegir.Create(Application);
    end;

    // ********************************************************************************************* //
    // ** Preparamos los diferentes tipos de orden preconfigurados                                ** //
    // ********************************************************************************************* //
    // USERS
    SetLength(private_Order_By, 2);

    private_Order_By[0].Titulo       := 'Por la descripción'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[0].Memo_OrderBy := 'u.Descripcion_Nick ASC';

    private_Order_By[1].Titulo       := 'Por la id';
    private_Order_By[1].Memo_OrderBy := 'u.id ASC';

    Memo_OrderBy.Lines.Text := private_Order_By[0].Memo_OrderBy;

    Obligar_como_Filtrado_Principal;

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

procedure Tform_users_005.Obligar_como_Filtrado_Principal;
begin
    // ********************************************************************************************* //
    // ** NO HAY NADA POR LO QUE FILTRAR                                                          ** //
    // ********************************************************************************************* //
end;

procedure Tform_users_005.SQLQuery_UsersAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'users',
                       DataModule_Users_Elegir.SQLTransaction_Users_Elegir,
                       SQLQuery_Users,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros;
end;

procedure Tform_users_005.SQLQuery_UsersAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure Tform_users_005.SQLQuery_UsersBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Users );
end;

procedure Tform_users_005.SQLQuery_UsersCalcFields(DataSet: TDataSet);
begin
    with SQLQuery_Users do
    begin
        // ***************************************************************************************** //
        // ** NO HAY NADA QUE CALCULAR                                                            ** //
        // ***************************************************************************************** //
    end;
end;

procedure Tform_users_005.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_Users_Elegir.SQLConnector_Users_Elegir,
                      DataModule_Users_Elegir.SQLTransaction_Users_Elegir,
                      SQLQuery_Users ) = false then UTI_GEN_Salir;

    DataModule_Users_Elegir.Free;
end;

procedure Tform_users_005.Cerramos_Tablas_Ligadas;
begin
    // ********************************************************************************************* //
    // ** NO HAY TABLAS LIGADAS                                                                   ** //
    // ********************************************************************************************* //
end;

procedure Tform_users_005.Refrescar_Registros;
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

procedure Tform_users_005.Filtrar_tablas_ligadas;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
begin
    if SQLQuery_Users.RecordCount = 0 then Exit;

    if SQLQuery_Users.State = dsInsert then
    begin
        Cerramos_Tablas_Ligadas;
        Exit;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;
end;

procedure Tform_users_005.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    If public_Elegimos then Seleccionado_Rgtro;
end;

procedure Tform_users_005.DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    UTI_GEN_Dibujar_Grid( Sender, SQLQuery_Users, Rect, DataCol, Column, State );
end;

procedure Tform_users_005.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then
    begin
        If public_Elegimos then Seleccionado_Rgtro;
    end;
end;

procedure Tform_users_005.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

procedure Tform_users_005.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure Tform_users_005.Seleccionado_Rgtro;
begin
    private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    public_Rgtro_Seleccionado := true;
    Close;
end;

procedure Tform_users_005.BitBtn_SeleccionarClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
end;

procedure Tform_users_005.DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
begin
    //Filtrar_tablas_ligadas;

    case Button of
        nbRefresh : begin
            Refrescar_Registros;
            Abort;
        end;
    end;
end;

procedure Tform_users_005.no_Tocar;
begin
    // No hay nada para no tocar
end;

procedure Tform_users_005.BitBtn_FiltrarClick(Sender: TObject);
begin
    if PageControl_Filtros.ActivePage = TabSheet_Busqueda_Concreta then
    begin
        Filtrar_Principal_Sin_Preguntar;
    end else begin
        RadioGroup_Bajas.ItemIndex := Filtrar_Principal( true );
    end;
end;

procedure Tform_users_005.Presentar_Datos;
begin
    // No hay nada para presentar
end;

function Tform_users_005.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
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

                            DataModule_Users_Elegir.SQLTransaction_Users_Elegir,
                            DataModule_Users_Elegir.SQLConnector_Users_Elegir,
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
                            true ); // no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_a_Filtrar.Free;
  var_SQL_ADD.Free;

  //Filtrar_tablas_ligadas;
end;

procedure Tform_users_005.Filtrar_Principal_Sin_Preguntar;
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

procedure Tform_users_005.ComboBox_FiltrosChange(Sender: TObject);
begin
    Memo_OrderBy.Lines.Clear;
    Memo_OrderBy.Lines.Add( private_Order_By[ComboBox_Filtros.ItemIndex].Memo_OrderBy );
    BitBtn_FiltrarClick(Nil);
end;

end.


