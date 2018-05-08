unit albaranes_compras_000;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, DateTimePicker, Forms, Controls, Graphics, Dialogs,
  ComCtrls, Buttons, StdCtrls, ExtCtrls, DBGrids, DbCtrls, LCLTranslator, Grids, variants,
  utilidades_forms_Filtrar, utilidades_datos_tablas, utilidades_bd, utilidades_general,
  utilidades_compras, utilidades_rgtro, utilidades_usuarios, utilidades_empresas, utilidades_almacenes,
  utilidades_lineas_detalle;

resourcestring
  rs_para_Empezar_1            = 'Por ntra.fecha de entrada + nº.de ntra.referencia';
  rs_para_Empezar_2            = 'Por el nº.de ntra.referencia';
  rs_para_Empezar_3            = 'Por empresa + fecha de entrada + nº.de ntra.referencia';
  rs_para_Empezar_4_1          = 'Por proveedor + fecha de entrada + nº.de ntra.referencia';
  rs_para_Empezar_4_2          = 'Por proveedor + su fecha de albarán + su nº.de albarán';
  rs_para_Empezar_5            = 'Por id del albarán';

  rs_BitBtn_ImprimirClick_2    = ', con ntra.numeración de albarán = ';

  rs_BitBtn_ImprimirClick_3    = ', creados entre ';
  rs_BitBtn_ImprimirClick_4    = ' y el ';
  rs_BitBtn_ImprimirClick_5    = ', con almacén = ';
  rs_BitBtn_ImprimirClick_6    = ', con empresa = ';
  rs_BitBtn_ImprimirClick_7    = ', con forma pago = ';
  rs_BitBtn_ImprimirClick_8    = ', con proveedor = ';

  rs_BitBtn_ImprimirClick_10   = ', con ntra.numeración de parte/pedido/orden = ';

  rs_BitBtn_ImprimirClick_12   = ', con ntra.numeración de factura = ';


  rs_BitBtn_ImprimirClick_14   = ', ver sólo los facturados';
  rs_BitBtn_ImprimirClick_15   = ', ver sólo los no facturados';
  rs_BitBtn_ImprimirClick_16   = ', ver estado = todos';
  rs_BitBtn_ImprimirClick_17   = ', con su alb.número = ';
  rs_BitBtn_ImprimirClick_18   = ', sus albaranes entre ';

  rs_Close_1                   = '* La descripción';

  rs_BitBtn_FiltrarClick_1     = '* Fechas mal introducidas para margen de albaranes.';

  rs_Insertar_Registro_1       = 'Tiene seleccionada para trabajar la empresa << ';
  rs_Insertar_Registro_2       = ' >>, ¿LA AÑADIMOS A ESTE ALBARÁN ... S/N?';
  rs_Insertar_Registro_3       = '¿QUE HACEMOS?';

  rs_Del_en_Pedidos_Albaran    = 'Error al borrar en pedidos todo rastro del albarán con nuestra referencia ';

  rs_Traer_id_Pedidos          = 'No se pudo traer la id del pedido con nuestra referencia ';
  rs_Borrar_Registro_1         = '* Este albarán pertenece a la factura con nuestra referencia ';
  rs_Borrar_Registro_2         = '* Este albarán fué borrado anteriormente, y además pertenecía al pedido con nuestra referencia ';
  rs_Borrar_Registro_3         = '. Por lo que no puedo darlo de alta otra vez, vaya a dicho pedido y vuelva a traspasarlo a albaranes.';

  rs_Cambiar_Almacen_Proveedor = 'No se pudo, actualizar el almacén y el proveedor a todas sus líneas de detalle.';

