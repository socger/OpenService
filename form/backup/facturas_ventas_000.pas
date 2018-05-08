unit facturas_ventas_000;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, DateTimePicker, Forms, Controls, Graphics, Dialogs,
  variants, ExtCtrls, Buttons, StdCtrls, ComCtrls, DBGrids, DbCtrls, Grids, utilidades_bd,
  utilidades_general, utilidades_rgtro, utilidades_usuarios, utilidades_datos_tablas,
  utilidades_lineas_detalle, utilidades_forms_Filtrar, utilidades_empresas, utilidades_ventas,
  utilidades_almacenes, utilidades_contabilidad;

type

  { Tform_facturas_ventas_000 }

  Tform_facturas_ventas_000 = class(TForm)
    BitBtn_Ver_Ftras_Borradas: TBitBtn;
    BitBtn_Filtrar: TBitBtn;
    BitBtn_Imprimir: TBitBtn;
    BitBtn_SALIR: TBitBtn;
    BitBtn_Seleccionar: TBitBtn;
    BitBtn_Copiar: TBitBtn;
    BitBtn_Ver_Situacion_Registro: TBitBtn;
    Boton_Elegir_Empresa: TBitBtn;
    Boton_Elegir_Forma_Pago: TBitBtn;
    Boton_Elegir_id_Almacenes: TBitBtn;
    Boton_Elegir_id_Clientes: TBitBtn;
    Boton_Elegir_Periodo: TBitBtn;
    ComboBox_Filtros: TComboBox;
    DataSource_Alb_Pdtes: TDataSource;
    DataSource_Alb_Pdtes_Detalles: TDataSource;
    DataSource_Ftra: TDataSource;
    DataSource_Ftra_Borradas: TDataSource;
    DataSource_Ftra_Detalles: TDataSource;
    DataSource_Ftra_Impuestos: TDataSource;
    DataSource_Ftra_Detalles_Stock: TDataSource;
    DataSource_Ftra_Rcbos: TDataSource;
    DataSource_Imptos_Totales: TDataSource;
    DataSource_List_Ftras: TDataSource;
    DateTimePicker_Desde: TDateTimePicker;
    DateTimePicker_Hasta: TDateTimePicker;
    DateTimePicker_No_Borrarlo: TDateTimePicker;
    DBGrid_Detalles1: TDBGrid;
    DBGrid_Principal: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBNavigator_Detalles1: TDBNavigator;
    Edit_Descripcion_Empresa: TEdit;
    Edit_Descripcion_Forma_Pago: TEdit;
    Edit_Descripcion_id_Almacenes: TEdit;
    Edit_Descripcion_id_Clientes: TEdit;
    Edit_Factura_Numero: TEdit;
    Edit_Factura_Serie: TEdit;
    Edit_id_Almacenes: TEdit;
    Edit_id_Clientes: TEdit;
    Edit_id_Empresas: TEdit;
    Edit_id_Forma_Pago: TEdit;
    Edit_Registros_Total: TEdit;
    GroupBox4: TGroupBox;
    GroupBox_Serie_Numero: TGroupBox;
    Image_Candado: TImage;
    Image_Cobro_Excluido: TImage;
    Image_Convertida: TImage;
    Image_Ftra_sin_Rcbos: TImage;
    Label102: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label50: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label7: TLabel;
    Label77: TLabel;
    Label8: TLabel;
    Label_Almacen: TLabel;
    Label_Ctdad_Rgtros: TLabel;
    Label_Fecha2: TLabel;
    Label_Fecha3: TLabel;
    ListBox_Comprobador: TListBox;
    Memo_Filtros: TMemo;
    Memo_OrderBy: TMemo;
    PageControl_Filtros: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    RadioButton_Abonos_Solo: TRadioButton;
    RadioButton_Facturas_Solo: TRadioButton;
    RadioButton_Todos: TRadioButton;
    RadioGroup_Bajas: TRadioGroup;
    SQLQuery_Alb_Pdtes: TSQLQuery;
    SQLQuery_Alb_Pdtesagencias_transporte_id_proveedores: TLargeintField;
    SQLQuery_Alb_PdtesChange_Id_User: TLargeintField;
    SQLQuery_Alb_PdtesChange_WHEN: TDateTimeField;
    SQLQuery_Alb_PdtesCodigo_Postal: TStringField;
    SQLQuery_Alb_PdtesComentarios_a_imprimir_en_Albaran: TStringField;
    SQLQuery_Alb_PdtesComision_Representante: TBCDField;
    SQLQuery_Alb_PdtesCONCEPTO_SEPA: TStringField;
    SQLQuery_Alb_PdtesCta_Bco_BIC_SWIFT: TStringField;
    SQLQuery_Alb_PdtesCta_Bco_Codigo_Postal: TStringField;
    SQLQuery_Alb_PdtesCta_Bco_Cuenta: TStringField;
    SQLQuery_Alb_PdtesCta_Bco_Digito_Control: TStringField;
    SQLQuery_Alb_PdtesCta_Bco_Direccion: TStringField;
    SQLQuery_Alb_PdtesCta_Bco_Direccion_Numero: TStringField;
    SQLQuery_Alb_PdtesCta_Bco_Direccion_Piso_Letra: TStringField;
    SQLQuery_Alb_PdtesCta_Bco_Entidad: TStringField;
    SQLQuery_Alb_PdtesCta_Bco_IBAN: TStringField;
    SQLQuery_Alb_PdtesCta_Bco_id_paises: TLargeintField;
    SQLQuery_Alb_PdtesCta_Bco_id_poblaciones: TLargeintField;
    SQLQuery_Alb_PdtesCta_Bco_id_provincias: TLargeintField;
    SQLQuery_Alb_PdtesCta_Bco_Mandato_Fecha_de_Firma: TDateTimeField;
    SQLQuery_Alb_PdtesCta_Bco_Mandato_Ref: TStringField;
    SQLQuery_Alb_PdtesCta_Bco_Sucursal: TStringField;
    SQLQuery_Alb_PdtesDel_Id_User: TLargeintField;
    SQLQuery_Alb_PdtesDel_WHEN: TDateTimeField;
    SQLQuery_Alb_PdtesDel_WHY: TStringField;
    SQLQuery_Alb_PdtesDescuento_Comercial_1: TBCDField;
    SQLQuery_Alb_PdtesDescuento_Comercial_2: TBCDField;
    SQLQuery_Alb_PdtesDescuento_Final: TBCDField;
    SQLQuery_Alb_PdtesDescuento_Pronto_Pago: TBCDField;
    SQLQuery_Alb_PdtesDireccion: TStringField;
    SQLQuery_Alb_PdtesDireccion_Numero: TStringField;
    SQLQuery_Alb_PdtesDireccion_Piso_Letra: TStringField;
    SQLQuery_Alb_PdtesEnvio_Bultos: TLongintField;
    SQLQuery_Alb_PdtesEnvio_Codigo_Postal: TStringField;
    SQLQuery_Alb_PdtesEnvio_Condiciones_Entrega: TStringField;
    SQLQuery_Alb_PdtesEnvio_Con_Quien_Hablar: TStringField;
    SQLQuery_Alb_PdtesEnvio_Direccion: TStringField;
    SQLQuery_Alb_PdtesEnvio_Direccion_Numero: TStringField;
    SQLQuery_Alb_PdtesEnvio_Direccion_Piso_Letra: TStringField;
    SQLQuery_Alb_PdtesEnvio_eMail: TStringField;
    SQLQuery_Alb_PdtesEnvio_FAX: TStringField;
    SQLQuery_Alb_PdtesEnvio_Fecha_Recogida_Prevista: TDateTimeField;
    SQLQuery_Alb_PdtesEnvio_id_paises: TLargeintField;
    SQLQuery_Alb_PdtesEnvio_id_poblaciones: TLargeintField;
    SQLQuery_Alb_PdtesEnvio_id_provincias: TLargeintField;
    SQLQuery_Alb_PdtesEnvio_Movil: TStringField;
    SQLQuery_Alb_PdtesEnvio_Portes: TBCDField;
    SQLQuery_Alb_PdtesEnvio_Portes_Pagados_SN: TStringField;
    SQLQuery_Alb_PdtesEnvio_Tfno_Fijo_1: TStringField;
    SQLQuery_Alb_PdtesEnvio_Tfno_Fijo_2: TStringField;
    SQLQuery_Alb_PdtesFAX: TStringField;
    SQLQuery_Alb_PdtesFecha: TDateTimeField;
    SQLQuery_Alb_PdtesForma_pago_Dia_1: TSmallintField;
    SQLQuery_Alb_PdtesForma_pago_Dia_2: TSmallintField;
    SQLQuery_Alb_PdtesForma_pago_Vacaciones_Dia_Fin: TSmallintField;
    SQLQuery_Alb_PdtesForma_pago_Vacaciones_Dia_Inicio: TSmallintField;
    SQLQuery_Alb_PdtesForma_pago_Vacaciones_Mes_Fin: TSmallintField;
    SQLQuery_Alb_PdtesForma_pago_Vacaciones_Mes_Inicio: TSmallintField;
    SQLQuery_Alb_Pdtesid: TLargeintField;
    SQLQuery_Alb_Pdtesid_almacenes: TLargeintField;
    SQLQuery_Alb_Pdtesid_clientes: TLargeintField;
    SQLQuery_Alb_Pdtesid_empresas: TLargeintField;
    SQLQuery_Alb_Pdtesid_formas_pago: TLargeintField;
    SQLQuery_Alb_Pdtesid_paises: TLargeintField;
    SQLQuery_Alb_Pdtesid_poblaciones: TLargeintField;
    SQLQuery_Alb_Pdtesid_provincias: TLargeintField;
    SQLQuery_Alb_Pdtesid_representantes: TLargeintField;
    SQLQuery_Alb_Pdtesid_tarifas: TLargeintField;
    SQLQuery_Alb_Pdtesid_vehiculos: TLargeintField;
    SQLQuery_Alb_PdtesInsert_Id_User: TLargeintField;
    SQLQuery_Alb_PdtesInsert_WHEN: TDateTimeField;
    SQLQuery_Alb_PdtesIVA_con_Recargo_SN: TStringField;
    SQLQuery_Alb_PdtesIVA_con_Recargo_SN_Representante: TStringField;
    SQLQuery_Alb_PdtesIVA_Excluido_SN: TStringField;
    SQLQuery_Alb_PdtesIVA_Excluido_SN_Representante: TStringField;
    SQLQuery_Alb_PdtesMovil: TStringField;
    SQLQuery_Alb_Pdtesnif_cif: TStringField;
    SQLQuery_Alb_Pdtesnombre_comercial: TStringField;
    SQLQuery_Alb_Pdtesnombre_propietario: TStringField;
    SQLQuery_Alb_PdtesNumero_Albaran: TLargeintField;
    SQLQuery_Alb_PdtesNumero_Factura: TLargeintField;
    SQLQuery_Alb_PdtesNumero_Pedido: TLargeintField;
    SQLQuery_Alb_PdtesNumero_Presupuesto: TLargeintField;
    SQLQuery_Alb_PdtesObservaciones: TStringField;
    SQLQuery_Alb_PdtesOT_Cta_Bco_descripcion_pais: TStringField;
    SQLQuery_Alb_PdtesOT_Cta_Bco_descripcion_poblacion: TStringField;
    SQLQuery_Alb_PdtesOT_Cta_Bco_descripcion_provincia: TStringField;
    SQLQuery_Alb_PdtesOT_descripcion_almacen: TStringField;
    SQLQuery_Alb_PdtesOT_descripcion_cliente: TStringField;
    SQLQuery_Alb_PdtesOT_descripcion_empresa: TStringField;
    SQLQuery_Alb_PdtesOT_descripcion_forma_pago: TStringField;
    SQLQuery_Alb_PdtesOT_descripcion_pais: TStringField;
    SQLQuery_Alb_PdtesOT_descripcion_poblacion: TStringField;
    SQLQuery_Alb_PdtesOT_descripcion_provincia: TStringField;
    SQLQuery_Alb_PdtesOT_descripcion_representante: TStringField;
    SQLQuery_Alb_PdtesOT_descripcion_tarifa: TStringField;
    SQLQuery_Alb_PdtesOT_descripcion_transportista: TStringField;
    SQLQuery_Alb_PdtesOT_el_Albaran: TStringField;
    SQLQuery_Alb_PdtesOT_Envio_descripcion_pais: TStringField;
    SQLQuery_Alb_PdtesOT_Envio_descripcion_poblacion: TStringField;
    SQLQuery_Alb_PdtesOT_Envio_descripcion_provincia: TStringField;
    SQLQuery_Alb_PdtesOT_Movil_representante: TStringField;
    SQLQuery_Alb_PdtesOT_Movil_transportista: TStringField;
    SQLQuery_Alb_PdtesOT_tfno_1_representante: TStringField;
    SQLQuery_Alb_PdtesOT_tfno_1_transportista: TStringField;
    SQLQuery_Alb_PdtesOT_vehiculo_matricula: TStringField;
    SQLQuery_Alb_PdtesRetencion: TBCDField;
    SQLQuery_Alb_PdtesRetencion_Representante: TBCDField;
    SQLQuery_Alb_PdtesRiesgo_Autorizado: TBCDField;
    SQLQuery_Alb_PdtesSerie_Albaran: TStringField;
    SQLQuery_Alb_PdtesSerie_Factura: TStringField;
    SQLQuery_Alb_PdtesSerie_Pedido: TStringField;
    SQLQuery_Alb_PdtesSerie_Presupuesto: TStringField;
    SQLQuery_Alb_PdtesTfno_Fijo_1: TStringField;
    SQLQuery_Alb_PdtesTfno_Fijo_2: TStringField;
    SQLQuery_Alb_PdtesTotal_Lineas: TBCDField;
    SQLQuery_Alb_PdtesTotal_Mano_Obra: TBCDField;
    SQLQuery_Alb_PdtesTotal_Materiales: TBCDField;
    SQLQuery_Alb_PdtesTotal_Resto: TBCDField;
    SQLQuery_Alb_PdtesTotal_Total: TBCDField;
    SQLQuery_Alb_PdtesVencimientos_1_Dias: TSmallintField;
    SQLQuery_Alb_PdtesVencimientos_automaticos_SN: TStringField;
    SQLQuery_Alb_PdtesVencimientos_Cantidad: TSmallintField;
    SQLQuery_Alb_PdtesVencimientos_Dias_Entre: TSmallintField;
    SQLQuery_Alb_Pdtes_Detalles: TSQLQuery;
    SQLQuery_Alb_Pdtes_DetallesChange_Id_User: TLargeintField;
    SQLQuery_Alb_Pdtes_DetallesChange_WHEN: TDateTimeField;
    SQLQuery_Alb_Pdtes_DetallesCodigoBarras_Referencia: TStringField;
    SQLQuery_Alb_Pdtes_DetallesComision_Representante: TBCDField;
    SQLQuery_Alb_Pdtes_DetallesDel_Id_User: TLargeintField;
    SQLQuery_Alb_Pdtes_DetallesDel_WHEN: TDateTimeField;
    SQLQuery_Alb_Pdtes_DetallesDel_WHY: TStringField;
    SQLQuery_Alb_Pdtes_Detallesdescripcion: TStringField;
    SQLQuery_Alb_Pdtes_Detallesdescripcion_para_TPV: TStringField;
    SQLQuery_Alb_Pdtes_DetallesDescuento_Comercial_1: TBCDField;
    SQLQuery_Alb_Pdtes_DetallesDescuento_Comercial_2: TBCDField;
    SQLQuery_Alb_Pdtes_DetallesExcluido_su_Cobro_SN: TStringField;
    SQLQuery_Alb_Pdtes_DetallesFecha_Movimiento: TDateTimeField;
    SQLQuery_Alb_Pdtes_Detallesid_albaranes: TLargeintField;
    SQLQuery_Alb_Pdtes_Detallesid_almacenes: TLargeintField;
    SQLQuery_Alb_Pdtes_Detallesid_articulos: TLargeintField;
    SQLQuery_Alb_Pdtes_Detallesid_clientes: TLargeintField;
    SQLQuery_Alb_Pdtes_Detallesid_impuestos_Ventas: TLargeintField;
    SQLQuery_Alb_Pdtes_DetallesInsert_Id_User: TLargeintField;
    SQLQuery_Alb_Pdtes_DetallesInsert_WHEN: TDateTimeField;
    SQLQuery_Alb_Pdtes_DetallesNumero_Factura: TLargeintField;
    SQLQuery_Alb_Pdtes_DetallesOT_Cliente_nombre_comercial: TStringField;
    SQLQuery_Alb_Pdtes_DetallesOT_Cliente_nombre_propietario: TStringField;
    SQLQuery_Alb_Pdtes_DetallesOT_descripcion_almacen: TStringField;
    SQLQuery_Alb_Pdtes_DetallesOT_descripcion_articulo: TStringField;
    SQLQuery_Alb_Pdtes_DetallesOT_descripcion_impuesto: TStringField;
    SQLQuery_Alb_Pdtes_DetallesOT_Descripcion_para_DbGrid1: TStringField;
    SQLQuery_Alb_Pdtes_DetallesOT_id_almacenes_Cabecera: TLargeintField;
    SQLQuery_Alb_Pdtes_DetallesOT_id_vehiculos_Cabecera: TLargeintField;
    SQLQuery_Alb_Pdtes_DetallesOT_Numero_Albaran: TLargeintField;
    SQLQuery_Alb_Pdtes_DetallesOT_Serie_Albaran: TStringField;
    SQLQuery_Alb_Pdtes_DetallesOT_Sumado_A_Ftra_SN: TStringField;
    SQLQuery_Alb_Pdtes_DetallesOT_Tanto_Por_Ciento: TBCDField;
    SQLQuery_Alb_Pdtes_DetallesOT_Tipo_de_articulo: TStringField;
    SQLQuery_Alb_Pdtes_DetallesOT_Total_Dto_1_1: TFloatField;
    SQLQuery_Alb_Pdtes_DetallesOT_Total_Dto_2_1: TFloatField;
    SQLQuery_Alb_Pdtes_DetallesOT_Total_Linea_con_Dtos1: TFloatField;
    SQLQuery_Alb_Pdtes_DetallesOT_Total_Linea_sin_Dtos1: TFloatField;
    SQLQuery_Alb_Pdtes_DetallesPVP: TBCDField;
    SQLQuery_Alb_Pdtes_DetallesRepetir_Cada: TLongintField;
    SQLQuery_Alb_Pdtes_DetallesSerie_Factura: TStringField;
    SQLQuery_Alb_Pdtes_DetallesUnidades: TBCDField;
    SQLQuery_Clientesid2: TLargeintField;
    SQLQuery_Clientesid3: TLargeintField;
    SQLQuery_Ftra_RcbosChange_Id_User: TLargeintField;
    SQLQuery_Ftra_RcbosChange_WHEN: TDateTimeField;
    SQLQuery_Ftra_RcbosCONCEPTO_SEPA: TStringField;
    SQLQuery_Ftra_RcbosDel_Id_User: TLargeintField;
    SQLQuery_Ftra_RcbosDel_WHEN: TDateTimeField;
    SQLQuery_Ftra_RcbosDel_WHY: TStringField;
    SQLQuery_Ftra_Rcbosfecha_cobro_realizado: TDateTimeField;
    SQLQuery_Ftra_Rcbosfecha_expedicion: TDateTimeField;
    SQLQuery_Ftra_Rcbosfecha_vencimiento: TDateTimeField;
    SQLQuery_Ftra_Rcbosid: TLargeintField;
    SQLQuery_Ftra: TSQLQuery;
    SQLQuery_Ftraid2: TLargeintField;
    SQLQuery_FtraOT_la_Factura2: TStringField;
    SQLQuery_FtraTotal_Total: TBCDField;
    SQLQuery_FtraVencimientos_1_Dias: TSmallintField;
    SQLQuery_Ftra_Borradas: TSQLQuery;
    SQLQuery_Ftraagencias_transporte_id_proveedores: TLargeintField;
    SQLQuery_FtraChange_Id_User: TLargeintField;
    SQLQuery_FtraChange_WHEN: TDateTimeField;
    SQLQuery_FtraCodigo_Postal: TStringField;
    SQLQuery_FtraComentarios_a_imprimir_en_Albaran: TStringField;
    SQLQuery_FtraComision_Representante: TBCDField;
    SQLQuery_FtraCONCEPTO_SEPA: TStringField;
    SQLQuery_FtraCta_Bco_BIC_SWIFT: TStringField;
    SQLQuery_FtraCta_Bco_Codigo_Postal: TStringField;
    SQLQuery_FtraCta_Bco_Cuenta: TStringField;
    SQLQuery_FtraCta_Bco_Digito_Control: TStringField;
    SQLQuery_FtraCta_Bco_Direccion: TStringField;
    SQLQuery_FtraCta_Bco_Direccion_Numero: TStringField;
    SQLQuery_FtraCta_Bco_Direccion_Piso_Letra: TStringField;
    SQLQuery_FtraCta_Bco_Entidad: TStringField;
    SQLQuery_FtraCta_Bco_IBAN: TStringField;
    SQLQuery_FtraCta_Bco_id_paises: TLargeintField;
    SQLQuery_FtraCta_Bco_id_poblaciones: TLargeintField;
    SQLQuery_FtraCta_Bco_id_provincias: TLargeintField;
    SQLQuery_FtraCta_Bco_Mandato_Fecha_de_Firma: TDateTimeField;
    SQLQuery_FtraCta_Bco_Mandato_Ref: TStringField;
    SQLQuery_FtraCta_Bco_Sucursal: TStringField;
    SQLQuery_FtraDel_Id_User: TLargeintField;
    SQLQuery_FtraDel_WHEN: TDateTimeField;
    SQLQuery_FtraDel_WHY: TStringField;
    SQLQuery_FtraDescuento_Comercial_1: TBCDField;
    SQLQuery_FtraDescuento_Comercial_2: TBCDField;
    SQLQuery_FtraDescuento_Final: TBCDField;
    SQLQuery_FtraDescuento_Pronto_Pago: TBCDField;
    SQLQuery_FtraDireccion: TStringField;
    SQLQuery_FtraDireccion_Numero: TStringField;
    SQLQuery_FtraDireccion_Piso_Letra: TStringField;
    SQLQuery_FtraEnvio_Bultos: TLongintField;
    SQLQuery_FtraEnvio_Codigo_Postal: TStringField;
    SQLQuery_FtraEnvio_Condiciones_Entrega: TStringField;
    SQLQuery_FtraEnvio_Con_Quien_Hablar: TStringField;
    SQLQuery_FtraEnvio_Direccion: TStringField;
    SQLQuery_FtraEnvio_Direccion_Numero: TStringField;
    SQLQuery_FtraEnvio_Direccion_Piso_Letra: TStringField;
    SQLQuery_FtraEnvio_eMail: TStringField;
    SQLQuery_FtraEnvio_FAX: TStringField;
    SQLQuery_FtraEnvio_Fecha_Recogida_Prevista: TDateTimeField;
    SQLQuery_FtraEnvio_id_paises: TLargeintField;
    SQLQuery_FtraEnvio_id_poblaciones: TLargeintField;
    SQLQuery_FtraEnvio_id_provincias: TLargeintField;
    SQLQuery_FtraEnvio_Movil: TStringField;
    SQLQuery_FtraEnvio_Portes: TBCDField;
    SQLQuery_FtraEnvio_Portes_Pagados_SN: TStringField;
    SQLQuery_FtraEnvio_Tfno_Fijo_1: TStringField;
    SQLQuery_FtraEnvio_Tfno_Fijo_2: TStringField;
    SQLQuery_FtraFAX: TStringField;
    SQLQuery_FtraFecha: TDateTimeField;
    SQLQuery_FtraForma_pago_Dia_1: TSmallintField;
    SQLQuery_FtraForma_pago_Dia_2: TSmallintField;
    SQLQuery_FtraForma_pago_Vacaciones_Dia_Fin: TSmallintField;
    SQLQuery_FtraForma_pago_Vacaciones_Dia_Inicio: TSmallintField;
    SQLQuery_FtraForma_pago_Vacaciones_Mes_Fin: TSmallintField;
    SQLQuery_FtraForma_pago_Vacaciones_Mes_Inicio: TSmallintField;
    SQLQuery_Ftraid: TLargeintField;
    SQLQuery_Ftraid1: TLargeintField;
    SQLQuery_Ftraid_almacenes: TLargeintField;
    SQLQuery_Ftraid_clientes: TLargeintField;
    SQLQuery_Ftraid_empresas: TLargeintField;
    SQLQuery_Ftraid_formas_pago: TLargeintField;
    SQLQuery_Ftraid_paises: TLargeintField;
    SQLQuery_Ftraid_poblaciones: TLargeintField;
    SQLQuery_Ftraid_provincias: TLargeintField;
    SQLQuery_Ftraid_representantes: TLargeintField;
    SQLQuery_Ftraid_tarifas: TLargeintField;
    SQLQuery_FtraInsert_Id_User: TLargeintField;
    SQLQuery_FtraInsert_WHEN: TDateTimeField;
    SQLQuery_FtraIVA_con_Recargo_SN: TStringField;
    SQLQuery_FtraIVA_con_Recargo_SN_Representante: TStringField;
    SQLQuery_FtraIVA_Excluido_SN: TStringField;
    SQLQuery_FtraIVA_Excluido_SN_Representante: TStringField;
    SQLQuery_FtraMovil: TStringField;
    SQLQuery_Ftranif_cif: TStringField;
    SQLQuery_Ftranombre_comercial: TStringField;
    SQLQuery_Ftranombre_propietario: TStringField;
    SQLQuery_FtraNumero_Factura: TLargeintField;
    SQLQuery_FtraObservaciones: TStringField;
    SQLQuery_FtraOT_Cta_Bco_descripcion_pais: TStringField;
    SQLQuery_FtraOT_Cta_Bco_descripcion_poblacion: TStringField;
    SQLQuery_FtraOT_Cta_Bco_descripcion_provincia: TStringField;
    SQLQuery_FtraOT_descripcion_almacen: TStringField;
    SQLQuery_FtraOT_descripcion_cliente: TStringField;
    SQLQuery_FtraOT_descripcion_empresa: TStringField;
    SQLQuery_FtraOT_descripcion_forma_pago: TStringField;
    SQLQuery_FtraOT_descripcion_pais: TStringField;
    SQLQuery_FtraOT_descripcion_poblacion: TStringField;
    SQLQuery_FtraOT_descripcion_provincia: TStringField;
    SQLQuery_FtraOT_descripcion_representante: TStringField;
    SQLQuery_FtraOT_descripcion_tarifa: TStringField;
    SQLQuery_FtraOT_descripcion_transportista: TStringField;
    SQLQuery_FtraOT_Envio_descripcion_pais: TStringField;
    SQLQuery_FtraOT_Envio_descripcion_poblacion: TStringField;
    SQLQuery_FtraOT_Envio_descripcion_provincia: TStringField;
    SQLQuery_FtraOT_la_Factura: TStringField;
    SQLQuery_FtraOT_la_Factura1: TStringField;
    SQLQuery_FtraOT_Movil_representante: TStringField;
    SQLQuery_FtraOT_Movil_transportista: TStringField;
    SQLQuery_FtraOT_tfno_1_representante: TStringField;
    SQLQuery_FtraOT_tfno_1_transportista: TStringField;
    SQLQuery_FtraRetencion: TBCDField;
    SQLQuery_FtraRetencion_Representante: TBCDField;
    SQLQuery_FtraRiesgo_Autorizado: TBCDField;
    SQLQuery_FtraSerie_Factura: TStringField;
    SQLQuery_FtraTfno_Fijo_1: TStringField;
    SQLQuery_FtraTfno_Fijo_2: TStringField;
    SQLQuery_FtraTipo: TStringField;
    SQLQuery_FtraTotal_Lineas: TBCDField;
    SQLQuery_FtraTotal_Mano_Obra: TBCDField;
    SQLQuery_FtraTotal_Materiales: TBCDField;
    SQLQuery_FtraTotal_Resto: TBCDField;
    SQLQuery_FtraVencimientos_automaticos_SN: TStringField;
    SQLQuery_FtraVencimientos_Cantidad: TSmallintField;
    SQLQuery_FtraVencimientos_Dias_Entre: TSmallintField;
    SQLQuery_Ftra_Borradasagencias_transporte_id_proveedores: TLargeintField;
    SQLQuery_Ftra_BorradasChange_Id_User: TLargeintField;
    SQLQuery_Ftra_BorradasChange_WHEN: TDateTimeField;
    SQLQuery_Ftra_BorradasCodigo_Postal: TStringField;
    SQLQuery_Ftra_BorradasComentarios_a_imprimir_en_Albaran: TStringField;
    SQLQuery_Ftra_BorradasComision_Representante: TBCDField;
    SQLQuery_Ftra_BorradasCONCEPTO_SEPA: TStringField;
    SQLQuery_Ftra_BorradasCta_Bco_BIC_SWIFT: TStringField;
    SQLQuery_Ftra_BorradasCta_Bco_Codigo_Postal: TStringField;
    SQLQuery_Ftra_BorradasCta_Bco_Cuenta: TStringField;
    SQLQuery_Ftra_BorradasCta_Bco_Digito_Control: TStringField;
    SQLQuery_Ftra_BorradasCta_Bco_Direccion: TStringField;
    SQLQuery_Ftra_BorradasCta_Bco_Direccion_Numero: TStringField;
    SQLQuery_Ftra_BorradasCta_Bco_Direccion_Piso_Letra: TStringField;
    SQLQuery_Ftra_BorradasCta_Bco_Entidad: TStringField;
    SQLQuery_Ftra_BorradasCta_Bco_IBAN: TStringField;
    SQLQuery_Ftra_BorradasCta_Bco_id_paises: TLargeintField;
    SQLQuery_Ftra_BorradasCta_Bco_id_poblaciones: TLargeintField;
    SQLQuery_Ftra_BorradasCta_Bco_id_provincias: TLargeintField;
    SQLQuery_Ftra_BorradasCta_Bco_Mandato_Fecha_de_Firma: TDateTimeField;
    SQLQuery_Ftra_BorradasCta_Bco_Mandato_Ref: TStringField;
    SQLQuery_Ftra_BorradasCta_Bco_Sucursal: TStringField;
    SQLQuery_Ftra_BorradasDel_Id_User: TLargeintField;
    SQLQuery_Ftra_BorradasDel_WHEN: TDateTimeField;
    SQLQuery_Ftra_BorradasDel_WHY: TStringField;
    SQLQuery_Ftra_BorradasDescuento_Comercial_1: TBCDField;
    SQLQuery_Ftra_BorradasDescuento_Comercial_2: TBCDField;
    SQLQuery_Ftra_BorradasDescuento_Final: TBCDField;
    SQLQuery_Ftra_BorradasDescuento_Pronto_Pago: TBCDField;
    SQLQuery_Ftra_BorradasDireccion: TStringField;
    SQLQuery_Ftra_BorradasDireccion_Numero: TStringField;
    SQLQuery_Ftra_BorradasDireccion_Piso_Letra: TStringField;
    SQLQuery_Ftra_BorradasEnvio_Bultos: TLongintField;
    SQLQuery_Ftra_BorradasEnvio_Codigo_Postal: TStringField;
    SQLQuery_Ftra_BorradasEnvio_Condiciones_Entrega: TStringField;
    SQLQuery_Ftra_BorradasEnvio_Con_Quien_Hablar: TStringField;
    SQLQuery_Ftra_BorradasEnvio_Direccion: TStringField;
    SQLQuery_Ftra_BorradasEnvio_Direccion_Numero: TStringField;
    SQLQuery_Ftra_BorradasEnvio_Direccion_Piso_Letra: TStringField;
    SQLQuery_Ftra_BorradasEnvio_eMail: TStringField;
    SQLQuery_Ftra_BorradasEnvio_FAX: TStringField;
    SQLQuery_Ftra_BorradasEnvio_Fecha_Recogida_Prevista: TDateTimeField;
    SQLQuery_Ftra_BorradasEnvio_id_paises: TLargeintField;
    SQLQuery_Ftra_BorradasEnvio_id_poblaciones: TLargeintField;
    SQLQuery_Ftra_BorradasEnvio_id_provincias: TLargeintField;
    SQLQuery_Ftra_BorradasEnvio_Movil: TStringField;
    SQLQuery_Ftra_BorradasEnvio_Portes: TBCDField;
    SQLQuery_Ftra_BorradasEnvio_Portes_Pagados_SN: TStringField;
    SQLQuery_Ftra_BorradasEnvio_Tfno_Fijo_1: TStringField;
    SQLQuery_Ftra_BorradasEnvio_Tfno_Fijo_2: TStringField;
    SQLQuery_Ftra_BorradasFAX: TStringField;
    SQLQuery_Ftra_BorradasFecha: TDateTimeField;
    SQLQuery_Ftra_BorradasForma_pago_Dia_1: TSmallintField;
    SQLQuery_Ftra_BorradasForma_pago_Dia_2: TSmallintField;
    SQLQuery_Ftra_BorradasForma_pago_Vacaciones_Dia_Fin: TSmallintField;
    SQLQuery_Ftra_BorradasForma_pago_Vacaciones_Dia_Inicio: TSmallintField;
    SQLQuery_Ftra_BorradasForma_pago_Vacaciones_Mes_Fin: TSmallintField;
    SQLQuery_Ftra_BorradasForma_pago_Vacaciones_Mes_Inicio: TSmallintField;
    SQLQuery_Ftra_Borradasid_almacenes: TLargeintField;
    SQLQuery_Ftra_Borradasid_clientes: TLargeintField;
    SQLQuery_Ftra_Borradasid_empresas: TLargeintField;
    SQLQuery_Ftra_Borradasid_formas_pago: TLargeintField;
    SQLQuery_Ftra_Borradasid_paises: TLargeintField;
    SQLQuery_Ftra_Borradasid_poblaciones: TLargeintField;
    SQLQuery_Ftra_Borradasid_provincias: TLargeintField;
    SQLQuery_Ftra_Borradasid_representantes: TLargeintField;
    SQLQuery_Ftra_Borradasid_tarifas: TLargeintField;
    SQLQuery_Ftra_BorradasInsert_Id_User: TLargeintField;
    SQLQuery_Ftra_BorradasInsert_WHEN: TDateTimeField;
    SQLQuery_Ftra_BorradasIVA_con_Recargo_SN: TStringField;
    SQLQuery_Ftra_BorradasIVA_con_Recargo_SN_Representante: TStringField;
    SQLQuery_Ftra_BorradasIVA_Excluido_SN: TStringField;
    SQLQuery_Ftra_BorradasIVA_Excluido_SN_Representante: TStringField;
    SQLQuery_Ftra_BorradasMovil: TStringField;
    SQLQuery_Ftra_Borradasnif_cif: TStringField;
    SQLQuery_Ftra_Borradasnombre_comercial: TStringField;
    SQLQuery_Ftra_Borradasnombre_propietario: TStringField;
    SQLQuery_Ftra_BorradasNumero_Factura: TLargeintField;
    SQLQuery_Ftra_BorradasObservaciones: TStringField;
    SQLQuery_Ftra_BorradasOT_descripcion_cliente: TStringField;
    SQLQuery_Ftra_BorradasRetencion: TBCDField;
    SQLQuery_Ftra_BorradasRetencion_Representante: TBCDField;
    SQLQuery_Ftra_BorradasRiesgo_Autorizado: TBCDField;
    SQLQuery_Ftra_BorradasSerie_Factura: TStringField;
    SQLQuery_Ftra_BorradasTfno_Fijo_1: TStringField;
    SQLQuery_Ftra_BorradasTfno_Fijo_2: TStringField;
    SQLQuery_Ftra_BorradasTipo: TStringField;
    SQLQuery_Ftra_BorradasTotal_Lineas: TBCDField;
    SQLQuery_Ftra_BorradasTotal_Mano_Obra: TBCDField;
    SQLQuery_Ftra_BorradasTotal_Materiales: TBCDField;
    SQLQuery_Ftra_BorradasTotal_Resto: TBCDField;
    SQLQuery_Ftra_BorradasTotal_Total: TBCDField;
    SQLQuery_Ftra_BorradasVencimientos_1_Dias: TSmallintField;
    SQLQuery_Ftra_BorradasVencimientos_automaticos_SN: TStringField;
    SQLQuery_Ftra_BorradasVencimientos_Cantidad: TSmallintField;
    SQLQuery_Ftra_BorradasVencimientos_Dias_Entre: TSmallintField;
    SQLQuery_Ftra_Detalles: TSQLQuery;
    SQLQuery_Ftra_DetallesCodigoBarras_Referencia: TStringField;
    SQLQuery_Ftra_DetallesOT_Cliente_nombre_comercial: TStringField;
    SQLQuery_Ftra_DetallesOT_Cliente_nombre_propietario: TStringField;
    SQLQuery_Ftra_DetallesOT_Descripcion_para_DbGrid1: TStringField;
    SQLQuery_Ftra_DetallesOT_id_almacenes_Cabecera: TLargeintField;
    SQLQuery_Ftra_DetallesOT_Numero_Factura: TLargeintField;
    SQLQuery_Ftra_DetallesOT_Serie_Factura: TStringField;
    SQLQuery_Ftra_DetallesOT_Sumado_A_Ftra_SN: TStringField;
    SQLQuery_Ftra_DetallesOT_Tanto_Por_Ciento: TBCDField;
    SQLQuery_Ftra_DetallesOT_Total_Dto_1_1: TFloatField;
    SQLQuery_Ftra_DetallesOT_Total_Dto_2_1: TFloatField;
    SQLQuery_Ftra_DetallesOT_Total_Linea_con_Dtos1: TFloatField;
    SQLQuery_Ftra_DetallesOT_Total_Linea_sin_Dtos1: TFloatField;
    SQLQuery_Ftra_Impuestos: TSQLQuery;
    SQLQuery_Ftra_DetallesChange_Id_User: TLargeintField;
    SQLQuery_Ftra_DetallesChange_WHEN: TDateTimeField;
    SQLQuery_Ftra_DetallesComision_Representante: TBCDField;
    SQLQuery_Ftra_DetallesDel_Id_User: TLargeintField;
    SQLQuery_Ftra_DetallesDel_WHEN: TDateTimeField;
    SQLQuery_Ftra_DetallesDel_WHY: TStringField;
    SQLQuery_Ftra_Detallesdescripcion: TStringField;
    SQLQuery_Ftra_Detallesdescripcion_para_TPV: TStringField;
    SQLQuery_Ftra_DetallesDescuento_Comercial_1: TBCDField;
    SQLQuery_Ftra_DetallesDescuento_Comercial_2: TBCDField;
    SQLQuery_Ftra_DetallesExcluido_su_Cobro_SN: TStringField;
    SQLQuery_Ftra_DetallesFecha_Movimiento: TDateTimeField;
    SQLQuery_Ftra_Detallesid_almacenes: TLargeintField;
    SQLQuery_Ftra_Detallesid_articulos: TLargeintField;
    SQLQuery_Ftra_Detallesid_clientes: TLargeintField;
    SQLQuery_Ftra_Detallesid_facturas: TLargeintField;
    SQLQuery_Ftra_Detallesid_impuestos_Ventas: TLargeintField;
    SQLQuery_Ftra_DetallesInsert_Id_User: TLargeintField;
    SQLQuery_Ftra_DetallesInsert_WHEN: TDateTimeField;
    SQLQuery_Ftra_DetallesNumero_Albaran: TLargeintField;
    SQLQuery_Ftra_DetallesOT_descripcion_almacen: TStringField;
    SQLQuery_Ftra_DetallesOT_descripcion_articulo: TStringField;
    SQLQuery_Ftra_DetallesOT_descripcion_impuesto: TStringField;
    SQLQuery_Ftra_DetallesOT_Tipo_de_articulo: TStringField;
    SQLQuery_Ftra_DetallesPVP: TBCDField;
    SQLQuery_Ftra_DetallesRepetir_Cada: TLongintField;
    SQLQuery_Ftra_DetallesSerie_Albaran: TStringField;
    SQLQuery_Ftra_DetallesUnidades: TBCDField;
    SQLQuery_Ftra_Detalles_Stock: TSQLQuery;
    SQLQuery_Clientesid1: TLargeintField;
    SQLQuery_Ftra_Detalles_Stockid_almacenes: TLargeintField;
    SQLQuery_Ftra_Detalles_Stockid_articulos: TLargeintField;
    SQLQuery_Ftra_Detalles_StockOT_descripcion_almacen: TStringField;
    SQLQuery_Ftra_Detalles_StockOT_descripcion_articulo: TStringField;
    SQLQuery_Ftra_Detalles_StockOT_Stock_Resultado1: TFloatField;
    SQLQuery_Ftra_Detalles_StockStock: TBCDField;
    SQLQuery_Ftra_Detalles_Stockunidades: TFMTBCDField;
    SQLQuery_Ftra_Rcbos: TSQLQuery;
    SQLQuery_Ftra_ImpuestosBase: TBCDField;
    SQLQuery_Ftra_ImpuestosChange_Id_User: TLargeintField;
    SQLQuery_Ftra_ImpuestosChange_WHEN: TDateTimeField;
    SQLQuery_Ftra_ImpuestosDel_Id_User: TLargeintField;
    SQLQuery_Ftra_ImpuestosDel_WHEN: TDateTimeField;
    SQLQuery_Ftra_ImpuestosDel_WHY: TStringField;
    SQLQuery_Ftra_Impuestosid_facturas: TLargeintField;
    SQLQuery_Ftra_Impuestosid_impuestos: TLargeintField;
    SQLQuery_Ftra_ImpuestosImporte: TBCDField;
    SQLQuery_Ftra_ImpuestosInsert_Id_User: TLargeintField;
    SQLQuery_Ftra_ImpuestosInsert_WHEN: TDateTimeField;
    SQLQuery_Ftra_ImpuestosOT_descripcion_impuesto: TStringField;
    SQLQuery_Ftra_ImpuestosOT_Tanto_Por_Ciento: TBCDField;
    SQLQuery_Ftra_Rcbosid_clientes: TLargeintField;
    SQLQuery_Ftra_Rcbosid_facturas: TLargeintField;
    SQLQuery_Ftra_Rcbosid_proveedores: TLargeintField;
    SQLQuery_Ftra_Rcbosid_remesas: TLargeintField;
    SQLQuery_Ftra_Rcbosimporte: TBCDField;
    SQLQuery_Ftra_RcbosInsert_Id_User: TLargeintField;
    SQLQuery_Ftra_RcbosInsert_WHEN: TDateTimeField;
    SQLQuery_Ftra_RcbosObservaciones: TStringField;
    SQLQuery_Ftra_RcbosOT_cliente_nombre_ficha: TStringField;
    SQLQuery_Ftra_RcbosOT_factura_CONCEPTO_SEPA: TStringField;
    SQLQuery_Ftra_RcbosOT_factura_Cta_Bco_BIC_SWIFT: TStringField;
    SQLQuery_Ftra_RcbosOT_factura_Cta_Bco_Codigo_Postal: TStringField;
    SQLQuery_Ftra_RcbosOT_factura_Cta_Bco_Cuenta: TStringField;
    SQLQuery_Ftra_RcbosOT_factura_Cta_Bco_Digito_Control: TStringField;
    SQLQuery_Ftra_RcbosOT_factura_Cta_Bco_Direccion: TStringField;
    SQLQuery_Ftra_RcbosOT_factura_Cta_Bco_Direccion_Numero: TStringField;
    SQLQuery_Ftra_RcbosOT_factura_Cta_Bco_Direccion_Piso_Letra: TStringField;
    SQLQuery_Ftra_RcbosOT_factura_Cta_Bco_Entidad: TStringField;
    SQLQuery_Ftra_RcbosOT_factura_Cta_Bco_IBAN: TStringField;

      SQLQuery_Ftra_RcbosOT_factura_Cta_Bco_Mandato_Fecha_de_Firma: TDateTimeField;
      SQLQuery_Ftra_RcbosOT_factura_Cta_Bco_Mandato_Ref: TStringField;
    SQLQuery_Ftra_RcbosOT_factura_Cta_Bco_Sucursal: TStringField;
    SQLQuery_Ftra_RcbosOT_factura_nif_cif: TStringField;
    SQLQuery_Ftra_RcbosOT_factura_nombre_propietario: TStringField;
    SQLQuery_Ftra_RcbosOT_proveedor_nombre_ficha: TStringField;
    SQLQuery_Imptos_Totales: TSQLQuery;
    SQLQuery_Imptos_Totalesid_impuestos: TLargeintField;
    SQLQuery_Imptos_TotalesOT_Descripcion_impto: TStringField;
    SQLQuery_Imptos_TotalesTotal_Base: TFMTBCDField;
    SQLQuery_Imptos_TotalesTotal_Cuota: TFMTBCDField;
    SQLQuery_List_Ftras: TSQLQuery;
    SQLQuery_List_Ftrasagencias_transporte_id_proveedores: TLargeintField;
    SQLQuery_List_FtrasBase: TBCDField;
    SQLQuery_List_FtrasChange_Id_User: TLargeintField;
    SQLQuery_List_FtrasChange_Id_User_1: TLargeintField;
    SQLQuery_List_FtrasChange_WHEN: TDateTimeField;
    SQLQuery_List_FtrasChange_WHEN_1: TDateTimeField;
    SQLQuery_List_FtrasCodigo_Postal: TStringField;
    SQLQuery_List_FtrasComentarios_a_imprimir_en_Albaran: TStringField;
    SQLQuery_List_FtrasComision_Representante: TBCDField;
    SQLQuery_List_FtrasCONCEPTO_SEPA: TStringField;
    SQLQuery_List_FtrasCta_Bco_BIC_SWIFT: TStringField;
    SQLQuery_List_FtrasCta_Bco_Codigo_Postal: TStringField;
    SQLQuery_List_FtrasCta_Bco_Cuenta: TStringField;
    SQLQuery_List_FtrasCta_Bco_Digito_Control: TStringField;
    SQLQuery_List_FtrasCta_Bco_Direccion: TStringField;
    SQLQuery_List_FtrasCta_Bco_Direccion_Numero: TStringField;
    SQLQuery_List_FtrasCta_Bco_Direccion_Piso_Letra: TStringField;
    SQLQuery_List_FtrasCta_Bco_Entidad: TStringField;
    SQLQuery_List_FtrasCta_Bco_IBAN: TStringField;
    SQLQuery_List_FtrasCta_Bco_id_paises: TLargeintField;
    SQLQuery_List_FtrasCta_Bco_id_poblaciones: TLargeintField;
    SQLQuery_List_FtrasCta_Bco_id_provincias: TLargeintField;
    SQLQuery_List_FtrasCta_Bco_Mandato_Fecha_de_Firma: TDateTimeField;
    SQLQuery_List_FtrasCta_Bco_Mandato_Ref: TStringField;
    SQLQuery_List_FtrasCta_Bco_Sucursal: TStringField;
    SQLQuery_List_FtrasDel_Id_User: TLargeintField;
    SQLQuery_List_FtrasDel_Id_User_1: TLargeintField;
    SQLQuery_List_FtrasDel_WHEN: TDateTimeField;
    SQLQuery_List_FtrasDel_WHEN_1: TDateTimeField;
    SQLQuery_List_FtrasDel_WHY: TStringField;
    SQLQuery_List_FtrasDel_WHY_1: TStringField;
    SQLQuery_List_FtrasDescuento_Comercial_1: TBCDField;
    SQLQuery_List_FtrasDescuento_Comercial_2: TBCDField;
    SQLQuery_List_FtrasDescuento_Final: TBCDField;
    SQLQuery_List_FtrasDescuento_Pronto_Pago: TBCDField;
    SQLQuery_List_FtrasDireccion: TStringField;
    SQLQuery_List_FtrasDireccion_Numero: TStringField;
    SQLQuery_List_FtrasDireccion_Piso_Letra: TStringField;
    SQLQuery_List_FtrasEnvio_Bultos: TLongintField;
    SQLQuery_List_FtrasEnvio_Codigo_Postal: TStringField;
    SQLQuery_List_FtrasEnvio_Condiciones_Entrega: TStringField;
    SQLQuery_List_FtrasEnvio_Con_Quien_Hablar: TStringField;
    SQLQuery_List_FtrasEnvio_Direccion: TStringField;
    SQLQuery_List_FtrasEnvio_Direccion_Numero: TStringField;
    SQLQuery_List_FtrasEnvio_Direccion_Piso_Letra: TStringField;
    SQLQuery_List_FtrasEnvio_eMail: TStringField;
    SQLQuery_List_FtrasEnvio_FAX: TStringField;
    SQLQuery_List_FtrasEnvio_Fecha_Recogida_Prevista: TDateTimeField;
    SQLQuery_List_FtrasEnvio_id_paises: TLargeintField;
    SQLQuery_List_FtrasEnvio_id_poblaciones: TLargeintField;
    SQLQuery_List_FtrasEnvio_id_provincias: TLargeintField;
    SQLQuery_List_FtrasEnvio_Movil: TStringField;
    SQLQuery_List_FtrasEnvio_Portes: TBCDField;
    SQLQuery_List_FtrasEnvio_Portes_Pagados_SN: TStringField;
    SQLQuery_List_FtrasEnvio_Tfno_Fijo_1: TStringField;
    SQLQuery_List_FtrasEnvio_Tfno_Fijo_2: TStringField;
    SQLQuery_List_FtrasFAX: TStringField;
    SQLQuery_List_FtrasFecha: TDateTimeField;
    SQLQuery_List_FtrasForma_pago_Dia_1: TSmallintField;
    SQLQuery_List_FtrasForma_pago_Dia_2: TSmallintField;
    SQLQuery_List_FtrasForma_pago_Vacaciones_Dia_Fin: TSmallintField;
    SQLQuery_List_FtrasForma_pago_Vacaciones_Dia_Inicio: TSmallintField;
    SQLQuery_List_FtrasForma_pago_Vacaciones_Mes_Fin: TSmallintField;
    SQLQuery_List_FtrasForma_pago_Vacaciones_Mes_Inicio: TSmallintField;
    SQLQuery_List_Ftrasid_1: TLargeintField;
    SQLQuery_List_Ftrasid_almacenes: TLargeintField;
    SQLQuery_List_Ftrasid_clientes: TLargeintField;
    SQLQuery_List_Ftrasid_empresas: TLargeintField;
    SQLQuery_List_Ftrasid_facturas: TLargeintField;
    SQLQuery_List_Ftrasid_formas_pago: TLargeintField;
    SQLQuery_List_Ftrasid_impuestos: TLargeintField;
    SQLQuery_List_Ftrasid_paises: TLargeintField;
    SQLQuery_List_Ftrasid_poblaciones: TLargeintField;
    SQLQuery_List_Ftrasid_provincias: TLargeintField;
    SQLQuery_List_Ftrasid_representantes: TLargeintField;
    SQLQuery_List_Ftrasid_tarifas: TLargeintField;
    SQLQuery_List_FtrasImporte: TBCDField;
    SQLQuery_List_FtrasInsert_Id_User: TLargeintField;
    SQLQuery_List_FtrasInsert_Id_User_1: TLargeintField;
    SQLQuery_List_FtrasInsert_WHEN: TDateTimeField;
    SQLQuery_List_FtrasInsert_WHEN_1: TDateTimeField;
    SQLQuery_List_FtrasIVA_con_Recargo_SN: TStringField;
    SQLQuery_List_FtrasIVA_con_Recargo_SN_Representante: TStringField;
    SQLQuery_List_FtrasIVA_Excluido_SN: TStringField;
    SQLQuery_List_FtrasIVA_Excluido_SN_Representante: TStringField;
    SQLQuery_List_FtrasMovil: TStringField;
    SQLQuery_List_Ftrasnif_cif: TStringField;
    SQLQuery_List_Ftrasnombre_comercial: TStringField;
    SQLQuery_List_Ftrasnombre_propietario: TStringField;
    SQLQuery_List_FtrasNumero_Factura: TLargeintField;
    SQLQuery_List_FtrasObservaciones: TStringField;
    SQLQuery_List_FtrasOT_descripcion_impuesto: TStringField;
    SQLQuery_List_FtrasOT_Tanto_Por_Ciento: TBCDField;
    SQLQuery_List_FtrasRetencion: TBCDField;
    SQLQuery_List_FtrasRetencion_Representante: TBCDField;
    SQLQuery_List_FtrasRiesgo_Autorizado: TBCDField;
    SQLQuery_List_FtrasSerie_Factura: TStringField;
    SQLQuery_List_FtrasTfno_Fijo_1: TStringField;
    SQLQuery_List_FtrasTfno_Fijo_2: TStringField;
    SQLQuery_List_FtrasTipo: TStringField;
    SQLQuery_List_FtrasTotal_Lineas: TBCDField;
    SQLQuery_List_FtrasTotal_Mano_Obra: TBCDField;
    SQLQuery_List_FtrasTotal_Materiales: TBCDField;
    SQLQuery_List_FtrasTotal_Resto: TBCDField;
    SQLQuery_List_FtrasTotal_Total: TBCDField;
    SQLQuery_List_FtrasVencimientos_1_Dias: TSmallintField;
    SQLQuery_List_FtrasVencimientos_automaticos_SN: TStringField;
    SQLQuery_List_FtrasVencimientos_Cantidad: TSmallintField;
    SQLQuery_List_FtrasVencimientos_Dias_Entre: TSmallintField;
    TabSheet_Busqueda_Concreta: TTabSheet;
    TabSheet_Filtros_Generales: TTabSheet;

    procedure Boton_Elegir_PeriodoClick(Sender: TObject);
    procedure Refrescar_Registros_Recibos;
    function  Filtrar_Listado_Ftras( param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
    function  Cambiar_Numeracion_Ftra : Boolean;
    procedure Filtrar_Impuestos_Totales;
    procedure SQLQuery_Alb_Pdtes_DetallesCalcFields(DataSet: TDataSet);
    procedure SQLQuery_Ftra_RcbosAfterPost(DataSet: TDataSet);
    procedure SQLQuery_Ftra_RcbosBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_Ftra_RcbosBeforePost(DataSet: TDataSet);
    procedure SQLQuery_List_FtrasCalcFields(DataSet: TDataSet);
    procedure Sumar_Totales;
    procedure Presentar_Datos_Totales( param_Actualizar_Totales : Byte );
    procedure BitBtn_Ver_Ftras_BorradasClick(Sender: TObject);
    procedure Traer_Numero_Ftra( param_msg : TStrings; param_id_empresas, param_descripcion_empresa : String );
    procedure Traer_Numero_Ftra_2( param_msg : TStrings );
    procedure Traer_Numero_Ftra_3( param_msg : TStrings; param_id_empresas, param_descripcion_empresa : String );
    function  Hay_Huecos_de_Ftras( param_id_empresas : String ) : Boolean;

    procedure Refrescar_Registros_Ftras_Borradas;
    function  Hay_Posible_Stock_Negativo : Boolean;
    procedure Rellenar_Datos_Cliente_a_Ftra( param_id : ShortString );
    procedure Rellenar_Datos_Representante_a_Ftra( param_id : ShortString );
    procedure Copiar_Ftra_Cabecera;
    procedure Copiar_Ftra_Cabecera_2(param_Fecha_Ftra_Nueva : String);
    procedure Copiar_Ftra_Cabecera_3(param_Fecha_Ftra_Nueva : String; param_msg : TStrings; param_SQLQuery : TSQLQuery);
    procedure Copiar_Ftra_Detalles( param_msg : TStrings; param_id_Ftra_Origen, param_id_Ftra_Destino : String );
    procedure Copiar_Ftra_Detalles_2( param_msg : TStrings; param_id_facturas : String; param_SQLQuery : TSQLQuery );
    procedure BitBtn_CopiarClick(Sender: TObject);
    procedure Refrescar_Registros_Alb_Pdtes;
    procedure Cerramos_Tablas_Alb_Pdtes;
    procedure Cerramos_Tablas_Ligadas_Alb_Pdtes;
    procedure Refrescar_Registros_Detalles_Stock;
    procedure Insertar_Registro;
    procedure Insertar_Registro_1( param_msg : TStrings; param_id_Cliente, param_Descripcion_Cliente, param_id_Empresas, param_Descripcion_Empresa, param_id_Almacenes, param_Descripcion_Almacen, param_id_Vehiculos, param_Descripcion_Vehiculo, param_Fecha_Albaran, param_Serie, param_Numero : ShortString );
    procedure Insertar_Registro_1_1(param_msg : TStrings);
    procedure Insertar_Registro_1_2( param_msg : TStrings; param_Serie_Factura, param_Numero_Factura : String );
    procedure Insertar_Registro_2(param_msg : TStrings);
    procedure Editar_Registro;
    procedure Borrar_Registro;
    procedure Borrar_Registro_2( param_avisamos : Boolean; param_msg : TStrings );
    procedure Borrar_en_Albaranes_la_Factura( param_Serie_Factura, param_Numero_Factura : String );
    procedure BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
    procedure Boton_Elegir_EmpresaClick(Sender: TObject);
    procedure Boton_Elegir_Forma_PagoClick(Sender: TObject);
    procedure Boton_Elegir_id_AlmacenesClick(Sender: TObject);
    procedure Boton_Elegir_id_ClientesClick(Sender: TObject);
    procedure Edit_Descripcion_EmpresaClick(Sender: TObject);
    procedure Edit_Descripcion_Forma_PagoClick(Sender: TObject);
    procedure Edit_Descripcion_id_AlmacenesClick(Sender: TObject);
    procedure Edit_Descripcion_id_ClientesClick(Sender: TObject);
    procedure SQLQuery_Alb_PdtesAfterPost(DataSet: TDataSet);
    procedure SQLQuery_Alb_PdtesAfterScroll(DataSet: TDataSet);
    procedure SQLQuery_Alb_PdtesBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_Alb_PdtesBeforePost(DataSet: TDataSet);
    procedure SQLQuery_Alb_PdtesCalcFields(DataSet: TDataSet);
    procedure SQLQuery_Alb_Pdtes_DetallesAfterPost(DataSet: TDataSet);
    procedure SQLQuery_Alb_Pdtes_DetallesBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_Alb_Pdtes_DetallesBeforePost(DataSet: TDataSet);
    function  Filtrar_Ftras_Borradas( param_id_empresas : String ) : ShortInt;
    function  Filtrar_Principal_Alb_Pdtes( param_Hasta, param_Desde : TDateTimePicker; param_id_Almacenes, param_id_Empresas, param_id_Forma_Pago, param_id_Clientes, param_id_Vehiculos, param_Serie_Albaran, param_Numero_Albaran : String; param_Memo_Filtros, param_Memo_OrderBy : TStrings; param_Controlando_Sin_Facturar_SN, param_Cambiamos_Filtro : Boolean ) : ShortInt;
    procedure Filtrar_tablas_ligadas_Alb_Pdtes;
    function  Bloquear_Albaranes_a_Facturar : Boolean;
    procedure Desbloquear_Albaranes_a_Facturar;
    function  Crear_Lineas_Ftra_Desde_Albaranes( param_Serie_Albaran, param_Numero_Albaran, param_Serie_Factura, param_Numero_Factura : String ) : Boolean;
    procedure Crear_Lineas_Ftra_Desde_Albaranes_2( param_id_facturas, param_Serie_Albaran, param_Numero_Albaran, param_Serie_Factura, param_Numero_Factura : String );
    procedure Marcar_Albaranes_Como_Facturados( param_Serie_Factura, param_Numero_Factura : String );
    function  Filtrar_Lineas_Detalles_Alb_Pdtes( param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
    procedure SQLQuery_Ftra_BorradasCalcFields(DataSet: TDataSet);
    procedure SQLQuery_Ftra_Detalles_StockCalcFields(DataSet: TDataSet);
    function  Tiene_lineas_detalle_de_algun_albaran_SN : Boolean;
    function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
    function  Filtrar_Recibos( param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
    function  Filtrar_Lineas_Impuestos( param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
    function  Filtrar_Lineas_Detalles( param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
    procedure Filtrar_Lineas_Detalles_Agrupadas_Por_Articulo;
    procedure Filtrar_tablas_ligadas;
    procedure Filtrar_Principal_Sin_Preguntar;
    procedure Refrescar_Registros;
    procedure Refrescar_Registros_Detalles;
    procedure Refrescar_Registros_Impuestos;
    procedure BitBtn_FiltrarClick(Sender: TObject);
    procedure Presentar_Datos;
    procedure no_Tocar;
    procedure BitBtn_ImprimirClick(Sender: TObject);
    procedure ComboBox_FiltrosChange(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure Seleccionado_Rgtro;
    procedure BitBtn_SALIRClick(Sender: TObject);
    procedure BitBtn_SeleccionarClick(Sender: TObject);
    procedure Cerramos_Tablas;
    procedure Cerramos_Tablas_Ligadas;
    procedure Cerramos_Tabla_Detalles_Stock;
    procedure Cerramos_Tabla_Ftras_Borradas;
    procedure DBGrid_PrincipalCellClick(Column: TColumn);
    procedure DBGrid_PrincipalDblClick(Sender: TObject);
    procedure DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure para_Empezar;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup_BajasClick(Sender: TObject);
    procedure SQLQuery_FtraAfterPost(DataSet: TDataSet);
    procedure SQLQuery_FtraAfterScroll(DataSet: TDataSet);
    procedure SQLQuery_FtraBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_FtraBeforePost(DataSet: TDataSet);
    procedure SQLQuery_FtraCalcFields(DataSet: TDataSet);
    procedure SQLQuery_Ftra_DetallesAfterPost(DataSet: TDataSet);
    procedure SQLQuery_Ftra_DetallesBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_Ftra_DetallesBeforePost(DataSet: TDataSet);
    procedure SQLQuery_Ftra_DetallesCalcFields(DataSet: TDataSet);

  private
    { private declarations }
    private_Salir_OK                  : Boolean;
    private_Order_By                  : array of TOrder_By;
    private_Order_By_Lineas_Recibos   : array of TOrder_By;
    private_Order_By_Lineas_Impuestos : array of TOrder_By;
    private_Order_By_Lineas_Detalles  : array of TOrder_By;
    private_Estaba_Borrada_la_Ftra    : Boolean;

    procedure Traer_facturas_ventas_xID( param_id : String; param_SQLTransaction : TSQLTransaction; param_SQLConnector : TSQLConnector; param_SQLQuery : TSQLQuery );
    procedure Traer_facturas_ventas_detalles_xid_Ftra( param_id : String; param_SQLTransaction : TSQLTransaction; param_SQLConnector : TSQLConnector; param_SQLQuery : TSQLQuery );
    function  Traer_Representantes_xID( param_id : ShortString ) : TRepresentantes;
    function  Traer_Clientes_xID( param_id : ShortString ) : TClientes;

  public
    { public declarations }
    public_Order_By_Alb_Pdtes                 : array of TOrder_By;
    public_Order_By_Lineas_Detalles_Alb_Pdtes : array of TOrder_By;
    public_Solo_Ver                           : Boolean;
    public_Elegimos                           : Boolean;
    public_Menu_Worked                        : Integer;
    public_Rgtro_Seleccionado                 : Boolean;
    public_que_va_a_ser                       : ShortString;

  end;

var
  form_facturas_ventas_000: Tform_facturas_ventas_000;

implementation

{$R *.lfm}

uses dm_facturas_ventas, menu, facturas_ventas_001, facturas_ventas_003, facturas_ventas_004,
     facturas_ventas_005, facturas_ventas_006, facturas_compras_004;

{ Tform_facturas_ventas_000 }

procedure Tform_facturas_ventas_000.FormActivate(Sender: TObject);
begin
    If public_Elegimos = true then
    begin
        BitBtn_Seleccionar.Visible := True;

        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    if public_Solo_Ver = true then no_Tocar;
end;

procedure Tform_facturas_ventas_000.FormCreate(Sender: TObject);
var var_Present : TDateTime;

    var_Year    : Word;
    var_Month   : Word;
    var_Day     : Word;

    var_Hour    : Word;
    var_Min     : Word;
    var_Sec     : Word;
    var_MSec    : Word;
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
    public_Solo_Ver                 := false;
    public_Elegimos                 := false;

    public_Rgtro_Seleccionado       := false;

    // ********************************************************************************************* //
    // ** Solo para este modulo                                                                   ** //
    // ********************************************************************************************* //
    Boton_Elegir_id_Almacenes.Visible     := false;
    Label_Almacen.Visible                 := false;
    Edit_Descripcion_id_Almacenes.Visible := false;

    form_Menu.Traer_Configuracion_APP;
    if UpperCase(Trim(form_menu.public_User_Configuracion.Albaranes_Obligar_Almacen_SN)) = 'S' then
    begin
        Boton_Elegir_id_Almacenes.Visible     := true;
        Label_Almacen.Visible                 := true;
        Edit_Descripcion_id_Almacenes.Visible := true;
    end;

    var_Present := Now;
    DecodeDate(var_Present, var_Year, var_Month, var_Day);
    DecodeTime(var_Present, var_Hour, var_Min, var_Sec, var_MSec);

    DateTimePicker_Desde.Date := StrToDate( '01/01/' + IntToStr(var_Year - 1) );
    DateTimePicker_Hasta.Date := StrToDate( '31/12/' + IntToStr(var_Year + 1) );
end;

procedure Tform_facturas_ventas_000.RadioGroup_BajasClick(Sender: TObject);
begin
    Refrescar_Registros;
end;

procedure Tform_facturas_ventas_000.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
    if private_Salir_OK = False then
    begin
        // ***************************************************************************************** //
        // ** Intento BitBtn_SALIR de la aplicación de un modo no permitido.                      ** //
        // ***************************************************************************************** //
        // Pero si desde el menu principal está a true la variable public_Salir_Ok, significa que ** //
        // ** hay que salir si o si pues se pulsó cancelar al preguntar otra vez por la contraseña** //
        // ***************************************************************************************** //
        if form_Menu.public_Salir_OK = False then CloseAction := caNone;
    end else begin
        // ************************************************************************************* //
        // ** Fue correcto el modo como quiere BitBtn_SALIR de la aplicación                  ** //
        // ************************************************************************************* //
    end;
end;

procedure Tform_facturas_ventas_000.FormDestroy(Sender: TObject);
begin
    Cerramos_Tablas;
end;

procedure Tform_facturas_ventas_000.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_facturas_ventas.SQLConnector_Ftra,
                      DataModule_facturas_ventas.SQLTransaction_Ftra,
                      SQLQuery_Ftra ) = false then UTI_GEN_Salir;

    DataModule_facturas_ventas.Free;
end;

procedure Tform_facturas_ventas_000.Cerramos_Tablas_Ligadas;
begin
    if UTI_TB_Cerrar( DataModule_facturas_ventas.SQLConnector_Ftra_Detalles,
                      DataModule_facturas_ventas.SQLTransaction_Ftra_Detalles,
                      SQLQuery_Ftra_Detalles ) = false then UTI_GEN_Salir;

    if UTI_TB_Cerrar( DataModule_facturas_ventas.SQLConnector_Ftra_Imptos,
                      DataModule_facturas_ventas.SQLTransaction_Ftra_Imptos,
                      SQLQuery_Ftra_Impuestos ) = false then UTI_GEN_Salir;
end;

procedure Tform_facturas_ventas_000.SQLQuery_FtraCalcFields(DataSet: TDataSet);
begin
    with SQLQuery_Ftra do
    begin
        if Trim(FieldByName('Serie_Factura').AsString) <> '' then
        begin
            FieldByName('OT_la_Factura').AsString := Trim(FieldByName('Serie_Factura').AsString) +
                                                     '-' +
                                                     Trim(FieldByName('Numero_Factura').AsString);
        end else begin
            FieldByName('OT_la_Factura').AsString := Trim(FieldByName('Numero_Factura').AsString);
        end;
    end;
end;

procedure Tform_facturas_ventas_000.SQLQuery_FtraAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'facturas_ventas',
                       DataModule_facturas_ventas.SQLTransaction_Ftra,
                       SQLQuery_Ftra,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros;
end;

procedure Tform_facturas_ventas_000.SQLQuery_FtraBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Ftra );
end;

procedure Tform_facturas_ventas_000.SQLQuery_FtraBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Ftra );
end;

procedure Tform_facturas_ventas_000.SQLQuery_FtraAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure Tform_facturas_ventas_000.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    If public_Elegimos then
         Seleccionado_Rgtro
    else Editar_Registro;
end;

procedure Tform_facturas_ventas_000.DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
var var_Color_Font  : TColor;
    var_Color_Brush : TColor;
begin
    // var_Color_Font  := clBlack;
    // var_Color_Brush := $006AD3D7;

    with Sender as TDBGrid do
    begin
        var_Color_Font  := Canvas.Font.Color;
        var_Color_Brush := Canvas.Brush.Color;

        // ***************************************************************************************** //
        // ** Comprobamos si es un registro dado de baja o no, para ponerle un tipo de color al   ** //
        // ** FONT u otro, según esté dada debaja o no                                            ** //
        // ***************************************************************************************** //
        if not SQLQuery_Ftra.FieldByName('Del_WHEN').IsNull then
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
                if (Column.FieldName <> 'Estado')   and
                   (Column.FieldName <> 'sin_Vtos') then
                begin
                    Canvas.Font.Color := clBlack;
                end;
            end;
        end;

        // ***************************************************************************************** //
        // ** Comprobamos si es un registro dado de baja o no, para ponerle un tipo de color al   ** //
        // ** FONT u otro, según esté dada debaja o no                                            ** //
        // ***************************************************************************************** //
        if SQLQuery_Ftra.FieldByName('Tipo').AsString = 'F' then
        begin
            // ************************************************************************************* //
            // ** Es una factura                                                                  ** //
            // ************************************************************************************* //
            Canvas.Brush.Color := var_Color_Brush;
        end else begin
            // ************************************************************************************* //
            // ** Es un abono                                                                     ** //
            // ************************************************************************************* //
            Canvas.Brush.Color := $007549F8;
        end;

        Canvas.fillrect(rect);

        // ***************************************************************************************** //
        // ** Ahora paso a dibujar una celda normal con los colores elegidos o una                ** //
        // ** dibujada                                                                            ** //
        // ***************************************************************************************** //
        if (Column.FieldName <> 'Estado')   and
           (Column.FieldName <> 'sin_Vtos') then
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
            if Column.FieldName = 'Estado'  then
            begin
                if SQLQuery_Ftra.RecordCount > 0 then
                begin
                    if Trim( UTI_CONTA_Esta_cerrada_la_Ftra( SQLQuery_Ftra.FieldByName('id').AsString,
                                                             'V') ) <> '0' then
                    begin
                        // ************************************************************************* //
                        // ** Esta cerrada                                                        ** //
                        // ************************************************************************* //
                        Canvas.StretchDraw(Rect, Image_Candado.Picture.Graphic)
                    end else begin
                        // ************************************************************************* //
                        // ** NNNNN OOOOOOO ... Esta cerrada                                      ** //
                        // ************************************************************************* //
                        DefaultDrawColumnCell(Rect, DataCol, Column, State);
                    end;
                end;
            end;

            if Column.FieldName = 'sin_Vtos'  then
            begin
                if SQLQuery_Ftra.RecordCount > 0 then
                begin
                    if Trim(UTI_LINEAS_Cartera_Rcbos_es_diferente_que_Total_Ftra( 'facturas_ventas',
                                                                                  SQLQuery_Ftra.FieldByName('id').AsString,
                                                                                  false ).mensaje ) <> '' then
                    begin
                        // ***************************************************************************** //
                        // ** No tiene recibos completados                                            ** //
                        // ***************************************************************************** //
                        Canvas.StretchDraw(Rect, Image_Ftra_sin_Rcbos.Picture.Graphic);
                    end else begin
                        // ***************************************************************************** //
                        // ** Tiene los recibos al día                                                ** //
                        // ***************************************************************************** //
                        DefaultDrawColumnCell(Rect, DataCol, Column, State);
                    end;
                end;
            end;
        end;

        Canvas.Font.Color  := var_Color_Font;
        Canvas.Brush.Color := var_Color_Brush;
    end;
end;

procedure Tform_facturas_ventas_000.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then
    begin
        If public_Elegimos then
             Seleccionado_Rgtro
        else Editar_Registro;
    end;
end;

procedure Tform_facturas_ventas_000.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

procedure Tform_facturas_ventas_000.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure Tform_facturas_ventas_000.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_facturas_ventas_000.BitBtn_SeleccionarClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
end;

procedure Tform_facturas_ventas_000.Seleccionado_Rgtro;
begin
    private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    public_Rgtro_Seleccionado := true;
    Close;
end;

procedure Tform_facturas_ventas_000.DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
begin
    //Filtrar_tablas_ligadas;

    case Button of
        nbInsert : begin
            Insertar_Registro;
            Abort;
        end;

        nbEdit : begin
            Editar_Registro;
            Abort;
        end;

        nbDelete : begin
            Borrar_Registro;
            Abort;
        end;

        nbRefresh : begin
            Refrescar_Registros;
            Abort;
        end;
    end;
end;

procedure Tform_facturas_ventas_000.ComboBox_FiltrosChange(Sender: TObject);
begin
    Memo_OrderBy.Lines.Clear;
    Memo_OrderBy.Lines.Add( private_Order_By[ComboBox_Filtros.ItemIndex].Memo_OrderBy );
    BitBtn_FiltrarClick(Nil);
end;

procedure Tform_facturas_ventas_000.no_Tocar;
begin
end;

procedure Tform_facturas_ventas_000.Presentar_Datos;
begin
     /// guardar por lo que pueda pasar
end;

procedure Tform_facturas_ventas_000.BitBtn_FiltrarClick(Sender: TObject);
var var_msg : TStrings;
begin
    // ********************************************************************************************* //
    // ** COMPROBAMOS SI EL MARGEN DE FECHAS ESTA BIEN INTRODUCIDO                                ** //
    // ********************************************************************************************* //
    var_msg := TStringList.Create;

    if UTI_GEN_Comprobar_2_Fechas( DateTimePicker_Desde,
                                   DateTimePicker_Hasta ) = false then
    begin
        var_msg.Add('* Fechas mal introducidas para margen de facturas.');
    end;

    if Trim(var_msg.Text) <> '' then
    begin
        UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        var_msg.Free;

        Exit;
    end else begin
        var_msg.Free;
    end;

    // ********************************************************************************************* //
    // ** PASAMOS A FILTRAR                                                                       ** //
    // ********************************************************************************************* //
    if PageControl_Filtros.ActivePage = TabSheet_Busqueda_Concreta then
    begin
        Filtrar_Principal_Sin_Preguntar;
    end else begin
        RadioGroup_Bajas.ItemIndex := Filtrar_Principal( true );
    end;
end;

procedure Tform_facturas_ventas_000.BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if SQLQuery_Ftra.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'facturas_ventas',
                                           SQLQuery_Ftra,
                                           DataSource_Ftra,
                                           DBGrid_Principal );
        end;
    end;
end;

procedure Tform_facturas_ventas_000.Refrescar_Registros;
var var_Serie  : ShortString;
    var_Numero : Int64;
begin
    Try
        // ***************************************************************************************** //
        // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                         ** //
        // ***************************************************************************************** //
        var_Serie  := '';
        var_Numero := 0;

        with SQLQuery_Ftra do
        begin
            if RecordCount > 0 then
            begin
                var_Serie  := FieldByName('Serie_Factura').AsString;
                var_Numero := FieldByName('Numero_Factura').Value;
            end;
        end;

        Filtrar_Principal_Sin_Preguntar;

        if Trim(var_Serie) <> '' then
        begin
             SQLQuery_Ftra.Locate( 'Serie_Factura;Numero_Factura',
                                  VarArrayOf( [ var_Serie, var_Numero ] ),
                                  [] );
        end;
    Except
    end;
end;

procedure Tform_facturas_ventas_000.Filtrar_Principal_Sin_Preguntar;
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

procedure Tform_facturas_ventas_000.SQLQuery_Ftra_DetallesBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Ftra_Detalles );
end;

procedure Tform_facturas_ventas_000.SQLQuery_Ftra_DetallesAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'facturas_ventas_detalles',
                       DataModule_facturas_ventas.SQLTransaction_Ftra_Detalles,
                       SQLQuery_Ftra_Detalles,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros_Detalles;
end;

procedure Tform_facturas_ventas_000.Boton_Elegir_id_AlmacenesClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Almacenes( true, false, 260, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Almacenes.Text             := Trim(var_Registro.id_1);
        Edit_Descripcion_id_Almacenes.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_facturas_ventas_000.Boton_Elegir_EmpresaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Empresas( true, false, 250, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Empresas.Text         := Trim(var_Registro.id_1);
        Edit_Descripcion_Empresa.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_facturas_ventas_000.Boton_Elegir_Forma_PagoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_FormasPago( true, false, 80, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Forma_Pago.Text          := Trim(var_Registro.id_1);
        Edit_Descripcion_Forma_Pago.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_facturas_ventas_000.Boton_Elegir_id_ClientesClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Clientes( true, false, 50, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Clientes.Text             := Trim(var_Registro.id_1);
        Edit_Descripcion_id_Clientes.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_facturas_ventas_000.Edit_Descripcion_id_AlmacenesClick(
  Sender: TObject);
begin
    Edit_id_Almacenes.Text             := '';
    Edit_Descripcion_id_Almacenes.Text := '';
end;

procedure Tform_facturas_ventas_000.Edit_Descripcion_EmpresaClick(Sender: TObject);
begin
    Edit_id_Empresas.Text         := '';
    Edit_Descripcion_Empresa.Text := '';
end;

procedure Tform_facturas_ventas_000.Edit_Descripcion_Forma_PagoClick(Sender: TObject);
begin
    Edit_id_Forma_Pago.Text          := '';
    Edit_Descripcion_Forma_Pago.Text := '';
end;

procedure Tform_facturas_ventas_000.Edit_Descripcion_id_ClientesClick(Sender: TObject);
begin
    Edit_id_Clientes.Text          := '';
    Edit_Descripcion_id_Clientes.Text := '';
end;

procedure Tform_facturas_ventas_000.SQLQuery_Alb_PdtesAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'albaranes_ventas',
                       DataModule_facturas_ventas.SQLTransaction_Alb_Pdtes,
                       SQLQuery_Alb_Pdtes,
                       false {Devolver_hacemos_commit_alFinalizar} );

    if UTI_GEN_Form_Abierto_Ya('form_facturas_ventas_005') = true then
    begin
        Refrescar_Registros_Alb_Pdtes;
    end;
end;

procedure Tform_facturas_ventas_000.SQLQuery_Alb_PdtesAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas_Alb_Pdtes;
end;

procedure Tform_facturas_ventas_000.SQLQuery_Alb_PdtesBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Alb_Pdtes );
end;

procedure Tform_facturas_ventas_000.SQLQuery_Alb_PdtesBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Alb_Pdtes );
end;

procedure Tform_facturas_ventas_000.SQLQuery_Alb_PdtesCalcFields(DataSet: TDataSet);
begin
    with SQLQuery_Alb_Pdtes do
    begin
        FieldByName('OT_el_Albaran').AsString := Trim(FieldByName('Serie_Albaran').AsString) +
                                                 '-' +
                                                 Trim(FieldByName('Numero_Albaran').AsString);
    end;
end;

procedure Tform_facturas_ventas_000.SQLQuery_Alb_Pdtes_DetallesAfterPost(
  DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'albaranes_ventas_detalles',
                       DataModule_facturas_ventas.SQLTransaction_Alb_Pdtes_D,
                       SQLQuery_Alb_Pdtes_Detalles,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros_Detalles;
end;

procedure Tform_facturas_ventas_000.SQLQuery_Alb_Pdtes_DetallesBeforeEdit(
  DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Alb_Pdtes_Detalles );
end;

procedure Tform_facturas_ventas_000.SQLQuery_Alb_Pdtes_DetallesBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Alb_Pdtes_Detalles );
end;

procedure Tform_facturas_ventas_000.Borrar_en_Albaranes_la_Factura( param_Serie_Factura,
                                                                    param_Numero_Factura : String );
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
    var_msg            : TStrings;
begin
    Try
        // ------------------------------------------------------------------------------------- //
        // ------------------------------------------------------------------------------------- //
        // -- AHORA VAMOS A BORRAR LA FACTURA DE LAS LINEAS DE DETALLE DE ALBARANES           -- //
        // ------------------------------------------------------------------------------------- //
        // -- Creamos la Transaccion y la conexión con el motor BD, y la abrimos              -- //
        // ------------------------------------------------------------------------------------- //
        // ------------------------------------------------------------------------------------- //
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Connector_Open( var_SQLTransaction,
                                  var_SQLConnector ) = False then UTI_GEN_Salir;

        // ************************************************************************************* //
        // ** Creamos la SQL Según el motor de BD                                             ** //
        // ************************************************************************************* //
        var_SQL := TStringList.Create;

        var_SQL.Add( 'UPDATE albaranes_ventas_detalles' );
        var_SQL.Add(    'SET Serie_Factura = NULL,' );
        var_SQL.Add(        'Numero_Factura = NULL' );
        var_SQL.Add(  'WHERE Serie_Factura = ' + UTI_GEN_Comillas(Trim(param_Serie_Factura)) );
        var_SQL.Add(    'AND Numero_Factura = ' + Trim(param_Numero_Factura) );

        // ************************************************************************************* //
        // ** Ejecutamos la SQL                                                               ** //
        // ************************************************************************************* //
        var_SQLQuery          := TSQLQuery.Create(nil);

        var_SQLQuery.Database := var_SQLConnector;
        var_SQLQuery.SQL.Text := var_SQL.Text;

        var_SQLQuery.Name     := 'SQLQuery_Borrar_en_Albaranes_la_Factura';

        var_SQLQuery.ExecSQL;
        var_SQLTransaction.Commit;

        // ************************************************************************************* //
        // ** Destruimos la tabla y conexiones                                                ** //
        // ************************************************************************************* //
        var_SQLQuery.Free;
        var_SQL.Free;

        // ************************************************************************************* //
        // ** Cerramos La transacción y la conexión con la BD                                 ** //
        // ************************************************************************************* //
        if UTI_CN_Connector_Close( var_SQLTransaction,
                                   var_SQLConnector ) = False then UTI_GEN_Salir;

        var_SQLTransaction.Free;
        var_SQLConnector.Free;

        // ------------------------------------------------------------------------------------- //
        // ------------------------------------------------------------------------------------- //
        // -- AHORA VAMOS A BORRAR LA FACTURA DE LA CABECERA DE ALBARANES                     -- //
        // ------------------------------------------------------------------------------------- //
        // -- Creamos la Transaccion y la conexión con el motor BD, y la abrimos              -- //
        // ------------------------------------------------------------------------------------- //
        // ------------------------------------------------------------------------------------- //
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Connector_Open( var_SQLTransaction,
                                  var_SQLConnector ) = False then UTI_GEN_Salir;

        // ************************************************************************************* //
        // ** Creamos la SQL Según el motor de BD                                             ** //
        // ************************************************************************************* //
        var_SQL := TStringList.Create;

        var_SQL.Add( 'UPDATE albaranes_ventas' );
        var_SQL.Add(    'SET Serie_Factura = NULL,' );
        var_SQL.Add(        'Numero_Factura = NULL' );
        var_SQL.Add(  'WHERE Serie_Factura = ' + UTI_GEN_Comillas(Trim(param_Serie_Factura)) );
        var_SQL.Add(    'AND Numero_Factura = ' + Trim(param_Numero_Factura) );

        // ************************************************************************************* //
        // ** Ejecutamos la SQL                                                               ** //
        // ************************************************************************************* //
        var_SQLQuery          := TSQLQuery.Create(nil);

        var_SQLQuery.Database := var_SQLConnector;
        var_SQLQuery.SQL.Text := var_SQL.Text;

        var_SQLQuery.Name     := 'SQLQuery_Borrar_en_Albaranes_la_Factura_2';

        var_SQLQuery.ExecSQL;
        var_SQLTransaction.Commit;

        // ************************************************************************************* //
        // ** Destruimos la tabla y conexiones                                                ** //
        // ************************************************************************************* //
        var_SQLQuery.Free;
        var_SQL.Free;

        // ************************************************************************************* //
        // ** Cerramos La transacción y la conexión con la BD                                 ** //
        // ************************************************************************************* //
        if UTI_CN_Connector_Close( var_SQLTransaction,
                                   var_SQLConnector ) = False then UTI_GEN_Salir;

        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    Except
        on error : Exception do
        begin
            var_msg := TStringList.Create;
            var_msg.Add( 'Error al borrar en albaranes todo rastro de la factura ' +
                         Trim(param_Serie_Factura) + '/' + Trim(param_Numero_Factura) + '.' );

            UTI_GEN_Error_Log( var_msg.Text, error );
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Pudo, True, False);
            var_msg.Free;

            try
                var_SQL.Free;
                var_SQLTransaction.Free;
                var_SQLConnector.Free;
                var_SQLQuery.Free;
            except
            end;
        end;
    end;
end;

procedure Tform_facturas_ventas_000.Cerramos_Tabla_Detalles_Stock;
begin
    if UTI_TB_Cerrar( DataModule_facturas_ventas.SQLConnector_Ftra_Detalles_Stock,
                      DataModule_facturas_ventas.SQLTransaction_Ftra_Detalles_Stock,
                      SQLQuery_Ftra_Detalles_Stock ) = false then UTI_GEN_Salir;
end;

procedure Tform_facturas_ventas_000.Refrescar_Registros_Detalles_Stock;
var var_id : ShortString;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_id := '';

    with SQLQuery_Ftra_Detalles_Stock do
    begin
        if RecordCount > 0 then
        begin
            if FieldByName('id').IsNull then
            begin
                var_id := '0';
            end else begin
                var_id := FieldByName('id').AsString;
            end;
        end;
    end;

    Filtrar_Lineas_Detalles_Agrupadas_Por_Articulo;

    if var_id <> '' then
    begin
        if var_id = '0' then
        begin
            // ************************************************************************************* //
            // ** Estabamos en una insercción, así que me voy al último registro, pues el order by** //
            // ** es id_cliente + id del registro                                                 ** //
            // ************************************************************************************* //
            SQLQuery_Ftra_Detalles_Stock.Last;
        end else begin
            // ************************************************************************************* //
            // ** Estabamos en una edición, así que ya conocíamos la id del registro. Por lo que  ** //
            // ** hago el locate por esta id                                                      ** //
            // ************************************************************************************* //
            SQLQuery_Ftra_Detalles_Stock.Locate('id', StrToInt64(var_id), []);
        end;
    end;
end;

procedure Tform_facturas_ventas_000.Refrescar_Registros_Detalles;
var
  var_Lineas_Filtro  : TStrings;
  var_Lineas_OrderBy : TStrings;
  var_id             : ShortString;
  var_ver_Bajas      : ShortInt;
  var_SQL_ADD        : TStrings;
begin
    var_SQL_ADD := TStringList.Create;

    // ********************************************************************************************* //
    // ** Solo si la cabecera está en modo EDIT se abren las tablas hijas                         ** //
    // ********************************************************************************************* //
    if SQLQuery_Ftra.State <> dsEdit then Exit;

    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_id := '';

    with SQLQuery_Ftra_Detalles do
    begin
        if RecordCount > 0 then
        begin
            if FieldByName('id').IsNull then
            begin
                var_id := '0';
            end else begin
                var_id := FieldByName('id').AsString;
            end;
        end;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Clear;
    var_Lineas_OrderBy.Clear;

    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'fd.id_facturas = ' + SQLQuery_Ftra.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_ver_Bajas := 1; // asi no se ven las bajas hasta que no lo pida el form de altas/modif de líneas
    if UTI_GEN_Form_Abierto_Ya('form_facturas_ventas_001') = true then
    begin
        var_ver_Bajas := form_facturas_ventas_001.RadioGroup_Bajas.ItemIndex;
    end;

    Filtrar_Lineas_Detalles( var_ver_Bajas,
                             false,
                             var_Lineas_Filtro,
                             var_Lineas_OrderBy );

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;

    if var_id <> '' then
    begin
        if var_id = '0' then
        begin
            // ************************************************************************************* //
            // ** Estabamos en una insercción, así que me voy al último registro, pues el order by** //
            // ** es id_cliente + id del registro                                                 ** //
            // ************************************************************************************* //
            SQLQuery_Ftra_Detalles.Last;
        end else begin
            // ************************************************************************************* //
            // ** Estabamos en una edición, así que ya conocíamos la id del registro. Por lo que  ** //
            // ** hago el locate por esta id                                                      ** //
            // ************************************************************************************* //
            SQLQuery_Ftra_Detalles.Locate('id', StrToInt64(var_id), []);
        end;

    end;

    var_SQL_ADD.Free;
end;

function Tform_facturas_ventas_000.Filtrar_Lineas_Detalles( param_ver_bajas : ShortInt;
                                                            param_Cambiamos_Filtro : Boolean;
                                                            param_Lineas_Filtro,
                                                            param_Lineas_OrderBy : TStrings ) : ShortInt;
var
  var_a_Filtrar : TStrings;
begin
  var_a_Filtrar := TStringList.Create;
  var_a_Filtrar.Clear;

  if Trim(param_Lineas_OrderBy.Text) = '' then
  begin
    param_Lineas_OrderBy.Text := private_Order_By_Lineas_Detalles[0].Memo_OrderBy;
  end;

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  Result := UTI_TB_Filtrar( private_Order_By_Lineas_Detalles,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Ftra_Detalles,
                                                          'facturas_ventas_detalles',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Ftra_Detalles,
                                                          'facturas_ventas_detalles',
                                                          'i' ),

                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_facturas_ventas.SQLTransaction_Ftra_Detalles,
                            DataModule_facturas_ventas.SQLConnector_Ftra_Detalles,
                            SQLQuery_Ftra_Detalles,

                            // name_tabla,
                            'fd',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT fd.*,' + ' ' +

                                   'cl.nombre_propietario AS OT_Cliente_nombre_propietario,' + ' ' +
                                   'cl.nombre_comercial AS OT_Cliente_nombre_comercial,' + ' ' +

                                   'fv.id_almacenes AS OT_id_almacenes_Cabecera,' + ' ' +
                                   'fv.Serie_Factura AS OT_Serie_Factura,' + ' ' +
                                   'fv.Numero_Factura AS OT_Numero_Factura,' + ' ' +

                                   'al.descripcion AS OT_descripcion_almacen,' + ' ' +

                                   'a.descripcion_para_TPV AS OT_descripcion_articulo,' + ' ' +
                                   'a.Tipo_de_articulo AS OT_Tipo_de_articulo,' + ' ' +

                                   'i.descripcion AS OT_descripcion_impuesto,' + ' ' +
                                   'i.Tanto_Por_Ciento AS OT_Tanto_Por_Ciento,' + ' ' +
                                   'i.Sumado_A_Ftra_SN AS OT_Sumado_A_Ftra_SN' + ' ' +

                            'FROM facturas_ventas_detalles AS fd' + ' ' +

                            'LEFT JOIN almacenes AS al' + ' ' +
                            'ON fd.id_almacenes = al.id' + ' ' +

                            'LEFT JOIN articulos AS a' + ' ' +
                            'ON fd.id_articulos = a.id' + ' ' +

                            'LEFT JOIN impuestos AS i' + ' ' +
                            'ON fd.id_impuestos_Ventas = i.id' + ' ' +

                            'LEFT JOIN clientes AS cl' + ' ' +
                            'ON fd.id_clientes = cl.id' + ' ' +

                            'LEFT JOIN facturas_ventas AS fv' + ' ' +
                            'ON fd.id_facturas = fv.id ',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar,

                            param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  if UTI_GEN_Form_Abierto_Ya('form_facturas_ventas_001') = true then
  begin
    form_facturas_ventas_001.Poner_Total_Lineas_Detalle;
  end;

  var_a_Filtrar.Free;
end;

function Tform_facturas_ventas_000.Tiene_lineas_detalle_de_algun_albaran_SN : Boolean;
begin
    Result := false;
    with SQLQuery_Ftra_Detalles do
    begin
        First;

        While not eof do
        begin
            if not FieldByName('Serie_Albaran').IsNull then
            begin
                Result := true;
            end;

            Next;
        end;
    end;
end;

procedure Tform_facturas_ventas_000.SQLQuery_Ftra_DetallesBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Ftra_Detalles );
end;

