unit bancos_empresas_001;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ButtonPanel, StdCtrls, DbCtrls,
  db, Buttons, utilidades_general, utilidades_forms_Filtrar, utilidades_contabilidad;

type

  { Tform_bancos_empresas_001 }

  Tform_bancos_empresas_001 = class(TForm)
    BitBtn_SMS: TBitBtn;
    Boton_Elegir_Cta_Bco_Pais: TBitBtn;
    Boton_Elegir_Cta_Bco_Poblacion: TBitBtn;
    Boton_Elegir_Cta_Bco_Provincia: TBitBtn;
    Boton_Elegir_Empresa: TBitBtn;
    Boton_ver_Direccion: TBitBtn;
    ButtonPanel1: TButtonPanel;
    DBEdit_Cta_Bco_BIC_SWIFT: TDBEdit;
    DBEdit_Cta_Bco_Cuenta: TDBEdit;
    DBEdit_Cta_Bco_Digito_Control: TDBEdit;
    DBEdit_Cta_Bco_Entidad: TDBEdit;
    DBEdit_Cta_Bco_IBAN: TDBEdit;
    DBEdit_Cta_Bco_Sucursal: TDBEdit;
    DBEdit_Cuenta_Contable: TDBEdit;
    DBEdit_DBEdit_Cta_Bco_Direccion: TDBEdit;
    DBEdit_DBEdit_Cta_Bco_Direccion_Codigo_Postal: TDBEdit;
    DBEdit_DBEdit_Cta_Bco_Direccion_Numero: TDBEdit;
    DBEdit_DBEdit_Cta_Bco_Direccion_Piso_Letra: TDBEdit;
    DBEdit_Descripcion: TDBEdit;
    DBEdit_eMail: TDBEdit;
    DBEdit_eMail1: TDBEdit;
    DBEdit_FAX: TDBEdit;
    DBEdit_Movil: TDBEdit;
    DBEdit_Responsable: TDBEdit;
    DBEdit_Tfno_Fijo_1: TDBEdit;
    DBEdit_Tfno_Fijo_2: TDBEdit;
    Edit_Cta_Bco_Descripcion_Pais: TEdit;
    Edit_Cta_Bco_Descripcion_Poblacion: TEdit;
    Edit_Cta_Bco_Descripcion_Provincia: TEdit;
    Edit_Descripcion_Empresa: TEdit;
    GroupBox1: TGroupBox;
    GroupBox11: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label62: TLabel;
    Label7: TLabel;

    procedure BitBtn_SMSClick(Sender: TObject);
    procedure Comprobar_Cuenta_IBAN(param_msg : TStrings);
    function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
    procedure Boton_Elegir_Cta_Bco_PaisClick(Sender: TObject);
    procedure Boton_Elegir_Cta_Bco_PoblacionClick(Sender: TObject);
    procedure Boton_Elegir_Cta_Bco_ProvinciaClick(Sender: TObject);
    procedure Boton_Elegir_EmpresaClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure DBEdit_DBEdit_Cta_Bco_DireccionChange(Sender: TObject);
    procedure DBEdit_ResponsableChange(Sender: TObject);
    procedure DBEdit_Tfno_Fijo_1Change(Sender: TObject);
    procedure Edit_Cta_Bco_Descripcion_PaisClick(Sender: TObject);
    procedure Edit_Cta_Bco_Descripcion_PoblacionClick(Sender: TObject);
    procedure Edit_Cta_Bco_Descripcion_ProvinciaClick(Sender: TObject);
    procedure Edit_Descripcion_EmpresaClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure Presentar_Datos;
    procedure para_Empezar;
    procedure FormCreate(Sender: TObject);
    procedure no_Tocar;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
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
  form_bancos_empresas_001: Tform_bancos_empresas_001;

implementation

{$R *.lfm}

uses menu, bancos_empresas_000;

{ Tform_bancos_empresas_001 }

procedure Tform_bancos_empresas_001.FormActivate(Sender: TObject);
begin
    If form_bancos_empresas_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    Comprobar_No_Tocar(true, true);
end;

