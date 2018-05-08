unit presupuestos_compras_000;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, DateTimePicker, Forms, Controls, Graphics, Dialogs,
  variants, StdCtrls, ExtCtrls, Buttons, ComCtrls, DBGrids, DbCtrls, Grids, utilidades_bd,
  utilidades_general, utilidades_rgtro, utilidades_compras, utilidades_impuestos, utilidades_usuarios,
  utilidades_datos_tablas, utilidades_forms_Filtrar;

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
    Boton_Elegir_id_Proveedores: TBitBtn;
    ComboBox_Filtros: TComboBox;
    DataSource_Pdo: TDataSource;
    DataSource_Pdo_Detalles: TDataSource;
    DataSource_Presup: TDataSource;
    DataSource_Presup_Detalles: TDataSource;
    DateTimePicker_Desde: TDateTimePicker;
    DateTimePicker_Hasta: TDateTimePicker;
    DBGrid_Principal: TDBGrid;
    DBNavigator1: TDBNavigator;
    Edit_Descripcion_Empresa: TEdit;
    Edit_Descripcion_Forma_Pago: TEdit;
    Edit_Descripcion_id_Almacenes: TEdit;
    Edit_Descripcion_id_Proveedores: TEdit;
    Edit_id_Almacenes: TEdit;
    Edit_id_Proveedores: TEdit;
    Edit_id_Empresas: TEdit;
    Edit_id_Forma_Pago: TEdit;
    Edit_Presupuesto_Numero: TEdit;
    GroupBox4: TGroupBox;
    GroupBox_Serie_Numero: TGroupBox;
    Image_Candado: TImage;
    Image_Convertida: TImage;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label50: TLabel;
    Label7: TLabel;
    Label75: TLabel;
    Label8: TLabel;
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
    SQLQuery_Pdo: TSQLQuery;
    SQLQuery_Pdoid: TLargeintField;
    SQLQuery_PdoOT_el_Pedido: TStringField;
    SQLQuery_PdoOT_Total_Base_Imponible: TFloatField;
    SQLQuery_PdoOT_Total_Dtos: TFloatField;
    SQLQuery_PdoOT_Total_Impuestos: TFloatField;
    SQLQuery_PdoOT_Total_Lineas: TFloatField;
    SQLQuery_PdoOT_Total_Mano_Obra: TFloatField;
    SQLQuery_PdoOT_Total_Materiales: TFloatField;
    SQLQuery_PdoOT_Total_Resto: TFloatField;
    SQLQuery_PdoOT_Total_Total: TFloatField;
    SQLQuery_Pdo_Detalles: TSQLQuery;
    SQLQuery_Pdo_DetallesOT_Concepto_Articulo: TStringField;
    SQLQuery_Pdo_DetallesOT_Excluirlo: TStringField;
    SQLQuery_Pdo_DetallesOT_para_Cobrar: TFloatField;
    SQLQuery_Pdo_DetallesOT_Total_B_Imp: TFloatField;
    SQLQuery_Pdo_DetallesOT_Total_Dto: TFloatField;
    SQLQuery_Pdo_DetallesOT_Total_Impto: TFloatField;
    SQLQuery_Pdo_DetallesOT_Total_Linea: TFloatField;
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
    SQLQuery_PresupFecha_Contabilizacion: TDateTimeField;
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
    SQLQuery_PresupNumero_Presupuesto_Compras: TStringField;
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
    SQLQuery_PresupOT_Envio_descripcion_pais: TStringField;
    SQLQuery_PresupOT_Envio_descripcion_poblacion: TStringField;
    SQLQuery_PresupOT_Envio_descripcion_provincia: TStringField;
    SQLQuery_PresupOT_Movil_transportista: TStringField;
    SQLQuery_PresupOT_tfno_1_transportista: TStringField;
    SQLQuery_PresupOT_Total_Base_Imponible: TFloatField;
    SQLQuery_PresupOT_Total_Dtos: TFloatField;
    SQLQuery_PresupOT_Total_Impuestos: TFloatField;
    SQLQuery_PresupOT_Total_Lineas: TFloatField;
    SQLQuery_PresupOT_Total_Mano_Obra: TFloatField;
    SQLQuery_PresupOT_Total_Materiales: TFloatField;
    SQLQuery_PresupOT_Total_Resto: TFloatField;
    SQLQuery_PresupOT_Total_Total: TFloatField;
    SQLQuery_PresupRetencion: TBCDField;
    SQLQuery_PresupTfno_Fijo_1: TStringField;
    SQLQuery_PresupTfno_Fijo_2: TStringField;
    SQLQuery_PresupTotal_Base_Imponible: TBCDField;
    SQLQuery_PresupTotal_Dtos: TBCDField;
    SQLQuery_PresupTotal_Impuestos: TBCDField;
    SQLQuery_PresupTotal_Lineas: TBCDField;
    SQLQuery_PresupTotal_Mano_Obra: TBCDField;
    SQLQuery_PresupTotal_Materiales: TBCDField;
    SQLQuery_PresupTotal_Resto: TBCDField;
    SQLQuery_PresupTotal_Total: TBCDField;
    SQLQuery_PresupVencimientos_automaticos_SN: TStringField;
    SQLQuery_PresupVencimientos_Cantidad: TSmallintField;
    SQLQuery_PresupVencimientos_Dias_Entre: TSmallintField;
    SQLQuery_Presup_Detalles: TSQLQuery;
    SQLQuery_Presup_DetallesChange_Id_User: TLargeintField;
    SQLQuery_Presup_DetallesChange_WHEN: TDateTimeField;
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
    SQLQuery_Presup_Detallesid_presupuestos_compras: TLargeintField;
    SQLQuery_Presup_Detallesid_proveedores: TLargeintField;
    SQLQuery_Presup_DetallesInsert_Id_User: TLargeintField;
    SQLQuery_Presup_DetallesInsert_WHEN: TDateTimeField;
    SQLQuery_Presup_DetallesNumero_Pedido_Compras: TStringField;
    SQLQuery_Presup_DetallesOT_Concepto_Articulo: TStringField;
    SQLQuery_Presup_DetallesOT_descripcion_almacen: TStringField;
    SQLQuery_Presup_DetallesOT_descripcion_articulo: TStringField;
    SQLQuery_Presup_DetallesOT_descripcion_impuesto: TStringField;
    SQLQuery_Presup_DetallesOT_Excluirlo: TStringField;
    SQLQuery_Presup_DetallesOT_para_Cobrar: TFloatField;
    SQLQuery_Presup_DetallesOT_Tipo_de_articulo: TStringField;
    SQLQuery_Presup_DetallesOT_Total_B_Imp: TFloatField;
    SQLQuery_Presup_DetallesOT_Total_Dto: TFloatField;
    SQLQuery_Presup_DetallesOT_Total_Impto: TFloatField;
    SQLQuery_Presup_DetallesOT_Total_Linea: TFloatField;
    SQLQuery_Presup_DetallesPVP: TBCDField;
    SQLQuery_Presup_DetallesPVP_Impuestos_Incluidos: TBCDField;
    SQLQuery_Presup_DetallesPVP_Manual_Final: TBCDField;
    SQLQuery_Presup_DetallesRepetir_Cada: TLongintField;
    SQLQuery_Presup_DetallesUnidades: TBCDField;
    TabSheet_Busqueda_Concreta: TTabSheet;
    TabSheet_Filtros_Generales: TTabSheet;

    procedure Presentar_Datos_Totales( param_Actualizar_Totales : Byte );
    procedure Insertar_Registro;
    procedure Editar_Registro;
    procedure Borrar_Registro;
    procedure Comprobar_Si_Hay_Lineas_Detalle_Sin_Pedido(param_msg : TStrings);
    procedure Cerrarlo;
    procedure BitBtn_Convertir_Integro_en_PedidoClick(Sender: TObject);
    procedure Cerramos_Tabla_Pedidos_Cabecera;
    procedure BitBtn_Considerar_como_cerradoClick(Sender: TObject);
    procedure Boton_Elegir_EmpresaClick(Sender: TObject);
    procedure Boton_Elegir_Forma_PagoClick(Sender: TObject);
    procedure Boton_Elegir_id_AlmacenesClick(Sender: TObject);
    procedure Boton_Elegir_id_ProveedoresClick(Sender: TObject);
    procedure ComboBox_FiltrosChange(Sender: TObject);
    procedure DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Edit_Descripcion_EmpresaClick(Sender: TObject);
    procedure Edit_Descripcion_Forma_PagoClick(Sender: TObject);
    procedure Edit_Descripcion_id_AlmacenesClick(Sender: TObject);
    procedure Edit_Descripcion_id_ProveedoresClick(Sender: TObject);
    procedure Refrescar_Registros;
    procedure Refrescar_Registros_Detalles;
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
    procedure DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid_PrincipalTitleClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure para_Empezar;
    function  Cambiar_Almacen_y_Proveedor_Lineas_Detalle( param_id_almacenes, param_id_proveedores, param_id : String ) : Boolean;
    function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
    procedure Filtrar_tablas_ligadas;
    function  Filtrar_Lineas_Detalles( param_Last_Column : TColumn; param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
    procedure Convertir_Integro_en_Pedido( param_msg : TStrings );
    procedure Filtrar_Principal_Sin_Preguntar;
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
    private_Salir_OK              : Boolean;
    private_Last_Column           : TColumn;
    private_Order_By              : array of TOrder_By;
    private_Order_By_Pto_Detalles : array of TOrder_By;
  public
    { public declarations }
    public_Solo_Ver             : Boolean;
    public_Elegimos             : Boolean;
    public_Menu_Worked          : Integer;
    public_Rgtro_Seleccionado   : Boolean;
    public_Last_Column_Detalles : TColumn;
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
        BitBtn_Imprimir.Visible  := False;

        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    if public_Solo_Ver = true then no_Tocar;
end;

procedure Tform_presupuestos_compras_000.FormCreate(Sender: TObject);
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
    DBGrid_Principal.TitleImageList := Form_Menu.ImageList_Grid_Sort;
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

procedure Tform_presupuestos_compras_000.para_Empezar;
begin
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
    // ** ALUMNOS/CLIENTES                                                                        ** //
    // ********************************************************************************************* //
    SetLength(private_Order_By, 4);

    private_Order_By[0].Titulo       := 'Por fecha de contabilización';
    private_Order_By[0].Memo_OrderBy := 'pc.Fecha ASC, pc.id ASC';

    private_Order_By[1].Titulo       := 'Por el número de entrada'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[1].Memo_OrderBy := 'pc.id ASC';

    private_Order_By[2].Titulo       := 'Por empresa';
    private_Order_By[2].Memo_OrderBy := 'pc.id_empresas ASC, pc.Fecha_Contabilizacion ASC, pc.id ASC';

    private_Order_By[3].Titulo       := 'Por proveedor';
    private_Order_By[3].Memo_OrderBy := 'pc.id_proveedores ASC, pc.Fecha_Contabilizacion ASC, pc.id ASC';

    Memo_OrderBy.Lines.Text          := private_Order_By[0].Memo_OrderBy;

    UTI_TB_Rellenar_ComboBox_Orden( true,
                                    ComboBox_Filtros,
                                    private_Order_By,
                                    0 );

    // ********************************************************************************************* //
    // ** LINEAS DETALLE                                                                          ** //
    // ********************************************************************************************* //
    SetLength(private_Order_By_Pto_Detalles, 1);

    private_Order_By_Pto_Detalles[0].Titulo       := 'Por id del presupuesto'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_Pto_Detalles[0].Memo_OrderBy := 'pcd.id_presupuestos_compras ASC, pcd.id ASC';

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

procedure Tform_presupuestos_compras_000.RadioGroup_BajasClick(Sender: TObject);
begin
    Refrescar_Registros;
end;

procedure Tform_presupuestos_compras_000.SQLQuery_PdoAfterPost(DataSet: TDataSet);
begin
    UTI_RGTRO_Grabar( 'pedidos_compras',
                      DataModule_Presupuestos_Compras.SQLTransaction_Pedido,
                      SQLQuery_Pdo );

    // Refrescar_Registros;
end;

procedure Tform_presupuestos_compras_000.SQLQuery_PdoBeforePost(DataSet: TDataSet);
begin
    UTI_RGTRO_param_assign_value( SQLQuery_Pdo );
end;

procedure Tform_presupuestos_compras_000.SQLQuery_Pdo_DetallesAfterPost(DataSet: TDataSet);
begin
    UTI_RGTRO_Grabar( 'pedidos_compras_detalles',
                      DataModule_Presupuestos_Compras.SQLTransaction_Pedido_Detalles,
                      SQLQuery_Pdo_Detalles );

    // Refrescar_Registros_Detalles;
end;

procedure Tform_presupuestos_compras_000.SQLQuery_Pdo_DetallesBeforePost(DataSet: TDataSet);
begin
    UTI_RGTRO_param_assign_value( SQLQuery_Pdo_Detalles );
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
        if form_Menu.public_Salir_OK = False then CloseAction := CloseAction.caNone;
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

procedure Tform_presupuestos_compras_000.SQLQuery_Pdo_DetallesCalcFields(DataSet: TDataSet);
var var_Valores_Linea : TCalculo_Linea_Detalle;
    var_Calculo       : Extended;
begin
    with SQLQuery_Pdo_Detalles do
    begin
        // ***************************************************************************************** //
        // ** Descripción de la línea de detalle                                                  ** //
        // ***************************************************************************************** //
        if Trim(FieldByName('OT_descripcion_articulo').AsString) <> '' then
        begin
            FieldByName('OT_Concepto_Articulo').AsString := FieldByName('OT_descripcion_articulo').AsString;
        end else begin
            if Trim(FieldByName('descripcion_para_TPV').AsString) <> '' then
            begin
                FieldByName('OT_Concepto_Articulo').AsString := FieldByName('descripcion_para_TPV').AsString;
            end;

            if Trim(FieldByName('descripcion').AsString) <> '' then
            begin
                FieldByName('OT_Concepto_Articulo').AsString := FieldByName('descripcion').AsString;
            end;
        end;

        // ***************************************************************************************** //
        // ** No se va a cobrar                                                                   ** //
        // ***************************************************************************************** //
        FieldByName('OT_Excluirlo').AsString := '';
        if UpperCase(Trim(FieldByName('Excluido_su_Cobro_SN').AsString)) = 'S' then
        begin
             FieldByName('OT_Excluirlo').AsString := 'S';
        end;

        // ***************************************************************************************** //
        // ** Calcular su cobro                                                                   ** //
        // ***************************************************************************************** //
        var_Valores_Linea := UTI_COMPRAS_Calculo_de_Linea_Detalle(SQLQuery_Pdo_Detalles);

        FieldByName('OT_Total_Linea').Value := 0;
        FieldByName('OT_Total_Dto').Value   := 0;

        FieldByName('OT_Total_B_Imp').Value := 0;

        FieldByName('OT_Total_Impto').Value := 0;

        FieldByName('OT_para_Cobrar').Value := 0;

        if FieldByName('Excluido_su_Cobro_SN').Value <> 'S' then
        begin
            var_Calculo := ( (var_Valores_Linea.Unidades_por_Precio - var_Valores_Linea.Dto_1)
                             - var_Valores_Linea.Dto_2
                           ) + var_Valores_Linea.Impuestos;

            FieldByName('OT_Total_Linea').Value := var_Valores_Linea.Unidades_por_Precio;
            FieldByName('OT_Total_Dto').Value   := var_Valores_Linea.Dto_1 + var_Valores_Linea.Dto_2;

            FieldByName('OT_Total_B_Imp').Value := ( (var_Valores_Linea.Unidades_por_Precio - var_Valores_Linea.Dto_1)
                                                      - var_Valores_Linea.Dto_2 );

            FieldByName('OT_Total_Impto').Value := var_Valores_Linea.Impuestos;
            FieldByName('OT_para_Cobrar').Value := var_Calculo;

            // ***************************************************************************************** //
            // ** Solo si se puso un precio fijo se cambia este importe por el calculado              ** //
            // ***************************************************************************************** //
            if not FieldByName('PVP_Manual_Final').IsNull then
            begin
                FieldByName('OT_para_Cobrar').Value := FieldByName('PVP_Manual_Final').Value;

                // ************************************************************************************* //
                // ** Ahora se calcula dando marcha atras desde el impuesto                           ** //
                // ************************************************************************************* //
                FieldByName('OT_Total_Impto').Value := UTI_IMPTOS_Calcular_Impuesto( FieldByName('PVP_Manual_Final').Value,
                                                                                     FieldByName('id_impuestos_Ventas').AsString,
                                                                                     'E');

                FieldByName('OT_Total_B_Imp').Value := FieldByName('PVP_Manual_Final').Value -
                                                       FieldByName('OT_Total_Impto').Value;

                FieldByName('OT_Total_Dto').Value   := 0;

                FieldByName('OT_Total_Linea').Value := FieldByName('OT_Total_B_Imp').Value;
            end;
        end;
    end;
end;

procedure Tform_presupuestos_compras_000.SQLQuery_PresupCalcFields(DataSet: TDataSet);
begin
    with SQLQuery_Presup do
    begin
        // ***************************************************************************************** //
        // ** No hay nada que calcular                                                            ** //
        // ***************************************************************************************** //
    end;
end;

procedure Tform_presupuestos_compras_000.SQLQuery_PresupAfterPost(DataSet: TDataSet);
begin
    UTI_RGTRO_Grabar( 'presupuestos_compras',
                      DataModule_Presupuestos_Compras.SQLTransaction_Presup,
                      SQLQuery_Presup );

    Refrescar_Registros;
end;

procedure Tform_presupuestos_compras_000.SQLQuery_PresupBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTRO_param_assign_value_Edit( SQLQuery_Presup );
end;

procedure Tform_presupuestos_compras_000.SQLQuery_PresupAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure Tform_presupuestos_compras_000.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    If public_Elegimos then
         Seleccionado_Rgtro
    else Editar_Registro;
end;

procedure Tform_presupuestos_compras_000.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then
    begin
        If public_Elegimos then
             Seleccionado_Rgtro
        else Editar_Registro;
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

procedure Tform_presupuestos_compras_000.DBGrid_PrincipalTitleClick(Column: TColumn);
begin
    private_Last_Column := UTI_GEN_Ordenar_dbGrid( private_Last_Column,
                                                   Column,
                                                   SQLQuery_Presup );
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

procedure Tform_presupuestos_compras_000.BitBtn_ImprimirClick(Sender: TObject);
var var_Ficheros     : TStrings;
    var_Ordenado_por : String;
begin
    // ********************************************************************************************* //
    // ** Configuramos el título del listado                                                      ** //
    // ********************************************************************************************* //
    var_Ordenado_por := rs_Filtros_Otros_1 +
                        Trim(ComboBox_Filtros.Text);

    if Trim(Memo_Filtros.Lines.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            rs_Filtros_Otros_2 +
                            Trim(Memo_Filtros.Lines.Text);
    end;

    if Trim(Edit_Presupuesto_Numero.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con número = ' +
                            Trim(Edit_Presupuesto_Numero.Text);
    end;

    if (not DateTimePicker_Hasta.DateIsNull) or
       (not DateTimePicker_Desde.DateIsNull) then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', presupuestos entre ' +
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

    if Trim(Edit_Descripcion_id_Proveedores.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con proveedor = ' +
                            Trim(Edit_Descripcion_id_Proveedores.Text);
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

    // ********************************************************************************************* //
    // ** Configuramos la llamada al generador de informes                                        ** //
    // ********************************************************************************************* //
    var_Ficheros := TStringList.Create;

    var_Ficheros.Add( 'listado_presupuestos_compras.lrf' );

    UTI_GEN_Informes( var_Ordenado_por,
                      SQLQuery_Presup,
                      DataSource_Presup,
                      Nil,
                      Nil,
                      public_Menu_Worked,
                      public_Solo_Ver,
                      '',
                      '',
                      var_Ficheros );

    var_Ficheros.Free;
end;

procedure Tform_presupuestos_compras_000.no_Tocar;
begin
    BitBtn_Imprimir.Enabled := False;
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

    if UTI_GEN_Comprobar_2_Fechas( DateTimePicker_Desde,
                                   DateTimePicker_Hasta ) = false then
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
var var_Numero_Presupuesto_Compras : String;
    var_id_proveedores             : Int64;
begin
    Try
        // ********************************************************************************************* //
        // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
        // ********************************************************************************************* //
        var_Numero_Presupuesto_Compras := '';
        var_id_proveedores             := 0;

        with SQLQuery_Presup do
        begin
            if RecordCount > 0 then
            begin
                var_Numero_Presupuesto_Compras := FieldByName('Numero_Presupuesto_Compras').AsString;
                var_id_proveedores     := FieldByName('id_proveedores').Value;
            end;
        end;

        Filtrar_Principal_Sin_Preguntar;

        if Trim(var_Numero_Presupuesto_Compras) <> '' then
        begin
             SQLQuery_Presup.Locate( 'Numero_Presupuesto_Compras;id_proveedores',
                                     VarArrayOf( [ var_Numero_Presupuesto_Compras, var_id_proveedores ] ),
                                     [] );
        end;
    Except
    end;
end;

procedure Tform_presupuestos_compras_000.Refrescar_Registros_Detalles;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
    var_id             : ShortString;
    var_ver_Bajas      : ShortInt;
begin
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

    UTI_RGTRO_Add_to_Where( true,
                            var_Lineas_Filtro,
                            'pcd.id_presupuestos_compras = ' + SQLQuery_Presup.FieldByName('id').AsString );

    var_ver_Bajas := RadioGroup_Bajas.ItemIndex;
    if UTI_GEN_Form_Abierto_Ya('form_presupuestos_compras_001') = true then
    begin
        var_ver_Bajas := form_presupuestos_compras_001.RadioGroup_Bajas.ItemIndex;
    end;

    Filtrar_Lineas_Detalles( public_Last_Column_Detalles,
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
            // ** es id_cliente + id del registro                                                 ** //
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
end;

function Tform_presupuestos_compras_000.Filtrar_Lineas_Detalles( param_Last_Column : TColumn;
                                                                 param_ver_bajas : ShortInt;
                                                                 param_Cambiamos_Filtro : Boolean;
                                                                 param_Lineas_Filtro,
                                                                 param_Lineas_OrderBy : TStrings ) : ShortInt;
var var_Registro_CRUD : TRegistro_CRUD;
    var_ctdad_Rgtros  : Integer;
begin
    var_Registro_CRUD := UTI_DATOS_TABLA_presupuestos_compras_detalles_CRUD;
    var_ctdad_Rgtros  := -1;

    if Trim(param_Lineas_OrderBy.Text) = '' then
    begin
         param_Lineas_OrderBy.Text := private_Order_By_Pto_Detalles[0].Memo_OrderBy;
    end;

    Result := UTI_TB_Filtrar( private_Order_By_Pto_Detalles,

                              var_Registro_CRUD.Delete_SQL,
                              var_Registro_CRUD.Update_SQL,
                              var_Registro_CRUD.Insert_SQL,

                              var_ctdad_Rgtros,
                              DataModule_Presupuestos_Compras.SQLTransaction_Presup_Detalles,
                              DataModule_Presupuestos_Compras.SQLConnector_Presup_Detalles,
                              SQLQuery_Presup_Detalles,

                              var_Registro_CRUD.name_tabla,
                              param_ver_bajas,

                              var_Registro_CRUD.SELECT_SQL,

                              param_Lineas_Filtro,
                              param_Lineas_OrderBy,
                              '',

                              param_Cambiamos_Filtro );

    UTI_GEN_Borrar_Imagen_Orden_Grid(param_Last_Column);
end;

procedure Tform_presupuestos_compras_000.Convertir_Integro_en_Pedido(
  param_msg: TStrings);
begin

end;

procedure Tform_presupuestos_compras_000.Filtrar_Principal_Sin_Preguntar;
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

procedure Tform_presupuestos_compras_000.SQLQuery_Presup_DetallesBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTRO_param_assign_value_Edit( SQLQuery_Presup_Detalles );
end;

procedure Tform_presupuestos_compras_000.SQLQuery_Presup_DetallesAfterPost(DataSet: TDataSet);
begin
    UTI_RGTRO_Grabar( 'presupuestos_compras_detalles',
                      DataModule_Presupuestos_Compras.SQLTransaction_Presup_Detalles,
                      SQLQuery_Presup_Detalles );

    Refrescar_Registros_Detalles;
end;

procedure Tform_presupuestos_compras_000.SQLQuery_PresupBeforePost(DataSet: TDataSet);
begin
    UTI_RGTRO_param_assign_value( SQLQuery_Presup );
end;

procedure Tform_presupuestos_compras_000.SQLQuery_Presup_DetallesBeforePost(DataSet: TDataSet);
begin
    UTI_RGTRO_param_assign_value( SQLQuery_Presup_Detalles );
end;

procedure Tform_presupuestos_compras_000.Boton_Elegir_Forma_PagoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Form( true, false, '', 80 );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Forma_Pago.Text          := Trim(var_Registro.id_1);
        Edit_Descripcion_Forma_Pago.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_presupuestos_compras_000.Boton_Elegir_id_ProveedoresClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Form( true, false, '', 120 );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Proveedores.Text             := Trim(var_Registro.id_1);
        Edit_Descripcion_id_Proveedores.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_presupuestos_compras_000.Edit_Descripcion_Forma_PagoClick(Sender: TObject);
begin
    Edit_id_Forma_Pago.Text          := '';
    Edit_Descripcion_Forma_Pago.Text := '';
end;

procedure Tform_presupuestos_compras_000.Edit_Descripcion_id_ProveedoresClick(Sender: TObject);
begin
    Edit_id_Proveedores.Text             := '';
    Edit_Descripcion_id_Proveedores.Text := '';
end;

procedure Tform_presupuestos_compras_000.Boton_Elegir_EmpresaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Form( true, false, '', 250 );
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

procedure Tform_presupuestos_compras_000.Boton_Elegir_id_AlmacenesClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Form( true, false, '', 260 );
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

procedure Tform_presupuestos_compras_000.Filtrar_tablas_ligadas;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
begin
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
    UTI_RGTRO_Add_to_Where( true,
                            var_Lineas_Filtro,
                            'pcd.id_presupuestos_compras = ' + SQLQuery_Presup.FieldByName('id').AsString );

    var_Lineas_OrderBy.Clear;
    Filtrar_Lineas_Detalles( private_Last_Column,
                             RadioGroup_Bajas.ItemIndex,
                             false,
                             var_Lineas_Filtro,
                             var_Lineas_OrderBy );

    // ********************************************************************************************* //
    // ** BORRAMOS DE MEMORIA EL RESTO DE COSAS A NO UTILIZAR YA                                  ** //
    // ********************************************************************************************* //
    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;
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

function Tform_presupuestos_compras_000.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
var var_Registro_CRUD : TRegistro_CRUD;
    var_ctdad_Rgtros  : Integer;
    var_a_Filtrar     : TStrings;
begin
    var_a_Filtrar := TStringList.Create;
    var_a_Filtrar.Clear;

    var_ctdad_Rgtros  := -1;
    var_Registro_CRUD := UTI_DATOS_TABLA_presupuestos_compras_CRUD;

    // ********************************************************************************************* //
    // ** AHORA PONDREMOS EL RESTO DE LOS FILTROS QUE NO SON GENERALES                            ** //
    // ********************************************************************************************* //
    // ** Primero buscaremos en el número del presupuesto                                         ** //
    // ********************************************************************************************* //
    if Trim(Edit_Presupuesto_Numero.Text) <> '' then
    begin
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'pc.Numero_Presupuesto_Compras = ' +
                                UTI_GEN_Comillas(Trim(Edit_Presupuesto_Numero.Text)) );
    end;

    // ********************************************************************************************* //
     // ** Ahora buscaremos por la fecha del presupuesto                                          ** //
     // ******************************************************************************************** //
     if (not DateTimePicker_Hasta.DateIsNull) and
        (not DateTimePicker_Desde.DateIsNull) then
     begin
         UTI_RGTRO_Add_to_Where( false,
                                 var_a_Filtrar,
                                 'pc.Fecha_Contabilizacion <= ' +
                                 UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Hasta.Date, false) +
                                                   ' 23:59:59' ) );
         UTI_RGTRO_Add_to_Where( false,
                                 var_a_Filtrar,
                                 'pc.Fecha_Contabilizacion >= ' +
                                 UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Desde.Date, false) +
                                                   ' 00:00:00' ) );
     end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por el almacén                                                         ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Almacenes.Text) <> '' then
    begin
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'pc.id_Almacenes = ' + Trim(Edit_id_Almacenes.Text) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la empresa                                                         ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Empresas.Text) <> '' then
    begin
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'pc.id_empresas = ' + Trim(Edit_id_Empresas.Text) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la forma de pago                                                   ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Forma_Pago.Text) <> '' then
    begin
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'pc.id_formas_pago = ' + Trim(Edit_id_Forma_Pago.Text) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la id del proveedor                                                ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Proveedores.Text) <> '' then
    begin
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'pc.id_proveedores = ' + Trim(Edit_id_Proveedores.Text) );
    end;

    // ********************************************************************************************* //
    // ** Ahora filtraremos por el estado del pedido (pendiente o no de servir algo, o todos      ** //
    // ********************************************************************************************* //
    if RadioButton_Cerrados_NO.Checked = true then
    begin
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'pc.Cerrado_SN = ' + UTI_GEN_Comillas('N') );
    end;

    if RadioButton_Cerrados_SI.Checked = true then
    begin
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'pc.Cerrado_SN = ' + UTI_GEN_Comillas('S') );
    end;

    if RadioButton_Todos.Checked = true then
    begin
        // ***************************************************************************************** //
        // ** En realidad no hay que filtrar por nada                                             ** //
        // ***************************************************************************************** //
    end;

    // ********************************************************************************************* //
    // ** Pasamos a filtrar los registros                                                         ** //
    // ********************************************************************************************* //
    Result := UTI_TB_Filtrar( private_Order_By,

                              var_Registro_CRUD.Delete_SQL,
                              var_Registro_CRUD.Update_SQL,
                              var_Registro_CRUD.Insert_SQL,

                              var_ctdad_Rgtros,
                              DataModule_Presupuestos_Compras.SQLTransaction_Presup,
                              DataModule_Presupuestos_Compras.SQLConnector_Presup,
                              SQLQuery_Presup,

                              var_Registro_CRUD.name_tabla,
                              RadioGroup_Bajas.ItemIndex,

                              var_Registro_CRUD.SELECT_SQL,

                              Memo_Filtros.Lines,
                              Memo_OrderBy.Lines,
                              var_a_Filtrar.Text,

                              param_Cambiamos_Filtro );

    UTI_GEN_Borrar_Imagen_Orden_Grid(private_Last_Column);

    var_a_Filtrar.Free;

    Label_Ctdad_Rgtros.Caption := IntToStr(SQLQuery_Presup.RecordCount);

    //Filtrar_tablas_ligadas;
