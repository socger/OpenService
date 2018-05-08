unit facturas_ventas_004;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons, StdCtrls,
  utilidades_general;

type

  { Tform_facturas_ventas_004 }

  Tform_facturas_ventas_004 = class(TForm)
    BitBtn_SALIR: TBitBtn;
    BitBtn_Sin_Albaranes: TBitBtn;
    BitBtn_Con_Albaranes: TBitBtn;
    GroupBox_Elija_Tipo: TGroupBox;
    Label18: TLabel;
    Panel2: TPanel;
    RadioButton_Abono: TRadioButton;
    RadioButton_Factura: TRadioButton;

    procedure BitBtn_SALIRClick(Sender: TObject);
    procedure BitBtn_Sin_AlbaranesClick(Sender: TObject);
    procedure BitBtn_Con_AlbaranesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);

  private
    { private declarations }
    private_Salir_OK : Boolean;
  public
    { public declarations }
    public_opcion_Elegida : ShortInt;
  end;

var
  form_facturas_ventas_004: Tform_facturas_ventas_004;

implementation

{$R *.lfm}

uses menu;

{ Tform_facturas_ventas_004 }

procedure Tform_facturas_ventas_004.BitBtn_Con_AlbaranesClick
  (Sender: TObject);
begin
    public_opcion_Elegida := 1;
    private_Salir_OK      := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    Close;
end;

procedure Tform_facturas_ventas_004.BitBtn_Sin_AlbaranesClick
  (Sender: TObject);
begin
    public_opcion_Elegida := 2;
    private_Salir_OK      := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    Close;
end;

procedure Tform_facturas_ventas_004.FormCreate(Sender: TObject);
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
    // ** Solo para este modulo                                                                   ** //
    // ********************************************************************************************* //
    public_opcion_Elegida := 0;
end;

procedure Tform_facturas_ventas_004.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg : TStrings;
begin
    if private_Salir_OK = False then
    begin
        // ************************************************************************************* //
        // ** Intento BitBtn_SALIR de la aplicación de un modo no permitido.                  ** //
        // ************************************************************************************* //
        // Pero si desde el menu principal está a true la variable                            ** //
        // public_Salir_Ok, significa que hay que salir si o si pues se pulsó                 ** //
        // cancelar al preguntar otra vez por la contraseña                                   ** //
        // ************************************************************************************* //
        if form_Menu.public_Salir_OK = False then CloseAction := caNone;
    end else begin
        // ************************************************************************************* //
        // ** Fue correcto el modo como quiere BitBtn_SALIR de la aplicación                  ** //
        // ************************************************************************************* //
        if (RadioButton_Factura.Checked = false) and
           (RadioButton_Abono.Checked = false)   and
           (public_opcion_Elegida <> 0)          then
        begin
            var_msg := TStringList.Create;
            var_msg.Add( 'Tiene que elegir si va a ser una factura o un abono.' );
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;

            private_Salir_OK      := false;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
            public_opcion_Elegida := 0;
            CloseAction           := CloseAction.caNone;
        end;
    end;
end;

procedure Tform_facturas_ventas_004.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

end.