procedure Tform_facturas_ventas_000.Filtrar_Lineas_Detalles_Agrupadas_Por_Articulo;
var
  var_Lineas_OrderBy : TStrings;
  var_Lineas_Filtro  : TStrings;
  var_a_Filtrar      : TStrings;
  var_SQL_ADD        : TStrings;
begin
  var_SQL_ADD        := TStringList.Create;

  var_Lineas_OrderBy := TStringList.Create;
  var_Lineas_Filtro  := TStringList.Create;
  var_a_Filtrar      := TStringList.Create;

  var_Lineas_OrderBy.Clear;
  var_Lineas_Filtro.Clear;
  var_a_Filtrar.Clear;

  // ********************************************************************************************* //
  // ** Le ponemos los WHERE                                                                    ** //
  // ********************************************************************************************* //
  var_SQL_ADD.Clear;
  var_SQL_ADD.Add( 'fds.id_facturas = ' + SQLQuery_Ftra.FieldByName('id').AsString );
  UTI_TB_SQL_ADD( true,
                  var_Lineas_Filtro,
                  var_SQL_ADD );

  var_SQL_ADD.Clear;
  var_SQL_ADD.Add( 'NOT fds.id_articulos IS NULL' );
  UTI_TB_SQL_ADD( false,
                  var_Lineas_Filtro,
                  var_SQL_ADD );

  var_SQL_ADD.Clear;
  var_SQL_ADD.Add( 'fds.Serie_Albaran IS NULL' );
  UTI_TB_SQL_ADD( false,
                  var_Lineas_Filtro,
                  var_SQL_ADD ); // Sólo los que no pertenecen a un albarán el detalle
                                 // pues el control de stock ya no se hace en ftras.

  var_SQL_ADD.Clear;
  var_SQL_ADD.Add( 'art.id = fds.id_articulos' );
  UTI_TB_SQL_ADD( false,
                  var_Lineas_Filtro,
                  var_SQL_ADD );

  var_SQL_ADD.Clear;
  var_SQL_ADD.Add( 'art.Tipo_de_articulo = 0' );
  UTI_TB_SQL_ADD( false,
                  var_Lineas_Filtro,
                  var_SQL_ADD );

  var_SQL_ADD.Clear;
  var_SQL_ADD.Add( 'alm.id = fds.id_almacenes' );
  UTI_TB_SQL_ADD( false,
                  var_Lineas_Filtro,
                  var_SQL_ADD );

  var_SQL_ADD.Clear;
  var_SQL_ADD.Add( 'st.id_articulos = fds.id_articulos' );
  UTI_TB_SQL_ADD( false,
                  var_Lineas_Filtro,
                  var_SQL_ADD );

  var_SQL_ADD.Clear;
  var_SQL_ADD.Add( 'st.id_almacenes = fds.id_almacenes' );
  UTI_TB_SQL_ADD( false,
                  var_Lineas_Filtro,
                  var_SQL_ADD );

  var_Lineas_Filtro.Add( 'GROUP BY fds.id_articulos, fds.id_almacenes' );

  // ********************************************************************************************* //
  // ** Le ponemos el ORDER BY                                                                  ** //
  // ********************************************************************************************* //
  var_Lineas_OrderBy.Text := 'fds.id_facturas ASC, fds.id_articulos ASC, fds.id_almacenes ASC';

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  UTI_TB_Filtrar( private_Order_By_Lineas_Detalles,

                  // Delete_SQL,
                  '',

                  // Update_SQL,
                  '',

                  // Insert_SQL,
                  '',

                  // var_ctdad_Rgtros,
                  -1,

                  DataModule_facturas_ventas.SQLTransaction_Ftra_Detalles_Stock,
                  DataModule_facturas_ventas.SQLConnector_Ftra_Detalles_Stock,
                  SQLQuery_Ftra_Detalles_Stock,

                  // name_tabla,
                  'fds',

                  1, // No vemos las líneas dadas de baja

                  // SELECT_SQL,
                  'SELECT fds.id_articulos,' + ' ' +
                         'fds.id_almacenes,' + ' ' +
                         'SUM(fds.Unidades) AS unidades,' + ' ' +

                         'art.descripcion_para_TPV AS OT_descripcion_articulo,' + ' ' +
                         'alm.descripcion AS OT_descripcion_almacen,' + ' ' +
                         'st.Stock' + ' ' +

                  'FROM facturas_ventas_detalles AS fds,' + ' ' +
                       'articulos AS art,' + ' ' +
                       'almacenes AS alm,' + ' ' +
                       'articulos_stock AS st',

                  var_Lineas_Filtro,
                  var_Lineas_OrderBy,
                  var_a_Filtrar,

                  false,   // Así no cambiamos su filtro
                  false,   // param_ver_SQL_despues_Abrir : Boolean;
                  true );  // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_Lineas_OrderBy.Free;
  var_Lineas_Filtro.Free;
  var_a_Filtrar.Free;
  var_SQL_ADD.Free;