end;

procedure Tform_presupuestos_compras_000.Cerramos_Tabla_Pedidos_Cabecera;
begin
    if UTI_TB_Cerrar( DataModule_Presupuestos_Compras.SQLConnector_Pedido,
                      DataModule_Presupuestos_Compras.SQLTransaction_Pedido,
                      SQLQuery_Pdo ) = false then UTI_GEN_Salir;
end;

procedure Tform_presupuestos_compras_000.ComboBox_FiltrosChange(Sender: TObject);
begin
    Memo_OrderBy.Lines.Clear;
    Memo_OrderBy.Lines.Add( private_Order_By[ComboBox_Filtros.ItemIndex].Memo_OrderBy );
    BitBtn_FiltrarClick(Nil);
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
                                                                    'Numero_Pedido_Compras' );

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
                                                                                    'Numero_Pedido_Compras' );

                    if var_Estado_Lineas_Detalle.Total_Lineas_Sin_Marcar = 0 then
                    begin
                        // ** si no hay lineas sin marcar no puedo abrirlo si hay
                        if var_Estado_Lineas_Detalle.Total_Lineas_Marcadas > 0 then
                        begin
                            var_msg.Clear;
                            var_msg.Add( '* No se puede liberar pues todas sus líneas de detalle han sido convertidas en pedidos.' );
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
                        // ** PRESUPUESTO fue convertido en PEDIDO/S                              ** //
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

