unit articulos_008;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ButtonPanel, StdCtrls, DbCtrls,
  Buttons, ExtCtrls, utilidades_forms_Filtrar, utilidades_general, LCLTranslator;

type

  { Tform_articulos_008 }

  Tform_articulos_008 = class(TForm)
    ButtonPanel1: TButtonPanel;
    DBEdit_Descripcion_para_terminal: TDBEdit;
    DBEdit_Descripcion_para_terminal1: TDBEdit;
    DBEdit_eMail1: TDBEdit;
    DBEdit_PVP: TDBEdit;
    DBEdit_PVP1: TDBEdit;
    DBEdit_PVP2: TDBEdit;
    DBEdit_PVP3: TDBEdit;
    DBEdit_PVP4: TDBEdit;
    DBMemo_Descripcion: TDBMemo;
    Edit_Descripcion_Familia: TEdit;
    GroupBox11: TGroupBox;
    Label1: TLabel;
    Label17: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label62: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Panel1: TPanel;
    Panel_Mantenimiento: TPanel;

    procedure Validacion( param_msg : TStrings );
    procedure CancelButtonClick(Sender: TObject);
    procedure no_Tocar;
    function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
    procedure OKButtonClick(Sender: TObject);
    procedure Presentar_Datos;
    procedure para_Empezar;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
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
  form_articulos_008: Tform_articulos_008;

implementation

{$R *.lfm}

uses menu, articulos_000;

{ Tform_articulos_008 }

procedure Tform_articulos_008.FormActivate(Sender: TObject);
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

function Tform_articulos_008.Comprobar_No_Tocar( param_Reproducir_Mensajes,
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

procedure Tform_articulos_008.Validacion( param_msg : TStrings );
begin
    with form_articulos_000.SQLQuery_Articulos_Stock do
    begin
        if Trim(FieldByName('Stock_Minimo').AsString) = '' then
        begin
             FieldByName('Stock_Minimo').AsString := '0';
        end;

        if Trim(FieldByName('Stock_Maximo').AsString) = '' then
        begin
             FieldByName('Stock_Maximo').AsString := '0';
        end;
    end;
end;

procedure Tform_articulos_008.FormClose( Sender: TObject;
                                         var CloseAction: TCloseAction );
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

procedure Tform_articulos_008.FormCreate(Sender: TObject);
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

procedure Tform_articulos_008.para_Empezar;
begin
    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    with form_articulos_000.SQLQuery_Articulos_Stock do
    begin
        public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                           FieldByName('Pendiente_Recibir').AsString,
                                                           FieldByName('Pendiente_Servir').AsString,

                                                           FieldByName('Stock').AsString,
                                                           FieldByName('Stock_Minimo').AsString,
                                                           FieldByName('Stock_Maximo').AsString );
    end;

    Presentar_Datos;
end;

procedure Tform_articulos_008.Presentar_Datos;
begin
    WITH form_articulos_000.SQLQuery_Articulos DO
    BEGIN
        Edit_Descripcion_Familia.Text := FieldByName('OT_descripcion_familia').AsString;
    END;
end;

procedure Tform_articulos_008.no_Tocar;
begin
    Panel_Mantenimiento.Enabled := False;
end;

procedure Tform_articulos_008.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := true;
end;

procedure Tform_articulos_008.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := false;
end;

end.