function Tform_bancos_empresas_001.Comprobar_No_Tocar( param_Reproducir_Mensajes,
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

procedure Tform_bancos_empresas_001.no_Tocar;
begin
    DBEdit_Descripcion.Enabled                            := False;
    Boton_Elegir_Empresa.Enabled                          := False;
    Edit_Descripcion_Empresa.Enabled                      := False;
    DBEdit_Cta_Bco_Entidad.Enabled                        := False;
    DBEdit_Cta_Bco_Sucursal.Enabled                       := False;
    DBEdit_Cta_Bco_Digito_Control.Enabled                 := False;
    DBEdit_Cta_Bco_Cuenta.Enabled                         := False;
    DBEdit_Cta_Bco_BIC_SWIFT.Enabled                      := False;
    DBEdit_Cta_Bco_IBAN.Enabled                           := False;
    DBEdit_DBEdit_Cta_Bco_Direccion.Enabled               := False;
    DBEdit_DBEdit_Cta_Bco_Direccion_Numero.Enabled        := False;
    DBEdit_DBEdit_Cta_Bco_Direccion_Piso_Letra.Enabled    := False;
    DBEdit_DBEdit_Cta_Bco_Direccion_Codigo_Postal.Enabled := False;
    Boton_ver_Direccion.Enabled                           := False;
    Boton_Elegir_Cta_Bco_Poblacion.Enabled                := False;
    Edit_Cta_Bco_Descripcion_Poblacion.Enabled            := False;
    Boton_Elegir_Cta_Bco_Provincia.Enabled                := False;
    Edit_Cta_Bco_Descripcion_Provincia.Enabled            := False;
    Boton_Elegir_Cta_Bco_Pais.Enabled                     := False;
    Edit_Cta_Bco_Descripcion_Pais.Enabled                 := False;
    DBEdit_Responsable.Enabled                            := False;
    DBEdit_eMail.Enabled                                  := False;
    DBEdit_Tfno_Fijo_1.Enabled                            := False;
    DBEdit_Tfno_Fijo_2.Enabled                            := False;
    DBEdit_FAX.Enabled                                    := False;
    DBEdit_Movil.Enabled                                  := False;
    BitBtn_SMS.Enabled                                    := False;
end;

procedure Tform_bancos_empresas_001.FormCreate(Sender: TObject);
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

procedure Tform_bancos_empresas_001.para_Empezar;
begin
  { ****************************************************************************
    Solo para formularios que traten con datos
    **************************************************************************** }
    with form_bancos_empresas_000.SQLQuery_Bancos_Empresas do
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

procedure Tform_bancos_empresas_001.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := true;
end;

procedure Tform_bancos_empresas_001.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := True;
    public_Pulso_Aceptar := false;
end;

procedure Tform_bancos_empresas_001.DBEdit_DBEdit_Cta_Bco_DireccionChange(
  Sender: TObject);
begin

end;

procedure Tform_bancos_empresas_001.DBEdit_ResponsableChange(Sender: TObject);
begin

end;

procedure Tform_bancos_empresas_001.DBEdit_Tfno_Fijo_1Change(Sender: TObject);
begin

end;

procedure Tform_bancos_empresas_001.Edit_Cta_Bco_Descripcion_PaisClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS el PAIS');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_bancos_empresas_000.SQLQuery_Bancos_Empresas.FieldByName('id_paises').Clear;
         Edit_Cta_Bco_Descripcion_Pais.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_bancos_empresas_001.Edit_Cta_Bco_Descripcion_PoblacionClick(
  Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS la POBLACIÓN');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_bancos_empresas_000.SQLQuery_Bancos_Empresas.FieldByName('id_poblaciones').Clear;
         Edit_Cta_Bco_Descripcion_Poblacion.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_bancos_empresas_001.Edit_Cta_Bco_Descripcion_ProvinciaClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS la PROVINCIA');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_bancos_empresas_000.SQLQuery_Bancos_Empresas.FieldByName('id_provincias').Clear;
         Edit_Cta_Bco_Descripcion_Provincia.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_bancos_empresas_001.Edit_Descripcion_EmpresaClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS la EMPRESA');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_bancos_empresas_000.SQLQuery_Bancos_Empresas.FieldByName('id_empresas').Clear;
         Edit_Descripcion_Empresa.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_bancos_empresas_001.Boton_Elegir_EmpresaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_bancos_empresas_000.SQLQuery_Bancos_Empresas do
    begin
        var_Registro := UTI_Abrir_Form( true, false, '', 250 );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_empresas').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Empresa.Text       := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_bancos_empresas_001.Boton_Elegir_Cta_Bco_PoblacionClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_bancos_empresas_000.SQLQuery_Bancos_Empresas do
    begin
        var_Registro := UTI_Abrir_Form( true, false, '', 110 );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_poblaciones').AsString := Trim(var_Registro.id_1);
             FieldByName('id_provincias').AsString  := Trim(var_Registro.id_2);
             FieldByName('id_paises').AsString      := Trim(var_Registro.id_3);

             Edit_Cta_Bco_Descripcion_Poblacion.Text := var_Registro.descripcion_1;
             Edit_Cta_Bco_Descripcion_Provincia.Text := var_Registro.descripcion_2;
             Edit_Cta_Bco_Descripcion_Pais.Text      := var_Registro.descripcion_3;
        end;
    end;
end;

procedure Tform_bancos_empresas_001.Boton_Elegir_Cta_Bco_PaisClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_bancos_empresas_000.SQLQuery_Bancos_Empresas do
    begin
        var_Registro := UTI_Abrir_Form( true, false, '', 60 );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_paises').AsString  := Trim(var_Registro.id_1);
             Edit_Cta_Bco_Descripcion_Pais.Text := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_bancos_empresas_001.Boton_Elegir_Cta_Bco_ProvinciaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_bancos_empresas_000.SQLQuery_Bancos_Empresas do
    begin
        var_Registro := UTI_Abrir_Form( true, false, '', 100 );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_provincias').AsString := Trim(var_Registro.id_1);
             FieldByName('id_paises').AsString     := Trim(var_Registro.id_2);

             Edit_Cta_Bco_Descripcion_Provincia.Text := var_Registro.descripcion_1;
             Edit_Cta_Bco_Descripcion_Pais.Text      := var_Registro.descripcion_2;
        end;
    end;
end;

procedure Tform_bancos_empresas_001.Presentar_Datos;
begin
    with form_bancos_empresas_000.SQLQuery_Bancos_Empresas do
    begin
        Edit_Cta_Bco_Descripcion_Poblacion.Text := FieldByName('OT_descripcion_poblacion').AsString;
        Edit_Cta_Bco_Descripcion_Provincia.Text := FieldByName('OT_descripcion_provincia').AsString;
        Edit_Cta_Bco_Descripcion_Pais.Text      := FieldByName('OT_descripcion_pais').AsString;

        Edit_Descripcion_Empresa.Text           := FieldByName('OT_Descripcion_Empresa').AsString;
    end;
end;








procedure Tform_bancos_empresas_001.Comprobar_Cuenta_IBAN(param_msg : TStrings);
var var_Numero_Cuenta : ShortString;
    var_IBAN          : ShortString;
begin
  with form_bancos_empresas_000.SQLQuery_Bancos_Empresas do
  begin
    var_IBAN          := Trim(FieldByName('Cta_Bco_IBAN').AsString);

    var_Numero_Cuenta := Trim(FieldByName('Cta_Bco_Entidad').AsString) +
                         Trim(FieldByName('Cta_Bco_Sucursal').AsString) +
                         Trim(FieldByName('Cta_Bco_Digito_Control').AsString) +
                         Trim(FieldByName('Cta_Bco_Cuenta').AsString);

    if (Trim(var_IBAN) = '')          and
       (Trim(var_Numero_Cuenta) = '') then
    begin
      param_msg.Add('* Los 20 dígitos de la cuenta o el IBAN.');
    end;

    if Length(FieldByName('Cta_Bco_Entidad').AsString) <> 4 then
    begin
      param_msg.Add( '* Los dígitos del banco tienen que ser ' +
                     IntToStr(4) + ' no ' +
                     IntToStr(Length(FieldByName('Cta_Bco_Entidad').AsString)) );
    end;

    if Length(FieldByName('Cta_Bco_Sucursal').AsString) <> 6 then
    begin
      param_msg.Add( '* Los dígitos de la sucursal tienen que ser ' +
                     IntToStr(6) + ' no ' +
                     IntToStr(Length(FieldByName('Cta_Bco_Sucursal').AsString)) );
    end;

    if Length(FieldByName('Cta_Bco_Digito_Control').AsString) <> 2 then
    begin
      param_msg.Add( '* Los dígitos de control tienen que ser ' +
                     IntToStr(2) + ' no ' +
                     IntToStr(Length(FieldByName('Cta_Bco_Digito_Control').AsString)) );
    end;

    if Length(FieldByName('Cta_Bco_Cuenta').AsString) <> 8 then
    begin
      param_msg.Add( '* Los dígitos de la cuenta tienen que ser ' +
                     IntToStr(8) + ' no ' +
                     IntToStr(Length(FieldByName('Cta_Bco_Cuenta').AsString)) );
    end;

  end;
end;

procedure Tform_bancos_empresas_001.BitBtn_SMSClick(Sender: TObject);
begin
    UTI_GEN_Enviar_SMS;
end;

procedure Tform_bancos_empresas_001.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg : TStrings;
begin
    ButtonPanel1.SetFocus; // Con esto consigo que salga del campo que este y pueda actualizarlo

    var_msg := TStringList.Create;

    if public_Pulso_Aceptar = true then
    begin
        with form_bancos_empresas_000.SQLQuery_Bancos_Empresas do
        begin
            if Trim(DBEdit_Descripcion.Text) <> '' then
                 FieldByName('descripcion').asString := AnsiUpperCase(Trim(FieldByName('descripcion').AsString))
            else var_msg.Add( '* La descripción');

            if Trim(FieldByName('id_empresas').AsString) = '' then
            begin
                var_msg.Add( '* La empresa');
            end;

            Comprobar_Cuenta_IBAN(var_msg);

            UTI_CONTA_esta_Cta_Ctble_BIEN( form_menu.public_User_Configuracion.Bancos_Cuenta_Contable_SN,
                                           var_msg,
                                           form_bancos_empresas_000.SQLQuery_Bancos_Empresas,
                                           '',
                                           'bancos_empresas',
                                           'Cuenta_Contable',
                                           'LA CUENTA CONTABLE' );

        end;
    end;

    if private_Salir_OK = false then
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
                    CloseAction := caNone;
                end
            else CloseAction := caFree;
        end;

    var_msg.Free;
end;






end.