procedure Tform_presupuestos_compras_000.Insertar_Registro;
var var_msg            : TStrings;
    var_id_Proveedores : String;
    var_Numero         : String;
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
                // ** Si ya se eligió una empresa pues la pone fija para la cabecera, aunque se   ** //
                // ** puede cambiar                                                               ** //
                // ********************************************************************************* //
                if Trim(form_menu.public_User_Registro_Empresa_Elegida.id) <> '' then
                begin
                    var_msg.Clear;
                    var_msg.Add('Tiene seleccionada para trabajar la empresa << ' +
                                form_menu.public_User_Registro_Empresa_Elegida.nombre_comercial +
                                ' >>, ¿LA AÑADIMOS A ESTE ALBARÁN ... S/N?' );

                    if UTI_GEN_Aviso(true,  var_msg, '¿QUE HACEMOS?', true, true ) = true then
                    begin
                        FieldByName('id_empresas').AsString            := form_menu.public_User_Registro_Empresa_Elegida.id;
                        FieldByName('OT_descripcion_empresa').AsString := form_menu.public_User_Registro_Empresa_Elegida.nombre_comercial;
                    end;
                end;

                FieldByName('Cerrado_SN').AsString := 'N';

                Application.CreateForm(Tform_presupuestos_compras_001, form_presupuestos_compras_001);

                form_presupuestos_compras_001.RadioGroup_Bajas.ItemIndex := RadioGroup_Bajas.ItemIndex;

                form_presupuestos_compras_001.para_Empezar;

                form_presupuestos_compras_001.ShowModal;
                if form_presupuestos_compras_001.public_Pulso_Aceptar = true then
                begin
                    FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
                    FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                    var_id_Proveedores := FieldByName('id_Proveedores').AsString;
                    var_Numero         := FieldByName('Numero_Presupuesto_Compras').AsString;

                    Presentar_Datos_Totales(0);

                    UTI_RGTRO_Grabar_Antes( 'presupuestos_compras', SQLQuery_Presup );

                    form_presupuestos_compras_001.Free;

                    if (FieldByName('id_Proveedores').AsString = var_id_Proveedores)     and
                       (FieldByName('Numero_Presupuesto_Compras').AsString = var_Numero) then
                    begin
                        Editar_Registro;
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

