unit alumnos_001;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DBDateTimePicker, Forms, Controls, Graphics, Dialogs, ButtonPanel,
  ExtCtrls, Buttons, StdCtrls, DbCtrls, DBGrids, ComCtrls, utilidades_usuarios, Grids, sqldb,
  utilidades_rgtro, utilidades_forms_Filtrar, utilidades_general, utilidades_bd, LCLTranslator;

resourcestring
  rs_Quitamos_1 = '¿QUITAMOS el PAIS';
  rs_Quitamos_2 = '¿QUITAMOS la PROVINCIA';
  rs_Quitamos_3 = '¿QUITAMOS la POBLACIÓN';
  rs_Quitamos_4 = '¿QUITAMOS la POBLACIÓN del banco?';
  rs_Quitamos_5 = '¿QUITAMOS la PROVINCIA del banco?';
  rs_Quitamos_6 = '¿QUITAMOS el PAIS del banco?';
  rs_Quitamos_7 = '¿QUITAMOS la FORMA DE PAGO?';

  rs_FormClose_1 = '* El apellido.';
  rs_FormClose_2 = '* El nombre.';
  rs_FormClose_3 = '* El NIF/CIF.';
  rs_FormClose_4 = '* La dirección de quien facturamos.';
  rs_FormClose_5 = '* La población de quien facturamos.';
  rs_FormClose_6 = '* La provincia de quien facturamos.';
  rs_FormClose_7 = '* El país de quien facturamos.';
  rs_FormClose_8 = '* La forma de pago.';

  rs_Existe_Cliente_Contacto_Ya_1 = 'Error al comprobar si el contacto existe ya.';
  rs_Existe_Cliente_Contacto_Ya_2 = 'La tabla ha sido ';
  rs_Existe_Cliente_Contacto_Ya_3 = ' desde el módulo ';

  rs_Insertar_Registro_Contactos_1 = 'Contacto repetido para este cliente.';

type

  { Tform_alumnos_001 }

  Tform_alumnos_001 = class(TForm)
    BitBtn_eMAIL: TBitBtn;
    BitBtn_eMAIL1: TBitBtn;
    BitBtn_SMS: TBitBtn;
    BitBtn_Ver_Situacion_Registro_Contactos: TBitBtn;
    BitBtn_Ver_Situacion_Registro_albaranes_ventas_detalles: TBitBtn;
    BitBtn_Ver_Situacion_Registro_Periodos: TBitBtn;
    Boton_Elegir_Cta_Bco_Pais: TBitBtn;
    Boton_Elegir_Cta_Bco_Poblacion: TBitBtn;
    Boton_Elegir_Cta_Bco_Provincia: TBitBtn;
    Boton_Elegir_Forma_Pago: TBitBtn;
    Boton_Elegir_Pais: TBitBtn;
    Boton_Elegir_Pais1: TBitBtn;
    Boton_Elegir_Poblacion: TBitBtn;
    Boton_Elegir_Provincia: TBitBtn;
    Boton_Elegir_Provincia1: TBitBtn;
    ButtonPanel1: TButtonPanel;
    DBCheckBox_Estudia_SN: TDBCheckBox;
    DBCheckBox_Trabaja_SN: TDBCheckBox;
    DBDateTimePicker_Cta_Bco_Mandato_Fecha_de_Firma: TDBDateTimePicker;
    DBDateTimePicker_Fecha_Nacimiento: TDBDateTimePicker;
    DBEdit_a_quien_facturamos: TDBEdit;
    DBEdit_eMail2: TDBEdit;
    DBEdit_Estudios_Trabajos: TDBEdit;
    DBEdit_Codigo_Postal: TDBEdit;
    DBEdit_Cta_Bco_BIC_SWIFT: TDBEdit;
    DBEdit_Cta_Bco_Cuenta: TDBEdit;
    DBEdit_Cta_Bco_Digito_Control: TDBEdit;
    DBEdit_Cta_Bco_Entidad: TDBEdit;
    DBEdit_Cta_Bco_IBAN: TDBEdit;
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
    DBEdit_Forma_pago_Dia_1: TDBEdit;
    DBEdit_Forma_pago_Dia_2: TDBEdit;
    DBEdit_Movil: TDBEdit;
    DBEdit_NIF_CIF: TDBEdit;
    DBEdit_Nombre_Comercial: TDBEdit;
    DBEdit_Cantidad_Hermanos: TDBEdit;
    DBEdit_Pagina_Web: TDBEdit;
    DBEdit_Tfno_Fijo_1: TDBEdit;
    DBEdit_Tfno_Fijo_2: TDBEdit;
    DBGrid_Contactos: TDBGrid;
    DBGrid_albaranes_ventas_detalles: TDBGrid;
    DBGrid_Periodos: TDBGrid;
    DBMemo_Observaciones_Comentarios: TDBMemo;
    DBNavigator_Contactos: TDBNavigator;
    DBNavigator_albaranes_ventas_detalles: TDBNavigator;
    DBNavigator_Periodos: TDBNavigator;
    Edit_Cta_Bco_Descripcion_Pais: TEdit;
    Edit_Cta_Bco_Descripcion_Poblacion: TEdit;
    Edit_Cta_Bco_Descripcion_Provincia: TEdit;
    Edit_Descripcion_Forma_Pago: TEdit;
    Edit_Descripcion_Pais: TEdit;
    Edit_Descripcion_Poblacion: TEdit;
    Edit_Descripcion_Provincia: TEdit;
    Edit_Total_Pdte_Cobro: TEdit;
    GroupBox11: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox_Contactos: TGroupBox;
    GroupBox_Periodos: TGroupBox;
    GroupBox_Telefonos: TGroupBox;
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
    Label41: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label62: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label_Fecha1: TLabel;
    PageControl_Otros_Datos: TPageControl;
    Panel1: TPanel;
    Panel_Importes_a_Cobrar: TPanel;
    RadioGroup_Bajas: TRadioGroup;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    TabSheet1: TTabSheet;
    TabSheet_Importes_Para_Cobrar: TTabSheet;

    procedure Borrar_Registro_Contactos;
    procedure Borrar_Registro_Periodos;
    function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
    procedure Devolver_Total_Pendiente;
    procedure DBNavigator_albaranes_ventas_detallesBeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure Editar_Registro_Contactos;
    procedure Editar_Registro_Periodos;
    procedure Editar_Registro_albaranes_ventas_detalles;
    function  Existe_Cliente_Contacto_Ya( param_id, param_id_clientes, param_nombre : String ) : Trecord_Existe;
    procedure BitBtn_eMAILClick(Sender: TObject);
    procedure Insertar_Registro_albaranes_ventas_detalles;
    procedure Insertar_Registro_Periodos;
    procedure Insertar_Registro_Contactos;
    procedure BitBtn_Ver_Situacion_Registro_albaranes_ventas_detallesClick(Sender: TObject);
    procedure BitBtn_Ver_Situacion_Registro_PeriodosClick(Sender: TObject);
    procedure BitBtn_Ver_Situacion_Registro_ContactosClick(Sender: TObject);
    procedure DBGrid_ContactosDblClick(Sender: TObject);
    procedure DBGrid_ContactosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_ContactosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid_ContactosTitleClick(Column: TColumn);
    procedure DBGrid_albaranes_ventas_detallesDblClick(Sender: TObject);
    procedure DBGrid_albaranes_ventas_detallesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_albaranes_ventas_detallesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid_albaranes_ventas_detallesTitleClick(Column: TColumn);
    procedure DBGrid_PeriodosDblClick(Sender: TObject);
    procedure DBGrid_PeriodosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_PeriodosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid_PeriodosTitleClick(Column: TColumn);
    procedure DBNavigator_ContactosBeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure DBNavigator_PeriodosBeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure RadioGroup_BajasClick(Sender: TObject);
    procedure Refrescar_Registros;
    procedure BitBtn_SMSClick(Sender: TObject);
    procedure Presentar_Datos;
    procedure no_Tocar;
    procedure Boton_Elegir_Cta_Bco_PaisClick(Sender: TObject);
    procedure Boton_Elegir_Cta_Bco_PoblacionClick(Sender: TObject);
    procedure Boton_Elegir_Cta_Bco_ProvinciaClick(Sender: TObject);
    procedure Boton_Elegir_Forma_PagoClick(Sender: TObject);
    procedure Boton_Elegir_PaisClick(Sender: TObject);
    procedure Boton_Elegir_PoblacionClick(Sender: TObject);
    procedure Boton_Elegir_ProvinciaClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure Edit_Cta_Bco_Descripcion_PaisClick(Sender: TObject);
    procedure Edit_Cta_Bco_Descripcion_PoblacionClick(Sender: TObject);
    procedure Edit_Cta_Bco_Descripcion_ProvinciaClick(Sender: TObject);
    procedure Edit_Descripcion_Forma_PagoClick(Sender: TObject);
    procedure Edit_Descripcion_PaisClick(Sender: TObject);
    procedure Edit_Descripcion_PoblacionClick(Sender: TObject);
    procedure Edit_Descripcion_ProvinciaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure para_Empezar;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
    private_Salir_OK : Boolean;
  public
    { public declarations }
    public_Solo_Ver      : Boolean;
    public_Menu_Worked   : Integer;
    public_Pulso_Aceptar : Boolean;
    public_Record_Rgtro  : TRecord_Rgtro_Comun;
  end;

