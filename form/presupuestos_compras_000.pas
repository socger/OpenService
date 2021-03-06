unit presupuestos_compras_000;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, DateTimePicker, Forms, Controls, Graphics, Dialogs,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, DBGrids, DbCtrls, Grids, variants, utilidades_datos_tablas,
  utilidades_bd, utilidades_general, utilidades_rgtro, utilidades_usuarios, utilidades_forms_Filtrar,
  utilidades_empresas, utilidades_compras, utilidades_almacenes, types,
  utilidades_lineas_detalle;

type

  { Tform_presupuestos_compras_000 }

  Tform_presupuestos_compras_000 = class(TForm)
    BitBtn_Considerar_como_cerrado: TBitBtn;
    BitBtn_Convertir_Integro_en_Pedido: TBitBtn;
    BitBtn_Filtrar: TBitBtn;
    BitBtn_Imprimir: TBitBtn;
    BitBtn_SALIR: TBitBtn;
    BitBtn_Seleccionar: TBitBtn;
    BitBtn_Ver_Situacion_Registro: TBitBtn;
    Boton_Elegir_Empresa: TBitBtn;
    Boton_Elegir_Forma_Pago: TBitBtn;
    Boton_Elegir_id_Almacenes: TBitBtn;
    Boton_Elegir_id_proveedores: TBitBtn;
    Boton_Elegir_Periodo: TBitBtn;
    ComboBox_Filtros: TComboBox;
    DataSource_Imptos_Totales: TDataSource;
    DataSource_List_Presup: TDataSource;
    DataSource_Pdo: TDataSource;
    DataSource_Pdo_Detalles: TDataSource;
    DataSource_Presup: TDataSource;
    DataSource_Presup_Detalles: TDataSource;
    DataSource_Presup_Impuestos: TDataSource;
    DateTimePicker_Desde_Ntra_Referencia: TDateTimePicker;
    DateTimePicker_Desde_Su_Referencia: TDateTimePicker;
    DateTimePicker_Hasta_Ntra_Referencia: TDateTimePicker;
    DateTimePicker_Hasta_Su_Referencia: TDateTimePicker;
    DBGrid_Detalles1: TDBGrid;
    DBGrid_Principal: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBNavigator_Detalles1: TDBNavigator;
    Edit_Descripcion_Empresa: TEdit;
    Edit_Descripcion_Forma_Pago: TEdit;
    Edit_Descripcion_id_Almacenes: TEdit;
    Edit_Descripcion_id_proveedores: TEdit;
    Edit_id_Almacenes: TEdit;
    Edit_id_Empresas: TEdit;
    Edit_id_Forma_Pago: TEdit;
    Edit_id_proveedores: TEdit;
    Edit_Presupuesto_Numero_Ntra_Referencia: TEdit;
    Edit_Presupuesto_Numero_Su_Referencia: TEdit;
    Edit_Presupuesto_Serie_Ntra_Referencia: TEdit;
    Edit_Registros_Total: TEdit;
    GroupBox4: TGroupBox;
    GroupBox_Serie_Numero: TGroupBox;
    GroupBox_Serie_Numero2: TGroupBox;
    Image_Candado: TImage;
    Image_Cobro_Excluido: TImage;
    Image_Convertida: TImage;
    Label102: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label51: TLabel;
    Label7: TLabel;
    Label76: TLabel;
    Label78: TLabel;
    Label8: TLabel;
    Label87: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label_Almacen: TLabel;
    Label_Ctdad_Rgtros: TLabel;
    Label_Fecha2: TLabel;
    Label_Fecha3: TLabel;
    Memo_Filtros: TMemo;
    Memo_OrderBy: TMemo;
    PageControl_Filtros: TPageControl;
    Panel2: TPanel;
    RadioButton_Cerrados_NO: TRadioButton;
    RadioButton_Cerrados_SI: TRadioButton;
    RadioButton_Todos: TRadioButton;
    RadioGroup_Bajas: TRadioGroup;
    SQLQuery_Clientesid1: TLargeintField;
    SQLQuery_Clientesid2: TLargeintField;
    SQLQuery_Clientesid3: TLargeintField;
    SQLQuery_List_Presupagencias_transporte_id_proveedores: TLargeintField;
    SQLQuery_List_PresupBase: TBCDField;
    SQLQuery_List_PresupCerrado_SN: TStringField;
    SQLQuery_List_PresupChange_Id_User: TLargeintField;
    SQLQuery_List_PresupChange_Id_User_1: TLargeintField;
    SQLQuery_List_PresupChange_WHEN: TDateTimeField;
    SQLQuery_List_PresupChange_WHEN_1: TDateTimeField;
    SQLQuery_List_PresupCodigo_Postal: TStringField;
    SQLQuery_List_PresupCONCEPTO_SEPA: TStringField;
    SQLQuery_List_PresupCta_Bco_BIC_SWIFT: TStringField;
    SQLQuery_List_PresupCta_Bco_Codigo_Postal: TStringField;
    SQLQuery_List_PresupCta_Bco_Cuenta: TStringField;
    SQLQuery_List_PresupCta_Bco_Digito_Control: TStringField;
    SQLQuery_List_PresupCta_Bco_Direccion: TStringField;
    SQLQuery_List_PresupCta_Bco_Direccion_Numero: TStringField;
    SQLQuery_List_PresupCta_Bco_Direccion_Piso_Letra: TStringField;
    SQLQuery_List_PresupCta_Bco_Entidad: TStringField;
    SQLQuery_List_PresupCta_Bco_IBAN: TStringField;
    SQLQuery_List_PresupCta_Bco_id_paises: TLargeintField;
    SQLQuery_List_PresupCta_Bco_id_poblaciones: TLargeintField;
    SQLQuery_List_PresupCta_Bco_id_provincias: TLargeintField;
    SQLQuery_List_PresupCta_Bco_Mandato_Fecha_de_Firma: TDateTimeField;
    SQLQuery_List_PresupCta_Bco_Mandato_Ref: TStringField;
    SQLQuery_List_PresupCta_Bco_Sucursal: TStringField;
    SQLQuery_List_PresupDel_Id_User: TLargeintField;
    SQLQuery_List_PresupDel_Id_User_1: TLargeintField;
    SQLQuery_List_PresupDel_WHEN: TDateTimeField;
    SQLQuery_List_PresupDel_WHEN_1: TDateTimeField;
    SQLQuery_List_PresupDel_WHY: TStringField;
    SQLQuery_List_PresupDel_WHY_1: TStringField;
    SQLQuery_List_PresupDescuento_Comercial_1: TBCDField;
    SQLQuery_List_PresupDescuento_Comercial_2: TBCDField;
    SQLQuery_List_PresupDescuento_Final: TBCDField;
    SQLQuery_List_PresupDescuento_Pronto_Pago: TBCDField;
    SQLQuery_List_PresupDireccion: TStringField;
    SQLQuery_List_PresupDireccion_Numero: TStringField;
    SQLQuery_List_PresupDireccion_Piso_Letra: TStringField;
    SQLQuery_List_PresupEnvio_Bultos: TLongintField;
    SQLQuery_List_PresupEnvio_Codigo_Postal: TStringField;
    SQLQuery_List_PresupEnvio_Condiciones_Entrega: TStringField;
    SQLQuery_List_PresupEnvio_Con_Quien_Hablar: TStringField;
    SQLQuery_List_PresupEnvio_Direccion: TStringField;
    SQLQuery_List_PresupEnvio_Direccion_Numero: TStringField;
    SQLQuery_List_PresupEnvio_Direccion_Piso_Letra: TStringField;
    SQLQuery_List_PresupEnvio_eMail: TStringField;
    SQLQuery_List_PresupEnvio_FAX: TStringField;
    SQLQuery_List_PresupEnvio_Fecha_Recogida_Prevista: TDateTimeField;
    SQLQuery_List_PresupEnvio_id_paises: TLargeintField;
    SQLQuery_List_PresupEnvio_id_poblaciones: TLargeintField;
    SQLQuery_List_PresupEnvio_id_provincias: TLargeintField;
    SQLQuery_List_PresupEnvio_Movil: TStringField;
    SQLQuery_List_PresupEnvio_Portes: TBCDField;
    SQLQuery_List_PresupEnvio_Portes_Pagados_SN: TStringField;
    SQLQuery_List_PresupEnvio_Tfno_Fijo_1: TStringField;
    SQLQuery_List_PresupEnvio_Tfno_Fijo_2: TStringField;
    SQLQuery_List_PresupFAX: TStringField;
    SQLQuery_List_PresupFecha: TDateTimeField;
    SQLQuery_List_PresupFecha_Presupuesto_Proveedor: TDateTimeField;
    SQLQuery_List_PresupForma_pago_Dia_1: TSmallintField;
    SQLQuery_List_PresupForma_pago_Dia_2: TSmallintField;
    SQLQuery_List_PresupForma_pago_Vacaciones_Dia_Fin: TSmallintField;
    SQLQuery_List_PresupForma_pago_Vacaciones_Dia_Inicio: TSmallintField;
    SQLQuery_List_PresupForma_pago_Vacaciones_Mes_Fin: TSmallintField;
    SQLQuery_List_PresupForma_pago_Vacaciones_Mes_Inicio: TSmallintField;
    SQLQuery_List_Presupid: TLargeintField;
    SQLQuery_List_Presupid_1: TLargeintField;
    SQLQuery_List_Presupid_almacenes: TLargeintField;
    SQLQuery_List_Presupid_empresas: TLargeintField;
    SQLQuery_List_Presupid_formas_pago: TLargeintField;
    SQLQuery_List_Presupid_impuestos: TLargeintField;
    SQLQuery_List_Presupid_paises: TLargeintField;
    SQLQuery_List_Presupid_poblaciones: TLargeintField;
    SQLQuery_List_Presupid_presupuestos: TLargeintField;
    SQLQuery_List_Presupid_proveedores: TLargeintField;
    SQLQuery_List_Presupid_provincias: TLargeintField;
    SQLQuery_List_PresupImporte: TBCDField;
    SQLQuery_List_PresupInsert_Id_User: TLargeintField;
    SQLQuery_List_PresupInsert_Id_User_1: TLargeintField;
    SQLQuery_List_PresupInsert_WHEN: TDateTimeField;
    SQLQuery_List_PresupInsert_WHEN_1: TDateTimeField;
    SQLQuery_List_PresupIVA_con_Recargo_SN: TStringField;
    SQLQuery_List_PresupIVA_Excluido_SN: TStringField;
    SQLQuery_List_PresupMovil: TStringField;
    SQLQuery_List_Presupnif_cif: TStringField;
    SQLQuery_List_Presupnombre_comercial: TStringField;
    SQLQuery_List_Presupnombre_propietario: TStringField;
    SQLQuery_List_PresupNumero_Presupuesto: TLargeintField;
    SQLQuery_List_PresupNumero_Presupuesto_Proveedor: TStringField;
    SQLQuery_List_PresupObservaciones: TStringField;
    SQLQuery_List_PresupOT_descripcion_impuesto: TStringField;
    SQLQuery_List_PresupOT_el_Presupuesto: TStringField;
    SQLQuery_Imptos_Totales: TSQLQuery;
    SQLQuery_Imptos_Totalesid_impuestos: TLargeintField;
    SQLQuery_Imptos_TotalesOT_Descripcion_impto: TStringField;
    SQLQuery_Imptos_TotalesTotal_Base: TFMTBCDField;
    SQLQuery_Imptos_TotalesTotal_Cuota: TFMTBCDField;
    SQLQuery_List_Presup: TSQLQuery;
    SQLQuery_List_PresupOT_Tanto_Por_Ciento: TBCDField;
    SQLQuery_List_PresupRetencion: TBCDField;
    SQLQuery_List_PresupSerie_Presupuesto: TStringField;
    SQLQuery_List_PresupTfno_Fijo_1: TStringField;
    SQLQuery_List_PresupTfno_Fijo_2: TStringField;
    SQLQuery_List_PresupTotal_Lineas: TBCDField;
    SQLQuery_List_PresupTotal_Mano_Obra: TBCDField;
    SQLQuery_List_PresupTotal_Materiales: TBCDField;
    SQLQuery_List_PresupTotal_Resto: TBCDField;
    SQLQuery_List_PresupTotal_Total: TBCDField;
    SQLQuery_List_PresupVencimientos_1_Dias: TSmallintField;
    SQLQuery_List_PresupVencimientos_automaticos_SN: TStringField;
    SQLQuery_List_PresupVencimientos_Cantidad: TSmallintField;
    SQLQuery_List_PresupVencimientos_Dias_Entre: TSmallintField;
    SQLQuery_Pdo: TSQLQuery;
    SQLQuery_Pdoagencias_transporte_id_proveedores: TLargeintField;
    SQLQuery_PdoCerrado_SN: TStringField;
    SQLQuery_PdoChange_Id_User: TLargeintField;
    SQLQuery_PdoChange_WHEN: TDateTimeField;
    SQLQuery_PdoCodigo_Postal: TStringField;
    SQLQuery_PdoCONCEPTO_SEPA: TStringField;
    SQLQuery_PdoCta_Bco_BIC_SWIFT: TStringField;
    SQLQuery_PdoCta_Bco_Codigo_Postal: TStringField;
    SQLQuery_PdoCta_Bco_Cuenta: TStringField;
    SQLQuery_PdoCta_Bco_Digito_Control: TStringField;
    SQLQuery_PdoCta_Bco_Direccion: TStringField;
    SQLQuery_PdoCta_Bco_Direccion_Numero: TStringField;
    SQLQuery_PdoCta_Bco_Direccion_Piso_Letra: TStringField;
    SQLQuery_PdoCta_Bco_Entidad: TStringField;
    SQLQuery_PdoCta_Bco_IBAN: TStringField;
    SQLQuery_PdoCta_Bco_id_paises: TLargeintField;
    SQLQuery_PdoCta_Bco_id_poblaciones: TLargeintField;
    SQLQuery_PdoCta_Bco_id_provincias: TLargeintField;
    SQLQuery_PdoCta_Bco_Mandato_Fecha_de_Firma: TDateTimeField;
    SQLQuery_PdoCta_Bco_Mandato_Ref: TStringField;
    SQLQuery_PdoCta_Bco_Sucursal: TStringField;
    SQLQuery_PdoDel_Id_User: TLargeintField;
    SQLQuery_PdoDel_WHEN: TDateTimeField;
    SQLQuery_PdoDel_WHY: TStringField;
    SQLQuery_PdoDescuento_Comercial_1: TBCDField;
    SQLQuery_PdoDescuento_Comercial_2: TBCDField;
    SQLQuery_PdoDescuento_Final: TBCDField;
    SQLQuery_PdoDescuento_Pronto_Pago: TBCDField;
    SQLQuery_PdoDireccion: TStringField;
    SQLQuery_PdoDireccion_Numero: TStringField;
    SQLQuery_PdoDireccion_Piso_Letra: TStringField;
    SQLQuery_PdoEnvio_Bultos: TLongintField;
    SQLQuery_PdoEnvio_Codigo_Postal: TStringField;
    SQLQuery_PdoEnvio_Condiciones_Entrega: TStringField;
    SQLQuery_PdoEnvio_Con_Quien_Hablar: TStringField;
    SQLQuery_PdoEnvio_Direccion: TStringField;
    SQLQuery_PdoEnvio_Direccion_Numero: TStringField;
    SQLQuery_PdoEnvio_Direccion_Piso_Letra: TStringField;
    SQLQuery_PdoEnvio_eMail: TStringField;
    SQLQuery_PdoEnvio_FAX: TStringField;
    SQLQuery_PdoEnvio_Fecha_Recogida_Prevista: TDateTimeField;
    SQLQuery_PdoEnvio_id_paises: TLargeintField;
    SQLQuery_PdoEnvio_id_poblaciones: TLargeintField;
    SQLQuery_PdoEnvio_id_provincias: TLargeintField;
    SQLQuery_PdoEnvio_Movil: TStringField;
    SQLQuery_PdoEnvio_Portes: TBCDField;
    SQLQuery_PdoEnvio_Portes_Pagados_SN: TStringField;
    SQLQuery_PdoEnvio_Tfno_Fijo_1: TStringField;
    SQLQuery_PdoEnvio_Tfno_Fijo_2: TStringField;
    SQLQuery_PdoFAX: TStringField;
    SQLQuery_PdoFecha: TDateTimeField;
    SQLQuery_PdoFecha_Pedido_Proveedor: TDateTimeField;
    SQLQuery_PdoForma_pago_Dia_1: TSmallintField;
    SQLQuery_PdoForma_pago_Dia_2: TSmallintField;
    SQLQuery_PdoForma_pago_Vacaciones_Dia_Fin: TSmallintField;
    SQLQuery_PdoForma_pago_Vacaciones_Dia_Inicio: TSmallintField;
    SQLQuery_PdoForma_pago_Vacaciones_Mes_Fin: TSmallintField;
    SQLQuery_PdoForma_pago_Vacaciones_Mes_Inicio: TSmallintField;
    SQLQuery_Pdoid: TLargeintField;
    SQLQuery_Pdoid_almacenes: TLargeintField;
    SQLQuery_Pdoid_empresas: TLargeintField;
    SQLQuery_Pdoid_formas_pago: TLargeintField;
    SQLQuery_Pdoid_paises: TLargeintField;
    SQLQuery_Pdoid_poblaciones: TLargeintField;
    SQLQuery_Pdoid_proveedores: TLargeintField;
    SQLQuery_Pdoid_provincias: TLargeintField;
    SQLQuery_PdoInsert_Id_User: TLargeintField;
    SQLQuery_PdoInsert_WHEN: TDateTimeField;
    SQLQuery_PdoIVA_con_Recargo_SN: TStringField;
    SQLQuery_PdoIVA_Excluido_SN: TStringField;
    SQLQuery_PdoMovil: TStringField;
    SQLQuery_Pdonif_cif: TStringField;
    SQLQuery_Pdonombre_comercial: TStringField;
    SQLQuery_Pdonombre_propietario: TStringField;
    SQLQuery_PdoNumero_Pedido: TLargeintField;
    SQLQuery_PdoNumero_Pedido_Proveedor: TStringField;
    SQLQuery_PdoNumero_Presupuesto: TLargeintField;
    SQLQuery_PdoObservaciones: TStringField;
    SQLQuery_PdoOT_Cta_Bco_descripcion_pais: TStringField;
    SQLQuery_PdoOT_Cta_Bco_descripcion_poblacion: TStringField;
    SQLQuery_PdoOT_Cta_Bco_descripcion_provincia: TStringField;
    SQLQuery_PdoOT_descripcion_almacen: TStringField;
    SQLQuery_PdoOT_descripcion_empresa: TStringField;
    SQLQuery_PdoOT_descripcion_forma_pago: TStringField;
    SQLQuery_PdoOT_descripcion_pais: TStringField;
    SQLQuery_PdoOT_descripcion_poblacion: TStringField;
    SQLQuery_PdoOT_descripcion_proveedor: TStringField;
    SQLQuery_PdoOT_descripcion_provincia: TStringField;
    SQLQuery_PdoOT_descripcion_transportista: TStringField;
    SQLQuery_PdoOT_el_Pedido: TStringField;
    SQLQuery_PdoOT_Envio_descripcion_pais: TStringField;
    SQLQuery_PdoOT_Envio_descripcion_poblacion: TStringField;
    SQLQuery_PdoOT_Envio_descripcion_provincia: TStringField;
    SQLQuery_PdoOT_Movil_transportista: TStringField;
    SQLQuery_PdoOT_tfno_1_transportista: TStringField;
    SQLQuery_PdoRetencion: TBCDField;
    SQLQuery_PdoSerie_Pedido: TStringField;
    SQLQuery_PdoSerie_Presupuesto: TStringField;
    SQLQuery_PdoTfno_Fijo_1: TStringField;
    SQLQuery_PdoTfno_Fijo_2: TStringField;
    SQLQuery_PdoTotal_Lineas: TBCDField;
    SQLQuery_PdoTotal_Mano_Obra: TBCDField;
    SQLQuery_PdoTotal_Materiales: TBCDField;
    SQLQuery_PdoTotal_Resto: TBCDField;
    SQLQuery_PdoTotal_Total: TBCDField;
    SQLQuery_PdoVencimientos_1_Dias: TSmallintField;
    SQLQuery_PdoVencimientos_automaticos_SN: TStringField;
    SQLQuery_PdoVencimientos_Cantidad: TSmallintField;
    SQLQuery_PdoVencimientos_Dias_Entre: TSmallintField;
    SQLQuery_Pdo_Detalles: TSQLQuery;
    SQLQuery_Pdo_DetallesChange_Id_User: TLargeintField;
    SQLQuery_Pdo_DetallesChange_WHEN: TDateTimeField;
    SQLQuery_Pdo_DetallesCodigoBarras_Referencia: TStringField;
    SQLQuery_Pdo_DetallesDel_Id_User: TLargeintField;
    SQLQuery_Pdo_DetallesDel_WHEN: TDateTimeField;
    SQLQuery_Pdo_DetallesDel_WHY: TStringField;
    SQLQuery_Pdo_Detallesdescripcion: TStringField;
    SQLQuery_Pdo_Detallesdescripcion_para_TPV: TStringField;
    SQLQuery_Pdo_DetallesDescuento_Comercial_1: TBCDField;
    SQLQuery_Pdo_DetallesDescuento_Comercial_2: TBCDField;
    SQLQuery_Pdo_DetallesExcluido_su_Cobro_SN: TStringField;
    SQLQuery_Pdo_DetallesFecha_Movimiento: TDateTimeField;
    SQLQuery_Pdo_Detallesid_almacenes: TLargeintField;
    SQLQuery_Pdo_Detallesid_articulos: TLargeintField;
    SQLQuery_Pdo_Detallesid_impuestos_Compras: TLargeintField;
    SQLQuery_Pdo_Detallesid_pedidos: TLargeintField;
    SQLQuery_Pdo_Detallesid_proveedores: TLargeintField;
    SQLQuery_Pdo_DetallesInsert_Id_User: TLargeintField;
    SQLQuery_Pdo_DetallesInsert_WHEN: TDateTimeField;
    SQLQuery_Pdo_DetallesNumero_Albaran: TLargeintField;
    SQLQuery_Pdo_DetallesOT_descripcion_almacen: TStringField;
    SQLQuery_Pdo_DetallesOT_descripcion_articulo: TStringField;
    SQLQuery_Pdo_DetallesOT_descripcion_impuesto: TStringField;
    SQLQuery_Pdo_DetallesOT_Descripcion_para_DbGrid1: TStringField;
    SQLQuery_Pdo_DetallesOT_Sumado_A_Ftra_SN: TStringField;
    SQLQuery_Pdo_DetallesOT_Tanto_Por_Ciento: TBCDField;
    SQLQuery_Pdo_DetallesOT_Tipo_de_articulo: TStringField;
    SQLQuery_Pdo_DetallesOT_Total_Dto_1_1: TFloatField;
    SQLQuery_Pdo_DetallesOT_Total_Dto_2_1: TFloatField;
    SQLQuery_Pdo_DetallesOT_Total_Linea_con_Dtos1: TFloatField;
    SQLQuery_Pdo_DetallesOT_Total_Linea_sin_Dtos1: TFloatField;
    SQLQuery_Pdo_DetallesPVP: TBCDField;
    SQLQuery_Pdo_DetallesRepetir_Cada: TLongintField;
    SQLQuery_Pdo_DetallesSerie_Albaran: TStringField;
    SQLQuery_Pdo_DetallesUnidades: TBCDField;
    SQLQuery_Presup: TSQLQuery;
    SQLQuery_Presupagencias_transporte_id_proveedores: TLargeintField;
    SQLQuery_PresupCerrado_SN: TStringField;
    SQLQuery_PresupChange_Id_User: TLargeintField;
    SQLQuery_PresupChange_WHEN: TDateTimeField;
    SQLQuery_PresupCodigo_Postal: TStringField;
    SQLQuery_PresupCONCEPTO_SEPA: TStringField;
    SQLQuery_PresupCta_Bco_BIC_SWIFT: TStringField;
    SQLQuery_PresupCta_Bco_Codigo_Postal: TStringField;
    SQLQuery_PresupCta_Bco_Cuenta: TStringField;
    SQLQuery_PresupCta_Bco_Digito_Control: TStringField;
    SQLQuery_PresupCta_Bco_Direccion: TStringField;
    SQLQuery_PresupCta_Bco_Direccion_Numero: TStringField;
    SQLQuery_PresupCta_Bco_Direccion_Piso_Letra: TStringField;
    SQLQuery_PresupCta_Bco_Entidad: TStringField;
    SQLQuery_PresupCta_Bco_IBAN: TStringField;
    SQLQuery_PresupCta_Bco_id_paises: TLargeintField;
    SQLQuery_PresupCta_Bco_id_poblaciones: TLargeintField;
    SQLQuery_PresupCta_Bco_id_provincias: TLargeintField;
    SQLQuery_PresupCta_Bco_Mandato_Fecha_de_Firma: TDateTimeField;
    SQLQuery_PresupCta_Bco_Mandato_Ref: TStringField;
    SQLQuery_PresupCta_Bco_Sucursal: TStringField;
    SQLQuery_PresupDel_Id_User: TLargeintField;
    SQLQuery_PresupDel_WHEN: TDateTimeField;
    SQLQuery_PresupDel_WHY: TStringField;
    SQLQuery_PresupDescuento_Comercial_1: TBCDField;
    SQLQuery_PresupDescuento_Comercial_2: TBCDField;
    SQLQuery_PresupDescuento_Final: TBCDField;
    SQLQuery_PresupDescuento_Pronto_Pago: TBCDField;
    SQLQuery_PresupDireccion: TStringField;
    SQLQuery_PresupDireccion_Numero: TStringField;
    SQLQuery_PresupDireccion_Piso_Letra: TStringField;
    SQLQuery_PresupEnvio_Bultos: TLongintField;
    SQLQuery_PresupEnvio_Codigo_Postal: TStringField;
    SQLQuery_PresupEnvio_Condiciones_Entrega: TStringField;
    SQLQuery_PresupEnvio_Con_Quien_Hablar: TStringField;
    SQLQuery_PresupEnvio_Direccion: TStringField;
    SQLQuery_PresupEnvio_Direccion_Numero: TStringField;
    SQLQuery_PresupEnvio_Direccion_Piso_Letra: TStringField;
    SQLQuery_PresupEnvio_eMail: TStringField;
    SQLQuery_PresupEnvio_FAX: TStringField;
    SQLQuery_PresupEnvio_Fecha_Recogida_Prevista: TDateTimeField;
    SQLQuery_PresupEnvio_id_paises: TLargeintField;
    SQLQuery_PresupEnvio_id_poblaciones: TLargeintField;
    SQLQuery_PresupEnvio_id_provincias: TLargeintField;
    SQLQuery_PresupEnvio_Movil: TStringField;
    SQLQuery_PresupEnvio_Portes: TBCDField;
    SQLQuery_PresupEnvio_Portes_Pagados_SN: TStringField;
    SQLQuery_PresupEnvio_Tfno_Fijo_1: TStringField;
    SQLQuery_PresupEnvio_Tfno_Fijo_2: TStringField;
    SQLQuery_PresupFAX: TStringField;
    SQLQuery_PresupFecha: TDateTimeField;
    SQLQuery_PresupFecha_Presupuesto_Proveedor: TDateTimeField;
    SQLQuery_PresupForma_pago_Dia_1: TSmallintField;
    SQLQuery_PresupForma_pago_Dia_2: TSmallintField;
    SQLQuery_PresupForma_pago_Vacaciones_Dia_Fin: TSmallintField;
    SQLQuery_PresupForma_pago_Vacaciones_Dia_Inicio: TSmallintField;
    SQLQuery_PresupForma_pago_Vacaciones_Mes_Fin: TSmallintField;
    SQLQuery_PresupForma_pago_Vacaciones_Mes_Inicio: TSmallintField;
    SQLQuery_Presupid: TLargeintField;
    SQLQuery_Presupid_almacenes: TLargeintField;
    SQLQuery_Presupid_empresas: TLargeintField;
    SQLQuery_Presupid_formas_pago: TLargeintField;
    SQLQuery_Presupid_paises: TLargeintField;
    SQLQuery_Presupid_poblaciones: TLargeintField;
    SQLQuery_Presupid_proveedores: TLargeintField;
    SQLQuery_Presupid_provincias: TLargeintField;
    SQLQuery_PresupInsert_Id_User: TLargeintField;
    SQLQuery_PresupInsert_WHEN: TDateTimeField;
    SQLQuery_PresupIVA_con_Recargo_SN: TStringField;
    SQLQuery_PresupIVA_Excluido_SN: TStringField;
    SQLQuery_PresupMovil: TStringField;
    SQLQuery_Presupnif_cif: TStringField;
    SQLQuery_Presupnombre_comercial: TStringField;
    SQLQuery_Presupnombre_propietario: TStringField;
    SQLQuery_PresupNumero_Presupuesto: TLargeintField;
    SQLQuery_PresupNumero_Presupuesto_Proveedor: TStringField;
    SQLQuery_PresupObservaciones: TStringField;
    SQLQuery_PresupOT_Cta_Bco_descripcion_pais: TStringField;
    SQLQuery_PresupOT_Cta_Bco_descripcion_poblacion: TStringField;
    SQLQuery_PresupOT_Cta_Bco_descripcion_provincia: TStringField;
    SQLQuery_PresupOT_descripcion_almacen: TStringField;
    SQLQuery_PresupOT_descripcion_empresa: TStringField;
    SQLQuery_PresupOT_descripcion_forma_pago: TStringField;
    SQLQuery_PresupOT_descripcion_pais: TStringField;
    SQLQuery_PresupOT_descripcion_poblacion: TStringField;
    SQLQuery_PresupOT_descripcion_proveedor: TStringField;
    SQLQuery_PresupOT_descripcion_provincia: TStringField;
    SQLQuery_PresupOT_descripcion_transportista: TStringField;
    SQLQuery_PresupOT_el_Presupuesto: TStringField;
    SQLQuery_PresupOT_Envio_descripcion_pais: TStringField;
    SQLQuery_PresupOT_Envio_descripcion_poblacion: TStringField;
    SQLQuery_PresupOT_Envio_descripcion_provincia: TStringField;
    SQLQuery_PresupOT_Movil_transportista: TStringField;
    SQLQuery_PresupOT_tfno_1_transportista: TStringField;
    SQLQuery_PresupRetencion: TBCDField;
    SQLQuery_PresupSerie_Presupuesto: TStringField;
    SQLQuery_PresupTfno_Fijo_1: TStringField;
    SQLQuery_PresupTfno_Fijo_2: TStringField;
    SQLQuery_PresupTotal_Lineas: TBCDField;
    SQLQuery_PresupTotal_Mano_Obra: TBCDField;
    SQLQuery_PresupTotal_Materiales: TBCDField;
    SQLQuery_PresupTotal_Resto: TBCDField;
    SQLQuery_PresupTotal_Total: TBCDField;
    SQLQuery_PresupVencimientos_1_Dias: TSmallintField;
    SQLQuery_PresupVencimientos_automaticos_SN: TStringField;
    SQLQuery_PresupVencimientos_Cantidad: TSmallintField;
    SQLQuery_PresupVencimientos_Dias_Entre: TSmallintField;
    SQLQuery_Presup_Detalles: TSQLQuery;
    SQLQuery_Presup_DetallesChange_Id_User: TLargeintField;
    SQLQuery_Presup_DetallesChange_WHEN: TDateTimeField;
    SQLQuery_Presup_DetallesCodigoBarras_Referencia: TStringField;
    SQLQuery_Presup_DetallesDel_Id_User: TLargeintField;
    SQLQuery_Presup_DetallesDel_WHEN: TDateTimeField;
    SQLQuery_Presup_DetallesDel_WHY: TStringField;
    SQLQuery_Presup_Detallesdescripcion: TStringField;
    SQLQuery_Presup_Detallesdescripcion_para_TPV: TStringField;
    SQLQuery_Presup_DetallesDescuento_Comercial_1: TBCDField;
    SQLQuery_Presup_DetallesDescuento_Comercial_2: TBCDField;
    SQLQuery_Presup_DetallesExcluido_su_Cobro_SN: TStringField;
    SQLQuery_Presup_DetallesFecha_Movimiento: TDateTimeField;
    SQLQuery_Presup_Detallesid_almacenes: TLargeintField;
    SQLQuery_Presup_Detallesid_articulos: TLargeintField;
    SQLQuery_Presup_Detallesid_impuestos_Compras: TLargeintField;
    SQLQuery_Presup_Detallesid_presupuestos: TLargeintField;
    SQLQuery_Presup_Detallesid_proveedores: TLargeintField;
    SQLQuery_Presup_DetallesInsert_Id_User: TLargeintField;
    SQLQuery_Presup_DetallesInsert_WHEN: TDateTimeField;
    SQLQuery_Presup_DetallesNumero_Pedido: TLargeintField;
    SQLQuery_Presup_DetallesOT_descripcion_almacen: TStringField;
    SQLQuery_Presup_DetallesOT_descripcion_articulo: TStringField;
    SQLQuery_Presup_DetallesOT_descripcion_impuesto: TStringField;
    SQLQuery_Presup_DetallesOT_Descripcion_para_DbGrid1: TStringField;
    SQLQuery_Presup_DetallesOT_Sumado_A_Ftra_SN: TStringField;
    SQLQuery_Presup_DetallesOT_Tanto_Por_Ciento: TBCDField;
    SQLQuery_Presup_DetallesOT_Tipo_de_articulo: TStringField;
    SQLQuery_Presup_DetallesOT_Total_Dto_1_1: TFloatField;
    SQLQuery_Presup_DetallesOT_Total_Dto_2_1: TFloatField;
    SQLQuery_Presup_DetallesOT_Total_Linea_con_Dtos1: TFloatField;
    SQLQuery_Presup_DetallesOT_Total_Linea_sin_Dtos1: TFloatField;
    SQLQuery_Presup_DetallesPVP: TBCDField;
    SQLQuery_Presup_DetallesRepetir_Cada: TLongintField;
    SQLQuery_Presup_DetallesSerie_Pedido: TStringField;
    SQLQuery_Presup_DetallesUnidades: TBCDField;
    SQLQuery_Presup_Impuestos: TSQLQuery;
    SQLQuery_Presup_ImpuestosBase: TBCDField;
    SQLQuery_Presup_ImpuestosChange_Id_User: TLargeintField;
    SQLQuery_Presup_ImpuestosChange_WHEN: TDateTimeField;
    SQLQuery_Presup_ImpuestosDel_Id_User: TLargeintField;
    SQLQuery_Presup_ImpuestosDel_WHEN: TDateTimeField;
    SQLQuery_Presup_ImpuestosDel_WHY: TStringField;
    SQLQuery_Presup_Impuestosid_impuestos: TLargeintField;
    SQLQuery_Presup_Impuestosid_presupuestos: TLargeintField;
    SQLQuery_Presup_ImpuestosImporte: TBCDField;
    SQLQuery_Presup_ImpuestosInsert_Id_User: TLargeintField;
    SQLQuery_Presup_ImpuestosInsert_WHEN: TDateTimeField;
    SQLQuery_Presup_ImpuestosOT_descripcion_impuesto: TStringField;
    SQLQuery_Presup_ImpuestosOT_Tanto_Por_Ciento: TBCDField;
    TabSheet_Busqueda_Concreta: TTabSheet;
    TabSheet_Filtros_Generales: TTabSheet;

    procedure Boton_Elegir_PeriodoClick(Sender: TObject);
    function  Filtrar_Listado_Presup( param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
    procedure Filtrar_Impuestos_Totales;
    procedure SQLQuery_List_PresupCalcFields(DataSet: TDataSet);
    procedure Sumar_Totales;
    procedure Refrescar_Registros_Impuestos;
    function  Filtrar_Lineas_Impuestos( param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
    procedure Presentar_Datos_Totales( param_Actualizar_Totales : Byte );
    procedure Convertir_Integro_en_Pedido(param_msg : TStrings);
    procedure Cerrarlo;
    procedure Comprobar_Si_Hay_Lineas_Detalle_Sin_Pedido(param_msg : TStrings);
    procedure Insertar_Registro;
    procedure Editar_Registro(param_Introducimos_Linea_Detalle_SN : Boolean);
    procedure Borrar_Registro;
    procedure BitBtn_Convertir_Integro_en_PedidoClick(Sender: TObject);
    procedure ComboBox_FiltrosChange(Sender: TObject);
    function  Crear_Pedido_su_Cabecera( param_Fecha : TDateTime ) : TEmpresas;
    procedure Crear_Pedido_su_Cabecera_2;
    procedure Crear_Pedido_su_Detalle( param_Fecha : TDateTime; param_Serie, param_Numero : ShortString; param_Todas_Las_Lineas : Boolean );
    procedure Crear_Pedido_su_Detalle_2( param_Fecha : TDateTime; param_id, param_Serie, param_Numero : ShortString; param_Todas_Las_Lineas : Boolean );
    procedure Crear_Pedido_su_Detalle_3( param_Fecha : TDateTime; param_id, param_Serie, param_Numero : ShortString; param_Todas_Las_Lineas : Boolean );
    procedure Cerramos_Tabla_Pedidos_Cabecera;
    procedure Cerramos_Tabla_Pedidos_Detalles;
    procedure BitBtn_Considerar_como_cerradoClick(Sender: TObject);
    procedure Boton_Elegir_EmpresaClick(Sender: TObject);
    procedure Boton_Elegir_Forma_PagoClick(Sender: TObject);
    procedure Boton_Elegir_id_AlmacenesClick(Sender: TObject);
    procedure Boton_Elegir_id_proveedoresClick(Sender: TObject);
    procedure DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Edit_Descripcion_EmpresaClick(Sender: TObject);
    procedure Edit_Descripcion_Forma_PagoClick(Sender: TObject);
    procedure Edit_Descripcion_id_AlmacenesClick(Sender: TObject);
    procedure Edit_Descripcion_id_proveedoresClick(Sender: TObject);
    procedure Refrescar_Registros;
    procedure Refrescar_Registros_Detalles;
    procedure BitBtn_FiltrarClick(Sender: TObject);
    procedure BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
    procedure Presentar_Datos;
    procedure no_Tocar;
    procedure BitBtn_ImprimirClick(Sender: TObject);
    procedure BitBtn_SALIRClick(Sender: TObject);
    procedure BitBtn_SeleccionarClick(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure Seleccionado_Rgtro;
    procedure Filtrar_Pedidos_Cabecera( param_Fecha, param_Serie, param_Numero : ShortString );
    procedure Filtrar_Pedidos_Detalles( param_id : ShortString );
    function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
    procedure Filtrar_tablas_ligadas;
    function  Filtrar_Lineas_Detalles( param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
    procedure Filtrar_Principal_Sin_Preguntar;
    procedure Cerramos_Tablas;
    procedure Cerramos_Tablas_Ligadas;
    procedure DBGrid_PrincipalCellClick(Column: TColumn);
    procedure DBGrid_PrincipalDblClick(Sender: TObject);
    procedure DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure para_Empezar;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup_BajasClick(Sender: TObject);
    procedure SQLQuery_PdoAfterPost(DataSet: TDataSet);
    procedure SQLQuery_PdoBeforePost(DataSet: TDataSet);
    procedure SQLQuery_Pdo_DetallesAfterPost(DataSet: TDataSet);
    procedure SQLQuery_Pdo_DetallesBeforePost(DataSet: TDataSet);
    procedure SQLQuery_Pdo_DetallesCalcFields(DataSet: TDataSet);
    procedure SQLQuery_PresupAfterPost(DataSet: TDataSet);
    procedure SQLQuery_PresupAfterScroll(DataSet: TDataSet);
    procedure SQLQuery_PresupBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_PresupBeforePost(DataSet: TDataSet);
    procedure SQLQuery_PresupCalcFields(DataSet: TDataSet);
    procedure SQLQuery_Presup_DetallesAfterPost(DataSet: TDataSet);
    procedure SQLQuery_Presup_DetallesBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_Presup_DetallesBeforePost(DataSet: TDataSet);
    procedure SQLQuery_Presup_DetallesCalcFields(DataSet: TDataSet);

  private
    { private declarations }
    private_Salir_OK                  : Boolean;
    private_Order_By                  : array of TOrder_By;
    private_Order_By_Lineas_Impuestos : array of TOrder_By;
    private_Order_By_Pto_Detalles     : array of TOrder_By;
    private_ultima_fecha_entrada      : String;
  public
    { public declarations }
    public_Solo_Ver           : Boolean;
    public_Elegimos           : Boolean;
    public_Menu_Worked        : Integer;
    public_Rgtro_Seleccionado : Boolean;
  end;

var
  form_presupuestos_compras_000: Tform_presupuestos_compras_000;

implementation

{$R *.lfm}

uses dm_presupuestos_compras, menu, presupuestos_compras_001;

{ Tform_presupuestos_compras_000 }

procedure Tform_presupuestos_compras_000.FormActivate(Sender: TObject);
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

procedure Tform_presupuestos_compras_000.FormCreate(Sender: TObject);
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

    DateTimePicker_Desde_Ntra_Referencia.Date := StrToDate( '01/01/' + IntToStr(var_Year - 1) );
    DateTimePicker_Hasta_Ntra_Referencia.Date := StrToDate( '31/12/' + IntToStr(var_Year + 1) );
end;

procedure Tform_presupuestos_compras_000.RadioGroup_BajasClick(Sender: TObject);
begin
    Refrescar_Registros;
end;

procedure Tform_presupuestos_compras_000.SQLQuery_PdoAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'pedidos_compras',
                       DataModule_Presupuestos_Compras.SQLTransaction_Pedido,
                       SQLQuery_Pdo,
                       false {Devolver_hacemos_commit_alFinalizar} );

    // Refrescar_Registros;
end;

procedure Tform_presupuestos_compras_000.SQLQuery_PdoBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Pdo );
end;

procedure Tform_presupuestos_compras_000.SQLQuery_Pdo_DetallesAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'pedidos_compras_detalles',
                       DataModule_Presupuestos_Compras.SQLTransaction_Pedido_Detalles,
                       SQLQuery_Pdo_Detalles,
                       false {Devolver_hacemos_commit_alFinalizar} );

    // Refrescar_Registros_Detalles;
end;

procedure Tform_presupuestos_compras_000.SQLQuery_Pdo_DetallesBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Pdo_Detalles );
end;