end;

procedure Tform_facturas_ventas_000.Editar_Registro;
var var_msg                  : TStrings;
    var_id                   : ShortString;
    var_imprimir             : Boolean;
    var_Continuamos          : Boolean;
    var_cambiando_forma_pago : Boolean;
    var_Primera_Vez          : Boolean;
begin
    var_Primera_Vez := True;
    var_Continuamos := true;
    while var_Continuamos = true do
    begin
        with SQLQuery_Ftra do
        begin
            var_msg := TStringList.Create;

            if RecordCount > 0 then
            begin
                var_id := FieldByName('id').AsString;

                if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
                begin
                    if UTI_RGTRO_isLock( 'facturas_ventas',
                                         var_id,
                                         true ) = true then
                    begin
                        Exit;
                    end else begin
                        if UTI_RGTRO_Lock( 'facturas_ventas',
                                           var_id ) = true then
                             Edit
                        else Exit;
                    end;

                    // ********************************************************************************* //
                    // ** Continuamos                                                                 ** //
                    // ********************************************************************************* //
                    Application.CreateForm(Tform_facturas_ventas_001, form_facturas_ventas_001);

                    form_facturas_ventas_001.RadioGroup_Bajas.ItemIndex := RadioGroup_Bajas.ItemIndex;
                    form_facturas_ventas_001.public_Menu_Worked         := public_Menu_Worked;

                    if public_Solo_Ver = true then
                    begin
                        form_facturas_ventas_001.public_Solo_Ver := true;
                    end;

                    form_facturas_ventas_001.para_Empezar;

                    form_facturas_ventas_001.public_imprimir          := false;
                    form_facturas_ventas_001.public_volvemos_a_editar := false;

                    if var_Primera_Vez = false then
                    begin
                        ;
                    end;

                    form_facturas_ventas_001.ShowModal;
                    if form_facturas_ventas_001.public_Pulso_Aceptar = true then
                    begin
                        if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( SQLQuery_Ftra ) = true then
                        begin
                            FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                            FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                            Presentar_Datos_Totales(0);

                            UTI_RGTRO_Grabar_Antes( 'facturas_ventas', SQLQuery_Ftra );
                        end else begin
                            Cancel;

                            // ************************************************************************* //
                            // ** Si refrescamos los registros aquí conseguiremos que se actualicen   ** //
                            // ** los totales y se refrescara si ha sido cambiado el estado de cerrado** //
                            // ************************************************************************* //
                            Refrescar_Registros;
                        end;
                    end else begin
                        Cancel;

                        // ***************************************************************************** //
                        // ** Si refrescamos los registros aquí conseguiremos que se actualicen los   ** //
                        // ** totales y que se refresque si ha sido cambiado el estado de cerrado     ** //
                        // ***************************************************************************** //
                        Refrescar_Registros;
                    end;

                    var_imprimir             := form_facturas_ventas_001.public_imprimir;
                    var_cambiando_forma_pago := form_facturas_ventas_001.public_volvemos_a_editar;

                    form_facturas_ventas_001.Free;

                    UTI_RGTRO_UnLock( 'facturas_ventas', var_id );

                    var_Continuamos := false;
                    if (var_imprimir = true)             or
                       (var_cambiando_forma_pago = true) then
                    begin
                        if var_imprimir = true then BitBtn_ImprimirClick(nil);
                        var_Continuamos := true;
                        var_Primera_Vez := false;
                    end;
                end;
            end else begin
                var_msg.Add(rs_no_Hay_Rgtros);
                UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            end;
        end;

        var_msg.Free;
    end;
