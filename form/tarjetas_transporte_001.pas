unit tarjetas_transporte_001;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DBDateTimePicker, Forms, Controls, Graphics, Dialogs, ButtonPanel, db,
  StdCtrls, DbCtrls, Buttons, utilidades_forms_Filtrar, utilidades_general;

type

  { Tform_tarjetas_transporte_001 }

  Tform_tarjetas_transporte_001 = class(TForm)
    Boton_Elegir_Empresa: TBitBtn;
    ButtonPanel1: TButtonPanel;
    DBDateTimePicker_Fecha_Autorizacion_Primera: TDBDateTimePicker;
    DBDateTimePicker_Fecha_Autorizacion_Ultima: TDBDateTimePicker;
    DBDateTimePicker_Fecha_Autorizacion_Proxima: TDBDateTimePicker;
    DBEdit_Descripcion: TDBEdit;
    DBEdit_Tjta_Ttte: TDBEdit;
    DBEdit_Ambito: TDBEdit;
    DBEdit_Numero_Copias: TDBEdit;
    DBEdit_eMail1: TDBEdit;
    Edit_Descripcion_Empresa: TEdit;
    GroupBox11: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label62: TLabel;

    procedure no_Tocar;
    procedure CancelButtonClick(Sender: TObject);
    function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
    procedure OKButtonClick(Sender: TObject);
    procedure Presentar_Datos;
    procedure para_Empezar;
    procedure Boton_Elegir_EmpresaClick(Sender: TObject);
    procedure Edit_Descripcion_EmpresaClick(Sender: TObject);
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
  form_tarjetas_transporte_001: Tform_tarjetas_transporte_001;

implementation

{$R *.lfm}

uses menu, tarjetas_transporte_000;

{ Tform_tarjetas_transporte_001 }

procedure Tform_tarjetas_transporte_001.FormActivate(Sender: TObject);
begin
    If form_tarjetas_transporte_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    Comprobar_No_Tocar(true, true);
end;

function Tform_tarjetas_transporte_001.Comprobar_No_Tocar( param_Reproducir_Mensajes,
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

procedure Tform_tarjetas_transporte_001.Boton_Elegir_EmpresaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_tarjetas_transporte_000.SQLQuery_TjtaTte do
    begin
        var_Registro := UTI_Abrir_Modulo_Empresas( true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_empresas').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Empresa.Text       := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_tarjetas_transporte_001.Edit_Descripcion_EmpresaClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS la EMPRESA');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_tarjetas_transporte_000.SQLQuery_TjtaTte.FieldByName('id_empresas').Clear;
         Edit_Descripcion_Empresa.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_tarjetas_transporte_001.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg : TStrings;
begin
    ButtonPanel1.SetFocus; // Con esto consigo que salga del campo que este y pueda actualizarlo

    var_msg := TStringList.Create;

    if public_Pulso_Aceptar = true then
    begin
        with form_tarjetas_transporte_000.SQLQuery_TjtaTte do
        begin
            if Trim(FieldByName('numero_tarjeta').asString) = '' then
            begin
                var_msg.Add( '* La descripción');
            end;

            if Trim(FieldByName('id_empresas').asString) = '' then
            begin
                var_msg.Add( '* La empresa');
            end;
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

procedure Tform_tarjetas_transporte_001.FormCreate(Sender: TObject);
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

procedure Tform_tarjetas_transporte_001.para_Empezar;
begin
    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    with form_tarjetas_transporte_000.SQLQuery_TjtaTte do
    begin
        public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                           '',
                                                           '',

                                                           FieldByName('numero_tarjeta').AsString,
                                                           FieldByName('ambito').AsString,
                                                           '' );
    end;

    Presentar_Datos;
end;

procedure Tform_tarjetas_transporte_001.Presentar_Datos;
begin
    // ********************************************************************************************* //
    // ** No hay nada que presentar                                                               ** //
    // ********************************************************************************************* //
end;

procedure Tform_tarjetas_transporte_001.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := true;
end;

procedure Tform_tarjetas_transporte_001.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := True;
    public_Pulso_Aceptar := false;
end;

procedure Tform_tarjetas_transporte_001.no_Tocar;
begin
    DBEdit_Tjta_Ttte.Enabled                            := False;
    DBEdit_Ambito.Enabled                               := False;
    DBEdit_Descripcion.Enabled                          := False;
    DBEdit_Numero_Copias.Enabled                        := False;
    DBDateTimePicker_Fecha_Autorizacion_Primera.Enabled := False;
    DBDateTimePicker_Fecha_Autorizacion_Ultima.Enabled  := False;
    DBDateTimePicker_Fecha_Autorizacion_Proxima.Enabled := False;
    Boton_Elegir_Empresa.Enabled                        := False;
    Edit_Descripcion_Empresa.Enabled                    := False;
end;

end.

