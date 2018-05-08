unit pedidos_ventas_000;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, DateTimePicker, Forms, Controls, Graphics, Dialogs, types,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, DBGrids, DbCtrls, Grids, variants, utilidades_bd,
  utilidades_general, utilidades_rgtro, utilidades_usuarios, utilidades_datos_tablas,
  utilidades_lineas_detalle, utilidades_forms_Filtrar, utilidades_ventas, utilidades_empresas,
  utilidades_almacenes, utilidades_stock;

type
    TAlbaran_Creado = record
        Creado_SN     : Boolean;
        Fecha         : TDateTime;
        Empresa_Rgtro : TEmpresas
    end;

type

  { Tform_pedidos_ventas_000 }

  Tform_pedidos_ventas_000 = class(TForm)
    BitBtn_Considerar_como_cerrado: TBitBtn;
    BitBtn_Convertir_Integro_en_Albaran: TBitBtn;
    BitBtn_Convertir_Integro_en_Factura: TBitBtn;
    BitBtn_Filtrar: TBitBtn;
    BitBtn_Imprimir: TBitBtn;
    BitBtn_SALIR: TBitBtn;
    BitBtn_Seleccionar: TBitBtn;
    BitBtn_Ver_Presupuesto: TBitBtn;
    BitBtn_Ver_Situacion_Registro: TBitBtn;
    Boton_Elegir_Empresa: TBitBtn;
    Boton_Elegir_Forma_Pago: TBitBtn;
    Boton_Elegir_id_Almacenes: TBitBtn;
    Boton_Elegir_id_Clientes: TBitBtn;
    Boton_Elegir_id_Vehiculos: TBitBtn;
    Boton_Elegir_Periodo: TBitBtn;
    ComboBox_Filtros: TComboBox;
    DataSource_Alb: TDataSource;
    DataSource_Alb_Detalles: TDataSource;
    DataSource_Imptos_Totales: TDataSource;
    DataSource_List_Pdo: TDataSource;
    DataSource_Pdo_Impuestos: TDataSource;
    DataSource_Pdo: TDataSource;
    DataSource_Pdo_Detalles: TDataSource;
    DataSource_Pdo_Detalles__Stock: TDataSource;
    DateTimePicker_Desde: TDateTimePicker;
    DateTimePicker_Hasta: TDateTimePicker;
    DBEdit_eMail4: TDBEdit;
    DBEdit_Pagina_Web2: TDBEdit;
    DBGrid_Detalles1: TDBGrid;
    DBGrid_Principal: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBNavigator_Detalles1: TDBNavigator;
    Edit_Descripcion_Empresa: TEdit;
    Edit_Descripcion_Forma_Pago: TEdit;
    Edit_Descripcion_id_Almacenes: TEdit;
    Edit_Descripcion_id_Clientes: TEdit;
    Edit_Descripcion_id_Vehiculos: TEdit;
    Edit_id_Almacenes: TEdit;
    Edit_id_Clientes: TEdit;
    Edit_id_Empresas: TEdit;
    Edit_id_Forma_Pago: TEdit;
    Edit_id_Vehiculos: TEdit;
    Edit_Pdo_Numero: TEdit;
    Edit_Pdo_Serie: TEdit;
    Edit_Presupuesto_Numero: TEdit;
    Edit_Presupuesto_Serie: TEdit;
    Edit_Registros_Total: TEdit;
    GroupBox4: TGroupBox;
    GroupBox_Internet4: TGroupBox;
    GroupBox_Serie_Numero: TGroupBox;
    Image_Candado: TImage;
    Image_Cobro_Excluido: TImage;
    Image_Convertida: TImage;
    Label102: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label50: TLabel;
    Label52: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label_Almacen: TLabel;
    Label_Ctdad_Rgtros: TLabel;
    Label_Fecha2: TLabel;
    Label_Fecha3: TLabel;
    Label_Vehiculo: TLabel;
    Memo_Filtros: TMemo;
    Memo_OrderBy: TMemo;
    PageControl_Filtros: TPageControl;
    Panel2: TPanel;
    RadioButton_Cerrados_NO: TRadioButton;
    RadioButton_Cerrados_SI: TRadioButton;
    RadioButton_Todos: TRadioButton;
    RadioGroup_Bajas: TRadioGroup;
    Shape3: TShape;
    SQLQuery_Alb: TSQLQuery;
    SQLQuery_Albagencias_transporte_id_proveedores: TLargeintField;
    SQLQuery_AlbChange_Id_User: TLargeintField;
    SQLQuery_AlbChange_WHEN: TDateTimeField;
    SQLQuery_AlbCodigo_Postal: TStringField;
    SQLQuery_AlbComentarios_a_imprimir_en_Albaran: TStringField;
    SQLQuery_AlbComision_Representante: TBCDField;
    SQLQuery_AlbCONCEPTO_SEPA: TStringField;
    SQLQuery_AlbCta_Bco_BIC_SWIFT: TStringField;
    SQLQuery_AlbCta_Bco_Codigo_Postal: TStringField;
    SQLQuery_AlbCta_Bco_Cuenta: TStringField;
    SQLQuery_AlbCta_Bco_Digito_Control: TStringField;
    SQLQuery_AlbCta_Bco_Direccion: TStringField;
    SQLQuery_AlbCta_Bco_Direccion_Numero: TStringField;
    SQLQuery_AlbCta_Bco_Direccion_Piso_Letra: TStringField;
    SQLQuery_AlbCta_Bco_Entidad: TStringField;
    SQLQuery_AlbCta_Bco_IBAN: TStringField;
    SQLQuery_AlbCta_Bco_id_paises: TLargeintField;
    SQLQuery_AlbCta_Bco_id_poblaciones: TLargeintField;
    SQLQuery_AlbCta_Bco_id_provincias: TLargeintField;
    SQLQuery_AlbCta_Bco_Mandato_Fecha_de_Firma: TDateTimeField;
    SQLQuery_AlbCta_Bco_Mandato_Ref: TStringField;
    SQLQuery_AlbCta_Bco_Sucursal: TStringField;
    SQLQuery_AlbDel_Id_User: TLargeintField;
    SQLQuery_AlbDel_WHEN: TDateTimeField;
    SQLQuery_AlbDel_WHY: TStringField;
    SQLQuery_AlbDescuento_Comercial_1: TBCDField;
    SQLQuery_AlbDescuento_Comercial_2: TBCDField;
    SQLQuery_AlbDescuento_Final: TBCDField;
    SQLQuery_AlbDescuento_Pronto_Pago: TBCDField;
    SQLQuery_AlbDireccion: TStringField;
    SQLQuery_AlbDireccion_Numero: TStringField;
    SQLQuery_AlbDireccion_Piso_Letra: TStringField;
    SQLQuery_AlbEnvio_Bultos: TLongintField;
    SQLQuery_AlbEnvio_Codigo_Postal: TStringField;
    SQLQuery_AlbEnvio_Condiciones_Entrega: TStringField;
    SQLQuery_AlbEnvio_Con_Quien_Hablar: TStringField;
    SQLQuery_AlbEnvio_Direccion: TStringField;
    SQLQuery_AlbEnvio_Direccion_Numero: TStringField;
    SQLQuery_AlbEnvio_Direccion_Piso_Letra: TStringField;
    SQLQuery_AlbEnvio_eMail: TStringField;
    SQLQuery_AlbEnvio_FAX: TStringField;
    SQLQuery_AlbEnvio_Fecha_Recogida_Prevista: TDateTimeField;
    SQLQuery_AlbEnvio_id_paises: TLargeintField;
    SQLQuery_AlbEnvio_id_poblaciones: TLargeintField;
    SQLQuery_AlbEnvio_id_provincias: TLargeintField;
    SQLQuery_AlbEnvio_Movil: TStringField;
    SQLQuery_AlbEnvio_Portes: TBCDField;
    SQLQuery_AlbEnvio_Portes_Pagados_SN: TStringField;
    SQLQuery_AlbEnvio_Tfno_Fijo_1: TStringField;
    SQLQuery_AlbEnvio_Tfno_Fijo_2: TStringField;
    SQLQuery_AlbFAX: TStringField;
    SQLQuery_AlbFecha: TDateTimeField;
    SQLQuery_AlbForma_pago_Dia_1: TSmallintField;
    SQLQuery_AlbForma_pago_Dia_2: TSmallintField;
    SQLQuery_AlbForma_pago_Vacaciones_Dia_Fin: TSmallintField;
    SQLQuery_AlbForma_pago_Vacaciones_Dia_Inicio: TSmallintField;
    SQLQuery_AlbForma_pago_Vacaciones_Mes_Fin: TSmallintField;
    SQLQuery_AlbForma_pago_Vacaciones_Mes_Inicio: TSmallintField;
    SQLQuery_Albid: TLargeintField;
    SQLQuery_Albid_almacenes: TLargeintField;
    SQLQuery_Albid_clientes: TLargeintField;
    SQLQuery_Albid_empresas: TLargeintField;
    SQLQuery_Albid_formas_pago: TLargeintField;
    SQLQuery_Albid_paises: TLargeintField;
    SQLQuery_Albid_poblaciones: TLargeintField;
    SQLQuery_Albid_provincias: TLargeintField;
    SQLQuery_Albid_representantes: TLargeintField;
    SQLQuery_Albid_tarifas: TLargeintField;
    SQLQuery_Albid_vehiculos: TLargeintField;
    SQLQuery_AlbInsert_Id_User: TLargeintField;
    SQLQuery_AlbInsert_WHEN: TDateTimeField;
    SQLQuery_AlbIVA_con_Recargo_SN: TStringField;
    SQLQuery_AlbIVA_con_Recargo_SN_Representante: TStringField;
    SQLQuery_AlbIVA_Excluido_SN: TStringField;
    SQLQuery_AlbIVA_Excluido_SN_Representante: TStringField;
    SQLQuery_AlbMovil: TStringField;
    SQLQuery_Albnif_cif: TStringField;
    SQLQuery_Albnombre_comercial: TStringField;
    SQLQuery_Albnombre_propietario: TStringField;
    SQLQuery_AlbNumero_Albaran: TLargeintField;
    SQLQuery_AlbNumero_Factura: TLargeintField;
    SQLQuery_AlbNumero_Pedido: TLargeintField;
    SQLQuery_AlbNumero_Presupuesto: TLargeintField;
    SQLQuery_AlbObservaciones: TStringField;
    SQLQuery_AlbOT_Cta_Bco_descripcion_pais: TStringField;
    SQLQuery_AlbOT_Cta_Bco_descripcion_poblacion: TStringField;
    SQLQuery_AlbOT_Cta_Bco_descripcion_provincia: TStringField;
    SQLQuery_AlbOT_descripcion_almacen: TStringField;
    SQLQuery_AlbOT_descripcion_cliente: TStringField;
    SQLQuery_AlbOT_descripcion_empresa: TStringField;
    SQLQuery_AlbOT_descripcion_forma_pago: TStringField;
    SQLQuery_AlbOT_descripcion_pais: TStringField;
    SQLQuery_AlbOT_descripcion_poblacion: TStringField;
    SQLQuery_AlbOT_descripcion_provincia: TStringField;
    SQLQuery_AlbOT_descripcion_representante: TStringField;
    SQLQuery_AlbOT_descripcion_tarifa: TStringField;
    SQLQuery_AlbOT_descripcion_transportista: TStringField;
    SQLQuery_AlbOT_el_Albaran1: TStringField;
    SQLQuery_AlbOT_Envio_descripcion_pais: TStringField;
    SQLQuery_AlbOT_Envio_descripcion_poblacion: TStringField;
    SQLQuery_AlbOT_Envio_descripcion_provincia: TStringField;
    SQLQuery_AlbOT_Movil_representante: TStringField;
    SQLQuery_AlbOT_Movil_transportista: TStringField;
    SQLQuery_AlbOT_tfno_1_representante: TStringField;
    SQLQuery_AlbOT_tfno_1_transportista: TStringField;
    SQLQuery_AlbOT_vehiculo_matricula: TStringField;
    SQLQuery_AlbRetencion: TBCDField;
    SQLQuery_AlbRetencion_Representante: TBCDField;
    SQLQuery_AlbRiesgo_Autorizado: TBCDField;
    SQLQuery_AlbSerie_Albaran: TStringField;
    SQLQuery_AlbSerie_Factura: TStringField;
    SQLQuery_AlbSerie_Pedido: TStringField;
    SQLQuery_AlbSerie_Presupuesto: TStringField;
    SQLQuery_AlbTfno_Fijo_1: TStringField;
    SQLQuery_AlbTfno_Fijo_2: TStringField;
    SQLQuery_AlbTotal_Lineas: TBCDField;
    SQLQuery_AlbTotal_Mano_Obra: TBCDField;
    SQLQuery_AlbTotal_Materiales: TBCDField;
    SQLQuery_AlbTotal_Resto: TBCDField;
    SQLQuery_AlbTotal_Total: TBCDField;
    SQLQuery_AlbVencimientos_1_Dias: TSmallintField;
    SQLQuery_AlbVencimientos_automaticos_SN: TStringField;
    SQLQuery_AlbVencimientos_Cantidad: TSmallintField;
    SQLQuery_AlbVencimientos_Dias_Entre: TSmallintField;
    SQLQuery_Alb_Detalles: TSQLQuery;
    SQLQuery_Alb_DetallesChange_Id_User: TLargeintField;
    SQLQuery_Alb_DetallesChange_WHEN: TDateTimeField;
    SQLQuery_Alb_DetallesCodigoBarras_Referencia: TStringField;
    SQLQuery_Alb_DetallesComision_Representante: TBCDField;
    SQLQuery_Alb_DetallesDel_Id_User: TLargeintField;
    SQLQuery_Alb_DetallesDel_WHEN: TDateTimeField;
    SQLQuery_Alb_DetallesDel_WHY: TStringField;
    SQLQuery_Alb_Detallesdescripcion: TStringField;
    SQLQuery_Alb_Detallesdescripcion_para_TPV: TStringField;
    SQLQuery_Alb_DetallesDescuento_Comercial_1: TBCDField;
    SQLQuery_Alb_DetallesDescuento_Comercial_2: TBCDField;
    SQLQuery_Alb_DetallesExcluido_su_Cobro_SN: TStringField;
    SQLQuery_Alb_DetallesFecha_Movimiento: TDateTimeField;
    SQLQuery_Alb_Detallesid_albaranes: TLargeintField;
    SQLQuery_Alb_Detallesid_almacenes: TLargeintField;
    SQLQuery_Alb_Detallesid_articulos: TLargeintField;
    SQLQuery_Alb_Detallesid_clientes: TLargeintField;
    SQLQuery_Alb_Detallesid_impuestos_Ventas: TLargeintField;
    SQLQuery_Alb_DetallesInsert_Id_User: TLargeintField;
    SQLQuery_Alb_DetallesInsert_WHEN: TDateTimeField;
    SQLQuery_Alb_DetallesNumero_Factura: TLargeintField;
    SQLQuery_Alb_DetallesOT_Cliente_nombre_comercial: TStringField;
    SQLQuery_Alb_DetallesOT_Cliente_nombre_propietario: TStringField;
    SQLQuery_Alb_DetallesOT_descripcion_almacen: TStringField;
    SQLQuery_Alb_DetallesOT_descripcion_articulo: TStringField;
    SQLQuery_Alb_DetallesOT_descripcion_impuesto: TStringField;
    SQLQuery_Alb_DetallesOT_Descripcion_para_DbGrid1: TStringField;
    SQLQuery_Alb_DetallesOT_id_almacenes_Cabecera: TLargeintField;
    SQLQuery_Alb_DetallesOT_id_vehiculos_Cabecera: TLargeintField;
    SQLQuery_Alb_DetallesOT_Numero_Albaran: TLargeintField;
    SQLQuery_Alb_DetallesOT_Serie_Albaran: TStringField;
    SQLQuery_Alb_DetallesOT_Sumado_A_Ftra_SN: TStringField;
    SQLQuery_Alb_DetallesOT_Tanto_Por_Ciento: TBCDField;
    SQLQuery_Alb_DetallesOT_Tipo_de_articulo: TStringField;
    SQLQuery_Alb_DetallesOT_Total_Dto_1_1: TFloatField;
    SQLQuery_Alb_DetallesOT_Total_Dto_2_1: TFloatField;
    SQLQuery_Alb_DetallesOT_Total_Linea_con_Dtos1: TFloatField;
    SQLQuery_Alb_DetallesOT_Total_Linea_sin_Dtos1: TFloatField;
    SQLQuery_Alb_DetallesPVP: TBCDField;
    SQLQuery_Alb_DetallesRepetir_Cada: TLongintField;
    SQLQuery_Alb_DetallesSerie_Factura: TStringField;
    SQLQuery_Alb_DetallesUnidades: TBCDField;
    SQLQuery_List_Pdoagencias_transporte_id_proveedores: TLargeintField;
    SQLQuery_List_PdoBase: TBCDField;
    SQLQuery_List_PdoCerrado_SN: TStringField;
    SQLQuery_List_PdoChange_Id_User: TLargeintField;
    SQLQuery_List_PdoChange_Id_User_1: TLargeintField;
    SQLQuery_List_PdoChange_WHEN: TDateTimeField;
    SQLQuery_List_PdoChange_WHEN_1: TDateTimeField;
    SQLQuery_List_PdoCodigo_Postal: TStringField;
    SQLQuery_List_PdoComentarios_a_imprimir_en_Albaran: TStringField;
    SQLQuery_List_PdoComision_Representante: TBCDField;
    SQLQuery_List_PdoCONCEPTO_SEPA: TStringField;
    SQLQuery_List_PdoCta_Bco_BIC_SWIFT: TStringField;
    SQLQuery_List_PdoCta_Bco_Codigo_Postal: TStringField;
    SQLQuery_List_PdoCta_Bco_Cuenta: TStringField;
    SQLQuery_List_PdoCta_Bco_Digito_Control: TStringField;
    SQLQuery_List_PdoCta_Bco_Direccion: TStringField;
    SQLQuery_List_PdoCta_Bco_Direccion_Numero: TStringField;
    SQLQuery_List_PdoCta_Bco_Direccion_Piso_Letra: TStringField;
    SQLQuery_List_PdoCta_Bco_Entidad: TStringField;
    SQLQuery_List_PdoCta_Bco_IBAN: TStringField;
    SQLQuery_List_PdoCta_Bco_id_paises: TLargeintField;
    SQLQuery_List_PdoCta_Bco_id_poblaciones: TLargeintField;
    SQLQuery_List_PdoCta_Bco_id_provincias: TLargeintField;
    SQLQuery_List_PdoCta_Bco_Mandato_Fecha_de_Firma: TDateTimeField;
    SQLQuery_List_PdoCta_Bco_Mandato_Ref: TStringField;
    SQLQuery_List_PdoCta_Bco_Sucursal: TStringField;
    SQLQuery_List_PdoDel_Id_User: TLargeintField;
    SQLQuery_List_PdoDel_Id_User_1: TLargeintField;
    SQLQuery_List_PdoDel_WHEN: TDateTimeField;
    SQLQuery_List_PdoDel_WHEN_1: TDateTimeField;
    SQLQuery_List_PdoDel_WHY: TStringField;
    SQLQuery_List_PdoDel_WHY_1: TStringField;
    SQLQuery_List_PdoDescuento_Comercial_1: TBCDField;
    SQLQuery_List_PdoDescuento_Comercial_2: TBCDField;
    SQLQuery_List_PdoDescuento_Final: TBCDField;
    SQLQuery_List_PdoDescuento_Pronto_Pago: TBCDField;
    SQLQuery_List_PdoDireccion: TStringField;
    SQLQuery_List_PdoDireccion_Numero: TStringField;
    SQLQuery_List_PdoDireccion_Piso_Letra: TStringField;
    SQLQuery_List_PdoEnvio_Bultos: TLongintField;
    SQLQuery_List_PdoEnvio_Codigo_Postal: TStringField;
    SQLQuery_List_PdoEnvio_Condiciones_Entrega: TStringField;
    SQLQuery_List_PdoEnvio_Con_Quien_Hablar: TStringField;
    SQLQuery_List_PdoEnvio_Direccion: TStringField;
    SQLQuery_List_PdoEnvio_Direccion_Numero: TStringField;
    SQLQuery_List_PdoEnvio_Direccion_Piso_Letra: TStringField;
    SQLQuery_List_PdoEnvio_eMail: TStringField;
    SQLQuery_List_PdoEnvio_FAX: TStringField;
    SQLQuery_List_PdoEnvio_Fecha_Recogida_Prevista: TDateTimeField;
    SQLQuery_List_PdoEnvio_id_paises: TLargeintField;
    SQLQuery_List_PdoEnvio_id_poblaciones: TLargeintField;
    SQLQuery_List_PdoEnvio_id_provincias: TLargeintField;
    SQLQuery_List_PdoEnvio_Movil: TStringField;
    SQLQuery_List_PdoEnvio_Portes: TBCDField;
    SQLQuery_List_PdoEnvio_Portes_Pagados_SN: TStringField;
    SQLQuery_List_PdoEnvio_Tfno_Fijo_1: TStringField;
    SQLQuery_List_PdoEnvio_Tfno_Fijo_2: TStringField;
    SQLQuery_List_PdoFAX: TStringField;
    SQLQuery_List_PdoFecha: TDateTimeField;
    SQLQuery_List_PdoForma_pago_Dia_1: TSmallintField;
    SQLQuery_List_PdoForma_pago_Dia_2: TSmallintField;
    SQLQuery_List_PdoForma_pago_Vacaciones_Dia_Fin: TSmallintField;
    SQLQuery_List_PdoForma_pago_Vacaciones_Dia_Inicio: TSmallintField;
    SQLQuery_List_PdoForma_pago_Vacaciones_Mes_Fin: TSmallintField;
    SQLQuery_List_PdoForma_pago_Vacaciones_Mes_Inicio: TSmallintField;
    SQLQuery_List_Pdoid: TLargeintField;
    SQLQuery_List_Pdoid_1: TLargeintField;
    SQLQuery_List_Pdoid_almacenes: TLargeintField;
    SQLQuery_List_Pdoid_clientes: TLargeintField;
    SQLQuery_List_Pdoid_empresas: TLargeintField;
    SQLQuery_List_Pdoid_formas_pago: TLargeintField;
    SQLQuery_List_Pdoid_impuestos: TLargeintField;
    SQLQuery_List_Pdoid_paises: TLargeintField;
    SQLQuery_List_Pdoid_pedidos: TLargeintField;
    SQLQuery_List_Pdoid_poblaciones: TLargeintField;
    SQLQuery_List_Pdoid_provincias: TLargeintField;
    SQLQuery_List_Pdoid_representantes: TLargeintField;
    SQLQuery_List_Pdoid_tarifas: TLargeintField;
    SQLQuery_List_Pdoid_vehiculos: TLargeintField;
    SQLQuery_List_PdoImporte: TBCDField;
    SQLQuery_List_PdoInsert_Id_User: TLargeintField;
    SQLQuery_List_PdoInsert_Id_User_1: TLargeintField;
    SQLQuery_List_PdoInsert_WHEN: TDateTimeField;
    SQLQuery_List_PdoInsert_WHEN_1: TDateTimeField;
    SQLQuery_List_PdoIVA_con_Recargo_SN: TStringField;
    SQLQuery_List_PdoIVA_con_Recargo_SN_Representante: TStringField;
    SQLQuery_List_PdoIVA_Excluido_SN: TStringField;
    SQLQuery_List_PdoIVA_Excluido_SN_Representante: TStringField;
    SQLQuery_List_PdoMovil: TStringField;
    SQLQuery_List_Pdonif_cif: TStringField;
    SQLQuery_List_Pdonombre_comercial: TStringField;
    SQLQuery_List_Pdonombre_propietario: TStringField;
    SQLQuery_List_PdoNumero_Pedido: TLargeintField;
    SQLQuery_List_PdoNumero_Presupuesto: TLargeintField;
    SQLQuery_List_PdoObservaciones: TStringField;
    SQLQuery_List_PdoOT_descripcion_impuesto: TStringField;
    SQLQuery_List_PdoOT_el_Pedido: TStringField;
    SQLQuery_Imptos_Totales: TSQLQuery;
    SQLQuery_Imptos_Totalesid_impuestos: TLargeintField;
    SQLQuery_Imptos_TotalesOT_Descripcion_impto: TStringField;
    SQLQuery_Imptos_TotalesTotal_Base: TFMTBCDField;
    SQLQuery_Imptos_TotalesTotal_Cuota: TFMTBCDField;
    SQLQuery_List_Pdo: TSQLQuery;
    SQLQuery_List_PdoOT_Tanto_Por_Ciento: TBCDField;
    SQLQuery_List_PdoRetencion: TBCDField;
    SQLQuery_List_PdoRetencion_Representante: TBCDField;
    SQLQuery_List_PdoRiesgo_Autorizado: TBCDField;
    SQLQuery_List_PdoSerie_Pedido: TStringField;
    SQLQuery_List_PdoSerie_Presupuesto: TStringField;
    SQLQuery_List_PdoTfno_Fijo_1: TStringField;
    SQLQuery_List_PdoTfno_Fijo_2: TStringField;
    SQLQuery_List_PdoTotal_Lineas: TBCDField;
    SQLQuery_List_PdoTotal_Mano_Obra: TBCDField;
    SQLQuery_List_PdoTotal_Materiales: TBCDField;
    SQLQuery_List_PdoTotal_Resto: TBCDField;
    SQLQuery_List_PdoTotal_Total: TBCDField;
    SQLQuery_List_PdoVencimientos_1_Dias: TSmallintField;
    SQLQuery_List_PdoVencimientos_automaticos_SN: TStringField;
    SQLQuery_List_PdoVencimientos_Cantidad: TSmallintField;
    SQLQuery_List_PdoVencimientos_Dias_Entre: TSmallintField;
    SQLQuery_PdoVencimientos_1_Dias: TSmallintField;
    SQLQuery_Pdo_DetallesChange_Id_User: TLargeintField;
    SQLQuery_Pdo_DetallesChange_WHEN: TDateTimeField;
    SQLQuery_Pdo_DetallesCodigoBarras_Referencia: TStringField;
    SQLQuery_Pdo_DetallesComision_Representante: TBCDField;
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
    SQLQuery_Pdo_Detallesid_clientes: TLargeintField;
    SQLQuery_Pdo_Detallesid_impuestos_Ventas: TLargeintField;
    SQLQuery_Pdo_Detallesid_pedidos: TLargeintField;
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
    SQLQuery_Pdo_Impuestos: TSQLQuery;
    SQLQuery_Clientesid2: TLargeintField;
    SQLQuery_Clientesid3: TLargeintField;
    SQLQuery_Pdo: TSQLQuery;
    SQLQuery_Pdoagencias_transporte_id_proveedores: TLargeintField;
    SQLQuery_PdoCerrado_SN: TStringField;
    SQLQuery_PdoChange_Id_User: TLargeintField;
    SQLQuery_PdoChange_WHEN: TDateTimeField;
    SQLQuery_PdoCodigo_Postal: TStringField;
    SQLQuery_PdoComentarios_a_imprimir_en_Albaran: TStringField;
    SQLQuery_PdoComision_Representante: TBCDField;
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
    SQLQuery_PdoForma_pago_Dia_1: TSmallintField;
    SQLQuery_PdoForma_pago_Dia_2: TSmallintField;
    SQLQuery_PdoForma_pago_Vacaciones_Dia_Fin: TSmallintField;
    SQLQuery_PdoForma_pago_Vacaciones_Dia_Inicio: TSmallintField;
    SQLQuery_PdoForma_pago_Vacaciones_Mes_Fin: TSmallintField;
    SQLQuery_PdoForma_pago_Vacaciones_Mes_Inicio: TSmallintField;
    SQLQuery_Pdoid: TLargeintField;
    SQLQuery_Pdoid_almacenes: TLargeintField;
    SQLQuery_Pdoid_clientes: TLargeintField;
    SQLQuery_Pdoid_empresas: TLargeintField;
    SQLQuery_Pdoid_formas_pago: TLargeintField;
    SQLQuery_Pdoid_paises: TLargeintField;
    SQLQuery_Pdoid_poblaciones: TLargeintField;
    SQLQuery_Pdoid_provincias: TLargeintField;
    SQLQuery_Pdoid_representantes: TLargeintField;
    SQLQuery_Pdoid_tarifas: TLargeintField;
    SQLQuery_Pdoid_vehiculos: TLargeintField;
    SQLQuery_PdoInsert_Id_User: TLargeintField;
    SQLQuery_PdoInsert_WHEN: TDateTimeField;
    SQLQuery_PdoIVA_con_Recargo_SN: TStringField;
    SQLQuery_PdoIVA_con_Recargo_SN_Representante: TStringField;
    SQLQuery_PdoIVA_Excluido_SN: TStringField;
    SQLQuery_PdoIVA_Excluido_SN_Representante: TStringField;
    SQLQuery_PdoMovil: TStringField;
    SQLQuery_Pdonif_cif: TStringField;
    SQLQuery_Pdonombre_comercial: TStringField;
    SQLQuery_Pdonombre_propietario: TStringField;
    SQLQuery_PdoNumero_Pedido: TLargeintField;
    SQLQuery_PdoNumero_Presupuesto: TLargeintField;
    SQLQuery_PdoObservaciones: TStringField;
    SQLQuery_PdoOT_Cta_Bco_descripcion_pais: TStringField;
    SQLQuery_PdoOT_Cta_Bco_descripcion_poblacion: TStringField;
    SQLQuery_PdoOT_Cta_Bco_descripcion_provincia: TStringField;
    SQLQuery_PdoOT_descripcion_almacen: TStringField;
    SQLQuery_PdoOT_descripcion_cliente: TStringField;
    SQLQuery_PdoOT_descripcion_empresa: TStringField;
    SQLQuery_PdoOT_descripcion_forma_pago: TStringField;
    SQLQuery_PdoOT_descripcion_pais: TStringField;
    SQLQuery_PdoOT_descripcion_poblacion: TStringField;
    SQLQuery_PdoOT_descripcion_provincia: TStringField;
    SQLQuery_PdoOT_descripcion_representante: TStringField;
    SQLQuery_PdoOT_descripcion_tarifa: TStringField;
    SQLQuery_PdoOT_descripcion_transportista: TStringField;
    SQLQuery_PdoOT_el_Pedido: TStringField;
    SQLQuery_PdoOT_Envio_descripcion_pais: TStringField;
    SQLQuery_PdoOT_Envio_descripcion_poblacion: TStringField;
    SQLQuery_PdoOT_Envio_descripcion_provincia: TStringField;
    SQLQuery_PdoOT_Movil_representante: TStringField;
    SQLQuery_PdoOT_Movil_transportista: TStringField;
    SQLQuery_PdoOT_tfno_1_representante: TStringField;
    SQLQuery_PdoOT_tfno_1_transportista: TStringField;
    SQLQuery_PdoOT_vehiculo_matricula: TStringField;
    SQLQuery_PdoRetencion: TBCDField;
    SQLQuery_PdoRetencion_Representante: TBCDField;
    SQLQuery_PdoRiesgo_Autorizado: TBCDField;
    SQLQuery_PdoSerie_Pedido: TStringField;
    SQLQuery_PdoSerie_Presupuesto: TStringField;
    SQLQuery_PdoTfno_Fijo_1: TStringField;
    SQLQuery_PdoTfno_Fijo_2: TStringField;
    SQLQuery_PdoTotal_Lineas: TBCDField;
    SQLQuery_PdoTotal_Mano_Obra: TBCDField;
    SQLQuery_PdoTotal_Materiales: TBCDField;
    SQLQuery_PdoTotal_Resto: TBCDField;
    SQLQuery_PdoTotal_Total: TBCDField;
    SQLQuery_PdoVencimientos_automaticos_SN: TStringField;
    SQLQuery_PdoVencimientos_Cantidad: TSmallintField;
    SQLQuery_PdoVencimientos_Dias_Entre: TSmallintField;
    SQLQuery_Pdo_Detalles: TSQLQuery;
    SQLQuery_Pdo_Detalles_Stock: TSQLQuery;
    SQLQuery_Clientesid1: TLargeintField;
    SQLQuery_Pdo_Detalles_Stockid_almacenes: TLargeintField;
    SQLQuery_Pdo_Detalles_Stockid_articulos: TLargeintField;
    SQLQuery_Pdo_Detalles_StockOT_descripcion_almacen: TStringField;
    SQLQuery_Pdo_Detalles_StockOT_descripcion_articulo: TStringField;
    SQLQuery_Pdo_Detalles_StockStock: TBCDField;
    SQLQuery_Pdo_Detalles_Stockunidades: TFMTBCDField;
    SQLQuery_Pdo_ImpuestosBase: TBCDField;
    SQLQuery_Pdo_ImpuestosChange_Id_User: TLargeintField;
    SQLQuery_Pdo_ImpuestosChange_WHEN: TDateTimeField;
    SQLQuery_Pdo_ImpuestosDel_Id_User: TLargeintField;
    SQLQuery_Pdo_ImpuestosDel_WHEN: TDateTimeField;
    SQLQuery_Pdo_ImpuestosDel_WHY: TStringField;
    SQLQuery_Pdo_Impuestosid_impuestos: TLargeintField;
    SQLQuery_Pdo_Impuestosid_pedidos: TLargeintField;
    SQLQuery_Pdo_ImpuestosImporte: TBCDField;
    SQLQuery_Pdo_ImpuestosInsert_Id_User: TLargeintField;
    SQLQuery_Pdo_ImpuestosInsert_WHEN: TDateTimeField;
    SQLQuery_Pdo_ImpuestosOT_descripcion_impuesto: TStringField;
    SQLQuery_Pdo_ImpuestosOT_Tanto_Por_Ciento: TBCDField;
    TabSheet_Busqueda_Concreta: TTabSheet;
    TabSheet_Filtros_Generales: TTabSheet;

    procedure Boton_Elegir_PeriodoClick(Sender: TObject);
    function  Filtrar_Listado_Pdo( param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
    procedure Filtrar_Impuestos_Totales;
    procedure BitBtn_Convertir_Integro_en_FacturaClick(Sender: TObject);
    procedure SQLQuery_List_PdoCalcFields(DataSet: TDataSet);
    procedure Sumar_Totales;
    procedure Refrescar_Registros_Impuestos;
    procedure Convertir_Integro_en_Albaran_01(param_Crear_Ftra : Boolean);
    function  Convertir_Integro_en_Albaran_02(param_msg : TStrings) : TAlbaran_Creado;
    procedure Convertir_Integro_en_Factura( param_msg : TStrings; param_Albaran_Creado : TAlbaran_Creado );
    function  Filtrar_Lineas_Impuestos( param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
    procedure BitBtn_Ver_PresupuestoClick(Sender: TObject);
    procedure Presentar_Datos_Totales( param_Actualizar_Totales : Byte );
    procedure Cerramos_Tabla_Detalles_Stock;
    procedure Refrescar_Registros_Detalles_Stock;
    procedure Filtrar_Lineas_Detalles_Agrupadas_Por_Articulo;
    procedure Borrar_Registro;
    procedure Borrar_en_Presupuestos_el_Pedido( param_Serie_Pedido, param_Numero_Pedido : String );
    procedure ComboBox_FiltrosChange(Sender: TObject);
    procedure Comprobar_Si_Hay_Lineas_Detalle_Sin_Albaran(param_msg : TStrings);
    procedure SQLQuery_AlbAfterPost(DataSet: TDataSet);
    procedure SQLQuery_AlbBeforePost(DataSet: TDataSet);
    procedure SQLQuery_Alb_DetallesAfterPost(DataSet: TDataSet);
    procedure SQLQuery_Alb_DetallesBeforePost(DataSet: TDataSet);
    function  Traer_id_Presupuestos_Antes_de_Borrar_en_Presupuestos_el_Pedido( param_Serie_Pedido, param_Numero_Pedido : String ) : ShortString;
    procedure Crear_Albaran_su_Detalle( param_Fecha : TDateTime; param_Serie, param_Numero : ShortString; param_Todas_Las_Lineas : Boolean );
    procedure Crear_Albaran_su_Detalle_2( param_Fecha : TDateTime; param_id, param_Serie, param_Numero : ShortString; param_Todas_Las_Lineas : Boolean );
    procedure Crear_Albaran_su_Detalle_3( param_Fecha : TDateTime; param_id, param_Serie, param_Numero : ShortString; param_Todas_Las_Lineas : Boolean );
    procedure Cerrarlo;
    function  Crear_Albaran_su_Cabecera( param_Fecha : TDateTime ) : TEmpresas;
    procedure Crear_Albaran_su_Cabecera_2;
    procedure SQLQuery_Alb_DetallesCalcFields(DataSet: TDataSet);
    procedure Cerramos_Tabla_Albaranes_Cabecera;
    procedure Cerramos_Tabla_Albaranes_Detalles;
    procedure Filtrar_Albaranes_Cabecera( param_Fecha, param_Serie, param_Numero : ShortString );
    procedure Filtrar_Albaranes_Detalles( param_id : ShortString );
    procedure BitBtn_Convertir_Integro_en_AlbaranClick(Sender: TObject);
    procedure BitBtn_Considerar_como_cerradoClick(Sender: TObject);
    procedure Filtrar_tablas_ligadas;
    procedure Editar_Registro;
    procedure Insertar_Registro;
    procedure Boton_Elegir_EmpresaClick(Sender: TObject);
    procedure Boton_Elegir_Forma_PagoClick(Sender: TObject);
    procedure Boton_Elegir_id_AlmacenesClick(Sender: TObject);
    procedure Boton_Elegir_id_ClientesClick(Sender: TObject);
    procedure Boton_Elegir_id_VehiculosClick(Sender: TObject);
    procedure Edit_Descripcion_EmpresaClick(Sender: TObject);
    procedure Edit_Descripcion_Forma_PagoClick(Sender: TObject);
    procedure Edit_Descripcion_id_AlmacenesClick(Sender: TObject);
    procedure Edit_Descripcion_id_ClientesClick(Sender: TObject);
    procedure Edit_Descripcion_id_VehiculosClick(Sender: TObject);
    procedure Refrescar_Registros_Detalles;
    procedure Refrescar_Registros;
    procedure Filtrar_Principal_Sin_Preguntar;
    function  Filtrar_Lineas_Detalles( param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
    function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
    procedure BitBtn_FiltrarClick(Sender: TObject);
    procedure BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
    procedure Presentar_Datos;
    procedure no_Tocar;
    procedure BitBtn_ImprimirClick(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure Seleccionado_Rgtro;
    procedure BitBtn_SALIRClick(Sender: TObject);
    procedure BitBtn_SeleccionarClick(Sender: TObject);
    procedure Cerramos_Tablas;
    procedure Cerramos_Tablas_Ligadas;
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
    procedure SQLQuery_PdoAfterPost(DataSet: TDataSet);
    procedure SQLQuery_PdoAfterScroll(DataSet: TDataSet);
    procedure SQLQuery_PdoBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_PdoBeforePost(DataSet: TDataSet);
    procedure SQLQuery_PdoCalcFields(DataSet: TDataSet);
    procedure SQLQuery_Pdo_DetallesAfterPost(DataSet: TDataSet);
    procedure SQLQuery_Pdo_DetallesBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_Pdo_DetallesBeforePost(DataSet: TDataSet);
    procedure SQLQuery_Pdo_DetallesCalcFields(DataSet: TDataSet);

  private
    { private declarations }
    private_Salir_OK                  : Boolean;
    private_Order_By                  : array of TOrder_By;
    private_Order_By_Lineas_Impuestos : array of TOrder_By;
    private_Order_By_Lineas_Detalles  : array of TOrder_By;
  public
    { public declarations }
    public_Solo_Ver           : Boolean;
    public_Elegimos           : Boolean;
    public_Menu_Worked        : Integer;
    public_Rgtro_Seleccionado : Boolean;
  end;

var
  form_pedidos_ventas_000: Tform_pedidos_ventas_000;

implementation

{$R *.lfm}

uses dm_pedidos_ventas, menu, pedidos_ventas_001, pedidos_ventas_003, presupuestos_ventas_000,
     albaranes_ventas_000;

{ Tform_pedidos_ventas_000 }

procedure Tform_pedidos_ventas_000.FormActivate(Sender: TObject);
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

procedure Tform_pedidos_ventas_000.FormCreate(Sender: TObject);
var var_Present          : TDateTime;

    var_Year             : Word;
    var_Month            : Word;
    var_Day              : Word;

    var_Hour             : Word;
    var_Min              : Word;
    var_Sec              : Word;
    var_MSec             : Word;
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

    Boton_Elegir_id_Vehiculos.Visible     := false;
    Label_Vehiculo.Visible                := false;
    Edit_Descripcion_id_Vehiculos.Visible := false;

    form_Menu.Traer_Configuracion_APP;
    if UpperCase(Trim(form_menu.public_User_Configuracion.Albaranes_Obligar_Almacen_SN)) = 'S' then
    begin
        Boton_Elegir_id_Almacenes.Visible     := true;
        Label_Almacen.Visible                 := true;
        Edit_Descripcion_id_Almacenes.Visible := true;
    end;

    if UpperCase(Trim(form_menu.public_User_Configuracion.Trabajar_Albaranes_con_Vehiculos_SN)) = 'S' then
    begin
        Boton_Elegir_id_Vehiculos.Visible     := true;
        Label_Vehiculo.Visible                := true;
        Edit_Descripcion_id_Vehiculos.Visible := true;
    end;

    var_Present := Now;
    DecodeDate(var_Present, var_Year, var_Month, var_Day);
    DecodeTime(var_Present, var_Hour, var_Min, var_Sec, var_MSec);

    DateTimePicker_Desde.Date := StrToDate( '01/01/' + IntToStr(var_Year - 1) );
    DateTimePicker_Hasta.Date := StrToDate( '31/12/' + IntToStr(var_Year + 1) );
end;

procedure Tform_pedidos_ventas_000.RadioGroup_BajasClick(Sender: TObject);
begin
    Refrescar_Registros;
end;

procedure Tform_pedidos_ventas_000.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
    if private_Salir_OK = False then
    begin
        // ***************************************************************************************** //
        // ** Intento BitBtn_SALIR de la aplicación de un modo no permitido.                      ** //
        // ***************************************************************************************** //
        // ** Pero si desde el menu principal está a true la variable public_Salir_Ok, significa  ** //
        // ** que hay que salir si o si pues se pulsó cancelar al preguntar otra vez por la       ** //
        // ** contraseña                                                                          ** //
        // ***************************************************************************************** //
        if form_Menu.public_Salir_OK = False then CloseAction := caNone;
    end else begin
        // ***************************************************************************************** //
        // ** Fue correcto el modo como quiere BitBtn_SALIR de la aplicación                      ** //
        // ***************************************************************************************** //
    end;
end;

procedure Tform_pedidos_ventas_000.FormDestroy(Sender: TObject);
begin
    Cerramos_Tablas;
end;

procedure Tform_pedidos_ventas_000.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_pedidos_ventas.SQLConnector_Pedido,
                      DataModule_pedidos_ventas.SQLTransaction_Pedido,
                      SQLQuery_Pdo ) = false then UTI_GEN_Salir;

    DataModule_pedidos_ventas.Free;
end;

procedure Tform_pedidos_ventas_000.Cerramos_Tablas_Ligadas;
begin
    if UTI_TB_Cerrar( DataModule_pedidos_ventas.SQLConnector_Pedido_Detalles,
                      DataModule_pedidos_ventas.SQLTransaction_Pedido_Detalles,
                      SQLQuery_Pdo_Detalles ) = false then UTI_GEN_Salir;
end;

procedure Tform_pedidos_ventas_000.Cerramos_Tabla_Detalles_Stock;
begin
    if UTI_TB_Cerrar( DataModule_pedidos_ventas.SQLConnector_Pedido_Detalles_Stock,
                      DataModule_pedidos_ventas.SQLTransaction_Pedido_Detalles_Stock,
                      SQLQuery_Pdo_Detalles_Stock ) = false then UTI_GEN_Salir;
end;

procedure Tform_pedidos_ventas_000.SQLQuery_PdoCalcFields(DataSet: TDataSet);
begin
    with SQLQuery_Pdo do
    begin
        if Trim(FieldByName('Serie_Pedido').AsString) <> '' then
        begin
            FieldByName('OT_el_Pedido').AsString := Trim(FieldByName('Serie_Pedido').AsString) +
                                                    '-' +
                                                    Trim(FieldByName('Numero_Pedido').AsString);
        end else begin
            FieldByName('OT_el_Pedido').AsString := Trim(FieldByName('Numero_Pedido').AsString);
        end;
    end;
end;

procedure Tform_pedidos_ventas_000.SQLQuery_PdoAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'pedidos_ventas',
                       DataModule_pedidos_ventas.SQLTransaction_Pedido,
                       SQLQuery_Pdo,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros;
end;

procedure Tform_pedidos_ventas_000.SQLQuery_PdoBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Pdo );
end;

procedure Tform_pedidos_ventas_000.SQLQuery_PdoBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Pdo );
end;

procedure Tform_pedidos_ventas_000.SQLQuery_PdoAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure Tform_pedidos_ventas_000.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    If public_Elegimos then
         Seleccionado_Rgtro
    else Editar_Registro;
end;

procedure Tform_pedidos_ventas_000.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then
    begin
        If public_Elegimos then
             Seleccionado_Rgtro
        else Editar_Registro;
    end;
end;

procedure Tform_pedidos_ventas_000.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

procedure Tform_pedidos_ventas_000.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure Tform_pedidos_ventas_000.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_pedidos_ventas_000.BitBtn_SeleccionarClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
end;

procedure Tform_pedidos_ventas_000.Seleccionado_Rgtro;
begin
    private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    public_Rgtro_Seleccionado := true;
    Close;
end;

procedure Tform_pedidos_ventas_000.no_Tocar;
begin
end;

procedure Tform_pedidos_ventas_000.Presentar_Datos;
begin
     /// guardar por lo que pueda pasar
end;

procedure Tform_pedidos_ventas_000.BitBtn_FiltrarClick(Sender: TObject);
var var_msg : TStrings;
begin
    // ********************************************************************************************* //
    // ** COMPROBAMOS SI EL MARGEN DE FECHAS ESTA BIEN INTRODUCIDO                                ** //
    // ********************************************************************************************* //
    var_msg := TStringList.Create;

    if UTI_GEN_Comprobar_2_Fechas( DateTimePicker_Desde,
                                   DateTimePicker_Hasta ) = false then
    begin
        var_msg.Add('* Fechas mal introducidas para margen de pedidos.');
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

procedure Tform_pedidos_ventas_000.BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if SQLQuery_Pdo.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'pedidos_ventas',
                                           SQLQuery_Pdo,
                                           DataSource_Pdo,
                                           DBGrid_Principal );
        end;
    end;