procedure Tform_presupuestos_compras_000.Editar_Registro;
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
                // ** Cambiamos el almacén a todas las líneas de detalle para evitar conflictos.  ** //
                // ** Puede que no se terminara de grabar bien el almacén en todas las líneas de  ** //
                // ** detalle por algún error con el servidor                                     ** //
                // ********************************************************************************* //
                if Cambiar_Almacen_y_Proveedor_Lineas_Detalle( Trim(FieldByName('id_almacenes').asString),
                                                               Trim(FieldByName('id_proveedores').AsString),
                                                               Trim(FieldByName('id').AsString) ) = false then
                begin
                    // ***************************************************************************** //
                    // ** No se pudo cambiar el almacén, así que no continuamos                   ** //
                    // ***************************************************************************** //
                    UTI_RGTRO_UnLock( 'presupuestos_compras', var_id );
                    Exit;
                end;

                // ********************************************************************************* //
                // ** Continuamos                                                                 ** //
                // ********************************************************************************* //
                Application.CreateForm(Tform_presupuestos_compras_001, form_presupuestos_compras_001);

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
                    if ( Trim(Params.ParamByName('COPY_' + 'Numero_Presupuesto_Compras').AsString)         <> Trim(FieldByName('Numero_Presupuesto_Compras').AsString) )         or
                       ( Trim(Params.ParamByName('COPY_' + 'id_empresas').AsString)                        <> Trim(FieldByName('id_empresas').AsString) )                        or
                       ( Trim(Params.ParamByName('COPY_' + 'id_almacenes').AsString)                       <> Trim(FieldByName('id_almacenes').AsString) )                       or
                       ( Trim(Params.ParamByName('COPY_' + 'id_proveedores').AsString)                     <> Trim(FieldByName('id_proveedores').AsString) )                     or
                       ( Trim(Params.ParamByName('COPY_' + 'agencias_transporte_id_proveedores').AsString) <> Trim(FieldByName('agencias_transporte_id_proveedores').AsString) ) or
                       ( Trim(Params.ParamByName('COPY_' + 'id_poblaciones').AsString)                     <> Trim(FieldByName('id_poblaciones').AsString) )                     or
                       ( Trim(Params.ParamByName('COPY_' + 'id_provincias').AsString)                      <> Trim(FieldByName('id_provincias').AsString) )                      or
                       ( Trim(Params.ParamByName('COPY_' + 'id_paises').AsString)                          <> Trim(FieldByName('id_paises').AsString) )                          or
                       ( Trim(Params.ParamByName('COPY_' + 'id_formas_pago').AsString)                     <> Trim(FieldByName('id_formas_pago').AsString) )                     or
                       ( Trim(Params.ParamByName('COPY_' + 'Cta_Bco_id_poblaciones').AsString)             <> Trim(FieldByName('Cta_Bco_id_poblaciones').AsString) )             or
                       ( Trim(Params.ParamByName('COPY_' + 'Cta_Bco_id_provincias').AsString)              <> Trim(FieldByName('Cta_Bco_id_provincias').AsString) )              or
                       ( Trim(Params.ParamByName('COPY_' + 'Cta_Bco_id_paises').AsString)                  <> Trim(FieldByName('Cta_Bco_id_paises').AsString) )                  or
                       ( Trim(Params.ParamByName('COPY_' + 'Envio_id_provincias').AsString)                <> Trim(FieldByName('Envio_id_provincias').AsString) )                or
                       ( Trim(Params.ParamByName('COPY_' + 'Envio_id_paises').AsString)                    <> Trim(FieldByName('Envio_id_paises').AsString) )                    or
                       ( Trim(Params.ParamByName('COPY_' + 'Envio_id_poblaciones').AsString)               <> Trim(FieldByName('Envio_id_poblaciones').AsString) )               or
                       ( Trim(Params.ParamByName('COPY_' + 'Fecha').AsString)                              <> Trim(FieldByName('Fecha').AsString) )                              or
                       ( Trim(Params.ParamByName('COPY_' + 'Fecha_Contabilizacion').AsString)              <> Trim(FieldByName('Fecha_Contabilizacion').AsString) )              or
                       ( Trim(Params.ParamByName('COPY_' + 'nombre_propietario').AsString)                 <> Trim(FieldByName('nombre_propietario').AsString) )                 or
                       ( Trim(Params.ParamByName('COPY_' + 'nombre_comercial').AsString)                   <> Trim(FieldByName('nombre_comercial').AsString) )                   or
                       ( Trim(Params.ParamByName('COPY_' + 'nif_cif').AsString)                            <> Trim(FieldByName('nif_cif').AsString) )                            or
                       ( Trim(Params.ParamByName('COPY_' + 'Tfno_Fijo_1').AsString)                        <> Trim(FieldByName('Tfno_Fijo_1').AsString) )                        or
                       ( Trim(Params.ParamByName('COPY_' + 'Tfno_Fijo_2').AsString)                        <> Trim(FieldByName('Tfno_Fijo_2').AsString) )                        or
                       ( Trim(Params.ParamByName('COPY_' + 'FAX').AsString)                                <> Trim(FieldByName('FAX').AsString) )                                or
                       ( Trim(Params.ParamByName('COPY_' + 'Movil').AsString)                              <> Trim(FieldByName('Movil').AsString) )                              or
                       ( Trim(Params.ParamByName('COPY_' + 'Direccion').AsString)                          <> Trim(FieldByName('Direccion').AsString) )                          or
                       ( Trim(Params.ParamByName('COPY_' + 'Direccion_Numero').AsString)                   <> Trim(FieldByName('Direccion_Numero').AsString) )                   or
                       ( Trim(Params.ParamByName('COPY_' + 'Direccion_Piso_Letra').AsString)               <> Trim(FieldByName('Direccion_Piso_Letra').AsString) )               or
                       ( Trim(Params.ParamByName('COPY_' + 'Codigo_Postal').AsString)                      <> Trim(FieldByName('Codigo_Postal').AsString) )                      or
                       ( Trim(Params.ParamByName('COPY_' + 'Forma_pago_Dia_1').AsString)                   <> Trim(FieldByName('Forma_pago_Dia_1').AsString) )                   or
                       ( Trim(Params.ParamByName('COPY_' + 'Forma_pago_Dia_2').AsString)                   <> Trim(FieldByName('Forma_pago_Dia_2').AsString) )                   or
                       ( Trim(Params.ParamByName('COPY_' + 'Vencimientos_automaticos_SN').AsString)        <> Trim(FieldByName('Vencimientos_automaticos_SN').AsString) )        or
                       ( Trim(Params.ParamByName('COPY_' + 'Vencimientos_Cantidad').AsString)              <> Trim(FieldByName('Vencimientos_Cantidad').AsString) )              or
                       ( Trim(Params.ParamByName('COPY_' + 'Vencimientos_Dias_Entre').AsString)            <> Trim(FieldByName('Vencimientos_Dias_Entre').AsString) )            or
                       ( Trim(Params.ParamByName('COPY_' + 'Forma_pago_Vacaciones_Dia_Inicio').AsString)   <> Trim(FieldByName('Forma_pago_Vacaciones_Dia_Inicio').AsString) )   or
                       ( Trim(Params.ParamByName('COPY_' + 'Forma_pago_Vacaciones_Mes_Inicio').AsString)   <> Trim(FieldByName('Forma_pago_Vacaciones_Mes_Inicio').AsString) )   or
                       ( Trim(Params.ParamByName('COPY_' + 'Forma_pago_Vacaciones_Dia_Fin').AsString)      <> Trim(FieldByName('Forma_pago_Vacaciones_Dia_Fin').AsString) )      or
                       ( Trim(Params.ParamByName('COPY_' + 'Forma_pago_Vacaciones_Mes_Fin').AsString)      <> Trim(FieldByName('Forma_pago_Vacaciones_Mes_Fin').AsString) )      or
                       ( Trim(Params.ParamByName('COPY_' + 'Cta_Bco_Entidad').AsString)                    <> Trim(FieldByName('Cta_Bco_Entidad').AsString) )                    or
                       ( Trim(Params.ParamByName('COPY_' + 'Cta_Bco_Sucursal').AsString)                   <> Trim(FieldByName('Cta_Bco_Sucursal').AsString) )                   or
                       ( Trim(Params.ParamByName('COPY_' + 'Cta_Bco_Digito_Control').AsString)             <> Trim(FieldByName('Cta_Bco_Digito_Control').AsString) )             or
                       ( Trim(Params.ParamByName('COPY_' + 'Cta_Bco_Cuenta').AsString)                     <> Trim(FieldByName('Cta_Bco_Cuenta').AsString) )                     or
                       ( Trim(Params.ParamByName('COPY_' + 'Cta_Bco_IBAN').AsString)                       <> Trim(FieldByName('Cta_Bco_IBAN').AsString) )                       or
                       ( Trim(Params.ParamByName('COPY_' + 'Cta_Bco_BIC_SWIFT').AsString)                  <> Trim(FieldByName('Cta_Bco_BIC_SWIFT').AsString) )                  or
                       ( Trim(Params.ParamByName('COPY_' + 'Cta_Bco_Mandato_Fecha_de_Firma').AsString)     <> Trim(FieldByName('Cta_Bco_Mandato_Fecha_de_Firma').AsString) )     or
                       ( Trim(Params.ParamByName('COPY_' + 'Cta_Bco_Mandato_Ref').AsString)                <> Trim(FieldByName('Cta_Bco_Mandato_Ref').AsString) )                or
                       ( Trim(Params.ParamByName('COPY_' + 'Cta_Bco_Direccion').AsString)                  <> Trim(FieldByName('Cta_Bco_Direccion').AsString) )                  or
                       ( Trim(Params.ParamByName('COPY_' + 'Cta_Bco_Direccion_Numero').AsString)           <> Trim(FieldByName('Cta_Bco_Direccion_Numero').AsString) )           or
                       ( Trim(Params.ParamByName('COPY_' + 'Cta_Bco_Direccion_Piso_Letra').AsString)       <> Trim(FieldByName('Cta_Bco_Direccion_Piso_Letra').AsString) )       or
                       ( Trim(Params.ParamByName('COPY_' + 'Cta_Bco_Codigo_Postal').AsString)              <> Trim(FieldByName('Cta_Bco_Codigo_Postal').AsString) )              or
                       ( Trim(Params.ParamByName('COPY_' + 'CONCEPTO_SEPA').AsString)                      <> Trim(FieldByName('CONCEPTO_SEPA').AsString) )                      or
                       ( Trim(Params.ParamByName('COPY_' + 'IVA_con_Recargo_SN').AsString)                 <> Trim(FieldByName('IVA_con_Recargo_SN').AsString) )                 or
                       ( Trim(Params.ParamByName('COPY_' + 'IVA_Excluido_SN').AsString)                    <> Trim(FieldByName('IVA_Excluido_SN').AsString) )                    or
                       ( Trim(Params.ParamByName('COPY_' + 'Retencion').AsString)                          <> Trim(FieldByName('Retencion').AsString) )                          or
                       ( Trim(Params.ParamByName('COPY_' + 'Descuento_Comercial_1').AsString)              <> Trim(FieldByName('Descuento_Comercial_1').AsString) )              or
                       ( Trim(Params.ParamByName('COPY_' + 'Descuento_Comercial_2').AsString)              <> Trim(FieldByName('Descuento_Comercial_2').AsString) )              or
                       ( Trim(Params.ParamByName('COPY_' + 'Descuento_Pronto_Pago').AsString)              <> Trim(FieldByName('Descuento_Pronto_Pago').AsString) )              or
                       ( Trim(Params.ParamByName('COPY_' + 'Descuento_Final').AsString)                    <> Trim(FieldByName('Descuento_Final').AsString) )                    or
                       ( Trim(Params.ParamByName('COPY_' + 'Observaciones').AsString)                      <> Trim(FieldByName('Observaciones').AsString) )                      or
                       ( Trim(Params.ParamByName('COPY_' + 'Envio_Con_Quien_Hablar').AsString)             <> Trim(FieldByName('Envio_Con_Quien_Hablar').AsString) )             or
                       ( Trim(Params.ParamByName('COPY_' + 'Envio_Tfno_Fijo_1').AsString)                  <> Trim(FieldByName('Envio_Tfno_Fijo_1').AsString) )                  or
                       ( Trim(Params.ParamByName('COPY_' + 'Envio_Tfno_Fijo_2').AsString)                  <> Trim(FieldByName('Envio_Tfno_Fijo_2').AsString) )                  or
                       ( Trim(Params.ParamByName('COPY_' + 'Envio_FAX').AsString)                          <> Trim(FieldByName('Envio_FAX').AsString) )                          or
                       ( Trim(Params.ParamByName('COPY_' + 'Envio_Movil').AsString)                        <> Trim(FieldByName('Envio_Movil').AsString) )                        or
                       ( Trim(Params.ParamByName('COPY_' + 'Envio_eMail').AsString)                        <> Trim(FieldByName('Envio_eMail').AsString) )                        or
                       ( Trim(Params.ParamByName('COPY_' + 'Envio_Direccion').AsString)                    <> Trim(FieldByName('Envio_Direccion').AsString) )                    or
                       ( Trim(Params.ParamByName('COPY_' + 'Envio_Direccion_Numero').AsString)             <> Trim(FieldByName('Envio_Direccion_Numero').AsString) )             or
                       ( Trim(Params.ParamByName('COPY_' + 'Envio_Direccion_Piso_Letra').AsString)         <> Trim(FieldByName('Envio_Direccion_Piso_Letra').AsString) )         or
                       ( Trim(Params.ParamByName('COPY_' + 'Envio_Codigo_Postal').AsString)                <> Trim(FieldByName('Envio_Codigo_Postal').AsString) )                or
                       ( Trim(Params.ParamByName('COPY_' + 'Envio_Condiciones_Entrega').AsString)          <> Trim(FieldByName('Envio_Condiciones_Entrega').AsString) )          or
                       ( Trim(Params.ParamByName('COPY_' + 'Envio_Portes').AsString)                       <> Trim(FieldByName('Envio_Portes').AsString) )                       or
                       ( Trim(Params.ParamByName('COPY_' + 'Envio_Bultos').AsString)                       <> Trim(FieldByName('Envio_Bultos').AsString) )                       or
                       ( Trim(Params.ParamByName('COPY_' + 'Envio_Fecha_Recogida_Prevista').AsString)      <> Trim(FieldByName('Envio_Fecha_Recogida_Prevista').AsString) )      or
                       ( Trim(Params.ParamByName('COPY_' + 'Envio_Portes_Pagados_SN').AsString)            <> Trim(FieldByName('Envio_Portes_Pagados_SN').AsString) )            or
                       ( Trim(Params.ParamByName('COPY_' + 'Total_Mano_Obra').AsString)                    <> Trim(FieldByName('Total_Mano_Obra').AsString) )                    or
                       ( Trim(Params.ParamByName('COPY_' + 'Total_Materiales').AsString)                   <> Trim(FieldByName('Total_Materiales').AsString) )                   or
                       ( Trim(Params.ParamByName('COPY_' + 'Total_Resto').AsString)                        <> Trim(FieldByName('Total_Resto').AsString) )                        or
                       ( Trim(Params.ParamByName('COPY_' + 'Total_Lineas').AsString)                       <> Trim(FieldByName('Total_Lineas').AsString) )                       or
                       ( Trim(Params.ParamByName('COPY_' + 'Total_Dtos').AsString)                         <> Trim(FieldByName('Total_Dtos').AsString) )                         or
                       ( Trim(Params.ParamByName('COPY_' + 'Total_Base_Imponible').AsString)               <> Trim(FieldByName('Total_Base_Imponible').AsString) )               or
                       ( Trim(Params.ParamByName('COPY_' + 'Total_Impuestos').AsString)                    <> Trim(FieldByName('Total_Impuestos').AsString) )                    or
                       ( Trim(Params.ParamByName('COPY_' + 'Total_Total').AsString)                        <> Trim(FieldByName('Total_Total').AsString) )                        or
                       ( Trim(Params.ParamByName('COPY_' + 'Cerrado_SN').AsString)                         <> Trim(FieldByName('Cerrado_SN').AsString) )                         then
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
                                                                        'Numero_Pedido_Compras' );

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
        end else begin
            if Cambiar_Almacen_y_Proveedor_Lineas_Detalle( Trim(FieldByName('id_almacenes').asString),
                                                           Trim(FieldByName('id_proveedores').AsString),
                                                           Trim(FieldByName('id').AsString) ) = false then

            begin
                // ********************************************************************************* //
                // ** No se pudo cambiar el almacén, así que no continuamos                       ** //
                // ********************************************************************************* //
                Exit;
            end;
        end;

        // ***************************************************************************************** //
        // ** Continuamos con el borrado                                                          ** //
        // ***************************************************************************************** //
        if UTI_USR_Permiso_SN(public_Menu_Worked, 'B', True) = True then
        begin
            UTI_RGTRO_Borrar( 'presupuestos_compras',
                              SQLQuery_Presup,
                              public_Solo_Ver,
                              public_Menu_Worked );
        end;
    end;
