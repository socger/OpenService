unit facturas_ventas_005;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, DateTimePicker, DBDateTimePicker, Forms, Controls,
  Graphics, Dialogs, ButtonPanel, StdCtrls, ExtCtrls, ComCtrls, Buttons, DBGrids, DbCtrls, Grids,
  variants, utilidades_general, utilidades_bd, utilidades_rgtro, utilidades_usuarios, utilidades_clientes,
  utilidades_datos_tablas, utilidades_forms_Filtrar;

type

  { Tform_facturas_ventas_005 }

  Tform_facturas_ventas_005 = class(TForm)
    BitBtn_Ver_Albaran: TBitBtn;
    BitBtn_Filtrar: TBitBtn;
    BitBtn_SMS: TBitBtn;
    BitBtn_SMS2: TBitBtn;
    BitBtn_Ver_Situacion_Registro: TBitBtn;
    Boton_Add_All: TBitBtn;
    Boton_Add_One: TBitBtn;
    Boton_Elegir_Agencia_Transporte: TBitBtn;
    Boton_Elegir_Direccion_Envio: TBitBtn;
    Boton_Elegir_Empresa: TBitBtn;
    Boton_Elegir_Forma_Pago: TBitBtn;
    Boton_Elegir_Forma_Pago1: TBitBtn;
    Boton_Elegir_id_Almacenes: TBitBtn;
    Boton_Elegir_id_Clientes: TBitBtn;
    Boton_Del_All: TBitBtn;
    Boton_Del_One: TBitBtn;
    Boton_Elegir_id_Vehiculos: TBitBtn;
    Boton_Elegir_Pais1: TBitBtn;
    Boton_Elegir_Representante: TBitBtn;
    ButtonPanel1: TButtonPanel;
    CheckBox_con_Recargo: TCheckBox;
    CheckBox_Excluido: TCheckBox;
    ComboBox_Filtros: TComboBox;
    DateTimePicker_Desde: TDateTimePicker;
    DateTimePicker_Fecha_Ftra: TDateTimePicker;
    DateTimePicker_Hasta: TDateTimePicker;
    DBCheckBox_IVA_con_Recargo_SN: TDBCheckBox;
    DBCheckBox_IVA_Excluido_SN: TDBCheckBox;
    DBCheckBox_Portes_Pagados_por_Cliente: TDBCheckBox;
    DBCheckBox_Vencimientos_automaticos_SN: TDBCheckBox;
    DBDateTimePicker_Fecha_Salida_Bultos: TDBDateTimePicker;
    DBEdit_Bultos: TDBEdit;
    DBEdit_Portes_Gastos_Envio: TDBEdit;
    DBGrid_Principal: TDBGrid;
    DBMemo_Comentarios_a_Imprimir: TDBMemo;
    DBMemo_Condiciones_Entrega: TDBMemo;
    DBMemo_Observaciones: TDBMemo;
    DBNavigator1: TDBNavigator;
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
    Edit_Descripcion_Empresa: TEdit;
    Edit_Descripcion_Forma_Pago: TEdit;
    Edit_Descripcion_Forma_Pago1: TEdit;
    Edit_Descripcion_id_Almacenes: TEdit;
    Edit_Descripcion_id_Clientes: TEdit;
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
    Edit_id_Almacenes: TEdit;
    Edit_id_Clientes: TEdit;
    Edit_id_Empresas: TEdit;
    Edit_id_Forma_Pago: TEdit;
    Edit_id_Vehiculos: TEdit;
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
    Edit_Vencimientos_1_Dias: TEdit;
    GroupBox1: TGroupBox;
    GroupBox10: TGroupBox;
    GroupBox13: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox9: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
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
    Label75: TLabel;
    Label76: TLabel;
    Label48: TLabel;
    Label49: TLabel;
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
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label8: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label9: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label_Almacen: TLabel;
    Label_Ctdad_Rgtros: TLabel;
    Label_Fecha1: TLabel;
    Label_Fecha3: TLabel;
    Label_Vehiculo: TLabel;
    ListBox_a_facturar_Visible_SI: TListBox;
    ListBox_a_facturar_Visible_NO: TListBox;
    Memo_Filtros: TMemo;
    Memo_OrderBy: TMemo;
    PageControl_Comentarios_Observaciones: TPageControl;
    PageControl_Datos_Envio: TPageControl;
    PageControl_Filtros: TPageControl;
    PageControl_Otros_Datos: TPageControl;
    Panel1: TPanel;
    Shape2: TShape;
    TabSheet_Representante: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet9: TTabSheet;
    TabSheet_Busqueda_Concreta: TTabSheet;
    TabSheet_Comentarios_a_Imprimir: TTabSheet;
    TabSheet_Condiciones_Entrega: TTabSheet;
    TabSheet_Datos_Bancarios: TTabSheet;
    TabSheet_Datos_Cliente_Generales: TTabSheet;
    TabSheet_Datos_Comerciales: TTabSheet;
    TabSheet_Datos_Gestion_Cobro: TTabSheet;
    TabSheet_Direccion_Envio: TTabSheet;
    TabSheet_Filtros_Generales: TTabSheet;
    TabSheet_Observaciones: TTabSheet;
    TabSheet_Transportista: TTabSheet;

    procedure Vaciar_Datos_Agencia_de_Transporte;
    procedure Boton_Elegir_Agencia_TransporteClick(Sender: TObject);
    procedure Edit_Direccion_de_Envio_Agencia_Transporte_DescripcionClick(
      Sender: TObject);
    procedure Vaciar_Datos_Envio;
    procedure Edit_Direccion_de_Envio_con_Quien_HablarClick(Sender: TObject);
    procedure Vaciar_Representante;
    procedure Boton_Elegir_Direccion_EnvioClick(Sender: TObject);
    procedure Boton_Elegir_Forma_Pago1Click(Sender: TObject);
    procedure Boton_Elegir_RepresentanteClick(Sender: TObject);
    procedure Comprobar_si_Cabecera_Albaran_igual_Cabecera_Factura(param_msg : TStrings);
    procedure BitBtn_Ver_AlbaranClick(Sender: TObject);
    procedure Edit_Descripcion_Forma_Pago1Click(Sender: TObject);
    procedure Edit_Representante_DescripcionClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Poner_Datos_Representante;
    procedure Activamos_o_No;
    procedure Filtrar_Principal( param_Cambiamos_Filtro : Boolean );
    function  Elegir_Direccion_Envio_del_Cliente : TRecord_Rgtro_Comun;
    function  Hay_Albaranes_Elegidos : Boolean;
    function  Filtrar_Lineas_Detalles( param_Last_Column : TColumn; param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
    procedure para_Empezar;
    procedure Desactivar_A_Facturar;
    procedure Activar_A_Facturar;
    procedure Comprobar_Fecha_SN(param_msg : TStrings);
    procedure Comprobar_Almacen_SN(param_msg : TStrings);
    procedure Comprobar_Empresa_SN(param_msg : TStrings);
    procedure Comprobar_Cliente_SN(param_msg : TStrings);
    function  Add_Albaran : Boolean;
    function  Esta_Duplicado_SN : Boolean;
    procedure Vaciar_Cliente_Datos;
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
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure Filtrar_Principal_Sin_Preguntar;
    procedure BitBtn_FiltrarClick(Sender: TObject);
    procedure BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
    procedure Presentar_Datos;
    procedure Presentar_Datos_Cliente_Generales;
    procedure Presentar_Datos_Bancarios;
    procedure Presentar_Datos_Comerciales;
    procedure Presentar_Datos_Gestion_Cobro;
    procedure Presentar_Datos_Direccion_de_Envio;
    procedure Presentar_Datos_Agencia_de_Transporte;
    procedure CancelButtonClick(Sender: TObject);
    procedure ComboBox_FiltrosChange(Sender: TObject);
    procedure DBGrid_PrincipalCellClick(Column: TColumn);
    procedure DBGrid_PrincipalDblClick(Sender: TObject);
    procedure DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure OKButtonClick(Sender: TObject);
    procedure Boton_Add_AllClick(Sender: TObject);
    procedure Boton_Add_OneClick(Sender: TObject);
    procedure Boton_Del_AllClick(Sender: TObject);
    procedure Boton_Del_OneClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { private declarations }
    private_Salir_OK     : Boolean;
    private_id_almacenes : ShortString;

    function Traer_Proveedores_xID( param_id : ShortString ) : TProveedores;
    function Traer_Clientes_Envios_xID( param_id : ShortString ) : TClientes_Envios;

  public
    { public declarations }
    public_Pulso_Aceptar : Boolean;
  end;

var
  form_facturas_ventas_005: Tform_facturas_ventas_005;

implementation

{$R *.lfm}

uses dm_facturas_ventas, menu, facturas_ventas_000, albaranes_ventas_000;

{ Tform_facturas_ventas_005 }

procedure Tform_facturas_ventas_005.FormCreate(Sender: TObject);
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

    // ********************************************************************************************* //
    // ** Solo para este modulo                                                                   ** //
    // ********************************************************************************************* //
    Boton_Elegir_id_Vehiculos.Visible     := false;
    Label_Vehiculo.Visible                := false;
    Edit_Descripcion_id_Vehiculos.Visible := false;

    Boton_Elegir_id_Almacenes.Visible     := false;
    Label_Almacen.Visible                 := false;
    Edit_Descripcion_id_Almacenes.Visible := false;

    form_Menu.Traer_Configuracion_APP;
    if UpperCase(Trim(form_menu.public_User_Configuracion.Trabajar_Albaranes_con_Vehiculos_SN)) = 'S' then
    begin
        Boton_Elegir_id_Vehiculos.Visible     := true;
        Label_Vehiculo.Visible                := true;
        Edit_Descripcion_id_Vehiculos.Visible := true;
    end;

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

    // ********************************************************************************************* //
    // ** Vaciamos el almacén elegido para comprobar si todos los albaranes elegidos son del mismo** //
    // ** almacén                                                                                 ** //
    // ********************************************************************************************* //
    private_id_almacenes := '';
end;

procedure Tform_facturas_ventas_005.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    Boton_Add_OneClick(Nil);
end;

procedure Tform_facturas_ventas_005.DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    UTI_GEN_Dibujar_Grid( Sender,
                          form_facturas_ventas_000.SQLQuery_Alb_Pdtes,
                          Rect, DataCol, Column, State );
end;

procedure Tform_facturas_ventas_005.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then
    begin
        Boton_Add_OneClick(Nil);
    end;
end;

procedure Tform_facturas_ventas_005.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //form_facturas_ventas_000.Filtrar_tablas_ligadas_Alb_Pdtes;
    end;
end;

procedure Tform_facturas_ventas_005.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //form_facturas_ventas_000.Filtrar_tablas_ligadas_Alb_Pdtes;
end;

procedure Tform_facturas_ventas_005.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := true;
end;

procedure Tform_facturas_ventas_005.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := false;
end;

procedure Tform_facturas_ventas_005.DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
begin
    //form_facturas_ventas_000.Filtrar_tablas_ligadas_Alb_Pdtes;

    case Button of
        nbRefresh : begin
            form_facturas_ventas_000.Refrescar_Registros_Alb_Pdtes;
            Abort;
        end;
    end;
end;

procedure Tform_facturas_ventas_005.ComboBox_FiltrosChange(Sender: TObject);
begin
    Memo_OrderBy.Lines.Clear;
    Memo_OrderBy.Lines.Add( form_facturas_ventas_000.public_Order_By_Alb_Pdtes[ComboBox_Filtros.ItemIndex].Memo_OrderBy );
    BitBtn_FiltrarClick(Nil);
end;

procedure Tform_facturas_ventas_005.Activar_A_Facturar;
begin
    Boton_Add_One.Enabled := true;
    Boton_Add_All.Enabled := true;
    Boton_Del_All.Enabled := true;
    Boton_Del_One.Enabled := true;
end;

procedure Tform_facturas_ventas_005.Desactivar_A_Facturar;
begin
    Boton_Add_One.Enabled := false;
    Boton_Add_All.Enabled := false;
    Boton_Del_All.Enabled := false;
    Boton_Del_One.Enabled := false;

    Boton_Del_AllClick(Nil);
end;

procedure Tform_facturas_ventas_005.Activamos_o_No;
var var_activamos : Boolean;
begin
    // ********************************************************************************************* //
    // ** COMPROBAMOS que esté ya introducido el cliente, la fecha, la empresa y el almacén.      ** //
    // ********************************************************************************************* //
    form_Menu.Traer_Configuracion_APP;
    if UpperCase(Trim(form_menu.public_User_Configuracion.Albaranes_Obligar_Almacen_SN)) = 'S' then
    begin
        if (Trim(Edit_id_Clientes.Text) <> '')  and
           (Trim(Edit_id_Empresas.Text) <> '')  and
           (Trim(Edit_id_Almacenes.Text) <> '') then
        begin
            var_activamos := true;
        end else begin
            var_activamos := false;
        end;
    end else begin
        if (Trim(Edit_id_Clientes.Text) <> '')  and
           (Trim(Edit_id_Empresas.Text) <> '')  then
        begin
            var_activamos := true;
        end else begin
            var_activamos := false;
        end;
    end;

    if var_activamos = true then
    begin
        Activar_A_Facturar;
    end else begin
        Desactivar_A_Facturar;
    end;
end;

procedure Tform_facturas_ventas_005.BitBtn_FiltrarClick(Sender: TObject);
var var_msg : TStrings;
begin
    Activamos_o_No;

    var_msg := TStringList.Create;

    // ********************************************************************************************* //
    // ** COMPROBAMOS SI EL MARGEN DE FECHAS ESTA BIEN INTRODUCIDO                                ** //
    // ********************************************************************************************* //
    if UTI_GEN_Comprobar_2_Fechas( DateTimePicker_Desde,
                                   DateTimePicker_Hasta ) = false then
    begin
        var_msg.Add('* Fechas mal introducidas para margen de albaranes.');
    end;

    if Trim(var_msg.Text) <> '' then
    begin
        UTI_GEN_Aviso(true, var_msg, 'ALGO FALLA.-', True, False);
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
        Filtrar_Principal( true );
    end;
end;

procedure Tform_facturas_ventas_005.Filtrar_Principal( param_Cambiamos_Filtro : Boolean );
begin
    form_facturas_ventas_000.Filtrar_Principal_Alb_Pdtes( DateTimePicker_Hasta,
                                                          DateTimePicker_Desde,
                                                          Edit_id_Almacenes.Text,
                                                          Edit_id_Empresas.Text,
                                                          Edit_id_Forma_Pago.Text,
                                                          Edit_id_Clientes.Text,
                                                          Edit_id_Vehiculos.Text,
                                                          '', // Serie_Albaran
                                                          '', // Numero_Albaran
                                                          Memo_Filtros.Lines,
                                                          Memo_OrderBy.Lines,
                                                          true,
                                                          param_Cambiamos_Filtro );

    Label_Ctdad_Rgtros.Caption := IntToStr(form_facturas_ventas_000.SQLQuery_Alb_Pdtes.RecordCount);
end;

procedure Tform_facturas_ventas_005.BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
begin
    if form_facturas_ventas_000.SQLQuery_Alb_Pdtes.RecordCount > 0 then
    begin
        UTI_RGTRO_Ver_Estado_Registro( 'albaranes_ventas',
                                       form_facturas_ventas_000.SQLQuery_Alb_Pdtes,
                                       form_facturas_ventas_000.DataSource_Alb_Pdtes,
                                       DBGrid_Principal );
    end;
end;

procedure Tform_facturas_ventas_005.Filtrar_Principal_Sin_Preguntar;
begin
    Filtrar_Principal( false );
end;

procedure Tform_facturas_ventas_005.Boton_Elegir_Forma_PagoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_FormasPago( true, false, 80, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Forma_Pago.Text          := Trim(var_Registro.id_1);
        Edit_Descripcion_Forma_Pago.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_facturas_ventas_005.Edit_Descripcion_Forma_PagoClick(Sender: TObject);
begin
    Edit_id_Forma_Pago.Text          := '';
    Edit_Descripcion_Forma_Pago.Text := '';
end;

procedure Tform_facturas_ventas_005.Boton_Elegir_id_VehiculosClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    if Hay_Albaranes_Elegidos = true then Exit;

    var_Registro := UTI_Abrir_Modulo_Vehiculos( true, false, 350, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Vehiculos.Text             := Trim(var_Registro.id_1);
        Edit_Descripcion_id_Vehiculos.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_facturas_ventas_005.Edit_Descripcion_id_VehiculosClick(Sender: TObject);
begin
    if Hay_Albaranes_Elegidos = true then Exit;

    Edit_id_Vehiculos.Text             := '';
    Edit_Descripcion_id_Vehiculos.Text := '';
end;

procedure Tform_facturas_ventas_005.Boton_Elegir_id_AlmacenesClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    if Hay_Albaranes_Elegidos = true then Exit;

    with form_facturas_ventas_000.SQLQuery_Ftra do
    begin
        var_Registro := UTI_Abrir_Modulo_Almacenes( true, false, 260, '1' );
        if var_Registro.id_1 <> '' then
        begin
            Desactivar_A_Facturar;

            FieldByName('id_almacenes').AsString := Trim(var_Registro.id_1);
            Edit_id_Almacenes.Text               := Trim(var_Registro.id_1);
            Edit_Descripcion_id_Almacenes.Text   := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_facturas_ventas_005.Edit_Descripcion_id_AlmacenesClick(Sender: TObject);
begin
    if Hay_Albaranes_Elegidos = true then Exit;

    Edit_id_Almacenes.Text             := '';
    Edit_Descripcion_id_Almacenes.Text := '';

    Desactivar_A_Facturar;
end;

procedure Tform_facturas_ventas_005.Boton_Elegir_EmpresaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    if Hay_Albaranes_Elegidos = true then Exit;

    with form_facturas_ventas_000.SQLQuery_Ftra do
    begin
        var_Registro := UTI_Abrir_Modulo_Empresas( true, false, 250, '1' );
        if var_Registro.id_1 <> '' then
        begin
            Desactivar_A_Facturar;

            FieldByName('id_empresas').AsString            := Trim(var_Registro.id_1);
            Edit_id_Empresas.Text                          := Trim(var_Registro.id_1);
            Edit_Descripcion_Empresa.Text                  := var_Registro.descripcion_1;
            FieldByName('OT_descripcion_empresa').AsString := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_facturas_ventas_005.Edit_Descripcion_EmpresaClick(Sender: TObject);
begin
    if Hay_Albaranes_Elegidos = true then Exit;

    Edit_id_Empresas.Text         := '';
    Edit_Descripcion_Empresa.Text := '';

    Desactivar_A_Facturar;
end;

procedure Tform_facturas_ventas_005.Edit_Descripcion_id_ClientesClick(Sender: TObject);
begin
    if Hay_Albaranes_Elegidos = true then Exit;

    Desactivar_A_Facturar;
    Vaciar_Cliente_Datos;
end;

function Tform_facturas_ventas_005.Hay_Albaranes_Elegidos : Boolean;
var var_msg : TStrings;
begin
    Result := false;

    if form_facturas_ventas_000.ListBox_Comprobador.Items.Count > 0 then
    begin
        var_msg := TStringList.Create;
        var_msg.Add('No se puede, pues ya tiene elegido algún albarán');
        UTI_GEN_Aviso( true,  var_msg, 'NO SE PUEDE ...', True, False );
        var_msg.Free;

        Result := True;
    end;
end;

procedure Tform_facturas_ventas_005.FormClose(Sender: TObject; var CloseAction: TCloseAction);
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
        with form_facturas_ventas_000.SQLQuery_Ftra do
        begin
            // ************************************************************************************* //
            // ** DATOS QUE SON OBLIGADOS POR LO QUE SE DEBE DE AVISAR DE SU FALTA                ** //
            // ************************************************************************************* //
            if form_facturas_ventas_000.ListBox_Comprobador.Items.Count = 0 then
            begin
                var_msg.Add( '* No ha elegido ningún albarán todavía.');
            end;

            if Trim(FieldByName('id_clientes').AsString) = '' then
            begin
                var_msg.Add( '* El cliente.');
            end;

            if Trim(FieldByName('id_empresas').AsString) = '' then
            begin
                var_msg.Add( '* La empresa.');
            end;

            if not DateTimePicker_Fecha_Ftra.DateIsNull then
            begin
                FieldByName('Fecha').Value := DateTimePicker_Fecha_Ftra.Date;
            end;

            if Trim(FieldByName('Fecha').AsString) = '' then
            begin
                var_msg.Add( '* La fecha.');
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
                    var_msg.Add( '* El almacén.');
                end;
            end;
        end;
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
        if form_Menu.public_Salir_OK = False then CloseAction := caNone;
    end else begin
        // ***************************************************************************************** //
        // ** Fue correcto el modo como quiere salir de la aplicación                             ** //
        // ***************************************************************************************** //
        // ** SI ESTAMOS EN MODO DE INSERCCION (CREANDO LA CABECERA), ASIGNAMOS A LA CABECERA SU  ** //
        // ** NUMERACION Y ACTUALIZAMOS EL REGISTRO DE EMPRESA CON EL A GENERAR.                  ** //
        // **                                                                                     ** //
        // **  LUEGO                                                                              ** //
        // **                                                                                     ** //
        // ** Comprobaremos si no se generó algún error por falta de completar algun campo y si se** //
        // ** salió con el botón Ok o Cancel                                                      ** //
        // ***************************************************************************************** //
        if (Trim(var_msg.Text) <> '') and (public_Pulso_Aceptar = true) then
        begin
            UTI_GEN_Aviso(true, var_msg, rs_Falta, True, False);
            // var_msg.Free;
            CloseAction := caNone;
        end else begin
            // var_msg.Free;
            CloseAction := caFree;
        end;
    end;

    var_msg.Free;
end;

procedure Tform_facturas_ventas_005.Vaciar_Cliente_Datos;
begin
    with form_facturas_ventas_000.SQLQuery_Ftra do
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

    Edit_id_Clientes.Text                                       := '';

    Edit_Descripcion_id_Clientes.Text                           := '';
    Edit_Descripcion_id_Vehiculos.Text                          := '';
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

procedure Tform_facturas_ventas_005.Comprobar_Cliente_SN(param_msg : TStrings);
begin
    if Trim(Edit_id_Clientes.Text) = '' then
    begin
        param_msg.Add( '* Elija un cliente al que facturaremos.' );
    end;

    with form_facturas_ventas_000.SQLQuery_Alb_Pdtes do
    begin
        if ( Trim(FieldByName('id_clientes').AsString) <> Trim(Edit_id_Clientes.Text) ) and
           ( Trim(Edit_id_Clientes.Text) <> '' )                                        then
        begin
            param_msg.Add( '* No es el mismo cliente que el elegido para facturar.' );
        end;
    end;
end;

procedure Tform_facturas_ventas_005.Comprobar_Empresa_SN(param_msg : TStrings);
begin
    if Trim(Edit_id_Empresas.Text) = '' then
    begin
        param_msg.Add( '* Elija la empresa con la que facturaremos.' );
    end;

    with form_facturas_ventas_000.SQLQuery_Alb_Pdtes do
    begin
        if ( Trim(FieldByName('id_empresas').AsString) <> Trim(Edit_id_Empresas.Text) ) and
           ( Trim(Edit_id_Empresas.Text) <> '' )                                        then
        begin
            param_msg.Add( '* No es la misma empresa que la elegida y con la que facturaremos.' );
        end;
    end;
end;

procedure Tform_facturas_ventas_005.Comprobar_Almacen_SN(param_msg : TStrings);
begin
    // ********************************************************************************************* //
    // ** Comprobaremos aquellas cosas que se tengan que comprobar si se obliga al uso de almacen ** //
    // ********************************************************************************************* //
    form_Menu.Traer_Configuracion_APP;
    if UpperCase(Trim(form_menu.public_User_Configuracion.Albaranes_Obligar_Almacen_SN)) = 'S' then
    begin
        // ***************************************************************************************** //
        // ** Comprobaremos si se ha introducido o no el almacén                                  ** //
        // ***************************************************************************************** //
        if Trim(Edit_id_Almacenes.Text) = '' then
        begin
            param_msg.Add( '* Elija el almacén con el que facturaremos.' );
        end;

        // ***************************************************************************************** //
        // ** Comprobaremos si se es el mismo almacén por el que filtramos                        ** //
        // ***************************************************************************************** //
        with form_facturas_ventas_000.SQLQuery_Alb_Pdtes do
        begin
            if ( Trim(FieldByName('id_almacenes').AsString) <> Trim(Edit_id_Almacenes.Text) ) and
               ( Trim(Edit_id_Almacenes.Text) <> '' )                                         then
            begin
                param_msg.Add( '* No es el mismo almacén que el elegido y con el que facturaremos.' );
            end;
        end;
    end;

    // ********************************************************************************************* //
    // ** Comprobaremos aquellas cosas que se tengan que comprobar aunque no se oblige al uso del ** //
    // ** almacén                                                                                 ** //
    // ********************************************************************************************* //
    with form_facturas_ventas_000.SQLQuery_Alb_Pdtes do
    begin
        if Trim(private_id_almacenes) <> '' then
        begin
            if Trim(private_id_almacenes) <> Trim(FieldByName('id_almacenes').AsString) then
            begin
                param_msg.Add( '* No es el mismo almacén que el de los albaranes elegidos.' );
            end;
        end;
    end;
end;

procedure Tform_facturas_ventas_005.Comprobar_Fecha_SN(param_msg : TStrings);
begin
    if DateTimePicker_Fecha_Ftra.DateIsNull then
    begin
        param_msg.Add( '* Elija la fecha para facturar.' );
    end;
end;

function Tform_facturas_ventas_005.Esta_Duplicado_SN : Boolean;
var var_Linea           : Integer;
    var_que_Comprobamos : String;
    var_msg             : TStrings;
begin
    with form_facturas_ventas_000.SQLQuery_Alb_Pdtes do
    begin
        Result := False;

        for var_Linea := 1 to form_facturas_ventas_000.ListBox_Comprobador.Items.Count do
        begin
            var_que_Comprobamos := Trim(FieldByName('Serie_Albaran').AsString) +
                                   '{[#NUMERO#]}' + Trim(FieldByName('Numero_Albaran').AsString);

            form_facturas_ventas_000.ListBox_Comprobador.ItemIndex := var_Linea - 1;

            if Trim(form_facturas_ventas_000.ListBox_Comprobador.Items.Strings[form_facturas_ventas_000.ListBox_Comprobador.ItemIndex]) =
               Trim(var_que_Comprobamos) then
            begin
                var_msg := TStringList.Create;
                var_msg.Add('Ya fué elegido para ser facturado.');
                UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
                var_msg.Free;

                Result := True;
                Break;
            end;
        end;
    end;
end;

procedure Tform_facturas_ventas_005.Boton_Add_OneClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;

    Comprobar_Fecha_SN(var_msg);
    Comprobar_Cliente_SN(var_msg);
    Comprobar_Empresa_SN(var_msg);
    Comprobar_Almacen_SN(var_msg);

    if Trim(var_msg.Text) <> '' then
    begin
        UTI_GEN_Aviso(true, var_msg, 'ALGO FALLA.-', True, False);
        var_msg.Free;

        Exit;
    end else begin
        var_msg.Free;
    end;

    if form_facturas_ventas_000.SQLQuery_Alb_Pdtes.RecordCount > 0 then
    begin
        if Esta_Duplicado_SN = True then
        begin
            Exit;
        end;
        Add_Albaran;
    end else begin
        var_msg := TStringList.Create;
        var_msg.Add( '* No hay albaranes para facturar.' );
        UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        var_msg.Free;
    end;
end;

procedure Tform_facturas_ventas_005.Boton_Del_AllClick(Sender: TObject);
begin
    ListBox_a_facturar_Visible_SI.Clear;
    ListBox_a_facturar_Visible_NO.Clear;
    form_facturas_ventas_000.ListBox_Comprobador.Clear;

    // ********************************************************************************************* //
    // ** Vaciamos el almacén elegido para comprobar si todos los albaranes elegidos son del mismo** //
    // ** almacén                                                                                 ** //
    // ********************************************************************************************* //
    private_id_almacenes := '';
end;

procedure Tform_facturas_ventas_005.Boton_Del_OneClick(Sender: TObject);
var var_Linea: Integer;
begin
    if form_facturas_ventas_000.ListBox_Comprobador.Items.Count > 0 then
    begin
        for var_Linea:= 1 to form_facturas_ventas_000.ListBox_Comprobador.items.Count do
        begin
            form_facturas_ventas_000.ListBox_Comprobador.itemindex := var_Linea - 1;

            if form_facturas_ventas_000.ListBox_Comprobador.Items.Strings[form_facturas_ventas_000.ListBox_Comprobador.ItemIndex] =
               ListBox_a_facturar_Visible_NO.Items.Strings[ListBox_a_facturar_Visible_SI.ItemIndex] then
            begin
                form_facturas_ventas_000.ListBox_Comprobador.items.Delete(form_facturas_ventas_000.ListBox_Comprobador.ItemIndex);
                Break;
            end;
        end;

        ListBox_a_facturar_Visible_NO.items.Delete(ListBox_a_facturar_Visible_SI.ItemIndex);
        ListBox_a_facturar_Visible_SI.items.Delete(ListBox_a_facturar_Visible_SI.ItemIndex);

        if form_facturas_ventas_000.ListBox_Comprobador.Items.Count = 0 then
        begin
            // ************************************************************************************* //
            // ** Vaciamos el almacén elegido para comprobar si todos los albaranes elegidos son  ** //
            // ** del mismo almacén                                                               ** //
            // ************************************************************************************* //
            private_id_almacenes := '';
        end;
    end;
end;

procedure Tform_facturas_ventas_005.Boton_Add_AllClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;

    Comprobar_Fecha_SN(var_msg);
    Comprobar_Cliente_SN(var_msg);
    Comprobar_Empresa_SN(var_msg);
    Comprobar_Almacen_SN(var_msg);

    if Trim(var_msg.Text) <> '' then
    begin
        UTI_GEN_Aviso(true, var_msg, 'ALGO FALLA.-', True, False);
        var_msg.Free;

        Exit;
    end;

    ListBox_a_facturar_Visible_SI.Clear;
    ListBox_a_facturar_Visible_NO.Clear;
    form_facturas_ventas_000.ListBox_Comprobador.Clear;

    with form_facturas_ventas_000.SQLQuery_Alb_Pdtes do
    begin
        if RecordCount > 0 then
        begin
            First;
            while not Eof do
            begin
                Comprobar_Empresa_SN(var_msg);
                Comprobar_Almacen_SN(var_msg);
                if Trim(var_msg.Text) <> '' then
                begin
                    UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);

                    Break;
                end else begin
                    if Add_Albaran = False then
                    begin
                        Break;
                    end;
                end;

                Next;
            end;
        end else begin
            var_msg := TStringList.Create;
            var_msg.Add( '* No hay albaranes para facturar.' );
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        end;
    end;

    var_msg.Free;
end;

procedure Tform_facturas_ventas_005.para_Empezar;
begin
    // ********************************************************************************************* //
    // ** Preparamos los diferentes tipos de orden preconfigurados                                ** //
    // ********************************************************************************************* //
    // ** ALUMNOS/CLIENTES                                                                        ** //
    // ********************************************************************************************* //
    SetLength(form_facturas_ventas_000.public_Order_By_Alb_Pdtes, 4);

    form_facturas_ventas_000.public_Order_By_Alb_Pdtes[0].Titulo       := 'Por fecha';
    form_facturas_ventas_000.public_Order_By_Alb_Pdtes[0].Memo_OrderBy := 'a.Fecha ASC, a.Serie_Albaran ASC, a.Numero_Albaran ASC';

    form_facturas_ventas_000.public_Order_By_Alb_Pdtes[1].Titulo       := 'Por el número de albarán'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    form_facturas_ventas_000.public_Order_By_Alb_Pdtes[1].Memo_OrderBy := 'a.Serie_Albaran ASC, a.Numero_Albaran ASC';

    form_facturas_ventas_000.public_Order_By_Alb_Pdtes[2].Titulo       := 'Por empresa';
    form_facturas_ventas_000.public_Order_By_Alb_Pdtes[2].Memo_OrderBy := 'a.id_empresas ASC, a.Fecha ASC, a.Serie_Albaran ASC, a.Numero_Albaran ASC';

    form_facturas_ventas_000.public_Order_By_Alb_Pdtes[3].Titulo       := 'Por cliente';
    form_facturas_ventas_000.public_Order_By_Alb_Pdtes[3].Memo_OrderBy := 'a.id_clientes ASC, a.Fecha ASC, a.Serie_Albaran ASC, a.Numero_Albaran ASC';

    Memo_OrderBy.Lines.Text          := form_facturas_ventas_000.public_Order_By_Alb_Pdtes[3].Memo_OrderBy;

    UTI_TB_Rellenar_ComboBox_Orden( true,
                                    ComboBox_Filtros,
                                    form_facturas_ventas_000.public_Order_By_Alb_Pdtes,
                                    3 );

    // ********************************************************************************************* //
    // ** LINEAS DETALLE                                                                          ** //
    // ********************************************************************************************* //
    SetLength(form_facturas_ventas_000.public_Order_By_Lineas_Detalles_Alb_Pdtes, 1);

    form_facturas_ventas_000.public_Order_By_Lineas_Detalles_Alb_Pdtes[0].Titulo       := 'Por id del albarán'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    form_facturas_ventas_000.public_Order_By_Lineas_Detalles_Alb_Pdtes[0].Memo_OrderBy := 'ad.id_albaranes ASC, ad.id ASC';

    // ********************************************************************************************* //
    // ** Filtramos los datos                                                                     ** //
    // ********************************************************************************************* //
    Filtrar_Principal_Sin_Preguntar;

    Presentar_Datos;

    // ********************************************************************************************* //
    // ** SOLO PARA ESTE FORM                                                                     ** //
    // ********************************************************************************************* //
    PageControl_Filtros.ActivePage                   := TabSheet_Busqueda_Concreta;
    PageControl_Datos_Envio.ActivePage               := TabSheet_Direccion_Envio;
    PageControl_Comentarios_Observaciones.ActivePage := TabSheet_Comentarios_a_Imprimir;
    PageControl_Otros_Datos.ActivePage               := TabSheet_Datos_Cliente_Generales;
end;

function Tform_facturas_ventas_005.Filtrar_Lineas_Detalles( param_Last_Column : TColumn;
                                                            param_ver_bajas : ShortInt;
                                                            param_Cambiamos_Filtro : Boolean;
                                                            param_Lineas_Filtro,
                                                            param_Lineas_OrderBy : TStrings ) : ShortInt;
begin
    Result := form_facturas_ventas_000.Filtrar_Lineas_Detalles_Alb_Pdtes( param_ver_bajas,
                                                                          param_Cambiamos_Filtro,
                                                                          param_Lineas_Filtro,
                                                                          param_Lineas_OrderBy );
end;

procedure Tform_facturas_ventas_005.Boton_Elegir_id_ClientesClick(Sender: TObject);
var var_Rgtro : TRecord_Rgtro_Comun;
begin
    if Hay_Albaranes_Elegidos = true then Exit;

    with form_facturas_ventas_000.SQLQuery_Ftra do
    begin
        // ***************************************************************************************** //
        // ** Continuamos                                                                         ** //
        // ***************************************************************************************** //
        var_Rgtro := UTI_Abrir_Modulo_Clientes( true, false, 50, '1' );
        if var_Rgtro.id_1 <> '' then
        begin
            Desactivar_A_Facturar;

            form_facturas_ventas_000.Rellenar_Datos_Cliente_a_Ftra( Trim(var_Rgtro.id_1) );

            Edit_id_Clientes.Text             := FieldByName('id_clientes').AsString;
            Edit_Descripcion_id_Clientes.Text := FieldByName('OT_descripcion_cliente').AsString;
            Poner_Datos_Representante;
            Presentar_Datos;
        end;
    end;
end;

procedure Tform_facturas_ventas_005.Poner_Datos_Representante;
begin
    with form_facturas_ventas_000.SQLQuery_Ftra do
    begin
        Edit_Representante_Descripcion.Text := FieldByName('OT_descripcion_representante').AsString;
        Edit_Representante_Comision.Text    := FieldByName('Comision_Representante').AsString;
        Edit_Representante_Retencion.Text   := FieldByName('Retencion_Representante').AsString;
        Edit_Representante_Tfno.Text        := FieldByName('OT_tfno_1_representante').AsString;
        Edit_Representante_Tfno_Movil.Text  := FieldByName('OT_Movil_representante').AsString;
    end;
end;

procedure Tform_facturas_ventas_005.BitBtn_Ver_AlbaranClick(Sender: TObject);
var var_msg   : TStrings;
    var_Fecha : TDate;
begin
    with form_facturas_ventas_000.SQLQuery_Alb_Pdtes do
    begin
        if RecordCount = 0 then
        begin
            var_msg := TStringList.Create;
            var_msg.Add('No ha elegido ningún albarán.');
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;

            Exit;
        end;

        if UTI_GEN_Form_Abierto_Ya('form_albaranes_ventas_000') = false then
        begin
            Application.CreateForm(Tform_albaranes_ventas_000, form_albaranes_ventas_000);

            form_albaranes_ventas_000.public_Solo_Ver    := false;
            form_albaranes_ventas_000.public_Elegimos    := false;
            form_albaranes_ventas_000.public_Menu_Worked := 430;

            // ************************************************************************************* //
            // ** Vemos si hay que retocar el filtro de fechas para encontrar el albarán          ** //
            // ************************************************************************************* //
            if not FieldByName('Fecha').IsNull then
            begin
                var_Fecha := StrToDate(FieldByName('Fecha').AsString);

                if var_Fecha < form_albaranes_ventas_000.DateTimePicker_Desde.Date then
                begin
                    form_albaranes_ventas_000.DateTimePicker_Desde.Date := var_Fecha;
                end;

                if var_Fecha > form_albaranes_ventas_000.DateTimePicker_Hasta.Date then
                begin
                    form_albaranes_ventas_000.DateTimePicker_Hasta.Date := var_Fecha;
                end;
            end;

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
                form_albaranes_ventas_000.Editar_Registro;
            end else begin
                if form_albaranes_ventas_000.SQLQuery_Alb.RecordCount = 0 then
                begin
                    var_msg := TStringList.Create;
                    var_msg.Add('Este albarán no existe.');
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
            form_facturas_ventas_000.Refrescar_Registros_Alb_Pdtes;
        end else begin
            var_msg := TStringList.Create;
            var_msg.Add(rs_Modulo_Abierto);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;
        end;
    end;
end;

procedure Tform_facturas_ventas_005.Edit_Descripcion_Forma_Pago1Click(
  Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS la FORMA DE PAGO?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_facturas_ventas_000.SQLQuery_Ftra.FieldByName('id_formas_pago').Clear;
         Edit_Descripcion_Forma_Pago.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_facturas_ventas_005.Edit_Representante_DescripcionClick(
  Sender: TObject);
begin
    Vaciar_Representante;
end;

procedure Tform_facturas_ventas_005.Vaciar_Representante;
var var_msg : TStrings;
begin
    if UTI_USR_Permiso_SN(form_facturas_ventas_000.public_Menu_Worked, 'M', True) = True then
    begin
        var_msg := TStringList.Create;
        var_msg.Add('¿QUITAMOS los datos del REPRESENTANTE?');
        if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
        begin
            with form_facturas_ventas_000.SQLQuery_Ftra do
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

procedure Tform_facturas_ventas_005.Vaciar_Datos_Envio;
var var_msg : TStrings;
begin
    if UTI_USR_Permiso_SN(form_facturas_ventas_000.public_Menu_Worked, 'M', True) = True then
    begin
        var_msg := TStringList.Create;
        var_msg.Add('¿QUITAMOS los datos de la DIRECCION DE ENVIO?');
        if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
        begin
            with form_facturas_ventas_000.SQLQuery_Ftra do
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

procedure Tform_facturas_ventas_005.Boton_Elegir_Agencia_TransporteClick(
  Sender: TObject);
var var_Registro               : TRecord_Rgtro_Comun;
    var_Registro_Ag_Transporte : TProveedores;
    var_msg                    : TStrings;
begin
    with form_facturas_ventas_000.SQLQuery_Ftra do
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
            var_Registro := UTI_Abrir_Modulo_Clientes( true, false, 50, '1' );   // 120
            if var_Registro.id_1 <> '' then
            begin
                 Edit_Direccion_de_Envio_Agencia_Transporte_Descripcion.Text := var_Registro.descripcion_1;

                 var_Registro_Ag_Transporte := Traer_Proveedores_xID( Trim(var_Registro.id_2) );
            end;
        end else begin
            // ************************************************************************************* //
            // ** Elegimos en el mantenimiento de proveedores una AGENCIA DE TRANSPORTE           ** //
            // ************************************************************************************* //
            var_Registro := UTI_Abrir_Modulo_Proveedores( true, false, 120, '1' );
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

procedure Tform_facturas_ventas_005.Edit_Direccion_de_Envio_Agencia_Transporte_DescripcionClick
  (Sender: TObject);
begin
    Vaciar_Datos_Agencia_de_Transporte;
end;

procedure Tform_facturas_ventas_005.Vaciar_Datos_Agencia_de_Transporte;
var var_msg : TStrings;
begin
    if UTI_USR_Permiso_SN(form_facturas_ventas_000.public_Menu_Worked, 'M', True) = True then
    begin
        var_msg := TStringList.Create;
        var_msg.Add('¿QUITAMOS los datos de la AGENCIA DE TRANSPORTE?');
        if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
        begin
            with form_facturas_ventas_000.SQLQuery_Ftra do
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

procedure Tform_facturas_ventas_005.Edit_Direccion_de_Envio_con_Quien_HablarClick
  (Sender: TObject);
begin
    Vaciar_Datos_Envio;
end;

procedure Tform_facturas_ventas_005.FormActivate(Sender: TObject);
begin
    If form_facturas_ventas_000.public_Elegimos = true then
    begin
         with Self do
         begin
              Color := $00B9959C;
         end;
    end;
end;

procedure Tform_facturas_ventas_005.Presentar_Datos_Cliente_Generales;
begin
    with form_facturas_ventas_000.SQLQuery_Ftra do
    begin
        if Trim(FieldByName('nombre_propietario').AsString) <> '' then
        begin
           Edit_Descripcion_id_Clientes.Text := Trim(FieldByName('nombre_propietario').AsString);
        end else begin
           Edit_Descripcion_id_Clientes.Text := Trim(FieldByName('nombre_comercial').AsString);
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

procedure Tform_facturas_ventas_005.Presentar_Datos_Bancarios;
begin
    with form_facturas_ventas_000.SQLQuery_Ftra do
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

procedure Tform_facturas_ventas_005.Presentar_Datos_Comerciales;
begin
    with form_facturas_ventas_000.SQLQuery_Ftra do
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

procedure Tform_facturas_ventas_005.Presentar_Datos_Gestion_Cobro;
begin
    with form_facturas_ventas_000.SQLQuery_Ftra do
    begin
        Edit_Descripcion_Forma_Pago1.Text       := FieldByName('OT_descripcion_forma_pago').AsString;

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

procedure Tform_facturas_ventas_005.Presentar_Datos_Direccion_de_Envio;
begin
    with form_facturas_ventas_000.SQLQuery_Ftra do
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

procedure Tform_facturas_ventas_005.Presentar_Datos_Agencia_de_Transporte;
begin
    with form_facturas_ventas_000.SQLQuery_Ftra do
    begin
        Edit_Direccion_de_Envio_Agencia_Transporte_Descripcion.Text := FieldByName('OT_descripcion_transportista').AsString;
        Edit_Direccion_de_Envio_Agencia_Transporte_Tfno_Fijo_1.Text := FieldByName('OT_tfno_1_transportista').AsString;
        Edit_Direccion_de_Envio_Agencia_Transporte_Tfno_Movil.Text  := FieldByName('OT_Movil_transportista').AsString;
    end;
end;

procedure Tform_facturas_ventas_005.Presentar_Datos;
begin
    with form_facturas_ventas_000.SQLQuery_Ftra do
    begin
        Edit_Descripcion_id_Almacenes.Text := FieldByName('OT_descripcion_almacen').AsString;
        Edit_Descripcion_Empresa.Text      := FieldByName('OT_descripcion_empresa').AsString;

        Presentar_Datos_Cliente_Generales;
        Presentar_Datos_Bancarios;
        Presentar_Datos_Comerciales;
        Presentar_Datos_Gestion_Cobro;
        Presentar_Datos_Direccion_de_Envio;
        Presentar_Datos_Agencia_de_Transporte;
    end;
end;

function Tform_facturas_ventas_005.Add_Albaran : Boolean;
var var_msg : TStrings;
begin
    Result := False;

    with form_facturas_ventas_000.SQLQuery_Alb_Pdtes do
    begin
        // ***************************************************************************************** //
        // ** Guardamos el almacén elegido para comprobar si todos los albaranes elegidos son del ** //
        // ** mismo almacén                                                                       ** //
        // ***************************************************************************************** //
        private_id_almacenes := FieldByName('id_almacenes').AsString;

        // ***************************************************************************************** //
        // ** Avisamos si hay diferencias entre la cabecera del albarán y la cabecera de la ftra. ** //
        // **          si hay observaciones.                                                      ** //
        // **          si hay comentarios para ser impresos en el albarán                         ** //
        // ***************************************************************************************** //
        var_msg := TStringList.Create;
        Comprobar_si_Cabecera_Albaran_igual_Cabecera_Factura(var_msg);

        if Trim(var_msg.Text) <> '' then
        begin
            UTI_GEN_Aviso( false, var_msg,
                          Trim(FieldByName('Serie_Albaran').AsString) + '-' + Trim(FieldByName('Numero_Albaran').AsString) + '.- ' +
                          'DIFERENCIAS CON FACTURA.-',
                          True, False);
        end;

        var_msg.Clear;
        if (not FieldByName('Comentarios_a_imprimir_en_Albaran').IsNull) or
           (not FieldByName('Observaciones').IsNull)                     then
        begin

            if not FieldByName('Observaciones').IsNull then
            begin
                var_msg.Add( 'OBSERVACIONES:' );
                var_msg.Add( '--------------' );
                var_msg.Add( Trim(FieldByName('Observaciones').AsString) );
                var_msg.Add( ' ' );
            end;

            if not FieldByName('Comentarios_a_imprimir_en_Albaran').IsNull then
            begin
                var_msg.Add( 'COMENTARIOS PARA IMPRIMIR EN ALBARAN:' );
                var_msg.Add( '-------------------------------------' );
                var_msg.Add( Trim(FieldByName('Comentarios_a_imprimir_en_Albaran').AsString) );
                var_msg.Add( ' ' );
            end;

        end;

        if Trim(var_msg.Text) <> '' then
        begin
            UTI_GEN_Aviso(false, var_msg, 'TENEMOS OBSERVACIONES.-', True, False);
        end;

        var_msg.Free;

        ListBox_a_facturar_Visible_SI.Items.Add( Trim(FieldByName('Serie_Albaran').AsString) + '-' +
                                                 Trim(FieldByName('Numero_Albaran').AsString) + '.- ' +
                                                 Trim(FieldByName('Fecha').AsString) );

        ListBox_a_facturar_Visible_NO.Items.Add( Trim(FieldByName('Serie_Albaran').AsString) +
                                                 '{[#NUMERO#]}' + Trim(FieldByName('Numero_Albaran').AsString) );

        form_facturas_ventas_000.ListBox_Comprobador.Items.Add( Trim(FieldByName('Serie_Albaran').AsString) +
                                                                '{[#NUMERO#]}' + Trim(FieldByName('Numero_Albaran').AsString) );

        Result := True;
    end;
end;

procedure Tform_facturas_ventas_005.Comprobar_si_Cabecera_Albaran_igual_Cabecera_Factura(param_msg : TStrings);
var var_id_clientes                        : ShortString;
    var_nombre_propietario                 : ShortString;
    var_nombre_comercial                   : ShortString;
    var_nif_cif                            : ShortString;
    var_Direccion                          : ShortString;
    var_Direccion_Numero                   : ShortString;
    var_Direccion_Piso_Letra               : ShortString;
    var_Codigo_Postal                      : ShortString;
    var_OT_descripcion_poblacion           : ShortString;
    var_OT_descripcion_provincia           : ShortString;
    var_OT_descripcion_pais                : ShortString;
    var_Tfno_Fijo_1                        : ShortString;
    var_Tfno_Fijo_2                        : ShortString;
    var_FAX                                : ShortString;
    var_Movil                              : ShortString;
    var_Cta_Bco_Entidad                    : ShortString;
    var_Cta_Bco_Sucursal                   : ShortString;
    var_Cta_Bco_Digito_Control             : ShortString;
    var_Cta_Bco_Cuenta                     : ShortString;
    var_Cta_Bco_BIC_SWIFT                  : ShortString;
    var_Cta_Bco_IBAN                       : ShortString;
    var_Cta_Bco_Direccion                  : ShortString;
    var_Cta_Bco_Direccion_Numero           : ShortString;
    var_Cta_Bco_Direccion_Piso_Letra       : ShortString;
    var_Cta_Bco_Codigo_Postal              : ShortString;
    var_OT_Cta_Bco_descripcion_poblacion   : ShortString;
    var_OT_Cta_Bco_descripcion_provincia   : ShortString;
    var_OT_Cta_Bco_descripcion_pais        : ShortString;
    var_Cta_Bco_Mandato_Fecha_de_Firma     : ShortString;
    var_Cta_Bco_Mandato_Ref                : ShortString;
    var_IVA_Excluido_SN                    : ShortString;
    var_IVA_con_Recargo_SN                 : ShortString;
    var_OT_descripcion_tarifa              : ShortString;
    var_Retencion                          : ShortString;
    var_Descuento_Comercial_1              : ShortString;
    var_Descuento_Comercial_2              : ShortString;
    var_Descuento_Pronto_Pago              : ShortString;
    var_Descuento_Final                    : ShortString;
    var_Riesgo_Autorizado                  : ShortString;
    var_OT_descripcion_forma_pago          : ShortString;
    var_Forma_pago_Dia_1                   : ShortString;
    var_Forma_pago_Dia_2                   : ShortString;
    var_Forma_pago_Vacaciones_Dia_Inicio   : ShortString;
    var_Forma_pago_Vacaciones_Mes_Inicio   : ShortString;
    var_Forma_pago_Vacaciones_Dia_Fin      : ShortString;
    var_Forma_pago_Vacaciones_Mes_Fin      : ShortString;
    var_Vencimientos_Cantidad              : ShortString;
    var_Vencimientos_1_Dias                : ShortString;
    var_Vencimientos_Dias_Entre            : ShortString;
    var_OT_descripcion_representante       : ShortString;
    var_OT_tfno_1_representante            : ShortString;
    var_OT_Movil_representante             : ShortString;
    var_Comision_Representante             : ShortString;
    var_Retencion_Representante            : ShortString;
    var_Envio_Con_Quien_Hablar             : ShortString;
    var_Envio_eMail                        : ShortString;
    var_Envio_Tfno_Fijo_1                  : ShortString;
    var_Envio_Tfno_Fijo_2                  : ShortString;
    var_Envio_FAX                          : ShortString;
    var_Envio_Movil                        : ShortString;
    var_Envio_Direccion                    : ShortString;
    var_Envio_Direccion_Numero             : ShortString;
    var_Envio_Direccion_Piso_Letra         : ShortString;
    var_Envio_Codigo_Postal                : ShortString;
    var_OT_Envio_descripcion_poblacion     : ShortString;
    var_OT_Envio_descripcion_provincia     : ShortString;
    var_OT_Envio_descripcion_pais          : ShortString;
    var_OT_descripcion_transportista       : ShortString;
    var_OT_tfno_1_transportista            : ShortString;
    var_OT_Movil_transportista             : ShortString;
    var_OT_descripcion_cliente             : ShortString;
    var_id_poblaciones                     : ShortString;
    var_id_provincias                      : ShortString;
    var_id_paises                          : ShortString;
    var_id_formas_pago                     : ShortString;
    var_Cta_Bco_id_poblaciones             : ShortString;
    var_Cta_Bco_id_provincias              : ShortString;
    var_Cta_Bco_id_paises                  : ShortString;
    var_id_tarifas                         : ShortString;
    var_agencias_transporte_id_proveedores : ShortString;
    var_Vencimientos_automaticos_SN        : ShortString;
    var_Observaciones                      : ShortString;
    var_id_representantes                  : ShortString;
    var_IVA_Excluido_SN_Representante      : ShortString;
    var_IVA_con_Recargo_SN_Representante   : ShortString;
begin
    with form_facturas_ventas_000.SQLQuery_Alb_Pdtes do
    begin
        var_id_clientes                        := FieldByName('id_clientes').AsString;
        var_nombre_propietario                 := FieldByName('nombre_propietario').AsString;
        var_nombre_comercial                   := FieldByName('nombre_comercial').AsString;
        var_nif_cif                            := FieldByName('nif_cif').AsString;
        var_Direccion                          := FieldByName('Direccion').AsString;
        var_Direccion_Numero                   := FieldByName('Direccion_Numero').AsString;
        var_Direccion_Piso_Letra               := FieldByName('Direccion_Piso_Letra').AsString;
        var_Codigo_Postal                      := FieldByName('Codigo_Postal').AsString;
        var_OT_descripcion_poblacion           := FieldByName('OT_descripcion_poblacion').AsString;
        var_OT_descripcion_provincia           := FieldByName('OT_descripcion_provincia').AsString;
        var_OT_descripcion_pais                := FieldByName('OT_descripcion_pais').AsString;
        var_Tfno_Fijo_1                        := FieldByName('Tfno_Fijo_1').AsString;
        var_Tfno_Fijo_2                        := FieldByName('Tfno_Fijo_2').AsString;
        var_FAX                                := FieldByName('FAX').AsString;
        var_Movil                              := FieldByName('Movil').AsString;
        var_Cta_Bco_Entidad                    := FieldByName('Cta_Bco_Entidad').AsString;
        var_Cta_Bco_Sucursal                   := FieldByName('Cta_Bco_Sucursal').AsString;
        var_Cta_Bco_Digito_Control             := FieldByName('Cta_Bco_Digito_Control').AsString;
        var_Cta_Bco_Cuenta                     := FieldByName('Cta_Bco_Cuenta').AsString;
        var_Cta_Bco_BIC_SWIFT                  := FieldByName('Cta_Bco_BIC_SWIFT').AsString;
        var_Cta_Bco_IBAN                       := FieldByName('Cta_Bco_IBAN').AsString;
        var_Cta_Bco_Direccion                  := FieldByName('Cta_Bco_Direccion').AsString;
        var_Cta_Bco_Direccion_Numero           := FieldByName('Cta_Bco_Direccion_Numero').AsString;
        var_Cta_Bco_Direccion_Piso_Letra       := FieldByName('Cta_Bco_Direccion_Piso_Letra').AsString;
        var_Cta_Bco_Codigo_Postal              := FieldByName('Cta_Bco_Codigo_Postal').AsString;
        var_OT_Cta_Bco_descripcion_poblacion   := FieldByName('OT_Cta_Bco_descripcion_poblacion').AsString;
        var_OT_Cta_Bco_descripcion_provincia   := FieldByName('OT_Cta_Bco_descripcion_provincia').AsString;
        var_OT_Cta_Bco_descripcion_pais        := FieldByName('OT_Cta_Bco_descripcion_pais').AsString;
        var_Cta_Bco_Mandato_Fecha_de_Firma     := FieldByName('Cta_Bco_Mandato_Fecha_de_Firma').AsString;
        var_Cta_Bco_Mandato_Ref                := FieldByName('Cta_Bco_Mandato_Ref').AsString;
        var_IVA_Excluido_SN                    := FieldByName('IVA_Excluido_SN').AsString;
        var_IVA_con_Recargo_SN                 := FieldByName('IVA_con_Recargo_SN').AsString;
        var_OT_descripcion_tarifa              := FieldByName('OT_descripcion_tarifa').AsString;
        var_Retencion                          := FieldByName('Retencion').AsString;
        var_Descuento_Comercial_1              := FieldByName('Descuento_Comercial_1').AsString;
        var_Descuento_Comercial_2              := FieldByName('Descuento_Comercial_2').AsString;
        var_Descuento_Pronto_Pago              := FieldByName('Descuento_Pronto_Pago').AsString;
        var_Descuento_Final                    := FieldByName('Descuento_Final').AsString;
        var_Riesgo_Autorizado                  := FieldByName('Riesgo_Autorizado').AsString;
        var_OT_descripcion_forma_pago          := FieldByName('OT_descripcion_forma_pago').AsString;
        var_Forma_pago_Dia_1                   := FieldByName('Forma_pago_Dia_1').AsString;
        var_Forma_pago_Dia_2                   := FieldByName('Forma_pago_Dia_2').AsString;
        var_Forma_pago_Vacaciones_Dia_Inicio   := FieldByName('Forma_pago_Vacaciones_Dia_Inicio').AsString;
        var_Forma_pago_Vacaciones_Mes_Inicio   := FieldByName('Forma_pago_Vacaciones_Mes_Inicio').AsString;
        var_Forma_pago_Vacaciones_Dia_Fin      := FieldByName('Forma_pago_Vacaciones_Dia_Fin').AsString;
        var_Forma_pago_Vacaciones_Mes_Fin      := FieldByName('Forma_pago_Vacaciones_Mes_Fin').AsString;
        var_Vencimientos_Cantidad              := FieldByName('Vencimientos_Cantidad').AsString;
        var_Vencimientos_1_Dias                := FieldByName('Vencimientos_1_Dias').AsString;
        var_Vencimientos_Dias_Entre            := FieldByName('Vencimientos_Dias_Entre').AsString;
        var_OT_descripcion_representante       := FieldByName('OT_descripcion_representante').AsString;
        var_OT_tfno_1_representante            := FieldByName('OT_tfno_1_representante').AsString;
        var_OT_Movil_representante             := FieldByName('OT_Movil_representante').AsString;
        var_Comision_Representante             := FieldByName('Comision_Representante').AsString;
        var_Retencion_Representante            := FieldByName('Retencion_Representante').AsString;
        var_Envio_Con_Quien_Hablar             := FieldByName('Envio_Con_Quien_Hablar').AsString;
        var_Envio_eMail                        := FieldByName('Envio_eMail').AsString;
        var_Envio_Tfno_Fijo_1                  := FieldByName('Envio_Tfno_Fijo_1').AsString;
        var_Envio_Tfno_Fijo_2                  := FieldByName('Envio_Tfno_Fijo_2').AsString;
        var_Envio_FAX                          := FieldByName('Envio_FAX').AsString;
        var_Envio_Movil                        := FieldByName('Envio_Movil').AsString;
        var_Envio_Direccion                    := FieldByName('Envio_Direccion').AsString;
        var_Envio_Direccion_Numero             := FieldByName('Envio_Direccion_Numero').AsString;
        var_Envio_Direccion_Piso_Letra         := FieldByName('Envio_Direccion_Piso_Letra').AsString;
        var_Envio_Codigo_Postal                := FieldByName('Envio_Codigo_Postal').AsString;
        var_OT_Envio_descripcion_poblacion     := FieldByName('OT_Envio_descripcion_poblacion').AsString;
        var_OT_Envio_descripcion_provincia     := FieldByName('OT_Envio_descripcion_provincia').AsString;
        var_OT_Envio_descripcion_pais          := FieldByName('OT_Envio_descripcion_pais').AsString;
        var_OT_descripcion_transportista       := FieldByName('OT_descripcion_transportista').AsString;
        var_OT_tfno_1_transportista            := FieldByName('OT_tfno_1_transportista').AsString;
        var_OT_Movil_transportista             := FieldByName('OT_Movil_transportista').AsString;
        var_OT_descripcion_cliente             := FieldByName('OT_descripcion_cliente').AsString;
        var_id_poblaciones                     := FieldByName('id_poblaciones').AsString;
        var_id_provincias                      := FieldByName('id_provincias').AsString;
        var_id_paises                          := FieldByName('id_paises').AsString;
        var_id_formas_pago                     := FieldByName('id_formas_pago').AsString;
        var_Cta_Bco_id_poblaciones             := FieldByName('Cta_Bco_id_poblaciones').AsString;
        var_Cta_Bco_id_provincias              := FieldByName('Cta_Bco_id_provincias').AsString;
        var_Cta_Bco_id_paises                  := FieldByName('Cta_Bco_id_paises').AsString;
        var_id_tarifas                         := FieldByName('id_tarifas').AsString;
        var_agencias_transporte_id_proveedores := FieldByName('agencias_transporte_id_proveedores').AsString;
        var_Vencimientos_automaticos_SN        := FieldByName('Vencimientos_automaticos_SN').AsString;
        var_Observaciones                      := FieldByName('Observaciones').AsString;
        var_id_representantes                  := FieldByName('id_representantes').AsString;
        var_IVA_Excluido_SN_Representante      := FieldByName('IVA_Excluido_SN_Representante').AsString;
        var_IVA_con_Recargo_SN_Representante   := FieldByName('IVA_con_Recargo_SN_Representante').AsString;
    end;

    with form_facturas_ventas_000.SQLQuery_Ftra do
    begin
        if var_id_clientes <> FieldByName('id_clientes').AsString then
        begin
            param_msg.Add('* Id.de cliente');
        end;

        if var_OT_descripcion_cliente <> FieldByName('OT_descripcion_cliente').AsString then
        begin
            param_msg.Add('* La descripción del cliente');
        end;

        if var_nombre_propietario <> FieldByName('nombre_propietario').AsString then
        begin
           param_msg.Add('* Nombre de propietario');
        end;

        if var_nombre_comercial <> FieldByName('nombre_comercial').AsString then
        begin
           param_msg.Add('* Nombre comercial');
        end;

        if var_nif_cif <> FieldByName('nif_cif').AsString then
        begin
            param_msg.Add('* NIF');
        end;

        if (var_Direccion <> FieldByName('Direccion').AsString)                       or
           (var_Direccion_Numero <> FieldByName('Direccion_Numero').AsString)         or
           (var_Direccion_Piso_Letra <> FieldByName('Direccion_Piso_Letra').AsString) then
        begin
            param_msg.Add('* Dirección');
        end;

        if var_Codigo_Postal <> FieldByName('Codigo_Postal').AsString then
        begin
            param_msg.Add('* Código postal');
        end;

        if var_id_poblaciones <> FieldByName('id_poblaciones').AsString then
        begin
            param_msg.Add('* Id.de población');
        end;

        if var_OT_descripcion_poblacion <> FieldByName('OT_descripcion_poblacion').AsString then
        begin
            param_msg.Add('* Descripción de la población');
        end;

        if var_id_provincias <> FieldByName('id_provincias').AsString then
        begin
            param_msg.Add(' Id.de provincia');
        end;

        if var_OT_descripcion_provincia <> FieldByName('OT_descripcion_provincia').AsString then
        begin
            param_msg.Add('* Descripción de la provincia');
        end;

        if var_id_paises <> FieldByName('id_paises').AsString then
        begin
            param_msg.Add(' Id.de país');
        end;

        if var_OT_descripcion_pais <> FieldByName('OT_descripcion_pais').AsString then
        begin
            param_msg.Add('* Descripción del país');
        end;

        if var_Tfno_Fijo_1 <> FieldByName('Tfno_Fijo_1').AsString then
        begin
            param_msg.Add('* Teléfono 1º');
        end;

        if var_Tfno_Fijo_2 <> FieldByName('Tfno_Fijo_2').AsString then
        begin
            param_msg.Add('* Teléfono 2º');
        end;

        if var_FAX <> FieldByName('FAX').AsString then
        begin
            param_msg.Add('* FAX');
        end;

        if var_Movil <> FieldByName('Movil').AsString then
        begin
            param_msg.Add('* Movil');
        end;

        if var_Cta_Bco_Entidad <> FieldByName('Cta_Bco_Entidad').AsString then
        begin
            param_msg.Add('* Banco de la cuenta bancaria');
        end;

        if var_Cta_Bco_Sucursal <> FieldByName('Cta_Bco_Sucursal').AsString then
        begin
            param_msg.Add('* Sucursal de la cuenta bancaria');
        end;

        if var_Cta_Bco_Digito_Control <> FieldByName('Cta_Bco_Digito_Control').AsString then
        begin
            param_msg.Add('* Dígito de control de la cuenta bancaria');
        end;

        if var_Cta_Bco_Cuenta <> FieldByName('Cta_Bco_Cuenta').AsString then
        begin
            param_msg.Add('* Cuenta de la cuenta bancaria');
        end;

        if var_Cta_Bco_BIC_SWIFT <> FieldByName('Cta_Bco_BIC_SWIFT').AsString then
        begin
            param_msg.Add('* BIC / SWIFT de la cuenta bancaria');
        end;

        if var_Cta_Bco_IBAN <> FieldByName('Cta_Bco_IBAN').AsString then
        begin
            param_msg.Add('* IBAN de la cuenta bancaria');
        end;

        if (var_Cta_Bco_Direccion <> FieldByName('Cta_Bco_Direccion').AsString)                       or
           (var_Cta_Bco_Direccion_Numero <> FieldByName('Cta_Bco_Direccion_Numero').AsString)         or
           (var_Cta_Bco_Direccion_Piso_Letra <> FieldByName('Cta_Bco_Direccion_Piso_Letra').AsString) then
        begin
            param_msg.Add('* La dirección de la cuenta bancaria');
        end;

        if var_Cta_Bco_Codigo_Postal <> FieldByName('Cta_Bco_Codigo_Postal').AsString then
        begin
            param_msg.Add('* Código postal de la cuenta bancaria');
        end;

        if var_Cta_Bco_id_poblaciones <> FieldByName('Cta_Bco_id_poblaciones').AsString then
        begin
            param_msg.Add('* Población de la cuenta bancaria');
        end;

        if var_OT_Cta_Bco_descripcion_poblacion <> FieldByName('OT_Cta_Bco_descripcion_poblacion').AsString then
        begin
            param_msg.Add('* Descripción de la población de la cuenta bancaria');
        end;

        if var_Cta_Bco_id_provincias <> FieldByName('Cta_Bco_id_provincias').AsString then
        begin
            param_msg.Add('* Provincia de la cuenta bancaria');
        end;

        if var_OT_Cta_Bco_descripcion_provincia <> FieldByName('OT_Cta_Bco_descripcion_provincia').AsString then
        begin
            param_msg.Add('* Descripción de la provincia de la cuenta bancaria');
        end;

        if var_Cta_Bco_id_paises <> FieldByName('Cta_Bco_id_paises').AsString then
        begin
            param_msg.Add('* País de la cuenta bancaria');
        end;

        if var_OT_Cta_Bco_descripcion_pais <> FieldByName('OT_Cta_Bco_descripcion_pais').AsString then
        begin
            param_msg.Add('* Descripción de el país de la cuenta bancaria');
        end;

        if var_Cta_Bco_Mandato_Fecha_de_Firma <> FieldByName('Cta_Bco_Mandato_Fecha_de_Firma').AsString then
        begin
            param_msg.Add('* Mandato / Fecha de firma');
        end;

        if var_Cta_Bco_Mandato_Ref <> FieldByName('Cta_Bco_Mandato_Ref').AsString then
        begin
            param_msg.Add('* Mandato / Referencia');
        end;

        if var_IVA_Excluido_SN <> FieldByName('IVA_Excluido_SN').AsString then
        begin
            param_msg.Add('* Régimen de impuestos / Excluido');
        end;

        if var_IVA_con_Recargo_SN <> FieldByName('IVA_con_Recargo_SN').AsString then
        begin
            param_msg.Add('* Régimen de impuestos / Con recargo');
        end;

        if var_id_tarifas <> FieldByName('id_tarifas').AsString then
        begin
            param_msg.Add('* Id.de tarifa');
        end;

        if var_OT_descripcion_tarifa <> FieldByName('OT_descripcion_tarifa').AsString then
        begin
            param_msg.Add('* Descripción de la tarifa');
        end;

        if var_Retencion <> FieldByName('Retencion').AsString then
        begin
            param_msg.Add('* Retención %');
        end;

        if var_Descuento_Comercial_1 <> FieldByName('Descuento_Comercial_1').AsString then
        begin
            param_msg.Add('* Descuento comercial %');
        end;

        if var_Descuento_Comercial_2 <> FieldByName('Descuento_Comercial_2').AsString then
        begin
            param_msg.Add('* Descuento comercial 2 %');
        end;

        if var_Descuento_Pronto_Pago <> FieldByName('Descuento_Pronto_Pago').AsString then
        begin
            param_msg.Add('* Descuento por pronto pago %');
        end;

        if var_Descuento_Final <> FieldByName('Descuento_Final').AsString then
        begin
            param_msg.Add('* Descuento final %');
        end;

        if var_Riesgo_Autorizado <> FieldByName('Riesgo_Autorizado').AsString then
        begin
            param_msg.Add('* Riesgo autorizado');
        end;

        if var_id_formas_pago <> FieldByName('id_formas_pago').AsString then
        begin
            param_msg.Add('* Id.de forma de pago');
        end;

        if var_OT_descripcion_forma_pago <> FieldByName('OT_descripcion_forma_pago').AsString then
        begin
            param_msg.Add('* Descripción de forma de pago');
        end;

        if (var_Forma_pago_Dia_1 <> FieldByName('Forma_pago_Dia_1').AsString) or
           (var_Forma_pago_Dia_2 <> FieldByName('Forma_pago_Dia_2').AsString) then
        begin
            param_msg.Add('* Días de pago');
        end;

        if (var_Forma_pago_Vacaciones_Dia_Inicio <> FieldByName('Forma_pago_Vacaciones_Dia_Inicio').AsString) or
           (var_Forma_pago_Vacaciones_Mes_Inicio <> FieldByName('Forma_pago_Vacaciones_Mes_Inicio').AsString) or
           (var_Forma_pago_Vacaciones_Dia_Fin <> FieldByName('Forma_pago_Vacaciones_Dia_Fin').AsString)       or
           (var_Forma_pago_Vacaciones_Mes_Fin <> FieldByName('Forma_pago_Vacaciones_Mes_Fin').AsString)       then
        begin
            param_msg.Add('* Periodo vacacional');
        end;

        if var_Vencimientos_Cantidad <> FieldByName('Vencimientos_Cantidad').AsString then
        begin
            param_msg.Add('* La cantidad de vencimientos');
        end;

        if var_Vencimientos_1_Dias <> FieldByName('Vencimientos_1_Dias').AsString then
        begin
            param_msg.Add('* Los días del primer vencimiento');
        end;

        if var_Vencimientos_Dias_Entre <> FieldByName('Vencimientos_Dias_Entre').AsString then
        begin
            param_msg.Add('* Días entre vencimientos');
        end;

        if var_Vencimientos_automaticos_SN <> FieldByName('Vencimientos_automaticos_SN').AsString then
        begin
            param_msg.Add('* Generar vencimientos automáticos');
        end;

        if var_id_representantes <> FieldByName('id_representantes').AsString then
        begin
            param_msg.Add('* Id.de representante');
        end;

        if var_OT_descripcion_representante <> FieldByName('OT_descripcion_representante').AsString then
        begin
            param_msg.Add('* Descripción del representante');
        end;

        if var_OT_tfno_1_representante <> FieldByName('OT_tfno_1_representante').AsString then
        begin
            param_msg.Add('* Tfno.1 del representante');
        end;

        if var_OT_Movil_representante <> FieldByName('OT_Movil_representante').AsString then
        begin
            param_msg.Add('* Tfno.movil del representante');
        end;

        if var_Comision_Representante <> FieldByName('Comision_Representante').AsString then
        begin
            param_msg.Add('* Comisión del representante');
        end;

        if var_Retencion_Representante <> FieldByName('Retencion_Representante').AsString then
        begin
            param_msg.Add('* Retención del representante');
        end;

        if var_IVA_Excluido_SN_Representante <> FieldByName('IVA_Excluido_SN_Representante').AsString then
        begin
            param_msg.Add('* Régimen de impuestos / Excluido del representante');
        end;

        if var_IVA_con_Recargo_SN_Representante <> FieldByName('IVA_con_Recargo_SN_Representante').AsString then
        begin
            param_msg.Add('* Régimen de impuestos / Recargo del representante');
        end;

        if var_Envio_Con_Quien_Hablar <> FieldByName('Envio_Con_Quien_Hablar').AsString then
        begin
            param_msg.Add('* Con quién hablar de la dirección de envío');
        end;

        if var_Envio_eMail <> FieldByName('Envio_eMail').AsString then
        begin
            param_msg.Add('* Correo electrónico de la dirección de envío');
        end;

        if var_Envio_Tfno_Fijo_1 <> FieldByName('Envio_Tfno_Fijo_1').AsString then
        begin
            param_msg.Add('* Tfno.1 de la dirección de envío');
        end;

        if var_Envio_Tfno_Fijo_2 <> FieldByName('Envio_Tfno_Fijo_2').AsString then
        begin
            param_msg.Add('* Tfno.2 de la dirección de envío');
        end;

        if var_Envio_FAX <> FieldByName('Envio_FAX').AsString then
        begin
            param_msg.Add('* FAX de la dirección de envío');
        end;

        if var_Envio_Movil <> FieldByName('Envio_Movil').AsString then
        begin
            param_msg.Add('* Movil de la dirección de envío');
        end;

        if (var_Envio_Direccion <> FieldByName('Envio_Direccion').AsString)                       or
           (var_Envio_Direccion_Numero <> FieldByName('Envio_Direccion_Numero').AsString)         or
           (var_Envio_Direccion_Piso_Letra <> FieldByName('Envio_Direccion_Piso_Letra').AsString) then
        begin
            param_msg.Add('* Dirección de envío');
        end;

        if var_Envio_Codigo_Postal <> FieldByName('Envio_Codigo_Postal').AsString then
        begin
            param_msg.Add('* Código Postal de la dirección de envío');
        end;

        if var_OT_Envio_descripcion_poblacion <> FieldByName('OT_Envio_descripcion_poblacion').AsString then
        begin
            param_msg.Add('* Descripción de la población de envío');
        end;

        if var_OT_Envio_descripcion_provincia <> FieldByName('OT_Envio_descripcion_provincia').AsString then
        begin
            param_msg.Add('* Descripción de la provincia de envío');
        end;

        if var_OT_Envio_descripcion_pais <> FieldByName('OT_Envio_descripcion_pais').AsString then
        begin
            param_msg.Add('* Descripción del país de envío');
        end;

        if var_agencias_transporte_id_proveedores <> FieldByName('agencias_transporte_id_proveedores').AsString then
        begin
            param_msg.Add('* Id.de la agencia de transporte');
        end;

        if var_OT_descripcion_transportista <> FieldByName('OT_descripcion_transportista').AsString then
        begin
            param_msg.Add('* Descripción de la agencia de transporte');
        end;

        if var_OT_tfno_1_transportista <> FieldByName('OT_tfno_1_transportista').AsString then
        begin
            param_msg.Add('* Tfno.1 de la agencia de transporte');
        end;

        if var_OT_Movil_transportista <> FieldByName('OT_Movil_transportista').AsString then
        begin
            param_msg.Add('* Movil de la agencia de transporte');
        end;

        if var_Observaciones <> FieldByName('Observaciones').AsString then
        begin
            param_msg.Add('* Observaciones');
        end;
    end;

end;

procedure Tform_facturas_ventas_005.Boton_Elegir_Forma_Pago1Click(
  Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_facturas_ventas_000.SQLQuery_Ftra do
    begin
        var_Registro := UTI_Abrir_Modulo_FormasPago( true, false, 80, '1' );
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

function Tform_facturas_ventas_005.Elegir_Direccion_Envio_del_Cliente : TRecord_Rgtro_Comun;
var var_msg : TStrings;
begin
    Result.id_1 := '';

    if Trim(form_facturas_ventas_000.SQLQuery_Ftra.FieldByName('id_clientes').AsString) = '' then
    begin
        var_msg := TStringList.Create;
        var_msg.Add('No has elegido todavía ningún cliente para esta factura.');
        UTI_GEN_Aviso(true, var_msg, 'AVISAMOS DE ... ', True, False);
        var_msg.Free;
        Exit;
    end;

    Result := UTI_CLIENTES_Elegir_Direccion_Envio( form_facturas_ventas_000.SQLQuery_Ftra.FieldByName('id_clientes').AsString,
                                                   form_facturas_ventas_000.public_Menu_Worked );
end;

procedure Tform_facturas_ventas_005.Boton_Elegir_Direccion_EnvioClick(Sender: TObject);
var var_Registro       : TRecord_Rgtro_Comun;
    var_Registro_Envio : TClientes_Envios;
begin
    with form_facturas_ventas_000.SQLQuery_Ftra do
    begin
        if UTI_USR_Permiso_SN(form_facturas_ventas_000.public_Menu_Worked, 'M', True) = True then
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

procedure Tform_facturas_ventas_005.Boton_Elegir_RepresentanteClick(
  Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_facturas_ventas_000.SQLQuery_Ftra do
    begin
        var_Registro := UTI_Abrir_Modulo_Representantes( true, false, 130, '1' );
        if var_Registro.id_1 <> '' then
        begin
            FieldByName('id_representantes').AsString      := Trim(var_Registro.id_1);
            FieldByName('Comision_Representante').AsString := Trim(var_Registro.id_2);

            Edit_Representante_Descripcion.Text            := var_Registro.descripcion_1;
            Edit_Representante_Comision.Text               := var_Registro.id_2;
            Edit_Representante_Retencion.Text              := var_Registro.id_3;

            Edit_Representante_Tfno.Text                   := var_Registro.descripcion_2;
            Edit_Representante_Tfno_Movil.Text             := var_Registro.descripcion_3;

            form_facturas_ventas_000.Rellenar_Datos_Representante_a_Ftra( Trim(var_Registro.id_1) );
            Poner_Datos_Representante;
        end;
    end;
end;

function Tform_facturas_ventas_005.Traer_Proveedores_xID( param_id : ShortString ) : TProveedores;
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

function Tform_facturas_ventas_005.Traer_Clientes_Envios_xID( param_id : ShortString ) : TClientes_Envios;
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