var
  form_alumnos_001: Tform_alumnos_001;

implementation

{$R *.lfm}

uses menu, alumnos_000, alumnos_002, alumnos_003, alumnos_004;

{ Tform_alumnos_001 }

procedure Tform_alumnos_001.FormCreate(Sender: TObject);
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

procedure Tform_alumnos_001.para_Empezar;
begin
    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    with form_alumnos_000.SQLQuery_Clientes do
    begin
        public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                           '',
                                                           '',
                                                           FieldByName('nombre_propietario').AsString,
                                                           '',
                                                           '' );
    end;

    Presentar_Datos;

    // ********************************************************************************************* //
    // ** SOLO PARA ESTE FORM                                                                     ** //
    // ********************************************************************************************* //
    PageControl_Otros_Datos.ActivePage := TabSheet_Importes_Para_Cobrar;
end;

procedure Tform_alumnos_001.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg : TStrings;
begin
    // ********************************************************************************************* //
    // ** SOLO PARA ESTE FORM                                                                     ** //
    // ********************************************************************************************* //
    ButtonPanel1.SetFocus;   // ** Con esto consigo que salga del campo que este y que se pueda   ** //
                             // ** actualizar                                                     ** //
    // ********************************************************************************************* //

    var_msg := TStringList.Create;

    if public_Pulso_Aceptar = true then
    begin
        with form_alumnos_000.SQLQuery_Clientes do
        begin
            if Trim(FieldByName('nombre_propietario').AsString) = '' then
            begin
                var_msg.Add(rs_FormClose_1);
            end;

            if Trim(FieldByName('nombre_comercial').AsString) = '' then
            begin
                var_msg.Add(rs_FormClose_2);
            end;

            if Trim(FieldByName('nif_cif').AsString) = '' then
            begin
                var_msg.Add(rs_FormClose_3);
            end;

            if Trim(FieldByName('Direccion').AsString) = '' then
            begin
                var_msg.Add(rs_FormClose_4);
            end;

            if Trim(FieldByName('id_poblaciones').AsString) = '' then
            begin
                var_msg.Add(rs_FormClose_5);
            end;

            if Trim(FieldByName('id_provincias').AsString) = '' then
            begin
                var_msg.Add(rs_FormClose_6);
            end;

            if Trim(FieldByName('id_paises').AsString) = '' then
            begin
                var_msg.Add(rs_FormClose_7);
            end;

            if Trim(FieldByName('id_formas_pago').AsString) = '' then
            begin
                var_msg.Add(rs_FormClose_8);
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
            if form_Menu.public_Salir_OK = False then CloseAction := CloseAction.caNone;
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
                CloseAction := CloseAction.caNone;
            end else begin
                // var_msg.Free;
                CloseAction := caFree;
            end;

        end;

    var_msg.Free;
end;

procedure Tform_alumnos_001.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := true;
end;

procedure Tform_alumnos_001.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := false;
end;

procedure Tform_alumnos_001.Boton_Elegir_PaisClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_alumnos_000.SQLQuery_Clientes do
    begin
        var_Registro := UTI_Abrir_Form( true, false, '', 60 );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_paises').AsString := Trim(var_Registro.id_1);

             Edit_Descripcion_Pais.Text        := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_alumnos_001.Boton_Elegir_ProvinciaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_alumnos_000.SQLQuery_Clientes do
    begin
        var_Registro := UTI_Abrir_Form( true, false, '', 100 );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_provincias').AsString := Trim(var_Registro.id_1);
             FieldByName('id_paises').AsString     := Trim(var_Registro.id_2);

             Edit_Descripcion_Provincia.Text       := var_Registro.descripcion_1;
             Edit_Descripcion_Pais.Text            := var_Registro.descripcion_2;
        end;
    end;
end;

procedure Tform_alumnos_001.Boton_Elegir_PoblacionClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_alumnos_000.SQLQuery_Clientes do
    begin
        var_Registro := UTI_Abrir_Form( true, false, '', 110 );
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

procedure Tform_alumnos_001.Edit_Descripcion_PaisClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add(rs_Quitamos_1);
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_alumnos_000.SQLQuery_Clientes.FieldByName('id_paises').Clear;
         Edit_Descripcion_Pais.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_alumnos_001.Edit_Descripcion_ProvinciaClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add(rs_Quitamos_2);
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_alumnos_000.SQLQuery_Clientes.FieldByName('id_provincias').Clear;
         Edit_Descripcion_Provincia.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_alumnos_001.Edit_Descripcion_PoblacionClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add(rs_Quitamos_3);
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_alumnos_000.SQLQuery_Clientes.FieldByName('id_poblaciones').Clear;
         Edit_Descripcion_Poblacion.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_alumnos_001.Boton_Elegir_Cta_Bco_PoblacionClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_alumnos_000.SQLQuery_Clientes do
    begin
        var_Registro := UTI_Abrir_Form( true, false, '', 110 );
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