end;

function Tform_presupuestos_compras_000.Cambiar_Almacen_y_Proveedor_Lineas_Detalle( param_id_almacenes,
                                                                                    param_id_proveedores,
                                                                                    param_id : String ) : Boolean;
var var_msg : TStrings;
begin
    Result := UTI_COMPRAS_Update_Almacen_y_Cliente_Lineas_Detalle_Presupuesto( param_id_almacenes,
                                                                               param_id_proveedores,
                                                                               param_id );
    if Result = false then
    begin
        var_msg := TStringList.Create;
        var_msg.Add( 'No se pudo, actualizar el almacén a todas sus líneas de detalle.');
        UTI_GEN_Aviso(true, var_msg, rs_No_Se_Pudo, True, False);
        var_msg.Free;
    end;
end;

procedure Tform_presupuestos_compras_000.SQLQuery_Presup_DetallesCalcFields(DataSet: TDataSet);
var var_Valores_Linea : TCalculo_Linea_Detalle;
    var_Calculo       : Extended;
begin
    with SQLQuery_Presup_Detalles do
    begin
        // ***************************************************************************************** //
        // ** Descripción de la línea de detalle                                                  ** //
        // ***************************************************************************************** //
        if Trim(FieldByName('OT_descripcion_articulo').AsString) <> '' then
        begin
            FieldByName('OT_Concepto_Articulo').AsString := FieldByName('OT_descripcion_articulo').AsString;
        end else begin
            if Trim(FieldByName('descripcion_para_TPV').AsString) <> '' then
            begin
                FieldByName('OT_Concepto_Articulo').AsString := FieldByName('descripcion_para_TPV').AsString;
            end;

            if Trim(FieldByName('descripcion').AsString) <> '' then
            begin
                FieldByName('OT_Concepto_Articulo').AsString := FieldByName('descripcion').AsString;
            end;
        end;

        // ***************************************************************************************** //
        // ** No se va a cobrar                                                                   ** //
        // ***************************************************************************************** //
        FieldByName('OT_Excluirlo').AsString := '';
        if UpperCase(Trim(FieldByName('Excluido_su_Cobro_SN').AsString)) = 'S' then
        begin
             FieldByName('OT_Excluirlo').AsString := 'S';
        end;

        // ***************************************************************************************** //
        // ** Calcular su cobro                                                                   ** //
        // ***************************************************************************************** //
        var_Valores_Linea := UTI_COMPRAS_Calculo_de_Linea_Detalle(SQLQuery_Presup_Detalles);

        FieldByName('OT_Total_Linea').Value := 0;
        FieldByName('OT_Total_Dto').Value   := 0;

        FieldByName('OT_Total_B_Imp').Value := 0;

        FieldByName('OT_Total_Impto').Value := 0;

        FieldByName('OT_para_Cobrar').Value := 0;

        if FieldByName('Excluido_su_Cobro_SN').Value <> 'S' then
        begin
            var_Calculo := ( (var_Valores_Linea.Unidades_por_Precio - var_Valores_Linea.Dto_1)
                             - var_Valores_Linea.Dto_2
                           ) + var_Valores_Linea.Impuestos;

            FieldByName('OT_Total_Linea').Value := var_Valores_Linea.Unidades_por_Precio;
            FieldByName('OT_Total_Dto').Value   := var_Valores_Linea.Dto_1 + var_Valores_Linea.Dto_2;

            FieldByName('OT_Total_B_Imp').Value := ( (var_Valores_Linea.Unidades_por_Precio - var_Valores_Linea.Dto_1)
                                                      - var_Valores_Linea.Dto_2 );

            FieldByName('OT_Total_Impto').Value := var_Valores_Linea.Impuestos;
            FieldByName('OT_para_Cobrar').Value := var_Calculo;

            // ***************************************************************************************** //
            // ** Solo si se puso un precio fijo se cambia este importe por el calculado              ** //
            // ***************************************************************************************** //
            if not FieldByName('PVP_Manual_Final').IsNull then
            begin
                FieldByName('OT_para_Cobrar').Value := FieldByName('PVP_Manual_Final').Value;

                // ************************************************************************************* //
                // ** Ahora se calcula dando marcha atras desde el impuesto                           ** //
                // ************************************************************************************* //
                FieldByName('OT_Total_Impto').Value := UTI_IMPTOS_Calcular_Impuesto( FieldByName('PVP_Manual_Final').Value,
                                                                                     FieldByName('id_impuestos_Ventas').AsString,
                                                                                     'E');

                FieldByName('OT_Total_B_Imp').Value := FieldByName('PVP_Manual_Final').Value -
                                                       FieldByName('OT_Total_Impto').Value;

                FieldByName('OT_Total_Dto').Value   := 0;

                FieldByName('OT_Total_Linea').Value := FieldByName('OT_Total_B_Imp').Value;
            end;
        end;
    end;
