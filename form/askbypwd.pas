unit AskByPwd;

{$mode objfpc}{$H+}

interface

uses
    utilidades_general, utilidades_usuarios, Classes, SysUtils, FileUtil, Forms, Controls, Graphics,
    Dialogs, ExtCtrls, StdCtrls, Buttons, LCLTranslator;

resourcestring
  rs_RecogerParametros_1 = 'INTENTO ... ';
  rs_RecogerParametros_2 = ' DE ';

  rs_no_es_correcto = 'NO ES CORRECTO.-';


  rs_FormClose_1 = 'CONTRASEÑA INCORRECTA.';
  rs_FormClose_2 = 'El NICK del usuario no corresponde al que tiene guardado la contraseña introducida';

  rs_super_Usuario = 'SUPER USUARIO';

type

    { Tform_AskByPwd }

    Tform_AskByPwd = class(TForm)
        Aceptar: TBitBtn;
        Cancelar: TBitBtn;
        Edit_Contrasena: TEdit;
        Edit_Usuario: TEdit;
        Image1: TImage;
        Label1: TLabel;
        Label2: TLabel;
        Label_Intentos: TLabel;
        Label_Nombre_Usuario: TLabel;
        Label_Ultimo_USuario: TLabel;

        procedure RecogerParametros( param_Ctdad_Intentos_Tope, param_ctdad_veces : ShortInt );
        procedure Presentar_Datos;
        procedure Comprobar_PWD( param_msg_Por_No_Encontrarla : String; param_msg : TStrings );
        procedure AceptarClick(Sender: TObject);
        procedure CancelarClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
        procedure FormCreate(Sender: TObject);
    private
        { private declarations }
        private_Salir_OK            : Boolean;
        private_Ctdad_Intentos_Tope : ShortInt;
        private_Ctdad_Veces         : ShortInt;
    public
        { public declarations }
        public_Pulso_Aceptar : Boolean;
    end;

var
    form_AskByPwd: Tform_AskByPwd;

implementation

{$R *.lfm}

uses menu;

{ Tform_AskByPwd }

procedure Tform_AskByPwd.FormCreate(Sender: TObject);
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

          FormStyle   := fsStayOnTop;
          WindowState := wsMaximized;
      end;

      private_Salir_OK := false;

      Presentar_Datos;
end;

procedure Tform_AskByPwd.Presentar_Datos;
begin
    if Trim(form_Menu.public_User_Descripcion_Nick) <> '' then
       begin
            Label_Ultimo_USuario.Visible := True;
            Label_Nombre_Usuario.Caption := Trim(form_Menu.public_User_Descripcion_Nick);
       end
    else
        begin
             Label_Ultimo_USuario.Visible := False;
             Label_Nombre_Usuario.Caption := '';
        end;
end;

procedure Tform_AskByPwd.RecogerParametros( param_Ctdad_Intentos_Tope, param_ctdad_veces : ShortInt );
begin
    private_Ctdad_Intentos_Tope := param_Ctdad_Intentos_Tope;
    private_Ctdad_Veces         := param_ctdad_veces;

    Label_Intentos.Caption := rs_RecogerParametros_1 + Trim(IntToStr(private_Ctdad_Veces + 1)) +
                              rs_RecogerParametros_2 + Trim(IntToStr(private_Ctdad_Intentos_Tope));
end;

procedure Tform_AskByPwd.AceptarClick(Sender: TObject);
begin
    private_Salir_OK     := True;
    public_Pulso_Aceptar := true;
end;

procedure Tform_AskByPwd.CancelarClick(Sender: TObject);
begin
    private_Salir_OK     := True;
    public_Pulso_Aceptar := false;
end;

procedure Tform_AskByPwd.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;

    if public_Pulso_Aceptar = true then Comprobar_PWD( rs_FormClose_1, var_msg );

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
            ********************************************************************
            Comprobaremos si no se generó algún error por falta de completar
            algun campo y si se salió con el botón Ok o Cancel
            ******************************************************************** }
            if (Trim(var_msg.Text) <> '') and (public_Pulso_Aceptar = true) then
                begin
                    if Trim(var_msg.Text) = 'Obligado el código de usuario' then
                        begin
                            if Trim(Edit_Usuario.Text) = '' then
                                begin
                                    form_Menu.public_pwd := '';
                                    UTI_GEN_Aviso(true, var_msg, rs_no_es_correcto, True, False);
                                    CloseAction := caFree;
                                end
                            else
                                begin
                                    if Trim(form_Menu.public_User_Descripcion_Nick) = Trim(Edit_Usuario.Text) then
                                        CloseAction := caFree
                                    else
                                        begin
                                            form_Menu.public_pwd := '';
                                            var_msg.Text := rs_FormClose_2;
                                            UTI_GEN_Aviso(true,  var_msg, rs_no_es_correcto, True, False );
                                            CloseAction := caFree;
                                        end;
                                end;
                        end
                    else
                        begin
                            form_Menu.public_pwd := '';
                            UTI_GEN_Aviso(true, var_msg, rs_no_es_correcto, True, False);
                            CloseAction := caFree;
                        end;
                end
            else
                begin
                    // var_msg.Free;
                    CloseAction := caFree;
                end;
        end;

    var_msg.Free;
end;

procedure Tform_AskByPwd.Comprobar_PWD( param_msg_Por_No_Encontrarla : String;
                                        param_msg : TStrings );
var var_msg : ShortString;
begin
    param_msg.Clear;

    form_Menu.public_pwd := Trim(Edit_Contrasena.Text);

    if Trim(form_Menu.public_pwd) = Trim(form_Menu.public_User_Super) then
        begin
            form_Menu.public_User                  := 0;
            form_Menu.public_User_Descripcion_Nick := rs_super_Usuario;
            form_Menu.public_Password_Expira_SN    := false;
        end
    else
        begin
            var_msg := UTI_USR_WhoIs(form_Menu.public_pwd);
            if var_msg <> '' then
                begin
                    if var_msg = 'NO EXISTE' then
                         param_msg.Add(param_msg_Por_No_Encontrarla)
                    else param_msg.Add(var_msg);
                end
            else Edit_Usuario.Text := IntToStr(form_Menu.public_User);
        end;
end;

end.

