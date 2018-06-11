unit clientes_000;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, DateTimePicker, DBDateTimePicker, Forms, Controls, variants,
  Graphics, Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, ButtonPanel, DbCtrls, DBGrids, EditBtn,
  plantilla_000, Grids, utilidades_datos_tablas, utilidades_usuarios, utilidades_forms_Filtrar,
  utilidades_Filtros, utilidades_general, utilidades_rgtro, utilidades_contabilidad, utilidades_bd;

resourcestring
  rs_clientes_000 = 'Mantenimiento de clientes';

  rs_clientes_001 = '* El nombre/descripción de a quien facturamos.';
  rs_clientes_002 = '* La dirección de quien facturamos.';
  rs_clientes_003 = '* La población de quien facturamos.';
  rs_clientes_004 = '* La provincia de quien facturamos.';
  rs_clientes_005 = '* El país de quien facturamos.';
  rs_clientes_006 = '* Con RECARGO (Si/No) en REGIMEN DE IVA bajo DATOS COMERCIALES.';
  rs_clientes_007 = '* Con IVA EXCLUIDO (Si/No) en REGIMEN DE IVA bajo DATOS COMERCIALES.';
  rs_clientes_008 = '* El RIESGO AUTORIZADO, bajo DATOS COMERCIALES.';
  rs_clientes_009 = '* El RIESGO ACUMULADO, bajo DATOS COMERCIALES.';
  rs_clientes_010 = '* AGRUPAR ALBARANES para la facturación, bajo DATOS COMERCIALES.';
  rs_clientes_011 = '* ACTIVAR PROXIMIDAD, bajo DATOS COMERCIALES.';
  rs_clientes_012 = '* La TARIFA a aplicar, bajo DATOS COMERCIALES.';
  rs_clientes_013 = '* La forma de pago.';
  rs_clientes_014 = '* La actividad.';
  rs_clientes_015 = '* La ruta.';
  rs_clientes_016 = '* El tipo de cliente.';
  rs_clientes_029 = '* El NIF.';
  rs_clientes_030 = '* La CUENTA CONTABLE.';
  rs_clientes_031 = '* Generar vencimientos automáticos (Si/No) en la gestión de cobro.';
  rs_clientes_032 = 'No se pudo comprobar si ya existe el contacto.';
  rs_clientes_033 = 'Contacto ya repetido para el cliente ';

