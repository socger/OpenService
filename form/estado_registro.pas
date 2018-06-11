unit estado_registro;

{$mode objfpc}{$H+}

interface

uses
    Dialogs, Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, StdCtrls, Buttons,
    variants, utilidades_bd, utilidades_general, ButtonPanel, DBGrids, DbCtrls;

type

    { TForm_Estado_Registro }

    TForm_Estado_Registro = class(TForm)
        BitBtn_Filtrar: TBitBtn;
        ButtonPanel_Estado_Registro: TButtonPanel;
        DataSource_users_row_changes: TDataSource;
        DataSource_users_row_changes_fields: TDataSource;
        DBGrid_Principal: TDBGrid;
        DBGrid_Principal1: TDBGrid;
        DBGrid_Principal2: TDBGrid;
        DBMemo1: TDBMemo;
        DBMemo2: TDBMemo;
        DBNavigator1: TDBNavigator;
        DBNavigator2: TDBNavigator;
        Edit_Fecha_Alta: TEdit;
        Edit_Fecha_Baja: TEdit;
        Edit_Fecha_Ult_Modificacion: TEdit;
        Edit_Motivo_Baja: TEdit;
        Edit_Usuario_Alta: TEdit;
        Edit_Usuario_Baja: TEdit;
        Edit_Usuario_Ult_Modificacion: TEdit;
        GroupBox1: TGroupBox;
        GroupBox2: TGroupBox;
        GroupBox3: TGroupBox;
        GroupBox4: TGroupBox;
        GroupBox5: TGroupBox;
        Label1: TLabel;
        Label10: TLabel;
        Label11: TLabel;
        Label12: TLabel;
        Label13: TLabel;
        Label2: TLabel;
        Label3: TLabel;
        Label4: TLabel;
        Label5: TLabel;
        Label6: TLabel;
        Label7: TLabel;
        Label8: TLabel;
        Label9: TLabel;
        Memo_Filtros: TMemo;
        Memo_OrderBy: TMemo;
        SQLQuery_users_row_changes: TSQLQuery;
        SQLQuery_users_row_changesid_terminales: TLargeintField;
        SQLQuery_users_row_changesOT_Descripcion_Nick_Calc1: TStringField;
        SQLQuery_users_row_changes_fields: TSQLQuery;
        SQLQuery_users_row_changesid: TLargeintField;
        SQLQuery_users_row_changesId_Users: TLargeintField;
        SQLQuery_users_row_changesMomento: TDateTimeField;
        SQLQuery_users_row_changesOT_Descripcion_Nick: TStringField;
        SQLQuery_users_row_changestb: TStringField;
        SQLQuery_users_row_changes_fieldsCampo_Nombre: TStringField;
        SQLQuery_users_row_changes_fieldsCampo_Valor: TStringField;
        SQLQuery_users_row_changes_fieldsCampo_Valor_OLD: TStringField;
        SQLQuery_users_row_changes_fieldsid: TLargeintField;
        SQLQuery_users_row_changes_fieldsid_terminales: TLargeintField;
        SQLQuery_users_row_changes_fieldsId_Users: TLargeintField;
        SQLQuery_users_row_changes_fieldsMomento: TDateTimeField;
        SQLQuery_users_row_changes_fieldsOT_Descripcion_Nick: TStringField;
        SQLQuery_users_row_changes_fieldstb: TStringField;

        procedure Cerramos_Tablas;
        procedure Cerramos_Tablas_Ligadas;
        procedure FormDestroy(Sender: TObject);
        procedure Refrescar_Registros_fields;
        procedure Refrescar_Registros;
        procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
        procedure DBNavigator2BeforeAction(Sender: TObject; Button: TDBNavButtonType);
        function  Filtrar_users_row_changes( param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
        function  Filtrar_users_row_changes_fields( param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
        procedure BitBtn_FiltrarClick(Sender: TObject);
        procedure Filtrar_tablas_ligadas;
        procedure CancelButtonClick(Sender: TObject);
        procedure DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
        procedure FormCreate(Sender: TObject);
        procedure OKButtonClick(Sender: TObject);
        procedure SQLQuery_users_row_changesAfterScroll(DataSet: TDataSet);
        procedure SQLQuery_users_row_changesCalcFields(DataSet: TDataSet);

    private
        { private declarations }
        private_Salir_OK        : Boolean;
        private_Order_By_fields : array of TOrder_By;

    public
        { public declarations }
        public_Pulso_Aceptar : Boolean;
        public_Order_By      : array of TOrder_By;

    end;

var
    Form_Estado_Registro: TForm_Estado_Registro;

implementation

{$R *.lfm}

uses dm_historico_registros, menu;

{ TForm_Estado_Registro }

procedure TForm_Estado_Registro.OKButtonClick(Sender: TObject);
begin
     private_Salir_OK     := True;
     public_Pulso_Aceptar := true;
end;

procedure TForm_Estado_Registro.SQLQuery_users_row_changesAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure TForm_Estado_Registro.SQLQuery_users_row_changesCalcFields(DataSet: TDataSet);
begin
    with SQLQuery_users_row_changes do
    begin
        if (FieldByName('Id_Users').Value = 0) or
           (FieldByName('Id_Users').IsNull)    then
             FieldByName('OT_Descripcion_Nick_Calc').AsString := 'SUPER USUARIO'
        else FieldByName('OT_Descripcion_Nick_Calc').AsString :=FieldByName('OT_Descripcion_Nick').AsString;
    end;
end;

procedure TForm_Estado_Registro.FormClose(Sender: TObject;
    var CloseAction: TCloseAction);
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
          Fue correcto el modo como quiere salir de la aplicación
          ******************************************************************** }
      end;
end;

procedure TForm_Estado_Registro.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := True;
    public_Pulso_Aceptar := false;
end;

procedure TForm_Estado_Registro.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
  if (key = 38) or (key=40) then key := 0;
end;

procedure TForm_Estado_Registro.FormCreate(Sender: TObject);
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
    if UTI_GEN_Form_Abierto_Ya('DataModule_historico_registros') = False then
    begin
        DataModule_historico_registros := TDataModule_historico_registros.Create(Application);
    end;

  { ****************************************************************************
    Preparamos los diferentes tipos de orden preconfigurados
    **************************************************************************** }
    SetLength(private_Order_By_fields, 1);

    private_Order_By_fields[0].Titulo       := 'Por rgtro.cambiado'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_fields[0].Memo_OrderBy := 'rf.tb ASC, rf.id ASC, rf.Momento ASC, rf.Id_Users ASC, rf.Campo_Nombre ASC';
end;

procedure TForm_Estado_Registro.BitBtn_FiltrarClick(Sender: TObject);
begin
    Filtrar_users_row_changes( 0,
                               true,
                               Memo_Filtros.Lines,
                               Memo_OrderBy.Lines );
end;

procedure TForm_Estado_Registro.DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
begin
    case Button of
        nbRefresh : begin
            Refrescar_Registros;
            Abort;
        end;
    end;
end;

procedure TForm_Estado_Registro.DBNavigator2BeforeAction(Sender: TObject; Button: TDBNavButtonType);
begin
    case Button of
        nbRefresh : begin
            Refrescar_Registros_fields;
            Abort;
        end;
    end;
end;

procedure TForm_Estado_Registro.Refrescar_Registros;
var var_tb       : String;
    var_id       : Int64;
    var_Momento  : TDateTime;
    var_Id_Users : Int64;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_tb       := '';
    var_id       := 0;
    var_Id_Users := 0;

    if SQLQuery_users_row_changes.RecordCount > 0 then
    begin
         var_tb       := SQLQuery_users_row_changes.FieldByName('tb').Value;
         var_id       := SQLQuery_users_row_changes.FieldByName('id').Value;
         var_Momento  := SQLQuery_users_row_changes.FieldByName('Momento').Value;
         var_Id_Users := SQLQuery_users_row_changes.FieldByName('Id_Users').Value;
    end;

    Filtrar_users_row_changes( 0,
                               false,
                               Memo_Filtros.Lines,
                               Memo_OrderBy.Lines );

    if Trim(var_tb) <> '' then
    begin
         SQLQuery_users_row_changes.Locate( 'tb;id;Momento;Id_Users',
                                            VarArrayOf( [ var_tb,
                                                          var_id,
                                                          var_Momento,
                                                          var_Id_Users ] ),
                                            [] );
    end;
end;

procedure TForm_Estado_Registro.Refrescar_Registros_fields;
var var_Buscar       : Boolean;
    var_tb           : String;
    var_id           : Int64;
    var_Momento      : TDateTime;
    var_Id_Users     : Int64;
    var_Campo_Nombre : String;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_Buscar := false;
    if SQLQuery_users_row_changes.RecordCount > 0 then
    begin
        var_Buscar        := true;
         var_tb           := SQLQuery_users_row_changes.FieldByName('tb').Value;
         var_id           := SQLQuery_users_row_changes.FieldByName('id').Value;
         var_Momento      := SQLQuery_users_row_changes.FieldByName('Momento').Value;
         var_Id_Users     := SQLQuery_users_row_changes.FieldByName('Id_Users').Value;
         var_Campo_Nombre := SQLQuery_users_row_changes.FieldByName('Campo_Nombre').Value;
    end;

    Filtrar_users_row_changes_fields( 0,
                                      false,
                                      Memo_Filtros.Lines,
                                      Memo_OrderBy.Lines );

    if var_Buscar = true then
    begin
         SQLQuery_users_row_changes.Locate( 'tb;id;Momento;Id_Users;Campo_Nombre',
                                            VarArrayOf( [ var_tb,
                                                          var_id,
                                                          var_Momento,
                                                          var_Id_Users,
                                                          var_Campo_Nombre ] ),
                                            [] );
    end;
end;

procedure TForm_Estado_Registro.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_historico_registros.SQLConnector,
                      DataModule_historico_registros.SQLTransaction,
                      SQLQuery_users_row_changes ) = false then UTI_GEN_Salir;

    DataModule_historico_registros.Free;