end;

procedure Tform_presupuestos_compras_000.Presentar_Datos_Totales( param_Actualizar_Totales : Byte );
var var_Calculo_Totales_Cabecera : TCalculo_Totales_Cabecera;
begin
    var_Calculo_Totales_Cabecera := UTI_COMPRAS_Actualizar_Totales_Cabecera_0( param_Actualizar_Totales,
                                                                               SQLQuery_Presup,
                                                                               SQLQuery_Presup_Detalles,
                                                                               'presupuestos_compras',
                                                                               SQLQuery_Presup.FieldByName('Serie_Presupuesto').AsString, // param_Serie,
                                                                               SQLQuery_Presup.FieldByName('Numero_Presupuesto_Compras').AsString ); // param_Numero : String ) : TCalculo_Totales_Cabecera;
    if param_Actualizar_Totales = 1 then
    begin
        with form_presupuestos_compras_001 do
        begin
            Edit_Total_Lineas.Text         := FormatFloat( '########0.00', var_Calculo_Totales_Cabecera.Total_Lineas );
            Edit_Total_Dtos.Text           := FormatFloat( '########0.00', var_Calculo_Totales_Cabecera.Total_Dtos );
            Edit_Total_Base_Imponible.Text := FormatFloat( '########0.00', var_Calculo_Totales_Cabecera.Total_Base_Imponible );
            Edit_Total_Impuestos.Text      := FormatFloat( '########0.00', var_Calculo_Totales_Cabecera.Total_Impuestos );
            Edit_Total.Text                := FormatFloat( '########0.00', var_Calculo_Totales_Cabecera.Total );
            Edit_Total_Mano_Obra.Text      := FormatFloat( '########0.00', var_Calculo_Totales_Cabecera.Total_Mano_Obra );
            Edit_Total_Materiales.Text     := FormatFloat( '########0.00', var_Calculo_Totales_Cabecera.Total_Materiales );
            Edit_Total_Resto.Text          := FormatFloat( '########0.00', var_Calculo_Totales_Cabecera.Total_Resto );

            Edit_Total_Peso.Text           := '0';
            Edit_Total_Volumen.Text        := '0';
        end;
    end;
end;




****************************************************************************************************
****************************************************************************************************
****************************************************************************************************


end.



****************************************************************************************************
****************************************************************************************************
****************************************************************************************************


procedure Tform_presupuestos_compras_000.Crear_Pedido_su_Detalle( param_Fecha : TDateTime;
                                                                  param_Serie,
                                                                  param_Numero : ShortString;
                                                                  param_Todas_Las_Lineas : Boolean );
var var_msg     : TStrings;
    var_id      : ShortString;
    var_Segundo : TDateTime;
begin
    with SQLQuery_Pdo do
    begin
        Filtrar_Pedidos_Cabecera( DateToStr(Int(param_Fecha)),

                                  por la id .... no por la serie y el numero
                                  esto es porque solo me tiene que dar un registro en el recordcount

                                  param_Serie,
                                  param_Numero );

        // ***************************************************************************************** //
        // ** Bloqueamos la cabecera del pedido y editamos la cabecera para actualizar sus totales** //
        // ** y ponerle el número/serie al que pertenecen en presupuestos                         ** //
        // ***************************************************************************************** //
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

        // ***************************************************************************************** //
        // ** Filtramos las líneas de detalle                                                     ** //
        // ***************************************************************************************** //
        Filtrar_Pedidos_Detalles( FieldByName('id').AsString );

        // ***************************************************************************************** //
        // ** Añadimos la/s líneas de detalle                                                     ** //
        // ***************************************************************************************** //
        Crear_Pedido_su_Detalle_2( param_Fecha,
                                   var_id,
                                   param_Todas_Las_Lineas );

        UTI_COMPRAS_Actualizar_Totales_Cabecera_0( 0,
                                                   SQLQuery_Pdo,
                                                   SQLQuery_Pdo_Detalles,
                                                   'pedidos_compras',
                                                   SQLQuery_Pdo.FieldByName('Serie_Pedido').AsString, // param_Serie,
                                                   SQLQuery_Pdo.FieldByName('Numero_Pedido').AsString ); // param_Numero : String ) : TCalculo_Totales_Cabecera;

        var_Segundo := StrToDateTime(DateToStr(Date) + ' 00:01:01');
        var_Segundo := var_Segundo - StrToDateTime(DateToStr(Date) + ' 00:01:00');

        // ***************************************************************************************** //
        // ** Le aumento un segundo porque sino la actualización de los totales me daría error    ** //
        // ** porque de vez en cuando no pasa ni un segundo todavía desde que se creó la cabecera ** //
        // ** hasta ahora que se actualizan los totales después de crear las líneas de detalle    ** //
        // ***************************************************************************************** //
        FieldByName('Change_WHEN').Value    := param_Fecha + var_Segundo;
        FieldByName('Change_Id_User').Value := Form_Menu.public_User;

        // ***************************************************************************************** //
        // ** GRABAMOS LA CABECERA DEL PEDIDO                                                     ** //
        // ***************************************************************************************** //
        UTI_RGTRO_Grabar_Antes( 'pedidos_compras', SQLQuery_Pdo );

        // ***************************************************************************************** //
        // ** Liberamos cabecera de pedido                                                        ** //
        // ***************************************************************************************** //
        UTI_RGTRO_UnLock( 'pedidos_compras', var_id );

        // ***************************************************************************************** //
        // ** CERRAMOS LAS TABLAS DE CABECERAS Y DETALLES                                         ** //
        // ***************************************************************************************** //
        Cerramos_Tabla_Pedidos_Detalles;
        Cerramos_Tabla_Pedidos_Cabecera;
    end;
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

        if not SQLQuery_Presup_Detalles.FieldByName('id_clientes').IsNull then
        begin
            FieldByName('id_clientes').AsString := SQLQuery_Presup_Detalles.FieldByName('id_clientes').AsString;
        end;

        if not SQLQuery_Presup_Detalles.FieldByName('Unidades').IsNull then
        begin
            FieldByName('Unidades').AsString := SQLQuery_Presup_Detalles.FieldByName('Unidades').AsString;
        end;

        if not SQLQuery_Presup_Detalles.FieldByName('id_almacenes').IsNull then
        begin
            FieldByName('id_almacenes').AsString := SQLQuery_Presup_Detalles.FieldByName('id_almacenes').AsString;
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

        if not SQLQuery_Presup_Detalles.FieldByName('PVP_Impuestos_Incluidos').IsNull then
        begin
            FieldByName('PVP_Impuestos_Incluidos').AsString := SQLQuery_Presup_Detalles.FieldByName('PVP_Impuestos_Incluidos').AsString;
        end;

        if not SQLQuery_Presup_Detalles.FieldByName('id_impuestos_Ventas').IsNull then
        begin
            FieldByName('id_impuestos_Ventas').AsString := SQLQuery_Presup_Detalles.FieldByName('id_impuestos_Ventas').AsString;
        end;

        if not SQLQuery_Presup_Detalles.FieldByName('Descuento_Comercial_1').IsNull then
        begin
            FieldByName('Descuento_Comercial_1').AsString := SQLQuery_Presup_Detalles.FieldByName('Descuento_Comercial_1').AsString;
        end;

        if not SQLQuery_Presup_Detalles.FieldByName('Descuento_Comercial_2').IsNull then
        begin
            FieldByName('Descuento_Comercial_2').AsString := SQLQuery_Presup_Detalles.FieldByName('Descuento_Comercial_2').AsString;
        end;

        if not SQLQuery_Presup_Detalles.FieldByName('PVP_Manual_Final').IsNull then
        begin
            FieldByName('PVP_Manual_Final').AsString := SQLQuery_Presup_Detalles.FieldByName('PVP_Manual_Final').AsString;
        end;

        if not SQLQuery_Presup_Detalles.FieldByName('Excluido_su_Cobro_SN').IsNull then
        begin
            FieldByName('Excluido_su_Cobro_SN').AsString := SQLQuery_Presup_Detalles.FieldByName('Excluido_su_Cobro_SN').AsString;
        end;

        if not SQLQuery_Presup_Detalles.FieldByName('Comision_Representante').IsNull then
        begin
            FieldByName('Comision_Representante').AsString := SQLQuery_Presup_Detalles.FieldByName('Comision_Representante').AsString;
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