end;

procedure Tform_pedidos_ventas_000.Refrescar_Registros_Detalles;
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
    if SQLQuery_Pdo.State <> dsEdit then Exit;

    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_id := '';

    with SQLQuery_Pdo_Detalles do
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
    var_SQL_ADD.Add( 'pdod.id_pedidos = ' + SQLQuery_Pdo.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_ver_Bajas := 1; // asi no se ven las bajas hasta que no lo pida el form de altas/modif de líneas
    if UTI_GEN_Form_Abierto_Ya('form_pedidos_ventas_001') = true then
    begin
        var_ver_Bajas := form_pedidos_ventas_001.RadioGroup_Bajas.ItemIndex;
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
            SQLQuery_Pdo_Detalles.Last;
        end else begin
            // ************************************************************************************* //
            // ** Estabamos en una edición, así que ya conocíamos la id del registro. Por lo que  ** //
            // ** hago el locate por esta id                                                      ** //
            // ************************************************************************************* //
            SQLQuery_Pdo_Detalles.Locate('id', StrToInt64(var_id), []);
        end;

    end;

    var_SQL_ADD.Free;
end;

procedure Tform_pedidos_ventas_000.SQLQuery_Pdo_DetallesBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Pdo_Detalles );
end;

procedure Tform_pedidos_ventas_000.SQLQuery_Pdo_DetallesAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'pedidos_ventas_detalles',
                       DataModule_pedidos_ventas.SQLTransaction_Pedido_Detalles,
                       SQLQuery_Pdo_Detalles,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros_Detalles;
