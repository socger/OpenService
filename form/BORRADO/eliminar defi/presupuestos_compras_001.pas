unit presupuestos_compras_001;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DBDateTimePicker, Forms, Controls, Graphics, Dialogs, ButtonPanel,
  ExtCtrls, StdCtrls, DbCtrls, Buttons, ComCtrls, DBGrids, Grids, utilidades_forms_Filtrar,
  utilidades_general, utilidades_usuarios, utilidades_rgtro;

type

  { Tform_presupuestos_compras_001 }

  Tform_presupuestos_compras_001 = class(TForm)
    BitBtn_Crear_Linea_como_Pedido: TBitBtn;
    BitBtn_SMS: TBitBtn;
    BitBtn_SMS2: TBitBtn;
    BitBtn_Ver_Pedido: TBitBtn;
    BitBtn_Ver_Situacion_Registro_ventas_detalles: TBitBtn;
    Boton_Elegir_Agencia_Transporte: TBitBtn;
    Boton_Elegir_Almacen: TBitBtn;
    Boton_Elegir_Pais: TBitBtn;
    Boton_Elegir_Poblacion: TBitBtn;
    Boton_Elegir_Proveedor: TBitBtn;
    Boton_Elegir_Direccion_Envio: TBitBtn;
    Boton_Elegir_Empresa: TBitBtn;
    Boton_Elegir_Forma_Pago: TBitBtn;
    Boton_Elegir_Pais1: TBitBtn;
    Boton_Elegir_Provincia: TBitBtn;
    ButtonPanel1: TButtonPanel;
    CheckBox_con_Recargo: TCheckBox;
    CheckBox_Excluido: TCheckBox;
    DBCheckBox_Portes_Pagados_por_Cliente: TDBCheckBox;
    DBCheckBox_Vencimientos_automaticos_SN: TDBCheckBox;
    DBDateTimePicker_Fecha: TDBDateTimePicker;
    DBDateTimePicker_Fecha_Entrada: TDBDateTimePicker;
    DBDateTimePicker_Fecha_Salida_Bultos: TDBDateTimePicker;
    DBEdit_Bultos: TDBEdit;
    DBEdit_Codigo_Postal: TDBEdit;
    DBEdit_Direccion: TDBEdit;
    DBEdit_Direccion_Numero: TDBEdit;
    DBEdit_Direccion_Piso_Letra: TDBEdit;
    DBEdit_eMail1: TDBEdit;
    DBEdit_eMail3: TDBEdit;
    DBEdit_eMail4: TDBEdit;
    DBEdit_Portes_Gastos_Envio: TDBEdit;
    DBGrid_Detalles: TDBGrid;
    DBMemo_Condiciones_Entrega: TDBMemo;
    DBMemo_Observaciones: TDBMemo;
    DBNavigator_Detalles: TDBNavigator;
    Edit_Proveedor_Razon_Social: TEdit;
    Edit_Proveedor_Direccion: TEdit;
    Edit_Proveedor_Direccion_Codigo_Postal: TEdit;
    Edit_Proveedor_Direccion_FAX: TEdit;
    Edit_Proveedor_Direccion_Movil: TEdit;
    Edit_Proveedor_Direccion_Numero: TEdit;
    Edit_Proveedor_Direccion_Pais: TEdit;
    Edit_Proveedor_Direccion_Piso_Letra: TEdit;
    Edit_Proveedor_Direccion_Poblacion: TEdit;
    Edit_Proveedor_Direccion_Provincia: TEdit;
    Edit_Proveedor_Direccion_Tfno_1: TEdit;
    Edit_Proveedor_Direccion_Tfno_2: TEdit;
    Edit_Proveedor_NIF: TEdit;
    Edit_Proveedor_Nombre_Comercial: TEdit;
    Edit_Ctdad_Vtos: TEdit;
    Edit_Datos_Bancarios_Banco: TEdit;
    Edit_Datos_Bancarios_BIC_SWIFT: TEdit;
    Edit_Datos_Bancarios_Cuenta: TEdit;
    Edit_Datos_Bancarios_DC: TEdit;
    Edit_Datos_Bancarios_Direccion: TEdit;
    Edit_Datos_Bancarios_Direccion_Codigo_Postal: TEdit;
    Edit_Datos_Bancarios_Direccion_Numero: TEdit;
    Edit_Datos_Bancarios_Direccion_Pais: TEdit;
    Edit_Datos_Bancarios_Direccion_Piso_Letra: TEdit;
    Edit_Datos_Bancarios_Direccion_Poblacion: TEdit;
    Edit_Datos_Bancarios_Direccion_Provincia: TEdit;
    Edit_Datos_Bancarios_IBAN: TEdit;
    Edit_Datos_Bancarios_Mandato_Firmado: TEdit;
    Edit_Datos_Bancarios_Mandato_Referencia: TEdit;
    Edit_Datos_Bancarios_Sucursal: TEdit;
    Edit_Descripcion_Almacen: TEdit;
    Edit_Descripcion_Proveedor: TEdit;
    Edit_Descripcion_Empresa: TEdit;
    Edit_Descripcion_Forma_Pago: TEdit;
    Edit_Dias_Entre_Vto: TEdit;
    Edit_Dias_Pago_1: TEdit;
    Edit_Dias_Pago_2: TEdit;
    Edit_Direccion_de_Envio_Agencia_Transporte_Descripcion: TEdit;
    Edit_Direccion_de_Envio_Agencia_Transporte_Tfno_Fijo_1: TEdit;
    Edit_Direccion_de_Envio_Agencia_Transporte_Tfno_Movil: TEdit;
    Edit_Direccion_de_Envio_con_Quien_Hablar: TEdit;
    Edit_Direccion_de_Envio_eMail: TEdit;
    Edit_Direccion_de_Envio_FAX: TEdit;
    Edit_Direccion_de_Envio_movil: TEdit;
    Edit_Direccion_de_Envio_Pais: TEdit;
    Edit_Direccion_de_Envio_Poblacion: TEdit;
    Edit_Direccion_de_Envio_Provincia: TEdit;
    Edit_Direccion_de_Envio_Tfno_1: TEdit;
    Edit_Direccion_de_Envio_Tfno_2: TEdit;
    Edit_Dto_Comercial_1: TEdit;
    Edit_Dto_Comercial_2: TEdit;
    Edit_Dto_Final: TEdit;
    Edit_Dto_Pronto_Pago: TEdit;
    Edit_Periodo_Vacacional_Fin_Dia: TEdit;
    Edit_Periodo_Vacacional_Fin_Mes: TEdit;
    Edit_Periodo_Vacacional_Inicio_Dia: TEdit;
    Edit_Periodo_Vacacional_Inicio_Mes: TEdit;
    Edit_Retencion: TEdit;
    Edit_Total: TEdit;
    Edit_Total_Base_Imponible: TEdit;
    Edit_Total_Dtos: TEdit;
    Edit_Total_Impuestos: TEdit;
    Edit_Total_Lineas: TEdit;
    Edit_Total_Mano_Obra: TEdit;
    Edit_Total_Materiales: TEdit;
    Edit_Total_Peso: TEdit;
    Edit_Total_Resto: TEdit;
    Edit_Total_Volumen: TEdit;
    GroupBox1: TGroupBox;
    GroupBox10: TGroupBox;
    GroupBox13: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox_Serie_Numero: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label100: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    Label104: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
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
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label5: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label6: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label7: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label75: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label8: TLabel;
    Label80: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label9: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label_Almacen: TLabel;
    Label_Fecha1: TLabel;
    Label_Fecha3: TLabel;
    PageControl_Datos_Envio: TPageControl;
    PageControl_Otros_Datos: TPageControl;
    PageControl_Totales: TPageControl;
    RadioGroup_Bajas: TRadioGroup;
    Shape1: TShape;
    Shape3: TShape;
    TabSheet5: TTabSheet;
    TabSheet9: TTabSheet;
    TabSheet_Condiciones_Entrega: TTabSheet;
    TabSheet_Datos_Bancarios: TTabSheet;
    TabSheet_Datos_Cliente_Generales: TTabSheet;
    TabSheet_Datos_Comerciales: TTabSheet;
    TabSheet_Datos_Gestion_Cobro: TTabSheet;
    TabSheet_Direccion_Envio: TTabSheet;
    TabSheet_Totales: TTabSheet;
    TabSheet_Totales_Desglose: TTabSheet;
    TabSheet_Transportista: TTabSheet;

    procedure BitBtn_Ver_PedidoClick(Sender: TObject);
    procedure Label31Click(Sender: TObject);
    procedure PageControl_Otros_DatosChange(Sender: TObject);
    procedure Vaciar_Datos_Agencia_de_Transporte;
    procedure Vaciar_Datos_Envio;
    procedure Vaciar_Proveedor_Datos;
    procedure BitBtn_Ver_Situacion_Registro_ventas_detallesClick(Sender: TObject);
    procedure Boton_Elegir_Agencia_TransporteClick(Sender: TObject);
    procedure Boton_Elegir_AlmacenClick(Sender: TObject);
    procedure Boton_Elegir_Direccion_EnvioClick(Sender: TObject);
    procedure Boton_Elegir_EmpresaClick(Sender: TObject);
    procedure Boton_Elegir_Forma_PagoClick(Sender: TObject);
    procedure Boton_Elegir_ProveedorClick(Sender: TObject);
    function  Cambiamos_Proveedor_SN : Boolean;
    function  Cambiamos_Almacen_SN : Boolean;
    function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
    function  Con_Que_Contacto_Hablemos_para_Envio : TRecord_Rgtro_Comun;
    procedure DBGrid_DetallesDblClick(Sender: TObject);
    procedure DBGrid_DetallesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_DetallesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid_DetallesTitleClick(Column: TColumn);
    procedure DBNavigator_DetallesBeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure Edit_Descripcion_AlmacenClick(Sender: TObject);
    procedure Edit_Descripcion_EmpresaClick(Sender: TObject);
    procedure Edit_Descripcion_Forma_PagoClick(Sender: TObject);
    procedure Edit_Descripcion_ProveedorClick(Sender: TObject);
    procedure Edit_Direccion_de_Envio_Agencia_Transporte_DescripcionClick(Sender: TObject);
    procedure Edit_Direccion_de_Envio_con_Quien_HablarClick(Sender: TObject);
    procedure RadioGroup_BajasClick(Sender: TObject);
    procedure Refrescar_Registros;
    procedure no_Tocar;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure Presentar_Datos;
    procedure Presentar_Datos_Proveedor_Generales;
    procedure Presentar_Datos_Bancarios;
    procedure Presentar_Datos_Comerciales;
    procedure Presentar_Datos_Gestion_Cobro;
    procedure Presentar_Datos_Direccion_de_Envio;
    procedure Presentar_Datos_Agencia_de_Transporte;

    procedure FormCreate(Sender: TObject);
    procedure para_Empezar;
    procedure FormActivate(Sender: TObject);

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
  form_presupuestos_compras_001: Tform_presupuestos_compras_001;

implementation

{$R *.lfm}

uses menu, presupuestos_compras_000;

{ Tform_presupuestos_compras_001 }

procedure Tform_presupuestos_compras_001.para_Empezar;
begin
    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    with form_presupuestos_compras_000.SQLQuery_Presup do
    begin
        public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                           FieldByName('id_proveedores').AsString,
                                                           FieldByName('Fecha').AsString,
                                                           '',
                                                           FieldByName('Fecha_Contabilizacion').AsString,
                                                           FieldByName('Numero_Presupuesto_Compras').AsString );
    end;

    Presentar_Datos;

    // ********************************************************************************************* //
    // ** SOLO PARA ESTE FORM                                                                     ** //
    // ********************************************************************************************* //
    PageControl_Datos_Envio.ActivePage := TabSheet_Direccion_Envio;
    PageControl_Otros_Datos.ActivePage := TabSheet_Datos_Cliente_Generales;
    PageControl_Totales.ActivePage     := TabSheet_Totales;
end;

procedure Tform_presupuestos_compras_001.FormActivate(Sender: TObject);
begin
    // ********************************************************************************************* //
    // ** Si esta llamado desde otro modulo, le cambiamos el color de fondo                       ** //
    // ********************************************************************************************* //
    If form_presupuestos_compras_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    Comprobar_No_Tocar(true, true);
end;

procedure Tform_presupuestos_compras_001.FormCreate(Sender: TObject);
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

    // ********************************************************************************************* //
    // ** Solo para este modulo                                                                   ** //
    // ********************************************************************************************* //
    Boton_Elegir_Almacen.Visible     := false;
    Label_Almacen.Visible            := false;
    Edit_Descripcion_Almacen.Visible := false;

    form_Menu.Traer_Configuracion_APP;
    if UpperCase(Trim(form_menu.public_User_Configuracion.Albaranes_Obligar_Almacen_SN)) = 'S' then
    begin
        Boton_Elegir_Almacen.Visible     := true;
        Label_Almacen.Visible            := true;
        Edit_Descripcion_Almacen.Visible := true;
    end;
end;

procedure Tform_presupuestos_compras_001.Presentar_Datos;
begin
    with form_presupuestos_compras_000.SQLQuery_Presup do
    begin
        Edit_Descripcion_Almacen.Text := FieldByName('OT_descripcion_almacen').AsString;
        Edit_Descripcion_Empresa.Text := FieldByName('OT_descripcion_empresa').AsString;

        Presentar_Datos_Proveedor_Generales;
        Presentar_Datos_Bancarios;
        Presentar_Datos_Comerciales;
        Presentar_Datos_Gestion_Cobro;
        Presentar_Datos_Direccion_de_Envio;
        Presentar_Datos_Agencia_de_Transporte;

        form_presupuestos_compras_000.Presentar_Datos_Totales(1);
    end;