end;

procedure Tform_facturas_ventas_000.Cerramos_Tablas_Alb_Pdtes;
begin
    Cerramos_Tablas_Ligadas_Alb_Pdtes;

    if UTI_TB_Cerrar( DataModule_facturas_ventas.SQLConnector_Alb_Pdtes,
                      DataModule_facturas_ventas.SQLTransaction_Alb_Pdtes,
                      SQLQuery_Alb_Pdtes ) = false then UTI_GEN_Salir;

    // DataModule_facturas_ventas.Free; No lo cierro porque todavía lo uso en form_facturas_ventas_000
end;

procedure Tform_facturas_ventas_000.Cerramos_Tablas_Ligadas_Alb_Pdtes;
begin
    if UTI_TB_Cerrar( DataModule_facturas_ventas.SQLConnector_Alb_Pdtes_D,
                      DataModule_facturas_ventas.SQLTransaction_Alb_Pdtes_D,
                      SQLQuery_Alb_Pdtes_Detalles ) = false then UTI_GEN_Salir;
end;

function Tform_facturas_ventas_000.Filtrar_Principal_Alb_Pdtes( param_Hasta,
                                                                param_Desde : TDateTimePicker;
                                                                param_id_Almacenes,
                                                                param_id_Empresas,
                                                                param_id_Forma_Pago,
                                                                param_id_Clientes,
                                                                param_id_Vehiculos,
                                                                param_Serie_Albaran,
                                                                param_Numero_Albaran : String;
                                                                param_Memo_Filtros,
                                                                param_Memo_OrderBy : TStrings;
                                                                param_Controlando_Sin_Facturar_SN,
                                                                param_Cambiamos_Filtro : Boolean ) : ShortInt;
var
  var_a_Filtrar : TStrings;
  var_SQL_ADD   : TStrings;
begin
    var_SQL_ADD   := TStringList.Create;

    var_a_Filtrar := TStringList.Create;
    var_a_Filtrar.Clear;

    // ********************************************************************************************* //
    // ** AHORA PONDREMOS EL RESTO DE LOS FILTROS QUE NO SON GENERALES                            ** //
    // ********************************************************************************************* //
    // ** Primero buscaremos por la FECHA                                                        ** //
    // ******************************************************************************************** //
    if (not param_Hasta.DateIsNull) and
       (not param_Desde.DateIsNull) then
    begin
         var_SQL_ADD.Clear;
         var_SQL_ADD.Add( 'a.Fecha <= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(param_Hasta.Date, false) + ' 23:59:59' ) );
         UTI_TB_SQL_ADD( false,
                         var_a_Filtrar,
                         var_SQL_ADD );

         var_SQL_ADD.Clear;
         var_SQL_ADD.Add( 'a.Fecha >= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(param_Desde.Date, false) + ' 00:00:00' ) );
         UTI_TB_SQL_ADD( false,
                         var_a_Filtrar,
                         var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por el almacén                                                         ** //
    // ********************************************************************************************* //
    if Trim(param_id_Almacenes) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'a.id_Almacenes = ' + Trim(param_id_Almacenes) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la empresa                                                         ** //
    // ********************************************************************************************* //
    if Trim(param_id_Empresas) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'a.id_empresas = ' + Trim(param_id_Empresas) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la forma de pago                                                   ** //
    // ********************************************************************************************* //
    if Trim(param_id_Forma_Pago) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'a.id_formas_pago = ' + Trim(param_id_Forma_Pago) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la id del cliente                                                  ** //
    // ********************************************************************************************* //
    if Trim(param_id_Clientes) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'a.id_clientes = ' + Trim(param_id_Clientes) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;


    // ********************************************************************************************* //
    // ** Ahora buscaremos por la id del vehiculo                                                 ** //
    // ********************************************************************************************* //
    if Trim(param_id_Vehiculos) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'a.id_Vehiculos = ' + Trim(param_id_Vehiculos) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora filtraremos por los albaranes todavía no facturados                               ** //
    // ********************************************************************************************* //
    if param_Controlando_Sin_Facturar_SN = true then
    begin
         var_SQL_ADD.Clear;
         var_SQL_ADD.Add( 'a.Numero_Factura IS NULL' );
         UTI_TB_SQL_ADD( false,
                         var_a_Filtrar,
                         var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora filtraremos por el albarán solicitado                                             ** //
    // ********************************************************************************************* //
    if Trim(param_Serie_Albaran) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'a.Serie_Albaran = ' + UTI_GEN_Comillas(param_Serie_Albaran) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );

    end;

    if Trim(param_Numero_Albaran) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'a.Numero_Albaran = ' + Trim(param_Numero_Albaran) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
      y que por lo se debe de permitir modificarlos en ningún módulo }

    Result := UTI_TB_Filtrar( private_Order_By,

                              // Delete_SQL,
                              '',

                              // Update_SQL,
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Alb_Pdtes,
                                                            'albaranes_ventas',
                                                            'u' ),

                              // Insert_SQL,
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Alb_Pdtes,
                                                            'albaranes_ventas',
                                                            'i' ),

                              // var_ctdad_Rgtros,
                              -1,

                              DataModule_facturas_ventas.SQLTransaction_Alb_Pdtes,
                              DataModule_facturas_ventas.SQLConnector_Alb_Pdtes,
                              SQLQuery_Alb_Pdtes,

                              // name_tabla,
                              'a',

                              1, // No ver bajas

                              // SELECT_SQL,
                              'SELECT a.*,' + ' ' +

                                     'trp.nombre_propietario AS OT_descripcion_transportista,' + ' ' +
                                     'trp.Tfno_Fijo_1 AS OT_tfno_1_transportista,' + ' ' +
                                     'trp.Movil AS OT_Movil_transportista,' + ' ' +

                                     'env_pb.descripcion AS OT_Envio_descripcion_poblacion,' + ' ' +
                                     'env_pr.descripcion AS OT_Envio_descripcion_provincia,' + ' ' +
                                     'env_ps.descripcion AS OT_Envio_descripcion_pais,' + ' ' +

                                     'rp.nombre_propietario AS OT_descripcion_representante,' + ' ' +
                                     'rp.Tfno_Fijo_1 AS OT_tfno_1_representante,' + ' ' +
                                     'rp.Movil AS OT_Movil_representante,' + ' ' +

                                     'tfs.descripcion AS OT_descripcion_tarifa,' + ' ' +

                                     'pb.descripcion AS OT_descripcion_poblacion,' + ' ' +
                                     'pr.descripcion AS OT_descripcion_provincia,' + ' ' +
                                     'ps.descripcion AS OT_descripcion_pais,' + ' ' +

                                     'ct_pb.descripcion AS OT_Cta_Bco_descripcion_poblacion,' + ' ' +
                                     'ct_pr.descripcion AS OT_Cta_Bco_descripcion_provincia,' + ' ' +
                                     'ct_ps.descripcion AS OT_Cta_Bco_descripcion_pais,' + ' ' +

                                     'alm.descripcion AS OT_descripcion_almacen,' + ' ' +
                                     'vh.matricula AS OT_vehiculo_matricula,' + ' ' +

                                     'e.nombre_comercial AS OT_descripcion_empresa,' + ' ' +
                                     'c.nombre_propietario AS OT_descripcion_cliente,' + ' ' +

                                     'fp.descripcion AS OT_descripcion_forma_pago' + ' ' +

                              'FROM albaranes_ventas AS a' + ' ' +

                              'LEFT JOIN proveedores AS trp' + ' ' +
                              'ON a.agencias_transporte_id_proveedores = trp.id' + ' ' +

                              'LEFT JOIN poblaciones AS env_pb' + ' ' +
                              'ON a.Envio_id_poblaciones = env_pb.id' + ' ' +

                              'LEFT JOIN provincias AS env_pr' + ' ' +
                              'ON a.Envio_id_provincias = env_pr.id' + ' ' +

                              'LEFT JOIN paises AS env_ps' + ' ' +
                              'ON a.Envio_id_paises = env_ps.id' + ' ' +

                              'LEFT JOIN representantes AS rp' + ' ' +
                              'ON a.id_representantes = rp.id' + ' ' +

                              'LEFT JOIN tarifas AS tfs' + ' ' +
                              'ON a.id_tarifas = tfs.id' + ' ' +

                              'LEFT JOIN poblaciones AS pb' + ' ' +
                              'ON a.id_poblaciones = pb.id' + ' ' +

                              'LEFT JOIN provincias AS pr' + ' ' +
                              'ON a.id_provincias = pr.id' + ' ' +

                              'LEFT JOIN paises AS ps' + ' ' +
                              'ON a.id_paises = ps.id' + ' ' +

                              'LEFT JOIN poblaciones AS ct_pb' + ' ' +
                              'ON a.Cta_Bco_id_poblaciones = ct_pb.id' + ' ' +

                              'LEFT JOIN provincias AS ct_pr' + ' ' +
                              'ON a.Cta_Bco_id_provincias = ct_pr.id' + ' ' +

                              'LEFT JOIN paises AS ct_ps' + ' ' +
                              'ON a.Cta_Bco_id_paises = ct_ps.id' + ' ' +

                              'LEFT JOIN almacenes AS alm' + ' ' +
                              'ON a.id_almacenes = alm.id' + ' ' +

                              'LEFT JOIN vehiculos AS vh' + ' ' +
                              'ON a.id_vehiculos = vh.id' + ' ' +

                              'LEFT JOIN empresas AS e' + ' ' +
                              'ON a.id_empresas = e.id' + ' ' +

                              'LEFT JOIN clientes AS c' + ' ' +
                              'ON a.id_clientes = c.id' + ' ' +

                              'LEFT JOIN formas_pago AS fp' + ' ' +
                              'ON a.id_formas_pago = fp.id' + ' ',

                              param_Memo_Filtros,
                              param_Memo_OrderBy,
                              var_a_Filtrar,

                              param_Cambiamos_Filtro );

    var_a_Filtrar.Free;

    //Filtrar_tablas_ligadas;
    var_SQL_ADD.Free;
end;

function Tform_facturas_ventas_000.Filtrar_Lineas_Detalles_Alb_Pdtes( param_ver_bajas : ShortInt;
                                                                      param_Cambiamos_Filtro : Boolean;
                                                                      param_Lineas_Filtro,
                                                                      param_Lineas_OrderBy : TStrings ) : ShortInt;
var
  var_a_Filtrar_Plus : TStrings;
begin
  var_a_Filtrar_Plus := TStringList.Create;
  var_a_Filtrar_Plus.Clear;

  if Trim(param_Lineas_OrderBy.Text) = '' then
  begin
    param_Lineas_OrderBy.Text := public_Order_By_Lineas_Detalles_Alb_Pdtes[0].Memo_OrderBy;
  end;

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  Result := UTI_TB_Filtrar( public_Order_By_Lineas_Detalles_Alb_Pdtes,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Alb_Pdtes_Detalles,
                                                         'albaranes_ventas_detalles',
                                                         'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Alb_Pdtes_Detalles,
                                                         'albaranes_ventas_detalles',
                                                         'i' ),

                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_facturas_ventas.SQLTransaction_Alb_Pdtes_D,
                            DataModule_facturas_ventas.SQLConnector_Alb_Pdtes_D,
                            SQLQuery_Alb_Pdtes_Detalles,

                            // name_tabla,
                            'ad',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT ad.*,' + ' ' +

                                   'cl.nombre_propietario AS OT_Cliente_nombre_propietario,' + ' ' +
                                   'cl.nombre_comercial AS OT_Cliente_nombre_comercial,' + ' ' +

                                   'albv.id_almacenes AS OT_id_almacenes_Cabecera,' + ' ' +
                                   'albv.id_vehiculos AS OT_id_vehiculos_Cabecera,' + ' ' +
                                   'albv.Serie_Albaran AS OT_Serie_Albaran,' + ' ' +
                                   'albv.Numero_Albaran AS OT_Numero_Albaran,' + ' ' +

                                   'al.descripcion AS OT_descripcion_almacen,' + ' ' +

                                   'a.descripcion_para_TPV AS OT_descripcion_articulo,' + ' ' +
                                   'a.Tipo_de_articulo AS OT_Tipo_de_articulo,' + ' ' +

                                   'i.descripcion AS OT_descripcion_impuesto,' + ' ' +
                                   'i.Tanto_Por_Ciento AS OT_Tanto_Por_Ciento,' + ' ' +
                                   'i.Sumado_A_Ftra_SN AS OT_Sumado_A_Ftra_SN' + ' ' +

                            'FROM albaranes_ventas_detalles AS ad' + ' ' +

                            'LEFT JOIN albaranes_ventas AS av' + ' ' +
                            'ON ad.id_albaranes = av.id' + ' ' +

                            'LEFT JOIN almacenes AS al' + ' ' +
                            'ON ad.id_almacenes = al.id' + ' ' +

                            'LEFT JOIN articulos AS a' + ' ' +
                            'ON ad.id_articulos = a.id' + ' ' +

                            'LEFT JOIN impuestos AS i' + ' ' +
                            'ON ad.id_impuestos_Ventas = i.id' + ' ' +

                            'LEFT JOIN clientes AS cl' + ' ' +
                            'ON ad.id_clientes = cl.id' + ' ' +

                            'LEFT JOIN albaranes_ventas AS albv' + ' ' +
                            'ON ad.id_albaranes = albv.id ',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            param_Cambiamos_Filtro );

  var_a_Filtrar_Plus.Free;
end;

procedure Tform_facturas_ventas_000.SQLQuery_Ftra_BorradasCalcFields(DataSet: TDataSet);
begin
    with SQLQuery_Ftra_Borradas do
    begin
        if Trim(FieldByName('Serie_Factura').AsString) <> '' then
        begin
            FieldByName('OT_la_Factura').AsString := Trim(FieldByName('Serie_Factura').AsString) +
                                                     '-' +
                                                     Trim(FieldByName('Numero_Factura').AsString);
        end else begin
            FieldByName('OT_la_Factura').AsString := Trim(FieldByName('Numero_Factura').AsString);
        end;
    end;
end;

procedure Tform_facturas_ventas_000.SQLQuery_Ftra_Detalles_StockCalcFields(DataSet: TDataSet);
var var_Stock    : Extended;
    var_Unidades : Extended;
begin
    With SQLQuery_Ftra_Detalles_Stock do
    begin
        // ***************************************************************************************** //
        // ** Vamos a calcular el resultado del stock ... pero tengo que llevar cuidado con el    ** //
        // ** valor de la variable private_Estaba_Borrada_la_Ftra                                 ** //
        // ***************************************************************************************** //
        var_Stock := 0;
        if not FieldByName('Stock').IsNull then
        begin
            var_Stock := FieldByName('Stock').Value;
        end;

        var_Unidades := 0;
        if not FieldByName('Stock').IsNull then
        begin
            var_Unidades := FieldByName('unidades').Value;
        end;

        if private_Estaba_Borrada_la_Ftra = true then
        begin
            // ************************************************************************************* //
            // ** El registro estaba borrado, VAMOS A DAR DE ALTA FACTURA O ALBARAN
            // ************************************************************************************* //
            // ** Como se trata de dar de alta(pues estaba borrada) lo que hará en realidad sería ** //
            // ** disminuir el stock.                                                             ** //
            // ** Entonces el valor del stock (var_Stock) le restamos el valor de las unidades    ** //
            // ** (var_Unidades)                                                                  ** //
            // **                                                                                 ** //
            // ** var_Stock_Como_Queda := var_Stock - var_Unidades                                ** //
            // **                                                                                 ** //
            // ** Pero si el valor de var_Unidades es negativo entonces quedaría así              ** //
            // ** var_Stock_Como_Queda := var_Stock - (- var_Unidades) Por lo que sería una suma  ** //
            // **                                                                                 ** //
            // ** Así que en realidad lo que tengo que comprobar es como se va a quedar           ** //
            // ** var_Stock_Como_Queda después                                                    ** //
            // ** y esto nos dirá si hay que avisar ... Porque si es un valor negativo pues canta ** //
            // ** como que no se podría hacer ... el stock no puede quedar negativo               ** //
            // ************************************************************************************* //
            FieldByName('OT_Stock_Resultado').Value := var_Stock - var_Unidades;
        end else begin
            // ************************************************************************************* //
            // ** El registro NO estaba borrado, VAMOS A BORRAR FACTURA O ALBARAN                 ** //
            // ************************************************************************************* //
            // ** Como se trata de borrar lo que hará en realidad sería aumentar el stock         ** //
            // ** Entonces al valor del stock (var_Stock) le sumamos el valor de las unidades     ** //
            // ** (var_Unidades)                                                                  ** //
            // **                                                                                 ** //
            // ** var_Stock_Como_Queda := var_Stock + var_Unidades                                ** //
            // **                                                                                 ** //
            // ** Pero si el valor de var_Unidades es negativo entonces quedaría así              ** //
            // ** var_Stock_Como_Queda := var_Stock + (- var_Unidades) Por lo que sería una resta ** //
            // **                                                                                 ** //
            // ** Así que en realidad lo que tengo que comprobar es como se va a quedar           ** //
            // ** var_Stock_Como_Queda después
            // ** y esto nos dirá si hay que avisar ... Porque si es un valor negativo pues canta ** //
            // como que no se podría hacer ... el stock no puede quedar negativo                  ** //
            // ************************************************************************************* //
            FieldByName('OT_Stock_Resultado').Value := var_Stock + var_Unidades;
        end;
    end;
end;

function Tform_facturas_ventas_000.Hay_Posible_Stock_Negativo : Boolean;
begin
    Result := false;

    With SQLQuery_Ftra_Detalles_Stock do
    begin
        if RecordCount > 0 then
        begin
    	    First;

    	    While not Eof do
    	    begin
    	        if FieldByName('OT_Stock_Resultado').Value < 0 then
    	        begin
    		    Result := true;
    		    Break;
    	        end;

                Next;
    	    end;
        end;
    end;
end;

procedure Tform_facturas_ventas_000.Filtrar_tablas_ligadas_Alb_Pdtes;
var
  var_Lineas_Filtro  : TStrings;
  var_Lineas_OrderBy : TStrings;
  var_SQL_ADD        : TStrings;
begin
    var_SQL_ADD := TStringList.Create;

    if SQLQuery_Alb_Pdtes.RecordCount = 0 then Exit;

    if SQLQuery_Alb_Pdtes.State = dsInsert then
    begin
        Cerramos_Tablas_Ligadas_Alb_Pdtes;
        Exit;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    // ********************************************************************************************* //
    // ** LINEAS DETALLE                                                                          ** //
    // ********************************************************************************************* //
    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'ad.id_albaranes = ' + SQLQuery_Alb_Pdtes.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_Lineas_OrderBy.Clear;
    Filtrar_Lineas_Detalles_Alb_Pdtes( 1, // No ver bajas
                                       false,
                                       var_Lineas_Filtro,
                                       var_Lineas_OrderBy );

    // ********************************************************************************************* //
    // ** BORRAMOS DE MEMORIA EL RESTO DE COSAS A NO UTILIZAR YA                                  ** //
    // ********************************************************************************************* //
    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;
    var_SQL_ADD.Free;
end;

procedure Tform_facturas_ventas_000.Refrescar_Registros_Alb_Pdtes;
var var_Serie  : ShortString;
    var_Numero : Int64;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_Serie  := '';
    var_Numero := 0;

    with SQLQuery_Alb_Pdtes do
    begin
        if RecordCount > 0 then
        begin
            var_Serie  := FieldByName('Serie_Albaran').Value;
            var_Numero := FieldByName('Numero_Albaran').Value;
        end;
    end;

    form_facturas_ventas_005.Filtrar_Principal_Sin_Preguntar;

    if Trim(var_Serie) <> '' then
    begin
         SQLQuery_Alb_Pdtes.Locate( 'Serie_Albaran;Numero_Albaran',
                                    VarArrayOf( [ var_Serie, var_Numero ] ),
                                    [] );
    end;
end;

procedure Tform_facturas_ventas_000.BitBtn_CopiarClick(Sender: TObject);
begin
    Copiar_Ftra_Cabecera;
end;

procedure Tform_facturas_ventas_000.Copiar_Ftra_Cabecera;
var
  var_msg            : TStrings;
  var_id             : ShortString;
  var_Fecha_New_Ftra : String;
  var_Lineas_Filtro  : TStrings;
  var_Lineas_OrderBy : TStrings;
  var_SQL_ADD        : TStrings;
begin
    var_SQL_ADD := TStringList.Create;

    with SQLQuery_Ftra do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
        begin
            var_id := FieldByName('id').AsString;

            if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
            begin
                if UTI_RGTRO_isLock( 'facturas_ventas',
                                     var_id,
                                     true ) = true then
                begin
                    Exit;
                end else begin
                    if UTI_RGTRO_Lock( 'facturas_ventas',
                                       var_id ) = true then
                         Edit
                    else Exit;
                end;

                // ********************************************************************************* //
                // ** Continuamos                                                                 ** //
                // ********************************************************************************* //
                Application.CreateForm(Tform_facturas_ventas_001, form_facturas_ventas_001);

                form_facturas_ventas_001.RadioGroup_Bajas.ItemIndex := RadioGroup_Bajas.ItemIndex;
                form_facturas_ventas_001.public_Menu_Worked         := public_Menu_Worked;

                form_facturas_ventas_001.public_vamos_a_Copiar := true;

                form_facturas_ventas_001.para_Empezar;
                form_facturas_ventas_001.Panel_Fecha_Nueva_Ftra.Visible := true;

                form_facturas_ventas_001.ShowModal;
                if form_facturas_ventas_001.public_Pulso_Aceptar = true then
                begin
                    Cancel;
                    var_Fecha_New_Ftra := DateToStr(form_facturas_ventas_001.DateTimePicker_Fecha_Ftra_Nueva.Date);
                    form_facturas_ventas_001.Free;

                    Copiar_Ftra_Cabecera_2(var_Fecha_New_Ftra);

                    // ***************************************************************************** //
                    // ** Ahora editaremos la factura recien creada, pero primero filtraremos sus ** //
                    // ** lineas de detalle                                                       ** //
                    // ***************************************************************************** //
                    var_Lineas_Filtro  := TStringList.Create;
                    var_Lineas_OrderBy := TStringList.Create;

                    var_SQL_ADD.Clear;
                    var_SQL_ADD.Add( 'fd.id_facturas = ' + SQLQuery_Ftra.FieldByName('id').AsString );
                    UTI_TB_SQL_ADD( true,
                                    var_Lineas_Filtro,
                                    var_SQL_ADD );

                    var_Lineas_OrderBy.Clear;
                    Filtrar_Lineas_Detalles( RadioGroup_Bajas.ItemIndex,
                                             false,
                                             var_Lineas_Filtro,
                                             var_Lineas_OrderBy );
                    var_Lineas_Filtro.Free;
                    var_Lineas_OrderBy.Free;

                    Editar_Registro;
                end else begin
                    form_facturas_ventas_001.Free;
                    Cancel;
                end;


                UTI_RGTRO_UnLock( 'facturas_ventas', var_id );
            end;
        end else begin
            var_msg.Add(rs_no_Hay_Rgtros);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        end;
    end;

    var_msg.Free;
    var_SQL_ADD.Free;