procedure Tform_alumnos_001.Boton_Elegir_Cta_Bco_ProvinciaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_alumnos_000.SQLQuery_Clientes do
    begin
        var_Registro := UTI_Abrir_Form( true, false, '', 100 );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_Cta_Bco_provincias').AsString := Trim(var_Registro.id_1);
             FieldByName('id_Cta_Bco_pais').AsString       := Trim(var_Registro.id_2);

             Edit_Cta_Bco_Descripcion_Provincia.Text       := var_Registro.descripcion_1;
             Edit_Cta_Bco_Descripcion_Pais.Text            := var_Registro.descripcion_2;
        end;
    end;
end;

procedure Tform_alumnos_001.Boton_Elegir_Cta_Bco_PaisClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_alumnos_000.SQLQuery_Clientes do
    begin
        var_Registro := UTI_Abrir_Form( true, false, '', 60 );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_Cta_Bco_pais').AsString := Trim(var_Registro.id_1);

             Edit_Cta_Bco_Descripcion_Pais.Text      := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_alumnos_001.Edit_Cta_Bco_Descripcion_PoblacionClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add(rs_Quitamos_4);
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_alumnos_000.SQLQuery_Clientes.FieldByName('id_Cta_Bco_poblaciones').Clear;
         Edit_Cta_Bco_Descripcion_Poblacion.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_alumnos_001.Edit_Cta_Bco_Descripcion_ProvinciaClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add(rs_Quitamos_5);
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_alumnos_000.SQLQuery_Clientes.FieldByName('id_Cta_Bco_provincias').Clear;
         Edit_Cta_Bco_Descripcion_Provincia.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_alumnos_001.Edit_Cta_Bco_Descripcion_PaisClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add(rs_Quitamos_6);
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_alumnos_000.SQLQuery_Clientes.FieldByName('id_Cta_Bco_pais').Clear;
         Edit_Cta_Bco_Descripcion_Pais.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_alumnos_001.Boton_Elegir_Forma_PagoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_alumnos_000.SQLQuery_Clientes do
    begin
        var_Registro := UTI_Abrir_Form( true, false, '', 80 );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_formas_pago').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Forma_Pago.Text       := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_alumnos_001.Edit_Descripcion_Forma_PagoClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add(rs_Quitamos_7);
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_alumnos_000.SQLQuery_Clientes.FieldByName('id_formas_pago').Clear;
         Edit_Descripcion_Forma_Pago.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_alumnos_001.Presentar_Datos;
begin
    with form_alumnos_000.SQLQuery_Clientes do
    begin
        Edit_Descripcion_Poblacion.Text         := FieldByName('OT_descripcion_poblacion').AsString;
        Edit_Descripcion_Provincia.Text         := FieldByName('OT_descripcion_provincia').AsString;
        Edit_Descripcion_Pais.Text              := FieldByName('OT_descripcion_pais').AsString;

        Edit_Cta_Bco_Descripcion_Poblacion.Text := FieldByName('OT_Cta_Bco_descripcion_poblacion').AsString;
        Edit_Cta_Bco_Descripcion_Provincia.Text := FieldByName('OT_Cta_Bco_descripcion_provincia').AsString;
        Edit_Cta_Bco_Descripcion_Pais.Text      := FieldByName('OT_Cta_Bco_descripcion_pais').AsString;

        Edit_Descripcion_Forma_Pago.Text        := FieldByName('OT_descripcion_forma_pago').AsString;

        Devolver_Total_Pendiente;
    end;
end;

procedure Tform_alumnos_001.Devolver_Total_Pendiente;
var var_Total_Pendiente : Extended;
    var_id_andetaba     : Int64;
begin
    var_Total_Pendiente := 0;

    With form_alumnos_000.SQLQuery_Alb_Detalles do
    begin
        if RecordCount > 0 then
        begin
            var_id_andetaba := FieldByName('id').Value;

            First;

            While not Eof do
            begin
                if UpperCase(Trim(FieldByName('Excluido_su_Cobro_SN').AsString)) <> 'S' then
                begin
                     var_Total_Pendiente := var_Total_Pendiente +
                                            FieldByName('OT_para_Cobrar').Value;
                end;

                Next;
            end;

            Locate( 'id', var_id_andetaba, [] );
        end;
    end;

    Edit_Total_Pdte_Cobro.Text := FormatFloat( '###,###,##0.000', var_Total_Pendiente );
end;

procedure Tform_alumnos_001.BitBtn_SMSClick(Sender: TObject);
begin
    UTI_GEN_Enviar_SMS;
end;

procedure Tform_alumnos_001.Refrescar_Registros;
begin
    form_alumnos_000.Refrescar_Registros_Contactos;
    form_alumnos_000.Refrescar_Registros_Periodos;
    form_alumnos_000.Refrescar_Registros_Alb_Detalles;

    Devolver_Total_Pendiente;
end;

procedure Tform_alumnos_001.RadioGroup_BajasClick(Sender: TObject);
begin
    //UTI_TB_Ver_Bajas_SN('um', Memo_Filtros.Lines, RadioGroup_Bajas.ItemIndex);
    Refrescar_Registros;
end;

procedure Tform_alumnos_001.BitBtn_Ver_Situacion_Registro_ContactosClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if form_alumnos_000.SQLQuery_Clientes_Contactos.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'clientes_contactos',
                                           form_alumnos_000.SQLQuery_Clientes_Contactos,
                                           form_alumnos_000.DataSource_Clientes_Contactos,
                                           DBGrid_Contactos );
        end;
    end;
end;

procedure Tform_alumnos_001.BitBtn_Ver_Situacion_Registro_PeriodosClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if form_alumnos_000.SQLQuery_Clientes_Periodos.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'clientes_periodos',
                                           form_alumnos_000.SQLQuery_Clientes_Periodos,
                                           form_alumnos_000.DataSource_Clientes_Periodos,
                                           DBGrid_Periodos );
        end;
    end;
end;

procedure Tform_alumnos_001.BitBtn_Ver_Situacion_Registro_albaranes_ventas_detallesClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if form_alumnos_000.SQLQuery_Alb_Detalles.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'albaranes_ventas_detalles',
                                           form_alumnos_000.SQLQuery_Alb_Detalles,
                                           form_alumnos_000.DataSource_Alb_Detalles,
                                           DBGrid_albaranes_ventas_detalles );
        end;
    end;
end;

procedure Tform_alumnos_001.DBGrid_ContactosDblClick(Sender: TObject);
begin
    Editar_Registro_Contactos;
end;

procedure Tform_alumnos_001.DBGrid_albaranes_ventas_detallesDblClick(Sender: TObject);
begin
    Editar_Registro_albaranes_ventas_detalles;
end;