end;

procedure Tform_pedidos_ventas_000.Boton_Elegir_Forma_PagoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_FormasPago( true, false, 80, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Forma_Pago.Text          := Trim(var_Registro.id_1);
        Edit_Descripcion_Forma_Pago.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_pedidos_ventas_000.Edit_Descripcion_id_AlmacenesClick(Sender: TObject);
begin
    Edit_id_Almacenes.Text             := '';
    Edit_Descripcion_id_Almacenes.Text := '';
end;

procedure Tform_pedidos_ventas_000.Edit_Descripcion_id_ClientesClick(Sender: TObject);
begin
    Edit_id_Clientes.Text          := '';
    Edit_Descripcion_id_Clientes.Text := '';
end;

procedure Tform_pedidos_ventas_000.Edit_Descripcion_EmpresaClick(Sender: TObject);
begin
    Edit_id_Empresas.Text         := '';
    Edit_Descripcion_Empresa.Text := '';
end;

procedure Tform_pedidos_ventas_000.Boton_Elegir_EmpresaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Empresas( true, false, 250, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Empresas.Text         := Trim(var_Registro.id_1);
        Edit_Descripcion_Empresa.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_pedidos_ventas_000.Boton_Elegir_id_ClientesClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Clientes( true, false, 50, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Clientes.Text             := Trim(var_Registro.id_1);
        Edit_Descripcion_id_Clientes.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_pedidos_ventas_000.Edit_Descripcion_Forma_PagoClick(Sender: TObject);
begin
    Edit_id_Forma_Pago.Text          := '';
    Edit_Descripcion_Forma_Pago.Text := '';
end;

procedure Tform_pedidos_ventas_000.Boton_Elegir_id_AlmacenesClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Almacenes( true, false, 260, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Almacenes.Text             := Trim(var_Registro.id_1);
        Edit_Descripcion_id_Almacenes.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_pedidos_ventas_000.Edit_Descripcion_id_VehiculosClick(Sender: TObject);
begin
    Edit_id_Vehiculos.Text             := '';
    Edit_Descripcion_id_Vehiculos.Text := '';
end;

procedure Tform_pedidos_ventas_000.Boton_Elegir_id_VehiculosClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Vehiculos( true, false, 350, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Vehiculos.Text             := Trim(var_Registro.id_1);
        Edit_Descripcion_id_Vehiculos.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_pedidos_ventas_000.SQLQuery_Pdo_DetallesCalcFields(DataSet: TDataSet);
begin
    UTI_LINEAS_Poner_Totales_Linea_Detalle( SQLQuery_Pdo_Detalles );
end;

procedure Tform_pedidos_ventas_000.SQLQuery_Pdo_DetallesBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Pdo_Detalles );
end;

procedure Tform_pedidos_ventas_000.DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
var var_Color_Normal : TColor;
begin
    with Sender as TDBGrid do
    begin
        if form_pedidos_ventas_000.SQLQuery_Pdo.RecordCount = 0 then Exit;

        var_Color_Normal := Canvas.Brush.Color;

        // ***************************************************************************************** //
        // ** Primero comprobamos si es un registro dado de baja o no                             ** //
        // ***************************************************************************************** //
        if not form_pedidos_ventas_000.SQLQuery_Pdo.FieldByName('Del_WHEN').IsNull then
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

                if UTI_VENTAS_Esta_Cerrado_SN( 'pedidos_ventas',
                                               SQLQuery_Pdo.FieldByName('id').AsString ) = 'S' then }
                if SQLQuery_Pdo.FieldByName('Cerrado_SN').Value = 'S' then
                     Canvas.StretchDraw(Rect, Image_Candado.Picture.Graphic)
                else DefaultDrawColumnCell(Rect, DataCol, Column, State);
            end;
        end;

        Canvas.Font.Color := var_Color_Normal;
    end;
end;

procedure Tform_pedidos_ventas_000.Cerramos_Tabla_Albaranes_Cabecera;
begin
    if UTI_TB_Cerrar( DataModule_pedidos_ventas.SQLConnector_Alb,
                      DataModule_pedidos_ventas.SQLTransaction_Alb,
                      SQLQuery_Alb ) = false then UTI_GEN_Salir;
end;

procedure Tform_pedidos_ventas_000.Cerramos_Tabla_Albaranes_Detalles;
begin
    if UTI_TB_Cerrar( DataModule_pedidos_ventas.SQLConnector_Alb_Detalles,
                      DataModule_pedidos_ventas.SQLTransaction_Alb_Detalles,
                      SQLQuery_Alb_Detalles ) = false then UTI_GEN_Salir;
end;

procedure Tform_pedidos_ventas_000.SQLQuery_Alb_DetallesCalcFields(DataSet: TDataSet);
begin
    UTI_LINEAS_Poner_Totales_Linea_Detalle( SQLQuery_Alb_Detalles );
end;

procedure Tform_pedidos_ventas_000.BitBtn_Considerar_como_cerradoClick(Sender: TObject);
var var_msg : TStrings;
    var_id  : ShortString;
begin
    Cerrarlo;
end;

procedure Tform_pedidos_ventas_000.Crear_Albaran_su_Cabecera_2;
var var_Contador     : Integer;
    var_Nombre_Campo : String;
begin
    with SQLQuery_Alb do
    begin
        for var_Contador := 0 to Fields.Count - 1 do
        begin
            var_Nombre_Campo := Fields[var_Contador].FieldName;

            // ************************************************************************************* //
            // ** LOS CAMPOS QUE EMPIEZAN POR OT_ SON CAMPOS JOIN, asi que no guardo cambios      ** //
            // ************************************************************************************* //
            If Pos( UpperCase('OT_'), UpperCase(var_Nombre_Campo) ) = 0 then
            begin
                if ( Trim(UpperCase(var_Nombre_Campo)) <> UpperCase('id_empresas') )    and
                   ( Trim(UpperCase(var_Nombre_Campo)) <> UpperCase('Serie_Albaran') )  and
                   ( Trim(UpperCase(var_Nombre_Campo)) <> UpperCase('Numero_Albaran') ) and
                   ( Trim(UpperCase(var_Nombre_Campo)) <> UpperCase('Serie_Pedido') )   and
                   ( Trim(UpperCase(var_Nombre_Campo)) <> UpperCase('Numero_Pedido') )  and
                   ( Trim(UpperCase(var_Nombre_Campo)) <> UpperCase('Serie_Factura') )  and
                   ( Trim(UpperCase(var_Nombre_Campo)) <> UpperCase('Numero_Factura') ) and
                   ( Trim(UpperCase(var_Nombre_Campo)) <> UpperCase('Fecha') )          and
                   ( Trim(UpperCase(var_Nombre_Campo)) <> UpperCase('Insert_WHEN') )    and
                   ( Trim(UpperCase(var_Nombre_Campo)) <> UpperCase('Insert_Id_User') ) and
                   ( Trim(UpperCase(var_Nombre_Campo)) <> UpperCase('Del_WHEN') )       and
                   ( Trim(UpperCase(var_Nombre_Campo)) <> UpperCase('Del_Id_User') )    and
                   ( Trim(UpperCase(var_Nombre_Campo)) <> UpperCase('Del_WHY') )        and
                   ( Trim(UpperCase(var_Nombre_Campo)) <> UpperCase('Change_WHEN') )    and
                   ( Trim(UpperCase(var_Nombre_Campo)) <> UpperCase('Change_Id_User') ) then
                begin
                    FieldByName(var_Nombre_Campo).Clear;
                    if not SQLQuery_Pdo.FieldByName(var_Nombre_Campo).IsNull then
                    begin
                        FieldByName(var_Nombre_Campo).AsString := SQLQuery_Pdo.FieldByName(var_Nombre_Campo).AsString;
                    end;
                end;
            end;
        end;
    end;
end;

function Tform_pedidos_ventas_000.Crear_Albaran_su_Cabecera( param_Fecha : TDateTime ) : TEmpresas;
var var_Registro_Empresa : TEmpresas;
    var_msg              : TStrings;
begin
    with SQLQuery_Alb do
    begin
        // ***************************************************************************************** //
        // ** Si el pedido no tiene la empresa pusta pues no continuamos                          ** //
        // ***************************************************************************************** //
        if SQLQuery_Pdo.FieldByName('id_empresas').IsNull then
        begin
            var_msg := TStringList.Create;
            var_msg.Add('El pedido no tiene puesta su empresa');
            UTI_GEN_Aviso(true, var_msg, 'NO SE PUEDE ...', True, False);
            var_msg.Free;

            Result.id := '';
            Exit;
        end;

        // ***************************************************************************************** //
        // ** ABRIMOS LA TABLA DE CABECERAS DE albaranes, PERO FILTRANDO POR LA FECHA ELEGIDA     ** //
        // ***************************************************************************************** //
        Filtrar_Albaranes_Cabecera( DateToStr(Int(param_Fecha)), '', '' );

        Insert;

        // ***************************************************************************************** //
        // ** ASIGNAMOS LA EMPRESA Y NUMERO/SERIE DE albaran                                      ** //
        // ***************************************************************************************** //
        FieldByName('id_empresas').AsString := SQLQuery_Pdo.FieldByName('id_empresas').AsString;
        var_Registro_Empresa.id             := FieldByName('id_empresas').AsString;

        var_msg := TStringList.Create;
        var_Registro_Empresa := UTI_VENTAS_Devolver_Numeracion_Albaran( var_msg,
                                                                        var_Registro_Empresa,
                                                                        true,   // Para que se desbloquee el registro de empresas.
                                                                        true ); // Para que actualice la empresa con el siguiente albaran.
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
            // ** NO HAY errores en la búsqueda del próximo SERIE/NUMERO de albarán               ** //
            // ** Asi que guardamos en la CABECERA su SERIE/NUMERO de albarán                      ** //
            // ************************************************************************************* //
            FieldByName('Serie_Albaran').AsString  := var_Registro_Empresa.Serie_Albaran;
            FieldByName('Numero_Albaran').AsString := var_Registro_Empresa.Numero_Albaran;

            // ************************************************************************************* //
            // ** Guardamos en la cabecera del albarán de que pedido fue creado                   ** //
            // ************************************************************************************* //
            FieldByName('Serie_Pedido').AsString  := SQLQuery_Pdo.FieldByName('Serie_Pedido').AsString;
            FieldByName('Numero_Pedido').AsString := SQLQuery_Pdo.FieldByName('Numero_Pedido').AsString;
        end;

        var_msg.Free;

        // ***************************************************************************************** //
        // ** ASIGNAMOS EL RESTO DE CAMPOS                                                        ** //
        // ***************************************************************************************** //
        FieldByName('Fecha').Value          := Int(param_Fecha);

        // No cerramos porque los albaranes no tienen necesidad de ser cerrados
        // FieldByName('Cerrado_SN').AsString  := 'N';

        FieldByName('Insert_WHEN').Value    := param_Fecha;
        FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

        // ***************************************************************************************** //
        // ** ASIGNAMOS EL RESTO DE CAMPOS TAL CUAL COMO ESTAN EN LA CABECERA DEL PRESUPUESTO     ** //
        // ***************************************************************************************** //
        Crear_Albaran_su_Cabecera_2;

        // ***************************************************************************************** //
        // ** GRABAMOS LA CABECERA DEL albarán                                                    ** //
        // ***************************************************************************************** //
        UTI_RGTRO_Grabar_Antes( 'albaranes_ventas', SQLQuery_Alb );

        // ***************************************************************************************** //
        // ** CERRAMOS LA TABLA DE CABECERAS DE albaranes                                         ** //
        // ***************************************************************************************** //
        Cerramos_Tabla_Albaranes_Cabecera;

        // ***************************************************************************************** //
        // ** Devolvemos el registro de la empresa donde está entre otras cosas el numero y serie ** //
        // ** que estamos creando                                                                 ** //
        // ***************************************************************************************** //
        Result := var_Registro_Empresa;
    end;
end;

procedure Tform_pedidos_ventas_000.Crear_Albaran_su_Detalle( param_Fecha : TDateTime;
                                                             param_Serie,
                                                             param_Numero : ShortString;
                                                             param_Todas_Las_Lineas : Boolean );
var var_msg : TStrings;
    var_id  : ShortString;
begin
    // ********************************************************************************************* //
    // ** Abrimos la tabla de cabeceras del albarán                                               ** //
    // ********************************************************************************************* //
    Filtrar_Albaranes_Cabecera( DateToStr(Int(param_Fecha)),
                                param_Serie,
                                param_Numero );

    with SQLQuery_Alb do
    begin
        // ***************************************************************************************** //
        // ** Solo abrimos detalles si la cabecera existe y si no hay más de una cabecera.        ** //
        // ** Si hubiera más de una cabecera con mismo NUMERO/SERIE sería una duplicación y esto  ** //
        // ** no debería de producirse                                                            ** //
        // ***************************************************************************************** //
        if RecordCount = 1 then
        begin
            // ************************************************************************************* //
            // ** Bloqueamos la cabecera del albarán y editamos la cabecera para actualizar sus   ** //
            // ** totales y ponerle el número/serie al que pertenecen en pedidos                  ** //
            // ************************************************************************************* //
            var_id := FieldByName('id').AsString;

            if UTI_RGTRO_isLock( 'albaranes_ventas',
                                 var_id,
                                 true ) = true then
            begin
                Cerramos_Tabla_Albaranes_Cabecera;
                Exit;
            end else begin
                if UTI_RGTRO_Lock( 'albaranes_ventas',
                                   var_id ) = true then
                begin
                    Edit
                end else begin
                    Cerramos_Tabla_Albaranes_Cabecera;
                    Exit;
                end;
            end;

            // ************************************************************************************* //
            // ** Filtramos las líneas de detalle                                                 ** //
            // ************************************************************************************* //
            Filtrar_Albaranes_Detalles( FieldByName('id').AsString );

            // ************************************************************************************* //
            // ** Añadimos la/s líneas de detalle                                                 ** //
            // ************************************************************************************* //
            Crear_Albaran_su_Detalle_2( param_Fecha,
                                        var_id,
                                        param_Serie,
                                        param_Numero,
                                        param_Todas_Las_Lineas );

            UTI_LINEAS_poner_totales( 'albaranes_ventas',
                                      SQLQuery_Alb.FieldByName('id').AsString );

            // ************************************************************************************* //
            // ** No grabamos la cabecera, los totales los calcula un trigger                     ** //
            // ************************************************************************************* //
            Cancel;

            // ************************************************************************************* //
            // ** Liberamos cabecera de albarán                                                   ** //
            // ************************************************************************************* //
            UTI_RGTRO_UnLock( 'albaranes_ventas', var_id );

            // ************************************************************************************* //
            // ** CERRAMOS LAS TABLAS DE CABECERAS Y DETALLES                                     ** //
            // ************************************************************************************* //
            Cerramos_Tabla_Albaranes_Detalles;
            Cerramos_Tabla_Albaranes_Cabecera;
        end else begin
            // ************************************************************************************* //
            // ** Hay o más de un registro de cabecera o ninguno ... error seguro                 ** //
            // ************************************************************************************* //
            var_msg := TStringList.Create;

            if RecordCount > 1 then
            begin
                var_msg.Add( 'Hay más de un albarán con el mismo SERIE/NUMERO. Esto es un error serio,' +
                             ' así que no podemos continuar.' );
            end;

            if RecordCount = 0 then
            begin
                var_msg.Add( 'No existe todavía ningún albarán con la SERIE ' + Trim(param_Serie) +
                             ' y NUMERO ' + Trim(param_Numero) +
                             '. Esto es un error serio, así que no podemos continuar.' );
            end;

            UTI_GEN_Aviso(true, var_msg, 'NO SE PUDO', True, False);
            var_msg.Free;

            Cerramos_Tabla_Albaranes_Cabecera;
            Exit;
        end;
    end;
end;

procedure Tform_pedidos_ventas_000.Crear_Albaran_su_Detalle_2( param_Fecha : TDateTime;
                                                               param_id,
                                                               param_Serie,
                                                               param_Numero : ShortString;
                                                               param_Todas_Las_Lineas : Boolean );
var var_id : ShortString;
begin
    with SQLQuery_Pdo_Detalles do
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
                Crear_Albaran_su_Detalle_3( param_Fecha,
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
            Crear_Albaran_su_Detalle_3( param_Fecha,
                                        param_id,
                                        param_Serie,
                                        param_Numero,
                                        param_Todas_Las_Lineas );
        end;

        // ***************************************************************************************** //
        // ** Refrescamos las lineas de detalle del pedido pues se les acaba de cambiar si perte- ** //
        // ** necen a un albarán                                                                  ** //
        // ***************************************************************************************** //
        Filtrar_tablas_ligadas;

        // ***************************************************************************************** //
        // ** Volvemos a quedarnos en la línea que teníamos elegida en la tabla de detalles       ** //
        // ***************************************************************************************** //
        Locate('id', StrToInt64(var_id), []);
    end;
end;

procedure Tform_pedidos_ventas_000.Crear_Albaran_su_Detalle_3( param_Fecha : TDateTime;
                                                               param_id,
                                                               param_Serie,
                                                               param_Numero : ShortString;
                                                               param_Todas_Las_Lineas : Boolean );
var var_id : ShortString;
begin
    with SQLQuery_Pdo_Detalles do
    begin
        // ***************************************************************************************** //
        // ** Si la línea ya fué convertida pues no la convertimos                                ** //
        // ***************************************************************************************** //
        if (not FieldByName('Serie_Albaran').IsNull)  or
           (not FieldByName('Numero_Albaran').IsNull) then Exit;

        // ***************************************************************************************** //
        // ** Si la línea está dada de baja pues no la convertimos                                ** //
        // ***************************************************************************************** //
        if not FieldByName('Del_WHEN').IsNull then Exit;

        var_id := FieldByName('id').AsString;

        // ***************************************************************************************** //
        // ** Si la línea está bloqueada o no se puede bloquear pues no la convertimos            ** //
        // ***************************************************************************************** //
        var_id := FieldByName('id').AsString;

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

        // ***************************************************************************************** //
        // ** Grabamos el numero/serie del albarán que crea esta línea de pedidos                 ** //
        // ***************************************************************************************** //
        FieldByName('Serie_Albaran').AsString  := Trim(param_Serie);
        FieldByName('Numero_Albaran').AsString := Trim(param_Numero);

        FieldByName('Change_WHEN').Value    := param_Fecha;
        FieldByName('Change_Id_User').Value := Form_Menu.public_User;

        // ***************************************************************************************** //
        // ** GRABAMOS LA línea de detalle del presupuesto con los cambios realizados             ** //
        // ***************************************************************************************** //
        UTI_RGTRO_Grabar_Antes( 'pedidos_ventas_detalles', SQLQuery_Pdo_Detalles );

        // ***************************************************************************************** //
        // ** Liberamos línea de detalle del presupuesto                                          ** //
        // ***************************************************************************************** //
        UTI_RGTRO_UnLock( 'pedidos_ventas_detalles', var_id );
    end;

    with SQLQuery_Alb_Detalles do
    begin
        Insert;

        FieldByName('id_albaranes').AsString  := Trim(param_id);
        FieldByName('Fecha_Movimiento').Value := Int(param_Fecha);

        FieldByName('Insert_WHEN').Value      := param_Fecha;
        FieldByName('Insert_Id_User').Value   := Form_Menu.public_User;

        if not SQLQuery_Pdo_Detalles.FieldByName('OT_Tipo_de_articulo').IsNull then
        begin
            FieldByName('OT_Tipo_de_articulo').AsString := SQLQuery_Pdo_Detalles.FieldByName('OT_Tipo_de_articulo').AsString;
        end;

        if not SQLQuery_Pdo_Detalles.FieldByName('id_clientes').IsNull then
        begin
            FieldByName('id_clientes').AsString := SQLQuery_Pdo_Detalles.FieldByName('id_clientes').AsString;
        end;

        if not SQLQuery_Pdo_Detalles.FieldByName('Unidades').IsNull then
        begin
            FieldByName('Unidades').AsString := SQLQuery_Pdo_Detalles.FieldByName('Unidades').AsString;
        end;

        if not SQLQuery_Pdo_Detalles.FieldByName('id_almacenes').IsNull then
        begin
            FieldByName('id_almacenes').AsString := SQLQuery_Pdo_Detalles.FieldByName('id_almacenes').AsString;
        end;

        if not SQLQuery_Pdo_Detalles.FieldByName('CodigoBarras_Referencia').IsNull then
        begin
            FieldByName('CodigoBarras_Referencia').AsString := SQLQuery_Pdo_Detalles.FieldByName('CodigoBarras_Referencia').AsString;
        end;

        if not SQLQuery_Pdo_Detalles.FieldByName('id_articulos').IsNull then
        begin
            FieldByName('id_articulos').AsString := SQLQuery_Pdo_Detalles.FieldByName('id_articulos').AsString;
        end;

        if not SQLQuery_Pdo_Detalles.FieldByName('Repetir_Cada').IsNull then
        begin
            FieldByName('Repetir_Cada').AsString := SQLQuery_Pdo_Detalles.FieldByName('Repetir_Cada').AsString;
        end;

        if not SQLQuery_Pdo_Detalles.FieldByName('descripcion').IsNull then
        begin
            FieldByName('descripcion').AsString := SQLQuery_Pdo_Detalles.FieldByName('descripcion').AsString;
        end;

        if not SQLQuery_Pdo_Detalles.FieldByName('descripcion_para_TPV').IsNull then
        begin
            FieldByName('descripcion_para_TPV').AsString := SQLQuery_Pdo_Detalles.FieldByName('descripcion_para_TPV').AsString;
        end;

        if not SQLQuery_Pdo_Detalles.FieldByName('PVP').IsNull then
        begin
            FieldByName('PVP').AsString := SQLQuery_Pdo_Detalles.FieldByName('PVP').AsString;
        end;

        if not SQLQuery_Pdo_Detalles.FieldByName('id_impuestos_Ventas').IsNull then
        begin
            FieldByName('id_impuestos_Ventas').AsString := SQLQuery_Pdo_Detalles.FieldByName('id_impuestos_Ventas').AsString;
        end;

        if not SQLQuery_Pdo_Detalles.FieldByName('Descuento_Comercial_1').IsNull then
        begin
            FieldByName('Descuento_Comercial_1').AsString := SQLQuery_Pdo_Detalles.FieldByName('Descuento_Comercial_1').AsString;
        end;

        if not SQLQuery_Pdo_Detalles.FieldByName('Descuento_Comercial_2').IsNull then
        begin
            FieldByName('Descuento_Comercial_2').AsString := SQLQuery_Pdo_Detalles.FieldByName('Descuento_Comercial_2').AsString;
        end;

        if not SQLQuery_Pdo_Detalles.FieldByName('Excluido_su_Cobro_SN').IsNull then
        begin
            FieldByName('Excluido_su_Cobro_SN').AsString := SQLQuery_Pdo_Detalles.FieldByName('Excluido_su_Cobro_SN').AsString;
        end;

        if not SQLQuery_Pdo_Detalles.FieldByName('Comision_Representante').IsNull then
        begin
            FieldByName('Comision_Representante').AsString := SQLQuery_Pdo_Detalles.FieldByName('Comision_Representante').AsString;
        end;

        // ***************************************************************************************** //
        // ** GRABAMOS la linea de detalle del albarán que estamos creando                        ** //
        // ***************************************************************************************** //
        UTI_RGTRO_Grabar_Antes( 'albaranes_ventas_detalles', SQLQuery_Alb_Detalles );
    end;
end;

procedure Tform_pedidos_ventas_000.DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
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

procedure Tform_pedidos_ventas_000.Comprobar_Si_Hay_Lineas_Detalle_Sin_Albaran(param_msg : TStrings);
var var_Lo_Cerramos           : Boolean;
    var_Estado_Lineas_Detalle : TUTI_VENTAS_Ctdad_Rgtros_Detalle;
begin
    // ********************************************************************************************* //
    // ** Comprobar si tiene alguna línea sin convertir en albarán, si no la tiene pues se cierra ** //
    // ** el pedido                                                                               ** //
    // ********************************************************************************************* //
    var_Lo_Cerramos := false;

    var_Estado_Lineas_Detalle := UTI_VENTAS_Estado_Lineas_Detalle( SQLQuery_Pdo_Detalles,
                                                                   'Serie_Albaran',
                                                                   'Numero_Albaran' );


    if var_Estado_Lineas_Detalle.Total_Lineas_Sin_Marcar = 0 then
    begin
        if var_Estado_Lineas_Detalle.Total_Lineas_Marcadas > 0 then
        begin
            param_msg.Add( '* Todas las líneas de detalle de este pedido pertenecen a algún albarán.' +
                           ' Lo marcamos automáticamente como cerrado' );
        end;

        if var_Estado_Lineas_Detalle.Total_Lineas = 0 then
        begin
            param_msg.Add( '* Era un pedido sin líneas de detalle. Pero como se convirtió integro ' +
                           'en albarán, lo marcamos automáticamente como cerrado' );
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

procedure Tform_pedidos_ventas_000.SQLQuery_AlbAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'albaranes_ventas',
                       DataModule_pedidos_ventas.SQLTransaction_Alb,
                       SQLQuery_Alb,
                       false {Devolver_hacemos_commit_alFinalizar} );

    // Refrescar_Registros;
end;

procedure Tform_pedidos_ventas_000.SQLQuery_AlbBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Alb );
end;

procedure Tform_pedidos_ventas_000.SQLQuery_Alb_DetallesAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'albaranes_ventas_detalles',
                       DataModule_pedidos_ventas.SQLTransaction_Alb_Detalles,
                       SQLQuery_Alb_Detalles,
                       false {Devolver_hacemos_commit_alFinalizar} );

    // Refrescar_Registros_Detalles;
end;

procedure Tform_pedidos_ventas_000.ComboBox_FiltrosChange(Sender: TObject);
begin
    Memo_OrderBy.Lines.Clear;
    Memo_OrderBy.Lines.Add( private_Order_By[ComboBox_Filtros.ItemIndex].Memo_OrderBy );
    BitBtn_FiltrarClick(Nil);
end;

procedure Tform_pedidos_ventas_000.Insertar_Registro;
var var_msg      : TStrings;
    var_Serie    : String;
    var_Numero   : String;
    var_imprimir : Boolean;
begin
    with SQLQuery_Pdo do
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
                UTI_EMPRE_Asignar_Empresa(SQLQuery_Pdo);
                UTI_ALMAC_Asignar_almacen(SQLQuery_Pdo);

                FieldByName('Cerrado_SN').AsString := 'N';

                Application.CreateForm(Tform_pedidos_ventas_001, form_pedidos_ventas_001);

                form_pedidos_ventas_001.DBGrid_Detalles.Color := clSilver;

                form_pedidos_ventas_001.RadioGroup_Bajas.ItemIndex := RadioGroup_Bajas.ItemIndex;

                form_pedidos_ventas_001.para_Empezar;

                form_pedidos_ventas_001.public_imprimir := false;

                form_pedidos_ventas_001.ShowModal;
                if form_pedidos_ventas_001.public_Pulso_Aceptar = true then
                begin
                    FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
                    FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                    var_Serie  := FieldByName('Serie_Pedido').AsString;
                    var_Numero := FieldByName('Numero_Pedido').AsString;

                    Presentar_Datos_Totales(0);

                    UTI_RGTRO_Grabar_Antes( 'pedidos_ventas', SQLQuery_Pdo );

                    var_imprimir := form_pedidos_ventas_001.public_imprimir;

                    form_pedidos_ventas_001.Free;

                    if var_imprimir = true then
                    begin
                        BitBtn_ImprimirClick(nil);
                    end;

                    if (FieldByName('Serie_Pedido').AsString = var_Serie)   and
                       (FieldByName('Numero_Pedido').AsString = var_Numero) then
                    begin
                        Editar_Registro;
                    end;
                end else begin
                    Cancel;
                    form_pedidos_ventas_001.Free;
                end;
            end;
        end;

        var_msg.Free;
    end;
end;

procedure Tform_pedidos_ventas_000.Refrescar_Registros;
var var_Serie  : ShortString;
    var_Numero : Int64;
begin
    Try
        // ***************************************************************************************** //
        // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                         ** //
        // ***************************************************************************************** //
        var_Serie  := '';
        var_Numero := 0;

        with SQLQuery_Pdo do
        begin
            if RecordCount > 0 then
            begin
                var_Serie  := FieldByName('Serie_Pedido').AsString;
                var_Numero := FieldByName('Numero_Pedido').Value;
            end;
        end;

        Filtrar_Principal_Sin_Preguntar;

        if Trim(var_Serie) <> '' then
        begin
             SQLQuery_Pdo.Locate( 'Serie_Pedido;Numero_Pedido',
                                  VarArrayOf( [ var_Serie, var_Numero ] ),
                                  [] );
        end;
    Except
    end;
end;

procedure Tform_pedidos_ventas_000.Borrar_en_Presupuestos_el_Pedido( param_Serie_Pedido,
                                                                     param_Numero_Pedido : String );
var var_SQL             : TStrings;
    var_SQLTransaction  : TSQLTransaction;
    var_SQLConnector    : TSQLConnector;
    var_SQLQuery        : TSQLQuery;
    var_msg             : TStrings;
    var_id_Presupuestos : ShortString;
begin
    var_id_Presupuestos := Traer_id_Presupuestos_Antes_de_Borrar_en_Presupuestos_el_Pedido( param_Serie_Pedido,
                                                                                            param_Numero_Pedido );
    if Trim(var_id_Presupuestos) <> '' then
    begin
        Try
            // ***************************************************************************************** //
            // ** Creamos la Transaccion y la conexión con el motor BD, y la abrimos                  ** //
            // ***************************************************************************************** //
            var_SQLTransaction := TSQLTransaction.Create(nil);
            var_SQLConnector   := TSQLConnector.Create(nil);

            if UTI_CN_Connector_Open( var_SQLTransaction,
                                      var_SQLConnector ) = False then UTI_GEN_Salir;

            // ***************************************************************************************** //
            // ** Creamos la SQL Según el motor de BD                                                 ** //
            // ***************************************************************************************** //
            var_SQL := TStringList.Create;

            var_SQL.Add( 'UPDATE presupuestos_ventas_detalles' );
            var_SQL.Add(    'SET Serie_Pedido = NULL,' );
            var_SQL.Add(        'Numero_Pedido = NULL' );
            var_SQL.Add(  'WHERE Serie_Pedido = ' + UTI_GEN_Comillas(Trim(param_Serie_Pedido)) );
            var_SQL.Add(    'AND Numero_Pedido = ' + Trim(param_Numero_Pedido) );

            // ***************************************************************************************** //
            // ** Ejecutamos la SQL                                                                   ** //
            // ***************************************************************************************** //
            var_SQLQuery          := TSQLQuery.Create(nil);

            var_SQLQuery.Database := var_SQLConnector;
            var_SQLQuery.SQL.Text := var_SQL.Text;

            var_SQLQuery.Name     := 'SQLQuery_Borrar_en_Presupuestos_el_Pedido';

            var_SQLQuery.ExecSQL;
            var_SQLTransaction.Commit;

            // ***************************************************************************************** //
            // ** Destruimos la tabla y conexiones                                                    ** //
            // ***************************************************************************************** //
            var_SQLQuery.Free;
            var_SQL.Free;

            // ***************************************************************************************** //
            // ** Cerramos La transacción y la conexión con la BD                                     ** //
            // ***************************************************************************************** //
            if UTI_CN_Connector_Close( var_SQLTransaction,
                                       var_SQLConnector ) = False then UTI_GEN_Salir;

            var_SQLTransaction.Free;
            var_SQLConnector.Free;

            UTI_VENTAS_Cerrar_SN( 'presupuestos_ventas',
                                  'N' { S o N },
                                   var_id_Presupuestos,
                                   param_Serie_Pedido,
                                   param_Numero_Pedido );
        Except
            on error : Exception do
            begin
                var_msg := TStringList.Create;
                var_msg.Add( 'Error al borrar en presupuestos todo rastro del pedido ' +
                             Trim(param_Serie_Pedido) + '/' + Trim(param_Numero_Pedido) + '.' );

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
end;

function Tform_pedidos_ventas_000.Traer_id_Presupuestos_Antes_de_Borrar_en_Presupuestos_el_Pedido( param_Serie_Pedido,
                                                                                                   param_Numero_Pedido : String ) : ShortString;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
    Result := '';

    try
        // ***************************************************************************************** //
        // ** Creamos la Transaccion y la conexión con el motor BD, y la abrimos                  ** //
        // ***************************************************************************************** //
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Connector_Open( var_SQLTransaction,
                                  var_SQLConnector ) = False then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Creamos la SQL Según el motor de BD                                                 ** //
        // ***************************************************************************************** //
        var_SQL := TStringList.Create;

        var_SQL.Add( 'SELECT id_presupuestos' );
        var_SQL.Add(   'FROM presupuestos_ventas_detalles' );
        var_SQL.Add(  'WHERE Serie_Pedido = ' + UTI_GEN_Comillas(Trim(param_Serie_Pedido)) );
        var_SQL.Add(    'AND Numero_Pedido = ' + Trim(param_Numero_Pedido) );

        // ***************************************************************************************** //
        // ** Abrimos la tabla                                                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery      := TSQLQuery.Create(nil);
        var_SQLQuery.Name := 'SQLQuery_Traer_id_Presupuestos_Antes_de_Borrar_en_Presupuestos_el_Pedido';

        if UTI_TB_Query_Open( '', '', '',
                              var_SQLConnector,
                              var_SQLQuery,
                              -1, // asi me trae todos los registros de golpe
                              var_SQL.Text ) = False then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** TRABAJAMOS CON LOS REGISTROS DEVUELTOS                                              ** //
        // ***************************************************************************************** //
        // ** Si el módulo no se creó, no se permite entrar en él ... Result := False             ** //
        // ***************************************************************************************** //
        if var_SQLQuery.RecordCount > 0 then
        begin
            Result := Trim(var_SQLQuery.FieldByName('id_presupuestos').AsString);
        end;

        // ***************************************************************************************** //
        // ** Cerramos la tabla                                                                   ** //
        // ***************************************************************************************** //
        if UTI_TB_Cerrar( var_SQLConnector,
                          var_SQLTransaction,
                          var_SQLQuery ) = false then UTI_GEN_Salir;

        var_SQLQuery.Free;
        var_SQL.Free;
        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    Except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( 'No se pudo traer la id del presupuesto ' +
                               Trim(param_Serie_Pedido) + '/' +
                               Trim(param_Numero_Pedido) + '.',
                               error );
            try
                // ********************************************************************************* //
                // ** Intentamos vaciar la memoria                                                ** //
                // ********************************************************************************* //
                var_SQLQuery.Free;
                var_SQL.Free;
                var_SQLTransaction.Free;
                var_SQLConnector.Free;
            except
            end;
        end;
    end;
end;


procedure Tform_pedidos_ventas_000.Editar_Registro;
var var_msg         : TStrings;
    var_id          : ShortString;
    var_imprimir    : Boolean;
    var_Continuamos : Boolean;
begin
    var_Continuamos := true;
    while var_Continuamos = true do
    begin
        with SQLQuery_Pdo do
        begin
            var_msg := TStringList.Create;

            if RecordCount > 0 then
            begin
                var_id := FieldByName('id').AsString;

                if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
                begin
                    if UTI_RGTRO_isLock( 'pedidos_ventas',
                                         var_id,
                                         true ) = true then
                    begin
                        Exit;
                    end else begin
                        if UTI_RGTRO_Lock( 'pedidos_ventas',
                                           var_id ) = true then
                             Edit
                        else Exit;
                    end;

                    // ********************************************************************************* //
                    // ** Continuamos                                                                 ** //
                    // ********************************************************************************* //
                    Application.CreateForm(Tform_pedidos_ventas_001, form_pedidos_ventas_001);

                    form_pedidos_ventas_001.RadioGroup_Bajas.ItemIndex := RadioGroup_Bajas.ItemIndex;
                    form_pedidos_ventas_001.public_Menu_Worked         := public_Menu_Worked;

                    if public_Solo_Ver = true then
                    begin
                        form_pedidos_ventas_001.public_Solo_Ver := true;
                    end;

                    form_pedidos_ventas_001.para_Empezar;

                    form_pedidos_ventas_001.public_imprimir := false;

                    form_pedidos_ventas_001.ShowModal;
                    if form_pedidos_ventas_001.public_Pulso_Aceptar = true then
                    begin
                        if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( SQLQuery_Pdo ) = true then
                        begin
                            FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                            FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                            Presentar_Datos_Totales(0);

                            UTI_RGTRO_Grabar_Antes( 'pedidos_ventas', SQLQuery_Pdo );
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

                    var_imprimir := form_pedidos_ventas_001.public_imprimir;

                    form_pedidos_ventas_001.Free;

                    UTI_RGTRO_UnLock( 'pedidos_ventas', var_id );

                    var_Continuamos := false;
                    if var_imprimir = true then
                    begin
                        BitBtn_ImprimirClick(nil);
                        var_Continuamos := true;
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

procedure Tform_pedidos_ventas_000.Borrar_Registro;
var var_msg                   : TStrings;
    var_Serie_Pedido          : String;
    var_Numero_Pedido         : String;
    var_Estaba_Borrado        : Boolean;
    var_Estado_Lineas_Detalle : TUTI_VENTAS_Ctdad_Rgtros_Detalle;
begin
    with SQLQuery_Pdo do
    begin
        var_msg := TStringList.Create;

        // ***************************************************************************************** //
        // ** Comprobar si tiene alguna línea convertida en albarán, si la tiene no borramos      ** //
        // ***************************************************************************************** //
        var_Estado_Lineas_Detalle := UTI_VENTAS_Estado_Lineas_Detalle( SQLQuery_Pdo_Detalles,
                                                                       'Serie_Albaran',
                                                                       'Numero_Albaran' );

        if var_Estado_Lineas_Detalle.Total_Lineas_Sin_Marcar <> SQLQuery_Pdo_Detalles.RecordCount then
        begin
            var_msg.Add( '* Tiene líneas de algún albarán. No podemos borrarlo.' );
        end;

        // ***************************************************************************************** //
        // ** Si el pedido está cerrado no podemos                                                ** //
        // ***************************************************************************************** //
        if UTI_VENTAS_Esta_Cerrado_SN( 'pedidos_ventas', FieldByName('id').AsString ) = 'S' then
        begin
            var_msg.Add( 'Pedido CERRADO.');
        end;

        // ***************************************************************************************** //
        // ** Si el pedido ya estaba borrado (lo vamos a dar de alta) y pertenecía a un presu-    ** //
        // ** puesto no le vamos a permitir darlo de alta porque se rompería la manera de ligar   ** //
        // ** presupuestos con los pedidos                                                        ** //
        // ***************************************************************************************** //
        if not FieldByName('Del_WHEN').IsNull then
        begin
            if Trim(FieldByName('Serie_Presupuesto').AsString) <> '' then
            begin
                var_msg.Add( '* Este pedido fué borrado anteriormente, y además pertenecía al presupuesto ' +
                             Trim(FieldByName('Serie_Presupuesto').AsString) +
                             '/' +
                             Trim(FieldByName('Numero_Presupuesto').AsString) +
                             '. Por lo que no puedo darlo de alta otra vez, ' +
                             'vaya a dicho presupuesto y vuelva a traspasarlo a pedidos.' );
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
        if UTI_RGTRO_isLock( 'pedidos_ventas',
                             Trim(SQLQuery_Pdo.FieldByName('id').AsString),
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
            var_Serie_Pedido   := FieldByName('Serie_Pedido').AsString;
            var_Numero_Pedido  := FieldByName('Numero_Pedido').AsString;
            var_Estaba_Borrado := not FieldByName('Del_WHEN').IsNull;

            if UTI_RGTRO_Borrar_Cabecera_y_Detalle( 'id_pedidos',
                                                    'pedidos_ventas',
                                                    'pedidos_ventas_detalles',
                                                    SQLQuery_Pdo,
                                                    SQLQuery_Pdo_Detalles,
                                                    public_Solo_Ver,
                                                    public_Menu_Worked ) = true then
            begin
                if var_Estaba_Borrado = false then
                begin
                    Borrar_en_Presupuestos_el_Pedido( var_Serie_Pedido,
                                                      var_Numero_Pedido );
                end;
            end;
        end;
    end;
end;

procedure Tform_pedidos_ventas_000.Filtrar_Principal_Sin_Preguntar;
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

procedure Tform_pedidos_ventas_000.Filtrar_Albaranes_Cabecera( param_Fecha,
                                                               param_Serie,
                                                               param_Numero : ShortString );
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
    // ********************************************************************************************* //
    // ** Ahora buscaremos por la FECHA                                                           ** //
    // ********************************************************************************************* //
    if Trim(param_Fecha) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'a.Fecha <= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(Int(StrToDateTime(param_Fecha)), false) + ' 23:59:59' ) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'a.Fecha >= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(Int(StrToDateTime(param_Fecha)), false) + ' 00:00:00' ) );
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
        var_SQL_ADD.Add( 'a.Serie_Albaran = ' + UTI_GEN_Comillas(Trim(param_Serie)) );
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
        var_SQL_ADD.Add( 'a.Numero_Albaran = ' + UTI_GEN_Comillas(Trim(param_Numero)) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Pasamos a filtrar los registros                                                         ** //
    // ********************************************************************************************* //
    var_Filtros.Add('');
    var_Order_By.Add('a.Serie_Albaran ASC, a.Numero_Albaran ASC');

    { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
      y que por lo se debe de permitir modificarlos en ningún módulo }

    UTI_TB_Filtrar( private_Order_By,

                    // Delete_SQL,
                    '',

                    // Update_SQL,
                    UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Alb,
                                                  'albaranes_ventas',
                                                  'u' ),

                    // Insert_SQL,
                    UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Alb,
                                                  'albaranes_ventas',
                                                  'i' ),
                    // var_ctdad_Rgtros,
                    -1,

                    DataModule_pedidos_ventas.SQLTransaction_Alb,
                    DataModule_pedidos_ventas.SQLConnector_Alb,
                    SQLQuery_Alb,

                    // name_tabla,
                    'a',

                    1, // ASI NO SE VEN LAS BAJAS

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

                    var_Filtros {Memo_Filtros.Lines},
                    var_Order_By {Memo_OrderBy.Lines},
                    var_a_Filtrar,

                    false, {param_Cambiamos_Filtro}
                    false,   // param_ver_SQL_despues_Abrir : Boolean;
                    true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

    var_a_Filtrar.Free;
    var_Filtros.Free;
    var_Order_By.Free;
    var_SQL_ADD.Free;
