unit articulos_001;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ButtonPanel, ExtCtrls, Buttons,
    utilidades_general, utilidades_forms_Filtrar, utilidades_usuarios, StdCtrls, DbCtrls, ComCtrls,
    utilidades_bd, sqldb, utilidades_rgtro, DBGrids, Grids, utilidades_datos_tablas,
    utilidades_contabilidad, LCLTranslator;

resourcestring
  rs_Comprobar_PVP_1 = '* El PVP o el PVP CON IMPUESTOS INCLUIDOS, uno de ellos es obligado.';
  rs_Comprobar_PVP_2 = '* El artículo o tiene PVP o tiene PVP CON IMPUESTOS INCLUIDOS, no ambos.';

  rs_FormClose_x1  = '* La descripción.';
  rs_FormClose_x2  = '* La descripción para la terminal/TPV, por que la descripción es mayor de 50 caracteres.';
  rs_FormClose_3  = '* La familia de articulos.';
  rs_FormClose_4  = '* Si es un articulo combinado.';
  rs_FormClose_5  = '* El impuesto para la venta.';
  rs_FormClose_5_1 = '* El impuesto para la compra.';
  rs_FormClose_6  = '* Visualizar en terminales. ¿Si/no?.';
  rs_FormClose_7  = '* Ventas por peso. ¿Si/no?.';
  rs_FormClose_8  = '* Artículo compuesto. ¿Si/no?.';
  rs_FormClose_9  = '* Activar proporciones. ¿Si/no?.';
  rs_FormClose_10 = '* Agregar a favoritos. ¿Si/no?.';
  rs_FormClose_11 = '* Pedir el precio de venta. ¿Si/no?.';
  rs_FormClose_13 = '* El tipo de artículo.';
  rs_FormClose_14 = '* El TIEMPO ASIGNADO.';
  rs_FormClose_15 = 'LA CUENTA CONTABLE DE VENTAS';
  rs_FormClose_16 = 'LA CUENTA CONTABLE DE COMPRAS';

  rs_Quitamos_1 = '¿QUITAMOS la FAMILIA a la que pertenece?';
  rs_Quitamos_2 = '¿QUITAMOS el IMPUESTO para VENTAS?';
  rs_Quitamos_3 = '¿QUITAMOS el IMPUESTO para VENTAS?';
  rs_Quitamos_4 = '¿QUITAMOS el PROVEEDOR?';
  rs_Quitamos_5 = '¿QUITAMOS el GRUPO DE COCINA al que pertenece?';
  rs_Quitamos_6 = '¿QUITAMOS la IMPRESORA DE COMANDAS?';
  rs_Quitamos_7 = '¿QUITAMOS la FAMILIA A COMBINAR?';

  rs_Existe_articulo_Composicion_Ya_1 = 'Error al comprobar si la composición existe ya para el articulo.';
  rs_Existe_articulo_Composicion_Ya_2 = 'La tabla ha sido ';
  rs_Existe_articulo_Composicion_Ya_3 = ' desde el módulo ';

  rs_Existe_articulo_Referencia_Ya_1 = 'Error al comprobar si la referencia existe ya para el articulo.';
  rs_Existe_articulo_Referencia_Ya_2 = 'La tabla ha sido ';
  rs_Existe_articulo_Referencia_Ya_3 = ' desde el módulo ';

  rs_Error = 'ERROR ... ';

  rs_Editar_Registro_Tarifas_1 = 'Tarifa repetida.';

  rs_Editar_Registro_Terminales_1 = 'Terminal repetida.';

  rs_Referencia_Repetida = 'Referencia repetida para este artículo.';

  rs_Insertar_Registro_Composiciones_1 = 'Composición repetida para este artículo.';

  rs_Editar_Registro_Composiciones_1 = 'Composición repetida para este artículo.';

  rs_Insertar_Registro_Proporciones_1 = 'Proporción repetida para este artículo.';

  rs_Editar_Registro_Proporciones_1 = 'Proporción repetida para este artículo.';

  rs_Editar_Registro_Stock_1 = 'Stock de artículo repetido.';

type

    { Tform_articulos_001 }

    Tform_articulos_001 = class(TForm)
      BitBtn_Ver_Factura_Compras: TBitBtn;
      BitBtn_Ver_Albaran_Compras: TBitBtn;
      BitBtn_Ver_Factura_Ventas: TBitBtn;
      BitBtn_Ver_Albaran_Ventas: TBitBtn;
      BitBtn_Ver_Situacion_Registro_Composiciones: TBitBtn;
      BitBtn_Ver_Situacion_Registro_Proporciones: TBitBtn;
        BitBtn_Ver_Situacion_Registro_Tarifas: TBitBtn;
        BitBtn_Ver_Situacion_Registro_Stock: TBitBtn;
        BitBtn_Ver_Situacion_Registro_Tarifas1: TBitBtn;
        BitBtn_Ver_Situacion_Registro_Terminales: TBitBtn;
        BitBtn_Ver_Situacion_Registro_Referencias: TBitBtn;
        Boton_Elegir_Familia: TBitBtn;
        Boton_Elegir_Familia_Combinar: TBitBtn;
        Boton_Elegir_Impresora: TBitBtn;
        Boton_Elegir_Impto_Ventas: TBitBtn;
        Boton_Elegir_Impto_Compras: TBitBtn;
        Boton_Elegir_Proveedor: TBitBtn;
        Boton_Elegir_Provincia1: TBitBtn;
        Boton_Grupo_Cocina: TBitBtn;
        ButtonPanel1: TButtonPanel;
        DBCheckBox_Activar_Proporciones_SN: TDBCheckBox;
        DBCheckBox_Articulo_Compuesto_SN: TDBCheckBox;
        DBCheckBox_Pedir_precio_venta: TDBCheckBox;
        DBCheckBox_Agregar_a_favoritos: TDBCheckBox;
        DBCheckBox_Vencimientos_automaticos_SN: TDBCheckBox;
        DBCheckBox_Ventas_por_peso: TDBCheckBox;
        DBCheckBox_Ventas_por_peso1: TDBCheckBox;
        DBEdit_Comision: TDBEdit;
        DBEdit_Cuenta_Contable_Compras: TDBEdit;
        DBEdit_Cuenta_Contable_Ventas: TDBEdit;
        DBEdit_Descripcion_para_terminal: TDBEdit;
        DBEdit_eMail1: TDBEdit;
        DBEdit_eMail11: TDBEdit;
        DBEdit_eMail12: TDBEdit;
        DBEdit_Tarifa_Elegida_Proporciones: TDBEdit;
        DBEdit_eMail2: TDBEdit;
        DBEdit_eMail3: TDBEdit;
        DBEdit_eMail5: TDBEdit;
        DBEdit_eMail6: TDBEdit;
        DBEdit_eMail8: TDBEdit;
        DBEdit_eMail9: TDBEdit;
        DBEdit_Minima_Variacion: TDBEdit;
        DBEdit_Minima_Variacion1: TDBEdit;
        DBEdit_Peso: TDBEdit;
        DBEdit_PVP: TDBEdit;
        DBEdit_PVP_con_Impuestos: TDBEdit;
        DBEdit_Repetir_Cada: TDBEdit;
        DBEdit_Tiempo_Asignado: TDBEdit;
        DBEdit_Volumen: TDBEdit;
        DBGrid_Composiciones: TDBGrid;
        DBGrid_Facturas_Ventas: TDBGrid;
        DBGrid_Albaranes_Ventas_sin_Facturar: TDBGrid;
        DBGrid_Facturas_Compras: TDBGrid;
        DBGrid_Albaranes_Compras_sin_Facturar: TDBGrid;
        DBGrid_Proporciones: TDBGrid;
        DBGrid_Tarifas: TDBGrid;
        DBGrid_Stock: TDBGrid;
        DBGrid_Tarifas_Proporciones: TDBGrid;
        DBGrid_Terminales: TDBGrid;
        DBGrid_Referencias: TDBGrid;
        DBMemo_Descripcion: TDBMemo;
        DBNavigator_Composiciones: TDBNavigator;
        DBNavigator_Proporciones: TDBNavigator;
        DBNavigator_Facturas_Ventas: TDBNavigator;
        DBNavigator_Albaranes_Ventas_sin_Facturar: TDBNavigator;
        DBNavigator_Facturas_Compras: TDBNavigator;
        DBNavigator_Albaranes_Compras_sin_Facturar: TDBNavigator;
        DBNavigator_Tarifas: TDBNavigator;
        DBNavigator_Stock: TDBNavigator;
        DBNavigator_Tarifas_Proporciones: TDBNavigator;
        DBNavigator_Terminales: TDBNavigator;
        DBNavigator_Referencias: TDBNavigator;
        DBRadioGroup_Combinado: TDBRadioGroup;
        DBRadioGroup_Tipo_Articulo: TDBRadioGroup;
        Edit_Composicion_Total1: TEdit;
        Edit_Compra_Ultima_Fecha: TEdit;
        Edit_Compra_Ultima_Fecha_Proporciones: TEdit;
        Edit_Compra_Ultimo_Precio: TEdit;
        Edit_Compra_Ultimo_Precio_Proporciones: TEdit;
        Edit_Ctdad_Facturas_Compras_a_Ver: TEdit;
        Edit_Ctdad_Albaranes_Compras_sin_Facturar_a_Ver: TEdit;
        Edit_Ctdad_Facturas_Ventas_a_Ver: TEdit;
        Edit_Ctdad_Albaranes_Ventas_sin_Facturar_a_Ver: TEdit;
        Edit_Descripcion_Familia: TEdit;
        Edit_Descripcion_Familia_Combinar: TEdit;
        Edit_id_Descripcion_Familia_Combinar: TEdit;
        Edit_Descripcion_Grupo_Cocina: TEdit;
        Edit_Descripcion_Impresora_comandas: TEdit;
        Edit_Descripcion_Impto_Ventas: TEdit;
        Edit_Descripcion_Impto_Compras: TEdit;
        Edit_Descripcion_Proveedor: TEdit;
        Edit_Composicion_Total: TEdit;
        GroupBox_PVP_si_cliente_sin_tarifa: TGroupBox;
        GroupBox_Comision_x_Venta: TGroupBox;
        GroupBox_Es_un_Servicio: TGroupBox;
        GroupBox_Cocina: TGroupBox;
        GroupBox_Cubicaje: TGroupBox;
        GroupBox_Cuentas_Contables: TGroupBox;
        GroupBox11: TGroupBox;
        Label1: TLabel;
        Label10: TLabel;
        Label102: TLabel;
        Label103: TLabel;
        Label104: TLabel;
        Label105: TLabel;
        Label11: TLabel;
        Label12: TLabel;
        Label13: TLabel;
        Label15: TLabel;
        Label16: TLabel;
        Label17: TLabel;
        Label18: TLabel;
        Label19: TLabel;
        Label2: TLabel;
        Label21: TLabel;
        Label22: TLabel;
        Label23: TLabel;
        Label24: TLabel;
        Label25: TLabel;
        Label26: TLabel;
        Label27: TLabel;
        Label3: TLabel;
        Label30: TLabel;
        Label31: TLabel;
        Label32: TLabel;
        Label33: TLabel;
        Label34: TLabel;
        Label4: TLabel;
        Label5: TLabel;
        Label51: TLabel;
        Label52: TLabel;
        Label53: TLabel;
        Label54: TLabel;
        Label55: TLabel;
        Label56: TLabel;
        Label57: TLabel;
        Label58: TLabel;
        Label59: TLabel;
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
        Label70: TLabel;
        Label71: TLabel;
        Label72: TLabel;
        Label73: TLabel;
        Label74: TLabel;
        Label76: TLabel;
        Label77: TLabel;
        Label79: TLabel;
        Label80: TLabel;
        Label82: TLabel;
        Label83: TLabel;
        Label84: TLabel;
        Label85: TLabel;
        Label86: TLabel;
        Label87: TLabel;
        Label88: TLabel;
        Label89: TLabel;
        Label90: TLabel;
        Label91: TLabel;
        Label92: TLabel;
        Label93: TLabel;
        Label94: TLabel;
        Label_Repetir_Cada_2: TLabel;
        Label_Tiempo_Asignado_1: TLabel;
        Label_Tiempo_Asignado_2: TLabel;
        Label_Tiempo_Asignado_3: TLabel;
        Label_Tiempo_Asignado_4: TLabel;
        PageControl_Composiciones_Proporciones: TPageControl;
        PageControl_Otros_Datos: TPageControl;
        PageControl_Ventas: TPageControl;
        PageControl_Compras: TPageControl;
        PageControl_Ventas2: TPageControl;
        Panel1: TPanel;
        Panel_Minima_Variacion_Incremento: TPanel;
        Panel5: TPanel;
        RadioGroup_Bajas: TRadioGroup;
        Shape1: TShape;
        Shape10: TShape;
        Shape11: TShape;
        Shape12: TShape;
        Shape13: TShape;
        Shape14: TShape;
        Shape15: TShape;
        Shape16: TShape;
        Shape17: TShape;
        Shape18: TShape;
        Shape19: TShape;
        Shape2: TShape;
        Shape20: TShape;
        Shape21: TShape;
        Shape22: TShape;
        Shape23: TShape;
        Shape3: TShape;
        Shape4: TShape;
        Shape5: TShape;
        Shape6: TShape;
        Shape7: TShape;
        Shape8: TShape;
        Shape9: TShape;
        TabSheet_Stock_Almacenes: TTabSheet;
        TabSheet10: TTabSheet;
        TabSheet_Compras_Realizadas: TTabSheet;
        TabSheet3: TTabSheet;
        TabSheet_Ventas_Ultimos_Albaranes: TTabSheet;
        TabSheet_Ventas_Ultimas_Facturas: TTabSheet;
        TabSheet_Compras_Ultimas_Facturas: TTabSheet;
        TabSheet_Compras_Ultimos_Albaranes: TTabSheet;
        TabSheet_Ventas_Tarifas: TTabSheet;
        TabSheet_Informacion_Adicional: TTabSheet;
        TabSheet_Composiciones: TTabSheet;
        TabSheet_Composiciones_Proporciones: TTabSheet;
        TabSheet_Proporciones: TTabSheet;

        procedure Validacion( param_msg : TStrings );
        procedure Poner_Ultima_Compra;
        procedure Activar_Proporciones_SN;
        procedure Activar_Composiciones_SN;
        procedure BitBtn_Ver_Albaran_ComprasClick(Sender: TObject);
        procedure BitBtn_Ver_Albaran_VentasClick(Sender: TObject);
        procedure BitBtn_Ver_Factura_ComprasClick(Sender: TObject);
        procedure BitBtn_Ver_Factura_VentasClick(Sender: TObject);
        procedure DBCheckBox_Activar_Proporciones_SNChange(Sender: TObject);
        procedure DBCheckBox_Articulo_Compuesto_SNChange(Sender: TObject);
        procedure DBGrid_Albaranes_Compras_sin_FacturarDblClick(Sender: TObject);
        procedure DBGrid_Albaranes_Compras_sin_FacturarKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure DBGrid_Albaranes_Ventas_sin_FacturarDblClick(Sender: TObject);
        procedure DBGrid_Albaranes_Ventas_sin_FacturarKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure DBGrid_Facturas_ComprasDblClick(Sender: TObject);
        procedure DBGrid_Facturas_ComprasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure DBGrid_Facturas_VentasDblClick(Sender: TObject);
        procedure DBGrid_Facturas_VentasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure DBNavigator_Albaranes_Compras_sin_FacturarBeforeAction(Sender: TObject;Button: TDBNavButtonType);
        procedure DBNavigator_Albaranes_Ventas_sin_FacturarBeforeAction(Sender: TObject; Button: TDBNavButtonType);
        procedure DBNavigator_Facturas_ComprasBeforeAction(Sender: TObject;Button: TDBNavButtonType);
        procedure DBNavigator_Facturas_VentasBeforeAction(Sender: TObject; Button: TDBNavButtonType);
        procedure Insertar_Registro_Referencias;
        procedure Editar_Registro_Referencias;
        procedure Borrar_Registro_Referencias;
        procedure BitBtn_Ver_Situacion_Registro_ReferenciasClick(Sender: TObject);
        procedure Borrar_Registro_Proporciones;
        procedure Borrar_Registro_Composiciones;
        procedure DBGrid_ReferenciasDblClick(Sender: TObject);
        procedure DBGrid_ReferenciasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
        procedure DBGrid_ReferenciasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure DBNavigator_ReferenciasBeforeAction(Sender: TObject; Button: TDBNavButtonType);
        procedure Editar_Registro_Stock;
        procedure BitBtn_Ver_Situacion_Registro_StockClick(Sender: TObject);
        function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
        procedure DBGrid_StockDblClick(Sender: TObject);
        procedure DBGrid_StockDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
        procedure DBGrid_StockKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure DBNavigator_StockBeforeAction(Sender: TObject; Button: TDBNavButtonType);
        procedure Editar_Registro_Proporciones;
        procedure Editar_Registro_Composiciones;
        procedure Editar_Registro_Terminales;
        procedure Editar_Registro_Tarifas;

        procedure DBGrid_ComposicionesDblClick(Sender: TObject);
        procedure DBGrid_ComposicionesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
        procedure DBGrid_ComposicionesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure DBGrid_ProporcionesDblClick(Sender: TObject);
        procedure DBGrid_ProporcionesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
        procedure DBGrid_ProporcionesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure Insertar_Registro_Proporciones;

        procedure Insertar_Registro_Composiciones;
        procedure BitBtn_Ver_Situacion_Registro_ComposicionesClick(Sender: TObject);
        procedure BitBtn_Ver_Situacion_Registro_ProporcionesClick(Sender: TObject);
        procedure Boton_Elegir_Familia_CombinarClick(Sender: TObject);
        procedure Boton_Elegir_ImpresoraClick(Sender: TObject);
        procedure Boton_Elegir_Impto_ComprasClick(Sender: TObject);
        procedure Boton_Elegir_Impto_VentasClick(Sender: TObject);
        procedure Boton_Elegir_ProveedorClick(Sender: TObject);
        procedure Boton_Grupo_CocinaClick(Sender: TObject);
        procedure DBNavigator_ComposicionesBeforeAction(Sender: TObject; Button: TDBNavButtonType);
        procedure DBNavigator_ProporcionesBeforeAction(Sender: TObject; Button: TDBNavButtonType);
        procedure Edit_Descripcion_Familia_CombinarClick(Sender: TObject);
        procedure Edit_Descripcion_Grupo_CocinaClick(Sender: TObject);
        procedure Edit_Descripcion_Impresora_comandasClick(Sender: TObject);
        procedure Edit_Descripcion_Impto_ComprasClick(Sender: TObject);
        procedure Edit_Descripcion_Impto_VentasClick(Sender: TObject);
        procedure Edit_Descripcion_ProveedorClick(Sender: TObject);
        procedure Boton_Elegir_FamiliaClick(Sender: TObject);
        procedure Edit_Descripcion_FamiliaClick(Sender: TObject);
        procedure no_Tocar;
        procedure Comprobar_PVP(param_msg : TStrings);
        procedure DBGrid_TarifasDblClick(Sender: TObject);
        procedure DBGrid_TarifasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
        procedure DBGrid_TarifasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure DBGrid_TerminalesDblClick(Sender: TObject);
        procedure DBGrid_TerminalesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
        procedure DBGrid_TerminalesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure DBNavigator_TarifasBeforeAction(Sender: TObject; Button: TDBNavButtonType);
        procedure DBNavigator_TerminalesBeforeAction(Sender: TObject; Button: TDBNavButtonType);
        procedure Presentar_Datos;
        procedure Mostrar_Es_un_Servicio_SN;
        procedure BitBtn_Ver_Situacion_Registro_TarifasClick(Sender: TObject);
        procedure BitBtn_Ver_Situacion_Registro_TerminalesClick(Sender: TObject);
        procedure DBRadioGroup_Tipo_ArticuloChange(Sender: TObject);
        procedure RadioGroup_BajasClick(Sender: TObject);
        procedure Refrescar_Registros;
        procedure CancelButtonClick(Sender: TObject);
        procedure OKButtonClick(Sender: TObject);
        procedure para_Empezar;
        procedure FormActivate(Sender: TObject);
        procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
        procedure FormCreate(Sender: TObject);

    private
        { private declarations }
        private_Salir_OK                  : Boolean;
        private_Cta_Ctble_elegida_Ventas  : String;
        private_Cta_Ctble_elegida_Compras : String;

        function Traer_Articulos_Familias_xID( param_id : ShortString ) : Tarticulos_familias;
    public
        { public declarations }
        public_Solo_Ver      : Boolean;
        public_Menu_Worked   : Integer;
        public_Pulso_Aceptar : Boolean;
        public_Record_Rgtro  : TRecord_Rgtro_Comun;
    end;