procedure Tform_alumnos_001.DBGrid_albaranes_ventas_detallesDrawColumnCell( Sender: TObject;
                                                                 const Rect: TRect;
                                                                 DataCol: Integer;
                                                                 Column: TColumn;
                                                                 State: TGridDrawState);
var var_Color_Normal : TColor;
begin
    with Sender as TDBGrid do
    begin
        if form_alumnos_000.SQLQuery_Alb_Detalles.RecordCount = 0 then Exit;

        var_Color_Normal := Canvas.Brush.Color;

        // ***************************************************************************************** //
        // ** Primero comprobamos si es un registro dado de baja o no                             ** //
        // ***************************************************************************************** //
        if not form_alumnos_000.SQLQuery_Alb_Detalles.FieldByName('Del_WHEN').IsNull then
            begin
                // ********************************************************************************* //
                // ** Registro DADO de BAJA                                                       ** //
                // ********************************************************************************* //
                Canvas.Font.Color := clSilver;
            end
        else
            begin
                // ********************************************************************************* //
                // ** Registro DADO de ALTA, NO BAJA                                              ** //
                // ********************************************************************************* //
                // ** Así que las pinto, pero sólo si no son las columnas que van a               ** //
                // ** ser dibujadas                                                               ** //
                // ********************************************************************************* //
                if State <> [gdSelected] then
                begin
                    if (Column.FieldName <> 'COLUMNA_CON_IMAGEN') then
                    begin
                        Canvas.font.Color := clBlack;
                    end;
                end;
            end;

        // ***************************************************************************************** //
        // ** Ahora paso a dibujar una celda normal con los colores elegidos o una                ** //
        // ** dibujada                                                                            ** //
        // ***************************************************************************************** //
        if (Column.FieldName <> 'COLUMNA_CON_IMAGEN') then
            begin
                // ********************************************************************************* //
                // ** No es una de las columnas a dibujar por lo que la pinto con los             ** //
                // ** colores elegidos                                                            ** //
                // ********************************************************************************* //
                DefaultDrawColumnCell(Rect, DataCol, Column, State)
            end
        else
            begin
                // ********************************************************************************* //
                // ** Es una de las columnas a dibujar                                            ** //
                // ********************************************************************************* //
                // ** COLUMNA CONFIRMADA                                                          ** //
                // ********************************************************************************* //
                if Column.FieldName = 'COLUMNA_CON_IMAGEN'  then
                begin
                    // ***************************************************************************** //
                    // ** Canvas.StretchDraw(param_Rect, Image_Confirmado.Picture.Graphic);       ** //
                    // ***************************************************************************** //
                end;
            end;

        Canvas.Font.Color := var_Color_Normal;
    end;
end;

procedure Tform_alumnos_001.DBGrid_PeriodosDblClick(Sender: TObject);
begin
    Editar_Registro_Periodos;
end;

procedure Tform_alumnos_001.DBGrid_PeriodosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var var_Color_Normal : TColor;
begin
    with Sender as TDBGrid do
    begin
        if form_alumnos_000.SQLQuery_Clientes_Periodos.RecordCount = 0 then Exit;

        var_Color_Normal := Canvas.Brush.Color;

        // ***************************************************************************************** //
        // ** Primero comprobamos si es un registro dado de baja o no                             ** //
        // ***************************************************************************************** //
        if not form_alumnos_000.SQLQuery_Clientes_Periodos.FieldByName('Del_WHEN').IsNull then
            begin
                // ********************************************************************************* //
                // ** Registro DADO de BAJA                                                       ** //
                // ********************************************************************************* //
                Canvas.Font.Color := clSilver;
            end
        else
            begin
                // ********************************************************************************* //
                // ** Registro DADO de ALTA, NO BAJA                                              ** //
                // ********************************************************************************* //
                // ** Así que las pinto, pero sólo si no son las columnas que van a               ** //
                // ** ser dibujadas                                                               ** //
                // ********************************************************************************* //
                if State <> [gdSelected] then
                begin
                    if (Column.FieldName <> 'COLUMNA_CON_IMAGEN') then
                    begin
                        Canvas.font.Color := clBlack;
                    end;
                end;
            end;

        // ***************************************************************************************** //
        // ** Ahora paso a dibujar una celda normal con los colores elegidos o una                ** //
        // ** dibujada                                                                            ** //
        // ***************************************************************************************** //
        if (Column.FieldName <> 'COLUMNA_CON_IMAGEN') then
            begin
                // ********************************************************************************* //
                // ** No es una de las columnas a dibujar por lo que la pinto con los             ** //
                // ** colores elegidos                                                            ** //
                // ********************************************************************************* //
                DefaultDrawColumnCell(Rect, DataCol, Column, State)
            end
        else
            begin
                // ********************************************************************************* //
                // ** Es una de las columnas a dibujar                                            ** //
                // ********************************************************************************* //
                // ** COLUMNA CONFIRMADA                                                          ** //
                // ********************************************************************************* //
                if Column.FieldName = 'COLUMNA_CON_IMAGEN'  then
                begin
                    // ***************************************************************************** //
                    // ** Canvas.StretchDraw(param_Rect, Image_Confirmado.Picture.Graphic);       ** //
                    // ***************************************************************************** //
                end;
            end;

        Canvas.Font.Color := var_Color_Normal;
    end;
end;

procedure Tform_alumnos_001.DBGrid_ContactosDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
var var_Color_Normal : TColor;
begin
    with Sender as TDBGrid do
    begin
        if form_alumnos_000.SQLQuery_Clientes_Contactos.RecordCount = 0 then Exit;

        var_Color_Normal := Canvas.Brush.Color;

        // ***************************************************************************************** //
        // ** Primero comprobamos si es un registro dado de baja o no                             ** //
        // ***************************************************************************************** //
        if not form_alumnos_000.SQLQuery_Clientes_Contactos.FieldByName('Del_WHEN').IsNull then
            begin
                // ********************************************************************************* //
                // ** Registro DADO de BAJA                                                       ** //
                // ********************************************************************************* //
                Canvas.Font.Color := clSilver;
            end
        else
            begin
                // ********************************************************************************* //
                // ** Registro DADO de ALTA, NO BAJA                                              ** //
                // ********************************************************************************* //
                // ** Así que las pinto, pero sólo si no son las columnas que van a               ** //
                // ** ser dibujadas                                                               ** //
                // ********************************************************************************* //
                if State <> [gdSelected] then
                begin
                    if (Column.FieldName <> 'COLUMNA_CON_IMAGEN') then
                    begin
                        Canvas.font.Color := clBlack;
                    end;
                end;
            end;

        // ***************************************************************************************** //
        // ** Ahora paso a dibujar una celda normal con los colores elegidos o una                ** //
        // ** dibujada                                                                            ** //
        // ***************************************************************************************** //
        if (Column.FieldName <> 'COLUMNA_CON_IMAGEN') then
            begin
                // ********************************************************************************* //
                // ** No es una de las columnas a dibujar por lo que la pinto con los             ** //
                // ** colores elegidos                                                            ** //
                // ********************************************************************************* //
                DefaultDrawColumnCell(Rect, DataCol, Column, State)
            end
        else
            begin
                // ********************************************************************************* //
                // ** Es una de las columnas a dibujar                                            ** //
                // ********************************************************************************* //
                // ** COLUMNA CONFIRMADA                                                          ** //
                // ********************************************************************************* //
                if Column.FieldName = 'COLUMNA_CON_IMAGEN'  then
                begin
                    // ***************************************************************************** //
                    // ** Canvas.StretchDraw(param_Rect, Image_Confirmado.Picture.Graphic);       ** //
                    // ***************************************************************************** //
                end;
            end;

        Canvas.Font.Color := var_Color_Normal;
    end;