end;

procedure Tform_facturas_ventas_000.Copiar_Ftra_Cabecera_2(param_Fecha_Ftra_Nueva : String);
var var_SQLTransaction   : TSQLTransaction;
    var_SQLConnector     : TSQLConnector;
    var_SQLQuery         : TSQLQuery;
    var_msg              : TStrings;
begin
    try
        // ***************************************************************************************** //
        // ** Creamos la Transaccion y la conexión con el motor BD, y la abrimos                  ** //
        // ***************************************************************************************** //
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);
        var_SQLQuery       := TSQLQuery.Create(nil);

        Traer_facturas_ventas_xID( SQLQuery_Ftra.FieldByName('id').AsString,
                                   var_SQLTransaction,
                                   var_SQLConnector,
                                   var_SQLQuery );

        // ********************************************************************************************* //
        // ** Hacemos las comprobaciones que nos hagan falta de la SQL que hemos hecho                ** //
        // ********************************************************************************************* //
        // ** Result = 0 aclarara que no existe el registro buscado por su id                         ** //
        // ********************************************************************************************* //
        var_msg := TStringList.Create;

        if var_SQLQuery.RecordCount = 0 then
        begin
            var_msg.Add('Parece que no existe la factura elegida para ser copiada. Asi que no sigo con el proceso de copia de la misma.');
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        end else begin
            // ************************************************************************************* //
            // ** Como la factura se ha encontrado continuamos on el proceso de copiarla en otra  ** //
            // ************************************************************************************* //
            Copiar_Ftra_Cabecera_3( param_Fecha_Ftra_Nueva, var_msg, var_SQLQuery );
        end;

        var_msg.Free;


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
            UTI_GEN_Error_Log( 'Ocurrió un error al intentar copiar la factura elegida.' +
                               '. El error ocurrió desde el módulo ' + Screen.ActiveForm.Name,
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

procedure Tform_facturas_ventas_000.Copiar_Ftra_Cabecera_3( param_Fecha_Ftra_Nueva : String;
                                                            param_msg : TStrings;
                                                            param_SQLQuery : TSQLQuery );
var var_Contador         : ShortInt;
    var_Campo            : String;
    var_Registro_Empresa : TEmpresas;
    var_id_New_Ftra      : String;
begin
    var_Registro_Empresa.id := SQLQuery_Ftra.FieldByName('id_empresas').AsString;

    var_Registro_Empresa    := UTI_VENTAS_Devolver_Numeracion_Factura( param_msg,
                                                                       var_Registro_Empresa,
                                                                       true,   // Para que se desbloquee el registro de empresas.
                                                                       true ); // Para que actualice la empresa con el siguiente albarán.
    if Trim(param_msg.Text) <> '' then
    begin
        // ***************************************************************************************** //
        // ** Hay errores en la búsqueda del próximo NUMERO                                       ** //
        // ***************************************************************************************** //
        UTI_GEN_Aviso(true, param_msg, rs_No_Se_Puede, True, False);
    end else begin
        // ***************************************************************************************** //
        // ** NO HAY errores en la búsqueda del próximo NUMERO, asi que pasare a terminar de crear** //
        // ** la cabecera de la ftra.que va a ser la copia                                        ** //
        // ***************************************************************************************** //
        with SQLQuery_Ftra do
        begin
            Insert;

            FieldByName('Serie_Factura').AsString  := var_Registro_Empresa.Serie_Factura;
            FieldByName('Numero_Factura').AsString := var_Registro_Empresa.Numero_Factura;

            FieldByName('Fecha').AsString          := param_Fecha_Ftra_Nueva;

            FieldByName('Insert_WHEN').Value       := UTI_CN_Fecha_Hora;
            FieldByName('Insert_Id_User').Value    := Form_Menu.public_User;

            // Presentar_Datos_Totales(0);
        end;

        with param_SQLQuery do
        begin
            for var_Contador := 0 to (FieldDefs.Count - 1) do
            begin
                var_Campo := FieldDefs.Items[var_Contador].Name;

                if (var_Campo <> 'id')             and
                   (var_Campo <> 'Fecha')          and
                   (var_Campo <> 'Serie_Factura')  and
                   (var_Campo <> 'Numero_Factura') and
                   (var_Campo <> 'Insert_WHEN')    and
                   (var_Campo <> 'Insert_Id_User') and
                   (var_Campo <> 'Del_WHEN')       and
                   (var_Campo <> 'Del_Id_User')    and
                   (var_Campo <> 'Del_WHY')        and
                   (var_Campo <> 'Change_WHEN')    and
                   (var_Campo <> 'Change_Id_User') then
                begin
                    if not FieldByName(var_Campo).IsNull then
                    begin
                        SQLQuery_Ftra.FieldByName(var_Campo).AsString := FieldByName(var_Campo).AsString;
                    end;
                end;
            end;
        end;

        // ***************************************************************************************** //
        // ** Quitamos los filtros antes de grabar la factura para que luego la encuentre, pero   ** //
        // ** solo quitamos aquellos filtros que no estorben para encontrarla                     ** //
        // ***************************************************************************************** //
        Edit_Factura_Serie.Text   := '';
        Edit_Factura_Numero.Text  := '';

        DateTimePicker_Desde.Date := DateTimePicker_No_Borrarlo.Date;
        DateTimePicker_Hasta.Date := DateTimePicker_No_Borrarlo.Date;

        // ***************************************************************************************** //
        // ** Pasamos a grabar definitivamente el regstro de cabecera de la factura donde copiamos** //
        // ** la factura elegida                                                                  ** //
        // ***************************************************************************************** //
        UTI_RGTRO_Grabar_Antes( 'facturas_ventas', SQLQuery_Ftra );

        // ***************************************************************************************** //
        // ** Ahora pasare a crear el detalle de la factura que va a ser la coopia                ** //
        // ***************************************************************************************** //
        var_id_New_Ftra := UTI_VENTAS_Devolver_id_factura( var_Registro_Empresa.Serie_Factura,
                                                           var_Registro_Empresa.Numero_Factura );
        if var_id_New_Ftra <> '0' then
        begin
            Copiar_Ftra_Detalles( param_msg,
                                  param_SQLQuery.FieldByName('id').AsString,
                                  var_id_New_Ftra );
        end;
    end;
end;

procedure Tform_facturas_ventas_000.Copiar_Ftra_Detalles( param_msg : TStrings;
                                                          param_id_Ftra_Origen,
                                                          param_id_Ftra_Destino : String );
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
        var_SQLQuery       := TSQLQuery.Create(nil);

        Traer_facturas_ventas_detalles_xid_Ftra( param_id_Ftra_Origen,
                                                 var_SQLTransaction,
                                                 var_SQLConnector,
                                                 var_SQLQuery );

        // ********************************************************************************************* //
        // ** Hacemos las comprobaciones que nos hagan falta de la SQL que hemos hecho                ** //
        // ********************************************************************************************* //
        // ** Result = 0 aclarara que no existe el registro buscado por su id                         ** //
        // ********************************************************************************************* //
        if var_SQLQuery.RecordCount = 0 then
        begin
            param_msg.Add( 'Parece que no existen líneas de detalle para la factura elegida para ' +
                           'ser copiada. Asi que no sigo con el proceso de copiar sus líneas en ' +
                           'otra factura.' );

            UTI_GEN_Aviso(true, param_msg, rs_No_Se_Puede, True, False);
        end else begin
            // ************************************************************************************* //
            // ** Como la factura se ha encontrado continuamos on el proceso de copiarla en otra  ** //
            // ************************************************************************************* //
            Copiar_Ftra_Detalles_2( param_msg,
                                    param_id_Ftra_Destino,
                                    var_SQLQuery );
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
            UTI_GEN_Error_Log( 'Ocurrió un error al intentar traer todas las líneas de detalle ' +
                               'de la factura origen. La tabla ha sido ' + var_SQLQuery.Name +
                               ' desde el módulo ' + Screen.ActiveForm.Name,
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

procedure Tform_facturas_ventas_000.Copiar_Ftra_Detalles_2( param_msg : TStrings;
                                                            param_id_facturas : String;
                                                            param_SQLQuery : TSQLQuery );
var var_Contador      : ShortInt;
    var_Campo         : String;
    var_Momento       : TDateTime;
    var_Valor_Segundo : TTime;
begin
    var_Valor_Segundo := StrToTime('12:00:02') - StrToTime('12:00:01');
    var_Momento       := UTI_CN_Fecha_Hora;

    // ***************************************************************************************** //
    // ** Vamos a recorrer todas las líneas de detalle de la factura de donde copiamos y las  ** //
    // ** vamos a ir copiando en la nueva factura                                             ** //
    // ***************************************************************************************** //
    with param_SQLQuery do
    begin
        First;

        While not eof do
        begin
            // ************************************************************************************* //
            // ** Empezamos a crear la línea de detalle con los campos que no se van a copiar de  ** //
            // ** la línea original                                                               ** //
            // ************************************************************************************* //
            SQLQuery_Ftra_Detalles.Insert;

            SQLQuery_Ftra_Detalles.FieldByName('id_facturas').AsString := param_id_facturas;

            SQLQuery_Ftra_Detalles.FieldByName('Insert_WHEN').Value    := var_Momento;
            var_Momento                                                := var_Momento + var_Valor_Segundo;

            SQLQuery_Ftra_Detalles.FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

            // ************************************************************************************* //
            // ** Añadiremos el resto de campos que van a ser copiados                            ** //
            // ************************************************************************************* //
            for var_Contador := 0 to (FieldDefs.Count - 1) do
            begin
                var_Campo := FieldDefs.Items[var_Contador].Name;

                if (var_Campo <> 'id')             and
                   (var_Campo <> 'id_facturas')    and
                   (var_Campo <> 'Serie_Albaran')  and
                   (var_Campo <> 'Numero_Albaran') and
                   (var_Campo <> 'Insert_WHEN')    and
                   (var_Campo <> 'Insert_Id_User') and
                   (var_Campo <> 'Del_WHEN')       and
                   (var_Campo <> 'Del_Id_User')    and
                   (var_Campo <> 'Del_WHY')        and
                   (var_Campo <> 'Change_WHEN')    and
                   (var_Campo <> 'Change_Id_User') then
                begin
                    if not FieldByName(var_Campo).IsNull then
                    begin
                        SQLQuery_Ftra_Detalles.FieldByName(var_Campo).AsString := FieldByName(var_Campo).AsString;
                    end;
                end;
            end;

            // ************************************************************************************* //
            // ** Grabamos definitivamente la nueva línea de detalle a la factura donde copiamos  ** //
            // ************************************************************************************* //
            UTI_RGTRO_Grabar_Antes( 'facturas_ventas_detalles', SQLQuery_Ftra_Detalles );

            Next;
        end;

    end;
end;

procedure Tform_facturas_ventas_000.Insertar_Registro;
var var_msg            : TStrings;
    var_opcion_Elegida : ShortInt;
begin
    var_msg := TStringList.Create;

    if UTI_USR_Permiso_SN(public_Menu_Worked, 'A', True) = True then
    begin
        if public_Solo_Ver = True then
        begin
            var_msg.Add(rs_Solo_Visualizar);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        end else begin
            Application.CreateForm(Tform_facturas_ventas_004, form_facturas_ventas_004);
            form_facturas_ventas_004.ShowModal;

            var_opcion_Elegida  := form_facturas_ventas_004.public_opcion_Elegida;

            public_que_va_a_ser := '';
            if form_facturas_ventas_004.RadioButton_Factura.Checked = true then
            begin
                public_que_va_a_ser := 'F';
            end else begin
                public_que_va_a_ser := 'A';
            end;

            form_facturas_ventas_004.Free;


            if var_opcion_Elegida = 1 then
            begin
                // ********************************************************************************* //
                // ** Elegimos crear una factura que estará formada por algún albarán             ** //
                // ********************************************************************************* //
                Insertar_Registro_1( var_msg, '', '', '', '', '', '', '', '', '', '' , '');
            end;

            if var_opcion_Elegida = 2 then
            begin
                // ********************************************************************************* //
                // ** Elegimos crear una factura que no depende de ningún albarán                 ** //
                // ********************************************************************************* //
                Insertar_Registro_2(var_msg);
            end;
        end;
    end;

    var_msg.Free;
end;

procedure Tform_facturas_ventas_000.Insertar_Registro_2(param_msg : TStrings);
var var_Serie    : String;
    var_Numero   : String;
    var_imprimir : Boolean;
begin
    with SQLQuery_Ftra do
    begin
        // ***************************************************************************************** //
        // ** Elegimos crear una factura que no depende de ningún albarán                         ** //
        // ***************************************************************************************** //
        Insert;

        FieldByName('Tipo').AsString := public_que_va_a_ser;

        //Filtrar_tablas_ligadas;

        // ********************************************************************************* //
        // ** Aqui podemos inicializar otros campos                                       ** //
        // ********************************************************************************* //
        // ** Si solo hay una empresa, pues la pone automáticamente. Pero si hay más de 1 ** //
        // ** y ya se eligió una empresa para trabajar habitualmente pues la pone fija    ** //
        // ** para la cabecera, aunque se puede cambiar                                   ** //
        // ********************************************************************************* //
        // ** Si sólo hay un almacén, pues lo pone automáticamente                        ** //
        // ********************************************************************************* //
        UTI_EMPRE_Asignar_Empresa(SQLQuery_Ftra);
        UTI_ALMAC_Asignar_almacen(SQLQuery_Ftra);

        Application.CreateForm(Tform_facturas_ventas_001, form_facturas_ventas_001);

        form_facturas_ventas_001.DBGrid_Detalles.Color := clSilver;
        form_facturas_ventas_001.DBGrid_Rcbos.Color    := clSilver;

        form_facturas_ventas_001.RadioGroup_Bajas.ItemIndex := RadioGroup_Bajas.ItemIndex;

        form_facturas_ventas_001.para_Empezar;

        form_facturas_ventas_001.public_imprimir             := false;

        form_facturas_ventas_001.ShowModal;
        if form_facturas_ventas_001.public_Pulso_Aceptar = true then
        begin
            FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
            FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

            var_Serie  := FieldByName('Serie_Factura').AsString;
            var_Numero := FieldByName('Numero_Factura').AsString;

            Presentar_Datos_Totales(0);

            UTI_RGTRO_Grabar_Antes( 'facturas_ventas',
                                    SQLQuery_Ftra );

            var_imprimir := form_facturas_ventas_001.public_imprimir;

            form_facturas_ventas_001.Free;

            if var_imprimir = true then
            begin
                BitBtn_ImprimirClick(nil);
            end;

            if (FieldByName('Serie_Factura').AsString = var_Serie)   and
               (FieldByName('Numero_Factura').AsString = var_Numero) then
            begin
                Editar_Registro;
            end;
        end else begin
            Cancel;
            form_facturas_ventas_001.Free;
        end;
    end;
end;

procedure Tform_facturas_ventas_000.Insertar_Registro_1_2( param_msg : TStrings;
                                                           param_Serie_Factura,
                                                           param_Numero_Factura : String );
var var_Linea              : Integer;
    var_Str                : String;
    var_Numero_Empieza_en  : Integer;
    var_Serie_Albaran      : String;
    var_Numero_Albaran     : String;
begin
    // ********************************************************************* //
    // ** Una vez creada la cabecera de la factura creamos las líneas de  ** //
    // ** detalle y marcamos la cabecera y líneas de detalle de cada alba-** //
    // ** rán como facturado                                              ** //
    // ********************************************************************* //
    for var_Linea := 1 to ListBox_Comprobador.items.Count do
    begin
        ListBox_Comprobador.itemindex := var_Linea - 1;

        var_Str := Trim(ListBox_Comprobador.Items.Strings[ListBox_Comprobador.ItemIndex]);

        var_Numero_Empieza_en := Pos( '{[#NUMERO#]}', var_Str );

        var_Serie_Albaran     := Copy( var_Str,
                                       1,
                                       (var_Numero_Empieza_en - 1) );

        var_Numero_Albaran    := Copy( var_Str,
                                       (var_Numero_Empieza_en + 12),
                                       (Length(var_Str) - (var_Numero_Empieza_en + 11)) );

        // ***************************************************************** //
        // ** Ahora pasamos a crear las líneas de detalle de la factura.  ** //
        // ** Serán una copia de las líneas de detalle de los albaranes   ** //
        // ** elegidos.                                                   ** //
        // ***************************************************************** //
        if Crear_Lineas_Ftra_Desde_Albaranes( var_Serie_Albaran, var_Numero_Albaran,
                                              param_Serie_Factura, param_Numero_Factura ) = true then
        begin
            // ************************************************************* //
            // ** Ahora marcaremos los albaranes en la cabecera y líneas  ** //
            // ** de detalle como que han sido facturados                 ** //
            // ************************************************************* //
            Marcar_Albaranes_Como_Facturados( param_Serie_Factura, param_Numero_Factura );
        end else begin
            param_msg.Clear;
            param_msg.Add( 'No se pudieron crear todas las líneas de detalle ' +
                           ' correspondientes al albarán ' +
                           Trim(var_Serie_Albaran) + '-' +
                           Trim(var_Numero_Albaran) +
                           ' para esta factura' );

            UTI_GEN_Aviso(true, param_msg, 'NO SE PUDO', True, False);
        end;
    end;
end;

function Tform_facturas_ventas_000.Crear_Lineas_Ftra_Desde_Albaranes( param_Serie_Albaran,
                                                                      param_Numero_Albaran,
                                                                      param_Serie_Factura,
                                                                      param_Numero_Factura : String ) : Boolean;
var var_id_facturas : String;
    var_Filtros     : TStrings;
    var_OrderBy     : TStrings;
begin
    Result           := false;

    var_Filtros      := TStringList.Create;
    var_OrderBy      := TStringList.Create;

    var_OrderBy.Text := public_Order_By_Alb_Pdtes[1].Memo_OrderBy;

    var_id_facturas := UTI_VENTAS_Devolver_id_factura( param_Serie_Factura,
                                                       param_Numero_Factura );
    if var_id_facturas <> '0' then
    begin
        Filtrar_Principal_Alb_Pdtes( DateTimePicker_No_Borrarlo,
                                     DateTimePicker_No_Borrarlo,
                                     '',
                                     '',
                                     '',
                                     '',
                                     '',
                                     param_Serie_Albaran,
                                     param_Numero_Albaran,

                                     var_Filtros,
                                     var_OrderBy,

                                     true,
                                     false {param_Cambiamos_Filtro} );

        Crear_Lineas_Ftra_Desde_Albaranes_2( var_id_facturas,
                                             param_Serie_Albaran,
                                             param_Numero_Albaran,
                                             param_Serie_Factura,
                                             param_Numero_Factura );
        Result := true;
    end;

    var_Filtros.Free;
    var_OrderBy.Free;
end;

procedure Tform_facturas_ventas_000.Crear_Lineas_Ftra_Desde_Albaranes_2( param_id_facturas,
                                                                         param_Serie_Albaran,
                                                                         param_Numero_Albaran,
                                                                         param_Serie_Factura,
                                                                         param_Numero_Factura : String );
var var_valor_Segundo : TTime;
    var_Momento       : TDateTime;
begin
    var_Valor_Segundo := StrToTime('12:00:02') - StrToTime('12:00:01');
    var_Momento       := UTI_CN_Fecha_Hora;

    with SQLQuery_Ftra_Detalles do
    begin
        SQLQuery_Alb_Pdtes_Detalles.First;

        While not SQLQuery_Alb_Pdtes_Detalles.Eof do
        begin
            Insert;

            FieldByName('id_facturas').AsString    := param_id_facturas;

            FieldByName('Serie_Albaran').AsString  := param_Serie_Albaran;
            FieldByName('Numero_Albaran').AsString := Trim(param_Numero_Albaran);

            FieldByName('Insert_WHEN').Value       := var_Momento;
            var_Momento                            := var_Momento + var_Valor_Segundo;

            FieldByName('Insert_Id_User').Value    := Form_Menu.public_User;

            // ************************************************************************************* //
            // ** Añadiremos el resto de campos que van a ser copiados                            ** //
            // ************************************************************************************* //
            if not SQLQuery_Alb_Pdtes_Detalles.FieldByName('id_almacenes').IsNull then
            begin
               FieldByName('id_almacenes').AsString := SQLQuery_Alb_Pdtes_Detalles.FieldByName('id_almacenes').AsString;
            end;

            if not SQLQuery_Alb_Pdtes_Detalles.FieldByName('id_clientes').IsNull then
            begin
                FieldByName('id_clientes').AsString := SQLQuery_Alb_Pdtes_Detalles.FieldByName('id_clientes').AsString;
            end;

            if not SQLQuery_Alb_Pdtes_Detalles.FieldByName('CodigoBarras_Referencia').IsNull then
            begin
                FieldByName('CodigoBarras_Referencia').AsString := SQLQuery_Alb_Pdtes_Detalles.FieldByName('CodigoBarras_Referencia').AsString;
            end;

            if not SQLQuery_Alb_Pdtes_Detalles.FieldByName('id_articulos').IsNull then
            begin
                FieldByName('id_articulos').AsString := SQLQuery_Alb_Pdtes_Detalles.FieldByName('id_articulos').AsString;
            end;

            if not SQLQuery_Alb_Pdtes_Detalles.FieldByName('id_impuestos_Ventas').IsNull then
            begin
                FieldByName('id_impuestos_Ventas').AsString := SQLQuery_Alb_Pdtes_Detalles.FieldByName('id_impuestos_Ventas').AsString;
            end;

            if not SQLQuery_Alb_Pdtes_Detalles.FieldByName('Fecha_Movimiento').IsNull then
            begin
                FieldByName('Fecha_Movimiento').AsString := SQLQuery_Alb_Pdtes_Detalles.FieldByName('Fecha_Movimiento').AsString;
            end;

            if not SQLQuery_Alb_Pdtes_Detalles.FieldByName('Unidades').IsNull then
            begin
                FieldByName('Unidades').AsString := SQLQuery_Alb_Pdtes_Detalles.FieldByName('Unidades').AsString;
            end;

            if not SQLQuery_Alb_Pdtes_Detalles.FieldByName('Repetir_Cada').IsNull then
            begin
                FieldByName('Repetir_Cada').AsString := SQLQuery_Alb_Pdtes_Detalles.FieldByName('Repetir_Cada').AsString;
            end;

            if not SQLQuery_Alb_Pdtes_Detalles.FieldByName('descripcion').IsNull then
            begin
                FieldByName('descripcion').AsString := SQLQuery_Alb_Pdtes_Detalles.FieldByName('descripcion').AsString;
            end;

            if not SQLQuery_Alb_Pdtes_Detalles.FieldByName('descripcion_para_TPV').IsNull then
            begin
                FieldByName('descripcion_para_TPV').AsString := SQLQuery_Alb_Pdtes_Detalles.FieldByName('descripcion_para_TPV').AsString;
            end;

            if not SQLQuery_Alb_Pdtes_Detalles.FieldByName('PVP').IsNull then
            begin
                FieldByName('PVP').AsString := SQLQuery_Alb_Pdtes_Detalles.FieldByName('PVP').AsString;
            end;

            if not SQLQuery_Alb_Pdtes_Detalles.FieldByName('Descuento_Comercial_1').IsNull then
            begin
                FieldByName('Descuento_Comercial_1').AsString := SQLQuery_Alb_Pdtes_Detalles.FieldByName('Descuento_Comercial_1').AsString;
            end;

            if not SQLQuery_Alb_Pdtes_Detalles.FieldByName('Descuento_Comercial_2').IsNull then
            begin
                FieldByName('Descuento_Comercial_2').AsString := SQLQuery_Alb_Pdtes_Detalles.FieldByName('Descuento_Comercial_2').AsString;
            end;

            if not SQLQuery_Alb_Pdtes_Detalles.FieldByName('Excluido_su_Cobro_SN').IsNull then
            begin
                FieldByName('Excluido_su_Cobro_SN').AsString := SQLQuery_Alb_Pdtes_Detalles.FieldByName('Excluido_su_Cobro_SN').AsString;
            end;

            if not SQLQuery_Alb_Pdtes_Detalles.FieldByName('Comision_Representante').IsNull then
            begin
                FieldByName('Comision_Representante').AsString := SQLQuery_Alb_Pdtes_Detalles.FieldByName('Comision_Representante').AsString;
            end;

            UTI_RGTRO_Grabar_Antes( 'facturas_ventas_detalles', SQLQuery_Ftra_Detalles );

            SQLQuery_Alb_Pdtes_Detalles.Next;
        end;
    end;
end;

procedure Tform_facturas_ventas_000.Marcar_Albaranes_Como_Facturados( param_Serie_Factura,
                                                                      param_Numero_Factura : String );
begin
    // ********************************************************************************************* //
    // ** Marcamos las líneas de detalle del albarán                                              ** //
    // ********************************************************************************************* //
    with SQLQuery_Alb_Pdtes_Detalles do
    begin
        First;

        While not Eof do
        begin
            Edit;

            FieldByName('Serie_Factura').AsString  := param_Serie_Factura;
            FieldByName('Numero_Factura').AsString := Trim(param_Numero_Factura);

            FieldByName('Change_WHEN').Value       := UTI_CN_Fecha_Hora;
            FieldByName('Change_Id_User').Value    := Form_Menu.public_User;

            UTI_RGTRO_Grabar_Antes( 'albaranes_ventas_detalles', SQLQuery_Alb_Pdtes_Detalles );

            Next;
        end;
    end;

    // ********************************************************************************************* //
    // ** Marcamos la cabecera del albarán                                                        ** //
    // ********************************************************************************************* //
    with SQLQuery_Alb_Pdtes do
    begin
        Edit;

        FieldByName('Serie_Factura').AsString  := param_Serie_Factura;
        FieldByName('Numero_Factura').AsString := Trim(param_Numero_Factura);

        FieldByName('Change_WHEN').Value       := UTI_CN_Fecha_Hora;
        FieldByName('Change_Id_User').Value    := Form_Menu.public_User;

        UTI_RGTRO_Grabar_Antes( 'albaranes_ventas', SQLQuery_Alb_Pdtes );
    end;
end;

function Tform_facturas_ventas_000.Bloquear_Albaranes_a_Facturar : Boolean;
var var_Filtros            : TStrings;
    var_OrderBy            : TStrings;
    var_Linea              : Integer;
    var_Str                : String;
    var_Numero_Empieza_en  : Integer;
    var_Serie_Albaran      : String;
    var_Numero_Albaran     : String;
begin
    Result           := true;

    var_Filtros      := TStringList.Create;
    var_OrderBy      := TStringList.Create;

    var_OrderBy.Text := public_Order_By_Alb_Pdtes[1].Memo_OrderBy;

    for var_Linea := 1 to ListBox_Comprobador.items.Count do
    begin
        ListBox_Comprobador.itemindex := var_Linea - 1;

        var_Str := Trim(ListBox_Comprobador.Items.Strings[ListBox_Comprobador.ItemIndex]);

        var_Numero_Empieza_en := Pos( '{[#NUMERO#]}', var_Str );

        var_Serie_Albaran     := Copy ( var_Str,
                                        1,
                                        (var_Numero_Empieza_en - 1) );

        var_Numero_Albaran    := Copy ( var_Str,
                                        (var_Numero_Empieza_en + 12),
                                        (Length(var_Str) - (var_Numero_Empieza_en + 11)) );

        // ***************************************************************************************** //
        // ** Filtramos la cabecera del albarán que vamos a bloquear. Sus líneas de detalle se van** //
        // ** a filtrar solas pues en el onScroll de la cabecera se lo pedimos                    ** //
        // ***************************************************************************************** //
        Filtrar_Principal_Alb_Pdtes( DateTimePicker_No_Borrarlo,
                                     DateTimePicker_No_Borrarlo,
                                     '',
                                     '',
                                     '',
                                     '',
                                     '',
                                     var_Serie_Albaran,
                                     var_Numero_Albaran,

                                     var_Filtros,
                                     var_OrderBy,

                                     true,
                                     false {param_Cambiamos_Filtro} );

        // ************************************************************************************* //
        // ** Bloqueamos la cabecera del albarán que va a ser facturado.                      ** //
        // ** Si se produce algún error, pues no continuamos con los bloqueos y marcamos como ** //
        // ** que no se pueden facturar                                                       ** //
        // ************************************************************************************* //
        if UTI_RGTRO_isLock( 'albaranes_ventas',
                             SQLQuery_Alb_Pdtes.FieldByName('id').AsString,
                             true ) = true then
        begin
            Result := false;
            Break;
        end else begin
            if UTI_RGTRO_Lock( 'albaranes_ventas',
                               SQLQuery_Alb_Pdtes.FieldByName('id').AsString ) = false then
            begin
                Result := false;
                Break;
            end;
        end;

        // ************************************************************************************* //
        // ** Ahora bloquearemos todas las líneas de detalle del albarán que estamos viendo   ** //
        // ** Si se produce algún error, pues no continuamos con los bloqueos y marcamos como ** //
        // ** que no se pueden facturar                                                       ** //
        // ************************************************************************************* //
        with SQLQuery_Alb_Pdtes_Detalles do
        begin
            First;

            While not eof do
            begin
                if UTI_RGTRO_isLock( 'albaranes_ventas_detalles',
                                     SQLQuery_Alb_Pdtes_Detalles.FieldByName('id').AsString,
                                     true ) = true then
                begin
                    Result := false;
                    Break;
                end else begin
                    if UTI_RGTRO_Lock( 'albaranes_ventas_detalles',
                                       SQLQuery_Alb_Pdtes_Detalles.FieldByName('id').AsString ) = false then
                    begin
                        Result := false;
                        Break;
                    end;
                end;

                Next;
            end;
        end;

        // ************************************************************************************* //
        // ** Si se produjo un error al intentar bloquear alguna línea de detalle, pues Exit ** //
        // ************************************************************************************* //
        if Result = false then
        begin
            Break;
        end;
    end;

    var_Filtros.Free;
    var_OrderBy.Free;
end;

procedure Tform_facturas_ventas_000.Desbloquear_Albaranes_a_Facturar;
var var_Filtros            : TStrings;
    var_OrderBy            : TStrings;
    var_Linea              : Integer;
    var_Str                : String;
    var_Numero_Empieza_en  : Integer;
    var_Serie_Albaran      : String;
    var_Numero_Albaran     : String;
begin
    var_Filtros      := TStringList.Create;
    var_OrderBy      := TStringList.Create;

    var_OrderBy.Text := public_Order_By_Alb_Pdtes[1].Memo_OrderBy;

    for var_Linea := 1 to ListBox_Comprobador.items.Count do
    begin
        ListBox_Comprobador.itemindex := var_Linea - 1;

        var_Str := Trim(ListBox_Comprobador.Items.Strings[ListBox_Comprobador.ItemIndex]);

        var_Numero_Empieza_en := Pos( '{[#NUMERO#]}', var_Str );

        var_Serie_Albaran     := Copy ( var_Str,
                                        1,
                                        (var_Numero_Empieza_en - 1) );

        var_Numero_Albaran    := Copy ( var_Str,
                                        (var_Numero_Empieza_en + 12),
                                        (Length(var_Str) - (var_Numero_Empieza_en + 11)) );

        // ***************************************************************************************** //
        // ** Filtramos la cabecera del albarán que vamos a bloquear. Sus líneas de detalle se van** //
        // ** a filtrar solas pues en el onScroll de la cabecera se lo pedimos                    ** //
        // ***************************************************************************************** //
        Filtrar_Principal_Alb_Pdtes( DateTimePicker_No_Borrarlo,
                                     DateTimePicker_No_Borrarlo,
                                     '',
                                     '',
                                     '',
                                     '',
                                     '',
                                     var_Serie_Albaran,
                                     var_Numero_Albaran,

                                     var_Filtros,
                                     var_OrderBy,

                                     false,
                                     false {param_Cambiamos_Filtro} );

        // ***************************************************************************************** //
        // ** Desbloqueamos la cabecera del albarán que se eligió para ser facturado.             ** //
        // ***************************************************************************************** //
        UTI_RGTRO_UnLock( 'albaranes_ventas',
                          SQLQuery_Alb_Pdtes.FieldByName('id').AsString );

        // ***************************************************************************************** //
        // ** Ahora bloquearemos todas sus líneas de detalle                                      ** //
        // ***************************************************************************************** //
        with SQLQuery_Alb_Pdtes_Detalles do
        begin
            First;

            While not eof do
            begin
                UTI_RGTRO_UnLock( 'albaranes_ventas_detalles',
                                  SQLQuery_Alb_Pdtes_Detalles.FieldByName('id').AsString );
                Next;
            end;
        end;
    end;

    var_Filtros.Free;
    var_OrderBy.Free;
end;

procedure Tform_facturas_ventas_000.SQLQuery_Ftra_DetallesCalcFields(DataSet: TDataSet);
begin
    UTI_LINEAS_Poner_Totales_Linea_Detalle( SQLQuery_Ftra_Detalles );
end;

procedure Tform_facturas_ventas_000.Insertar_Registro_1( param_msg : TStrings;
                                                         param_id_Cliente,
                                                         param_Descripcion_Cliente,
                                                         param_id_Empresas,
                                                         param_Descripcion_Empresa,
                                                         param_id_Almacenes,
                                                         param_Descripcion_Almacen,
                                                         param_id_Vehiculos,
                                                         param_Descripcion_Vehiculo,
                                                         param_Fecha_Albaran,
                                                         param_Serie,
                                                         param_Numero : ShortString );
var var_Pulso_Aceptar : Boolean;
    var_Fecha         : TDate;
    var_msg           : TStrings;
begin
    with SQLQuery_Ftra do
    begin
        ListBox_Comprobador.Clear;

        // ***************************************************************************************** //
        // ** Elegimos crear una factura que estará formada por algún albarán                     ** //
        // ***************************************************************************************** //
        Insert;

        // ********************************************************************************* //
        // ** Aqui podemos inicializar otros campos                                       ** //
        // ********************************************************************************* //
        // ** Si solo hay una empresa, pues la pone automáticamente. Pero si hay más de 1 ** //
        // ** y ya se eligió una empresa para trabajar habitualmente pues la pone fija    ** //
        // ** para la cabecera, aunque se puede cambiar                                   ** //
        // ********************************************************************************* //
        // ** Si sólo hay un almacén, pues lo pone automáticamente                        ** //
        // ********************************************************************************* //
        UTI_EMPRE_Asignar_Empresa(SQLQuery_Ftra);
        UTI_ALMAC_Asignar_almacen(SQLQuery_Ftra);

        FieldByName('Tipo').AsString := public_que_va_a_ser;

        Application.CreateForm(Tform_facturas_ventas_005, form_facturas_ventas_005);

        // ***************************************************************************************** //
        // ** Le pasamos al modulo las variables que le hacen falta                               ** //
        // ***************************************************************************************** //
        if Trim(param_id_Cliente) <> '' then
        begin
            form_facturas_ventas_005.Edit_Descripcion_id_Clientes.Text := Trim(param_Descripcion_Cliente);
            form_facturas_ventas_005.Edit_id_Clientes.Text             := Trim(param_id_Cliente);
            FieldByName('id_clientes').AsString                        := Trim(param_id_Cliente);

            Rellenar_Datos_Cliente_a_Ftra( Trim(param_id_Cliente) );

            form_facturas_ventas_005.Poner_Datos_Representante;
            form_facturas_ventas_005.Presentar_Datos;
        end;

        if Trim(param_id_Empresas) <> '' then
        begin
            form_facturas_ventas_005.Edit_Descripcion_Empresa.Text := Trim(param_Descripcion_Empresa);
            form_facturas_ventas_005.Edit_id_Empresas.Text         := Trim(param_id_Empresas);
            FieldByName('id_empresas').AsString                    := Trim(param_id_Empresas);
        end;

        if Trim(param_id_Almacenes) <> '' then
        begin
            form_facturas_ventas_005.Edit_Descripcion_id_Almacenes.Text := Trim(param_Descripcion_Almacen);
            form_facturas_ventas_005.Edit_id_Almacenes.Text             := Trim(param_id_Almacenes);
            FieldByName('id_almacenes').AsString                        := Trim(param_id_Almacenes);
        end;

        if Trim(param_id_Vehiculos) <> '' then
        begin
            form_facturas_ventas_005.Edit_Descripcion_id_Vehiculos.Text := Trim(param_Descripcion_Vehiculo);
            form_facturas_ventas_005.Edit_id_Vehiculos.Text             := Trim(param_id_Vehiculos);
        end;

        if Trim(param_Fecha_Albaran) <> '' then
        begin
            var_Fecha := StrToDate(Trim(param_Fecha_Albaran));

            if var_Fecha < form_facturas_ventas_005.DateTimePicker_Desde.Date then
            begin
                form_facturas_ventas_005.DateTimePicker_Desde.Date := var_Fecha;
            end;

            if var_Fecha > form_facturas_ventas_005.DateTimePicker_Hasta.Date then
            begin
                form_facturas_ventas_005.DateTimePicker_Hasta.Date := var_Fecha;
            end;

            form_facturas_ventas_005.DateTimePicker_Fecha_Ftra.Date := var_Fecha;
        end;

        // ***************************************************************************************** //
        // ** Filtramos los albaranes                                                             ** //
        // ***************************************************************************************** //
        form_facturas_ventas_005.para_Empezar;

        // ***************************************************************************************** //
        // ** Localizamos el albarán que ha sido solicitado para ser facturado                    ** //
        // ***************************************************************************************** //
        if (Trim(param_Serie) <> '')  and
           (Trim(param_Numero) <> '') then
        begin
            if SQLQuery_Alb_Pdtes.Locate( 'Serie_Albaran;Numero_Albaran',
                                          VarArrayOf( [ param_Serie, StrToInt64(Trim(param_Numero)) ] ),
                                          [] ) then
            begin
                form_facturas_ventas_005.Boton_Add_OneClick(Nil);
            end;

            var_msg := TStringList.Create;
            var_msg.Add('Le he puesto a la factura la misma fecha del albarán, corríjanla si es necesario');
            UTI_GEN_Aviso(false, var_msg, 'AVISAMOS', True, False);
            var_msg.Free;
        end;

        form_facturas_ventas_005.Activamos_o_No;

        form_facturas_ventas_005.ShowModal;
        var_Pulso_Aceptar := form_facturas_ventas_005.public_Pulso_Aceptar;
        form_facturas_ventas_005.Free;

        if var_Pulso_Aceptar = true then
        begin
            Insertar_Registro_1_1(param_msg);
        end else begin
            Cancel;
        end;
    end;
end;

procedure Tform_facturas_ventas_000.Rellenar_Datos_Cliente_a_Ftra( param_id : ShortString );
var var_Rgtro_Cli : TClientes;
    var_msg       : TStrings;
begin
    with form_facturas_ventas_000.SQLQuery_Ftra do
    begin
        var_Rgtro_Cli := Traer_Clientes_xID( Trim(param_id) );

        if var_Rgtro_Cli.id <> '0' then
        begin
            FieldByName('id_clientes').AsString := Trim(param_id);
            if Trim(var_Rgtro_Cli.nombre_propietario) <> '' then
            begin
               FieldByName('OT_descripcion_cliente').AsString := Trim(var_Rgtro_Cli.nombre_propietario);
            end else begin
               FieldByName('OT_descripcion_cliente').AsString := Trim(var_Rgtro_Cli.nombre_comercial);
            end;

            FieldByName('nombre_propietario').AsString                 := var_Rgtro_Cli.nombre_propietario;
            FieldByName('nombre_comercial').AsString                   := var_Rgtro_Cli.nombre_comercial;

            FieldByName('id_poblaciones').AsString                     := var_Rgtro_Cli.id_poblaciones;
            FieldByName('id_provincias').AsString                      := var_Rgtro_Cli.id_provincias;
            FieldByName('id_paises').AsString                          := var_Rgtro_Cli.id_paises;

            FieldByName('OT_descripcion_poblacion').AsString           := var_Rgtro_Cli.OT_descripcion_poblacion;
            FieldByName('OT_descripcion_provincia').AsString           := var_Rgtro_Cli.OT_descripcion_provincia;
            FieldByName('OT_descripcion_pais').AsString                := var_Rgtro_Cli.OT_descripcion_pais;

            FieldByName('id_formas_pago').AsString                     := var_Rgtro_Cli.id_formas_pago;
            FieldByName('OT_descripcion_forma_pago').AsString          := var_Rgtro_Cli.OT_descripcion_forma_pago;

            FieldByName('Cta_Bco_id_poblaciones').AsString             := var_Rgtro_Cli.id_Cta_Bco_poblaciones;
            FieldByName('Cta_Bco_id_provincias').AsString              := var_Rgtro_Cli.id_Cta_Bco_provincias;
            FieldByName('Cta_Bco_id_paises').AsString                  := var_Rgtro_Cli.id_Cta_Bco_pais;
            FieldByName('OT_Cta_Bco_descripcion_poblacion').AsString   := var_Rgtro_Cli.OT_Cta_Bco_descripcion_poblacion;
            FieldByName('OT_Cta_Bco_descripcion_provincia').AsString   := var_Rgtro_Cli.OT_Cta_Bco_descripcion_provincia;
            FieldByName('OT_Cta_Bco_descripcion_pais').AsString        := var_Rgtro_Cli.OT_Cta_Bco_descripcion_pais;

            FieldByName('id_tarifas').AsString                         := var_Rgtro_Cli.id_tarifas;
            FieldByName('OT_descripcion_tarifa').AsString              := var_Rgtro_Cli.OT_descripcion_tarifa;

            FieldByName('agencias_transporte_id_proveedores').AsString := var_Rgtro_Cli.id_Agencias_Transporte;
            FieldByName('OT_descripcion_transportista').AsString       := var_Rgtro_Cli.OT_descripcion_agencia_transporte;

            FieldByName('OT_tfno_1_transportista').AsString            := var_Rgtro_Cli.OT_Tfno_Fijo_1_agencia_transporte;
            FieldByName('OT_Movil_transportista').AsString             := var_Rgtro_Cli.OT_Movil_agencia_transporte;

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
                var_msg.Add( 'El cliente elegido tiene observaciones y las hemos puesto en' +
                             ' las observaciones. Están bajo la lengüeta de' +
                             ' COMENTARIOS / OBSERVACIONES.' );
                UTI_GEN_Aviso(true,  var_msg, 'ATENTO hay OBSERVACIONES', True, False );
                var_msg.Free;
            end;

            FieldByName('id_representantes').AsString := var_Rgtro_Cli.id_Representantes;
            Rellenar_Datos_Representante_a_Ftra(var_Rgtro_Cli.id_Representantes);
        end;
    end;
end;

function Tform_facturas_ventas_000.Traer_Representantes_xID( param_id : ShortString ) : TRepresentantes;
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

procedure Tform_facturas_ventas_000.Rellenar_Datos_Representante_a_Ftra( param_id : ShortString );
var var_Rgtro : TRepresentantes;
begin
    if Trim(param_id) = '' then Exit;

    with form_facturas_ventas_000.SQLQuery_Ftra do
    begin
        var_Rgtro := Traer_Representantes_xID( Trim(param_id) );

        if var_Rgtro.id <> '0' then
        begin
            FieldByName('id_representantes').AsString                := Trim(var_Rgtro.id);
            FieldByName('IVA_Excluido_SN_Representante').AsString    := var_Rgtro.IVA_Excluido_SN;
            FieldByName('IVA_con_Recargo_SN_Representante').AsString := var_Rgtro.IVA_con_Recargo_SN;
            FieldByName('OT_descripcion_representante').AsString     := var_Rgtro.nombre_propietario;
            FieldByName('Comision_Representante').AsString           := var_Rgtro.Comision;
            FieldByName('Retencion_Representante').AsString          := var_Rgtro.Retencion;
            FieldByName('OT_tfno_1_representante').AsString          := var_Rgtro.Tfno_Fijo_1;
            FieldByName('OT_Movil_representante').AsString           := var_Rgtro.Movil;
        end;
    end;
end;

procedure Tform_facturas_ventas_000.Refrescar_Registros_Ftras_Borradas;
var var_Serie  : ShortString;
    var_Numero : Int64;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_Serie  := '';
    var_Numero := 0;

    with SQLQuery_Ftra_Borradas do
    begin
        if RecordCount > 0 then
        begin
            var_Serie  := FieldByName('Serie_Factura').Value;
            var_Numero := FieldByName('Numero_Factura').Value;
        end;
    end;

    Filtrar_Ftras_Borradas( form_facturas_ventas_006.Edit_id_Empresas.Text );

    if Trim(var_Serie) <> '' then
    begin
         SQLQuery_Ftra_Borradas.Locate( 'Serie_Factura;Numero_Factura',
                                        VarArrayOf( [ var_Serie, var_Numero ] ),
                                        [] );
    end;
end;

function Tform_facturas_ventas_000.Filtrar_Ftras_Borradas( param_id_empresas : String ) : ShortInt;
var
  var_a_Filtrar      : TStrings;
  var_Lineas_OrderBy : TStrings;
  var_a_Filtrar_Plus : TStrings;
  var_SQL_ADD        : TStrings;
begin
  var_SQL_ADD        := TStringList.Create;

  var_Lineas_OrderBy := TStringList.Create;
  var_a_Filtrar      := TStringList.Create;
  var_a_Filtrar_Plus := TStringList.Create;

  var_Lineas_OrderBy.Clear;
  var_a_Filtrar.Clear;
  var_a_Filtrar_Plus.Clear;

  // ********************************************************************************************* //
  // ** Buscaremos por la empresa que facturamos                                                ** //
  // ********************************************************************************************* //
  var_SQL_ADD.Clear;
  var_SQL_ADD.Add( 'fb.id_empresas = ' + Trim(param_id_empresas) );
  UTI_TB_SQL_ADD( false,
                  var_a_Filtrar,
                  var_SQL_ADD );

  // ********************************************************************************************* //
  // ** Por el tipo ... Factura o Abono                                                         ** //
  // ********************************************************************************************* //
  if Trim(public_que_va_a_ser) <> '' then
  begin
      var_SQL_ADD.Clear;
      var_SQL_ADD.Add( 'fb.Tipo = ' + UTI_GEN_Comillas(public_que_va_a_ser) );
      UTI_TB_SQL_ADD( false,
                      var_a_Filtrar,
                      var_SQL_ADD );
  end;

  // ********************************************************************************************* //
  // ** Que estén dadas de baja                                                                 ** //
  // ********************************************************************************************* //
  var_SQL_ADD.Clear;
  var_SQL_ADD.Add( 'NOT fb.Del_WHEN IS NULL' );
  UTI_TB_SQL_ADD( false,
                  var_a_Filtrar,
                  var_SQL_ADD );

  // ********************************************************************************************* //
  // ** Le ponemos el ORDER BY                                                                  ** //
  // ********************************************************************************************* //
  var_Lineas_OrderBy.Text := 'fb.id_empresas ASC, fb.Serie_Factura ASC, fb.Numero_Factura ASC';

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  Result := UTI_TB_Filtrar( private_Order_By,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            '',

                            // Insert_SQL,
                            '',

                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_facturas_ventas.SQLTransaction_Ftra_Borradas,
                            DataModule_facturas_ventas.SQLConnector_Ftra_Borradas,
                            SQLQuery_Ftra_Borradas,

                            // name_tabla,
                            'fb',

                            2, // RadioGroup_Bajas.ItemIndex,

                            // SELECT_SQL,
                            'SELECT fb.*,' + ' ' +
                                   'c.nombre_propietario AS OT_descripcion_cliente' + ' ' +
                            'FROM facturas_ventas AS fb' + ' ' +

                            'LEFT JOIN clientes AS c' + ' ' +
                            'ON fb.id_clientes = c.id' + ' ',

                            var_a_Filtrar,
                            var_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            false );

  var_a_Filtrar.Free;
  var_Lineas_OrderBy.Free;
  var_a_Filtrar_Plus.Free;

  Label_Ctdad_Rgtros.Caption := IntToStr(SQLQuery_Ftra.RecordCount);

  //Filtrar_tablas_ligadas;
  var_SQL_ADD.Free;
end;

procedure Tform_facturas_ventas_000.Cerramos_Tabla_Ftras_Borradas;
begin
    if UTI_TB_Cerrar( DataModule_facturas_ventas.SQLConnector_Ftra_Borradas,
                      DataModule_facturas_ventas.SQLTransaction_Ftra_Borradas,
                      SQLQuery_Ftra_Borradas ) = false then UTI_GEN_Salir;
end;

procedure Tform_facturas_ventas_000.Traer_Numero_Ftra( param_msg : TStrings;
                                                       param_id_empresas,
                                                       param_descripcion_empresa : String );
begin
    // ************************************************************************************* //
    // ** Ojito el número sólo se debe de dar si no se hubo ninguna falta de algún campo. ** //
    // ** Por lo que la parte de a continuación debe de estar al final de la comprobación ** //
    // ** de las faltas                                                                   ** //
    // ************************************************************************************* //
    with SQLQuery_Ftra do
    begin
        // ***************************************************************************************** //
        // ** OJITO - Sólo si está creando la CABECERA y no le falta nada, es cuando pasara por   ** //
        // ** aqui para buscar el NUMERO y su SERIE                                               ** //
        // ***************************************************************************************** //
        if (SQLQuery_Ftra.State = dsInsert) and
           (Trim(param_msg.Text) = '')      then
        begin
            if (Trim(FieldByName('Serie_Factura').AsString) = '')  and
               (Trim(FieldByName('Numero_Factura').AsString) = '') then
            begin
                // ********************************************************************************* //
                // ** Comprobamos si hay huecos de facturas / abonos borrados con anterioridad    ** //
                // ********************************************************************************* //
                if Hay_Huecos_de_Ftras( param_id_empresas ) = False then
                begin
                    // ***************************************************************************** //
                    // ** No hay huecos de Facturas / Abonos                                      ** //
                    // ***************************************************************************** //
                    Traer_Numero_Ftra_2(param_msg);
                end else begin
                    // ***************************************************************************** //
                    // ** Hay huecos de Facturas, así que presentamos los huecos para que podamos ** //
                    // ** elegir que hueco ocupar                                                 ** //
                    // ***************************************************************************** //
                    Traer_Numero_Ftra_3( param_msg,
                                         param_id_empresas,
                                         param_descripcion_empresa );
                end;

                Cerramos_Tabla_Ftras_Borradas;
            end;

        end;
    end;
end;

procedure Tform_facturas_ventas_000.Traer_Numero_Ftra_2( param_msg : TStrings );
var var_msg              : TStrings;
    var_Registro_Empresa : TEmpresas;
begin
    with SQLQuery_Ftra do
    begin
        var_msg := TStringList.Create;
        var_Registro_Empresa.id := FieldByName('id_empresas').AsString;

        if public_que_va_a_ser = 'F' then
        begin
            var_Registro_Empresa := UTI_VENTAS_Devolver_Numeracion_Factura( var_msg,
                                                                            var_Registro_Empresa,
                                                                            true,   // Para que se desbloquee el registro de empresas.
                                                                            true ); // Para que actualice la empresa con el siguiente albarán.
        end else begin
            var_Registro_Empresa := UTI_VENTAS_Devolver_Numeracion_Abono( var_msg,
                                                                          var_Registro_Empresa,
                                                                          true,   // Para que se desbloquee el registro de empresas.
                                                                          true ); // Para que actualice la empresa con el siguiente albarán.
        end;

        if Trim(var_msg.Text) <> '' then
        begin
            // ************************************************************************************* //
            // ** Hay errores en la búsqueda del próximo NUMERO                                   ** //
            // ************************************************************************************* //
            param_msg.AddStrings(var_msg);
        end else begin
            // ************************************************************************************* //
            // ** NO HAY errores en la búsqueda del próximo NUMERO, asi que guardamos en la CABE- ** //
            // ** CERA su NUMERO                                                                  ** //
            // ************************************************************************************* //
            if public_que_va_a_ser = 'F' then
            begin
                FieldByName('Serie_Factura').AsString  := var_Registro_Empresa.Serie_Factura;
                FieldByName('Numero_Factura').AsString := var_Registro_Empresa.Numero_Factura;
            end else begin
                FieldByName('Serie_Factura').AsString  := var_Registro_Empresa.Serie_Abono;
                FieldByName('Numero_Factura').AsString := var_Registro_Empresa.Numero_Abono;
            end;
        end;

        var_msg.Free;
    end;
end;

procedure Tform_facturas_ventas_000.Traer_Numero_Ftra_3( param_msg : TStrings;
                                                         param_id_empresas,
                                                         param_descripcion_empresa : String );
var var_Form           : Tform_facturas_ventas_006;
    var_msg            : TStrings;
    var_id             : String;
    var_Serie_Factura  : String;
    var_Numero_Factura : String;
begin
    var_Form := Tform_facturas_ventas_006.Create(nil);

    var_Form.BitBtn_Seleccionar.Visible    := true;

    var_Form.Edit_Descripcion_Empresa.Text := param_descripcion_empresa;
    var_Form.Edit_id_Empresas.Text         := param_id_empresas;

    var_Form.para_Empezar;

    var_Form.ShowModal;

    if var_Form.public_Rgtro_Seleccionado = true then
    begin
        // ***************************************************************************************** //
        // ** Eligió uno de los huecos de factura o abono borrados. Así que tengo que borrarla.   ** //
        // ** Una vez borrada la cabecera y el detalle, asignaremos esta numeración a la nueva.   ** //
        // ***************************************************************************************** //
        with SQLQuery_Ftra_Borradas do
        begin
            var_id             := FieldByName('id').AsString;
            var_Serie_Factura  := FieldByName('Serie_Factura').AsString;
            var_Numero_Factura := FieldByName('Numero_Factura').AsString;
        end;

        if UTI_CONTA_Borrar_Del_Todo_Ftra_Cabecera( 'facturas_ventas', var_id ) = false then
        begin
            param_msg.Add( '* No se pudo borrar la cabecera de la factura borrada.' );
            param_msg.Add( '  Por lo que no podemos elegir esta factura para cubrir su hueco.' );
            param_msg.Add( '  Vuelva a intentarlo.' );
        end else begin
            UTI_CONTA_Borrar_Del_Todo_Ftra_Detalle( 'facturas_ventas_detalles', var_id );

            with SQLQuery_Ftra do
            begin
                FieldByName('Serie_Factura').AsString  := var_Serie_Factura;
                FieldByName('Numero_Factura').AsString := var_Numero_Factura;
            end;
        end;
    end else begin
        // ***************************************************************************************** //
        // ** No eligió uno de los huecos de factura o abono borrados                             ** //
        // ***************************************************************************************** //
        var_msg := TStringList.Create;
        var_msg.Add('Teníamos huecos de facturas o albaranes borrados, pero no eligió ninguno.');
        var_msg.Add(' ');
        var_msg.Add('¿Desea que busquemos cual sería el siguiente número?');

        if UTI_GEN_Aviso(true, var_msg, '¿QUE HACEMOS?', True, True) = true then
        begin
            // ************************************************************************************* //
            // ** Eligió buscar cual sería el próximo número de factura/abono para esta empresa   ** //
            // ************************************************************************************* //
            Traer_Numero_Ftra_2(param_msg);
        end else begin
            // ************************************************************************************* //
            // ** NO eligió buscar cual sería el próximo número de factura/abono                  ** //
            // ************************************************************************************* //
            param_msg.Add( '* No se le ha dado un número de factura/abono todavía.' );
        end;

        var_msg.Free;
    end;

    var_Form.Free;
end;

function Tform_facturas_ventas_000.Hay_Huecos_de_Ftras( param_id_empresas : String ) : Boolean;
begin
    Result := false;
    Filtrar_Ftras_Borradas( param_id_empresas );

    with SQLQuery_Ftra_Borradas do
    begin
         if RecordCount > 0 then
         begin
             First;
             Result := true;
         end;
    end;
end;

procedure Tform_facturas_ventas_000.Insertar_Registro_1_1(param_msg : TStrings);
var var_Creada           : Boolean;
    var_Serie_Factura    : String;
    var_Numero_Factura   : String;
    var_msg              : TStrings;
begin
    with SQLQuery_Ftra do
    begin
        var_Creada := false;

        // ************************************************************************* //
        // ** Solo crearemos la factura si verdaderamente se han elegido albaranes** //
        // ************************************************************************* //
        if ListBox_Comprobador.Items.Count > 0 then
        begin
            // ********************************************************************* //
            // ** Creamos la cabecera de la factura                               ** //
            // ********************************************************************* //
            FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
            FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

            Presentar_Datos_Totales(0);

            if Bloquear_Albaranes_a_Facturar = true then
            begin
                var_msg := TStringList.Create;
                Traer_Numero_Ftra( var_msg,
                                   FieldByName('id_empresas').AsString,
                                   FieldByName('OT_descripcion_empresa').AsString );

                if Trim(var_msg.Text) <> '' then
                begin
                    // ***************************************************************************** //
                    // ** Hay errores en la búsqueda del próximo NUMERO                           ** //
                    // ***************************************************************************** //
                    UTI_GEN_Aviso(true, var_msg, rs_Falta, True, False);

                    var_msg.Clear;
                    var_msg.Add('No se facturaron los albaranes elegidos.');
                    var_msg.Add(' ');
                    var_msg.Add('Vuelva a intentarlo otra vez.');
                    UTI_GEN_Aviso(true, var_msg, rs_Falta, True, False);

                    Cancel;
                end else begin
                    // ***************************************************************************** //
                    // ** NO HAY errores en la búsqueda del próximo NUMERO                        ** //
                    // ** Asi que guardamos en la CABECERA su NUMERO                              ** //
                    // ***************************************************************************** //
                    var_Serie_Factura  := FieldByName('Serie_Factura').AsString;
                    var_Numero_Factura := FieldByName('Numero_Factura').AsString;

                    // ********************************************************************************* //
                    // ** Grabamos la cabecera de la factura                                          ** //
                    // ********************************************************************************* //
                    UTI_RGTRO_Grabar_Antes( 'facturas_ventas', SQLQuery_Ftra );

                    Insertar_Registro_1_2( param_msg,
                                           var_Serie_Factura,
                                           var_Numero_Factura );
                    var_Creada := true;
                end;

                var_msg.Free;
            end else begin
                Cancel;

                param_msg.Clear;
                param_msg.Add( 'No se pudieron bloquear todos los albaranes para esta factura' );

                UTI_GEN_Aviso(true, param_msg, 'NO SE PUDO', True, False);
            end;

            Desbloquear_Albaranes_a_Facturar;

            // ********************************************************************* //
            // ** Ahora cerraremos las tablas de selección de albaranes pendientes** //
            // ** de ser facturados                                               ** //
            // ********************************************************************* //
            Cerramos_Tablas_Alb_Pdtes;

            if var_Creada = true then
            begin
                // ********************************************************************* //
                // ** Ahora editaremos la factura recien creada, pero antes hay que   ** //
                // ** encontrarla                                                     ** //
                // ********************************************************************* //
                Edit_Factura_Serie.Text            := var_Serie_Factura;
                Edit_Factura_Numero.Text           := var_Numero_Factura;

                DateTimePicker_Desde.Date          := DateTimePicker_No_Borrarlo.Date;
                DateTimePicker_Hasta.Date          := DateTimePicker_No_Borrarlo.Date;

                Edit_id_Almacenes.Text             := '';
                Edit_Descripcion_id_Almacenes.Text := '';

                Edit_id_Empresas.Text              := '';
                Edit_Descripcion_Empresa.Text      := '';

                Edit_id_Forma_Pago.Text            := '';
                Edit_Descripcion_Forma_Pago.Text   := '';

                Edit_id_Clientes.Text              := '';
                Edit_Descripcion_id_Clientes.Text  := '';

                BitBtn_FiltrarClick(Nil);

                Editar_Registro;
            end;
        end else begin
            Cancel;
        end;
    end;
end;

procedure Tform_facturas_ventas_000.BitBtn_Ver_Ftras_BorradasClick(Sender: TObject);
var var_msg  : TStrings;
    var_Form : Tform_facturas_ventas_006;
begin
    // ********************************************************************************************* //
    // ** Al poner public_que_va_a_ser = '' conseguimos que nos filtre tanto albaranes como ftras.** //
    // ********************************************************************************************* //
    public_que_va_a_ser := '';

    if Trim(Edit_id_Empresas.Text) = '' then
    begin
        var_msg := TStringList.Create;
        var_msg.Add('* No me ha dicho de que empresa quiere ver las facturas o abonos borrados.');
        UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        var_msg.Free;
    end else begin
        if Hay_Huecos_de_Ftras( Edit_id_Empresas.Text ) = False then
        begin
            // ***************************************************************************************** //
            // ** No hay huecos de Facturas / Abonos                                                  ** //
            // ***************************************************************************************** //
            var_msg := TStringList.Create;
            var_msg.Add('* No existen facturas borradas.');
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;
        end else begin
            // ***************************************************************************************** //
            // ** Hay huecos de Facturas, así que presentamos los huecos para que podamos elegir que  ** //
            // ** hueco ocupar                                                                        ** //
            // ***************************************************************************************** //
            var_Form := Tform_facturas_ventas_006.Create(nil);

            var_Form.BitBtn_Seleccionar.Visible    := false;

            var_Form.Edit_Descripcion_Empresa.Text := Edit_Descripcion_Empresa.Text;
            var_Form.Edit_id_Empresas.Text         := Edit_id_Empresas.Text;

            var_Form.para_Empezar;

            var_Form.ShowModal;
            var_Form.Free;
        end;
    end;
end;

procedure Tform_facturas_ventas_000.Borrar_Registro;
var var_msg      : TStrings;
    var_avisamos : Boolean;
begin
    with SQLQuery_Ftra do
    begin
        var_msg := TStringList.Create;

        // ***************************************************************************************** //
        // ** Si en la configuración de la aplicación no se permite borrar facturas, pues que no  ** //
        // ** lo permita                                                                          ** //
        // ***************************************************************************************** //
        form_Menu.Traer_Configuracion_APP;
        if UpperCase(Trim(form_menu.public_User_Configuracion.Facturas_Permitir_Borrar_SN)) <> 'S' then
        begin
            var_msg.Add( '* En configuración de la aplicación no se permite borrar facturas.' );
        end;

        // ***************************************************************************************** //
        // ** Si la factura ya estaba borrada (lo vamos a dar de alta) y pertenecía al algún alba-** //
        // ** rán, no le vamos a permitir darla de alta porque se rompería la manera de ligar los ** //
        // ** albaranes con las facturas                                                          ** //
        // ***************************************************************************************** //
        var_avisamos := Tiene_lineas_detalle_de_algun_albaran_SN;
        if not FieldByName('Del_WHEN').IsNull then
        begin
            if var_avisamos = true then
            begin
                var_msg.Add( '* Esta factura fué borrada anteriormente, y además tiene líneas de ' +
                             'detalle que pertenecían a albaranes.' +
                             ' Por lo que no puedo darla de alta otra vez, ' +
                             'vaya a dicho albarán y vuelva a traspasarla a facturas.' );
            end;
        end;

        // ***************************************************************************************** //
        // ** Si la factura tiene recibos/pagos creados (cartera), no se puede borrar             ** //
        // ***************************************************************************************** //
        if RecordCount > 0 then
        begin
            if Trim(UTI_LINEAS_Traer_Total_Rcbos( 'C',
                                                  FieldByName('id').AsString)) <> '' then
            begin
                var_msg.Add( '* Esta factura tiene recibos de cartera. ' +
                             'Así que no podemos modificar nada de ella.' );
            end;
        end;

        // ********************************************************************************************* //
        // ** Si la factura fué cerrado su ejercicio, no permitimos hacer nada con ella               ** //
        // ********************************************************************************************* //
        if RecordCount > 0 then
        begin
            if Trim( UTI_CONTA_Esta_cerrada_la_Ftra(FieldByName('id').AsString, 'V') ) <> '0' then
            begin
                var_msg.Add( '* Esta factura está cerrada, así que no podemos modificar nada de ella.' );
            end;
        end;

        // ***************************************************************************************** //
        // ** Presentamos los mensajes de error encontrados.                                      ** //
        // ***************************************************************************************** //
        if Trim(var_msg.Text) <> '' then
        begin
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;

            Exit;
        end;

        var_msg.Free;

        // ***************************************************************************************** //
        // ** Cambiamos el almacén a todas las líneas de detalle para evitar conflictos. Puede que** //
        // ** no se terminara de grabar bien el almacén en todas las líneas de detalle por algún  ** //
        // ** error con el servidor. Esto es con fines de conservar bién el stock de artículos    ** //
        // ***************************************************************************************** //
        if UTI_RGTRO_isLock( 'facturas_ventas',
                             Trim(SQLQuery_Ftra.FieldByName('id').AsString),
                             true ) = true then
        begin
            // ************************************************************************************* //
            // ** Registro bloqueado, no podemos hacer nada con él                                ** //
            // ************************************************************************************* //
            Exit;
        end else begin
            Borrar_Registro_2( var_avisamos, var_msg );
        end;
    end;
end;

procedure Tform_facturas_ventas_000.Borrar_Registro_2( param_avisamos : Boolean;
                                                       param_msg : TStrings );
var var_Serie_Factura  : String;
    var_Numero_Factura : String;
    var_Continuamos    : Boolean;
    var_Form           : Tform_facturas_ventas_003;
begin
    with SQLQuery_Ftra do
    begin
        // ***************************************************************************************** //
        // ** Continuamos con el borrado                                                          ** //
        // ***************************************************************************************** //
        if UTI_USR_Permiso_SN(public_Menu_Worked, 'B', True) = True then
        begin
            if param_avisamos = true then
            begin
                param_msg := TStringList.Create;
                param_msg.Add( 'Esta factura tiene líneas de ' +
                               'detalle que pertenecen a albaranes.' );
                param_msg.Add( 'Si la borramos sus albaranes quedarán como no facturados.' );
                param_msg.Add( ' ' );
                param_msg.Add( '¿Seguro que desea borrarla?' );

                param_avisamos := UTI_GEN_Aviso(true, param_msg, rs_OK, True, True);
                param_msg.Free;

                if param_avisamos = false then Exit;
            end;

            private_Estaba_Borrada_la_Ftra := not FieldByName('Del_WHEN').IsNull;
            var_Continuamos                := true;

            Filtrar_Lineas_Detalles_Agrupadas_Por_Articulo;

            // ************************************************************************************* //
            // ** Estamos intentando dar de ALTA o de BAJA                                        ** //
            // ************************************************************************************* //
            // ** Vamos a ver como se quedaría el stock de cada artículo que necesite control de  ** //
            // ** su stock.                                                                       ** //
            // ************************************************************************************* //
            // ** No podemos permitir dar de ALTA facturas o abonos si no hay suficiente stock    ** //
            // ************************************************************************************* //
            if Hay_Posible_Stock_Negativo = True then
            begin
                // ********************************************************************************* //
                // ** Alguno de los artículos no tiene suficiente stock, así que presentamos los  ** //
                // ** artículos del albarán agrupados por cantidad y destacando cuales son los que** //
                // ** tienen suficiente stock. Es de menester que nos presentará sólo el resumen  ** //
                // ** de aquellos artículos que tuviese que controlarse su stock                  ** //
                // ********************************************************************************* //
                var_Form := Tform_facturas_ventas_003.Create(nil);
                var_Form.para_Empezar;
                var_Form.ShowModal;
                var_Form.Free;

                var_Continuamos := false;
            end;

            if var_Continuamos = true then
            begin
                // ********************************************************************************* //
                // ** Antes de borrar el albarán su cabecera (no se borran las líneas de detalle),** //
                // ** comenzamos a actualizar el stock de cada una de las líneas de detalle (supo-** //
                // ** niendo que fueran artículos donde se controla su stock). Es digno de men-   ** //
                // ** cionar que puede ser un alta de albarán o una baja, por lo que el stock de  ** //
                // ** cada artículo puede aumentar o disminuir.                                   ** //
                // ** Sólo si se consigue actualizar todo el stock pues se borrará o se dará de   ** //
                // ** alta la cabecera del albarán                                                ** //
                // ********************************************************************************* //
                var_Serie_Factura  := FieldByName('Serie_Factura').AsString;
                var_Numero_Factura := FieldByName('Numero_Factura').AsString;

                if UTI_RGTRO_Borrar_Cabecera_y_Detalle( 'id_facturas',
                                                        'facturas_ventas',
                                                        'facturas_ventas_detalles',
                                                        SQLQuery_Ftra,
                                                        SQLQuery_Ftra_Detalles,
                                                        public_Solo_Ver,
                                                        public_Menu_Worked ) = true then
                begin
                    if private_Estaba_Borrada_la_Ftra = false then
                    begin
                        // ********************************************************************* //
                        // ** Como el albarán fué borrado borramos toda marca de provenir de  ** //
                        // ** albaranes                                                       ** //
                        // ********************************************************************* //
                        Borrar_en_Albaranes_la_Factura( var_Serie_Factura, var_Numero_Factura );
                    end;
                end;

            end;
        end;
    end;
end;

procedure Tform_facturas_ventas_000.Refrescar_Registros_Impuestos;
var
  var_Lineas_Filtro  : TStrings;
  var_Lineas_OrderBy : TStrings;
  var_id             : ShortString;
  var_ver_Bajas      : ShortInt;
  var_SQL_ADD        : TStrings;
begin
    var_SQL_ADD := TStringList.Create;

    // ********************************************************************************************* //
    // ** Solo si la cabecera está en modo EDIT se abren las tablas hijas                         ** //
    // ********************************************************************************************* //
    if SQLQuery_Ftra.State <> dsEdit then Exit;

    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_id := '';

    with SQLQuery_Ftra_Impuestos do
    begin
        if RecordCount > 0 then
        begin
            if FieldByName('id').IsNull then
            begin
                var_id := '0';
            end else begin
                var_id := FieldByName('id').AsString;
            end;
        end;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Clear;
    var_Lineas_OrderBy.Clear;

    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'fi.id_facturas = ' + SQLQuery_Ftra.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_ver_Bajas := RadioGroup_Bajas.ItemIndex;
    if UTI_GEN_Form_Abierto_Ya('form_facturas_ventas_001') = true then
    begin
        var_ver_Bajas := form_facturas_ventas_001.RadioGroup_Bajas.ItemIndex;
    end;

    Filtrar_Lineas_Impuestos( var_ver_Bajas,
                              false,
                              var_Lineas_Filtro,
                              var_Lineas_OrderBy );

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;

    if var_id <> '' then
    begin
        if var_id = '0' then
        begin
            // ************************************************************************************* //
            // ** Estabamos en una insercción, así que me voy al último registro, pues el order by** //
            // ** es id_cliente + id del registro                                                 ** //
            // ************************************************************************************* //
            SQLQuery_Ftra_Impuestos.Last;
        end else begin
            // ************************************************************************************* //
            // ** Estabamos en una edición, así que ya conocíamos la id del registro. Por lo que  ** //
            // ** hago el locate por esta id                                                      ** //
            // ************************************************************************************* //
            SQLQuery_Ftra_Impuestos.Locate('id', StrToInt64(var_id), []);
        end;

    end;
    var_SQL_ADD.Free;
end;

function Tform_facturas_ventas_000.Filtrar_Lineas_Impuestos( param_ver_bajas : ShortInt;
                                                             param_Cambiamos_Filtro : Boolean;
                                                             param_Lineas_Filtro,
                                                             param_Lineas_OrderBy : TStrings ) : ShortInt;
var
  var_a_Filtrar_Plus : TStrings;
begin
  var_a_Filtrar_Plus := TStringList.Create;
  var_a_Filtrar_Plus.Clear;

  if Trim(param_Lineas_OrderBy.Text) = '' then
  begin
    param_Lineas_OrderBy.Text := private_Order_By_Lineas_Impuestos[0].Memo_OrderBy;
  end;

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  Result := UTI_TB_Filtrar( private_Order_By_Lineas_Impuestos,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Ftra_Impuestos,
                                                          'facturas_ventas_impuestos',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Ftra_Impuestos,
                                                          'facturas_ventas_impuestos',
                                                          'i' ),
                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_facturas_ventas.SQLTransaction_Ftra_Imptos,
                            DataModule_facturas_ventas.SQLConnector_Ftra_Imptos,
                            SQLQuery_Ftra_Impuestos,

                            // name_tabla,
                            'fi',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT fi.*,' + ' ' +

                                   'impto.descripcion AS OT_descripcion_impuesto,' + ' ' +
                                   'impto.Tanto_Por_Ciento AS OT_Tanto_Por_Ciento' + ' ' +

                            'FROM facturas_ventas_impuestos AS fi' + ' ' +

                            'LEFT JOIN impuestos AS impto' + ' ' +
                            'ON fi.id_impuestos = impto.id',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            param_Cambiamos_Filtro );

  var_a_Filtrar_Plus.Free;
end;

procedure Tform_facturas_ventas_000.Filtrar_tablas_ligadas;
var
  var_Lineas_Filtro  : TStrings;
  var_Lineas_OrderBy : TStrings;
  var_SQL_ADD        : TStrings;
begin
    var_SQL_ADD := TStringList.Create;

    if SQLQuery_Ftra.RecordCount = 0 then Exit;

    if SQLQuery_Ftra.State = dsInsert then
    begin
        Cerramos_Tablas_Ligadas;
        Exit;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    // ********************************************************************************************* //
    // ** LINEAS DETALLE                                                                          ** //
    // ********************************************************************************************* //
    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'fd.id_facturas = ' + SQLQuery_Ftra.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_Lineas_OrderBy.Clear;
    Filtrar_Lineas_Detalles( 1, // RadioGroup_Bajas.ItemIndex,  // asi no se ven las bajas hasta que no lo pida el form de altas/modif de líneas
                             false,
                             var_Lineas_Filtro,
                             var_Lineas_OrderBy );

    // ********************************************************************************************* //
    // ** impuestos                                                                               ** //
    // ********************************************************************************************* //
    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'fi.id_facturas = ' + SQLQuery_Ftra.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_Lineas_OrderBy.Clear;
    Filtrar_Lineas_Impuestos( 1, // RadioGroup_Bajas.ItemIndex,  // asi no se ven las bajas hasta que no lo pida el form de altas/modif de líneas
                              false,
                              var_Lineas_Filtro,
                              var_Lineas_OrderBy );

    // ********************************************************************************************* //
    // ** Recibos                                                                                 ** //
    // ********************************************************************************************* //
    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'fcp.id_facturas = ' + SQLQuery_Ftra.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_Lineas_OrderBy.Clear;
    Filtrar_Recibos( 1, // RadioGroup_Bajas.ItemIndex,  // asi no se ven las bajas hasta que no lo pida el form de altas/modif de líneas
                     false,
                     var_Lineas_Filtro,
                     var_Lineas_OrderBy );

    // ********************************************************************************************* //
    // ** BORRAMOS DE MEMORIA EL RESTO DE COSAS A NO UTILIZAR YA                                  ** //
    // ********************************************************************************************* //
    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;
    var_SQL_ADD.Free;
end;

procedure Tform_facturas_ventas_000.para_Empezar;
begin
    UTI_GEN_Traer_Trimestre( DateTimePicker_Desde,
                             DateTimePicker_Hasta );

    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    if UTI_GEN_Form_Abierto_Ya('DataModule_facturas_ventas') = False then
    begin
        DataModule_facturas_ventas := TDataModule_facturas_ventas.Create(Application);
    end;

    // ********************************************************************************************* //
    // ** Preparamos los diferentes tipos de orden preconfigurados                                ** //
    // ********************************************************************************************* //
    // ** ALUMNOS/CLIENTES                                                                        ** //
    // ********************************************************************************************* //
    SetLength(private_Order_By, 4);

    private_Order_By[0].Titulo       := 'Por fecha';
    private_Order_By[0].Memo_OrderBy := 'f.Fecha ASC, f.Serie_Factura ASC, f.Numero_Factura ASC';

    private_Order_By[1].Titulo       := 'Por el número de factura'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[1].Memo_OrderBy := 'f.Serie_Factura ASC, f.Numero_Factura ASC';

    private_Order_By[2].Titulo       := 'Por empresa';
    private_Order_By[2].Memo_OrderBy := 'f.id_empresas ASC, f.Fecha ASC, f.Serie_Factura ASC, f.Numero_Factura ASC';

    private_Order_By[3].Titulo       := 'Por cliente';
    private_Order_By[3].Memo_OrderBy := 'f.id_clientes ASC, f.Fecha ASC, f.Serie_Factura ASC, f.Numero_Factura ASC';

    Memo_OrderBy.Lines.Text          := private_Order_By[1].Memo_OrderBy;

    UTI_TB_Rellenar_ComboBox_Orden( true,
                                    ComboBox_Filtros,
                                    private_Order_By,
                                    1 );

    // ********************************************************************************************* //
    // ** LINEAS DETALLE                                                                          ** //
    // ********************************************************************************************* //
    SetLength(private_Order_By_Lineas_Detalles, 1);

    private_Order_By_Lineas_Detalles[0].Titulo       := 'Por id de la factura'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_Lineas_Detalles[0].Memo_OrderBy := 'fd.id_facturas ASC, fd.id ASC';

    // ********************************************************************************************* //
    // ** IMPUESTOS                                                                               ** //
    // ********************************************************************************************* //
    SetLength(private_Order_By_Lineas_Impuestos, 1);

    private_Order_By_Lineas_Impuestos[0].Titulo       := 'Por id de la factura'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_Lineas_Impuestos[0].Memo_OrderBy := 'fi.id_facturas ASC, fi.id_impuestos ASC';

    // ********************************************************************************************* //
    // ** RECIBOS                                                                                 ** //
    // ********************************************************************************************* //
    SetLength(private_Order_By_Lineas_Recibos, 1);

    private_Order_By_Lineas_Recibos[0].Titulo       := 'Por id de la factura'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_Lineas_Recibos[0].Memo_OrderBy := 'fcp.id_clientes ASC, fcp.id_facturas ASC, fcp.id ASC';

    // ********************************************************************************************* //
    // ** Filtramos los datos                                                                     ** //
    // ********************************************************************************************* //
    Filtrar_Principal_Sin_Preguntar;

    Presentar_Datos;

    // ********************************************************************************************* //
    // ** SOLO PARA ESTE FORM                                                                     ** //
    // ********************************************************************************************* //
    PageControl_Filtros.ActivePage := TabSheet_Busqueda_Concreta;
end;

function Tform_facturas_ventas_000.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
var
  var_a_Filtrar : TStrings;
  var_SQL_ADD   : TStrings;
begin
    var_SQL_ADD   := TStringList.Create;

    var_a_Filtrar := TStringList.Create;
    var_a_Filtrar.Clear;

    // ********************************************************************************************* //
    // ** AHORA PONDREMOS EL RESTO DE LOS FILTROS QUE NO SON GENERALES                            ** //
    // ********************************************************************************************* //
    // ** Primero buscaremos en la serie                                                          ** //
    // ********************************************************************************************* //
    if Trim(Edit_Factura_Serie.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'f.Serie_Factura = ' + UTI_GEN_Comillas(Trim(Edit_Factura_Serie.Text)) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos en el NUMERO                                                           ** //
    // ********************************************************************************************* //
    if Trim(Edit_Factura_Numero.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'f.Numero_Factura = ' + UTI_GEN_Comillas(Trim(Edit_Factura_Numero.Text)) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la FECHA                                                           ** //
    // ********************************************************************************************* //
     if (not DateTimePicker_Hasta.DateIsNull) and
        (not DateTimePicker_Desde.DateIsNull) then
     begin
         var_SQL_ADD.Clear;
         var_SQL_ADD.Add( 'f.Fecha <= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Hasta.Date, false) + ' 23:59:59' ) );
         UTI_TB_SQL_ADD( false,
                         var_a_Filtrar,
                         var_SQL_ADD );

         var_SQL_ADD.Clear;
         var_SQL_ADD.Add( 'f.Fecha >= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Desde.Date, false) + ' 00:00:00' ) );
         UTI_TB_SQL_ADD( false,
                         var_a_Filtrar,
                         var_SQL_ADD );
     end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por el almacén                                                         ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Almacenes.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'f.id_Almacenes = ' + Trim(Edit_id_Almacenes.Text) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la empresa                                                         ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Empresas.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'f.id_empresas = ' + Trim(Edit_id_Empresas.Text) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la forma de pago                                                   ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Forma_Pago.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'f.id_formas_pago = ' + Trim(Edit_id_Forma_Pago.Text) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la id del cliente                                                  ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Clientes.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'f.id_clientes = ' + Trim(Edit_id_Clientes.Text) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Vemos abonos, facturas o todo                                                           ** //
    // ********************************************************************************************* //
    if RadioButton_Facturas_Solo.Checked = true then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'f.Tipo = ' + UTI_GEN_Comillas('F') );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    if RadioButton_Abonos_Solo.Checked = true then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'f.Tipo = ' + UTI_GEN_Comillas('A') );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
      y que por lo se debe de permitir modificarlos en ningún módulo }

    Result := UTI_TB_Filtrar( private_Order_By,

                              // Delete_SQL,
                              '',

                              // Update_SQL,
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Ftra,
                                                            'facturas_ventas',
                                                            'u' ),

                              // Insert_SQL,
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Ftra,
                                                            'facturas_ventas',
                                                            'i' ),
                              // var_ctdad_Rgtros,
                              -1,

                              DataModule_facturas_ventas.SQLTransaction_Ftra,
                              DataModule_facturas_ventas.SQLConnector_Ftra,
                              SQLQuery_Ftra,

                              // name_tabla,
                              'f',

                              RadioGroup_Bajas.ItemIndex,

                              // SELECT_SQL,
                              'SELECT f.*,' + ' ' +

                                     'trp.nombre_propietario AS OT_descripcion_transportista,' + ' ' +
                                     'trp.Tfno_Fijo_1 AS OT_tfno_1_transportista,' + ' ' +
                                     'trp.Movil AS OT_Movil_transportista,' + ' ' +

                                     'env_pb.descripcion AS OT_Envio_descripcion_poblacion,' + ' ' +
                                     'env_pr.descripcion AS OT_Envio_descripcion_provincia,' + ' ' +
                                     'env_ps.descripcion AS OT_Envio_descripcion_pais,' + ' ' +

                                     'rp.nombre_propietario AS OT_descripcion_representante,' + ' ' +
                                     'rp.Tfno_Fijo_1 AS OT_tfno_1_representante,' + ' ' +
                                     'rp.Movil AS OT_Movil_representante,' + ' ' +

                                     'tfs.descripcion AS OT_descripcion_tarifa,' + ' ' +

                                     'pb.descripcion AS OT_descripcion_poblacion,' + ' ' +
                                     'pr.descripcion AS OT_descripcion_provincia,' + ' ' +
                                     'ps.descripcion AS OT_descripcion_pais,' + ' ' +

                                     'ct_pb.descripcion AS OT_Cta_Bco_descripcion_poblacion,' + ' ' +
                                     'ct_pr.descripcion AS OT_Cta_Bco_descripcion_provincia,' + ' ' +
                                     'ct_ps.descripcion AS OT_Cta_Bco_descripcion_pais,' + ' ' +

                                     'alm.descripcion AS OT_descripcion_almacen,' + ' ' +

                                     'e.nombre_comercial AS OT_descripcion_empresa,' + ' ' +
                                     'c.nombre_propietario AS OT_descripcion_cliente,' + ' ' +

                                     'fp.descripcion AS OT_descripcion_forma_pago' + ' ' +

                              'FROM facturas_ventas AS f' + ' ' +

                              'LEFT JOIN proveedores AS trp' + ' ' +
                              'ON f.agencias_transporte_id_proveedores = trp.id' + ' ' +

                              'LEFT JOIN poblaciones AS env_pb' + ' ' +
                              'ON f.Envio_id_poblaciones = env_pb.id' + ' ' +

                              'LEFT JOIN provincias AS env_pr' + ' ' +
                              'ON f.Envio_id_provincias = env_pr.id' + ' ' +

                              'LEFT JOIN paises AS env_ps' + ' ' +
                              'ON f.Envio_id_paises = env_ps.id' + ' ' +

                              'LEFT JOIN representantes AS rp' + ' ' +
                              'ON f.id_representantes = rp.id' + ' ' +

                              'LEFT JOIN tarifas AS tfs' + ' ' +
                              'ON f.id_tarifas = tfs.id' + ' ' +

                              'LEFT JOIN poblaciones AS pb' + ' ' +
                              'ON f.id_poblaciones = pb.id' + ' ' +

                              'LEFT JOIN provincias AS pr' + ' ' +
                              'ON f.id_provincias = pr.id' + ' ' +

                              'LEFT JOIN paises AS ps' + ' ' +
                              'ON f.id_paises = ps.id' + ' ' +

                              'LEFT JOIN poblaciones AS ct_pb' + ' ' +
                              'ON f.Cta_Bco_id_poblaciones = ct_pb.id' + ' ' +

                              'LEFT JOIN provincias AS ct_pr' + ' ' +
                              'ON f.Cta_Bco_id_provincias = ct_pr.id' + ' ' +

                              'LEFT JOIN paises AS ct_ps' + ' ' +
                              'ON f.Cta_Bco_id_paises = ct_ps.id' + ' ' +

                              'LEFT JOIN almacenes AS alm' + ' ' +
                              'ON f.id_almacenes = alm.id' + ' ' +

                              'LEFT JOIN empresas AS e' + ' ' +
                              'ON f.id_empresas = e.id' + ' ' +

                              'LEFT JOIN clientes AS c' + ' ' +
                              'ON f.id_clientes = c.id' + ' ' +

                              'LEFT JOIN formas_pago AS fp' + ' ' +
                              'ON f.id_formas_pago = fp.id' + ' ',

                              Memo_Filtros.Lines,
                              Memo_OrderBy.Lines,
                              var_a_Filtrar,

                              param_Cambiamos_Filtro );

    var_a_Filtrar.Free;

    Label_Ctdad_Rgtros.Caption := IntToStr(SQLQuery_Ftra.RecordCount);

    //Filtrar_tablas_ligadas;

    if SQLQuery_Ftra.RecordCount = 0 then
    begin
        Cerramos_Tablas_Ligadas;
    end;

    Sumar_Totales;

    Filtrar_Impuestos_Totales;
    var_SQL_ADD.Free;