var
    form_articulos_001: Tform_articulos_001;

implementation

{$R *.lfm}

uses menu, articulos_000, articulos_002, articulos_003, articulos_004, articulos_005, articulos_008,
     articulos_009, albaranes_compras_000, albaranes_ventas_000, facturas_compras_000,
     facturas_ventas_000;

{ Tform_articulos_001 }

procedure Tform_articulos_001.FormCreate(Sender: TObject);
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
    // ** Solo para este formulario                                                               ** //
    // ********************************************************************************************* //
    GroupBox_Cocina.Visible := false;
    form_Menu.Traer_Configuracion_APP;
    if UpperCase(Trim(form_menu.public_User_Configuracion.Trabajar_Grupos_Cocina_SN)) = 'S' then
    begin
        GroupBox_Cocina.Visible := true;
    end;

    private_Cta_Ctble_elegida_Ventas  := Trim(form_articulos_000.SQLQuery_Articulos.FieldByName('OT_Cuenta_Contable_articulo_Ventas').AsString);
    private_Cta_Ctble_elegida_Compras := Trim(form_articulos_000.SQLQuery_Articulos.FieldByName('OT_Cuenta_Contable_articulo_Compras').AsString);

    Edit_Ctdad_Albaranes_Compras_sin_Facturar_a_Ver.Text := form_Articulos_000.public_Ctdad_Rgistros_a_Ver;
    Edit_Ctdad_Albaranes_Ventas_sin_Facturar_a_Ver.Text  := form_Articulos_000.public_Ctdad_Rgistros_a_Ver;
    Edit_Ctdad_Facturas_Ventas_a_Ver.Text   := form_Articulos_000.public_Ctdad_Rgistros_a_Ver;
    Edit_Ctdad_Facturas_Compras_a_Ver.Text  := form_Articulos_000.public_Ctdad_Rgistros_a_Ver;
end;

procedure Tform_articulos_001.para_Empezar;
begin
    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    with form_articulos_000.SQLQuery_Articulos do
    begin
        public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                           '',
                                                           '',

                                                           FieldByName('descripcion').AsString,
                                                           FieldByName('descripcion_para_TPV').AsString,
                                                           '' );
    end;

    Presentar_Datos;

    // ********************************************************************************************* //
    // ** SOLO PARA ESTE FORM                                                                     ** //
    // ********************************************************************************************* //
    PageControl_Otros_Datos.ActivePage                := TabSheet_Informacion_Adicional;
    PageControl_Compras.ActivePage                    := TabSheet_Compras_Ultimas_Facturas;
    PageControl_Ventas.ActivePage                     := TabSheet_Ventas_Tarifas;
    PageControl_Composiciones_Proporciones.ActivePage := TabSheet_Composiciones;

    Poner_Ultima_Compra;
    form_articulos_000.Calcular_Composicion_Total_Coste;

    Activar_Composiciones_SN;
    Activar_Proporciones_SN;
end;

procedure Tform_articulos_001.Poner_Ultima_Compra;
begin
    Edit_Compra_Ultima_Fecha.Text               := form_articulos_000.public_Compra_Ultima_Fecha;
    Edit_Compra_Ultimo_Precio.Text              := form_articulos_000.public_Compra_Ultimo_Precio;

    Edit_Compra_Ultima_Fecha_Proporciones.Text  := form_articulos_000.public_Compra_Ultima_Fecha;
    Edit_Compra_Ultimo_Precio_Proporciones.Text := form_articulos_000.public_Compra_Ultimo_Precio;
end;

procedure Tform_articulos_001.DBGrid_TarifasDblClick(Sender: TObject);
begin
    Editar_Registro_Tarifas;
end;

procedure Tform_articulos_001.DBGrid_TarifasDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
var var_Color_Normal : TColor;
begin
    with Sender as TDBGrid do
    begin
        if form_articulos_000.SQLQuery_Articulos_Tarifas.RecordCount = 0 then Exit;

        var_Color_Normal := Canvas.Brush.Color;

      { ************************************************************************
        Primero comprobamos si es un registro dado de baja o no
        ************************************************************************ }
        if not form_articulos_000.SQLQuery_Articulos_Tarifas.FieldByName('Del_WHEN').IsNull then
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
                    if Trim(form_articulos_000.SQLQuery_Articulos_Tarifas.FieldByName('id_medio').asString) = '1' then
                    begin
                        Canvas.StretchDraw(param_Rect, Image_Confirmado.Picture.Graphic);
                    end;
                    }
                end;
            end;

        Canvas.Font.Color := var_Color_Normal;
    end;
end;