type

  { Tform_albaranes_compras_000 }

  Tform_albaranes_compras_000 = class(TForm)
    BitBtn_Facturar: TBitBtn;
    BitBtn_Filtrar: TBitBtn;
    BitBtn_Imprimir: TBitBtn;
    BitBtn_SALIR: TBitBtn;
    BitBtn_Seleccionar: TBitBtn;
    BitBtn_Ver_Factura: TBitBtn;
    BitBtn_Ver_Pedido: TBitBtn;
    BitBtn_Ver_Situacion_Registro: TBitBtn;
    Boton_Elegir_Empresa: TBitBtn;
    Boton_Elegir_Forma_Pago: TBitBtn;
    Boton_Elegir_id_Almacenes: TBitBtn;
    Boton_Elegir_id_Proveedores: TBitBtn;
    Boton_Elegir_Periodo: TBitBtn;
    ComboBox_Filtros: TComboBox;
    DataSource_Alb: TDataSource;
    DataSource_Alb_Detalles: TDataSource;
    DataSource_Alb_Impuestos: TDataSource;
    DataSource_Imptos_Totales: TDataSource;
    DataSource_List_Alb: TDataSource;
    DateTimePicker_Desde_Ntra_Referencia: TDateTimePicker;
    DateTimePicker_Desde_Su_Referencia: TDateTimePicker;
    DateTimePicker_Hasta_Ntra_Referencia: TDateTimePicker;
    DateTimePicker_Hasta_Su_Referencia: TDateTimePicker;
    DBEdit_eMail6: TDBEdit;
    DBEdit_eMail7: TDBEdit;
    DBEdit_Pagina_Web4: TDBEdit;
    DBEdit_Pagina_Web5: TDBEdit;
    DBGrid_Detalles1: TDBGrid;
    DBGrid_Principal: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBNavigator_Detalles1: TDBNavigator;
    Edit_Albaran_Numero_Ntra_Referencia: TEdit;
    Edit_Albaran_Numero_Su_Referencia: TEdit;
    Edit_Albaran_Serie_Ntra_Referencia: TEdit;
    Edit_Descripcion_Empresa: TEdit;
    Edit_Descripcion_Forma_Pago: TEdit;
    Edit_Descripcion_id_Almacenes: TEdit;
    Edit_Descripcion_id_Proveedores: TEdit;
    Edit_Factura_Numero: TEdit;
    Edit_Factura_Serie: TEdit;
    Edit_id_Almacenes: TEdit;
    Edit_id_Empresas: TEdit;
    Edit_id_Forma_Pago: TEdit;
    Edit_id_Proveedores: TEdit;
    Edit_Pedido_Numero: TEdit;
    Edit_Pedido_Serie: TEdit;
    Edit_Registros_Total: TEdit;
    GroupBox4: TGroupBox;
    GroupBox_Internet2: TGroupBox;
    GroupBox_Internet4: TGroupBox;
    GroupBox_Serie_Numero1: TGroupBox;
    GroupBox_Serie_Numero2: TGroupBox;
    Image_Candado: TImage;
    Image_Cobro_Excluido: TImage;
    Image_Convertida: TImage;
    Label102: TLabel;
    Label103: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label7: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label8: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label89: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label_Almacen: TLabel;
    Label_Ctdad_Rgtros: TLabel;
    Label_Fecha2: TLabel;
    Label_Fecha3: TLabel;
    Memo_Filtros: TMemo;
    Memo_OrderBy: TMemo;
    PageControl_Filtros: TPageControl;
    Panel2: TPanel;
    RadioButton_Albaranes_Solo: TRadioButton;
    RadioButton_Facturados_Solo: TRadioButton;
    RadioButton_Todos: TRadioButton;
    RadioGroup_Bajas: TRadioGroup;
    Shape4: TShape;
    Shape5: TShape;
    SQLQuery_Alb: TSQLQuery;
    SQLQuery_Albagencias_transporte_id_proveedores: TLargeintField;
    SQLQuery_AlbChange_Id_User: TLargeintField;
    SQLQuery_AlbChange_WHEN: TDateTimeField;
    SQLQuery_AlbCodigo_Postal: TStringField;
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
    SQLQuery_AlbFecha_Albaran_Proveedor: TDateTimeField;
    SQLQuery_AlbForma_pago_Dia_1: TSmallintField;
    SQLQuery_AlbForma_pago_Dia_2: TSmallintField;
    SQLQuery_AlbForma_pago_Vacaciones_Dia_Fin: TSmallintField;
    SQLQuery_AlbForma_pago_Vacaciones_Dia_Inicio: TSmallintField;
    SQLQuery_AlbForma_pago_Vacaciones_Mes_Fin: TSmallintField;
    SQLQuery_AlbForma_pago_Vacaciones_Mes_Inicio: TSmallintField;
    SQLQuery_Albid: TLargeintField;
    SQLQuery_Albid_almacenes: TLargeintField;
    SQLQuery_Albid_empresas: TLargeintField;
    SQLQuery_Albid_formas_pago: TLargeintField;
    SQLQuery_Albid_paises: TLargeintField;
    SQLQuery_Albid_poblaciones: TLargeintField;
    SQLQuery_Albid_proveedores: TLargeintField;
    SQLQuery_Albid_provincias: TLargeintField;
    SQLQuery_AlbInsert_Id_User: TLargeintField;
    SQLQuery_AlbInsert_WHEN: TDateTimeField;
    SQLQuery_AlbIVA_con_Recargo_SN: TStringField;
    SQLQuery_AlbIVA_Excluido_SN: TStringField;
    SQLQuery_AlbMovil: TStringField;
    SQLQuery_Albnif_cif: TStringField;
    SQLQuery_Albnombre_comercial: TStringField;
    SQLQuery_Albnombre_propietario: TStringField;
    SQLQuery_AlbNumero_Albaran: TLargeintField;
    SQLQuery_AlbNumero_Albaran_Proveedor: TStringField;
    SQLQuery_AlbNumero_Factura: TLargeintField;
    SQLQuery_AlbNumero_Pedido: TLargeintField;
    SQLQuery_AlbNumero_Presupuesto: TLargeintField;
    SQLQuery_AlbObservaciones: TStringField;
    SQLQuery_AlbOT_Cta_Bco_descripcion_pais: TStringField;
    SQLQuery_AlbOT_Cta_Bco_descripcion_poblacion: TStringField;
    SQLQuery_AlbOT_Cta_Bco_descripcion_provincia: TStringField;
    SQLQuery_AlbOT_descripcion_almacen: TStringField;
    SQLQuery_AlbOT_descripcion_empresa: TStringField;
    SQLQuery_AlbOT_descripcion_forma_pago: TStringField;
    SQLQuery_AlbOT_descripcion_pais: TStringField;
    SQLQuery_AlbOT_descripcion_poblacion: TStringField;
    SQLQuery_AlbOT_descripcion_proveedor: TStringField;
    SQLQuery_AlbOT_descripcion_provincia: TStringField;
    SQLQuery_AlbOT_descripcion_transportista: TStringField;
    SQLQuery_AlbOT_el_Albaran1: TStringField;
    SQLQuery_AlbOT_Envio_descripcion_pais: TStringField;
    SQLQuery_AlbOT_Envio_descripcion_poblacion: TStringField;
    SQLQuery_AlbOT_Envio_descripcion_provincia: TStringField;
    SQLQuery_AlbOT_Movil_transportista: TStringField;
    SQLQuery_AlbOT_tfno_1_transportista: TStringField;
    SQLQuery_AlbRetencion: TBCDField;
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
    SQLQuery_Alb_Detallesid_impuestos_Compras: TLargeintField;
    SQLQuery_Alb_Detallesid_proveedores: TLargeintField;
    SQLQuery_Alb_DetallesInsert_Id_User: TLargeintField;
    SQLQuery_Alb_DetallesInsert_WHEN: TDateTimeField;
    SQLQuery_Alb_DetallesNumero_Factura: TLargeintField;
    SQLQuery_Alb_DetallesOT_descripcion_almacen: TStringField;
    SQLQuery_Alb_DetallesOT_descripcion_articulo: TStringField;
    SQLQuery_Alb_DetallesOT_descripcion_impuesto: TStringField;
    SQLQuery_Alb_DetallesOT_Descripcion_para_DbGrid1: TStringField;
    SQLQuery_Alb_DetallesOT_id_almacenes_Cabecera: TLargeintField;
    SQLQuery_Alb_DetallesOT_Numero_Albaran: TLargeintField;
    SQLQuery_Alb_DetallesOT_Proveedor_nombre_comercial: TStringField;
    SQLQuery_Alb_DetallesOT_Proveedor_nombre_propietario: TStringField;
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
    SQLQuery_Alb_Impuestos: TSQLQuery;
    SQLQuery_Alb_ImpuestosBase: TBCDField;
    SQLQuery_Alb_ImpuestosChange_Id_User: TLargeintField;
    SQLQuery_Alb_ImpuestosChange_WHEN: TDateTimeField;
    SQLQuery_Alb_ImpuestosDel_Id_User: TLargeintField;
    SQLQuery_Alb_ImpuestosDel_WHEN: TDateTimeField;
    SQLQuery_Alb_ImpuestosDel_WHY: TStringField;
    SQLQuery_Alb_Impuestosid_albaranes: TLargeintField;
    SQLQuery_Alb_Impuestosid_impuestos: TLargeintField;
    SQLQuery_Alb_ImpuestosImporte: TBCDField;
    SQLQuery_Alb_ImpuestosInsert_Id_User: TLargeintField;
    SQLQuery_Alb_ImpuestosInsert_WHEN: TDateTimeField;
    SQLQuery_Alb_ImpuestosOT_descripcion_impuesto: TStringField;
    SQLQuery_Alb_ImpuestosOT_Tanto_Por_Ciento: TBCDField;
    SQLQuery_Clientesid1: TLargeintField;
    SQLQuery_Clientesid3: TLargeintField;
    SQLQuery_Ftraid2: TLargeintField;
    SQLQuery_FtraOT_el_Albaran: TStringField;
    SQLQuery_Imptos_Totales: TSQLQuery;
    SQLQuery_Imptos_Totalesid_impuestos: TLargeintField;
    SQLQuery_Imptos_TotalesOT_Descripcion_impto: TStringField;
    SQLQuery_Imptos_TotalesTotal_Base: TFMTBCDField;
    SQLQuery_Imptos_TotalesTotal_Cuota: TFMTBCDField;
    SQLQuery_List_Alb: TSQLQuery;
    SQLQuery_List_Albagencias_transporte_id_proveedores: TLargeintField;
    SQLQuery_List_AlbBase: TBCDField;
    SQLQuery_List_AlbChange_Id_User: TLargeintField;
    SQLQuery_List_AlbChange_Id_User_1: TLargeintField;
    SQLQuery_List_AlbChange_WHEN: TDateTimeField;
    SQLQuery_List_AlbChange_WHEN_1: TDateTimeField;
    SQLQuery_List_AlbCodigo_Postal: TStringField;
    SQLQuery_List_AlbCONCEPTO_SEPA: TStringField;
    SQLQuery_List_AlbCta_Bco_BIC_SWIFT: TStringField;
    SQLQuery_List_AlbCta_Bco_Codigo_Postal: TStringField;
    SQLQuery_List_AlbCta_Bco_Cuenta: TStringField;
    SQLQuery_List_AlbCta_Bco_Digito_Control: TStringField;
    SQLQuery_List_AlbCta_Bco_Direccion: TStringField;
    SQLQuery_List_AlbCta_Bco_Direccion_Numero: TStringField;
    SQLQuery_List_AlbCta_Bco_Direccion_Piso_Letra: TStringField;
    SQLQuery_List_AlbCta_Bco_Entidad: TStringField;
    SQLQuery_List_AlbCta_Bco_IBAN: TStringField;
    SQLQuery_List_AlbCta_Bco_id_paises: TLargeintField;
    SQLQuery_List_AlbCta_Bco_id_poblaciones: TLargeintField;
    SQLQuery_List_AlbCta_Bco_id_provincias: TLargeintField;
    SQLQuery_List_AlbCta_Bco_Mandato_Fecha_de_Firma: TDateTimeField;
    SQLQuery_List_AlbCta_Bco_Mandato_Ref: TStringField;
    SQLQuery_List_AlbCta_Bco_Sucursal: TStringField;
    SQLQuery_List_AlbDel_Id_User: TLargeintField;
    SQLQuery_List_AlbDel_Id_User_1: TLargeintField;
    SQLQuery_List_AlbDel_WHEN: TDateTimeField;
    SQLQuery_List_AlbDel_WHEN_1: TDateTimeField;
    SQLQuery_List_AlbDel_WHY: TStringField;
    SQLQuery_List_AlbDel_WHY_1: TStringField;
    SQLQuery_List_AlbDescuento_Comercial_1: TBCDField;
    SQLQuery_List_AlbDescuento_Comercial_2: TBCDField;
    SQLQuery_List_AlbDescuento_Final: TBCDField;
    SQLQuery_List_AlbDescuento_Pronto_Pago: TBCDField;
    SQLQuery_List_AlbDireccion: TStringField;
    SQLQuery_List_AlbDireccion_Numero: TStringField;
    SQLQuery_List_AlbDireccion_Piso_Letra: TStringField;
    SQLQuery_List_AlbEnvio_Bultos: TLongintField;
    SQLQuery_List_AlbEnvio_Codigo_Postal: TStringField;
    SQLQuery_List_AlbEnvio_Condiciones_Entrega: TStringField;
    SQLQuery_List_AlbEnvio_Con_Quien_Hablar: TStringField;
    SQLQuery_List_AlbEnvio_Direccion: TStringField;
    SQLQuery_List_AlbEnvio_Direccion_Numero: TStringField;
    SQLQuery_List_AlbEnvio_Direccion_Piso_Letra: TStringField;
    SQLQuery_List_AlbEnvio_eMail: TStringField;
    SQLQuery_List_AlbEnvio_FAX: TStringField;
    SQLQuery_List_AlbEnvio_Fecha_Recogida_Prevista: TDateTimeField;
    SQLQuery_List_AlbEnvio_id_paises: TLargeintField;
    SQLQuery_List_AlbEnvio_id_poblaciones: TLargeintField;
    SQLQuery_List_AlbEnvio_id_provincias: TLargeintField;
    SQLQuery_List_AlbEnvio_Movil: TStringField;
    SQLQuery_List_AlbEnvio_Portes: TBCDField;
    SQLQuery_List_AlbEnvio_Portes_Pagados_SN: TStringField;
    SQLQuery_List_AlbEnvio_Tfno_Fijo_1: TStringField;
    SQLQuery_List_AlbEnvio_Tfno_Fijo_2: TStringField;
    SQLQuery_List_AlbFAX: TStringField;
    SQLQuery_List_AlbFecha: TDateTimeField;
    SQLQuery_List_AlbFecha_Albaran_Proveedor: TDateTimeField;
    SQLQuery_List_AlbForma_pago_Dia_1: TSmallintField;
    SQLQuery_List_AlbForma_pago_Dia_2: TSmallintField;
    SQLQuery_List_AlbForma_pago_Vacaciones_Dia_Fin: TSmallintField;
    SQLQuery_List_AlbForma_pago_Vacaciones_Dia_Inicio: TSmallintField;
    SQLQuery_List_AlbForma_pago_Vacaciones_Mes_Fin: TSmallintField;
    SQLQuery_List_AlbForma_pago_Vacaciones_Mes_Inicio: TSmallintField;
    SQLQuery_List_Albid_1: TLargeintField;
    SQLQuery_List_Albid_albaranes: TLargeintField;
    SQLQuery_List_Albid_almacenes: TLargeintField;
    SQLQuery_List_Albid_empresas: TLargeintField;
    SQLQuery_List_Albid_formas_pago: TLargeintField;
    SQLQuery_List_Albid_impuestos: TLargeintField;
    SQLQuery_List_Albid_paises: TLargeintField;
    SQLQuery_List_Albid_poblaciones: TLargeintField;
    SQLQuery_List_Albid_proveedores: TLargeintField;
    SQLQuery_List_Albid_provincias: TLargeintField;
    SQLQuery_List_AlbImporte: TBCDField;
    SQLQuery_List_AlbInsert_Id_User: TLargeintField;
    SQLQuery_List_AlbInsert_Id_User_1: TLargeintField;
    SQLQuery_List_AlbInsert_WHEN: TDateTimeField;
    SQLQuery_List_AlbInsert_WHEN_1: TDateTimeField;
    SQLQuery_List_AlbIVA_con_Recargo_SN: TStringField;
    SQLQuery_List_AlbIVA_Excluido_SN: TStringField;
    SQLQuery_List_AlbMovil: TStringField;
    SQLQuery_List_Albnif_cif: TStringField;
    SQLQuery_List_Albnombre_comercial: TStringField;
    SQLQuery_List_Albnombre_propietario: TStringField;
    SQLQuery_List_AlbNumero_Albaran: TLargeintField;
    SQLQuery_List_AlbNumero_Albaran_Proveedor: TStringField;
    SQLQuery_List_AlbNumero_Factura: TLargeintField;
    SQLQuery_List_AlbNumero_Pedido: TLargeintField;
    SQLQuery_List_AlbNumero_Presupuesto: TLargeintField;
    SQLQuery_List_AlbObservaciones: TStringField;
    SQLQuery_List_AlbOT_descripcion_impuesto: TStringField;
    SQLQuery_List_AlbOT_Tanto_Por_Ciento: TBCDField;
    SQLQuery_List_AlbRetencion: TBCDField;
    SQLQuery_List_AlbSerie_Albaran: TStringField;
    SQLQuery_List_AlbSerie_Factura: TStringField;
    SQLQuery_List_AlbSerie_Pedido: TStringField;
    SQLQuery_List_AlbSerie_Presupuesto: TStringField;
    SQLQuery_List_AlbTfno_Fijo_1: TStringField;
    SQLQuery_List_AlbTfno_Fijo_2: TStringField;
    SQLQuery_List_AlbTotal_Lineas: TBCDField;
    SQLQuery_List_AlbTotal_Mano_Obra: TBCDField;
    SQLQuery_List_AlbTotal_Materiales: TBCDField;
    SQLQuery_List_AlbTotal_Resto: TBCDField;
    SQLQuery_List_AlbTotal_Total: TBCDField;
    SQLQuery_List_AlbVencimientos_1_Dias: TSmallintField;
    SQLQuery_List_AlbVencimientos_automaticos_SN: TStringField;
    SQLQuery_List_AlbVencimientos_Cantidad: TSmallintField;
    SQLQuery_List_AlbVencimientos_Dias_Entre: TSmallintField;
    TabSheet1: TTabSheet;
    TabSheet_Busqueda_Concreta: TTabSheet;
    TabSheet_Filtros_Generales: TTabSheet;

    procedure Boton_Elegir_PeriodoClick(Sender: TObject);
    function  Filtrar_Listado_Alb( param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
    procedure Filtrar_Impuestos_Totales;
    procedure SQLQuery_List_AlbCalcFields(DataSet: TDataSet);
    procedure Sumar_Totales;
    procedure Refrescar_Registros_Impuestos;
    function  Filtrar_Lineas_Impuestos( param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
    procedure BitBtn_Ver_FacturaClick(Sender: TObject);
    procedure BitBtn_Ver_PedidoClick(Sender: TObject);
    procedure Presentar_Datos_Totales( param_Actualizar_Totales : Byte );
    procedure Convertir_Integro_en_Ftra(param_msg : TStrings);
    procedure BitBtn_FacturarClick(Sender: TObject);
    procedure Insertar_Registro;
    procedure Editar_Registro(param_Introducimos_Linea_Detalle_SN : Boolean);
    procedure Borrar_Registro;
    procedure Borrar_Registro_2;
    procedure Borrar_en_Pedidos_el_Albaran( param_Serie_Albaran, param_Numero_Albaran : String );
    procedure SQLQuery_Alb_DetallesBeforePost(DataSet: TDataSet);
    function  Traer_id_Pedidos_Antes_de_Borrar_en_Pedidos_el_Albaran( param_Serie_Albaran, param_Numero_Albaran : String ) : ShortString;
    procedure Boton_Elegir_EmpresaClick(Sender: TObject);
    procedure Boton_Elegir_Forma_PagoClick(Sender: TObject);
    procedure Boton_Elegir_id_AlmacenesClick(Sender: TObject);
    procedure Boton_Elegir_id_ProveedoresClick(Sender: TObject);
    procedure Edit_Descripcion_EmpresaClick(Sender: TObject);
    procedure Edit_Descripcion_Forma_PagoClick(Sender: TObject);
    procedure Edit_Descripcion_id_AlmacenesClick(Sender: TObject);
    procedure Edit_Descripcion_id_ProveedoresClick(Sender: TObject);
    procedure Refrescar_Registros;
    procedure Refrescar_Registros_Detalles;
    procedure BitBtn_FiltrarClick(Sender: TObject);
    procedure BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
    procedure Presentar_Datos;
    procedure Filtrar_tablas_ligadas;
    procedure Filtrar_Principal_Sin_Preguntar;
    function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
    function  Filtrar_Lineas_Detalles( param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
    procedure no_Tocar;
    procedure BitBtn_ImprimirClick(Sender: TObject);
    procedure ComboBox_FiltrosChange(Sender: TObject);
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
    procedure SQLQuery_AlbAfterPost(DataSet: TDataSet);
    procedure SQLQuery_AlbAfterScroll(DataSet: TDataSet);
    procedure SQLQuery_AlbBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_AlbBeforePost(DataSet: TDataSet);
    procedure SQLQuery_AlbCalcFields(DataSet: TDataSet);
    procedure SQLQuery_Alb_DetallesAfterPost(DataSet: TDataSet);
    procedure SQLQuery_Alb_DetallesBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_Alb_DetallesCalcFields(DataSet: TDataSet);

  private
    { private declarations }
    private_Salir_OK                  : Boolean;
    private_Order_By                  : array of TOrder_By;
    private_Order_By_Lineas_Impuestos : array of TOrder_By;
    private_Order_By_Lineas_Detalles  : array of TOrder_By;
    private_Estaba_Borrado_el_Alb     : Boolean;
    private_ultima_fecha_entrada      : String;
  public
    { public declarations }
    public_Solo_Ver           : Boolean;
    public_Elegimos           : Boolean;
    public_Menu_Worked        : Integer;
    public_Rgtro_Seleccionado : Boolean;
  end;

var
  form_albaranes_compras_000: Tform_albaranes_compras_000;

implementation

{$R *.lfm}

uses dm_albaranes_compras, menu, albaranes_compras_001, facturas_compras_000, pedidos_compras_000;

{ Tform_albaranes_compras_000 }

procedure Tform_albaranes_compras_000.FormActivate(Sender: TObject);
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

procedure Tform_albaranes_compras_000.FormCreate(Sender: TObject);
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

procedure Tform_albaranes_compras_000.RadioGroup_BajasClick(Sender: TObject);
begin
    Refrescar_Registros;
end;

procedure Tform_albaranes_compras_000.FormClose(Sender: TObject; var CloseAction: TCloseAction);
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
        // ***************************************************************************************** //
        // ** Fue correcto el modo como quiere BitBtn_SALIR de la aplicación                      ** //
        // ***************************************************************************************** //
    end;
end;

procedure Tform_albaranes_compras_000.FormDestroy(Sender: TObject);
begin
    Cerramos_Tablas;
end;

procedure Tform_albaranes_compras_000.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_Albaranes_Compras.SQLConnector_Alb,
                      DataModule_Albaranes_Compras.SQLTransaction_Alb,
                      SQLQuery_Alb ) = false then UTI_GEN_Salir;

    DataModule_Albaranes_Compras.Free;
end;

procedure Tform_albaranes_compras_000.Cerramos_Tablas_Ligadas;
begin
    if UTI_TB_Cerrar( DataModule_Albaranes_Compras.SQLConnector_Alb_Detalles,
                      DataModule_Albaranes_Compras.SQLTransaction_Alb_Detalles,
                      SQLQuery_Alb_Detalles ) = false then UTI_GEN_Salir;
end;

procedure Tform_albaranes_compras_000.SQLQuery_AlbCalcFields(DataSet: TDataSet);
begin
    with SQLQuery_Alb do
    begin
        if Trim(FieldByName('Serie_Albaran').AsString) <> '' then
        begin
            FieldByName('OT_el_Albaran').AsString := Trim(FieldByName('Serie_Albaran').AsString) +
                                                     '-' +
                                                     Trim(FieldByName('Numero_Albaran').AsString);
        end else begin
            FieldByName('OT_el_Albaran').AsString := Trim(FieldByName('Numero_Albaran').AsString);
        end;
    end;
end;

procedure Tform_albaranes_compras_000.SQLQuery_AlbAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'albaranes_compras',
                       DataModule_Albaranes_Compras.SQLTransaction_Alb,
                       SQLQuery_Alb,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros;
end;

procedure Tform_albaranes_compras_000.SQLQuery_AlbBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Alb );
end;

procedure Tform_albaranes_compras_000.SQLQuery_AlbBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Alb );
end;

