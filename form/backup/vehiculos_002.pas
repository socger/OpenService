unit vehiculos_002;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ButtonPanel, StdCtrls, DbCtrls,
  db, ExtCtrls, Buttons, utilidades_forms_Filtrar, utilidades_general;

type

  { Tform_vehiculos_002 }

  Tform_vehiculos_002 = class(TForm)
    Boton_Elegir_Equipamiento: TBitBtn;
    ButtonPanel1: TButtonPanel;
    DBEdit_Codigo_Vehiculo: TDBEdit;
    DBEdit_eMail1: TDBEdit;
    DBEdit_Matricula: TDBEdit;
    DBEdit_Modelo: TDBEdit;
    DBEdit_Version: TDBEdit;
    Edit_Descripcion_Marca: TEdit;
    Edit_Descripcion_Tipo_Vehiculo: TEdit;
    Edit_Descripcion_Equipamiento: TEdit;
    GroupBox11: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label62: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    Panel_Mantenimiento: TPanel;

    procedure para_Empezar;
    procedure FormCreate(Sender: TObject);
    function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
    procedure no_Tocar;
    procedure Boton_Elegir_EquipamientoClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure Edit_Descripcion_EquipamientoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure Presentar_Datos;
    procedure FormActivate(Sender: TObject);

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
  form_vehiculos_002: Tform_vehiculos_002;

implementation

{$R *.lfm}

uses menu, vehiculos_000;

{ Tform_vehiculos_002 }

procedure Tform_vehiculos_002.FormActivate(Sender: TObject);
begin
    If form_vehiculos_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    Comprobar_No_Tocar(true, true);
end;

function Tform_vehiculos_002.Comprobar_No_Tocar( param_Reproducir_Mensajes,
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

procedure Tform_vehiculos_002.Presentar_Datos;
begin
    WITH form_vehiculos_000.SQLQuery_Vehiculos do
    BEGIN
        Edit_Descripcion_Tipo_Vehiculo.Text := FieldByName('OT_descripcion_vehiculos_tipos').AsString;
        Edit_Descripcion_Marca.Text         := FieldByName('OT_descripcion_vehiculos_marcas').AsString;
    END;

    WITH form_vehiculos_000.SQLQuery_Vehiculos_su_Equipamiento do
    BEGIN
        Edit_Descripcion_Equipamiento.Text := FieldByName('OT_descripcion_equipamiento').AsString;
    END;
end;

procedure Tform_vehiculos_002.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := True;
    public_Pulso_Aceptar := true;
end;

procedure Tform_vehiculos_002.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := True;
    public_Pulso_Aceptar := false;
end;

procedure Tform_vehiculos_002.Edit_Descripcion_EquipamientoClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS el EQUIPAMIENTO');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_vehiculos_000.SQLQuery_Vehiculos_su_Equipamiento.FieldByName('id_vehiculos_equipamientos').Clear;
         Edit_Descripcion_Equipamiento.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_vehiculos_002.Boton_Elegir_EquipamientoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_vehiculos_000.SQLQuery_Vehiculos_su_Equipamiento do
    begin
        var_Registro := UTI_Abrir_Modulo_VehiculosEquipamientos( true, false, 420, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_vehiculos_equipamientos').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Equipamiento.Text                 := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_vehiculos_002.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg : TStrings;
begin
    ButtonPanel1.SetFocus; // Con esto consigo que salga del campo que este y pueda actualizarlo

    var_msg := TStringList.Create;

    if public_Pulso_Aceptar = true then
    begin
        with form_vehiculos_000.SQLQuery_Vehiculos_su_Equipamiento do
        begin
            if Trim(FieldByName('id_vehiculos_equipamientos').AsString) = '' then
            begin
                var_msg.Add( '* El equipamiento.');
            end;
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
    end else begin
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
        end else begin
            // var_msg.Free;
            CloseAction := caFree;
        end;
    end;

    var_msg.Free;
end;

procedure Tform_vehiculos_002.no_Tocar;
begin
    Panel_Mantenimiento.Enabled := False;
end;

procedure Tform_vehiculos_002.FormCreate(Sender: TObject);
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
      end;

      private_Salir_OK := false;
    { **************************************************************************** }

    { ****************************************************************************
      Solo para formularios que traten con datos
      **************************************************************************** }
      public_Solo_Ver := false;
end;

procedure Tform_vehiculos_002.para_Empezar;
begin
    { ****************************************************************************
      Solo para formularios que traten con datos
      **************************************************************************** }
      with form_vehiculos_000.SQLQuery_Vehiculos_su_Equipamiento do
      begin
          public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                             '',
                                                             '',
                                                             '',
                                                             '',
                                                             '' );
      end;


      Presentar_Datos;
end;

end.