end;

procedure TForm_Estado_Registro.Cerramos_Tablas_Ligadas;
begin
    if UTI_TB_Cerrar( DataModule_historico_registros.SQLConnector1,
                      DataModule_historico_registros.SQLTransaction1,
                      SQLQuery_users_row_changes_fields ) = false then UTI_GEN_Salir;
end;

procedure TForm_Estado_Registro.FormDestroy(Sender: TObject);
begin
    Cerramos_Tablas;
end;

procedure TForm_Estado_Registro.Filtrar_tablas_ligadas;
var
  var_Lineas_Filtro  : TStrings;
  var_Lineas_OrderBy : TStrings;
  var_a_Filtrar_Plus : TStrings;
begin
  if SQLQuery_users_row_changes.RecordCount = 0 then Exit;

  if SQLQuery_users_row_changes.State = dsInsert then
  begin
      Cerramos_Tablas_Ligadas;
      Exit;
  end;

  var_Lineas_Filtro  := TStringList.Create;
  var_Lineas_OrderBy := TStringList.Create;
  var_a_Filtrar_Plus := TStringList.Create;

  // ********************************************************************************************* //
  // ** SQLQuery_users_row_changes                                                              ** //
  // ********************************************************************************************* //
  var_a_Filtrar_Plus.Clear;
  var_a_Filtrar_Plus.Add( 'rf.tb = ' + UTI_GEN_Comillas(SQLQuery_users_row_changes.FieldByName('tb').AsString) );
  UTI_TB_SQL_ADD( true,
                  var_Lineas_Filtro,
                  var_a_Filtrar_Plus );

  var_a_Filtrar_Plus.Clear;
  var_a_Filtrar_Plus.Add( 'rf.id = ' + SQLQuery_users_row_changes.FieldByName('id').AsString );
  UTI_TB_SQL_ADD( false,
                  var_Lineas_Filtro,
                  var_a_Filtrar_Plus );

  var_a_Filtrar_Plus.Clear;
  var_a_Filtrar_Plus.Add( 'rf.Id_Users = ' + SQLQuery_users_row_changes.FieldByName('Id_Users').AsString );
  UTI_TB_SQL_ADD( false,
                  var_Lineas_Filtro,
                  var_a_Filtrar_Plus );

  var_a_Filtrar_Plus.Clear;
  var_a_Filtrar_Plus.Add( 'rf.Momento = ' + UTI_GEN_Comillas(UTI_GEN_Format_Fecha_Hora(SQLQuery_users_row_changes.FieldByName('Momento').Value, True)) );
  UTI_TB_SQL_ADD( false,
                  var_Lineas_Filtro,
                  var_a_Filtrar_Plus );

  var_Lineas_OrderBy.Clear;

  Filtrar_users_row_changes_fields( 0,
                                    false,
                                    var_Lineas_Filtro,
                                    var_Lineas_OrderBy );

  var_Lineas_Filtro.Free;
  var_Lineas_OrderBy.Free;
  var_a_Filtrar_Plus.Free;