procedure Tform_articulos_001.DBGrid_TarifasKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then Editar_Registro_Tarifas;
end;

procedure Tform_articulos_001.DBGrid_TerminalesDblClick(Sender: TObject);
begin
    Editar_Registro_Terminales;
end;

procedure Tform_articulos_001.DBGrid_TerminalesKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then Editar_Registro_Terminales;
end;

procedure Tform_articulos_001.DBNavigator_TarifasBeforeAction(Sender: TObject;
    Button: TDBNavButtonType);
begin
    case Button of
        nbInsert : begin
            // ************************************************************************************* //
            // ** No hace falta insertar porque se insertan automáticamente en el momento que se  ** //
            // ** crea una nueva tarifa, incluso cuando se borra la tarifa, también se borra auto-** //
            // ** máticamente en familias de articulos y articulos                                ** //
            // ************************************************************************************* //
            Abort;
        end;

        nbEdit : begin
            Editar_Registro_Tarifas;
            Abort;
        end;

        nbDelete : begin
            // ************************************************************************************* //
            // ** No hace falta borrar porque se borran automáticamente en el momento se borra la ** //
            // ** tarifa, desde el mantenimiento de tarifas                                       ** //
            // ************************************************************************************* //
            Abort;
        end;

        nbRefresh : begin
            form_articulos_000.Refrescar_Registros_Tarifas;
            Abort;
        end;
    end;
end;

procedure Tform_articulos_001.DBNavigator_TerminalesBeforeAction(Sender: TObject;
    Button: TDBNavButtonType);
begin
    case Button of
        nbInsert : begin
            // ************************************************************************************* //
            // ** No hace falta insertar porque se insertan automáticamente en el momento que se  ** //
            // ** crea una nueva terminal, incluso cuando se borra la terminal, también se borra  ** //
            // automáticamente en familias de articulos y articulos                               ** //
            // ************************************************************************************* //
            Abort;
        end;

        nbEdit : begin
            Editar_Registro_Terminales;
            Abort;
        end;

        nbDelete : begin
            // ************************************************************************************* //
            // ** No hace falta borrar porque se borran automáticamente en el momento se borra la ** //
            // ** terminal, desde el mantenimiento de terminales                                  ** //
            // ************************************************************************************* //
            Abort;
        end;

        nbRefresh : begin
            form_articulos_000.Refrescar_Registros_Terminales;
            Abort;
        end;
    end;
end;

procedure Tform_articulos_001.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := true;
end;

procedure Tform_articulos_001.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := false;
end;

procedure Tform_articulos_001.Refrescar_Registros;
begin
    form_articulos_000.Refrescar_Registros_Terminales;
    form_articulos_000.Refrescar_Registros_Tarifas;
    form_articulos_000.Refrescar_Registros_Composiciones;
    form_articulos_000.Refrescar_Registros_Proporciones;
    // form_articulos_000.Refrescar_Registros_Proporciones_Tarifas;
end;

procedure Tform_articulos_001.RadioGroup_BajasClick(Sender: TObject);
begin
    //UTI_TB_Ver_Bajas_SN('um', Memo_Filtros.Lines, RadioGroup_Bajas.ItemIndex);
    Refrescar_Registros;
end;

procedure Tform_articulos_001.BitBtn_Ver_Situacion_Registro_TarifasClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if form_articulos_000.SQLQuery_Articulos_Tarifas.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'articulos_tarifas',
                                           form_articulos_000.SQLQuery_Articulos_Tarifas,
                                           form_articulos_000.DataSource_Art_Tarifas,
                                           DBGrid_Tarifas );
        end;
    end;
end;

procedure Tform_articulos_001.BitBtn_Ver_Situacion_Registro_TerminalesClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if form_articulos_000.SQLQuery_Articulos_Terminales.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'articulos_terminales',
                                           form_articulos_000.SQLQuery_Articulos_Terminales,
                                           form_articulos_000.DataSource_Art_Terminales,
                                           DBGrid_Terminales );
        end;
    end;
end;

procedure Tform_articulos_001.BitBtn_Ver_Situacion_Registro_ComposicionesClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if form_articulos_000.SQLQuery_Articulos_Composiciones.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'articulos_composiciones',
                                           form_articulos_000.SQLQuery_Articulos_Composiciones,
                                           form_articulos_000.DataSource_Art_Composiciones,
                                           DBGrid_Composiciones );
        end;
    end;
end;

procedure Tform_articulos_001.BitBtn_Ver_Situacion_Registro_ProporcionesClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if form_articulos_000.SQLQuery_Articulos_Proporciones.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'articulos_proporciones',
                                           form_articulos_000.SQLQuery_Articulos_Proporciones,
                                           form_articulos_000.DataSource_Art_Proporciones,
                                           DBGrid_Proporciones );
        end;
    end;
end;

procedure Tform_articulos_001.DBRadioGroup_Tipo_ArticuloChange(Sender: TObject);
begin
    Mostrar_Es_un_Servicio_SN;
end;

procedure Tform_articulos_001.Mostrar_Es_un_Servicio_SN;
begin
    GroupBox_Es_un_Servicio.Visible := false;

    if DBRadioGroup_Tipo_Articulo.Value = '2' then
    begin
        GroupBox_Es_un_Servicio.Visible := true;
    end;
end;

procedure Tform_articulos_001.Comprobar_PVP(param_msg : TStrings);
begin
    with form_articulos_000.SQLQuery_Articulos do
    begin
        if (Trim(FieldByName('PVP').AsString) = '')                     and
           (Trim(FieldByName('PVP_Impuestos_Incluidos').AsString) = '') then
        begin
            param_msg.Add(rs_Comprobar_PVP_1);
        end;

        if (Trim(FieldByName('PVP').AsString) <> '')                     and
           (Trim(FieldByName('PVP_Impuestos_Incluidos').AsString) <> '') then
        begin
            param_msg.Add(rs_Comprobar_PVP_2);
        end;
    end;
end;

procedure Tform_articulos_001.Edit_Descripcion_FamiliaClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add(rs_Quitamos_1);
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_articulos_000.SQLQuery_Articulos.FieldByName('id_articulos_familias').Clear;
         Edit_Descripcion_Familia.Text     := '';

         private_Cta_Ctble_elegida_Compras := '';
         private_Cta_Ctble_elegida_Ventas  := '';
    end;
    var_msg.Free;
end;

