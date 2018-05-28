unit personal_001;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ButtonPanel, Buttons, StdCtrls,
  db, utilidades_general, utilidades_forms_Filtrar, DbCtrls, utilidades_usuarios, ComCtrls, EditBtn,
  utilidades_contabilidad, DBExtCtrls, utilidades_bd;

type

  { Tform_personal_001 }

  Tform_personal_001 = class(TForm)
    BitBtn_eMAIL: TBitBtn;
    BitBtn_SMS: TBitBtn;
    Boton_Elegir_Cta_Bco_Pais: TBitBtn;
    Boton_Elegir_Cta_Bco_Poblacion: TBitBtn;
    Boton_Elegir_Cta_Bco_Provincia: TBitBtn;
    Boton_Elegir_Empleado_de1: TBitBtn;
    Boton_Elegir_Pais: TBitBtn;
    Boton_Elegir_Pais1: TBitBtn;
    Boton_Elegir_Poblacion: TBitBtn;
    Boton_Elegir_Tipo_Personal: TBitBtn;
    Boton_Elegir_Provincia: TBitBtn;
    Boton_Elegir_Provincia1: TBitBtn;
    Boton_Elegir_Empleado_de: TBitBtn;
    ButtonPanel1: TButtonPanel;
    DateEdit_Cta_Bco_Mandato_Fecha_de_Firma: TDateEdit;
    DateEdit_Fecha_Nacimiento: TDateEdit;
    DBCheckBox_Activar_Proximidad_SN: TDBCheckBox;
    DBCheckBox_Controlar_su_Presencia: TDBCheckBox;
    DBDateEdit_Caducidad_NIF: TDBDateEdit;
    DBEdit_Codigo_Postal: TDBEdit;
    DBEdit_Comision: TDBEdit;
    DBEdit_Cta_Bco_BIC_SWIFT: TDBEdit;
    DBEdit_Cta_Bco_Cuenta: TDBEdit;
    DBEdit_Cta_Bco_Digito_Control: TDBEdit;
    DBEdit_Cta_Bco_Entidad: TDBEdit;
    DBEdit_Cta_Bco_IBAN: TDBEdit;
    DBEdit_Seguridad_Social: TDBEdit;
    DBEdit_Cta_Bco_Mandato_Ref: TDBEdit;
    DBEdit_Cta_Bco_Sucursal: TDBEdit;
    DBEdit_Cuenta_Contable: TDBEdit;
    DBEdit_DBEdit_Cta_Bco_Direccion: TDBEdit;
    DBEdit_DBEdit_Cta_Bco_Direccion_Codigo_Postal: TDBEdit;
    DBEdit_DBEdit_Cta_Bco_Direccion_Numero: TDBEdit;
    DBEdit_DBEdit_Cta_Bco_Direccion_Piso_Letra: TDBEdit;
    DBEdit_Direccion: TDBEdit;
    DBEdit_Direccion_Numero: TDBEdit;
    DBEdit_Direccion_Piso_Letra: TDBEdit;
    DBEdit_eMail: TDBEdit;
    DBEdit_eMail1: TDBEdit;
    DBEdit_FAX: TDBEdit;
    DBEdit_Movil: TDBEdit;
    DBEdit_NIF_CIF: TDBEdit;
    DBEdit_nombre: TDBEdit;
    DBEdit_Tfno_Fijo_1: TDBEdit;
    DBEdit_Tfno_Fijo_2: TDBEdit;
    DBMemo_Observaciones_Comentarios: TDBMemo;
    Edit_Cta_Bco_Descripcion_Pais: TEdit;
    Edit_Cta_Bco_Descripcion_Poblacion: TEdit;
    Edit_Cta_Bco_Descripcion_Provincia: TEdit;
    Edit_Contrato_Empresa: TEdit;
    Edit_Contrato_Inicio: TEdit;
    Edit_Contrato_Fin: TEdit;
    Edit_Descripcion_Pais: TEdit;
    Edit_Descripcion_Poblacion: TEdit;
    Edit_Contrato_Descripcion: TEdit;
    Edit_Tipo_Personal: TEdit;
    Edit_Descripcion_Provincia: TEdit;
    Edit_Empleado_de: TEdit;
    GroupBox1: TGroupBox;
    GroupBox11: TGroupBox;
    GroupBox_Ultimo_Contrato: TGroupBox;
    GroupBox_NIF: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox6: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label4: TLabel;
    Label40: TLabel;
    Label5: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label6: TLabel;
    Label62: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label_Fecha: TLabel;
    Label_Fecha1: TLabel;

    procedure Llamar_Mantenimiento_Contratos;
    function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
    procedure Presentar_Ultimo_Contrato;
    procedure Boton_Elegir_Empleado_de1Click(Sender: TObject);
    procedure Boton_Elegir_Empleado_deClick(Sender: TObject);
    procedure Boton_Elegir_Tipo_PersonalClick(Sender: TObject);
    procedure Edit_Empleado_deClick(Sender: TObject);
    procedure Edit_Tipo_PersonalClick(Sender: TObject);
    procedure Presentar_Datos;
    procedure no_Tocar;
    procedure para_Empezar;
    procedure BitBtn_eMAILClick(Sender: TObject);
    procedure Actualizar_Campos_Fecha_Hora_Si_Completado( param_msg : TStrings );
    procedure Comprobar_Toda_Fecha_Hora( param_msg : TStrings );
    procedure BitBtn_SMSClick(Sender: TObject);
    procedure Boton_Elegir_Cta_Bco_PaisClick(Sender: TObject);
    procedure Boton_Elegir_Cta_Bco_PoblacionClick(Sender: TObject);
    procedure Boton_Elegir_Cta_Bco_ProvinciaClick(Sender: TObject);
    procedure Boton_Elegir_PaisClick(Sender: TObject);
    procedure Boton_Elegir_PoblacionClick(Sender: TObject);
    procedure Boton_Elegir_ProvinciaClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure Edit_Cta_Bco_Descripcion_PaisClick(Sender: TObject);
    procedure Edit_Cta_Bco_Descripcion_PoblacionClick(Sender: TObject);
    procedure Edit_Cta_Bco_Descripcion_ProvinciaClick(Sender: TObject);
    procedure Edit_Descripcion_PaisClick(Sender: TObject);
    procedure Edit_Descripcion_PoblacionClick(Sender: TObject);
    procedure Edit_Descripcion_ProvinciaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
  private
      { private declarations }
      private_Salir_OK          : Boolean;
      private_Cta_Ctble_elegida : String;
  public
      { public declarations }
      public_Solo_Ver      : Boolean;
      public_Menu_Worked   : Integer;
      public_Pulso_Aceptar : Boolean;
      public_Record_Rgtro  : TRecord_Rgtro_Comun;
  end;