procedure Tform_presupuestos_compras_000.FormClose(Sender: TObject; var CloseAction: TCloseAction);
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

procedure Tform_presupuestos_compras_000.FormDestroy(Sender: TObject);
begin
    Cerramos_Tablas;
end;

procedure Tform_presupuestos_compras_000.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_Presupuestos_Compras.SQLConnector_Presup,
                      DataModule_Presupuestos_Compras.SQLTransaction_Presup,
                      SQLQuery_Presup ) = false then UTI_GEN_Salir;

    DataModule_Presupuestos_Compras.Free;
end;

procedure Tform_presupuestos_compras_000.Cerramos_Tablas_Ligadas;
begin
    if UTI_TB_Cerrar( DataModule_Presupuestos_Compras.SQLConnector_Presup_Detalles,
                      DataModule_Presupuestos_Compras.SQLTransaction_Presup_Detalles,
                      SQLQuery_Presup_Detalles ) = false then UTI_GEN_Salir;
end;

procedure Tform_presupuestos_compras_000.SQLQuery_PresupCalcFields(DataSet: TDataSet);
begin
    with SQLQuery_Presup do
    begin
        if Trim(FieldByName('Serie_Presupuesto').AsString) <> '' then
        begin
            FieldByName('OT_el_Presupuesto').AsString := Trim(FieldByName('Serie_Presupuesto').AsString) +
                                                         '-' +
                                                         Trim(FieldByName('Numero_Presupuesto').AsString);
        end else begin
            FieldByName('OT_el_Presupuesto').AsString := Trim(FieldByName('Numero_Presupuesto').AsString);
        end;
    end;