end;

procedure Tform_pedidos_ventas_000.Filtrar_Albaranes_Detalles( param_id : ShortString );
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
    var_SQL_ADD.Add( 'ad.id_albaranes = ' + Trim(param_id) );
    UTI_TB_SQL_ADD( false,
                    var_a_Filtrar,
                    var_SQL_ADD );

    // ********************************************************************************************* //
    // ** Pasamos a filtrar los registros                                                         ** //
    // ********************************************************************************************* //
    var_Filtros.Add('');
    var_Order_By.Add('ad.id_albaranes ASC, ad.id ASC');

    { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
      y que por lo se debe de permitir modificarlos en ningún módulo }

    UTI_TB_Filtrar( private_Order_By,

                    // Delete_SQL,
                    '',

                    // Update_SQL,
                    UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Alb_Detalles,
                                                  'albaranes_ventas_detalles',
                                                  'u' ),

                    // Insert_SQL,
                    UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Alb_Detalles,
                                                  'albaranes_ventas_detalles',
                                                  'i' ),

                    // var_ctdad_Rgtros,
                    -1,

                    DataModule_pedidos_ventas.SQLTransaction_Alb_Detalles,
                    DataModule_pedidos_ventas.SQLConnector_Alb_Detalles,
                    SQLQuery_Alb_Detalles,

                    // name_tabla,
                    'ad',

                    1, // ASI NO SE VEN LAS BAJAS

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

                    var_Filtros {Memo_Filtros.Lines},
                    var_Order_By {Memo_OrderBy.Lines},
                    var_a_Filtrar,

                    false, {param_Cambiamos_Filtro}
                    false,   // param_ver_SQL_despues_Abrir : Boolean;
                    true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

    var_a_Filtrar.Free;
    var_Filtros.Free;
    var_Order_By.Free;
    var_SQL_ADD.Free;