procedure Tform_articulos_001.Boton_Elegir_ProveedorClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_articulos_000.SQLQuery_Articulos do
    begin
        var_Registro := UTI_Abrir_Modulo_Proveedores( true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_proveedores').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Proveedor.Text        := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_articulos_001.Boton_Grupo_CocinaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_articulos_000.SQLQuery_Articulos do
    begin
        var_Registro := UTI_Abrir_Modulo_GruposDeCocina( true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_grupos_cocina').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Grupo_Cocina.Text       := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_articulos_001.Boton_Elegir_Impto_VentasClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_articulos_000.SQLQuery_Articulos do
    begin
        var_Registro := UTI_Abrir_Modulo_Impuestos( '', '', true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_impuestos_Ventas').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Impto_Ventas.Text          := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_articulos_001.Boton_Elegir_Impto_ComprasClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_articulos_000.SQLQuery_Articulos do
    begin
        var_Registro := UTI_Abrir_Modulo_Impuestos( '', '', true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_impuestos_Compras').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Impto_Compras.Text          := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_articulos_001.Boton_Elegir_ImpresoraClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_articulos_000.SQLQuery_Articulos do
    begin
        var_Registro := UTI_Abrir_Modulo_Impresoras( '', '', true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_impresoras').AsString    := Trim(var_Registro.id_1);
             Edit_Descripcion_Impresora_comandas.Text := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_articulos_001.Presentar_Datos;
begin
    with form_articulos_000.SQLQuery_Articulos do
    begin
         Edit_Descripcion_Familia.Text            := FieldByName('OT_descripcion_familia').AsString;
         Edit_Descripcion_Proveedor.Text          := FieldByName('OT_descripcion_proveedor').AsString;
         Edit_Descripcion_Impto_Ventas.Text       := FieldByName('OT_descripcion_impto_ventas').AsString;
         Edit_Descripcion_Impto_Compras.Text      := FieldByName('OT_descripcion_impto_compras').AsString;
         Edit_Descripcion_Grupo_Cocina.Text       := FieldByName('OT_descripcion_grupo_cocina').AsString;
         Edit_Descripcion_Impresora_comandas.Text := FieldByName('OT_descripcion_impresora_comandas').AsString;
    end;

    Mostrar_Es_un_Servicio_SN;
end;

procedure Tform_articulos_001.Edit_Descripcion_Impto_ComprasClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add(rs_Quitamos_2);
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_articulos_000.SQLQuery_Articulos.FieldByName('id_impuestos_Compras').Clear;
         Edit_Descripcion_Impto_Compras.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_articulos_001.Edit_Descripcion_Impto_VentasClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add(rs_Quitamos_3);
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_articulos_000.SQLQuery_Articulos.FieldByName('id_impuestos_Ventas').Clear;
         Edit_Descripcion_Impto_Ventas.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_articulos_001.Edit_Descripcion_ProveedorClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add(rs_Quitamos_4);
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_articulos_000.SQLQuery_Articulos.FieldByName('id_proveedores').Clear;
         Edit_Descripcion_Proveedor.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_articulos_001.Validacion( param_msg : TStrings );
begin
    with form_articulos_000.SQLQuery_Articulos do
    begin
        Comprobar_PVP(param_msg);

        if Trim(FieldByName('descripcion').AsString) = '' then
        begin
            param_msg.Add(rs_FormClose_x1);
        end else begin
            if Length(Trim(FieldByName('descripcion').AsString)) <= 50 then
            begin
                if Trim(FieldByName('descripcion_para_TPV').AsString) = '' then
                begin
                    FieldByName('descripcion_para_TPV').AsString := Trim(FieldByName('descripcion').AsString);
                end;
            end;
        end;

        if Trim(FieldByName('descripcion_para_TPV').AsString) = '' then
        begin
            param_msg.Add(rs_FormClose_x2);
        end;

        if Trim(FieldByName('id_articulos_familias').AsString) = '' then
        begin
            param_msg.Add(rs_FormClose_3);
        end;

        if Trim(FieldByName('Combinado').AsString) = '' then
        begin
            param_msg.Add(rs_FormClose_4);
        end;

        if Trim(FieldByName('id_impuestos_Ventas').AsString) = '' then
        begin
            param_msg.Add(rs_FormClose_5);
        end;

        if Trim(FieldByName('id_impuestos_Compras').AsString) = '' then
        begin
            param_msg.Add(rs_FormClose_5_1);
        end;

        if Trim(FieldByName('Visualizar_en_terminales_SN').AsString) = '' then
        begin
            param_msg.Add(rs_FormClose_6);
        end;

        if Trim(FieldByName('Venta_por_peso_SN').AsString) = '' then
        begin
            param_msg.Add(rs_FormClose_7);
        end;

        if Trim(FieldByName('Articulo_Compuesto_SN').AsString) = '' then
        begin
            param_msg.Add(rs_FormClose_8);
        end;

        if Trim(FieldByName('Activar_Proporciones_SN').AsString) = '' then
        begin
            param_msg.Add(rs_FormClose_9);
        end;

        if Trim(FieldByName('Agregar_a_Favoritos_SN').AsString) = '' then
        begin
            param_msg.Add(rs_FormClose_10);
        end;

        if Trim(FieldByName('Pedir_precio_venta_SN').AsString) = '' then
        begin
            param_msg.Add(rs_FormClose_11);
        end;

        // ************************************************************************************* //
        // ** COMPROBACIONES POR EL TIPO DE ARTICULO                                          ** //
        // ************************************************************************************* //
        // ** LINEAS DE ABAJO                                                                 ** //
        // ************************************************************************************* //
        if Trim(FieldByName('Tipo_de_articulo').AsString) = '' then
        begin
            param_msg.Add(rs_FormClose_13);
        end;

        if Trim(FieldByName('Tipo_de_articulo').AsString) = '2' then
        begin
            // ********************************************************************************* //
            // ** Es un artículo por servicios o mano de obra, asi que tengo que introducir   ** //
            // ** obligado el TIEMPO ASIGNADO                                                 ** //
            // ********************************************************************************* //
            if Trim(FieldByName('Tiempo_asignado').AsString) = '' then
            begin
                param_msg.Add(rs_FormClose_14);
            end;
        end;
        // ************************************************************************************* //
        // ** LINEAS DE ARRIBA                                                                ** //
        // ************************************************************************************* //
        // ** COMPROBACIONES POR EL TIPO DE ARTICULO                                          ** //
        // ************************************************************************************* //

        form_Menu.Traer_Configuracion_APP;

        UTI_CONTA_esta_Cta_Ctble_BIEN( form_menu.public_User_Configuracion.Articulos_Ventas_Obligar_Cuenta_Contable_SN, //.... aqui tambien permitir el control de exigirlo o no
                                       param_msg,
                                       form_articulos_000.SQLQuery_Articulos,
                                       private_Cta_Ctble_elegida_Ventas,
                                       'articulos',
                                       'Cuenta_Contable_Ventas',
                                       rs_FormClose_15 );

        UTI_CONTA_esta_Cta_Ctble_BIEN( form_menu.public_User_Configuracion.Articulos_Compras_Obligar_Cuenta_Contable_SN, //.... aqui tambien permitir el control de exigirlo o no
                                       param_msg,
                                       form_articulos_000.SQLQuery_Articulos,
                                       private_Cta_Ctble_elegida_Compras,
                                       'articulos',
                                       'Cuenta_Contable_Compras',
                                       rs_FormClose_16 );
    end;
end;

procedure Tform_articulos_001.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg : TStrings;
begin
    ButtonPanel1.SetFocus; // Con esto consigo que salga del campo que este y pueda actualizarlo

    var_msg := TStringList.Create;

    if public_Pulso_Aceptar = true then
    begin
        Validacion(var_msg);
    end;

    if private_Salir_OK = False then
    begin
      { ********************************************************************
        Intento BitBtn_SALIR de la aplicación de un modo no permitido.
        ********************************************************************
        Pero si desde el menu principal está a true la variable
        public_Salir_Ok, significa que hay que salir si o si pues se pulsó
        cancelar al preguntar otra vez por la contraseña
        ******************************************************************** }
        if form_Menu.public_Salir_OK = False then CloseAction := TCloseAction.caNone;
    end else begin
      { ********************************************************************
        Fue correcto el modo como quiere salir de la aplicación
        ********************************************************************
        Comprobaremos si no se generó algún error por falta de completar
        algun campo y si se salió con el botón Ok o Cancel
        ******************************************************************** }
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

procedure Tform_articulos_001.Edit_Descripcion_Grupo_CocinaClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add(rs_Quitamos_5);
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_articulos_000.SQLQuery_Articulos.FieldByName('id_grupos_cocina').Clear;
         Edit_Descripcion_Grupo_Cocina.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_articulos_001.Edit_Descripcion_Impresora_comandasClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add(rs_Quitamos_6);
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_articulos_000.SQLQuery_Articulos.FieldByName('id_impresoras').Clear;
         Edit_Descripcion_Impresora_comandas.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_articulos_001.Edit_Descripcion_Familia_CombinarClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add(rs_Quitamos_7);
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         Edit_id_Descripcion_Familia_Combinar.Text := '';
         Edit_Descripcion_Familia_Combinar.Text    := '';
    end;
    var_msg.Free;
end;

procedure Tform_articulos_001.DBGrid_ComposicionesDblClick(Sender: TObject);
begin
    Editar_Registro_Composiciones;
end;

procedure Tform_articulos_001.DBGrid_ProporcionesDblClick(Sender: TObject);
begin
    Editar_Registro_Proporciones;
end;

procedure Tform_articulos_001.DBGrid_ProporcionesDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
var var_Color_Normal : TColor;
begin
    with Sender as TDBGrid do
    begin
        if form_articulos_000.SQLQuery_Articulos_Proporciones.RecordCount = 0 then Exit;

        var_Color_Normal := Canvas.Brush.Color;

      { ************************************************************************
        Primero comprobamos si es un registro dado de baja o no
        ************************************************************************ }
        if not form_articulos_000.SQLQuery_Articulos_Proporciones.FieldByName('Del_WHEN').IsNull then
        begin
          { ****************************************************************
            Registro DADO de BAJA
            **************************************************************** }
            Canvas.Font.Color := clSilver;
        end else begin
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
        end else begin
          { ****************************************************************
            Es una de las columnas a dibujar
            **************************************************************** }
            // COLUMNA CONFIRMADA
            if Column.FieldName = 'COLUMNA_CON_IMAGEN' then
            begin
                {
                if Trim(form_articulos_000.SQLQuery_Articulos_Tarifas.FieldByName('id_medio').asString) = '1' then
                begin
                    Canvas.StretchDraw(param_Rect, Image_Confirmado.Picture.Graphic);
                end;
                }
            end;
        end;

        Canvas.Font.Color := var_Color_Normal;
    end;
end;

procedure Tform_articulos_001.DBGrid_ProporcionesKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then Editar_Registro_Proporciones;
end;

procedure Tform_articulos_001.Boton_Elegir_Familia_CombinarClick(Sender: TObject);
// var var_Registro : TRecord_Rgtro_Comun;
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_articulos_000.SQLQuery_Articulos do
    begin
        if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = true then
        begin
            var_Registro := form_articulos_000.Elegir_Familia;
        end;

        if var_Registro.id_1 <> '' then
        begin
            Edit_id_Descripcion_Familia_Combinar.Text              := Trim(var_Registro.id_1);
            Edit_Descripcion_Familia_Combinar.Text                 := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_articulos_001.DBGrid_ComposicionesDrawColumnCell(Sender: TObject;
    const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var var_Color_Normal : TColor;
begin
    with Sender as TDBGrid do
    begin
        if form_articulos_000.SQLQuery_Articulos_Composiciones.RecordCount = 0 then Exit;

        var_Color_Normal := Canvas.Brush.Color;

      { ************************************************************************
        Primero comprobamos si es un registro dado de baja o no
        ************************************************************************ }
        if not form_articulos_000.SQLQuery_Articulos_Composiciones.FieldByName('Del_WHEN').IsNull then
        begin
          { ****************************************************************
            Registro DADO de BAJA
            **************************************************************** }
            Canvas.Font.Color := clSilver;
        end else begin
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
        end else begin
          { ****************************************************************
            Es una de las columnas a dibujar
            **************************************************************** }
            // COLUMNA CONFIRMADA
            if Column.FieldName = 'COLUMNA_CON_IMAGEN' then
            begin
                {
                if Trim(form_articulos_000.SQLQuery_Articulos_Tarifas.FieldByName('id_medio').asString) = '1' then
                begin
                    Canvas.StretchDraw(param_Rect, Image_Confirmado.Picture.Graphic);
                end;
                }
            end;
        end;

        Canvas.Font.Color := var_Color_Normal;
    end;
end;

procedure Tform_articulos_001.DBGrid_ComposicionesKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then Editar_Registro_Composiciones;
end;

procedure Tform_articulos_001.DBNavigator_ComposicionesBeforeAction( Sender: TObject;
                                                                     Button: TDBNavButtonType);
begin
    case Button of
        nbInsert : begin
            Insertar_Registro_Composiciones;
            Abort;
        end;

        nbEdit : begin
            Editar_Registro_Composiciones;
            Abort;
        end;

        nbDelete : begin
            Borrar_Registro_Composiciones;
            Abort;
        end;

        nbRefresh : begin
            form_articulos_000.Refrescar_Registros_Composiciones;
            Abort;
        end;
    end;
end;

procedure Tform_articulos_001.DBNavigator_ProporcionesBeforeAction( Sender: TObject;
                                                                    Button: TDBNavButtonType);
begin
    case Button of
        nbInsert : begin
            Insertar_Registro_Proporciones;
            Abort;
        end;

        nbEdit : begin
            Editar_Registro_Proporciones;
            Abort;
        end;

        nbDelete : begin
            Borrar_Registro_Proporciones;
            Abort;
        end;

        nbRefresh : begin
            form_articulos_000.Refrescar_Registros_Proporciones;
            Abort;
        end;
    end;
end;

procedure Tform_articulos_001.BitBtn_Ver_Situacion_Registro_StockClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if form_articulos_000.SQLQuery_Articulos_Terminales.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'articulos_stock',
                                           form_articulos_000.SQLQuery_Articulos_Stock,
                                           form_articulos_000.DataSource_Art_Stock,
                                           DBGrid_Stock );
        end;
    end;
end;

procedure Tform_articulos_001.DBNavigator_StockBeforeAction(Sender: TObject;
  Button: TDBNavButtonType);
begin
    case Button of
        nbInsert : begin
            // ************************************************************************************* //
            // ** No hace falta insertar porque se insertan automáticamente en el momento que se  ** //
            // ** crea una nueva terminal, incluso cuando se borra la terminal, también se borra  ** //
            // automáticamente en familias de articulos y articulos                               ** //
            // ************************************************************************************* //
            Abort;
        end;

        nbEdit : begin
            Editar_Registro_Stock;
            Abort;
        end;

        nbDelete : begin
            // ************************************************************************************* //
            // ** No hace falta borrar porque nunca se borran, solo se quedan a 0 su stock. Tampo-** //
            // ** co se crean pues si no existen se crean desde almacenes movimientos y compras   ** //
            // ************************************************************************************* //
            Abort;
        end;

        nbRefresh : begin
            form_articulos_000.Refrescar_Registros_Stock;
            Abort;
        end;
    end;
end;

procedure Tform_articulos_001.DBGrid_StockDblClick(Sender: TObject);
begin
    Editar_Registro_Stock;
end;

procedure Tform_articulos_001.DBGrid_TerminalesDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
var var_Color_Normal : TColor;
begin
    with Sender as TDBGrid do
    begin
        if form_articulos_000.SQLQuery_Articulos_Terminales.RecordCount = 0 then Exit;

        var_Color_Normal := Canvas.Brush.Color;

      { ************************************************************************
        Primero comprobamos si es un registro dado de baja o no
        ************************************************************************ }
        if not form_articulos_000.SQLQuery_Articulos_Terminales.FieldByName('Del_WHEN').IsNull then
        begin
          { ****************************************************************
            Registro DADO de BAJA
            **************************************************************** }
            Canvas.Font.Color := clSilver;
        end else begin
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
        end else begin
          { ****************************************************************
            Es una de las columnas a dibujar
            **************************************************************** }
            // COLUMNA CONFIRMADA
            if Column.FieldName = 'COLUMNA_CON_IMAGEN'  then
            begin
                {
                if Trim(form_articulos_000.SQLQuery_Articulos_Terminales.FieldByName('id_medio').asString) = '1' then
                begin
                    Canvas.StretchDraw(param_Rect, Image_Confirmado.Picture.Graphic);
                end;
                }
            end;
        end;

        Canvas.Font.Color := var_Color_Normal;
    end;
end;

procedure Tform_articulos_001.DBGrid_StockDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var var_Color_Normal : TColor;
begin
    with Sender as TDBGrid do
    begin
        if form_articulos_000.SQLQuery_Articulos_Stock.RecordCount = 0 then Exit;

        var_Color_Normal := Canvas.Brush.Color;

      { ************************************************************************
        Primero comprobamos si es un registro dado de baja o no
        ************************************************************************ }
        if not form_articulos_000.SQLQuery_Articulos_Stock.FieldByName('Del_WHEN').IsNull then
        begin
          { ****************************************************************
            Registro DADO de BAJA
            **************************************************************** }
            Canvas.Font.Color := clSilver;
        end else begin
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
        end else begin
          { ****************************************************************
            Es una de las columnas a dibujar
            **************************************************************** }
            // COLUMNA CONFIRMADA
            if Column.FieldName = 'COLUMNA_CON_IMAGEN'  then
            begin
                {
                if Trim(form_articulos_000.SQLQuery_Articulos_Stock.FieldByName('id_medio').asString) = '1' then
                begin
                    Canvas.StretchDraw(param_Rect, Image_Confirmado.Picture.Graphic);
                end;
                }
            end;
        end;

        Canvas.Font.Color := var_Color_Normal;
    end;
end;

procedure Tform_articulos_001.DBGrid_StockKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if Key = 13 then Editar_Registro_Stock;
end;

function Tform_articulos_001.Traer_Articulos_Familias_xID( param_id : ShortString ) : Tarticulos_familias;
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
        var_SQLQuery.Name     := 'SQLQuery_Traer_Articulos_Familias_xID';
        var_SQLQuery.Database := var_SQLConnector;

        // ***************************************************************************************** //
        // ** Creamos la SQL                                                                      ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Clear;
        var_SQLQuery.SQL.AddStrings( 'SELECT af.*,' + ' ' +
                                            'g.descripcion AS OT_descripcion_grupo_cocina,' + ' ' +
                                            'im.descripcion AS OT_descripcion_impresora_comandas,' + ' ' +
                                            'afs.descripcion AS OT_descripcion_familia_superior' + ' ' +

                                     'FROM articulos_familias AS af' + ' ' +

                                     'LEFT JOIN grupos_cocina AS g' + ' ' +
                                     'ON af.id_grupos_cocina = g.id' + ' ' +

                                     'LEFT JOIN grupos_cocina AS im' + ' ' +
                                     'ON af.id_impresoras = im.id' + ' ' +

                                     'LEFT JOIN articulos_familias AS afs' + ' ' +
                                     'ON af.id_articulos_familias = afs.id' + ' ' );

        // ***************************************************************************************** //
        // ** Continuamos con la confección de la SQL                                             ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add( 'WHERE af.id = ' + Trim(param_id) );
        var_SQLQuery.SQL.Add( 'ORDER BY af.id ASC' );

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
                 Result.id                                              := FieldByName('id').AsString;
                 Result.descripcion                                     := FieldByName('descripcion').AsString;
                 Result.id_articulos_familias                           := FieldByName('id_articulos_familias').AsString;
                 Result.id_grupos_cocina                                := FieldByName('id_grupos_cocina').AsString;
                 Result.id_impresoras                                   := FieldByName('id_impresoras').AsString;
                 Result.Cuenta_Contable_Ventas                          := FieldByName('Cuenta_Contable_Ventas').AsString;
                 Result.Cuenta_Contable_Compras                         := FieldByName('Cuenta_Contable_Compras').AsString;
                 Result.Visualizar_en_terminales_SN                     := FieldByName('Visualizar_en_terminales_SN').AsString;
                 Result.Ventas_por_peso_SN                              := FieldByName('Ventas_por_peso_SN').AsString;
                 Result.Comision                                        := FieldByName('Comision').AsString;
                 Result.Minimo_Variacion_Actualizar_en_tanto_por_ciento := FieldByName('Minimo_Variacion_Actualizar_en_tanto_por_ciento').AsString;

                 Result.Insert_WHEN                                     := FieldByName('Insert_WHEN').AsString;
                 Result.Insert_Id_User                                  := FieldByName('Insert_Id_User').AsString;
                 Result.Del_WHEN                                        := FieldByName('Del_WHEN').AsString;
                 Result.Del_Id_User                                     := FieldByName('Del_Id_User').AsString;
                 Result.Del_WHY                                         := FieldByName('Del_WHY').AsString;
                 Result.Change_WHEN                                     := FieldByName('Change_WHEN').AsString;
                 Result.Change_Id_User                                  := FieldByName('Change_Id_User').AsString;

                 Result.OT_descripcion_grupo_cocina                     := FieldByName('OT_descripcion_grupo_cocina').AsString;
                 Result.OT_descripcion_impresora_comandas               := FieldByName('OT_descripcion_impresora_comandas').AsString;
                 Result.OT_descripcion_familia_superior                 := FieldByName('OT_descripcion_familia_superior').AsString;
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
            UTI_GEN_Error_Log( 'Ocurrió un error al intentar traer todos los datos de la familia de artículo con' +
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

procedure Tform_articulos_001.Boton_Elegir_FamiliaClick(Sender: TObject);
var var_Rgtro         : TRecord_Rgtro_Comun;
    var_Rgtro_art_fam : Tarticulos_familias;
begin
    with form_articulos_000.SQLQuery_Articulos do
    begin
        if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = true then
        begin
            var_Rgtro := form_articulos_000.Elegir_Familia;
        end;

        if var_Rgtro.id_1 <> '' then
        begin
            var_Rgtro_art_fam := Traer_Articulos_Familias_xID( Trim(var_Rgtro.id_1) );

            if var_Rgtro_art_fam.id <> '0' then
            begin
                FieldByName('id_articulos_familias').AsString                           := Trim(var_Rgtro_art_fam.id);

                Edit_Descripcion_Familia.Text                                           := var_Rgtro_art_fam.descripcion;
                FieldByName('OT_descripcion_familia').AsString                          := var_Rgtro_art_fam.descripcion;

                FieldByName('id_grupos_cocina').AsString                                := var_Rgtro_art_fam.id_grupos_cocina;
                FieldByName('id_impresoras').AsString                                   := var_Rgtro_art_fam.id_impresoras;
                FieldByName('Venta_por_peso_SN').AsString                               := var_Rgtro_art_fam.Ventas_por_peso_SN;
                FieldByName('Visualizar_en_terminales_SN').AsString                     := var_Rgtro_art_fam.Visualizar_en_terminales_SN;
                FieldByName('Comision').AsString                                        := var_Rgtro_art_fam.Comision;
                FieldByName('Minimo_Variacion_Actualizar_en_tanto_por_ciento').AsString := var_Rgtro_art_fam.Minimo_Variacion_Actualizar_en_tanto_por_ciento;

                private_Cta_Ctble_elegida_Compras                                       := var_Rgtro_art_fam.Cuenta_Contable_Compras;
                private_Cta_Ctble_elegida_Ventas                                        := var_Rgtro_art_fam.Cuenta_Contable_Ventas;

                if Trim(FieldByName('Cuenta_Contable_Compras').AsString) = '' then
                begin
                    FieldByName('Cuenta_Contable_Compras').Value := var_Rgtro_art_fam.Cuenta_Contable_Compras;
                end;

                if Trim(FieldByName('Cuenta_Contable_Ventas').AsString) = '' then
                begin
                    FieldByName('Cuenta_Contable_Ventas').Value := var_Rgtro_art_fam.Cuenta_Contable_Ventas;
                end;
            end;
        end;
    end;
end;

procedure Tform_articulos_001.FormActivate(Sender: TObject);
begin
    If form_articulos_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    Comprobar_No_Tocar(true, true);
end;

function Tform_articulos_001.Comprobar_No_Tocar( param_Reproducir_Mensajes,
                                                 param_Ejecutar_No_Tocar : Boolean ) : Boolean;
begin
    Result := false;

    // ********************************************************************************************* //
    // ** Si se llamó para solo verlo, pues no se puede tocar                                     ** //
    // ********************************************************************************************* //
    if public_Solo_Ver = true then
    begin
        Result := true;
        if param_Ejecutar_No_Tocar = true then no_Tocar;
    end;
end;

procedure Tform_articulos_001.Editar_Registro_Terminales;
var
  var_Campos_para_Existe_ya : Array of TCampos_para_Existe_ya;
  var_msg                   : TStrings;
  var_Form                  : Tform_articulos_003;
  var_record_Existe         : Trecord_Existe;
  var_id                    : ShortString;
begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    with form_articulos_000.SQLQuery_Articulos_Terminales do
    begin
        var_msg := TStringList.Create;

        if (RecordCount > 0) and
           (Active = true)   then
        begin
            var_id := FieldByName('id').AsString;

            if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
            begin
                if UTI_RGTRO_isLock( 'articulos_terminales',
                                     FieldByName('id').AsString,
                                     true ) = true then
                begin
                    Exit;
                end else begin
                    if UTI_RGTRO_Lock( 'articulos_terminales',
                                       FieldByName('id').AsString ) = true then
                         Edit
                    else Exit;
                end;

                var_Form := Tform_articulos_003.Create(nil);

                var_Form.public_Menu_Worked := public_Menu_Worked;

                if public_Solo_Ver = true then
                begin
                    var_Form.public_Solo_Ver := true;
                end;

                var_Form.para_Empezar;

                var_Form.ShowModal;
                if var_Form.public_Pulso_Aceptar = true then
                begin
                    SetLength(var_Campos_para_Existe_ya, 2);

                    var_Campos_para_Existe_ya[0].Campo_Valor  := FieldByName('id_articulos').AsString;
                    var_Campos_para_Existe_ya[0].Campo_Nombre := 'id_articulos';
                    var_Campos_para_Existe_ya[0].Campo_Tipo   := 0; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                    var_Campos_para_Existe_ya[1].Campo_Valor  := FieldByName('id_terminales').AsString;
                    var_Campos_para_Existe_ya[1].Campo_Nombre := 'id_terminales';
                    var_Campos_para_Existe_ya[1].Campo_Tipo   := 0; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                    var_record_Existe := UTI_RGTRO_Existe_Ya( 'articulos_terminales',                              // param_nombre_tabla
                                                              'ORDER BY articulos_terminales.id_articulos ASC, ' +
                                                                       'articulos_terminales.id_terminales ASC',   // param_order_by
                                                              FieldByName('id').AsString,                          // param_id_a_no_traer ... Estoy insertando
                                                              var_Campos_para_Existe_ya );                         // param_Campos_para_Existe_ya

                    if var_record_Existe.Fallo_en_Conexion_BD = true then
                    begin
                        var_Form.Free;
                        Cancel;
                    end else begin
                        if var_record_Existe.Existe = false then
                        begin
                            if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( form_articulos_000.SQLQuery_Articulos_Terminales ) = true then
                            begin
                                FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                                FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                                UTI_RGTRO_Grabar_Antes( 'articulos_terminales',
                                                        form_articulos_000.SQLQuery_Articulos_Terminales );
                            end else begin
                                Cancel;
                            end;

                            var_Form.Free;
                        end else begin
                            var_Form.Free;
                            Cancel;
                            var_msg.Clear;
                            var_msg.Add(rs_Editar_Registro_Terminales_1);

                            if UpperCase(var_record_Existe.deBaja) = 'S' then
                            begin
                                var_msg.Add(rs_Rgtro_Borrado);
                            end;

                            UTI_GEN_Aviso(true, var_msg, rs_Ya_Existe, True, False);
                        end;
                    end;
                end else begin
                    var_Form.Free;
                    Cancel;
                end;

                UTI_RGTRO_UnLock( 'articulos_terminales',
                                  var_id );
            end;
        end else begin
            var_msg.Add(rs_no_Hay_Rgtros);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        end;
    end;

    var_msg.Free;
end;

procedure Tform_articulos_001.Insertar_Registro_Composiciones;
var
  var_Campos_para_Existe_ya : Array of TCampos_para_Existe_ya;
  var_msg                   : TStrings;
  var_Form                  : Tform_articulos_004;
  var_record_Existe         : Trecord_Existe;

begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    with form_articulos_000.SQLQuery_Articulos_Composiciones do
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

                    FieldByName('id_articulos').AsString := form_articulos_000.SQLQuery_Articulos.FieldByName('id').AsString;

                    var_Form := Tform_articulos_004.Create(nil);

                    var_Form.para_Empezar;

                    var_Form.ShowModal;
                    if var_Form.public_Pulso_Aceptar = true then
                        begin
                            var_Form.Free;

                            SetLength(var_Campos_para_Existe_ya, 2);

                            var_Campos_para_Existe_ya[0].Campo_Valor  := FieldByName('id_articulos').AsString;
                            var_Campos_para_Existe_ya[0].Campo_Nombre := 'id_articulos';
                            var_Campos_para_Existe_ya[0].Campo_Tipo   := 0; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                            var_Campos_para_Existe_ya[1].Campo_Valor  := FieldByName('id_articulos_composiciones').AsString;
                            var_Campos_para_Existe_ya[1].Campo_Nombre := 'id_articulos_composiciones';
                            var_Campos_para_Existe_ya[1].Campo_Tipo   := 0; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                            var_record_Existe := UTI_RGTRO_Existe_Ya( 'articulos_composiciones',                             // param_nombre_tabla
                                                                      'ORDER BY articulos_composiciones.id_articulos ASC, ' +
                                                                               'articulos_composiciones.id_articulos_composiciones ASC',         // param_order_by
                                                                      '',                       // param_id_a_no_traer ... Estoy insertando
                                                                      var_Campos_para_Existe_ya );                      // param_Campos_para_Existe_ya

                            if var_record_Existe.Fallo_en_Conexion_BD = true then
                                begin
                                    //var_Form.Free;
                                    Cancel;
                                end
                            else
                                begin
                                    if var_record_Existe.Existe = false then
                                        begin
                                            FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
                                            FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                                            UTI_RGTRO_Grabar_Antes( 'articulos_composiciones',
                                                                    form_articulos_000.SQLQuery_Articulos_Composiciones );
                                        end
                                    else
                                        begin
                                            Cancel;
                                            var_msg.Clear;

                                            var_msg.Add(rs_Insertar_Registro_Composiciones_1);

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

procedure Tform_articulos_001.Editar_Registro_Composiciones;
var
  var_Campos_para_Existe_ya : Array of TCampos_para_Existe_ya;
  var_msg                   : TStrings;
  var_Form                  : Tform_articulos_004;
  var_record_Existe         : Trecord_Existe;
  var_id                    : ShortString;

begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    with form_articulos_000.SQLQuery_Articulos_Composiciones do
    begin
        var_msg := TStringList.Create;

        if (RecordCount > 0) and
           (Active = true)   then
            begin
                var_id := FieldByName('id').AsString;

                if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
                begin
                    if UTI_RGTRO_isLock( 'articulos_composiciones',
                                         FieldByName('id').AsString,
                                         true ) = true then
                        begin
                            Exit;
                        end
                    else
                        begin
                            if UTI_RGTRO_Lock( 'articulos_composiciones',
                                               FieldByName('id').AsString ) = true then
                                 Edit
                            else Exit;
                        end;

                    var_Form := Tform_articulos_004.Create(nil);

                    var_Form.public_Menu_Worked := public_Menu_Worked;

                    if public_Solo_Ver = true then
                    begin
                        var_Form.public_Solo_Ver := true;
                    end;

                    var_Form.para_Empezar;

                    var_Form.ShowModal;
                    if var_Form.public_Pulso_Aceptar = true then
                        begin

                            SetLength(var_Campos_para_Existe_ya, 2);

                            var_Campos_para_Existe_ya[0].Campo_Valor  := FieldByName('id_articulos').AsString;
                            var_Campos_para_Existe_ya[0].Campo_Nombre := 'id_articulos';
                            var_Campos_para_Existe_ya[0].Campo_Tipo   := 0; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                            var_Campos_para_Existe_ya[1].Campo_Valor  := FieldByName('id_articulos_composiciones').AsString;
                            var_Campos_para_Existe_ya[1].Campo_Nombre := 'id_articulos_composiciones';
                            var_Campos_para_Existe_ya[1].Campo_Tipo   := 0; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                            var_record_Existe := UTI_RGTRO_Existe_Ya( 'articulos_composiciones',                                         // param_nombre_tabla
                                                                      'ORDER BY articulos_composiciones.id_articulos ASC, ' +
                                                                               'articulos_composiciones.id_articulos_composiciones ASC', // param_order_by
                                                                      FieldByName('id').AsString,                                        // param_id_a_no_traer ... Estoy insertando
                                                                      var_Campos_para_Existe_ya );                                       // param_Campos_para_Existe_ya

                            if var_record_Existe.Fallo_en_Conexion_BD = true then
                                begin
                                    var_Form.Free;
                                    Cancel;
                                end
                            else
                                begin
                                    if var_record_Existe.Existe = false then
                                        begin
                                            if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( form_articulos_000.SQLQuery_Articulos_Composiciones ) = true then
                                               begin
                                                    FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                                                    FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                                                    UTI_RGTRO_Grabar_Antes( 'articulos_composiciones',
                                                                            form_articulos_000.SQLQuery_Articulos_Composiciones );
                                               end
                                            else Cancel;
                                            var_Form.Free;
                                        end
                                    else
                                        begin
                                            var_Form.Free;
                                            Cancel;
                                            var_msg.Clear;

                                            var_msg.Add(rs_Editar_Registro_Composiciones_1);

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

                    UTI_RGTRO_UnLock( 'articulos_composiciones',
                                      var_id );
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

procedure Tform_articulos_001.Borrar_Registro_Composiciones;
begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    if UTI_USR_Permiso_SN(public_Menu_Worked, 'B', True) = True then
    begin
        UTI_RGTRO_Borrar( 'articulos_composiciones',
                          form_articulos_000.SQLQuery_Articulos_Composiciones,
                          public_Solo_Ver,
                          public_Menu_Worked );
    end;
end;

procedure Tform_articulos_001.DBGrid_ReferenciasDblClick(Sender: TObject);
begin
    Editar_Registro_Referencias;
end;

procedure Tform_articulos_001.DBGrid_ReferenciasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var var_Color_Normal : TColor;
begin
    with Sender as TDBGrid do
    begin
        if form_articulos_000.SQLQuery_Articulos_Ref.RecordCount = 0 then Exit;

        var_Color_Normal := Canvas.Brush.Color;

        // ***************************************************************************************** //
        // ** Primero comprobamos si es un registro dado de baja o no                             ** //
        // ***************************************************************************************** //
        if not form_articulos_000.SQLQuery_Articulos_Ref.FieldByName('Del_WHEN').IsNull then
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
                if (Column.FieldName <> 'COLUMNA_CON_IMAGEN') then
                begin
                    Canvas.font.Color := clBlack;
                end;
            end;
        end;

        // ***************************************************************************************** //
        // ** Ahora paso a dibujar una celda normal con los colores elegidos o una dibujada       ** //
        // ***************************************************************************************** //
        if (Column.FieldName <> 'COLUMNA_CON_IMAGEN') then
        begin
            // ************************************************************************************* //
            // ** No es una de las columnas a dibujar por lo que la pinto con los colores elegidos** //
            // ************************************************************************************* //
            DefaultDrawColumnCell(Rect, DataCol, Column, State)
        end else begin
            // ************************************************************************************* //
            // ** Es una de las columnas a dibujar                                                ** //
            // ************************************************************************************* //
            // COLUMNA CONFIRMADA
            if Column.FieldName = 'COLUMNA_CON_IMAGEN'  then
            begin
                if Trim(form_articulos_000.SQLQuery_Articulos_Ref.FieldByName('CodigoBarras_o_Referencia').AsString) = 'C' then
                begin
                    Canvas.StretchDraw(Rect, form_articulos_000.Image_CodigoBarras.Picture.Graphic);
                end;
            end;
        end;

        Canvas.Font.Color := var_Color_Normal;
    end;
end;

procedure Tform_articulos_001.DBGrid_ReferenciasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if Key = 13 then Editar_Registro_Referencias;
end;

procedure Tform_articulos_001.Insertar_Registro_Proporciones;
var
  var_Campos_para_Existe_ya : Array of TCampos_para_Existe_ya;
  var_msg                   : TStrings;
  var_Form                  : Tform_articulos_005;
  var_record_Existe         : Trecord_Existe;
  var_descripcion           : ShortString;
  var_Fecha_Hora            : ShortString;

begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    with form_articulos_000.SQLQuery_Articulos_Proporciones do
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

                    FieldByName('id_articulos').AsString := form_articulos_000.SQLQuery_Articulos.FieldByName('id').AsString;

                    var_Form := Tform_articulos_005.Create(nil);

                    var_Form.DBGrid_Tarifas.Color := clSilver;

                    var_Form.para_Empezar;

                    var_Form.ShowModal;
                    if var_Form.public_Pulso_Aceptar = true then
                        begin
                            var_Form.Free;

                            SetLength(var_Campos_para_Existe_ya, 2);

                            var_Campos_para_Existe_ya[0].Campo_Valor  := FieldByName('id_articulos').AsString;
                            var_Campos_para_Existe_ya[0].Campo_Nombre := 'id_articulos';
                            var_Campos_para_Existe_ya[0].Campo_Tipo   := 0; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                            var_Campos_para_Existe_ya[1].Campo_Valor  := FieldByName('descripcion').AsString;
                            var_Campos_para_Existe_ya[1].Campo_Nombre := 'descripcion';
                            var_Campos_para_Existe_ya[1].Campo_Tipo   := 1; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                            var_record_Existe := UTI_RGTRO_Existe_Ya( 'articulos_proporciones',                              // param_nombre_tabla
                                                                      'ORDER BY articulos_proporciones.id_articulos ASC, ' +
                                                                               'articulos_proporciones.descripcion ASC',     // param_order_by
                                                                      '',                                                    // param_id_a_no_traer ... Estoy insertando
                                                                      var_Campos_para_Existe_ya );                           // param_Campos_para_Existe_ya

                            if var_record_Existe.Fallo_en_Conexion_BD = true then
                                begin
                                    // var_Form.Free;
                                    Cancel;
                                end
                            else
                                begin
                                    if var_record_Existe.Existe = false then
                                        begin
                                            var_descripcion                     := FieldByName('descripcion').AsString;

                                            var_Fecha_Hora                      := DateTimeToStr(UTI_CN_Fecha_Hora);
                                            FieldByName('Insert_WHEN').AsString := var_Fecha_Hora;
                                            FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                                            UTI_RGTRO_Grabar_Antes( 'articulos_proporciones',
                                                                    form_articulos_000.SQLQuery_Articulos_Proporciones );

                                            // ***************************************************** //
                                            // ** Refresco el resto de tablas ligadas porque han  ** //
                                            // ** sido creadas automáticamente                    ** //
                                            // ***************************************************** //
                                            form_articulos_000.Filtrar_tablas_ligadas_a_Proporciones;
                                        end
                                    else
                                        begin
                                            Cancel;
                                            var_msg.Clear;

                                            var_msg.Add(rs_Insertar_Registro_Proporciones_1);

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

procedure Tform_articulos_001.Editar_Registro_Proporciones;
var
  var_Campos_para_Existe_ya : Array of TCampos_para_Existe_ya;
  var_msg                   : TStrings;
  var_Form                  : Tform_articulos_005;
  var_record_Existe         : Trecord_Existe;
  var_id                    : ShortString;

begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    with form_articulos_000.SQLQuery_Articulos_Proporciones do
    begin
        var_msg := TStringList.Create;

        if (RecordCount > 0) and
           (Active = true)   then
            begin
                var_id := FieldByName('id').AsString;

                if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
                begin
                    if UTI_RGTRO_isLock( 'articulos_proporciones',
                                         FieldByName('id').AsString,
                                         true ) = true then
                        begin
                            Exit;
                        end
                    else
                        begin
                            if UTI_RGTRO_Lock( 'articulos_proporciones',
                                               FieldByName('id').AsString ) = true then
                                 Edit
                            else Exit;
                        end;

                    var_Form := Tform_articulos_005.Create(nil);

                    var_Form.public_Menu_Worked := public_Menu_Worked;

                    if public_Solo_Ver = true then
                    begin
                        var_Form.public_Solo_Ver := true;
                    end;

                    var_Form.para_Empezar;

                    var_Form.ShowModal;
                    if var_Form.public_Pulso_Aceptar = true then
                        begin
                            SetLength(var_Campos_para_Existe_ya, 2);

                            var_Campos_para_Existe_ya[0].Campo_Valor  := FieldByName('id_articulos').AsString;
                            var_Campos_para_Existe_ya[0].Campo_Nombre := 'id_articulos';
                            var_Campos_para_Existe_ya[0].Campo_Tipo   := 0; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                            var_Campos_para_Existe_ya[1].Campo_Valor  := FieldByName('descripcion').AsString;
                            var_Campos_para_Existe_ya[1].Campo_Nombre := 'descripcion';
                            var_Campos_para_Existe_ya[1].Campo_Tipo   := 1; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                            var_record_Existe := UTI_RGTRO_Existe_Ya( 'articulos_proporciones',                              // param_nombre_tabla
                                                                      'ORDER BY articulos_proporciones.id_articulos ASC, ' +
                                                                               'articulos_proporciones.descripcion ASC',     // param_order_by
                                                                      FieldByName('id').AsString,                            // param_id_a_no_traer ... Estoy insertando
                                                                      var_Campos_para_Existe_ya );                           // param_Campos_para_Existe_ya

                            if var_record_Existe.Fallo_en_Conexion_BD = true then
                                begin
                                    var_Form.Free;
                                    Cancel;
                                end
                            else
                                begin
                                    if var_record_Existe.Existe = false then
                                        begin
                                            if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( form_articulos_000.SQLQuery_Articulos_Proporciones ) = true then
                                               begin
                                                    FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                                                    FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                                                    UTI_RGTRO_Grabar_Antes( 'articulos_proporciones',
                                                                            form_articulos_000.SQLQuery_Articulos_Proporciones );
                                               end
                                            else Cancel;
                                            var_Form.Free;
                                        end
                                    else
                                        begin
                                            var_Form.Free;
                                            Cancel;
                                            var_msg.Clear;

                                            var_msg.Add(rs_Editar_Registro_Proporciones_1);

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

                    UTI_RGTRO_UnLock( 'articulos_proporciones',
                                      var_id );
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

procedure Tform_articulos_001.Borrar_Registro_Proporciones;
var var_id          : ShortString;
    var_dar_de_Baja : Boolean;
begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    if UTI_USR_Permiso_SN(public_Menu_Worked, 'B', True) = True then
    begin
        var_id := form_articulos_000.SQLQuery_Articulos_Proporciones.FieldByName('id').AsString;

        var_dar_de_Baja := true;
        if not form_articulos_000.SQLQuery_Articulos_Proporciones.FieldByName('Del_WHEN').isNull then
        begin
            var_dar_de_Baja := false;
        end;

        UTI_RGTRO_Borrar( 'articulos_proporciones',
                          form_articulos_000.SQLQuery_Articulos_Proporciones,
                          public_Solo_Ver,
                          public_Menu_Worked );
    end;
end;

procedure Tform_articulos_001.BitBtn_Ver_Situacion_Registro_ReferenciasClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if form_articulos_000.SQLQuery_Articulos_Ref.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'articulos_referencias',
                                           form_articulos_000.SQLQuery_Articulos_Ref,
                                           form_articulos_000.DataSource_Art_Ref,
                                           DBGrid_Referencias );
        end;
    end;
end;

procedure Tform_articulos_001.Editar_Registro_Stock;
var
  var_Campos_para_Existe_ya : Array of TCampos_para_Existe_ya;
  var_msg                   : TStrings;
  var_Form                  : Tform_articulos_008;
  var_record_Existe         : Trecord_Existe;
  var_id                    : ShortString;

begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    with form_articulos_000.SQLQuery_Articulos_Stock do
    begin
        var_msg := TStringList.Create;

        if (RecordCount > 0) and
           (Active = true)   then
        begin
            var_id := FieldByName('id').AsString;

            if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
            begin
                if UTI_RGTRO_isLock( 'articulos_stock',
                                     FieldByName('id').AsString,
                                     true ) = true then
                begin
                    Exit;
                end else begin
                    if UTI_RGTRO_Lock( 'articulos_stock',
                                       FieldByName('id').AsString ) = true then
                         Edit
                    else Exit;
                end;

                var_Form := Tform_articulos_008.Create(nil);

                var_Form.public_Menu_Worked := public_Menu_Worked;

                if public_Solo_Ver = true then
                begin
                    var_Form.public_Solo_Ver := true;
                end;

                var_Form.para_Empezar;

                var_Form.ShowModal;
                if var_Form.public_Pulso_Aceptar = true then
                begin
                  SetLength(var_Campos_para_Existe_ya, 2);

                  var_Campos_para_Existe_ya[0].Campo_Valor  := FieldByName('id_articulos').AsString;
                  var_Campos_para_Existe_ya[0].Campo_Nombre := 'id_articulos';
                  var_Campos_para_Existe_ya[0].Campo_Tipo   := 0; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                  var_Campos_para_Existe_ya[1].Campo_Valor  := FieldByName('id_almacenes').AsString;
                  var_Campos_para_Existe_ya[1].Campo_Nombre := 'id_almacenes';
                  var_Campos_para_Existe_ya[1].Campo_Tipo   := 0; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                  var_record_Existe := UTI_RGTRO_Existe_Ya( 'articulos_stock',                              // param_nombre_tabla
                                                            'ORDER BY articulos_stock.id_articulos ASC, ' +
                                                                     'articulos_stock.id_almacenes ASC',    // param_order_by
                                                            FieldByName('id').AsString,                     // param_id_a_no_traer ... Estoy insertando
                                                            var_Campos_para_Existe_ya );                    // param_Campos_para_Existe_ya

                    if var_record_Existe.Fallo_en_Conexion_BD = true then
                    begin
                        var_Form.Free;
                        Cancel;
                    end else begin
                        if var_record_Existe.Existe = false then
                        begin
                            if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( form_articulos_000.SQLQuery_Articulos_Stock ) = true then
                            begin
                                FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                                FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                                UTI_RGTRO_Grabar_Antes( 'articulos_stock',
                                                        form_articulos_000.SQLQuery_Articulos_Stock );
                            end else begin
                                Cancel;
                            end;

                            var_Form.Free;
                        end else begin
                            var_Form.Free;
                            Cancel;
                            var_msg.Clear;
                            var_msg.Add(rs_Editar_Registro_Stock_1);

                            if UpperCase(var_record_Existe.deBaja) = 'S' then
                            begin
                                var_msg.Add(rs_Rgtro_Borrado);
                            end;

                            UTI_GEN_Aviso(true, var_msg, rs_Ya_Existe, True, False);
                        end;
                    end;
                end else begin
                    var_Form.Free;
                    Cancel;
                end;

                UTI_RGTRO_UnLock( 'articulos_stock',
                                  var_id );
            end;
        end else begin
            var_msg.Add(rs_no_Hay_Rgtros);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        end;
    end;

    var_msg.Free;
end;

procedure Tform_articulos_001.Editar_Registro_Referencias;
var
  var_Campos_para_Existe_ya : Array of TCampos_para_Existe_ya;
  var_msg                   : TStrings;
  var_Form                  : Tform_articulos_009;
  var_record_Existe         : Trecord_Existe;
  var_id                    : ShortString;

begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    with form_articulos_000.SQLQuery_Articulos_Ref do
    begin
        var_msg := TStringList.Create;

        if (RecordCount > 0) and
           (Active = true)   then
        begin
            var_id := FieldByName('id').AsString;

            if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
            begin
                if UTI_RGTRO_isLock( 'articulos_referencias',
                                     FieldByName('id').AsString,
                                     true ) = true then
                begin
                    Exit;
                end else begin
                    if UTI_RGTRO_Lock( 'articulos_referencias',
                                       FieldByName('id').AsString ) = true then
                         Edit
                    else Exit;
                end;

                var_Form := Tform_articulos_009.Create(nil);

                var_Form.public_Menu_Worked := public_Menu_Worked;

                if public_Solo_Ver = true then
                begin
                    var_Form.public_Solo_Ver := true;
                end;

                var_Form.para_Empezar;

                var_Form.ShowModal;
                if var_Form.public_Pulso_Aceptar = true then
                begin
                    SetLength(var_Campos_para_Existe_ya, 3);

                    var_Campos_para_Existe_ya[0].Campo_Valor  := FieldByName('id_articulos').AsString;
                    var_Campos_para_Existe_ya[0].Campo_Nombre := 'id_articulos';
                    var_Campos_para_Existe_ya[0].Campo_Tipo   := 0; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                    var_Campos_para_Existe_ya[1].Campo_Valor  := FieldByName('CodigoBarras_o_Referencia').AsString;
                    var_Campos_para_Existe_ya[1].Campo_Nombre := 'CodigoBarras_o_Referencia';
                    var_Campos_para_Existe_ya[1].Campo_Tipo   := 1; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                    var_Campos_para_Existe_ya[2].Campo_Valor  := FieldByName('CodigoBarras_Referencia').AsString;
                    var_Campos_para_Existe_ya[2].Campo_Nombre := 'CodigoBarras_Referencia';
                    var_Campos_para_Existe_ya[2].Campo_Tipo   := 1; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                    var_record_Existe := UTI_RGTRO_Existe_Ya( 'articulos_referencias',                                           // param_nombre_tabla
                                                              'ORDER BY articulos_referencias.id_articulos ASC, ' +
                                                                       'articulos_referencias.CodigoBarras_o_Referencia ASC, ' +
                                                                       'articulos_referencias.CodigoBarras_Referencia ASC',      // param_order_by
                                                              FieldByName('id').AsString,                                        // param_id_a_no_traer ... Estoy insertando
                                                              var_Campos_para_Existe_ya );                                       // param_Campos_para_Existe_ya

                    if var_record_Existe.Fallo_en_Conexion_BD = true then
                    begin
                        var_Form.Free;
                        Cancel;
                    end else begin
                        if var_record_Existe.Existe = false then
                        begin
                            if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( form_articulos_000.SQLQuery_Articulos_Ref ) = true then
                            begin
                                FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                                FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                                UTI_RGTRO_Grabar_Antes( 'articulos_referencias',
                                                        form_articulos_000.SQLQuery_Articulos_Ref );
                            end else begin
                                Cancel;
                            end;

                            var_Form.Free;
                        end else begin
                            var_Form.Free;
                            Cancel;
                            var_msg.Clear;
                            var_msg.Add(rs_Referencia_Repetida);

                            if UpperCase(var_record_Existe.deBaja) = 'S' then
                            begin
                                var_msg.Add(rs_Rgtro_Borrado);
                            end;

                            UTI_GEN_Aviso(true, var_msg, rs_Ya_Existe, True, False);
                        end;
                    end;
                end else begin
                    var_Form.Free;
                    Cancel;
                end;

                UTI_RGTRO_UnLock( 'articulos_terminales',
                                  var_id );
            end;
        end else begin
            var_msg.Add(rs_no_Hay_Rgtros);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        end;
    end;

    var_msg.Free;
end;

procedure Tform_articulos_001.Insertar_Registro_Referencias;
var
  var_Campos_para_Existe_ya : Array of TCampos_para_Existe_ya;
  var_msg                   : TStrings;
  var_Form                  : Tform_articulos_009;
  var_record_Existe         : Trecord_Existe;
  var_Fecha_Hora            : ShortString;

begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    with form_articulos_000.SQLQuery_Articulos_Ref do
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

                FieldByName('id_articulos').AsString := form_articulos_000.SQLQuery_Articulos.FieldByName('id').AsString;

                var_Form := Tform_articulos_009.Create(nil);

                var_Form.para_Empezar;

                var_Form.ShowModal;
                if var_Form.public_Pulso_Aceptar = true then
                begin
                    var_Form.Free;

                    SetLength(var_Campos_para_Existe_ya, 3);

                    var_Campos_para_Existe_ya[0].Campo_Valor  := FieldByName('id_articulos').AsString;
                    var_Campos_para_Existe_ya[0].Campo_Nombre := 'id_articulos';
                    var_Campos_para_Existe_ya[0].Campo_Tipo   := 0; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                    var_Campos_para_Existe_ya[1].Campo_Valor  := FieldByName('CodigoBarras_o_Referencia').AsString;
                    var_Campos_para_Existe_ya[1].Campo_Nombre := 'CodigoBarras_o_Referencia';
                    var_Campos_para_Existe_ya[1].Campo_Tipo   := 1; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                    var_Campos_para_Existe_ya[2].Campo_Valor  := FieldByName('CodigoBarras_Referencia').AsString;
                    var_Campos_para_Existe_ya[2].Campo_Nombre := 'CodigoBarras_Referencia';
                    var_Campos_para_Existe_ya[2].Campo_Tipo   := 1; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                    var_record_Existe := UTI_RGTRO_Existe_Ya( 'articulos_referencias',                                           // param_nombre_tabla
                                                              'ORDER BY articulos_referencias.id_articulos ASC, ' +
                                                                       'articulos_referencias.CodigoBarras_o_Referencia ASC, ' +
                                                                       'articulos_referencias.CodigoBarras_Referencia ASC',      // param_order_by
                                                              '',                                                                // param_id_a_no_traer ... Estoy insertando
                                                              var_Campos_para_Existe_ya );                                       // param_Campos_para_Existe_ya

                    if var_record_Existe.Fallo_en_Conexion_BD = true then
                    begin
                        // var_Form.Free;
                        Cancel;
                    end else begin
                        if var_record_Existe.Existe = false then
                        begin
                            var_Fecha_Hora                      := DateTimeToStr(UTI_CN_Fecha_Hora);
                            FieldByName('Insert_WHEN').AsString := var_Fecha_Hora;
                            FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                            UTI_RGTRO_Grabar_Antes( 'articulos_referencias',
                                                    form_articulos_000.SQLQuery_Articulos_Ref );
                        end else begin
                            Cancel;
                            var_msg.Clear;

                            var_msg.Add(rs_Referencia_Repetida);

                            if UpperCase(var_record_Existe.deBaja) = 'S' then
                            begin
                                var_msg.Add(rs_Rgtro_Borrado);
                            end;

                            UTI_GEN_Aviso(true, var_msg, rs_Ya_Existe, True, False);
                        end;
                    end;
                end else begin
                    var_Form.Free;
                    Cancel;
                end;
            end;
        end;

        var_msg.Free;
    end;
end;

procedure Tform_articulos_001.DBNavigator_Albaranes_Compras_sin_FacturarBeforeAction(Sender: TObject; Button: TDBNavButtonType);
begin
    case Button of
        nbRefresh : begin
            form_articulos_000.Refrescar_Registros_Albaranes_Compras_Detalles_sin_Facturar;
            Abort;
        end;
    end;
end;

procedure Tform_articulos_001.DBNavigator_Albaranes_Ventas_sin_FacturarBeforeAction
  (Sender: TObject; Button: TDBNavButtonType);
begin
    case Button of
        nbRefresh : begin
            form_articulos_000.Refrescar_Registros_Albaranes_Ventas_Detalles_sin_Facturar;
            Abort;
        end;
    end;
end;

procedure Tform_articulos_001.DBNavigator_Facturas_ComprasBeforeAction(
  Sender: TObject; Button: TDBNavButtonType);
begin
    case Button of
        nbRefresh : begin
            form_articulos_000.Refrescar_Registros_Facturas_Compras_Detalles;
            Abort;
        end;
    end;
end;

procedure Tform_articulos_001.DBNavigator_Facturas_VentasBeforeAction(
  Sender: TObject; Button: TDBNavButtonType);
begin
    case Button of
        nbRefresh : begin
            form_articulos_000.Refrescar_Registros_Facturas_Ventas_Detalles;
            Abort;
        end;
    end;
end;

procedure Tform_articulos_001.Borrar_Registro_Referencias;
var var_id          : ShortString;
    var_dar_de_Baja : Boolean;
begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    if UTI_USR_Permiso_SN(public_Menu_Worked, 'B', True) = True then
    begin
        var_id := form_articulos_000.SQLQuery_Articulos_Ref.FieldByName('id').AsString;

        var_dar_de_Baja := true;
        if not form_articulos_000.SQLQuery_Articulos_Ref.FieldByName('Del_WHEN').isNull then
        begin
            var_dar_de_Baja := false;
        end;

        UTI_RGTRO_Borrar( 'articulos_referencias',
                          form_articulos_000.SQLQuery_Articulos_Ref,
                          public_Solo_Ver,
                          public_Menu_Worked );
    end;
end;

procedure Tform_articulos_001.BitBtn_Ver_Albaran_ComprasClick(Sender: TObject);
var var_msg : TStrings;
begin
    with form_articulos_000.SQLQuery_Alb_Compras_Detalles do
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
            form_articulos_000.Refrescar_Registros_Albaranes_Compras_Detalles_sin_Facturar;
        end else begin
            var_msg := TStringList.Create;
            var_msg.Add(rs_Modulo_Abierto);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;
        end;
    end;
end;

procedure Tform_articulos_001.BitBtn_Ver_Albaran_VentasClick(Sender: TObject);
var var_msg : TStrings;
begin
    with form_articulos_000.SQLQuery_Alb_Ventas_Detalles do
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
            form_articulos_000.Refrescar_Registros_Albaranes_Ventas_Detalles_sin_Facturar;
        end else begin
            var_msg := TStringList.Create;
            var_msg.Add(rs_Modulo_Abierto);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;
        end;
    end;
end;

procedure Tform_articulos_001.BitBtn_Ver_Factura_ComprasClick(Sender: TObject);
var var_msg : TStrings;
begin
    with form_articulos_000.SQLQuery_Ftra_Compras_Detalles do
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
            form_articulos_000.Refrescar_Registros_Facturas_Compras_Detalles;
        end else begin
            var_msg := TStringList.Create;
            var_msg.Add(rs_Modulo_Abierto);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;
        end;
    end;
end;

procedure Tform_articulos_001.DBGrid_Albaranes_Compras_sin_FacturarDblClick(Sender: TObject);
begin
    BitBtn_Ver_Albaran_ComprasClick(nil);
end;

procedure Tform_articulos_001.DBGrid_Albaranes_Compras_sin_FacturarKeyDown( Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if Key = 13 then
    begin
        BitBtn_Ver_Albaran_ComprasClick(nil);
    end;
end;

procedure Tform_articulos_001.DBGrid_Albaranes_Ventas_sin_FacturarDblClick(Sender: TObject);
begin
    BitBtn_Ver_Albaran_VentasClick(nil);
end;

procedure Tform_articulos_001.DBGrid_Albaranes_Ventas_sin_FacturarKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if Key = 13 then
    begin
        BitBtn_Ver_Albaran_VentasClick(nil);
    end;
end;

procedure Tform_articulos_001.DBGrid_Facturas_ComprasDblClick(Sender: TObject);
begin
    BitBtn_Ver_Factura_ComprasClick(nil);
end;

procedure Tform_articulos_001.DBGrid_Facturas_ComprasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if Key = 13 then
    begin
        BitBtn_Ver_Factura_ComprasClick(nil);
    end;
end;

procedure Tform_articulos_001.DBGrid_Facturas_VentasDblClick(Sender: TObject);
begin
    BitBtn_Ver_Factura_VentasClick(nil);
end;

procedure Tform_articulos_001.DBGrid_Facturas_VentasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if Key = 13 then
    begin
        BitBtn_Ver_Factura_VentasClick(nil);
    end;
end;

procedure Tform_articulos_001.BitBtn_Ver_Factura_VentasClick(Sender: TObject);
var var_msg : TStrings;
begin
    with form_articulos_000.SQLQuery_Ftra_Ventas_Detalles do
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
            form_articulos_000.Refrescar_Registros_Facturas_Ventas_Detalles;
        end else begin
            var_msg := TStringList.Create;
            var_msg.Add(rs_Modulo_Abierto);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;
        end;
    end;
end;

procedure Tform_articulos_001.DBCheckBox_Activar_Proporciones_SNChange(
  Sender: TObject);
begin
    Activar_Proporciones_SN;
end;

procedure Tform_articulos_001.Activar_Composiciones_SN;
begin
    if form_articulos_000.SQLQuery_Articulos.FieldByName('Articulo_Compuesto_SN').Value = 'S' then
    begin
        DBGrid_Composiciones.Enabled      := true;
        DBNavigator_Composiciones.Enabled := true;
        DBGrid_Composiciones.Color        := $006AD3D7;
        Edit_Composicion_Total.Color      := $006AD3D7;
    end else begin
        DBGrid_Composiciones.Enabled      := false;
        DBNavigator_Composiciones.Enabled := false;
        DBGrid_Composiciones.Color        := clSilver;
        Edit_Composicion_Total.Color      := clSilver;
    end;
end;

procedure Tform_articulos_001.Activar_Proporciones_SN;
begin
    if form_articulos_000.SQLQuery_Articulos.FieldByName('Activar_Proporciones_SN').Value = 'S' then
    begin
        DBGrid_Proporciones.Enabled                := true;
        DBNavigator_Proporciones.Enabled           := true;
        DBGrid_Proporciones.Color                  := $006AD3D7;

        DBNavigator_Tarifas_Proporciones.Enabled   := true;
        DBEdit_Tarifa_Elegida_Proporciones.Enabled := true;
        DBGrid_Tarifas_Proporciones.Enabled        := true;
        DBEdit_Tarifa_Elegida_Proporciones.Color   := $006AD3D7;
        DBGrid_Tarifas_Proporciones.Color          := $006AD3D7;
    end else begin
        DBGrid_Proporciones.Enabled                := false;
        DBNavigator_Proporciones.Enabled           := false;
        DBGrid_Proporciones.Color                  := clSilver;

        DBNavigator_Tarifas_Proporciones.Enabled   := false;
        DBEdit_Tarifa_Elegida_Proporciones.Enabled := false;
        DBGrid_Tarifas_Proporciones.Enabled        := false;
        DBEdit_Tarifa_Elegida_Proporciones.Color   := clSilver;
        DBGrid_Tarifas_Proporciones.Color          := clSilver;
    end;
end;

procedure Tform_articulos_001.DBCheckBox_Articulo_Compuesto_SNChange(Sender: TObject);
begin
    Activar_Composiciones_SN;
end;

procedure Tform_articulos_001.no_Tocar;
begin
    DBCheckBox_Ventas_por_peso.Enabled         := false;
    DBCheckBox_Agregar_a_favoritos.Enabled     := false;
    DBMemo_Descripcion.Enabled                 := false;
    DBEdit_Descripcion_para_terminal.Enabled   := false;
    Boton_Elegir_Familia.Enabled               := false;
    Edit_Descripcion_Familia.Enabled           := false;
    GroupBox_Es_un_Servicio.Enabled            := false;
    DBRadioGroup_Tipo_Articulo.Enabled         := false;
    TabSheet_Informacion_Adicional.Enabled     := false;
    Boton_Elegir_Proveedor.Enabled             := false;
    Edit_Descripcion_Proveedor.Enabled         := false;
    Boton_Elegir_Impto_Compras.Enabled         := false;
    Edit_Descripcion_Impto_Compras.Enabled     := false;
    TabSheet_Compras_Ultimas_Facturas.Enabled  := false;
    TabSheet_Compras_Ultimos_Albaranes.Enabled := false;
    TabSheet_Stock_Almacenes.Enabled           := false;
    DBCheckBox_Pedir_precio_venta.Enabled      := false;
    Boton_Elegir_Impto_Ventas.Enabled          := false;
    Edit_Descripcion_Impto_Ventas.Enabled      := false;
    GroupBox_Comision_x_Venta.Enabled          := false;
    GroupBox_PVP_si_cliente_sin_tarifa.Enabled := false;
    TabSheet_Ventas_Tarifas.Enabled            := false;
    TabSheet_Ventas_Ultimas_Facturas.Enabled   := false;
    TabSheet_Ventas_Ultimos_Albaranes.Enabled  := false;
    DBRadioGroup_Combinado.Enabled             := false;
    Boton_Elegir_Familia_Combinar.Enabled      := false;
    Edit_Descripcion_Familia_Combinar.Enabled  := false;
    Edit_Composicion_Total.Enabled             := false;
    DBEdit_Minima_Variacion1.Enabled           := false;
    TabSheet_Composiciones.Enabled             := false;
    TabSheet_Proporciones.Enabled              := false;
end;

procedure Tform_articulos_001.DBNavigator_ReferenciasBeforeAction( Sender: TObject; Button: TDBNavButtonType );
begin
    case Button of
        nbInsert : begin
            Insertar_Registro_Referencias;
            Abort;
        end;

        nbEdit : begin
            Editar_Registro_Referencias;
            Abort;
        end;

        nbDelete : begin
            Borrar_Registro_Referencias;
            Abort;
        end;

        nbRefresh : begin
            form_articulos_000.Refrescar_Registros_Referencias;
            Abort;
        end;
    end;
end;

procedure Tform_articulos_001.Editar_Registro_Tarifas;
var
  var_Campos_para_Existe_ya : Array of TCampos_para_Existe_ya;
  var_msg                   : TStrings;
  var_Form                  : Tform_articulos_002;
  var_record_Existe         : Trecord_Existe;
  var_id                    : ShortString;

begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    with form_articulos_000.SQLQuery_Articulos_Tarifas do
    begin
        var_msg := TStringList.Create;

        if (RecordCount > 0) and
           (Active = true)   then
        begin
            var_id := FieldByName('id').AsString;

            if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
            begin
                if UTI_RGTRO_isLock( 'articulos_tarifas',
                                     FieldByName('id').AsString,
                                     true ) = true then
                begin
                    Exit;
                end else begin
                    if UTI_RGTRO_Lock( 'articulos_tarifas',
                                       FieldByName('id').AsString ) = true then
                         Edit
                    else Exit;
                end;

                var_Form := Tform_articulos_002.Create(nil);

                var_Form.public_Menu_Worked := public_Menu_Worked;

                if public_Solo_Ver = true then
                begin
                    var_Form.public_Solo_Ver := true;
                end;

                var_Form.para_Empezar;

                var_Form.ShowModal;
                if var_Form.public_Pulso_Aceptar = true then
                begin
                    SetLength(var_Campos_para_Existe_ya, 2);

                    var_Campos_para_Existe_ya[0].Campo_Valor  := FieldByName('id_articulos').AsString;
                    var_Campos_para_Existe_ya[0].Campo_Nombre := 'id_articulos';
                    var_Campos_para_Existe_ya[0].Campo_Tipo   := 0; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                    var_Campos_para_Existe_ya[1].Campo_Valor  := FieldByName('id_tarifas').AsString;
                    var_Campos_para_Existe_ya[1].Campo_Nombre := 'id_tarifas';
                    var_Campos_para_Existe_ya[1].Campo_Tipo   := 0; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                    var_record_Existe := UTI_RGTRO_Existe_Ya( 'articulos_tarifas',                             // param_nombre_tabla
                                                              'ORDER BY articulos_tarifas.id_articulos ASC, ' +
                                                                       'articulos_tarifas.id_tarifas ASC',         // param_order_by
                                                              FieldByName('id').AsString,                       // param_id_a_no_traer ... Estoy insertando
                                                              var_Campos_para_Existe_ya );                      // param_Campos_para_Existe_ya

                    if var_record_Existe.Fallo_en_Conexion_BD = true then
                    begin
                        var_Form.Free;
                        Cancel;
                    end else begin
                        if var_record_Existe.Existe = false then
                        begin
                            if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( form_articulos_000.SQLQuery_Articulos_Tarifas ) = true then
                            begin
                                FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                                FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                                UTI_RGTRO_Grabar_Antes( 'articulos_tarifas',
                                                        form_articulos_000.SQLQuery_Articulos_Tarifas );
                            end else begin
                                Cancel;
                            end;

                            var_Form.Free;
                        end else begin
                            var_Form.Free;
                            Cancel;
                            var_msg.Clear;
                            var_msg.Add(rs_Editar_Registro_Tarifas_1);

                            if UpperCase(var_record_Existe.deBaja) = 'S' then
                            begin
                                var_msg.Add(rs_Rgtro_Borrado);
                            end;

                            UTI_GEN_Aviso(true, var_msg, rs_Ya_Existe, True, False);
                        end;
                    end;
                end else begin
                    var_Form.Free;
                    Cancel;
                end;

                UTI_RGTRO_UnLock( 'articulos_tarifas',
                                  var_id );
            end;
        end else begin
            var_msg.Add(rs_no_Hay_Rgtros);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        end;
    end;

    var_msg.Free;
end;

end.