procedure Tform_albaranes_compras_000.SQLQuery_AlbAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure Tform_albaranes_compras_000.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    If public_Elegimos then
         Seleccionado_Rgtro
    else Editar_Registro(false);
end;

procedure Tform_albaranes_compras_000.DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    UTI_GEN_Dibujar_Grid( Sender, SQLQuery_Alb, Rect, DataCol, Column, State );
end;

procedure Tform_albaranes_compras_000.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then
    begin
        If public_Elegimos then
             Seleccionado_Rgtro
        else Editar_Registro(false);
    end;
end;

procedure Tform_albaranes_compras_000.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

procedure Tform_albaranes_compras_000.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure Tform_albaranes_compras_000.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_albaranes_compras_000.BitBtn_SeleccionarClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
end;

procedure Tform_albaranes_compras_000.Seleccionado_Rgtro;
begin
    private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    public_Rgtro_Seleccionado := true;
    Close;
end;

procedure Tform_albaranes_compras_000.DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
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

procedure Tform_albaranes_compras_000.ComboBox_FiltrosChange(Sender: TObject);
begin
    Memo_OrderBy.Lines.Clear;
    Memo_OrderBy.Lines.Add( private_Order_By[ComboBox_Filtros.ItemIndex].Memo_OrderBy );
    BitBtn_FiltrarClick(Nil);
end;

procedure Tform_albaranes_compras_000.no_Tocar;
begin
end;

procedure Tform_albaranes_compras_000.Presentar_Datos;
begin
     /// guardar por lo que pueda pasar
end;

procedure Tform_albaranes_compras_000.BitBtn_FiltrarClick(Sender: TObject);
var var_msg : TStrings;
begin
    // ********************************************************************************************* //
    // ** COMPROBAMOS SI EL MARGEN DE FECHAS ESTA BIEN INTRODUCIDO                                ** //
    // ********************************************************************************************* //
    var_msg := TStringList.Create;

    if UTI_GEN_Comprobar_2_Fechas( DateTimePicker_Desde_Ntra_Referencia,
                                   DateTimePicker_Hasta_Ntra_Referencia ) = false then
    begin
        var_msg.Add(rs_BitBtn_FiltrarClick_1);
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

procedure Tform_albaranes_compras_000.BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if SQLQuery_Alb.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'albaranes_compras',
                                           SQLQuery_Alb,
                                           DataSource_Alb,
                                           DBGrid_Principal );
        end;
    end;
end;

procedure Tform_albaranes_compras_000.Refrescar_Registros;
var var_Serie  : ShortString;
    var_Numero : Int64;
begin
    Try
        // ***************************************************************************************** //
        // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                         ** //
        // ***************************************************************************************** //
        var_Serie  := '';
        var_Numero := 0;

        with SQLQuery_Alb do
        begin
            if RecordCount > 0 then
            begin
                var_Serie  := FieldByName('Serie_Albaran').AsString;
                var_Numero := FieldByName('Numero_Albaran').Value;
            end;
        end;

        Filtrar_Principal_Sin_Preguntar;

        if Trim(var_Serie) <> '' then
        begin
             SQLQuery_Alb.Locate( 'Serie_Albaran;Numero_Albaran',
                                  VarArrayOf( [ var_Serie, var_Numero ] ),
                                  [] );
        end;
    Except
    end;
end;

procedure Tform_albaranes_compras_000.Refrescar_Registros_Detalles;
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
    if SQLQuery_Alb.State <> dsEdit then Exit;

    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_id := '';

    with SQLQuery_Alb_Detalles do
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
    var_SQL_ADD.Add( 'acd.id_albaranes = ' + SQLQuery_Alb.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_ver_Bajas := 1; // asi no se ven las bajas hasta que no lo pida el form de altas/modif de líneas
    if UTI_GEN_Form_Abierto_Ya('form_albaranes_compras_001') = true then
    begin
        var_ver_Bajas := form_albaranes_compras_001.RadioGroup_Bajas.ItemIndex;
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
            // ** es id_proveedor + id del registro                                               ** //
            // ************************************************************************************* //
            SQLQuery_Alb_Detalles.Last;
        end else begin
            // ************************************************************************************* //
            // ** Estabamos en una edición, así que ya conocíamos la id del registro. Por lo que  ** //
            // ** hago el locate por esta id                                                      ** //
            // ************************************************************************************* //
            SQLQuery_Alb_Detalles.Locate('id', StrToInt64(var_id), []);
        end;

    end;
    var_SQL_ADD.Free;
end;

function Tform_albaranes_compras_000.Filtrar_Lineas_Detalles( param_ver_bajas : ShortInt;
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
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Alb_Detalles,
                                                          'albaranes_compras_detalles',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Alb_Detalles,
                                                          'albaranes_compras_detalles',
                                                          'i' ),

                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_Albaranes_Compras.SQLTransaction_Alb_Detalles,
                            DataModule_Albaranes_Compras.SQLConnector_Alb_Detalles,
                            SQLQuery_Alb_Detalles,

                            // name_tabla,
                            'acd',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT acd.*,' + ' ' +

                                   'pr.nombre_propietario AS OT_Proveedor_nombre_propietario,' + ' ' +
                                   'pr.nombre_comercial AS OT_Proveedor_nombre_comercial,' + ' ' +

                                   'ac.id_almacenes AS OT_id_almacenes_Cabecera,' + ' ' +
                                   'ac.Serie_Albaran AS OT_Serie_Albaran,' + ' ' +
                                   'ac.Numero_Albaran AS OT_Numero_Albaran,' + ' ' +

                                   'al.descripcion AS OT_descripcion_almacen,' + ' ' +

                                   'a.descripcion_para_TPV AS OT_descripcion_articulo,' + ' ' +
                                   'a.Tipo_de_articulo AS OT_Tipo_de_articulo,' + ' ' +

                                   'i.descripcion AS OT_descripcion_impuesto,' + ' ' +
                                   'i.Tanto_Por_Ciento AS OT_Tanto_Por_Ciento,' + ' ' +
                                   'i.Sumado_A_Ftra_SN AS OT_Sumado_A_Ftra_SN' + ' ' +

                            'FROM albaranes_compras_detalles AS acd' + ' ' +

                            'LEFT JOIN almacenes AS al' + ' ' +
                            'ON acd.id_almacenes = al.id' + ' ' +

                            'LEFT JOIN articulos AS a' + ' ' +
                            'ON acd.id_articulos = a.id' + ' ' +

                            'LEFT JOIN impuestos AS i' + ' ' +
                            'ON acd.id_impuestos_Compras = i.id' + ' ' +

                            'LEFT JOIN proveedores AS pr' + ' ' +
                            'ON acd.id_proveedores = pr.id' + ' ' +

                            'LEFT JOIN albaranes_compras AS ac' + ' ' +
                            'ON acd.id_albaranes = ac.id ',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  if UTI_GEN_Form_Abierto_Ya('form_albaranes_compras_001') = true then
  begin
    form_albaranes_compras_001.Poner_Total_Lineas_Detalle;
  end;

  var_a_Filtrar_Plus.Free;
end;

procedure Tform_albaranes_compras_000.Filtrar_Principal_Sin_Preguntar;
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

procedure Tform_albaranes_compras_000.SQLQuery_Alb_DetallesBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Alb_Detalles );
end;