end;

function Tform_pedidos_ventas_000.Filtrar_Lineas_Detalles( param_ver_bajas : ShortInt;
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
    param_Lineas_OrderBy.Text := private_Order_By_Lineas_Detalles[0].Memo_OrderBy;
  end;

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  Result := UTI_TB_Filtrar( private_Order_By_Lineas_Detalles,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Pdo_Detalles,
                                                          'pedidos_ventas_detalles',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Pdo_Detalles,
                                                          'pedidos_ventas_detalles',
                                                          'i' ),

                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_pedidos_ventas.SQLTransaction_Pedido_Detalles,
                            DataModule_pedidos_ventas.SQLConnector_Pedido_Detalles,
                            SQLQuery_Pdo_Detalles,

                            // name_tabla,
                            'pdod',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT pdod.*,' + ' ' +
                                   'al.descripcion AS OT_descripcion_almacen,' + ' ' +

                                   'a.descripcion_para_TPV AS OT_descripcion_articulo,' + ' ' +
                                   'a.Tipo_de_articulo AS OT_Tipo_de_articulo,' + ' ' +

                                   'i.descripcion AS OT_descripcion_impuesto,' + ' ' +
                                   'i.Tanto_Por_Ciento AS OT_Tanto_Por_Ciento,' + ' ' +
                                   'i.Sumado_A_Ftra_SN AS OT_Sumado_A_Ftra_SN' + ' ' +

                            'FROM pedidos_ventas_detalles AS pdod' + ' ' +

                            'LEFT JOIN almacenes AS al' + ' ' +
                            'ON pdod.id_almacenes = al.id' + ' ' +

                            'LEFT JOIN articulos AS a' + ' ' +
                            'ON pdod.id_articulos = a.id' + ' ' +

                            'LEFT JOIN impuestos AS i' + ' ' +
                            'ON pdod.id_impuestos_Ventas = i.id' + ' ',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  if UTI_GEN_Form_Abierto_Ya('form_pedidos_ventas_001') = true then
  begin
    form_pedidos_ventas_001.Poner_Total_Lineas_Detalle;
  end;

  var_a_Filtrar_Plus.Free;
end;

procedure Tform_pedidos_ventas_000.Filtrar_Lineas_Detalles_Agrupadas_Por_Articulo;
var
  var_Lineas_OrderBy : TStrings;
  var_Lineas_Filtro  : TStrings;
  var_a_Filtrar_Plus : TStrings;
  var_SQL_ADD        : TStrings;
begin
  var_SQL_ADD        := TStringList.Create;
  var_Lineas_OrderBy := TStringList.Create;
  var_Lineas_Filtro  := TStringList.Create;
  var_a_Filtrar_Plus := TStringList.Create;

  var_Lineas_OrderBy.Clear;
  var_Lineas_Filtro.Clear;
  var_a_Filtrar_Plus.Clear;

  // ********************************************************************************************* //
  // ** Le ponemos los WHERE                                                                    ** //
  // ********************************************************************************************* //
  var_SQL_ADD.Clear;
  var_SQL_ADD.Add( 'pdods.id_pedidos = ' + SQLQuery_Pdo.FieldByName('id').AsString );
  UTI_TB_SQL_ADD( true,
                  var_Lineas_Filtro,
                  var_SQL_ADD );

  var_SQL_ADD.Clear;
  var_SQL_ADD.Add( 'NOT pdods.id_articulos IS NULL' );
  UTI_TB_SQL_ADD( false,
                  var_Lineas_Filtro,
                  var_SQL_ADD );

  var_SQL_ADD.Clear;
  var_SQL_ADD.Add( 'pdods.Serie_Albaran IS NULL' );
  UTI_TB_SQL_ADD( false,
                  var_Lineas_Filtro,
                  var_SQL_ADD );

  var_SQL_ADD.Clear;
  var_SQL_ADD.Add( 'art.id = pdods.id_articulos' );
  UTI_TB_SQL_ADD( false,
                  var_Lineas_Filtro,
                  var_SQL_ADD );

  var_SQL_ADD.Clear;
  var_SQL_ADD.Add( 'art.Tipo_de_articulo = 0' );
  UTI_TB_SQL_ADD( false,
                  var_Lineas_Filtro,
                  var_SQL_ADD );

  var_SQL_ADD.Clear;
  var_SQL_ADD.Add( 'alm.id = pdods.id_almacenes' );
  UTI_TB_SQL_ADD( false,
                  var_Lineas_Filtro,
                  var_SQL_ADD );

  var_SQL_ADD.Clear;
  var_SQL_ADD.Add( 'st.id_articulos = pdods.id_articulos' );
  UTI_TB_SQL_ADD( false,
                  var_Lineas_Filtro,
                  var_SQL_ADD );

  var_SQL_ADD.Clear;
  var_SQL_ADD.Add( 'st.id_almacenes = pdods.id_almacenes' );
  UTI_TB_SQL_ADD( false,
                  var_Lineas_Filtro,
                  var_SQL_ADD );

  var_SQL_ADD.Clear;
  var_SQL_ADD.Add( 'st.Stock < pdods.Unidades' );
  UTI_TB_SQL_ADD( false,
                  var_Lineas_Filtro,
                  var_SQL_ADD );

  var_Lineas_Filtro.Add( 'GROUP BY pdods.id_articulos, pdods.id_almacenes' );

  // ********************************************************************************************* //
  // ** Le ponemos el ORDER BY                                                                  ** //
  // ********************************************************************************************* //
  var_Lineas_OrderBy.Text := 'pdods.id_pedidos ASC, pdods.id_articulos ASC, pdods.id_almacenes ASC';

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

                  DataModule_pedidos_ventas.SQLTransaction_Pedido_Detalles_Stock,
                  DataModule_pedidos_ventas.SQLConnector_Pedido_Detalles_Stock,
                  SQLQuery_Pdo_Detalles_Stock,

                  // name_tabla,
                  'pdods',

                  1, // No vemos las líneas dadas de baja

                  // SELECT_SQL,
                  'SELECT pdods.id_articulos,' + ' ' +
                         'pdods.id_almacenes,' + ' ' +
                         'SUM(pdods.Unidades) AS unidades,' + ' ' +
                         'art.descripcion_para_TPV AS OT_descripcion_articulo,' + ' ' +
                         'alm.descripcion AS OT_descripcion_almacen,' + ' ' +
                         'st.Stock' + ' ' +

                  'FROM pedidos_ventas_detalles AS pdods,' + ' ' +
                       'articulos AS art,' + ' ' +
                       'almacenes AS alm,' + ' ' +
                       'articulos_stock AS st',

                  var_Lineas_Filtro,
                  var_Lineas_OrderBy,
                  var_a_Filtrar_Plus,

                  false, // Así no cambiamos su filtro
                  false,   // param_ver_SQL_despues_Abrir : Boolean;
                  true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_Lineas_OrderBy.Free;
  var_Lineas_Filtro.Free;
  var_a_Filtrar_Plus.Free;
  var_SQL_ADD.Free;
end;

procedure Tform_pedidos_ventas_000.Refrescar_Registros_Detalles_Stock;
var var_id : ShortString;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_id := '';

    with SQLQuery_Pdo_Detalles_Stock do
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
            SQLQuery_Pdo_Detalles_Stock.Last;
        end else begin
            // ************************************************************************************* //
            // ** Estabamos en una edición, así que ya conocíamos la id del registro. Por lo que  ** //
            // ** hago el locate por esta id                                                      ** //
            // ************************************************************************************* //
            SQLQuery_Pdo_Detalles_Stock.Locate('id', StrToInt64(var_id), []);
        end;
    end;
end;

procedure Tform_pedidos_ventas_000.SQLQuery_Alb_DetallesBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Alb_Detalles );
end;

