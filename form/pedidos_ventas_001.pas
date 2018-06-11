unit pedidos_ventas_001;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DBDateTimePicker, Forms, Controls, Graphics, Dialogs, ButtonPanel, db,
  ExtCtrls, StdCtrls, DbCtrls, Buttons, ComCtrls, DBGrids, Grids, utilidades_forms_Filtrar, sqldb,
  utilidades_datos_tablas, utilidades_general, utilidades_usuarios, utilidades_bd, utilidades_ventas,
  utilidades_impuestos, utilidades_rgtro, utilidades_stock;

type

  { Tform_pedidos_ventas_001 }

  Tform_pedidos_ventas_001 = class(TForm)
    BitBtn_Crear_Linea_como_Albaran: TBitBtn;
    BitBtn_Imprimir: TBitBtn;
    BitBtn_SMS: TBitBtn;
    BitBtn_SMS2: TBitBtn;
    BitBtn_Ver_Albaran: TBitBtn;
    BitBtn_Ver_Situacion_Registro_ventas_detalles: TBitBtn;
    Boton_Elegir_Agencia_Transporte: TBitBtn;
    Boton_Elegir_Almacen: TBitBtn;
    Boton_Elegir_Cliente: TBitBtn;
    Boton_Elegir_Direccion_Envio: TBitBtn;
    Boton_Elegir_Empresa: TBitBtn;
    Boton_Elegir_Forma_Pago: TBitBtn;
    Boton_Elegir_id_Vehiculos: TBitBtn;
    Boton_Elegir_Pais1: TBitBtn;
    Boton_Elegir_Representante: TBitBtn;
    ButtonPanel1: TButtonPanel;
    CheckBox_con_Recargo: TCheckBox;
    CheckBox_Excluido: TCheckBox;
    DBCheckBox_IVA_con_Recargo_SN: TDBCheckBox;
    DBCheckBox_IVA_Excluido_SN: TDBCheckBox;
    DBCheckBox_Portes_Pagados_por_Cliente: TDBCheckBox;
    DBCheckBox_Vencimientos_automaticos_SN: TDBCheckBox;
    DBDateTimePicker_Fecha: TDBDateTimePicker;
    DBDateTimePicker_Fecha_Salida_Bultos: TDBDateTimePicker;
    DBEdit_Bultos: TDBEdit;
    DBEdit_eMail1: TDBEdit;
    DBEdit_eMail3: TDBEdit;
    DBEdit_eMail4: TDBEdit;
    DBEdit_eMail5: TDBEdit;
    DBEdit_Pagina_Web1: TDBEdit;
    DBEdit_Pagina_Web2: TDBEdit;
    DBEdit_Pagina_Web3: TDBEdit;
    DBEdit_Portes_Gastos_Envio: TDBEdit;
    DBGrid_Detalles: TDBGrid;
    DBGrid_Detalles1: TDBGrid;
    DBMemo_Comentarios_a_Imprimir: TDBMemo;
    DBMemo_Condiciones_Entrega: TDBMemo;
    DBMemo_Observaciones: TDBMemo;
    DBNavigator_Detalles: TDBNavigator;
    DBNavigator_Detalles1: TDBNavigator;
    Edit_Cliente_A_quien_Facturamos: TEdit;
    Edit_Cliente_Direccion: TEdit;
    Edit_Cliente_Direccion_Codigo_Postal: TEdit;
    Edit_Cliente_Direccion_FAX: TEdit;
    Edit_Cliente_Direccion_Movil: TEdit;
    Edit_Cliente_Direccion_Numero: TEdit;
    Edit_Cliente_Direccion_Pais: TEdit;
    Edit_Cliente_Direccion_Piso_Letra: TEdit;
    Edit_Cliente_Direccion_Poblacion: TEdit;
    Edit_Cliente_Direccion_Provincia: TEdit;
    Edit_Cliente_Direccion_Tfno_1: TEdit;
    Edit_Cliente_Direccion_Tfno_2: TEdit;
    Edit_Cliente_NIF: TEdit;
    Edit_Cliente_Nombre_Comercial: TEdit;
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
    Edit_Descripcion_Cliente: TEdit;
    Edit_Descripcion_Empresa: TEdit;
    Edit_Descripcion_Forma_Pago: TEdit;
    Edit_Descripcion_id_Vehiculos: TEdit;
    Edit_Descripcion_Tarifa: TEdit;
    Edit_Dias_Entre_Vto: TEdit;
    Edit_Dias_Pago_1: TEdit;
    Edit_Dias_Pago_2: TEdit;
    Edit_Direccion_de_Envio_Agencia_Transporte_Descripcion: TEdit;
    Edit_Direccion_de_Envio_Agencia_Transporte_Tfno_Fijo_1: TEdit;
    Edit_Direccion_de_Envio_Agencia_Transporte_Tfno_Movil: TEdit;
    Edit_Direccion_de_Envio_con_Quien_Hablar: TEdit;
    Edit_Direccion_de_Envio_Direccion: TEdit;
    Edit_Direccion_de_Envio_Direccion_Codigo_Postal: TEdit;
    Edit_Direccion_de_Envio_Direccion_Numero: TEdit;
    Edit_Direccion_de_Envio_Direccion_Piso_Letra: TEdit;
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
    Edit_Representante_Comision: TEdit;
    Edit_Representante_Descripcion: TEdit;
    Edit_Representante_Retencion: TEdit;
    Edit_Representante_Tfno: TEdit;
    Edit_Representante_Tfno_Movil: TEdit;
    Edit_Retencion: TEdit;
    Edit_Riesgo_Autorizado: TEdit;
    Edit_Total: TEdit;
    Edit_Total_Lineas: TEdit;
    Edit_Total_Mano_Obra: TEdit;
    Edit_Total_Materiales: TEdit;
    Edit_Total_Peso: TEdit;
    Edit_Total_Resto: TEdit;
    Edit_Total_Volumen: TEdit;
    Edit_Vencimientos_1_Dias: TEdit;
    GroupBox1: TGroupBox;
    GroupBox10: TGroupBox;
    GroupBox13: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox9: TGroupBox;
    GroupBox_Internet3: TGroupBox;
    GroupBox_Serie_Numero: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label102: TLabel;
    Label103: TLabel;
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
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
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
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label7: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label8: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label98: TLabel;
    Label_Almacen: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label9: TLabel;
    Label92: TLabel;
    Label_Ctdad_Rgtros: TLabel;
    Label_Fecha1: TLabel;
    Label_Fecha3: TLabel;
    Label_Vehiculo: TLabel;
    PageControl_Comentarios_Observaciones: TPageControl;
    PageControl_Datos_Envio: TPageControl;
    PageControl_Otros_Datos: TPageControl;
    PageControl_Totales: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    RadioGroup_Bajas: TRadioGroup;
    Shape1: TShape;
    Shape3: TShape;
    TabSheet_Representante: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet9: TTabSheet;
    TabSheet_Comentarios_a_Imprimir: TTabSheet;
    TabSheet_Condiciones_Entrega: TTabSheet;
    TabSheet_Datos_Bancarios: TTabSheet;
    TabSheet_Datos_Cliente_Generales: TTabSheet;
    TabSheet_Datos_Comerciales: TTabSheet;
    TabSheet_Datos_Gestion_Cobro: TTabSheet;
    TabSheet_Datos_Pedido_Factura: TTabSheet;
    TabSheet_Direccion_Envio: TTabSheet;
    TabSheet_Observaciones: TTabSheet;
    TabSheet_Totales: TTabSheet;
    TabSheet_Totales_Desglose: TTabSheet;
    TabSheet_Transportista: TTabSheet;

    procedure Validacion( param_msg : TStrings );
    procedure BitBtn_ImprimirClick(Sender: TObject);
    procedure Poner_Total_Lineas_Detalle;
    procedure BitBtn_Ver_AlbaranClick(Sender: TObject);
    procedure Borrar_Registro_Detalle;
    procedure Comprobar_desde_Detalles_Si_Cerramos_0;
    function  Comprobar_desde_Detalles_Si_Cerramos_1 : Boolean;
    function  Cambiamos_Cliente_SN : Boolean;
    function  Cambiamos_Almacen_SN : Boolean;
    function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
    procedure BitBtn_Crear_Linea_como_AlbaranClick(Sender: TObject);
    procedure Poner_Datos_Representante(param_id : ShortString);
    procedure Insertar_Registro_Detalles;
    procedure Editar_Registro_Detalles;
    procedure Boton_Elegir_AlmacenClick(Sender: TObject);
    procedure Vaciar_Cliente_Datos;
    procedure Vaciar_Datos_Agencia_de_Transporte;
    procedure Vaciar_Representante;
    procedure Vaciar_Datos_Envio;
    procedure BitBtn_Ver_Situacion_Registro_ventas_detallesClick(Sender: TObject);
    procedure Boton_Elegir_Direccion_EnvioClick(Sender: TObject);
    function  Elegir_Direccion_Envio_del_Cliente : TRecord_Rgtro_Comun;
    procedure Boton_Elegir_Agencia_TransporteClick(Sender: TObject);
    procedure Boton_Elegir_ClienteClick(Sender: TObject);
    procedure Boton_Elegir_EmpresaClick(Sender: TObject);
    procedure Boton_Elegir_Forma_PagoClick(Sender: TObject);
    procedure Boton_Elegir_id_VehiculosClick(Sender: TObject);
    procedure Boton_Elegir_RepresentanteClick(Sender: TObject);
    procedure DBGrid_DetallesDblClick(Sender: TObject);
    procedure DBGrid_DetallesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_DetallesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBNavigator_DetallesBeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure Edit_Descripcion_AlmacenClick(Sender: TObject);
    procedure Edit_Descripcion_ClienteClick(Sender: TObject);
    procedure Edit_Descripcion_EmpresaClick(Sender: TObject);
    procedure Edit_Descripcion_id_VehiculosClick(Sender: TObject);
    procedure RadioGroup_BajasClick(Sender: TObject);
    procedure Refrescar_Registros;
    procedure no_Tocar;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure Presentar_Datos;
    procedure Presentar_Datos_Cliente_Generales;
    procedure Presentar_Datos_Bancarios;
    procedure Presentar_Datos_Comerciales;
    procedure Presentar_Datos_Gestion_Cobro;
    procedure Presentar_Datos_Direccion_de_Envio;
    procedure Presentar_Datos_Agencia_de_Transporte;
    procedure para_Empezar;
    procedure Edit_Descripcion_Forma_PagoClick(Sender: TObject);
    procedure Edit_Direccion_de_Envio_Agencia_Transporte_DescripcionClick(Sender: TObject);
    procedure Edit_Direccion_de_Envio_con_Quien_HablarClick(Sender: TObject);
    procedure Edit_Representante_DescripcionClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { private declarations }
    private_Salir_OK : Boolean;

    function Traer_Representantes_xID( param_id : ShortString ) : TRepresentantes;
    function Traer_Proveedores_xID( param_id : ShortString ) : TProveedores;
    function Traer_Clientes_xID( param_id : ShortString ) : TClientes;
    function Traer_Clientes_Envios_xID( param_id : ShortString ) : TClientes_Envios;

  public
    { public declarations }
    public_imprimir      : Boolean;
    public_Solo_Ver      : Boolean;
    public_Menu_Worked   : Integer;
    public_Pulso_Aceptar : Boolean;
    public_Record_Rgtro  : TRecord_Rgtro_Comun;
  end;

var
  form_pedidos_ventas_001: Tform_pedidos_ventas_001;

implementation

{$R *.lfm}

uses menu, pedidos_ventas_000, pedidos_ventas_002, albaranes_ventas_000;

{ Tform_pedidos_ventas_001 }

procedure Tform_pedidos_ventas_001.FormCreate(Sender: TObject);
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
    Boton_Elegir_id_Vehiculos.Visible     := false;
    Label_Vehiculo.Visible                := false;
    Edit_Descripcion_id_Vehiculos.Visible := false;

    Boton_Elegir_Almacen.Visible     := false;
    Label_Almacen.Visible            := false;
    Edit_Descripcion_Almacen.Visible := false;

    form_Menu.Traer_Configuracion_APP;
    if UpperCase(Trim(form_menu.public_User_Configuracion.Trabajar_Albaranes_con_Vehiculos_SN)) = 'S' then
    begin
        Boton_Elegir_id_Vehiculos.Visible     := true;
        Label_Vehiculo.Visible                := true;
        Edit_Descripcion_id_Vehiculos.Visible := true;
    end;

    if UpperCase(Trim(form_menu.public_User_Configuracion.Albaranes_Obligar_Almacen_SN)) = 'S' then
    begin
        Boton_Elegir_Almacen.Visible     := true;
        Label_Almacen.Visible            := true;
        Edit_Descripcion_Almacen.Visible := true;
    end;
end;

procedure Tform_pedidos_ventas_001.para_Empezar;
begin
    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    with form_pedidos_ventas_000.SQLQuery_Pdo do
    begin
        public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                           FieldByName('id_clientes').AsString,
                                                           FieldByName('Fecha').AsString,
                                                           '',
                                                           FieldByName('Serie_Pedido').AsString,
                                                           FieldByName('Numero_Pedido').AsString );
    end;

    Presentar_Datos;

    // ********************************************************************************************* //
    // ** SOLO PARA ESTE FORM                                                                     ** //
    // ********************************************************************************************* //
    PageControl_Datos_Envio.ActivePage               := TabSheet_Direccion_Envio;
    PageControl_Comentarios_Observaciones.ActivePage := TabSheet_Comentarios_a_Imprimir;
    PageControl_Otros_Datos.ActivePage               := TabSheet_Datos_Cliente_Generales;
    PageControl_Totales.ActivePage                   := TabSheet_Totales;

    Poner_Total_Lineas_Detalle;
end;

procedure Tform_pedidos_ventas_001.Poner_Total_Lineas_Detalle;
begin
    Label_Ctdad_Rgtros.Caption := IntToStr(form_pedidos_ventas_000.SQLQuery_Pdo_Detalles.RecordCount);
end;

procedure Tform_pedidos_ventas_001.Presentar_Datos;
begin
    with form_pedidos_ventas_000.SQLQuery_Pdo do
    begin
        Edit_Descripcion_id_Vehiculos.Text := FieldByName('OT_vehiculo_matricula').AsString;
        Edit_Descripcion_Almacen.Text      := FieldByName('OT_descripcion_almacen').AsString;
        Edit_Descripcion_Empresa.Text      := FieldByName('OT_descripcion_empresa').AsString;

        Presentar_Datos_Cliente_Generales;
        Presentar_Datos_Bancarios;
        Presentar_Datos_Comerciales;
        Presentar_Datos_Gestion_Cobro;
        Presentar_Datos_Direccion_de_Envio;
        Presentar_Datos_Agencia_de_Transporte;

        form_pedidos_ventas_000.Presentar_Datos_Totales(1);
    end;
end;

procedure Tform_pedidos_ventas_001.Presentar_Datos_Cliente_Generales;
begin
    with form_pedidos_ventas_000.SQLQuery_Pdo do
    begin
        if Trim(FieldByName('nombre_propietario').AsString) <> '' then
        begin
           Edit_Descripcion_Cliente.Text := Trim(FieldByName('nombre_propietario').AsString);
        end else begin
           Edit_Descripcion_Cliente.Text := Trim(FieldByName('nombre_comercial').AsString);
        end;

        Edit_Cliente_A_quien_Facturamos.Text      := FieldByName('nombre_propietario').AsString;
        Edit_Cliente_Nombre_Comercial.Text        := FieldByName('nombre_comercial').AsString;
        Edit_Cliente_NIF.Text                     := FieldByName('nif_cif').AsString;
        Edit_Cliente_Direccion.Text               := FieldByName('Direccion').AsString;
        Edit_Cliente_Direccion_Numero.Text        := FieldByName('Direccion_Numero').AsString;
        Edit_Cliente_Direccion_Piso_Letra.Text    := FieldByName('Direccion_Piso_Letra').AsString;
        Edit_Cliente_Direccion_Codigo_Postal.Text := FieldByName('Codigo_Postal').AsString;

        Edit_Cliente_Direccion_Poblacion.Text     := FieldByName('OT_descripcion_poblacion').AsString;
        Edit_Cliente_Direccion_Provincia.Text     := FieldByName('OT_descripcion_provincia').AsString;
        Edit_Cliente_Direccion_Pais.Text          := FieldByName('OT_descripcion_pais').AsString;

        Edit_Cliente_Direccion_Tfno_1.Text        := FieldByName('Tfno_Fijo_1').AsString;
        Edit_Cliente_Direccion_Tfno_2.Text        := FieldByName('Tfno_Fijo_2').AsString;
        Edit_Cliente_Direccion_FAX.Text           := FieldByName('FAX').AsString;
        Edit_Cliente_Direccion_Movil.Text         := FieldByName('Movil').AsString;
    end;