end;

procedure Tform_presupuestos_compras_000.SQLQuery_PresupAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'presupuestos_compras',
                       DataModule_Presupuestos_Compras.SQLTransaction_Presup,
                       SQLQuery_Presup,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros;
end;

procedure Tform_presupuestos_compras_000.SQLQuery_PresupBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Presup );
end;

procedure Tform_presupuestos_compras_000.SQLQuery_PresupAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure Tform_presupuestos_compras_000.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    If public_Elegimos then
         Seleccionado_Rgtro
    else Editar_Registro(false);
end;

procedure Tform_presupuestos_compras_000.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then
    begin
        If public_Elegimos then
             Seleccionado_Rgtro
        else Editar_Registro(false);
    end;
end;

procedure Tform_presupuestos_compras_000.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

procedure Tform_presupuestos_compras_000.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure Tform_presupuestos_compras_000.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_presupuestos_compras_000.BitBtn_SeleccionarClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
end;

procedure Tform_presupuestos_compras_000.Seleccionado_Rgtro;
begin
    private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    public_Rgtro_Seleccionado := true;
    Close;
end;

procedure Tform_presupuestos_compras_000.DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
begin
    //Filtrar_tablas_ligadas;

    case Button of
        nbInsert : begin
            Insertar_Registro;
            Abort;
        end;

        nbEdit : begin
            Editar_Registro(false);
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

procedure Tform_presupuestos_compras_000.no_Tocar;
begin
end;

procedure Tform_presupuestos_compras_000.Presentar_Datos;
begin
     /// guardar por lo que pueda pasar
end;

procedure Tform_presupuestos_compras_000.BitBtn_FiltrarClick(Sender: TObject);
var var_msg : TStrings;
begin
    // ********************************************************************************************* //
    // ** COMPROBAMOS SI EL MARGEN DE FECHAS ESTA BIEN INTRODUCIDO                                ** //
    // ********************************************************************************************* //
    var_msg := TStringList.Create;

    if UTI_GEN_Comprobar_2_Fechas( DateTimePicker_Desde_Ntra_Referencia,
                                   DateTimePicker_Hasta_Ntra_Referencia ) = false then
    begin
        var_msg.Add('* Fechas mal introducidas para margen de presupuestos.');
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

procedure Tform_presupuestos_compras_000.BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if SQLQuery_Presup.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'presupuestos_compras',
                                           SQLQuery_Presup,
                                           DataSource_Presup,
                                           DBGrid_Principal );
        end;
    end;
end;

procedure Tform_presupuestos_compras_000.Refrescar_Registros;
var var_Serie_Presupuesto  : ShortString;
    var_Numero_Presupuesto : Int64;
begin
    Try
        // ********************************************************************************************* //
        // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
        // ********************************************************************************************* //
        var_Serie_Presupuesto  := '';
        var_Numero_Presupuesto := 0;

        with SQLQuery_Presup do
        begin
            if RecordCount > 0 then
            begin
                var_Serie_Presupuesto  := FieldByName('Serie_Presupuesto').AsString;
                var_Numero_Presupuesto := FieldByName('Numero_Presupuesto').Value;
            end;
        end;

        Filtrar_Principal_Sin_Preguntar;

        if Trim(var_Serie_Presupuesto) <> '' then
        begin
             SQLQuery_Presup.Locate( 'Serie_Presupuesto;Numero_Presupuesto',
                                     VarArrayOf( [ var_Serie_Presupuesto, var_Numero_Presupuesto ] ),
                                     [] );
        end;
    Except
    end;
end;

procedure Tform_presupuestos_compras_000.Refrescar_Registros_Detalles;
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
    if SQLQuery_Presup.State <> dsEdit then Exit;

    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_id := '';

    with SQLQuery_Presup_Detalles do
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
    var_SQL_ADD.Add( 'pcd.id_presupuestos = ' + SQLQuery_Presup.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_ver_Bajas := 1; // asi no se ven las bajas hasta que no lo pida el form de altas/modif de líneas
    if UTI_GEN_Form_Abierto_Ya('form_presupuestos_compras_001') = true then
    begin
        var_ver_Bajas := form_presupuestos_compras_001.RadioGroup_Bajas.ItemIndex;
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
            // ** es id_proveedores + id del registro                                             ** //
            // ************************************************************************************* //
            SQLQuery_Presup_Detalles.Last;
        end else begin
            // ************************************************************************************* //
            // ** Estabamos en una edición, así que ya conocíamos la id del registro. Por lo que  ** //
            // ** hago el locate por esta id                                                      ** //
            // ************************************************************************************* //
            SQLQuery_Presup_Detalles.Locate('id', StrToInt64(var_id), []);
        end;

    end;
    var_SQL_ADD.Free;
end;

function Tform_presupuestos_compras_000.Filtrar_Lineas_Detalles( param_ver_bajas : ShortInt;
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
    param_Lineas_OrderBy.Text := private_Order_By_Pto_Detalles[0].Memo_OrderBy;
  end;

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  Result := UTI_TB_Filtrar( private_Order_By_Pto_Detalles,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Presup_Detalles,
                                                          'presupuestos_compras_detalles',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Presup_Detalles,
                                                          'presupuestos_compras_detalles',
                                                          'i' ),
                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_Presupuestos_Compras.SQLTransaction_Presup_Detalles,
                            DataModule_Presupuestos_Compras.SQLConnector_Presup_Detalles,
                            SQLQuery_Presup_Detalles,

                            // name_tabla,
                            'pcd',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT pcd.*,' + ' ' +
                                   'al.descripcion AS OT_descripcion_almacen,' + ' ' +

                                   'a.descripcion_para_TPV AS OT_descripcion_articulo,' + ' ' +
                                   'a.Tipo_de_articulo AS OT_Tipo_de_articulo,' + ' ' +

                                   'i.descripcion AS OT_descripcion_impuesto,' + ' ' +
                                   'i.Tanto_Por_Ciento AS OT_Tanto_Por_Ciento,' + ' ' +
                                   'i.Sumado_A_Ftra_SN AS OT_Sumado_A_Ftra_SN' + ' ' +

                            'FROM presupuestos_compras_detalles AS pcd' + ' ' +

                            'LEFT JOIN almacenes AS al' + ' ' +
                            'ON pcd.id_almacenes = al.id' + ' ' +

                            'LEFT JOIN articulos AS a' + ' ' +
                            'ON pcd.id_articulos = a.id' + ' ' +

                            'LEFT JOIN impuestos AS i' + ' ' +
                            'ON pcd.id_impuestos_Compras = i.id' + ' ',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  if UTI_GEN_Form_Abierto_Ya('form_presupuestos_compras_001') = true then
  begin
    form_presupuestos_compras_001.Poner_Total_Lineas_Detalle;
  end;

  var_a_Filtrar_Plus.Free;
end;

procedure Tform_presupuestos_compras_000.Filtrar_Principal_Sin_Preguntar;
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

procedure Tform_presupuestos_compras_000.SQLQuery_Presup_DetallesBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Presup_Detalles );
end;

procedure Tform_presupuestos_compras_000.SQLQuery_Presup_DetallesAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'presupuestos_compras_detalles',
                       DataModule_Presupuestos_Compras.SQLTransaction_Presup_Detalles,
                       SQLQuery_Presup_Detalles,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros_Detalles;
end;

procedure Tform_presupuestos_compras_000.SQLQuery_PresupBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Presup );
end;