type

  { Tf_clientes_000 }

  Tf_clientes_000 = class(Tform_plantilla_000)
    BitBtn_eMAIL: TBitBtn;
    BitBtn_visitar_Situl: TBitBtn;
    BitBtn_SMS: TBitBtn;
    BitBtn_Ver_Situacion_Registro_Contactos: TBitBtn;
    BitBtn_Ver_Situacion_Registro_Envios: TBitBtn;
    BitBtn_Ver_Situacion_Registro_Envios1: TBitBtn;
    BitBtn_Ver_Situacion_Registro_Envios2: TBitBtn;
    BitBtn_Ver_Situacion_Registro_Envios3: TBitBtn;
    BitBtn_Ver_Situacion_Registro_Envios4: TBitBtn;
    Boton_Elegir_Actividad: TBitBtn;
    Boton_Elegir_Agencia_Transporte: TBitBtn;
    Boton_Elegir_Cliente_Tipo: TBitBtn;
    Boton_Elegir_Cta_Bco_Pais: TBitBtn;
    Boton_Elegir_Cta_Bco_Poblacion: TBitBtn;
    Boton_Elegir_Cta_Bco_Provincia: TBitBtn;
    Boton_Elegir_Forma_Pago: TBitBtn;
    BitBtn_ver_direccion_en_Maps: TBitBtn;
    Boton_Elegir_Pais: TBitBtn;
    Boton_Elegir_Poblacion: TBitBtn;
    Boton_Elegir_Provincia: TBitBtn;
    Boton_Elegir_Representante: TBitBtn;
    Boton_Elegir_Ruta: TBitBtn;
    Boton_Elegir_Tarifa: TBitBtn;
    DataSource_Clientes_Contactos: TDataSource;
    DataSource_Clientes_Envios: TDataSource;
    DataSource_Clientes_Presupuestos: TDataSource;
    DBCheckBox_Activar_Proximidad_SN: TDBCheckBox;
    DBCheckBox_Agrupar_Albaranes_SN: TDBCheckBox;
    DBCheckBox_IVA_con_Recargo_SN: TDBCheckBox;
    DBCheckBox_IVA_Excluido_SN: TDBCheckBox;
    DBCheckBox_IVA_Excluido_SN1: TDBCheckBox;
    DBCheckBox_Vencimientos_automaticos_SN: TDBCheckBox;
    DBDateTimePicker_FechaNacimiento: TDBDateTimePicker;
    DBDateTimePicker_FechaNacimiento1: TDBDateTimePicker;
    DBEdit_a_quien_facturamos: TDBEdit;
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
    DBEdit_Descuento_Comercial_1: TDBEdit;
    DBEdit_Descuento_Comercial_2: TDBEdit;
    DBEdit_Descuento_Final: TDBEdit;
    DBEdit_Descuento_Pronto_Pago: TDBEdit;
    DBEdit_Direccion: TDBEdit;
    DBEdit_Direccion_Numero: TDBEdit;
    DBEdit_Direccion_Piso_Letra: TDBEdit;
    DBEdit_eMail: TDBEdit;
    DBEdit_FAX: TDBEdit;
    DBEdit_Forma_pago_Dia_1: TDBEdit;
    DBEdit_Forma_pago_Dia_2: TDBEdit;
    DBEdit_Forma_pago_Vacaciones_Dia_Fin: TDBEdit;
    DBEdit_Forma_pago_Vacaciones_Dia_Inicio: TDBEdit;
    DBEdit_Forma_pago_Vacaciones_Mes_Fin: TDBEdit;
    DBEdit_Forma_pago_Vacaciones_Mes_Inicio: TDBEdit;
    DBEdit_Movil: TDBEdit;
    DBEdit_NIF_CIF: TDBEdit;
    DBEdit_Nombre_Comercial: TDBEdit;
    DBEdit_Pagina_Web: TDBEdit;
    DBEdit_Retencion: TDBEdit;
    DBEdit_Riesgo_Acumulado: TDBEdit;
    DBEdit_Riesgo_Autorizado: TDBEdit;
    DBEdit_Tfno_Fijo_1: TDBEdit;
    DBEdit_Tfno_Fijo_2: TDBEdit;
    DBGrid_Contactos: TDBGrid;
    DBGrid_Envios: TDBGrid;
    DBGrid_Presupuestos: TDBGrid;
    DBGrid_Pedidos: TDBGrid;
    DBGrid_Albaranes: TDBGrid;
    DBGrid_Facturas: TDBGrid;
    DBMemo_Observaciones_Comentarios: TDBMemo;
    DBNavigator_Contactos: TDBNavigator;
    DBNavigator_Envios: TDBNavigator;
    DBNavigator_Envios1: TDBNavigator;
    DBNavigator_Envios2: TDBNavigator;
    DBNavigator_Envios3: TDBNavigator;
    DBNavigator_Envios4: TDBNavigator;
    Edit_Cta_Bco_Descripcion_Pais: TEdit;
    Edit_Cta_Bco_Descripcion_Poblacion: TEdit;
    Edit_Cta_Bco_Descripcion_Provincia: TEdit;
    Edit_Descripcion_Actividad: TEdit;
    Edit_Descripcion_Agencia_Transporte: TEdit;
    Edit_Descripcion_Cliente_Tipo: TEdit;
    Edit_Descripcion_Forma_Pago: TEdit;
    Edit_Descripcion_Pais: TEdit;
    Edit_Descripcion_Poblacion: TEdit;
    Edit_Descripcion_Provincia: TEdit;
    Edit_Descripcion_Representante: TEdit;
    Edit_Descripcion_Ruta: TEdit;
    Edit_Descripcion_Tarifa: TEdit;
    Edit_Movil_agencia_transporte: TEdit;
    Edit_OT_Movil_representante: TEdit;
    Edit_Tfno_Fijo_1_agencia_transporte: TEdit;
    Edit_Tfno_Fijo_1_representante: TEdit;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    GroupBox12: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox9: TGroupBox;
    Label1: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label17: TLabel;
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
    Label28: TLabel;
    Label3: TLabel;
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
    Label5: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
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
    Label8: TLabel;
    Label_Fecha: TLabel;
    Label_Fecha1: TLabel;
    PageControl_BancoCobro: TPageControl;
    PageControl_Otros_Datos: TPageControl;
    RadioGroup_Albaranes_Tipo: TRadioGroup;
    RadioGroup_Presupuestos_Tipo: TRadioGroup;
    RadioGroup_Pedidos_Tipo: TRadioGroup;
    SQLQuery_Clientes_Envios: TSQLQuery;
    SQLQuery_Clientes_ContactosCargo_Puesto: TStringField;
    SQLQuery_Clientes_ContactosChange_Id_User: TLargeintField;
    SQLQuery_Clientes_ContactosChange_WHEN: TDateTimeField;
    SQLQuery_Clientes_ContactosDel_Id_User: TLargeintField;
    SQLQuery_Clientes_ContactosDel_WHEN: TDateTimeField;
    SQLQuery_Clientes_ContactosDel_WHY: TStringField;
    SQLQuery_Clientes_ContactoseMail: TStringField;
    SQLQuery_Clientes_ContactosFAX: TStringField;
    SQLQuery_Clientes_ContactosFecha_Nacimiento: TDateTimeField;
    SQLQuery_Clientes_Contactosid_clientes: TLargeintField;
    SQLQuery_Clientes_ContactosInsert_Id_User: TLargeintField;
    SQLQuery_Clientes_ContactosInsert_WHEN: TDateTimeField;
    SQLQuery_Clientes_ContactosMovil: TStringField;
    SQLQuery_Clientes_Contactosnif_cif: TStringField;
    SQLQuery_Clientes_Contactosnombre: TStringField;
    SQLQuery_Clientes_ContactosOT_todos_los_Tfnos1: TStringField;
    SQLQuery_Clientes_Contactospagina_web: TStringField;
    SQLQuery_Clientes_ContactosTfno_Fijo_1: TStringField;
    SQLQuery_Clientes_ContactosTfno_Fijo_2: TStringField;
    SQLQuery_Clientes_EnviosChange_Id_User: TLargeintField;
    SQLQuery_Clientes_EnviosChange_WHEN: TDateTimeField;
    SQLQuery_Clientes_EnviosCodigo_Postal: TStringField;
    SQLQuery_Clientes_EnviosDel_Id_User: TLargeintField;
    SQLQuery_Clientes_EnviosDel_WHEN: TDateTimeField;
    SQLQuery_Clientes_EnviosDel_WHY: TStringField;
    SQLQuery_Clientes_EnviosDireccion: TStringField;
    SQLQuery_Clientes_EnviosDireccion_Numero: TStringField;
    SQLQuery_Clientes_EnviosDireccion_Piso_Letra: TStringField;
    SQLQuery_Clientes_EnvioseMail: TStringField;
    SQLQuery_Clientes_EnviosFAX: TStringField;
    SQLQuery_Clientes_Enviosid_clientes: TLargeintField;
    SQLQuery_Clientes_Enviosid_clientes_contactos: TLargeintField;
    SQLQuery_Clientes_Enviosid_paises: TLargeintField;
    SQLQuery_Clientes_Enviosid_poblaciones: TLargeintField;
    SQLQuery_Clientes_Enviosid_provincias: TLargeintField;
    SQLQuery_Clientes_EnviosInsert_Id_User: TLargeintField;
    SQLQuery_Clientes_EnviosInsert_WHEN: TDateTimeField;
    SQLQuery_Clientes_EnviosMovil: TStringField;
    SQLQuery_Clientes_EnviosOT_descripcion_Contacto: TStringField;
    SQLQuery_Clientes_EnviosOT_descripcion_pais: TStringField;
    SQLQuery_Clientes_EnviosOT_descripcion_poblacion: TStringField;
    SQLQuery_Clientes_EnviosOT_descripcion_provincia: TStringField;
    SQLQuery_Clientes_EnviosOT_Direccion_Entera1: TStringField;
    SQLQuery_Clientes_EnviosOT_todos_los_Tfnos1: TStringField;
    SQLQuery_Clientes_EnviosPortes_Pagados_SN: TStringField;
    SQLQuery_Clientes_EnviosTfno_Fijo_1: TStringField;
    SQLQuery_Clientes_EnviosTfno_Fijo_2: TStringField;
    SQLQuery_Impuestosid1: TLargeintField;
    SQLQuery_Clientes_Contactos: TSQLQuery;
    SQLQuery_Impuestosid2: TLargeintField;
    SQLQuery_Clientes_Presupuestos: TSQLQuery;
    SQLQuery_Clientes_Presupuestosagencias_transporte_id_proveedores: TLargeintField;
    SQLQuery_Clientes_PresupuestosCerrado_SN: TStringField;
    SQLQuery_Clientes_PresupuestosChange_Id_User: TLargeintField;
    SQLQuery_Clientes_PresupuestosChange_WHEN: TDateTimeField;
    SQLQuery_Clientes_PresupuestosCodigo_Postal: TStringField;
    SQLQuery_Clientes_PresupuestosComentarios_a_imprimir_en_Albaran: TStringField;
    SQLQuery_Clientes_PresupuestosComision_Representante: TBCDField;
    SQLQuery_Clientes_PresupuestosCONCEPTO_SEPA: TStringField;
    SQLQuery_Clientes_PresupuestosCta_Bco_BIC_SWIFT: TStringField;
    SQLQuery_Clientes_PresupuestosCta_Bco_Codigo_Postal: TStringField;
    SQLQuery_Clientes_PresupuestosCta_Bco_Cuenta: TStringField;
    SQLQuery_Clientes_PresupuestosCta_Bco_Digito_Control: TStringField;
    SQLQuery_Clientes_PresupuestosCta_Bco_Direccion: TStringField;
    SQLQuery_Clientes_PresupuestosCta_Bco_Direccion_Numero: TStringField;
    SQLQuery_Clientes_PresupuestosCta_Bco_Direccion_Piso_Letra: TStringField;
    SQLQuery_Clientes_PresupuestosCta_Bco_Entidad: TStringField;
    SQLQuery_Clientes_PresupuestosCta_Bco_IBAN: TStringField;
    SQLQuery_Clientes_PresupuestosCta_Bco_id_paises: TLargeintField;
    SQLQuery_Clientes_PresupuestosCta_Bco_id_poblaciones: TLargeintField;
    SQLQuery_Clientes_PresupuestosCta_Bco_id_provincias: TLargeintField;
    SQLQuery_Clientes_PresupuestosCta_Bco_Mandato_Fecha_de_Firma: TDateTimeField;
    SQLQuery_Clientes_PresupuestosCta_Bco_Mandato_Ref: TStringField;
    SQLQuery_Clientes_PresupuestosCta_Bco_Sucursal: TStringField;
    SQLQuery_Clientes_PresupuestosDel_Id_User: TLargeintField;
    SQLQuery_Clientes_PresupuestosDel_WHEN: TDateTimeField;
    SQLQuery_Clientes_PresupuestosDel_WHY: TStringField;
    SQLQuery_Clientes_PresupuestosDescuento_Comercial_1: TBCDField;
    SQLQuery_Clientes_PresupuestosDescuento_Comercial_2: TBCDField;
    SQLQuery_Clientes_PresupuestosDescuento_Final: TBCDField;
    SQLQuery_Clientes_PresupuestosDescuento_Pronto_Pago: TBCDField;
    SQLQuery_Clientes_PresupuestosDireccion: TStringField;
    SQLQuery_Clientes_PresupuestosDireccion_Numero: TStringField;
    SQLQuery_Clientes_PresupuestosDireccion_Piso_Letra: TStringField;
    SQLQuery_Clientes_PresupuestosEnvio_Bultos: TLongintField;
    SQLQuery_Clientes_PresupuestosEnvio_Codigo_Postal: TStringField;
    SQLQuery_Clientes_PresupuestosEnvio_Condiciones_Entrega: TStringField;
    SQLQuery_Clientes_PresupuestosEnvio_Con_Quien_Hablar: TStringField;
    SQLQuery_Clientes_PresupuestosEnvio_Direccion: TStringField;
    SQLQuery_Clientes_PresupuestosEnvio_Direccion_Numero: TStringField;
    SQLQuery_Clientes_PresupuestosEnvio_Direccion_Piso_Letra: TStringField;
    SQLQuery_Clientes_PresupuestosEnvio_eMail: TStringField;
    SQLQuery_Clientes_PresupuestosEnvio_FAX: TStringField;
    SQLQuery_Clientes_PresupuestosEnvio_Fecha_Recogida_Prevista: TDateTimeField;
    SQLQuery_Clientes_PresupuestosEnvio_id_paises: TLargeintField;
    SQLQuery_Clientes_PresupuestosEnvio_id_poblaciones: TLargeintField;
    SQLQuery_Clientes_PresupuestosEnvio_id_provincias: TLargeintField;
    SQLQuery_Clientes_PresupuestosEnvio_Movil: TStringField;
    SQLQuery_Clientes_PresupuestosEnvio_Portes: TBCDField;
    SQLQuery_Clientes_PresupuestosEnvio_Portes_Pagados_SN: TStringField;
    SQLQuery_Clientes_PresupuestosEnvio_Tfno_Fijo_1: TStringField;
    SQLQuery_Clientes_PresupuestosEnvio_Tfno_Fijo_2: TStringField;
    SQLQuery_Clientes_PresupuestosFAX: TStringField;
    SQLQuery_Clientes_PresupuestosFecha: TDateTimeField;
    SQLQuery_Clientes_PresupuestosForma_pago_Dia_1: TSmallintField;
    SQLQuery_Clientes_PresupuestosForma_pago_Dia_2: TSmallintField;
    SQLQuery_Clientes_PresupuestosForma_pago_Vacaciones_Dia_Fin: TSmallintField;
    SQLQuery_Clientes_PresupuestosForma_pago_Vacaciones_Dia_Inicio: TSmallintField;
    SQLQuery_Clientes_PresupuestosForma_pago_Vacaciones_Mes_Fin: TSmallintField;
    SQLQuery_Clientes_PresupuestosForma_pago_Vacaciones_Mes_Inicio: TSmallintField;
    SQLQuery_Clientes_Presupuestosid: TLargeintField;
    SQLQuery_Clientes_Presupuestosid_almacenes: TLargeintField;
    SQLQuery_Clientes_Presupuestosid_clientes: TLargeintField;
    SQLQuery_Clientes_Presupuestosid_empresas: TLargeintField;
    SQLQuery_Clientes_Presupuestosid_formas_pago: TLargeintField;
    SQLQuery_Clientes_Presupuestosid_paises: TLargeintField;
    SQLQuery_Clientes_Presupuestosid_poblaciones: TLargeintField;
    SQLQuery_Clientes_Presupuestosid_provincias: TLargeintField;
    SQLQuery_Clientes_Presupuestosid_representantes: TLargeintField;
    SQLQuery_Clientes_Presupuestosid_tarifas: TLargeintField;
    SQLQuery_Clientes_Presupuestosid_vehiculos: TLargeintField;
    SQLQuery_Clientes_PresupuestosInsert_Id_User: TLargeintField;
    SQLQuery_Clientes_PresupuestosInsert_WHEN: TDateTimeField;
    SQLQuery_Clientes_PresupuestosIVA_con_Recargo_SN: TStringField;
    SQLQuery_Clientes_PresupuestosIVA_con_Recargo_SN_Representante: TStringField;
    SQLQuery_Clientes_PresupuestosIVA_Excluido_SN: TStringField;
    SQLQuery_Clientes_PresupuestosIVA_Excluido_SN_Representante: TStringField;
    SQLQuery_Clientes_PresupuestosMovil: TStringField;
    SQLQuery_Clientes_Presupuestosnif_cif: TStringField;
    SQLQuery_Clientes_Presupuestosnombre_comercial: TStringField;
    SQLQuery_Clientes_Presupuestosnombre_propietario: TStringField;
    SQLQuery_Clientes_PresupuestosNumero_Presupuesto: TLargeintField;
    SQLQuery_Clientes_PresupuestosObservaciones: TStringField;
    SQLQuery_Clientes_PresupuestosOT_Cta_Bco_descripcion_pais: TStringField;
    SQLQuery_Clientes_PresupuestosOT_Cta_Bco_descripcion_poblacion: TStringField;
    SQLQuery_Clientes_PresupuestosOT_Cta_Bco_descripcion_provincia: TStringField;
    SQLQuery_Clientes_PresupuestosOT_descripcion_almacen: TStringField;
    SQLQuery_Clientes_PresupuestosOT_descripcion_cliente: TStringField;
    SQLQuery_Clientes_PresupuestosOT_descripcion_empresa: TStringField;
    SQLQuery_Clientes_PresupuestosOT_descripcion_forma_pago: TStringField;
    SQLQuery_Clientes_PresupuestosOT_descripcion_pais: TStringField;
    SQLQuery_Clientes_PresupuestosOT_descripcion_poblacion: TStringField;
    SQLQuery_Clientes_PresupuestosOT_descripcion_provincia: TStringField;
    SQLQuery_Clientes_PresupuestosOT_descripcion_representante: TStringField;
    SQLQuery_Clientes_PresupuestosOT_descripcion_tarifa: TStringField;
    SQLQuery_Clientes_PresupuestosOT_descripcion_transportista: TStringField;
    SQLQuery_Clientes_PresupuestosOT_el_Presupuesto: TStringField;
    SQLQuery_Clientes_PresupuestosOT_Envio_descripcion_pais: TStringField;
    SQLQuery_Clientes_PresupuestosOT_Envio_descripcion_poblacion: TStringField;
    SQLQuery_Clientes_PresupuestosOT_Envio_descripcion_provincia: TStringField;
    SQLQuery_Clientes_PresupuestosOT_Movil_representante: TStringField;
    SQLQuery_Clientes_PresupuestosOT_Movil_transportista: TStringField;
    SQLQuery_Clientes_PresupuestosOT_tfno_1_representante: TStringField;
    SQLQuery_Clientes_PresupuestosOT_tfno_1_transportista: TStringField;
    SQLQuery_Clientes_PresupuestosOT_Total_Lineas: TFloatField;
    SQLQuery_Clientes_PresupuestosOT_Total_Total: TFloatField;
    SQLQuery_Clientes_PresupuestosOT_vehiculo_matricula: TStringField;
    SQLQuery_Clientes_PresupuestosRetencion: TBCDField;
    SQLQuery_Clientes_PresupuestosRetencion_Representante: TBCDField;
    SQLQuery_Clientes_PresupuestosRiesgo_Autorizado: TBCDField;
    SQLQuery_Clientes_PresupuestosSerie_Presupuesto: TStringField;
    SQLQuery_Clientes_PresupuestosTfno_Fijo_1: TStringField;
    SQLQuery_Clientes_PresupuestosTfno_Fijo_2: TStringField;
    SQLQuery_Clientes_PresupuestosTotal_Lineas: TBCDField;
    SQLQuery_Clientes_PresupuestosTotal_Mano_Obra: TBCDField;
    SQLQuery_Clientes_PresupuestosTotal_Materiales: TBCDField;
    SQLQuery_Clientes_PresupuestosTotal_Resto: TBCDField;
    SQLQuery_Clientes_PresupuestosTotal_Total: TBCDField;
    SQLQuery_Clientes_PresupuestosVencimientos_1_Dias: TSmallintField;
    SQLQuery_Clientes_PresupuestosVencimientos_automaticos_SN: TStringField;
    SQLQuery_Clientes_PresupuestosVencimientos_Cantidad: TSmallintField;
    SQLQuery_Clientes_PresupuestosVencimientos_Dias_Entre: TSmallintField;
    SQLQuery_PrincipalActivar_Proximidad_SN: TStringField;
    SQLQuery_PrincipalAgrupar_Albaranes_SN: TStringField;
    SQLQuery_PrincipalCantidad_Hermanos: TSmallintField;
    SQLQuery_PrincipalChange_Id_User: TLargeintField;
    SQLQuery_PrincipalChange_WHEN: TDateTimeField;
    SQLQuery_PrincipalCodigo_Postal: TStringField;
    SQLQuery_PrincipalCta_Bco_BIC_SWIFT: TStringField;
    SQLQuery_PrincipalCta_Bco_Codigo_Postal: TStringField;
    SQLQuery_PrincipalCta_Bco_Cuenta: TStringField;
    SQLQuery_PrincipalCta_Bco_Digito_Control: TStringField;
    SQLQuery_PrincipalCta_Bco_Direccion: TStringField;
    SQLQuery_PrincipalCta_Bco_Direccion_Numero: TStringField;
    SQLQuery_PrincipalCta_Bco_Direccion_Piso_Letra: TStringField;
    SQLQuery_PrincipalCta_Bco_Entidad: TStringField;
    SQLQuery_PrincipalCta_Bco_IBAN: TStringField;
    SQLQuery_PrincipalCta_Bco_Mandato_Fecha_de_Firma: TDateTimeField;
    SQLQuery_PrincipalCta_Bco_Mandato_Ref: TStringField;
    SQLQuery_PrincipalCta_Bco_Sucursal: TStringField;
    SQLQuery_PrincipalCuenta_Contable: TStringField;
    SQLQuery_PrincipalDel_Id_User: TLargeintField;
    SQLQuery_PrincipalDel_WHEN: TDateTimeField;
    SQLQuery_PrincipalDel_WHY: TStringField;
    SQLQuery_PrincipalDescuento_Comercial_1: TBCDField;
    SQLQuery_PrincipalDescuento_Comercial_2: TBCDField;
    SQLQuery_PrincipalDescuento_Final: TBCDField;
    SQLQuery_PrincipalDescuento_Pronto_Pago: TBCDField;
    SQLQuery_PrincipalDireccion: TStringField;
    SQLQuery_PrincipalDireccion_Numero: TStringField;
    SQLQuery_PrincipalDireccion_Piso_Letra: TStringField;
    SQLQuery_PrincipaleMail: TStringField;
    SQLQuery_PrincipalEstudia_SN: TStringField;
    SQLQuery_PrincipalEstudios_Trabajos: TStringField;
    SQLQuery_PrincipalFAX: TStringField;
    SQLQuery_PrincipalFecha_Nacimiento: TDateTimeField;
    SQLQuery_PrincipalForma_pago_Dia_1: TSmallintField;
    SQLQuery_PrincipalForma_pago_Dia_2: TSmallintField;
    SQLQuery_PrincipalForma_pago_Vacaciones_Dia_Fin: TSmallintField;
    SQLQuery_PrincipalForma_pago_Vacaciones_Dia_Inicio: TSmallintField;
    SQLQuery_PrincipalForma_pago_Vacaciones_Mes_Fin: TSmallintField;
    SQLQuery_PrincipalForma_pago_Vacaciones_Mes_Inicio: TSmallintField;
    SQLQuery_Principalid_actividades: TLargeintField;
    SQLQuery_Principalid_Agencias_Transporte: TLargeintField;
    SQLQuery_Principalid_clientes_tipos: TLargeintField;
    SQLQuery_Principalid_Cta_Bco_pais: TLargeintField;
    SQLQuery_Principalid_Cta_Bco_poblaciones: TLargeintField;
    SQLQuery_Principalid_Cta_Bco_provincias: TLargeintField;
    SQLQuery_Principalid_formas_pago: TLargeintField;
    SQLQuery_Principalid_paises: TLargeintField;
    SQLQuery_Principalid_poblaciones: TLargeintField;
    SQLQuery_Principalid_provincias: TLargeintField;
    SQLQuery_Principalid_Representantes: TLargeintField;
    SQLQuery_Principalid_rutas: TLargeintField;
    SQLQuery_Principalid_tarifas: TLargeintField;
    SQLQuery_PrincipalInsert_Id_User: TLargeintField;
    SQLQuery_PrincipalInsert_WHEN: TDateTimeField;
    SQLQuery_PrincipalIVA_con_Recargo_SN: TStringField;
    SQLQuery_PrincipalIVA_Excluido_SN: TStringField;
    SQLQuery_PrincipalMovil: TStringField;
    SQLQuery_Principalnif_cif: TStringField;
    SQLQuery_Principalnombre_comercial: TStringField;
    SQLQuery_Principalnombre_propietario: TStringField;
    SQLQuery_PrincipalObservaciones_Comentarios: TStringField;
    SQLQuery_PrincipalOT_Cta_Bco_descripcion_pais: TStringField;
    SQLQuery_PrincipalOT_Cta_Bco_descripcion_poblacion: TStringField;
    SQLQuery_PrincipalOT_Cta_Bco_descripcion_provincia: TStringField;
    SQLQuery_PrincipalOT_Cuenta_Contable_cliente_tipo: TStringField;
    SQLQuery_PrincipalOT_descripcion_actividad: TStringField;
    SQLQuery_PrincipalOT_descripcion_agencia_transporte: TStringField;
    SQLQuery_PrincipalOT_descripcion_cliente_tipo: TStringField;
    SQLQuery_PrincipalOT_descripcion_forma_pago: TStringField;
    SQLQuery_PrincipalOT_descripcion_pais: TStringField;
    SQLQuery_PrincipalOT_descripcion_poblacion: TStringField;
    SQLQuery_PrincipalOT_descripcion_provincia: TStringField;
    SQLQuery_PrincipalOT_descripcion_representante: TStringField;
    SQLQuery_PrincipalOT_descripcion_ruta: TStringField;
    SQLQuery_PrincipalOT_descripcion_tarifa: TStringField;
    SQLQuery_PrincipalOT_Movil_agencia_transporte: TStringField;
    SQLQuery_PrincipalOT_Movil_representante: TStringField;
    SQLQuery_PrincipalOT_Tfno_Fijo_1_agencia_transporte: TStringField;
    SQLQuery_PrincipalOT_Tfno_Fijo_1_representante: TStringField;
    SQLQuery_PrincipalOT_todos_los_Tfnos1: TStringField;
    SQLQuery_PrincipalOT_Vencimientos_1_Dias: TSmallintField;
    SQLQuery_PrincipalOT_Vencimientos_Cantidad: TSmallintField;
    SQLQuery_PrincipalOT_Vencimientos_Dias_Entre: TSmallintField;
    SQLQuery_Principalpagina_web: TStringField;
    SQLQuery_PrincipalPortes_Pagados_SN: TStringField;
    SQLQuery_PrincipalRetencion: TBCDField;
    SQLQuery_PrincipalRiesgo_Acumulado: TBCDField;
    SQLQuery_PrincipalRiesgo_Autorizado: TBCDField;
    SQLQuery_PrincipalTfno_Fijo_1: TStringField;
    SQLQuery_PrincipalTfno_Fijo_2: TStringField;
    SQLQuery_PrincipalTrabaja_SN: TStringField;
    SQLQuery_PrincipalVencimientos_automaticos_SN: TStringField;
    TabSheet1: TTabSheet;
    TabSheet_Facturas: TTabSheet;
    TabSheet_Albaranes: TTabSheet;
    TabSheet_Presupuestos: TTabSheet;
    TabSheet_Pedidos: TTabSheet;
    TabSheet_BancoCobro: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet_GestionCobro: TTabSheet;
    TabSheet_Direcciones_Envio: TTabSheet;
    TabSheet_Contactos: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet_DatosAdicionales: TTabSheet;

    procedure BitBtn_visitar_SitulClick(Sender: TObject);
    procedure BitBtn_eMAILClick(Sender: TObject);
    procedure BitBtn_SMSClick(Sender: TObject);
    procedure BitBtn_ver_direccion_en_MapsClick(Sender: TObject);
    procedure BitBtn_Ver_Situacion_Registro_ContactosClick(Sender: TObject);
    procedure BitBtn_Ver_Situacion_Registro_EnviosClick(Sender: TObject);
    procedure Boton_Elegir_ActividadClick(Sender: TObject);
    procedure Boton_Elegir_Agencia_TransporteClick(Sender: TObject);
    procedure Boton_Elegir_Cliente_TipoClick(Sender: TObject);
    procedure Boton_Elegir_Cta_Bco_PaisClick(Sender: TObject);
    procedure Boton_Elegir_Cta_Bco_PoblacionClick(Sender: TObject);
    procedure Boton_Elegir_Cta_Bco_ProvinciaClick(Sender: TObject);
    procedure Boton_Elegir_Forma_PagoClick(Sender: TObject);
    procedure Boton_Elegir_PaisClick(Sender: TObject);
    procedure Boton_Elegir_ProvinciaClick(Sender: TObject);
    procedure Boton_Elegir_RepresentanteClick(Sender: TObject);
    procedure Boton_Elegir_RutaClick(Sender: TObject);
    procedure Boton_Elegir_TarifaClick(Sender: TObject);
    procedure DataSource_PrincipalDataChange(Sender: TObject; Field: TField);
    procedure DBGrid_ContactosDblClick(Sender: TObject);
    procedure DBGrid_ContactosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_ContactosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid_EnviosDblClick(Sender: TObject);
    procedure DBGrid_EnviosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_EnviosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid_PrincipalDblClick(Sender: TObject);
    procedure DBNavigator_ContactosBeforeAction(Sender: TObject;
      Button: TDBNavButtonType);
    procedure DBNavigator_EnviosBeforeAction(Sender: TObject;
      Button: TDBNavButtonType);
    procedure Edit_Cta_Bco_Descripcion_PaisClick(Sender: TObject);
    procedure Edit_Cta_Bco_Descripcion_PoblacionClick(Sender: TObject);
    procedure Edit_Cta_Bco_Descripcion_ProvinciaClick(Sender: TObject);
    procedure Edit_Descripcion_ActividadClick(Sender: TObject);
    procedure Edit_Descripcion_Agencia_TransporteClick(Sender: TObject);
    procedure Edit_Descripcion_Forma_PagoClick(Sender: TObject);
    procedure Edit_Descripcion_TarifaClick(Sender: TObject);
    procedure Edit_Descripcion_Cliente_TipoClick(Sender: TObject);
    procedure Edit_Descripcion_PaisClick(Sender: TObject);
    procedure Edit_Descripcion_PoblacionClick(Sender: TObject);
    procedure Edit_Descripcion_ProvinciaClick(Sender: TObject);
    procedure Edit_Descripcion_RepresentanteClick(Sender: TObject);
    procedure Edit_Descripcion_RutaClick(Sender: TObject);
    procedure SQLQuery_Clientes_ContactosAfterPost(DataSet: TDataSet);
    procedure SQLQuery_Clientes_ContactosBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_Clientes_ContactosBeforePost(DataSet: TDataSet);
    procedure SQLQuery_Clientes_ContactosCalcFields(DataSet: TDataSet);
    procedure SQLQuery_Clientes_EnviosAfterPost(DataSet: TDataSet);
    procedure SQLQuery_Clientes_EnviosBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_Clientes_EnviosBeforePost(DataSet: TDataSet);
    procedure SQLQuery_Clientes_EnviosCalcFields(DataSet: TDataSet);
    procedure SQLQuery_PrincipalCalcFields(DataSet: TDataSet);

    procedure Cambiar_Nombre_Tabla_Principal; override;
    procedure Cambiar_Titulo_Form; override;
    procedure Abrir_Conexiones_con_BD_TablasAdicionales; override;
    procedure Filtrar_tablas_adicionales( var p_Lineas_Filtro : TStrings; var p_Lineas_OrderBy : TStrings ); override;


    procedure Campo_Foco_en_modo_Edicion_Inserccion; override;
    procedure NewRecord_Insert_SQLQuery_Principal; override;
    procedure Antes_del_Post_Principal_Sin_Rellenar_Permitido_SI( p_msg : TStrings ); override;
    procedure Antes_del_Post_Principal_Sin_Rellenar_Permitido_NO( p_msg, p_msg_Comprobar : TStrings ); override;
    procedure Antes_del_Post_Principal_Asignar_Valores; override;
    procedure Dibujar_Grid_Principal( p_Sender: TObject; const p_Rect: TRect; p_DataCol: Integer; p_Column: TColumn; p_State: TGridDrawState ); override;
    procedure Cerramos_Tablas_Ligadas; override;
    procedure Cambiar_WindowState; override;
    procedure para_Empezar_GroupBox_Registro; override;
    procedure Presentar_Datos; override;
    procedure Presentar_Datos_GroupBox_Registro; override;
    procedure Refrescar_Registros; override;
    procedure Refrescar_Registros_TablasLigadas; override;
    procedure Crear_OrderBy_tablas_adicionales; override;
    procedure Crear_tipos_orden_Principal; override;
    procedure Rellenar_Filtros_Impresion(var p_Ordenado_por : String); override;
    procedure Filtrar_Principal_queFiltro( var p_errores_Filtros : TStrings; var p_Registro_CRUD : TRegistro_CRUD; var p_ctdad_Rgtros : Integer; var p_a_Filtrar : TStrings ); override;
    function  Fue_Utilizado_Rgtro_SQLQuery_Principal : ShortInt; override;

  private
    { private declarations }
    private_Order_By_contactos : array of TOrder_By;
    private_Order_By_envios : array of TOrder_By;

    function  Filtrar_clientes_contactos( p_ver_bajas : ShortInt; p_Cambiamos_Filtro : Boolean; p_Lineas_Filtro, p_Lineas_OrderBy : TStrings ) : ShortInt;
    procedure Refrescar_Registros_clientes_contactos;

    function  Filtrar_clientes_envios( p_ver_bajas : ShortInt; p_Cambiamos_Filtro : Boolean; p_Lineas_Filtro, p_Lineas_OrderBy : TStrings ) : ShortInt;
    procedure Refrescar_Registros_clientes_envios;

    procedure Comprobar_Resto_Datos_Poblacion(param_id : String);
    procedure Insertar_Registro_Envios;
    procedure Insertar_Registro_Contactos;
    procedure Editar_Registro_Contactos;
    procedure Editar_Registro_Envios;
    procedure Borrar_Registro_Contactos;
    procedure Borrar_Registro_Envios;
    procedure Traer_poblacion_xID( param_id : String; param_SQLTransaction : TSQLTransaction; param_SQLConnector : TSQLConnector; param_SQLQuery : TSQLQuery );

  public
    { public declarations }

  end;