end;

procedure Tform_alumnos_001.DBGrid_ContactosKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then Editar_Registro_Contactos;
end;

procedure Tform_alumnos_001.DBGrid_albaranes_ventas_detallesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if Key = 13 then Editar_Registro_albaranes_ventas_detalles;
end;

procedure Tform_alumnos_001.DBGrid_PeriodosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if Key = 13 then Editar_Registro_Periodos;
end;

procedure Tform_alumnos_001.DBGrid_PeriodosTitleClick(Column: TColumn);
begin
    form_alumnos_000.public_Last_Column_Periodos := UTI_GEN_Ordenar_dbGrid( form_alumnos_000.public_Last_Column_Periodos,
                                                                            Column,
                                                                            form_alumnos_000.SQLQuery_Clientes_Periodos );
end;

procedure Tform_alumnos_001.DBGrid_ContactosTitleClick(Column: TColumn);
begin
    form_alumnos_000.public_Last_Column_Contactos := UTI_GEN_Ordenar_dbGrid( form_alumnos_000.public_Last_Column_Contactos,
                                                                             Column,
                                                                             form_alumnos_000.SQLQuery_Clientes_Contactos );
end;

procedure Tform_alumnos_001.DBGrid_albaranes_ventas_detallesTitleClick(Column: TColumn);
begin
    form_alumnos_000.public_Last_Column_Alb_Detalles := UTI_GEN_Ordenar_dbGrid( form_alumnos_000.public_Last_Column_Alb_Detalles,
                                                                                Column,
                                                                                form_alumnos_000.SQLQuery_Alb_Detalles );
end;

procedure Tform_alumnos_001.DBNavigator_ContactosBeforeAction( Sender: TObject;
                                                               Button: TDBNavButtonType );
begin
    case Button of
        nbInsert : begin
            Insertar_Registro_Contactos;
            Abort;
        end;

        nbEdit : begin
            Editar_Registro_Contactos;
            Abort;
        end;

        nbDelete : begin
            Borrar_Registro_Contactos;
            Abort;
        end;

        nbRefresh : begin
            form_alumnos_000.Refrescar_Registros_Contactos;
            Abort;
        end;
    end;
end;

procedure Tform_alumnos_001.DBNavigator_PeriodosBeforeAction( Sender: TObject;
                                                              Button: TDBNavButtonType );
begin
    case Button of
        nbInsert : begin
            Insertar_Registro_Periodos;
            Abort;
        end;

        nbEdit : begin
            Editar_Registro_Periodos;
            Abort;
        end;

        nbDelete : begin
            Borrar_Registro_Periodos;
            Abort;
        end;

        nbRefresh : begin
            form_alumnos_000.Refrescar_Registros_Periodos;
            Abort;
        end;
    end;
end;

procedure Tform_alumnos_001.Insertar_Registro_albaranes_ventas_detalles;
var var_msg  : TStrings;
    var_Form : Tform_alumnos_004;
begin
    with form_alumnos_000.SQLQuery_Alb_Detalles do
    begin
        var_msg := TStringList.Create;

        if UTI_USR_Permiso_SN(public_Menu_Worked, 'A', True) = True then
        begin
            if public_Solo_Ver = True then
            begin
                var_msg.Clear;
                var_msg.Add(rs_Solo_Visualizar);
                UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            end else begin
                Insert;

                FieldByName('id_clientes').AsString          := form_alumnos_000.SQLQuery_Clientes.FieldByName('id').AsString;
                FieldByName('Excluido_su_Cobro_SN').AsString := 'N';
                FieldByName('id_albaranes').AsString         := '0';

                var_Form := Tform_alumnos_004.Create(nil);

                var_Form.para_Empezar;

                var_Form.ShowModal;
                if var_Form.public_Pulso_Aceptar = true then
                begin
                    var_Form.Free;

                    FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
                    FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                    UTI_RGTRO_Grabar_Antes( 'albaranes_ventas_detalles',
                                            form_alumnos_000.SQLQuery_Alb_Detalles );

                    Devolver_Total_Pendiente;
                end else begin
                    var_Form.Free;
                    Cancel;
                end;
            end;
        end;

        var_msg.Free;
    end;
end;

procedure Tform_alumnos_001.BitBtn_eMAILClick(Sender: TObject);
begin
    UTI_GEN_Enviar_eMAIL;
end;

function Tform_alumnos_001.Existe_Cliente_Contacto_Ya( param_id,
                                                       param_id_clientes,
                                                       param_nombre : String ) : Trecord_Existe;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
    try
       // ****************************************************************************************** //
       // ** Creamos la Transaccion y la conexión con el motor BD, y la abrimos                   ** //
       // ****************************************************************************************** //
       var_SQLTransaction := TSQLTransaction.Create(nil);
       var_SQLConnector   := TSQLConnector.Create(nil);

       if UTI_CN_Abrir( var_SQLTransaction,
                        var_SQLConnector ) = False then UTI_GEN_Salir;

       // ****************************************************************************************** //
       // ** Creamos la SQL Según el motor de BD                                                  ** //
       // ****************************************************************************************** //
       var_SQL := TStringList.Create;

       var_SQL.Add('SELECT cc.*' );

       var_SQL.Add(  'FROM clientes_contactos AS cc' );

       var_SQL.Add(' WHERE cc.nombre = ' +  UTI_GEN_Comillas(Trim(param_nombre)) );
       var_SQL.Add(  ' AND cc.id_clientes = ' +  Trim(param_id_clientes) );

       if Trim(param_id) <> '' then
       begin
           var_SQL.Add(  ' AND NOT cc.id = ' + Trim(param_id) );
       end;

       var_SQL.Add(' ORDER BY cc.id_clientes ASC, cc.nombre ASC' );

       // ****************************************************************************************** //
       // ** Abrimos la tabla                                                                     ** //
       // ****************************************************************************************** //
       var_SQLQuery      := TSQLQuery.Create(nil);
       var_SQLQuery.Name := 'SQLQuery_Existe_Cliente_Contacto_Ya';

       if UTI_TB_Abrir( '', '', '',
                        var_SQLConnector,
                        var_SQLTransaction,
                        var_SQLQuery,
                        -1, // asi me trae todos los registros de golpe
                        var_SQL.Text ) = False then UTI_GEN_Salir;

       // ****************************************************************************************** //
       // ** TRABAJAMOS CON LOS REGISTROS DEVUELTOS                                               ** //
       // ****************************************************************************************** //
       // ** Si el módulo no se creó, no se permite entrar en él ... Result := False              ** //
       // ****************************************************************************************** //
       Result.Fallo_en_Conexion_BD := false;
       Result.Existe               := false;
       Result.deBaja               := 'N';

       if var_SQLQuery.RecordCount > 0 then
       begin
           Result.Existe := true;
           if not var_SQLQuery.FieldByName('Del_WHEN').IsNull then Result.deBaja := 'S';
       end;

       // ****************************************************************************************** //
       // ** Cerramos la tabla                                                                    ** //
       // ****************************************************************************************** //
       if UTI_TB_Cerrar( var_SQLConnector,
                         var_SQLTransaction,
                         var_SQLQuery ) = false then UTI_GEN_Salir;

       var_SQLQuery.Free;

       var_SQL.Free;

       var_SQLTransaction.Free;
       var_SQLConnector.Free;
    except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( rs_Existe_Cliente_Contacto_Ya_1 +
                               rs_Existe_Cliente_Contacto_Ya_2 + var_SQLQuery.Name +
                               rs_Existe_Cliente_Contacto_Ya_3 +
                               Screen.ActiveForm.Name,
                               error );
            try
                var_SQL.Free;
                var_SQLTransaction.Free;
                var_SQLConnector.Free;
                var_SQLQuery.Free;
            except
            end;

            Result.Fallo_en_Conexion_BD := true;
        end;
    end;