procedure Tform_pedidos_ventas_000.Cerrarlo;
var var_msg                   : TStrings;
    var_id                    : ShortString;
    var_Estado_Lineas_Detalle : TUTI_VENTAS_Ctdad_Rgtros_Detalle;
    var_Lo_Cerramos           : Boolean;
begin
    // ********************************************************************************************* //
    // ** Si el pedido está borrado, no permitimos hacer nada con el.                             ** //
    // ********************************************************************************************* //
    if not form_pedidos_ventas_000.SQLQuery_Pdo.FieldByName('Del_WHEN').IsNull then
    begin
        var_msg := TStringList.Create;
        var_msg.Add( '* Es un pedido borrado, no se puede modificar nada de el. ' +
                     'Si desea modificarlo, primero hay que darlo de alta anteriormente.' );
        UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        var_msg.Free;

        Exit;
    end;

    with SQLQuery_Pdo do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
        begin
            var_id := FieldByName('id').AsString;

            if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
            begin
                if UTI_RGTRO_isLock( 'pedidos_ventas',
                                     var_id,
                                     true ) = true then
                begin
                    Exit;
                end else begin
                    if UTI_RGTRO_Lock( 'pedidos_ventas',
                                       var_id ) = true then
                    begin
                        Edit;
                    end else begin
                        Exit;
                    end;
                end;

                FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                if UTI_VENTAS_Esta_Cerrado_SN( 'pedidos_ventas', FieldByName('id').AsString ) = 'N' then
                begin
                    FieldByName('Cerrado_SN').Value := 'S'
                end else begin
                    FieldByName('Cerrado_SN').Value := 'N';

                    // ***************************************************************************** //
                    // ** Después de considerarlo como no cerrado, vamos a comprobar si tiene     ** //
                    // ** alguna linea de detalle si convertir en albarán. Si no tiene ninguna    ** //
                    // ** libre lo vuelve a considerar como cerrado                               ** //
                    // ***************************************************************************** //
                    var_Lo_Cerramos := false;

                    var_Estado_Lineas_Detalle := UTI_VENTAS_Estado_Lineas_Detalle( SQLQuery_Pdo_Detalles,
                                                                                   'Serie_Albaran',
                                                                                   'Numero_Albaran' );

                    if var_Estado_Lineas_Detalle.Total_Lineas_Sin_Marcar = 0 then
                    begin
                        // ** si no hay lineas sin marcar no puedo abrirlo si hay
                        if var_Estado_Lineas_Detalle.Total_Lineas_Marcadas > 0 then
                        begin
                            var_msg.Clear;
                            var_msg.Add( '* No se puede liberar pues todas sus líneas de detalle han sido convertidas en albaranes.' );
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

                UTI_RGTRO_Grabar_Antes( 'pedidos_ventas', SQLQuery_Pdo );

                UTI_RGTRO_UnLock( 'pedidos_ventas', var_id );
            end;
        end else begin
            var_msg.Clear;
            var_msg.Add(rs_no_Hay_Rgtros);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        end;

        var_msg.Free;
    end;

end;

procedure Tform_pedidos_ventas_000.BitBtn_Ver_PresupuestoClick(Sender: TObject);
var var_msg : TStrings;
begin
    with SQLQuery_Pdo do
    begin
        if RecordCount = 0 then
        begin
            var_msg := TStringList.Create;
            var_msg.Add('* No hay registros de pedidos filtrados.');
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;

            Exit;
        end;

        if not FieldByName('Del_WHEN').IsNull then
        begin
            var_msg := TStringList.Create;
            var_msg.Add('* Es un pedido borrado.');
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;

            Exit;
        end;

        if Trim(FieldByName('Numero_Presupuesto').AsString) = '' then
        begin
            var_msg := TStringList.Create;
            var_msg.Add('* Este pedido no pertenece a ningun presupuesto.');
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;

            Exit;
        end;

        if UTI_GEN_Form_Abierto_Ya('form_presupuestos_ventas_000') = false then
        begin
            Application.CreateForm(Tform_presupuestos_ventas_000, form_presupuestos_ventas_000);

            form_presupuestos_ventas_000.public_Solo_Ver    := false;
            form_presupuestos_ventas_000.public_Elegimos    := true;
            form_presupuestos_ventas_000.public_Menu_Worked := 440;

            // ************************************************************************************* //
            // ** Le pasamos el presupuesto a encontrar                                           ** //
            // ************************************************************************************* //
            form_presupuestos_ventas_000.Edit_Presupuesto_Serie.Text  := FieldByName('Serie_Presupuesto').AsString;
            form_presupuestos_ventas_000.Edit_Presupuesto_Numero.Text := FieldByName('Numero_Presupuesto').AsString;

            // ************************************************************************************* //
            // ** Filtramos su búsqueda                                                           ** //
            // ************************************************************************************* //
            form_presupuestos_ventas_000.para_Empezar;

            if form_presupuestos_ventas_000.SQLQuery_Presup.RecordCount = 1 then
            begin
                form_presupuestos_ventas_000.Editar_Registro;
            end else begin
                if form_presupuestos_ventas_000.SQLQuery_Presup.RecordCount = 0 then
                begin
                    var_msg := TStringList.Create;
                    var_msg.Add('Este presupuesto no existe.');
                    UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
                    var_msg.Free;
                end else begin
                    var_msg := TStringList.Create;
                    var_msg.Add( 'Existe más de un presupuesto ' +
                                 FieldByName('Serie_Presupuesto').AsString + ' - ' +
                                 FieldByName('Numero_Presupuesto').AsString );
                    UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
                    var_msg.Free;

                    form_presupuestos_ventas_000.ShowModal;
                end;
            end;

            form_presupuestos_ventas_000.Free;

            // ************************************************************************************* //
            // ** Refrescamos los albaranes por si se hizo algún cambio en el elegido             ** //
            // ************************************************************************************* //
            Refrescar_Registros;
        end else begin
            var_msg := TStringList.Create;
            var_msg.Add(rs_Modulo_Abierto);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;
        end;
    end;