procedure Tform_presupuestos_compras_000.SQLQuery_Presup_DetallesBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Presup_Detalles );
end;

procedure Tform_presupuestos_compras_000.Boton_Elegir_Forma_PagoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_FormasPago( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Forma_Pago.Text          := Trim(var_Registro.id_1);
        Edit_Descripcion_Forma_Pago.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_presupuestos_compras_000.Edit_Descripcion_Forma_PagoClick(Sender: TObject);
begin
    Edit_id_Forma_Pago.Text          := '';
    Edit_Descripcion_Forma_Pago.Text := '';
end;

procedure Tform_presupuestos_compras_000.Boton_Elegir_EmpresaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Empresas( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Empresas.Text         := Trim(var_Registro.id_1);
        Edit_Descripcion_Empresa.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_presupuestos_compras_000.Edit_Descripcion_EmpresaClick(Sender: TObject);
begin
    Edit_id_Empresas.Text         := '';
    Edit_Descripcion_Empresa.Text := '';
end;

procedure Tform_presupuestos_compras_000.Boton_Elegir_id_proveedoresClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Proveedores( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_proveedores.Text             := Trim(var_Registro.id_1);
        Edit_Descripcion_id_proveedores.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_presupuestos_compras_000.Edit_Descripcion_id_proveedoresClick(Sender: TObject);
begin
    Edit_id_proveedores.Text          := '';
    Edit_Descripcion_id_proveedores.Text := '';
end;

procedure Tform_presupuestos_compras_000.Boton_Elegir_id_AlmacenesClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Almacenes( '', '', true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Almacenes.Text             := Trim(var_Registro.id_1);
        Edit_Descripcion_id_Almacenes.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_presupuestos_compras_000.Edit_Descripcion_id_AlmacenesClick(Sender: TObject);
begin
    Edit_id_Almacenes.Text             := '';
    Edit_Descripcion_id_Almacenes.Text := '';
end;

procedure Tform_presupuestos_compras_000.DBGrid_PrincipalDrawColumnCell( Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState );
var var_Color_Normal : TColor;
begin
    with Sender as TDBGrid do
    begin
        if form_presupuestos_compras_000.SQLQuery_Presup.RecordCount = 0 then Exit;

        var_Color_Normal := Canvas.Brush.Color;

        // ***************************************************************************************** //
        // ** Primero comprobamos si es un registro dado de baja o no                             ** //
        // ***************************************************************************************** //
        if not form_presupuestos_compras_000.SQLQuery_Presup.FieldByName('Del_WHEN').IsNull then
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
                if (Column.FieldName <> 'Estado') then
                begin
                    Canvas.font.Color := clBlack;
                end;
            end;
        end;

        // ***************************************************************************************** //
        // ** Ahora paso a dibujar una celda normal con los colores elegidos o una                ** //
        // ** dibujada                                                                            ** //
        // ***************************************************************************************** //
        if (Column.FieldName <> 'Estado') then
        begin
            // ********************************************************************************* //
            // ** No es una de las columnas a dibujar por lo que la pinto con los             ** //
            // ** colores elegidos                                                            ** //
            // ********************************************************************************* //
            DefaultDrawColumnCell(Rect, DataCol, Column, State);
        end else begin
            // ********************************************************************************* //
            // ** Es una de las columnas a dibujar                                            ** //
            // ********************************************************************************* //
            // ** COLUMNA CONFIRMADA                                                          ** //
            // ********************************************************************************* //
            if Column.FieldName = 'Estado'  then
            begin
              { Esto no lo pondré porque si trabaja en red y por teléfono sería muy lento pedirle
                todos los registros al servidor

                if UTI_COMPRAS_Esta_Cerrado_SN( 'presupuestos_compras',
                                               SQLQuery_Presup.FieldByName('id').AsString ) = 'S' then }
                if SQLQuery_Presup.FieldByName('Cerrado_SN').Value = 'S' then
                     Canvas.StretchDraw(Rect, Image_Candado.Picture.Graphic)
                else DefaultDrawColumnCell(Rect, DataCol, Column, State);
            end;
        end;

        Canvas.Font.Color := var_Color_Normal;
    end;
end;

procedure Tform_presupuestos_compras_000.BitBtn_Considerar_como_cerradoClick(Sender: TObject);
begin
    Cerrarlo;
end;

procedure Tform_presupuestos_compras_000.Cerramos_Tabla_Pedidos_Cabecera;
begin
    if UTI_TB_Cerrar( DataModule_Presupuestos_Compras.SQLConnector_Pedido,
                      DataModule_Presupuestos_Compras.SQLTransaction_Pedido,
                      SQLQuery_Pdo ) = false then UTI_GEN_Salir;
end;

procedure Tform_presupuestos_compras_000.Crear_Pedido_su_Detalle_3( param_Fecha : TDateTime;
                                                                    param_id,
                                                                    param_Serie,
                                                                    param_Numero : ShortString;
                                                                    param_Todas_Las_Lineas : Boolean );
var var_id : ShortString;
begin
    with SQLQuery_Presup_Detalles do
    begin
        // ***************************************************************************************** //
        // ** Si la línea ya fué convertida pues no la convertimos                                ** //
        // ***************************************************************************************** //
        if (not FieldByName('Serie_Pedido').IsNull)  or
           (not FieldByName('Numero_Pedido').IsNull) then Exit;

        // ***************************************************************************************** //
        // ** Si la línea está dada de baja pues no la convertimos                                ** //
        // ***************************************************************************************** //
        if not FieldByName('Del_WHEN').IsNull then Exit;

        var_id := FieldByName('id').AsString;

        // ***************************************************************************************** //
        // ** Si la línea está bloqueada o no se puede bloquear pues no la convertimos            ** //
        // ***************************************************************************************** //
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

        // ***************************************************************************************** //
        // ** Grabamos el numero/serie del pedido que crea esta línea de presupuestos             ** //
        // ***************************************************************************************** //
        FieldByName('Serie_Pedido').AsString  := Trim(param_Serie);
        FieldByName('Numero_Pedido').AsString := Trim(param_Numero);

        FieldByName('Change_WHEN').Value    := param_Fecha;
        FieldByName('Change_Id_User').Value := Form_Menu.public_User;

        // ***************************************************************************************** //
        // ** GRABAMOS LA línea de detalle del presupuesto con los cambios realizados             ** //
        // ***************************************************************************************** //
        UTI_RGTRO_Grabar_Antes( 'presupuestos_compras_detalles', SQLQuery_Presup_Detalles );

        // ***************************************************************************************** //
        // ** Liberamos línea de detalle del presupuesto                                          ** //
        // ***************************************************************************************** //
        UTI_RGTRO_UnLock( 'presupuestos_compras_detalles', var_id );
    end;

    with SQLQuery_Pdo_Detalles do
    begin
        Insert;

        FieldByName('id_pedidos').AsString    := Trim(param_id);
        FieldByName('Fecha_Movimiento').Value := Int(param_Fecha);

        FieldByName('Insert_WHEN').Value      := param_Fecha;
        FieldByName('Insert_Id_User').Value   := Form_Menu.public_User;

        if not SQLQuery_Presup_Detalles.FieldByName('id_proveedores').IsNull then
        begin
            FieldByName('id_proveedores').AsString := SQLQuery_Presup_Detalles.FieldByName('id_proveedores').AsString;
        end;

        if not SQLQuery_Presup_Detalles.FieldByName('Unidades').IsNull then
        begin
            FieldByName('Unidades').AsString := SQLQuery_Presup_Detalles.FieldByName('Unidades').AsString;
        end;

        if not SQLQuery_Presup_Detalles.FieldByName('id_almacenes').IsNull then
        begin
            FieldByName('id_almacenes').AsString := SQLQuery_Presup_Detalles.FieldByName('id_almacenes').AsString;
        end;

        if not SQLQuery_Presup_Detalles.FieldByName('CodigoBarras_Referencia').IsNull then
        begin
            FieldByName('CodigoBarras_Referencia').AsString := SQLQuery_Presup_Detalles.FieldByName('CodigoBarras_Referencia').AsString;
        end;

        if not SQLQuery_Presup_Detalles.FieldByName('id_articulos').IsNull then
        begin
            FieldByName('id_articulos').AsString := SQLQuery_Presup_Detalles.FieldByName('id_articulos').AsString;
        end;

        if not SQLQuery_Presup_Detalles.FieldByName('Repetir_Cada').IsNull then
        begin
            FieldByName('Repetir_Cada').AsString := SQLQuery_Presup_Detalles.FieldByName('Repetir_Cada').AsString;
        end;

        if not SQLQuery_Presup_Detalles.FieldByName('descripcion').IsNull then
        begin
            FieldByName('descripcion').AsString := SQLQuery_Presup_Detalles.FieldByName('descripcion').AsString;
        end;

        if not SQLQuery_Presup_Detalles.FieldByName('descripcion_para_TPV').IsNull then
        begin
            FieldByName('descripcion_para_TPV').AsString := SQLQuery_Presup_Detalles.FieldByName('descripcion_para_TPV').AsString;
        end;

        if not SQLQuery_Presup_Detalles.FieldByName('PVP').IsNull then
        begin
            FieldByName('PVP').AsString := SQLQuery_Presup_Detalles.FieldByName('PVP').AsString;
        end;

        if not SQLQuery_Presup_Detalles.FieldByName('id_impuestos_Compras').IsNull then
        begin
            FieldByName('id_impuestos_Compras').AsString := SQLQuery_Presup_Detalles.FieldByName('id_impuestos_Compras').AsString;
        end;

        if not SQLQuery_Presup_Detalles.FieldByName('Descuento_Comercial_1').IsNull then
        begin
            FieldByName('Descuento_Comercial_1').AsString := SQLQuery_Presup_Detalles.FieldByName('Descuento_Comercial_1').AsString;
        end;

        if not SQLQuery_Presup_Detalles.FieldByName('Descuento_Comercial_2').IsNull then
        begin
            FieldByName('Descuento_Comercial_2').AsString := SQLQuery_Presup_Detalles.FieldByName('Descuento_Comercial_2').AsString;
        end;

        if not SQLQuery_Presup_Detalles.FieldByName('Excluido_su_Cobro_SN').IsNull then
        begin
            FieldByName('Excluido_su_Cobro_SN').AsString := SQLQuery_Presup_Detalles.FieldByName('Excluido_su_Cobro_SN').AsString;
        end;

        // ***************************************************************************************** //
        // ** GRABAMOS la linea de detalle del pedido que estamos creando                         ** //
        // ***************************************************************************************** //
        UTI_RGTRO_Grabar_Antes( 'pedidos_compras_detalles', SQLQuery_Pdo_Detalles );
    end;
end;

procedure Tform_presupuestos_compras_000.Crear_Pedido_su_Detalle_2( param_Fecha : TDateTime;
                                                                    param_id,
                                                                    param_Serie,
                                                                    param_Numero : ShortString;
                                                                    param_Todas_Las_Lineas : Boolean );
var var_id : ShortString;
begin
    with SQLQuery_Presup_Detalles do
    begin
        var_id := FieldByName('id').AsString;

        if param_Todas_Las_Lineas = True then
        begin
            // ************************************************************************************* //
            // ** Insertamos todas las líneas de detalle                                          ** //
            // ************************************************************************************* //
            First;
            While not eof do
            begin
                Crear_Pedido_su_Detalle_3( param_Fecha,
                                           param_id,
                                           param_Serie,
                                           param_Numero,
                                           param_Todas_Las_Lineas );
                Next;
            end;
        end else begin
            // ************************************************************************************* //
            // ** Insertamos solo la línea elegida                                                ** //
            // ************************************************************************************* //
            Crear_Pedido_su_Detalle_3( param_Fecha,
                                       param_id,
                                       param_Serie,
                                       param_Numero,
                                       param_Todas_Las_Lineas );
        end;

        // ***************************************************************************************** //
        // ** Refrescamos las lineas de detalle del presupuesto pues se les acaba de cambiar si  ** //
        // ** pertenecen a un pedido                                                             ** //
        // ***************************************************************************************** //
        Filtrar_tablas_ligadas;

        // ***************************************************************************************** //
        // ** Volvemos a quedarnos en la línea que teníamos elegida en la tabla de detalles       ** //
        // ***************************************************************************************** //
        Locate('id', StrToInt64(var_id), []);
    end;
end;

procedure Tform_presupuestos_compras_000.SQLQuery_Pdo_DetallesCalcFields(DataSet: TDataSet);
begin
    UTI_LINEAS_Poner_Totales_Linea_Detalle( SQLQuery_Pdo_Detalles );
end;

procedure Tform_presupuestos_compras_000.Cerramos_Tabla_Pedidos_Detalles;
begin
    if UTI_TB_Cerrar( DataModule_Presupuestos_Compras.SQLConnector_Pedido_Detalles,
                      DataModule_Presupuestos_Compras.SQLTransaction_Pedido_Detalles,
                      SQLQuery_Pdo_Detalles ) = false then UTI_GEN_Salir;
end;

procedure Tform_presupuestos_compras_000.ComboBox_FiltrosChange(Sender: TObject);
begin
    Memo_OrderBy.Lines.Clear;
    Memo_OrderBy.Lines.Add( private_Order_By[ComboBox_Filtros.ItemIndex].Memo_OrderBy );
    BitBtn_FiltrarClick(Nil);
end;

procedure Tform_presupuestos_compras_000.Insertar_Registro;
var var_msg    : TStrings;
    var_Serie  : String;
    var_Numero : String;
begin
    with SQLQuery_Presup do
    begin
        var_msg := TStringList.Create;

        if UTI_USR_Permiso_SN(public_Menu_Worked, 'A', True) = True then
        begin
            if public_Solo_Ver = True then
            begin
                var_msg.Add(rs_Solo_Visualizar);
                UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            end else begin
                Insert;

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
                UTI_EMPRE_Asignar_Empresa(SQLQuery_Presup);
                UTI_ALMAC_Asignar_almacen(SQLQuery_Presup);

                FieldByName('Cerrado_SN').AsString := 'N';

                Application.CreateForm(Tform_presupuestos_compras_001, form_presupuestos_compras_001);

                if Trim(private_ultima_fecha_entrada) <> '' then
                begin
                    // var_msg := TStringList.Create;
                    // var_msg.Add( '¿Quieres poner como fecha de entrada la última usada ( ' +
                                 // Trim(private_ultima_fecha_entrada) + ' )?' );

                    // if UTI_GEN_Aviso(true, var_msg, '¿SI O NO?', True, True) = true then
                    // begin
                        FieldByName('Fecha').AsString := Trim(private_ultima_fecha_entrada);
                    // end;
                    // var_msg.Free;
                end;

                form_presupuestos_compras_001.DBGrid_Detalles.Color := clSilver;

                form_presupuestos_compras_001.RadioGroup_Bajas.ItemIndex := RadioGroup_Bajas.ItemIndex;

                form_presupuestos_compras_001.para_Empezar;

                form_presupuestos_compras_001.ShowModal;
                if form_presupuestos_compras_001.public_Pulso_Aceptar = true then
                begin
                    FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
                    FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                    private_ultima_fecha_entrada := FieldByName('Fecha').AsString;

                    var_Serie  := FieldByName('Serie_Presupuesto').AsString;
                    var_Numero := FieldByName('Numero_Presupuesto').AsString;

                    Presentar_Datos_Totales(0);

                    UTI_RGTRO_Grabar_Antes( 'presupuestos_compras', SQLQuery_Presup );

                    form_presupuestos_compras_001.Free;

                    if (FieldByName('Serie_Presupuesto').AsString = var_Serie)   and
                       (FieldByName('Numero_Presupuesto').AsString = var_Numero) then
                    begin
                        Editar_Registro(true);
                    end;
                end else begin
                    Cancel;
                    form_presupuestos_compras_001.Free;
                end;
            end;
        end;

        var_msg.Free;
    end;
end;

procedure Tform_presupuestos_compras_000.Editar_Registro(param_Introducimos_Linea_Detalle_SN : Boolean);
var var_msg : TStrings;
    var_id  : ShortString;
begin
    with SQLQuery_Presup do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
        begin
            var_id := FieldByName('id').AsString;

            if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
            begin
                if UTI_RGTRO_isLock( 'presupuestos_compras',
                                     var_id,
                                     true ) = true then
                begin
                    Exit;
                end else begin
                    if UTI_RGTRO_Lock( 'presupuestos_compras',
                                       var_id ) = true then
                         Edit
                    else Exit;
                end;

                // ********************************************************************************* //
                // ** Continuamos                                                                 ** //
                // ********************************************************************************* //
                Application.CreateForm(Tform_presupuestos_compras_001, form_presupuestos_compras_001);

                // form_presupuestos_compras_001.Height := 698;

                form_presupuestos_compras_001.RadioGroup_Bajas.ItemIndex := RadioGroup_Bajas.ItemIndex;
                form_presupuestos_compras_001.public_Menu_Worked         := public_Menu_Worked;

                if public_Solo_Ver = true then
                begin
                    form_presupuestos_compras_001.public_Solo_Ver := true;
                end;

                form_presupuestos_compras_001.para_Empezar;

                form_presupuestos_compras_001.ShowModal;
                if form_presupuestos_compras_001.public_Pulso_Aceptar = true then
                begin
                    if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( SQLQuery_Presup ) = true then
                    begin
                        FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                        FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                        Presentar_Datos_Totales(0);

                        UTI_RGTRO_Grabar_Antes( 'presupuestos_compras', SQLQuery_Presup );
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

                form_presupuestos_compras_001.Free;

                UTI_RGTRO_UnLock( 'presupuestos_compras', var_id );
            end;
        end else begin
            var_msg.Add(rs_no_Hay_Rgtros);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        end;
    end;

    var_msg.Free;
end;

procedure Tform_presupuestos_compras_000.Borrar_Registro;
var var_msg                   : TStrings;
    var_Estado_Lineas_Detalle : TUTI_COMPRAS_Ctdad_Rgtros_Detalle;
begin
    with SQLQuery_Presup do
    begin
        var_msg := TStringList.Create;

        // ***************************************************************************************** //
        // ** Comprobar si tiene alguna línea convertida en pedido, si la tiene no borramos       ** //
        // ***************************************************************************************** //
        var_Estado_Lineas_Detalle := UTI_COMPRAS_Estado_Lineas_Detalle( SQLQuery_Presup_Detalles,
                                                                       'Serie_Pedido',
                                                                       'Numero_Pedido' );

        if var_Estado_Lineas_Detalle.Total_Lineas_Sin_Marcar <> SQLQuery_Presup_Detalles.RecordCount then
        begin
            var_msg.Add( '* Tiene líneas de algún pedido. No podemos borrarlo.' );
        end;

        // ***************************************************************************************** //
        // ** Si el presupuesto está cerrado no podemos hacer ningún pedido de él                 ** //
        // ***************************************************************************************** //
        if UTI_COMPRAS_Esta_Cerrado_SN( 'presupuestos_compras',
                                        FieldByName('id').AsString ) = 'S' then
        begin
            var_msg.Add( 'Presupuesto CERRADO.');
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
        if UTI_RGTRO_isLock( 'presupuestos_compras',
                             Trim(SQLQuery_Presup.FieldByName('id').AsString),
                             true ) = true then
        begin
            // ************************************************************************************* //
            // ** Registro bloqueado, no podemos hacer nada con él                                ** //
            // ************************************************************************************* //
            Exit;
        end;

        // ***************************************************************************************** //
        // ** Continuamos con el borrado                                                          ** //
        // ***************************************************************************************** //
        if UTI_USR_Permiso_SN(public_Menu_Worked, 'B', True) = True then
        begin
            UTI_RGTRO_Borrar_Cabecera_y_Detalle( 'id_presupuestos',
                                                 'presupuestos_compras',
                                                 'presupuestos_compras_detalles',
                                                 SQLQuery_Presup,
                                                 SQLQuery_Presup_Detalles,
                                                 public_Solo_Ver,
                                                 public_Menu_Worked );
        end;
    end;
end;

procedure Tform_presupuestos_compras_000.SQLQuery_Presup_DetallesCalcFields(DataSet: TDataSet);
begin
    UTI_LINEAS_Poner_Totales_Linea_Detalle( SQLQuery_Presup_Detalles );
end;

procedure Tform_presupuestos_compras_000.Comprobar_Si_Hay_Lineas_Detalle_Sin_Pedido(param_msg : TStrings);
var var_Lo_Cerramos           : Boolean;
    var_Estado_Lineas_Detalle : TUTI_COMPRAS_Ctdad_Rgtros_Detalle;
begin
    // ********************************************************************************************* //
    // ** Comprobar si tiene alguna línea sin convertir en pedido, si no la tiene pues se cierra  ** //
    // ** el presupuesto                                                                          ** //
    // ********************************************************************************************* //
    var_Lo_Cerramos := false;

    var_Estado_Lineas_Detalle := UTI_COMPRAS_Estado_Lineas_Detalle( SQLQuery_Presup_Detalles,
                                                                    'Serie_Pedido',
                                                                    'Numero_Pedido' );

    if var_Estado_Lineas_Detalle.Total_Lineas_Sin_Marcar = 0 then
    begin
        if var_Estado_Lineas_Detalle.Total_Lineas_Marcadas > 0 then
        begin
            param_msg.Add( '* Todas las líneas de detalle de este presupuesto pertenecen a algún pedido.' +
                           ' Lo marcamos automáticamente como cerrado' );
        end;

        if var_Estado_Lineas_Detalle.Total_Lineas = 0 then
        begin
            param_msg.Add( '* Era un presupuesto sin líneas de detalle. Pero como se convirtió integro ' +
                           'en pedido, lo marcamos automáticamente como cerrado' );
        end;

        var_Lo_Cerramos := true;
    end;

    if var_Lo_Cerramos = true then
    begin
        // ***************************************************************************************** //
        // ** Como no tiene ninguna línea libre hay que cerrarlo porque todo el pedido ya fue     ** //
        // ** convertido en un albarán                                                            ** //
        // ***************************************************************************************** //
        Cerrarlo;
    end;
end;

procedure Tform_presupuestos_compras_000.Cerrarlo;
var var_msg                   : TStrings;
    var_id                    : ShortString;
    var_Estado_Lineas_Detalle : TUTI_COMPRAS_Ctdad_Rgtros_Detalle;
    var_Lo_Cerramos           : Boolean;
begin
    // ********************************************************************************************* //
    // ** Si el presupuesto está borrado, no permitimos hacer nada con el.                        ** //
    // ********************************************************************************************* //
    if not SQLQuery_Presup.FieldByName('Del_WHEN').IsNull then
    begin
        var_msg := TStringList.Create;
        var_msg.Add( '* Es un presupuesto borrado, no se puede modificar nada de el. ' +
                     'Si desea modificarlo, primero hay que darlo de alta anteriormente.' );
        UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        var_msg.Free;

        Exit;
    end;

    with SQLQuery_Presup do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
        begin
            var_id := FieldByName('id').AsString;

            if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
            begin
                if UTI_RGTRO_isLock( 'presupuestos_compras',
                                     var_id,
                                     true ) = true then
                begin
                    Exit;
                end else begin
                    if UTI_RGTRO_Lock( 'presupuestos_compras',
                                       var_id ) = true then
                         Edit
                    else Exit;
                end;

                FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                if UTI_COMPRAS_Esta_Cerrado_SN( 'presupuestos_compras',
                                                FieldByName('id').AsString ) <> 'S' then
                begin
                    FieldByName('Cerrado_SN').Value := 'S'
                end else begin
                    FieldByName('Cerrado_SN').Value := 'N';

                    // ***************************************************************************** //
                    // ** Después de considerarlo como no cerrado, vamos a comprobar si tiene     ** //
                    // ** alguna linea de detalle si convertir en pedido. Si no tiene ninguna     ** //
                    // ** libre lo vuelve a considerar como cerrado                               ** //
                    // ***************************************************************************** //
                    var_Lo_Cerramos := false;

                    var_Estado_Lineas_Detalle := UTI_COMPRAS_Estado_Lineas_Detalle( SQLQuery_Presup_Detalles,
                                                                                    'Serie_Pedido',
                                                                                    'Numero_Pedido' );

                    if var_Estado_Lineas_Detalle.Total_Lineas_Sin_Marcar = 0 then
                    begin
                        // ** si no hay lineas sin marcar no puedo abrirlo si hay
                        if var_Estado_Lineas_Detalle.Total_Lineas_Marcadas > 0 then
                        begin
                            var_msg.Clear;
                            var_msg.Add( '* No se puede liberar pues todas sus líneas de detalle ' +
                                         'han sido convertidas en pedidos.' );

                            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);

                            var_Lo_Cerramos := true;
                        end;
                    end;

                    if var_Lo_Cerramos = true then
                    begin
                      { var_msg.Add( '* Todas las líneas de detalle de este pedido pertenecen a algún albarán.' +
                                     ' Lo marcamos automáticamente como cerrado' );

                        UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False); }

                        // ************************************************************************* //
                        // ** Como no tiene ninguna línea libre hay que cerrarlo porque todo el   ** //
                        // ** pedido fue convertido en albaran/es                                 ** //
                        // ************************************************************************* //
                        FieldByName('Cerrado_SN').Value := 'S'
                    end;
                end;

                Presentar_Datos_Totales(0);

                UTI_RGTRO_Grabar_Antes( 'presupuestos_compras', SQLQuery_Presup );

                UTI_RGTRO_UnLock( 'presupuestos_compras', var_id );
            end;
        end else begin
            var_msg.Add(rs_no_Hay_Rgtros);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        end;
    end;

    var_msg.Free;
end;

procedure Tform_presupuestos_compras_000.Filtrar_Pedidos_Cabecera( param_Fecha,
                                                                   param_Serie,
                                                                   param_Numero : ShortString );
var
  var_a_Filtrar : TStrings;
  var_Filtros   : TStrings;
  var_Order_By  : TStrings;
  var_SQL_ADD   : TStrings;
begin
    var_SQL_ADD := TStringList.Create;

    var_a_Filtrar := TStringList.Create;
    var_Filtros   := TStringList.Create;
    var_Order_By  := TStringList.Create;

    var_a_Filtrar.Clear;
    var_Filtros.Clear;
    var_Order_By.Clear;

    // ********************************************************************************************* //
    // ** AHORA PONDREMOS EL RESTO DE LOS FILTROS QUE NO SON GENERALES                            ** //
    // ********************************************************************************************* //
    // ********************************************************************************************* //
    // ** Ahora buscaremos por la FECHA                                                           ** //
    // ********************************************************************************************* //
    if Trim(param_Fecha) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pdoc.Fecha <= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(Int(StrToDateTime(param_Fecha)), false) + ' 23:59:59' ) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pdoc.Fecha >= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(Int(StrToDateTime(param_Fecha)), false) + ' 00:00:00' ) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** AHORA PONDREMOS EL RESTO DE LOS FILTROS QUE NO SON GENERALES                            ** //
    // ********************************************************************************************* //
    // ** Primero buscaremos en la serie                                                          ** //
    // ********************************************************************************************* //
    if Trim(param_Serie) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pdoc.Serie_Pedido = ' + UTI_GEN_Comillas(Trim(param_Serie)) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos en el NUMERO                                                           ** //
    // ********************************************************************************************* //
    if Trim(param_Numero) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pdoc.Numero_Pedido = ' + UTI_GEN_Comillas(Trim(param_Numero)) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Pasamos a filtrar los registros                                                         ** //
    // ********************************************************************************************* //
    var_Filtros.Add('');
    var_Order_By.Add('pdoc.Serie_Pedido ASC, pdoc.Numero_Pedido ASC');

    { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
      y que por lo se debe de permitir modificarlos en ningún módulo }

    UTI_TB_Filtrar( private_Order_By,

                    // Delete_SQL,
                    '',

                    // Update_SQL,
                    UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Pdo,
                                                  'pedidos_compras',
                                                  'u' ),

                    // Insert_SQL,
                    UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Pdo,
                                                  'pedidos_compras',
                                                  'i' ),

                    // var_ctdad_Rgtros,
                    -1,

                    DataModule_Presupuestos_Compras.SQLTransaction_Pedido,
                    DataModule_Presupuestos_Compras.SQLConnector_Pedido,
                    SQLQuery_Pdo,

                    // name_tabla,
                    'pdoc',

                    1, // ASI NO SE VEN LAS BAJAS

                    // SELECT_SQL,
                    'SELECT pdoc.*,' + ' ' +

                           'trp.nombre_propietario AS OT_descripcion_transportista,' + ' ' +
                           'trp.Tfno_Fijo_1 AS OT_tfno_1_transportista,' + ' ' +
                           'trp.Movil AS OT_Movil_transportista,' + ' ' +

                           'env_pb.descripcion AS OT_Envio_descripcion_poblacion,' + ' ' +
                           'env_pr.descripcion AS OT_Envio_descripcion_provincia,' + ' ' +
                           'env_ps.descripcion AS OT_Envio_descripcion_pais,' + ' ' +

                           'pb.descripcion AS OT_descripcion_poblacion,' + ' ' +
                           'pr.descripcion AS OT_descripcion_provincia,' + ' ' +
                           'ps.descripcion AS OT_descripcion_pais,' + ' ' +

                           'ct_pb.descripcion AS OT_Cta_Bco_descripcion_poblacion,' + ' ' +
                           'ct_pr.descripcion AS OT_Cta_Bco_descripcion_provincia,' + ' ' +
                           'ct_ps.descripcion AS OT_Cta_Bco_descripcion_pais,' + ' ' +

                           'alm.descripcion AS OT_descripcion_almacen,' + ' ' +

                           'e.nombre_comercial AS OT_descripcion_empresa,' + ' ' +
                           'p.nombre_propietario AS OT_descripcion_proveedor,' + ' ' +

                           'fp.descripcion AS OT_descripcion_forma_pago' + ' ' +

                    'FROM pedidos_compras AS pdoc' + ' ' +

                    'LEFT JOIN proveedores AS trp' + ' ' +
                    'ON pdoc.agencias_transporte_id_proveedores = trp.id' + ' ' +

                    'LEFT JOIN poblaciones AS env_pb' + ' ' +
                    'ON pdoc.Envio_id_poblaciones = env_pb.id' + ' ' +

                    'LEFT JOIN provincias AS env_pr' + ' ' +
                    'ON pdoc.Envio_id_provincias = env_pr.id' + ' ' +

                    'LEFT JOIN paises AS env_ps' + ' ' +
                    'ON pdoc.Envio_id_paises = env_ps.id' + ' ' +

                    'LEFT JOIN poblaciones AS pb' + ' ' +
                    'ON pdoc.id_poblaciones = pb.id' + ' ' +

                    'LEFT JOIN provincias AS pr' + ' ' +
                    'ON pdoc.id_provincias = pr.id' + ' ' +

                    'LEFT JOIN paises AS ps' + ' ' +
                    'ON pdoc.id_paises = ps.id' + ' ' +

                    'LEFT JOIN poblaciones AS ct_pb' + ' ' +
                    'ON pdoc.Cta_Bco_id_poblaciones = ct_pb.id' + ' ' +

                    'LEFT JOIN provincias AS ct_pr' + ' ' +
                    'ON pdoc.Cta_Bco_id_provincias = ct_pr.id' + ' ' +

                    'LEFT JOIN paises AS ct_ps' + ' ' +
                    'ON pdoc.Cta_Bco_id_paises = ct_ps.id' + ' ' +

                    'LEFT JOIN almacenes AS alm' + ' ' +
                    'ON pdoc.id_almacenes = alm.id' + ' ' +

                    'LEFT JOIN empresas AS e' + ' ' +
                    'ON pdoc.id_empresas = e.id' + ' ' +

                    'LEFT JOIN proveedores AS p' + ' ' +
                    'ON pdoc.id_proveedores = p.id' + ' ' +

                    'LEFT JOIN formas_pago AS fp' + ' ' +
                    'ON pdoc.id_formas_pago = fp.id' + ' ',

                    var_Filtros {Memo_Filtros.Lines},
                    var_Order_By {Memo_OrderBy.Lines},
                    var_a_Filtrar,

                    false, {param_Cambiamos_Filtro}
                    false,   // param_ver_SQL_despues_Abrir : Boolean;
                    true ); // no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

    var_a_Filtrar.Free;
    var_Filtros.Free;
    var_Order_By.Free;
    var_SQL_ADD.Free;
