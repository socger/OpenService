unit alumnos_000;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, DateTimePicker, Forms, Controls, Graphics, Dialogs,
  Buttons, StdCtrls, utilidades_bd, ExtCtrls, DBGrids, DbCtrls, Grids, ComCtrls, utilidades_general,
  utilidades_rgtro, variants, utilidades_usuarios, utilidades_datos_tablas, utilidades_stock,
  utilidades_lineas_detalle, utilidades_ventas, utilidades_forms_Filtrar, BufDataset, LCLTranslator;

resourcestring
  rs_para_Empezar_1 = 'Por nombre alumno';
  rs_para_Empezar_2 = 'Por NIF / CIF';
  rs_para_Empezar_3 = 'Por la id';
  rs_para_Empezar_4 = 'Por nombre';
  rs_para_Empezar_5 = 'Por periodos';
  rs_para_Empezar_6 = 'Por id';

  rs_BitBtn_ImprimirClick_1  = ', con apellidos/nombre %';
  rs_BitBtn_ImprimirClick_2  = ', con N.I.F. %';
  rs_BitBtn_ImprimirClick_3  = ', nacidos entre ';
  rs_BitBtn_ImprimirClick_4  = ' y el ';
  rs_BitBtn_ImprimirClick_5  = ', con forma de pago = ';
  rs_BitBtn_ImprimirClick_6  = ', con población = ';
  rs_BitBtn_ImprimirClick_7  = ', con provincia = ';
  rs_BitBtn_ImprimirClick_8  = ', con país = ';
  rs_BitBtn_ImprimirClick_9  = ', ver los que tengan deudas pendientes';
  rs_BitBtn_ImprimirClick_10 = ', ver los que tengan deudas pagadas';
  rs_BitBtn_ImprimirClick_11 = ', ver todos los periodos';
  rs_BitBtn_ImprimirClick_12 = ', ver sólo los periodos activos';