procedure Tform_albaranes_compras_000.SQLQuery_Alb_DetallesAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'albaranes_compras_detalles',
                       DataModule_Albaranes_Compras.SQLTransaction_Alb_Detalles,
                       SQLQuery_Alb_Detalles,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros_Detalles;
end;

procedure Tform_albaranes_compras_000.Boton_Elegir_Forma_PagoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_FormasPago( true, false, 80, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Forma_Pago.Text          := Trim(var_Registro.id_1);
        Edit_Descripcion_Forma_Pago.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_albaranes_compras_000.Edit_Descripcion_Forma_PagoClick(Sender: TObject);
begin
    Edit_id_Forma_Pago.Text          := '';
    Edit_Descripcion_Forma_Pago.Text := '';
end;

procedure Tform_albaranes_compras_000.Boton_Elegir_EmpresaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Empresas( true, false, 250, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Empresas.Text         := Trim(var_Registro.id_1);
        Edit_Descripcion_Empresa.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_albaranes_compras_000.Edit_Descripcion_EmpresaClick(Sender: TObject);
begin
    Edit_id_Empresas.Text         := '';
    Edit_Descripcion_Empresa.Text := '';
end;

procedure Tform_albaranes_compras_000.Boton_Elegir_id_ProveedoresClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Proveedores( true, false, 120, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Proveedores.Text             := Trim(var_Registro.id_1);
        Edit_Descripcion_id_Proveedores.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_albaranes_compras_000.Edit_Descripcion_id_ProveedoresClick(Sender: TObject);
begin
    Edit_id_Proveedores.Text             := '';
    Edit_Descripcion_id_Proveedores.Text := '';
end;

procedure Tform_albaranes_compras_000.Boton_Elegir_id_AlmacenesClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Almacenes( true, false, 260, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Almacenes.Text             := Trim(var_Registro.id_1);
        Edit_Descripcion_id_Almacenes.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_albaranes_compras_000.Edit_Descripcion_id_AlmacenesClick(Sender: TObject);
begin
    Edit_id_Almacenes.Text             := '';
    Edit_Descripcion_id_Almacenes.Text := '';
end;

procedure Tform_albaranes_compras_000.SQLQuery_Alb_DetallesCalcFields(DataSet: TDataSet);
begin
    UTI_LINEAS_Poner_Totales_Linea_Detalle( SQLQuery_Alb_Detalles );
end;

procedure Tform_albaranes_compras_000.Insertar_Registro;
var var_msg    : TStrings;
    var_Serie  : String;
    var_Numero : String;
begin
    with SQLQuery_Alb do
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
                UTI_EMPRE_Asignar_Empresa(SQLQuery_Alb);
                UTI_ALMAC_Asignar_almacen(SQLQuery_Alb);

                Application.CreateForm(Tform_albaranes_compras_001, form_albaranes_compras_001);

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

                form_albaranes_compras_001.DBGrid_Detalles.Color := clSilver;

                form_albaranes_compras_001.RadioGroup_Bajas.ItemIndex := RadioGroup_Bajas.ItemIndex;

                form_albaranes_compras_001.para_Empezar;

                form_albaranes_compras_001.ShowModal;
                if form_albaranes_compras_001.public_Pulso_Aceptar = true then
                begin
                    FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
                    FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                    private_ultima_fecha_entrada := FieldByName('Fecha').AsString;

                    var_Serie  := FieldByName('Serie_Albaran').AsString;
                    var_Numero := FieldByName('Numero_Albaran').AsString;

                    Presentar_Datos_Totales(0);

                    UTI_RGTRO_Grabar_Antes( 'albaranes_compras', SQLQuery_Alb );

                    form_albaranes_compras_001.Free;

                    if (FieldByName('Serie_Albaran').AsString = var_Serie)   and
                       (FieldByName('Numero_Albaran').AsString = var_Numero) then
                    begin
                        Editar_Registro(true);
                    end;
                end else begin
                    Cancel;
                    form_albaranes_compras_001.Free;
                end;
            end;
        end;

        var_msg.Free;
    end;
end;

procedure Tform_albaranes_compras_000.Editar_Registro(param_Introducimos_Linea_Detalle_SN : Boolean);
var var_msg : TStrings;
    var_id  : ShortString;
begin
    with SQLQuery_Alb do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
        begin
            var_id := FieldByName('id').AsString;

            if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
            begin
                if UTI_RGTRO_isLock( 'albaranes_compras',
                                     var_id,
                                     true ) = true then
                begin
                    Exit;
                end else begin
                    if UTI_RGTRO_Lock( 'albaranes_compras',
                                       var_id ) = true then
                         Edit
                    else Exit;
                end;

                // ********************************************************************************* //
                // ** Continuamos                                                                 ** //
                // ********************************************************************************* //
                Application.CreateForm(Tform_albaranes_compras_001, form_albaranes_compras_001);

                form_albaranes_compras_001.RadioGroup_Bajas.ItemIndex := RadioGroup_Bajas.ItemIndex;
                form_albaranes_compras_001.public_Menu_Worked         := public_Menu_Worked;

                if public_Solo_Ver = true then
                begin
                    form_albaranes_compras_001.public_Solo_Ver := true;
                end;

                form_albaranes_compras_001.para_Empezar;

                if param_Introducimos_Linea_Detalle_SN = true then
                begin
                    form_albaranes_compras_001.Insertar_Registro_Detalles;
                end;

                form_albaranes_compras_001.ShowModal;
                if form_albaranes_compras_001.public_Pulso_Aceptar = true then
                begin
                    if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( SQLQuery_Alb ) = true then
                    begin
                        FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                        FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                        Presentar_Datos_Totales(0);

                        UTI_RGTRO_Grabar_Antes( 'albaranes_compras', SQLQuery_Alb );
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

                form_albaranes_compras_001.Free;

                UTI_RGTRO_UnLock( 'albaranes_compras', var_id );
            end;
        end else begin
            var_msg.Add(rs_no_Hay_Rgtros);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        end;
    end;

    var_msg.Free;
end;

procedure Tform_albaranes_compras_000.Borrar_Registro;
var var_msg : TStrings;
begin
    with SQLQuery_Alb do
    begin
        var_msg := TStringList.Create;

        // ***************************************************************************************** //
        // ** Si el albarán está facturado no podemos hacer nada con él                           ** //
        // ***************************************************************************************** //
        if not FieldByName('Serie_Factura').IsNull then
        begin
            var_msg.Add( rs_Borrar_Registro_1 +
                         Trim(FieldByName('Serie_Factura').AsString) +
                         '/' +
                         Trim(FieldByName('Numero_Factura').AsString) +
                         '.' );
        end;

        // ***************************************************************************************** //
        // ** Si el albarán ya estaba borrado (lo vamos a dar de alta) y pertenecía al algún pedi-** //
        // ** do no le vamos a permitir darlo de alta porque se rompería la manera de ligar los   ** //
        // ** pedidos con los albaranes                                                           ** //
        // ***************************************************************************************** //
        if not FieldByName('Del_WHEN').IsNull then
        begin
            if Trim(FieldByName('Serie_Pedido').AsString) <> '' then
            begin
                var_msg.Add( rs_Borrar_Registro_2 +
                             Trim(FieldByName('Serie_Pedido').AsString) +
                             '/' +
                             Trim(FieldByName('Numero_Pedido').AsString) +
                             rs_Borrar_Registro_3 );
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
        if UTI_RGTRO_isLock( 'albaranes_compras',
                             Trim(SQLQuery_Alb.FieldByName('id').AsString),
                             true ) = true then
        begin
            // ************************************************************************************* //
            // ** Registro bloqueado, no podemos hacer nada con él                                ** //
            // ************************************************************************************* //
            Exit;
        end else begin
            Borrar_Registro_2;
        end;
    end;
end;

procedure Tform_albaranes_compras_000.Borrar_Registro_2;
var var_Serie_Albaran  : String;
    var_Numero_Albaran : String;
begin
    with SQLQuery_Alb do
    begin
        // ***************************************************************************************** //
        // ** Continuamos con el borrado                                                          ** //
        // ***************************************************************************************** //
        if UTI_USR_Permiso_SN(public_Menu_Worked, 'B', True) = True then
        begin
            private_Estaba_Borrado_el_Alb := not FieldByName('Del_WHEN').IsNull;

            // ************************************************************************************* //
            // ** Antes de borrar el albarán su cabecera (no se borran las líneas de detalle),    ** //
            // ** comenzamos a actualizar el stock de cada una de las líneas de detalle (supo-    ** //
            // ** niendo que fueran artículos donde se controla su stock). Es digno de mencionar  ** //
            // ** que puede ser un alta de albarán o una baja, por lo que el stock de cada artícu-** //
            // ** lo puede aumentar o disminuir.                                                  ** //
            // ** Sólo si se consigue actualizar todo el stock pues se borrará o se dará de alta  ** //
            // ** la cabecera del albarán                                                         ** //
            // ************************************************************************************* //
            var_Serie_Albaran  := FieldByName('Serie_Albaran').AsString;
            var_Numero_Albaran := FieldByName('Numero_Albaran').AsString;

            if UTI_RGTRO_Borrar_Cabecera_y_Detalle( 'id_albaranes',
                                                    'albaranes_compras',
                                                    'albaranes_compras_detalles',
                                                    SQLQuery_Alb,
                                                    SQLQuery_Alb_Detalles,
                                                    public_Solo_Ver,
                                                    public_Menu_Worked ) = true then
            begin
                if private_Estaba_Borrado_el_Alb = false then
                begin
                    // ************************************************************************* //
                    // ** Como el albarán fué borrado se borra toda marca de venir de pedidos ** //
                    // ************************************************************************* //
                    Borrar_en_Pedidos_el_Albaran( var_Serie_Albaran, var_Numero_Albaran );
                end;
            end;
        end;
    end;
end;

procedure Tform_albaranes_compras_000.Borrar_en_Pedidos_el_Albaran( param_Serie_Albaran,
                                                                    param_Numero_Albaran : String );
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
    var_msg            : TStrings;
    var_id_Pedidos     : ShortString;
begin
    var_id_Pedidos := Traer_id_Pedidos_Antes_de_Borrar_en_Pedidos_el_Albaran( param_Serie_Albaran,
                                                                              param_Numero_Albaran );
    if Trim(var_id_Pedidos) <> '' then
    begin
        Try
            // ************************************************************************************* //
            // ** Creamos la Transaccion y la conexión con el motor BD, y la abrimos              ** //
            // ************************************************************************************* //
            var_SQLTransaction := TSQLTransaction.Create(nil);
            var_SQLConnector   := TSQLConnector.Create(nil);

            if UTI_CN_Connector_Open( var_SQLTransaction,
                                      var_SQLConnector ) = False then UTI_GEN_Salir;

            // ************************************************************************************* //
            // ** Creamos la SQL Según el motor de BD                                             ** //
            // ************************************************************************************* //
            var_SQL := TStringList.Create;

            var_SQL.Add( 'UPDATE pedidos_compras_detalles' );
            var_SQL.Add(    'SET Serie_Albaran = NULL,' );
            var_SQL.Add(        'Numero_Albaran = NULL' );
            var_SQL.Add(  'WHERE Serie_Albaran = ' + UTI_GEN_Comillas(Trim(param_Serie_Albaran)) );
            var_SQL.Add(    'AND Numero_Albaran = ' + Trim(param_Numero_Albaran) );

            // ************************************************************************************* //
            // ** Ejecutamos la SQL                                                               ** //
            // ************************************************************************************* //
            var_SQLQuery          := TSQLQuery.Create(nil);

            var_SQLQuery.Database := var_SQLConnector;
            var_SQLQuery.SQL.Text := var_SQL.Text;

            var_SQLQuery.Name     := 'SQLQuery_Borrar_en_Pedidos_el_Albaran';

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

            UTI_COMPRAS_Cerrar_SN( 'pedidos_compras',
                                   'N' { S o N },
                                    var_id_Pedidos,
                                    param_Serie_Albaran,
                                    param_Numero_Albaran );
        Except
            on error : Exception do
            begin
                var_msg := TStringList.Create;
                var_msg.Add( rs_Del_en_Pedidos_Albaran +
                             Trim(param_Serie_Albaran) + '/' + Trim(param_Numero_Albaran) + '.' );

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

function Tform_albaranes_compras_000.Traer_id_Pedidos_Antes_de_Borrar_en_Pedidos_el_Albaran( param_Serie_Albaran,
                                                                                             param_Numero_Albaran : String ) : ShortString;
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

        var_SQL.Add( 'SELECT id_pedidos' );
        var_SQL.Add(   'FROM pedidos_compras_detalles' );
        var_SQL.Add(  'WHERE Serie_Albaran = ' + UTI_GEN_Comillas(Trim(param_Serie_Albaran)) );
        var_SQL.Add(    'AND Numero_Albaran = ' + Trim(param_Numero_Albaran) );

        // ***************************************************************************************** //
        // ** Abrimos la tabla                                                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery      := TSQLQuery.Create(nil);
        var_SQLQuery.Name := 'SQLQuery_Traer_id_Pedidos_Antes_de_Borrar_en_Pedidos_el_Albaran';

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
            Result := Trim(var_SQLQuery.FieldByName('id_pedidos').AsString);
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
            UTI_GEN_Error_Log( rs_Traer_id_Pedidos +
                               Trim(param_Serie_Albaran) + '/' +
                               Trim(param_Numero_Albaran) + '.',
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

procedure Tform_albaranes_compras_000.SQLQuery_Alb_DetallesBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Alb_Detalles );
end;

procedure Tform_albaranes_compras_000.BitBtn_FacturarClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;

    // ********************************************************************************************* //
    // ** Si el pedido está borrado, no permitimos hacer nada con el.                             ** //
    // ********************************************************************************************* //
    if not SQLQuery_Alb.FieldByName('Del_WHEN').IsNull then
    begin
        var_msg.Add( '* Es un albarán borrado, no se puede modificar nada de el. ' +
                     'Si desea modificarlo, primero hay que darlo de alta anteriormente.' );
    end;

    // ********************************************************************************************* //
    // ** Si el pedido está facturado no podemos hacer ninguna factura de él                      ** //
    // ********************************************************************************************* //
    if not SQLQuery_Alb.FieldByName('Numero_Factura').IsNull then
    begin
        var_msg.Add( '* Albarán ya FACTURADO.');
    end;

    // ********************************************************************************************* //
    // ** Si no tiene líneas de detalle que vamos a crear como albarán                            ** //
    // ********************************************************************************************* //
    if SQLQuery_Alb.RecordCount = 0 then
    begin
        var_msg.Add( '* No hay albarán seleccionado.');
    end;

    // ********************************************************************************************* //
    // ** Si no tiene líneas de detalle que vamos a crear como albarán                            ** //
    // ********************************************************************************************* //
    if SQLQuery_Alb_Detalles.RecordCount = 0 then
    begin
        var_msg.Add( '* No hay líneas/detalle.');
    end;

    if Trim(var_msg.Text) = '' then
    begin
        // ***************************************************************************************** //
        // ** Continuamos con la creación del nuevo albarán con las líneas que no se convirtieron ** //
        // ** todavia en albarán                                                                  ** //
        // ***************************************************************************************** //
        Convertir_Integro_en_Ftra(var_msg);
    end else begin
        UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
    end;

    var_msg.Free;
end;

procedure Tform_albaranes_compras_000.Convertir_Integro_en_Ftra(param_msg : TStrings);
var var_msg          : TStrings;
    var_id_almacenes : ShortString;
begin
    // ********************************************************************************************* //
    // ** Si el usuario no tiene permisos para modificar pedidos ni permiso para crear albaranes  ** //
    // ** pues no continuamos                                                                     ** //
    // ********************************************************************************************* //
    if (UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True) and  // ** Comprueba si tiene   ** //
                                                                       // ** permiso de modificar ** //
                                                                       // ** en albaranes         ** //
                                                                       // ************************** //
       (UTI_USR_Permiso_SN(650, 'A', True) = True)                then // ** Comprueba si tiene   ** //
                                                                       // ** permiso de insertar  ** //
                                                                       // ** en facturas          ** //
                                                                       // ************************** //
    begin
        // ***************************************************************************************** //
        // ** Abriremos el proceso de facturar eligiendo albaranes, pero iremos a la pantalla de  ** //
        // ** elegirlos filtrando por el proveedor, por la empresa y por el almacén. Asi permiti- ** //
        // ** remos al usuario poder facturar varios albaranes (si los elige).                    ** //
        // ***************************************************************************************** //
        Application.CreateForm(Tform_facturas_compras_000, form_facturas_compras_000);

        form_facturas_compras_000.public_Solo_Ver    := false;
        form_facturas_compras_000.public_Elegimos    := true;
        form_facturas_compras_000.public_Menu_Worked := 650;
        form_facturas_compras_000.para_Empezar;

        with SQLQuery_Alb do
        begin
            // ************************************************************************************* //
            // ** Propongo que sea una factura                                                    ** //
            // ************************************************************************************* //
            form_facturas_compras_000.public_que_va_a_ser := 'F';

            // ************************************************************************************* //
            // ** Llamo al proceso de crear facturas por medio de albaranes                       ** //
            // ************************************************************************************* //
            var_msg          := TStringList.Create;

            var_id_almacenes := '';

            form_Menu.Traer_Configuracion_APP;
            if UpperCase(Trim(form_menu.public_User_Configuracion.Albaranes_Obligar_Almacen_SN)) = 'S' then
            begin
                var_id_almacenes := FieldByName('id_almacenes').AsString;
            end;

            form_facturas_compras_000.Insertar_Registro_1( var_msg,
                                                           FieldByName('id_proveedores').AsString,
                                                           FieldByName('OT_descripcion_proveedor').AsString,
                                                           FieldByName('id_empresas').AsString,
                                                           FieldByName('OT_descripcion_empresa').AsString,
                                                           var_id_almacenes,
                                                           FieldByName('OT_descripcion_almacen').AsString,
                                                           FieldByName('Fecha').AsString,
                                                           FieldByName('Serie_Albaran').AsString,
                                                           FieldByName('Numero_Albaran').AsString );
            var_msg.Free;
            form_facturas_compras_000.Free;
        end;

        // ***************************************************************************************** //
        // ** Refrescamos otra vez todos los albaranes por si se ha facturado alguno de ellos     ** //
        // ***************************************************************************************** //
        Refrescar_Registros;
    end;
end;

procedure Tform_albaranes_compras_000.BitBtn_Ver_FacturaClick(Sender: TObject);
var var_msg : TStrings;
begin
    with SQLQuery_Alb do
    begin
        if RecordCount = 0 then
        begin
            var_msg := TStringList.Create;
            var_msg.Add('* No hay registros de albaranes filtrados.');
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;

            Exit;
        end;

        if not FieldByName('Del_WHEN').IsNull then
        begin
            var_msg := TStringList.Create;
            var_msg.Add('* Es un albarán borrado.');
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;

            Exit;
        end;

        if Trim(FieldByName('Numero_Factura').AsString) = '' then
        begin
            var_msg := TStringList.Create;
            var_msg.Add('* Este albarán no pertenece a ninguna factura.');
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;

            Exit;
        end;

        if UTI_GEN_Form_Abierto_Ya('form_facturas_compras_000') = false then
        begin
            Application.CreateForm(Tform_facturas_compras_000, form_facturas_compras_000);

            form_facturas_compras_000.public_Solo_Ver    := false;
            form_facturas_compras_000.public_Elegimos    := true;
            form_facturas_compras_000.public_Menu_Worked := 650;

            // ************************************************************************************* //
            // ** Le pasamos la factura a encontrar                                               ** //
            // ************************************************************************************* //
            form_facturas_compras_000.Edit_Factura_Serie_Ntra_Referencia.Text  := FieldByName('Serie_Factura').AsString;
            form_facturas_compras_000.Edit_Factura_Numero_Ntra_Referencia.Text := FieldByName('Numero_Factura').AsString;

            // ************************************************************************************* //
            // ** Filtramos su búsqueda                                                           ** //
            // ************************************************************************************* //
            form_facturas_compras_000.para_Empezar;

            if form_facturas_compras_000.SQLQuery_Ftra.RecordCount = 1 then
            begin
                // form_facturas_compras_000.Editar_Registro;
                form_facturas_compras_000.ShowModal;
            end else begin
                if form_facturas_compras_000.SQLQuery_Ftra.RecordCount = 0 then
                begin
                    var_msg := TStringList.Create;
                    var_msg.Add('Esta factura no existe.');
                    UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
                    var_msg.Free;
                end else begin
                    var_msg := TStringList.Create;
                    var_msg.Add( 'Existe más de una factura ' +
                                 FieldByName('Serie_Factura').AsString + ' - ' +
                                 FieldByName('Numero_Factura').AsString );
                    UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
                    var_msg.Free;

                    form_facturas_compras_000.ShowModal;
                end;
            end;

            form_facturas_compras_000.Free;

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

procedure Tform_albaranes_compras_000.BitBtn_Ver_PedidoClick(Sender: TObject);
var var_msg : TStrings;
begin
    with SQLQuery_Alb do
    begin
        if RecordCount = 0 then
        begin
            var_msg := TStringList.Create;
            var_msg.Add('* No hay registros de albaranes filtrados.');
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;

            Exit;
        end;

        if not FieldByName('Del_WHEN').IsNull then
        begin
            var_msg := TStringList.Create;
            var_msg.Add('* Es un albarán borrado.');
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;

            Exit;
        end;

        if Trim(FieldByName('Numero_Pedido').AsString) = '' then
        begin
            var_msg := TStringList.Create;
            var_msg.Add('* Este albarán no pertenece a ningun pedido.');
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
            // ** Le pasamos la factura a encontrar                                               ** //
            // ************************************************************************************* //
            form_pedidos_compras_000.Edit_Pdo_Serie_Ntra_Referencia.Text  := FieldByName('Serie_Pedido').AsString;
            form_pedidos_compras_000.Edit_Pdo_Numero_Ntra_Referencia.Text := FieldByName('Numero_Pedido').AsString;

            // ************************************************************************************* //
            // ** Filtramos su búsqueda                                                           ** //
            // ************************************************************************************* //
            form_pedidos_compras_000.para_Empezar;

            if form_pedidos_compras_000.SQLQuery_Pdo.RecordCount = 1 then
            begin
                form_pedidos_compras_000.Editar_Registro(false);
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
            Refrescar_Registros;
        end else begin
            var_msg := TStringList.Create;
            var_msg.Add(rs_Modulo_Abierto);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;
        end;
    end;
end;

procedure Tform_albaranes_compras_000.Refrescar_Registros_Impuestos;
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
    if SQLQuery_Alb.State <> dsEdit then Exit;

    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_id := '';

    with SQLQuery_Alb_Impuestos do
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
    var_SQL_ADD.Add( 'aci.id_albaranes = ' + SQLQuery_Alb.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_ver_Bajas := RadioGroup_Bajas.ItemIndex;
    if UTI_GEN_Form_Abierto_Ya('form_albaranes_compras_001') = true then
    begin
        var_ver_Bajas := form_albaranes_compras_001.RadioGroup_Bajas.ItemIndex;
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
            SQLQuery_Alb_Impuestos.Last;
        end else begin
            // ************************************************************************************* //
            // ** Estabamos en una edición, así que ya conocíamos la id del registro. Por lo que  ** //
            // ** hago el locate por esta id                                                      ** //
            // ************************************************************************************* //
            SQLQuery_Alb_Impuestos.Locate('id', StrToInt64(var_id), []);
        end;

    end;
    var_SQL_ADD.Free;
end;

function Tform_albaranes_compras_000.Filtrar_Lineas_Impuestos( param_ver_bajas : ShortInt;
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
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Alb_Impuestos,
                                                          'albaranes_compras_impuestos',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Alb_Impuestos,
                                                          'albaranes_compras_impuestos',
                                                          'i' ),

                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_Albaranes_Compras.SQLTransaction_Alb_Imptos,
                            DataModule_Albaranes_Compras.SQLConnector_Alb_Imptos,
                            SQLQuery_Alb_Impuestos,

                            // name_tabla,
                            'aci',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT aci.*,' + ' ' +

                                   'impto.descripcion AS OT_descripcion_impuesto,' + ' ' +
                                   'impto.Tanto_Por_Ciento AS OT_Tanto_Por_Ciento' + ' ' +

                            'FROM albaranes_compras_impuestos AS aci' + ' ' +

                            'LEFT JOIN impuestos AS impto' + ' ' +
                            'ON aci.id_impuestos = impto.id',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_a_Filtrar_Plus.Free;
end;

procedure Tform_albaranes_compras_000.Filtrar_tablas_ligadas;
var
  var_Lineas_Filtro  : TStrings;
  var_Lineas_OrderBy : TStrings;
  var_SQL_ADD        : TStrings;
begin
    var_SQL_ADD := TStringList.Create;

    if SQLQuery_Alb.RecordCount = 0 then Exit;

    if SQLQuery_Alb.State = dsInsert then
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
    var_SQL_ADD.Add( 'acd.id_albaranes = ' + SQLQuery_Alb.FieldByName('id').AsString );
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
    var_SQL_ADD.Add( 'aci.id_albaranes = ' + SQLQuery_Alb.FieldByName('id').AsString );
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

procedure Tform_albaranes_compras_000.para_Empezar;
begin
    UTI_GEN_Traer_Trimestre( DateTimePicker_Desde_Ntra_Referencia,
                             DateTimePicker_Hasta_Ntra_Referencia );

    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    if UTI_GEN_Form_Abierto_Ya('DataModule_Albaranes_Compras') = False then
    begin
        DataModule_Albaranes_Compras := TDataModule_Albaranes_Compras.Create(Application);
    end;

    // ********************************************************************************************* //
    // ** Preparamos los diferentes tipos de orden preconfigurados                                ** //
    // ********************************************************************************************* //
    // ** CABECERA                                                                                ** //
    // ********************************************************************************************* //
    SetLength(private_Order_By, 5);

    private_Order_By[0].Titulo       := rs_para_Empezar_1;
    private_Order_By[0].Memo_OrderBy := 'ac.Fecha ASC, ac.Serie_Albaran ASC, ac.Numero_Albaran ASC';

    private_Order_By[1].Titulo       := rs_para_Empezar_2; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[1].Memo_OrderBy := 'ac.Serie_Albaran ASC, ac.Numero_Albaran ASC';

    private_Order_By[2].Titulo       := rs_para_Empezar_3;
    private_Order_By[2].Memo_OrderBy := 'ac.id_empresas ASC, ac.Fecha ASC, ac.Serie_Albaran ASC, ac.Numero_Albaran ASC';

    private_Order_By[3].Titulo       := rs_para_Empezar_4_1;
    private_Order_By[3].Memo_OrderBy := 'ac.id_proveedores ASC, ac.Fecha ASC, ac.Serie_Albaran ASC, ac.Numero_Albaran ASC';

    private_Order_By[4].Titulo       := rs_para_Empezar_4_2;
    private_Order_By[4].Memo_OrderBy := 'ac.id_proveedores ASC, ac.Fecha_Albaran_Proveedor ASC, ac.Numero_Albaran_Proveedor ASC';

    Memo_OrderBy.Lines.Text          := private_Order_By[1].Memo_OrderBy;

    UTI_TB_Rellenar_ComboBox_Orden( true,
                                    ComboBox_Filtros,
                                    private_Order_By,
                                    1 );

    // ********************************************************************************************* //
    // ** LINEAS DETALLE                                                                          ** //
    // ********************************************************************************************* //
    SetLength(private_Order_By_Lineas_Detalles, 1);

    private_Order_By_Lineas_Detalles[0].Titulo       := rs_para_Empezar_5; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_Lineas_Detalles[0].Memo_OrderBy := 'acd.id_albaranes ASC, acd.id ASC';

    // ********************************************************************************************* //
    // ** IMPUESTOS                                                                               ** //
    // ********************************************************************************************* //
    SetLength(private_Order_By_Lineas_Impuestos, 1);

    private_Order_By_Lineas_Impuestos[0].Titulo       := 'Por id del albarán'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_Lineas_Impuestos[0].Memo_OrderBy := 'aci.id_albaranes ASC, aci.id_impuestos ASC';

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

function Tform_albaranes_compras_000.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
var
  var_a_Filtrar : TStrings;
  var_SQL_ADD  : TStrings;
begin
    var_SQL_ADD   := TStringList.Create;
    var_a_Filtrar := TStringList.Create;
    var_a_Filtrar.Clear;

    // ********************************************************************************************* //
    // ** AHORA PONDREMOS EL RESTO DE LOS FILTROS QUE NO SON GENERALES                            ** //
    // ********************************************************************************************* //
    // ** Primero buscaremos en la serie                                                          ** //
    // ********************************************************************************************* //
    if Trim(Edit_Albaran_Serie_Ntra_Referencia.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'ac.Serie_Albaran = ' + UTI_GEN_Comillas(Trim(Edit_Albaran_Serie_Ntra_Referencia.Text)) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos en el NUMERO                                                           ** //
    // ********************************************************************************************* //
    if Trim(Edit_Albaran_Numero_Ntra_Referencia.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'ac.Numero_Albaran = ' + UTI_GEN_Comillas(Trim(Edit_Albaran_Numero_Ntra_Referencia.Text)) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la FECHA                                                           ** //
    // ********************************************************************************************* //
    if (not DateTimePicker_Hasta_Ntra_Referencia.DateIsNull) and
       (not DateTimePicker_Desde_Ntra_Referencia.DateIsNull) then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'ac.Fecha <= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Hasta_Ntra_Referencia.Date, false) + ' 23:59:59' ) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'ac.Fecha >= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Desde_Ntra_Referencia.Date, false) + ' 00:00:00' ) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos en el NUMERO de factura del proveedor                                  ** //
    // ********************************************************************************************* //
    if Trim(Edit_Albaran_Numero_Su_Referencia.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'ac.Numero_Albaran_Proveedor LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Albaran_Numero_Su_Referencia.Text) + '%') );
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
        var_SQL_ADD.Add( 'ac.Fecha_Albaran_Proveedor <= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Hasta_Su_Referencia.Date, false) + ' 23:59:59' ) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'ac.Fecha_Albaran_Proveedor >= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Desde_Su_Referencia.Date, false) + ' 00:00:00' ) );
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
        var_SQL_ADD.Add( 'ac.id_Almacenes = ' + Trim(Edit_id_Almacenes.Text) );
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
        var_SQL_ADD.Add( 'ac.id_empresas = ' + Trim(Edit_id_Empresas.Text) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Primero buscaremos en la serie del pedido                                               ** //
    // ********************************************************************************************* //
    if Trim(Edit_Pedido_Serie.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'ac.Serie_Pedido = ' + UTI_GEN_Comillas(Trim(Edit_Pedido_Serie.Text)) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos en el número del pedido                                                ** //
    // ********************************************************************************************* //
    if Trim(Edit_Pedido_Numero.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'ac.Numero_Pedido = ' + UTI_GEN_Comillas(Trim(Edit_Pedido_Numero.Text)) );
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
        var_SQL_ADD.Add( 'ac.id_formas_pago = ' + Trim(Edit_id_Forma_Pago.Text) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la id del proveedor                                                ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Proveedores.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'ac.id_proveedores = ' + Trim(Edit_id_Proveedores.Text) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Primero buscaremos en la serie del pedido                                               ** //
    // ********************************************************************************************* //
    if Trim(Edit_Factura_Serie.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'ac.Serie_Factura = ' + UTI_GEN_Comillas(Trim(Edit_Factura_Serie.Text)) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos en el número del pedido                                                ** //
    // ********************************************************************************************* //
    if Trim(Edit_Factura_Numero.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'ac.Numero_Factura = ' + UTI_GEN_Comillas(Trim(Edit_Factura_Numero.Text)) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora filtraremos por el estado del albaran (sólo albaranes, solo facturas o todos)     ** //
    // ********************************************************************************************* //
    if RadioButton_Facturados_Solo.Checked = true then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'NOT ac.Numero_Factura IS NULL' );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    if RadioButton_Albaranes_Solo.Checked = true then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'ac.Numero_Factura IS NULL' );
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
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Alb,
                                                            'albaranes_compras',
                                                            'u' ),

                              // Insert_SQL,
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Alb,
                                                            'albaranes_compras',
                                                            'i' ),

                              // var_ctdad_Rgtros,
                              -1,

                              DataModule_Albaranes_Compras.SQLTransaction_Alb,
                              DataModule_Albaranes_Compras.SQLConnector_Alb,
                              SQLQuery_Alb,

                              // name_tabla,
                              'ac',

                              RadioGroup_Bajas.ItemIndex,

                              // SELECT_SQL,
                              'SELECT ac.*,' + ' ' +

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

                              'FROM albaranes_compras AS ac' + ' ' +

                              'LEFT JOIN proveedores AS trp' + ' ' +
                              'ON ac.agencias_transporte_id_proveedores = trp.id' + ' ' +

                              'LEFT JOIN poblaciones AS env_pb' + ' ' +
                              'ON ac.Envio_id_poblaciones = env_pb.id' + ' ' +

                              'LEFT JOIN provincias AS env_pr' + ' ' +
                              'ON ac.Envio_id_provincias = env_pr.id' + ' ' +

                              'LEFT JOIN paises AS env_ps' + ' ' +
                              'ON ac.Envio_id_paises = env_ps.id' + ' ' +

                              'LEFT JOIN poblaciones AS pb' + ' ' +
                              'ON ac.id_poblaciones = pb.id' + ' ' +

                              'LEFT JOIN provincias AS pr' + ' ' +
                              'ON ac.id_provincias = pr.id' + ' ' +

                              'LEFT JOIN paises AS ps' + ' ' +
                              'ON ac.id_paises = ps.id' + ' ' +

                              'LEFT JOIN poblaciones AS ct_pb' + ' ' +
                              'ON ac.Cta_Bco_id_poblaciones = ct_pb.id' + ' ' +

                              'LEFT JOIN provincias AS ct_pr' + ' ' +
                              'ON ac.Cta_Bco_id_provincias = ct_pr.id' + ' ' +

                              'LEFT JOIN paises AS ct_ps' + ' ' +
                              'ON ac.Cta_Bco_id_paises = ct_ps.id' + ' ' +

                              'LEFT JOIN almacenes AS alm' + ' ' +
                              'ON ac.id_almacenes = alm.id' + ' ' +

                              'LEFT JOIN empresas AS e' + ' ' +
                              'ON ac.id_empresas = e.id' + ' ' +

                              'LEFT JOIN proveedores AS p' + ' ' +
                              'ON ac.id_proveedores = p.id' + ' ' +

                              'LEFT JOIN formas_pago AS fp' + ' ' +
                              'ON ac.id_formas_pago = fp.id' + ' ',

                              Memo_Filtros.Lines,
                              Memo_OrderBy.Lines,
                              var_a_Filtrar,

                              param_Cambiamos_Filtro,
                              false,   // param_ver_SQL_despues_Abrir : Boolean;
                              true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

    var_a_Filtrar.Free;

    Label_Ctdad_Rgtros.Caption := IntToStr(SQLQuery_Alb.RecordCount);

    //Filtrar_tablas_ligadas;

    if SQLQuery_Alb.RecordCount = 0 then
    begin
        Cerramos_Tablas_Ligadas;
    end;

    Sumar_Totales;

    Filtrar_Impuestos_Totales;
    var_SQL_ADD.Free;
end;

procedure Tform_albaranes_compras_000.Sumar_Totales;
var var_Total_Principal : Extended;
begin
    var_Total_Principal := 0;

    With SQLQuery_Alb do
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

procedure Tform_albaranes_compras_000.Presentar_Datos_Totales( param_Actualizar_Totales : Byte );
var var_Calculo_Totales_Cabecera : TCalculo_Totales_por_Cabecera;
begin
    var_Calculo_Totales_Cabecera := UTI_LINEAS_poner_totales( 'albaranes_compras',
                                                              SQLQuery_Alb.FieldByName('id').AsString );
    Refrescar_Registros_Impuestos;

    if param_Actualizar_Totales = 1 then
    begin
        with form_albaranes_compras_001 do
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

procedure Tform_albaranes_compras_000.Filtrar_Impuestos_Totales;
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
    if Trim(Edit_Albaran_Serie_Ntra_Referencia.Text) <> '' then
    begin
        var_a_Filtrar.Add( 'AND ac.Serie_Albaran = ' +
                           UTI_GEN_Comillas(Trim(Edit_Albaran_Serie_Ntra_Referencia.Text)) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos en el NUMERO                                                           ** //
    // ********************************************************************************************* //
    if Trim(Edit_Albaran_Numero_Ntra_Referencia.Text) <> '' then
    begin
        var_a_Filtrar.Add( 'AND ac.Numero_Albaran = ' +
                           UTI_GEN_Comillas(Trim(Edit_Albaran_Numero_Ntra_Referencia.Text)) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la FECHA                                                           ** //
    // ********************************************************************************************* //
    if (not DateTimePicker_Hasta_Ntra_Referencia.DateIsNull) and
       (not DateTimePicker_Desde_Ntra_Referencia.DateIsNull) then
    begin
        var_a_Filtrar.Add( 'AND ac.Fecha <= ' +
                           UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Hasta_Ntra_Referencia.Date, false) +
                                             ' 23:59:59' ) );
        var_a_Filtrar.Add( 'AND ac.Fecha >= ' +
                           UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Desde_Ntra_Referencia.Date, false) +
                                             ' 00:00:00' ) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos en el NUMERO de albaran del proveedor                                  ** //
    // ********************************************************************************************* //
    if Trim(Edit_Albaran_Numero_Su_Referencia.Text) <> '' then
    begin
        var_a_Filtrar.Add( 'AND ac.Numero_Albaran_Proveedor LIKE ' +
                           UTI_GEN_Comillas('%' + Trim(Edit_Albaran_Numero_Su_Referencia.Text) + '%')  );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la FECHA del proveedor                                             ** //
    // ********************************************************************************************* //
    if (not DateTimePicker_Hasta_Su_Referencia.DateIsNull) and
       (not DateTimePicker_Desde_Su_Referencia.DateIsNull) then
    begin
        var_a_Filtrar.Add( 'AND ac.Fecha_Albaran_Proveedor <= ' +
                           UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Hasta_Su_Referencia.Date, false) +
                                                  ' 23:59:59' ) );
        var_a_Filtrar.Add( 'AND ac.Fecha_Albaran_Proveedor >= ' +
                           UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Desde_Su_Referencia.Date, false) +
                                                  ' 00:00:00' ) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por el almacén                                                         ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Almacenes.Text) <> '' then
    begin
        var_a_Filtrar.Add( 'AND ac.id_Almacenes = ' + Trim(Edit_id_Almacenes.Text) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la empresa                                                         ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Empresas.Text) <> '' then
    begin
        var_a_Filtrar.Add( 'AND ac.id_empresas = ' + Trim(Edit_id_Empresas.Text) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la forma de pago                                                   ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Forma_Pago.Text) <> '' then
    begin
        var_a_Filtrar.Add( 'AND ac.id_formas_pago = ' + Trim(Edit_id_Forma_Pago.Text) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la id del proveedor                                                ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Proveedores.Text) <> '' then
    begin
        var_a_Filtrar.Add( 'AND ac.id_proveedores = ' + Trim(Edit_id_Proveedores.Text) );
    end;

    // ********************************************************************************************* //
    // ** Primero buscaremos en la serie del pedido                                               ** //
    // ********************************************************************************************* //
    if Trim(Edit_Pedido_Serie.Text) <> '' then
    begin
        var_a_Filtrar.Add( 'AND ac.Serie_Pedido = ' + UTI_GEN_Comillas(Trim(Edit_Pedido_Serie.Text)) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos en el número del pedido                                                ** //
    // ********************************************************************************************* //
    if Trim(Edit_Pedido_Numero.Text) <> '' then
    begin
        var_a_Filtrar.Add( 'AND ac.Numero_Pedido = ' + UTI_GEN_Comillas(Trim(Edit_Pedido_Numero.Text)) );
    end;

    // ********************************************************************************************* //
    // ** Primero buscaremos en la serie de la factura                                            ** //
    // ********************************************************************************************* //
    if Trim(Edit_Factura_Serie.Text) <> '' then
    begin
        var_a_Filtrar.Add( 'AND ac.Serie_Factura = ' + UTI_GEN_Comillas(Trim(Edit_Factura_Serie.Text)) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos en el número de la factura                                             ** //
    // ********************************************************************************************* //
    if Trim(Edit_Factura_Numero.Text) <> '' then
    begin
        var_a_Filtrar.Add( 'AND ac.Numero_Factura = ' + UTI_GEN_Comillas(Trim(Edit_Factura_Numero.Text)) );
    end;


    // ********************************************************************************************* //
    // ** Ahora filtraremos por el estado del albaran (sólo albaranes, solo facturas o todos)     ** //
    // ********************************************************************************************* //
    if RadioButton_Facturados_Solo.Checked = true then
    begin
        var_a_Filtrar.Add( 'AND NOT ac.Numero_Factura IS NULL' );
    end;

    if RadioButton_Albaranes_Solo.Checked = true then
    begin
        var_a_Filtrar.Add( 'AND ac.Numero_Factura IS NULL' );
    end;

    { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
      y que por lo se debe de permitir modificarlos en ningún módulo }

    var_SQL := 'SELECT imp.descripcion AS OT_Descripcion_impto,' + ' ' +
                      'aci.id_impuestos,' + ' ' +
                      'SUM(aci.Base) AS Total_Base,' + ' ' +
                      'SUM(aci.Importe) AS Total_Cuota' + ' ' +

               'FROM albaranes_compras_impuestos AS aci' + ' ' +

               'LEFT JOIN impuestos AS imp' + ' ' +
               'ON aci.id_impuestos = imp.id' + ' ' +

               'RIGHT JOIN albaranes_compras AS ac' + ' ' +
               'ON aci.id_albaranes = ac.id' + ' ' +
                   Trim(var_a_Filtrar.Text) + ' ' +
                  'AND ac.Del_WHEN IS NULL' + ' ' +

              'WHERE aci.Del_WHEN IS NULL' + ' ' +
              'AND NOT imp.descripcion IS NULL' + ' ' +

              'GROUP BY aci.id_impuestos' + ' ' +
              'ORDER BY aci.id_albaranes, aci.id_impuestos;' + ' ';

    if UTI_TB_Query_Open( // Delete_SQL,
                          '',

                          // Update_SQL,
                          '',

                          // Insert_SQL,
                          '',

                          DataModule_Albaranes_Compras.SQLConnector_Imptos_Totales,
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

procedure Tform_albaranes_compras_000.SQLQuery_List_AlbCalcFields(
  DataSet: TDataSet);
begin
    with SQLQuery_List_Alb do
    begin
        if Trim(FieldByName('Serie_Albaran').AsString) <> '' then
        begin
            FieldByName('OT_el_Albaran').AsString := Trim(FieldByName('Serie_Albaran').AsString) +
                                                     '-' +
                                                     Trim(FieldByName('Numero_Albaran').AsString);
        end else begin
            FieldByName('OT_el_Albaran').AsString := Trim(FieldByName('Numero_Albaran').AsString);
        end;
    end;
end;

function Tform_albaranes_compras_000.Filtrar_Listado_Alb( param_ver_bajas : ShortInt;
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

                            DataModule_Albaranes_Compras.SQLTransaction_List_Alb,
                            DataModule_Albaranes_Compras.SQLConnector_List_Alb,
                            SQLQuery_List_Alb,

                            // name_tabla,
                            'ac',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT impto.descripcion AS OT_descripcion_impuesto,' + ' ' +
                                   'impto.Tanto_Por_Ciento AS OT_Tanto_Por_Ciento,' + ' ' +

                                   'aci.*,' + ' ' +
                                   'ac.*' + ' ' +

                            'FROM albaranes_compras_impuestos AS aci' + ' ' +

                            'RIGHT JOIN albaranes_compras as ac' + ' ' +
                            'ON ac.id = aci.id_albaranes' + ' ' +

                            'LEFT JOIN impuestos AS impto' + ' ' +
                            'ON aci.id_impuestos = impto.id',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_a_Filtrar_Plus.Free;
end;

procedure Tform_albaranes_compras_000.Boton_Elegir_PeriodoClick(Sender: TObject);
begin
    UTI_GEN_Traer_Trimestre( DateTimePicker_Desde_Ntra_Referencia,
                             DateTimePicker_Hasta_Ntra_Referencia );
end;

procedure Tform_albaranes_compras_000.BitBtn_ImprimirClick(Sender: TObject);
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
    if Trim(Edit_Albaran_Serie_Ntra_Referencia.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'ac.Serie_Albaran = ' + UTI_GEN_Comillas(Trim(Edit_Albaran_Serie_Ntra_Referencia.Text)) );
        UTI_TB_SQL_ADD( true,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos en el NUMERO                                                           ** //
    // ********************************************************************************************* //
    if Trim(Edit_Albaran_Numero_Ntra_Referencia.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'ac.Numero_Albaran = ' + UTI_GEN_Comillas(Trim(Edit_Albaran_Numero_Ntra_Referencia.Text)) );
        UTI_TB_SQL_ADD( false,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la FECHA                                                           ** //
    // ********************************************************************************************* //
    if (not DateTimePicker_Hasta_Ntra_Referencia.DateIsNull) and
       (not DateTimePicker_Desde_Ntra_Referencia.DateIsNull) then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'ac.Fecha <= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Hasta_Ntra_Referencia.Date, false) + ' 23:59:59' ) );
        UTI_TB_SQL_ADD( false,
                        var_Lineas_Filtro,
                        var_SQL_ADD );

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'ac.Fecha >= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Desde_Ntra_Referencia.Date, false) + ' 00:00:00' ) );
        UTI_TB_SQL_ADD( false,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos en el NUMERO de factura del proveedor                                  ** //
    // ********************************************************************************************* //
    if Trim(Edit_Albaran_Numero_Su_Referencia.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'ac.Numero_Albaran_Proveedor LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Albaran_Numero_Su_Referencia.Text) + '%') );
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
        var_SQL_ADD.Add( 'ac.Fecha_Albaran_Proveedor <= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Hasta_Su_Referencia.Date, false) + ' 23:59:59' ) );
        UTI_TB_SQL_ADD( false,
                        var_Lineas_Filtro,
                        var_SQL_ADD );

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'ac.Fecha_Albaran_Proveedor >= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Desde_Su_Referencia.Date, false) + ' 00:00:00' ) );
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
        var_SQL_ADD.Add( 'ac.id_Almacenes = ' + Trim(Edit_id_Almacenes.Text) );
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
        var_SQL_ADD.Add( 'ac.id_empresas = ' + Trim(Edit_id_Empresas.Text) );
        UTI_TB_SQL_ADD( false,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Primero buscaremos en la serie del pedido                                               ** //
    // ********************************************************************************************* //
    if Trim(Edit_Pedido_Serie.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'ac.Serie_Pedido = ' + UTI_GEN_Comillas(Trim(Edit_Pedido_Serie.Text)) );
        UTI_TB_SQL_ADD( false,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos en el número del pedido                                                ** //
    // ********************************************************************************************* //
    if Trim(Edit_Pedido_Numero.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'ac.Numero_Pedido = ' + UTI_GEN_Comillas(Trim(Edit_Pedido_Numero.Text)) );
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
        var_SQL_ADD.Add( 'ac.id_formas_pago = ' + Trim(Edit_id_Forma_Pago.Text) );
        UTI_TB_SQL_ADD( false,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la id del proveedor                                                ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Proveedores.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'ac.id_proveedores = ' + Trim(Edit_id_Proveedores.Text) );
        UTI_TB_SQL_ADD( false,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Primero buscaremos en la serie del pedido                                               ** //
    // ********************************************************************************************* //
    if Trim(Edit_Factura_Serie.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'ac.Serie_Factura = ' + UTI_GEN_Comillas(Trim(Edit_Factura_Serie.Text)) );
        UTI_TB_SQL_ADD( false,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos en el número del pedido                                                ** //
    // ********************************************************************************************* //
    if Trim(Edit_Factura_Numero.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'ac.Numero_Factura = ' + UTI_GEN_Comillas(Trim(Edit_Factura_Numero.Text)) );
        UTI_TB_SQL_ADD( false,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora filtraremos por el estado del albaran (sólo albaranes, solo facturas o todos)     ** //
    // ********************************************************************************************* //
    if RadioButton_Facturados_Solo.Checked = true then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'NOT ac.Numero_Factura IS NULL' );
        UTI_TB_SQL_ADD( false,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    if RadioButton_Albaranes_Solo.Checked = true then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'ac.Numero_Factura IS NULL' );
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
    Filtrar_Listado_Alb( 1, // RadioGroup_Bajas.ItemIndex,  // asi no se ven las bajas hasta que no lo pida el form de altas/modif de líneas
                         false,
                         var_Lineas_Filtro,
                         var_Lineas_OrderBy );

    if not SQLQuery_List_Alb.IsEmpty then
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

        if (Trim(Edit_Albaran_Serie_Ntra_Referencia.Text) <> '')  or
           (Trim(Edit_Albaran_Numero_Ntra_Referencia.Text) <> '') then
        begin
            var_Ordenado_por := var_Ordenado_por +
                                rs_BitBtn_ImprimirClick_2;

            if Trim(Edit_Albaran_Serie_Ntra_Referencia.Text) <> '' then
            begin
                var_Ordenado_por := var_Ordenado_por +
                                    Trim(Edit_Albaran_Serie_Ntra_Referencia.Text) + '-';
            end;

            if Trim(Edit_Albaran_Numero_Ntra_Referencia.Text) <> '' then
            begin
                var_Ordenado_por := var_Ordenado_por +
                                    Trim(Edit_Albaran_Numero_Ntra_Referencia.Text);
            end;
        end;

        if (not DateTimePicker_Hasta_Ntra_Referencia.DateIsNull) or
           (not DateTimePicker_Desde_Ntra_Referencia.DateIsNull) then
        begin
            var_Ordenado_por := var_Ordenado_por +
                                rs_BitBtn_ImprimirClick_3 +
                                DateToStr(DateTimePicker_Desde_Ntra_Referencia.Date) +
                                rs_BitBtn_ImprimirClick_4 +
                                DateToStr(DateTimePicker_Hasta_Ntra_Referencia.Date);
        end;

        if Trim(Edit_Descripcion_id_Almacenes.Text) <> '' then
        begin
            var_Ordenado_por := var_Ordenado_por +
                                rs_BitBtn_ImprimirClick_5 +
                                Trim(Edit_Descripcion_id_Almacenes.Text);
        end;

        if Trim(Edit_Descripcion_Empresa.Text) <> '' then
        begin
            var_Ordenado_por := var_Ordenado_por +
                                rs_BitBtn_ImprimirClick_6 +
                                Trim(Edit_Descripcion_Empresa.Text);
        end;

        if Trim(Edit_Descripcion_Forma_Pago.Text) <> '' then
        begin
            var_Ordenado_por := var_Ordenado_por +
                                rs_BitBtn_ImprimirClick_7 +
                                Trim(Edit_Descripcion_Forma_Pago.Text);
        end;

        if Trim(Edit_Descripcion_id_Proveedores.Text) <> '' then
        begin
            var_Ordenado_por := var_Ordenado_por +
                                rs_BitBtn_ImprimirClick_8 +
                                Trim(Edit_Descripcion_id_Proveedores.Text);
        end;

        if (Trim(Edit_Pedido_Serie.Text) <> '')  or
           (Trim(Edit_Pedido_Numero.Text) <> '') then
        begin
            var_Ordenado_por := var_Ordenado_por +
                                rs_BitBtn_ImprimirClick_10;

            if Trim(Edit_Pedido_Serie.Text) <> '' then
            begin
                var_Ordenado_por := var_Ordenado_por +
                                    Trim(Edit_Pedido_Serie.Text) + '-';
            end;

            if Trim(Edit_Pedido_Numero.Text) <> '' then
            begin
                var_Ordenado_por := var_Ordenado_por +
                                    Trim(Edit_Pedido_Numero.Text);
            end;
        end;

        if (Trim(Edit_Factura_Serie.Text) <> '')  or
           (Trim(Edit_Factura_Numero.Text) <> '') then
        begin
            var_Ordenado_por := var_Ordenado_por +
                                rs_BitBtn_ImprimirClick_12;

            if Trim(Edit_Factura_Serie.Text) <> '' then
            begin
                var_Ordenado_por := var_Ordenado_por +
                                    Trim(Edit_Factura_Serie.Text) + '-';
            end;

            if Trim(Edit_Factura_Numero.Text) <> '' then
            begin
                var_Ordenado_por := var_Ordenado_por +
                                    Trim(Edit_Factura_Numero.Text);
            end;
        end;

        if RadioButton_Facturados_Solo.Checked = true then
        begin
            var_Ordenado_por := var_Ordenado_por +
                                rs_BitBtn_ImprimirClick_14;
        end;

        if RadioButton_Albaranes_Solo.Checked = true then
        begin
            var_Ordenado_por := var_Ordenado_por +
                                rs_BitBtn_ImprimirClick_15;
        end;

        if RadioButton_Todos.Checked = true then
        begin
            var_Ordenado_por := var_Ordenado_por +
                                rs_BitBtn_ImprimirClick_16;
        end;

        if Trim(Edit_Albaran_Numero_Su_Referencia.Text) <> '' then
        begin
            var_Ordenado_por := var_Ordenado_por +
                                rs_BitBtn_ImprimirClick_17 +
                                Trim(Edit_Albaran_Numero_Su_Referencia.Text);
        end;

        if (not DateTimePicker_Hasta_Su_Referencia.DateIsNull) or
           (not DateTimePicker_Desde_Su_Referencia.DateIsNull) then
        begin
            var_Ordenado_por := var_Ordenado_por +
                                rs_BitBtn_ImprimirClick_18 +
                                DateToStr(DateTimePicker_Desde_Su_Referencia.Date) +
                                rs_BitBtn_ImprimirClick_4 +
                                DateToStr(DateTimePicker_Hasta_Su_Referencia.Date);
        end;

        // ***************************************************************************************** //
        // ** Vamos a enviar el título del impuesto común. Esto sólo servirá en aquellas empresas ** //
        // ** que sólo usen un tipo de impuesto para facturar                                     ** //
        // ***************************************************************************************** //
        var_Impuesto_Comun := '';

        with SQLQuery_Alb_Detalles do
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
                          SQLQuery_Alb,
                          DataSource_List_Alb,
                          Nil,
                          Nil,
                          DataSource_Imptos_Totales,
                          public_Menu_Worked,
                          public_Solo_Ver,
                          SQLQuery_Alb.FieldByName('id_empresas').AsString,
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
    if UTI_TB_Cerrar( DataModule_Albaranes_Compras.SQLConnector_List_Alb,
                      DataModule_Albaranes_Compras.SQLTransaction_List_Alb,
                      SQLQuery_List_Alb ) = false then
    begin
      UTI_GEN_Salir;
    end;

    var_SQL_ADD.Free;
end;

end.