end;

procedure Tform_presupuestos_compras_000.Filtrar_Pedidos_Detalles( param_id : ShortString );
var
  var_a_Filtrar : TStrings;
  var_Filtros   : TStrings;
  var_Order_By  : TStrings;
  var_SQL_ADD   : TStrings;
begin
    var_SQL_ADD   := TStringList.Create;
    var_a_Filtrar := TStringList.Create;
    var_Filtros   := TStringList.Create;
    var_Order_By  := TStringList.Create;

    var_a_Filtrar.Clear;
    var_Filtros.Clear;
    var_Order_By.Clear;

    // ********************************************************************************************* //
    // ** AHORA PONDREMOS EL RESTO DE LOS FILTROS QUE NO SON GENERALES                            ** //
    // ********************************************************************************************* //
    // ** Filtraremos por la id de la cabecera                                                    ** //
    // ********************************************************************************************* //
    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'pdocd.id_pedidos = ' + Trim(param_id) );
    UTI_TB_SQL_ADD( false,
                    var_a_Filtrar,
                    var_SQL_ADD );

    // ********************************************************************************************* //
    // ** Pasamos a filtrar los registros                                                         ** //
    // ********************************************************************************************* //
    var_Filtros.Add('');
    var_Order_By.Add('pdocd.id_pedidos ASC, pdocd.id ASC');

    { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
      y que por lo se debe de permitir modificarlos en ningún módulo }

    UTI_TB_Filtrar( private_Order_By,

                    // Delete_SQL,
                    '',

                    // Update_SQL,
                    UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Pdo_Detalles,
                                                  'pedidos_compras_detalles',
                                                  'u' ),

                    // Insert_SQL,
                    UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Pdo_Detalles,
                                                  'pedidos_compras_detalles',
                                                  'i' ),

                    // var_ctdad_Rgtros,
                    -1,

                    DataModule_Presupuestos_Compras.SQLTransaction_Pedido_Detalles,
                    DataModule_Presupuestos_Compras.SQLConnector_Pedido_Detalles,
                    SQLQuery_Pdo_Detalles,

                    // name_tabla,
                    'pdocd',

                    1, // ASI NO SE VEN LAS BAJAS

                    // SELECT_SQL,
                    'SELECT pdocd.*,' + ' ' +
                           'al.descripcion AS OT_descripcion_almacen,' + ' ' +

                           'a.descripcion_para_TPV AS OT_descripcion_articulo,' + ' ' +
                           'a.Tipo_de_articulo AS OT_Tipo_de_articulo,' + ' ' +

                           'i.descripcion AS OT_descripcion_impuesto,' + ' ' +
                           'i.Tanto_Por_Ciento AS OT_Tanto_Por_Ciento,' + ' ' +
                           'i.Sumado_A_Ftra_SN AS OT_Sumado_A_Ftra_SN' + ' ' +

                    'FROM pedidos_compras_detalles AS pdocd' + ' ' +

                    'LEFT JOIN almacenes AS al' + ' ' +
                    'ON pdocd.id_almacenes = al.id' + ' ' +

                    'LEFT JOIN articulos AS a' + ' ' +
                    'ON pdocd.id_articulos = a.id' + ' ' +

                    'LEFT JOIN impuestos AS i' + ' ' +
                    'ON pdocd.id_impuestos_Compras = i.id' + ' ',

                    var_Filtros {Memo_Filtros.Lines},
                    var_Order_By {Memo_OrderBy.Lines},
                    var_a_Filtrar,

                    false, {param_Cambiamos_Filtro}
                    false,   // param_ver_SQL_despues_Abrir : Boolean;
                    true ); // no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

    var_a_Filtrar.Free;
    var_Filtros.Free;
    var_Order_By.Free;
    var_SQL_ADD.Free;