end;

procedure Tform_alumnos_001.DBNavigator_albaranes_ventas_detallesBeforeAction(
  Sender: TObject; Button: TDBNavButtonType);
begin
    case Button of
        nbInsert : begin
            Insertar_Registro_albaranes_ventas_detalles;
            Abort;
        end;

        nbEdit : begin
            Editar_Registro_albaranes_ventas_detalles;
            Abort;
        end;

        nbDelete : begin
            if UTI_USR_Permiso_SN(public_Menu_Worked, 'B', True) = True then
            begin
                UTI_RGTRO_Borrar( 'albaranes_ventas_detalles',
                                  form_alumnos_000.SQLQuery_Alb_Detalles,
                                  public_Solo_Ver,
                                  public_Menu_Worked );

                Devolver_Total_Pendiente;
            end;
            Abort;
        end;

        nbRefresh : begin
            form_alumnos_000.Refrescar_Registros_Alb_Detalles;
            Abort;
        end;
    end;
end;

procedure Tform_alumnos_001.Editar_Registro_albaranes_ventas_detalles;
var var_msg  : TStrings;
    var_Form : Tform_alumnos_004;
    var_id   : ShortString;
begin
    with form_alumnos_000.SQLQuery_Alb_Detalles do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
        begin
            var_id := FieldByName('id').AsString;

            if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
            begin
                if UTI_RGTRO_isLock( 'albaranes_ventas_detalles',
                                     var_id,
                                     true ) = true then
                    begin
                        Exit;
                    end
                else
                    begin
                        if UTI_RGTRO_Lock( 'albaranes_ventas_detalles',
                                           var_id ) = true then
                             Edit
                        else Exit;
                    end;

                var_Form := Tform_alumnos_004.Create(nil);

                var_Form.public_Menu_Worked := public_Menu_Worked;

                if public_Solo_Ver = true then
                begin
                    var_Form.public_Solo_Ver := true;
                end;

                var_Form.para_Empezar;

                var_Form.ShowModal;
                if var_Form.public_Pulso_Aceptar = true then
                begin
                    if ( Trim(Params.ParamByName('COPY_' + 'Fecha_Movimiento').AsString)        <> Trim(FieldByName('Fecha_Movimiento').AsString) )        or
                       ( Trim(Params.ParamByName('COPY_' + 'id_clientes').AsString)             <> Trim(FieldByName('id_clientes').AsString) )             or
                       ( Trim(Params.ParamByName('COPY_' + 'Unidades').AsString)                <> Trim(FieldByName('Unidades').AsString) )   or
                       ( Trim(Params.ParamByName('COPY_' + 'id_articulos').AsString)            <> Trim(FieldByName('id_articulos').AsString) )            or
                       ( Trim(Params.ParamByName('COPY_' + 'Repetir_Cada').AsString)            <> Trim(FieldByName('Repetir_Cada').AsString) )            or
                       ( Trim(Params.ParamByName('COPY_' + 'descripcion').AsString)             <> Trim(FieldByName('descripcion').AsString) )             or
                       ( Trim(Params.ParamByName('COPY_' + 'descripcion_para_TPV').AsString)    <> Trim(FieldByName('descripcion_para_TPV').AsString) )    or
                       ( Trim(Params.ParamByName('COPY_' + 'PVP').AsString)                     <> Trim(FieldByName('PVP').AsString) )                     or
                       ( Trim(Params.ParamByName('COPY_' + 'PVP_Impuestos_Incluidos').AsString) <> Trim(FieldByName('PVP_Impuestos_Incluidos').AsString) ) or
                       ( Trim(Params.ParamByName('COPY_' + 'id_impuestos_Ventas').AsString)     <> Trim(FieldByName('id_impuestos_Ventas').AsString) )     or
                       ( Trim(Params.ParamByName('COPY_' + 'Descuento_Comercial_1').AsString)   <> Trim(FieldByName('Descuento_Comercial_1').AsString) )   or
                       ( Trim(Params.ParamByName('COPY_' + 'Descuento_Comercial_2').AsString)   <> Trim(FieldByName('Descuento_Comercial_2').AsString) )   or
                       ( Trim(Params.ParamByName('COPY_' + 'PVP_Manual_Final').AsString)        <> Trim(FieldByName('PVP_Manual_Final').AsString) )        or
                       ( Trim(Params.ParamByName('COPY_' + 'Excluido_su_Cobro_SN').AsString)    <> Trim(FieldByName('Excluido_su_Cobro_SN').AsString) )    then
                    begin
                        FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                        FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                        UTI_RGTRO_Grabar_Antes( 'albaranes_ventas_detalles',
                                                form_alumnos_000.SQLQuery_Alb_Detalles );

                        Devolver_Total_Pendiente;
                    end else begin
                        Cancel;
                    end;

                    var_Form.Free;
                end else begin
                    var_Form.Free;
                    Cancel;
                end;

                UTI_RGTRO_UnLock( 'albaranes_ventas_detalles',
                                  var_id );
            end;
        end else begin
            var_msg.Add(rs_no_Hay_Rgtros);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        end;
    end;

    var_msg.Free;
end;

