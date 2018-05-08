unit recibos_001;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, Forms, Controls, Graphics, Dialogs, StdCtrls,
  MaskEdit, ButtonPanel, DbCtrls, Buttons, ExtCtrls, utilidades_general, utilidades_forms_Filtrar;

type

  { Tform_recibos_001 }

  Tform_recibos_001 = class(TForm)
    Boton_Elegir_Alumno: TBitBtn;
    Boton_Elegir_Empresa: TBitBtn;
    Boton_Elegir_Forma_Pago: TBitBtn;
    ButtonPanel1: TButtonPanel;
    DateTimePicker_Rcbo_Next: TDateTimePicker;
    Edit_Concepto_SEPA: TEdit;
    Edit_Descripcion_Alumno: TEdit;
    Edit_Descripcion_Empresa: TEdit;
    Edit_Descripcion_Forma_Pago: TEdit;
    Edit_id_Alumno: TEdit;
    Edit_id_Empresa: TEdit;
    Edit_id_Forma_Pago: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label45: TLabel;
    Panel_Mantenimiento: TPanel;

    procedure no_Tocar;
    procedure Boton_Elegir_AlumnoClick(Sender: TObject);
    function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
    procedure Boton_Elegir_EmpresaClick(Sender: TObject);
    procedure Boton_Elegir_Forma_PagoClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure Edit_Descripcion_AlumnoClick(Sender: TObject);
    procedure Edit_Descripcion_EmpresaClick(Sender: TObject);
    procedure Edit_Descripcion_Forma_PagoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure para_Empezar;
    procedure Presentar_Datos;
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
  form_recibos_001: Tform_recibos_001;

implementation

{$R *.lfm}

uses menu, recibos_000;

{ Tform_recibos_001 }

procedure Tform_recibos_001.FormActivate(Sender: TObject);
begin
    If form_recibos_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    Comprobar_No_Tocar(true, true);
end;

function Tform_recibos_001.Comprobar_No_Tocar( param_Reproducir_Mensajes,
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

procedure Tform_recibos_001.FormCreate(Sender: TObject);
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

procedure Tform_recibos_001.para_Empezar;
begin
    Presentar_Datos;
end;

procedure Tform_recibos_001.Presentar_Datos;
begin
    // ********************************************************************************************* //
    // ** DE MOMENTO NO TIENE CAMPOS PARA PRESENTAR                                               ** //
    // ********************************************************************************************* //
end;

procedure Tform_recibos_001.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg : TStrings;
begin
    ButtonPanel1.SetFocus; // Con esto consigo que salga del campo que este y pueda actualizarlo

    var_msg := TStringList.Create;

    if public_Pulso_Aceptar = true then
    begin
        if DateTimePicker_Rcbo_Next.DateIsNull then
        begin
            var_msg.Add( '* La fecha para el próximo recibo.');
        end;

        if Trim(Edit_id_Empresa.Text) = '' then
        begin
            var_msg.Add( '* La empresa que creará los recibos.');
        end;

        if Trim(Edit_Concepto_SEPA.Text) = '' then
        begin
            var_msg.Add( '* El concepto del recibo para el fichero SEPA.');
        end;
    end;

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
                    UTI_GEN_Aviso(true, var_msg, rs_Falta, True, False);
                    // var_msg.Free;
                    CloseAction := caNone;
                end
            else
                begin
                    // var_msg.Free;
                    CloseAction := caFree;
                end;
        end;

    var_msg.Free;
end;

procedure Tform_recibos_001.Boton_Elegir_Forma_PagoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Form( true, false, '', 80 );
    if var_Registro.id_1 <> '' then
    begin
         Edit_id_Forma_Pago.Text          := Trim(var_Registro.id_1);
         Edit_Descripcion_Forma_Pago.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_recibos_001.Edit_Descripcion_AlumnoClick(Sender: TObject);
begin
    Edit_id_Alumno.Text          := '';
    Edit_Descripcion_Alumno.Text := '';
end;

procedure Tform_recibos_001.Edit_Descripcion_EmpresaClick(Sender: TObject);
begin
    Edit_id_Empresa.Text          := '';
    Edit_Descripcion_Empresa.Text := '';
end;

procedure Tform_recibos_001.Boton_Elegir_AlumnoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Form( true, false, '', 330 );
    if var_Registro.id_1 <> '' then
    begin
         Edit_id_Alumno.Text          := Trim(var_Registro.id_1);
         Edit_Descripcion_Alumno.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_recibos_001.Boton_Elegir_EmpresaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Form( true, false, '', 250 );
    if var_Registro.id_1 <> '' then
    begin
         Edit_id_Empresa.Text          := Trim(var_Registro.id_1);
         Edit_Descripcion_Empresa.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_recibos_001.Edit_Descripcion_Forma_PagoClick(Sender: TObject);
begin
    Edit_id_Forma_Pago.Text          := '';
    Edit_Descripcion_Forma_Pago.Text := '';
end;

procedure Tform_recibos_001.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := true;
end;

procedure Tform_recibos_001.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := false;
end;

procedure Tform_recibos_001.no_Tocar;
begin
    Panel_Mantenimiento.Enabled := False;
end;

end.