procedure Tform_presupuestos_compras_000.Convertir_Integro_en_Pedido( param_msg : TStrings );
var // var_Registro_Empresa : TEmpresas;
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
       (UTI_USR_Permiso_SN(450, 'A', True) = True)                then // ** Comprueba si tiene   ** //
                                                                       // ** permiso de insertar  ** //
                                                                       // ** en pedidos           ** //
                                                                       // ************************** //
    begin
        var_Fecha := UTI_CN_Fecha_Hora;
        if Crear_Pedido_su_Cabecera( var_Fecha ) = true then
        begin
            ****************************************************************************************
            ver si ha localizado bien la cabecera recien creada, para ello ver si puedo modificar esto
            para que lo busque por id_proveedores, fecha_contabilizacion o algo así

            Filtrar_Pedidos_Cabecera( DateToStr(Int(param_Fecha)),
                                      param_Serie,
                                      param_Numero );
            ****************************************************************************************

            Crear_Pedido_su_Detalle( var_Fecha,

                                     ya no les paso el numero de pedido si no la id como numero de
                                     entrada

                                     var_Registro_Empresa.Serie_Pedido,
                                     var_Registro_Empresa.Numero_Pedido,
                                             // **************************************************** //
                                     true ); // ** Así se creará un pedido de todas las líneas    ** //
                                             // ** pendientes de ser convertidas en pedido        ** //
                                             // **************************************************** //
        end;

        Cerrarlo;

        // ***************************************************************************************** //
        // ** Mensaje diciendo que se ha creado el pedido numero/serie                            ** //
        // ***************************************************************************************** //
        param_msg.Clear;
        param_msg.Add( 'Las líneas de este presupuesto que no estaban convertidas en pedidos, ahora' +
                       ' están ligadas con el pedido con número de entrada ' +
                       Trim(SQLQuery_Pdo.FieldByName('id').AsString) +
                       '.' );

        UTI_GEN_Aviso(false, param_msg, 'PERFECTO.-', True, False);
        param_msg.Clear;
    end;
end;

procedure Tform_presupuestos_compras_000.Crear_Pedido_su_Cabecera( param_Fecha : TDateTime );
var var_msg : TStrings;
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

        // ***************************************************************************************** //
        // ** ASIGNAMOS EL RESTO DE CAMPOS                                                        ** //
        // ***************************************************************************************** //
        FieldByName('Fecha_Contabilizacion').Value := Int(param_Fecha);
        FieldByName('Cerrado_SN').AsString         := 'N';

        FieldByName('Insert_WHEN').Value           := param_Fecha;
        FieldByName('Insert_Id_User').Value        := Form_Menu.public_User;

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
    end;
end;

procedure Tform_presupuestos_compras_000.Crear_Pedido_su_Cabecera_2;
begin
    with SQLQuery_Pdo do
    begin
        if not SQLQuery_Presup.FieldByName('id_almacenes').IsNull then
        begin
            FieldByName('id_almacenes').AsString := SQLQuery_Presup.FieldByName('id_almacenes').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('id_proveedores').IsNull then
        begin
            FieldByName('id_proveedores').AsString := SQLQuery_Presup.FieldByName('id_proveedores').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('id_poblaciones').IsNull then
        begin
            FieldByName('id_poblaciones').AsString := SQLQuery_Presup.FieldByName('id_poblaciones').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('agencias_transporte_id_proveedores').IsNull then
        begin
            FieldByName('agencias_transporte_id_proveedores').AsString := SQLQuery_Presup.FieldByName('agencias_transporte_id_proveedores').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('id_provincias').IsNull then
        begin
            FieldByName('id_provincias').AsString := SQLQuery_Presup.FieldByName('id_provincias').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('id_paises').IsNull then
        begin
            FieldByName('id_paises').AsString := SQLQuery_Presup.FieldByName('id_paises').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('id_formas_pago').IsNull then
        begin
            FieldByName('id_formas_pago').AsString := SQLQuery_Presup.FieldByName('id_formas_pago').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Cta_Bco_id_poblaciones').IsNull then
        begin
            FieldByName('Cta_Bco_id_poblaciones').AsString := SQLQuery_Presup.FieldByName('Cta_Bco_id_poblaciones').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Cta_Bco_id_provincias').IsNull then
        begin
            FieldByName('Cta_Bco_id_provincias').AsString := SQLQuery_Presup.FieldByName('Cta_Bco_id_provincias').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Cta_Bco_id_paises').IsNull then
        begin
            FieldByName('Cta_Bco_id_paises').AsString := SQLQuery_Presup.FieldByName('Cta_Bco_id_paises').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Fecha').IsNull then
        begin
            FieldByName('Fecha').AsString := SQLQuery_Presup.FieldByName('Fecha').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('nombre_propietario').IsNull then
        begin
            FieldByName('nombre_propietario').AsString := SQLQuery_Presup.FieldByName('nombre_propietario').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('nombre_comercial').IsNull then
        begin
            FieldByName('nombre_comercial').AsString := SQLQuery_Presup.FieldByName('nombre_comercial').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('nif_cif').IsNull then
        begin
            FieldByName('nif_cif').AsString := SQLQuery_Presup.FieldByName('nif_cif').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Tfno_Fijo_1').IsNull then
        begin
            FieldByName('Tfno_Fijo_1').AsString := SQLQuery_Presup.FieldByName('Tfno_Fijo_1').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Tfno_Fijo_2').IsNull then
        begin
            FieldByName('Tfno_Fijo_2').AsString := SQLQuery_Presup.FieldByName('Tfno_Fijo_2').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('FAX').IsNull then
        begin
            FieldByName('FAX').AsString := SQLQuery_Presup.FieldByName('FAX').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Movil').IsNull then
        begin
            FieldByName('Movil').AsString := SQLQuery_Presup.FieldByName('Movil').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Direccion').IsNull then
        begin
            FieldByName('Direccion').AsString := SQLQuery_Presup.FieldByName('Direccion').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Direccion_Numero').IsNull then
        begin
            FieldByName('Direccion_Numero').AsString := SQLQuery_Presup.FieldByName('Direccion_Numero').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Direccion_Piso_Letra').IsNull then
        begin
            FieldByName('Direccion_Piso_Letra').AsString := SQLQuery_Presup.FieldByName('Direccion_Piso_Letra').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Codigo_Postal').IsNull then
        begin
            FieldByName('Codigo_Postal').AsString := SQLQuery_Presup.FieldByName('Codigo_Postal').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Forma_pago_Dia_1').IsNull then
        begin
            FieldByName('Forma_pago_Dia_1').AsString := SQLQuery_Presup.FieldByName('Forma_pago_Dia_1').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Forma_pago_Dia_2').IsNull then
        begin
            FieldByName('Forma_pago_Dia_2').AsString := SQLQuery_Presup.FieldByName('Forma_pago_Dia_2').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Vencimientos_automaticos_SN').IsNull then
        begin
            FieldByName('Vencimientos_automaticos_SN').AsString := SQLQuery_Presup.FieldByName('Vencimientos_automaticos_SN').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Vencimientos_Cantidad').IsNull then
        begin
            FieldByName('Vencimientos_Cantidad').AsString := SQLQuery_Presup.FieldByName('Vencimientos_Cantidad').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Vencimientos_Dias_Entre').IsNull then
        begin
            FieldByName('Vencimientos_Dias_Entre').AsString := SQLQuery_Presup.FieldByName('Vencimientos_Dias_Entre').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Forma_pago_Vacaciones_Dia_Inicio').IsNull then
        begin
            FieldByName('Forma_pago_Vacaciones_Dia_Inicio').AsString := SQLQuery_Presup.FieldByName('Forma_pago_Vacaciones_Dia_Inicio').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Forma_pago_Vacaciones_Mes_Inicio').IsNull then
        begin
            FieldByName('Forma_pago_Vacaciones_Mes_Inicio').AsString := SQLQuery_Presup.FieldByName('Forma_pago_Vacaciones_Mes_Inicio').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Forma_pago_Vacaciones_Dia_Fin').IsNull then
        begin
            FieldByName('Forma_pago_Vacaciones_Dia_Fin').AsString := SQLQuery_Presup.FieldByName('Forma_pago_Vacaciones_Dia_Fin').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Forma_pago_Vacaciones_Mes_Fin').IsNull then
        begin
            FieldByName('Forma_pago_Vacaciones_Mes_Fin').AsString := SQLQuery_Presup.FieldByName('Forma_pago_Vacaciones_Mes_Fin').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Cta_Bco_Entidad').IsNull then
        begin
            FieldByName('Cta_Bco_Entidad').AsString := SQLQuery_Presup.FieldByName('Cta_Bco_Entidad').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Cta_Bco_Sucursal').IsNull then
        begin
            FieldByName('Cta_Bco_Sucursal').AsString := SQLQuery_Presup.FieldByName('Cta_Bco_Sucursal').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Cta_Bco_Digito_Control').IsNull then
        begin
            FieldByName('Cta_Bco_Digito_Control').AsString := SQLQuery_Presup.FieldByName('Cta_Bco_Digito_Control').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Cta_Bco_Cuenta').IsNull then
        begin
            FieldByName('Cta_Bco_Cuenta').AsString := SQLQuery_Presup.FieldByName('Cta_Bco_Cuenta').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Cta_Bco_IBAN').IsNull then
        begin
            FieldByName('Cta_Bco_IBAN').AsString := SQLQuery_Presup.FieldByName('Cta_Bco_IBAN').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Cta_Bco_BIC_SWIFT').IsNull then
        begin
            FieldByName('Cta_Bco_BIC_SWIFT').AsString := SQLQuery_Presup.FieldByName('Cta_Bco_BIC_SWIFT').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Cta_Bco_Mandato_Fecha_de_Firma').IsNull then
        begin
            FieldByName('Cta_Bco_Mandato_Fecha_de_Firma').AsString := SQLQuery_Presup.FieldByName('Cta_Bco_Mandato_Fecha_de_Firma').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Cta_Bco_Mandato_Ref').IsNull then
        begin
            FieldByName('Cta_Bco_Mandato_Ref').AsString := SQLQuery_Presup.FieldByName('Cta_Bco_Mandato_Ref').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Cta_Bco_Direccion').IsNull then
        begin
            FieldByName('Cta_Bco_Direccion').AsString := SQLQuery_Presup.FieldByName('Cta_Bco_Direccion').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Cta_Bco_Direccion_Numero').IsNull then
        begin
            FieldByName('Cta_Bco_Direccion_Numero').AsString := SQLQuery_Presup.FieldByName('Cta_Bco_Direccion_Numero').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Cta_Bco_Direccion_Piso_Letra').IsNull then
        begin
            FieldByName('Cta_Bco_Direccion_Piso_Letra').AsString := SQLQuery_Presup.FieldByName('Cta_Bco_Direccion_Piso_Letra').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Cta_Bco_Codigo_Postal').IsNull then
        begin
            FieldByName('Cta_Bco_Codigo_Postal').AsString := SQLQuery_Presup.FieldByName('Cta_Bco_Codigo_Postal').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('CONCEPTO_SEPA').IsNull then
        begin
            FieldByName('CONCEPTO_SEPA').AsString := SQLQuery_Presup.FieldByName('CONCEPTO_SEPA').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('IVA_con_Recargo_SN').IsNull then
        begin
            FieldByName('IVA_con_Recargo_SN').AsString := SQLQuery_Presup.FieldByName('IVA_con_Recargo_SN').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('IVA_Excluido_SN').IsNull then
        begin
            FieldByName('IVA_Excluido_SN').AsString := SQLQuery_Presup.FieldByName('IVA_Excluido_SN').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Retencion').IsNull then
        begin
            FieldByName('Retencion').AsString := SQLQuery_Presup.FieldByName('Retencion').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Descuento_Comercial_1').IsNull then
        begin
            FieldByName('Descuento_Comercial_1').AsString := SQLQuery_Presup.FieldByName('Descuento_Comercial_1').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Descuento_Comercial_2').IsNull then
        begin
            FieldByName('Descuento_Comercial_2').AsString := SQLQuery_Presup.FieldByName('Descuento_Comercial_2').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Descuento_Pronto_Pago').IsNull then
        begin
            FieldByName('Descuento_Pronto_Pago').AsString := SQLQuery_Presup.FieldByName('Descuento_Pronto_Pago').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Descuento_Final').IsNull then
        begin
            FieldByName('Descuento_Final').AsString := SQLQuery_Presup.FieldByName('Descuento_Final').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Observaciones').IsNull then
        begin
            FieldByName('Observaciones').AsString := SQLQuery_Presup.FieldByName('Observaciones').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Envio_Con_Quien_Hablar').IsNull then
        begin
            FieldByName('Envio_Con_Quien_Hablar').AsString := SQLQuery_Presup.FieldByName('Envio_Con_Quien_Hablar').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Envio_Tfno_Fijo_1').IsNull then
        begin
            FieldByName('Envio_Tfno_Fijo_1').AsString := SQLQuery_Presup.FieldByName('Envio_Tfno_Fijo_1').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Envio_Tfno_Fijo_2').IsNull then
        begin
            FieldByName('Envio_Tfno_Fijo_2').AsString := SQLQuery_Presup.FieldByName('Envio_Tfno_Fijo_2').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Envio_FAX').IsNull then
        begin
            FieldByName('Envio_FAX').AsString := SQLQuery_Presup.FieldByName('Envio_FAX').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Envio_Movil').IsNull then
        begin
            FieldByName('Envio_Movil').AsString := SQLQuery_Presup.FieldByName('Envio_Movil').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Envio_eMail').IsNull then
        begin
            FieldByName('Envio_eMail').AsString := SQLQuery_Presup.FieldByName('Envio_eMail').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Envio_Direccion').IsNull then
        begin
            FieldByName('Envio_Direccion').AsString := SQLQuery_Presup.FieldByName('Envio_Direccion').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Envio_Direccion_Numero').IsNull then
        begin
            FieldByName('Envio_Direccion_Numero').AsString := SQLQuery_Presup.FieldByName('Envio_Direccion_Numero').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Envio_Direccion_Piso_Letra').IsNull then
        begin
            FieldByName('Envio_Direccion_Piso_Letra').AsString := SQLQuery_Presup.FieldByName('Envio_Direccion_Piso_Letra').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Envio_Codigo_Postal').IsNull then
        begin
            FieldByName('Envio_Codigo_Postal').AsString := SQLQuery_Presup.FieldByName('Envio_Codigo_Postal').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Envio_Condiciones_Entrega').IsNull then
        begin
            FieldByName('Envio_Condiciones_Entrega').AsString := SQLQuery_Presup.FieldByName('Envio_Condiciones_Entrega').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Envio_Portes').IsNull then
        begin
            FieldByName('Envio_Portes').AsString := SQLQuery_Presup.FieldByName('Envio_Portes').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Envio_Bultos').IsNull then
        begin
            FieldByName('Envio_Bultos').AsString := SQLQuery_Presup.FieldByName('Envio_Bultos').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Envio_Fecha_Recogida_Prevista').IsNull then
        begin
            FieldByName('Envio_Fecha_Recogida_Prevista').AsString := SQLQuery_Presup.FieldByName('Envio_Fecha_Recogida_Prevista').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Envio_Portes_Pagados_SN').IsNull then
        begin
            FieldByName('Envio_Portes_Pagados_SN').AsString := SQLQuery_Presup.FieldByName('Envio_Portes_Pagados_SN').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Envio_id_provincias').IsNull then
        begin
            FieldByName('Envio_id_provincias').AsString := SQLQuery_Presup.FieldByName('Envio_id_provincias').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Envio_id_paises').IsNull then
        begin
            FieldByName('Envio_id_paises').AsString := SQLQuery_Presup.FieldByName('Envio_id_paises').AsString;
        end;

        if not SQLQuery_Presup.FieldByName('Envio_id_poblaciones').IsNull then
        begin
            FieldByName('Envio_id_poblaciones').AsString := SQLQuery_Presup.FieldByName('Envio_id_poblaciones').AsString;
        end;
    end;
