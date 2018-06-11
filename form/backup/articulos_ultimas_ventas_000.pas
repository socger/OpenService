unit articulos_ultimas_ventas_000;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids, DbCtrls,
  Buttons, StdCtrls, ExtCtrls, ComCtrls, utilidades_forms_Filtrar, utilidades_rgtro, utilidades_bd,
  utilidades_datos_tablas, utilidades_general, utilidades_lineas_detalle;

type

  { Tform_articulos_ultimas_ventas_000 }

  Tform_articulos_ultimas_ventas_000 = class(TForm)
    BitBtn_Filtrar: TBitBtn;
    BitBtn_SALIR: TBitBtn;
    BitBtn_Ver_Albaran_Ventas: TBitBtn;
    BitBtn_Ver_Albaran_Compras: TBitBtn;
    BitBtn_Ver_Factura_Ventas: TBitBtn;
    BitBtn_Ver_Factura_Compras: TBitBtn;
    Boton_Elegir_id_Almacenes: TBitBtn;
    Boton_Elegir_id_articulos: TBitBtn;
    Boton_Elegir_id_clientes: TBitBtn;
    Boton_Elegir_id_proveedores: TBitBtn;
    Boton_Elegir_id_Vehiculos: TBitBtn;
    CheckBox_Albaranes_Ventas_Solo_No_Facturados: TCheckBox;
    CheckBox_Albaranes_Compras_Solo_No_Facturados: TCheckBox;
    DataSource_Alb_Ventas_Detalles: TDataSource;
    DataSource_Alb_Compras_Detalles: TDataSource;
    DataSource_Ftra_Ventas_Detalles: TDataSource;
    DataSource_Ftra_Compras_Detalles: TDataSource;
    DBEdit_eMail10: TDBEdit;
    DBEdit_eMail11: TDBEdit;
    DBEdit_eMail12: TDBEdit;
    DBEdit_eMail13: TDBEdit;
    DBEdit_eMail14: TDBEdit;
    DBEdit_eMail15: TDBEdit;
    DBEdit_eMail8: TDBEdit;
    DBEdit_eMail9: TDBEdit;
    DBGrid_Detalles: TDBGrid;
    DBGrid_Detalles1: TDBGrid;
    DBGrid_Detalles2: TDBGrid;
    DBGrid_Detalles4: TDBGrid;
    DBNavigator_Albaranes_Ventas_sin_Facturar: TDBNavigator;
    DBNavigator_Albaranes_Compras_sin_Facturar: TDBNavigator;
    DBNavigator_Facturas_Ventas: TDBNavigator;
    DBNavigator_Facturas_Compras: TDBNavigator;
    Edit_Concepto: TEdit;
    Edit_Ctdad_Albaranes_Ventas_sin_Facturar_a_Ver: TEdit;
    Edit_Ctdad_Albaranes_Compras_sin_Facturar_a_Ver: TEdit;
    Edit_Ctdad_Facturas_Ventas_a_Ver: TEdit;
    Edit_Ctdad_Facturas_Compras_a_Ver: TEdit;
    Edit_descripcion_articulo: TEdit;
    Edit_descripcion_cliente: TEdit;
    Edit_Descripcion_id_Almacenes: TEdit;
    Edit_Descripcion_id_Vehiculos: TEdit;
    Edit_descripcion_proveedor: TEdit;
    Edit_id_Almacenes: TEdit;
    Edit_id_articulos: TEdit;
    Edit_id_clientes: TEdit;
    Edit_id_proveedores: TEdit;
    Edit_id_Vehiculos: TEdit;
    FloatField1: TFloatField;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label6: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label_Almacen: TLabel;
    Label_Vehiculo: TLabel;
    PageControl_Ventas: TPageControl;
    PageControl_Principal: TPageControl;
    PageControl_Compras: TPageControl;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    SQLQuery_Alb_Compras_DetallesChange_Id_User: TLargeintField;
    SQLQuery_Alb_Compras_DetallesChange_WHEN: TDateTimeField;
    SQLQuery_Alb_Compras_DetallesCodigoBarras_Referencia: TStringField;
    SQLQuery_Alb_Compras_DetallesDel_Id_User: TLargeintField;
    SQLQuery_Alb_Compras_DetallesDel_WHEN: TDateTimeField;
    SQLQuery_Alb_Compras_DetallesDel_WHY: TStringField;
    SQLQuery_Alb_Compras_Detallesdescripcion: TStringField;
    SQLQuery_Alb_Compras_Detallesdescripcion_para_TPV: TStringField;
    SQLQuery_Alb_Compras_DetallesDescuento_Comercial_1: TBCDField;
    SQLQuery_Alb_Compras_DetallesDescuento_Comercial_2: TBCDField;
    SQLQuery_Alb_Compras_DetallesExcluido_su_Cobro_SN: TStringField;
    SQLQuery_Alb_Compras_DetallesFecha_Movimiento: TDateTimeField;
    SQLQuery_Alb_Compras_Detallesid_albaranes: TLargeintField;
    SQLQuery_Alb_Compras_Detallesid_almacenes: TLargeintField;
    SQLQuery_Alb_Compras_Detallesid_articulos: TLargeintField;
    SQLQuery_Alb_Compras_Detallesid_impuestos_Compras: TLargeintField;
    SQLQuery_Alb_Compras_Detallesid_proveedores: TLargeintField;
    SQLQuery_Alb_Compras_DetallesInsert_Id_User: TLargeintField;
    SQLQuery_Alb_Compras_DetallesInsert_WHEN: TDateTimeField;
    SQLQuery_Alb_Compras_DetallesNumero_Factura: TLargeintField;
    SQLQuery_Alb_Compras_DetallesOT_descripcion_almacen: TStringField;
    SQLQuery_Alb_Compras_DetallesOT_descripcion_articulo: TStringField;
    SQLQuery_Alb_Compras_DetallesOT_descripcion_impuesto: TStringField;
    SQLQuery_Alb_Compras_DetallesOT_id_almacenes_Cabecera: TLargeintField;
    SQLQuery_Alb_Compras_DetallesOT_Numero_Albaran: TLargeintField;
    SQLQuery_Alb_Compras_DetallesOT_Proveedor_nombre_comercial: TStringField;
    SQLQuery_Alb_Compras_DetallesOT_Proveedor_nombre_propietario: TStringField;
    SQLQuery_Alb_Compras_DetallesOT_Serie_Albaran: TStringField;
    SQLQuery_Alb_Compras_DetallesOT_Tipo_de_articulo: TStringField;
    SQLQuery_Alb_Compras_DetallesPVP: TBCDField;
    SQLQuery_Alb_Compras_DetallesRepetir_Cada: TLongintField;
    SQLQuery_Alb_Compras_DetallesSerie_Factura: TStringField;
    SQLQuery_Alb_Compras_DetallesUnidades: TBCDField;
    SQLQuery_Alb_Ventas_Detalles: TSQLQuery;
    SQLQuery_Alb_Compras_Detalles: TSQLQuery;
    SQLQuery_Alb_Ventas_DetallesChange_Id_User: TLargeintField;
    SQLQuery_Alb_Ventas_DetallesChange_WHEN: TDateTimeField;
    SQLQuery_Alb_Ventas_DetallesCodigoBarras_Referencia: TStringField;
    SQLQuery_Alb_Ventas_DetallesComision_Representante: TBCDField;
    SQLQuery_Alb_Ventas_DetallesDel_Id_User: TLargeintField;
    SQLQuery_Alb_Ventas_DetallesDel_WHEN: TDateTimeField;
    SQLQuery_Alb_Ventas_DetallesDel_WHY: TStringField;
    SQLQuery_Alb_Ventas_Detallesdescripcion: TStringField;
    SQLQuery_Alb_Ventas_Detallesdescripcion_para_TPV: TStringField;
    SQLQuery_Alb_Ventas_DetallesDescuento_Comercial_1: TBCDField;
    SQLQuery_Alb_Ventas_DetallesDescuento_Comercial_2: TBCDField;
    SQLQuery_Alb_Ventas_DetallesExcluido_su_Cobro_SN: TStringField;
    SQLQuery_Alb_Ventas_DetallesFecha_Movimiento: TDateTimeField;
    SQLQuery_Alb_Ventas_Detallesid_albaranes: TLargeintField;
    SQLQuery_Alb_Ventas_Detallesid_almacenes: TLargeintField;
    SQLQuery_Alb_Ventas_Detallesid_articulos: TLargeintField;
    SQLQuery_Alb_Ventas_Detallesid_clientes: TLargeintField;
    SQLQuery_Alb_Ventas_Detallesid_impuestos_Ventas: TLargeintField;
    SQLQuery_Alb_Ventas_DetallesInsert_Id_User: TLargeintField;
    SQLQuery_Alb_Ventas_DetallesInsert_WHEN: TDateTimeField;
    SQLQuery_Alb_Ventas_DetallesNumero_Factura: TLargeintField;
    SQLQuery_Alb_Ventas_DetallesOT_Cliente_nombre_comercial: TStringField;
    SQLQuery_Alb_Ventas_DetallesOT_Cliente_nombre_propietario: TStringField;
    SQLQuery_Alb_Ventas_DetallesOT_descripcion_almacen: TStringField;
    SQLQuery_Alb_Ventas_DetallesOT_descripcion_articulo: TStringField;
    SQLQuery_Alb_Ventas_DetallesOT_descripcion_impuesto: TStringField;
    SQLQuery_Alb_Ventas_DetallesOT_Descripcion_para_DbGrid1: TStringField;
    SQLQuery_Alb_Ventas_DetallesOT_Descripcion_para_DbGrid2: TStringField;
    SQLQuery_Alb_Ventas_DetallesOT_el_Albaran1: TStringField;
    SQLQuery_Alb_Ventas_DetallesOT_el_Albaran2: TStringField;
    SQLQuery_Alb_Ventas_DetallesOT_id_almacenes_Cabecera: TLargeintField;
    SQLQuery_Alb_Ventas_DetallesOT_id_vehiculos_Cabecera: TLargeintField;
    SQLQuery_Alb_Ventas_DetallesOT_Numero_Albaran: TLargeintField;
    SQLQuery_Alb_Ventas_DetallesOT_Serie_Albaran: TStringField;
    SQLQuery_Alb_Ventas_DetallesOT_Tipo_de_articulo: TStringField;
    SQLQuery_Alb_Ventas_DetallesOT_Total_Dto_1_1: TFloatField;
    SQLQuery_Alb_Ventas_DetallesOT_Total_Dto_1_2: TFloatField;
    SQLQuery_Alb_Ventas_DetallesOT_Total_Dto_2_1: TFloatField;
    SQLQuery_Alb_Ventas_DetallesOT_Total_Dto_2_2: TFloatField;
    SQLQuery_Alb_Ventas_DetallesOT_Total_Linea_con_Dtos1: TFloatField;
    SQLQuery_Alb_Ventas_DetallesOT_Total_Linea_con_Dtos2: TFloatField;
    SQLQuery_Alb_Ventas_DetallesOT_Total_Linea_sin_Dtos1: TFloatField;
    SQLQuery_Alb_Ventas_DetallesOT_Total_Linea_sin_Dtos2: TFloatField;
    SQLQuery_Alb_Ventas_DetallesPVP: TBCDField;
    SQLQuery_Alb_Ventas_DetallesRepetir_Cada: TLongintField;
    SQLQuery_Alb_Ventas_DetallesSerie_Factura: TStringField;
    SQLQuery_Alb_Ventas_DetallesUnidades: TBCDField;
    SQLQuery_Clientesid2: TLargeintField;
    SQLQuery_Clientesid3: TLargeintField;
    SQLQuery_Clientesid4: TLargeintField;
    SQLQuery_Clientesid5: TLargeintField;
    SQLQuery_Ftra_Compras_DetallesChange_Id_User: TLargeintField;
    SQLQuery_Ftra_Compras_DetallesChange_WHEN: TDateTimeField;
    SQLQuery_Ftra_Compras_DetallesCodigoBarras_Referencia: TStringField;
    SQLQuery_Ftra_Compras_DetallesDel_Id_User: TLargeintField;
    SQLQuery_Ftra_Compras_DetallesDel_WHEN: TDateTimeField;
    SQLQuery_Ftra_Compras_DetallesDel_WHY: TStringField;
    SQLQuery_Ftra_Compras_Detallesdescripcion: TStringField;
    SQLQuery_Ftra_Compras_Detallesdescripcion_para_TPV: TStringField;
    SQLQuery_Ftra_Compras_DetallesDescuento_Comercial_1: TBCDField;
    SQLQuery_Ftra_Compras_DetallesDescuento_Comercial_2: TBCDField;
    SQLQuery_Ftra_Compras_DetallesExcluido_su_Cobro_SN: TStringField;
    SQLQuery_Ftra_Compras_DetallesFecha_Movimiento: TDateTimeField;
    SQLQuery_Ftra_Compras_Detallesid_almacenes: TLargeintField;
    SQLQuery_Ftra_Compras_Detallesid_articulos: TLargeintField;
    SQLQuery_Ftra_Compras_Detallesid_facturas: TLargeintField;
    SQLQuery_Ftra_Compras_Detallesid_impuestos_Compras: TLargeintField;
    SQLQuery_Ftra_Compras_Detallesid_proveedores: TLargeintField;
    SQLQuery_Ftra_Compras_DetallesInsert_Id_User: TLargeintField;
    SQLQuery_Ftra_Compras_DetallesInsert_WHEN: TDateTimeField;
    SQLQuery_Ftra_Compras_DetallesNumero_Albaran: TLargeintField;
    SQLQuery_Ftra_Compras_DetallesOT_descripcion_almacen: TStringField;
    SQLQuery_Ftra_Compras_DetallesOT_descripcion_articulo: TStringField;
    SQLQuery_Ftra_Compras_DetallesOT_descripcion_impuesto: TStringField;
    SQLQuery_Ftra_Compras_DetallesOT_id_almacenes_Cabecera: TLargeintField;
    SQLQuery_Ftra_Compras_DetallesOT_Numero_Factura: TLargeintField;
    SQLQuery_Ftra_Compras_DetallesOT_Proveedor_nombre_comercial: TStringField;
    SQLQuery_Ftra_Compras_DetallesOT_Proveedor_nombre_propietario: TStringField;
    SQLQuery_Ftra_Compras_DetallesOT_Serie_Factura: TStringField;
    SQLQuery_Ftra_Compras_DetallesOT_Tipo_de_articulo: TStringField;
    SQLQuery_Ftra_Compras_DetallesPVP: TBCDField;
    SQLQuery_Ftra_Compras_DetallesRepetir_Cada: TLongintField;
    SQLQuery_Ftra_Compras_DetallesSerie_Albaran: TStringField;
    SQLQuery_Ftra_Compras_DetallesUnidades: TBCDField;
    SQLQuery_Ftra_Ventas_Detalles: TSQLQuery;
    SQLQuery_Ftra_Compras_Detalles: TSQLQuery;
    SQLQuery_Ftra_Ventas_DetallesChange_Id_User: TLargeintField;
    SQLQuery_Ftra_Ventas_DetallesChange_WHEN: TDateTimeField;
    SQLQuery_Ftra_Ventas_DetallesCodigoBarras_Referencia: TStringField;
    SQLQuery_Ftra_Ventas_DetallesComision_Representante: TBCDField;
    SQLQuery_Ftra_Ventas_DetallesDel_Id_User: TLargeintField;
    SQLQuery_Ftra_Ventas_DetallesDel_WHEN: TDateTimeField;
    SQLQuery_Ftra_Ventas_DetallesDel_WHY: TStringField;
    SQLQuery_Ftra_Ventas_Detallesdescripcion: TStringField;
    SQLQuery_Ftra_Ventas_Detallesdescripcion_para_TPV: TStringField;
    SQLQuery_Ftra_Ventas_DetallesDescuento_Comercial_1: TBCDField;
    SQLQuery_Ftra_Ventas_DetallesDescuento_Comercial_2: TBCDField;
    SQLQuery_Ftra_Ventas_DetallesExcluido_su_Cobro_SN: TStringField;
    SQLQuery_Ftra_Ventas_DetallesFecha_Movimiento: TDateTimeField;
    SQLQuery_Ftra_Ventas_Detallesid_almacenes: TLargeintField;
    SQLQuery_Ftra_Ventas_Detallesid_articulos: TLargeintField;
    SQLQuery_Ftra_Ventas_Detallesid_clientes: TLargeintField;
    SQLQuery_Ftra_Ventas_Detallesid_facturas: TLargeintField;
    SQLQuery_Ftra_Ventas_Detallesid_impuestos_Ventas: TLargeintField;
    SQLQuery_Ftra_Ventas_DetallesInsert_Id_User: TLargeintField;
    SQLQuery_Ftra_Ventas_DetallesInsert_WHEN: TDateTimeField;
    SQLQuery_Ftra_Ventas_DetallesNumero_Albaran: TLargeintField;
    SQLQuery_Ftra_Ventas_DetallesOT_Cliente_nombre_comercial: TStringField;
    SQLQuery_Ftra_Ventas_DetallesOT_Cliente_nombre_propietario: TStringField;
    SQLQuery_Ftra_Ventas_DetallesOT_descripcion_almacen: TStringField;
    SQLQuery_Ftra_Ventas_DetallesOT_descripcion_articulo: TStringField;
    SQLQuery_Ftra_Ventas_DetallesOT_descripcion_impuesto: TStringField;
    SQLQuery_Ftra_Ventas_DetallesOT_Descripcion_para_DbGrid1: TStringField;
    SQLQuery_Ftra_Ventas_DetallesOT_Descripcion_para_DbGrid2: TStringField;
    SQLQuery_Ftra_Ventas_DetallesOT_id_almacenes_Cabecera: TLargeintField;
    SQLQuery_Ftra_Ventas_DetallesOT_la_Factura1: TStringField;
    SQLQuery_Ftra_Ventas_DetallesOT_la_Factura2: TStringField;
    SQLQuery_Ftra_Ventas_DetallesOT_Numero_Factura: TLargeintField;
    SQLQuery_Ftra_Ventas_DetallesOT_Serie_Factura: TStringField;
    SQLQuery_Ftra_Ventas_DetallesOT_Tipo_de_articulo: TStringField;
    SQLQuery_Ftra_Ventas_DetallesOT_Total_Dto_1_1: TFloatField;
    SQLQuery_Ftra_Ventas_DetallesOT_Total_Dto_1_2: TFloatField;
    SQLQuery_Ftra_Ventas_DetallesOT_Total_Dto_2_1: TFloatField;
    SQLQuery_Ftra_Ventas_DetallesOT_Total_Dto_2_2: TFloatField;
    SQLQuery_Ftra_Ventas_DetallesOT_Total_Linea_con_Dtos1: TFloatField;
    SQLQuery_Ftra_Ventas_DetallesOT_Total_Linea_con_Dtos2: TFloatField;
    SQLQuery_Ftra_Ventas_DetallesOT_Total_Linea_sin_Dtos1: TFloatField;
    SQLQuery_Ftra_Ventas_DetallesOT_Total_Linea_sin_Dtos2: TFloatField;
    SQLQuery_Ftra_Ventas_DetallesPVP: TBCDField;
    SQLQuery_Ftra_Ventas_DetallesRepetir_Cada: TLongintField;
    SQLQuery_Ftra_Ventas_DetallesSerie_Albaran: TStringField;
    SQLQuery_Ftra_Ventas_DetallesUnidades: TBCDField;
    StringField1: TStringField;
    TabSheet_Ventas_Ultimas_Facturas: TTabSheet;
    TabSheet_Ventas: TTabSheet;
    TabSheet_Compras_Ultimas_Facturas: TTabSheet;
    TabSheet_Ventas_Ultimos_Albaranes: TTabSheet;
    TabSheet_Compras: TTabSheet;
    TabSheet_Compras_Ultimos_Albaranes: TTabSheet;

    procedure BitBtn_FiltrarClick(Sender: TObject);
    procedure BitBtn_Ver_Albaran_ComprasClick(Sender: TObject);
    procedure BitBtn_Ver_Albaran_VentasClick(Sender: TObject);
    procedure BitBtn_Ver_Factura_ComprasClick(Sender: TObject);
    procedure BitBtn_Ver_Factura_VentasClick(Sender: TObject);
    procedure Boton_Elegir_id_AlmacenesClick(Sender: TObject);
    procedure Boton_Elegir_id_articulosClick(Sender: TObject);
    procedure Boton_Elegir_id_proveedoresClick(Sender: TObject);
    procedure Boton_Elegir_id_VehiculosClick(Sender: TObject);
    procedure Cerramos_Tablas;
    procedure BitBtn_SALIRClick(Sender: TObject);
    procedure DBNavigator_Albaranes_Compras_sin_FacturarBeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure DBNavigator_Facturas_ComprasBeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure Edit_Descripcion_id_AlmacenesClick(Sender: TObject);
    procedure Edit_Descripcion_id_VehiculosClick(Sender: TObject);
    procedure Edit_descripcion_proveedorClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure para_Empezar;
    procedure DBNavigator_Albaranes_Ventas_sin_FacturarBeforeAction(Sender: TObject; Button: TDBNavButtonType);
    function  Filtrar_Albaranes_Compras_Detalles_sin_Facturar( param_Limite_Registros : string; param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
    function  Filtrar_Albaranes_Ventas_Detalles_sin_Facturar( param_Limite_Registros : string; param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
    function  Filtrar_Facturas_Compras_Detalles( param_Limite_Registros : string; param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
    function  Filtrar_Facturas_Ventas_Detalles( param_Limite_Registros : string; param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
    procedure DBNavigator_Facturas_VentasBeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure Refrescar_Registros_Albaranes_Compras_Detalles_sin_Facturar;
    procedure Refrescar_Registros_Albaranes_Ventas_Detalles_sin_Facturar;
    procedure Refrescar_Registros_Facturas_Compras_Detalles;
    procedure Refrescar_Registros_Facturas_Ventas_Detalles;
    procedure Boton_Elegir_id_clientesClick(Sender: TObject);
    procedure Edit_descripcion_clienteClick(Sender: TObject);
    procedure Filtrar_Tablas;
    procedure Presentar_Datos;
    procedure SQLQuery_Alb_Compras_DetallesCalcFields(DataSet: TDataSet);
    procedure SQLQuery_Alb_Ventas_DetallesCalcFields(DataSet: TDataSet);
    procedure SQLQuery_Ftra_Compras_DetallesCalcFields(DataSet: TDataSet);
    procedure SQLQuery_Ftra_Ventas_DetallesCalcFields(DataSet: TDataSet);

  private
    { private declarations }
    private_Salir_OK                      : Boolean;
    private_Order_By_Alb_Ventas_Detalle   : array of TOrder_By;
    private_Order_By_Alb_Compras_Detalle  : array of TOrder_By;
    private_Order_By_Ftra_Ventas_Detalle  : array of TOrder_By;
    private_Order_By_Ftra_Compras_Detalle : array of TOrder_By;
  public
    { public declarations }
  end;

var
  form_articulos_ultimas_ventas_000: Tform_articulos_ultimas_ventas_000;

implementation

{$R *.lfm}

uses dm_articulos_ultimas_ventas, menu, albaranes_ventas_000, facturas_ventas_000,
     albaranes_compras_000, facturas_compras_000;

{ Tform_articulos_ultimas_ventas_000 }

procedure Tform_articulos_ultimas_ventas_000.para_Empezar;
begin
    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    if UTI_GEN_Form_Abierto_Ya('DataModule_articulos_ultimas_ventas') = False then
    begin
        DataModule_articulos_ultimas_ventas := TDataModule_articulos_ultimas_ventas.Create(Application);
    end;

    // ********************************************************************************************* //
    // ** Preparamos los diferentes tipos de orden preconfigurados                                ** //
    // ********************************************************************************************* //
    // ALBARANES DE VENTAS DETALLE SIN FACTURAR
    SetLength(private_Order_By_Alb_Ventas_Detalle, 1);

    // private_Order_By_Alb_Ventas_Detalle[0].Titulo       := 'Por el código del artículo'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    // private_Order_By_Alb_Ventas_Detalle[0].Memo_OrderBy := 'ad.id_articulos DESC, ad.Fecha_Movimiento DESC, ad.id DESC';
    private_Order_By_Alb_Ventas_Detalle[0].Titulo       := 'Por el albarán + la id de la línea'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_Alb_Ventas_Detalle[0].Memo_OrderBy := 'albv.Serie_Albaran DESC, albv.Numero_Albaran DESC, ad.id DESC';

    // FACTURAS DE VENTAS DETALLE
    SetLength(private_Order_By_Ftra_Ventas_Detalle, 1);

    // private_Order_By_Ftra_Ventas_Detalle[0].Titulo       := 'Por el código del artículo'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    // private_Order_By_Ftra_Ventas_Detalle[0].Memo_OrderBy := 'fd.id_articulos DESC, fd.Fecha_Movimiento DESC, fd.id DESC';
    private_Order_By_Ftra_Ventas_Detalle[0].Titulo       := 'Por la factura + la id de la línea'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_Ftra_Ventas_Detalle[0].Memo_OrderBy := 'fv.Serie_Factura DESC, fv.Numero_Factura DESC, fd.id DESC';

    // ALBARANES DE COMPRAS DETALLE SIN FACTURAR
    SetLength(private_Order_By_Alb_Compras_Detalle, 1);

    // private_Order_By_Alb_Compras_Detalle[0].Titulo       := 'Por el código del artículo'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    // private_Order_By_Alb_Compras_Detalle[0].Memo_OrderBy := 'acd.id_articulos DESC, acd.Fecha_Movimiento DESC, acd.id DESC';
    private_Order_By_Alb_Compras_Detalle[0].Titulo       := 'Por el albarán + la id de la línea'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_Alb_Compras_Detalle[0].Memo_OrderBy := 'ac.Serie_Albaran DESC, ac.Numero_Albaran DESC, acd.id DESC';

    // FACTURAS DE COMPRAS DETALLE
    SetLength(private_Order_By_Ftra_Compras_Detalle, 1);

    // private_Order_By_Ftra_Compras_Detalle[0].Titulo       := 'Por el código del artículo'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    // private_Order_By_Ftra_Compras_Detalle[0].Memo_OrderBy := 'fcd.id_articulos DESC, fcd.Fecha_Movimiento DESC, fcd.id DESC';
    private_Order_By_Ftra_Compras_Detalle[0].Titulo       := 'Por la factura + la id de la línea'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_Ftra_Compras_Detalle[0].Memo_OrderBy := 'fc.Serie_Factura DESC, fc.Numero_Factura DESC, fcd.id DESC';

    // ********************************************************************************************* //
    // ** Filtramos los datos                                                                     ** //
    // ********************************************************************************************* //
    Filtrar_Tablas;

    Presentar_Datos;

    // ********************************************************************************************* //
    // ** SOLO PARA ESTE FORM                                                                     ** //
    // ********************************************************************************************* //
    PageControl_Principal.ActivePage := TabSheet_Ventas;
    PageControl_Ventas.ActivePage    := TabSheet_Ventas_Ultimas_Facturas;
    PageControl_Compras.ActivePage   := TabSheet_Compras_Ultimas_Facturas;
end;

procedure Tform_articulos_ultimas_ventas_000.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
    if private_Salir_OK = False then
    begin
        // ***************************************************************************************** //
        // ** Intento BitBtn_SALIR de la aplicación de un modo no permitido.                      ** //
        // ***************************************************************************************** //
        // ** Pero si desde el menu principal está a true la variable public_Salir_Ok, significa  ** //
        // ** que hay que salir si o si pues se pulsó cancelar al preguntar otra vez por la pwd   ** //
        // ***************************************************************************************** //
        if form_Menu.public_Salir_OK = False then CloseAction := caNone;
    end else begin
        // ***************************************************************************************** //
        // ** Fue correcto el modo como quiere BitBtn_SALIR de la aplicación                      ** //
        // ***************************************************************************************** //
    end;
end;

procedure Tform_articulos_ultimas_ventas_000.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_articulos_ultimas_ventas_000.DBNavigator_Albaranes_Compras_sin_FacturarBeforeAction
  (Sender: TObject; Button: TDBNavButtonType);
begin
    case Button of
        nbRefresh : begin
            Refrescar_Registros_Albaranes_Compras_Detalles_sin_Facturar;
            Abort;
        end;
    end;
end;

procedure Tform_articulos_ultimas_ventas_000.DBNavigator_Facturas_ComprasBeforeAction
  (Sender: TObject; Button: TDBNavButtonType);
begin
    case Button of
        nbRefresh : begin
            Refrescar_Registros_Facturas_Compras_Detalles;
            Abort;
        end;
    end;
end;

procedure Tform_articulos_ultimas_ventas_000.Edit_Descripcion_id_AlmacenesClick(
  Sender: TObject);
begin
    Edit_id_Almacenes.Text             := '';
    Edit_Descripcion_id_Almacenes.Text := '';
end;

procedure Tform_articulos_ultimas_ventas_000.Edit_Descripcion_id_VehiculosClick(
  Sender: TObject);
begin
    Edit_id_Vehiculos.Text             := '';
    Edit_Descripcion_id_Vehiculos.Text := '';
end;

procedure Tform_articulos_ultimas_ventas_000.Edit_descripcion_proveedorClick(
  Sender: TObject);
begin
    Edit_id_proveedores.Text        := '';
    Edit_descripcion_proveedor.Text := '';
end;

procedure Tform_articulos_ultimas_ventas_000.FormCreate(Sender: TObject);
begin
    // ********************************************************************************************* //
    // ** Obligado en cada formulario para no olvidarlo                                           ** //
    // ********************************************************************************************* //
    with Self do
    begin
        // Color    := $00C2C29E;
        Color       := $00B9959C;
        Position    := poScreenCenter;
        BorderIcons := [];
        BorderStyle := bsSingle;
    end;

    private_Salir_OK := false;

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

end;

procedure Tform_articulos_ultimas_ventas_000.FormDestroy(Sender: TObject);
begin
    Cerramos_Tablas;
end;

procedure Tform_articulos_ultimas_ventas_000.Cerramos_Tablas;
begin
    if UTI_TB_Cerrar( DataModule_articulos_ultimas_ventas.SQLConnector_Alb_V_D,
                      DataModule_articulos_ultimas_ventas.SQLTransaction_Alb_V_D,
                      SQLQuery_Alb_Ventas_Detalles ) = false then UTI_GEN_Salir;

    if UTI_TB_Cerrar( DataModule_articulos_ultimas_ventas.SQLConnector_Ftra_V_D,
                      DataModule_articulos_ultimas_ventas.SQLTransaction_Ftra_V_D,
                      SQLQuery_Ftra_Ventas_Detalles ) = false then UTI_GEN_Salir;

    DataModule_articulos_ultimas_ventas.Free;
end;

procedure Tform_articulos_ultimas_ventas_000.BitBtn_FiltrarClick(Sender: TObject);
begin
    Filtrar_Tablas;
end;

procedure Tform_articulos_ultimas_ventas_000.BitBtn_Ver_Albaran_ComprasClick(
  Sender: TObject);
var var_msg : TStrings;
begin
    with SQLQuery_Alb_Compras_Detalles do
    begin
        if RecordCount = 0 then
        begin
            var_msg := TStringList.Create;
            var_msg.Add('* No hay albaranes de compras no facturados de este artículo.');
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;

            Exit;
        end;

        if UTI_GEN_Form_Abierto_Ya('form_albaranes_compras_000') = false then
        begin
            Application.CreateForm(Tform_albaranes_compras_000, form_albaranes_compras_000);

            form_albaranes_compras_000.public_Solo_Ver    := false;
            form_albaranes_compras_000.public_Elegimos    := true;
            form_albaranes_compras_000.public_Menu_Worked := 640;

            // ************************************************************************************* //
            // ** Le pasamos la factura a encontrar                                               ** //
            // ************************************************************************************* //
            form_albaranes_compras_000.Edit_Albaran_Serie_Ntra_Referencia.Text  := FieldByName('OT_Serie_Albaran').AsString;
            form_albaranes_compras_000.Edit_Albaran_Numero_Ntra_Referencia.Text := FieldByName('OT_Numero_Albaran').AsString;

            // ************************************************************************************* //
            // ** Filtramos su búsqueda                                                           ** //
            // ************************************************************************************* //
            form_albaranes_compras_000.para_Empezar;

            if form_albaranes_compras_000.SQLQuery_Alb.RecordCount = 1 then
            begin
                form_albaranes_compras_000.Editar_Registro(false);
            end else begin
                if form_albaranes_compras_000.SQLQuery_Alb.RecordCount = 0 then
                begin
                    var_msg := TStringList.Create;
                    var_msg.Add( 'El albarán con ntra.referencia ' +
                                 Trim(FieldByName('OT_Serie_Albaran').AsString) + '-' +
                                 Trim(FieldByName('OT_Numero_Albaran').AsString) +
                    ' no existe.');
                    UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
                    var_msg.Free;
                end;
            end;

            form_albaranes_compras_000.Free;

            // ************************************************************************************* //
            // ** Refrescamos los albaranes por si se hizo algún cambio en el elegido             ** //
            // ************************************************************************************* //
            Refrescar_Registros_Albaranes_Compras_Detalles_sin_Facturar;
        end else begin
            var_msg := TStringList.Create;
            var_msg.Add(rs_Modulo_Abierto);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;
        end;
    end;
end;

procedure Tform_articulos_ultimas_ventas_000.BitBtn_Ver_Albaran_VentasClick(Sender: TObject);
var var_msg : TStrings;
begin
    with SQLQuery_Alb_Ventas_Detalles do
    begin
        if RecordCount = 0 then
        begin
            var_msg := TStringList.Create;
            var_msg.Add('* No hay albaranes de ventas no facturados de este artículo.');
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
            // ** Le pasamos la factura a encontrar                                               ** //
            // ************************************************************************************* //
            form_albaranes_ventas_000.Edit_Albaran_Serie.Text  := FieldByName('OT_Serie_Albaran').AsString;
            form_albaranes_ventas_000.Edit_Albaran_Numero.Text := FieldByName('OT_Numero_Albaran').AsString;

            // ************************************************************************************* //
            // ** Filtramos su búsqueda                                                           ** //
            // ************************************************************************************* //
            form_albaranes_ventas_000.para_Empezar;

            if form_albaranes_ventas_000.SQLQuery_Alb.RecordCount = 1 then
            begin
                form_albaranes_ventas_000.Editar_Registro;
            end else begin
                if form_albaranes_ventas_000.SQLQuery_Alb.RecordCount = 0 then
                begin
                    var_msg := TStringList.Create;
                    var_msg.Add('Este albarán no existe.');
                    UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
                    var_msg.Free;
                end;
            end;

            form_albaranes_ventas_000.Free;

            // ************************************************************************************* //
            // ** Refrescamos los albaranes por si se hizo algún cambio en el elegido             ** //
            // ************************************************************************************* //
            Refrescar_Registros_Albaranes_Ventas_Detalles_sin_Facturar;
        end else begin
            var_msg := TStringList.Create;
            var_msg.Add(rs_Modulo_Abierto);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;
        end;
    end;
end;

procedure Tform_articulos_ultimas_ventas_000.BitBtn_Ver_Factura_ComprasClick(Sender: TObject);
var var_msg : TStrings;
begin
    with SQLQuery_Ftra_Compras_Detalles do
    begin
        if RecordCount = 0 then
        begin
            var_msg := TStringList.Create;
            var_msg.Add('* No hay facturas de compras de este artículo.');
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
            form_facturas_compras_000.Edit_Factura_Serie_Ntra_Referencia.Text  := FieldByName('OT_Serie_Factura').AsString;
            form_facturas_compras_000.Edit_Factura_Numero_Ntra_Referencia.Text := FieldByName('OT_Numero_Factura').AsString;

            // ************************************************************************************* //
            // ** Filtramos su búsqueda                                                           ** //
            // ************************************************************************************* //
            form_facturas_compras_000.para_Empezar;

            if form_facturas_compras_000.SQLQuery_Ftra.RecordCount = 1 then
            begin
                form_facturas_compras_000.Editar_Registro(false);
            end else begin
                if form_facturas_compras_000.SQLQuery_Ftra.RecordCount = 0 then
                begin
                    var_msg := TStringList.Create;
                    var_msg.Add( 'La factura con ntra.referencia ' +
                                 Trim(FieldByName('OT_Serie_Factura').AsString) + '-' +
                                 Trim(FieldByName('OT_Numero_Factura').AsString) +
                    ' no existe.');
                    UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
                    var_msg.Free;
                end;
            end;

            form_facturas_compras_000.Free;

            // ************************************************************************************* //
            // ** Refrescamos los albaranes por si se hizo algún cambio en el elegido             ** //
            // ************************************************************************************* //
            Refrescar_Registros_Facturas_Compras_Detalles;
        end else begin
            var_msg := TStringList.Create;
            var_msg.Add(rs_Modulo_Abierto);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;
        end;
    end;
end;

procedure Tform_articulos_ultimas_ventas_000.BitBtn_Ver_Factura_VentasClick(
  Sender: TObject);
var var_msg : TStrings;
begin
    with SQLQuery_Ftra_Ventas_Detalles do
    begin
        if RecordCount = 0 then
        begin
            var_msg := TStringList.Create;
            var_msg.Add('* No hay facturas de ventas de este artículo.');
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;

            Exit;
        end;

        if UTI_GEN_Form_Abierto_Ya('form_facturas_ventas_000') = false then
        begin
            Application.CreateForm(Tform_facturas_ventas_000, form_facturas_ventas_000);

            form_facturas_ventas_000.public_Solo_Ver    := false;
            form_facturas_ventas_000.public_Elegimos    := true;
            form_facturas_ventas_000.public_Menu_Worked := 600;

            // ************************************************************************************* //
            // ** Le pasamos la factura a encontrar                                               ** //
            // ************************************************************************************* //
            form_facturas_ventas_000.Edit_Factura_Serie.Text  := FieldByName('OT_Serie_Factura').AsString;
            form_facturas_ventas_000.Edit_Factura_Numero.Text := FieldByName('OT_Numero_Factura').AsString;

            // ************************************************************************************* //
            // ** Filtramos su búsqueda                                                           ** //
            // ************************************************************************************* //
            form_facturas_ventas_000.para_Empezar;

            if form_facturas_ventas_000.SQLQuery_Ftra.RecordCount = 1 then
            begin
                form_facturas_ventas_000.Editar_Registro;
            end else begin
                if form_facturas_ventas_000.SQLQuery_Ftra.RecordCount = 0 then
                begin
                    var_msg := TStringList.Create;
                    var_msg.Add( 'La factura ' +
                                 Trim(FieldByName('OT_Serie_Factura').AsString) + '-' +
                                 Trim(FieldByName('OT_Numero_Factura').AsString) +
                    ' no existe.');
                    UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
                    var_msg.Free;
                end;
            end;

            form_facturas_ventas_000.Free;

            // ************************************************************************************* //
            // ** Refrescamos los albaranes por si se hizo algún cambio en el elegido             ** //
            // ************************************************************************************* //
            Refrescar_Registros_Facturas_Ventas_Detalles;
        end else begin
            var_msg := TStringList.Create;
            var_msg.Add(rs_Modulo_Abierto);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;
        end;
    end;
end;

procedure Tform_articulos_ultimas_ventas_000.Boton_Elegir_id_AlmacenesClick(
  Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Almacenes( '', '', true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Almacenes.Text             := Trim(var_Registro.id_1);
        Edit_Descripcion_id_Almacenes.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_articulos_ultimas_ventas_000.Boton_Elegir_id_articulosClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Articulos( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_articulos.Text         := Trim(var_Registro.id_1);
        Edit_descripcion_articulo.Text := var_Registro.descripcion_2;
    end;
end;

procedure Tform_articulos_ultimas_ventas_000.Boton_Elegir_id_proveedoresClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Proveedores( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_proveedores.Text        := Trim(var_Registro.id_1);
        Edit_descripcion_proveedor.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_articulos_ultimas_ventas_000.Boton_Elegir_id_VehiculosClick(
  Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Vehiculos( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Vehiculos.Text             := Trim(var_Registro.id_1);
        Edit_Descripcion_id_Vehiculos.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_articulos_ultimas_ventas_000.Presentar_Datos;
begin
     /// guardar por lo que pueda pasar
end;

procedure Tform_articulos_ultimas_ventas_000.SQLQuery_Alb_Compras_DetallesCalcFields
  (DataSet: TDataSet);
begin
    with SQLQuery_Alb_Compras_Detalles do
    begin
        if Trim(FieldByName('OT_Serie_Albaran').AsString) <> '' then
        begin
            FieldByName('OT_el_Albaran').AsString := Trim(FieldByName('OT_Serie_Albaran').AsString) +
                                                     '-' +
                                                     Trim(FieldByName('OT_Numero_Albaran').AsString);
        end else begin
            FieldByName('OT_el_Albaran').AsString := Trim(FieldByName('OT_Numero_Albaran').AsString);
        end;
    end;

    UTI_LINEAS_Poner_Totales_Linea_Detalle( SQLQuery_Alb_Compras_Detalles );
end;

procedure Tform_articulos_ultimas_ventas_000.SQLQuery_Alb_Ventas_DetallesCalcFields
  (DataSet: TDataSet);
begin
    with SQLQuery_Alb_Ventas_Detalles do
    begin
        if Trim(FieldByName('OT_Serie_Albaran').AsString) <> '' then
        begin
            FieldByName('OT_el_Albaran').AsString := Trim(FieldByName('OT_Serie_Albaran').AsString) +
                                                     '-' +
                                                     Trim(FieldByName('OT_Numero_Albaran').AsString);
        end else begin
            FieldByName('OT_el_Albaran').AsString := Trim(FieldByName('OT_Numero_Albaran').AsString);
        end;
    end;

    UTI_LINEAS_Poner_Totales_Linea_Detalle( SQLQuery_Alb_Ventas_Detalles );
end;

procedure Tform_articulos_ultimas_ventas_000.SQLQuery_Ftra_Compras_DetallesCalcFields
  (DataSet: TDataSet);
begin
    with SQLQuery_Ftra_Compras_Detalles do
    begin
        if Trim(FieldByName('OT_Serie_Factura').AsString) <> '' then
        begin
            FieldByName('OT_la_Factura').AsString := Trim(FieldByName('OT_Serie_Factura').AsString) +
                                                     '-' +
                                                     Trim(FieldByName('OT_Numero_Factura').AsString);
        end else begin
            FieldByName('OT_la_Factura').AsString := Trim(FieldByName('OT_Numero_Factura').AsString);
        end;
    end;

    UTI_LINEAS_Poner_Totales_Linea_Detalle( SQLQuery_Ftra_Compras_Detalles );
end;

procedure Tform_articulos_ultimas_ventas_000.SQLQuery_Ftra_Ventas_DetallesCalcFields
  (DataSet: TDataSet);
begin
    with SQLQuery_Ftra_Ventas_Detalles do
    begin
        if Trim(FieldByName('OT_Serie_Factura').AsString) <> '' then
        begin
            FieldByName('OT_la_Factura').AsString := Trim(FieldByName('OT_Serie_Factura').AsString) +
                                                     '-' +
                                                     Trim(FieldByName('OT_Numero_Factura').AsString);
        end else begin
            FieldByName('OT_la_Factura').AsString := Trim(FieldByName('OT_Numero_Factura').AsString);
        end;
    end;

    UTI_LINEAS_Poner_Totales_Linea_Detalle( SQLQuery_Ftra_Ventas_Detalles );
end;

procedure Tform_articulos_ultimas_ventas_000.Filtrar_Tablas;
var
  var_Lineas_Filtro  : TStrings;
  var_Lineas_OrderBy : TStrings;
  var_Borramos       : Boolean;
  var_ver_Bajas      : ShortInt;
  var_SQL_ADD        : TStrings;
begin
    var_SQL_ADD := TStringList.Create;

    var_ver_Bajas      := 1; // asi no se ven las bajas hasta que no lo pida el form de altas/modif de líneas

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    // ********************************************************************************************* //
    // ** Albaranes de ventas ... líneas de detalle sin facturar                                  ** //
    // ********************************************************************************************* //
    // ** Si se está filtrando por el artículo pues se lo pasamos                                 ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_articulos.Text) <> '' then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'ad.id_articulos = ' + Trim(Edit_id_articulos.Text) );
        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Si se está filtrando por el vehículo pues se lo pasamos                                 ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Vehiculos.Text) <> '' then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'albv.id_vehiculos = ' + Trim(Edit_id_Vehiculos.Text) );
        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Si se está filtrando por el almacén pues se lo pasamos                                  ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Almacenes.Text) <> '' then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'albv.id_almacenes = ' + Trim(Edit_id_Almacenes.Text) );
        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Si se está filtrando por el cliente pues se lo pasamos                                  ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_clientes.Text) <> '' then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'ad.id_clientes = ' + Trim(Edit_id_clientes.Text) );
        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Se filtra por el concepto                                                               ** //
    // ********************************************************************************************* //
    if Trim(Edit_Concepto.Text) <> '' then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( '(  ' + '( ad.descripcion LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Concepto.Text) + '%') + ' )' +
                                 ' OR ' +
                                 '( ad.descripcion_para_TPV LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Concepto.Text) + '%') + ' )' +
                         '  )' );


        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Se filtra explicitamente aquellos albaranes no facturados todavía                       ** //
    // ********************************************************************************************* //
    if CheckBox_Albaranes_Ventas_Solo_No_Facturados.Checked = true then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'ad.Numero_Factura IS NULL ' );
        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    var_Lineas_OrderBy.Clear;
    Filtrar_Albaranes_Ventas_Detalles_sin_Facturar( Edit_Ctdad_Albaranes_Ventas_sin_Facturar_a_Ver.Text,
                                                    var_ver_Bajas,
                                                    false,
                                                    var_Lineas_Filtro,
                                                    var_Lineas_OrderBy );

    // ********************************************************************************************* //
    // ** facturas de ventas ... líneas de detalle                                                ** //
    // ********************************************************************************************* //
    // ** Si se está filtrando por el artículo pues se lo pasamos                                 ** //
    // ********************************************************************************************* //
    var_Lineas_Filtro.Clear;

    if Trim(Edit_id_articulos.Text) <> '' then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'fd.id_articulos = ' + Trim(Edit_id_articulos.Text) );
        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Si se está filtrando por el almacén pues se lo pasamos                                  ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Almacenes.Text) <> '' then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'fv.id_almacenes = ' + Trim(Edit_id_Almacenes.Text) );
        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Si se está filtrando por el cliente pues se lo pasamos                                  ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_clientes.Text) <> '' then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'fd.id_clientes = ' + Trim(Edit_id_clientes.Text) );
        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Se filtra por el concepto                                                               ** //
    // ********************************************************************************************* //
    if Trim(Edit_Concepto.Text) <> '' then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( '(  ' +
                                 '( fd.descripcion LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Concepto.Text) + '%') + ' )' +
                                 ' OR ' +
                                '( fd.descripcion_para_TPV LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Concepto.Text) + '%') + ' )' +
                         '  )' );

        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    var_Lineas_OrderBy.Clear;
    Filtrar_Facturas_Ventas_Detalles( Edit_Ctdad_Facturas_Ventas_a_Ver.Text,
                                      var_ver_Bajas,
                                      false,
                                      var_Lineas_Filtro,
                                      var_Lineas_OrderBy );

    // ********************************************************************************************* //
    // ** Albaranes de compras ... líneas de detalle sin facturar                                 ** //
    // ********************************************************************************************* //
    // ** Si se está filtrando por el artículo pues se lo pasamos                                 ** //
    // ********************************************************************************************* //
    var_Lineas_Filtro.Clear;

    if Trim(Edit_id_articulos.Text) <> '' then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'acd.id_articulos = ' + Trim(Edit_id_articulos.Text) );
        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Si se está filtrando por el almacén pues se lo pasamos                                  ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Almacenes.Text) <> '' then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'ac.id_almacenes = ' + Trim(Edit_id_Almacenes.Text) );
        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Si se está filtrando por el cliente pues se lo pasamos                                  ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_proveedores.Text) <> '' then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'acd.id_proveedores = ' + Trim(Edit_id_proveedores.Text) );
        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Se filtra por el concepto                                                               ** //
    // ********************************************************************************************* //
    if Trim(Edit_Concepto.Text) <> '' then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( '(  ' +
                                  '( acd.descripcion LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Concepto.Text) + '%') + ' )' +
                                  ' OR ' +
                                  '( acd.descripcion_para_TPV LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Concepto.Text) + '%') + ' )' +
                         '  )' );

        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Se filtra explicitamente aquellos albaranes no facturados todavía                       ** //
    // ********************************************************************************************* //
    if CheckBox_Albaranes_Compras_Solo_No_Facturados.Checked = true then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'acd.Numero_Factura IS NULL ' );
        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    var_Lineas_OrderBy.Clear;
    Filtrar_Albaranes_Compras_Detalles_sin_Facturar( Edit_Ctdad_Albaranes_Compras_sin_Facturar_a_Ver.Text,
                                                     var_ver_Bajas,
                                                     false,
                                                     var_Lineas_Filtro,
                                                     var_Lineas_OrderBy );

    // ********************************************************************************************* //
    // ** facturas de compras ... líneas de detalle                                               ** //
    // ********************************************************************************************* //
    // ** Si se está filtrando por el artículo pues se lo pasamos                                 ** //
    // ********************************************************************************************* //
    var_Lineas_Filtro.Clear;

    if Trim(Edit_id_articulos.Text) <> '' then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'fcd.id_articulos = ' + Trim(Edit_id_articulos.Text) );
        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Si se está filtrando por el almacén pues se lo pasamos                                  ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Almacenes.Text) <> '' then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'fc.id_almacenes = ' + Trim(Edit_id_Almacenes.Text) );
        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Si se está filtrando por el cliente pues se lo pasamos                                  ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_proveedores.Text) <> '' then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'fcd.id_proveedores = ' + Trim(Edit_id_proveedores.Text) );
        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Se filtra por el concepto                                                               ** //
    // ********************************************************************************************* //
    if Trim(Edit_Concepto.Text) <> '' then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( '(  ' +
                                 '( fcd.descripcion LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Concepto.Text) + '%') + ' )' +
                                 ' OR ' +
                                 '( fcd.descripcion_para_TPV LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Concepto.Text) + '%') + ' )' +
                         '  )' );

        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    var_Lineas_OrderBy.Clear;
    Filtrar_Facturas_Compras_Detalles( Edit_Ctdad_Facturas_Compras_a_Ver.Text,
                                       var_ver_Bajas,
                                       false,
                                       var_Lineas_Filtro,
                                       var_Lineas_OrderBy );

    // ********************************************************************************************* //
    // ** se terminan de filtrar las tablas                                                       ** //
    // ********************************************************************************************* //
    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;
    var_SQL_ADD.Free;