end;

procedure Tform_presupuestos_compras_001.Presentar_Datos_Proveedor_Generales;
begin
    with form_presupuestos_compras_000.SQLQuery_Presup do
    begin
        if Trim(FieldByName('nombre_propietario').AsString) <> '' then
        begin
           Edit_Descripcion_Proveedor.Text := Trim(FieldByName('nombre_propietario').AsString);
        end else begin
           Edit_Descripcion_Proveedor.Text := Trim(FieldByName('nombre_comercial').AsString);
        end;

        Edit_Proveedor_Razon_Social.Text      := FieldByName('nombre_propietario').AsString;
        Edit_Proveedor_Nombre_Comercial.Text        := FieldByName('nombre_comercial').AsString;
        Edit_Proveedor_NIF.Text                     := FieldByName('nif_cif').AsString;
        Edit_Proveedor_Direccion.Text               := FieldByName('Direccion').AsString;
        Edit_Proveedor_Direccion_Numero.Text        := FieldByName('Direccion_Numero').AsString;
        Edit_Proveedor_Direccion_Piso_Letra.Text    := FieldByName('Direccion_Piso_Letra').AsString;
        Edit_Proveedor_Direccion_Codigo_Postal.Text := FieldByName('Codigo_Postal').AsString;

        Edit_Proveedor_Direccion_Poblacion.Text     := FieldByName('OT_descripcion_poblacion').AsString;
        Edit_Proveedor_Direccion_Provincia.Text     := FieldByName('OT_descripcion_provincia').AsString;
        Edit_Proveedor_Direccion_Pais.Text          := FieldByName('OT_descripcion_pais').AsString;

        Edit_Proveedor_Direccion_Tfno_1.Text        := FieldByName('Tfno_Fijo_1').AsString;
        Edit_Proveedor_Direccion_Tfno_2.Text        := FieldByName('Tfno_Fijo_2').AsString;
        Edit_Proveedor_Direccion_FAX.Text           := FieldByName('FAX').AsString;
        Edit_Proveedor_Direccion_Movil.Text         := FieldByName('Movil').AsString;
    end;
end;

procedure Tform_presupuestos_compras_001.Presentar_Datos_Bancarios;
begin
    with form_presupuestos_compras_000.SQLQuery_Presup do
    begin
        Edit_Datos_Bancarios_Banco.Text                   := FieldByName('Cta_Bco_Entidad').AsString;
        Edit_Datos_Bancarios_Sucursal.Text                := FieldByName('Cta_Bco_Sucursal').AsString;
        Edit_Datos_Bancarios_DC.Text                      := FieldByName('Cta_Bco_Digito_Control').AsString;
        Edit_Datos_Bancarios_Cuenta.Text                  := FieldByName('Cta_Bco_Cuenta').AsString;
        Edit_Datos_Bancarios_BIC_SWIFT.Text               := FieldByName('Cta_Bco_BIC_SWIFT').AsString;
        Edit_Datos_Bancarios_IBAN.Text                    := FieldByName('Cta_Bco_IBAN').AsString;

        Edit_Datos_Bancarios_Direccion.Text               := FieldByName('Cta_Bco_Direccion').AsString;
        Edit_Datos_Bancarios_Direccion_Numero.Text        := FieldByName('Cta_Bco_Direccion_Numero').AsString;
        Edit_Datos_Bancarios_Direccion_Piso_Letra.Text    := FieldByName('Cta_Bco_Direccion_Piso_Letra').AsString;
        Edit_Datos_Bancarios_Direccion_Codigo_Postal.Text := FieldByName('Cta_Bco_Codigo_Postal').AsString;

        Edit_Datos_Bancarios_Direccion_Poblacion.Text     := FieldByName('OT_Cta_Bco_descripcion_poblacion').AsString;
        Edit_Datos_Bancarios_Direccion_Provincia.Text     := FieldByName('OT_Cta_Bco_descripcion_provincia').AsString;
        Edit_Datos_Bancarios_Direccion_Pais.Text          := FieldByName('OT_Cta_Bco_descripcion_pais').AsString;

        Edit_Datos_Bancarios_Mandato_Firmado.Text         := FieldByName('Cta_Bco_Mandato_Fecha_de_Firma').AsString;
        Edit_Datos_Bancarios_Mandato_Referencia.Text      := FieldByName('Cta_Bco_Mandato_Ref').AsString;
    end;
end;

procedure Tform_presupuestos_compras_001.Presentar_Datos_Comerciales;
begin
    with form_presupuestos_compras_000.SQLQuery_Presup do
    begin
        CheckBox_Excluido.Checked := false;
        if UpperCase(FieldByName('IVA_Excluido_SN').AsString) = 'S' then
        begin
            CheckBox_Excluido.Checked := true;
        end;

        CheckBox_con_Recargo.Checked := false;
        if UpperCase(FieldByName('IVA_con_Recargo_SN').AsString) = 'S' then
        begin
            CheckBox_con_Recargo.Checked := true;
        end;

        Edit_Retencion.Text          := FieldByName('Retencion').AsString;
        Edit_Dto_Comercial_1.Text    := FieldByName('Descuento_Comercial_1').AsString;
        Edit_Dto_Comercial_2.Text    := FieldByName('Descuento_Comercial_2').AsString;
        Edit_Dto_Pronto_Pago.Text    := FieldByName('Descuento_Pronto_Pago').AsString;
        Edit_Dto_Final.Text          := FieldByName('Descuento_Final').AsString;
    end;
end;

procedure Tform_presupuestos_compras_001.Presentar_Datos_Gestion_Cobro;
begin
    with form_presupuestos_compras_000.SQLQuery_Presup do
    begin
        Edit_Descripcion_Forma_Pago.Text        := FieldByName('OT_descripcion_forma_pago').AsString;

        Edit_Dias_Pago_1.Text                   := FieldByName('Forma_pago_Dia_1').AsString;
        Edit_Dias_Pago_2.Text                   := FieldByName('Forma_pago_Dia_2').AsString;
        Edit_Periodo_Vacacional_Inicio_Dia.Text := FieldByName('Forma_pago_Vacaciones_Dia_Inicio').AsString;
        Edit_Periodo_Vacacional_Inicio_Mes.Text := FieldByName('Forma_pago_Vacaciones_Mes_Inicio').AsString;
        Edit_Periodo_Vacacional_Fin_Dia.Text    := FieldByName('Forma_pago_Vacaciones_Dia_Fin').AsString;
        Edit_Periodo_Vacacional_Fin_Mes.Text    := FieldByName('Forma_pago_Vacaciones_Mes_Fin').AsString;

        Edit_Ctdad_Vtos.Text                    := FieldByName('Vencimientos_Cantidad').AsString;
        Edit_Dias_Entre_Vto.Text                := FieldByName('Vencimientos_Dias_Entre').AsString;
    end;
end;

procedure Tform_presupuestos_compras_001.Presentar_Datos_Direccion_de_Envio;
begin
    with form_presupuestos_compras_000.SQLQuery_Presup do
    begin
        // ***************************************************************************************** //
        // ** Estos son los datos de la persona con quien se hablo para el envío                  ** //
        // ***************************************************************************************** //
        Edit_Direccion_de_Envio_con_Quien_Hablar.Text        := FieldByName('Envio_Con_Quien_Hablar').AsString;
        Edit_Direccion_de_Envio_eMail.Text                   := FieldByName('Envio_eMail').AsString;
        Edit_Direccion_de_Envio_Tfno_1.Text                  := FieldByName('Envio_Tfno_Fijo_1').AsString;
        Edit_Direccion_de_Envio_Tfno_2.Text                  := FieldByName('Envio_Tfno_Fijo_2').AsString;
        Edit_Direccion_de_Envio_FAX.Text                     := FieldByName('Envio_FAX').AsString;
        Edit_Direccion_de_Envio_movil.Text                   := FieldByName('Envio_Movil').AsString;

        // ***************************************************************************************** //
        // ** Estos son los datos de envío, normálmente coincidirán con los datos de la empresa a ** //
        // ** que va a facturar nuestro proveedor                                                 ** //
        // ***************************************************************************************** //
        Edit_Direccion_de_Envio_Poblacion.Text               := FieldByName('OT_Envio_descripcion_poblacion').AsString;
        Edit_Direccion_de_Envio_Provincia.Text               := FieldByName('OT_Envio_descripcion_provincia').AsString;
        Edit_Direccion_de_Envio_Pais.Text                    := FieldByName('OT_Envio_descripcion_pais').AsString;
    end;
end;

procedure Tform_presupuestos_compras_001.Presentar_Datos_Agencia_de_Transporte;
begin
    with form_presupuestos_compras_000.SQLQuery_Presup do
    begin
        Edit_Direccion_de_Envio_Agencia_Transporte_Descripcion.Text := FieldByName('OT_descripcion_transportista').AsString;
        Edit_Direccion_de_Envio_Agencia_Transporte_Tfno_Fijo_1.Text := FieldByName('OT_tfno_1_transportista').AsString;
        Edit_Direccion_de_Envio_Agencia_Transporte_Tfno_Movil.Text  := FieldByName('OT_Movil_transportista').AsString;
    end;
end;

procedure Tform_presupuestos_compras_001.FormClose(Sender: TObject; var CloseAction: TCloseAction);
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
        with form_presupuestos_compras_000.SQLQuery_Presup do
        begin
            // ************************************************************************************* //
            // ** DATOS QUE SON OBLIGADOS POR LO QUE SE DEBE DE AVISAR DE SU FALTA                ** //
            // ************************************************************************************* //
            if Trim(FieldByName('id_proveedores').AsString) = '' then
            begin
                var_msg.Add( '* El proveedor o acreedor.');
            end;

            if Trim(FieldByName('id_empresas').AsString) = '' then
            begin
                var_msg.Add( '* La empresa.');
            end;

            if Trim(FieldByName('Fecha_Contabilizacion').AsString) = '' then
            begin
                var_msg.Add( '* La fecha de entrada nuestra.');
            end;

            if Trim(FieldByName('Fecha').AsString) = '' then
            begin
                var_msg.Add( '* La fecha del presupuesto.');
            end;

            if Trim(FieldByName('Numero_Presupuesto_Compras').AsString) = '' then
            begin
                var_msg.Add( '* El número del presupuesto.');
            end;

            // ************************************************************************************* //
            // ** DATOS QUE se debe de comprobar si son o NO SON OBLIGADOS PERO SE DEBE DE AVISAR ** //
            // ** DE SU FALTA                                                                     ** //
            // ************************************************************************************* //
            form_Menu.Traer_Configuracion_APP;

            if UpperCase(Trim(form_menu.public_User_Configuracion.Albaranes_Obligar_Almacen_SN)) = 'S' then
            begin
                if Trim(FieldByName('id_Almacenes').AsString) = '' then
                begin
                    var_msg.Add( '* El almacén.');
                end;
            end;
        end;
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
        if form_Menu.public_Salir_OK = False then CloseAction := CloseAction.caNone;
    end else begin
        // ***************************************************************************************** //
        // ** Fue correcto el modo como quiere salir de la aplicación                             ** //
        // ***************************************************************************************** //
        // ** SI ESTAMOS EN MODO DE INSERCCION (CREANDO LA CABECERA), ASIGNAMOS A LA CABECERA SU  ** //
        // ** NUMERACION Y ACTUALIZAMOS EL REGISTRO DE EMPRESA CON EL A GENERAR.                  ** //
        // **                                                                                     ** //
        // ** LUEGO                                                                               ** //
        // **                                                                                     ** //
        // ** Comprobaremos si no se generó algún error por falta de completar algun campo y si se** //
        // ** salió con el botón Ok o Cancel                                                      ** //
        // ***************************************************************************************** //
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

procedure Tform_presupuestos_compras_001.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := true;
end;

procedure Tform_presupuestos_compras_001.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := false;
end;

procedure Tform_presupuestos_compras_001.no_Tocar;
begin
    DBDateTimePicker_Fecha_Entrada.Enabled   := false;
    DBDateTimePicker_Fecha.Enabled           := false;
    Boton_Elegir_Proveedor.Enabled           := false;
    Edit_Descripcion_Proveedor.Enabled       := false;
    Boton_Elegir_Almacen.Enabled             := false;
    Edit_Descripcion_Almacen.Enabled         := false;
    Boton_Elegir_Empresa.Enabled             := false;
    Edit_Descripcion_Empresa.Enabled         := false;

    TabSheet_Datos_Cliente_Generales.Enabled := false;
    TabSheet_Datos_Bancarios.Enabled         := false;
    TabSheet_Datos_Comerciales.Enabled       := false;
    TabSheet_Datos_Gestion_Cobro.Enabled     := false;
    TabSheet_Direccion_Envio.Enabled         := false;
    TabSheet_Transportista.Enabled           := false;
    TabSheet_Condiciones_Entrega.Enabled     := false;
    TabSheet9.Enabled                        := false;
end;

procedure Tform_presupuestos_compras_001.Refrescar_Registros;
begin
    form_presupuestos_compras_000.Refrescar_Registros_Detalles;

    form_presupuestos_compras_000.Presentar_Datos_Totales(1);
end;

procedure Tform_presupuestos_compras_001.RadioGroup_BajasClick(Sender: TObject);
begin
    //UTI_TB_Ver_Bajas_SN('um', Memo_Filtros.Lines, RadioGroup_Bajas.ItemIndex);
    Refrescar_Registros;
end;