end;

procedure Tform_presupuestos_compras_000.Refrescar_Registros_Impuestos;
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
    if SQLQuery_Presup.State <> dsEdit then Exit;

    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_id := '';

    with SQLQuery_Presup_Impuestos do
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
    var_SQL_ADD.Add( 'pci.id_presupuestos = ' + SQLQuery_Presup.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_ver_Bajas := RadioGroup_Bajas.ItemIndex;
    if UTI_GEN_Form_Abierto_Ya('form_presupuestos_compras_001') = true then
    begin
        var_ver_Bajas := form_presupuestos_compras_001.RadioGroup_Bajas.ItemIndex;
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
            SQLQuery_Presup_Impuestos.Last;
        end else begin
            // ************************************************************************************* //
            // ** Estabamos en una edición, así que ya conocíamos la id del registro. Por lo que  ** //
            // ** hago el locate por esta id                                                      ** //
            // ************************************************************************************* //
            SQLQuery_Presup_Impuestos.Locate('id', StrToInt64(var_id), []);
        end;

    end;
    var_SQL_ADD.Free;
end;

function Tform_presupuestos_compras_000.Filtrar_Lineas_Impuestos( param_ver_bajas : ShortInt;
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
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Presup_Impuestos,
                                                          'presupuestos_compras_impuestos',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Presup_Impuestos,
                                                          'presupuestos_compras_impuestos',
                                                          'i' ),

                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_Presupuestos_Compras.SQLTransaction_Presup_Imptos,
                            DataModule_Presupuestos_Compras.SQLConnector_Presup_Imptos,
                            SQLQuery_Presup_Impuestos,

                            // name_tabla,
                            'pci',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT pci.*,' + ' ' +

                                   'impto.descripcion AS OT_descripcion_impuesto,' + ' ' +
                                   'impto.Tanto_Por_Ciento AS OT_Tanto_Por_Ciento' + ' ' +

                            'FROM presupuestos_compras_impuestos AS pci' + ' ' +

                            'LEFT JOIN impuestos AS impto' + ' ' +
                            'ON pci.id_impuestos = impto.id',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_a_Filtrar_Plus.Free;
end;

procedure Tform_presupuestos_compras_000.Filtrar_tablas_ligadas;
var
  var_Lineas_Filtro  : TStrings;
  var_Lineas_OrderBy : TStrings;
  var_SQL_ADD        : TStrings;
begin
    var_SQL_ADD := TStringList.Create;

    if SQLQuery_Presup.RecordCount = 0 then Exit;

    if SQLQuery_Presup.State = dsInsert then
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
    var_SQL_ADD.Add( 'pcd.id_presupuestos = ' + SQLQuery_Presup.FieldByName('id').AsString );
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
    var_SQL_ADD.Add( 'pci.id_presupuestos = ' + SQLQuery_Presup.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_Lineas_OrderBy.Clear;
    Filtrar_Lineas_Impuestos( 1, // RadioGroup_Bajas.ItemIndex,  // asi no se ven las bajas hasta que no lo pida el form de altas/modif de líneas
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

procedure Tform_presupuestos_compras_000.Presentar_Datos_Totales( param_Actualizar_Totales : Byte );
var var_Calculo_Totales_Cabecera : TCalculo_Totales_por_Cabecera;
begin
    var_Calculo_Totales_Cabecera := UTI_LINEAS_poner_totales( 'presupuestos_compras',
                                                              SQLQuery_Presup.FieldByName('id').AsString );
    Refrescar_Registros_Impuestos;

    if param_Actualizar_Totales = 1 then
    begin
        with form_presupuestos_compras_001 do
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
end;

procedure Tform_presupuestos_compras_000.para_Empezar;
begin
    UTI_GEN_Traer_Trimestre( DateTimePicker_Desde_Ntra_Referencia,
                             DateTimePicker_Hasta_Ntra_Referencia );

    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    if UTI_GEN_Form_Abierto_Ya('DataModule_Presupuestos_Compras') = False then
    begin
        DataModule_Presupuestos_Compras := TDataModule_Presupuestos_Compras.Create(Application);
    end;

    // ********************************************************************************************* //
    // ** Preparamos los diferentes tipos de orden preconfigurados                                ** //
    // ********************************************************************************************* //
    // ** ALUMNOS/PROVEEDORES                                                                     ** //
    // ********************************************************************************************* //
    SetLength(private_Order_By, 5);

    private_Order_By[0].Titulo       := 'Por ntra.fecha de entrada + nº.de ntra.referencia';
    private_Order_By[0].Memo_OrderBy := 'pc.Fecha ASC, pc.Serie_Presupuesto ASC, pc.Numero_Presupuesto ASC';

    private_Order_By[1].Titulo       := 'Por el nº.de ntra.referencia'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[1].Memo_OrderBy := 'pc.Serie_Presupuesto ASC, pc.Numero_Presupuesto ASC';

    private_Order_By[2].Titulo       := 'Por empresa + fecha de entrada + nº.de ntra.referencia';
    private_Order_By[2].Memo_OrderBy := 'pc.id_empresas ASC, pc.Fecha ASC, pc.Serie_Presupuesto ASC, pc.Numero_Presupuesto ASC';

    private_Order_By[3].Titulo       := 'Por proveedor + fecha de entrada + nº.de ntra.referencia';
    private_Order_By[3].Memo_OrderBy := 'pc.id_proveedores ASC, pc.Fecha ASC, pc.Serie_Presupuesto ASC, pc.Numero_Presupuesto ASC';

    private_Order_By[4].Titulo       := 'Por proveedor + su fecha de pto. + su nº.de pto.';
    private_Order_By[4].Memo_OrderBy := 'pc.id_proveedores ASC, pc.Fecha_Presupuesto_Proveedor ASC, pc.Numero_Presupuesto_Proveedor ASC';

    Memo_OrderBy.Lines.Text          := private_Order_By[1].Memo_OrderBy;

    UTI_TB_Rellenar_ComboBox_Orden( true,
                                    ComboBox_Filtros,
                                    private_Order_By,
                                    1 );

    // ********************************************************************************************* //
    // ** LINEAS DETALLE                                                                          ** //
    // ********************************************************************************************* //
    SetLength(private_Order_By_Pto_Detalles, 1);

    private_Order_By_Pto_Detalles[0].Titulo       := 'Por id del presupuesto'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_Pto_Detalles[0].Memo_OrderBy := 'pcd.id_presupuestos ASC, pcd.id ASC';

    // ********************************************************************************************* //
    // ** IMPUESTOS                                                                               ** //
    // ********************************************************************************************* //
    SetLength(private_Order_By_Lineas_Impuestos, 1);

    private_Order_By_Lineas_Impuestos[0].Titulo       := 'Por id del presupuesto'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_Lineas_Impuestos[0].Memo_OrderBy := 'pci.id_presupuestos ASC, pci.id_impuestos ASC';

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

function Tform_presupuestos_compras_000.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
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
    // ** Primero buscaremos en la serie del presupuesto                                          ** //
    // ********************************************************************************************* //
    if Trim(Edit_Presupuesto_Serie_Ntra_Referencia.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pc.Serie_Presupuesto = ' + UTI_GEN_Comillas(Trim(Edit_Presupuesto_Serie_Ntra_Referencia.Text)) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos en el número del presupuesto                                           ** //
    // ********************************************************************************************* //
    if Trim(Edit_Presupuesto_Numero_Ntra_Referencia.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pc.Numero_Presupuesto = ' + UTI_GEN_Comillas(Trim(Edit_Presupuesto_Numero_Ntra_Referencia.Text)) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la fecha del presupuesto                                           ** //
    // ********************************************************************************************* //
    if (not DateTimePicker_Hasta_Ntra_Referencia.DateIsNull) and
       (not DateTimePicker_Desde_Ntra_Referencia.DateIsNull) then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pc.Fecha <= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Hasta_Ntra_Referencia.Date, false) + ' 23:59:59' ) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pc.Fecha >= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Desde_Ntra_Referencia.Date, false) + ' 00:00:00' ) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos en el NUMERO del proveedor                                             ** //
    // ********************************************************************************************* //
    if Trim(Edit_Presupuesto_Numero_Su_Referencia.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pc.Numero_Presupuesto_Proveedor LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Presupuesto_Numero_Su_Referencia.Text) + '%')  );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la FECHA del proveedor                                             ** //
    // ********************************************************************************************* //
    if (not DateTimePicker_Hasta_Su_Referencia.DateIsNull) and
       (not DateTimePicker_Desde_Su_Referencia.DateIsNull) then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pc.Fecha_Presupuesto_Proveedor <= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Hasta_Su_Referencia.Date, false) + ' 23:59:59' ) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pc.Fecha_Presupuesto_Proveedor >= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Desde_Su_Referencia.Date, false) + ' 00:00:00' ) );
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
        var_SQL_ADD.Add( 'pc.id_Almacenes = ' + Trim(Edit_id_Almacenes.Text) );
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
        var_SQL_ADD.Add( 'pc.id_empresas = ' + Trim(Edit_id_Empresas.Text) );
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
        var_SQL_ADD.Add( 'pc.id_formas_pago = ' + Trim(Edit_id_Forma_Pago.Text) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la id del proveedor                                                ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_proveedores.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pc.id_proveedores = ' + Trim(Edit_id_proveedores.Text) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora filtraremos por el estado del pedido (pendiente o no de servir algo, o todos      ** //
    // ********************************************************************************************* //
    if RadioButton_Cerrados_NO.Checked = true then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pc.Cerrado_SN = ' + UTI_GEN_Comillas('N') );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    if RadioButton_Cerrados_SI.Checked = true then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pc.Cerrado_SN = ' + UTI_GEN_Comillas('S') );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    if RadioButton_Todos.Checked = true then
    begin
        // ***************************************************************************************** //
        // ** En realidad no hay que filtrar por nada                                             ** //
        // ***************************************************************************************** //
    end;

    { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
      y que por lo se debe de permitir modificarlos en ningún módulo }

    Result := UTI_TB_Filtrar( private_Order_By,

                              // Delete_SQL,
                              '',

                              // Update_SQL,
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Presup,
                                                            'presupuestos_compras',
                                                            'u' ),

                              // Insert_SQL,
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Presup,
                                                            'presupuestos_compras',
                                                            'i' ),

                              // var_ctdad_Rgtros,
                              -1,

                              DataModule_Presupuestos_Compras.SQLTransaction_Presup,
                              DataModule_Presupuestos_Compras.SQLConnector_Presup,
                              SQLQuery_Presup,

                              // name_tabla,
                              'pc',

                              RadioGroup_Bajas.ItemIndex,

                              // SELECT_SQL,
                              'SELECT pc.*,' + ' ' +

                                     'trp.nombre_propietario AS OT_descripcion_transportista,' + ' ' +
                                     'trp.Tfno_Fijo_1 AS OT_tfno_1_transportista,' + ' ' +
                                     'trp.Movil AS OT_Movil_transportista,' + ' ' +

                                     'env_pb.descripcion AS OT_Envio_descripcion_poblacion,' + ' ' +
                                     'env_pr.descripcion AS OT_Envio_descripcion_provincia,' + ' ' +
                                     'env_ps.descripcion AS OT_Envio_descripcion_pais,' + ' ' +

                                     'pb.descripcion AS OT_descripcion_poblacion,' + ' ' +
                                     'pr.descripcion AS OT_descripcion_provincia,' + ' ' +
                                     'ps.descripcion AS OT_descripcion_pais,' + ' ' +

                                     'ct_pb.descripcion AS OT_Cta_Bco_descripcion_poblacion,' + ' ' +
                                     'ct_pr.descripcion AS OT_Cta_Bco_descripcion_provincia,' + ' ' +
                                     'ct_ps.descripcion AS OT_Cta_Bco_descripcion_pais,' + ' ' +

                                     'alm.descripcion AS OT_descripcion_almacen,' + ' ' +

                                     'e.nombre_comercial AS OT_descripcion_empresa,' + ' ' +
                                     'p.nombre_propietario AS OT_descripcion_proveedor,' + ' ' +

                                     'fp.descripcion AS OT_descripcion_forma_pago' + ' ' +

                              'FROM presupuestos_compras AS pc' + ' ' +

                              'LEFT JOIN proveedores AS trp' + ' ' +
                              'ON pc.agencias_transporte_id_proveedores = trp.id' + ' ' +

                              'LEFT JOIN poblaciones AS env_pb' + ' ' +
                              'ON pc.Envio_id_poblaciones = env_pb.id' + ' ' +

                              'LEFT JOIN provincias AS env_pr' + ' ' +
                              'ON pc.Envio_id_provincias = env_pr.id' + ' ' +

                              'LEFT JOIN paises AS env_ps' + ' ' +
                              'ON pc.Envio_id_paises = env_ps.id' + ' ' +

                              'LEFT JOIN poblaciones AS pb' + ' ' +
                              'ON pc.id_poblaciones = pb.id' + ' ' +

                              'LEFT JOIN provincias AS pr' + ' ' +
                              'ON pc.id_provincias = pr.id' + ' ' +

                              'LEFT JOIN paises AS ps' + ' ' +
                              'ON pc.id_paises = ps.id' + ' ' +

                              'LEFT JOIN poblaciones AS ct_pb' + ' ' +
                              'ON pc.Cta_Bco_id_poblaciones = ct_pb.id' + ' ' +

                              'LEFT JOIN provincias AS ct_pr' + ' ' +
                              'ON pc.Cta_Bco_id_provincias = ct_pr.id' + ' ' +

                              'LEFT JOIN paises AS ct_ps' + ' ' +
                              'ON pc.Cta_Bco_id_paises = ct_ps.id' + ' ' +

                              'LEFT JOIN almacenes AS alm' + ' ' +
                              'ON pc.id_almacenes = alm.id' + ' ' +

                              'LEFT JOIN empresas AS e' + ' ' +
                              'ON pc.id_empresas = e.id' + ' ' +

                              'LEFT JOIN proveedores AS p' + ' ' +
                              'ON pc.id_proveedores = p.id' + ' ' +

                              'LEFT JOIN formas_pago AS fp' + ' ' +
                              'ON pc.id_formas_pago = fp.id' + ' ',

                              Memo_Filtros.Lines,
                              Memo_OrderBy.Lines,
                              var_a_Filtrar,

                              param_Cambiamos_Filtro,
                              false,   // param_ver_SQL_despues_Abrir : Boolean;
                              true ); // no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

    var_a_Filtrar.Free;

    Label_Ctdad_Rgtros.Caption := IntToStr(SQLQuery_Presup.RecordCount);

    //Filtrar_tablas_ligadas;

    if SQLQuery_Presup.RecordCount = 0 then
    begin
        Cerramos_Tablas_Ligadas;
    end;

    Sumar_Totales;

    Filtrar_Impuestos_Totales;
    var_SQL_ADD.Free;