end;

procedure Tform_facturas_ventas_000.SQLQuery_Alb_Pdtes_DetallesCalcFields(DataSet: TDataSet);
begin
    UTI_LINEAS_Poner_Totales_Linea_Detalle( SQLQuery_Alb_Pdtes_Detalles );
end;

procedure Tform_facturas_ventas_000.SQLQuery_Ftra_RcbosAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'facturas_cobros_pagos',
                       DataModule_facturas_ventas.SQLTransaction_Ftra_Rcbos,
                       SQLQuery_Ftra_Rcbos,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros_Recibos;
end;

procedure Tform_facturas_ventas_000.SQLQuery_Ftra_RcbosBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Ftra_Rcbos );
end;

procedure Tform_facturas_ventas_000.SQLQuery_Ftra_RcbosBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Ftra_Rcbos );
end;

procedure Tform_facturas_ventas_000.SQLQuery_List_FtrasCalcFields(DataSet: TDataSet);
begin
    with SQLQuery_List_Ftras do
    begin
        if Trim(FieldByName('Serie_Factura').AsString) <> '' then
        begin
            FieldByName('OT_la_Factura').AsString := Trim(FieldByName('Serie_Factura').AsString) +
                                                     '-' +
                                                     Trim(FieldByName('Numero_Factura').AsString);
        end else begin
            FieldByName('OT_la_Factura').AsString := Trim(FieldByName('Numero_Factura').AsString);
        end;
    end;