procedure Tform_presupuestos_compras_001.BitBtn_Ver_Situacion_Registro_ventas_detallesClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if form_presupuestos_compras_000.SQLQuery_Presup_Detalles.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'presupuestos_compras_detalles',
                                           form_presupuestos_compras_000.SQLQuery_Presup_Detalles,
                                           form_presupuestos_compras_000.DataSource_Presup_Detalles,
                                           DBGrid_Detalles );
        end;
    end;
end;

procedure Tform_presupuestos_compras_001.DBGrid_DetallesDrawColumnCell( Sender: TObject;
                                                                        const Rect: TRect;
                                                                        DataCol: Integer;
                                                                        Column: TColumn;
                                                                        State: TGridDrawState);
var var_Color_Normal : TColor;
begin
    with Sender as TDBGrid do
    begin
        if form_presupuestos_compras_000.SQLQuery_Presup_Detalles.RecordCount = 0 then Exit;

        var_Color_Normal := Canvas.Brush.Color;

        // ***************************************************************************************** //
        // ** Primero comprobamos si es un registro dado de baja o no                             ** //
        // ***************************************************************************************** //
        if not form_presupuestos_compras_000.SQLQuery_Presup_Detalles.FieldByName('Del_WHEN').IsNull then
        begin
            // ************************************************************************************* //
            // ** Registro DADO de BAJA                                                           ** //
            // ************************************************************************************* //
            Canvas.Font.Color := clSilver;
        end else begin
            // ************************************************************************************* //
            // ** Registro DADO de ALTA, NO BAJA                                                  ** //
            // ************************************************************************************* //
            // ** Así que las pinto, pero sólo si no son las columnas que van a ser dibujadas     ** //
            // ************************************************************************************* //
            if State <> [gdSelected] then
            begin
                if (Column.FieldName <> 'Pedido_SN') then
                begin
                    Canvas.font.Color := clBlack;
                end;
            end;
        end;

        // ***************************************************************************************** //
        // ** Ahora paso a dibujar una celda normal con los colores elegidos o una                ** //
        // ** dibujada                                                                            ** //
        // ***************************************************************************************** //
        if (Column.FieldName <> 'Pedido_SN') then
        begin
            // ************************************************************************************* //
            // ** No es una de las columnas a dibujar por lo que la pinto con los colores elegidos** //
            // ************************************************************************************* //
            DefaultDrawColumnCell(Rect, DataCol, Column, State);
        end else begin
            // ************************************************************************************* //
            // ** Es una de las columnas a dibujar                                                ** //
            // ************************************************************************************* //
            // ** COLUMNA CONFIRMADA                                                              ** //
            // ************************************************************************************* //
            if Column.FieldName = 'Pedido_SN'  then
            begin
                if not form_presupuestos_compras_000.SQLQuery_Presup_Detalles.FieldByName('Serie_Pedido').IsNull then
                     Canvas.StretchDraw(Rect, form_presupuestos_compras_000.Image_Convertida.Picture.Graphic)
                else DefaultDrawColumnCell(Rect, DataCol, Column, State);
            end;
        end;

        Canvas.Font.Color := var_Color_Normal;
    end;
end;

procedure Tform_presupuestos_compras_001.DBGrid_DetallesTitleClick(Column: TColumn);
begin
    with form_presupuestos_compras_000 do
    begin
        public_Last_Column_Detalles := UTI_GEN_Ordenar_dbGrid( public_Last_Column_Detalles,
                                                               Column,
                                                               SQLQuery_Presup_Detalles );

    end;
end;

procedure Tform_presupuestos_compras_001.Edit_Direccion_de_Envio_con_Quien_HablarClick
  (Sender: TObject);
begin

end;

procedure Tform_presupuestos_compras_001.Boton_Elegir_ProveedorClick(Sender: TObject);
var var_Rgtro                                  : TRecord_Rgtro_Comun;
    var_Rgtro_Pro                              : TProveedores;
    var_msg                                    : TStrings;

    var_id_proveedores_OLD                     : String;
    var_Edit_Descripcion_Proveedor_OLD         : String;
    var_OT_Cta_Bco_descripcion_poblacion_OLD   : String;
    var_OT_Cta_Bco_descripcion_provincia_OLD   : String;
    var_OT_Cta_Bco_descripcion_pais_OLD        : String;
    var_OT_descripcion_forma_pago_OLD          : String;
    var_id_poblaciones_OLD                     : String;
    var_id_provincias_OLD                      : String;
    var_id_paises_OLD                          : String;

    var_OT_descripcion_poblacion               : String;
    var_OT_descripcion_provincia               : String;
    var_OT_descripcion_pais                    : String;

    var_id_formas_pago_OLD                     : String;
    var_Cta_Bco_id_poblaciones_OLD             : String;
    var_Cta_Bco_id_provincias_OLD              : String;
    var_Cta_Bco_id_paises_OLD                  : String;
    var_agencias_transporte_id_proveedores_OLD : String;
    var_nombre_propietario_OLD                 : String;
    var_nombre_comercial_OLD                   : String;
    var_nif_cif_OLD                            : String;
    var_Tfno_Fijo_1_OLD                        : String;
    var_Tfno_Fijo_2_OLD                        : String;
    var_FAX_OLD                                : String;
    var_Movil_OLD                              : String;
    var_Direccion_OLD                          : String;
    var_Direccion_Numero_OLD                   : String;
    var_Direccion_Piso_Letra_OLD               : String;
    var_Codigo_Postal_OLD                      : String;
    var_Forma_pago_Dia_1_OLD                   : String;
    var_Forma_pago_Dia_2_OLD                   : String;
    var_Vencimientos_automaticos_SN_OLD        : String;
    var_Vencimientos_Cantidad_OLD              : String;
    var_Vencimientos_Dias_Entre_OLD            : String;
    var_Forma_pago_Vacaciones_Dia_Inicio_OLD   : String;
    var_Forma_pago_Vacaciones_Mes_Inicio_OLD   : String;
    var_Forma_pago_Vacaciones_Dia_Fin_OLD      : String;
    var_Forma_pago_Vacaciones_Mes_Fin_OLD      : String;
    var_Cta_Bco_Entidad_OLD                    : String;
    var_Cta_Bco_Sucursal_OLD                   : String;
    var_Cta_Bco_Digito_Control_OLD             : String;
    var_Cta_Bco_Cuenta_OLD                     : String;
    var_Cta_Bco_IBAN_OLD                       : String;
    var_Cta_Bco_BIC_SWIFT_OLD                  : String;
    var_Cta_Bco_Mandato_Fecha_de_Firma_OLD     : String;
    var_Cta_Bco_Mandato_Ref_OLD                : String;
    var_Cta_Bco_Direccion_OLD                  : String;
    var_Cta_Bco_Direccion_Numero_OLD           : String;
    var_Cta_Bco_Direccion_Piso_Letra_OLD       : String;
    var_Cta_Bco_Codigo_Postal_OLD              : String;
    var_IVA_con_Recargo_SN_OLD                 : String;
    var_IVA_Excluido_SN_OLD                    : String;
    var_Retencion_OLD                          : String;
    var_Descuento_Comercial_1_OLD              : String;
    var_Descuento_Comercial_2_OLD              : String;
    var_Descuento_Pronto_Pago_OLD              : String;
    var_Descuento_Final_OLD                    : String;
    var_Observaciones_OLD                      : String;
