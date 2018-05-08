unit users_006;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, Forms, Controls, Graphics, Dialogs, ButtonPanel,
  ExtCtrls, Buttons, StdCtrls, DbCtrls, utilidades_forms_Filtrar, utilidades_general,
  utilidades_usuarios;

type

  { Tform_users_006 }

  Tform_users_006 = class(TForm)
    Boton_Elegir_Usuario: TBitBtn;
    ButtonPanel1: TButtonPanel;
    ComboBox_Tipo_Usuario: TComboBox;
    Edit_Descripcion_Usuario: TEdit;
    Edit_id_Usuario: TEdit;
    Edit_Nick: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Panel_Mantenimiento: TPanel;

    procedure Boton_Elegir_UsuarioClick(Sender: TObject);
    function  Elegir_Usuario : TRecord_Rgtro_Comun;
    function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
    procedure Edit_Descripcion_UsuarioClick(Sender: TObject);
    procedure no_Tocar;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure Presentar_Datos;
    procedure para_Empezar;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { private declarations }
    private_Salir_OK : Boolean;
  public
    { public declarations }
    public_Pulso_Aceptar : Boolean;
    public_Menu_Worked   : Integer;
    public_Solo_Ver      : Boolean;
    // public_Record_Rgtro  : TRecord_Rgtro_Comun;
  end;

var
  form_users_006: Tform_users_006;

implementation

{$R *.lfm}

uses menu, users_000, users_005;

{ Tform_users_006 }

procedure Tform_users_006.FormActivate(Sender: TObject);
begin
    If Form_users_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    Comprobar_No_Tocar(true, true);
end;

function Tform_users_006.Comprobar_No_Tocar( param_Reproducir_Mensajes,
                                             param_Ejecutar_No_Tocar : Boolean ) : Boolean;
begin
    Result := false;

    // ********************************************************************************************* //
    // ** Si se llamó para solo verlo, pues no se puede tocar                                     ** //
    // ********************************************************************************************* //
    if public_Solo_Ver = true then
    begin
        Result := true;
        if param_Ejecutar_No_Tocar = true then no_Tocar;
    end;
end;

procedure Tform_users_006.FormCreate(Sender: TObject);
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
    public_Solo_Ver := false;
end;

procedure Tform_users_006.para_Empezar;
begin
    Presentar_Datos;
end;

procedure Tform_users_006.Presentar_Datos;
begin
    // ********************************************************************************************* //
    // ** DE MOMENTO NO TIENE CAMPOS PARA PRESENTAR                                               ** //
    // ********************************************************************************************* //
end;

procedure Tform_users_006.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg : TStrings;
begin
    // ********************************************************************************************* //
    // ** Con esto consigo que salga del campo que este y pueda actualizarlo                      ** //
    // ********************************************************************************************* //
    ButtonPanel1.SetFocus;

    var_msg := TStringList.Create;

    if public_Pulso_Aceptar = true then
    begin
        if Trim(Edit_Nick.Text) = '' then
        begin
            var_msg.Add( '* El nick del usuario nuevo a crear.');
        end;

        if Trim(ComboBox_Tipo_Usuario.Text) = '' then
        begin
            var_msg.Add( '* El tipo de usuario.');
        end;

        if Trim(Edit_id_Usuario.Text) = '' then
        begin
            var_msg.Add( '* El usuario desde el que vamos a copiar sus permisos.');
        end;
    end;

    if private_Salir_OK = False then
    begin
        // ***************************************************************************************** //
        // ** Intento BitBtn_SALIR de la aplicación de un modo no permitido.                      ** //
        // ***************************************************************************************** //
        // ** Pero si desde el menu principal está a true la variable public_Salir_Ok, significa  ** //
        // ** que hay que salir si o si pues se pulsó cancelar al preguntar otra vez por la pwd   ** //
        // ***************************************************************************************** //
        if form_Menu.public_Salir_OK = False then CloseAction := caNone;
    end else begin
        // ***************************************************************************************** //
        // ** Fue correcto el modo como quiere salir de la aplicación                             ** //
        // ***************************************************************************************** //
        // ** Comprobaremos si no se generó algún error por falta de completar algun campo y si se** //
        // ** salió con el botón Ok o Cancel                                                      ** //
        // ***************************************************************************************** //
        if (Trim(var_msg.Text) <> '') and (public_Pulso_Aceptar = true) then
        begin
            UTI_GEN_Aviso(true, var_msg, rs_Falta, True, False);
            // var_msg.Free;
            CloseAction := caNone;
        end else begin
            // var_msg.Free;
            CloseAction := caFree;
        end;
    end;

    var_msg.Free;
end;

procedure Tform_users_006.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := true;
end;

procedure Tform_users_006.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := false;
end;

procedure Tform_users_006.no_Tocar;
begin
    Panel_Mantenimiento.Enabled := False;
end;

procedure Tform_users_006.Boton_Elegir_UsuarioClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
    begin
        var_Registro := Elegir_Usuario;
        if var_Registro.id_1 <> '' then
        begin
             Edit_id_Usuario.Text          := Trim(var_Registro.id_1);
             Edit_Descripcion_Usuario.Text := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_users_006.Edit_Descripcion_UsuarioClick(Sender: TObject);
begin
    Edit_id_Usuario.Text          := '';
    Edit_Descripcion_Usuario.Text := '';
end;

function Tform_users_006.Elegir_Usuario : TRecord_Rgtro_Comun;
var var_msg : TStrings;
begin
    Result.id_1 := '';

    if UTI_GEN_Form_Abierto_Ya('form_users_005') = false then
    begin
        Application.CreateForm(Tform_users_005, form_users_005);

        form_users_005.public_Solo_Ver    := true;
        form_users_005.public_Elegimos    := true;
        form_users_005.public_Menu_Worked := public_Menu_Worked;

        form_users_005.para_Empezar;

        form_users_005.ShowModal;

        if form_users_005.public_Rgtro_Seleccionado = true then
        begin
            with form_users_005.SQLQuery_Users do
            begin
                Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                      '',
                                                      '',
                                                      FieldByName('Descripcion_Nick').AsString,
                                                      '',
                                                      '' );
            end;
        end;

        form_users_005.Free;
    end else begin
        var_msg := TStringList.Create;
        var_msg.Add(rs_Modulo_Abierto);
        UTI_GEN_Aviso(true, var_msg, 'AVISAMOS DE ... ', True, False);
        var_msg.Free;
        Exit;
    end;
end;

end.