end;

procedure Tform_facturas_ventas_000.Filtrar_Impuestos_Totales;
var
  var_a_Filtrar : TStrings;
  var_msg       : TStrings;
  var_SQL       : String;
begin
    var_a_Filtrar := TStringList.Create;
    var_a_Filtrar.Clear;

    // ********************************************************************************************* //
    // ** Primero buscaremos en la serie                                                          ** //
    // ********************************************************************************************* //
    if Trim(Edit_Factura_Serie.Text) <> '' then
    begin
        var_a_Filtrar.Add( 'AND f.Serie_Factura = ' +
                           UTI_GEN_Comillas(Trim(Edit_Factura_Serie.Text)) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos en el NUMERO                                                           ** //
    // ********************************************************************************************* //
    if Trim(Edit_Factura_Numero.Text) <> '' then
    begin
        var_a_Filtrar.Add( 'AND f.Numero_Factura = ' +
                           UTI_GEN_Comillas(Trim(Edit_Factura_Numero.Text)) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la FECHA                                                           ** //
    // ********************************************************************************************* //
    if (not DateTimePicker_Hasta.DateIsNull) and
       (not DateTimePicker_Desde.DateIsNull) then
    begin
        var_a_Filtrar.Add( 'AND f.Fecha <= ' +
                           UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Hasta.Date, false) +
                                             ' 23:59:59' ) );
        var_a_Filtrar.Add( 'AND f.Fecha >= ' +
                           UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Desde.Date, false) +
                                             ' 00:00:00' ) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por el almacén                                                         ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Almacenes.Text) <> '' then
    begin
        var_a_Filtrar.Add( 'AND f.id_Almacenes = ' + Trim(Edit_id_Almacenes.Text) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la empresa                                                         ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Empresas.Text) <> '' then
    begin
        var_a_Filtrar.Add( 'AND f.id_empresas = ' + Trim(Edit_id_Empresas.Text) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la forma de pago                                                   ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Forma_Pago.Text) <> '' then
    begin
        var_a_Filtrar.Add( 'AND f.id_formas_pago = ' + Trim(Edit_id_Forma_Pago.Text) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la id del cliente                                                  ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Clientes.Text) <> '' then
    begin
        var_a_Filtrar.Add( 'AND f.id_clientes = ' + Trim(Edit_id_Clientes.Text) );
    end;

    // ********************************************************************************************* //
    // ** Vemos abonos, facturas o todo                                                           ** //
    // ********************************************************************************************* //
    if RadioButton_Facturas_Solo.Checked = true then
    begin
        var_a_Filtrar.Add( 'AND f.Tipo = ' + UTI_GEN_Comillas('F') );
    end;

    if RadioButton_Abonos_Solo.Checked = true then
    begin
        var_a_Filtrar.Add( 'AND f.Tipo = ' + UTI_GEN_Comillas('A') );
    end;

    { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
      y que por lo se debe de permitir modificarlos en ningún módulo }

    var_SQL := 'SELECT imp.descripcion AS OT_Descripcion_impto,' + ' ' +
                      'fi.id_impuestos,' + ' ' +
                      'SUM(fi.Base) AS Total_Base,' + ' ' +
                      'SUM(fi.Importe) AS Total_Cuota' + ' ' +

               'FROM facturas_ventas_impuestos AS fi' + ' ' +

               'LEFT JOIN impuestos AS imp' + ' ' +
               'ON fi.id_impuestos = imp.id' + ' ' +

               'RIGHT JOIN facturas_ventas AS f' + ' ' +
               'ON fi.id_facturas = f.id' + ' ' +

                   Trim(var_a_Filtrar.Text) + ' ' +

                  'AND f.Del_WHEN IS NULL' + ' ' +

               'WHERE fi.Del_WHEN IS NULL' + ' ' +
               'AND NOT imp.descripcion IS NULL' + ' ' +

               'GROUP BY fi.id_impuestos' + ' ' +
               'ORDER BY fi.id_facturas, fi.id_impuestos;' + ' ';

    if UTI_TB_Query_Open( // Delete_SQL,
                          '',

                          // Update_SQL,
                          '',

                          // Insert_SQL,
                          '',

                          DataModule_facturas_ventas.SQLConnector_Imptos_Totales,
                          SQLQuery_Imptos_Totales,

                          // var_ctdad_Rgtros,
                          -1,

                          // SELECT_SQL
                          var_SQL ) = False then
    begin
      // ************************************************************************************************* //
      // ** ESTAS LINEAS DE ABAJO SIRVEN PARA DESCUBRIR PORQUE LA SQL NO SE REALIZA BIEN                ** //
      // ************************************************************************************************* //
         {jeromito}
         var_msg := TStringList.Create;
         var_msg.add(var_SQL);
         UTI_GEN_Aviso(true, var_msg, 'ERROR', True, False);
         var_msg.free;
      // ***************************************************************************************** //
      // ** ESTAS LINEAS DE arriba SIRVEN PARA DESCUBRIR PORQUE LA SQL NO SE REALIZA BIEN       ** //
      // ***************************************************************************************** //

      UTI_GEN_Salir;
    end else begin
      // ***************************************************************************************** //
      // ** ESTAS LINEAS DE ABAJO SIRVEN PARA DESCUBRIR PORQUE LA SQL REALIZA BIEN, PERO NO COMO** //
      // ** DESEAMOS                                                                            ** //
      // ***************************************************************************************** //
      {jeromito}
      { var_msg := TStringList.Create;
        var_msg.add(var_SQL);
        UTI_GEN_Aviso(true, var_msg, 'ERROR', True, False);
        var_msg.free; }
      // ***************************************************************************************** //
      // ** ESTAS LINEAS DE arriba SIRVEN PARA DESCUBRIR PORQUE LA SQL SE REALIZA BIEN, PERO NO ** //
      // ** COMO DESEAMOS                                                                       ** //
      // ***************************************************************************************** //
    end;

    var_a_Filtrar.Free;