end;

procedure Tform_articulos_ultimas_ventas_000.Boton_Elegir_id_clientesClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Clientes( '', '', true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_clientes.Text         := Trim(var_Registro.id_1);
        Edit_descripcion_cliente.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_articulos_ultimas_ventas_000.Edit_descripcion_clienteClick(Sender: TObject);
begin
    Edit_id_clientes.Text         := '';
    Edit_descripcion_cliente.Text := '';
end;

procedure Tform_articulos_ultimas_ventas_000.Refrescar_Registros_Albaranes_Compras_Detalles_sin_Facturar;
var
  var_Ctdad_Alb_sin_Ftra_a_Ver : String;
  var_Lineas_Filtro            : TStrings;
  var_Lineas_OrderBy           : TStrings;
  var_id                       : ShortString;
  var_ver_Bajas                : ShortInt;
  var_Borramos                 : Boolean;
  var_SQL_ADD                  : TStrings;
begin
    var_SQL_ADD := TStringList.Create;

    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_id := '';

    with SQLQuery_Alb_Compras_Detalles do
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

    // ********************************************************************************************* //
    // ** Si se está filtrando por el artículo pues se lo pasamos                                 ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_articulos.Text) <> '' then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'acd.id_articulos = ' + Trim(Edit_id_articulos.Text) );
        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Si se está filtrando por el almacén pues se lo pasamos                                  ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Almacenes.Text) <> '' then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'ac.id_almacenes = ' + Trim(Edit_id_Almacenes.Text) );
        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Si se está filtrando por el cliente pues se lo pasamos                                  ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_proveedores.Text) <> '' then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'acd.id_proveedores = ' + Trim(Edit_id_proveedores.Text) );
        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Se filtra por el concepto                                                               ** //
    // ********************************************************************************************* //
    if Trim(Edit_Concepto.Text) <> '' then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( '(  ' +
                                 '( acd.descripcion LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Concepto.Text) + '%') + ' )' +
                                 ' OR ' +
                                 '( acd.descripcion_para_TPV LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Concepto.Text) + '%') + ' )' +
                         '  )' );

        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Se filtra explicitamente aquellos albaranes no facturados todavía                       ** //
    // ********************************************************************************************* //
    if CheckBox_Albaranes_Compras_Solo_No_Facturados.Checked = true then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'acd.Numero_Factura IS NULL ' );
        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Filtramos                                                                               ** //
    // ********************************************************************************************* //
    var_ver_Bajas                := 1; // asi no se ven las bajas hasta que no lo pida el form de altas/modif de líneas

    var_Ctdad_Alb_sin_Ftra_a_Ver := Edit_Ctdad_Albaranes_Compras_sin_Facturar_a_Ver.Text;

    Filtrar_Albaranes_Compras_Detalles_sin_Facturar( var_Ctdad_Alb_sin_Ftra_a_Ver,
                                                     var_ver_Bajas,
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
            SQLQuery_Alb_Compras_Detalles.Last;
        end else begin
            // ************************************************************************************* //
            // ** Estabamos en una edición, así que ya conocíamos la id del registro. Por lo que  ** //
            // ** hago el locate por esta id                                                      ** //
            // ************************************************************************************* //
            SQLQuery_Alb_Compras_Detalles.Locate('id', StrToInt64(var_id), []);
        end;

    end;
    var_SQL_ADD.Free;
end;

procedure Tform_articulos_ultimas_ventas_000.Refrescar_Registros_Albaranes_Ventas_Detalles_sin_Facturar;
var
  var_Ctdad_Alb_sin_Ftra_a_Ver : String;
  var_Lineas_Filtro            : TStrings;
  var_Lineas_OrderBy           : TStrings;
  var_id                       : ShortString;
  var_ver_Bajas                : ShortInt;
  var_Borramos                 : Boolean;
  var_SQL_ADD                  : TStrings;
begin
    var_SQL_ADD := TStringList.Create;

    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_id := '';

    with SQLQuery_Alb_Ventas_Detalles do
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

    // ********************************************************************************************* //
    // ** Si se está filtrando por el artículo pues se lo pasamos                                 ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_articulos.Text) <> '' then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'ad.id_articulos = ' + Trim(Edit_id_articulos.Text) );
        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Si se está filtrando por el vehículo pues se lo pasamos                                 ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Vehiculos.Text) <> '' then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'albv.id_vehiculos = ' + Trim(Edit_id_Vehiculos.Text) );
        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Si se está filtrando por el almacén pues se lo pasamos                                  ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Almacenes.Text) <> '' then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'albv.id_almacenes = ' + Trim(Edit_id_Almacenes.Text) );
        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Si se está filtrando por el cliente pues se lo pasamos                                  ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_clientes.Text) <> '' then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'ad.id_clientes = ' + Trim(Edit_id_clientes.Text) );
        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Se filtra por el concepto                                                               ** //
    // ********************************************************************************************* //
    if Trim(Edit_Concepto.Text) <> '' then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( '(  ' +
                                 '( ad.descripcion LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Concepto.Text) + '%') + ' )' +
                                 ' OR ' +
                                 '( ad.descripcion_para_TPV LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Concepto.Text) + '%') + ' )' +
                         '  )' );

        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Se filtra explicitamente aquellos albaranes no facturados todavía                       ** //
    // ********************************************************************************************* //
    if CheckBox_Albaranes_Ventas_Solo_No_Facturados.Checked = true then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'ad.Numero_Factura IS NULL ' );
        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Filtramos                                                                               ** //
    // ********************************************************************************************* //
    var_ver_Bajas                := 1; // asi no se ven las bajas hasta que no lo pida el form de altas/modif de líneas

    var_Ctdad_Alb_sin_Ftra_a_Ver := Edit_Ctdad_Albaranes_Ventas_sin_Facturar_a_Ver.Text;

    Filtrar_Albaranes_Ventas_Detalles_sin_Facturar( var_Ctdad_Alb_sin_Ftra_a_Ver,
                                                    var_ver_Bajas,
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
            SQLQuery_Alb_Ventas_Detalles.Last;
        end else begin
            // ************************************************************************************* //
            // ** Estabamos en una edición, así que ya conocíamos la id del registro. Por lo que  ** //
            // ** hago el locate por esta id                                                      ** //
            // ************************************************************************************* //
            SQLQuery_Alb_Ventas_Detalles.Locate('id', StrToInt64(var_id), []);
        end;

    end;
    var_SQL_ADD.Free;
end;

procedure Tform_articulos_ultimas_ventas_000.Refrescar_Registros_Facturas_Compras_Detalles;
var
  var_Ctdad_Ftras_a_Ver : String;
  var_Lineas_Filtro     : TStrings;
  var_Lineas_OrderBy    : TStrings;
  var_id                : ShortString;
  var_ver_Bajas         : ShortInt;
  var_Borramos          : Boolean;
  var_SQL_ADD           : TStrings;
begin
    var_SQL_ADD := TStringList.Create;

    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_id := '';

    with SQLQuery_Ftra_Compras_Detalles do
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

    // ********************************************************************************************* //
    // ** Si se está filtrando por el artículo pues se lo pasamos                                 ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_articulos.Text) <> '' then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'fcd.id_articulos = ' + Trim(Edit_id_articulos.Text) );
        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Si se está filtrando por el almacén pues se lo pasamos                                  ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Almacenes.Text) <> '' then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'fc.id_almacenes = ' + Trim(Edit_id_Almacenes.Text) );
        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Si se está filtrando por el cliente pues se lo pasamos                                  ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_proveedores.Text) <> '' then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'fcd.id_proveedores = ' + Trim(Edit_id_proveedores.Text) );
        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Se filtra por el concepto                                                               ** //
    // ********************************************************************************************* //
    if Trim(Edit_Concepto.Text) <> '' then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( '(  ' +
                                 '( fcd.descripcion LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Concepto.Text) + '%') + ' )' +
                                 ' OR ' +
                                 '( fcd.descripcion_para_TPV LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Concepto.Text) + '%') + ' )' +
                         '  )' );

        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Filtramos                                                                               ** //
    // ********************************************************************************************* //
    var_ver_Bajas         := 1; // asi no se ven las bajas hasta que no lo pida el form de altas/modif de líneas
    var_Ctdad_Ftras_a_Ver := Edit_Ctdad_Facturas_Compras_a_Ver.Text;

    Filtrar_Facturas_Compras_Detalles( var_Ctdad_Ftras_a_Ver,
                                       var_ver_Bajas,
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
            SQLQuery_Ftra_Compras_Detalles.Last;
        end else begin
            // ************************************************************************************* //
            // ** Estabamos en una edición, así que ya conocíamos la id del registro. Por lo que  ** //
            // ** hago el locate por esta id                                                      ** //
            // ************************************************************************************* //
            SQLQuery_Ftra_Compras_Detalles.Locate('id', StrToInt64(var_id), []);
        end;

    end;

    var_SQL_ADD.Free;
end;

procedure Tform_articulos_ultimas_ventas_000.Refrescar_Registros_Facturas_Ventas_Detalles;
var
  var_Ctdad_Ftras_a_Ver : String;
  var_Lineas_Filtro     : TStrings;
  var_Lineas_OrderBy    : TStrings;
  var_id                : ShortString;
  var_ver_Bajas         : ShortInt;
  var_Borramos          : Boolean;
  var_SQL_ADD           : TStrings;
begin
    var_SQL_ADD := TStringList.Create;

    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_id := '';

    with SQLQuery_Ftra_Ventas_Detalles do
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

    // ********************************************************************************************* //
    // ** Si se está filtrando por el artículo pues se lo pasamos                                 ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_articulos.Text) <> '' then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'fd.id_articulos = ' + Trim(Edit_id_articulos.Text) );
        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Si se está filtrando por el almacén pues se lo pasamos                                  ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Almacenes.Text) <> '' then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'fv.id_almacenes = ' + Trim(Edit_id_Almacenes.Text) );
        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Si se está filtrando por el cliente pues se lo pasamos                                  ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_clientes.Text) <> '' then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'fd.id_clientes = ' + Trim(Edit_id_clientes.Text) );
        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Se filtra por el concepto                                                               ** //
    // ********************************************************************************************* //
    if Trim(Edit_Concepto.Text) <> '' then
    begin
        var_Borramos := true;
        if Trim(var_Lineas_Filtro.Text) <> '' then
        begin
            var_Borramos := false;
        end;

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( '(  ' +
                                  '( fd.descripcion LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Concepto.Text) + '%') + ' )' +
                                  ' OR ' +
                                  '( fd.descripcion_para_TPV LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Concepto.Text) + '%') + ' )' +
                         '  )' );

        UTI_TB_SQL_ADD( var_Borramos,
                        var_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Filtramos                                                                               ** //
    // ********************************************************************************************* //
    var_ver_Bajas         := 1; // asi no se ven las bajas hasta que no lo pida el form de altas/modif de líneas
    var_Ctdad_Ftras_a_Ver := Edit_Ctdad_Facturas_Ventas_a_Ver.Text;

    Filtrar_Facturas_Ventas_Detalles( var_Ctdad_Ftras_a_Ver,
                                      var_ver_Bajas,
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
            SQLQuery_Ftra_Ventas_Detalles.Last;
        end else begin
            // ************************************************************************************* //
            // ** Estabamos en una edición, así que ya conocíamos la id del registro. Por lo que  ** //
            // ** hago el locate por esta id                                                      ** //
            // ************************************************************************************* //
            SQLQuery_Ftra_Ventas_Detalles.Locate('id', StrToInt64(var_id), []);
        end;

    end;

    var_SQL_ADD.Free;
end;

function Tform_articulos_ultimas_ventas_000.Filtrar_Albaranes_Compras_Detalles_sin_Facturar( param_Limite_Registros : string;
                                                                                             param_ver_bajas : ShortInt;
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
    param_Lineas_OrderBy.Text := private_Order_By_Alb_Compras_Detalle[0].Memo_OrderBy +
                                 ' LIMIT ' + Trim(param_Limite_Registros);
  end;

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  Result := UTI_TB_Filtrar( private_Order_By_Alb_Compras_Detalle,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Alb_Compras_Detalles,
                                                          'albaranes_compras_detalles',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Alb_Compras_Detalles,
                                                          'albaranes_compras_detalles',
                                                          'i' ),

                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_articulos_ultimas_ventas.SQLTransaction_Alb_C_D,
                            DataModule_articulos_ultimas_ventas.SQLConnector_Alb_C_D,
                            SQLQuery_Alb_Compras_Detalles,

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

                            'RIGHT JOIN albaranes_compras AS ac' + ' ' +
                            'ON acd.id_albaranes = ac.id AND' + ' ' +
                               'ac.Del_WHEN IS NULL ',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_a_Filtrar_Plus.Free;
end;

function Tform_articulos_ultimas_ventas_000.Filtrar_Albaranes_Ventas_Detalles_sin_Facturar( param_Limite_Registros : string;
                                                                                            param_ver_bajas : ShortInt;
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
    param_Lineas_OrderBy.Text := private_Order_By_Alb_Ventas_Detalle[0].Memo_OrderBy +
                                 ' LIMIT ' + Trim(param_Limite_Registros);
  end;

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  Result := UTI_TB_Filtrar( private_Order_By_Alb_Ventas_Detalle,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Alb_Ventas_Detalles,
                                                          'albaranes_ventas_detalles',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Alb_Ventas_Detalles,
                                                          'albaranes_ventas_detalles',
                                                          'i' ),

                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_articulos_ultimas_ventas.SQLTransaction_Alb_V_D,
                            DataModule_articulos_ultimas_ventas.SQLConnector_Alb_V_D,
                            SQLQuery_Alb_Ventas_Detalles,

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

                            'RIGHT JOIN albaranes_ventas AS albv' + ' ' +
                            'ON ad.id_albaranes = albv.id AND' + ' ' +
                               'ad.Del_WHEN IS NULL ',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_a_Filtrar_Plus.Free;
end;

function Tform_articulos_ultimas_ventas_000.Filtrar_Facturas_Compras_Detalles( param_Limite_Registros : string;
                                                                               param_ver_bajas : ShortInt;
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
    param_Lineas_OrderBy.Text := private_Order_By_Ftra_Compras_Detalle[0].Memo_OrderBy +
                                 ' LIMIT ' + Trim(param_Limite_Registros);
  end;

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  Result := UTI_TB_Filtrar( private_Order_By_Ftra_Compras_Detalle,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Ftra_Compras_Detalles,
                                                          'facturas_compras_detalles',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Ftra_Compras_Detalles,
                                                     'facturas_compras_detalles',
                                                     'i' ),
                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_articulos_ultimas_ventas.SQLTransaction_Ftra_C_D,
                            DataModule_articulos_ultimas_ventas.SQLConnector_Ftra_C_D,
                            SQLQuery_Ftra_Compras_Detalles,

                            // name_tabla,
                            'fcd',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT fcd.*,' + ' ' +

                                   'pr.nombre_propietario AS OT_Proveedor_nombre_propietario,' + ' ' +
                                   'pr.nombre_comercial AS OT_Proveedor_nombre_comercial,' + ' ' +

                                   'fc.id_almacenes AS OT_id_almacenes_Cabecera,' + ' ' +
                                   'fc.Serie_Factura AS OT_Serie_Factura,' + ' ' +
                                   'fc.Numero_Factura AS OT_Numero_Factura,' + ' ' +

                                   'al.descripcion AS OT_descripcion_almacen,' + ' ' +

                                   'a.descripcion_para_TPV AS OT_descripcion_articulo,' + ' ' +
                                   'a.Tipo_de_articulo AS OT_Tipo_de_articulo,' + ' ' +

                                   'i.descripcion AS OT_descripcion_impuesto,' + ' ' +
                                   'i.Tanto_Por_Ciento AS OT_Tanto_Por_Ciento,' + ' ' +
                                   'i.Sumado_A_Ftra_SN AS OT_Sumado_A_Ftra_SN' + ' ' +

                            'FROM facturas_compras_detalles AS fcd' + ' ' +

                            'LEFT JOIN almacenes AS al' + ' ' +
                            'ON fcd.id_almacenes = al.id' + ' ' +

                            'LEFT JOIN articulos AS a' + ' ' +
                            'ON fcd.id_articulos = a.id' + ' ' +

                            'LEFT JOIN impuestos AS i' + ' ' +
                            'ON fcd.id_impuestos_Compras = i.id' + ' ' +

                            'LEFT JOIN proveedores AS pr' + ' ' +
                            'ON fcd.id_proveedores = pr.id' + ' ' +

                            'RIGHT JOIN facturas_compras AS fc' + ' ' +
                            'ON fcd.id_facturas = fc.id AND' + ' ' +
                               'fc.Del_WHEN IS NULL ',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_a_Filtrar_Plus.Free;
end;

function Tform_articulos_ultimas_ventas_000.Filtrar_Facturas_Ventas_Detalles( param_Limite_Registros : string;
                                                                              param_ver_bajas : ShortInt;
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
    param_Lineas_OrderBy.Text := private_Order_By_Ftra_Ventas_Detalle[0].Memo_OrderBy +
                                 ' LIMIT ' + Trim(param_Limite_Registros);
  end;

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  Result := UTI_TB_Filtrar( private_Order_By_Ftra_Ventas_Detalle,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Ftra_Ventas_Detalles,
                                                          'facturas_ventas_detalles',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Ftra_Ventas_Detalles,
                                                          'facturas_ventas_detalles',
                                                          'i' ),

                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_articulos_ultimas_ventas.SQLTransaction_Ftra_V_D,
                            DataModule_articulos_ultimas_ventas.SQLConnector_Ftra_V_D,
                            SQLQuery_Ftra_Ventas_Detalles,

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

                            'RIGHT JOIN facturas_ventas AS fv' + ' ' +
                            'ON fd.id_facturas = fv.id AND' + ' ' +
                               'fv.Del_WHEN IS NULL ',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_a_Filtrar_Plus.Free;
end;

procedure Tform_articulos_ultimas_ventas_000.DBNavigator_Facturas_VentasBeforeAction
  (Sender: TObject; Button: TDBNavButtonType);
begin
    case Button of
        nbRefresh : begin
            Refrescar_Registros_Facturas_Ventas_Detalles;
            Abort;
        end;
    end;
end;

procedure Tform_articulos_ultimas_ventas_000.DBNavigator_Albaranes_Ventas_sin_FacturarBeforeAction
  (Sender: TObject; Button: TDBNavButtonType);
begin
    case Button of
        nbRefresh : begin
            Refrescar_Registros_Albaranes_Ventas_Detalles_sin_Facturar;
            Abort;
        end;
    end;
end;

end.



