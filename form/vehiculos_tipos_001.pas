unit vehiculos_tipos_001;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ButtonPanel, StdCtrls, DbCtrls,
  db, utilidades_forms_Filtrar, utilidades_general;

type

  { Tform_vehiculos_tipos_001 }

  Tform_vehiculos_tipos_001 = class(TForm)
    ButtonPanel1: TButtonPanel;
    DBEdit_Descripcion: TDBEdit;
    DBEdit_eMail1: TDBEdit;
    GroupBox11: TGroupBox;
    Label1: TLabel;
    Label62: TLabel;

    procedure no_Tocar;
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
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
    public_Solo_Ver      : Boolean;
    public_Pulso_Aceptar : Boolean;
    public_Menu_Worked   : Integer;
    public_Record_Rgtro  : TRecord_Rgtro_Comun;
  end;

var
  form_vehiculos_tipos_001: Tform_vehiculos_tipos_001;

implementation

{$R *.lfm}

uses menu, vehiculos_tipos_000;

{ Tform_vehiculos_tipos_001 }

procedure Tform_vehiculos_tipos_001.FormActivate(Sender: TObject);
begin
    If form_vehiculos_tipos_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    Comprobar_No_Tocar(true, true);
end;

function Tform_vehiculos_tipos_001.Comprobar_No_Tocar( param_Reproducir_Mensajes,
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

procedure Tform_vehiculos_tipos_001.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg : TStrings;
begin
    ButtonPanel1.SetFocus; // Con esto consigo que salga del campo que este y pueda actualizarlo

    var_msg := TStringList.Create;

    if public_Pulso_Aceptar = true then
    begin
        with form_vehiculos_tipos_000.SQLQuery_Vehiculos_Tipos do
        begin
            if Trim(DBEdit_Descripcion.Text) <> '' then
                 FieldByName('descripcion').asString := AnsiUpperCase(Trim(FieldByName('descripcion').AsString))
            else var_msg.Add( '* La descripción');
        end;
    end;

    if private_Salir_OK = false then
    begin
        // ***************************************************************************************** //
        // ** Intento BitBtn_SALIR de la aplicación de un modo no permitido.
        // ***************************************************************************************** //
        // ** Pero si desde el menu principal está a true la variable public_Salir_Ok, significa  ** //
        // ** que hay que salir si o si pues se pulsó cancelar al preguntar otra vez la contraseña** //
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
                CloseAction := caNone;
            end
        else CloseAction := caFree;
    end;

    var_msg.Free;
end;

procedure Tform_vehiculos_tipos_001.FormCreate(Sender: TObject);
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

procedure Tform_vehiculos_tipos_001.para_Empezar;
begin
    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    with form_vehiculos_tipos_000.SQLQuery_Vehiculos_Tipos do
    begin
        public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                           '',
                                                           '',

                                                           FieldByName('descripcion').AsString,
                                                           '',
                                                           '' );
    end;

    Presentar_Datos;
end;

procedure Tform_vehiculos_tipos_001.Presentar_Datos;
begin
    // ********************************************************************************************* //
    // ** No hay nada que presentar                                                               ** //
    // ********************************************************************************************* //
end;

procedure Tform_vehiculos_tipos_001.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := true;
end;

procedure Tform_vehiculos_tipos_001.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := True;
    public_Pulso_Aceptar := false;
end;

procedure Tform_vehiculos_tipos_001.no_Tocar;
begin
    DBEdit_Descripcion.Enabled := False;
end;

end.