begin
    if Cambiamos_Proveedor_SN = false then Exit;

    with form_presupuestos_compras_000.SQLQuery_Presup do
    begin
        // ***************************************************************************************** //
        // ** Guardar los valores anteriores                                                      ** //
        // ***************************************************************************************** //
        var_id_proveedores_OLD                     := FieldByName('id_clientes').AsString;
        var_Edit_Descripcion_Proveedor_OLD         := FieldByName('OT_descripcion_proveedor').AsString;
        var_OT_Cta_Bco_descripcion_poblacion_OLD   := FieldByName('OT_Cta_Bco_descripcion_poblacion').AsString;
        var_OT_Cta_Bco_descripcion_provincia_OLD   := FieldByName('OT_Cta_Bco_descripcion_provincia').AsString;
        var_OT_Cta_Bco_descripcion_pais_OLD        := FieldByName('OT_Cta_Bco_descripcion_pais').AsString;
        var_OT_descripcion_forma_pago_OLD          := FieldByName('OT_descripcion_forma_pago').AsString;
        var_id_poblaciones_OLD                     := FieldByName('id_poblaciones').AsString;
        var_id_provincias_OLD                      := FieldByName('id_provincias').AsString;
        var_id_paises_OLD                          := FieldByName('id_paises').AsString;

        var_OT_descripcion_poblacion               := FieldByName('OT_descripcion_poblacion').AsString;
        var_OT_descripcion_provincia               := FieldByName('OT_descripcion_provincia').AsString;
        var_OT_descripcion_pais                    := FieldByName('OT_descripcion_pais').AsString;

        var_id_formas_pago_OLD                     := FieldByName('id_formas_pago').AsString;
        var_Cta_Bco_id_poblaciones_OLD             := FieldByName('Cta_Bco_id_poblaciones').AsString;
        var_Cta_Bco_id_provincias_OLD              := FieldByName('Cta_Bco_id_provincias').AsString;
        var_Cta_Bco_id_paises_OLD                  := FieldByName('Cta_Bco_id_paises').AsString;
        var_agencias_transporte_id_proveedores_OLD := FieldByName('agencias_transporte_id_proveedores').AsString;
        var_nombre_propietario_OLD                 := FieldByName('nombre_propietario').AsString;
        var_nombre_comercial_OLD                   := FieldByName('nombre_comercial').AsString;
        var_nif_cif_OLD                            := FieldByName('nif_cif').AsString;
        var_Tfno_Fijo_1_OLD                        := FieldByName('Tfno_Fijo_1').AsString;
        var_Tfno_Fijo_2_OLD                        := FieldByName('Tfno_Fijo_2').AsString;
        var_FAX_OLD                                := FieldByName('FAX').AsString;
        var_Movil_OLD                              := FieldByName('Movil').AsString;
        var_Direccion_OLD                          := FieldByName('Direccion').AsString;
        var_Direccion_Numero_OLD                   := FieldByName('Direccion_Numero').AsString;
        var_Direccion_Piso_Letra_OLD               := FieldByName('Direccion_Piso_Letra').AsString;
        var_Codigo_Postal_OLD                      := FieldByName('Codigo_Postal').AsString;
        var_Forma_pago_Dia_1_OLD                   := FieldByName('Forma_pago_Dia_1').AsString;
        var_Forma_pago_Dia_2_OLD                   := FieldByName('Forma_pago_Dia_2').AsString;
        var_Vencimientos_automaticos_SN_OLD        := FieldByName('Vencimientos_automaticos_SN').AsString;
        var_Vencimientos_Cantidad_OLD              := FieldByName('Vencimientos_Cantidad').AsString;
        var_Vencimientos_Dias_Entre_OLD            := FieldByName('Vencimientos_Dias_Entre').AsString;
        var_Forma_pago_Vacaciones_Dia_Inicio_OLD   := FieldByName('Forma_pago_Vacaciones_Dia_Inicio').AsString;
        var_Forma_pago_Vacaciones_Mes_Inicio_OLD   := FieldByName('Forma_pago_Vacaciones_Mes_Inicio').AsString;
        var_Forma_pago_Vacaciones_Dia_Fin_OLD      := FieldByName('Forma_pago_Vacaciones_Dia_Fin').AsString;
        var_Forma_pago_Vacaciones_Mes_Fin_OLD      := FieldByName('Forma_pago_Vacaciones_Mes_Fin').AsString;
        var_Cta_Bco_Entidad_OLD                    := FieldByName('Cta_Bco_Entidad').AsString;
        var_Cta_Bco_Sucursal_OLD                   := FieldByName('Cta_Bco_Sucursal').AsString;
        var_Cta_Bco_Digito_Control_OLD             := FieldByName('Cta_Bco_Digito_Control').AsString;
        var_Cta_Bco_Cuenta_OLD                     := FieldByName('Cta_Bco_Cuenta').AsString;
        var_Cta_Bco_IBAN_OLD                       := FieldByName('Cta_Bco_IBAN').AsString;
        var_Cta_Bco_BIC_SWIFT_OLD                  := FieldByName('Cta_Bco_BIC_SWIFT').AsString;
        var_Cta_Bco_Mandato_Fecha_de_Firma_OLD     := FieldByName('Cta_Bco_Mandato_Fecha_de_Firma').AsString;
        var_Cta_Bco_Mandato_Ref_OLD                := FieldByName('Cta_Bco_Mandato_Ref').AsString;
        var_Cta_Bco_Direccion_OLD                  := FieldByName('Cta_Bco_Direccion').AsString;
        var_Cta_Bco_Direccion_Numero_OLD           := FieldByName('Cta_Bco_Direccion_Numero').AsString;
        var_Cta_Bco_Direccion_Piso_Letra_OLD       := FieldByName('Cta_Bco_Direccion_Piso_Letra').AsString;
        var_Cta_Bco_Codigo_Postal_OLD              := FieldByName('Cta_Bco_Codigo_Postal').AsString;
        var_IVA_con_Recargo_SN_OLD                 := FieldByName('IVA_con_Recargo_SN').AsString;
        var_IVA_Excluido_SN_OLD                    := FieldByName('IVA_Excluido_SN').AsString;
        var_Retencion_OLD                          := FieldByName('Retencion').AsString;
        var_Descuento_Comercial_1_OLD              := FieldByName('Descuento_Comercial_1').AsString;
        var_Descuento_Comercial_2_OLD              := FieldByName('Descuento_Comercial_2').AsString;
        var_Descuento_Pronto_Pago_OLD              := FieldByName('Descuento_Pronto_Pago').AsString;
        var_Descuento_Final_OLD                    := FieldByName('Descuento_Final').AsString;
        var_Observaciones_OLD                      := FieldByName('Observaciones').AsString;

        // ***************************************************************************************** //
        // ** Continuamos                                                                         ** //
        // ***************************************************************************************** //
        var_Rgtro := UTI_Abrir_Form( true, false, '', 120 );  aqui tiene que ser el de proveedores
        if var_Rgtro.id_1 <> '' then
        begin
             FieldByName('id_proveedores').AsString := Trim(var_Rgtro.id_1);

             if Trim(var_Rgtro.descripcion_1) <> '' then
             begin
                 Edit_Descripcion_Proveedor.Text := var_Rgtro.descripcion_1;
             end else begin
                 Edit_Descripcion_Proveedor.Text := var_Rgtro.descripcion_2;
             end;

             FieldByName('OT_descripcion_proveedor').AsString := Edit_Descripcion_Proveedor.Text;

             var_Rgtro_Pro := UTI_DATOS_TABLA_Traer_Proveedores_xID( Trim(var_Rgtro.id_1) );

             if var_Rgtro_Pro.id <> '0' then
             begin
                 FieldByName('OT_Cta_Bco_descripcion_poblacion').AsString   := var_Rgtro_Pro.OT_Cta_Bco_descripcion_poblacion;
                 FieldByName('OT_Cta_Bco_descripcion_provincia').AsString   := var_Rgtro_Pro.OT_Cta_Bco_descripcion_provincia;
                 FieldByName('OT_Cta_Bco_descripcion_pais').AsString        := var_Rgtro_Pro.OT_Cta_Bco_descripcion_pais;
                 FieldByName('OT_descripcion_forma_pago').AsString          := var_Rgtro_Pro.OT_descripcion_forma_pago;
                 FieldByName('id_proveedores').AsString                     := var_Rgtro_Pro.id;
                 FieldByName('id_poblaciones').AsString                     := var_Rgtro_Pro.id_poblaciones;
                 FieldByName('id_provincias').AsString                      := var_Rgtro_Pro.id_provincias;
                 FieldByName('id_paises').AsString                          := var_Rgtro_Pro.id_paises;

                 FieldByName('OT_descripcion_poblacion').AsString           := var_Rgtro_Pro.OT_descripcion_poblacion;
                 FieldByName('OT_descripcion_provincia').AsString           := var_Rgtro_Pro.OT_descripcion_provincia;
                 FieldByName('OT_descripcion_pais').AsString                := var_Rgtro_Pro.OT_descripcion_pais;

                 FieldByName('id_formas_pago').AsString                     := var_Rgtro_Pro.id_formas_pago;
                 FieldByName('Cta_Bco_id_poblaciones').AsString             := var_Rgtro_Pro.id_Cta_Bco_poblaciones;
                 FieldByName('Cta_Bco_id_provincias').AsString              := var_Rgtro_Pro.id_Cta_Bco_provincias;
                 FieldByName('Cta_Bco_id_paises').AsString                  := var_Rgtro_Pro.id_Cta_Bco_pais;
                 FieldByName('agencias_transporte_id_proveedores').AsString := var_Rgtro_Pro.id_Agencias_Transporte;
                 FieldByName('nombre_propietario').AsString                 := var_Rgtro_Pro.nombre_propietario;
                 FieldByName('nombre_comercial').AsString                   := var_Rgtro_Pro.nombre_comercial;
                 FieldByName('nif_cif').AsString                            := var_Rgtro_Pro.nif_cif;
                 FieldByName('Tfno_Fijo_1').AsString                        := var_Rgtro_Pro.Tfno_Fijo_1;
                 FieldByName('Tfno_Fijo_2').AsString                        := var_Rgtro_Pro.Tfno_Fijo_2;
                 FieldByName('FAX').AsString                                := var_Rgtro_Pro.FAX;
                 FieldByName('Movil').AsString                              := var_Rgtro_Pro.Movil;
                 FieldByName('Direccion').AsString                          := var_Rgtro_Pro.Direccion;
                 FieldByName('Direccion_Numero').AsString                   := var_Rgtro_Pro.Direccion_Numero;
                 FieldByName('Direccion_Piso_Letra').AsString               := var_Rgtro_Pro.Direccion_Piso_Letra;
                 FieldByName('Codigo_Postal').AsString                      := var_Rgtro_Pro.Codigo_Postal;
                 FieldByName('Forma_pago_Dia_1').AsString                   := var_Rgtro_Pro.Forma_pago_Dia_1;
                 FieldByName('Forma_pago_Dia_2').AsString                   := var_Rgtro_Pro.Forma_pago_Dia_2;
                 FieldByName('Vencimientos_automaticos_SN').AsString        := var_Rgtro_Pro.Vencimientos_automaticos_SN;
                 FieldByName('Vencimientos_Cantidad').AsString              := var_Rgtro_Pro.Vencimientos_Cantidad;
                 FieldByName('Vencimientos_Dias_Entre').AsString            := var_Rgtro_Pro.Vencimientos_Dias_Entre;
                 FieldByName('Forma_pago_Vacaciones_Dia_Inicio').AsString   := var_Rgtro_Pro.Forma_pago_Vacaciones_Dia_Inicio;
                 FieldByName('Forma_pago_Vacaciones_Mes_Inicio').AsString   := var_Rgtro_Pro.Forma_pago_Vacaciones_Mes_Inicio;
                 FieldByName('Forma_pago_Vacaciones_Dia_Fin').AsString      := var_Rgtro_Pro.Forma_pago_Vacaciones_Dia_Fin;
                 FieldByName('Forma_pago_Vacaciones_Mes_Fin').AsString      := var_Rgtro_Pro.Forma_pago_Vacaciones_Mes_Fin;
                 FieldByName('Cta_Bco_Entidad').AsString                    := var_Rgtro_Pro.Cta_Bco_Entidad;
                 FieldByName('Cta_Bco_Sucursal').AsString                   := var_Rgtro_Pro.Cta_Bco_Sucursal;
                 FieldByName('Cta_Bco_Digito_Control').AsString             := var_Rgtro_Pro.Cta_Bco_Digito_Control;
                 FieldByName('Cta_Bco_Cuenta').AsString                     := var_Rgtro_Pro.Cta_Bco_Cuenta;
                 FieldByName('Cta_Bco_IBAN').AsString                       := var_Rgtro_Pro.Cta_Bco_IBAN;
                 FieldByName('Cta_Bco_BIC_SWIFT').AsString                  := var_Rgtro_Pro.Cta_Bco_BIC_SWIFT;
                 FieldByName('Cta_Bco_Mandato_Fecha_de_Firma').AsString     := var_Rgtro_Pro.Cta_Bco_Mandato_Fecha_de_Firma;
                 FieldByName('Cta_Bco_Mandato_Ref').AsString                := var_Rgtro_Pro.Cta_Bco_Mandato_Ref;
                 FieldByName('Cta_Bco_Direccion').AsString                  := var_Rgtro_Pro.Cta_Bco_Direccion;
                 FieldByName('Cta_Bco_Direccion_Numero').AsString           := var_Rgtro_Pro.Cta_Bco_Direccion_Numero;
                 FieldByName('Cta_Bco_Direccion_Piso_Letra').AsString       := var_Rgtro_Pro.Cta_Bco_Direccion_Piso_Letra;
                 FieldByName('Cta_Bco_Codigo_Postal').AsString              := var_Rgtro_Pro.Cta_Bco_Codigo_Postal;
                 FieldByName('IVA_con_Recargo_SN').AsString                 := var_Rgtro_Pro.IVA_con_Recargo_SN;
                 FieldByName('IVA_Excluido_SN').AsString                    := var_Rgtro_Pro.IVA_Excluido_SN;
                 FieldByName('Retencion').AsString                          := var_Rgtro_Pro.Retencion;
                 FieldByName('Descuento_Comercial_1').AsString              := var_Rgtro_Pro.Descuento_Comercial_1;
                 FieldByName('Descuento_Comercial_2').AsString              := var_Rgtro_Pro.Descuento_Comercial_2;
                 FieldByName('Descuento_Pronto_Pago').AsString              := var_Rgtro_Pro.Descuento_Pronto_Pago;
                 FieldByName('Descuento_Final').AsString                    := var_Rgtro_Pro.Descuento_Final;

                 FieldByName('Observaciones').Clear;
                 if Trim(var_Rgtro_Pro.Observaciones_Comentarios) <> '' then
                 begin
                     FieldByName('Observaciones').AsString := var_Rgtro_Pro.Observaciones_Comentarios;

                     var_msg := TStringList.Create;
                     var_msg.Add('ATENTO hay OBSERVACIONES');
                     UTI_GEN_Aviso(true,  var_msg,
                                    'El proveedor elegido tiene observaciones y las hemos puesto en' +
                                    ' las observaciones. Están bajo la lengüeta de' +
                                    ' COMENTARIOS / OBSERVACIONES.',
                                    True,
                                    False );
                     var_msg.Free;
                 end;
             end;

             Presentar_Datos;

             // ************************************************************************************ //
             // ** Si se están creando la CABECERA, todavía no hay ninguna línea de detalle, ni se** //
             // ** permite crearla, por lo que no es necesario cambiarles el cliente              ** //
             // ************************************************************************************ //
             if form_presupuestos_compras_000.SQLQuery_Presup.State = dsEdit then
             begin
                 if UTI_COMPRAS_Update_Proveedor_Cabecera_Presupuesto( Trim(var_Rgtro.id_1),
                                                                      FieldByName('id').AsString ) = false then
                 begin
                     var_msg := TStringList.Create;
                     var_msg.Add( 'No se pudo, actualizar el proveedor ni a la cabecera, ni a sus líneas de detalle.');
                     UTI_GEN_Aviso(true, var_msg, rs_No_Se_Pudo, True, False);
                     var_msg.Free;

                     // **************************************************************************** //
                     // ** Dejamos los datos del almacén como estaban antes                       ** //
                     // **************************************************************************** //
                     FieldByName('id_proveedores').AsString                     := var_id_proveedores_OLD;
                     FieldByName('OT_descripcion_proveedor').AsString           := var_Edit_Descripcion_Proveedor_OLD;
                     FieldByName('OT_Cta_Bco_descripcion_poblacion').AsString   := var_OT_Cta_Bco_descripcion_poblacion_OLD;
                     FieldByName('OT_Cta_Bco_descripcion_provincia').AsString   := var_OT_Cta_Bco_descripcion_provincia_OLD;
                     FieldByName('OT_Cta_Bco_descripcion_pais').AsString        := var_OT_Cta_Bco_descripcion_pais_OLD;
                     FieldByName('OT_descripcion_forma_pago').AsString          := var_OT_descripcion_forma_pago_OLD;

                     FieldByName('id_poblaciones').AsString                     := var_id_poblaciones_OLD;
                     FieldByName('id_provincias').AsString                      := var_id_provincias_OLD;
                     FieldByName('id_paises').AsString                          := var_id_paises_OLD;
                     FieldByName('OT_descripcion_poblacion').AsString           := var_Rgtro_Pro.OT_descripcion_poblacion;
                     FieldByName('OT_descripcion_provincia').AsString           := var_Rgtro_Pro.OT_descripcion_provincia;
                     FieldByName('OT_descripcion_pais').AsString                := var_Rgtro_Pro.OT_descripcion_pais;

                     FieldByName('id_formas_pago').AsString                     := var_id_formas_pago_OLD;
                     FieldByName('Cta_Bco_id_poblaciones').AsString             := var_Cta_Bco_id_poblaciones_OLD;
                     FieldByName('Cta_Bco_id_provincias').AsString              := var_Cta_Bco_id_provincias_OLD;
                     FieldByName('Cta_Bco_id_paises').AsString                  := var_Cta_Bco_id_paises_OLD;

                     FieldByName('agencias_transporte_id_proveedores').AsString := var_agencias_transporte_id_proveedores_OLD;
                     FieldByName('OT_descripcion_transportista').AsString       := var_Rgtro_Pro.OT_descripcion_agencia_transporte;

                     FieldByName('OT_tfno_1_transportista').AsString            := var_Rgtro_Pro.OT_Tfno_Fijo_1_agencia_transporte;
                     FieldByName('OT_Movil_transportista').AsString             := var_Rgtro_Pro.OT_Movil_agencia_transporte;

                     FieldByName('nombre_propietario').AsString                 := var_nombre_propietario_OLD;
                     FieldByName('nombre_comercial').AsString                   := var_nombre_comercial_OLD;
                     FieldByName('nif_cif').AsString                            := var_nif_cif_OLD;
                     FieldByName('Tfno_Fijo_1').AsString                        := var_Tfno_Fijo_1_OLD;
                     FieldByName('Tfno_Fijo_2').AsString                        := var_Tfno_Fijo_2_OLD;
                     FieldByName('FAX').AsString                                := var_FAX_OLD;
                     FieldByName('Movil').AsString                              := var_Movil_OLD;
                     FieldByName('Direccion').AsString                          := var_Direccion_OLD;
                     FieldByName('Direccion_Numero').AsString                   := var_Direccion_Numero_OLD;
                     FieldByName('Direccion_Piso_Letra').AsString               := var_Direccion_Piso_Letra_OLD;
                     FieldByName('Codigo_Postal').AsString                      := var_Codigo_Postal_OLD;
                     FieldByName('Forma_pago_Dia_1').AsString                   := var_Forma_pago_Dia_1_OLD;
                     FieldByName('Forma_pago_Dia_2').AsString                   := var_Forma_pago_Dia_2_OLD;
                     FieldByName('Vencimientos_automaticos_SN').AsString        := var_Vencimientos_automaticos_SN_OLD;
                     FieldByName('Vencimientos_Cantidad').AsString              := var_Vencimientos_Cantidad_OLD;
                     FieldByName('Vencimientos_Dias_Entre').AsString            := var_Vencimientos_Dias_Entre_OLD;
                     FieldByName('Forma_pago_Vacaciones_Dia_Inicio').AsString   := var_Forma_pago_Vacaciones_Dia_Inicio_OLD;
                     FieldByName('Forma_pago_Vacaciones_Mes_Inicio').AsString   := var_Forma_pago_Vacaciones_Mes_Inicio_OLD;
                     FieldByName('Forma_pago_Vacaciones_Dia_Fin').AsString      := var_Forma_pago_Vacaciones_Dia_Fin_OLD;
                     FieldByName('Forma_pago_Vacaciones_Mes_Fin').AsString      := var_Forma_pago_Vacaciones_Mes_Fin_OLD;
                     FieldByName('Cta_Bco_Entidad').AsString                    := var_Cta_Bco_Entidad_OLD;
                     FieldByName('Cta_Bco_Sucursal').AsString                   := var_Cta_Bco_Sucursal_OLD;
                     FieldByName('Cta_Bco_Digito_Control').AsString             := var_Cta_Bco_Digito_Control_OLD;
                     FieldByName('Cta_Bco_Cuenta').AsString                     := var_Cta_Bco_Cuenta_OLD;
                     FieldByName('Cta_Bco_IBAN').AsString                       := var_Cta_Bco_IBAN_OLD;
                     FieldByName('Cta_Bco_BIC_SWIFT').AsString                  := var_Cta_Bco_BIC_SWIFT_OLD;
                     FieldByName('Cta_Bco_Mandato_Fecha_de_Firma').AsString     := var_Cta_Bco_Mandato_Fecha_de_Firma_OLD;
                     FieldByName('Cta_Bco_Mandato_Ref').AsString                := var_Cta_Bco_Mandato_Ref_OLD;
                     FieldByName('Cta_Bco_Direccion').AsString                  := var_Cta_Bco_Direccion_OLD;
                     FieldByName('Cta_Bco_Direccion_Numero').AsString           := var_Cta_Bco_Direccion_Numero_OLD;
                     FieldByName('Cta_Bco_Direccion_Piso_Letra').AsString       := var_Cta_Bco_Direccion_Piso_Letra_OLD;
                     FieldByName('Cta_Bco_Codigo_Postal').AsString              := var_Cta_Bco_Codigo_Postal_OLD;
                     FieldByName('IVA_con_Recargo_SN').AsString                 := var_IVA_con_Recargo_SN_OLD;
                     FieldByName('IVA_Excluido_SN').AsString                    := var_IVA_Excluido_SN_OLD;
                     FieldByName('Retencion').AsString                          := var_Retencion_OLD;
                     FieldByName('Descuento_Comercial_1').AsString              := var_Descuento_Comercial_1_OLD;
                     FieldByName('Descuento_Comercial_2').AsString              := var_Descuento_Comercial_2_OLD;
                     FieldByName('Descuento_Pronto_Pago').AsString              := var_Descuento_Pronto_Pago_OLD;
                     FieldByName('Descuento_Final').AsString                    := var_Descuento_Final_OLD;
                     FieldByName('Observaciones').AsString                      := var_Observaciones_OLD;
                 end else begin
                     if form_presupuestos_compras_000.Cambiar_Almacen_y_proveedor_Lineas_Detalle( Trim(FieldByName('id_almacenes').AsString),
                                                                                                  Trim(var_Rgtro.id_1),
                                                                                                  Trim(FieldByName('id').AsString) ) = false then
                     begin
                         // ************************************************************************ //
                         // ** Se produjo un error al cambiar en las líneas de detalle el almacén,** //
                         // ** así que nos salimos a la tremenda porque al volver a entrar en este** //
                         // ** albarán se volverá a ajustar el almacén a toda línea de detalle    ** //
                         // ************************************************************************ //
                         private_Salir_OK     := true;
                         public_Pulso_Aceptar := true;

                         Close;
                     end;
                 end;
             end;
        end;
    end;