end;

procedure Tform_presupuestos_compras_000.Filtrar_Pedidos_Cabecera( param_Fecha,
                                                                   param_Serie,
                                                                   param_Numero : ShortString );
var var_Registro_CRUD : TRegistro_CRUD;
    var_ctdad_Rgtros  : Integer;
    var_a_Filtrar     : TStrings;
    var_Filtros       : TStrings;
    var_Order_By      : TStrings;
begin
    var_a_Filtrar := TStringList.Create;
    var_Filtros   := TStringList.Create;
    var_Order_By  := TStringList.Create;

    var_a_Filtrar.Clear;
    var_Filtros.Clear;
    var_Order_By.Clear;

    var_ctdad_Rgtros  := -1;
    var_Registro_CRUD := UTI_DATOS_TABLA_pedidos_ventas_CRUD;

    // ********************************************************************************************* //
    // ** AHORA PONDREMOS EL RESTO DE LOS FILTROS QUE NO SON GENERALES                            ** //
    // ********************************************************************************************* //
    // ********************************************************************************************* //
    // ** Ahora buscaremos por la FECHA                                                           ** //
    // ********************************************************************************************* //
    if Trim(param_Fecha) <> '' then
    begin
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'pdo.Fecha <= ' +
                                UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(Int(StrToDateTime(param_Fecha)), false) +
                                                  ' 23:59:59' ) );
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'pdo.Fecha >= ' +
                                UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(Int(StrToDateTime(param_Fecha)), false) +
                                                  ' 00:00:00' ) );
    end;

    // ********************************************************************************************* //
    // ** AHORA PONDREMOS EL RESTO DE LOS FILTROS QUE NO SON GENERALES                            ** //
    // ********************************************************************************************* //
    // ** Primero buscaremos en la serie                                                          ** //
    // ********************************************************************************************* //
    if Trim(param_Serie) <> '' then
    begin
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'pdo.Serie_Pedido = ' +
                                UTI_GEN_Comillas(Trim(param_Serie)) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos en el NUMERO                                                           ** //
    // ********************************************************************************************* //
    if Trim(param_Numero) <> '' then
    begin
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'pdo.Numero_Pedido = ' +
                                UTI_GEN_Comillas(Trim(param_Numero)) );
    end;

    // ********************************************************************************************* //
    // ** Pasamos a filtrar los registros                                                         ** //
    // ********************************************************************************************* //
    var_Filtros.Add('');
    var_Order_By.Add('pdo.Serie_Pedido ASC, pdo.Numero_Pedido ASC');

    UTI_TB_Filtrar( private_Order_By,

                    var_Registro_CRUD.Delete_SQL,
                    var_Registro_CRUD.Update_SQL,
                    var_Registro_CRUD.Insert_SQL,

                    var_ctdad_Rgtros,
                    DataModule_Presupuestos_Compras.SQLTransaction_Pedido,
                    DataModule_Presupuestos_Compras.SQLConnector_Pedido,
                    SQLQuery_Pdo,

                    var_Registro_CRUD.name_tabla,
                    1, // ASI NO SE VEN LAS BAJAS

                    var_Registro_CRUD.SELECT_SQL,

                    var_Filtros {Memo_Filtros.Lines},
                    var_Order_By {Memo_OrderBy.Lines},
                    var_a_Filtrar.Text,

                    false {param_Cambiamos_Filtro} );

    var_a_Filtrar.Free;
    var_Filtros.Free;
    var_Order_By.Free;
end;

----
procedure Tform_presupuestos_compras_000.Filtrar_Pedidos_Detalles( param_id : ShortString );
var var_Registro_CRUD : TRegistro_CRUD;
    var_ctdad_Rgtros  : Integer;
    var_a_Filtrar     : TStrings;
    var_Filtros       : TStrings;
    var_Order_By      : TStrings;
begin
    var_a_Filtrar := TStringList.Create;
    var_Filtros   := TStringList.Create;
    var_Order_By  := TStringList.Create;

    var_a_Filtrar.Clear;
    var_Filtros.Clear;
    var_Order_By.Clear;

    var_ctdad_Rgtros  := -1;
    var_Registro_CRUD := UTI_DATOS_TABLA_pedidos_ventas_detalles_CRUD;

    // ********************************************************************************************* //
    // ** AHORA PONDREMOS EL RESTO DE LOS FILTROS QUE NO SON GENERALES                            ** //
    // ********************************************************************************************* //
    // ** Filtraremos por la id de la cabecera                                                    ** //
    // ********************************************************************************************* //
    UTI_RGTRO_Add_to_Where( false,
                            var_a_Filtrar,
                            'pdod.id_pedidos = ' + Trim(param_id) );

    // ********************************************************************************************* //
    // ** Pasamos a filtrar los registros                                                         ** //
    // ********************************************************************************************* //
    var_Filtros.Add('');
    var_Order_By.Add('pdod.id_pedidos ASC, pdod.id ASC');

    UTI_TB_Filtrar( private_Order_By,

                    var_Registro_CRUD.Delete_SQL,
                    var_Registro_CRUD.Update_SQL,
                    var_Registro_CRUD.Insert_SQL,

                    var_ctdad_Rgtros,
                    DataModule_Presupuestos_Compras.SQLTransaction_Pedido_Detalles,
                    DataModule_Presupuestos_Compras.SQLConnector_Pedido_Detalles,
                    SQLQuery_Pdo_Detalles,

                    var_Registro_CRUD.name_tabla,
                    1, // ASI NO SE VEN LAS BAJAS

                    var_Registro_CRUD.SELECT_SQL,

                    var_Filtros {Memo_Filtros.Lines},
                    var_Order_By {Memo_OrderBy.Lines},
                    var_a_Filtrar.Text,

                    false {param_Cambiamos_Filtro} );

    var_a_Filtrar.Free;
    var_Filtros.Free;
    var_Order_By.Free;
end;

procedure Tform_presupuestos_compras_000.Cerramos_Tabla_Pedidos_Detalles;
begin
    if UTI_TB_Cerrar( DataModule_Presupuestos_Compras.SQLConnector_Pedido_Detalles,
                      DataModule_Presupuestos_Compras.SQLTransaction_Pedido_Detalles,
                      SQLQuery_Pdo_Detalles ) = false then UTI_GEN_Salir;
end;