end;

procedure Tform_presupuestos_compras_000.Sumar_Totales;
var var_Total_Principal : Extended;
begin
    var_Total_Principal := 0;

    With SQLQuery_Presup do
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

procedure Tform_presupuestos_compras_000.Filtrar_Impuestos_Totales;
var
  var_a_Filtrar : TStrings;
  var_msg       : TStrings;
  var_SQL       : String;
begin
    var_a_Filtrar := TStringList.Create;
    var_a_Filtrar.Clear;

    // ********************************************************************************************* //
    // ** Primero buscaremos en la serie del presupuesto                                          ** //
    // ********************************************************************************************* //
    if Trim(Edit_Presupuesto_Serie_Ntra_Referencia.Text) <> '' then
    begin
        var_a_Filtrar.Add( 'AND pc.Serie_Presupuesto = ' +
                           UTI_GEN_Comillas(Trim(Edit_Presupuesto_Serie_Ntra_Referencia.Text)) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos en el número del presupuesto                                           ** //
    // ********************************************************************************************* //
    if Trim(Edit_Presupuesto_Numero_Ntra_Referencia.Text) <> '' then
    begin
        var_a_Filtrar.Add( 'AND pc.Numero_Presupuesto = ' +
                           UTI_GEN_Comillas(Trim(Edit_Presupuesto_Numero_Ntra_Referencia.Text)) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la FECHA                                                           ** //
    // ********************************************************************************************* //
    if (not DateTimePicker_Hasta_Ntra_Referencia.DateIsNull) and
       (not DateTimePicker_Desde_Ntra_Referencia.DateIsNull) then
    begin
        var_a_Filtrar.Add( 'AND pc.Fecha <= ' +
                           UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Hasta_Ntra_Referencia.Date, false) +
                                             ' 23:59:59' ) );
        var_a_Filtrar.Add( 'AND pc.Fecha >= ' +
                           UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Desde_Ntra_Referencia.Date, false) +
                                             ' 00:00:00' ) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos en el NUMERO de albaran del proveedor                                  ** //
    // ********************************************************************************************* //
    if Trim(Edit_Presupuesto_Numero_Su_Referencia.Text) <> '' then
    begin
        var_a_Filtrar.Add( 'AND pc.Numero_Presupuesto_Proveedor LIKE ' +
                           UTI_GEN_Comillas('%' + Trim(Edit_Presupuesto_Numero_Su_Referencia.Text) + '%')  );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la FECHA del proveedor                                             ** //
    // ********************************************************************************************* //
    if (not DateTimePicker_Hasta_Su_Referencia.DateIsNull) and
       (not DateTimePicker_Desde_Su_Referencia.DateIsNull) then
    begin
        var_a_Filtrar.Add( 'AND pc.Fecha_Presupuesto_Proveedor <= ' +
                           UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Hasta_Su_Referencia.Date, false) +
                                             ' 23:59:59' ) );
        var_a_Filtrar.Add( 'AND pc.Fecha_Presupuesto_Proveedor >= ' +
                           UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Desde_Su_Referencia.Date, false) +
                                             ' 00:00:00' ) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por el almacén                                                         ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Almacenes.Text) <> '' then
    begin
        var_a_Filtrar.Add( 'AND pc.id_Almacenes = ' + Trim(Edit_id_Almacenes.Text) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la empresa                                                         ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Empresas.Text) <> '' then
    begin
        var_a_Filtrar.Add( 'AND pc.id_empresas = ' + Trim(Edit_id_Empresas.Text) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la forma de pago                                                   ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Forma_Pago.Text) <> '' then
    begin
        var_a_Filtrar.Add( 'AND pc.id_formas_pago = ' + Trim(Edit_id_Forma_Pago.Text) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la id del proveedor                                                ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Proveedores.Text) <> '' then
    begin
        var_a_Filtrar.Add( 'AND pc.id_proveedores = ' + Trim(Edit_id_Proveedores.Text) );
    end;

    // ********************************************************************************************* //
    // ** Ahora filtraremos por el estado del presupuesto (pendiente o no de servir algo, o todos ** //
    // ********************************************************************************************* //
    if RadioButton_Cerrados_NO.Checked = true then
    begin
        var_a_Filtrar.Add( 'AND pc.Cerrado_SN = ' + UTI_GEN_Comillas('N') );
    end;

    if RadioButton_Cerrados_SI.Checked = true then
    begin
        var_a_Filtrar.Add( 'AND pc.Cerrado_SN = ' + UTI_GEN_Comillas('S') );
    end;

    if RadioButton_Todos.Checked = true then
    begin
        // ***************************************************************************************** //
        // ** En realidad no hay que filtrar por nada                                             ** //
        // ***************************************************************************************** //
    end;

    { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
      y que por lo se debe de permitir modificarlos en ningún módulo }

    var_SQL := 'SELECT imp.descripcion AS OT_Descripcion_impto,' + ' ' +
                      'pci.id_impuestos,' + ' ' +
                      'SUM(pci.Base) AS Total_Base,' + ' ' +
                      'SUM(pci.Importe) AS Total_Cuota' + ' ' +

               'FROM presupuestos_compras_impuestos AS pci' + ' ' +

               'LEFT JOIN impuestos AS imp' + ' ' +
               'ON pci.id_impuestos = imp.id' + ' ' +

               'RIGHT JOIN presupuestos_compras AS pc' + ' ' +
               'ON pci.id_presupuestos = pc.id' + ' ' +

                   Trim(var_a_Filtrar.Text) + ' ' +

                  'AND pc.Del_WHEN IS NULL' + ' ' +

               'WHERE pci.Del_WHEN IS NULL' + ' ' +
               'AND NOT imp.descripcion IS NULL' + ' ' +

               'GROUP BY pci.id_impuestos' + ' ' +
               'ORDER BY pci.id_presupuestos, pci.id_impuestos;' + ' ';

    if UTI_TB_Query_Open( // Delete_SQL,
                          '',

                          // Update_SQL,
                          '',

                          // Insert_SQL,
                          '',

                          DataModule_Presupuestos_Compras.SQLConnector_Imptos_Totales,
                          SQLQuery_Imptos_Totales,

                          // var_ctdad_Rgtros,
                          -1,

                          // SELECT_SQL
                          var_SQL  ) = False then
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

procedure Tform_presupuestos_compras_000.SQLQuery_List_PresupCalcFields(
  DataSet: TDataSet);
begin
    with SQLQuery_List_Presup do
    begin
        if Trim(FieldByName('Serie_Presupuesto').AsString) <> '' then
        begin
            FieldByName('OT_el_Presupuesto').AsString := Trim(FieldByName('Serie_Presupuesto').AsString) +
                                                         '-' +
                                                         Trim(FieldByName('Numero_Presupuesto').AsString);
        end else begin
            FieldByName('OT_el_Presupuesto').AsString := Trim(FieldByName('Numero_Presupuesto').AsString);
        end;
    end;
end;