end;

procedure Tform_presupuestos_compras_001.Boton_Elegir_AlmacenClick(Sender: TObject);
var var_Registro         : TRecord_Rgtro_Comun;
    var_msg              : TStrings;
    var_Descripcion_OLD  : String;
    var_id_almacenes_OLD : String;
begin
    if Cambiamos_Almacen_SN = false then Exit;

    with form_presupuestos_compras_000.SQLQuery_Presup do
    begin
        // ***************************************************************************************** //
        // ** Guardamos los datos del almacén antes de ser cambiados                              ** //
        // ***************************************************************************************** //
        var_id_almacenes_OLD := FieldByName('id_almacenes').AsString;
        var_Descripcion_OLD  := Edit_Descripcion_Almacen.Text;

        // ***************************************************************************************** //
        // ** Continuamos con el cambio de almacén                                                ** //
        // ***************************************************************************************** //
        var_Registro := UTI_Abrir_Form( true, false, '', 260 );
        if var_Registro.id_1 <> '' then
        begin
            FieldByName('id_almacenes').AsString           := Trim(var_Registro.id_1);
            Edit_Descripcion_Almacen.Text                  := var_Registro.descripcion_1;
            FieldByName('OT_descripcion_almacen').AsString := var_Registro.descripcion_1;

            // ************************************************************************************* //
            // ** Si se están creando la CABECERA, todavía no hay ninguna línea de detalle, ni se ** //
            // ** permite crearla, por lo que no es necesario cambiarles el almacen               ** //
            // ************************************************************************************* //
            if form_presupuestos_compras_000.SQLQuery_Presup.State = dsEdit then
            begin
                if UTI_COMPRAS_Update_Almacen_Cabecera_Presupuesto( Trim(var_Registro.id_1),
                                                                    FieldByName('id').AsString ) = false then
                begin
                    var_msg := TStringList.Create;
                    var_msg.Add( 'No se pudo, actualizar el almacén ni a la cabecera, ni a sus líneas de detalle.');
                    UTI_GEN_Aviso(true, var_msg, rs_No_Se_Pudo, True, False);
                    var_msg.Free;

                    // ***************************************************************************** //
                    // ** Dejamos los datos del almacén como estaban antes                        ** //
                    // ***************************************************************************** //
                    FieldByName('id_almacenes').AsString := var_id_almacenes_OLD;
                    Edit_Descripcion_Almacen.Text        := var_Descripcion_OLD;
                end else begin
                    if form_presupuestos_compras_000.Cambiar_Almacen_y_proveedor_Lineas_Detalle( Trim(var_Registro.id_1),
                                                                                                 Trim(FieldByName('id_clientes').AsString),
                                                                                                 Trim(FieldByName('id').AsString) ) = false then
                    begin
                        // ************************************************************************* //
                        // ** Se produjo un error al cambiar en las líneas de detalle el almacén, ** //
                        // ** así que nos salimos a la tremenda porque al volver a entrar en este ** //
                        // ** albarán se volverá a ajustar el almacén a toda línea de detalle     ** //
                        // ************************************************************************* //
                        private_Salir_OK     := true;
                        public_Pulso_Aceptar := true;

                        Close;
                    end;
                end;
            end;
        end;
    end;
end;

procedure Tform_presupuestos_compras_001.Boton_Elegir_Direccion_EnvioClick(
  Sender: TObject);
begin

end;

procedure Tform_presupuestos_compras_001.Edit_Descripcion_AlmacenClick(Sender: TObject);
var var_msg : TStrings;
begin
    if Cambiamos_Almacen_SN = false then Exit;

    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS el ALMACEN?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_presupuestos_compras_000.SQLQuery_Presup.FieldByName('id_almacenes').Clear;
         Edit_Descripcion_Almacen.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_presupuestos_compras_001.Boton_Elegir_EmpresaClick(Sender: TObject);
var var_Registro         : TRecord_Rgtro_Comun;
    var_Registro_Empresa : TEmpresas;
    var_msg              : TStrings;
    var_Cambiamos        : Boolean;