end;

function Tform_facturas_ventas_000.Cambiar_Numeracion_Ftra : Boolean;
begin
    Result := false;

    if (form_Menu.public_User = 0)                                           or
       (UTI_USR_Permiso_SN_conPermisoTotal_SN(Form_Menu.public_User) = True) then
    begin
        with SQLQuery_Ftra do
        begin
            Application.CreateForm(Tform_facturas_compras_004, form_facturas_compras_004);

            form_facturas_compras_004.Edit_id_Empresas.Text         := FieldByName('id_empresas').AsString;
            form_facturas_compras_004.Edit_Descripcion_Empresa.Text := FieldByName('OT_descripcion_empresa').AsString;

            form_facturas_compras_004.Edit_Factura_Serie_ACT.Text   := FieldByName('Serie_Factura').AsString;
            form_facturas_compras_004.Edit_Factura_Numero_ACT.Text  := FieldByName('Numero_Factura').AsString;
            form_facturas_compras_004.DateTimePicker_Fecha_ACT.Date := StrToDate(FieldByName('Fecha').AsString);

            form_facturas_compras_004.Edit_Factura_Serie_NEW.Text   := FieldByName('Serie_Factura').AsString;
            form_facturas_compras_004.Edit_Factura_Numero_NEW.Text  := FieldByName('Numero_Factura').AsString;
            form_facturas_compras_004.DateTimePicker_Fecha_NEW.Date := StrToDate(FieldByName('Fecha').AsString);

            form_facturas_compras_004.ShowModal;

            if form_facturas_compras_004.public_Pulso_Aceptar = true then
            begin
                FieldByName('Serie_Factura').AsString  := Trim(form_facturas_compras_004.Edit_Factura_Serie_NEW.Text);
                FieldByName('Numero_Factura').AsString := Trim(form_facturas_compras_004.Edit_Factura_Numero_NEW.Text);
                FieldByName('Fecha').AsString          := Trim(DateToStr(form_facturas_compras_004.DateTimePicker_Fecha_NEW.Date));

                Result                                 := true;
            end;

            form_facturas_compras_004.Free;
        end;
    end;
end;

function Tform_facturas_ventas_000.Filtrar_Listado_Ftras( param_ver_bajas : ShortInt;
                                                          param_Cambiamos_Filtro : Boolean;
                                                          param_Lineas_Filtro,
                                                          param_Lineas_OrderBy : TStrings ) : ShortInt;
var
  var_a_Filtrar_Plus : TStrings;
begin
  var_a_Filtrar_Plus := TStringList.Create;
  var_a_Filtrar_Plus.Clear;

  if Trim(param_Lineas_OrderBy.Text) = '' then
  begin
    param_Lineas_OrderBy.Text := private_Order_By[ComboBox_Filtros.ItemIndex].Memo_OrderBy;
  end;

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  Result := UTI_TB_Filtrar( private_Order_By,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            '',

                            // Insert_SQL,
                            '',

                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_facturas_ventas.SQLTransaction_List_Ftras,
                            DataModule_facturas_ventas.SQLConnector_List_Ftras,
                            SQLQuery_List_Ftras,

                            // name_tabla,
                            'f',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT impto.descripcion AS OT_descripcion_impuesto,' + ' ' +
                                   'impto.Tanto_Por_Ciento AS OT_Tanto_Por_Ciento,' + ' ' +

                                   'fi.*,' + ' ' +
                                   'f.*' + ' ' +

                            'FROM facturas_ventas_impuestos AS fi' + ' ' +

                            'RIGHT JOIN facturas_ventas as f' + ' ' +
                            'ON f.id = fi.id_facturas' + ' ' +

                            'LEFT JOIN impuestos AS impto' + ' ' +
                            'ON fi.id_impuestos = impto.id',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            param_Cambiamos_Filtro );

  var_a_Filtrar_Plus.Clear;
end;

procedure Tform_facturas_ventas_000.BitBtn_ImprimirClick(Sender: TObject);
var
  var_Ficheros       : TStrings;
  var_Ordenado_por   : String;
  var_Impuesto_Comun : String;

  var_Lineas_Filtro  : TStrings;
  var_Lineas_OrderBy : TStrings;
  var_SQL_ADD        : TStrings;
begin
    var_SQL_ADD := TStringList.Create;

    // ********************************************************************************************* //
    // ** Abrimos la tabla                                                                        ** //
    // ********************************************************************************************* //
    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    // ********************************************************************************************* //
    // ** AHORA PONDREMOS EL RESTO DE LOS FILTROS QUE NO SON GENERALES                            ** //
    // ********************************************************************************************* //
    // ** Primero buscaremos en la serie                                                          ** //
    // ********************************************************************************************* //
    if Trim(Edit_Factura_Serie.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'f.Serie_Factura = ' + UTI_GEN_Comillas(Trim(Edit_Factura_Serie.Text)) );
        UTI_TB_SQL_ADD( true,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos en el NUMERO                                                           ** //
    // ********************************************************************************************* //
    if Trim(Edit_Factura_Numero.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'f.Numero_Factura = ' + UTI_GEN_Comillas(Trim(Edit_Factura_Numero.Text)) );
        UTI_TB_SQL_ADD( false,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
     // ** Ahora buscaremos por la FECHA                                                          ** //
     // ******************************************************************************************** //
     if (not DateTimePicker_Hasta.DateIsNull) and
        (not DateTimePicker_Desde.DateIsNull) then
     begin
         var_SQL_ADD.Clear;
         var_SQL_ADD.Add( 'f.Fecha <= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Hasta.Date, false) + ' 23:59:59' ) );
         UTI_TB_SQL_ADD( false,
                         var_Lineas_Filtro,
                         var_SQL_ADD );

         var_SQL_ADD.Clear;
         var_SQL_ADD.Add( 'f.Fecha >= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Desde.Date, false) + ' 00:00:00' ) );
         UTI_TB_SQL_ADD( false,
                         var_Lineas_Filtro,
                         var_SQL_ADD );
     end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por el almacén                                                         ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Almacenes.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'f.id_Almacenes = ' + Trim(Edit_id_Almacenes.Text) );
        UTI_TB_SQL_ADD( false,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la empresa                                                         ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Empresas.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'f.id_empresas = ' + Trim(Edit_id_Empresas.Text) );
        UTI_TB_SQL_ADD( false,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la forma de pago                                                   ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Forma_Pago.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'f.id_formas_pago = ' + Trim(Edit_id_Forma_Pago.Text) );
        UTI_TB_SQL_ADD( false,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la id del cliente                                                  ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Clientes.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'f.id_clientes = ' + Trim(Edit_id_Clientes.Text) );
        UTI_TB_SQL_ADD( false,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Vemos abonos, facturas o todo                                                           ** //
    // ********************************************************************************************* //
    if RadioButton_Facturas_Solo.Checked = true then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'f.Tipo = ' + UTI_GEN_Comillas('F') );
        UTI_TB_SQL_ADD( false,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    if RadioButton_Abonos_Solo.Checked = true then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'f.Tipo = ' + UTI_GEN_Comillas('A') );
        UTI_TB_SQL_ADD( false,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Pasamos a traer los registros ... filtrar                                               ** //
    // ********************************************************************************************* //
    var_Lineas_OrderBy.Clear;
    Filtrar_Listado_Ftras( 1, // RadioGroup_Bajas.ItemIndex,  // asi no se ven las bajas hasta que no lo pida el form de altas/modif de líneas
                           false,
                           var_Lineas_Filtro,
                           var_Lineas_OrderBy );

    if not SQLQuery_List_Ftras.IsEmpty then
    begin
        // ***************************************************************************************** //
        // ** Configuramos el título del listado                                                  ** //
        // ***************************************************************************************** //
        var_Ordenado_por := rs_Filtros_Otros_1 +
                            Trim(ComboBox_Filtros.Text);

        if Trim(Memo_Filtros.Lines.Text) <> '' then
        begin
            var_Ordenado_por := var_Ordenado_por +
                                rs_Filtros_Otros_2 +
                                Trim(Memo_Filtros.Lines.Text);
        end;

        if Trim(Edit_Factura_Serie.Text) <> '' then
        begin
            var_Ordenado_por := var_Ordenado_por +
                                ', con serie = ' +
                                Trim(Edit_Factura_Serie.Text);
        end;

        if Trim(Edit_Factura_Numero.Text) <> '' then
        begin
            var_Ordenado_por := var_Ordenado_por +
                                ', con número = ' +
                                Trim(Edit_Factura_Numero.Text);
        end;

        if (not DateTimePicker_Hasta.DateIsNull) or
           (not DateTimePicker_Desde.DateIsNull) then
        begin
            var_Ordenado_por := var_Ordenado_por +
                                ', facturas entre ' +
                                DateToStr(DateTimePicker_Desde.Date) +
                                ' y el ' +
                                DateToStr(DateTimePicker_Hasta.Date);
        end;

        if Trim(Edit_Descripcion_id_Almacenes.Text) <> '' then
        begin
            var_Ordenado_por := var_Ordenado_por +
                                ', con almacén = ' +
                                Trim(Edit_Descripcion_id_Almacenes.Text);
        end;

        if Trim(Edit_Descripcion_Empresa.Text) <> '' then
        begin
            var_Ordenado_por := var_Ordenado_por +
                                ', con empresa = ' +
                                Trim(Edit_Descripcion_Empresa.Text);
        end;

        if Trim(Edit_Descripcion_Forma_Pago.Text) <> '' then
        begin
            var_Ordenado_por := var_Ordenado_por +
                                ', con forma pago = ' +
                                Trim(Edit_Descripcion_Forma_Pago.Text);
        end;

        if Trim(Edit_Descripcion_id_Clientes.Text) <> '' then
        begin
            var_Ordenado_por := var_Ordenado_por +
                                ', con cliente = ' +
                                Trim(Edit_Descripcion_id_Clientes.Text);
        end;

        // ***************************************************************************************** //
        // ** Vamos a enviar el título del impuesto común. Esto sólo servirá en aquellas empresas ** //
        // ** que sólo usen un tipo de impuesto para facturar                                     ** //
        // ***************************************************************************************** //
        var_Impuesto_Comun := '';

        with SQLQuery_Ftra_Detalles do
        begin
            First;
            while not eof do
            begin
                if Trim(FieldByName('OT_descripcion_impuesto').AsString) <> Trim(var_Impuesto_Comun) then
                begin
                    if Trim(FieldByName('OT_descripcion_impuesto').AsString) <> '' then
                    begin
                        var_Impuesto_Comun := Trim(FieldByName('OT_descripcion_impuesto').AsString);
                    end;
                end;

                Next;
            end;
            First;
        end;

        // ***************************************************************************************** //
        // ** Configuramos la llamada al generador de informes                                    ** //
        // ***************************************************************************************** //
        var_Ficheros := TStringList.Create;

        UTI_GEN_Informes( var_Ordenado_por,
                          SQLQuery_Ftra,
                          DataSource_List_Ftras,
                          DataSource_Ftra_Detalles,
                          Nil,
                          DataSource_Imptos_Totales,
                          public_Menu_Worked,
                          public_Solo_Ver,
                          SQLQuery_Ftra.FieldByName('id_empresas').AsString,
                          var_Impuesto_Comun,
                          var_Ficheros );

        var_Ficheros.Free;
    end;

    // ********************************************************************************************* //
    // ** BORRAMOS DE MEMORIA EL RESTO DE COSAS A NO UTILIZAR YA                                  ** //
    // ********************************************************************************************* //
    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;

    // ********************************************************************************************* //
    // ** Cerramos la tabla                                                                       ** //
    // ********************************************************************************************* //
    if UTI_TB_Cerrar( DataModule_facturas_ventas.SQLConnector_List_Ftras,
                      DataModule_facturas_ventas.SQLTransaction_List_Ftras,
                      SQLQuery_List_Ftras ) = false then
    begin
      UTI_GEN_Salir;
    end;

    var_SQL_ADD.Free;
end;

function Tform_facturas_ventas_000.Filtrar_Recibos( param_ver_bajas : ShortInt;
                                                    param_Cambiamos_Filtro : Boolean;
                                                    param_Lineas_Filtro,
                                                    param_Lineas_OrderBy : TStrings ) : ShortInt;
var
  var_a_Filtrar_Plus : TStrings;
begin
  var_a_Filtrar_Plus := TStringList.Create;
  var_a_Filtrar_Plus.Clear;

  if Trim(param_Lineas_OrderBy.Text) = '' then
  begin
    param_Lineas_OrderBy.Text := private_Order_By_Lineas_Recibos[0].Memo_OrderBy;
  end;

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  Result := UTI_TB_Filtrar( private_Order_By_Lineas_Recibos,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Ftra_Rcbos,
                                                          'facturas_cobros_pagos',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Ftra_Rcbos,
                                                          'facturas_cobros_pagos',
                                                          'i' ),

                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_facturas_ventas.SQLTransaction_Ftra_Rcbos,
                            DataModule_facturas_ventas.SQLConnector_Ftra_Rcbos,
                            SQLQuery_Ftra_Rcbos,

                            // name_tabla,
                            'fcp',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT fcp.*,' + ' ' +

                                   'cl.nombre_propietario AS OT_cliente_nombre_ficha,' + ' ' +
                                   'pr.nombre_propietario AS OT_proveedor_nombre_ficha,' + ' ' +


                                   'fv.nombre_propietario AS OT_factura_nombre_propietario,' + ' ' +
                                   'fv.nif_cif AS OT_factura_nif_cif,' + ' ' +

                                   'fv.Cta_Bco_Entidad AS OT_factura_Cta_Bco_Entidad,' + ' ' +
                                   'fv.Cta_Bco_Sucursal AS OT_factura_Cta_Bco_Sucursal,' + ' ' +
                                   'fv.Cta_Bco_Digito_Control AS OT_factura_Cta_Bco_Digito_Control,' + ' ' +
                                   'fv.Cta_Bco_Cuenta AS OT_factura_Cta_Bco_Cuenta,' + ' ' +
                                   'fv.Cta_Bco_IBAN AS OT_factura_Cta_Bco_IBAN,' + ' ' +
                                   'fv.Cta_Bco_BIC_SWIFT AS OT_factura_Cta_Bco_BIC_SWIFT,' + ' ' +
                                   'fv.Cta_Bco_Mandato_Fecha_de_Firma AS OT_factura_Cta_Bco_Mandato_Fecha_de_Firma,' + ' ' +
                                   'fv.Cta_Bco_Mandato_Ref AS OT_factura_Cta_Bco_Mandato_Ref,' + ' ' +
                                   'fv.Cta_Bco_Direccion AS OT_factura_Cta_Bco_Direccion,' + ' ' +
                                   'fv.Cta_Bco_Direccion_Numero AS OT_factura_Cta_Bco_Direccion_Numero,' + ' ' +
                                   'fv.Cta_Bco_Direccion_Piso_Letra AS OT_factura_Cta_Bco_Direccion_Piso_Letra,' + ' ' +
                                   'fv.Cta_Bco_Codigo_Postal AS OT_factura_Cta_Bco_Codigo_Postal,' + ' ' +

                                   'fv.CONCEPTO_SEPA AS OT_factura_CONCEPTO_SEPA' + ' ' +

                              'FROM facturas_cobros_pagos AS fcp' + ' ' +

                            'LEFT JOIN proveedores AS pr' + ' ' +
                            'ON fcp.id_proveedores = pr.id' + ' ' +

                            'LEFT JOIN clientes AS cl' + ' ' +
                            'ON fcp.id_clientes = cl.id' + ' ' +

                            'LEFT JOIN facturas_ventas AS fv' + ' ' +
                            'ON fcp.id_facturas = fv.id',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            param_Cambiamos_Filtro );

  var_a_Filtrar_Plus.Free;
end;

procedure Tform_facturas_ventas_000.Refrescar_Registros_Recibos;
var
  var_Lineas_Filtro  : TStrings;
  var_Lineas_OrderBy : TStrings;
  var_id             : ShortString;
  var_ver_Bajas      : ShortInt;
  var_SQL_ADD        : TStrings;
begin
    var_SQL_ADD := TStringList.Create;

    // ********************************************************************************************* //
    // ** Solo si la cabecera está en modo EDIT se abren las tablas hijas                         ** //
    // ********************************************************************************************* //
    if SQLQuery_Ftra.State <> dsEdit then Exit;

    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_id := '';

    with SQLQuery_Ftra_Rcbos do
    begin
        if RecordCount > 0 then
        begin
            if FieldByName('id').IsNull then
            begin
                var_id := '0';
            end else begin
                var_id := FieldByName('id').AsString;
            end;
        end;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Clear;
    var_Lineas_OrderBy.Clear;

    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'fcp.id_facturas = ' + SQLQuery_Ftra.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_ver_Bajas := 1; // asi no se ven las bajas hasta que no lo pida el form de altas/modif de líneas
    if UTI_GEN_Form_Abierto_Ya('form_facturas_ventas_001') = true then
    begin
        var_ver_Bajas := form_facturas_ventas_001.RadioGroup_Bajas.ItemIndex;
    end;

    Filtrar_Recibos( var_ver_Bajas,
                     false,
                     var_Lineas_Filtro,
                     var_Lineas_OrderBy );

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;

    if var_id <> '' then
    begin
        if var_id = '0' then
        begin
            // ************************************************************************************* //
            // ** Estabamos en una insercción, así que me voy al último registro, pues el order by** //
            // ** es id_cliente + id del registro                                                 ** //
            // ************************************************************************************* //
            SQLQuery_Ftra_Rcbos.Last;
        end else begin
            // ************************************************************************************* //
            // ** Estabamos en una edición, así que ya conocíamos la id del registro. Por lo que  ** //
            // ** hago el locate por esta id                                                      ** //
            // ************************************************************************************* //
            SQLQuery_Ftra_Rcbos.Locate('id', StrToInt64(var_id), []);
        end;

    end;

    var_SQL_ADD.Free;
end;

procedure Tform_facturas_ventas_000.Boton_Elegir_PeriodoClick(Sender: TObject);
begin
    UTI_GEN_Traer_Trimestre( DateTimePicker_Desde,
                             DateTimePicker_Hasta );
end;

procedure Tform_facturas_ventas_000.Presentar_Datos_Totales( param_Actualizar_Totales : Byte );
var var_Calculo_Totales_Cabecera : TCalculo_Totales_por_Cabecera;
begin
    var_Calculo_Totales_Cabecera := UTI_LINEAS_poner_totales( 'facturas_ventas',
                                                              SQLQuery_Ftra.FieldByName('id').AsString );

    // ********************************************************************************************* //
    // ** Presentamos los totales pero sólo si está abierto el form_ 001                          ** //
    // ********************************************************************************************* //
    if param_Actualizar_Totales = 1 then
    begin
        with form_facturas_ventas_001 do
        begin
            Edit_Total_Lineas.Text         := FormatFloat( ',0.00', var_Calculo_Totales_Cabecera.Total_Lineas );
            Edit_Total.Text                := FormatFloat( ',0.00', var_Calculo_Totales_Cabecera.Total );
            Edit_Total_Mano_Obra.Text      := FormatFloat( ',0.00', var_Calculo_Totales_Cabecera.Total_Mano_Obra );
            Edit_Total_Materiales.Text     := FormatFloat( ',0.00', var_Calculo_Totales_Cabecera.Total_Materiales );
            Edit_Total_Resto.Text          := FormatFloat( ',0.00', var_Calculo_Totales_Cabecera.Total_Resto );

            Edit_Total_Peso.Text           := '0';
            Edit_Total_Volumen.Text        := '0';
        end;
    end;

    // ********************************************************************************************* //
    // ** Traemos los impuestos de la factura, para hacer visibles sus registros si hiciera falta ** //
    // ********************************************************************************************* //
    Refrescar_Registros_Impuestos;

    // ********************************************************************************************* //
    // ** Aqui volvemos a refrescar los recibos porque hay un trigger que llama a un procedimiento** //
    // ** almacenado que crea los vencimientos automáticamente después de calcular el total de la ** //
    // ** factura                                                                                 ** //
    // ********************************************************************************************* //
    Refrescar_Registros_Recibos;
end;

procedure Tform_facturas_ventas_000.Sumar_Totales;
var var_Total_Principal : Extended;
begin
    var_Total_Principal := 0;

    With SQLQuery_Ftra do
    begin
        First;
        While not Eof do
        begin
            if not FieldByName('Total_Total').IsNull then
            begin
                var_Total_Principal := var_Total_Principal + FieldByName('Total_Total').Value;
            end;

            Next;
        end;
    end;

    Edit_Registros_Total.Text := FormatFloat( ',0.00', var_Total_Principal );
end;

procedure Tform_facturas_ventas_000.Traer_facturas_ventas_xID( param_id : String;
                                                               param_SQLTransaction : TSQLTransaction;
                                                               param_SQLConnector : TSQLConnector;
                                                               param_SQLQuery : TSQLQuery );
begin
    // ********************************************************************************************* //
    // ** Abrimos la Transaccion y la conexión con el motor BD                                    ** //
    // ********************************************************************************************* //
    if UTI_CN_Connector_Open( param_SQLTransaction,
                              param_SQLConnector ) = false then UTI_GEN_Salir;

    // ********************************************************************************************* //
    // ** Al SQLQuery le pasamos el SQLConnector                                                  ** //
    // ********************************************************************************************* //
    param_SQLQuery.Name     := 'SQLQuery_Traer_facturas_ventas_xID';
    param_SQLQuery.Database := param_SQLConnector;

    { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
      y que por lo se debe de permitir modificarlos en ningún módulo }

    param_SQLQuery.SQL.Clear;
    param_SQLQuery.SQL.AddStrings( 'SELECT f.*,' + ' ' +

                                          'trp.nombre_propietario AS OT_descripcion_transportista,' + ' ' +
                                          'trp.Tfno_Fijo_1 AS OT_tfno_1_transportista,' + ' ' +
                                          'trp.Movil AS OT_Movil_transportista,' + ' ' +

                                          'env_pb.descripcion AS OT_Envio_descripcion_poblacion,' + ' ' +
                                          'env_pr.descripcion AS OT_Envio_descripcion_provincia,' + ' ' +
                                          'env_ps.descripcion AS OT_Envio_descripcion_pais,' + ' ' +

                                          'rp.nombre_propietario AS OT_descripcion_representante,' + ' ' +
                                          'rp.Tfno_Fijo_1 AS OT_tfno_1_representante,' + ' ' +
                                          'rp.Movil AS OT_Movil_representante,' + ' ' +

                                          'tfs.descripcion AS OT_descripcion_tarifa,' + ' ' +

                                          'pb.descripcion AS OT_descripcion_poblacion,' + ' ' +
                                          'pr.descripcion AS OT_descripcion_provincia,' + ' ' +
                                          'ps.descripcion AS OT_descripcion_pais,' + ' ' +

                                          'ct_pb.descripcion AS OT_Cta_Bco_descripcion_poblacion,' + ' ' +
                                          'ct_pr.descripcion AS OT_Cta_Bco_descripcion_provincia,' + ' ' +
                                          'ct_ps.descripcion AS OT_Cta_Bco_descripcion_pais,' + ' ' +

                                          'alm.descripcion AS OT_descripcion_almacen,' + ' ' +

                                          'e.nombre_comercial AS OT_descripcion_empresa,' + ' ' +
                                          'c.nombre_propietario AS OT_descripcion_cliente,' + ' ' +

                                          'fp.descripcion AS OT_descripcion_forma_pago' + ' ' +

                                   'FROM facturas_ventas AS f' + ' ' +

                                   'LEFT JOIN proveedores AS trp' + ' ' +
                                   'ON f.agencias_transporte_id_proveedores = trp.id' + ' ' +

                                   'LEFT JOIN poblaciones AS env_pb' + ' ' +
                                   'ON f.Envio_id_poblaciones = env_pb.id' + ' ' +

                                   'LEFT JOIN provincias AS env_pr' + ' ' +
                                   'ON f.Envio_id_provincias = env_pr.id' + ' ' +

                                   'LEFT JOIN paises AS env_ps' + ' ' +
                                   'ON f.Envio_id_paises = env_ps.id' + ' ' +

                                   'LEFT JOIN representantes AS rp' + ' ' +
                                   'ON f.id_representantes = rp.id' + ' ' +

                                   'LEFT JOIN tarifas AS tfs' + ' ' +
                                   'ON f.id_tarifas = tfs.id' + ' ' +

                                   'LEFT JOIN poblaciones AS pb' + ' ' +
                                   'ON f.id_poblaciones = pb.id' + ' ' +

                                   'LEFT JOIN provincias AS pr' + ' ' +
                                   'ON f.id_provincias = pr.id' + ' ' +

                                   'LEFT JOIN paises AS ps' + ' ' +
                                   'ON f.id_paises = ps.id' + ' ' +

                                   'LEFT JOIN poblaciones AS ct_pb' + ' ' +
                                   'ON f.Cta_Bco_id_poblaciones = ct_pb.id' + ' ' +

                                   'LEFT JOIN provincias AS ct_pr' + ' ' +
                                   'ON f.Cta_Bco_id_provincias = ct_pr.id' + ' ' +

                                   'LEFT JOIN paises AS ct_ps' + ' ' +
                                   'ON f.Cta_Bco_id_paises = ct_ps.id' + ' ' +

                                   'LEFT JOIN almacenes AS alm' + ' ' +
                                   'ON f.id_almacenes = alm.id' + ' ' +

                                   'LEFT JOIN empresas AS e' + ' ' +
                                   'ON f.id_empresas = e.id' + ' ' +

                                   'LEFT JOIN clientes AS c' + ' ' +
                                   'ON f.id_clientes = c.id' + ' ' +

                                   'LEFT JOIN formas_pago AS fp' + ' ' +
                                   'ON f.id_formas_pago = fp.id' + ' ' );

    // ********************************************************************************************* //
    // ** Continuamos con la confección de la SQL                                                 ** //
    // ********************************************************************************************* //
    param_SQLQuery.SQL.Add( 'WHERE f.id = ' + Trim(param_id) );
    param_SQLQuery.SQL.Add( 'ORDER BY f.id ASC' );

    // ********************************************************************************************* //
    // ** Abrimos la Query                                                                        ** //
    // ********************************************************************************************* //
    if UTI_TB_Query_Open( '', '', '',
                          param_SQLConnector,
                          param_SQLQuery,
                          -1, // asi me trae todos los registros de golpe
                          param_SQLQuery.SQL.Text ) = false then UTI_GEN_Salir;
end;

procedure Tform_facturas_ventas_000.Traer_facturas_ventas_detalles_xid_Ftra( param_id : String;
                                                                             param_SQLTransaction : TSQLTransaction;
                                                                             param_SQLConnector : TSQLConnector;
                                                                             param_SQLQuery : TSQLQuery );
begin
    // ********************************************************************************************* //
    // ** Abrimos la Transaccion y la conexión con el motor BD                                    ** //
    // ********************************************************************************************* //
    if UTI_CN_Connector_Open( param_SQLTransaction,
                              param_SQLConnector ) = false then UTI_GEN_Salir;

    // ********************************************************************************************* //
    // ** Al SQLQuery le pasamos el SQLConnector                                                  ** //
    // ********************************************************************************************* //
    param_SQLQuery.Name     := 'SQLQuery_Traer_facturas_ventas_detalles_xid_Ftra';
    param_SQLQuery.Database := param_SQLConnector;

    { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
      y que por lo se debe de permitir modificarlos en ningún módulo }

    param_SQLQuery.SQL.Clear;

    param_SQLQuery.SQL.AddStrings( 'SELECT fd.*,' + ' ' +

                                          'cl.nombre_propietario AS OT_Cliente_nombre_propietario,' + ' ' +
                                          'cl.nombre_comercial AS OT_Cliente_nombre_comercial,' + ' ' +

                                          'fv.id_almacenes AS OT_id_almacenes_Cabecera,' + ' ' +
                                          'fv.Serie_Factura AS OT_Serie_Factura,' + ' ' +
                                          'fv.Numero_Factura AS OT_Numero_Factura,' + ' ' +

                                          'al.descripcion AS OT_descripcion_almacen,' + ' ' +

                                          'a.descripcion_para_TPV AS OT_descripcion_articulo,' + ' ' +
                                          'a.Tipo_de_articulo AS OT_Tipo_de_articulo,' + ' ' +

                                          'i.descripcion AS OT_descripcion_impuesto,' + ' ' +
                                          'i.Tanto_Por_Ciento AS OT_Tanto_Por_Ciento,' + ' ' +
                                          'i.Sumado_A_Ftra_SN AS OT_Sumado_A_Ftra_SN' + ' ' +

                                   'FROM facturas_ventas_detalles AS fd' + ' ' +

                                   'LEFT JOIN almacenes AS al' + ' ' +
                                   'ON fd.id_almacenes = al.id' + ' ' +

                                   'LEFT JOIN articulos AS a' + ' ' +
                                   'ON fd.id_articulos = a.id' + ' ' +

                                   'LEFT JOIN impuestos AS i' + ' ' +
                                   'ON fd.id_impuestos_Ventas = i.id' + ' ' +

                                   'LEFT JOIN clientes AS cl' + ' ' +
                                   'ON fd.id_clientes = cl.id' + ' ' +

                                   'LEFT JOIN facturas_ventas AS fv' + ' ' +
                                   'ON fd.id_facturas = fv.id ' );

    // ********************************************************************************************* //
    // ** Continuamos con la confección de la SQL                                                 ** //
    // ********************************************************************************************* //
    param_SQLQuery.SQL.Add( 'WHERE fd.id_facturas = ' + Trim(param_id) );
    param_SQLQuery.SQL.Add(   'AND fd.Del_WHEN IS NULL' );

    param_SQLQuery.SQL.Add( 'ORDER BY fd.id_facturas ASC, id ASC' );

    // ********************************************************************************************* //
    // ** Abrimos la Query                                                                        ** //
    // ********************************************************************************************* //
    if UTI_TB_Query_Open( '', '', '',
                          param_SQLConnector,
                          param_SQLQuery,
                          -1, // asi me trae todos los registros de golpe
                          param_SQLQuery.SQL.Text ) = false then UTI_GEN_Salir;
end;

function Tform_facturas_ventas_000.Traer_Clientes_xID( param_id : ShortString ) : TClientes;
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

end.