var
  f_clientes_000: Tf_clientes_000;

implementation

{$R *.lfm}

uses menu, clientes_001, clientes_002;

{ Tf_clientes_000 }

procedure Tf_clientes_000.Boton_Elegir_ProvinciaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
  with SQLQuery_Principal do
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

procedure Tf_clientes_000.Boton_Elegir_RepresentanteClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
  with SQLQuery_Principal do
  begin
    var_Registro := UTI_Abrir_Modulo_Representantes( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
      FieldByName('id_Representantes').AsString := Trim(var_Registro.id_1);
      Edit_Descripcion_Representante.Text       := var_Registro.descripcion_1;
    end;
  end;
end;

procedure Tf_clientes_000.Boton_Elegir_RutaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
  with SQLQuery_Principal do
  begin
    var_Registro := UTI_Abrir_Modulo_Rutas( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
      FieldByName('id_rutas').AsString := Trim(var_Registro.id_1);
      Edit_Descripcion_Ruta.Text       := var_Registro.descripcion_1;
    end;
  end;
end;

procedure Tf_clientes_000.Boton_Elegir_TarifaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
  with SQLQuery_Principal do
  begin
    var_Registro := UTI_Abrir_Modulo_Tarifas( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
      FieldByName('id_tarifas').AsString := Trim(var_Registro.id_1);
      Edit_Descripcion_Tarifa.Text       := var_Registro.descripcion_1;
    end;
  end;
end;

procedure Tf_clientes_000.Boton_Elegir_PaisClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
  with SQLQuery_Principal do
  begin
    var_Registro := UTI_Abrir_Modulo_Paises( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
      FieldByName('id_paises').AsString := Trim(var_Registro.id_1);
      Edit_Descripcion_Pais.Text        := var_Registro.descripcion_1;
    end;
  end;
end;

procedure Tf_clientes_000.BitBtn_SMSClick(Sender: TObject);
begin
  UTI_GEN_Enviar_SMS;
end;

procedure Tf_clientes_000.BitBtn_ver_direccion_en_MapsClick(Sender: TObject);
begin
  UTI_GEN_ver_direccion_en_Internet;
end;

procedure Tf_clientes_000.BitBtn_Ver_Situacion_Registro_ContactosClick(Sender: TObject);
begin
  if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
  begin
    if SQLQuery_Clientes_Contactos.RecordCount > 0 then
    begin
      UTI_RGTRO_Ver_Estado_Registro( 'clientes_contactos',
                                     SQLQuery_Clientes_Contactos,
                                     DataSource_Clientes_Contactos,
                                     DBGrid_Contactos );
    end;
  end;
end;

procedure Tf_clientes_000.BitBtn_Ver_Situacion_Registro_EnviosClick(
  Sender: TObject);
begin
  if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
  begin
      if SQLQuery_Clientes_Envios.RecordCount > 0 then
      begin
          UTI_RGTRO_Ver_Estado_Registro( 'clientes_envios',
                                         SQLQuery_Clientes_Envios,
                                         DataSource_Clientes_Envios,
                                         DBGrid_Envios );
      end;
  end;
end;

procedure Tf_clientes_000.BitBtn_eMAILClick(Sender: TObject);
begin
  UTI_GEN_Enviar_eMAIL;
end;

procedure Tf_clientes_000.BitBtn_visitar_SitulClick(Sender: TObject);
begin
  UTI_GEN_Visitar_Situl;
end;

procedure Tf_clientes_000.Boton_Elegir_ActividadClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
  with SQLQuery_Principal do
  begin
    var_Registro := UTI_Abrir_Modulo_Actividades( '', '', true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
      FieldByName('id_actividades').AsString := Trim(var_Registro.id_1);
      Edit_Descripcion_Actividad.Text        := var_Registro.descripcion_1;
    end;
  end;
end;

procedure Tf_clientes_000.Boton_Elegir_Agencia_TransporteClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
  with SQLQuery_Principal do
  begin
    var_Registro := UTI_Abrir_Modulo_Proveedores( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
      FieldByName('id_Agencias_Transporte').AsString := Trim(var_Registro.id_1);
      Edit_Descripcion_Agencia_Transporte.Text       := var_Registro.descripcion_1;

      Edit_Tfno_Fijo_1_agencia_transporte.Text       := var_Registro.descripcion_2;
      Edit_Movil_agencia_transporte.Text             := var_Registro.descripcion_3;

    end;
  end;
end;

procedure Tf_clientes_000.Boton_Elegir_Cliente_TipoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
  with SQLQuery_Principal do
  begin
    var_Registro := UTI_Abrir_Modulo_Clientes_tipos( '', '', true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
      FieldByName('id_clientes_tipos').AsString := Trim(var_Registro.id_1);
      Edit_Descripcion_Cliente_Tipo.Text        := var_Registro.descripcion_1;

      if Trim(FieldByName('Cuenta_Contable').AsString) = '' then
      begin
        FieldByName('Cuenta_Contable').Value := var_Registro.descripcion_2;
      end;
    end;
  end;
end;

procedure Tf_clientes_000.Boton_Elegir_Cta_Bco_PaisClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
  with SQLQuery_Principal do
  begin
      var_Registro := UTI_Abrir_Modulo_Paises( true, false, '1' );
      if var_Registro.id_1 <> '' then
      begin
           FieldByName('id_Cta_Bco_pais').AsString := Trim(var_Registro.id_1);
           Edit_Cta_Bco_Descripcion_Pais.Text      := var_Registro.descripcion_1;
      end;
  end;
end;

procedure Tf_clientes_000.Boton_Elegir_Cta_Bco_PoblacionClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
  with SQLQuery_Principal do
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

procedure Tf_clientes_000.Boton_Elegir_Cta_Bco_ProvinciaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
  with SQLQuery_Principal do
  begin
    var_Registro := UTI_Abrir_Modulo_Provincias( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
       FieldByName('id_Cta_Bco_provincias').AsString := Trim(var_Registro.id_1);
       FieldByName('id_Cta_Bco_pais').AsString       := Trim(var_Registro.id_2);

       Edit_Cta_Bco_Descripcion_Provincia.Text       := var_Registro.descripcion_1;
       Edit_Cta_Bco_Descripcion_Pais.Text            := var_Registro.descripcion_2;
    end;
  end;
end;

procedure Tf_clientes_000.Boton_Elegir_Forma_PagoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
  with SQLQuery_Principal do
  begin
    var_Registro := UTI_Abrir_Modulo_FormasPago( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
      FieldByName('id_formas_pago').AsString := Trim(var_Registro.id_1);
      Edit_Descripcion_Forma_Pago.Text       := var_Registro.descripcion_1;
    end;
  end;
end;

procedure Tf_clientes_000.DataSource_PrincipalDataChange(Sender: TObject;
  Field: TField);
begin

end;

procedure Tf_clientes_000.DBGrid_ContactosDblClick(Sender: TObject);
begin
  Editar_Registro_Contactos;
end;

procedure Tf_clientes_000.DBGrid_ContactosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var var_Color_Normal : TColor;
begin
    with Sender as TDBGrid do
    begin
        if SQLQuery_Clientes_Contactos.RecordCount = 0 then Exit;

        var_Color_Normal := Canvas.Brush.Color;

      { ************************************************************************
        Primero comprobamos si es un registro dado de baja o no
        ************************************************************************ }
        if not SQLQuery_Clientes_Contactos.FieldByName('Del_WHEN').IsNull then
            begin
              { ****************************************************************
                Registro DADO de BAJA
                **************************************************************** }
                Canvas.Font.Color := clSilver;
            end
        else
            begin
              { ****************************************************************
                Registro DADO de ALTA, NO BAJA
                ****************************************************************
                Así que las pinto, pero sólo si no son las columnas que van a
                ser dibujadas
                **************************************************************** }
                if State <> [gdSelected] then
                begin
                    if (Column.FieldName <> 'COLUMNA_CON_IMAGEN') then
                    begin
                        Canvas.font.Color := clBlack;
                    end;
                end;
            end;

      { ************************************************************************
        Ahora paso a dibujar una celda normal con los colores elegidos o una
        dibujada
        ************************************************************************ }
        if (Column.FieldName <> 'COLUMNA_CON_IMAGEN') then
            begin
              { ****************************************************************
                No es una de las columnas a dibujar por lo que la pinto con los
                colores elegidos
                **************************************************************** }
                DefaultDrawColumnCell(Rect, DataCol, Column, State)
            end
        else
            begin
              { ****************************************************************
                Es una de las columnas a dibujar
                **************************************************************** }
                // COLUMNA CONFIRMADA
                if Column.FieldName = 'COLUMNA_CON_IMAGEN'  then
                begin
                    {
                    if Trim(SQLQuery_Clientes_Contactos.FieldByName('id_medio').asString) = '1' then
                    begin
                        Canvas.StretchDraw(param_Rect, Image_Confirmado.Picture.Graphic);
                    end;
                    }
                end;
            end;

        Canvas.Font.Color := var_Color_Normal;
    end;
end;

procedure Tf_clientes_000.DBGrid_ContactosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then Editar_Registro_Contactos;
end;

procedure Tf_clientes_000.DBGrid_EnviosDblClick(Sender: TObject);
begin
  Editar_Registro_Envios;
end;

procedure Tf_clientes_000.DBGrid_EnviosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var var_Color_Normal : TColor;
begin
    with Sender as TDBGrid do
    begin
        if SQLQuery_Clientes_Envios.RecordCount = 0 then Exit;

        var_Color_Normal := Canvas.Brush.Color;

      { ************************************************************************
        Primero comprobamos si es un registro dado de baja o no
        ************************************************************************ }
        if not SQLQuery_Clientes_Envios.FieldByName('Del_WHEN').IsNull then
            begin
              { ****************************************************************
                Registro DADO de BAJA
                **************************************************************** }
                Canvas.Font.Color := clSilver;
            end
        else
            begin
              { ****************************************************************
                Registro DADO de ALTA, NO BAJA
                ****************************************************************
                Así que las pinto, pero sólo si no son las columnas que van a
                ser dibujadas
                **************************************************************** }
                if State <> [gdSelected] then
                begin
                    if (Column.FieldName <> 'COLUMNA_CON_IMAGEN') then
                    begin
                        Canvas.font.Color := clBlack;
                    end;
                end;
            end;

      { ************************************************************************
        Ahora paso a dibujar una celda normal con los colores elegidos o una
        dibujada
        ************************************************************************ }
        if (Column.FieldName <> 'COLUMNA_CON_IMAGEN') then
            begin
              { ****************************************************************
                No es una de las columnas a dibujar por lo que la pinto con los
                colores elegidos
                **************************************************************** }
                DefaultDrawColumnCell(Rect, DataCol, Column, State)
            end
        else
            begin
              { ****************************************************************
                Es una de las columnas a dibujar
                **************************************************************** }
                // COLUMNA CONFIRMADA
                if Column.FieldName = 'COLUMNA_CON_IMAGEN'  then
                begin
                    {
                    if Trim(SQLQuery_Clientes_Envios.FieldByName('id_medio').asString) = '1' then
                    begin
                        Canvas.StretchDraw(param_Rect, Image_Confirmado.Picture.Graphic);
                    end;
                    }
                end;
            end;

        Canvas.Font.Color := var_Color_Normal;
    end;
end;

procedure Tf_clientes_000.DBGrid_EnviosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then Editar_Registro_Envios;
end;

procedure Tf_clientes_000.DBGrid_PrincipalDblClick(Sender: TObject);
begin
  inherited;
end;

procedure Tf_clientes_000.DBNavigator_ContactosBeforeAction(Sender: TObject;
  Button: TDBNavButtonType);
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
      Refrescar_Registros_clientes_contactos;
      Abort;
    end;
  end;
end;

procedure Tf_clientes_000.DBNavigator_EnviosBeforeAction(Sender: TObject;
  Button: TDBNavButtonType);
begin
  case Button of
    nbInsert : begin
      Insertar_Registro_Envios;
      Abort;
    end;

    nbEdit : begin
      Editar_Registro_Envios;
      Abort;
    end;

    nbDelete : begin
      Borrar_Registro_Envios;
      Abort;
    end;

    nbRefresh : begin
      Refrescar_Registros_clientes_envios;
      Abort;
    end;
  end;
end;

procedure Tf_clientes_000.Edit_Cta_Bco_Descripcion_PaisClick(Sender: TObject);
var var_msg : TStrings;
begin
  var_msg := TStringList.Create;
  var_msg.Add('¿QUITAMOS el PAIS del banco?');
  if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
  begin
    SQLQuery_Principal.FieldByName('id_Cta_Bco_pais').Clear;
    Edit_Cta_Bco_Descripcion_Pais.Text := '';
  end;
  var_msg.Free;
end;

procedure Tf_clientes_000.Edit_Cta_Bco_Descripcion_PoblacionClick(
  Sender: TObject);
var var_msg : TStrings;
begin
  var_msg := TStringList.Create;
  var_msg.Add('¿QUITAMOS la POBLACIÓN del banco?');
  if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
  begin
    SQLQuery_Principal.FieldByName('id_Cta_Bco_poblaciones').Clear;
    Edit_Cta_Bco_Descripcion_Poblacion.Text := '';
  end;
  var_msg.Free;
end;

procedure Tf_clientes_000.Edit_Cta_Bco_Descripcion_ProvinciaClick(
  Sender: TObject);
var var_msg : TStrings;
begin
  var_msg := TStringList.Create;
  var_msg.Add('¿QUITAMOS la PROVINCIA del banco?');
  if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
  begin
    SQLQuery_Principal.FieldByName('id_Cta_Bco_provincias').Clear;
    Edit_Cta_Bco_Descripcion_Provincia.Text := '';
  end;
  var_msg.Free;
end;

procedure Tf_clientes_000.Edit_Descripcion_ActividadClick(Sender: TObject);
var var_msg : TStrings;
begin
  var_msg := TStringList.Create;
  var_msg.Add('¿QUITAMOS la ACTIVIDAD?');
  if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
  begin
    SQLQuery_Principal.FieldByName('id_actividades').Clear;
    Edit_Descripcion_Actividad.Text := '';
  end;
  var_msg.Free;
end;

procedure Tf_clientes_000.Edit_Descripcion_Agencia_TransporteClick(
  Sender: TObject);
var var_msg : TStrings;
begin
  var_msg := TStringList.Create;
  var_msg.Add('¿QUITAMOS la AGENCIA DE TRANSPORTE?');
  if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
  begin
    SQLQuery_Principal.FieldByName('id_Agencias_Transporte').Clear;
    Edit_Descripcion_Agencia_Transporte.Text := '';
  end;
  var_msg.Free;
end;

procedure Tf_clientes_000.Edit_Descripcion_Forma_PagoClick(Sender: TObject);
var var_msg : TStrings;
begin
  var_msg := TStringList.Create;
  var_msg.Add('¿QUITAMOS la FORMA DE PAGO?');
  if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
  begin
    SQLQuery_Principal.FieldByName('id_formas_pago').Clear;
    Edit_Descripcion_Forma_Pago.Text := '';
  end;
  var_msg.Free;
end;

procedure Tf_clientes_000.Edit_Descripcion_TarifaClick(Sender: TObject);
var var_msg : TStrings;
begin
  var_msg := TStringList.Create;
  var_msg.Add('¿QUITAMOS la TARIFA?');
  if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
  begin
    SQLQuery_Principal.FieldByName('id_tarifas').Clear;
    Edit_Descripcion_Tarifa.Text := '';
  end;
  var_msg.Free;
end;

procedure Tf_clientes_000.Edit_Descripcion_Cliente_TipoClick(Sender: TObject);
var var_msg : TStrings;
begin
  var_msg := TStringList.Create;
  var_msg.Add('¿QUITAMOS el TIPO DE CLIENTE?');
  if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
  begin
    SQLQuery_Principal.FieldByName('id_clientes_tipos').Clear;
    Edit_Descripcion_Cliente_Tipo.Text := '';
  end;
  var_msg.Free;
end;

procedure Tf_clientes_000.Edit_Descripcion_PaisClick(Sender: TObject);
var var_msg : TStrings;
begin
  var_msg := TStringList.Create;
  var_msg.Add('¿QUITAMOS el PAIS?');
  if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
  begin
    SQLQuery_Principal.FieldByName('id_paises').Clear;
    Edit_Descripcion_Pais.Text := '';
  end;
  var_msg.Free;
end;

procedure Tf_clientes_000.Edit_Descripcion_PoblacionClick(Sender: TObject);
var var_msg : TStrings;
begin
  var_msg := TStringList.Create;
  var_msg.Add('¿QUITAMOS la POBLACIÓN?');
  if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
  begin
    SQLQuery_Principal.FieldByName('id_poblaciones').Clear;
    Edit_Descripcion_Poblacion.Text := '';
  end;
  var_msg.Free;
end;

procedure Tf_clientes_000.Edit_Descripcion_ProvinciaClick(Sender: TObject);
var var_msg : TStrings;
begin
  var_msg := TStringList.Create;
  var_msg.Add('¿QUITAMOS la PROVINCIA?');
  if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
  begin
    SQLQuery_Principal.FieldByName('id_provincias').Clear;
    Edit_Descripcion_Provincia.Text := '';
  end;
  var_msg.Free;
end;

procedure Tf_clientes_000.Edit_Descripcion_RepresentanteClick(Sender: TObject);
var var_msg : TStrings;
begin
  var_msg := TStringList.Create;
  var_msg.Add('¿QUITAMOS el REPRESENTANTE?');
  if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
  begin
    SQLQuery_Principal.FieldByName('id_Representantes').Clear;
    Edit_Descripcion_Representante.Text := '';
  end;
  var_msg.Free;
end;

procedure Tf_clientes_000.Edit_Descripcion_RutaClick(Sender: TObject);
var var_msg : TStrings;
begin
  var_msg := TStringList.Create;
  var_msg.Add('¿QUITAMOS la RUTA?');
  if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
  begin
    SQLQuery_Principal.FieldByName('id_rutas').Clear;
    Edit_Descripcion_Ruta.Text := '';
  end;
  var_msg.Free;
end;

procedure Tf_clientes_000.NewRecord_Insert_SQLQuery_Principal;
begin
  with SQLQuery_Principal do
  begin
    // ********************************************************************************************* //
    // ** CAMPOS QUE SON OBLIGADOS                                                                ** //
    // ********************************************************************************************* //
    FieldByName('Vencimientos_automaticos_SN').AsString := 'N';

    FieldByName('IVA_con_Recargo_SN').AsString          := 'N';
    FieldByName('IVA_Excluido_SN').AsString             := 'N';
    FieldByName('Agrupar_Albaranes_SN').AsString        := 'N';
    FieldByName('Activar_Proximidad_SN').AsString       := 'S';

    FieldByName('Riesgo_Autorizado').AsString           := '0';
    FieldByName('Riesgo_Acumulado').AsString            := '0';

    FieldByName('Portes_Pagados_SN').AsString           := 'S';
  end;

end;

procedure Tf_clientes_000.Antes_del_Post_Principal_Sin_Rellenar_Permitido_SI( p_msg : TStrings );
begin
  // *********************************************************************************************** //
  // ** Ahora vienen las comprobaciones de porque no grabamos                                     ** //
  // *********************************************************************************************** //
  with SQLQuery_Principal do
  begin

    if Trim(FieldByName('id_tarifas').AsString) = '' then
    begin
      if Trim(UpperCase(form_menu.public_User_Configuracion.Clientes_Obligar_Tarifa_SN)) <> 'S' then
      begin
        p_msg.Add(rs_clientes_012);
      end;
    end;

    if Trim(FieldByName('id_formas_pago').AsString) = '' then
    begin
      if Trim(UpperCase(form_menu.public_User_Configuracion.Clientes_Obligar_FormaPago_SN)) <> 'S' then
      begin
        p_msg.Add(rs_clientes_013);
      end;
    end;

    if Trim(FieldByName('id_actividades').AsString) = '' then
    begin
      if Trim(UpperCase(form_menu.public_User_Configuracion.Clientes_Obligar_Actividad_SN)) <> 'S' then
      begin
        p_msg.Add(rs_clientes_014);
      end;
    end;

    if Trim(FieldByName('id_rutas').AsString) = '' then
    begin
      if Trim(UpperCase(form_menu.public_User_Configuracion.Clientes_Obligar_Ruta_SN)) <> 'S' then
      begin
        p_msg.Add(rs_clientes_015);
      end;
    end;

    if Trim(FieldByName('id_clientes_tipos').AsString) = '' then
    begin
      if Trim(UpperCase(form_menu.public_User_Configuracion.Clientes_Obligar_Tipo_Cliente_SN)) <> 'S' then
      begin
        p_msg.Add(rs_clientes_016);
      end;
    end;

    if Trim(UpperCase(form_menu.public_User_Configuracion.Clientes_Obligar_NIF_SN)) <> 'S' then
    begin
      if Trim(FieldByName('nif_cif').AsString) = '' then
      begin
        p_msg.Add(rs_clientes_029);
      end;
    end;

    if Trim(UpperCase(form_menu.public_User_Configuracion.Clientes_Obligar_Cuenta_Contable_SN)) <> 'S' then
    begin
      if Trim(FieldByName('Cuenta_Contable').AsString) = '' then
      begin
        p_msg.Add(rs_clientes_030);
      end;
    end;

  end;
end;

procedure Tf_clientes_000.Antes_del_Post_Principal_Sin_Rellenar_Permitido_NO( p_msg,
                                                                              p_msg_Comprobar : TStrings );
begin
  // *********************************************************************************************** //
  // ** Ahora vienen las comprobaciones de porque no grabamos                                     ** //
  // *********************************************************************************************** //
  with SQLQuery_Principal do
  begin
    if Trim(FieldByName('nombre_propietario').AsString) = '' then
    begin
      p_msg.Add(rs_clientes_001);
    end;

    if Trim(FieldByName('Direccion').AsString) = '' then
    begin
      p_msg.Add(rs_clientes_002);
    end;

    if Trim(FieldByName('id_poblaciones').AsString) = '' then
    begin
      p_msg.Add(rs_clientes_003);
    end;

    if Trim(FieldByName('id_provincias').AsString) = '' then
    begin
      p_msg.Add(rs_clientes_004);
    end;

    if Trim(FieldByName('id_paises').AsString) = '' then
    begin
      p_msg.Add(rs_clientes_005);
    end;

    if Trim(FieldByName('Vencimientos_automaticos_SN').AsString) = '' then
    begin
      p_msg.Add(rs_clientes_031);
    end;

    if Trim(FieldByName('IVA_con_Recargo_SN').AsString) = '' then
    begin
      p_msg.Add(rs_clientes_006);
    end;

    if Trim(FieldByName('IVA_Excluido_SN').AsString) = '' then
    begin
      p_msg.Add(rs_clientes_007);
    end;

    if Trim(FieldByName('Riesgo_Autorizado').AsString) = '' then
    begin
      p_msg.Add(rs_clientes_008);
    end;

    if Trim(FieldByName('Riesgo_Acumulado').AsString) = '' then
    begin
      p_msg.Add(rs_clientes_009);
    end;

    if Trim(FieldByName('Agrupar_Albaranes_SN').AsString) = '' then
    begin
      p_msg.Add(rs_clientes_010);
    end;

    if Trim(FieldByName('Activar_Proximidad_SN').AsString) = '' then
    begin
      p_msg.Add(rs_clientes_011);
    end;

    // ************************************************************************************* //
    // ** DATOS QUE se debe de comprobar si son o NO SON OBLIGADOS PERO SE DEBE DE AVISAR ** //
    // ** DE SU FALTA                                                                     ** //
    // ************************************************************************************* //
    form_Menu.Traer_Configuracion_APP;

    if Trim(FieldByName('id_tarifas').AsString) = '' then
    begin
      if Trim(UpperCase(form_menu.public_User_Configuracion.Clientes_Obligar_Tarifa_SN)) = 'S' then
      begin
        p_msg.Add(rs_clientes_012);
      end;
    end;

    if Trim(FieldByName('id_formas_pago').AsString) = '' then
    begin
      if Trim(UpperCase(form_menu.public_User_Configuracion.Clientes_Obligar_FormaPago_SN)) = 'S' then
      begin
        p_msg.Add(rs_clientes_013);
      end;
    end;

    if Trim(FieldByName('id_actividades').AsString) = '' then
    begin
      if Trim(UpperCase(form_menu.public_User_Configuracion.Clientes_Obligar_Actividad_SN)) = 'S' then
      begin
        p_msg.Add(rs_clientes_014);
      end;
    end;

    if Trim(FieldByName('id_rutas').AsString) = '' then
    begin
      if Trim(UpperCase(form_menu.public_User_Configuracion.Clientes_Obligar_Ruta_SN)) = 'S' then
      begin
        p_msg.Add(rs_clientes_015);
      end;
    end;

    if Trim(FieldByName('id_clientes_tipos').AsString) = '' then
    begin
      if Trim(UpperCase(form_menu.public_User_Configuracion.Clientes_Obligar_Tipo_Cliente_SN)) = 'S' then
      begin
        p_msg.Add(rs_clientes_016);
      end;
    end;

    if Trim(UpperCase(form_menu.public_User_Configuracion.Clientes_Obligar_NIF_SN)) = 'S' then
    begin
      UTI_CONTA_esta_NIF_BIEN( form_menu.public_User_Configuracion.Clientes_Obligar_NIF_SN,  //.... aqui tambien permitir el control de exigirlo o no
                               p_msg,
                               SQLQuery_Principal,
                               'clientes' );
    end;

    if Trim(UpperCase(form_menu.public_User_Configuracion.Clientes_Obligar_Cuenta_Contable_SN)) = 'S' then
    begin
      UTI_CONTA_esta_Cta_Ctble_BIEN( form_menu.public_User_Configuracion.Clientes_Obligar_Cuenta_Contable_SN, //.... aqui tambien permitir el control de exigirlo o no
                                     p_msg,
                                     SQLQuery_Principal,
                                     FieldByName('Cuenta_Contable').Value,
                                     'clientes',
                                     'Cuenta_Contable',
                                     'LA CUENTA CONTABLE' );
    end;

  end;

end;

procedure Tf_clientes_000.Antes_del_Post_Principal_Asignar_Valores;
begin
  { Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo

  // *********************************************************************************************** //
  // ** Asignamos valores si no los tenían                                                        ** //
  // *********************************************************************************************** //
  with SQLQuery_Principal do
  begin
  (*
    if FieldByName('').IsNull then
    begin
      FieldByName('Nombre_Campo').Value := Valor_Campo;
    end;
  *)
  end;
}
end;

procedure Tf_clientes_000.Dibujar_Grid_Principal( p_Sender: TObject;
                                                  const p_Rect: TRect;
                                                  p_DataCol: Integer;
                                                  p_Column: TColumn;
                                                  p_State: TGridDrawState );
begin
  UTI_GEN_Dibujar_Grid( p_Sender, SQLQuery_Principal, p_Rect, p_DataCol, p_Column, p_State );
end;

procedure Tf_clientes_000.Cerramos_Tablas_Ligadas;
begin
  Cerrar_Tabla( Nil,
                Nil,
                SQLQuery_Clientes_Contactos );

  Cerrar_Tabla( Nil,
                Nil,
                SQLQuery_Clientes_Envios );
end;

procedure Tf_clientes_000.Cambiar_WindowState;
begin
  Self.WindowState := wsNormal; // Puede ser wsNormal, wsFullScreen, wsMaximized o wsMinimized
end;

procedure Tf_clientes_000.para_Empezar_GroupBox_Registro;
begin
  with SQLQuery_Principal do
  begin
    public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                       FieldByName('id_Agencias_Transporte').AsString,
                                                       '',
                                                       FieldByName('nombre_propietario').AsString,
                                                       FieldByName('nombre_comercial').AsString,
                                                       FieldByName('Cuenta_Contable').AsString );
  end;

  Presentar_Datos_GroupBox_Registro;
end;

procedure Tf_clientes_000.Presentar_Datos;
begin
  // *********************************************************************************************** //
  // ** En el Panel_Barra_Superior                                                                ** //
  // *********************************************************************************************** //

  // *********************************************************************************************** //
  // ** En el TabSheet_Busqueda_Concreta                                                          ** //
  // *********************************************************************************************** //

  // *********************************************************************************************** //
  // ** En el GroupBox_Grid                                                                       ** //
  // *********************************************************************************************** //

  // *********************************************************************************************** //
  // ** En el GroupBox_Registro                                                                   ** //
  // *********************************************************************************************** //
  Presentar_Datos_GroupBox_Registro;
end;

procedure Tf_clientes_000.Presentar_Datos_GroupBox_Registro;
begin
  PageControl_Otros_Datos.ActivePage := TabSheet_DatosAdicionales;

  with SQLQuery_Principal do
  begin
    if RecordCount > 0 then
    begin
      Edit_Descripcion_Poblacion.Text          := FieldByName('OT_descripcion_poblacion').AsString;
      Edit_Descripcion_Provincia.Text          := FieldByName('OT_descripcion_provincia').AsString;
      Edit_Descripcion_Pais.Text               := FieldByName('OT_descripcion_pais').AsString;
      Edit_Descripcion_Cliente_Tipo.Text       := FieldByName('OT_descripcion_cliente_tipo').AsString;
      Edit_Descripcion_Representante.Text      := FieldByName('OT_descripcion_representante').AsString;
      Edit_Descripcion_Ruta.Text               := FieldByName('OT_descripcion_ruta').AsString;
      Edit_Tfno_Fijo_1_representante.Text      := FieldByName('OT_Tfno_Fijo_1_representante').AsString;
      Edit_OT_Movil_representante.Text         := FieldByName('OT_Movil_representante').AsString;
      Edit_Descripcion_Actividad.Text          := FieldByName('OT_descripcion_actividad').AsString;
      Edit_Cta_Bco_Descripcion_Poblacion.Text  := FieldByName('OT_Cta_Bco_descripcion_poblacion').AsString;
      Edit_Cta_Bco_Descripcion_Provincia.Text  := FieldByName('OT_Cta_Bco_descripcion_provincia').AsString;
      Edit_Cta_Bco_Descripcion_Pais.Text       := FieldByName('OT_Cta_Bco_descripcion_pais').AsString;
      Edit_Descripcion_Forma_Pago.Text         := FieldByName('OT_descripcion_forma_pago').AsString;
      Edit_Descripcion_Tarifa.Text             := FieldByName('OT_descripcion_tarifa').AsString;
      Edit_Descripcion_Agencia_Transporte.Text := FieldByName('OT_descripcion_agencia_transporte').AsString;
      Edit_Tfno_Fijo_1_agencia_transporte.Text := FieldByName('OT_Tfno_Fijo_1_agencia_transporte').AsString;
      Edit_Movil_agencia_transporte.Text       := FieldByName('OT_Movil_agencia_transporte').AsString;
    end;
  end;
end;

procedure Tf_clientes_000.Refrescar_Registros;
var var_nombre_propietario          : String;
    var_Direccion                   : String;
    var_id_poblaciones              : Int64;
    var_id_provincias               : Int64;
    var_id_paises                   : Int64;
    var_IVA_con_Recargo_SN          : ShortString;
    var_IVA_Excluido_SN             : ShortString;
    var_Vencimientos_automaticos_SN : ShortString;
    var_Agrupar_Albaranes_SN        : ShortString;
    var_Activar_Proximidad_SN       : ShortString;
    var_Portes_Pagados_SN           : ShortString;

    v_Insert_WHEN                   : TDateTime;
    v_Insert_Id_User                : Largeint;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    with SQLQuery_Principal do
    begin
      var_nombre_propietario := '';

      if RecordCount > 0 then
      begin
          var_nombre_propietario          := FieldByName('nombre_propietario').AsString;
          var_Direccion                   := FieldByName('Direccion').AsString;
          var_id_poblaciones              := FieldByName('id_poblaciones').Value;
          var_id_provincias               := FieldByName('id_provincias').Value;
          var_id_paises                   := FieldByName('id_paises').Value;

          var_IVA_con_Recargo_SN          := FieldByName('IVA_con_Recargo_SN').AsString;
          var_IVA_Excluido_SN             := FieldByName('IVA_Excluido_SN').AsString;
          var_Vencimientos_automaticos_SN := FieldByName('Vencimientos_automaticos_SN').AsString;
          var_Agrupar_Albaranes_SN        := FieldByName('Agrupar_Albaranes_SN').AsString;
          var_Activar_Proximidad_SN       := FieldByName('Activar_Proximidad_SN').AsString;
          var_Portes_Pagados_SN           := FieldByName('Portes_Pagados_SN').AsString;

          v_Insert_WHEN                   := FieldByName('Insert_WHEN').Value;
          v_Insert_Id_User                := FieldByName('Insert_Id_User').Value;
      end;

    end;

    Filtrar_Principal_Sin_Preguntar;

    if Trim(var_nombre_propietario) <> '' then
    begin
      SQLQuery_Principal.Locate( 'nombre_propietario;Direccion;id_poblaciones;id_provincias;id_paises;' +
                                 'IVA_con_Recargo_SN;IVA_Excluido_SN;' +
                                 'Vencimientos_automaticos_SN;Agrupar_Albaranes_SN;' +
                                 'Activar_Proximidad_SN;Portes_Pagados_SN;Insert_WHEN;Insert_Id_User',

                                 VarArrayOf( [ var_nombre_propietario, var_Direccion, var_id_poblaciones,
                                               var_id_provincias, var_id_paises,
                                               var_IVA_con_Recargo_SN, var_IVA_Excluido_SN,
                                               var_Vencimientos_automaticos_SN, var_Agrupar_Albaranes_SN,
                                               var_Activar_Proximidad_SN, var_Portes_Pagados_SN, v_Insert_WHEN, v_Insert_Id_User ] ),

                                 [] );
    end;
end;

procedure Tf_clientes_000.Refrescar_Registros_TablasLigadas;
begin
  Refrescar_Registros_clientes_contactos;
  Refrescar_Registros_clientes_envios;
end;

procedure Tf_clientes_000.Crear_tipos_orden_Principal;
begin
  SetLength(public_Order_By, 4);

  public_Order_By[0].Titulo       := 'Por nombre propietario'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
  public_Order_By[0].Memo_OrderBy := 'cl.nombre_propietario ASC';

  public_Order_By[1].Titulo       := 'Por nombre comercial';
  public_Order_By[1].Memo_OrderBy := 'cl.nombre_comercial ASC';

  public_Order_By[2].Titulo       := 'Por NIF / CIF';
  public_Order_By[2].Memo_OrderBy := 'cl.nif_cif ASC';

  public_Order_By[3].Titulo       := 'Por la id';
  public_Order_By[3].Memo_OrderBy := 'cl.id ASC';

  Memo_OrderBy.Lines.Text         := public_Order_By[0].Memo_OrderBy;

  UTI_TB_Rellenar_ComboBox_Orden( true,
                                  ComboBox_Filtros,
                                  public_Order_By,
                                  0 );
end;

procedure Tf_clientes_000.Rellenar_Filtros_Impresion(var p_Ordenado_por : String);
begin
  // ********************************************************************************************* //
  // ** Configuramos el título del listado                                                      ** //
  // ********************************************************************************************* //
  p_Ordenado_por := rs_Filtros_Otros_1 +
                    Trim(ComboBox_Filtros.Text);

  if Trim(Memo_Filtros.Lines.Text) <> '' then
  begin
    p_Ordenado_por := p_Ordenado_por +
                      rs_Filtros_Otros_2 +
                      Trim(Memo_Filtros.Lines.Text);
  end;

  Filtrar_Principal_HemosFiltradoPor(p_Ordenado_por);
end;

procedure Tf_clientes_000.SQLQuery_Clientes_ContactosAfterPost(DataSet: TDataSet);
begin
  UTI_RGTROS_Grabar( 'clientes_contactos',
                     SQLTransaction_Principal,
                     SQLQuery_Clientes_Contactos,
                     Devolver_hacemos_commit_alFinalizar );

  Refrescar_Registros_clientes_contactos;
end;

procedure Tf_clientes_000.SQLQuery_Clientes_ContactosBeforeEdit(DataSet: TDataSet);
begin
  UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Clientes_Contactos );
end;

procedure Tf_clientes_000.SQLQuery_Clientes_ContactosBeforePost(DataSet: TDataSet);
begin
  UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Clientes_Contactos );
end;

procedure Tf_clientes_000.SQLQuery_Clientes_ContactosCalcFields(DataSet: TDataSet);
begin
  with SQLQuery_Clientes_Contactos do
  begin
    // TELEFONOS
    FieldByName('OT_todos_los_Tfnos').AsString := '';

    if Trim(FieldByName('Tfno_Fijo_1').AsString) <> '' then
    begin
      if Trim(FieldByName('OT_todos_los_Tfnos').AsString) <> '' then
      begin
        FieldByName('OT_todos_los_Tfnos').AsString :=
              Trim(FieldByName('OT_todos_los_Tfnos').AsString) + ', ';
      end;

      FieldByName('OT_todos_los_Tfnos').AsString :=
            Trim(FieldByName('OT_todos_los_Tfnos').AsString) + ' ' +
            Trim(FieldByName('Tfno_Fijo_1').AsString);
    end;

    if Trim(FieldByName('Tfno_Fijo_2').AsString) <> '' then
    begin
      if Trim(FieldByName('OT_todos_los_Tfnos').AsString) <> '' then
      begin
        FieldByName('OT_todos_los_Tfnos').AsString :=
              Trim(FieldByName('OT_todos_los_Tfnos').AsString) + ', ';
      end;

      FieldByName('OT_todos_los_Tfnos').AsString :=
            Trim(FieldByName('OT_todos_los_Tfnos').AsString) + ' ' +
            Trim(FieldByName('Tfno_Fijo_2').AsString);
    end;

    if Trim(FieldByName('Movil').AsString) <> '' then
    begin
      if Trim(FieldByName('OT_todos_los_Tfnos').AsString) <> '' then
      begin
          FieldByName('OT_todos_los_Tfnos').AsString :=
                Trim(FieldByName('OT_todos_los_Tfnos').AsString) + ', ';
      end;

      FieldByName('OT_todos_los_Tfnos').AsString :=
            Trim(FieldByName('OT_todos_los_Tfnos').AsString) + ' ' +
            Trim(FieldByName('Movil').AsString);
    end;
  end;
end;

procedure Tf_clientes_000.SQLQuery_Clientes_EnviosAfterPost(DataSet: TDataSet);
begin
  UTI_RGTROS_Grabar( 'clientes_envios',
                     SQLTransaction_Principal,
                     SQLQuery_Clientes_Envios,
                     Devolver_hacemos_commit_alFinalizar );

  Refrescar_Registros_clientes_envios;
end;

procedure Tf_clientes_000.SQLQuery_Clientes_EnviosBeforeEdit(DataSet: TDataSet);
begin
  UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Clientes_Envios );
end;

procedure Tf_clientes_000.SQLQuery_Clientes_EnviosBeforePost(DataSet: TDataSet);
begin
  UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Clientes_Envios );
end;

procedure Tf_clientes_000.SQLQuery_Clientes_EnviosCalcFields(DataSet: TDataSet);
begin
  with SQLQuery_Clientes_Envios do
  begin
    // ***************************************************************************************** //
    // ** TELEFONOS                                                                           ** //
    // ***************************************************************************************** //
    FieldByName('OT_todos_los_Tfnos').AsString := '';

    // Tfno_Fijo_1
    if Trim(FieldByName('Tfno_Fijo_1').AsString) <> '' then
    begin
      if Trim(FieldByName('OT_todos_los_Tfnos').AsString) <> '' then
      begin
          FieldByName('OT_todos_los_Tfnos').AsString :=
                Trim(FieldByName('OT_todos_los_Tfnos').AsString) + ', ';
      end;

      FieldByName('OT_todos_los_Tfnos').AsString :=
            Trim(FieldByName('OT_todos_los_Tfnos').AsString) + ' ' +
            Trim(FieldByName('Tfno_Fijo_1').AsString);
    end;

    // Tfno_Fijo_2
    if Trim(FieldByName('Tfno_Fijo_2').AsString) <> '' then
    begin
      if Trim(FieldByName('OT_todos_los_Tfnos').AsString) <> '' then
      begin
        FieldByName('OT_todos_los_Tfnos').AsString :=
              Trim(FieldByName('OT_todos_los_Tfnos').AsString) + ', ';
      end;

      FieldByName('OT_todos_los_Tfnos').AsString :=
            Trim(FieldByName('OT_todos_los_Tfnos').AsString) + ' ' +
            Trim(FieldByName('Tfno_Fijo_2').AsString);
    end;

    // Movil
    if Trim(FieldByName('Movil').AsString) <> '' then
    begin
      if Trim(FieldByName('OT_todos_los_Tfnos').AsString) <> '' then
      begin
        FieldByName('OT_todos_los_Tfnos').AsString :=
              Trim(FieldByName('OT_todos_los_Tfnos').AsString) + ', ';
      end;

      FieldByName('OT_todos_los_Tfnos').AsString :=
            Trim(FieldByName('OT_todos_los_Tfnos').AsString) + ' ' +
            Trim(FieldByName('Movil').AsString);
    end;

    // ***************************************************************************************** //
    // ** DIRECCION ENTERA                                                                    ** //
    // ***************************************************************************************** //
    FieldByName('OT_Direccion_Entera').AsString := '';

    // Direccion
    if Trim(FieldByName('Direccion').AsString) <> '' then
    begin
      if Trim(FieldByName('OT_Direccion_Entera').AsString) <> '' then
      begin
        FieldByName('OT_Direccion_Entera').AsString :=
              Trim(FieldByName('OT_Direccion_Entera').AsString) + ', ';
      end;

      FieldByName('OT_Direccion_Entera').AsString :=
            Trim(FieldByName('OT_Direccion_Entera').AsString) + ' ' +
            Trim(FieldByName('Direccion').AsString);
    end;

    // Direccion_Numero
    if Trim(FieldByName('Direccion_Numero').AsString) <> '' then
    begin
      if Trim(FieldByName('OT_Direccion_Entera').AsString) <> '' then
      begin
        FieldByName('OT_Direccion_Entera').AsString :=
              Trim(FieldByName('OT_Direccion_Entera').AsString) + ', ';
      end;

      FieldByName('OT_Direccion_Entera').AsString :=
            Trim(FieldByName('OT_Direccion_Entera').AsString) + ' ' +
            Trim(FieldByName('Direccion_Numero').AsString);
    end;

    // Direccion_Piso_Letra
    if Trim(FieldByName('Direccion_Piso_Letra').AsString) <> '' then
    begin
      if Trim(FieldByName('OT_Direccion_Entera').AsString) <> '' then
      begin
        FieldByName('OT_Direccion_Entera').AsString :=
              Trim(FieldByName('OT_Direccion_Entera').AsString) + ', ';
      end;

      FieldByName('OT_Direccion_Entera').AsString :=
            Trim(FieldByName('OT_Direccion_Entera').AsString) + ' ' +
            Trim(FieldByName('Direccion_Piso_Letra').AsString);
    end;

    // Codigo_Postal
    if Trim(FieldByName('Codigo_Postal').AsString) <> '' then
    begin
      if Trim(FieldByName('OT_Direccion_Entera').AsString) <> '' then
      begin
        FieldByName('OT_Direccion_Entera').AsString :=
              Trim(FieldByName('OT_Direccion_Entera').AsString) + ', ';
      end;

      FieldByName('OT_Direccion_Entera').AsString :=
            Trim(FieldByName('OT_Direccion_Entera').AsString) + ' ' +
            Trim(FieldByName('Codigo_Postal').AsString);
    end;

    // OT_descripcion_poblacion
    if Trim(FieldByName('OT_descripcion_poblacion').AsString) <> '' then
    begin
      if Trim(FieldByName('OT_Direccion_Entera').AsString) <> '' then
      begin
        FieldByName('OT_Direccion_Entera').AsString :=
              Trim(FieldByName('OT_Direccion_Entera').AsString) + ', ';
      end;

      FieldByName('OT_Direccion_Entera').AsString :=
            Trim(FieldByName('OT_Direccion_Entera').AsString) + ' ' +
            Trim(FieldByName('OT_descripcion_poblacion').AsString);
    end;

    // OT_descripcion_provincia
    if Trim(FieldByName('OT_descripcion_provincia').AsString) <> '' then
    begin
      if Trim(FieldByName('OT_Direccion_Entera').AsString) <> '' then
      begin
        FieldByName('OT_Direccion_Entera').AsString :=
              Trim(FieldByName('OT_Direccion_Entera').AsString) + ', ';
      end;

      FieldByName('OT_Direccion_Entera').AsString :=
            Trim(FieldByName('OT_Direccion_Entera').AsString) + ' ' +
            Trim(FieldByName('OT_descripcion_provincia').AsString);
    end;

    // OT_descripcion_pais
    if Trim(FieldByName('OT_descripcion_pais').AsString) <> '' then
    begin
      if Trim(FieldByName('OT_Direccion_Entera').AsString) <> '' then
      begin
        FieldByName('OT_Direccion_Entera').AsString :=
              Trim(FieldByName('OT_Direccion_Entera').AsString) + ', ';
      end;

      FieldByName('OT_Direccion_Entera').AsString :=
            Trim(FieldByName('OT_Direccion_Entera').AsString) + ' ' +
            Trim(FieldByName('OT_descripcion_pais').AsString);
    end;
  end;
end;

procedure Tf_clientes_000.SQLQuery_PrincipalCalcFields(DataSet: TDataSet);
begin
  with SQLQuery_Principal do
  begin
      // TELEFONOS
      FieldByName('OT_todos_los_Tfnos').AsString := '';

      if Trim(FieldByName('Tfno_Fijo_1').AsString) <> '' then
      begin
        if Trim(FieldByName('OT_todos_los_Tfnos').AsString) <> '' then
        begin
          FieldByName('OT_todos_los_Tfnos').AsString :=
                Trim(FieldByName('OT_todos_los_Tfnos').AsString) + ', ';
        end;

        FieldByName('OT_todos_los_Tfnos').AsString :=
              Trim(FieldByName('OT_todos_los_Tfnos').AsString) + ' ' +
              Trim(FieldByName('Tfno_Fijo_1').AsString);
      end;

      if Trim(FieldByName('Tfno_Fijo_2').AsString) <> '' then
      begin
        if Trim(FieldByName('OT_todos_los_Tfnos').AsString) <> '' then
        begin
          FieldByName('OT_todos_los_Tfnos').AsString :=
                Trim(FieldByName('OT_todos_los_Tfnos').AsString) + ', ';
        end;

        FieldByName('OT_todos_los_Tfnos').AsString :=
              Trim(FieldByName('OT_todos_los_Tfnos').AsString) + ' ' +
              Trim(FieldByName('Tfno_Fijo_2').AsString);
      end;

      if Trim(FieldByName('Movil').AsString) <> '' then
      begin
        if Trim(FieldByName('OT_todos_los_Tfnos').AsString) <> '' then
        begin
          FieldByName('OT_todos_los_Tfnos').AsString :=
                Trim(FieldByName('OT_todos_los_Tfnos').AsString) + ', ';
        end;

        FieldByName('OT_todos_los_Tfnos').AsString :=
              Trim(FieldByName('OT_todos_los_Tfnos').AsString) + ' ' +
              Trim(FieldByName('Movil').AsString);
      end;
  end;
end;

procedure Tf_clientes_000.Campo_Foco_en_modo_Edicion_Inserccion;
begin
  Self.ActiveControl := DBEdit_a_quien_facturamos;
end;

procedure Tf_clientes_000.Traer_poblacion_xID( param_id : String;
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
    param_SQLQuery.Name     := 'SQLQuery_Traer_poblacion_xID';
    param_SQLQuery.Database := param_SQLConnector;

    // ********************************************************************************************* //
    // ** Creamos la SQL                                                                          ** //
    // ********************************************************************************************* //
    param_SQLQuery.SQL.Clear;
    param_SQLQuery.SQL.AddStrings( 'SELECT pb.*,' + ' ' +
                                          'pr.descripcion AS OT_descripcion_provincia,' + ' ' +
                                          'ps.descripcion AS OT_descripcion_pais' + ' ' +
                                   'FROM poblaciones AS pb' + ' ' +

                                   'LEFT JOIN provincias AS pr' + ' ' +
                                   'ON pb.id_provincias = pr.id' + ' ' +

                                   'LEFT JOIN paises AS ps' + ' ' +
                                   'ON pb.id_paises = ps.id' + ' ' );

    // ********************************************************************************************* //
    // ** Continuamos con la confección de la SQL                                                 ** //
    // ********************************************************************************************* //
    param_SQLQuery.SQL.Add( 'WHERE pb.id = ' + Trim(param_id) );
    param_SQLQuery.SQL.Add( 'ORDER BY pb.id ASC' );

    // ********************************************************************************************* //
    // ** Abrimos la Query                                                                        ** //
    // ********************************************************************************************* //
    if UTI_TB_Query_Open( '',
                          '',
                          '',
                          param_SQLConnector,
                          param_SQLQuery,
                          -1, // asi me trae todos los registros de golpe
                          param_SQLQuery.SQL.Text ) = false then UTI_GEN_Salir;
end;

procedure Tf_clientes_000.Comprobar_Resto_Datos_Poblacion(param_id : String);
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

    Traer_poblacion_xID( param_id,
                         var_SQLTransaction,
                         var_SQLConnector,
                         var_SQLQuery );

    // ***************************************************************************************** //
    // ** Hacemos las comprobaciones que nos hagan falta de la SQL que hemos hecho            ** //
    // ***************************************************************************************** //
    with var_SQLQuery do
    begin
      if RecordCount <> 0 then
      begin
        if Trim(FieldByName('Codigo_Postal').AsString) <> '' then
        begin
          if Trim(SQLQuery_Principal.FieldByName('Codigo_Postal').AsString) = '' then
          begin
            SQLQuery_Principal.FieldByName('Codigo_Postal').AsString := FieldByName('Codigo_Postal').AsString;
          end;
        end;
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
      UTI_GEN_Error_Log( 'Ocurrió un error al intentar traer todos los datos de la población elegida.' +
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

procedure Tf_clientes_000.Insertar_Registro_Contactos;
var var_msg           : TStrings;
    var_Form          : Tf_clientes_001;
    var_record_Existe : Trecord_Existe;
begin
  if public_Solo_Ver = true then
  begin
    Exit;
  end;

  with SQLQuery_Clientes_Contactos do
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

        FieldByName('id_clientes').AsString := SQLQuery_Principal.FieldByName('id').AsString;

        var_Form := Tf_clientes_001.Create(nil);

        var_Form.para_Empezar_GroupBox_Registro;

        var_Form.ShowModal;

        if var_Form.public_Pulso_Aceptar = true then
        begin
          var_Form.Free;

          var_record_Existe := UTI_RGTRO_Existe_Ya( 'clientes_contactos',                             // param_nombre_tabla
                                                    'ORDER BY clientes_contactos.id_clientes ASC, ' +
                                                             'clientes_contactos.nombre ASC',         // param_order_by
                                                    '',                                               // param_id_a_no_traer ... Estoy insertando
                                                    FieldByName('id_clientes').AsString,              // param_que_id_buscar
                                                    'id_clientes',                                    // param_que_id_buscar_nombre_campo
                                                    FieldByName('nombre').AsString,                   // param_que_Buscar
                                                    'nombre' );                                       // param_que_Buscar_nombre_campo

          if var_record_Existe.Fallo_en_Conexion_BD = true then
          begin
            var_msg.Add( rs_clientes_032 );
            UTI_GEN_Aviso(true, var_msg, rs_Ya_Existe, True, False);
            Cancel;
          end
          else
          begin
            if var_record_Existe.Existe = false then
            begin
              FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
              FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

              UTI_RGTRO_Grabar_Antes( 'clientes_contactos', SQLQuery_Clientes_Contactos );
            end
            else
            begin
              Cancel;
              var_msg.Clear;

              var_msg.Add( rs_clientes_033 + Trim(FieldByName('id_clientes').AsString) );

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

procedure Tf_clientes_000.Editar_Registro_Contactos;
var var_msg           : TStrings;
    var_Form          : Tf_clientes_001;
    var_record_Existe : Trecord_Existe;
    var_id            : ShortString;
begin
  if public_Solo_Ver = true then
  begin
    Exit;
  end;

  with SQLQuery_Clientes_Contactos do
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
        end else
        begin
          if UTI_RGTRO_Lock( 'clientes_contactos',
                             FieldByName('id').AsString ) = true then
               Edit
          else Exit;
        end;

        var_Form := Tf_clientes_001.Create(nil);

        var_Form.para_Empezar_GroupBox_Registro;

        var_Form.ShowModal;
        if var_Form.public_Pulso_Aceptar = true then
        begin

          jerofa tienes que cambiar todos los existe_

          var_record_Existe := UTI_RGTRO_Existe_Ya( 'clientes_contactos',                             // param_nombre_tabla
                                                    'ORDER BY clientes_contactos.id_clientes ASC, ' +
                                                             'clientes_contactos.nombre ASC',         // param_order_by
                                                    FieldByName('id').AsString,                       // param_id_a_no_traer ... Estoy insertando
                                                    FieldByName('id_clientes').AsString,              // param_que_id_buscar
                                                    'id_clientes',                                    // param_que_id_buscar_nombre_campo
                                                    FieldByName('nombre').AsString,                   // param_que_Buscar
                                                    'nombre' );                                       // param_que_Buscar_nombre_campo

          if var_record_Existe.Fallo_en_Conexion_BD = true then
          begin
            var_Form.Free;
            var_msg.Add( rs_clientes_032 );
            UTI_GEN_Aviso(true, var_msg, rs_Ya_Existe, True, False);
            Cancel;
          end
          else
          begin
            if var_record_Existe.Existe = false then
            begin
              if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( SQLQuery_Clientes_Contactos ) = true then
              begin
                FieldByName('Change_WHEN').Value               := UTI_CN_Fecha_Hora;
                FieldByName('Change_Id_User').Value            := Form_Menu.public_User;

                UTI_RGTRO_Grabar_Antes( 'clientes_contactos', SQLQuery_Clientes_Contactos );
              end
              else
              begin
                Cancel;
              end;

              var_Form.Free;
            end
            else
            begin
              var_Form.Free;
              Cancel;
              var_msg.Clear;

              var_msg.Add( rs_clientes_033 + Trim(FieldByName('id_clientes').AsString) );

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

        UTI_RGTRO_UnLock( 'clientes_contactos', var_id );
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

procedure Tf_clientes_000.Borrar_Registro_Contactos;
begin
  if public_Solo_Ver = true then
  begin
    Exit;
  end;

  if UTI_USR_Permiso_SN(public_Menu_Worked, 'B', True) = True then
  begin
    UTI_RGTRO_Borrar( 'clientes_contactos',
                      SQLQuery_Clientes_Contactos,
                      public_Solo_Ver,
                      public_Menu_Worked );
  end;
end;

procedure Tf_clientes_000.Borrar_Registro_Envios;
begin
  if public_Solo_Ver = true then
  begin
    Exit;
  end;

  if UTI_USR_Permiso_SN(public_Menu_Worked, 'B', True) = True then
  begin
    UTI_RGTRO_Borrar( 'clientes_envios',
                      SQLQuery_Clientes_Envios,
                      public_Solo_Ver,
                      public_Menu_Worked );
  end;
end;

procedure Tf_clientes_000.Refrescar_Registros_clientes_contactos;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;

    var_id_clientes    : Largeint;
    var_nombre         : String;

    var_Hay_Datos      : Boolean;
    var_ver_Bajas      : ShortInt;
begin
  // ********************************************************************************************* //
  // ** Solo si la cabecera está en modo EDIT se abren las tablas hijas                         ** //
  // ********************************************************************************************* //
  if SQLQuery_Principal.State <> dsEdit then Exit;

  // ********************************************************************************************* //
  // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
  // ********************************************************************************************* //
  var_Hay_Datos := false;

  if SQLQuery_Clientes_Contactos.RecordCount > 0 then
  begin
    var_Hay_Datos   := true;

    var_id_clientes := SQLQuery_Clientes_Contactos.FieldByName('id_clientes').Value;
    var_nombre      := SQLQuery_Clientes_Contactos.FieldByName('nombre').Value;
  end;

  var_Lineas_Filtro  := TStringList.Create;
  var_Lineas_OrderBy := TStringList.Create;

  var_Lineas_Filtro.Clear;
  var_Lineas_OrderBy.Clear;

  if Trim(SQLQuery_Principal.FieldByName('id').AsString) <> '' then
       var_Lineas_Filtro.Add('id_clientes = ' + Trim(SQLQuery_Principal.FieldByName('id').AsString))
  else var_Lineas_Filtro.Add('id_clientes = Null');

  var_ver_Bajas := RadioGroup_Bajas.ItemIndex;

  Filtrar_clientes_contactos( var_ver_Bajas,
                              false,
                              var_Lineas_Filtro,
                              var_Lineas_OrderBy );

  var_Lineas_Filtro.Free;
  var_Lineas_OrderBy.Free;

  if var_Hay_Datos = true then
  begin
    SQLQuery_Clientes_Contactos.Locate( 'id_clientes;nombre',
                                        VarArrayOf( [ var_id_clientes, var_nombre ] ),
                                        [] );
  end;
end;

procedure Tf_clientes_000.Refrescar_Registros_clientes_envios;
var var_Lineas_Filtro        : TStrings;
    var_Lineas_OrderBy       : TStrings;

    var_id_clientes          : Largeint;
    var_Direccion            : String;
    var_Direccion_Numero     : String;
    var_Direccion_Piso_Letra : String;
    var_Codigo_Postal        : String;
    var_id_poblaciones       : LargeInt;
    var_id_provincias        : Integer;
    var_id_paises            : Integer;


    var_Hay_Datos            : Boolean;
    var_ver_Bajas            : ShortInt;
begin
  // ********************************************************************************************* //
  // ** Solo si la cabecera está en modo EDIT se abren las tablas hijas                         ** //
  // ********************************************************************************************* //
  if SQLQuery_Principal.State <> dsEdit then Exit;

  // ********************************************************************************************* //
  // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
  // ********************************************************************************************* //
  var_Hay_Datos := false;

  if SQLQuery_Clientes_Envios.RecordCount > 0 then
  begin
    var_Hay_Datos            := true;

    var_id_clientes          := SQLQuery_Clientes_Envios.FieldByName('id_clientes').Value;
    var_Direccion            := SQLQuery_Clientes_Envios.FieldByName('Direccion').AsString;
    var_Direccion_Numero     := SQLQuery_Clientes_Envios.FieldByName('Direccion_Numero').AsString;
    var_Direccion_Piso_Letra := SQLQuery_Clientes_Envios.FieldByName('Direccion_Piso_Letra').AsString;
    var_Codigo_Postal        := SQLQuery_Clientes_Envios.FieldByName('Codigo_Postal').AsString;

    if not SQLQuery_Clientes_Envios.FieldByName('id_poblaciones').IsNull then
      var_id_poblaciones := SQLQuery_Clientes_Envios.FieldByName('id_poblaciones').Value;

    if not SQLQuery_Clientes_Envios.FieldByName('id_provincias').IsNull then
      var_id_provincias := SQLQuery_Clientes_Envios.FieldByName('id_provincias').Value;

    if not SQLQuery_Clientes_Envios.FieldByName('id_paises').IsNull then
      var_id_paises := SQLQuery_Clientes_Envios.FieldByName('id_paises').Value;
  end;

  var_Lineas_Filtro  := TStringList.Create;
  var_Lineas_OrderBy := TStringList.Create;

  var_Lineas_Filtro.Clear;
  var_Lineas_OrderBy.Clear;

  if Trim(SQLQuery_Principal.FieldByName('id').AsString) <> '' then
       var_Lineas_Filtro.Add('id_clientes = ' + Trim(SQLQuery_Principal.FieldByName('id').AsString))
  else var_Lineas_Filtro.Add('id_clientes = Null');

  var_ver_Bajas := RadioGroup_Bajas.ItemIndex;
  Filtrar_clientes_envios( var_ver_Bajas,
                           false,
                           var_Lineas_Filtro,
                           var_Lineas_OrderBy );
  var_Lineas_Filtro.Free;
  var_Lineas_OrderBy.Free;

  if var_Hay_Datos = true then
  begin
    SQLQuery_Clientes_Envios.Locate( 'id_clientes;Direccion;Direccion_Numero;Direccion_Piso_Letra;Codigo_Postal;id_poblaciones;id_provincias;id_paises',
                                     VarArrayOf( [ var_id_clientes,
                                                   var_Direccion,
                                                   var_Direccion_Numero,
                                                   var_Direccion_Piso_Letra,
                                                   var_Codigo_Postal,
                                                   var_id_poblaciones,
                                                   var_id_provincias,
                                                   var_id_paises ] ),
                                     [] );
  end;
end;

procedure Tf_clientes_000.Insertar_Registro_Envios;
var var_msg           : TStrings;
    var_Form          : Tf_clientes_002;
    var_record_Existe : Trecord_Existe;
begin
  if public_Solo_Ver = true then
  begin
    Exit;
  end;

  with SQLQuery_Clientes_Envios do
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

        FieldByName('id_clientes').AsString       := SQLQuery_Principal.FieldByName('id').AsString;
        FieldByName('Portes_Pagados_SN').AsString := 'S';

        var_Form := Tf_clientes_002.Create(nil);

        var_Form.para_Empezar_GroupBox_Registro;

        var_Form.ShowModal;

        if var_Form.public_Pulso_Aceptar = true then
        begin
          var_Form.Free;

          FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
          FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

          UTI_RGTRO_Grabar_Antes( 'clientes_envios', SQLQuery_Clientes_Envios );
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

procedure Tf_clientes_000.Editar_Registro_Envios;
var var_msg           : TStrings;
    var_Form          : Tf_clientes_002;
    var_record_Existe : Trecord_Existe;
    var_id            : ShortString;
begin
  if public_Solo_Ver = true then
  begin
    Exit;
  end;

  with SQLQuery_clientes_envios do
  begin
    var_msg := TStringList.Create;

    if RecordCount > 0 then
    begin
      var_id := FieldByName('id').AsString;

      if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
      begin
        if UTI_RGTRO_isLock( 'clientes_envios',
                             FieldByName('id').AsString,
                             true ) = true then
        begin
          Exit;
        end else
        begin
          if UTI_RGTRO_Lock( 'clientes_envios',
                             FieldByName('id').AsString ) = true then
               Edit
          else Exit;
        end;

        var_Form := Tf_clientes_002.Create(nil);

        var_Form.para_Empezar_GroupBox_Registro;

        var_Form.ShowModal;
        if var_Form.public_Pulso_Aceptar = true then
        begin
          if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( SQLQuery_clientes_envios ) = true then
          begin
            FieldByName('Change_WHEN').Value               := UTI_CN_Fecha_Hora;
            FieldByName('Change_Id_User').Value            := Form_Menu.public_User;

            UTI_RGTRO_Grabar_Antes( 'clientes_envios', SQLQuery_clientes_envios );
          end
          else
          begin
            Cancel;
          end;

          var_Form.Free;
        end
        else
        begin
          var_Form.Free;
          Cancel;
        end;

        UTI_RGTRO_UnLock( 'clientes_envios', var_id );
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

{ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ }

procedure Tf_clientes_000.Cambiar_Nombre_Tabla_Principal;
begin
  pubic_nombre_tabla_Principal := 'clientes';
end;

procedure Tf_clientes_000.Cambiar_Titulo_Form;
begin
  Self.Caption := rs_clientes_000;
end;

procedure Tf_clientes_000.Abrir_Conexiones_con_BD_TablasAdicionales;
begin
  { Hacer algo parecido a lo de abajo ... pero ojito sólo si hay otras transacciones y otros conectores.
    Lo lógico es que nada más que usemos los de la conexión principal, aunque sean otras tablas adicionales.

  Abrir_Conexion_con_BD( SQLTransaction_Clientes_Contactos, SQLConnector_Clientes_Contactos);
  Abrir_Conexion_con_BD( SQLTransaction_Clientes_Envios, SQLConnector_Clientes_Envios);
}
end;

procedure Tf_clientes_000.Filtrar_tablas_adicionales( var p_Lineas_Filtro : TStrings;
                                                      var p_Lineas_OrderBy : TStrings );
var
  var_SQL_ADD : TStrings;
begin
  var_SQL_ADD := TStringList.Create;

  // CLIENTES_CONTACTOS
  var_SQL_ADD.Clear;
  var_SQL_ADD.Add( 'cc.id_clientes = ' + SQLQuery_Principal.FieldByName('id').AsString );
  UTI_TB_SQL_ADD( true,                                            // Si es true, borraremos el contenido anterior de p_Lineas_Filtro
                  p_Lineas_Filtro,                                 // p_Lineas_Filtro es el StringList donde guardaremos el filtro
                  var_SQL_ADD );

  p_Lineas_OrderBy.Clear; // Así obligamos a que coja el primer orderby de la tabla adicional que filtraremos

  Filtrar_clientes_contactos( RadioGroup_Bajas.ItemIndex,
                              false,
                              p_Lineas_Filtro,
                              p_Lineas_OrderBy );

  // CLIENTES_ENVIOS
  var_SQL_ADD.Clear;
  var_SQL_ADD.Add( 'ce.id_clientes = ' + SQLQuery_Principal.FieldByName('id').AsString );
  UTI_TB_SQL_ADD( true,                                            // Si es true, borraremos el contenido anterior de p_Lineas_Filtro
                  p_Lineas_Filtro,                                 // p_Lineas_Filtro es el StringList donde guardaremos el filtro
                  var_SQL_ADD ); // Esto es lo que añadiremos a p_Lineas_Filtro

  p_Lineas_OrderBy.Clear; // Así obligamos a que coja el primer orderby de la tabla adicional que filtraremos

  Filtrar_clientes_envios( RadioGroup_Bajas.ItemIndex,
                           false,
                           p_Lineas_Filtro,
                           p_Lineas_OrderBy );
  var_SQL_ADD.Free;
end;

function Tf_clientes_000.Filtrar_clientes_contactos( p_ver_bajas : ShortInt;
                                                     p_Cambiamos_Filtro : Boolean;
                                                     p_Lineas_Filtro,
                                                     p_Lineas_OrderBy : TStrings ) : ShortInt;
var
  var_a_Filtrar : TStrings;
begin
  var_a_Filtrar := TStringList.Create;
  var_a_Filtrar.Clear;

  UTI_FILTROS_Cambiamos_Orden_SN( p_Lineas_OrderBy, private_Order_By_contactos[0].Memo_OrderBy );

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }
  Result := UTI_TB_Filtrar( private_Order_By_contactos,
                            '', // Delete_SQL

                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Clientes_Contactos,
                                                          'clientes_contactos',
                                                          'u' ), // Update_SQL

                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Clientes_Contactos,
                                                          'clientes_contactos',
                                                          'i' ), // Insert_SQL,

                            - 1, // var_ctdad_Rgtros,
                            SQLTransaction_Principal,
                            SQLConnector_Principal,
                            SQLQuery_Clientes_Contactos,
                            'cc', // name_tabla,
                            p_ver_bajas, // True or false

                            'SELECT cc.*' + ' ' +
                            'FROM clientes_contactos AS cc' + ' ', // SELECT_SQL,

                            p_Lineas_Filtro,
                            p_Lineas_OrderBy,
                            var_a_Filtrar,
                            p_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // param_no_Cerrar_Conexion : Boolean {= false}

  var_a_Filtrar.Clear;
end;

function Tf_clientes_000.Filtrar_clientes_envios( p_ver_bajas : ShortInt;
                                                  p_Cambiamos_Filtro : Boolean;
                                                  p_Lineas_Filtro,
                                                  p_Lineas_OrderBy : TStrings ) : ShortInt;
var
  var_a_Filtrar : TStrings;
begin
  var_a_Filtrar := TStringList.Create;
  var_a_Filtrar.Clear;

  UTI_FILTROS_Cambiamos_Orden_SN( p_Lineas_OrderBy, private_Order_By_envios[0].Memo_OrderBy );

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  Result := UTI_TB_Filtrar( private_Order_By_envios,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Clientes_Envios,
                                                          'clientes_envios',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Clientes_Envios,
                                                          'clientes_envios',
                                                          'i' ),

                            // var_ctdad_Rgtros,
                            -1,

                            SQLTransaction_Principal,
                            SQLConnector_Principal,
                            SQLQuery_Clientes_Envios,

                            // name_tabla,
                            'ce',

                            p_ver_bajas,

                            // SELECT_SQL,
                            'SELECT ce.*,' + ' ' +

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
                            'ON ce.id_clientes_contactos = cc.id' + ' ',

                            p_Lineas_Filtro,
                            p_Lineas_OrderBy,
                            var_a_Filtrar,

                            p_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // param_no_Cerrar_Conexion : Boolean {= false}
  var_a_Filtrar.Free;
end;

procedure Tf_clientes_000.Crear_OrderBy_tablas_adicionales;
begin
  // CLIENTES_CONTACTOS
  SetLength(private_Order_By_contactos, 1);

  private_Order_By_contactos[0].Titulo       := 'Por nombre'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
  private_Order_By_contactos[0].Memo_OrderBy := 'cc.id_clientes ASC, cc.nombre ASC';

  // CLIENTES_ENVIOS
  SetLength(private_Order_By_envios, 1);

  private_Order_By_envios[0].Titulo       := 'Por dirección'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
  private_Order_By_envios[0].Memo_OrderBy := 'ce.Direccion ASC, ce.Direccion_Numero ASC,' +
                                            ' ce.Direccion_Piso_Letra ASC, ce.Codigo_Postal ASC,' +
                                            ' ce.id_poblaciones ASC, ce.id_provincias ASC,' +
                                            ' ce.id_paises ASC';
end;

procedure Tf_clientes_000.Filtrar_Principal_queFiltro( var p_errores_Filtros : TStrings;
                                                       var p_Registro_CRUD : TRegistro_CRUD;
                                                       var p_ctdad_Rgtros  : Integer;
                                                       var p_a_Filtrar     : TStrings );
begin
  p_Registro_CRUD.name_tabla := 'cl';

  p_Registro_CRUD.Delete_SQL := '';

  p_Registro_CRUD.Update_SQL := UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Principal,
                                                             'clientes',
                                                             'u' );

  p_Registro_CRUD.Insert_SQL := UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Principal,
                                                             'clientes',
                                                             'i' );

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  p_Registro_CRUD.SELECT_SQL :=  'SELECT cl.*,' + ' ' +

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
                                 'ON cl.id_Representantes = rp.id' + ' ';

  p_ctdad_Rgtros  := -1;

  UTI_FILTROS_pasarFiltros_aQuery( SQLQuery_Principal, SQLQuery_Filtros, p_errores_Filtros, p_Registro_CRUD, p_ctdad_Rgtros, p_a_Filtrar );
end;

function Tf_clientes_000.Fue_Utilizado_Rgtro_SQLQuery_Principal : ShortInt;
begin
  Result := 0;
end;

end.

jerofa todo esto es investigación del tsqlquery

SQLQuery_Filtros.RefreshSQL SQL.;
SQLQuery_Filtros.Prepare;
SQLQuery_Filtros.Sequence;
SQLQuery_Filtros.ApplyUpdates;
SQLQuery_Filtros.PacketRecords:=;