type

  { Tform_alumnos_000 }

  Tform_alumnos_000 = class(TForm)
    BitBtn_Filtrar: TBitBtn;
    BitBtn_Imprimir: TBitBtn;
    BitBtn_SALIR: TBitBtn;
    BitBtn_Seleccionar: TBitBtn;
    BitBtn_Ver_Situacion_Registro: TBitBtn;
    Boton_Elegir_Forma_Pago: TBitBtn;
    Boton_Elegir_Pais: TBitBtn;
    Boton_Elegir_Poblacion: TBitBtn;
    Boton_Elegir_Provincia: TBitBtn;
    CheckBox_Deudas_Pendientes: TCheckBox;
    CheckBox_Deudas_Pagadas: TCheckBox;
    ComboBox_Filtros: TComboBox;
    DataSource_Clientes: TDataSource;
    DataSource_Clientes_Contactos: TDataSource;
    DataSource_Clientes_Periodos: TDataSource;
    DataSource_Alb_Detalles: TDataSource;
    DateTimePicker_Nacido_Desde: TDateTimePicker;
    DateTimePicker_Nacido_Hasta: TDateTimePicker;
    DBGrid_Principal: TDBGrid;
    DBNavigator1: TDBNavigator;
    Edit_Alumno: TEdit;
    Edit_Descripcion_Forma_Pago: TEdit;
    Edit_Descripcion_Pais: TEdit;
    Edit_Descripcion_Poblacion: TEdit;
    Edit_Descripcion_Provincia: TEdit;
    Edit_id_Alumno_Rcbo: TEdit;
    Edit_id_Forma_Pago: TEdit;
    Edit_id_paises: TEdit;
    Edit_id_poblaciones: TEdit;
    Edit_id_provincias: TEdit;
    Edit_NIF: TEdit;
    GroupBox4: TGroupBox;
    Label10: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label_Fecha2: TLabel;
    Memo_Filtros: TMemo;
    Memo_OrderBy: TMemo;
    PageControl_Filtros: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    RadioButton_Periodo_Activos: TRadioButton;
    RadioButton_Periodo_Todos: TRadioButton;
    RadioGroup_Bajas: TRadioGroup;
    SQLQuery_Alb_DetallesCodigoBarras_Referencia: TStringField;
    SQLQuery_Alb_DetallesComision_Representante: TBCDField;
    SQLQuery_Alb_DetallesNumero_Factura: TLargeintField;
    SQLQuery_Alb_DetallesOT_Cliente_nombre_comercial: TStringField;
    SQLQuery_Alb_DetallesOT_Cliente_nombre_propietario: TStringField;
    SQLQuery_Alb_DetallesOT_Numero_Albaran: TLargeintField;
    SQLQuery_Alb_DetallesOT_Serie_Albaran: TStringField;
    SQLQuery_Alb_DetallesSerie_Factura: TStringField;
    SQLQuery_Clientes: TSQLQuery;
    SQLQuery_Alb_DetallesChange_Id_User: TLargeintField;
    SQLQuery_Alb_DetallesChange_WHEN: TDateTimeField;
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
    SQLQuery_Alb_DetallesOT_Concepto_Articulo1: TStringField;
    SQLQuery_Alb_DetallesOT_descripcion_almacen: TStringField;
    SQLQuery_Alb_DetallesOT_descripcion_articulo: TStringField;
    SQLQuery_Alb_DetallesOT_descripcion_impuesto: TStringField;
    SQLQuery_Alb_DetallesOT_Excluirlo1: TStringField;
    SQLQuery_Alb_DetallesOT_para_Cobrar1: TFloatField;
    SQLQuery_Alb_DetallesOT_Tipo_de_articulo: TStringField;
    SQLQuery_Alb_DetallesPVP: TBCDField;
    SQLQuery_Alb_DetallesPVP_Impuestos_Incluidos: TBCDField;
    SQLQuery_Alb_DetallesPVP_Manual_Final: TBCDField;
    SQLQuery_Alb_DetallesRepetir_Cada: TLongintField;
    SQLQuery_Alb_DetallesUnidades: TBCDField;
    SQLQuery_Alb_Detalles: TSQLQuery;
    SQLQuery_ClientesActivar_Proximidad_SN: TStringField;
    SQLQuery_ClientesAgrupar_Albaranes_SN: TStringField;
    SQLQuery_ClientesCantidad_Hermanos: TSmallintField;
    SQLQuery_ClientesChange_Id_User: TLargeintField;
    SQLQuery_ClientesChange_WHEN: TDateTimeField;
    SQLQuery_ClientesCodigo_Postal: TStringField;
    SQLQuery_ClientesCta_Bco_BIC_SWIFT: TStringField;
    SQLQuery_ClientesCta_Bco_Codigo_Postal: TStringField;
    SQLQuery_ClientesCta_Bco_Cuenta: TStringField;
    SQLQuery_ClientesCta_Bco_Digito_Control: TStringField;
    SQLQuery_ClientesCta_Bco_Direccion: TStringField;
    SQLQuery_ClientesCta_Bco_Direccion_Numero: TStringField;
    SQLQuery_ClientesCta_Bco_Direccion_Piso_Letra: TStringField;
    SQLQuery_ClientesCta_Bco_Entidad: TStringField;
    SQLQuery_ClientesCta_Bco_IBAN: TStringField;
    SQLQuery_ClientesCta_Bco_Mandato_Fecha_de_Firma: TDateTimeField;
    SQLQuery_ClientesCta_Bco_Mandato_Ref: TStringField;
    SQLQuery_ClientesCta_Bco_Sucursal: TStringField;
    SQLQuery_ClientesCuenta_Contable: TStringField;
    SQLQuery_ClientesDel_Id_User: TLargeintField;
    SQLQuery_ClientesDel_WHEN: TDateTimeField;
    SQLQuery_ClientesDel_WHY: TStringField;
    SQLQuery_ClientesDescuento_Comercial_1: TBCDField;
    SQLQuery_ClientesDescuento_Comercial_2: TBCDField;
    SQLQuery_ClientesDescuento_Final: TBCDField;
    SQLQuery_ClientesDescuento_Pronto_Pago: TBCDField;
    SQLQuery_ClientesDireccion: TStringField;
    SQLQuery_ClientesDireccion_Numero: TStringField;
    SQLQuery_ClientesDireccion_Piso_Letra: TStringField;
    SQLQuery_ClienteseMail: TStringField;
    SQLQuery_ClientesEstudia_SN: TStringField;
    SQLQuery_ClientesEstudios_Trabajos: TStringField;
    SQLQuery_ClientesFAX: TStringField;
    SQLQuery_ClientesFecha_Nacimiento: TDateTimeField;
    SQLQuery_ClientesForma_pago_Dia_1: TSmallintField;
    SQLQuery_ClientesForma_pago_Dia_2: TSmallintField;
    SQLQuery_ClientesForma_pago_Vacaciones_Dia_Fin: TSmallintField;
    SQLQuery_ClientesForma_pago_Vacaciones_Dia_Inicio: TSmallintField;
    SQLQuery_ClientesForma_pago_Vacaciones_Mes_Fin: TSmallintField;
    SQLQuery_ClientesForma_pago_Vacaciones_Mes_Inicio: TSmallintField;
    SQLQuery_Clientesid: TLargeintField;
    SQLQuery_Clientesid1: TLargeintField;
    SQLQuery_Clientesid_actividades: TLargeintField;
    SQLQuery_Clientesid_Agencias_Transporte: TLargeintField;
    SQLQuery_Clientesid_clientes_tipos: TLargeintField;
    SQLQuery_Clientesid_Cta_Bco_pais: TLargeintField;
    SQLQuery_Clientesid_Cta_Bco_poblaciones: TLargeintField;
    SQLQuery_Clientesid_Cta_Bco_provincias: TLargeintField;
    SQLQuery_Clientesid_formas_pago: TLargeintField;
    SQLQuery_Clientesid_paises: TLargeintField;
    SQLQuery_Clientesid_poblaciones: TLargeintField;
    SQLQuery_Clientesid_provincias: TLargeintField;
    SQLQuery_Clientesid_Representantes: TLargeintField;
    SQLQuery_Clientesid_rutas: TLargeintField;
    SQLQuery_Clientesid_tarifas: TLargeintField;
    SQLQuery_ClientesInsert_Id_User: TLargeintField;
    SQLQuery_ClientesInsert_WHEN: TDateTimeField;
    SQLQuery_ClientesIVA_con_Recargo_SN: TStringField;
    SQLQuery_ClientesIVA_Excluido_SN: TStringField;
    SQLQuery_ClientesMovil: TStringField;
    SQLQuery_Clientesnif_cif: TStringField;
    SQLQuery_Clientesnombre_comercial: TStringField;
    SQLQuery_Clientesnombre_propietario: TStringField;
    SQLQuery_ClientesObservaciones_Comentarios: TStringField;
    SQLQuery_ClientesOT_Alumno1: TStringField;
    SQLQuery_ClientesOT_BORRADO_Inicio_Fin: TDateTimeField;
    SQLQuery_ClientesOT_Cta_Bco_descripcion_pais: TStringField;
    SQLQuery_ClientesOT_Cta_Bco_descripcion_poblacion: TStringField;
    SQLQuery_ClientesOT_Cta_Bco_descripcion_provincia: TStringField;
    SQLQuery_ClientesOT_Cuenta_Contable_cliente_tipo: TStringField;
    SQLQuery_ClientesOT_descripcion_agencia_transporte: TStringField;
    SQLQuery_ClientesOT_descripcion_cliente_tipo: TStringField;
    SQLQuery_ClientesOT_descripcion_forma_pago: TStringField;
    SQLQuery_ClientesOT_descripcion_pais: TStringField;
    SQLQuery_ClientesOT_descripcion_poblacion: TStringField;
    SQLQuery_ClientesOT_descripcion_provincia: TStringField;
    SQLQuery_ClientesOT_descripcion_representante: TStringField;
    SQLQuery_ClientesOT_descripcion_tarifa: TStringField;
    SQLQuery_ClientesOT_Fin: TDateTimeField;
    SQLQuery_ClientesOT_Inicio: TDateTimeField;
    SQLQuery_ClientesOT_Movil_agencia_transporte: TStringField;
    SQLQuery_ClientesOT_Movil_representante: TStringField;
    SQLQuery_ClientesOT_Tfno_Fijo_1_agencia_transporte: TStringField;
    SQLQuery_ClientesOT_Tfno_Fijo_1_representante: TStringField;
    SQLQuery_ClientesOT_todos_los_Tfnos1: TStringField;
    SQLQuery_Clientespagina_web: TStringField;
    SQLQuery_ClientesPortes_Pagados_SN: TStringField;
    SQLQuery_ClientesRetencion: TBCDField;
    SQLQuery_ClientesRiesgo_Acumulado: TBCDField;
    SQLQuery_ClientesRiesgo_Autorizado: TBCDField;
    SQLQuery_ClientesTfno_Fijo_1: TStringField;
    SQLQuery_ClientesTfno_Fijo_2: TStringField;
    SQLQuery_ClientesTrabaja_SN: TStringField;
    SQLQuery_ClientesVencimientos_automaticos_SN: TStringField;
    SQLQuery_ClientesVencimientos_Cantidad: TSmallintField;
    SQLQuery_ClientesVencimientos_Dias_Entre: TSmallintField;
    SQLQuery_Clientes_Contactos: TSQLQuery;
    SQLQuery_Clientes_Periodos: TSQLQuery;
    SQLQuery_Clientes_ContactosCargo_Puesto: TStringField;
    SQLQuery_Clientes_ContactosChange_Id_User: TLargeintField;
    SQLQuery_Clientes_ContactosChange_WHEN: TDateTimeField;
    SQLQuery_Clientes_ContactosDel_Id_User: TLargeintField;
    SQLQuery_Clientes_ContactosDel_WHEN: TDateTimeField;
    SQLQuery_Clientes_ContactosDel_WHY: TStringField;
    SQLQuery_Clientes_ContactoseMail: TStringField;
    SQLQuery_Clientes_ContactosFAX: TStringField;
    SQLQuery_Clientes_ContactosFecha_Nacimiento: TDateTimeField;
    SQLQuery_Clientes_Contactosid: TLargeintField;
    SQLQuery_Clientes_Contactosid1: TLargeintField;
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
    SQLQuery_Clientes_PeriodosChange_Id_User: TLargeintField;
    SQLQuery_Clientes_PeriodosChange_WHEN: TDateTimeField;
    SQLQuery_Clientes_PeriodosDel_Id_User: TLargeintField;
    SQLQuery_Clientes_PeriodosDel_WHEN: TDateTimeField;
    SQLQuery_Clientes_PeriodosDel_WHY: TStringField;
    SQLQuery_Clientes_PeriodosFin: TDateTimeField;
    SQLQuery_Clientes_Periodosid_clientes: TLargeintField;
    SQLQuery_Clientes_PeriodosInicio: TDateTimeField;
    SQLQuery_Clientes_PeriodosInsert_Id_User: TLargeintField;
    SQLQuery_Clientes_PeriodosInsert_WHEN: TDateTimeField;
    TabSheet_Busqueda_Concreta: TTabSheet;
    TabSheet_Filtros_Generales: TTabSheet;

    procedure Boton_Elegir_Forma_PagoClick(Sender: TObject);
    procedure Boton_Elegir_PaisClick(Sender: TObject);
    procedure Boton_Elegir_PoblacionClick(Sender: TObject);
    procedure Boton_Elegir_ProvinciaClick(Sender: TObject);
    procedure ComboBox_FiltrosChange(Sender: TObject);
    procedure Edit_Descripcion_Forma_PagoClick(Sender: TObject);
    procedure Edit_Descripcion_PaisClick(Sender: TObject);
    procedure Edit_Descripcion_PoblacionClick(Sender: TObject);
    procedure Edit_Descripcion_ProvinciaClick(Sender: TObject);
    procedure Filtrar_Principal_Sin_Preguntar;
    procedure Filtrar_tablas_ligadas;
    function  Filtrar_clientes_contactos( param_Last_Column : TColumn; param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
    function  Filtrar_clientes_periodos( param_Last_Column : TColumn; param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
    function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
    function  Filtrar_Alb_Detalles( param_Last_Column : TColumn; param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
    procedure Refrescar_Registros;
    procedure Refrescar_Registros_Contactos;
    procedure Refrescar_Registros_Periodos;
    procedure Refrescar_Registros_Alb_Detalles;
    procedure Insertar_Registro;
    procedure Editar_Registro;
    procedure BitBtn_FiltrarClick(Sender: TObject);
    procedure BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
    procedure Presentar_Datos;
    procedure no_Tocar;
    procedure BitBtn_ImprimirClick(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure Seleccionado_Rgtro;
    procedure BitBtn_SALIRClick(Sender: TObject);
    procedure BitBtn_SeleccionarClick(Sender: TObject);
    procedure DBGrid_PrincipalCellClick(Column: TColumn);
    procedure DBGrid_PrincipalDblClick(Sender: TObject);
    procedure DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid_PrincipalTitleClick(Column: TColumn);
    procedure Cerramos_Tablas;
    procedure Cerramos_Tablas_Ligadas;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure para_Empezar;
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup_BajasClick(Sender: TObject);
    procedure SQLQuery_Alb_DetallesAfterPost(DataSet: TDataSet);
    procedure SQLQuery_Alb_DetallesBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_Alb_DetallesBeforePost(DataSet: TDataSet);
    procedure SQLQuery_Alb_DetallesCalcFields(DataSet: TDataSet);
    procedure SQLQuery_ClientesAfterPost(DataSet: TDataSet);
    procedure SQLQuery_ClientesAfterScroll(DataSet: TDataSet);
    procedure SQLQuery_ClientesBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_ClientesBeforePost(DataSet: TDataSet);
    procedure SQLQuery_ClientesCalcFields(DataSet: TDataSet);
    procedure SQLQuery_Clientes_ContactosAfterPost(DataSet: TDataSet);
    procedure SQLQuery_Clientes_ContactosBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_Clientes_ContactosBeforePost(DataSet: TDataSet);
    procedure SQLQuery_Clientes_ContactosCalcFields(DataSet: TDataSet);
    procedure SQLQuery_Clientes_PeriodosAfterPost(DataSet: TDataSet);
    procedure SQLQuery_Clientes_PeriodosBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_Clientes_PeriodosBeforePost(DataSet: TDataSet);
    procedure SQLQuery_Clientes_PeriodosCalcFields(DataSet: TDataSet);
  private
    { private declarations }
    private_Salir_OK                  : Boolean;
    private_Last_Column               : TColumn;
    private_Order_By                  : array of TOrder_By;
    private_Order_By_contactos        : array of TOrder_By;
    private_Order_By_periodos         : array of TOrder_By;
    private_Order_By_Lineas_Detalles  : array of TOrder_By;
    private_Actualizado_Antes_de_Post : Boolean;
  public
    { public declarations }
    public_Solo_Ver                 : Boolean;
    public_Elegimos                 : Boolean;
    public_Menu_Worked              : Integer;
    public_Rgtro_Seleccionado       : Boolean;
    public_Last_Column_Contactos    : TColumn;
    public_Last_Column_Periodos     : TColumn;
    public_Last_Column_Alb_Detalles : TColumn;
  end;

var
  form_alumnos_000: Tform_alumnos_000;

implementation

{$R *.lfm}

uses dm_clientes, menu, alumnos_001;

{ Tform_alumnos_000 }

procedure Tform_alumnos_000.FormActivate(Sender: TObject);
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

procedure Tform_alumnos_000.FormCreate(Sender: TObject);
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
end;

procedure Tform_alumnos_000.para_Empezar;
begin
    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    if UTI_GEN_Form_Abierto_Ya('DataModule_Clientes') = False then
    begin
        DataModule_Clientes := TDataModule_Clientes.Create(Application);
    end;

    // ********************************************************************************************* //
    // ** Preparamos los diferentes tipos de orden preconfigurados                                ** //
    // ********************************************************************************************* //
    // ** ALUMNOS/CLIENTES                                                                        ** //
    // ********************************************************************************************* //
    SetLength(private_Order_By, 3);

    private_Order_By[0].Titulo       := rs_para_Empezar_1; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[0].Memo_OrderBy := 'cl.nombre_propietario ASC';

    private_Order_By[1].Titulo       := rs_para_Empezar_2;
    private_Order_By[1].Memo_OrderBy := 'cl.nif_cif ASC';

    private_Order_By[2].Titulo       := rs_para_Empezar_3;
    private_Order_By[2].Memo_OrderBy := 'cl.id ASC';

    Memo_OrderBy.Lines.Text          := private_Order_By[0].Memo_OrderBy;

    UTI_TB_Rellenar_ComboBox_Orden( true,
                                    ComboBox_Filtros,
                                    private_Order_By,
                                    0 );

    // ********************************************************************************************* //
    // ** CONTACTOS DE ALUMNOS/CLIENTES                                                           ** //
    // ********************************************************************************************* //
    SetLength(private_Order_By_contactos, 1);

    private_Order_By_contactos[0].Titulo       := rs_para_Empezar_4; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_contactos[0].Memo_OrderBy := 'cc.id_clientes ASC, cc.nombre ASC';

    // ********************************************************************************************* //
    // ** PERIODOS DE ALUMNOS/CLIENTES                                                            ** //
    // ********************************************************************************************* //
    SetLength(private_Order_By_periodos, 1);

    private_Order_By_periodos[0].Titulo       := rs_para_Empezar_5; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_periodos[0].Memo_OrderBy := 'cp.id_clientes ASC, cp.Inicio DESC, cp.Fin DESC';

    // ********************************************************************************************* //
    // ** ALBARANES DETALLES                                                                      ** //
    // ********************************************************************************************* //
    SetLength(private_Order_By_Lineas_Detalles, 1);

    private_Order_By_Lineas_Detalles[0].Titulo       := rs_para_Empezar_6; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_Lineas_Detalles[0].Memo_OrderBy := 'ad.id_clientes ASC, ad.id ASC';

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

procedure Tform_alumnos_000.RadioGroup_BajasClick(Sender: TObject);
begin
    Refrescar_Registros;
end;

procedure Tform_alumnos_000.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
    if private_Salir_OK = False then
    begin
            // ************************************************************************************* //
            // ** Intento BitBtn_SALIR de la aplicación de un modo no permitido.                  ** //
            // ************************************************************************************* //
            // Pero si desde el menu principal está a true la variable                            ** //
            // public_Salir_Ok, significa que hay que salir si o si pues se pulsó                 ** //
            // cancelar al preguntar otra vez por la contraseña                                   ** //
            // ************************************************************************************* //
            if form_Menu.public_Salir_OK = False then CloseAction := CloseAction.caNone;
    end else begin
        // ************************************************************************************* //
        // ** Fue correcto el modo como quiere BitBtn_SALIR de la aplicación                  ** //
        // ************************************************************************************* //
    end;
end;

procedure Tform_alumnos_000.FormDestroy(Sender: TObject);
begin
    Cerramos_Tablas;
end;

procedure Tform_alumnos_000.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_Clientes.SQLConnector_Clientes,
                      DataModule_Clientes.SQLTransaction_Clientes,
                      SQLQuery_Clientes ) = false then UTI_GEN_Salir;

    DataModule_Clientes.Free;
end;

procedure Tform_alumnos_000.Cerramos_Tablas_Ligadas;
begin
    if UTI_TB_Cerrar( DataModule_Clientes.SQLConnector_Clientes_Contactos,
                      DataModule_Clientes.SQLTransaction_Clientes_Contactos,
                      SQLQuery_Clientes_Contactos ) = false then UTI_GEN_Salir;

    if UTI_TB_Cerrar( DataModule_Clientes.SQLConnector_Clientes_Periodos,
                      DataModule_Clientes.SQLTransaction_Clientes_Periodos,
                      SQLQuery_Clientes_Periodos ) = false then UTI_GEN_Salir;

    if UTI_TB_Cerrar( DataModule_Clientes.SQLConnector_Clientes_Alb_Detalles,
                      DataModule_Clientes.SQLTransaction_Clientes_Alb_Detalles,
                      SQLQuery_Alb_Detalles ) = false then UTI_GEN_Salir;
end;

procedure Tform_alumnos_000.SQLQuery_ClientesCalcFields(DataSet: TDataSet);
begin
    with SQLQuery_Clientes do
    begin
        // ALUMNO
        FieldByName('OT_Alumno').AsString := Trim(FieldByName('nombre_comercial').AsString) +
                                             ' ' +
                                             Trim(FieldByName('nombre_propietario').AsString);

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

procedure Tform_alumnos_000.SQLQuery_Clientes_ContactosCalcFields(DataSet: TDataSet);
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

procedure Tform_alumnos_000.SQLQuery_Clientes_PeriodosAfterPost(DataSet: TDataSet);
begin
    UTI_RGTRO_Grabar( 'clientes_periodos',
                      DataModule_Clientes.SQLTransaction_Clientes_Periodos,
                      SQLQuery_Clientes_Periodos );

    Refrescar_Registros_Periodos;
end;

procedure Tform_alumnos_000.SQLQuery_Clientes_PeriodosBeforeEdit(
  DataSet: TDataSet);
begin
    UTI_RGTRO_param_assign_value_Edit( SQLQuery_Clientes_Periodos );
end;

procedure Tform_alumnos_000.SQLQuery_Clientes_PeriodosBeforePost(
  DataSet: TDataSet);
begin
    UTI_RGTRO_param_assign_value( SQLQuery_Clientes_Periodos );
end;

procedure Tform_alumnos_000.SQLQuery_Clientes_PeriodosCalcFields(
  DataSet: TDataSet);
begin
    with SQLQuery_Clientes_Periodos do
    begin
         // No hay nada para calcular //
    end;
end;

procedure Tform_alumnos_000.SQLQuery_Clientes_ContactosAfterPost(DataSet: TDataSet);
begin
    UTI_RGTRO_Grabar( 'clientes_contactos',
                      DataModule_Clientes.SQLTransaction_Clientes_Contactos,
                      SQLQuery_Clientes_Contactos );

    Refrescar_Registros_Contactos;
end;

procedure Tform_alumnos_000.SQLQuery_ClientesAfterPost(DataSet: TDataSet);
begin
    UTI_RGTRO_Grabar( 'clientes',
                      DataModule_Clientes.SQLTransaction_Clientes,
                      SQLQuery_Clientes );

    Refrescar_Registros;
end;

procedure Tform_alumnos_000.SQLQuery_ClientesBeforePost(DataSet: TDataSet);
begin
    UTI_RGTRO_param_assign_value( SQLQuery_Clientes );
end;

procedure Tform_alumnos_000.SQLQuery_ClientesAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure Tform_alumnos_000.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    If public_Elegimos then
         Seleccionado_Rgtro
    else Editar_Registro;
end;

procedure Tform_alumnos_000.DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    UTI_GEN_Dibujar_Grid( Sender, SQLQuery_Clientes, Rect, DataCol, Column, State );
end;

procedure Tform_alumnos_000.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then
    begin
        If public_Elegimos then
             Seleccionado_Rgtro
        else Editar_Registro;
    end;
end;

procedure Tform_alumnos_000.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

procedure Tform_alumnos_000.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure Tform_alumnos_000.DBGrid_PrincipalTitleClick(Column: TColumn);
begin
    private_Last_Column := UTI_GEN_Ordenar_dbGrid( private_Last_Column,
                                                   Column, SQLQuery_Clientes );
end;

procedure Tform_alumnos_000.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_alumnos_000.BitBtn_SeleccionarClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
end;

procedure Tform_alumnos_000.Seleccionado_Rgtro;
begin
    private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    public_Rgtro_Seleccionado := true;
    Close;
end;

procedure Tform_alumnos_000.DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
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
            if UTI_USR_Permiso_SN(public_Menu_Worked, 'B', True) = True then
            begin
                UTI_RGTRO_Borrar( 'clientes',
                                  SQLQuery_Clientes,
                                  public_Solo_Ver,
                                  public_Menu_Worked );
            end;
            Abort;
        end;

        nbRefresh : begin
            Refrescar_Registros;
            Abort;
        end;
    end;
end;

procedure Tform_alumnos_000.BitBtn_ImprimirClick(Sender: TObject);
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

    if Trim(Edit_Alumno.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            rs_BitBtn_ImprimirClick_1 +
                            Trim(Edit_Alumno.Text) + '%';
    end;

    if Trim(Edit_NIF.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            rs_BitBtn_ImprimirClick_2 +
                            Trim(Edit_NIF.Text) + '%';
    end;

    if (not DateTimePicker_Nacido_Hasta.DateIsNull) or
       (not DateTimePicker_Nacido_Desde.DateIsNull) then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            rs_BitBtn_ImprimirClick_3 +
                            DateToStr(DateTimePicker_Nacido_Desde.Date) +
                            rs_BitBtn_ImprimirClick_4 +
                            DateToStr(DateTimePicker_Nacido_Hasta.Date);
    end;

    if Trim(Edit_Descripcion_Forma_Pago.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            rs_BitBtn_ImprimirClick_5 +
                            Trim(Edit_Descripcion_Forma_Pago.Text);
    end;

    if Trim(Edit_Descripcion_Poblacion.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            rs_BitBtn_ImprimirClick_6 +
                            Trim(Edit_Descripcion_Poblacion.Text);
    end;

    if Trim(Edit_Descripcion_Provincia.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            rs_BitBtn_ImprimirClick_7 +
                            Trim(Edit_Descripcion_Provincia.Text);
    end;

    if Trim(Edit_Descripcion_Pais.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            rs_BitBtn_ImprimirClick_8 +
                            Trim(Edit_Descripcion_Pais.Text);
    end;

    if CheckBox_Deudas_Pendientes.Checked = true then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            rs_BitBtn_ImprimirClick_9;
    end;

    if CheckBox_Deudas_Pagadas.Checked = true then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            rs_BitBtn_ImprimirClick_10;
    end;

    if RadioButton_Periodo_Todos.Checked = true then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            rs_BitBtn_ImprimirClick_11;
    end;

    if RadioButton_Periodo_Activos.Checked = true then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            rs_BitBtn_ImprimirClick_12;
    end;

    // ********************************************************************************************* //
    // ** Configuramos la llamada al generador de informes                                        ** //
    // ********************************************************************************************* //
    var_Ficheros := TStringList.Create;

    var_Ficheros.Add( 'listado_alumnos.lrf' );

    UTI_GEN_Informes( var_Ordenado_por,
                      SQLQuery_Clientes,
                      DataSource_Clientes,
                      Nil,
                      Nil,
                      public_Menu_Worked,
                      public_Solo_Ver,
                      '',
                      '',
                      var_Ficheros );

    var_Ficheros.Free;
end;

procedure Tform_alumnos_000.no_Tocar;
begin
    BitBtn_Imprimir.Enabled := False;
end;

procedure Tform_alumnos_000.Presentar_Datos;
begin
     /// guardar por lo que pueda pasar
end;

procedure Tform_alumnos_000.BitBtn_FiltrarClick(Sender: TObject);
begin
    if PageControl_Filtros.ActivePage = TabSheet_Busqueda_Concreta then
    begin
        Filtrar_Principal_Sin_Preguntar;
    end else begin
        RadioGroup_Bajas.ItemIndex := Filtrar_Principal( true );
    end;
end;

procedure Tform_alumnos_000.BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if SQLQuery_Clientes.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'clientes',
                                           SQLQuery_Clientes,
                                           DataSource_Clientes,
                                           DBGrid_Principal );
        end;
    end;
end;

procedure Tform_alumnos_000.SQLQuery_ClientesBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTRO_param_assign_value_Edit( SQLQuery_Clientes );
end;

procedure Tform_alumnos_000.SQLQuery_Clientes_ContactosBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTRO_param_assign_value_Edit( SQLQuery_Clientes_Contactos );
end;

procedure Tform_alumnos_000.SQLQuery_Clientes_ContactosBeforePost(DataSet: TDataSet);
begin
    UTI_RGTRO_param_assign_value( SQLQuery_Clientes_Contactos );
end;

procedure Tform_alumnos_000.Refrescar_Registros_Periodos;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;

    var_Inicio         : String;
    var_Fin            : String;

    var_ver_Bajas      : ShortInt;
begin
    // ********************************************************************************************* //
    // ** Solo si la cabecera está en modo EDIT se abren las tablas hijas                         ** //
    // ********************************************************************************************* //
    if SQLQuery_Clientes.State <> dsEdit then Exit;

    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_Inicio := '';
    var_Fin    := '';

    if SQLQuery_Clientes_Periodos.RecordCount > 0 then
    begin
        var_Inicio := SQLQuery_Clientes_Periodos.FieldByName('Inicio').Value;
        var_Fin    := SQLQuery_Clientes_Periodos.FieldByName('Fin').Value;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Clear;
    var_Lineas_OrderBy.Clear;

    if Trim(SQLQuery_Clientes.FieldByName('id').AsString) <> '' then
         var_Lineas_Filtro.Add('cp.id_clientes = ' + Trim(SQLQuery_Clientes.FieldByName('id').AsString))
    else var_Lineas_Filtro.Add('cp.id_clientes = Null');

    var_ver_Bajas := RadioGroup_Bajas.ItemIndex;
    if UTI_GEN_Form_Abierto_Ya('form_alumnos_001') = true then
    begin
        var_ver_Bajas := form_alumnos_001.RadioGroup_Bajas.ItemIndex;
    end;

    Filtrar_clientes_periodos( public_Last_Column_Periodos,
                               var_ver_Bajas,
                               false,
                               var_Lineas_Filtro,
                               var_Lineas_OrderBy );

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;

    if Trim(var_Inicio) <> '' then
    begin
        SQLQuery_Clientes_Periodos.Locate( 'Inicio;Fin',
                                           VarArrayOf( [ var_Inicio,
                                                         var_Fin ] ),
                                           [] );
    end;
end;

procedure Tform_alumnos_000.Refrescar_Registros_Contactos;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
    var_nombre         : String;
    var_ver_Bajas      : ShortInt;
begin
    // ********************************************************************************************* //
    // ** Solo si la cabecera está en modo EDIT se abren las tablas hijas                         ** //
    // ********************************************************************************************* //
    if SQLQuery_Clientes.State <> dsEdit then Exit;

    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_nombre := '';

    if SQLQuery_Clientes_Contactos.RecordCount > 0 then
    begin
        var_nombre := SQLQuery_Clientes_Contactos.FieldByName('nombre').Value;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Clear;
    var_Lineas_OrderBy.Clear;

    if Trim(SQLQuery_Clientes.FieldByName('id').AsString) <> '' then
         var_Lineas_Filtro.Add('id_clientes = ' + Trim(SQLQuery_Clientes.FieldByName('id').AsString))
    else var_Lineas_Filtro.Add('id_clientes = Null');

    var_ver_Bajas := RadioGroup_Bajas.ItemIndex;
    if UTI_GEN_Form_Abierto_Ya('form_alumnos_001') = true then
    begin
        var_ver_Bajas := form_alumnos_001.RadioGroup_Bajas.ItemIndex;
    end;

    Filtrar_clientes_contactos( public_Last_Column_Contactos,
                                var_ver_Bajas,
                                false,
                                var_Lineas_Filtro,
                                var_Lineas_OrderBy );

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;

    if Trim(var_nombre) <> '' then
    begin
         SQLQuery_Clientes_Contactos.Locate( 'nombre',
                                             var_nombre,
                                             [] );
    end;
end;

procedure Tform_alumnos_000.Refrescar_Registros;
var var_nombre_propietario : String;
    var_nif_cif            : String;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_nombre_propietario := '';
    var_nif_cif            := '';

    if SQLQuery_Clientes.RecordCount > 0 then
    begin
        var_nombre_propietario := SQLQuery_Clientes.FieldByName('nombre_propietario').asString;
        var_nif_cif            := SQLQuery_Clientes.FieldByName('nif_cif').asString;
    end;

    Filtrar_Principal_Sin_Preguntar;

    if Trim(var_nombre_propietario) <> '' then
    begin
         SQLQuery_Clientes.Locate( 'nombre_propietario;nif_cif',
                                   VarArrayOf( [ var_nombre_propietario, var_nif_cif ] ),
                                   [] );
    end;
end;

function Tform_alumnos_000.Filtrar_clientes_contactos( param_Last_Column : TColumn;
                                                       param_ver_bajas : ShortInt;
                                                       param_Cambiamos_Filtro : Boolean;
                                                       param_Lineas_Filtro,
                                                       param_Lineas_OrderBy : TStrings ) : ShortInt;
var var_Registro_CRUD : TRegistro_CRUD;
    var_ctdad_Rgtros  : Integer;
begin
    var_Registro_CRUD := UTI_DATOS_TABLA_clientes_contactos_CRUD;
    var_ctdad_Rgtros  := -1;

    if Trim(param_Lineas_OrderBy.Text) = '' then
    begin
         param_Lineas_OrderBy.Text := private_Order_By_contactos[0].Memo_OrderBy;
    end;

    Result := UTI_TB_Filtrar( private_Order_By_contactos,

                              var_Registro_CRUD.Delete_SQL,
                              var_Registro_CRUD.Update_SQL,
                              var_Registro_CRUD.Insert_SQL,

                              var_ctdad_Rgtros,
                              DataModule_Clientes.SQLTransaction_Clientes_Contactos,
                              DataModule_Clientes.SQLConnector_Clientes_Contactos,
                              SQLQuery_Clientes_Contactos,

                              var_Registro_CRUD.name_tabla,
                              param_ver_bajas,

                              var_Registro_CRUD.SELECT_SQL,

                              param_Lineas_Filtro,
                              param_Lineas_OrderBy,
                              '',

                              param_Cambiamos_Filtro );

    UTI_GEN_Borrar_Imagen_Orden_Grid(param_Last_Column);
end;

function Tform_alumnos_000.Filtrar_Alb_Detalles( param_Last_Column : TColumn;
                                                 param_ver_bajas : ShortInt;
                                                 param_Cambiamos_Filtro : Boolean;
                                                 param_Lineas_Filtro,
                                                 param_Lineas_OrderBy : TStrings ) : ShortInt;
var var_Registro_CRUD : TRegistro_CRUD;
    var_ctdad_Rgtros  : Integer;
begin
    var_Registro_CRUD := UTI_DATOS_TABLA_albaranes_ventas_detalles_CRUD(true);
    var_ctdad_Rgtros  := -1;

    if Trim(param_Lineas_OrderBy.Text) = '' then
    begin
         param_Lineas_OrderBy.Text := private_Order_By_Lineas_Detalles[0].Memo_OrderBy;
    end;

    Result := UTI_TB_Filtrar( private_Order_By_Lineas_Detalles,

                              var_Registro_CRUD.Delete_SQL,
                              var_Registro_CRUD.Update_SQL,
                              var_Registro_CRUD.Insert_SQL,

                              var_ctdad_Rgtros,
                              DataModule_Clientes.SQLTransaction_Clientes_Alb_Detalles,
                              DataModule_Clientes.SQLConnector_Clientes_Alb_Detalles,
                              SQLQuery_Alb_Detalles,

                              var_Registro_CRUD.name_tabla,
                              param_ver_bajas,

                              var_Registro_CRUD.SELECT_SQL,

                              param_Lineas_Filtro,
                              param_Lineas_OrderBy,
                              '',

                              param_Cambiamos_Filtro );

    UTI_GEN_Borrar_Imagen_Orden_Grid(param_Last_Column);
end;

procedure Tform_alumnos_000.Filtrar_tablas_ligadas;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
begin
    if SQLQuery_Clientes.RecordCount = 0 then Exit;

    if SQLQuery_Clientes.State = dsInsert then
    begin
        Cerramos_Tablas_Ligadas;
        Exit;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    // ********************************************************************************************* //
    // ** CLIENTES_CONTACTOS                                                                      ** //
    // ********************************************************************************************* //
    UTI_RGTRO_Add_to_Where( true,
                            var_Lineas_Filtro,
                            'cc.id_clientes = ' + SQLQuery_Clientes.FieldByName('id').AsString );

    var_Lineas_OrderBy.Clear;
    Filtrar_clientes_contactos( private_Last_Column,
                                RadioGroup_Bajas.ItemIndex,
                                false,
                                var_Lineas_Filtro,
                                var_Lineas_OrderBy );

    // ********************************************************************************************* //
    // ** CLIENTES_PERIODOS                                                                       ** //
    // ********************************************************************************************* //
    UTI_RGTRO_Add_to_Where( true,
                            var_Lineas_Filtro,
                            'cp.id_clientes = ' + SQLQuery_Clientes.FieldByName('id').AsString );

    var_Lineas_OrderBy.Clear;
    Filtrar_clientes_periodos( private_Last_Column,
                               RadioGroup_Bajas.ItemIndex,
                               false,
                               var_Lineas_Filtro,
                               var_Lineas_OrderBy );

    // ********************************************************************************************* //
    // ** ALBARANES DETALLES                                                                      ** //
    // ********************************************************************************************* //
    UTI_RGTRO_Add_to_Where( true,
                            var_Lineas_Filtro,
                            'ad.id_clientes = ' + SQLQuery_Clientes.FieldByName('id').AsString );

    UTI_RGTRO_Add_to_Where( false,
                            var_Lineas_Filtro,
                            'id_albaranes = 0' );

    // jerofa igual aqui tambien tendria que poner que solo aparecieran los que no han sido facturados o remesados

    var_Lineas_OrderBy.Clear;
    Filtrar_Alb_Detalles( private_Last_Column,
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

procedure Tform_alumnos_000.Insertar_Registro;
var var_msg                : TStrings;
    var_nombre_propietario : String;
    var_nombre_comercial   : String;
begin
    with SQLQuery_Clientes do
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

                FieldByName('id_clientes_tipos').AsString           := '0';
                FieldByName('id_tarifas').AsString                  := '0';

                FieldByName('Vencimientos_automaticos_SN').AsString := 'N';
                FieldByName('Vencimientos_Cantidad').AsString       := '0';
                FieldByName('Vencimientos_Dias_Entre').AsString     := '0';

                FieldByName('IVA_con_Recargo_SN').AsString          := 'N';
                FieldByName('IVA_Excluido_SN').AsString             := 'N';
                FieldByName('Agrupar_Albaranes_SN').AsString        := 'N';
                FieldByName('Activar_Proximidad_SN').AsString       := 'S';

                FieldByName('Riesgo_Autorizado').AsString           := '0';
                FieldByName('Riesgo_Acumulado').AsString            := '0';

                FieldByName('Cuenta_Contable').AsString             := ' ';

                Application.CreateForm(Tform_alumnos_001, form_alumnos_001);

                form_alumnos_001.RadioGroup_Bajas.ItemIndex := RadioGroup_Bajas.ItemIndex;

                form_alumnos_001.para_Empezar;

                form_alumnos_001.ShowModal;
                if form_alumnos_001.public_Pulso_Aceptar = true then
                begin
                    FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
                    FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                    var_nombre_propietario              := FieldByName('nombre_propietario').AsString;
                    var_nombre_comercial                := FieldByName('nombre_comercial').AsString;

                    UTI_RGTRO_Grabar_Antes( 'clientes', SQLQuery_Clientes );

                    form_alumnos_001.Free;

                    if (FieldByName('nombre_propietario').AsString = var_nombre_propietario) and
                       (FieldByName('nombre_comercial').AsString = var_nombre_comercial)     then
                    begin
                        Editar_Registro;
                    end;
                end else begin
                    Cancel;
                    form_alumnos_001.Free;
                end;
            end;
        end;

        var_msg.Free;
    end;
end;

procedure Tform_alumnos_000.Editar_Registro;
var var_msg : TStrings;
    var_id  : ShortString;
begin
    with SQLQuery_Clientes do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
        begin
            var_id := FieldByName('id').AsString;

            if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
            begin
                if UTI_RGTRO_isLock( 'clientes',
                                     var_id,
                                     true ) = true then
                begin
                    Exit;
                end else begin
                    if UTI_RGTRO_Lock( 'clientes',
                                       var_id ) = true then
                         Edit
                    else Exit;
                end;

                Application.CreateForm(Tform_alumnos_001, form_alumnos_001);

                form_alumnos_001.RadioGroup_Bajas.ItemIndex := RadioGroup_Bajas.ItemIndex;
                form_alumnos_001.public_Menu_Worked         := public_Menu_Worked;

                if public_Solo_Ver = true then
                begin
                    form_alumnos_001.public_Solo_Ver := true;
                end;

                form_alumnos_001.para_Empezar;

                form_alumnos_001.ShowModal;
                if form_alumnos_001.public_Pulso_Aceptar = true then
                begin
                    if ( Trim(Params.ParamByName('COPY_' + 'nombre_propietario').AsString)               <> Trim(FieldByName('nombre_propietario').AsString) )               or
                       ( Trim(Params.ParamByName('COPY_' + 'nombre_comercial').AsString)                 <> Trim(FieldByName('nombre_comercial').AsString) )                 or
                       ( Trim(Params.ParamByName('COPY_' + 'nif_cif').AsString)                          <> Trim(FieldByName('nif_cif').AsString) )                          or
                       ( Trim(Params.ParamByName('COPY_' + 'Fecha_Nacimiento').AsString)                 <> Trim(FieldByName('Fecha_Nacimiento').AsString) )                 or
                       ( Trim(Params.ParamByName('COPY_' + 'Tfno_Fijo_1').AsString)                      <> Trim(FieldByName('Tfno_Fijo_1').AsString) )                      or
                       ( Trim(Params.ParamByName('COPY_' + 'Tfno_Fijo_2').AsString)                      <> Trim(FieldByName('Tfno_Fijo_2').AsString) )                      or
                       ( Trim(Params.ParamByName('COPY_' + 'FAX').AsString)                              <> Trim(FieldByName('FAX').AsString) )                              or
                       ( Trim(Params.ParamByName('COPY_' + 'Movil').AsString)                            <> Trim(FieldByName('Movil').AsString) )                            or
                       ( Trim(Params.ParamByName('COPY_' + 'eMail').AsString)                            <> Trim(FieldByName('eMail').AsString) )                            or
                       ( Trim(Params.ParamByName('COPY_' + 'pagina_web').AsString)                       <> Trim(FieldByName('pagina_web').AsString) )                       or
                       ( Trim(Params.ParamByName('COPY_' + 'Direccion').AsString)                        <> Trim(FieldByName('Direccion').AsString) )                        or
                       ( Trim(Params.ParamByName('COPY_' + 'Direccion_Numero').AsString)                 <> Trim(FieldByName('Direccion_Numero').AsString) )                 or
                       ( Trim(Params.ParamByName('COPY_' + 'Direccion_Piso_Letra').AsString)             <> Trim(FieldByName('Direccion_Piso_Letra').AsString) )             or
                       ( Trim(Params.ParamByName('COPY_' + 'Codigo_Postal').AsString)                    <> Trim(FieldByName('Codigo_Postal').AsString) )                    or
                       ( Trim(Params.ParamByName('COPY_' + 'id_poblaciones').AsString)                   <> Trim(FieldByName('id_poblaciones').AsString) )                   or
                       ( Trim(Params.ParamByName('COPY_' + 'id_provincias').AsString)                    <> Trim(FieldByName('id_provincias').AsString) )                    or
                       ( Trim(Params.ParamByName('COPY_' + 'id_paises').AsString)                        <> Trim(FieldByName('id_paises').AsString) )                        or
                       ( Trim(Params.ParamByName('COPY_' + 'id_clientes_tipos').AsString)                <> Trim(FieldByName('id_clientes_tipos').AsString) )                or
                       ( Trim(Params.ParamByName('COPY_' + 'Cta_Bco_Entidad').AsString)                  <> Trim(FieldByName('Cta_Bco_Entidad').AsString) )                  or
                       ( Trim(Params.ParamByName('COPY_' + 'Cta_Bco_Sucursal').AsString)                 <> Trim(FieldByName('Cta_Bco_Sucursal').AsString) )                 or
                       ( Trim(Params.ParamByName('COPY_' + 'Cta_Bco_Digito_Control').AsString)           <> Trim(FieldByName('Cta_Bco_Digito_Control').AsString) )           or
                       ( Trim(Params.ParamByName('COPY_' + 'Cta_Bco_Cuenta').AsString)                   <> Trim(FieldByName('Cta_Bco_Cuenta').AsString) )                   or
                       ( Trim(Params.ParamByName('COPY_' + 'Cta_Bco_IBAN').AsString)                     <> Trim(FieldByName('Cta_Bco_IBAN').AsString) )                     or
                       ( Trim(Params.ParamByName('COPY_' + 'Cta_Bco_BIC_SWIFT').AsString)                <> Trim(FieldByName('Cta_Bco_BIC_SWIFT').AsString) )                or
                       ( Trim(Params.ParamByName('COPY_' + 'Cta_Bco_Mandato_Fecha_de_Firma').AsString)   <> Trim(FieldByName('Cta_Bco_Mandato_Fecha_de_Firma').AsString) )   or
                       ( Trim(Params.ParamByName('COPY_' + 'Cta_Bco_Mandato_Ref').AsString)              <> Trim(FieldByName('Cta_Bco_Mandato_Ref').AsString) )              or
                       ( Trim(Params.ParamByName('COPY_' + 'Cta_Bco_Direccion').AsString)                <> Trim(FieldByName('Cta_Bco_Direccion').AsString) )                or
                       ( Trim(Params.ParamByName('COPY_' + 'Cta_Bco_Direccion_Numero').AsString)         <> Trim(FieldByName('Cta_Bco_Direccion_Numero').AsString) )         or
                       ( Trim(Params.ParamByName('COPY_' + 'Cta_Bco_Direccion_Piso_Letra').AsString)     <> Trim(FieldByName('Cta_Bco_Direccion_Piso_Letra').AsString) )     or
                       ( Trim(Params.ParamByName('COPY_' + 'Cta_Bco_Codigo_Postal').AsString)            <> Trim(FieldByName('Cta_Bco_Codigo_Postal').AsString) )            or
                       ( Trim(Params.ParamByName('COPY_' + 'id_Cta_Bco_poblaciones').AsString)           <> Trim(FieldByName('id_Cta_Bco_poblaciones').AsString) )           or
                       ( Trim(Params.ParamByName('COPY_' + 'id_Cta_Bco_provincias').AsString)            <> Trim(FieldByName('id_Cta_Bco_provincias').AsString) )            or
                       ( Trim(Params.ParamByName('COPY_' + 'id_Cta_Bco_pais').AsString)                  <> Trim(FieldByName('id_Cta_Bco_pais').AsString) )                  or
                       ( Trim(Params.ParamByName('COPY_' + 'id_formas_pago').AsString)                   <> Trim(FieldByName('id_formas_pago').AsString) )                   or
                       ( Trim(Params.ParamByName('COPY_' + 'Forma_pago_Dia_1').AsString)                 <> Trim(FieldByName('Forma_pago_Dia_1').AsString) )                 or
                       ( Trim(Params.ParamByName('COPY_' + 'Forma_pago_Dia_2').AsString)                 <> Trim(FieldByName('Forma_pago_Dia_2').AsString) )                 or
                       ( Trim(Params.ParamByName('COPY_' + 'Vencimientos_automaticos_SN').AsString)      <> Trim(FieldByName('Vencimientos_automaticos_SN').AsString) )      or
                       ( Trim(Params.ParamByName('COPY_' + 'Vencimientos_Cantidad').AsString)            <> Trim(FieldByName('Vencimientos_Cantidad').AsString) )            or
                       ( Trim(Params.ParamByName('COPY_' + 'Vencimientos_Dias_Entre').AsString)          <> Trim(FieldByName('Vencimientos_Dias_Entre').AsString) )          or
                       ( Trim(Params.ParamByName('COPY_' + 'Forma_pago_Vacaciones_Dia_Inicio').AsString) <> Trim(FieldByName('Forma_pago_Vacaciones_Dia_Inicio').AsString) ) or
                       ( Trim(Params.ParamByName('COPY_' + 'Forma_pago_Vacaciones_Mes_Inicio').AsString) <> Trim(FieldByName('Forma_pago_Vacaciones_Mes_Inicio').AsString) ) or
                       ( Trim(Params.ParamByName('COPY_' + 'Forma_pago_Vacaciones_Dia_Fin').AsString)    <> Trim(FieldByName('Forma_pago_Vacaciones_Dia_Fin').AsString) )    or
                       ( Trim(Params.ParamByName('COPY_' + 'Forma_pago_Vacaciones_Mes_Fin').AsString)    <> Trim(FieldByName('Forma_pago_Vacaciones_Mes_Fin').AsString) )    or
                       ( Trim(Params.ParamByName('COPY_' + 'IVA_con_Recargo_SN').AsString)               <> Trim(FieldByName('IVA_con_Recargo_SN').AsString) )               or
                       ( Trim(Params.ParamByName('COPY_' + 'IVA_Excluido_SN').AsString)                  <> Trim(FieldByName('IVA_Excluido_SN').AsString) )                  or
                       ( Trim(Params.ParamByName('COPY_' + 'id_tarifas').AsString)                       <> Trim(FieldByName('id_tarifas').AsString) )                       or
                       ( Trim(Params.ParamByName('COPY_' + 'Descuento_Comercial_1').AsString)            <> Trim(FieldByName('Descuento_Comercial_1').AsString) )            or
                       ( Trim(Params.ParamByName('COPY_' + 'Descuento_Comercial_2').AsString)            <> Trim(FieldByName('Descuento_Comercial_2').AsString) )            or
                       ( Trim(Params.ParamByName('COPY_' + 'Descuento_Pronto_Pago').AsString)            <> Trim(FieldByName('Descuento_Pronto_Pago').AsString) )            or
                       ( Trim(Params.ParamByName('COPY_' + 'Descuento_Final').AsString)                  <> Trim(FieldByName('Descuento_Final').AsString) )                  or
                       ( Trim(Params.ParamByName('COPY_' + 'Retencion').AsString)                        <> Trim(FieldByName('Retencion').AsString) )                        or
                       ( Trim(Params.ParamByName('COPY_' + 'Riesgo_Autorizado').AsString)                <> Trim(FieldByName('Riesgo_Autorizado').AsString) )                or
                       ( Trim(Params.ParamByName('COPY_' + 'Riesgo_Acumulado').AsString)                 <> Trim(FieldByName('Riesgo_Acumulado').AsString) )                 or
                       ( Trim(Params.ParamByName('COPY_' + 'Agrupar_Albaranes_SN').AsString)             <> Trim(FieldByName('Agrupar_Albaranes_SN').AsString) )             or
                       ( Trim(Params.ParamByName('COPY_' + 'Activar_Proximidad_SN').AsString)            <> Trim(FieldByName('Activar_Proximidad_SN').AsString) )            or
                       ( Trim(Params.ParamByName('COPY_' + 'Cuenta_Contable').AsString)                  <> Trim(FieldByName('Cuenta_Contable').AsString) )                  or
                       ( Trim(Params.ParamByName('COPY_' + 'id_Agencias_Transporte').AsString)           <> Trim(FieldByName('id_Agencias_Transporte').AsString) )           or
                       ( Trim(Params.ParamByName('COPY_' + 'id_Representantes').AsString)                <> Trim(FieldByName('id_Representantes').AsString) )                or
                       ( Trim(Params.ParamByName('COPY_' + 'Observaciones_Comentarios').AsString)        <> Trim(FieldByName('Observaciones_Comentarios').AsString) )        or
                       ( Trim(Params.ParamByName('COPY_' + 'Estudia_SN').AsString)                       <> Trim(FieldByName('Estudia_SN').AsString) )                       or
                       ( Trim(Params.ParamByName('COPY_' + 'Trabaja_SN').AsString)                       <> Trim(FieldByName('Trabaja_SN').AsString) )                       or
                       ( Trim(Params.ParamByName('COPY_' + 'Estudios_Trabajos').AsString)                <> Trim(FieldByName('Estudios_Trabajos').AsString) )                or
                       ( Trim(Params.ParamByName('COPY_' + 'Cantidad_Hermanos').AsString)                <> Trim(FieldByName('Cantidad_Hermanos').AsString) )                then
                    begin
                        FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                        FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                        UTI_RGTRO_Grabar_Antes( 'clientes',
                                                SQLQuery_Clientes );
                    end else begin
                        Cancel;
                    end;
                end else begin
                    Cancel;
                end;

                form_alumnos_001.Free;

                UTI_RGTRO_UnLock( 'clientes',
                                  var_id );
            end;
        end else begin
            var_msg.Add(rs_no_Hay_Rgtros);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        end;
    end;

    var_msg.Free;
end;

procedure Tform_alumnos_000.Refrescar_Registros_Alb_Detalles;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
    var_id             : ShortString;
    var_ver_Bajas      : ShortInt;
begin
    // ********************************************************************************************* //
    // ** Solo si la cabecera está en modo EDIT se abren las tablas hijas                         ** //
    // ********************************************************************************************* //
    if SQLQuery_Clientes.State <> dsEdit then Exit;

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

    UTI_RGTRO_Add_to_Where( true,
                            var_Lineas_Filtro,
                            'ad.id_clientes = ' + SQLQuery_Clientes.FieldByName('id').AsString );

    UTI_RGTRO_Add_to_Where( false,
                            var_Lineas_Filtro,
                            'id_albaranes = 0' );

    var_ver_Bajas := RadioGroup_Bajas.ItemIndex;
    if UTI_GEN_Form_Abierto_Ya('form_alumnos_001') = true then
    begin
        var_ver_Bajas := form_alumnos_001.RadioGroup_Bajas.ItemIndex;
    end;

    Filtrar_Alb_Detalles( public_Last_Column_Alb_Detalles,
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
            SQLQuery_Alb_Detalles.Last;
        end else begin
            // ************************************************************************************* //
            // ** Estabamos en una edición, así que ya conocíamos la id del registro. Por lo que  ** //
            // ** hago el locate por esta id                                                      ** //
            // ************************************************************************************* //
            SQLQuery_Alb_Detalles.Locate('id', StrToInt64(var_id), []);
        end;

    end;
end;

procedure Tform_alumnos_000.SQLQuery_Alb_DetallesAfterPost(DataSet: TDataSet);
begin
    if private_Actualizado_Antes_de_Post = true then
    begin
        UTI_RGTRO_Grabar( 'albaranes_ventas_detalles',
                          DataModule_Clientes.SQLTransaction_Clientes_Alb_Detalles,
                          SQLQuery_Alb_Detalles );
    end;

    Refrescar_Registros_Alb_Detalles;
end;

procedure Tform_alumnos_000.SQLQuery_Alb_DetallesBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTRO_param_assign_value_Edit( SQLQuery_Alb_Detalles );
end;

function Tform_alumnos_000.Filtrar_clientes_periodos( param_Last_Column : TColumn;
                                                      param_ver_bajas : ShortInt;
                                                      param_Cambiamos_Filtro : Boolean;
                                                      param_Lineas_Filtro,
                                                      param_Lineas_OrderBy : TStrings ) : ShortInt;
var var_Registro_CRUD : TRegistro_CRUD;
    var_ctdad_Rgtros  : Integer;
begin
    var_Registro_CRUD := UTI_DATOS_TABLA_clientes_periodos_CRUD;
    var_ctdad_Rgtros  := -1;

    if Trim(param_Lineas_OrderBy.Text) = '' then
    begin
         param_Lineas_OrderBy.Text := private_Order_By_periodos[0].Memo_OrderBy;
    end;

    Result := UTI_TB_Filtrar( private_Order_By_periodos,

                              var_Registro_CRUD.Delete_SQL,
                              var_Registro_CRUD.Update_SQL,
                              var_Registro_CRUD.Insert_SQL,

                              var_ctdad_Rgtros,
                              DataModule_Clientes.SQLTransaction_Clientes_Periodos,
                              DataModule_Clientes.SQLConnector_Clientes_Periodos,
                              SQLQuery_Clientes_Periodos,

                              var_Registro_CRUD.name_tabla,
                              param_ver_bajas,

                              var_Registro_CRUD.SELECT_SQL,

                              param_Lineas_Filtro,
                              param_Lineas_OrderBy,
                              '',

                              param_Cambiamos_Filtro );

    UTI_GEN_Borrar_Imagen_Orden_Grid(param_Last_Column);
end;

procedure Tform_alumnos_000.Filtrar_Principal_Sin_Preguntar;
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

procedure Tform_alumnos_000.Boton_Elegir_Forma_PagoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Form( true, false, '', 80 );
    if var_Registro.id_1 <> '' then
    begin
         Edit_id_Forma_Pago.Text          := Trim(var_Registro.id_1);
         Edit_Descripcion_Forma_Pago.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_alumnos_000.Boton_Elegir_PaisClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Form( true, false, '', 60 );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_paises.Text        := Trim(var_Registro.id_1);
        Edit_Descripcion_Pais.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_alumnos_000.Boton_Elegir_PoblacionClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Form( true, false, '', 110 );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_poblaciones.Text        := Trim(var_Registro.id_1);
        Edit_Descripcion_Poblacion.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_alumnos_000.Boton_Elegir_ProvinciaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Form( true, false, '', 100 );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_provincias.Text         := Trim(var_Registro.id_1);
        Edit_Descripcion_Provincia.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_alumnos_000.ComboBox_FiltrosChange(Sender: TObject);
begin
    Memo_OrderBy.Lines.Clear;
    Memo_OrderBy.Lines.Add( private_Order_By[ComboBox_Filtros.ItemIndex].Memo_OrderBy );
    BitBtn_FiltrarClick(Nil);
end;

procedure Tform_alumnos_000.Edit_Descripcion_Forma_PagoClick(Sender: TObject);
begin
    Edit_id_Forma_Pago.Text          := '';
    Edit_Descripcion_Forma_Pago.Text := '';
end;

procedure Tform_alumnos_000.Edit_Descripcion_PaisClick(Sender: TObject);
begin
    Edit_id_paises.Text        := '';
    Edit_Descripcion_Pais.Text := '';
end;

procedure Tform_alumnos_000.Edit_Descripcion_PoblacionClick(Sender: TObject);
begin
    Edit_id_poblaciones.Text        := '';
    Edit_Descripcion_Poblacion.Text := '';
end;

procedure Tform_alumnos_000.Edit_Descripcion_ProvinciaClick(Sender: TObject);
begin
    Edit_id_provincias.Text         := '';
    Edit_Descripcion_Provincia.Text := '';
end;

procedure Tform_alumnos_000.SQLQuery_Alb_DetallesCalcFields(DataSet: TDataSet);
{
var var_Valores_Linea : TCalculo_Linea_Detalle;
    var_Calculo       : Extended;
}
begin
    UTI_LINEAS_Recalcular_Linea_Detalle( SQLQuery_Alb_Detalles,
                                         'N' );

    {
    with SQLQuery_Alb_Detalles do
    begin
        // ***************************************************************************************** //
        // ** Concepto a facturar                                                                 ** //
        // ***************************************************************************************** //
        if Trim(FieldByName('OT_descripcion_articulo').AsString) <> '' then
        begin
            FieldByName('OT_Concepto_Articulo').AsString := FieldByName('OT_descripcion_articulo').AsString;
        end else begin
            FieldByName('OT_Concepto_Articulo').AsString := FieldByName('descripcion_para_TPV').AsString;
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
        var_Valores_Linea := UTI_VENTAS_Calculo_de_Linea_Detalle(form_alumnos_000.SQLQuery_Alb_Detalles);

        var_Calculo := (    (  var_Valores_Linea.Unidades_por_Precio -
                               var_Valores_Linea.Dto_1  ) -
                            var_Valores_Linea.Dto_2    ) + var_Valores_Linea.Impuestos;

        FieldByName('OT_para_Cobrar').Value := var_Calculo;

        // ***************************************************************************************** //
        // ** Solo si se puso un precio fijo se cambia este importe por el calculado              ** //
        // ***************************************************************************************** //
        if not FieldByName('PVP_Manual_Final').IsNull then
        begin
            FieldByName('OT_para_Cobrar').Value := FieldByName('PVP_Manual_Final').Value;
        end;
    end;
    }
end;

function Tform_alumnos_000.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
var var_Registro_CRUD : TRegistro_CRUD;
    var_ctdad_Rgtros  : Integer;
    var_a_Filtrar     : TStrings;
begin
    var_a_Filtrar := TStringList.Create;
    var_a_Filtrar.Clear;

    var_ctdad_Rgtros := -1;

    // ********************************************************************************************* //
    // ** Ahora intentaremos la select                                                            ** //
    // ********************************************************************************************* //
    if RadioButton_Periodo_Todos.Checked = true then
    begin
        var_Registro_CRUD := UTI_DATOS_TABLA_alumnos_CRUD(0);
    end else begin
        var_Registro_CRUD := UTI_DATOS_TABLA_alumnos_CRUD(1);

        // ***************************************************************************************** //
        // ** Aqui le añadimos el filtro para que devuelva sólo aquellos alumnos en el que su pe- ** //
        // ** riodo esté incluida la fecha actual y que por supuesto no esté borrado el periodo   ** //
        // ***************************************************************************************** //
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'cp.Inicio <= ' +
                                UTI_GEN_Comillas(UTI_GEN_Format_Fecha_Hora(Date, false) + ' 00:00:00') );

        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'cp.Fin >= ' +
                                UTI_GEN_Comillas(UTI_GEN_Format_Fecha_Hora(Date, false) + ' 23:59:59') );

        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'cp.Del_WHEN IS NULL' );
    end;

    // ********************************************************************************************* //
    // ** AHORA PONDREMOS EL RESTO DE LOS FILTROS QUE NO SON GENERALES                            ** //
    // ********************************************************************************************* //
    // ** Primero buscaremos en el nombre y apellido el texto a buscar                              ** //
    // ********************************************************************************************* //
    if Trim(Edit_Alumno.Text) <> '' then
    begin
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                '(' +
                                      'cl.nombre_propietario LIKE ' +
                                      UTI_GEN_Comillas('%' + Trim(Edit_Alumno.Text) + '%') +
                                ' OR ' +
                                      'cl.nombre_comercial LIKE ' +
                                      UTI_GEN_Comillas('%' + Trim(Edit_Alumno.Text) + '%') +
                                ')' );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos en el NIF                                                              ** //
    // ********************************************************************************************* //
    if Trim(Edit_NIF.Text) <> '' then
    begin
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'cl.nif_cif LIKE ' +
                                UTI_GEN_Comillas('%' + Trim(Edit_NIF.Text) + '%')  );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la fecha de nacimiento                                             ** //
    // ********************************************************************************************* //
    if (not DateTimePicker_Nacido_Hasta.DateIsNull) and
       (not DateTimePicker_Nacido_Desde.DateIsNull) then
    begin
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'cl.Fecha_Nacimiento <= ' +
                                UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Nacido_Hasta.Date, false) +
                                                  ' 23:59:59' ) );
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'cl.Fecha_Nacimiento >= ' +
                                UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Nacido_Desde.Date, false) +
                                                  ' 00:00:00' ) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la forma de pago                                                   ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Forma_Pago.Text) <> '' then
    begin
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'cl.id_formas_pago = ' + Trim(Edit_id_Forma_Pago.Text) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la población                                                       ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_poblaciones.Text) <> '' then
    begin
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'cl.id_poblaciones = ' + Trim(Edit_id_poblaciones.Text) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la provincia                                                       ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_provincias.Text) <> '' then
    begin
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'cl.id_provincias = ' + Trim(Edit_id_provincias.Text) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por el pais                                                            ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_paises.Text) <> '' then
    begin
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'cl.id_paises = ' + Trim(Edit_id_paises.Text) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la id del alumno ... esto solo si se llama desde recibos           ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Alumno_Rcbo.Text) <> '' then
    begin
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'cl.id = ' + Trim(Edit_id_Alumno_Rcbo.Text) );
    end;

    // ********************************************************************************************* //
    // ** Pasamos a filtrar los registros                                                         ** //
    // ********************************************************************************************* //
    Result := UTI_TB_Filtrar( private_Order_By,

                              var_Registro_CRUD.Delete_SQL,
                              var_Registro_CRUD.Update_SQL,
                              var_Registro_CRUD.Insert_SQL,

                              var_ctdad_Rgtros,
                              DataModule_Clientes.SQLTransaction_Clientes,
                              DataModule_Clientes.SQLConnector_Clientes,
                              SQLQuery_Clientes,

                              var_Registro_CRUD.name_tabla,
                              RadioGroup_Bajas.ItemIndex,

                              var_Registro_CRUD.SELECT_SQL,

                              Memo_Filtros.Lines,
                              Memo_OrderBy.Lines,
                              var_a_Filtrar.Text,

                              param_Cambiamos_Filtro );

    UTI_GEN_Borrar_Imagen_Orden_Grid(private_Last_Column);


    var_a_Filtrar.Free;

    //Filtrar_tablas_ligadas;