function Tform_presupuestos_compras_000.Filtrar_Listado_Presup( param_ver_bajas : ShortInt;
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

                            DataModule_Presupuestos_Compras.SQLTransaction_List_Presup,
                            DataModule_Presupuestos_Compras.SQLConnector_List_Presup,
                            SQLQuery_List_Presup,

                            // name_tabla,
                            'pc',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT impto.descripcion AS OT_descripcion_impuesto,' + ' ' +
                                   'impto.Tanto_Por_Ciento AS OT_Tanto_Por_Ciento,' + ' ' +

                                   'pci.*,' + ' ' +
                                   'pc.*' + ' ' +

                            'FROM presupuestos_compras_impuestos AS pci' + ' ' +

                            'RIGHT JOIN presupuestos_compras as pc' + ' ' +
                            'ON pc.id = pci.id_presupuestos' + ' ' +

                            'LEFT JOIN impuestos AS impto' + ' ' +
                            'ON pci.id_impuestos = impto.id',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_a_Filtrar_Plus.Free;
end;

procedure Tform_presupuestos_compras_000.Boton_Elegir_PeriodoClick(Sender: TObject);
begin
    UTI_GEN_Traer_Trimestre( DateTimePicker_Desde_Ntra_Referencia,
                             DateTimePicker_Hasta_Ntra_Referencia );
end;

procedure Tform_presupuestos_compras_000.BitBtn_ImprimirClick(Sender: TObject);
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
    // ** Primero buscaremos en la serie del presupuesto                                          ** //
    // ********************************************************************************************* //
    if Trim(Edit_Presupuesto_Serie_Ntra_Referencia.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pc.Serie_Presupuesto = ' + UTI_GEN_Comillas(Trim(Edit_Presupuesto_Serie_Ntra_Referencia.Text)) );
        UTI_TB_SQL_ADD( true,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos en el número del presupuesto                                           ** //
    // ********************************************************************************************* //
    if Trim(Edit_Presupuesto_Numero_Ntra_Referencia.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pc.Numero_Presupuesto = ' + UTI_GEN_Comillas(Trim(Edit_Presupuesto_Numero_Ntra_Referencia.Text)) );
        UTI_TB_SQL_ADD( false,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la fecha del presupuesto                                           ** //
    // ********************************************************************************************* //
    if (not DateTimePicker_Hasta_Ntra_Referencia.DateIsNull) and
       (not DateTimePicker_Desde_Ntra_Referencia.DateIsNull) then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pc.Fecha <= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Hasta_Ntra_Referencia.Date, false) + ' 23:59:59' ) );
        UTI_TB_SQL_ADD( false,
                        var_Lineas_Filtro,
                        var_SQL_ADD );

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pc.Fecha >= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Desde_Ntra_Referencia.Date, false) + ' 00:00:00' ) );
        UTI_TB_SQL_ADD( false,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos en el NUMERO del proveedor                                             ** //
    // ********************************************************************************************* //
    if Trim(Edit_Presupuesto_Numero_Su_Referencia.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pc.Numero_Presupuesto_Proveedor LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Presupuesto_Numero_Su_Referencia.Text) + '%')  );
        UTI_TB_SQL_ADD( false,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la FECHA del proveedor                                             ** //
    // ********************************************************************************************* //
    if (not DateTimePicker_Hasta_Su_Referencia.DateIsNull) and
       (not DateTimePicker_Desde_Su_Referencia.DateIsNull) then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pc.Fecha_Presupuesto_Proveedor <= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Hasta_Su_Referencia.Date, false) + ' 23:59:59' ) );
        UTI_TB_SQL_ADD( false,
                        var_Lineas_Filtro,
                        var_SQL_ADD );

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pc.Fecha_Presupuesto_Proveedor >= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Desde_Su_Referencia.Date, false) + ' 00:00:00' ) );
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
        var_SQL_ADD.Add( 'pc.id_Almacenes = ' + Trim(Edit_id_Almacenes.Text) );
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
        var_SQL_ADD.Add( 'pc.id_empresas = ' + Trim(Edit_id_Empresas.Text) );
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
        var_SQL_ADD.Add( 'pc.id_formas_pago = ' + Trim(Edit_id_Forma_Pago.Text) );
        UTI_TB_SQL_ADD( false,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la id del proveedor                                                ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_proveedores.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pc.id_proveedores = ' + Trim(Edit_id_proveedores.Text) );
        UTI_TB_SQL_ADD( false,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora filtraremos por el estado del pedido (pendiente o no de servir algo, o todos      ** //
    // ********************************************************************************************* //
    if RadioButton_Cerrados_NO.Checked = true then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pc.Cerrado_SN = ' + UTI_GEN_Comillas('N') );
        UTI_TB_SQL_ADD( false,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    if RadioButton_Cerrados_SI.Checked = true then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pc.Cerrado_SN = ' + UTI_GEN_Comillas('S') );
        UTI_TB_SQL_ADD( false,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    if RadioButton_Todos.Checked = true then
    begin
        // ***************************************************************************************** //
        // ** En realidad no hay que filtrar por nada                                             ** //
        // ***************************************************************************************** //
    end;

    // ********************************************************************************************* //
    // ** Pasamos a traer los registros ... filtrar                                               ** //
    // ********************************************************************************************* //
    var_Lineas_OrderBy.Clear;
    Filtrar_Listado_Presup( 1, // RadioGroup_Bajas.ItemIndex,  // asi no se ven las bajas hasta que no lo pida el form de altas/modif de líneas
                            false,
                            var_Lineas_Filtro,
                            var_Lineas_OrderBy );

    if not SQLQuery_List_Presup.IsEmpty then
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

        if (Trim(Edit_Presupuesto_Serie_Ntra_Referencia.Text) <> '')  or
           (Trim(Edit_Presupuesto_Numero_Ntra_Referencia.Text) <> '') then
        begin
            var_Ordenado_por := var_Ordenado_por +
                                ', con ntra.numeración = ';

            if Trim(Edit_Presupuesto_Serie_Ntra_Referencia.Text) <> '' then
            begin
                var_Ordenado_por := var_Ordenado_por +
                                    Trim(Edit_Presupuesto_Serie_Ntra_Referencia.Text) + '-';
            end;

            if Trim(Edit_Presupuesto_Numero_Ntra_Referencia.Text) <> '' then
            begin
                var_Ordenado_por := var_Ordenado_por +
                                    Trim(Edit_Presupuesto_Numero_Ntra_Referencia.Text);
            end;

        end;

        if (not DateTimePicker_Hasta_Ntra_Referencia.DateIsNull) or
           (not DateTimePicker_Desde_Ntra_Referencia.DateIsNull) then
        begin
            var_Ordenado_por := var_Ordenado_por +
                                ', presupuestos creados entre ' +
                                DateToStr(DateTimePicker_Desde_Ntra_Referencia.Date) +
                                ' y el ' +
                                DateToStr(DateTimePicker_Hasta_Ntra_Referencia.Date);
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

        if Trim(Edit_Descripcion_id_proveedores.Text) <> '' then
        begin
            var_Ordenado_por := var_Ordenado_por +
                                ', con proveedor = ' +
                                Trim(Edit_Descripcion_id_proveedores.Text);
        end;

        if RadioButton_Cerrados_NO.Checked = true then
        begin
            var_Ordenado_por := var_Ordenado_por +
                                ', ver sólo cerrados = NO';
        end;

        if RadioButton_Cerrados_SI.Checked = true then
        begin
            var_Ordenado_por := var_Ordenado_por +
                                ', ver sólo cerrados = SI';
        end;

        if RadioButton_Todos.Checked = true then
        begin
            var_Ordenado_por := var_Ordenado_por +
                                ', ver cerrados = todos';
        end;

        if Trim(Edit_Presupuesto_Numero_Su_Referencia.Text) <> '' then
        begin
            var_Ordenado_por := var_Ordenado_por +
                                ', con su presupuesto número = ' +
                                Trim(Edit_Presupuesto_Numero_Su_Referencia.Text);
        end;

        if (not DateTimePicker_Hasta_Su_Referencia.DateIsNull) or
           (not DateTimePicker_Desde_Su_Referencia.DateIsNull) then
        begin
            var_Ordenado_por := var_Ordenado_por +
                                ', sus presupuesto entre ' +
                                DateToStr(DateTimePicker_Desde_Su_Referencia.Date) +
                                ' y el ' +
                                DateToStr(DateTimePicker_Hasta_Su_Referencia.Date);
        end;

        // ***************************************************************************************** //
        // ** Vamos a enviar el título del impuesto común. Esto sólo servirá en aquellas empresas ** //
        // ** que sólo usen un tipo de impuesto para facturar                                     ** //
        // ***************************************************************************************** //
        var_Impuesto_Comun := '';

        with SQLQuery_Presup_Detalles do
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
                          SQLQuery_Presup,
                          DataSource_List_Presup,
                          Nil,
                          Nil,
                          DataSource_Imptos_Totales,
                          public_Menu_Worked,
                          public_Solo_Ver,
                          SQLQuery_Presup.FieldByName('id_empresas').AsString,
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
    if UTI_TB_Cerrar( DataModule_Presupuestos_Compras.SQLConnector_List_Presup,
                      DataModule_Presupuestos_Compras.SQLTransaction_List_Presup,
                      SQLQuery_List_Presup ) = false then
    begin
      UTI_GEN_Salir;
    end;

    var_SQL_ADD.Free;
end;

procedure Tform_presupuestos_compras_000.BitBtn_Convertir_Integro_en_PedidoClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;

    // ********************************************************************************************* //
    // ** Si el presupuesto está borrado, no permitimos hacer nada con el.                        ** //
    // ********************************************************************************************* //
    if not SQLQuery_Presup.FieldByName('Del_WHEN').IsNull then
    begin
        var_msg.Add( '* Es un presupuesto borrado, no se puede modificar nada de el. ' +
                     'Si desea modificarlo, primero hay que darlo de alta anteriormente.' );
    end;

    // ********************************************************************************************* //
    // ** Si el presupuesto está cerrado no podemos hacer ningún pedido de él                     ** //
    // ********************************************************************************************* //
    with SQLQuery_Presup do
    begin
        if UTI_COMPRAS_Esta_Cerrado_SN( 'presupuestos_compras', FieldByName('id').AsString ) = 'S' then
        begin
            var_msg.Add( '* Presupuesto CERRADO.');
        end;
    end;

    // ********************************************************************************************* //
    // ** Comprobar si tiene alguna línea sin convertir en pedido, si la tiene pues crea un solo  ** //
    // ** pedido para el resto no convertidas todavía                                             ** //
    // ********************************************************************************************* //
    Comprobar_Si_Hay_Lineas_Detalle_Sin_Pedido(var_msg);

    if Trim(var_msg.Text) = '' then
    begin
        // ***************************************************************************************** //
        // ** Continuamos con la creación del nuevo pedido con las líneas que no se convirtieron  ** //
        // ** todavia en pedido                                                                   ** //
        // ***************************************************************************************** //
        Convertir_Integro_en_Pedido(var_msg);
    end else begin
        UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
    end;

    var_msg.Free;
end;

procedure Tform_presupuestos_compras_000.Convertir_Integro_en_Pedido(param_msg : TStrings);
var var_Registro_Empresa : TEmpresas;
    var_Fecha            : TDateTime;
begin
    // ********************************************************************************************* //
    // ** Si el usuario no tiene permisos para modificar presupuestos ni permiso para crear       ** //
    // ** pedidos pues no continuamos                                                             ** //
    // ********************************************************************************************* //
    if (UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True) and  // ** Comprueba si tiene   ** //
                                                                       // ** permiso de modificar ** //
                                                                       // ** en presupuestos      ** //
                                                                       // ************************** //
       (UTI_USR_Permiso_SN(630, 'A', True) = True)                then // ** Comprueba si tiene   ** //
                                                                       // ** permiso de insertar  ** //
                                                                       // ** en pedidos           ** //
                                                                       // ************************** //
    begin
        var_Fecha            := UTI_CN_Fecha_Hora;
        var_Registro_Empresa := Crear_Pedido_su_Cabecera( var_Fecha );

        if Trim(var_Registro_Empresa.id) <> '' then
        begin
            Crear_Pedido_su_Detalle( var_Fecha,
                                     var_Registro_Empresa.Serie_Pedido_Compras,
                                     var_Registro_Empresa.Numero_Pedido_Compras,
                                             // **************************************************** //
                                     true ); // ** Así se creará un pedido de todas las líneas    ** //
                                             // ** pendientes de ser convertidas en pedido        ** //
                                             // **************************************************** //
        end;

        // ***************************************************************************************** //
        // ** Cerramos el pedido porque no hay pendiente de él nada por traspasar a pedidos       ** //
        // ***************************************************************************************** //
        Cerrarlo;

        // ***************************************************************************************** //
        // ** Mensaje diciendo que se ha creado el pedido numero/serie                            ** //
        // ***************************************************************************************** //
        param_msg.Clear;
        param_msg.Add( 'Las líneas de este presupuesto que no estaban convertidas en pedidos, ahora' +
                       ' están ligadas con el pedido con ref.nuestra ' +
                       Trim(var_Registro_Empresa.Serie_Pedido_Compras) +
                       '/' +
                       Trim(var_Registro_Empresa.Numero_Pedido_Compras)  );

        UTI_GEN_Aviso(false, param_msg, 'PERFECTO.-', True, False);
        param_msg.Clear;
    end;
end;

function Tform_presupuestos_compras_000.Crear_Pedido_su_Cabecera( param_Fecha : TDateTime ) : TEmpresas;
var var_Registro_Empresa : TEmpresas;
    var_msg              : TStrings;
begin
    with SQLQuery_Pdo do
    begin
        // ***************************************************************************************** //
        // ** Si el presupuesto no tiene la empresa pusta pues no continuamos                     ** //
        // ***************************************************************************************** //
        if SQLQuery_Presup.FieldByName('id_empresas').IsNull then
        begin
            var_msg := TStringList.Create;
            var_msg.Add('El presupuesto no tiene puesta su empresa');
            UTI_GEN_Aviso(true, var_msg, 'NO SE PUEDE ...', True, False);
            var_msg.Free;

            Result.id := '';
            Exit;
        end;

        // ***************************************************************************************** //
        // ** ABRIMOS LA TABLA DE CABECERAS DE PEDIDOS, PERO FILTRANDO POR LA FECHA ELEGIDA       ** //
        // ***************************************************************************************** //
        Filtrar_Pedidos_Cabecera( DateToStr(Int(param_Fecha)), '', '' );

        Insert;

        // ***************************************************************************************** //
        // ** ASIGNAMOS LA EMPRESA Y NUMERO/SERIE DE PEDIDO                                       ** //
        // ***************************************************************************************** //
        FieldByName('id_empresas').AsString := SQLQuery_Presup.FieldByName('id_empresas').AsString;
        var_Registro_Empresa.id             := FieldByName('id_empresas').AsString;

        var_msg := TStringList.Create;
        var_Registro_Empresa := UTI_COMPRAS_Devolver_Numeracion_Pedido( var_msg,
                                                                        var_Registro_Empresa,
                                                                        true,   // Para que se desbloquee el registro de empresas.
                                                                        true ); // Para que actualice la empresa con el siguiente pedido.
        if Trim(var_msg.Text) <> '' then
        begin
            // ************************************************************************************* //
            // ** Hay errores en la búsqueda del próximo NUMERO                                   ** //
            // ************************************************************************************* //
            UTI_GEN_Aviso(true, var_msg, 'NO SE PUEDE', True, False);
            Cancel;
            var_msg.Free;

            Result.id := '';
            Exit;
        end else begin
            // ************************************************************************************* //
            // ** NO HAY errores en la búsqueda del próximo SERIE/NUMERO de pedido                ** //
            // ** Asi que guardamos en la CABECERA su SERIE/NUMERO de pedido                      ** //
            // ************************************************************************************* //
            FieldByName('Serie_Pedido').AsString  := var_Registro_Empresa.Serie_Pedido_Compras;
            FieldByName('Numero_Pedido').AsString := var_Registro_Empresa.Numero_Pedido_Compras;

            // ************************************************************************************* //
            // ** Guardamos en la cabecera del pedido de que presupuesto fue creado               ** //
            // ************************************************************************************* //
            FieldByName('Serie_Presupuesto').AsString  := SQLQuery_Presup.FieldByName('Serie_Presupuesto').AsString;
            FieldByName('Numero_Presupuesto').AsString := SQLQuery_Presup.FieldByName('Numero_Presupuesto').AsString;
        end;

        var_msg.Free;

        // ***************************************************************************************** //
        // ** ASIGNAMOS EL RESTO DE CAMPOS                                                        ** //
        // ***************************************************************************************** //
        FieldByName('Fecha').Value          := Int(param_Fecha);
        FieldByName('Cerrado_SN').AsString  := 'N';

        FieldByName('Insert_WHEN').Value    := param_Fecha;
        FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

        // ***************************************************************************************** //
        // ** ASIGNAMOS EL RESTO DE CAMPOS TAL CUAL COMO ESTAN EN LA CABECERA DEL PRESUPUESTO     ** //
        // ***************************************************************************************** //
        Crear_Pedido_su_Cabecera_2;

        // ***************************************************************************************** //
        // ** GRABAMOS LA CABECERA DEL PEDIDO                                                     ** //
        // ***************************************************************************************** //
        UTI_RGTRO_Grabar_Antes( 'pedidos_compras', SQLQuery_Pdo );

        // ***************************************************************************************** //
        // ** CERRAMOS LA TABLA DE CABECERAS DE PEDIDOS                                           ** //
        // ***************************************************************************************** //
        Cerramos_Tabla_Pedidos_Cabecera;

        // ***************************************************************************************** //
        // ** Devolvemos el registro de la empresa donde está entre otras cosas el numero y serie ** //
        // ** que estamos creando                                                                 ** //
        // ***************************************************************************************** //
        Result := var_Registro_Empresa;
    end;
end;

procedure Tform_presupuestos_compras_000.Crear_Pedido_su_Cabecera_2;
var var_Contador     : Integer;
    var_Nombre_Campo : String;
begin
    with SQLQuery_Pdo do
    begin
        for var_Contador := 0 to Fields.Count - 1 do
        begin
            var_Nombre_Campo := Fields[var_Contador].FieldName;

            // ************************************************************************************* //
            // ** LOS CAMPOS QUE EMPIEZAN POR OT_ SON CAMPOS JOIN, asi que no guardo cambios      ** //
            // ************************************************************************************* //
            If Pos( UpperCase('OT_'), UpperCase(var_Nombre_Campo) ) = 0 then
            begin
                if ( Trim(UpperCase(var_Nombre_Campo)) <> UpperCase('SERIE_PEDIDO') )       and
                   ( Trim(UpperCase(var_Nombre_Campo)) <> UpperCase('NUMERO_PEDIDO') )      and
                   ( Trim(UpperCase(var_Nombre_Campo)) <> UpperCase('id_empresas') )        and
                   ( Trim(UpperCase(var_Nombre_Campo)) <> UpperCase('Serie_Presupuesto') )  and
                   ( Trim(UpperCase(var_Nombre_Campo)) <> UpperCase('Numero_Presupuesto') ) and
                   ( Trim(UpperCase(var_Nombre_Campo)) <> UpperCase('Fecha') )              and
                   ( Trim(UpperCase(var_Nombre_Campo)) <> UpperCase('Cerrado_SN') )         and
                   ( Trim(UpperCase(var_Nombre_Campo)) <> UpperCase('Insert_WHEN') )        and
                   ( Trim(UpperCase(var_Nombre_Campo)) <> UpperCase('Insert_Id_User') )     and
                   ( Trim(UpperCase(var_Nombre_Campo)) <> UpperCase('Del_WHEN') )           and
                   ( Trim(UpperCase(var_Nombre_Campo)) <> UpperCase('Del_Id_User') )        and
                   ( Trim(UpperCase(var_Nombre_Campo)) <> UpperCase('Del_WHY') )            and
                   ( Trim(UpperCase(var_Nombre_Campo)) <> UpperCase('Change_WHEN') )        and
                   ( Trim(UpperCase(var_Nombre_Campo)) <> UpperCase('Change_Id_User') )     then
                begin
                    FieldByName(var_Nombre_Campo).Clear;
                    if not SQLQuery_Presup.FieldByName(var_Nombre_Campo).IsNull then
                    begin
                        FieldByName(var_Nombre_Campo).AsString := SQLQuery_Presup.FieldByName(var_Nombre_Campo).AsString;
                    end;
                end;
            end;
        end;
    end;
end;

procedure Tform_presupuestos_compras_000.Crear_Pedido_su_Detalle( param_Fecha : TDateTime;
                                                                  param_Serie,
                                                                  param_Numero : ShortString;
                                                                  param_Todas_Las_Lineas : Boolean );
var var_msg : TStrings;
    var_id  : ShortString;
begin
    // ********************************************************************************************* //
    // ** Abrimos la tabla de cabeceras del pedido                                                ** //
    // ********************************************************************************************* //
    Filtrar_Pedidos_Cabecera( DateToStr(Int(param_Fecha)),
                              param_Serie,
                              param_Numero );

    with SQLQuery_Pdo do
    begin
        // ***************************************************************************************** //
        // ** Solo abrimos detalles si la cabecera existe y si no hay más de una cabecera.        ** //
        // ** Si hubiera más de una cabecera con mismo NUMERO/SERIE sería una duplicación y esto  ** //
        // ** no debería de producirse                                                            ** //
        // ***************************************************************************************** //
        if RecordCount = 1 then
        begin
            // ************************************************************************************* //
            // ** Bloqueamos la cabecera del pedido y editamos la cabecera para actualizar sus    ** //
            // ** totales y ponerle el número/serie al que pertenecen en presupuestos             ** //
            // ************************************************************************************* //
            var_id := FieldByName('id').AsString;

            if UTI_RGTRO_isLock( 'pedidos_compras',
                                 var_id,
                                 true ) = true then
            begin
                Cerramos_Tabla_Pedidos_Cabecera;
                Exit;
            end else begin
                if UTI_RGTRO_Lock( 'pedidos_compras',
                                   var_id ) = true then
                begin
                    Edit
                end else begin
                    Cerramos_Tabla_Pedidos_Cabecera;
                    Exit;
                end;
            end;

            // ************************************************************************************* //
            // ** Filtramos las líneas de detalle                                                 ** //
            // ************************************************************************************* //
            Filtrar_Pedidos_Detalles( FieldByName('id').AsString );

            // ************************************************************************************* //
            // ** Añadimos la/s líneas de detalle                                                 ** //
            // ************************************************************************************* //
            Crear_Pedido_su_Detalle_2( param_Fecha,
                                       var_id,
                                       param_Serie,
                                       param_Numero,
                                       param_Todas_Las_Lineas );

            UTI_LINEAS_poner_totales( 'pedidos_compras',
                                      SQLQuery_Pdo.FieldByName('id').AsString );

            // ************************************************************************************* //
            // ** No grabamos la cabecera, los totales los calcula un trigger                     ** //
            // ************************************************************************************* //
            Cancel;

            // ************************************************************************************* //
            // ** Liberamos cabecera de pedido                                                    ** //
            // ************************************************************************************* //
            UTI_RGTRO_UnLock( 'pedidos_compras', var_id );

            // ************************************************************************************* //
            // ** CERRAMOS LAS TABLAS DE CABECERAS Y DETALLES                                     ** //
            // ************************************************************************************* //
            Cerramos_Tabla_Pedidos_Detalles;
            Cerramos_Tabla_Pedidos_Cabecera;
        end else begin
            // ************************************************************************************* //
            // ** Hay o más de un registro de cabecera o ninguno ... error seguro                 ** //
            // ************************************************************************************* //
            var_msg := TStringList.Create;

            if RecordCount > 1 then
            begin
                var_msg.Add( 'Hay más de un pedido con el mismo SERIE/NUMERO. Esto es un error serio,' +
                             ' así que no podemos continuar.' );
            end;

            if RecordCount = 0 then
            begin
                var_msg.Add( 'No existe todavía ningún pedido con la SERIE ' + Trim(param_Serie) +
                             ' y NUMERO ' + Trim(param_Numero) +
                             '. Esto es un error serio, así que no podemos continuar.' );
            end;

            UTI_GEN_Aviso(true, var_msg, 'NO SE PUDO', True, False);
            var_msg.Free;

            Cerramos_Tabla_Pedidos_Cabecera;
            Exit;
        end;
    end;
end;

end.