end;

procedure Tform_pedidos_ventas_001.Presentar_Datos_Bancarios;
begin
    with form_pedidos_ventas_000.SQLQuery_Pdo do
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

procedure Tform_pedidos_ventas_001.Presentar_Datos_Comerciales;
begin
    with form_pedidos_ventas_000.SQLQuery_Pdo do
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

        Edit_Descripcion_Tarifa.Text := FieldByName('OT_descripcion_tarifa').AsString;
        Edit_Retencion.Text          := FieldByName('Retencion').AsString;
        Edit_Dto_Comercial_1.Text    := FieldByName('Descuento_Comercial_1').AsString;
        Edit_Dto_Comercial_2.Text    := FieldByName('Descuento_Comercial_2').AsString;
        Edit_Dto_Pronto_Pago.Text    := FieldByName('Descuento_Pronto_Pago').AsString;
        Edit_Dto_Final.Text          := FieldByName('Descuento_Final').AsString;
        Edit_Riesgo_Autorizado.Text  := FieldByName('Riesgo_Autorizado').AsString;
    end;
end;

procedure Tform_pedidos_ventas_001.Presentar_Datos_Gestion_Cobro;
begin
    with form_pedidos_ventas_000.SQLQuery_Pdo do
    begin
        Edit_Descripcion_Forma_Pago.Text        := FieldByName('OT_descripcion_forma_pago').AsString;

        Edit_Dias_Pago_1.Text                   := FieldByName('Forma_pago_Dia_1').AsString;
        Edit_Dias_Pago_2.Text                   := FieldByName('Forma_pago_Dia_2').AsString;
        Edit_Periodo_Vacacional_Inicio_Dia.Text := FieldByName('Forma_pago_Vacaciones_Dia_Inicio').AsString;
        Edit_Periodo_Vacacional_Inicio_Mes.Text := FieldByName('Forma_pago_Vacaciones_Mes_Inicio').AsString;
        Edit_Periodo_Vacacional_Fin_Dia.Text    := FieldByName('Forma_pago_Vacaciones_Dia_Fin').AsString;
        Edit_Periodo_Vacacional_Fin_Mes.Text    := FieldByName('Forma_pago_Vacaciones_Mes_Fin').AsString;

        Edit_Ctdad_Vtos.Text                    := FieldByName('Vencimientos_Cantidad').AsString;
        Edit_Vencimientos_1_Dias.Text           := FieldByName('Vencimientos_1_Dias').AsString;
        Edit_Dias_Entre_Vto.Text                := FieldByName('Vencimientos_Dias_Entre').AsString;

        Edit_Representante_Descripcion.Text     := FieldByName('OT_descripcion_representante').AsString;
        Edit_Representante_Tfno.Text            := FieldByName('OT_tfno_1_representante').AsString;
        Edit_Representante_Tfno_Movil.Text      := FieldByName('OT_Movil_representante').AsString;

        Edit_Representante_Comision.Text        := FieldByName('Comision_Representante').AsString;
        Edit_Representante_Retencion.Text       := FieldByName('Retencion_Representante').AsString;
    end;
end;

procedure Tform_pedidos_ventas_001.Presentar_Datos_Direccion_de_Envio;
begin
    with form_pedidos_ventas_000.SQLQuery_Pdo do
    begin
        Edit_Direccion_de_Envio_con_Quien_Hablar.Text        := FieldByName('Envio_Con_Quien_Hablar').AsString;
        Edit_Direccion_de_Envio_eMail.Text                   := FieldByName('Envio_eMail').AsString;
        Edit_Direccion_de_Envio_Tfno_1.Text                  := FieldByName('Envio_Tfno_Fijo_1').AsString;
        Edit_Direccion_de_Envio_Tfno_2.Text                  := FieldByName('Envio_Tfno_Fijo_2').AsString;
        Edit_Direccion_de_Envio_FAX.Text                     := FieldByName('Envio_FAX').AsString;
        Edit_Direccion_de_Envio_movil.Text                   := FieldByName('Envio_Movil').AsString;
        Edit_Direccion_de_Envio_Direccion.Text               := FieldByName('Envio_Direccion').AsString;
        Edit_Direccion_de_Envio_Direccion_Numero.Text        := FieldByName('Envio_Direccion_Numero').AsString;
        Edit_Direccion_de_Envio_Direccion_Piso_Letra.Text    := FieldByName('Envio_Direccion_Piso_Letra').AsString;
        Edit_Direccion_de_Envio_Direccion_Codigo_Postal.Text := FieldByName('Envio_Codigo_Postal').AsString;

        Edit_Direccion_de_Envio_Poblacion.Text               := FieldByName('OT_Envio_descripcion_poblacion').AsString;
        Edit_Direccion_de_Envio_Provincia.Text               := FieldByName('OT_Envio_descripcion_provincia').AsString;
        Edit_Direccion_de_Envio_Pais.Text                    := FieldByName('OT_Envio_descripcion_pais').AsString;
    end;
end;

procedure Tform_pedidos_ventas_001.Presentar_Datos_Agencia_de_Transporte;
begin
    with form_pedidos_ventas_000.SQLQuery_Pdo do
    begin
        Edit_Direccion_de_Envio_Agencia_Transporte_Descripcion.Text := FieldByName('OT_descripcion_transportista').AsString;
        Edit_Direccion_de_Envio_Agencia_Transporte_Tfno_Fijo_1.Text := FieldByName('OT_tfno_1_transportista').AsString;
        Edit_Direccion_de_Envio_Agencia_Transporte_Tfno_Movil.Text  := FieldByName('OT_Movil_transportista').AsString;
    end;
end;

procedure Tform_pedidos_ventas_001.Validacion( param_msg : TStrings );
var var_msg_2            : TStrings;
    var_Registro_Empresa : TEmpresas;
begin
    with form_pedidos_ventas_000.SQLQuery_Pdo do
    begin
        if Trim(FieldByName('id_clientes').AsString) = '' then
        begin
            param_msg.Add( '* El cliente.');
        end;

        if Trim(FieldByName('id_empresas').AsString) = '' then
        begin
            param_msg.Add( '* La empresa.');
        end;

        if Trim(FieldByName('Fecha').AsString) = '' then
        begin
            param_msg.Add( '* La fecha.');
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
                param_msg.Add( '* El almacén.');
            end;
        end;

        if UpperCase(Trim(form_menu.public_User_Configuracion.Trabajar_Albaranes_con_Vehiculos_SN)) = 'S' then
        begin
             if Trim(FieldByName('id_Vehiculos').AsString) = '' then
             begin
                 param_msg.Add( '* El vehículo.');
             end;
        end;

        // ************************************************************************************* //
        // ** Ojito el número sólo se debe de dar si no se hubo ninguna falta de algún campo. ** //
        // ** Por lo que la parte de a continuación debe de estar al final de la comprobación ** //
        // ** de las faltas                                                                   ** //
        // ************************************************************************************* //
        if (form_pedidos_ventas_000.SQLQuery_Pdo.State = dsInsert) and
           (Trim(param_msg.Text) = '')                               then
        begin
            // ********************************************************************************* //
            // ** OJITO - Sólo si está creando la CABECERA y no falta nada                    ** //
            // ********************************************************************************* //
            if (Trim(FieldByName('Serie_Pedido').AsString) = '')  and
               (Trim(FieldByName('Numero_Pedido').AsString) = '') then
            begin
                var_msg_2 := TStringList.Create;
                var_Registro_Empresa.id := FieldByName('id_empresas').AsString;

                var_Registro_Empresa := UTI_VENTAS_Devolver_Numeracion_Pedido( var_msg_2,
                                                                               var_Registro_Empresa,
                                                                               true,   // Para que se desbloquee el registro de empresas.
                                                                               true ); // Para que actualice la empresa con el siguiente pedido.

                if Trim(var_msg_2.Text) <> '' then
                begin
                    // ************************************************************************* //
                    // ** Hay errores en la búsqueda del próximo NUMERO                       ** //
                    // ************************************************************************* //
                    param_msg.AddStrings(var_msg_2);
                end else begin
                    // ************************************************************************* //
                    // ** NO HAY errores en la búsqueda del próximo NUMERO                    ** //
                    // ** Asi que guardamos en la CABECERA su NUMERO                          ** //
                    // ************************************************************************* //
                     FieldByName('Serie_Pedido').AsString  := var_Registro_Empresa.Serie_Pedido;
                     FieldByName('Numero_Pedido').AsString := var_Registro_Empresa.Numero_Pedido;
                end;

                var_msg_2.Free;
            end;
        end;
    end;
end;

procedure Tform_pedidos_ventas_001.FormClose(Sender: TObject; var CloseAction: TCloseAction);
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
        Validacion(var_msg);
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
        if form_Menu.public_Salir_OK = False then CloseAction := TCloseAction.caNone;
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
            CloseAction := TCloseAction.caNone;
        end else begin
            // var_msg.Free;
            CloseAction := caFree;
        end;
    end;

    var_msg.Free;
end;

procedure Tform_pedidos_ventas_001.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := true;
end;

procedure Tform_pedidos_ventas_001.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := false;
end;

procedure Tform_pedidos_ventas_001.no_Tocar;
begin
    DBDateTimePicker_Fecha.Enabled           := false;
    Boton_Elegir_Cliente.Enabled             := false;
    Edit_Descripcion_Cliente.Enabled         := false;
    Boton_Elegir_id_Vehiculos.Enabled        := false;
    Edit_Descripcion_id_Vehiculos.Enabled    := false;
    Boton_Elegir_Almacen.Enabled             := false;
    Edit_Descripcion_Almacen.Enabled         := false;
    Boton_Elegir_Empresa.Enabled             := false;
    Edit_Descripcion_Empresa.Enabled         := false;

    TabSheet_Datos_Cliente_Generales.Enabled := false;
    TabSheet_Datos_Bancarios.Enabled         := false;
    TabSheet_Datos_Comerciales.Enabled       := false;
    TabSheet_Datos_Gestion_Cobro.Enabled     := false;
    TabSheet_Representante.Enabled           := false;

    TabSheet_Direccion_Envio.Enabled         := false;
    TabSheet_Transportista.Enabled           := false;
    TabSheet_Condiciones_Entrega.Enabled     := false;
    TabSheet_Comentarios_a_Imprimir.Enabled  := false;
    TabSheet_Observaciones.Enabled           := false;
end;

procedure Tform_pedidos_ventas_001.Refrescar_Registros;
begin
    form_pedidos_ventas_000.Refrescar_Registros_Detalles;

    form_pedidos_ventas_000.Presentar_Datos_Totales(1);
end;

procedure Tform_pedidos_ventas_001.RadioGroup_BajasClick(Sender: TObject);
begin
    //UTI_TB_Ver_Bajas_SN('um', Memo_Filtros.Lines, RadioGroup_Bajas.ItemIndex);
    Refrescar_Registros;
end;

procedure Tform_pedidos_ventas_001.BitBtn_Ver_Situacion_Registro_ventas_detallesClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if form_pedidos_ventas_000.SQLQuery_Pdo_Detalles.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'pedidos_ventas_detalles',
                                           form_pedidos_ventas_000.SQLQuery_Pdo_Detalles,
                                           form_pedidos_ventas_000.DataSource_Pdo_Detalles,
                                           DBGrid_Detalles );
        end;
    end;
end;

procedure Tform_pedidos_ventas_001.DBGrid_DetallesDblClick(Sender: TObject);
begin
    Editar_Registro_Detalles;
end;

procedure Tform_pedidos_ventas_001.DBGrid_DetallesDrawColumnCell( Sender: TObject;
                                                                  const Rect: TRect;
                                                                  DataCol: Integer;
                                                                  Column: TColumn;
                                                                  State: TGridDrawState);
var var_Color_Normal : TColor;
begin
    with Sender as TDBGrid do
    begin
        if form_pedidos_ventas_000.SQLQuery_Pdo_Detalles.RecordCount = 0 then Exit;

        var_Color_Normal := Canvas.Brush.Color;

        // ***************************************************************************************** //
        // ** Primero comprobamos si es un registro dado de baja o no                             ** //
        // ***************************************************************************************** //
        if not form_pedidos_ventas_000.SQLQuery_Pdo_Detalles.FieldByName('Del_WHEN').IsNull then
        begin
            // ********************************************************************************* //
            // ** Registro DADO de BAJA                                                       ** //
            // ********************************************************************************* //
            Canvas.Font.Color := clSilver;
        end else begin
            // ********************************************************************************* //
            // ** Registro DADO de ALTA, NO BAJA                                              ** //
            // ********************************************************************************* //
            // ** Así que las pinto, pero sólo si no son las columnas que van a               ** //
            // ** ser dibujadas                                                               ** //
            // ********************************************************************************* //
            if State <> [gdSelected] then
            begin
                if (Column.FieldName <> 'Convertida_SN')     and
                   (Column.FieldName <> 'Cobro_Excluido_SN') then
                begin
                    Canvas.font.Color := clBlack;
                end;
            end;
        end;

        // ***************************************************************************************** //
        // ** Ahora paso a dibujar una celda normal con los colores elegidos o una                ** //
        // ** dibujada                                                                            ** //
        // ***************************************************************************************** //
        if (Column.FieldName <> 'Convertida_SN')     and
           (Column.FieldName <> 'Cobro_Excluido_SN') then
        begin
            // ********************************************************************************* //
            // ** No es una de las columnas a dibujar por lo que la pinto con los             ** //
            // ** colores elegidos                                                            ** //
            // ********************************************************************************* //
            DefaultDrawColumnCell(Rect, DataCol, Column, State)
        end else begin
            // ********************************************************************************* //
            // ** Es una de las columnas a dibujar                                            ** //
            // ********************************************************************************* //
            // ** COLUMNA CONFIRMADA                                                          ** //
            // ********************************************************************************* //
            if Column.FieldName = 'Convertida_SN'  then
            begin
                if not form_pedidos_ventas_000.SQLQuery_Pdo_Detalles.FieldByName('Serie_Albaran').IsNull then
                     Canvas.StretchDraw(Rect, form_pedidos_ventas_000.Image_Convertida.Picture.Graphic)
                else DefaultDrawColumnCell(Rect, DataCol, Column, State);
            end;

            if Column.FieldName = 'Cobro_Excluido_SN'  then
            begin
                if form_pedidos_ventas_000.SQLQuery_Pdo_Detalles.FieldByName('Excluido_su_Cobro_SN').Value = 'S' then
                     Canvas.StretchDraw(Rect, form_pedidos_ventas_000.Image_Cobro_Excluido.Picture.Graphic)
                else DefaultDrawColumnCell(Rect, DataCol, Column, State);
            end;
        end;

        Canvas.Font.Color := var_Color_Normal;
    end;
end;

procedure Tform_pedidos_ventas_001.DBGrid_DetallesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if Key = 13 then Editar_Registro_Detalles;
end;

procedure Tform_pedidos_ventas_001.DBNavigator_DetallesBeforeAction(Sender: TObject; Button: TDBNavButtonType);
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
            form_pedidos_ventas_000.Refrescar_Registros_Detalles;
            Abort;
        end;
    end;
end;