end;

function TForm_Estado_Registro.Filtrar_users_row_changes_fields( param_ver_bajas : ShortInt;
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
    param_Lineas_OrderBy.Text := private_Order_By_fields[0].Memo_OrderBy;;
  end;

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }
  Result := UTI_TB_Filtrar( private_Order_By_fields,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            '',

                            // Insert_SQL,
                            '',

                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_historico_registros.SQLTransaction1,
                            DataModule_historico_registros.SQLConnector1,
                            SQLQuery_users_row_changes_fields,

                            // name_tabla,
                            'rf',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT rf.*,' + ' ' +
                                   'u.Descripcion_Nick AS OT_Descripcion_Nick' + ' ' +
                            'FROM users_row_changes_fields rf' + ' ' +
                            'LEFT JOIN users u' + ' ' +
                            'ON rf.Id_Users = u.id' + ' ',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_a_Filtrar_Plus.Free;
end;

function TForm_Estado_Registro.Filtrar_users_row_changes( param_ver_bajas : ShortInt;
                                                          param_Cambiamos_Filtro : Boolean;
                                                          param_Lineas_Filtro,
                                                          param_Lineas_OrderBy : TStrings ) : ShortInt;
var
  var_a_Filtrar : TStrings;
begin
  var_a_Filtrar := TStringList.Create;
  var_a_Filtrar.Clear;

  if Trim(param_Lineas_OrderBy.Text) = '' then
    param_Lineas_OrderBy.Text := 'r.tb ASC, r.id ASC, r.Momento ASC, r.Id_Users ASC';

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  Result := UTI_TB_Filtrar( public_Order_By,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            '',

                            // Insert_SQL,
                            '',

                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_historico_registros.SQLTransaction,
                            DataModule_historico_registros.SQLConnector,
                            SQLQuery_users_row_changes,

                            // name_tabla,
                            'r',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT r.*,' + ' ' +
                                   'u.Descripcion_Nick AS OT_Descripcion_Nick' + ' ' +
                            'FROM users_row_changes AS r' + ' ' +

                            'LEFT JOIN users AS u' + ' ' +
                            'ON r.Id_Users = u.id' + ' ',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar,

                            param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  if SQLQuery_users_row_changes.RecordCount = 0 then
    Cerramos_Tablas_Ligadas;

  var_a_Filtrar.Free;
end;

end.