end;

procedure Tform_alumnos_000.SQLQuery_Alb_DetallesBeforePost(DataSet: TDataSet);
var var_Se_Actualizo_Stock : ShortInt;
begin
    var_Se_Actualizo_Stock := UTI_STOCK_Se_Actualizo_Stock( 'S',
                                                            SQLQuery_Alb_Detalles,
                                                            SQLQuery_Alb_Detalles );
    if var_Se_Actualizo_Stock > 0 then
    begin
        // ***************************************************************************************** //
        // ** Era necesario actualizar el stock, así que comprobamos si se consiguió actualizarlo ** //
        // ***************************************************************************************** //
        if var_Se_Actualizo_Stock = 2 then
        begin
            // ************************************************************************************* //
            // ** Se consiguió actualizar el stock, por lo que se graban las modificaciones de la ** //
            // ** línea de detalle                                                                ** //
            // ************************************************************************************* //
            private_Actualizado_Antes_de_Post := true;
            UTI_RGTRO_param_assign_value( SQLQuery_Alb_Detalles );
        end else begin
            // ************************************************************************************* //
            // ** Se produjo un error en la actualización del stock. No se grabara/actualizara el ** //
            // ** registro al que pertenece el SQLQuery                                           ** //
            // ************************************************************************************* //
            private_Actualizado_Antes_de_Post := false;
            SQLQuery_Alb_Detalles.Cancel;
        end;
    end else begin
        // ***************************************************************************************** //
        // ** No hizo falta actualizar el stock, así que usamos el método tradicional del commit  ** //
        // ***************************************************************************************** //
        private_Actualizado_Antes_de_Post := true;
        UTI_RGTRO_param_assign_value( SQLQuery_Alb_Detalles );
    end;
end;

end.


