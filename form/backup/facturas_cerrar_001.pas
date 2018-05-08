unit facturas_cerrar_001;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DBDateTimePicker, Forms, Controls, Graphics, Dialogs, ButtonPanel,
  StdCtrls, DbCtrls, Buttons, ExtCtrls, utilidades_forms_Filtrar, utilidades_general;

type

  { Tform_facturas_cerrar_001 }

  Tform_facturas_cerrar_001 = class(TForm)
    Boton_Elegir_Empresa: TBitBtn;
    ButtonPanel1: TButtonPanel;
    DBDateTimePicker_Fecha: TDBDateTimePicker;
    DBDateTimePicker_Fecha1: TDBDateTimePicker;
    DBEdit_eMail1: TDBEdit;
    Edit_Descripcion_Empresa: TEdit;
    GroupBox11: TGroupBox;
    Label103: TLabel;
    Label104: TLabel;
    Label62: TLabel;
    Label75: TLabel;
    Label_tipo_de_facturas: TLabel;
    Panel_no_Tocar: TPanel;

    procedure Boton_Elegir_EmpresaClick(Sender: TObject);
    procedure Edit_Descripcion_EmpresaClick(Sender: TObject);
    procedure para_Empezar;
    procedure FormCreate(Sender: TObject);
    procedure no_Tocar;
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure Presentar_Datos;
    procedure FormActivate(Sender: TObject);
    function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);

  private
      { private declarations }
      private_Salir_OK : Boolean;
  public
      { public declarations }
      public_Solo_Ver      : Boolean;
      public_Menu_Worked   : Integer;
      public_Pulso_Aceptar : Boolean;
      public_Record_Rgtro  : TRecord_Rgtro_Comun;
  end;

var
  form_facturas_cerrar_001: Tform_facturas_cerrar_001;

implementation

{$R *.lfm}

uses menu, facturas_cerrar_000;

{ Tform_facturas_cerrar_001 }

procedure Tform_facturas_cerrar_001.FormActivate(Sender: TObject);
begin
    If form_facturas_cerrar_000.public_Elegimos = true then
    begin
         with Self do
         begin
              Color := $00B9959C;
         end;
    end;

    Comprobar_No_Tocar(true, true);
end;

function Tform_facturas_cerrar_001.Comprobar_No_Tocar( param_Reproducir_Mensajes,
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

procedure Tform_facturas_cerrar_001.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg : TStrings;
begin
    ButtonPanel1.SetFocus; // Con esto consigo que salga del campo que este y pueda actualizarlo

    var_msg := TStringList.Create;

    if public_Pulso_Aceptar = true then
    begin
        with form_facturas_cerrar_000.SQLQuery_Ftras_Cerrar do
        begin
            if FieldByName('id_empresas').IsNull then
            begin
                var_msg.Add( '* La empresa' );
            end;

            if FieldByName('Desde').IsNull then
            begin
                var_msg.Add( '* El DESDE del cierre' );
            end;

            if FieldByName('Hasta').IsNull then
            begin
                var_msg.Add( '* El HASTA del cierre' );
            end;
        end;
    end;

    if private_Salir_OK = false then
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
        // ** Intento BitBtn_SALIR de la aplicación de un modo no permitido.                      ** //
        // ***************************************************************************************** //
        // ** Fue correcto el modo como quiere salir de la aplicación                             ** //
        // ***************************************************************************************** //
        // ** Comprobaremos si no se generó algún error por falta de completar algun campo y si se** //
        // ** salió con el botón Ok o Cancel                                                      ** //
        // ***************************************************************************************** //
        if (Trim(var_msg.Text) <> '') and (public_Pulso_Aceptar = true) then
        begin
            UTI_GEN_Aviso(true, var_msg, rs_Falta, True, False);
            CloseAction := caNone;
        end else begin
            CloseAction := caFree;
        end;
    end;

    var_msg.Free;
end;

procedure Tform_facturas_cerrar_001.Presentar_Datos;
begin
    with form_facturas_cerrar_000.SQLQuery_Ftras_Cerrar do
    begin
        // ***************************************************************************************** //
        // ** NO HAY NADA QUE PRESENTAR                                                           ** //
        // ***************************************************************************************** //
        Edit_Descripcion_Empresa.Text := FieldByName('OT_Descripcion_empresa').AsString;
    end;
end;

procedure Tform_facturas_cerrar_001.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := true;
end;

procedure Tform_facturas_cerrar_001.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := True;
    public_Pulso_Aceptar := false;
end;

procedure Tform_facturas_cerrar_001.no_Tocar;
begin
    Panel_no_Tocar.Enabled := False;
end;

procedure Tform_facturas_cerrar_001.FormCreate(Sender: TObject);
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

procedure Tform_facturas_cerrar_001.para_Empezar;
begin
    Presentar_Datos;
end;

procedure Tform_facturas_cerrar_001.Boton_Elegir_EmpresaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_facturas_cerrar_000.SQLQuery_Ftras_Cerrar do
    begin
        var_Registro := UTI_Abrir_Modulo_Empresas( 250, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_empresas').AsString            := Trim(var_Registro.id_1);
             Edit_Descripcion_Empresa.Text                  := var_Registro.descripcion_1;
             FieldByName('OT_Descripcion_empresa').AsString := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_facturas_cerrar_001.Edit_Descripcion_EmpresaClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS la EMPRESA?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
        with form_facturas_cerrar_000.SQLQuery_Ftras_Cerrar do
        begin
            FieldByName('id_empresas').Clear;
            FieldByName('OT_Descripcion_empresa').Clear;
        end;

        Edit_Descripcion_Empresa.Text := '';
    end;
    var_msg.Free;
end;

end.