var
  form_personal_001: Tform_personal_001;

implementation

{$R *.lfm}

uses menu, personal_000, personal_contratos_000;

{ Tform_personal_001 }

procedure Tform_personal_001.FormActivate(Sender: TObject);
begin
    If form_personal_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    Comprobar_No_Tocar(true, true);
end;

function Tform_personal_001.Comprobar_No_Tocar( param_Reproducir_Mensajes,
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

procedure Tform_personal_001.FormCreate(Sender: TObject);
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

    { ****************************************************************************
      Solo para formularios que traten con datos
      **************************************************************************** }
      public_Solo_Ver := false;

      // ********************************************************************************************* //
      // ** Solo para este formulario                                                               ** //
      // ********************************************************************************************* //
      private_Cta_Ctble_elegida := Trim(form_personal_000.SQLQuery_Personal.FieldByName('OT_Cuenta_Contable_personal_tipo').AsString);
end;

procedure Tform_personal_001.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg : TStrings;
begin
    ButtonPanel1.SetFocus; // Con esto consigo que salga del campo que este y pueda actualizarlo

    var_msg := TStringList.Create;

    if public_Pulso_Aceptar = true then
    begin
        with form_personal_000.SQLQuery_Personal do
        begin
            Comprobar_Toda_Fecha_Hora(var_msg);

            if Trim(FieldByName('nombre').AsString) = '' then
            begin
                var_msg.Add( '* El nombre.');
            end;

            if Trim(FieldByName('Direccion').AsString) = '' then
            begin
                var_msg.Add( '* La dirección.');
            end;

            if Trim(FieldByName('id_poblaciones').AsString) = '' then
            begin
                var_msg.Add( '* La población.');
            end;

            if Trim(FieldByName('id_provincias').AsString) = '' then
            begin
                var_msg.Add( '* La provincia.');
            end;

            if Trim(FieldByName('id_paises').AsString) = '' then
            begin
                var_msg.Add( '* El país.');
            end;

            if Trim(FieldByName('id_personal_familias').AsString) = '' then
            begin
                var_msg.Add( '* El tipo de personal.');
            end;

            if Trim(FieldByName('Activar_Proximidad_SN').AsString) = '' then
            begin
                var_msg.Add( '* Con actividad de proximidad (Si/No).');
            end;

            if Trim(FieldByName('Controlar_su_Presencia').AsString) = '' then
            begin
                var_msg.Add( '* Controlar su PRESENCIA (Si/No).');
            end;

            form_Menu.Traer_Configuracion_APP;

            UTI_CONTA_esta_NIF_BIEN( form_menu.public_User_Configuracion.Personal_Obligar_NIF_SN,  //.... aqui tambien permitir el control de exigirlo o no
                                     var_msg,
                                     form_personal_000.SQLQuery_Personal,
                                     'personal' );

            UTI_CONTA_esta_Cta_Ctble_BIEN( form_menu.public_User_Configuracion.Personal_Obligar_Cuenta_Contable_SN, //.... aqui tambien permitir el control de exigirlo o no
                                           var_msg,
                                           form_personal_000.SQLQuery_Personal,
                                           private_Cta_Ctble_elegida,
                                           'personal',
                                           'Cuenta_Contable',
                                           'LA CUENTA CONTABLE' );
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


procedure Tform_personal_001.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := True;
    public_Pulso_Aceptar := false;
end;

procedure Tform_personal_001.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := True;
    public_Pulso_Aceptar := true;
end;

procedure Tform_personal_001.Edit_Descripcion_PaisClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS el PAIS');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_personal_000.SQLQuery_Personal.FieldByName('id_paises').Clear;
         Edit_Descripcion_Pais.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_personal_001.Edit_Descripcion_ProvinciaClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS la PROVINCIA');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_personal_000.SQLQuery_Personal.FieldByName('id_provincias').Clear;
         Edit_Descripcion_Provincia.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_personal_001.Edit_Descripcion_PoblacionClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS la POBLACIÓN');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_personal_000.SQLQuery_Personal.FieldByName('id_poblaciones').Clear;
         Edit_Descripcion_Poblacion.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_personal_001.Boton_Elegir_PaisClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_personal_000.SQLQuery_Personal do
    begin
        var_Registro := UTI_Abrir_Modulo_Paises( true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_paises').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Pais.Text        := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_personal_001.Boton_Elegir_PoblacionClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_personal_000.SQLQuery_Personal do
    begin
        var_Registro := UTI_Abrir_Modulo_Poblaciones( true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_poblaciones').AsString := Trim(var_Registro.id_1);
             FieldByName('id_provincias').AsString  := Trim(var_Registro.id_2);
             FieldByName('id_paises').AsString      := Trim(var_Registro.id_3);

             Edit_Descripcion_Poblacion.Text        := var_Registro.descripcion_1;
             Edit_Descripcion_Provincia.Text        := var_Registro.descripcion_2;
             Edit_Descripcion_Pais.Text             := var_Registro.descripcion_3;
        end;
    end;
end;

procedure Tform_personal_001.Boton_Elegir_ProvinciaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_personal_000.SQLQuery_Personal do
    begin
        var_Registro := UTI_Abrir_Modulo_Provincias( true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_provincias').AsString := Trim(var_Registro.id_1);
             FieldByName('id_paises').AsString     := Trim(var_Registro.id_2);
             Edit_Descripcion_Provincia.Text       := var_Registro.descripcion_1;
             Edit_Descripcion_Pais.Text            := var_Registro.descripcion_2;
        end;
    end;
end;


procedure Tform_personal_001.Edit_Cta_Bco_Descripcion_PoblacionClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS la POBLACIÓN del banco?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_personal_000.SQLQuery_Personal.FieldByName('id_Cta_Bco_poblaciones').Clear;
         Edit_Cta_Bco_Descripcion_Poblacion.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_personal_001.Edit_Cta_Bco_Descripcion_ProvinciaClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS la PROVINCIA del banco?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_personal_000.SQLQuery_Personal.FieldByName('id_Cta_Bco_provincias').Clear;
         Edit_Cta_Bco_Descripcion_Provincia.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_personal_001.Edit_Cta_Bco_Descripcion_PaisClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS el PAIS del banco?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_personal_000.SQLQuery_Personal.FieldByName('id_Cta_Bco_pais').Clear;
         Edit_Cta_Bco_Descripcion_Pais.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_personal_001.Boton_Elegir_Cta_Bco_PoblacionClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_personal_000.SQLQuery_Personal do
    begin
        var_Registro := UTI_Abrir_Modulo_Poblaciones( true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_Cta_Bco_poblaciones').AsString := Trim(var_Registro.id_1);
             FieldByName('id_Cta_Bco_provincias').AsString  := Trim(var_Registro.id_2);
             FieldByName('id_Cta_Bco_pais').AsString        := Trim(var_Registro.id_3);
             Edit_Cta_Bco_Descripcion_Poblacion.Text        := var_Registro.descripcion_1;
             Edit_Cta_Bco_Descripcion_Provincia.Text        := var_Registro.descripcion_2;
             Edit_Cta_Bco_Descripcion_Pais.Text             := var_Registro.descripcion_3;
        end;
    end;
end;

procedure Tform_personal_001.Boton_Elegir_Cta_Bco_ProvinciaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_personal_000.SQLQuery_Personal do
    begin
        var_Registro := UTI_Abrir_Modulo_Provincias( true, false, 100, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_Cta_Bco_provincias').AsString := Trim(var_Registro.id_1);
             FieldByName('id_Cta_Bco_pais').AsString       := Trim(var_Registro.id_2);
             Edit_Cta_Bco_Descripcion_Provincia.Text       := var_Registro.descripcion_1;
             Edit_Cta_Bco_Descripcion_Pais.Text            := var_Registro.descripcion_2;
        end;
    end;
end;

procedure Tform_personal_001.Boton_Elegir_Cta_Bco_PaisClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_personal_000.SQLQuery_Personal do
    begin
        var_Registro := UTI_Abrir_Modulo_Paises( true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_Cta_Bco_pais').AsString := Trim(var_Registro.id_1);
             Edit_Cta_Bco_Descripcion_Pais.Text      := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_personal_001.BitBtn_SMSClick(Sender: TObject);
begin
    UTI_GEN_Enviar_SMS;
end;

procedure Tform_personal_001.Comprobar_Toda_Fecha_Hora( param_msg : TStrings );
var var_msg : TStrings;
begin
    Actualizar_Campos_Fecha_Hora_Si_Completado(param_msg);

  { ************************************************************************************************
    ** COMPROBAR CUALES SON OBLIGADOS O DE SÓLO AVISO                                             **
    ************************************************************************************************ }
  { ** Cuando un campo de fecha o hora es de introducción obligatoria                             **
    ************************************************************************************************
    if DateEdit_Fecha_Nacimiento.Text  = '  /  /    ' then
    begin
         param_msg.Add( '* La fecha de nacimiento de quien facturamos' );
    end;

    ************************************************************************************************
    ** Cuando un campo de fecha o hora es de solo aviso, pero no introducción obligatoria         **
    ************************************************************************************************
    if DateEdit_Fecha_Nacimiento.Text  = '  /  /    ' then
    begin
         var_msg := TStringList.Create;
         var_msg.Add('** NO SE HA INTRODUCIDO LA FECHA DE NACIMIENTO DE QUIEN FACTURAMOS ** ');
         UTI_GEN_Aviso(true, var_msg, 'AVISAMOS DE ... ', True, False);
         var_msg.Free;
    end; }
end;

procedure Tform_personal_001.Actualizar_Campos_Fecha_Hora_Si_Completado( param_msg : TStrings );
var var_Fecha_Hora : ShortString;
begin
    WITH form_personal_000.SQLQuery_Personal DO
    BEGIN
      { ********************************************************************************************
        ** FECHA DE NACIMIENTO                                                                    **
        ******************************************************************************************** }
        var_Fecha_Hora := '';
        if DateEdit_Fecha_Nacimiento.Text <> '  /  /    ' then
        begin
             var_Fecha_Hora := DateEdit_Fecha_Nacimiento.Text;
        end;

      { ********************************************************************************************
        ** Por si tiene control de hora                                                           **
        ********************************************************************************************
        if MaskEdit_Hora_Inicio.Text <> '  :  :  '     then
        begin
            if var_Fecha_Hora <> '' then
                 var_Fecha_Hora := var_Fecha_Hora + ' ' + MaskEdit_Hora_Inicio.Text
            else var_Fecha_Hora := MaskEdit_Hora_Inicio.Text;
        end; }

        Try
            if var_Fecha_Hora <> '' then
                 FieldByName('Fecha_Nacimiento').AsString := var_Fecha_Hora
            else FieldByName('Fecha_Nacimiento').Clear;
        Except
            param_msg.Add('** ERROR en el campo FECHA DE NACIMIENTO **');
        end;

      { ********************************************************************************************
        ** FECHA DE FIRMA DEL MANDATO DE DATOS BANCARIOS                                          **
        ******************************************************************************************** }
        var_Fecha_Hora := '';
        if DateEdit_Cta_Bco_Mandato_Fecha_de_Firma.Text <> '  /  /    ' then
        begin
             var_Fecha_Hora := DateEdit_Cta_Bco_Mandato_Fecha_de_Firma.Text;
        end;

      { ********************************************************************************************
        ** Por si tiene control de hora                                                           **
        ********************************************************************************************
        if MaskEdit_Hora_Inicio.Text <> '  :  :  '     then
        begin
            if var_Fecha_Hora <> '' then
                 var_Fecha_Hora := var_Fecha_Hora + ' ' + MaskEdit_Hora_Inicio.Text
            else var_Fecha_Hora := MaskEdit_Hora_Inicio.Text;
        end; }

        Try
            if var_Fecha_Hora <> '' then
                 FieldByName('Cta_Bco_Mandato_Fecha_de_Firma').AsString := var_Fecha_Hora
            else FieldByName('Cta_Bco_Mandato_Fecha_de_Firma').Clear;
        Except
            param_msg.Add('** ERROR en el campo FECHA DE FIRMA del mandato de los datos bancarios **');
        end;
    END;
end;

procedure Tform_personal_001.BitBtn_eMAILClick(Sender: TObject);
begin
      UTI_GEN_Enviar_eMAIL;
end;

procedure Tform_personal_001.para_Empezar;
begin
    { ****************************************************************************
      Solo para formularios que traten con datos
      **************************************************************************** }
      with form_personal_000.SQLQuery_Personal do
      begin
          public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                             '',
                                                             '',

                                                             FieldByName('nombre').AsString,
                                                             FieldByName('nif_cif').AsString,
                                                             '' );
      end;

      Presentar_Datos;

    { ****************************************************************************
      SOLO PARA ESTE FORM
      **************************************************************************** }
end;

procedure Tform_personal_001.no_Tocar;
begin
    DBEdit_nombre.Enabled                                 := False;
    DBEdit_Direccion.Enabled                              := False;
    DBEdit_Direccion_Numero.Enabled                       := False;
    DBEdit_Direccion_Piso_Letra.Enabled                   := False;
    DBEdit_Codigo_Postal.Enabled                          := False;
    Boton_Elegir_Poblacion.Enabled                        := False;
    Edit_Descripcion_Poblacion.Enabled                    := False;
    Boton_Elegir_Provincia.Enabled                        := False;
    Edit_Descripcion_Provincia.Enabled                    := False;
    Boton_Elegir_Pais.Enabled                             := False;
    Edit_Descripcion_Pais.Enabled                         := False;
    DBEdit_Tfno_Fijo_1.Enabled                            := False;
    DBEdit_Tfno_Fijo_2.Enabled                            := False;
    DBEdit_FAX.Enabled                                    := False;
    BitBtn_SMS.Enabled                                    := False;
    DBEdit_Movil.Enabled                                  := False;

    DateEdit_Fecha_Nacimiento.Enabled                     := False;
    DBEdit_eMail.Enabled                                  := False;
    DBEdit_Cuenta_Contable.Enabled                        := False;
    DBMemo_Observaciones_Comentarios.Enabled              := False;

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
    DateEdit_Cta_Bco_Mandato_Fecha_de_Firma.Enabled       := False;
    DBEdit_Cta_Bco_Mandato_Ref.Enabled                    := False;

    DBCheckBox_Activar_Proximidad_SN.Enabled              := False;

    GroupBox_NIF.Enabled                                  := False;
    DBEdit_Comision.Enabled                               := False;
    DBCheckBox_Controlar_su_Presencia.Enabled             := False;
    GroupBox_Ultimo_Contrato.Enabled                      := False;

    DBEdit_Seguridad_Social.Enabled                       := False;

    Boton_Elegir_Tipo_Personal.Enabled                    := False;
    Edit_Tipo_Personal.Enabled                            := False;

    Boton_Elegir_Empleado_de.Enabled                      := False;
    Edit_Empleado_de.Enabled                              := False;
end;

procedure Tform_personal_001.Boton_Elegir_Tipo_PersonalClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_personal_000.SQLQuery_Personal do
    begin
        var_Registro := UTI_Abrir_Modulo_FamiliasPersonal( true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_personal_familias').AsString := Trim(var_Registro.id_1);
             Edit_Tipo_Personal.Text                      := var_Registro.descripcion_1;
             private_Cta_Ctble_elegida                    := var_Registro.descripcion_3;

             if Trim(FieldByName('Cuenta_Contable').AsString) = '' then
             begin
                 FieldByName('Cuenta_Contable').Value := var_Registro.descripcion_2;
             end;
        end;
    end;
end;

procedure Tform_personal_001.Edit_Tipo_PersonalClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS el TIPO DE PERSONAL');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_personal_000.SQLQuery_Personal.FieldByName('id_personal_familias').Clear;
         Edit_Tipo_Personal.Text   := '';
         private_Cta_Ctble_elegida := '';
    end;
    var_msg.Free;
end;

procedure Tform_personal_001.Edit_Empleado_deClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS el EMPLEADO DE ...?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_personal_000.SQLQuery_Personal.FieldByName('id_Empleado_de').Clear;
         Edit_Empleado_de.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_personal_001.Boton_Elegir_Empleado_deClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_personal_000.SQLQuery_Personal do
    begin
        var_Registro := UTI_Abrir_Modulo_Proveedores( true, false, '1' ); // Leera del proveedores / acreedores
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_Empleado_de').AsString := Trim(var_Registro.id_1);
             Edit_Empleado_de.Text                  := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_personal_001.Boton_Elegir_Empleado_de1Click(Sender: TObject);
begin
    Llamar_Mantenimiento_Contratos;
end;

procedure Tform_personal_001.Presentar_Datos;
var var_Hora : tTime;
    var_Dia  : tDate;
begin
    with form_personal_000.SQLQuery_Personal do
    begin
        Presentar_Ultimo_Contrato;

        // ***************************************************************************************** //
        // ** Continuamos con el resto de cosas a traer                                           ** //
        // ***************************************************************************************** //
        Edit_Tipo_Personal.Text                  := FieldByName('OT_Descripcion_Personal_Familias').AsString;
        Edit_Empleado_de.Text                    := FieldByName('OT_Descripcion_Empleado_De').AsString;

        Edit_Descripcion_Poblacion.Text          := FieldByName('OT_descripcion_poblacion').AsString;
        Edit_Descripcion_Provincia.Text          := FieldByName('OT_descripcion_provincia').AsString;
        Edit_Descripcion_Pais.Text               := FieldByName('OT_descripcion_pais').AsString;

        Edit_Cta_Bco_Descripcion_Poblacion.Text  := FieldByName('OT_Cta_Bco_descripcion_poblacion').AsString;
        Edit_Cta_Bco_Descripcion_Provincia.Text  := FieldByName('OT_Cta_Bco_descripcion_provincia').AsString;
        Edit_Cta_Bco_Descripcion_Pais.Text       := FieldByName('OT_Cta_Bco_descripcion_pais').AsString;

        if not FieldByName('Fecha_Nacimiento').IsNull then
        begin
            var_Dia                        := FieldByName('Fecha_Nacimiento').AsDateTime;
            DateEdit_Fecha_Nacimiento.Text := DateToStr(var_Dia);
        end;

        if not FieldByName('Cta_Bco_Mandato_Fecha_de_Firma').IsNull then
        begin
            var_Dia  := FieldByName('Cta_Bco_Mandato_Fecha_de_Firma').AsDateTime;
            DateEdit_Cta_Bco_Mandato_Fecha_de_Firma.Text := DateToStr(var_Dia);
        end;
    end;
end;

procedure Tform_personal_001.Presentar_Ultimo_Contrato;
var var_Ultimo_contrato : record_Ultimo_contrato;
begin
  with form_personal_000.SQLQuery_Personal do
  begin
      Edit_Contrato_Descripcion.Text := '';
      Edit_Contrato_Empresa.Text     := '';
      Edit_Contrato_Inicio.Text      := '';
      Edit_Contrato_Fin.Text         := '';

      if not FieldByName('id').IsNull then
      begin
          var_Ultimo_contrato := form_personal_000.Traer_Ultimo_Contrato_Personal(FieldByName('id').AsString);

          // ***************************************************************************************** //
          // ** Traemos los datos del ultimo contrato y del tipo de contrato                        ** //
          // ***************************************************************************************** //
          Edit_Contrato_Descripcion.Text := var_Ultimo_contrato.Contrato_Descripcion;
          Edit_Contrato_Empresa.Text     := var_Ultimo_contrato.Contrato_Empresa;
          Edit_Contrato_Inicio.Text      := var_Ultimo_contrato.Contrato_Inicio;
          Edit_Contrato_Fin.Text         := var_Ultimo_contrato.Contrato_Fin;
      end;
  end;
end;

procedure Tform_personal_001.Llamar_Mantenimiento_Contratos;
var
  var_msg     : TStrings;
  var_SQL_ADD : TStrings;
begin
     var_SQL_ADD := TStringList.Create;

     if not form_personal_000.SQLQuery_Personal.FieldByName('id').IsNull then
     begin
         if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = true then
         begin
             if UTI_GEN_Form_Abierto_Ya('form_personal_contratos_000') = false then
                 begin
                     Application.CreateForm(Tform_personal_contratos_000, form_personal_contratos_000);
                     form_personal_contratos_000.public_Solo_Ver    := public_Solo_Ver;
                     form_personal_contratos_000.public_Elegimos    := false;
                     form_personal_contratos_000.public_Menu_Worked := public_Menu_Worked;

                     with form_personal_000.SQLQuery_Personal do
                     begin
                         form_personal_contratos_000.public_id_personal     := FieldByName('id').AsString;
                         form_personal_contratos_000.public_nombre_personal := FieldByName('nombre').AsString;

                         // ************************************************************************ //
                         // ** LAS LINEAS DE ABAJO SUSTITUYEN  A LAS LINEAS DE MAS ABAJO, HAY QUE ** //
                         // ** VER SI VERDADERAMENTE FUNCIONAN                                    ** //
                         // ************************************************************************ //
                         var_SQL_ADD.Clear;
                         var_SQL_ADD.Add( 'pc.id_personal = ' + FieldByName('id').AsString );
                         UTI_TB_SQL_ADD( false,
                                         form_personal_contratos_000.Memo_Filtros.Lines,
                                         var_SQL_ADD );
                         // ************************************************************************ //
                         // ** LAS LINEAS DE ABAJO HAN SIDO SUSTUITUIDAS POR LAS LINEAS DE ARRIBA ** //
                         // ************************************************************************ //
                         // form_personal_contratos_000.Memo_Filtros.Lines.Add( 'pc.id_personal = ' +
                         //                                                     FieldByName('id').AsString );
                         // ************************************************************************ //
                     end;

                     form_personal_contratos_000.para_Empezar;

                     form_personal_contratos_000.ShowModal;
                     form_personal_contratos_000.Free;

                     Presentar_Ultimo_Contrato;
                 end
             else
                 begin
                     var_msg := TStringList.Create;

                     var_msg.Add(rs_Modulo_Abierto);

                     UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);

                     var_msg.Free;
                 end;
         end;
     end else begin
         var_msg := TStringList.Create;

         var_msg.Add('Todavía no conozco la id de este empleado, probablemente este creandolo.');

         UTI_GEN_Aviso(true, var_msg, 'NO SE PUEDE', True, False);

         var_msg.Free;
     end;

     var_SQL_ADD.Free;
end;

end.