begin
    with form_presupuestos_compras_000.SQLQuery_Presup do
    begin
        var_Registro := UTI_Abrir_Form( true, false, '', 250 );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_empresas').AsString            := Trim(var_Registro.id_1);
             Edit_Descripcion_Empresa.Text                  := var_Registro.descripcion_1;
             FieldByName('OT_descripcion_empresa').AsString := var_Registro.descripcion_1;

             var_Registro_Empresa := UTI_DATOS_TABLA_Traer_Empresas_xID( Trim(var_Registro.id_1) );

             if var_Registro_Empresa.id <> '0' then
             begin
                 // ******************************************************************************** //
                 // ** Ponemos desde aquí en dirección de envío los mismos datos de dirección de  ** //
                 // ** nuestra empresa                                                            ** //
                 // ******************************************************************************** //
                 var_Cambiamos := true;

                 if ( Trim(FieldByName('Envio_Direccion').AsString) <> '' )           or
                    ( Trim(FieldByName('Envio_Direccion_Numero').AsString <> '' )     or
                    ( Trim(FieldByName('Envio_Direccion_Piso_Letra').AsString <> '' ) or
                    ( Trim(FieldByName('Envio_Codigo_Postal').AsString <> '' )        or
                    ( Trim(FieldByName('Envio_id_provincias').AsString <> '' )        or
                    ( Trim(FieldByName('Envio_id_paises').AsString <> '' )            or
                    ( Trim(FieldByName('Envio_id_poblaciones').AsString <> '' )       then
                 begin
                     PageControl_Otros_Datos.ActivePage := TabSheet5;
                     PageControl_Datos_Envio.ActivePage := TabSheet_Direccion_Envio;

                     var_msg := TStringList.Create;
                     var_msg.Add('TENEMOS YA UNA DIRECCION DE ENVIO, ¿SUSTITUIMOS ESTA POR LA DE LA EMPRESA?');
                     if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = false then
                     begin
                         var_Cambiamos := false;
                     end;
                     var_msg.Free;
                 end;

                 if var_Cambiamos = true then
                 begin
                     FieldByName('Envio_Direccion').AsString                := var_Registro_Empresa.Direccion;
                     FieldByName('Envio_Direccion_Numero').AsString         := var_Registro_Empresa.Direccion_Numero;
                     FieldByName('Envio_Direccion_Piso_Letra').AsString     := var_Registro_Empresa.Direccion_Piso_Letra;
                     FieldByName('Envio_Codigo_Postal').AsString            := var_Registro_Empresa.Codigo_Postal;

                     FieldByName('Envio_id_provincias').AsString            := var_Registro_Empresa.id_provincias;
                     FieldByName('Envio_id_paises').AsString                := var_Registro_Empresa.id_paises;
                     FieldByName('Envio_id_poblaciones').AsString           := var_Registro_Empresa.id_poblaciones;

                     FieldByName('OT_Envio_descripcion_poblacion').AsString := var_Registro_Empresa.OT_Envio_descripcion_poblacion;
                     FieldByName('OT_Envio_descripcion_provincia').AsString := var_Registro_Empresa.OT_Envio_descripcion_provincia;
                     FieldByName('OT_Envio_descripcion_pais').AsString      := var_Registro_Empresa.OT_Envio_descripcion_pais;

                     Presentar_Datos_Direccion_de_Envio;
                 end;
             end;
        end;
    end;
end;

procedure Tform_presupuestos_compras_001.Edit_Descripcion_EmpresaClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS la EMPRESA?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_presupuestos_compras_000.SQLQuery_Presup.FieldByName('id_empresas').Clear;
         Edit_Descripcion_Empresa.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_presupuestos_compras_001.Boton_Elegir_Forma_PagoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_presupuestos_compras_000.SQLQuery_Presup do
    begin
        var_Registro := UTI_Abrir_Form( true, false, '', 80 );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_formas_pago').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Forma_Pago.Text       := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_presupuestos_compras_001.Edit_Descripcion_Forma_PagoClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS la FORMA DE PAGO?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_presupuestos_compras_000.SQLQuery_Presup.FieldByName('id_formas_pago').Clear;
         Edit_Descripcion_Forma_Pago.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_presupuestos_compras_001.Boton_Elegir_Direccion_EnvioClick(Sender: TObject);
var var_Registro          : TRecord_Rgtro_Comun;
    var_Registro_Contacto : TProveedores_Contactos;
begin
    with form_presupuestos_compras_000.SQLQuery_Presup do
    begin
        if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
        begin
            var_Registro := Con_Que_Contacto_Hablemos_para_Envio;
            if var_Registro.id_1 <> '' then
            begin
                var_Registro_Envio := UTI_DATOS_TABLA_Traer_Clientes_Envios_xID( Trim(var_Registro.id_1) );

                if var_Registro_Envio.id <> '0' then
                begin
                    FieldByName('Envio_Con_Quien_Hablar').AsString := var_Registro_Contacto.OT_descripcion_Contacto;
                    FieldByName('Envio_Tfno_Fijo_1').AsString      := var_Registro_Contacto.Tfno_Fijo_1;
                    FieldByName('Envio_Tfno_Fijo_2').AsString      := var_Registro_Contacto.Tfno_Fijo_2;
                    FieldByName('Envio_FAX').AsString              := var_Registro_Contacto.FAX;
                    FieldByName('Envio_Movil').AsString            := var_Registro_Contacto.Movil;
                    FieldByName('Envio_eMail').AsString            := var_Registro_Contacto.eMail;
                end;

                Presentar_Datos_Direccion_de_Envio;
            end;
        end;
    end;
end;

procedure Tform_presupuestos_compras_001.Edit_Direccion_de_Envio_con_Quien_HablarClick(Sender: TObject);
begin
    Vaciar_Datos_Envio;
end;

function Tform_presupuestos_compras_001.Comprobar_No_Tocar( param_Reproducir_Mensajes,
                                                            param_Ejecutar_No_Tocar : Boolean ) : Boolean;
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    Result  := false;

    // ********************************************************************************************* //
    // ** Si se llamó para solo verlo, pues no se puede tocar                                     ** //
    // ********************************************************************************************* //
    if public_Solo_Ver = true then
    begin
        Result := true;
        if param_Ejecutar_No_Tocar = true then no_Tocar;
    end;

    // ********************************************************************************************* //
    // ** Si el presupuesto está cerrado no se puede modificar nada de él                         ** //
    // ********************************************************************************************* //
    with form_presupuestos_compras_000.SQLQuery_Presup do
    begin
        if UTI_COMPRAS_Esta_Cerrado_SN( 'presupuestos_compras', FieldByName('id').AsString ) = 'S' then
        begin
            Result := true;
            if param_Reproducir_Mensajes = true then
            begin
                var_msg.Add( '* El presupuesto está cerrado, no se puede modificar nada de él.' );

                if param_Ejecutar_No_Tocar = true then no_Tocar;
            end;
        end;
    end;

    // ********************************************************************************************* //
    // ** Si el presupuesto está borrado, no permitimos hacer nada con el.                        ** //
    // ********************************************************************************************* //
    if not form_presupuestos_compras_000.SQLQuery_Presup.FieldByName('Del_WHEN').IsNull then
    begin
        Result := true;

        if param_Reproducir_Mensajes = true then
        begin
            var_msg.Add( '* Es un presupuesto borrado, no se puede modificar nada de el. ' +
                         'Si desea modificarlo, primero hay que darlo de alta anteriormente.' );
        end;

        if param_Ejecutar_No_Tocar = true then no_Tocar;
    end;

    // ********************************************************************************************* //
    // ** Si se creó un nuevo mensaje a presentar, lo hacemos                                     ** //
    // ********************************************************************************************* //
    if Trim(var_msg.Text) <> '' then
    begin
        UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
    end;

    var_msg.Free;
end;

procedure Tform_presupuestos_compras_001.Edit_Descripcion_ProveedorClick(Sender: TObject);
begin
    if Cambiamos_Proveedor_SN = false then Exit;

    Vaciar_Proveedor_Datos;
end;

procedure Tform_presupuestos_compras_001.DBNavigator_DetallesBeforeAction( Sender: TObject;
                                                                           Button: TDBNavButtonType);
begin
    case Button of
        nbInsert : begin
            Insertar_Registro_Detalles;
            Abort;
        end;

        nbEdit : begin
            Editar_Registro_Detalles;
            Abort;
        end;

        nbDelete : begin
            Borrar_Registro_Detalle;
            Abort;
        end;

        nbRefresh : begin
            form_presupuestos_compras_000.Refrescar_Registros_Detalles;
            Abort;
        end;
    end;
end;

procedure Tform_presupuestos_compras_001.DBGrid_DetallesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if Key = 13 then Editar_Registro_Detalles;
end;

procedure Tform_presupuestos_compras_001.DBGrid_DetallesDblClick(Sender: TObject);
begin
    Editar_Registro_Detalles;
end;

procedure Tform_presupuestos_compras_001.Edit_Direccion_de_Envio_Agencia_Transporte_DescripcionClick(Sender: TObject);
begin
    Vaciar_Datos_Agencia_de_Transporte;
end;

procedure Tform_presupuestos_compras_001.Boton_Elegir_Agencia_TransporteClick(Sender: TObject);
var var_Registro               : TRecord_Rgtro_Comun;
    var_Registro_Ag_Transporte : TProveedores;
    var_msg                    : TStrings;
begin
    with form_presupuestos_compras_000.SQLQuery_Presup do
    begin
        var_msg := TStringList.Create;
        var_msg.Add('¿DE DONDE TRAEMOS EL TRANSPORTISTA ...');
        var_msg.Add(' ');
        var_msg.Add('BUSCAMOS EN LA FICHA DE UN PROVEEDOR (botón OK)');
        var_msg.Add('ó BUSCAMOS EN PROVEEDORES QUE TRANSPORTISTA USAREMOS (botón CANCEL) ?');

        if UTI_GEN_Aviso(true, var_msg, 'ELIJA ... ', True, True) = True then
        begin
            // ************************************************************************************* //
            // ** Buscamos en la ficha de un PROVEEDOR cual es su agencia de transporte           ** //
            // ************************************************************************************* //
            var_Registro := UTI_Abrir_Form( true, false, '', 120 );
            if var_Registro.id_1 <> '' then
            begin
                 Edit_Direccion_de_Envio_Agencia_Transporte_Descripcion.Text := var_Registro.descripcion_1;

                 var_Registro_Ag_Transporte := UTI_DATOS_TABLA_Traer_Proveedores_xID( Trim(var_Registro.id_2) );
            end;
        end else begin
            // ************************************************************************************* //
            // ** Elegimos en el mantenimiento de proveedores una AGENCIA DE TRANSPORTE           ** //
            // ************************************************************************************* //
            var_Registro := UTI_Abrir_Form( true, false, '', 120 );
            if var_Registro.id_1 <> '' then
            begin
                 Edit_Direccion_de_Envio_Agencia_Transporte_Descripcion.Text := var_Registro.descripcion_1;

                 var_Registro_Ag_Transporte := UTI_DATOS_TABLA_Traer_Proveedores_xID( Trim(var_Registro.id_1) );
            end;
        end;
        var_msg.Free;

        // ***************************************************************************************** //
        // ** Ya nos ha venido con la id del registro elegido, o bien de un PROVEEDOR o bien de un** //
        // ** proveedor. Así que ahora vamos a guardar los datos del transportista elegido        ** //
        // ***************************************************************************************** //
        if var_Registro.id_1 <> '' then
        begin
             if var_Registro_Ag_Transporte.id <> '0' then
             begin
                  FieldByName('agencias_transporte_id_proveedores').AsString  := var_Registro_Ag_Transporte.id;

                  FieldByName('OT_descripcion_transportista').AsString        := var_Registro_Ag_Transporte.nombre_propietario;
                  FieldByName('OT_tfno_1_transportista').AsString             := var_Registro_Ag_Transporte.Tfno_Fijo_1;
                  FieldByName('OT_Movil_transportista').AsString              := var_Registro_Ag_Transporte.Movil;
             end;

             Presentar_Datos_Agencia_de_Transporte;
        end;
    end;
end;

function Tform_presupuestos_compras_001.Con_Que_Contacto_Hablemos_para_Envio : TRecord_Rgtro_Comun;
var var_msg : TStrings;
begin
    Result.id_1 := '';

    if Trim(form_presupuestos_compras_000.SQLQuery_Presup.FieldByName('id_proveedores').AsString) = '' then
    begin
        var_msg := TStringList.Create;
        var_msg.Add('No has elegido todavía ningún proveedor/acreedor para este presupuesto.');
        UTI_GEN_Aviso(true, var_msg, 'AVISAMOS DE ... ', True, False);
        var_msg.Free;
        Exit;
    end;

    if UTI_GEN_Form_Abierto_Ya('form_proveedores_003') = false then
    begin
        Application.CreateForm(Tform_proveedores_003, form_proveedores_003);

        form_proveedores_003.public_Solo_Ver    := true;
        form_proveedores_003.public_Elegimos    := true;
        form_proveedores_003.public_Menu_Worked := public_Menu_Worked;

        form_proveedores_003.Edit_id.Text       := form_presupuestos_compras_000.SQLQuery_Presup.FieldByName('id_proveedores').AsString;
        form_proveedores_003.Edit_Nombre.Text   := Edit_Descripcion_Proveedor.Text;

        form_proveedores_003.para_Empezar;

        form_proveedores_003.ShowModal;

        if form_proveedores_003.public_Rgtro_Seleccionado = true then
        begin
            with form_proveedores_003.SQLQuery_Proveedores_Contactos do
            begin
                Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                      '',
                                                      '',
                                                      FieldByName('nombre').AsString,
                                                      FieldByName('nif').AsString,
                                                      '' );
            end;
        end;

        form_proveedores_003.Free;
    end else begin
        var_msg := TStringList.Create;
        var_msg.Add(rs_Modulo_Abierto);
        UTI_GEN_Aviso(true, var_msg, 'AVISAMOS DE ... ', True, False);
        var_msg.Free;
        Exit;
    end;
end;

procedure Tform_presupuestos_compras_001.Vaciar_Datos_Envio;
var var_msg : TStrings;
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
    begin
        var_msg := TStringList.Create;
        var_msg.Add('¿QUITAMOS los datos de con quién hablemos para el ENVIO?');
        if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
        begin
            with form_presupuestos_compras_000.SQLQuery_Presup do
            begin
                FieldByName('Envio_Con_Quien_Hablar').Clear;
                FieldByName('Envio_Tfno_Fijo_1').Clear;
                FieldByName('Envio_Tfno_Fijo_2').Clear;
                FieldByName('Envio_FAX').Clear;
                FieldByName('Envio_Movil').Clear;
                FieldByName('Envio_eMail').Clear;
            end;

            Edit_Direccion_de_Envio_con_Quien_Hablar.Text := '';
            Edit_Direccion_de_Envio_eMail.Text            := '';
            Edit_Direccion_de_Envio_Tfno_1.Text           := '';
            Edit_Direccion_de_Envio_Tfno_2.Text           := '';
            Edit_Direccion_de_Envio_FAX.Text              := '';
            Edit_Direccion_de_Envio_movil.Text            := '';
        end;

        var_msg.Free;
    end;
end;

procedure Tform_presupuestos_compras_001.Vaciar_Datos_Agencia_de_Transporte;
var var_msg : TStrings;
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
    begin
        var_msg := TStringList.Create;
        var_msg.Add('¿QUITAMOS los datos de la AGENCIA DE TRANSPORTE?');
        if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
        begin
            with form_presupuestos_compras_000.SQLQuery_Presup do
            begin
                FieldByName('agencias_transporte_id_proveedores').Clear;
                FieldByName('OT_descripcion_transportista').Clear;
                FieldByName('OT_tfno_1_transportista').Clear;
                FieldByName('OT_Movil_transportista').Clear;
            end;

            Edit_Direccion_de_Envio_Agencia_Transporte_Descripcion.Text := '';
            Edit_Direccion_de_Envio_Agencia_Transporte_Tfno_Fijo_1.Text := '';
            Edit_Direccion_de_Envio_Agencia_Transporte_Tfno_Movil.Text  := '';
        end;
        var_msg.Free;
    end;
end;

procedure Tform_presupuestos_compras_001.Vaciar_Proveedor_Datos;
var var_msg : TStrings;
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
    begin
        var_msg := TStringList.Create;
        var_msg.Add('¿QUITAMOS los datos del PROVEEDOR/ACREEDOR?');
        if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
        begin
            with form_presupuestos_compras_000.SQLQuery_Presup do
            begin
                FieldByName('id_proveedores').Clear;
                FieldByName('OT_descripcion_proveedor').Clear;

                FieldByName('OT_Cta_Bco_descripcion_poblacion').Clear;
                FieldByName('OT_Cta_Bco_descripcion_provincia').Clear;
                FieldByName('OT_Cta_Bco_descripcion_pais').Clear;

                FieldByName('id_poblaciones').Clear;
                FieldByName('id_provincias').Clear;
                FieldByName('id_paises').Clear;
                FieldByName('id_formas_pago').Clear;
                FieldByName('Cta_Bco_id_poblaciones').Clear;
                FieldByName('Cta_Bco_id_provincias').Clear;
                FieldByName('Cta_Bco_id_paises').Clear;
                FieldByName('agencias_transporte_id_proveedores').Clear;
                FieldByName('nombre_propietario').Clear;
                FieldByName('nombre_comercial').Clear;
                FieldByName('nif_cif').Clear;
                FieldByName('Tfno_Fijo_1').Clear;
                FieldByName('Tfno_Fijo_2').Clear;
                FieldByName('FAX').Clear;
                FieldByName('Movil').Clear;
                FieldByName('Direccion').Clear;
                FieldByName('Direccion_Numero').Clear;
                FieldByName('Direccion_Piso_Letra').Clear;
                FieldByName('Codigo_Postal').Clear;
                FieldByName('Forma_pago_Dia_1').Clear;
                FieldByName('Forma_pago_Dia_2').Clear;
                FieldByName('Vencimientos_automaticos_SN').Clear;
                FieldByName('Vencimientos_Cantidad').Clear;
                FieldByName('Vencimientos_Dias_Entre').Clear;
                FieldByName('Forma_pago_Vacaciones_Dia_Inicio').Clear;
                FieldByName('Forma_pago_Vacaciones_Mes_Inicio').Clear;
                FieldByName('Forma_pago_Vacaciones_Dia_Fin').Clear;
                FieldByName('Forma_pago_Vacaciones_Mes_Fin').Clear;
                FieldByName('Cta_Bco_Entidad').Clear;
                FieldByName('Cta_Bco_Sucursal').Clear;
                FieldByName('Cta_Bco_Digito_Control').Clear;
                FieldByName('Cta_Bco_Cuenta').Clear;
                FieldByName('Cta_Bco_IBAN').Clear;
                FieldByName('Cta_Bco_BIC_SWIFT').Clear;
                FieldByName('Cta_Bco_Mandato_Fecha_de_Firma').Clear;
                FieldByName('Cta_Bco_Mandato_Ref').Clear;
                FieldByName('Cta_Bco_Direccion').Clear;
                FieldByName('Cta_Bco_Direccion_Numero').Clear;
                FieldByName('Cta_Bco_Direccion_Piso_Letra').Clear;
                FieldByName('Cta_Bco_Codigo_Postal').Clear;
                FieldByName('IVA_con_Recargo_SN').Clear;
                FieldByName('IVA_Excluido_SN').Clear;
                FieldByName('Retencion').Clear;
                FieldByName('Descuento_Comercial_1').Clear;
                FieldByName('Descuento_Comercial_2').Clear;
                FieldByName('Descuento_Pronto_Pago').Clear;
                FieldByName('Descuento_Final').Clear;
                FieldByName('Observaciones').Clear;
            end;

            Edit_Descripcion_Proveedor.Text                             := '';
            Edit_Descripcion_Almacen.Text                               := '';
            Edit_Descripcion_Empresa.Text                               := '';

            Edit_Proveedor_Razon_Social.Text                            := '';
            Edit_Proveedor_Nombre_Comercial.Text                        := '';
            Edit_Proveedor_NIF.Text                                     := '';
            Edit_Proveedor_Direccion.Text                               := '';
            Edit_Proveedor_Direccion_Numero.Text                        := '';
            Edit_Proveedor_Direccion_Piso_Letra.Text                    := '';
            Edit_Proveedor_Direccion_Codigo_Postal.Text                 := '';
            Edit_Proveedor_Direccion_Poblacion.Text                     := '';
            Edit_Proveedor_Direccion_Provincia.Text                     := '';
            Edit_Proveedor_Direccion_Pais.Text                          := '';
            Edit_Proveedor_Direccion_Tfno_1.Text                        := '';
            Edit_Proveedor_Direccion_Tfno_2.Text                        := '';
            Edit_Proveedor_Direccion_FAX.Text                           := '';
            Edit_Proveedor_Direccion_Movil.Text                         := '';

            Edit_Datos_Bancarios_Banco.Text                             := '';
            Edit_Datos_Bancarios_Sucursal.Text                          := '';
            Edit_Datos_Bancarios_DC.Text                                := '';
            Edit_Datos_Bancarios_Cuenta.Text                            := '';
            Edit_Datos_Bancarios_BIC_SWIFT.Text                         := '';
            Edit_Datos_Bancarios_IBAN.Text                              := '';
            Edit_Datos_Bancarios_Direccion.Text                         := '';
            Edit_Datos_Bancarios_Direccion_Numero.Text                  := '';
            Edit_Datos_Bancarios_Direccion_Piso_Letra.Text              := '';
            Edit_Datos_Bancarios_Direccion_Codigo_Postal.Text           := '';
            Edit_Datos_Bancarios_Direccion_Poblacion.Text               := '';
            Edit_Datos_Bancarios_Direccion_Provincia.Text               := '';
            Edit_Datos_Bancarios_Direccion_Pais.Text                    := '';
            Edit_Datos_Bancarios_Mandato_Firmado.Text                   := '';
            Edit_Datos_Bancarios_Mandato_Referencia.Text                := '';

            CheckBox_Excluido.Checked                                   := False;
            CheckBox_con_Recargo.Checked                                := False;
            Edit_Retencion.Text                                         := '';
            Edit_Dto_Comercial_1.Text                                   := '';
            Edit_Dto_Comercial_2.Text                                   := '';
            Edit_Dto_Pronto_Pago.Text                                   := '';
            Edit_Dto_Final.Text                                         := '';

            Edit_Descripcion_Forma_Pago.Text                            := '';
            Edit_Dias_Pago_1.Text                                       := '';
            Edit_Dias_Pago_2.Text                                       := '';
            Edit_Periodo_Vacacional_Inicio_Dia.Text                     := '';
            Edit_Periodo_Vacacional_Inicio_Mes.Text                     := '';
            Edit_Periodo_Vacacional_Fin_Dia.Text                        := '';
            Edit_Periodo_Vacacional_Fin_Mes.Text                        := '';
            Edit_Ctdad_Vtos.Text                                        := '';
            Edit_Dias_Entre_Vto.Text                                    := '';
            Edit_Representante_Descripcion.Text                         := '';
            Edit_Representante_Comision.Text                            := '';
            Edit_Representante_Retencion.Text                           := '';
            Edit_Representante_Tfno.Text                                := '';
            Edit_Representante_Tfno_Movil.Text                          := '';

            Edit_Direccion_de_Envio_con_Quien_Hablar.Text               := '';
            Edit_Direccion_de_Envio_eMail.Text                          := '';
            Edit_Direccion_de_Envio_Tfno_1.Text                         := '';
            Edit_Direccion_de_Envio_Tfno_2.Text                         := '';
            Edit_Direccion_de_Envio_FAX.Text                            := '';
            Edit_Direccion_de_Envio_movil.Text                          := '';

            Edit_Direccion_de_Envio_Poblacion.Text                      := '';
            Edit_Direccion_de_Envio_Provincia.Text                      := '';
            Edit_Direccion_de_Envio_Pais.Text                           := '';

            Edit_Direccion_de_Envio_Agencia_Transporte_Descripcion.Text := '';
            Edit_Direccion_de_Envio_Agencia_Transporte_Tfno_Fijo_1.Text := '';
            Edit_Direccion_de_Envio_Agencia_Transporte_Tfno_Movil.Text  := '';
        end;

        var_msg.Free;
    end;
end;

function Tform_presupuestos_compras_001.Cambiamos_Proveedor_SN : Boolean;
var var_msg                   : TStrings;
    var_Estado_Lineas_Detalle : TUTI_COMPRAS_Ctdad_Rgtros_Detalle;
begin
    Result := true;

    if form_presupuestos_compras_000.SQLQuery_Presup_Detalles.Active = false then Exit;

    var_Estado_Lineas_Detalle := UTI_COMPRAS_Estado_Lineas_Detalle( form_presupuestos_compras_000.SQLQuery_Presup_Detalles,
                                                                    'Numero_Pedido_Compras' );

    if var_Estado_Lineas_Detalle.Total_Lineas_Sin_Marcar <> form_presupuestos_compras_000.SQLQuery_Presup_Detalles.RecordCount then
    begin
        var_msg := TStringList.Create;
        var_msg.Add( 'Hay líneas de detalle que fueron convertidas en pedidos, por lo que no ' +
                     'podemos cambiar el proveedor.');

        UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        var_msg.Free;

        Result := false;
    end;
end;

function Tform_presupuestos_compras_001.Cambiamos_Almacen_SN : Boolean;
var var_msg                   : TStrings;
    var_Estado_Lineas_Detalle : TUTI_COMPRAS_Ctdad_Rgtros_Detalle;
begin
    Result := true;

    if form_presupuestos_compras_000.SQLQuery_Presup_Detalles.Active = false then Exit;

    var_Estado_Lineas_Detalle := UTI_COMPRAS_Estado_Lineas_Detalle( form_presupuestos_compras_000.SQLQuery_Presup_Detalles,
                                                                    'Numero_Pedido_Compras' );

    if var_Estado_Lineas_Detalle.Total_Lineas_Sin_Marcar <> form_presupuestos_compras_000.SQLQuery_Presup_Detalles.RecordCount then
    begin
        var_msg := TStringList.Create;
        var_msg.Add( 'Hay líneas de detalle que fueron convertidas en pedidos, por lo que no ' +
                     'podemos cambiar el almacén. Esta medida se opta para no tener problemas ' +
                     'con el stock entre almacenes.' );

        UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        var_msg.Free;

        Result := false;
    end;
end;




****************************************************************************************************
****************************************************************************************************
****************************************************************************************************
****************************************************************************************************
procedure Tform_presupuestos_compras_001.BitBtn_Ver_PedidoClick(Sender: TObject);
var var_msg : TStrings;
begin
    with form_presupuestos_compras_000.SQLQuery_Presup_Detalles do
    begin
        if RecordCount = 0 then
        begin
            var_msg := TStringList.Create;
            var_msg.Add('* No tiene líneas de detalle.');
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;

            Exit;
        end;

        if not FieldByName('Del_WHEN').IsNull then
        begin
            var_msg := TStringList.Create;
            var_msg.Add('* Es una línea de detalle borrada.');
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;

            Exit;
        end;

        if Trim(FieldByName('Numero_Pedido').AsString) = '' then
        begin
            var_msg := TStringList.Create;
            var_msg.Add('* Es una línea de detalle que no pertenece a ningún pedido.');
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;

            Exit;
        end;

        if UTI_GEN_Form_Abierto_Ya('form_pedidos_compras_000') = false then
        begin
            Application.CreateForm(Tform_pedidos_compras_000, form_pedidos_compras_000);

            form_pedidos_compras_000.public_Solo_Ver    := false;
            form_pedidos_compras_000.public_Elegimos    := true;
            form_pedidos_compras_000.public_Menu_Worked := 630;

            // ************************************************************************************* //
            // ** Le pasamos el albarán a encontrar                                               ** //
            // ************************************************************************************* //
            form_pedidos_compras_000.Edit_Pdo_Serie.Text  := FieldByName('Serie_Pedido').AsString;
            form_pedidos_compras_000.Edit_Pdo_Numero.Text := FieldByName('Numero_Pedido').AsString;

            // ************************************************************************************* //
            // ** Filtramos su búsqueda                                                           ** //
            // ************************************************************************************* //
            form_pedidos_compras_000.para_Empezar;

            if form_pedidos_compras_000.SQLQuery_Pdo.RecordCount = 1 then
            begin
                // form_pedidos_compras_000.Editar_Registro;
                form_pedidos_compras_000.ShowModal;
            end else begin
                if form_pedidos_compras_000.SQLQuery_Pdo.RecordCount = 0 then
                begin
                    var_msg := TStringList.Create;
                    var_msg.Add('Este pedido no existe.');
                    UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
                    var_msg.Free;
                end else begin
                    var_msg := TStringList.Create;
                    var_msg.Add( 'Existe más de un pedido ' +
                                 FieldByName('Serie_Pedido').AsString + ' - ' +
                                 FieldByName('Numero_Pedido').AsString );
                    UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
                    var_msg.Free;

                    form_pedidos_compras_000.ShowModal;
                end;
            end;

            form_pedidos_compras_000.Free;

            // ************************************************************************************* //
            // ** Refrescamos los albaranes por si se hizo algún cambio en el elegido             ** //
            // ************************************************************************************* //
            form_presupuestos_compras_000.Refrescar_Registros_Detalles;
        end else begin
            var_msg := TStringList.Create;
            var_msg.Add(rs_Modulo_Abierto);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;
        end;
    end;
end;

procedure Tform_presupuestos_compras_001.Label31Click(Sender: TObject);
begin

end;

procedure Tform_presupuestos_compras_001.PageControl_Otros_DatosChange(
  Sender: TObject);
begin

end;

procedure Tform_presupuestos_compras_001.BitBtn_Crear_Linea_como_PedidoClick(Sender: TObject);
var var_Registro_Empresa : TEmpresas;
    var_Fecha            : TDateTime;
    var_msg              : TStrings;
begin
    var_msg := TStringList.Create;

    // ********************************************************************************************* //
    // ** Si el presupuesto está cerrado no podemos hacer ningún pedido de él                     ** //
    // ********************************************************************************************* //
    with form_presupuestos_compras_000.SQLQuery_Presup do
    begin
        if UTI_COMPRAS_Esta_Cerrado_SN( 'presupuestos_compras', FieldByName('id').AsString ) = 'S' then
        begin
            var_msg.Add( '* Presupuesto CERRADO.');
        end;
    end;

    with form_presupuestos_compras_000.SQLQuery_Presup_Detalles do
    begin
        // ********************************************************************************************* //
        // ** Si la línea de detalle ya estaba borrada, no permitimos hacer nada con ella.            ** //
        // ********************************************************************************************* //
        if not FieldByName('Del_WHEN').IsNull then
        begin
            var_msg.Add( '* Es una línea de detalle borrada, no se puede modificar nada de ella. ' +
                         'Si desea modificarla, primero hay que darla de alta anteriormente.' );
        end;

        // ***************************************************************************************** //
        // ** Si no tiene líneas de detalle que vamos a crear como pedido                         ** //
        // ***************************************************************************************** //
        if RecordCount = 0 then
        begin
            var_msg.Add( '* No hay líneas/detalle.');
        end;

        // ***************************************************************************************** //
        // ** Si la línea ya pertenece a un pedido, que no se pueda volver a crear como pedido    ** //
        // ***************************************************************************************** //
        if (not FieldByName('Serie_Pedido').IsNull)  or
           (not FieldByName('Numero_Pedido').IsNull) then
        begin
            var_msg.Add( '* Esta línea ya pertenece al pedido ' +
                         Trim(FieldByName('Serie_Pedido').AsString) +
                         '/' +
                         Trim(FieldByName('Numero_Pedido').AsString)  );
        end;
    end;

    // ********************************************************************************************* //
    // ** Si el presupuesto está borrado, no permitimos hacer nada con el.                        ** //
    // ********************************************************************************************* //
    if not form_presupuestos_compras_000.SQLQuery_Presup.FieldByName('Del_WHEN').IsNull then
    begin
        var_msg.Add( '* Es un presupuesto borrado, no se puede modificar nada de el. ' +
                     'Si desea modificarlo, primero hay que darlo de alta anteriormente.' );
    end;

    // ********************************************************************************************* //
    // ** Si se creó un nuevo mensaje a presentar, lo hacemos                                     ** //
    // ********************************************************************************************* //
    if Trim(var_msg.Text) <> '' then
    begin
        UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        var_msg.Free;
        Exit;
    end;

    var_msg.Free;

    // ********************************************************************************************* //
    // ** Si el usuario no tiene permisos para modificar presupuestos, ni permiso para crear      ** //
    // ** pedidos, pues no continuamos                                                            ** //
    // ********************************************************************************************* //
    if (UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True) and  // ** Comprueba si tiene   ** //
                                                                       // ** permiso de modificar ** //
                                                                       // ** en presupuestos      ** //
                                                                       // ************************** //
       (UTI_USR_Permiso_SN(450, 'A', True) = True)                then // ** Comprueba si tiene   ** //
                                                                       // ** permiso de insertar  ** //
                                                                       // ** en pedidos           ** //
                                                                       // ************************** //
    begin
        // ***************************************************************************************** //
        // ** Crearemos la cabecera del pedido                                                    ** //
        // ***************************************************************************************** //
        var_Fecha            := UTI_CN_Fecha_Hora;
        var_Registro_Empresa := form_presupuestos_compras_000.Crear_Pedido_su_Cabecera( var_Fecha );

        // ***************************************************************************************** //
        // ** Crearemos la línea de detalle, pero sólo si se creo antes la cabecera               ** //
        // ***************************************************************************************** //
        if Trim(var_Registro_Empresa.id) <> '' then
        begin
            form_presupuestos_compras_000.Crear_Pedido_su_Detalle( var_Fecha,
                                                                  var_Registro_Empresa.Serie_Pedido,
                                                                  var_Registro_Empresa.Numero_Pedido,
                                                                           // ********************** //
                                                                  false ); // ** Solo usará la    ** //
                                                                           // ** línea actual, la ** //
                                                                           // ** elegida          ** //
                                                                           // ********************** //
        end;

        // ***************************************************************************************** //
        // ** Comprobar si tengo que cerrar el presupuesto porque no tiene nada más que convertir ** //
        // ** en pedido                                                                           ** //
        // ***************************************************************************************** //
        Comprobar_desde_Detalles_Si_Cerramos_0;

        // ***************************************************************************************** //
        // ** Mensaje diciendo que se ha creado la línea como el pedido numero/serie              ** //
        // ***************************************************************************************** //
        var_msg := TStringList.Create;
        var_msg.Add( 'Esta línea elegida de este presupuesto ahora está ligada con el pedido ' +
                     Trim(var_Registro_Empresa.Serie_Pedido) +
                     '/' +
                     Trim(var_Registro_Empresa.Numero_Pedido)  );

        UTI_GEN_Aviso(false, var_msg, 'PERFECTO.-', True, False);
        var_msg.Free;
    end;
end;

function Tform_presupuestos_compras_001.Comprobar_desde_Detalles_Si_Cerramos_1 : Boolean;
var var_Estado_Lineas_Detalle : TUTI_COMPRAS_Ctdad_Rgtros_Detalle;
begin
    Result := false;

    // ***************************************************************************************** //
    // ** Comprobar si tengo que cerrar el presupuesto porque no tiene nada más que convertir ** //
    // ** en pedido                                                                           ** //
    // ***************************************************************************************** //
    var_Estado_Lineas_Detalle := UTI_COMPRAS_Estado_Lineas_Detalle( form_presupuestos_compras_000.SQLQuery_Presup_Detalles,
                                                                    'Numero_Pedido_Compras' );

    if var_Estado_Lineas_Detalle.Total_Lineas_Sin_Marcar = 0 then
    begin
      { if var_Estado_Lineas_Detalle.Total_Lineas_Marcadas > 0 then
        begin
            param_msg.Add( '* Todas las líneas de detalle de este pedido pertenecen a algún albarán.' +
                           ' Lo marcamos automáticamente como cerrado' );
        end;

        if var_Estado_Lineas_Detalle.Total_Lineas = 0 then
        begin
            param_msg.Add( '* Era un pedido sin líneas de detalle. Pero como se convirtió integro ' +
                           'en albarán, lo marcamos automáticamente como cerrado' );
        end; }

        Result := true;
    end;
end;

procedure Tform_presupuestos_compras_001.Comprobar_desde_Detalles_Si_Cerramos_0;
begin
    // ********************************************************************************************* //
    // ** Comprobar si tengo que cerrar el presupuesto porque no tiene nada más que convertir en  ** //
    // ** pedido                                                                                  ** //
    // ********************************************************************************************* //
    if Comprobar_desde_Detalles_Si_Cerramos_1 = true then
    begin
      { var_msg.Add( '* Todas las líneas de detalle de este presupuesto pertenecen a algún pedido.' +
                     ' Lo marcamos automáticamente como cerrado' );

        UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False); }

        // ***************************************************************************************** //
        // ** Como no tiene ninguna línea libre hay que cerrarlo porque todo el presupuesto fue   ** //
        // ** fue convertido en pedido/s                                                          ** //
        // ***************************************************************************************** //
        with form_presupuestos_compras_000.SQLQuery_Presup do
        begin                                       // ********************************************* //
            FieldByName('Cerrado_SN').Value := 'S'; // ** Tengo que dejarla activa para que se    ** //
                                                    // ** guarde cuando le demos al ok. Si no la  ** //
                                                    // ** sql de abajo no sirve de nada. Esta     ** //
                                                    // ** medida la opto por si se borran o se    ** //
                                                    // ** crean los pedidos, pero no se le da al  ** //
                                                    // ** ok para grabar la cabecera              ** //
                                                    // ********************************************* //

            UTI_COMPRAS_Cerrar_SN( 'presupuestos_compras',
                                  'S' { S o N },
                                  FieldByName('id').AsString,
                                  FieldByName('Serie_Presupuesto').AsString,
                                  FieldByName('Numero_Presupuesto').AsString );
        end;

        no_Tocar;
    end;
end;

procedure Tform_presupuestos_compras_001.Insertar_Registro_Detalles;
var var_msg  : TStrings;
    var_Form : Tform_presupuestos_compras_002;
begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    with form_presupuestos_compras_000.SQLQuery_Presup_Detalles do
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

                // ********************************************************************************* //
                // ** Pone el almacén a la línea de detalles, puesto que tiene que ser el mismo   ** //
                // ** que el de la cabecera                                                       ** //
                // ********************************************************************************* //
                FieldByName('id_almacenes').Value := form_presupuestos_compras_000.SQLQuery_Presup.FieldByName('id_almacenes').Value;
                // ********************************************************************************* //

                FieldByName('id_clientes').AsString          := form_presupuestos_compras_000.SQLQuery_Presup.FieldByName('id_clientes').AsString;
                FieldByName('Excluido_su_Cobro_SN').AsString := 'N';
                FieldByName('id_presupuestos').AsString      := form_presupuestos_compras_000.SQLQuery_Presup.FieldByName('id').AsString;

                var_Form := Tform_presupuestos_compras_002.Create(nil);

                var_Form.para_Empezar;

                var_Form.ShowModal;
                if var_Form.public_Pulso_Aceptar = true then
                begin
                    var_Form.Free;

                    FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
                    FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                    UTI_RGTRO_Grabar_Antes( 'presupuestos_compras_detalles',
                                            form_presupuestos_compras_000.SQLQuery_Presup_Detalles );

                    form_presupuestos_compras_000.Presentar_Datos_Totales(1);
                end else begin
                    var_Form.Free;
                    Cancel;
                end;
            end;
        end;

        var_msg.Free;
    end;
end;

procedure Tform_presupuestos_compras_001.Editar_Registro_Detalles;
var var_msg  : TStrings;
    var_Form : Tform_presupuestos_compras_002;
    var_id   : ShortString;
begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    with form_presupuestos_compras_000.SQLQuery_Presup_Detalles do
    begin
        var_msg := TStringList.Create;

        // ***************************************************************************************** //
        // ** Si la línea ya pertenece a un pedido que no se pueda editar                         ** //
        // ***************************************************************************************** //
        if (not FieldByName('Serie_Pedido').IsNull)  or
           (not FieldByName('Numero_Pedido').IsNull) then
        begin
            var_msg.Add( 'Esta línea ya pertenece al pedido ' +
                         Trim(FieldByName('Serie_Pedido').AsString) +
                         '/' +
                         Trim(FieldByName('Numero_Pedido').AsString)  );

            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;

            Exit;
        end;

        // ***************************************************************************************** //
        // ** Si no tiene líneas de detalle que vamos a editar                                    ** //
        // ***************************************************************************************** //
        if (RecordCount > 0) and
           (Active = true)   then
        begin
            var_id := FieldByName('id').AsString;

            if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
            begin
                if UTI_RGTRO_isLock( 'presupuestos_compras_detalles',
                                     var_id,
                                     true ) = true then
                begin
                    Exit;
                end else begin
                    if UTI_RGTRO_Lock( 'presupuestos_compras_detalles',
                                       var_id ) = true then
                         Edit
                    else Exit;
                end;

                var_Form := Tform_presupuestos_compras_002.Create(nil);

                var_Form.public_Menu_Worked := public_Menu_Worked;

                if public_Solo_Ver = true then
                begin
                    var_Form.public_Solo_Ver := true;
                end;

                var_Form.para_Empezar;

                var_Form.ShowModal;
                if var_Form.public_Pulso_Aceptar = true then
                begin
                    if ( Trim(Params.ParamByName('COPY_' + 'id_presupuestos').AsString)         <> Trim(FieldByName('id_presupuestos').AsString) )         or
                       ( Trim(Params.ParamByName('COPY_' + 'Serie_Pedido').AsString)            <> Trim(FieldByName('Serie_Pedido').AsString) )            or
                       ( Trim(Params.ParamByName('COPY_' + 'Numero_Pedido').AsString)           <> Trim(FieldByName('Numero_Pedido').AsString) )           or
                       ( Trim(Params.ParamByName('COPY_' + 'Fecha_Movimiento').AsString)        <> Trim(FieldByName('Fecha_Movimiento').AsString) )        or
                       ( Trim(Params.ParamByName('COPY_' + 'id_clientes').AsString)             <> Trim(FieldByName('id_clientes').AsString) )             or
                       ( Trim(Params.ParamByName('COPY_' + 'Unidades').AsString)                <> Trim(FieldByName('Unidades').AsString) )                or
                       ( Trim(Params.ParamByName('COPY_' + 'id_almacenes').AsString)            <> Trim(FieldByName('id_almacenes').AsString) )            or
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
                       ( Trim(Params.ParamByName('COPY_' + 'Excluido_su_Cobro_SN').AsString)    <> Trim(FieldByName('Excluido_su_Cobro_SN').AsString) )    or
                       ( Trim(Params.ParamByName('COPY_' + 'Comision_Representante').AsString)  <> Trim(FieldByName('Comision_Representante').AsString) )  then
                    begin
                        // ************************************************************************* //
                        // ** Pone el almacén a la línea de detalles, puesto que tiene que ser el ** //
                        // ** mismo que el de la cabecera                                         ** //
                        // ************************************************************************* //
                           FieldByName('id_almacenes').Value := form_presupuestos_compras_000.SQLQuery_Presup.FieldByName('id_almacenes').Value;
                        // ************************************************************************* //

                        FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                        FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                        UTI_RGTRO_Grabar_Antes( 'presupuestos_compras_detalles',
                                                form_presupuestos_compras_000.SQLQuery_Presup_Detalles );

                        form_presupuestos_compras_000.Presentar_Datos_Totales(1);
                    end else begin
                        Cancel;
                    end;

                    var_Form.Free;

                end else begin
                    var_Form.Free;
                    Cancel;
                end;

                UTI_RGTRO_UnLock( 'presupuestos_compras_detalles', var_id );
            end;
        end else begin
            var_msg.Add(rs_no_Hay_Rgtros);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        end;
    end;

    var_msg.Free;
end;

procedure Tform_presupuestos_compras_001.Borrar_Registro_Detalle;
var var_msg : TStrings;
begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    // ********************************************************************************************* //
    // ** Si la línea de detalle ya pertenece a un pedido que no se pueda borrar                  ** //
    // ********************************************************************************************* //
    if (not form_presupuestos_compras_000.SQLQuery_Presup_Detalles.FieldByName('Serie_Pedido').IsNull)  or
       (not form_presupuestos_compras_000.SQLQuery_Presup_Detalles.FieldByName('Numero_Pedido').IsNull) then
    begin
        var_msg := TStringList.Create;

        var_msg.Add( 'Esta línea pertenece al pedido ' +
                     Trim(form_presupuestos_compras_000.SQLQuery_Presup_Detalles.FieldByName('Serie_Pedido').AsString) +
                     '/' +
                     Trim(form_presupuestos_compras_000.SQLQuery_Presup_Detalles.FieldByName('Numero_Pedido').AsString)  );

        UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        var_msg.Free;

        Exit;
    end;

    if UTI_USR_Permiso_SN(public_Menu_Worked, 'B', True) = True then
    begin
        UTI_RGTRO_Borrar( 'presupuestos_compras_detalles',
                          form_presupuestos_compras_000.SQLQuery_Presup_Detalles,
                          public_Solo_Ver,
                          public_Menu_Worked );

        form_presupuestos_compras_000.Presentar_Datos_Totales(1);

        // ***************************************************************************************** //
        // ** Comprobar si tengo que cerrar el presupuesto porque no tiene nada más que convertir ** //
        // ** en pedido                                                                           ** //
        // ***************************************************************************************** //
        Comprobar_desde_Detalles_Si_Cerramos_0;
    end;
end;

end.




