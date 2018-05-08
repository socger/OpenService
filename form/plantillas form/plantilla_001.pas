unit plantilla_001;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, ButtonPanel, DbCtrls, db,
  utilidades_general, utilidades_usuarios, utilidades_forms_Filtrar;

resourcestring
  rs_filtros_001_001 = '* El módulo (id_menus) al que pertenece.';
  rs_filtros_001_002 = '* La descripción del campo del filtro.';
  rs_filtros_001_003 = '* El campo físico de la tabla por el que filtraremos.';
  rs_filtros_001_004 = 'Ficha - Filtro para módulo ';

type

  { Tform_plantilla_001 }

  Tform_plantilla_001 = class(TForm)

    ButtonPanel1: TButtonPanel;
    DBEdit_Id: TDBEdit;
    GroupBox_Registro: TGroupBox;
    GroupBox_Registro_Principal: TGroupBox;
    Label62: TLabel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel13: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel3: TPanel;
    Shape1: TShape;

    procedure CancelButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);

  private
    private_Salir_OK : Boolean;

    procedure Campo_Foco_en_modo_Edicion_Inserccion;
    procedure Cambiar_Estilo_Form;
    procedure Cambiar_WindowState;

  public
    public_Pulso_Aceptar : Boolean;
    public_Record_Rgtro  : TRecord_Rgtro_Comun;
    public_form          : TObject;

    procedure no_Tocar;
  end;

var
  form_plantilla_001: Tform_plantilla_001;

implementation

{$R *.lfm}

uses menu, plantilla_000;

{ Tform_plantilla_001 }

procedure Tform_plantilla_001.Cambiar_Estilo_Form;
begin
  with Self do
  begin
    Color       := $00C2C29E;
    Position    := poScreenCenter;
    BorderIcons := [];
    BorderStyle := bsSingle;
  end;

  Cambiar_WindowState;
end;

procedure Tform_plantilla_001.FormActivate(Sender: TObject);
begin
  Cambiar_Estilo_Form;
end;

procedure Tform_plantilla_001.no_Tocar;
begin
  GroupBox_Registro.Enabled := False;
end;

procedure Tform_plantilla_001.OKButtonClick(Sender: TObject);
begin
  private_Salir_OK     := true;
  public_Pulso_Aceptar := true;
end;

procedure Tform_plantilla_001.FormShow(Sender: TObject);
begin
  Campo_Foco_en_modo_Edicion_Inserccion;
end;

procedure Tform_plantilla_001.Campo_Foco_en_modo_Edicion_Inserccion;
begin
  Self.ActiveControl := GroupBox_Registro;
end;

procedure Tform_plantilla_001.CancelButtonClick(Sender: TObject);
begin
  private_Salir_OK     := true;
  public_Pulso_Aceptar := false;
end;

procedure Tform_plantilla_001.Cambiar_WindowState;
begin
  Self.WindowState := wsNormal; // Puede ser wsNormal, wsFullScreen, wsMaximized o wsMinimized
end;

procedure Tform_plantilla_001.FormCreate(Sender: TObject);
begin
  private_Salir_OK := false;
end;

procedure Tform_plantilla_001.FormClose( Sender: TObject;
                                         var CloseAction: TCloseAction );
var var_msg           : TStrings;
    var_msg_Comprobar : TStrings;
begin
  ButtonPanel1.SetFocus; // Con esto consigo que salga del campo que este y pueda actualizarlo

  var_msg := TStringList.Create;
  var_msg.Clear;

  var_msg_Comprobar := TStringList.Create;
  var_msg_Comprobar.Clear;

  if public_Pulso_Aceptar = true then
    var_msg_Comprobar.Clear;

  if private_Salir_OK = False then
  begin
    // ********************************************************************************************* //
    // ** Intento BitBtn_SALIR de la aplicación de un modo no permitido.
    // ********************************************************************************************* //
    // ** Pero si desde el menu principal está a true la variable public_Salir_Ok, significa que  ** //
    // ** hay que salir si o si pues se pulsó cancelar al preguntar otra vez por la contraseña    ** //
    // ********************************************************************************************* //
    if form_Menu.public_Salir_OK = False then CloseAction := caNone;
  end
  else
  begin
    // ********************************************************************************************* //
    // ** Fue correcto el modo como quiere salir de la aplicación                                 ** //
    // ********************************************************************************************* //
    // ** Comprobaremos si no se generó algún error por falta de completar algun campo y si se    ** //
    // ** salió con el botón Ok o Cancel                                                          ** //
    // ********************************************************************************************* //
    if (Trim(var_msg.Text) <> '') and (public_Pulso_Aceptar = true) then
    begin
      UTI_GEN_Aviso(true, var_msg, rs_Falta, True, False);
      CloseAction := caNone;
    end
    else
    begin
      CloseAction := caFree;
    end;
  end;

  var_msg.Free;
  var_msg_Comprobar.Free;
end;

end.

