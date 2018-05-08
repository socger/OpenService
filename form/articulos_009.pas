unit articulos_009;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ButtonPanel, StdCtrls, DbCtrls,
  utilidades_forms_Filtrar, utilidades_general, LCLTranslator;

resourcestring
  rs_FormClose_1 = '* La referencia o el código de barras.';
  rs_FormClose_2 = '* Si es una referencia o un código de barras.';

type

  { Tform_articulos_009 }

  Tform_articulos_009 = class(TForm)
    ButtonPanel1: TButtonPanel;
    DBEdit_eMail1: TDBEdit;
    DBEdit_CodigoBarras_Referencia: TDBEdit;
    DBRadioGroup_CodigoBarras_o_Referencia: TDBRadioGroup;
    GroupBox11: TGroupBox;
    Label62: TLabel;
    Label66: TLabel;
    Label67: TLabel;

    procedure Validacion( param_msg : TStrings );
    procedure CancelButtonClick(Sender: TObject);
    procedure no_Tocar;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure para_Empezar;
    procedure Presentar_Datos;
    procedure FormActivate(Sender: TObject);
    function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
    procedure FormCreate(Sender: TObject);

  private
      { private declarations }
      private_Salir_OK : Boolean;
  public
      { public declarations }
      public_Pulso_Aceptar : Boolean;
      public_Menu_Worked   : Integer;
      public_Solo_Ver      : Boolean;
      public_Record_Rgtro  : TRecord_Rgtro_Comun;
  end;

var
  form_articulos_009: Tform_articulos_009;

implementation

{$R *.lfm}

uses menu, articulos_000;

{ Tform_articulos_009 }

procedure Tform_articulos_009.FormActivate(Sender: TObject);
begin
    If form_articulos_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    Comprobar_No_Tocar(true, true);
end;

function Tform_articulos_009.Comprobar_No_Tocar( param_Reproducir_Mensajes,
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

procedure Tform_articulos_009.FormCreate(Sender: TObject);
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

procedure Tform_articulos_009.para_Empezar;
begin
    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    with form_articulos_000.SQLQuery_Articulos_Ref do
    begin
        public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                           '',
                                                           '',

                                                           FieldByName('CodigoBarras_o_Referencia').AsString,
                                                           FieldByName('CodigoBarras_Referencia').AsString,
                                                           '' );
    end;

    Presentar_Datos;
end;

procedure Tform_articulos_009.Presentar_Datos;
begin
    with form_articulos_000.SQLQuery_Articulos_Ref do
    begin
        // ***************************************************************************************** //
        // ** No hay nada que presentar                                                           ** //
        // ***************************************************************************************** //
    end;
end;

procedure Tform_articulos_009.Validacion( param_msg : TStrings );
begin
    with form_articulos_000.SQLQuery_Articulos_Ref do
    begin
        if Trim(FieldByName('CodigoBarras_Referencia').AsString) = '' then
        begin
            param_msg.Add(rs_FormClose_1);
        end;

        if Trim(FieldByName('CodigoBarras_o_Referencia').AsString) = '' then
        begin
            param_msg.Add(rs_FormClose_2);
        end;
    end;
end;

procedure Tform_articulos_009.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg : TStrings;
begin
    ButtonPanel1.SetFocus; // Con esto consigo que salga del campo que este y pueda actualizarlo

    var_msg := TStringList.Create;

    if public_Pulso_Aceptar = true then
    begin
        Validacion( var_msg );
    end;

    if private_Salir_OK = False then
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

procedure Tform_articulos_009.no_Tocar;
begin
    DBEdit_CodigoBarras_Referencia.Enabled         := False;
    DBRadioGroup_CodigoBarras_o_Referencia.Enabled := False;
end;

procedure Tform_articulos_009.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := true;
end;

procedure Tform_articulos_009.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := false;
end;

end.