procedure Tform_alumnos_001.no_Tocar;
begin
    DBEdit_a_quien_facturamos.Enabled                       := False;
    DBEdit_Nombre_Comercial.Enabled                         := False;
    DBDateTimePicker_Fecha_Nacimiento.Enabled               := False;
    DBEdit_NIF_CIF.Enabled                                  := False;
    DBEdit_Direccion.Enabled                                := False;
    DBEdit_Direccion_Numero.Enabled                         := False;
    DBEdit_Direccion_Piso_Letra.Enabled                     := False;
    DBEdit_Codigo_Postal.Enabled                            := False;
    Boton_Elegir_Poblacion.Enabled                          := False;
    Edit_Descripcion_Poblacion.Enabled                      := False;
    Boton_Elegir_Provincia.Enabled                          := False;
    Edit_Descripcion_Provincia.Enabled                      := False;
    Boton_Elegir_Pais.Enabled                               := False;
    Edit_Descripcion_Pais.Enabled                           := False;
    DBEdit_Tfno_Fijo_1.Enabled                              := False;
    DBEdit_Tfno_Fijo_2.Enabled                              := False;
    DBEdit_FAX.Enabled                                      := False;
    DBEdit_Movil.Enabled                                    := False;
    DBCheckBox_Estudia_SN.Enabled                           := False;
    DBCheckBox_Trabaja_SN.Enabled                           := False;
    DBEdit_Estudios_Trabajos.Enabled                        := False;
    DBEdit_Cantidad_Hermanos.Enabled                        := False;
    DBEdit_eMail.Enabled                                    := False;
    DBEdit_Pagina_Web.Enabled                               := False;
    DBEdit_Cuenta_Contable.Enabled                          := False;
    DBMemo_Observaciones_Comentarios.Enabled                := False;
    Boton_Elegir_Forma_Pago.Enabled                         := False;
    Edit_Descripcion_Forma_Pago.Enabled                     := False;
    DBEdit_Forma_pago_Dia_1.Enabled                         := False;
    DBEdit_Forma_pago_Dia_2.Enabled                         := False;
    DBEdit_Cta_Bco_Entidad.Enabled                          := False;
    DBEdit_Cta_Bco_Sucursal.Enabled                         := False;
    DBEdit_Cta_Bco_Digito_Control.Enabled                   := False;
    DBEdit_Cta_Bco_Cuenta.Enabled                           := False;
    DBEdit_Cta_Bco_BIC_SWIFT.Enabled                        := False;
    DBEdit_Cta_Bco_IBAN.Enabled                             := False;
    DBEdit_DBEdit_Cta_Bco_Direccion.Enabled                 := False;
    DBEdit_DBEdit_Cta_Bco_Direccion_Numero.Enabled          := False;
    DBEdit_DBEdit_Cta_Bco_Direccion_Piso_Letra.Enabled      := False;
    DBEdit_DBEdit_Cta_Bco_Direccion_Codigo_Postal.Enabled   := False;
    Boton_Elegir_Cta_Bco_Poblacion.Enabled                  := False;
    Edit_Cta_Bco_Descripcion_Poblacion.Enabled              := False;
    Boton_Elegir_Cta_Bco_Provincia.Enabled                  := False;
    Edit_Cta_Bco_Descripcion_Provincia.Enabled              := False;
    Boton_Elegir_Cta_Bco_Pais.Enabled                       := False;
    Edit_Cta_Bco_Descripcion_Pais.Enabled                   := False;
    DBDateTimePicker_Cta_Bco_Mandato_Fecha_de_Firma.Enabled := False;
    DBEdit_Cta_Bco_Mandato_Ref.Enabled                      := False;
end;

procedure Tform_alumnos_001.FormActivate(Sender: TObject);
begin
    If form_alumnos_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    Comprobar_No_Tocar(true, true);
end;