end;

// ************************************************************************************************* //
// ************************************************************************************************* //
// ************************************************************************************************* //
// ************************************************************************************************* //
// ************************************************************************************************* //
// ************************************************************************************************* //
// ************************************************************************************************* //
// ************************************************************************************************* //
// ************************************************************************************************* //
// ************************************************************************************************* //
// ************************************************************************************************* //
// ************************************************************************************************* //
// ************************************************************************************************* //
// ************************************************************************************************* //
// ************************************************************************************************* //
// ************************************************************************************************* //

procedure Tform_pedidos_ventas_000.Refrescar_Registros_Impuestos;
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
    if SQLQuery_Pdo.State <> dsEdit then Exit;

    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_id := '';

    with SQLQuery_Pdo_Impuestos do
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
    var_SQL_ADD.Add( 'pdoi.id_pedidos = ' + SQLQuery_Pdo.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_ver_Bajas := RadioGroup_Bajas.ItemIndex;
    if UTI_GEN_Form_Abierto_Ya('form_pedidos_ventas_001') = true then
    begin
        var_ver_Bajas := form_pedidos_ventas_001.RadioGroup_Bajas.ItemIndex;
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
            SQLQuery_Pdo_Impuestos.Last;
        end else begin
            // ************************************************************************************* //
            // ** Estabamos en una edición, así que ya conocíamos la id del registro. Por lo que  ** //
            // ** hago el locate por esta id                                                      ** //
            // ************************************************************************************* //
            SQLQuery_Pdo_Impuestos.Locate('id', StrToInt64(var_id), []);
        end;

    end;

    var_SQL_ADD.Free;
end;

function Tform_pedidos_ventas_000.Filtrar_Lineas_Impuestos( param_ver_bajas : ShortInt;
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
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Pdo_Impuestos,
                                                          'pedidos_ventas_impuestos',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Pdo_Impuestos,
                                                          'pedidos_ventas_impuestos',
                                                          'i' ),

                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_pedidos_ventas.SQLTransaction_Pedido_Imptos,
                            DataModule_pedidos_ventas.SQLConnector_Pedido_Imptos,
                            SQLQuery_Pdo_Impuestos,

                            // name_tabla,
                            'pdoi',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT pdoi.*,' + ' ' +

                                   'impto.descripcion AS OT_descripcion_impuesto,' + ' ' +
                                   'impto.Tanto_Por_Ciento AS OT_Tanto_Por_Ciento' + ' ' +

                            'FROM pedidos_ventas_impuestos AS pdoi' + ' ' +

                            'LEFT JOIN impuestos AS impto' + ' ' +
                            'ON pdoi.id_impuestos = impto.id',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_a_Filtrar_Plus.Free;
end;

procedure Tform_pedidos_ventas_000.Filtrar_tablas_ligadas;
var
  var_Lineas_Filtro  : TStrings;
  var_Lineas_OrderBy : TStrings;
  var_SQL_ADD        : TStrings;
begin
    var_SQL_ADD := TStringList.Create;

    if SQLQuery_Pdo.RecordCount = 0 then Exit;

    if SQLQuery_Pdo.State = dsInsert then
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
    var_SQL_ADD.Add( 'pdod.id_pedidos = ' + SQLQuery_Pdo.FieldByName('id').AsString );
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
    var_SQL_ADD.Add( 'pdoi.id_pedidos = ' + SQLQuery_Pdo.FieldByName('id').AsString );
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

procedure Tform_pedidos_ventas_000.Presentar_Datos_Totales( param_Actualizar_Totales : Byte );
var var_Calculo_Totales_Cabecera : TCalculo_Totales_por_Cabecera;
begin
    var_Calculo_Totales_Cabecera := UTI_LINEAS_poner_totales( 'pedidos_ventas',
                                                              SQLQuery_Pdo.FieldByName('id').AsString );
    Refrescar_Registros_Impuestos;

    if param_Actualizar_Totales = 1 then
    begin
        with form_pedidos_ventas_001 do
        begin
            Edit_Total_Lineas.Text     := FormatFloat( ',0.00', var_Calculo_Totales_Cabecera.Total_Lineas );
            Edit_Total.Text            := FormatFloat( ',0.00', var_Calculo_Totales_Cabecera.Total );
            Edit_Total_Mano_Obra.Text  := FormatFloat( ',0.00', var_Calculo_Totales_Cabecera.Total_Mano_Obra );
            Edit_Total_Materiales.Text := FormatFloat( ',0.00', var_Calculo_Totales_Cabecera.Total_Materiales );
            Edit_Total_Resto.Text      := FormatFloat( ',0.00', var_Calculo_Totales_Cabecera.Total_Resto );

            Edit_Total_Peso.Text       := '0';
            Edit_Total_Volumen.Text    := '0';
        end;
    end;
end;

procedure Tform_pedidos_ventas_000.para_Empezar;
begin
    UTI_GEN_Traer_Trimestre( DateTimePicker_Desde,
                             DateTimePicker_Hasta );

    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    if UTI_GEN_Form_Abierto_Ya('DataModule_pedidos_ventas') = False then
    begin
        DataModule_pedidos_ventas := TDataModule_pedidos_ventas.Create(Application);
    end;

    // ********************************************************************************************* //
    // ** Preparamos los diferentes tipos de orden preconfigurados                                ** //
    // ********************************************************************************************* //
    // ** CABECERA                                                                                ** //
    // ********************************************************************************************* //
    SetLength(private_Order_By, 4);

    private_Order_By[0].Titulo       := 'Por fecha';
    private_Order_By[0].Memo_OrderBy := 'pdo.Fecha ASC, pdo.Serie_Pedido ASC, pdo.Numero_Pedido ASC';

    private_Order_By[1].Titulo       := 'Por el número de pedido'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[1].Memo_OrderBy := 'pdo.Serie_Pedido ASC, pdo.Numero_Pedido ASC';

    private_Order_By[2].Titulo       := 'Por empresa';
    private_Order_By[2].Memo_OrderBy := 'pdo.id_empresas ASC, pdo.Fecha ASC, pdo.Serie_Pedido ASC, pdo.Numero_Pedido ASC';

    private_Order_By[3].Titulo       := 'Por cliente';
    private_Order_By[3].Memo_OrderBy := 'pdo.id_clientes ASC, pdo.Fecha ASC, pdo.Serie_Pedido ASC, pdo.Numero_Pedido ASC';

    Memo_OrderBy.Lines.Text          := private_Order_By[0].Memo_OrderBy;

    UTI_TB_Rellenar_ComboBox_Orden( true,
                                    ComboBox_Filtros,
                                    private_Order_By,
                                    0 );

    // ********************************************************************************************* //
    // ** LINEAS DETALLE                                                                          ** //
    // ********************************************************************************************* //
    SetLength(private_Order_By_Lineas_Detalles, 1);

    private_Order_By_Lineas_Detalles[0].Titulo       := 'Por id del pedido'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_Lineas_Detalles[0].Memo_OrderBy := 'pdod.id_pedidos ASC, pdod.id ASC';

    // ********************************************************************************************* //
    // ** IMPUESTOS                                                                               ** //
    // ********************************************************************************************* //
    SetLength(private_Order_By_Lineas_Impuestos, 1);

    private_Order_By_Lineas_Impuestos[0].Titulo       := 'Por id del pedido'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_Lineas_Impuestos[0].Memo_OrderBy := 'pdoi.id_pedidos ASC, pdoi.id_impuestos ASC';

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

function Tform_pedidos_ventas_000.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
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
    if Trim(Edit_Pdo_Serie.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pdo.Serie_Pedido = ' + UTI_GEN_Comillas(Trim(Edit_Pdo_Serie.Text)) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos en el NUMERO                                                           ** //
    // ********************************************************************************************* //
    if Trim(Edit_Pdo_Numero.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pdo.Numero_Pedido = ' + UTI_GEN_Comillas(Trim(Edit_Pdo_Numero.Text)) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
     // ** Ahora buscaremos por la FECHA                                                          ** //
     // ******************************************************************************************** //
     if (not DateTimePicker_Hasta.DateIsNull) and
        (not DateTimePicker_Desde.DateIsNull) then
     begin
         var_SQL_ADD.Clear;
         var_SQL_ADD.Add( 'pdo.Fecha <= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Hasta.Date, false) + ' 23:59:59' ) );
         UTI_TB_SQL_ADD( false,
                         var_a_Filtrar,
                         var_SQL_ADD );

         var_SQL_ADD.Clear;
         var_SQL_ADD.Add( 'pdo.Fecha >= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Desde.Date, false) + ' 00:00:00' ) );
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
        var_SQL_ADD.Add( 'pdo.id_Almacenes = ' + Trim(Edit_id_Almacenes.Text) );
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
        var_SQL_ADD.Add( 'pdo.id_empresas = ' + Trim(Edit_id_Empresas.Text) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Primero buscaremos en la serie del Presupuesto                                          ** //
    // ********************************************************************************************* //
    if Trim(Edit_Presupuesto_Serie.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pdo.Serie_Presupuesto = ' + UTI_GEN_Comillas(Trim(Edit_Presupuesto_Serie.Text)) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos en el número del Presupuesto                                           ** //
    // ********************************************************************************************* //
    if Trim(Edit_Presupuesto_Numero.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pdo.Numero_Presupuesto = ' + UTI_GEN_Comillas(Trim(Edit_Presupuesto_Numero.Text)) );
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
        var_SQL_ADD.Add( 'pdo.id_formas_pago = ' + Trim(Edit_id_Forma_Pago.Text) );
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
        var_SQL_ADD.Add( 'pdo.id_clientes = ' + Trim(Edit_id_Clientes.Text) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;


    // ********************************************************************************************* //
    // ** Ahora buscaremos por la id del vehiculo                                                 ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Vehiculos.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pdo.id_Vehiculos = ' + Trim(Edit_id_Vehiculos.Text) );
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
        var_SQL_ADD.Add( 'pdo.Cerrado_SN = ' + UTI_GEN_Comillas('N') );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    if RadioButton_Cerrados_SI.Checked = true then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pdo.Cerrado_SN = ' + UTI_GEN_Comillas('S') );
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
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Pdo,
                                                            'pedidos_ventas',
                                                            'u' ),

                              // Insert_SQL,
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Pdo,
                                                            'pedidos_ventas',
                                                            'i' ),

                              // var_ctdad_Rgtros,
                              -1,

                              DataModule_pedidos_ventas.SQLTransaction_Pedido,
                              DataModule_pedidos_ventas.SQLConnector_Pedido,
                              SQLQuery_Pdo,

                              // name_tabla,
                              'pdo',

                              RadioGroup_Bajas.ItemIndex,

                              // SELECT_SQL,
                              'SELECT pdo.*,' + ' ' +

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

                              'FROM pedidos_ventas AS pdo' + ' ' +

                              'LEFT JOIN proveedores AS trp' + ' ' +
                              'ON pdo.agencias_transporte_id_proveedores = trp.id' + ' ' +

                              'LEFT JOIN poblaciones AS env_pb' + ' ' +
                              'ON pdo.Envio_id_poblaciones = env_pb.id' + ' ' +

                              'LEFT JOIN provincias AS env_pr' + ' ' +
                              'ON pdo.Envio_id_provincias = env_pr.id' + ' ' +

                              'LEFT JOIN paises AS env_ps' + ' ' +
                              'ON pdo.Envio_id_paises = env_ps.id' + ' ' +

                              'LEFT JOIN representantes AS rp' + ' ' +
                              'ON pdo.id_representantes = rp.id' + ' ' +

                              'LEFT JOIN tarifas AS tfs' + ' ' +
                              'ON pdo.id_tarifas = tfs.id' + ' ' +

                              'LEFT JOIN poblaciones AS pb' + ' ' +
                              'ON pdo.id_poblaciones = pb.id' + ' ' +

                              'LEFT JOIN provincias AS pr' + ' ' +
                              'ON pdo.id_provincias = pr.id' + ' ' +

                              'LEFT JOIN paises AS ps' + ' ' +
                              'ON pdo.id_paises = ps.id' + ' ' +

                              'LEFT JOIN poblaciones AS ct_pb' + ' ' +
                              'ON pdo.Cta_Bco_id_poblaciones = ct_pb.id' + ' ' +

                              'LEFT JOIN provincias AS ct_pr' + ' ' +
                              'ON pdo.Cta_Bco_id_provincias = ct_pr.id' + ' ' +

                              'LEFT JOIN paises AS ct_ps' + ' ' +
                              'ON pdo.Cta_Bco_id_paises = ct_ps.id' + ' ' +

                              'LEFT JOIN almacenes AS alm' + ' ' +
                              'ON pdo.id_almacenes = alm.id' + ' ' +

                              'LEFT JOIN vehiculos AS vh' + ' ' +
                              'ON pdo.id_vehiculos = vh.id' + ' ' +

                              'LEFT JOIN empresas AS e' + ' ' +
                              'ON pdo.id_empresas = e.id' + ' ' +

                              'LEFT JOIN clientes AS c' + ' ' +
                              'ON pdo.id_clientes = c.id' + ' ' +

                              'LEFT JOIN formas_pago AS fp' + ' ' +
                              'ON pdo.id_formas_pago = fp.id' + ' ',

                              Memo_Filtros.Lines,
                              Memo_OrderBy.Lines,
                              var_a_Filtrar,

                              param_Cambiamos_Filtro,
                              false,   // param_ver_SQL_despues_Abrir : Boolean;
                              true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

    var_a_Filtrar.Free;

    Label_Ctdad_Rgtros.Caption := IntToStr(SQLQuery_Pdo.RecordCount);

    //Filtrar_tablas_ligadas;

    if SQLQuery_Pdo.RecordCount = 0 then
    begin
        Cerramos_Tablas_Ligadas;
    end;

    Sumar_Totales;

    Filtrar_Impuestos_Totales;
    var_SQL_ADD.Free;
end;

procedure Tform_pedidos_ventas_000.Sumar_Totales;
var var_Total_Principal : Extended;
begin
    var_Total_Principal := 0;

    With SQLQuery_Pdo do
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

procedure Tform_pedidos_ventas_000.BitBtn_Convertir_Integro_en_FacturaClick(
  Sender: TObject);
begin
    Convertir_Integro_en_Albaran_01(true);
end;

procedure Tform_pedidos_ventas_000.SQLQuery_List_PdoCalcFields(DataSet: TDataSet);
begin
    with SQLQuery_List_Pdo do
    begin
        if Trim(FieldByName('Serie_Pedido').AsString) <> '' then
        begin
            FieldByName('OT_el_Pedido').AsString := Trim(FieldByName('Serie_Pedido').AsString) +
                                                    '-' +
                                                    Trim(FieldByName('Numero_Pedido').AsString);
        end else begin
            FieldByName('OT_el_Pedido').AsString := Trim(FieldByName('Numero_Pedido').AsString);
        end;
    end;
end;

procedure Tform_pedidos_ventas_000.BitBtn_Convertir_Integro_en_AlbaranClick(Sender: TObject);
begin
    Convertir_Integro_en_Albaran_01(false);
end;

procedure Tform_pedidos_ventas_000.Convertir_Integro_en_Albaran_01(param_Crear_Ftra : Boolean);
var var_msg            : TStrings;
    var_Albaran_Creado : TAlbaran_Creado;
begin
    var_msg := TStringList.Create;

    // ********************************************************************************************* //
    // ** Si el pedido está borrado, no permitimos hacer nada con el.                             ** //
    // ********************************************************************************************* //
    if not form_pedidos_ventas_000.SQLQuery_Pdo.FieldByName('Del_WHEN').IsNull then
    begin
        var_msg.Add( '* Es un pedido borrado, no se puede modificar nada de el. ' +
                     'Si desea modificarlo, primero hay que darlo de alta anteriormente.' );
    end;

    // ********************************************************************************************* //
    // ** Si el pedido está cerrado no podemos hacer ningún albarán de él                         ** //
    // ********************************************************************************************* //
    with SQLQuery_Pdo do
    begin
        if UTI_VENTAS_Esta_Cerrado_SN( 'pedidos_ventas', FieldByName('id').AsString ) = 'S' then
        begin
            var_msg.Add( '* Pedido CERRADO.');
        end;
    end;

    // ********************************************************************************************* //
    // ** Si no tiene líneas de detalle que vamos a crear como albarán                            ** //
    // ********************************************************************************************* //
    if SQLQuery_Pdo.RecordCount = 0 then
    begin
        var_msg.Add( '* No hay pedido seleccionado.');
    end;

    // ********************************************************************************************* //
    // ** Comprobar si tiene alguna línea sin convertir en albarán, si la tiene pues crea un solo ** //
    // ** albarán para el resto no convertidas todavía                                            ** //
    // ********************************************************************************************* //
    Comprobar_Si_Hay_Lineas_Detalle_Sin_Albaran(var_msg);

    if Trim(var_msg.Text) = '' then
    begin
        // ***************************************************************************************** //
        // ** Continuamos con la creación del nuevo albarán con las líneas que no se convirtieron ** //
        // ** todavia en albarán                                                                  ** //
        // ***************************************************************************************** //
        var_Albaran_Creado := Convertir_Integro_en_Albaran_02(var_msg);

        if param_Crear_Ftra = true then
        begin
            if var_Albaran_Creado.Creado_SN = true then
            begin
                Convertir_Integro_en_Factura(var_msg, var_Albaran_Creado);
            end;
        end;
    end else begin
        UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
    end;

    var_msg.Free;
end;

procedure Tform_pedidos_ventas_000.Convertir_Integro_en_Factura( param_msg : TStrings;
                                                                 param_Albaran_Creado : TAlbaran_Creado );
begin
    if UTI_GEN_Form_Abierto_Ya('form_albaranes_ventas_000') = false then
    begin
        Application.CreateForm(Tform_albaranes_ventas_000, form_albaranes_ventas_000);

        form_albaranes_ventas_000.public_Solo_Ver    := false;
        form_albaranes_ventas_000.public_Elegimos    := true;
        form_albaranes_ventas_000.public_Menu_Worked := 430;

        // ************************************************************************************* //
        // ** Le pasamos el albarán a encontrar                                               ** //
        // ************************************************************************************* //
        form_albaranes_ventas_000.Edit_Albaran_Serie.Text  := param_Albaran_Creado.Empresa_Rgtro.Serie_Albaran;
        form_albaranes_ventas_000.Edit_Albaran_Numero.Text := param_Albaran_Creado.Empresa_Rgtro.Numero_Albaran;

        // ************************************************************************************* //
        // ** Filtramos su búsqueda                                                           ** //
        // ************************************************************************************* //
        form_albaranes_ventas_000.para_Empezar;

        if form_albaranes_ventas_000.SQLQuery_Alb.RecordCount = 1 then
        begin
            // form_albaranes_ventas_000.Editar_Registro;
            // form_albaranes_ventas_000.ShowModal;
            form_albaranes_ventas_000.BitBtn_FacturarClick(nil);
        end else begin
            if form_albaranes_ventas_000.SQLQuery_Alb.RecordCount = 0 then
            begin
                param_msg.Add( 'Este albarán ' +
                               param_Albaran_Creado.Empresa_Rgtro.Serie_Albaran + ' - ' +
                               param_Albaran_Creado.Empresa_Rgtro.Numero_Albaran +
                               ' no llegó a crearse.' );
                UTI_GEN_Aviso(true, param_msg, rs_No_Se_Puede, True, False);
            end else begin
                param_msg.Add( 'Existe más de un albarán ' +
                               param_Albaran_Creado.Empresa_Rgtro.Serie_Albaran + ' - ' +
                               param_Albaran_Creado.Empresa_Rgtro.Numero_Albaran );
                UTI_GEN_Aviso(true, param_msg, rs_No_Se_Puede, True, False);

                form_albaranes_ventas_000.ShowModal;
            end;
        end;

        form_albaranes_ventas_000.Free;

        // ************************************************************************************* //
        // ** Refrescamos los albaranes por si se hizo algún cambio en el elegido             ** //
        // ************************************************************************************* //
        Refrescar_Registros;
    end else begin
        param_msg.Add(rs_Modulo_Abierto);
        UTI_GEN_Aviso(true, param_msg, rs_No_Se_Puede, True, False);
    end;
end;

function Tform_pedidos_ventas_000.Convertir_Integro_en_Albaran_02(param_msg : TStrings) : TAlbaran_Creado;
var var_Registro_Empresa : TEmpresas;
    var_Fecha            : TDateTime;
    var_Form             : Tform_pedidos_ventas_003;
begin
    Result.Creado_SN := false;
    // ********************************************************************************************* //
    // ** Si el usuario no tiene permisos para modificar pedidos ni permiso para crear albaranes  ** //
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
        // ** Pasamos a comprobar si hubiera algún artículo que no tuviera suficiente stock.      ** //
        // ** No podemos permitir crear albaranes si no hay stock suficiente de algúno.           ** //
        // ***************************************************************************************** //
        var_Form := Tform_pedidos_ventas_003.Create(nil);
        var_Form.para_Empezar;

        if SQLQuery_Pdo_Detalles_Stock.RecordCount > 0 then
        begin
            // ************************************************************************************* //
            // ** Alguno de los artículos no tiene suficiente stock, así que presentamos los      ** //
            // ** artículos del pedido agrupados por cantidad y destacando cuales son los que     ** //
            // ** tienen suficiente stock. Es de menester que nos presentará sólo el resumen de   ** //
            // ** aquellos artículos que tuviese que controlarse su stock                         ** //
            // ************************************************************************************* //
            var_Form.ShowModal;
            var_Form.Free;
        end else begin
            var_Form.Free;

            // ************************************************************************************* //
            // ** Como se cumplen las condiciones de stock, creamos la cabecera del albaran       ** //
            // ************************************************************************************* //
            var_Fecha            := UTI_CN_Fecha_Hora;
            var_Registro_Empresa := Crear_Albaran_su_Cabecera( var_Fecha );

            // ************************************************************************************* //
            // ** Si se creo la cabecera, pasamos a crear las líneas de detalle del albarán, pero ** //
            // ** solo traspasamos aquellas líneas que todavía no hubieran sido convertidas en un ** //
            // ** albarán                                                                         ** //
            // ************************************************************************************* //
            if Trim(var_Registro_Empresa.id) <> '' then
            begin
                Crear_Albaran_su_Detalle( var_Fecha,
                                          var_Registro_Empresa.Serie_Albaran,
                                          var_Registro_Empresa.Numero_Albaran,
                                                  // *********************************************** //
                                          true ); // ** Así creará un albarán de todas las líneas ** //
                                                  // ** pendientes de ser convertidas en albarán  ** //
                                                  // *********************************************** //
                Cerrarlo;

                // ********************************************************************************* //
                // ** Mensaje diciendo que se ha creado el albarán numero/serie                   ** //
                // ********************************************************************************* //
                param_msg.Clear;
                param_msg.Add( 'Las líneas de este pedido que no estaban convertidas en albaranes, ahora' +
                               ' están ligadas con el albarán ' +
                               Trim(var_Registro_Empresa.Serie_Albaran) +
                               '/' +
                               Trim(var_Registro_Empresa.Numero_Albaran)  );

                UTI_GEN_Aviso(false, param_msg, 'PERFECTO.-', True, False);
                param_msg.Clear;

                Result.Creado_SN     := true;
                Result.Fecha         := var_Fecha;
                Result.Empresa_Rgtro := var_Registro_Empresa;
            end;
        end;
    end;
end;

procedure Tform_pedidos_ventas_000.Filtrar_Impuestos_Totales;
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
    if Trim(Edit_Pdo_Serie.Text) <> '' then
    begin
        var_a_Filtrar.Add( 'AND pv.Serie_Pedido = ' +
                           UTI_GEN_Comillas(Trim(Edit_Pdo_Serie.Text)) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos en el NUMERO                                                           ** //
    // ********************************************************************************************* //
    if Trim(Edit_Pdo_Numero.Text) <> '' then
    begin
        var_a_Filtrar.Add( 'AND pv.Numero_Pedido = ' +
                           UTI_GEN_Comillas(Trim(Edit_Pdo_Numero.Text)) );
    end;

    // ********************************************************************************************* //
     // ** Ahora buscaremos por la FECHA                                                          ** //
     // ******************************************************************************************** //
     if (not DateTimePicker_Hasta.DateIsNull) and
        (not DateTimePicker_Desde.DateIsNull) then
     begin
         var_a_Filtrar.Add( 'AND pv.Fecha <= ' +
                            UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Hasta.Date, false) +
                                              ' 23:59:59' ) );
         var_a_Filtrar.Add( 'AND pv.Fecha >= ' +
                            UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Desde.Date, false) +
                                              ' 00:00:00' ) );
     end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por el almacén                                                         ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Almacenes.Text) <> '' then
    begin
        var_a_Filtrar.Add( 'AND pv.id_Almacenes = ' + Trim(Edit_id_Almacenes.Text) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la empresa                                                         ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Empresas.Text) <> '' then
    begin
        var_a_Filtrar.Add( 'AND pv.id_empresas = ' + Trim(Edit_id_Empresas.Text) );
    end;

    // ********************************************************************************************* //
    // ** Primero buscaremos en la serie del Presupuesto                                          ** //
    // ********************************************************************************************* //
    if Trim(Edit_Presupuesto_Serie.Text) <> '' then
    begin
        var_a_Filtrar.Add( 'AND pv.Serie_Presupuesto = ' +
                           UTI_GEN_Comillas(Trim(Edit_Presupuesto_Serie.Text)) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos en el número del Presupuesto                                           ** //
    // ********************************************************************************************* //
    if Trim(Edit_Presupuesto_Numero.Text) <> '' then
    begin
        var_a_Filtrar.Add( 'AND pv.Numero_Presupuesto = ' +
                           UTI_GEN_Comillas(Trim(Edit_Presupuesto_Numero.Text)) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la forma de pago                                                   ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Forma_Pago.Text) <> '' then
    begin
        var_a_Filtrar.Add( 'AND pv.id_formas_pago = ' + Trim(Edit_id_Forma_Pago.Text) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la id del cliente                                                  ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Clientes.Text) <> '' then
    begin
        var_a_Filtrar.Add( 'AND pv.id_clientes = ' + Trim(Edit_id_Clientes.Text) );
    end;


    // ********************************************************************************************* //
    // ** Ahora buscaremos por la id del vehiculo                                                 ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Vehiculos.Text) <> '' then
    begin
        var_a_Filtrar.Add( 'AND pv.id_Vehiculos = ' + Trim(Edit_id_Vehiculos.Text) );
    end;

    // ********************************************************************************************* //
    // ** Ahora filtraremos por el estado del pedido (pendiente o no de servir algo, o todos      ** //
    // ********************************************************************************************* //
    if RadioButton_Cerrados_NO.Checked = true then
    begin
        var_a_Filtrar.Add( 'AND pv.Cerrado_SN = ' + UTI_GEN_Comillas('N') );
    end;

    if RadioButton_Cerrados_SI.Checked = true then
    begin
        var_a_Filtrar.Add( 'AND pv.Cerrado_SN = ' + UTI_GEN_Comillas('S') );
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
                      'pdovi.id_impuestos,' + ' ' +
                      'SUM(pdovi.Base) AS Total_Base,' + ' ' +
                      'SUM(pdovi.Importe) AS Total_Cuota' + ' ' +

               'FROM pedidos_ventas_impuestos AS pdovi' + ' ' +

               'LEFT JOIN impuestos AS imp' + ' ' +
               'ON pdovi.id_impuestos = imp.id' + ' ' +

               'RIGHT JOIN pedidos_ventas AS pv' + ' ' +
               'ON pdovi.id_pedidos = pv.id' + ' ' +

                   Trim(var_a_Filtrar.Text) + ' ' +

                  'AND pv.Del_WHEN IS NULL' + ' ' +

               'WHERE pdovi.Del_WHEN IS NULL' + ' ' +
               'AND NOT imp.descripcion IS NULL' + ' ' +

               'GROUP BY pdovi.id_impuestos' + ' ' +
               'ORDER BY pdovi.id_pedidos, pdovi.id_impuestos;' + ' ';

    if UTI_TB_Query_Open( // Delete_SQL,
                          '',

                          // Update_SQL,
                          '',

                          // Insert_SQL,
                          '',

                          DataModule_pedidos_ventas.SQLConnector_Imptos_Totales,
                          SQLQuery_Imptos_Totales,

                          // var_ctdad_Rgtros,
                          -1,

                          // SELECT_SQL
                          var_SQL ) = false then
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

function Tform_pedidos_ventas_000.Filtrar_Listado_Pdo( param_ver_bajas : ShortInt;
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

                            DataModule_pedidos_ventas.SQLTransaction_List_Pdo,
                            DataModule_pedidos_ventas.SQLConnector_List_Pdo,
                            SQLQuery_List_Pdo,

                            // name_tabla,
                            'pdo',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT impto.descripcion AS OT_descripcion_impuesto,' + ' ' +
                                   'impto.Tanto_Por_Ciento AS OT_Tanto_Por_Ciento,' + ' ' +

                                   'pdoi.*,' + ' ' +
                                   'pdo.*' + ' ' +

                            'FROM pedidos_ventas_impuestos AS pdoi' + ' ' +

                            'RIGHT JOIN pedidos_ventas as pdo' + ' ' +
                            'ON pdo.id = pdoi.id_pedidos' + ' ' +

                            'LEFT JOIN impuestos AS impto' + ' ' +
                            'ON pdoi.id_impuestos = impto.id',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_a_Filtrar_Plus.Free;
end;

procedure Tform_pedidos_ventas_000.Boton_Elegir_PeriodoClick(Sender: TObject);
begin
    UTI_GEN_Traer_Trimestre( DateTimePicker_Desde,
                             DateTimePicker_Hasta );
end;

procedure Tform_pedidos_ventas_000.BitBtn_ImprimirClick(Sender: TObject);
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
    if Trim(Edit_Pdo_Serie.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pdo.Serie_Pedido = ' + UTI_GEN_Comillas(Trim(Edit_Pdo_Serie.Text)) );
        UTI_TB_SQL_ADD( true,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos en el NUMERO                                                           ** //
    // ********************************************************************************************* //
    if Trim(Edit_Pdo_Numero.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pdo.Numero_Pedido = ' + UTI_GEN_Comillas(Trim(Edit_Pdo_Numero.Text)) );
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
         var_SQL_ADD.Add( 'pdo.Fecha <= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Hasta.Date, false) + ' 23:59:59' ) );
         UTI_TB_SQL_ADD( false,
                         var_Lineas_Filtro,
                         var_SQL_ADD );

         var_SQL_ADD.Clear;
         var_SQL_ADD.Add( 'pdo.Fecha >= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Desde.Date, false) + ' 00:00:00' ) );
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
        var_SQL_ADD.Add( 'pdo.id_Almacenes = ' + Trim(Edit_id_Almacenes.Text) );
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
        var_SQL_ADD.Add( 'pdo.id_empresas = ' + Trim(Edit_id_Empresas.Text) );
        UTI_TB_SQL_ADD( false,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Primero buscaremos en la serie del Presupuesto                                          ** //
    // ********************************************************************************************* //
    if Trim(Edit_Presupuesto_Serie.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pdo.Serie_Presupuesto = ' + UTI_GEN_Comillas(Trim(Edit_Presupuesto_Serie.Text)) );
        UTI_TB_SQL_ADD( false,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos en el número del Presupuesto                                           ** //
    // ********************************************************************************************* //
    if Trim(Edit_Presupuesto_Numero.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pdo.Numero_Presupuesto = ' + UTI_GEN_Comillas(Trim(Edit_Presupuesto_Numero.Text)) );
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
        var_SQL_ADD.Add( 'pdo.id_formas_pago = ' + Trim(Edit_id_Forma_Pago.Text) );
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
        var_SQL_ADD.Add( 'pdo.id_clientes = ' + Trim(Edit_id_Clientes.Text) );
        UTI_TB_SQL_ADD( false,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;


    // ********************************************************************************************* //
    // ** Ahora buscaremos por la id del vehiculo                                                 ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Vehiculos.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pdo.id_Vehiculos = ' + Trim(Edit_id_Vehiculos.Text) );
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
        var_SQL_ADD.Add( 'pdo.Cerrado_SN = ' + UTI_GEN_Comillas('N') );
        UTI_TB_SQL_ADD( false,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    if RadioButton_Cerrados_SI.Checked = true then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pdo.Cerrado_SN = ' + UTI_GEN_Comillas('S') );
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
    Filtrar_Listado_Pdo( 1, // RadioGroup_Bajas.ItemIndex,  // asi no se ven las bajas hasta que no lo pida el form de altas/modif de líneas
                         false,
                         var_Lineas_Filtro,
                         var_Lineas_OrderBy );

    if not SQLQuery_List_Pdo.IsEmpty then
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

        if Trim(Edit_Pdo_Serie.Text) <> '' then
        begin
            var_Ordenado_por := var_Ordenado_por +
                                ', con serie = ' +
                                Trim(Edit_Pdo_Serie.Text);
        end;

        if Trim(Edit_Pdo_Numero.Text) <> '' then
        begin
            var_Ordenado_por := var_Ordenado_por +
                                ', con número = ' +
                                Trim(Edit_Pdo_Numero.Text);
        end;

        if (not DateTimePicker_Hasta.DateIsNull) or
           (not DateTimePicker_Desde.DateIsNull) then
        begin
            var_Ordenado_por := var_Ordenado_por +
                                ', pedidos entre ' +
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

        if Trim(Edit_Descripcion_id_Vehiculos.Text) <> '' then
        begin
            var_Ordenado_por := var_Ordenado_por +
                                ', con vehículo = ' +
                                Trim(Edit_Descripcion_id_Vehiculos.Text);
        end;

        if Trim(Edit_Presupuesto_Serie.Text) <> '' then
        begin
            var_Ordenado_por := var_Ordenado_por +
                                ', con serie de presupuesto = ' +
                                Trim(Edit_Presupuesto_Serie.Text);
        end;

        if Trim(Edit_Presupuesto_Numero.Text) <> '' then
        begin
            var_Ordenado_por := var_Ordenado_por +
                                ', con número de presupuesto = ' +
                                Trim(Edit_Presupuesto_Numero.Text);
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

        // ***************************************************************************************** //
        // ** Vamos a enviar el título del impuesto común. Esto sólo servirá en aquellas empresas ** //
        // ** que sólo usen un tipo de impuesto para facturar                                     ** //
        // ***************************************************************************************** //
        var_Impuesto_Comun := '';

        with SQLQuery_Pdo_Detalles do
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
                          SQLQuery_Pdo,
                          DataSource_List_Pdo,
                          DataSource_Pdo_Detalles,
                          Nil,
                          DataSource_Imptos_Totales,
                          public_Menu_Worked,
                          public_Solo_Ver,
                          SQLQuery_Pdo.FieldByName('id_empresas').AsString,
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
    if UTI_TB_Cerrar( DataModule_pedidos_ventas.SQLConnector_List_Pdo,
                      DataModule_pedidos_ventas.SQLTransaction_List_Pdo,
                      SQLQuery_List_Pdo ) = false then
    begin
      UTI_GEN_Salir;
    end;

    var_SQL_ADD.Free;
end;

end.