procedure Tform_pedidos_ventas_001.Edit_Descripcion_id_VehiculosClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS el VEHICULO?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_pedidos_ventas_000.SQLQuery_Pdo.FieldByName('id_vehiculos').Clear;
         Edit_Descripcion_id_Vehiculos.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_pedidos_ventas_001.Boton_Elegir_id_VehiculosClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_pedidos_ventas_000.SQLQuery_Pdo do
    begin
        var_Registro := UTI_Abrir_Modulo_Vehiculos( true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
            FieldByName('id_vehiculos').AsString          := Trim(var_Registro.id_1);
            Edit_Descripcion_id_Vehiculos.Text            := var_Registro.descripcion_1;
            FieldByName('OT_vehiculo_matricula').AsString := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_pedidos_ventas_001.Boton_Elegir_EmpresaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_pedidos_ventas_000.SQLQuery_Pdo do
    begin
        var_Registro := UTI_Abrir_Modulo_Empresas( true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_empresas').AsString            := Trim(var_Registro.id_1);
             Edit_Descripcion_Empresa.Text                  := var_Registro.descripcion_1;
             FieldByName('OT_descripcion_empresa').AsString := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_pedidos_ventas_001.Edit_Descripcion_EmpresaClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS la EMPRESA?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_pedidos_ventas_000.SQLQuery_Pdo.FieldByName('id_empresas').Clear;
         Edit_Descripcion_Empresa.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_pedidos_ventas_001.Edit_Descripcion_Forma_PagoClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS la FORMA DE PAGO?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_pedidos_ventas_000.SQLQuery_Pdo.FieldByName('id_formas_pago').Clear;
         Edit_Descripcion_Forma_Pago.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_pedidos_ventas_001.Boton_Elegir_Forma_PagoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_pedidos_ventas_000.SQLQuery_Pdo do
    begin
        var_Registro := UTI_Abrir_Modulo_FormasPago( true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
            FieldByName('id_formas_pago').AsString            := Trim(var_Registro.id_1);
            FieldByName('Vencimientos_Cantidad').AsString     := Trim(var_Registro.id_2);
            FieldByName('Vencimientos_1_Dias').AsString       := Trim(var_Registro.id_3);
            FieldByName('Vencimientos_Dias_Entre').AsString   := Trim(var_Registro.descripcion_2);
            FieldByName('OT_descripcion_forma_pago').AsString := Trim(var_Registro.descripcion_1);

            Edit_Ctdad_Vtos.Text                              := Trim(var_Registro.id_2);
            Edit_Vencimientos_1_Dias.Text                     := Trim(var_Registro.id_3);
            Edit_Dias_Entre_Vto.Text                          := Trim(var_Registro.descripcion_2);
            Edit_Descripcion_Forma_Pago.Text                  := Trim(var_Registro.descripcion_1);
        end;
    end;
end;

procedure Tform_pedidos_ventas_001.Edit_Descripcion_ClienteClick(Sender: TObject);
begin
    if Cambiamos_Cliente_SN = false then Exit;

    Vaciar_Cliente_Datos;
end;

procedure Tform_pedidos_ventas_001.Edit_Direccion_de_Envio_con_Quien_HablarClick(Sender: TObject);
begin
    Vaciar_Datos_Envio;
end;

procedure Tform_pedidos_ventas_001.Edit_Direccion_de_Envio_Agencia_Transporte_DescripcionClick(Sender: TObject);
begin
    Vaciar_Datos_Agencia_de_Transporte;
end;

procedure Tform_pedidos_ventas_001.Edit_Representante_DescripcionClick(Sender: TObject);
begin
    Vaciar_Representante;
end;

procedure Tform_pedidos_ventas_001.Edit_Descripcion_AlmacenClick(Sender: TObject);
var var_msg : TStrings;
begin
    if Cambiamos_Almacen_SN = false then Exit;

    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS el ALMACEN?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_pedidos_ventas_000.SQLQuery_Pdo.FieldByName('id_almacenes').Clear;
         Edit_Descripcion_Almacen.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_pedidos_ventas_001.Boton_Elegir_Agencia_TransporteClick(Sender: TObject);
var var_Registro               : TRecord_Rgtro_Comun;
    var_Registro_Ag_Transporte : TProveedores;
    var_msg                    : TStrings;
begin
    with form_pedidos_ventas_000.SQLQuery_Pdo do
    begin
        var_msg := TStringList.Create;
        var_msg.Add('¿DE DONDE TRAEMOS EL TRANSPORTISTA ...');
        var_msg.Add(' ');
        var_msg.Add('BUSCAMOS EN LA FICHA DE UN CLIENTE(botón OK)');
        var_msg.Add('ó BUSCAMOS EN PROVEEDORES QUE TRANSPORTISTA USAREMOS (botón CANCEL) ?');

        if UTI_GEN_Aviso(true, var_msg, 'ELIJA ... ', True, True) = True then
        begin
            // ************************************************************************************* //
            // ** Buscamos en la ficha de un cliente cual es su agencia de transporte             ** //
            // ************************************************************************************* //
            var_Registro := UTI_Abrir_Modulo_Clientes( '', '', true, false, '1' );   // 120
            if var_Registro.id_1 <> '' then
            begin
                 Edit_Direccion_de_Envio_Agencia_Transporte_Descripcion.Text := var_Registro.descripcion_1;

                 var_Registro_Ag_Transporte := Traer_Proveedores_xID( Trim(var_Registro.id_2) );
            end;
        end else begin
            // ************************************************************************************* //
            // ** Elegimos en el mantenimiento de proveedores una AGENCIA DE TRANSPORTE           ** //
            // ************************************************************************************* //
            var_Registro := UTI_Abrir_Modulo_Proveedores( true, false, '1' );   //
            if var_Registro.id_1 <> '' then
            begin
                 Edit_Direccion_de_Envio_Agencia_Transporte_Descripcion.Text := var_Registro.descripcion_1;

                 var_Registro_Ag_Transporte := Traer_Proveedores_xID( Trim(var_Registro.id_1) );
            end;
        end;
        var_msg.Free;

        // ***************************************************************************************** //
        // ** Ya nos ha venido con la id del registro elegido, o bien de un cliente o bien de un  ** //
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

procedure Tform_pedidos_ventas_001.Boton_Elegir_RepresentanteClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_pedidos_ventas_000.SQLQuery_Pdo do
    begin
        var_Registro := UTI_Abrir_Modulo_Representantes( true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
            FieldByName('id_representantes').AsString      := Trim(var_Registro.id_1);
            FieldByName('Comision_Representante').AsString := Trim(var_Registro.id_2);

            Edit_Representante_Descripcion.Text            := var_Registro.descripcion_1;
            Edit_Representante_Comision.Text               := var_Registro.id_2;
            Edit_Representante_Retencion.Text              := var_Registro.id_3;

            Edit_Representante_Tfno.Text                   := var_Registro.descripcion_2;
            Edit_Representante_Tfno_Movil.Text             := var_Registro.descripcion_3;

            Poner_Datos_Representante(var_Registro.id_1);
        end;
    end;
end;

function Tform_pedidos_ventas_001.Elegir_Direccion_Envio_del_Cliente : TRecord_Rgtro_Comun;
var var_msg : TStrings;
begin
    Result.id_1 := '';

    if Trim(form_pedidos_ventas_000.SQLQuery_Pdo.FieldByName('id_clientes').AsString) = '' then
    begin
        var_msg := TStringList.Create;
        var_msg.Add('No has elegido todavía ningún cliente para este pedido.');
        UTI_GEN_Aviso(true, var_msg, 'AVISAMOS DE ... ', True, False);
        var_msg.Free;
        Exit;
    end;

    Result := UTI_Abrir_Modulo_Elegir_cliente_Direccion_Envio( '', '', true, true, '1' );
end;

procedure Tform_pedidos_ventas_001.Boton_Elegir_Direccion_EnvioClick(Sender: TObject);
var var_Registro       : TRecord_Rgtro_Comun;
    var_Registro_Envio : TClientes_Envios;
begin
    with form_pedidos_ventas_000.SQLQuery_Pdo do
    begin
        if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
        begin
            var_Registro := Elegir_Direccion_Envio_del_Cliente;
            if var_Registro.id_1 <> '' then
            begin
                var_Registro_Envio := Traer_Clientes_Envios_xID( Trim(var_Registro.id_1) );

                if var_Registro_Envio.id <> '0' then
                begin
                    FieldByName('OT_Envio_descripcion_poblacion').AsString := var_Registro_Envio.OT_descripcion_poblacion;
                    FieldByName('OT_Envio_descripcion_provincia').AsString := var_Registro_Envio.OT_descripcion_provincia;
                    FieldByName('OT_Envio_descripcion_pais').AsString      := var_Registro_Envio.OT_descripcion_pais;

                    FieldByName('Envio_id_provincias').AsString            := var_Registro_Envio.id_provincias;
                    FieldByName('Envio_id_paises').AsString                := var_Registro_Envio.id_paises;
                    FieldByName('Envio_id_poblaciones').AsString           := var_Registro_Envio.id_poblaciones;

                    FieldByName('Envio_Con_Quien_Hablar').AsString         := var_Registro_Envio.OT_descripcion_Contacto;
                    FieldByName('Envio_Tfno_Fijo_1').AsString              := var_Registro_Envio.Tfno_Fijo_1;
                    FieldByName('Envio_Tfno_Fijo_2').AsString              := var_Registro_Envio.Tfno_Fijo_2;
                    FieldByName('Envio_FAX').AsString                      := var_Registro_Envio.FAX;
                    FieldByName('Envio_Movil').AsString                    := var_Registro_Envio.Movil;
                    FieldByName('Envio_eMail').AsString                    := var_Registro_Envio.eMail;
                    FieldByName('Envio_Direccion').AsString                := var_Registro_Envio.Direccion;
                    FieldByName('Envio_Direccion_Numero').AsString         := var_Registro_Envio.Direccion_Numero;
                    FieldByName('Envio_Direccion_Piso_Letra').AsString     := var_Registro_Envio.Direccion_Piso_Letra;
                    FieldByName('Envio_Codigo_Postal').AsString            := var_Registro_Envio.Codigo_Postal;
                end;

                Presentar_Datos_Direccion_de_Envio;
            end;
        end;
    end;
end;

procedure Tform_pedidos_ventas_001.Vaciar_Datos_Envio;
var var_msg : TStrings;
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
    begin
        var_msg := TStringList.Create;
        var_msg.Add('¿QUITAMOS los datos de la DIRECCION DE ENVIO?');
        if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
        begin
            with form_pedidos_ventas_000.SQLQuery_Pdo do
            begin
                FieldByName('OT_Envio_descripcion_poblacion').Clear;
                FieldByName('OT_Envio_descripcion_provincia').Clear;
                FieldByName('OT_Envio_descripcion_pais').Clear;

                FieldByName('Envio_id_provincias').Clear;
                FieldByName('Envio_id_paises').Clear;
                FieldByName('Envio_id_poblaciones').Clear;

                FieldByName('Envio_Con_Quien_Hablar').Clear;
                FieldByName('Envio_Tfno_Fijo_1').Clear;
                FieldByName('Envio_Tfno_Fijo_2').Clear;
                FieldByName('Envio_FAX').Clear;
                FieldByName('Envio_Movil').Clear;
                FieldByName('Envio_eMail').Clear;
                FieldByName('Envio_Direccion').Clear;
                FieldByName('Envio_Direccion_Numero').Clear;
                FieldByName('Envio_Direccion_Piso_Letra').Clear;
                FieldByName('Envio_Codigo_Postal').Clear;
            end;

            Edit_Direccion_de_Envio_con_Quien_Hablar.Text        := '';
            Edit_Direccion_de_Envio_eMail.Text                   := '';
            Edit_Direccion_de_Envio_Tfno_1.Text                  := '';
            Edit_Direccion_de_Envio_Tfno_2.Text                  := '';
            Edit_Direccion_de_Envio_FAX.Text                     := '';
            Edit_Direccion_de_Envio_movil.Text                   := '';
            Edit_Direccion_de_Envio_Direccion.Text               := '';
            Edit_Direccion_de_Envio_Direccion_Numero.Text        := '';
            Edit_Direccion_de_Envio_Direccion_Piso_Letra.Text    := '';
            Edit_Direccion_de_Envio_Direccion_Codigo_Postal.Text := '';
            Edit_Direccion_de_Envio_Poblacion.Text               := '';
            Edit_Direccion_de_Envio_Provincia.Text               := '';
            Edit_Direccion_de_Envio_Pais.Text                    := '';
        end;
        var_msg.Free;
    end;
end;

procedure Tform_pedidos_ventas_001.Vaciar_Representante;
var var_msg : TStrings;
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
    begin
        var_msg := TStringList.Create;
        var_msg.Add('¿QUITAMOS los datos del REPRESENTANTE?');
        if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
        begin
            with form_pedidos_ventas_000.SQLQuery_Pdo do
            begin
                FieldByName('id_representantes').Clear;
                FieldByName('Comision_Representante').Clear;
            end;

            Edit_Representante_Descripcion.Text := '';
            Edit_Representante_Comision.Text    := '';
            Edit_Representante_Retencion.Text   := '';
            Edit_Representante_Tfno.Text        := '';
            Edit_Representante_Tfno_Movil.Text  := '';
        end;
        var_msg.Free;
    end;
end;

procedure Tform_pedidos_ventas_001.Vaciar_Datos_Agencia_de_Transporte;
var var_msg : TStrings;
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
    begin
        var_msg := TStringList.Create;
        var_msg.Add('¿QUITAMOS los datos de la AGENCIA DE TRANSPORTE?');
        if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
        begin
            with form_pedidos_ventas_000.SQLQuery_Pdo do
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

procedure Tform_pedidos_ventas_001.Vaciar_Cliente_Datos;
var var_msg : TStrings;
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
    begin
        var_msg := TStringList.Create;
        var_msg.Add('¿QUITAMOS los datos del CLIENTE?');
        if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
        begin
            with form_pedidos_ventas_000.SQLQuery_Pdo do
            begin
                FieldByName('id_clientes').Clear;
                FieldByName('OT_descripcion_cliente').Clear;

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
                FieldByName('id_tarifas').Clear;
                FieldByName('agencias_transporte_id_proveedores').Clear;
                FieldByName('id_representantes').Clear;
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
                FieldByName('Vencimientos_1_Dias').Clear;
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
                FieldByName('Riesgo_Autorizado').Clear;
                FieldByName('Observaciones').Clear;
            end;

            Edit_Descripcion_Cliente.Text                               := '';
            Edit_Descripcion_id_Vehiculos.Text                          := '';
            Edit_Descripcion_Almacen.Text                               := '';
            Edit_Descripcion_Empresa.Text                               := '';

            Edit_Cliente_A_quien_Facturamos.Text                        := '';
            Edit_Cliente_Nombre_Comercial.Text                          := '';
            Edit_Cliente_NIF.Text                                       := '';
            Edit_Cliente_Direccion.Text                                 := '';
            Edit_Cliente_Direccion_Numero.Text                          := '';
            Edit_Cliente_Direccion_Piso_Letra.Text                      := '';
            Edit_Cliente_Direccion_Codigo_Postal.Text                   := '';
            Edit_Cliente_Direccion_Poblacion.Text                       := '';
            Edit_Cliente_Direccion_Provincia.Text                       := '';
            Edit_Cliente_Direccion_Pais.Text                            := '';
            Edit_Cliente_Direccion_Tfno_1.Text                          := '';
            Edit_Cliente_Direccion_Tfno_2.Text                          := '';
            Edit_Cliente_Direccion_FAX.Text                             := '';
            Edit_Cliente_Direccion_Movil.Text                           := '';

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

            Edit_Descripcion_Tarifa.Text                                := '';
            CheckBox_Excluido.Checked                                   := False;
            CheckBox_con_Recargo.Checked                                := False;
            Edit_Retencion.Text                                         := '';
            Edit_Dto_Comercial_1.Text                                   := '';
            Edit_Dto_Comercial_2.Text                                   := '';
            Edit_Dto_Pronto_Pago.Text                                   := '';
            Edit_Dto_Final.Text                                         := '';
            Edit_Riesgo_Autorizado.Text                                 := '';

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
            Edit_Direccion_de_Envio_Direccion.Text                      := '';
            Edit_Direccion_de_Envio_Direccion_Numero.Text               := '';
            Edit_Direccion_de_Envio_Direccion_Piso_Letra.Text           := '';
            Edit_Direccion_de_Envio_Direccion_Codigo_Postal.Text        := '';
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

procedure Tform_pedidos_ventas_001.FormActivate(Sender: TObject);
begin
    // ********************************************************************************************* //
    // ** Si esta llamado desde otro modulo, le cambiamos el color de fondo                       ** //
    // ********************************************************************************************* //
    If form_pedidos_ventas_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    Comprobar_No_Tocar(true, true);
end;

function Tform_pedidos_ventas_001.Comprobar_No_Tocar( param_Reproducir_Mensajes,
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
    // ** Si el pedido está cerrado no se puede modificar nada de él                              ** //
    // ********************************************************************************************* //
    with form_pedidos_ventas_000.SQLQuery_Pdo do
    begin
        // ***************************************************************************************** //
        // ** No hace falta comprobar si está cerrado en modo inserción porque la id cabecera no  ** //
        // ** se conoce todavía                                                                   ** //
        // ***************************************************************************************** //
        if state <> dsInsert then
        begin
            if UTI_VENTAS_Esta_Cerrado_SN( 'pedidos_ventas', FieldByName('id').AsString ) = 'S' then
            begin
                Result := true;
                if param_Reproducir_Mensajes = true then
                begin
                    var_msg.Add( '* El pedido está cerrado. No se puede modificar nada de él.' );
                end;

                if param_Ejecutar_No_Tocar = true then no_Tocar;
            end;
        end;
    end;

    // ********************************************************************************************* //
    // ** Si el pedido proviene de un presupuesto no se puede modificar nada de él. Si hay que    ** //
    // ** añadir algo pues se crea un nuevo pedido                                                ** //
    // ********************************************************************************************* //
    if (not form_pedidos_ventas_000.SQLQuery_Pdo.FieldByName('Serie_Presupuesto').IsNull)  or
       (not form_pedidos_ventas_000.SQLQuery_Pdo.FieldByName('Numero_Presupuesto').IsNull) then
    begin
        Result := true;
        if param_Reproducir_Mensajes = true then
        begin
            var_msg.Add( '* Este pedido pertenece al presupuesto ' +
                         Trim(form_pedidos_ventas_000.SQLQuery_Pdo.FieldByName('Serie_Presupuesto').AsString) +
                         '/' +
                         Trim(form_pedidos_ventas_000.SQLQuery_Pdo.FieldByName('Numero_Presupuesto').AsString) +
                         '. ' +
                         'No se puede modificar nada de él.' );
        end;

        if param_Ejecutar_No_Tocar = true then no_Tocar;
    end;

    // ********************************************************************************************* //
    // ** Si el pedido está borrado, no permitimos hacer nada con el.                             ** //
    // ********************************************************************************************* //
    if not form_pedidos_ventas_000.SQLQuery_Pdo.FieldByName('Del_WHEN').IsNull then
    begin
        Result := true;

        if param_Reproducir_Mensajes = true then
        begin
            var_msg.Add( '* Es un pedido borrado, no se puede modificar nada de el. ' +
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

procedure Tform_pedidos_ventas_001.Insertar_Registro_Detalles;
var var_msg  : TStrings;
    var_Form : Tform_pedidos_ventas_002;
begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    with form_pedidos_ventas_000.SQLQuery_Pdo_Detalles do
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
                // ** Aqui podemos inicializar otros campos                                       ** //
                // ********************************************************************************* //
                // ** Si sólo hay un impuesto, pues lo pone automáticamente                       ** //
                // ********************************************************************************* //
                UTI_IMPTOS_Asignar_Impto( form_pedidos_ventas_000.SQLQuery_Pdo_Detalles,
                                          'id_impuestos_Ventas' );

                // ********************************************************************************* //
                // ** Pone el almacén a la línea de detalles, puesto que tiene que ser el mismo   ** //
                // ** que el de la cabecera                                                       ** //
                // ********************************************************************************* //
                FieldByName('id_almacenes').Value := form_pedidos_ventas_000.SQLQuery_Pdo.FieldByName('id_almacenes').Value;
                // ********************************************************************************* //

                FieldByName('id_clientes').AsString          := form_pedidos_ventas_000.SQLQuery_Pdo.FieldByName('id_clientes').AsString;
                FieldByName('Excluido_su_Cobro_SN').AsString := 'N';
                FieldByName('id_pedidos').AsString           := form_pedidos_ventas_000.SQLQuery_Pdo.FieldByName('id').AsString;

                var_Form := Tform_pedidos_ventas_002.Create(nil);

                var_Form.para_Empezar;

                var_Form.ShowModal;
                if var_Form.public_Pulso_Aceptar = true then
                begin
                    var_Form.Free;

                    FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
                    FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                    UTI_RGTRO_Grabar_Antes( 'pedidos_ventas_detalles',
                                            form_pedidos_ventas_000.SQLQuery_Pdo_Detalles );

                    form_pedidos_ventas_000.Presentar_Datos_Totales(1);
                end else begin
                    var_Form.Free;
                    Cancel;
                end;
            end;
        end;

        var_msg.Free;
    end;
end;

procedure Tform_pedidos_ventas_001.Editar_Registro_Detalles;
var var_msg  : TStrings;
    var_Form : Tform_pedidos_ventas_002;
    var_id   : ShortString;
begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    with form_pedidos_ventas_000.SQLQuery_Pdo_Detalles do
    begin
        var_msg := TStringList.Create;

        // ***************************************************************************************** //
        // ** Si la línea ya pertenece a un albaran que no se pueda editar                        ** //
        // ***************************************************************************************** //
        if (not FieldByName('Serie_Albaran').IsNull)  or
           (not FieldByName('Numero_Albaran').IsNull) then
        begin
            var_msg.Add( 'Esta línea ya pertenece al albarán ' +
                         Trim(FieldByName('Serie_Albaran').AsString) +
                         '/' +
                         Trim(FieldByName('Numero_Albaran').AsString)  );

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
                if UTI_RGTRO_isLock( 'pedidos_ventas_detalles',
                                     var_id,
                                     true ) = true then
                begin
                    Exit;
                end else begin
                    if UTI_RGTRO_Lock( 'pedidos_ventas_detalles',
                                       var_id ) = true then
                         Edit
                    else Exit;
                end;

                var_Form := Tform_pedidos_ventas_002.Create(nil);

                var_Form.public_Menu_Worked := public_Menu_Worked;

                if public_Solo_Ver = true then
                begin
                    var_Form.public_Solo_Ver := true;
                end;

                var_Form.para_Empezar;

                var_Form.ShowModal;
                if var_Form.public_Pulso_Aceptar = true then
                begin
                    if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( form_pedidos_ventas_000.SQLQuery_Pdo_Detalles ) = true then
                    begin
                        // ************************************************************************* //
                        // ** Pone el almacén a la línea de detalles, puesto que tiene que ser el ** //
                        // ** mismo que el de la cabecera                                         ** //
                        // ************************************************************************* //
                           FieldByName('id_almacenes').Value := form_pedidos_ventas_000.SQLQuery_Pdo.FieldByName('id_almacenes').Value;
                        // ************************************************************************* //

                        FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                        FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                        UTI_RGTRO_Grabar_Antes( 'pedidos_ventas_detalles',
                                                form_pedidos_ventas_000.SQLQuery_Pdo_Detalles );

                        form_pedidos_ventas_000.Presentar_Datos_Totales(1);
                    end else begin
                        Cancel;
                    end;

                    var_Form.Free;

                end else begin
                    var_Form.Free;
                    Cancel;
                end;

                UTI_RGTRO_UnLock( 'pedidos_ventas_detalles', var_id );
            end;
        end else begin
            var_msg.Add(rs_no_Hay_Rgtros);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        end;
    end;

    var_msg.Free;
end;

procedure Tform_pedidos_ventas_001.Borrar_Registro_Detalle;
var var_msg : TStrings;
begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    with form_pedidos_ventas_000.SQLQuery_Pdo_Detalles do
    begin
        // ***************************************************************************************** //
        // ** Si la línea ya pertenece a un albaran que no se pueda editar                        ** //
        // ***************************************************************************************** //
        if (not FieldByName('Serie_Albaran').IsNull)  or
           (not FieldByName('Numero_Albaran').IsNull) then
        begin
            var_msg := TStringList.Create;
            var_msg.Add( 'Esta línea pertenece al albarán ' +
                         Trim(FieldByName('Serie_Albaran').AsString) +
                         '/' +
                         Trim(FieldByName('Numero_Albaran').AsString)  );

            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;

            Exit;
        end;
    end;

    if UTI_USR_Permiso_SN(public_Menu_Worked, 'B', True) = True then
    begin
        UTI_RGTRO_Borrar( 'pedidos_ventas_detalles',
                          form_pedidos_ventas_000.SQLQuery_Pdo_Detalles,
                          public_Solo_Ver,
                          public_Menu_Worked );

        form_pedidos_ventas_000.Presentar_Datos_Totales(1);

        // ***************************************************************************************** //
        // ** Comprobar si tengo que cerrar el pedido porque no tiene nada más que convertir en   ** //
        // ** albarán                                                                             ** //
        // ***************************************************************************************** //
        Comprobar_desde_Detalles_Si_Cerramos_0;
    end;
end;

procedure Tform_pedidos_ventas_001.Poner_Datos_Representante(param_id : ShortString);
var var_Rgtro : TRepresentantes;
begin
    if Trim(param_id) = '' then Exit;

    with form_pedidos_ventas_000.SQLQuery_Pdo do
    begin
        var_Rgtro := Traer_Representantes_xID( Trim(param_id) );

        if var_Rgtro.id <> '0' then
        begin
            FieldByName('id_representantes').AsString                := Trim(var_Rgtro.id);

            FieldByName('IVA_Excluido_SN_Representante').AsString    := var_Rgtro.IVA_Excluido_SN;
            FieldByName('IVA_con_Recargo_SN_Representante').AsString := var_Rgtro.IVA_con_Recargo_SN;

            FieldByName('OT_descripcion_representante').AsString     := var_Rgtro.nombre_propietario;
            Edit_Representante_Descripcion.Text                      := var_Rgtro.nombre_propietario;

            FieldByName('Comision_Representante').AsString           := var_Rgtro.Comision;
            Edit_Representante_Comision.Text                         := var_Rgtro.Comision;

            FieldByName('Retencion_Representante').AsString          := var_Rgtro.Retencion;
            Edit_Representante_Retencion.Text                        := var_Rgtro.Retencion;

            FieldByName('OT_tfno_1_representante').AsString          := var_Rgtro.Tfno_Fijo_1;
            Edit_Representante_Tfno.Text                             := var_Rgtro.Tfno_Fijo_1;

            FieldByName('OT_Movil_representante').AsString           := var_Rgtro.Movil;
            Edit_Representante_Tfno_Movil.Text                       := var_Rgtro.Movil;
        end;
    end;
end;

procedure Tform_pedidos_ventas_001.Boton_Elegir_AlmacenClick(Sender: TObject);
var var_Registro         : TRecord_Rgtro_Comun;
    var_msg              : TStrings;
    var_Descripcion_OLD  : String;
    var_id_almacenes_OLD : String;
begin
    if Cambiamos_Almacen_SN = false then Exit;

    with form_pedidos_ventas_000.SQLQuery_Pdo do
    begin
        // ***************************************************************************************** //
        // ** Guardamos los datos del almacén antes de ser cambiados                              ** //
        // ***************************************************************************************** //
        var_id_almacenes_OLD := FieldByName('id_almacenes').AsString;
        var_Descripcion_OLD  := Edit_Descripcion_Almacen.Text;

        // ***************************************************************************************** //
        // ** Continuamos con el cambio de almacén                                                ** //
        // ***************************************************************************************** //
        var_Registro := UTI_Abrir_Modulo_Almacenes( '', '', true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
            FieldByName('id_almacenes').AsString           := Trim(var_Registro.id_1);
            Edit_Descripcion_Almacen.Text                  := var_Registro.descripcion_1;
            FieldByName('OT_descripcion_almacen').AsString := var_Registro.descripcion_1;
        end;
    end;
end;

function Tform_pedidos_ventas_001.Cambiamos_Cliente_SN : Boolean;
var var_msg                   : TStrings;
    var_Estado_Lineas_Detalle : TUTI_VENTAS_Ctdad_Rgtros_Detalle;
begin
    Result := true;

    if form_pedidos_ventas_000.SQLQuery_Pdo_Detalles.Active = false then Exit;

    var_Estado_Lineas_Detalle := UTI_VENTAS_Estado_Lineas_Detalle( form_pedidos_ventas_000.SQLQuery_Pdo_Detalles,
                                                                   'Serie_Albaran',
                                                                   'Numero_Albaran' );

    if var_Estado_Lineas_Detalle.Total_Lineas_Sin_Marcar <> form_pedidos_ventas_000.SQLQuery_Pdo_Detalles.RecordCount then
    begin
        var_msg := TStringList.Create;
        var_msg.Add( 'Hay líneas de detalle que fueron convertidas en albaranes, por lo que no podemos cambiar el cliente.');
        UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        var_msg.Free;

        Result := false;
    end;
end;

function Tform_pedidos_ventas_001.Cambiamos_Almacen_SN : Boolean;
var var_msg                   : TStrings;
    var_Estado_Lineas_Detalle : TUTI_VENTAS_Ctdad_Rgtros_Detalle;
begin
    Result := true;

    with form_pedidos_ventas_000 do
    begin
        if SQLQuery_Pdo_Detalles.Active = false then Exit;

        var_Estado_Lineas_Detalle := UTI_VENTAS_Estado_Lineas_Detalle( form_pedidos_ventas_000.SQLQuery_Pdo_Detalles,
                                                                       'Serie_Albaran',
                                                                       'Numero_Albaran' );

        if var_Estado_Lineas_Detalle.Total_Lineas_Sin_Marcar <> form_pedidos_ventas_000.SQLQuery_Pdo_Detalles.RecordCount then
        begin
            var_msg := TStringList.Create;
            var_msg.Add( 'Hay líneas de detalle que fueron convertidas en albaranes, por lo que no podemos cambiar el almacén. Esta medida se opta para no tener problemas con el stock entre almacenes.');
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;

            Result := false;
        end;
    end;
end;

procedure Tform_pedidos_ventas_001.Boton_Elegir_ClienteClick(Sender: TObject);
var var_Rgtro     : TRecord_Rgtro_Comun;
    var_Rgtro_Cli : TClientes;
    var_msg       : TStrings;
begin
    if Cambiamos_Cliente_SN = false then Exit;

    with form_pedidos_ventas_000.SQLQuery_Pdo do
    begin
        // ***************************************************************************************** //
        // ** Continuamos                                                                         ** //
        // ***************************************************************************************** //
        var_Rgtro := UTI_Abrir_Modulo_Clientes( '', '', true, false, '1' );
        if var_Rgtro.id_1 <> '' then
        begin
             FieldByName('id_clientes').AsString := Trim(var_Rgtro.id_1);

             if Trim(var_Rgtro.descripcion_1) <> '' then
             begin
                 Edit_Descripcion_Cliente.Text := var_Rgtro.descripcion_1;
             end else begin
                 Edit_Descripcion_Cliente.Text := var_Rgtro.descripcion_2;
             end;

             FieldByName('OT_descripcion_cliente').AsString := Edit_Descripcion_Cliente.Text;

             var_Rgtro_Cli := Traer_Clientes_xID( Trim(var_Rgtro.id_1) );

             if var_Rgtro_Cli.id <> '0' then
             begin
                 FieldByName('OT_Cta_Bco_descripcion_poblacion').AsString   := var_Rgtro_Cli.OT_Cta_Bco_descripcion_poblacion;
                 FieldByName('OT_Cta_Bco_descripcion_provincia').AsString   := var_Rgtro_Cli.OT_Cta_Bco_descripcion_provincia;
                 FieldByName('OT_Cta_Bco_descripcion_pais').AsString        := var_Rgtro_Cli.OT_Cta_Bco_descripcion_pais;
                 FieldByName('OT_descripcion_forma_pago').AsString          := var_Rgtro_Cli.OT_descripcion_forma_pago;

                 FieldByName('id_clientes').AsString                        := var_Rgtro_Cli.id;
                 FieldByName('id_poblaciones').AsString                     := var_Rgtro_Cli.id_poblaciones;
                 FieldByName('id_provincias').AsString                      := var_Rgtro_Cli.id_provincias;
                 FieldByName('id_paises').AsString                          := var_Rgtro_Cli.id_paises;

                 FieldByName('OT_descripcion_poblacion').AsString           := var_Rgtro_Cli.OT_descripcion_poblacion;
                 FieldByName('OT_descripcion_provincia').AsString           := var_Rgtro_Cli.OT_descripcion_provincia;
                 FieldByName('OT_descripcion_pais').AsString                := var_Rgtro_Cli.OT_descripcion_pais;

                 FieldByName('id_formas_pago').AsString                     := var_Rgtro_Cli.id_formas_pago;
                 FieldByName('Cta_Bco_id_poblaciones').AsString             := var_Rgtro_Cli.id_Cta_Bco_poblaciones;
                 FieldByName('Cta_Bco_id_provincias').AsString              := var_Rgtro_Cli.id_Cta_Bco_provincias;
                 FieldByName('Cta_Bco_id_paises').AsString                  := var_Rgtro_Cli.id_Cta_Bco_pais;
                 FieldByName('id_tarifas').AsString                         := var_Rgtro_Cli.id_tarifas;
                 FieldByName('agencias_transporte_id_proveedores').AsString := var_Rgtro_Cli.id_Agencias_Transporte;
                 FieldByName('nombre_propietario').AsString                 := var_Rgtro_Cli.nombre_propietario;
                 FieldByName('nombre_comercial').AsString                   := var_Rgtro_Cli.nombre_comercial;
                 FieldByName('nif_cif').AsString                            := var_Rgtro_Cli.nif_cif;
                 FieldByName('Tfno_Fijo_1').AsString                        := var_Rgtro_Cli.Tfno_Fijo_1;
                 FieldByName('Tfno_Fijo_2').AsString                        := var_Rgtro_Cli.Tfno_Fijo_2;
                 FieldByName('FAX').AsString                                := var_Rgtro_Cli.FAX;
                 FieldByName('Movil').AsString                              := var_Rgtro_Cli.Movil;
                 FieldByName('Direccion').AsString                          := var_Rgtro_Cli.Direccion;
                 FieldByName('Direccion_Numero').AsString                   := var_Rgtro_Cli.Direccion_Numero;
                 FieldByName('Direccion_Piso_Letra').AsString               := var_Rgtro_Cli.Direccion_Piso_Letra;
                 FieldByName('Codigo_Postal').AsString                      := var_Rgtro_Cli.Codigo_Postal;
                 FieldByName('Forma_pago_Dia_1').AsString                   := var_Rgtro_Cli.Forma_pago_Dia_1;
                 FieldByName('Forma_pago_Dia_2').AsString                   := var_Rgtro_Cli.Forma_pago_Dia_2;
                 FieldByName('Vencimientos_automaticos_SN').AsString        := var_Rgtro_Cli.Vencimientos_automaticos_SN;
                 FieldByName('Vencimientos_Cantidad').AsString              := var_Rgtro_Cli.OT_Vencimientos_Cantidad;
                 FieldByName('Vencimientos_1_Dias').AsString                := var_Rgtro_Cli.OT_Vencimientos_1_Dias;
                 FieldByName('Vencimientos_Dias_Entre').AsString            := var_Rgtro_Cli.OT_Vencimientos_Dias_Entre;
                 FieldByName('Forma_pago_Vacaciones_Dia_Inicio').AsString   := var_Rgtro_Cli.Forma_pago_Vacaciones_Dia_Inicio;
                 FieldByName('Forma_pago_Vacaciones_Mes_Inicio').AsString   := var_Rgtro_Cli.Forma_pago_Vacaciones_Mes_Inicio;
                 FieldByName('Forma_pago_Vacaciones_Dia_Fin').AsString      := var_Rgtro_Cli.Forma_pago_Vacaciones_Dia_Fin;
                 FieldByName('Forma_pago_Vacaciones_Mes_Fin').AsString      := var_Rgtro_Cli.Forma_pago_Vacaciones_Mes_Fin;
                 FieldByName('Cta_Bco_Entidad').AsString                    := var_Rgtro_Cli.Cta_Bco_Entidad;
                 FieldByName('Cta_Bco_Sucursal').AsString                   := var_Rgtro_Cli.Cta_Bco_Sucursal;
                 FieldByName('Cta_Bco_Digito_Control').AsString             := var_Rgtro_Cli.Cta_Bco_Digito_Control;
                 FieldByName('Cta_Bco_Cuenta').AsString                     := var_Rgtro_Cli.Cta_Bco_Cuenta;
                 FieldByName('Cta_Bco_IBAN').AsString                       := var_Rgtro_Cli.Cta_Bco_IBAN;
                 FieldByName('Cta_Bco_BIC_SWIFT').AsString                  := var_Rgtro_Cli.Cta_Bco_BIC_SWIFT;
                 FieldByName('Cta_Bco_Mandato_Fecha_de_Firma').AsString     := var_Rgtro_Cli.Cta_Bco_Mandato_Fecha_de_Firma;
                 FieldByName('Cta_Bco_Mandato_Ref').AsString                := var_Rgtro_Cli.Cta_Bco_Mandato_Ref;
                 FieldByName('Cta_Bco_Direccion').AsString                  := var_Rgtro_Cli.Cta_Bco_Direccion;
                 FieldByName('Cta_Bco_Direccion_Numero').AsString           := var_Rgtro_Cli.Cta_Bco_Direccion_Numero;
                 FieldByName('Cta_Bco_Direccion_Piso_Letra').AsString       := var_Rgtro_Cli.Cta_Bco_Direccion_Piso_Letra;
                 FieldByName('Cta_Bco_Codigo_Postal').AsString              := var_Rgtro_Cli.Cta_Bco_Codigo_Postal;
                 FieldByName('IVA_con_Recargo_SN').AsString                 := var_Rgtro_Cli.IVA_con_Recargo_SN;
                 FieldByName('IVA_Excluido_SN').AsString                    := var_Rgtro_Cli.IVA_Excluido_SN;
                 FieldByName('Retencion').AsString                          := var_Rgtro_Cli.Retencion;
                 FieldByName('Descuento_Comercial_1').AsString              := var_Rgtro_Cli.Descuento_Comercial_1;
                 FieldByName('Descuento_Comercial_2').AsString              := var_Rgtro_Cli.Descuento_Comercial_2;
                 FieldByName('Descuento_Pronto_Pago').AsString              := var_Rgtro_Cli.Descuento_Pronto_Pago;
                 FieldByName('Descuento_Final').AsString                    := var_Rgtro_Cli.Descuento_Final;
                 FieldByName('Riesgo_Autorizado').AsString                  := var_Rgtro_Cli.Riesgo_Autorizado;

                 FieldByName('Observaciones').Clear;
                 if Trim(var_Rgtro_Cli.Observaciones_Comentarios) <> '' then
                 begin
                     FieldByName('Observaciones').AsString := var_Rgtro_Cli.Observaciones_Comentarios;

                     var_msg := TStringList.Create;
                     var_msg.Add('ATENTO hay OBSERVACIONES');
                     UTI_GEN_Aviso(true,  var_msg,
                                    'El cliente elegido tiene observaciones y las hemos puesto en' +
                                    ' las observaciones. Están bajo la lengüeta de' +
                                    ' COMENTARIOS / OBSERVACIONES.',
                                    True,
                                    False );
                     var_msg.Free;
                 end;

                 FieldByName('id_representantes').AsString := var_Rgtro_Cli.id_Representantes;
                 Poner_Datos_Representante(var_Rgtro_Cli.id_Representantes);
             end;

             Presentar_Datos;
        end;
    end;
end;

procedure Tform_pedidos_ventas_001.BitBtn_Ver_AlbaranClick(Sender: TObject);
var var_msg : TStrings;
begin
    with form_pedidos_ventas_000.SQLQuery_Pdo_Detalles do
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

        if Trim(FieldByName('Numero_Albaran').AsString) = '' then
        begin
            var_msg := TStringList.Create;
            var_msg.Add('* Es una línea de detalle que no pertenece a ningún albarán.');
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;

            Exit;
        end;

        if UTI_GEN_Form_Abierto_Ya('form_albaranes_ventas_000') = false then
        begin
            Application.CreateForm(Tform_albaranes_ventas_000, form_albaranes_ventas_000);

            form_albaranes_ventas_000.public_Solo_Ver    := false;
            form_albaranes_ventas_000.public_Elegimos    := true;
            form_albaranes_ventas_000.public_Menu_Worked := 430;

            // ************************************************************************************* //
            // ** Le pasamos el albarán a encontrar                                               ** //
            // ************************************************************************************* //
            form_albaranes_ventas_000.Edit_Albaran_Serie.Text  := FieldByName('Serie_Albaran').AsString;
            form_albaranes_ventas_000.Edit_Albaran_Numero.Text := FieldByName('Numero_Albaran').AsString;

            // ************************************************************************************* //
            // ** Filtramos su búsqueda                                                           ** //
            // ************************************************************************************* //
            form_albaranes_ventas_000.para_Empezar;

            if form_albaranes_ventas_000.SQLQuery_Alb.RecordCount = 1 then
            begin
                // form_albaranes_ventas_000.Editar_Registro;
                form_albaranes_ventas_000.ShowModal;
            end else begin
                if form_albaranes_ventas_000.SQLQuery_Alb.RecordCount = 0 then
                begin
                    var_msg := TStringList.Create;
                    var_msg.Add( 'Este albarán ' +
                                 FieldByName('Serie_Albaran').AsString + ' - ' +
                                 FieldByName('Numero_Albaran').AsString +
                                 ' no existe.' );
                    UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
                    var_msg.Free;
                end else begin
                    var_msg := TStringList.Create;
                    var_msg.Add( 'Existe más de un albarán ' +
                                 FieldByName('Serie_Albaran').AsString + ' - ' +
                                 FieldByName('Numero_Albaran').AsString );
                    UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
                    var_msg.Free;

                    form_albaranes_ventas_000.ShowModal;
                end;
            end;

            form_albaranes_ventas_000.Free;

            // ************************************************************************************* //
            // ** Refrescamos los albaranes por si se hizo algún cambio en el elegido             ** //
            // ************************************************************************************* //
            form_pedidos_ventas_000.Refrescar_Registros_Detalles;
        end else begin
            var_msg := TStringList.Create;
            var_msg.Add(rs_Modulo_Abierto);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;
        end;
    end;
end;

function Tform_pedidos_ventas_001.Comprobar_desde_Detalles_Si_Cerramos_1 : Boolean;
var var_Estado_Lineas_Detalle : TUTI_VENTAS_Ctdad_Rgtros_Detalle;
begin
    Result := false;

    // ***************************************************************************************** //
    // ** Comprobar si tengo que cerrar el pedido porque no tiene nada más que convertir en   ** //
    // ** albarán                                                                             ** //
    // ***************************************************************************************** //
    var_Estado_Lineas_Detalle := UTI_VENTAS_Estado_Lineas_Detalle( form_pedidos_ventas_000.SQLQuery_Pdo_Detalles,
                                                                   'Serie_Albaran',
                                                                   'Numero_Albaran' );

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

procedure Tform_pedidos_ventas_001.Comprobar_desde_Detalles_Si_Cerramos_0;
begin
    // ********************************************************************************************* //
    // ** Comprobar si tengo que cerrar el pedido porque no tiene nada más que convertir en       ** //
    // ** albarán                                                                                 ** //
    // ********************************************************************************************* //
    if Comprobar_desde_Detalles_Si_Cerramos_1 = true then
    begin
      { var_msg.Add( '* Todas las líneas de detalle de este pedido pertenecen a algún albarán.' +
                     ' Lo marcamos automáticamente como cerrado' );

        UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False); }

        // ***************************************************************************************** //
        // ** Como no tiene ninguna línea libre hay que cerrarlo porque todo el  pedido fue       ** //
        // ** convertido en albaran/es                                                            ** //
        // ***************************************************************************************** //
        with form_pedidos_ventas_000.SQLQuery_Pdo do
        begin                                       // ********************************************* //
            FieldByName('Cerrado_SN').Value := 'S'; // ** Tengo que dejarla activa para que se    ** //
                                                    // ** guarde cuando le demos al ok. Si no la  ** //
                                                    // ** sql de abajo no sirve de nada. Esta     ** //
                                                    // ** medida la opto por si se borran o se    ** //
                                                    // ** crean los pedidos, pero no se le da al  ** //
                                                    // ** ok para grabar la cabecera              ** //
                                                    // ********************************************* //

            UTI_VENTAS_Cerrar_SN( 'pedidos_ventas',
                                  'S' { S o N },
                                  FieldByName('id').AsString,
                                  FieldByName('Serie_Pedido').AsString,
                                  FieldByName('Numero_Pedido').AsString );
        end;

        no_Tocar;
    end;
end;

procedure Tform_pedidos_ventas_001.BitBtn_Crear_Linea_como_AlbaranClick(Sender: TObject);
var var_Registro_Empresa      : TEmpresas;
    var_Fecha                 : TDateTime;
    var_msg                   : TStrings;
    var_Stock_Articulo        : TStock_Traerlo;
begin
    var_msg := TStringList.Create;

    // ********************************************************************************************* //
    // ** Si el pedido está cerrado no podemos hacer ningún albarán de él                         ** //
    // ********************************************************************************************* //
    with form_pedidos_ventas_000.SQLQuery_Pdo do
    begin
        if UTI_VENTAS_Esta_Cerrado_SN( 'pedidos_ventas', FieldByName('id').AsString ) = 'S' then
        begin
            var_msg.Add( '* Pedido CERRADO.');
        end;
    end;

    with form_pedidos_ventas_000.SQLQuery_Pdo_Detalles do
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
        // ** Si no tiene líneas de detalle que vamos a crear como albarán                        ** //
        // ***************************************************************************************** //
        if RecordCount = 0 then
        begin
            var_msg.Add( '* No hay líneas/detalle.');
        end;

        // ***************************************************************************************** //
        // ** Si la línea ya pertenece a un albarán, que no se pueda volver a crear como albarán  ** //
        // ***************************************************************************************** //
        if (not FieldByName('Serie_Albaran').IsNull)  or
           (not FieldByName('Numero_Albaran').IsNull) then
        begin
            var_msg.Add( '* Esta línea ya pertenece al albarán ' +
                         Trim(FieldByName('Serie_Albaran').AsString) +
                         '/' +
                         Trim(FieldByName('Numero_Albaran').AsString)  );
        end;
    end;

    with form_pedidos_ventas_000.SQLQuery_Pdo_Detalles do
    begin
        // ***************************************************************************************** //
        // ** Si no hay stock en el almacén del pedido, pues no sigue adelante                    ** //
        // ***************************************************************************************** //
        if (Trim(FieldByName('id_articulos').AsString) = '')         and
           (Trim(FieldByName('descripcion_para_TPV').AsString) = '') and
           (Trim(FieldByName('descripcion').AsString) = '')          then
        begin
        end else begin
            var_Stock_Articulo := UTI_STOCK_es_Menor_SN( form_pedidos_ventas_000.SQLQuery_Pdo_Detalles,
                                                         form_pedidos_ventas_000.SQLQuery_Pdo.FieldByName('id_almacenes').AsString );

            if var_Stock_Articulo.STOCK_es_Menor = true then
            begin
                var_msg.Add( '* NO HAY STOCK SUFICIENTE del artículo: ' );
                var_msg.Add( '  ' + Trim(FieldByName('OT_descripcion_articulo').AsString) );
                var_msg.Add( ' ' );
                var_msg.Add( '  En el almacén: ' );
                var_msg.Add( '  ' + Trim(form_pedidos_ventas_000.SQLQuery_Pdo.FieldByName('OT_descripcion_almacen').AsString) );
                var_msg.Add( ' ' );
                var_msg.Add( '  su stock actual es de ' + FloatToStr(var_Stock_Articulo.Stock) );
                var_msg.Add( ' ' );
                var_msg.Add( '  Así que no puedo crear en albaranes la línea con ' +
                              Trim(FieldByName('Unidades').AsString) +
                              ' unidades a descontar del stock.' );
            end;
        end;
    end;

    // ********************************************************************************************* //
    // ** Si el pedido está borrado, no permitimos hacer nada con el.                             ** //
    // ********************************************************************************************* //
    if not form_pedidos_ventas_000.SQLQuery_Pdo.FieldByName('Del_WHEN').IsNull then
    begin
        var_msg.Add( '* Es un pedido borrado, no se puede modificar nada de el. ' +
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
    // ** Si el usuario no tiene permisos para modificar pedidos, ni permiso para crear albaranes,** //
    // ** pues no continuamos                                                                     ** //
    // ********************************************************************************************* //
    if (UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True) and  // ** Comprueba si tiene   ** //
                                                                       // ** permiso de modificar ** //
                                                                       // ** en pedidos           ** //
                                                                       // ************************** //
       (UTI_USR_Permiso_SN(430, 'A', True) = True)                then // ** Comprueba si tiene   ** //
                                                                       // ** permiso de insertar  ** //
                                                                       // ** en albaranes         ** //
                                                                       // ************************** //
    begin
        // ***************************************************************************************** //
        // ** Crearemos la cabecera del albarán                                                   ** //
        // ***************************************************************************************** //
        var_Fecha            := UTI_CN_Fecha_Hora;
        var_Registro_Empresa := form_pedidos_ventas_000.Crear_Albaran_su_Cabecera( var_Fecha );

        // ***************************************************************************************** //
        // ** Crearemos la línea de detalle, pero sólo si se creo antes la cabecera               ** //
        // ***************************************************************************************** //
        if Trim(var_Registro_Empresa.id) <> '' then
        begin
            form_pedidos_ventas_000.Crear_Albaran_su_Detalle( var_Fecha,
                                                              var_Registro_Empresa.Serie_Albaran,
                                                              var_Registro_Empresa.Numero_Albaran,
                                                                       // ************************** //
                                                              false ); // ** Solo usará la línea  ** //
                                                                       // ** actual, la elegida   ** //
                                                                       // ************************** //
        end;

        // ***************************************************************************************** //
        // ** Comprobar si tengo que cerrar el pedido porque no tiene nada más que convertir en   ** //
        // ** albarán                                                                             ** //
        // ***************************************************************************************** //
        Comprobar_desde_Detalles_Si_Cerramos_0;

        // ***************************************************************************************** //
        // ** Mensaje diciendo que se ha creado la línea como el albarán numero/serie             ** //
        // ***************************************************************************************** //
        var_msg := TStringList.Create;
        var_msg.Add( 'Esta línea elegida de este pedido ahora está ligada con el albarán ' +
                     Trim(var_Registro_Empresa.Serie_Albaran) +
                     '/' +
                     Trim(var_Registro_Empresa.Numero_Albaran)  );

        UTI_GEN_Aviso(false, var_msg, 'PERFECTO.-', True, False);
        var_msg.Free;
    end;
end;

procedure Tform_pedidos_ventas_001.BitBtn_ImprimirClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := true;

    public_imprimir      := true;
end;

function Tform_pedidos_ventas_001.Traer_Representantes_xID( param_id : ShortString ) : TRepresentantes;
var var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
    try
        // ***************************************************************************************** //
        // ** Creamos la Transaccion y la conexión con el motor BD, y la abrimos                  ** //
        // ***************************************************************************************** //
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Connector_Open( var_SQLTransaction,
                                  var_SQLConnector ) = false then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Creamos el SQLQuery y le pasamos el SQLConnector                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery          := TSQLQuery.Create(nil);
        var_SQLQuery.Name     := 'SQLQuery_Traer_Representantes_xID';
        var_SQLQuery.Database := var_SQLConnector;

        // ***************************************************************************************** //
        // ** Creamos la SQL                                                                      ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Clear;
        var_SQLQuery.SQL.AddStrings( 'SELECT rp.*,' + ' ' +

                                            'pb.descripcion AS OT_descripcion_poblacion,' + ' ' +
                                            'pr.descripcion AS OT_descripcion_provincia,' + ' ' +
                                            'ps.descripcion AS OT_descripcion_pais,' + ' ' +

                                            'ct_pb.descripcion AS OT_Cta_Bco_descripcion_poblacion,' + ' ' +
                                            'ct_pr.descripcion AS OT_Cta_Bco_descripcion_provincia,' + ' ' +
                                            'ct_ps.descripcion AS OT_Cta_Bco_descripcion_pais,' + ' ' +

                                            'fp.descripcion AS OT_descripcion_forma_pago,' + ' ' +
                                            'fp.Vencimientos_Cantidad AS OT_Vencimientos_Cantidad,' + ' ' +
                                            'fp.Vencimientos_1_Dias AS OT_Vencimientos_1_Dias,' + ' ' +
                                            'fp.Vencimientos_Dias_Entre AS OT_Vencimientos_Dias_Entre' + ' ' +

                                     'FROM representantes AS rp' + ' ' +

                                     'LEFT JOIN poblaciones AS pb' + ' ' +
                                     'ON rp.id_poblaciones = pb.id' + ' ' +

                                     'LEFT JOIN provincias AS pr' + ' ' +
                                     'ON rp.id_provincias = pr.id' + ' ' +

                                     'LEFT JOIN paises AS ps' + ' ' +
                                     'ON rp.id_paises = ps.id' + ' ' +

                                     'LEFT JOIN poblaciones AS ct_pb' + ' ' +
                                     'ON rp.id_Cta_Bco_poblaciones = ct_pb.id' + ' ' +

                                     'LEFT JOIN provincias AS ct_pr' + ' ' +
                                     'ON rp.id_Cta_Bco_provincias = ct_pr.id' + ' ' +

                                     'LEFT JOIN paises AS ct_ps' + ' ' +
                                     'ON rp.id_Cta_Bco_pais = ct_ps.id' + ' ' +

                                     'LEFT JOIN formas_pago AS fp' + ' ' +
                                     'ON rp.id_formas_pago = fp.id' + ' ' );

        // ***************************************************************************************** //
        // ** Continuamos con la confección de la SQL                                             ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add( 'WHERE rp.id = ' + Trim(param_id) );
        var_SQLQuery.SQL.Add( 'ORDER BY rp.id ASC' );

        // ***************************************************************************************** //
        // ** Abrimos la Query                                                                    ** //
        // ***************************************************************************************** //
        if UTI_TB_Query_Open( '', '', '',
                              var_SQLConnector,
                              var_SQLQuery,
                              -1, // asi me trae todos los registros de golpe
                              var_SQLQuery.SQL.Text ) = false then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Hacemos las comprobaciones que nos hagan falta de la SQL que hemos hecho            ** //
        // ***************************************************************************************** //
        // ** Result = 0 aclarara que no existe el registro buscado por su id                     ** //
        // ***************************************************************************************** //
        if var_SQLQuery.RecordCount = 0 then
             Result.id := '0' // No encontremos este registro
        else begin
             with var_SQLQuery do
             begin
                 Result.id                               := FieldByName('id').AsString;
                 Result.nombre_propietario               := FieldByName('nombre_propietario').AsString;
                 Result.nombre_comercial                 := FieldByName('nombre_comercial').AsString;
                 Result.nif_cif                          := FieldByName('nif_cif').AsString;
                 Result.Fecha_Nacimiento                 := FieldByName('Fecha_Nacimiento').AsString;
                 Result.Tfno_Fijo_1                      := FieldByName('Tfno_Fijo_1').AsString;
                 Result.Tfno_Fijo_2                      := FieldByName('Tfno_Fijo_2').AsString;
                 Result.FAX                              := FieldByName('FAX').AsString;
                 Result.Movil                            := FieldByName('Movil').AsString;
                 Result.eMail                            := FieldByName('eMail').AsString;
                 Result.pagina_web                       := FieldByName('pagina_web').AsString;
                 Result.Direccion                        := FieldByName('Direccion').AsString;
                 Result.Direccion_Numero                 := FieldByName('Direccion_Numero').AsString;
                 Result.Direccion_Piso_Letra             := FieldByName('Direccion_Piso_Letra').AsString;
                 Result.Codigo_Postal                    := FieldByName('Codigo_Postal').AsString;
                 Result.id_poblaciones                   := FieldByName('id_poblaciones').AsString;
                 Result.id_provincias                    := FieldByName('id_provincias').AsString;
                 Result.id_paises                        := FieldByName('id_paises').AsString;
                 Result.Cta_Bco_Entidad                  := FieldByName('Cta_Bco_Entidad').AsString;
                 Result.Cta_Bco_Sucursal                 := FieldByName('Cta_Bco_Sucursal').AsString;
                 Result.Cta_Bco_Digito_Control           := FieldByName('Cta_Bco_Digito_Control').AsString;
                 Result.Cta_Bco_Cuenta                   := FieldByName('Cta_Bco_Cuenta').AsString;
                 Result.Cta_Bco_IBAN                     := FieldByName('Cta_Bco_IBAN').AsString;
                 Result.Cta_Bco_BIC_SWIFT                := FieldByName('Cta_Bco_BIC_SWIFT').AsString;
                 Result.Cta_Bco_Mandato_Fecha_de_Firma   := FieldByName('Cta_Bco_Mandato_Fecha_de_Firma').AsString;
                 Result.Cta_Bco_Mandato_Ref              := FieldByName('Cta_Bco_Mandato_Ref').AsString;
                 Result.Cta_Bco_Direccion                := FieldByName('Cta_Bco_Direccion').AsString;
                 Result.Cta_Bco_Direccion_Numero         := FieldByName('Cta_Bco_Direccion_Numero').AsString;
                 Result.Cta_Bco_Direccion_Piso_Letra     := FieldByName('Cta_Bco_Direccion_Piso_Letra').AsString;
                 Result.Cta_Bco_Codigo_Postal            := FieldByName('Cta_Bco_Codigo_Postal').AsString;
                 Result.id_Cta_Bco_poblaciones           := FieldByName('id_Cta_Bco_poblaciones').AsString;
                 Result.id_Cta_Bco_provincias            := FieldByName('id_Cta_Bco_provincias').AsString;
                 Result.id_Cta_Bco_pais                  := FieldByName('id_Cta_Bco_pais').AsString;
                 Result.id_formas_pago                   := FieldByName('id_formas_pago').AsString;
                 Result.Forma_pago_Dia_1                 := FieldByName('Forma_pago_Dia_1').AsString;
                 Result.Forma_pago_Dia_2                 := FieldByName('Forma_pago_Dia_2').AsString;
                 Result.Vencimientos_automaticos_SN      := FieldByName('Vencimientos_automaticos_SN').AsString;
                 Result.Forma_pago_Vacaciones_Dia_Inicio := FieldByName('Forma_pago_Vacaciones_Dia_Inicio').AsString;
                 Result.Forma_pago_Vacaciones_Mes_Inicio := FieldByName('Forma_pago_Vacaciones_Mes_Inicio').AsString;
                 Result.Forma_pago_Vacaciones_Dia_Fin    := FieldByName('Forma_pago_Vacaciones_Dia_Fin').AsString;
                 Result.Forma_pago_Vacaciones_Mes_Fin    := FieldByName('Forma_pago_Vacaciones_Mes_Fin').AsString;
                 Result.IVA_con_Recargo_SN               := FieldByName('IVA_con_Recargo_SN').AsString;
                 Result.IVA_Excluido_SN                  := FieldByName('IVA_Excluido_SN').AsString;
                 Result.Comision                         := FieldByName('Comision').AsString;
                 Result.Retencion                        := FieldByName('Retencion').AsString;
                 Result.Saldo_Acumulado                  := FieldByName('Saldo_Acumulado').AsString;
                 Result.Activar_Proximidad_SN            := FieldByName('Activar_Proximidad_SN').AsString;
                 Result.Cuenta_Contable                  := FieldByName('Cuenta_Contable').AsString;
                 Result.Observaciones_Comentarios        := FieldByName('Observaciones_Comentarios').AsString;

                 Result.Insert_WHEN                      := FieldByName('Insert_WHEN').AsString;
                 Result.Insert_Id_User                   := FieldByName('Insert_Id_User').AsString;
                 Result.Del_WHEN                         := FieldByName('Del_WHEN').AsString;
                 Result.Del_Id_User                      := FieldByName('Del_Id_User').AsString;
                 Result.Del_WHY                          := FieldByName('Del_WHY').AsString;
                 Result.Change_WHEN                      := FieldByName('Change_WHEN').AsString;
                 Result.Change_Id_User                   := FieldByName('Change_Id_User').AsString;

                 Result.OT_descripcion_poblacion         := FieldByName('OT_descripcion_poblacion').AsString;
                 Result.OT_descripcion_provincia         := FieldByName('OT_descripcion_provincia').AsString;
                 Result.OT_descripcion_pais              := FieldByName('OT_descripcion_pais').AsString;
                 Result.OT_Cta_Bco_descripcion_poblacion := FieldByName('OT_Cta_Bco_descripcion_poblacion').AsString;
                 Result.OT_Cta_Bco_descripcion_provincia := FieldByName('OT_Cta_Bco_descripcion_provincia').AsString;
                 Result.OT_Cta_Bco_descripcion_pais      := FieldByName('OT_Cta_Bco_descripcion_pais').AsString;
                 Result.OT_descripcion_forma_pago        := FieldByName('OT_descripcion_forma_pago').AsString;
                 Result.OT_Vencimientos_Cantidad         := FieldByName('OT_Vencimientos_Cantidad').AsString;
                 Result.OT_Vencimientos_1_Dias           := FieldByName('OT_Vencimientos_1_Dias').AsString;
                 Result.OT_Vencimientos_Dias_Entre       := FieldByName('OT_Vencimientos_Dias_Entre').AsString;
             end;
        end;

        // ***************************************************************************************** //
        // ** Cerramos la tabla y asi se cierra automaticamente La transacción y conexión con BD  ** //
        // ***************************************************************************************** //
        if UTI_TB_Cerrar( var_SQLConnector,
                          var_SQLTransaction,
                          var_SQLQuery ) = false then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Destruimos la tabla y conexiones                                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery.Free;
        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( 'Ocurrió un error al intentar traer todos los datos del representante con' +
                               ' la id ' + Trim(param_id) + '. La tabla ha sido ' +
                               var_SQLQuery.Name + ' desde el módulo ' + Screen.ActiveForm.Name,
                               error );
            try
                var_SQLTransaction.Free;
                var_SQLConnector.Free;
                var_SQLQuery.Free;
            except
            end;
        end;
    end;
end;

function Tform_pedidos_ventas_001.Traer_Proveedores_xID( param_id : ShortString ) : TProveedores;
var var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
    try
        // ***************************************************************************************** //
        // ** Creamos la Transaccion y la conexión con el motor BD, y la abrimos                  ** //
        // ***************************************************************************************** //
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Connector_Open( var_SQLTransaction,
                                  var_SQLConnector ) = false then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Creamos el SQLQuery y le pasamos el SQLConnector                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery          := TSQLQuery.Create(nil);
        var_SQLQuery.Name     := 'SQLQuery_Traer_Proveedores_xID';
        var_SQLQuery.Database := var_SQLConnector;

        { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
          y que por lo se debe de permitir modificarlos en ningún módulo }

        var_SQLQuery.SQL.Clear;
        var_SQLQuery.SQL.AddStrings( 'SELECT pr.*,' + ' ' +

                                            'act.descripcion AS OT_descripcion_actividad,' + ' ' +

                                            'pb.descripcion AS OT_descripcion_poblacion,' + ' ' +
                                            'prv.descripcion AS OT_descripcion_provincia,' + ' ' +
                                            'ps.descripcion AS OT_descripcion_pais,' + ' ' +

                                            'pt.descripcion AS OT_descripcion_proveedor_tipo,' + ' ' +
                                            'pt.Cuenta_Contable AS OT_Cuenta_Contable_proveedor_tipo,' + ' ' +


                                            'ct_pb.descripcion AS OT_Cta_Bco_descripcion_poblacion,' + ' ' +
                                            'ct_prv.descripcion AS OT_Cta_Bco_descripcion_provincia,' + ' ' +
                                            'ct_ps.descripcion AS OT_Cta_Bco_descripcion_pais,' + ' ' +

                                            'fp.descripcion AS OT_descripcion_forma_pago,' + ' ' +
                                            'fp.Vencimientos_Cantidad AS OT_Vencimientos_Cantidad,' + ' ' +
                                            'fp.Vencimientos_1_Dias AS OT_Vencimientos_1_Dias,' + ' ' +
                                            'fp.Vencimientos_Dias_Entre AS OT_Vencimientos_Dias_Entre,' + ' ' +

                                            'agprv.nombre_propietario AS OT_descripcion_agencia_transporte,' + ' ' +
                                            'agprv.Tfno_Fijo_1 AS OT_Tfno_Fijo_1_agencia_transporte,' + ' ' +
                                            'agprv.Movil AS OT_Movil_agencia_transporte' + ' ' +

                                     'FROM proveedores AS pr' + ' ' +

                                     'LEFT JOIN poblaciones AS pb' + ' ' +
                                     'ON pr.id_poblaciones = pb.id' + ' ' +

                                     'LEFT JOIN provincias AS prv' + ' ' +
                                     'ON pr.id_provincias = prv.id' + ' ' +

                                     'LEFT JOIN paises AS ps' + ' ' +
                                     'ON pr.id_paises = ps.id' + ' ' +

                                     'LEFT JOIN proveedores_tipos AS pt' + ' ' +
                                     'ON pr.id_proveedores_tipos = pt.id' + ' ' +

                                     'LEFT JOIN poblaciones AS ct_pb' + ' ' +
                                     'ON pr.id_Cta_Bco_poblaciones = ct_pb.id' + ' ' +

                                     'LEFT JOIN provincias AS ct_prv' + ' ' +
                                     'ON pr.id_Cta_Bco_provincias = ct_prv.id' + ' ' +

                                     'LEFT JOIN paises AS ct_ps' + ' ' +
                                     'ON pr.id_Cta_Bco_pais = ct_ps.id' + ' ' +

                                     'LEFT JOIN formas_pago AS fp' + ' ' +
                                     'ON pr.id_formas_pago = fp.id' + ' ' +

                                     'LEFT JOIN actividades AS act' + ' ' +
                                     'ON pr.id_actividades = act.id' + ' ' +

                                     'LEFT JOIN proveedores AS agprv' + ' ' +
                                     'ON pr.id_Agencias_Transporte = agprv.id' + ' ' );

        // ***************************************************************************************** //
        // ** Continuamos con la confección de la SQL                                             ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add( 'WHERE pr.id = ' + Trim(param_id) );
        var_SQLQuery.SQL.Add( 'ORDER BY pr.id ASC' );

        // ***************************************************************************************** //
        // ** Abrimos la Query                                                                    ** //
        // ***************************************************************************************** //
        if UTI_TB_Query_Open( '', '', '',
                              var_SQLConnector,
                              var_SQLQuery,
                              -1, // asi me trae todos los registros de golpe
                              var_SQLQuery.SQL.Text ) = false then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Hacemos las comprobaciones que nos hagan falta de la SQL que hemos hecho            ** //
        // ***************************************************************************************** //
        // ** Result = 0 aclarara que no existe el registro buscado por su id                     ** //
        // ***************************************************************************************** //
        if var_SQLQuery.RecordCount = 0 then
             Result.id := '0' // No encontremos este registro
        else begin
             with var_SQLQuery do
             begin
                 Result.id                                := FieldByName('id').AsString;
                 Result.nombre_propietario                := FieldByName('nombre_propietario').AsString;
                 Result.nombre_comercial                  := FieldByName('nombre_comercial').AsString;
                 Result.nif_cif                           := FieldByName('nif_cif').AsString;
                 Result.Tfno_Fijo_1                       := FieldByName('Tfno_Fijo_1').AsString;
                 Result.Tfno_Fijo_2                       := FieldByName('Tfno_Fijo_2').AsString;
                 Result.FAX                               := FieldByName('FAX').AsString;
                 Result.Movil                             := FieldByName('Movil').AsString;
                 Result.eMail                             := FieldByName('eMail').AsString;
                 Result.pagina_web                        := FieldByName('pagina_web').AsString;
                 Result.Direccion                         := FieldByName('Direccion').AsString;
                 Result.Direccion_Numero                  := FieldByName('Direccion_Numero').AsString;
                 Result.Direccion_Piso_Letra              := FieldByName('Direccion_Piso_Letra').AsString;
                 Result.Codigo_Postal                     := FieldByName('Codigo_Postal').AsString;
                 Result.id_poblaciones                    := FieldByName('id_poblaciones').AsString;
                 Result.id_provincias                     := FieldByName('id_provincias').AsString;
                 Result.id_paises                         := FieldByName('id_paises').AsString;
                 Result.id_proveedores_tipos              := FieldByName('id_proveedores_tipos').AsString;
                 Result.Cta_Bco_Entidad                   := FieldByName('Cta_Bco_Entidad').AsString;
                 Result.Cta_Bco_Sucursal                  := FieldByName('Cta_Bco_Sucursal').AsString;
                 Result.Cta_Bco_Digito_Control            := FieldByName('Cta_Bco_Digito_Control').AsString;
                 Result.Cta_Bco_Cuenta                    := FieldByName('Cta_Bco_Cuenta').AsString;
                 Result.Cta_Bco_IBAN                      := FieldByName('Cta_Bco_IBAN').AsString;
                 Result.Cta_Bco_BIC_SWIFT                 := FieldByName('Cta_Bco_BIC_SWIFT').AsString;
                 Result.Cta_Bco_Mandato_Fecha_de_Firma    := FieldByName('Cta_Bco_Mandato_Fecha_de_Firma').AsString;
                 Result.Cta_Bco_Mandato_Ref               := FieldByName('Cta_Bco_Mandato_Ref').AsString;
                 Result.Cta_Bco_Direccion                 := FieldByName('Cta_Bco_Direccion').AsString;
                 Result.Cta_Bco_Direccion_Numero          := FieldByName('Cta_Bco_Direccion_Numero').AsString;
                 Result.Cta_Bco_Direccion_Piso_Letra      := FieldByName('Cta_Bco_Direccion_Piso_Letra').AsString;
                 Result.Cta_Bco_Codigo_Postal             := FieldByName('Cta_Bco_Codigo_Postal').AsString;
                 Result.id_Cta_Bco_poblaciones            := FieldByName('id_Cta_Bco_poblaciones').AsString;
                 Result.id_Cta_Bco_provincias             := FieldByName('id_Cta_Bco_provincias').AsString;
                 Result.id_Cta_Bco_pais                   := FieldByName('id_Cta_Bco_pais').AsString;
                 Result.id_formas_pago                    := FieldByName('id_formas_pago').AsString;
                 Result.Forma_pago_Dia_1                  := FieldByName('Forma_pago_Dia_1').AsString;
                 Result.Forma_pago_Dia_2                  := FieldByName('Forma_pago_Dia_2').AsString;
                 Result.Vencimientos_automaticos_SN       := FieldByName('Vencimientos_automaticos_SN').AsString;
                 Result.Forma_pago_Vacaciones_Dia_Inicio  := FieldByName('Forma_pago_Vacaciones_Dia_Inicio').AsString;
                 Result.Forma_pago_Vacaciones_Mes_Inicio  := FieldByName('Forma_pago_Vacaciones_Mes_Inicio').AsString;
                 Result.Forma_pago_Vacaciones_Dia_Fin     := FieldByName('Forma_pago_Vacaciones_Dia_Fin').AsString;
                 Result.Forma_pago_Vacaciones_Mes_Fin     := FieldByName('Forma_pago_Vacaciones_Mes_Fin').AsString;
                 Result.IVA_con_Recargo_SN                := FieldByName('IVA_con_Recargo_SN').AsString;
                 Result.IVA_Excluido_SN                   := FieldByName('IVA_Excluido_SN').AsString;
                 Result.Descuento_Linea                   := FieldByName('Descuento_Linea').AsString;
                 Result.Descuento_Comercial_1             := FieldByName('Descuento_Comercial_1').AsString;
                 Result.Descuento_Comercial_2             := FieldByName('Descuento_Comercial_2').AsString;
                 Result.Descuento_Pronto_Pago             := FieldByName('Descuento_Pronto_Pago').AsString;
                 Result.Descuento_Final                   := FieldByName('Descuento_Final').AsString;
                 Result.Retencion                         := FieldByName('Retencion').AsString;
                 Result.Cuenta_Contable                   := FieldByName('Cuenta_Contable').AsString;
                 Result.id_Agencias_Transporte            := FieldByName('id_Agencias_Transporte').AsString;
                 Result.Observaciones_Comentarios         := FieldByName('Observaciones_Comentarios').AsString;

                 Result.Insert_WHEN                       := FieldByName('Insert_WHEN').AsString;
                 Result.Insert_Id_User                    := FieldByName('Insert_Id_User').AsString;
                 Result.Del_WHEN                          := FieldByName('Del_WHEN').AsString;
                 Result.Del_Id_User                       := FieldByName('Del_Id_User').AsString;
                 Result.Del_WHY                           := FieldByName('Del_WHY').AsString;
                 Result.Change_WHEN                       := FieldByName('Change_WHEN').AsString;
                 Result.Change_Id_User                    := FieldByName('Change_Id_User').AsString;

                 Result.OT_descripcion_poblacion          := FieldByName('OT_descripcion_poblacion').AsString;
                 Result.OT_descripcion_provincia          := FieldByName('OT_descripcion_provincia').AsString;
                 Result.OT_descripcion_pais               := FieldByName('OT_descripcion_pais').AsString;

                 Result.OT_descripcion_proveedor_tipo     := FieldByName('OT_descripcion_proveedor_tipo').AsString;
                 Result.OT_Cuenta_Contable_proveedor_tipo := FieldByName('OT_Cuenta_Contable_proveedor_tipo').AsString;

                 Result.OT_Cta_Bco_descripcion_poblacion  := FieldByName('OT_Cta_Bco_descripcion_poblacion').AsString;
                 Result.OT_Cta_Bco_descripcion_provincia  := FieldByName('OT_Cta_Bco_descripcion_provincia').AsString;
                 Result.OT_Cta_Bco_descripcion_pais       := FieldByName('OT_Cta_Bco_descripcion_pais').AsString;

                 Result.OT_descripcion_forma_pago         := FieldByName('OT_descripcion_forma_pago').AsString;
                 Result.OT_Vencimientos_Cantidad          := FieldByName('OT_Vencimientos_Cantidad').AsString;
                 Result.OT_Vencimientos_1_Dias            := FieldByName('OT_Vencimientos_1_Dias').AsString;
                 Result.OT_Vencimientos_Dias_Entre        := FieldByName('OT_Vencimientos_Dias_Entre').AsString;

                 Result.OT_descripcion_agencia_transporte := FieldByName('OT_descripcion_agencia_transporte').AsString;
                 Result.OT_Tfno_Fijo_1_agencia_transporte := FieldByName('OT_Tfno_Fijo_1_agencia_transporte').AsString;
                 Result.OT_Movil_agencia_transporte       := FieldByName('OT_Movil_agencia_transporte').AsString;
             end;
        end;

        // ***************************************************************************************** //
        // ** Cerramos la tabla y asi se cierra automaticamente La transacción y conexión con BD  ** //
        // ***************************************************************************************** //
        if UTI_TB_Cerrar( var_SQLConnector,
                          var_SQLTransaction,
                          var_SQLQuery ) = false then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Destruimos la tabla y conexiones                                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery.Free;
        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( 'Ocurrió un error al intentar traer todos los datos del proveedor con' +
                               ' la id ' + Trim(param_id) + '. La tabla ha sido ' +
                               var_SQLQuery.Name + ' desde el módulo ' + Screen.ActiveForm.Name,
                               error );
            try
                var_SQLTransaction.Free;
                var_SQLConnector.Free;
                var_SQLQuery.Free;
            except
            end;
        end;
    end;
end;

function Tform_pedidos_ventas_001.Traer_Clientes_xID( param_id : ShortString ) : TClientes;
var var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
    try
        // ***************************************************************************************** //
        // ** Creamos la Transaccion y la conexión con el motor BD, y la abrimos                  ** //
        // ***************************************************************************************** //
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Connector_Open( var_SQLTransaction,
                                  var_SQLConnector ) = false then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Creamos el SQLQuery y le pasamos el SQLConnector                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery          := TSQLQuery.Create(nil);
        var_SQLQuery.Name     := 'SQLQuery_Traer_Clientes_xID';
        var_SQLQuery.Database := var_SQLConnector;

        // ***************************************************************************************** //
        // ** Creamos la SQL                                                                      ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Clear;
        var_SQLQuery.SQL.AddStrings( 'SELECT cl.*,' + ' ' +

                                            'act.descripcion AS OT_descripcion_actividad,' + ' ' +
                                            'rt.descripcion AS OT_descripcion_ruta,' + ' ' +

                                            'pb.descripcion AS OT_descripcion_poblacion,' + ' ' +
                                            'pr.descripcion AS OT_descripcion_provincia,' + ' ' +
                                            'ps.descripcion AS OT_descripcion_pais,' + ' ' +

                                            'ct.descripcion AS OT_descripcion_cliente_tipo,' + ' ' +
                                            'ct.Cuenta_Contable AS OT_Cuenta_Contable_cliente_tipo,' + ' ' +

                                            'ct_pb.descripcion AS OT_Cta_Bco_descripcion_poblacion,' + ' ' +
                                            'ct_pr.descripcion AS OT_Cta_Bco_descripcion_provincia,' + ' ' +
                                            'ct_ps.descripcion AS OT_Cta_Bco_descripcion_pais,' + ' ' +

                                            'fp.descripcion AS OT_descripcion_forma_pago,' + ' ' +
                                            'fp.Vencimientos_Cantidad AS OT_Vencimientos_Cantidad,' + ' ' +
                                            'fp.Vencimientos_1_Dias AS OT_Vencimientos_1_Dias,' + ' ' +
                                            'fp.Vencimientos_Dias_Entre AS OT_Vencimientos_Dias_Entre,' + ' ' +

                                            'tf.descripcion AS OT_descripcion_tarifa,' + ' ' +

                                            'prv.nombre_propietario AS OT_descripcion_agencia_transporte,' + ' ' +
                                            'prv.Tfno_Fijo_1 AS OT_Tfno_Fijo_1_agencia_transporte,' + ' ' +
                                            'prv.Movil AS OT_Movil_agencia_transporte,' + ' ' +

                                            'rp.nombre_propietario AS OT_descripcion_representante,' + ' ' +
                                            'rp.Tfno_Fijo_1 AS OT_Tfno_Fijo_1_representante,' + ' ' +
                                            'rp.Movil AS OT_Movil_representante' + ' ' +

                                     'FROM clientes AS cl' + ' ' +

                                     'LEFT JOIN poblaciones AS pb' + ' ' +
                                     'ON cl.id_poblaciones = pb.id' + ' ' +

                                     'LEFT JOIN provincias AS pr' + ' ' +
                                     'ON cl.id_provincias = pr.id' + ' ' +

                                     'LEFT JOIN paises AS ps' + ' ' +
                                     'ON cl.id_paises = ps.id' + ' ' +

                                     'LEFT JOIN clientes_tipos AS ct' + ' ' +
                                     'ON cl.id_clientes_tipos = ct.id' + ' ' +

                                     'LEFT JOIN poblaciones AS ct_pb' + ' ' +
                                     'ON cl.id_Cta_Bco_poblaciones = ct_pb.id' + ' ' +

                                     'LEFT JOIN provincias AS ct_pr' + ' ' +
                                     'ON cl.id_Cta_Bco_provincias = ct_pr.id' + ' ' +

                                     'LEFT JOIN paises AS ct_ps' + ' ' +
                                     'ON cl.id_Cta_Bco_pais = ct_ps.id' + ' ' +

                                     'LEFT JOIN formas_pago AS fp' + ' ' +
                                     'ON cl.id_formas_pago = fp.id' + ' ' +

                                     'LEFT JOIN tarifas AS tf' + ' ' +
                                     'ON cl.id_tarifas = tf.id' + ' ' +

                                     'LEFT JOIN proveedores AS prv' + ' ' +
                                     'ON cl.id_Agencias_Transporte = prv.id' + ' ' +

                                     'LEFT JOIN actividades AS act' + ' ' +
                                     'ON cl.id_actividades = act.id' + ' ' +

                                     'LEFT JOIN rutas AS rt' + ' ' +
                                     'ON cl.id_rutas = rt.id' + ' ' +

                                     'LEFT JOIN representantes AS rp' + ' ' +
                                     'ON cl.id_Representantes = rp.id' + ' ' );

        // ***************************************************************************************** //
        // ** Continuamos con la confección de la SQL                                             ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add( 'WHERE cl.id = ' + Trim(param_id) );
        var_SQLQuery.SQL.Add( 'ORDER BY cl.id ASC' );

        // ***************************************************************************************** //
        // ** Abrimos la Query                                                                    ** //
        // ***************************************************************************************** //
        if UTI_TB_Query_Open( '', '', '',
                              var_SQLConnector,
                              var_SQLQuery,
                              -1, // asi me trae todos los registros de golpe
                              var_SQLQuery.SQL.Text ) = false then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Hacemos las comprobaciones que nos hagan falta de la SQL que hemos hecho            ** //
        // ***************************************************************************************** //
        // ** Result = 0 aclarara que no existe el registro buscado por su id                     ** //
        // ***************************************************************************************** //
        if var_SQLQuery.RecordCount = 0 then
             Result.id := '0' // No encontremos este registro
        else begin
             with var_SQLQuery do
             begin
                 Result.id                                := FieldByName('id').AsString;
                 Result.nombre_propietario                := FieldByName('nombre_propietario').AsString;
                 Result.nombre_comercial                  := FieldByName('nombre_comercial').AsString;
                 Result.nif_cif                           := FieldByName('nif_cif').AsString;
          	 Result.Fecha_Nacimiento                  := FieldByName('Fecha_Nacimiento').AsString;
                 Result.Tfno_Fijo_1                       := FieldByName('Tfno_Fijo_1').AsString;
                 Result.Tfno_Fijo_2                       := FieldByName('Tfno_Fijo_2').AsString;
                 Result.FAX                               := FieldByName('FAX').AsString;
                 Result.Movil                             := FieldByName('Movil').AsString;
                 Result.eMail                             := FieldByName('eMail').AsString;
                 Result.pagina_web                        := FieldByName('pagina_web').AsString;
                 Result.Direccion                         := FieldByName('Direccion').AsString;
                 Result.Direccion_Numero                  := FieldByName('Direccion_Numero').AsString;
                 Result.Direccion_Piso_Letra              := FieldByName('Direccion_Piso_Letra').AsString;
                 Result.Codigo_Postal                     := FieldByName('Codigo_Postal').AsString;
                 Result.id_poblaciones                    := FieldByName('id_poblaciones').AsString;
                 Result.id_provincias                     := FieldByName('id_provincias').AsString;
                 Result.id_paises                         := FieldByName('id_paises').AsString;
                 Result.id_clientes_tipos                 := FieldByName('id_clientes_tipos').AsString;
                 Result.Cta_Bco_Entidad                   := FieldByName('Cta_Bco_Entidad').AsString;
                 Result.Cta_Bco_Sucursal                  := FieldByName('Cta_Bco_Sucursal').AsString;
                 Result.Cta_Bco_Digito_Control            := FieldByName('Cta_Bco_Digito_Control').AsString;
                 Result.Cta_Bco_Cuenta                    := FieldByName('Cta_Bco_Cuenta').AsString;
                 Result.Cta_Bco_IBAN                      := FieldByName('Cta_Bco_IBAN').AsString;
                 Result.Cta_Bco_BIC_SWIFT                 := FieldByName('Cta_Bco_BIC_SWIFT').AsString;
                 Result.Cta_Bco_Mandato_Fecha_de_Firma    := FieldByName('Cta_Bco_Mandato_Fecha_de_Firma').AsString;
                 Result.Cta_Bco_Mandato_Ref               := FieldByName('Cta_Bco_Mandato_Ref').AsString;
                 Result.Cta_Bco_Direccion                 := FieldByName('Cta_Bco_Direccion').AsString;
                 Result.Cta_Bco_Direccion_Numero          := FieldByName('Cta_Bco_Direccion_Numero').AsString;
                 Result.Cta_Bco_Direccion_Piso_Letra      := FieldByName('Cta_Bco_Direccion_Piso_Letra').AsString;
                 Result.Cta_Bco_Codigo_Postal             := FieldByName('Cta_Bco_Codigo_Postal').AsString;
                 Result.id_Cta_Bco_poblaciones            := FieldByName('id_Cta_Bco_poblaciones').AsString;
                 Result.id_Cta_Bco_provincias             := FieldByName('id_Cta_Bco_provincias').AsString;
                 Result.id_Cta_Bco_pais                   := FieldByName('id_Cta_Bco_pais').AsString;
                 Result.id_formas_pago                    := FieldByName('id_formas_pago').AsString;
                 Result.Forma_pago_Dia_1                  := FieldByName('Forma_pago_Dia_1').AsString;
                 Result.Forma_pago_Dia_2                  := FieldByName('Forma_pago_Dia_2').AsString;
                 Result.Vencimientos_automaticos_SN       := FieldByName('Vencimientos_automaticos_SN').AsString;
                 Result.Forma_pago_Vacaciones_Dia_Inicio  := FieldByName('Forma_pago_Vacaciones_Dia_Inicio').AsString;
                 Result.Forma_pago_Vacaciones_Mes_Inicio  := FieldByName('Forma_pago_Vacaciones_Mes_Inicio').AsString;
                 Result.Forma_pago_Vacaciones_Dia_Fin     := FieldByName('Forma_pago_Vacaciones_Dia_Fin').AsString;
                 Result.Forma_pago_Vacaciones_Mes_Fin     := FieldByName('Forma_pago_Vacaciones_Mes_Fin').AsString;
                 Result.IVA_con_Recargo_SN                := FieldByName('IVA_con_Recargo_SN').AsString;
                 Result.IVA_Excluido_SN                   := FieldByName('IVA_Excluido_SN').AsString;
                 Result.id_tarifas                        := FieldByName('id_tarifas').AsString;
                 Result.Descuento_Comercial_1             := FieldByName('Descuento_Comercial_1').AsString;
                 Result.Descuento_Comercial_2             := FieldByName('Descuento_Comercial_2').AsString;
                 Result.Descuento_Pronto_Pago             := FieldByName('Descuento_Pronto_Pago').AsString;
                 Result.Descuento_Final                   := FieldByName('Descuento_Final').AsString;
                 Result.Retencion                         := FieldByName('Retencion').AsString;
                 Result.Riesgo_Autorizado                 := FieldByName('Riesgo_Autorizado').AsString;
                 Result.Riesgo_Acumulado                  := FieldByName('Riesgo_Acumulado').AsString;
                 Result.Agrupar_Albaranes_SN              := FieldByName('Agrupar_Albaranes_SN').AsString;
                 Result.Activar_Proximidad_SN             := FieldByName('Activar_Proximidad_SN').AsString;
                 Result.Cuenta_Contable                   := FieldByName('Cuenta_Contable').AsString;
                 Result.id_Agencias_Transporte            := FieldByName('id_Agencias_Transporte').AsString;
                 Result.Portes_Pagados_SN                 := FieldByName('Portes_Pagados_SN').AsString;
                 Result.id_Representantes                 := FieldByName('id_Representantes').AsString;
                 Result.Observaciones_Comentarios         := FieldByName('Observaciones_Comentarios').AsString;
                 Result.Estudia_SN                        := FieldByName('Estudia_SN').AsString;
                 Result.Trabaja_SN                        := FieldByName('Trabaja_SN').AsString;
                 Result.Estudios_Trabajos                 := FieldByName('Estudios_Trabajos').AsString;
                 Result.Cantidad_Hermanos                 := FieldByName('Cantidad_Hermanos').AsString;
                 Result.id_rutas                          := FieldByName('id_rutas').AsString;
                 Result.id_actividades                    := FieldByName('id_actividades').AsString;

                 Result.Insert_WHEN                       := FieldByName('Insert_WHEN').AsString;
                 Result.Insert_Id_User                    := FieldByName('Insert_Id_User').AsString;
                 Result.Del_WHEN                          := FieldByName('Del_WHEN').AsString;
                 Result.Del_Id_User                       := FieldByName('Del_Id_User').AsString;
                 Result.Del_WHY                           := FieldByName('Del_WHY').AsString;
                 Result.Change_WHEN                       := FieldByName('Change_WHEN').AsString;
                 Result.Change_Id_User                    := FieldByName('Change_Id_User').AsString;

                 Result.OT_descripcion_actividad          := FieldByName('OT_descripcion_actividad').AsString;
                 Result.OT_descripcion_ruta               := FieldByName('OT_descripcion_ruta').AsString;
                 Result.OT_descripcion_poblacion          := FieldByName('OT_descripcion_poblacion').AsString;
                 Result.OT_descripcion_provincia          := FieldByName('OT_descripcion_provincia').AsString;
                 Result.OT_descripcion_pais               := FieldByName('OT_descripcion_pais').AsString;
                 Result.OT_descripcion_cliente_tipo       := FieldByName('OT_descripcion_cliente_tipo').AsString;
                 Result.OT_Cuenta_Contable_cliente_tipo   := FieldByName('OT_Cuenta_Contable_cliente_tipo').AsString;
                 Result.OT_Cta_Bco_descripcion_poblacion  := FieldByName('OT_Cta_Bco_descripcion_poblacion').AsString;
                 Result.OT_Cta_Bco_descripcion_provincia  := FieldByName('OT_Cta_Bco_descripcion_provincia').AsString;
                 Result.OT_Cta_Bco_descripcion_pais       := FieldByName('OT_Cta_Bco_descripcion_pais').AsString;
                 Result.OT_descripcion_forma_pago         := FieldByName('OT_descripcion_forma_pago').AsString;
                 Result.OT_Vencimientos_Cantidad          := FieldByName('OT_Vencimientos_Cantidad').AsString;
                 Result.OT_Vencimientos_1_Dias            := FieldByName('OT_Vencimientos_1_Dias').AsString;
                 Result.OT_Vencimientos_Dias_Entre        := FieldByName('OT_Vencimientos_Dias_Entre').AsString;

                 Result.OT_descripcion_tarifa             := FieldByName('OT_descripcion_tarifa').AsString;
                 Result.OT_descripcion_agencia_transporte := FieldByName('OT_descripcion_agencia_transporte').AsString;
                 Result.OT_Tfno_Fijo_1_agencia_transporte := FieldByName('OT_Tfno_Fijo_1_agencia_transporte').AsString;
                 Result.OT_Movil_agencia_transporte       := FieldByName('OT_Movil_agencia_transporte').AsString;
                 Result.OT_descripcion_representante      := FieldByName('OT_descripcion_representante').AsString;
                 Result.OT_Tfno_Fijo_1_representante      := FieldByName('OT_Tfno_Fijo_1_representante').AsString;
                 Result.OT_Movil_representante            := FieldByName('OT_Movil_representante').AsString;
             end;
        end;

        // ***************************************************************************************** //
        // ** Cerramos la tabla y asi se cierra automaticamente La transacción y conexión con BD  ** //
        // ***************************************************************************************** //
        if UTI_TB_Cerrar( var_SQLConnector,
                          var_SQLTransaction,
                          var_SQLQuery ) = false then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Destruimos la tabla y conexiones                                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery.Free;
        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( 'Ocurrió un error al intentar traer todos los datos del cliente con' +
                               ' la id ' + Trim(param_id) + '. La tabla ha sido ' +
                               var_SQLQuery.Name + ' desde el módulo ' + Screen.ActiveForm.Name,
                               error );
            try
                var_SQLTransaction.Free;
                var_SQLConnector.Free;
                var_SQLQuery.Free;
            except
            end;
        end;
    end;
end;

function Tform_pedidos_ventas_001.Traer_Clientes_Envios_xID( param_id : ShortString ) : TClientes_Envios;
var var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
    try
        // ***************************************************************************************** //
        // ** Creamos la Transaccion y la conexión con el motor BD, y la abrimos                  ** //
        // ***************************************************************************************** //
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Connector_Open( var_SQLTransaction,
                                  var_SQLConnector ) = false then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Creamos el SQLQuery y le pasamos el SQLConnector                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery          := TSQLQuery.Create(nil);
        var_SQLQuery.Name     := 'SQLQuery_Traer_Clientes_Envios_xID';
        var_SQLQuery.Database := var_SQLConnector;

        // ***************************************************************************************** //
        // ** Creamos la SQL                                                                      ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Clear;
        var_SQLQuery.SQL.AddStrings( 'SELECT ce.*,' + ' ' +

                                            'pb.descripcion AS OT_descripcion_poblacion,' + ' ' +
                                            'pr.descripcion AS OT_descripcion_provincia,' + ' ' +
                                            'ps.descripcion AS OT_descripcion_pais,' + ' ' +
                                            'cc.nombre AS OT_descripcion_Contacto' + ' ' +

                                     'FROM clientes_envios AS ce' + ' ' +

                                     'LEFT JOIN poblaciones AS pb' + ' ' +
                                     'ON ce.id_poblaciones = pb.id' + ' ' +

                                     'LEFT JOIN provincias AS pr' + ' ' +
                                     'ON ce.id_provincias = pr.id' + ' ' +

                                     'LEFT JOIN paises AS ps' + ' ' +
                                     'ON ce.id_paises = ps.id' + ' ' +

                                     'LEFT JOIN clientes_contactos AS cc' + ' ' +
                                     'ON ce.id_clientes_contactos = cc.id' + ' ' );

        // ***************************************************************************************** //
        // ** Continuamos con la confección de la SQL                                             ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add( 'WHERE ce.id = ' + Trim(param_id) );
        var_SQLQuery.SQL.Add( 'ORDER BY ce.id ASC' );

        // ***************************************************************************************** //
        // ** Abrimos la Query                                                                    ** //
        // ***************************************************************************************** //
        if UTI_TB_Query_Open( '', '', '',
                              var_SQLConnector,
                              var_SQLQuery,
                              -1, // asi me trae todos los registros de golpe
                              var_SQLQuery.SQL.Text ) = false then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Hacemos las comprobaciones que nos hagan falta de la SQL que hemos hecho            ** //
        // ***************************************************************************************** //
        // ** Result = 0 aclarara que no existe el registro buscado por su id                     ** //
        // ***************************************************************************************** //
        if var_SQLQuery.RecordCount = 0 then
             Result.id := '0' // No encontremos este registro
        else begin
             with var_SQLQuery do
             begin
                 Result.id                       := FieldByName('id').AsString;
                 Result.id_clientes              := FieldByName('id_clientes').AsString;
                 Result.id_clientes_contactos    := FieldByName('id_clientes_contactos').AsString;
                 Result.Direccion                := FieldByName('Direccion').AsString;
                 Result.Direccion_Numero         := FieldByName('Direccion_Numero').AsString;
                 Result.Direccion_Piso_Letra     := FieldByName('Direccion_Piso_Letra').AsString;
                 Result.Codigo_Postal            := FieldByName('Codigo_Postal').AsString;
                 Result.id_poblaciones           := FieldByName('id_poblaciones').AsString;
                 Result.id_provincias            := FieldByName('id_provincias').AsString;
                 Result.id_paises                := FieldByName('id_paises').AsString;
                 Result.Tfno_Fijo_1              := FieldByName('Tfno_Fijo_1').AsString;
                 Result.Tfno_Fijo_2              := FieldByName('Tfno_Fijo_2').AsString;
                 Result.FAX                      := FieldByName('FAX').AsString;
                 Result.Movil                    := FieldByName('Movil').AsString;
                 Result.eMail                    := FieldByName('eMail').AsString;
                 Result.Portes_Pagados_SN        := FieldByName('Portes_Pagados_SN').AsString;

                 Result.Insert_WHEN              := FieldByName('Insert_WHEN').AsString;
                 Result.Insert_Id_User           := FieldByName('Insert_Id_User').AsString;
                 Result.Del_WHEN                 := FieldByName('Del_WHEN').AsString;
                 Result.Del_Id_User              := FieldByName('Del_Id_User').AsString;
                 Result.Del_WHY                  := FieldByName('Del_WHY').AsString;
                 Result.Change_WHEN              := FieldByName('Change_WHEN').AsString;
                 Result.Change_Id_User           := FieldByName('Change_Id_User').AsString;

                 Result.OT_descripcion_poblacion := FieldByName('OT_descripcion_poblacion').AsString;
                 Result.OT_descripcion_provincia := FieldByName('OT_descripcion_provincia').AsString;
                 Result.OT_descripcion_pais      := FieldByName('OT_descripcion_pais').AsString;
                 Result.OT_descripcion_Contacto  := FieldByName('OT_descripcion_Contacto').AsString;
             end;
        end;

        // ***************************************************************************************** //
        // ** Cerramos la tabla y asi se cierra automaticamente La transacción y conexión con BD  ** //
        // ***************************************************************************************** //
        if UTI_TB_Cerrar( var_SQLConnector,
                          var_SQLTransaction,
                          var_SQLQuery ) = false then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Destruimos la tabla y conexiones                                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery.Free;
        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( 'Ocurrió un error al intentar traer todos los datos de envío' +
                               ' del cliente con la id ' + Trim(param_id) + '. La tabla ha sido ' +
                               var_SQLQuery.Name + ' desde el módulo ' + Screen.ActiveForm.Name,
                               error );
            try
                var_SQLTransaction.Free;
                var_SQLConnector.Free;
                var_SQLQuery.Free;
            except
            end;
        end;
    end;
end;

end.