function Tform_alumnos_001.Comprobar_No_Tocar( param_Reproducir_Mensajes,
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

procedure Tform_alumnos_001.Insertar_Registro_Periodos;
var var_msg  : TStrings;
    var_Form : Tform_alumnos_003;
begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    with form_alumnos_000.SQLQuery_Clientes_Periodos do
    begin
        var_msg := TStringList.Create;

        if UTI_USR_Permiso_SN(public_Menu_Worked, 'A', True) = True then
        begin
            if public_Solo_Ver = True then
                begin
                    var_msg.Clear;
                    var_msg.Add(rs_Solo_Visualizar);
                    UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
                end
            else
                begin
                    Insert;

                    FieldByName('id_clientes').AsString := form_alumnos_000.SQLQuery_Clientes.FieldByName('id').AsString;

                    var_Form := Tform_alumnos_003.Create(nil);

                    var_Form.para_Empezar;

                    var_Form.ShowModal;
                    if var_Form.public_Pulso_Aceptar = true then
                        begin
                            var_Form.Free;

                            FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
                            FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                            UTI_RGTRO_Grabar_Antes( 'clientes_periodos',
                                                    form_alumnos_000.SQLQuery_Clientes_Periodos );
                        end
                    else
                        begin
                            var_Form.Free;
                            Cancel;
                        end;
                end;
        end;

        var_msg.Free;
    end;
end;

procedure Tform_alumnos_001.Editar_Registro_Periodos;
var var_msg  : TStrings;
    var_Form : Tform_alumnos_003;
    var_id   : ShortString;
begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    with form_alumnos_000.SQLQuery_Clientes_Periodos do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
            begin
                var_id := FieldByName('id').AsString;

                if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
                begin
                    if UTI_RGTRO_isLock( 'clientes_periodos',
                                         FieldByName('id').AsString,
                                         true ) = true then
                        begin
                            Exit;
                        end
                    else
                        begin
                            if UTI_RGTRO_Lock( 'clientes_periodos',
                                               FieldByName('id').AsString ) = true then
                                 Edit
                            else Exit;
                        end;

                    var_Form := Tform_alumnos_003.Create(nil);

                    var_Form.public_Menu_Worked := public_Menu_Worked;

                    if public_Solo_Ver = true then
                    begin
                        var_Form.public_Solo_Ver := true;
                    end;

                    var_Form.para_Empezar;

                    var_Form.ShowModal;
                    if var_Form.public_Pulso_Aceptar = true then
                        begin
                            if ( Trim(Params.ParamByName('COPY_' + 'Inicio').AsString) <> Trim(FieldByName('Inicio').AsString) ) or
                               ( Trim(Params.ParamByName('COPY_' + 'Fin').AsString)    <> Trim(FieldByName('Fin').AsString) )    then
                               begin
                                    FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                                    FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                                    UTI_RGTRO_Grabar_Antes( 'clientes_periodos',
                                                            form_alumnos_000.SQLQuery_Clientes_Periodos );
                               end
                            else Cancel;
                            var_Form.Free;
                        end
                    else
                        begin
                            var_Form.Free;
                            Cancel;
                        end;

                    UTI_RGTRO_UnLock( 'clientes_periodos',
                                      var_id );
                end;
            end
        else
            begin
                var_msg.Add(rs_no_Hay_Rgtros);
                UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            end;
    end;

    var_msg.Free;
end;

procedure Tform_alumnos_001.Borrar_Registro_Periodos;
begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    if UTI_USR_Permiso_SN(public_Menu_Worked, 'B', True) = True then
    begin
        UTI_RGTRO_Borrar( 'clientes_periodos',
                          form_alumnos_000.SQLQuery_Clientes_Periodos,
                          public_Solo_Ver,
                          public_Menu_Worked );
    end;
end;

procedure Tform_alumnos_001.Insertar_Registro_Contactos;
var var_msg           : TStrings;
    var_Form          : Tform_alumnos_002;
    var_record_Existe : Trecord_Existe;
begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    with form_alumnos_000.SQLQuery_Clientes_Contactos do
    begin
        var_msg := TStringList.Create;

        if UTI_USR_Permiso_SN(public_Menu_Worked, 'A', True) = True then
        begin
            if public_Solo_Ver = True then
                begin
                    var_msg.Clear;
                    var_msg.Add(rs_Solo_Visualizar);
                    UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
                end
            else
                begin
                    Insert;

                    FieldByName('id_clientes').AsString := form_alumnos_000.SQLQuery_Clientes.FieldByName('id').AsString;

                    var_Form := Tform_alumnos_002.Create(nil);

                    var_Form.para_Empezar;

                    var_Form.ShowModal;
                    if var_Form.public_Pulso_Aceptar = true then
                        begin
                            var_Form.Free;

                            var_record_Existe := Existe_Cliente_Contacto_Ya( '', // Estoy insertando
                                                                             FieldByName('id_clientes').AsString,
                                                                             FieldByName('nombre').AsString );

                            if var_record_Existe.Fallo_en_Conexion_BD = true then
                                begin
                                    // var_Form.Free;
                                    Cancel;
                                end
                            else
                                begin
                                    if var_record_Existe.Existe = false then
                                        begin
                                            FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
                                            FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                                            UTI_RGTRO_Grabar_Antes( 'clientes_contactos',
                                                                    form_alumnos_000.SQLQuery_Clientes_Contactos );
                                        end
                                    else
                                        begin
                                            Cancel;
                                            var_msg.Clear;

                                            var_msg.Add(rs_Insertar_Registro_Contactos_1);

                                            if UpperCase(var_record_Existe.deBaja) = 'S' then
                                            begin
                                                var_msg.Add(rs_Rgtro_Borrado);
                                            end;

                                            UTI_GEN_Aviso(true, var_msg, rs_Ya_Existe, True, False);
                                        end;
                                end;
                        end
                    else
                        begin
                            var_Form.Free;
                            Cancel;
                        end;
                end;
        end;

        var_msg.Free;
    end;
end;

procedure Tform_alumnos_001.Editar_Registro_Contactos;
var var_msg           : TStrings;
    var_Form          : Tform_alumnos_002;
    var_record_Existe : Trecord_Existe;
    var_id            : ShortString;
begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    with form_alumnos_000.SQLQuery_Clientes_Contactos do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
            begin
                var_id := FieldByName('id').AsString;

                if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
                begin
                    if UTI_RGTRO_isLock( 'clientes_contactos',
                                         FieldByName('id').AsString,
                                         true ) = true then
                        begin
                            Exit;
                        end
                    else
                        begin
                            if UTI_RGTRO_Lock( 'clientes_contactos',
                                               FieldByName('id').AsString ) = true then
                                 Edit
                            else Exit;
                        end;

                    var_Form := Tform_alumnos_002.Create(nil);

                    var_Form.public_Menu_Worked := public_Menu_Worked;

                    if public_Solo_Ver = true then
                    begin
                        var_Form.public_Solo_Ver := true;
                    end;

                    var_Form.para_Empezar;

                    var_Form.ShowModal;
                    if var_Form.public_Pulso_Aceptar = true then
                        begin
                            var_record_Existe := Existe_Cliente_Contacto_Ya( FieldByName('id').AsString,
                                                                             FieldByName('id_clientes').AsString,
                                                                             FieldByName('nombre').AsString );

                            if var_record_Existe.Fallo_en_Conexion_BD = true then
                                begin
                                    var_Form.Free;
                                    Cancel;
                                end
                            else
                                begin
                                    if var_record_Existe.Existe = false then
                                        begin
                                            if ( Trim(Params.ParamByName('COPY_' + 'nombre').AsString)           <> Trim(FieldByName('nombre').AsString) )           or
                                               ( Trim(Params.ParamByName('COPY_' + 'nif_cif').AsString)          <> Trim(FieldByName('nif_cif').AsString) )          or
                                               ( Trim(Params.ParamByName('COPY_' + 'Fecha_Nacimiento').AsString) <> Trim(FieldByName('Fecha_Nacimiento').AsString) ) or
                                               ( Trim(Params.ParamByName('COPY_' + 'Tfno_Fijo_1').AsString)      <> Trim(FieldByName('Tfno_Fijo_1').AsString) )      or
                                               ( Trim(Params.ParamByName('COPY_' + 'Tfno_Fijo_2').AsString)      <> Trim(FieldByName('Tfno_Fijo_2').AsString) )      or
                                               ( Trim(Params.ParamByName('COPY_' + 'FAX').AsString)              <> Trim(FieldByName('FAX').AsString) )              or
                                               ( Trim(Params.ParamByName('COPY_' + 'Movil').AsString)            <> Trim(FieldByName('Movil').AsString) )            or
                                               ( Trim(Params.ParamByName('COPY_' + 'eMail').AsString)            <> Trim(FieldByName('eMail').AsString) )            or
                                               ( Trim(Params.ParamByName('COPY_' + 'pagina_web').AsString)       <> Trim(FieldByName('pagina_web').AsString) )       or
                                               ( Trim(Params.ParamByName('COPY_' + 'Cargo_Puesto').AsString)     <> Trim(FieldByName('Cargo_Puesto').AsString) )     then
                                               begin
                                                    FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                                                    FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                                                    UTI_RGTRO_Grabar_Antes( 'clientes_contactos',
                                                                            form_alumnos_000.SQLQuery_Clientes_Contactos );
                                               end
                                            else Cancel;
                                            var_Form.Free;
                                        end
                                    else
                                        begin
                                            var_Form.Free;
                                            Cancel;
                                            var_msg.Clear;
                                            var_msg.Add(rs_Insertar_Registro_Contactos_1);

                                            if UpperCase(var_record_Existe.deBaja) = 'S' then
                                            begin
                                                var_msg.Add(rs_Rgtro_Borrado);
                                            end;

                                            UTI_GEN_Aviso(true, var_msg, rs_Ya_Existe, True, False);
                                        end;
                                end;
                        end
                    else
                        begin
                            var_Form.Free;
                            Cancel;
                        end;

                    UTI_RGTRO_UnLock( 'clientes_contactos',
                                      var_id );
                end;
            end
        else
            begin
                var_msg.Add(rs_no_Hay_Rgtros);
                UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            end;
    end;

    var_msg.Free;
end;

procedure Tform_alumnos_001.Borrar_Registro_Contactos;
begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    if UTI_USR_Permiso_SN(public_Menu_Worked, 'B', True) = True then
    begin
        UTI_RGTRO_Borrar( 'clientes_contactos',
                          form_alumnos_000.SQLQuery_Clientes_Contactos,
                          public_Solo_Ver,
                          public_Menu_Worked );
    end;
end;

end.
