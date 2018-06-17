unit servicios_regulares_000;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, DateTimePicker, DBDateTimePicker, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, ButtonPanel, DbCtrls, DBGrids, MaskEdit,
  Spin, EditBtn, DBExtCtrls, plantilla_000, utilidades_datos_tablas, types, Grids, utilidades_usuarios,
  utilidades_general, utilidades_Filtros, variants, utilidades_forms_Filtrar, utilidades_rgtro,
  utilidades_bd, utilidades_servicios;

resourcestring
  rs_serv_regulares_014 = 'Temporada repetida para este servicio regular.';
  rs_serv_regulares_015 = 'Error al comprobar si la temporada ya fué puesta para este servicio regular. La tabla ha sido ';
  rs_serv_regulares_016 = ' desde el módulo ';
  rs_serv_regulares_017 = 'Por fechas';
  rs_serv_regulares_018 = '* La empresa puesta para el servicio no es la misma que la empresa de la serie elegida para el servicio.';
  rs_serv_regulares_019 = '* La SERIE para el servicio.';
  rs_serv_regulares_020 = '* La DESCRIPCIÓN.';
  rs_serv_regulares_021 = '* El TIPO DE VEHICULO.';
  rs_serv_regulares_022 = '* La EMPRESA que realizará el servicio.';
  rs_serv_regulares_023 = '* El cliente.';

type

  { Tf_servicios_regulares_000 }

  Tf_servicios_regulares_000 = class(Tform_plantilla_000)
    Bitbtn_Borrar_Fecha_Recogida_Monitor: TBitBtn;
    BitBtn_duplicar: TBitBtn;
    BitBtn_Elegir_Cliente: TBitBtn;
    BitBtn_Elegir_Servicio_Serie: TBitBtn;
    BitBtn_Elegir_TipoServicio: TBitBtn;
    BitBtn_Ver_Situacion_Registro_Temporadas: TBitBtn;
    Boton_Elegir_Acompanante: TBitBtn;
    Boton_Elegir_Contratante: TBitBtn;
    BitBtn_Elegir_Tipo_Vehiculo: TBitBtn;
    BitBtn_Elegir_Empresa: TBitBtn;
    DataSource_Temporadas: TDataSource;
    DBCheckBox_InicioEnCocheras: TPanel;
    DBDateTimePicker_DesdeFecha: TDBDateTimePicker;
    DBDateTimePicker_DesdeHora: TDBDateTimePicker;
    DBDateTimePicker_HastaFecha: TDBDateTimePicker;
    DBDateTimePicker_HastaHora: TDBDateTimePicker;
    DBDateTimePicker_Hora2: TDBDateTimePicker;
    DBEdit_Descripcion: TDBEdit;
    DBEdit_Descripcion1: TDBEdit;
    DBEdit_Descripcion10: TDBEdit;
    DBEdit_Descripcion2: TDBEdit;
    DBEdit_Descripcion3: TDBEdit;
    DBEdit_Descripcion4: TDBEdit;
    DBEdit_Descripcion5: TDBEdit;
    DBEdit_Descripcion6: TDBEdit;
    DBEdit_Descripcion7: TDBEdit;
    DBEdit_Descripcion8: TDBEdit;
    DBEdit_Descripcion9: TDBEdit;
    DBGrid_Temporadas: TDBGrid;
    DBMemo_conductores_condiciones: TDBMemo;
    DBMemo_Conductores_Instrucciones: TDBMemo;
    DBMemo_facturacion_instrucciones: TDBMemo;
    DBMemo_Itinerarios: TDBMemo;
    DBMemo_liquidaciones_instrucciones: TDBMemo;
    DBMemo_montaje_instrucciones: TDBMemo;
    DBMemo_observaciones_generales: TDBMemo;
    DBMemo_Observaciones_Vehiculo: TDBMemo;
    DBNavigator_Temporadas: TDBNavigator;
    Domingo: TDBCheckBox;
    Domingo1: TDBCheckBox;
    Edit_Acompanante_CodigoPostal: TEdit;
    Edit_Acompanante_Direccion: TEdit;
    Edit_Acompanante_eMail: TEdit;
    Edit_Acompanante_Empleado_de: TEdit;
    Edit_Acompanante_FAX: TEdit;
    Edit_Acompanante_Movil: TEdit;
    Edit_Acompanante_NIF: TEdit;
    Edit_Acompanante_NIF_Caducidad: TEdit;
    Edit_Acompanante_Nombre: TEdit;
    Edit_Acompanante_Pais: TEdit;
    Edit_Acompanante_Poblacion: TEdit;
    Edit_Acompanante_Provincia: TEdit;
    Edit_Acompanante_SeguridadSocial: TEdit;
    Edit_Acompanante_Telefono_1: TEdit;
    Edit_Acompanante_Telefono_2: TEdit;
    Edit_Descripcion_Cliente: TEdit;
    Edit_Descripcion_Contratante: TEdit;
    Edit_serie_codigo: TEdit;
    Edit_Descripcion_TipoServicio: TEdit;
    Edit_Descripcion_Tipo_Vehiculo: TEdit;
    Edit_Descripcion_Empresa: TEdit;
    Edit_NIF_Contratante: TEdit;
    Edit_Subcuenta_Cliente: TEdit;
    Edit_Subcuenta_Ventas_de_la_Serie_Servicio: TEdit;
    FueraDelMunicipio: TDBCheckBox;
    FueraDelMunicipio1: TDBCheckBox;
    FueraDelMunicipio2: TDBCheckBox;
    GroupBox10: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    GroupBox_Dias_Servicio: TGroupBox;
    GroupBox_Dias_Servicio1: TGroupBox;
    GroupBox_NIF: TGroupBox;
    Image_Punto_Rojo: TImage;
    Jueves: TDBCheckBox;
    Label10: TLabel;
    Label105: TLabel;
    Label138: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
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
    Label41: TLabel;
    Label44: TLabel;
    Label48: TLabel;
    Label64: TLabel;
    Label_Duplicandose: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label5: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label63: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label9: TLabel;
    Lunes: TDBCheckBox;
    Martes: TDBCheckBox;
    MaskEdit_Horas_Anticipacion: TMaskEdit;
    MaskEdit_Minutos_Anticipacion: TMaskEdit;
    Miercoles: TDBCheckBox;
    PageControl_Montaje: TPageControl;
    PageControl_Otros_Datos: TPageControl;
    Panel_1: TPanel;
    Panel_2: TPanel;
    Panel_3: TPanel;
    Panel_Ultimo_Periodo: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel28: TPanel;
    Panel29: TPanel;
    Panel30: TPanel;
    Panel31: TPanel;
    Panel32: TPanel;
    Panel33: TPanel;
    Panel34: TPanel;
    Panel35: TPanel;
    Panel36: TPanel;
    Panel37: TPanel;
    Panel38: TPanel;
    Panel39: TPanel;
    Panel40: TPanel;
    Panel41: TPanel;
    Panel42: TPanel;
    Panel43: TPanel;
    Panel44: TPanel;
    Panel45: TPanel;
    Panel46: TPanel;
    Panel47: TPanel;
    Panel48: TPanel;
    Panel49: TPanel;
    Panel_10: TPanel;
    Panel_7: TPanel;
    Panel_8: TPanel;
    Panel_9: TPanel;
    Sabado: TDBCheckBox;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    SpinEdit_Ctdad_Conductores: TSpinEdit;
    SQLQuery_Principalacompanante_recogida_hora: TDateTimeField;
    SQLQuery_Principalacompanante_recogida_lugar: TStringField;
    SQLQuery_PrincipalChange_Id_User: TLargeintField;
    SQLQuery_PrincipalChange_WHEN: TDateTimeField;
    SQLQuery_Principalclientes_recogida_lugar: TStringField;
    SQLQuery_Principalconductores_cantidad: TLongintField;
    SQLQuery_Principalconductores_condiciones: TStringField;
    SQLQuery_Principalconductores_instrucciones: TStringField;
    SQLQuery_PrincipalDel_Id_User: TLargeintField;
    SQLQuery_PrincipalDel_WHEN: TDateTimeField;
    SQLQuery_PrincipalDel_WHY: TStringField;
    SQLQuery_Principaldescripcion: TStringField;
    SQLQuery_Principaldomingo_SN: TStringField;
    SQLQuery_Principalfacturar_por_periodo_SN: TStringField;
    SQLQuery_Principalfuera_del_municipio_SN: TStringField;
    SQLQuery_Principalid_clientes: TLargeintField;
    SQLQuery_Principalid_clientes_contratante: TLargeintField;
    SQLQuery_Principalid_empresas: TLargeintField;
    SQLQuery_Principalid_personal_acompanante: TLargeintField;
    SQLQuery_Principalid_series_servicios: TLargeintField;
    SQLQuery_Principalid_servicios_tipos: TLargeintField;
    SQLQuery_Principalid_vehiculos_tipos: TLargeintField;
    SQLQuery_PrincipalInsert_Id_User: TLargeintField;
    SQLQuery_PrincipalInsert_WHEN: TDateTimeField;
    SQLQuery_Principalitinerarios: TStringField;
    SQLQuery_PrincipalItinerarios_imprimir_en_partes_SN: TStringField;
    SQLQuery_Principaljueves_SN: TStringField;
    SQLQuery_Principallibro_ruta_contratante: TStringField;
    SQLQuery_Principallibro_ruta_destino: TStringField;
    SQLQuery_Principallibro_ruta_expediciones: TStringField;
    SQLQuery_Principallibro_ruta_nif: TStringField;
    SQLQuery_Principallibro_ruta_origen: TStringField;
    SQLQuery_Principallunes_SN: TStringField;
    SQLQuery_Principalmartes_SN: TStringField;
    SQLQuery_Principalmiercoles_SN: TStringField;
    SQLQuery_Principalobservaciones_comentarios: TStringField;
    SQLQuery_Principalobservaciones_facturacion: TStringField;
    SQLQuery_Principalobservaciones_montaje: TStringField;
    SQLQuery_Principalobservaciones_para_liquidacion: TStringField;
    SQLQuery_Principalobservaciones_vehiculo: TStringField;
    SQLQuery_PrincipalOT_cliente_BIC_SWIFT: TStringField;
    SQLQuery_PrincipalOT_cliente_codigo_postal: TStringField;
    SQLQuery_PrincipalOT_cliente_cuenta_bancaria: TLongintField;
    SQLQuery_PrincipalOT_cliente_cuenta_contable: TStringField;
    SQLQuery_PrincipalOT_cliente_descripcion: TStringField;
    SQLQuery_PrincipalOT_cliente_direccion: TLongintField;
    SQLQuery_PrincipalOT_cliente_FAX: TStringField;
    SQLQuery_PrincipalOT_cliente_forma_pago_descripcion: TStringField;
    SQLQuery_PrincipalOT_cliente_IBAN: TStringField;
    SQLQuery_PrincipalOT_cliente_Movil: TStringField;
    SQLQuery_PrincipalOT_cliente_NIF: TStringField;
    SQLQuery_PrincipalOT_cliente_poblacion_descripcion: TStringField;
    SQLQuery_PrincipalOT_cliente_provincia_descripcion: TStringField;
    SQLQuery_PrincipalOT_cliente_Tfno_Fijo_1: TStringField;
    SQLQuery_PrincipalOT_cliente_Tfno_Fijo_2: TStringField;
    SQLQuery_PrincipalOT_contratante_descripcion: TStringField;
    SQLQuery_PrincipalOT_contratante_NIF: TStringField;
    SQLQuery_PrincipalOT_empresa_descripcion: TStringField;
    SQLQuery_PrincipalOT_id_empresas_series_servicios: TLargeintField;
    SQLQuery_PrincipalOT_monitor_Codigo_Postal: TStringField;
    SQLQuery_PrincipalOT_monitor_direccion: TLongintField;
    SQLQuery_PrincipalOT_monitor_eMail: TStringField;
    SQLQuery_PrincipalOT_monitor_Empleado_De: TStringField;
    SQLQuery_PrincipalOT_monitor_FAX: TStringField;
    SQLQuery_PrincipalOT_monitor_Movil: TStringField;
    SQLQuery_PrincipalOT_monitor_NIF: TStringField;
    SQLQuery_PrincipalOT_monitor_NIF_caducidad: TDateTimeField;
    SQLQuery_PrincipalOT_monitor_nombre: TStringField;
    SQLQuery_PrincipalOT_monitor_pais_descripcion: TStringField;
    SQLQuery_PrincipalOT_monitor_poblacion_descripcion: TStringField;
    SQLQuery_PrincipalOT_monitor_provincia_descripcion: TStringField;
    SQLQuery_PrincipalOT_monitor_Seguridad_Social: TStringField;
    SQLQuery_PrincipalOT_monitor_Tfno_Fijo_1: TStringField;
    SQLQuery_PrincipalOT_monitor_Tfno_Fijo_2: TStringField;
    SQLQuery_PrincipalOT_periodo_clientes_fin_servicio: TDateTimeField;
    SQLQuery_PrincipalOT_periodo_clientes_recogida_inicio: TDateTimeField;
    SQLQuery_PrincipalOT_periodo_desde_fecha: TDateTimeField;
    SQLQuery_PrincipalOT_periodo_hasta_fecha: TDateTimeField;
    SQLQuery_PrincipalOT_periodo_inicio_en_cocheras_SN: TStringField;
    SQLQuery_PrincipalOT_periodo_inicio_servicio_anticipacion: TDateTimeField;
    SQLQuery_PrincipalOT_series_servicios_descripcion: TStringField;
    SQLQuery_PrincipalOT_series_servicios_subcuenta_ventas: TStringField;
    SQLQuery_PrincipalOT_servicios_tipos_descripcion: TStringField;
    SQLQuery_PrincipalOT_vehiculos_tipos_descripcion: TStringField;
    SQLQuery_Principalplazas: TStringField;
    SQLQuery_Principalpvp: TBCDField;
    SQLQuery_Principalsabado_SN: TStringField;
    SQLQuery_Principalsubcuenta_ventas: TStringField;
    SQLQuery_Principalviernes_SN: TStringField;
    SQLQuery_Temporadas: TSQLQuery;
    SQLQuery_Impuestosid1: TLargeintField;
    SQLQuery_TemporadasChange_Id_User: TLargeintField;
    SQLQuery_TemporadasChange_WHEN: TDateTimeField;
    SQLQuery_Temporadasclientes_fin_servicio: TDateTimeField;
    SQLQuery_Temporadasclientes_recogida_inicio: TDateTimeField;
    SQLQuery_TemporadasDel_Id_User: TLargeintField;
    SQLQuery_TemporadasDel_WHEN: TDateTimeField;
    SQLQuery_TemporadasDel_WHY: TStringField;
    SQLQuery_Temporadasdesde_fecha: TDateTimeField;
    SQLQuery_Temporadashasta_fecha: TDateTimeField;
    SQLQuery_Temporadasid_servicios_regulares: TLargeintField;
    SQLQuery_Temporadasinicio_en_cocheras_SN: TStringField;
    SQLQuery_Temporadasinicio_servicio_anticipacion: TDateTimeField;
    SQLQuery_TemporadasInsert_Id_User: TLargeintField;
    SQLQuery_TemporadasInsert_WHEN: TDateTimeField;
    TabSheet1: TTabSheet;
    TabSheet_Contabilidad: TTabSheet;
    TabSheet_conductores_instrucciones: TTabSheet;
    TabSheet_facturacion_instrucciones: TTabSheet;
    TabSheet_Itinerario: TTabSheet;
    TabSheet_Libro_Ruta: TTabSheet;
    TabSheet_liquidaciones_instrucciones: TTabSheet;
    TabSheet_Monitor: TTabSheet;
    TabSheet_montaje_instrucciones: TTabSheet;
    TabSheet_Montaje_Observaciones: TTabSheet;
    TabSheet_observaciones_generales: TTabSheet;
    TabSheet_Temporadas: TTabSheet;
    TabSheet_vehiculo_instrucciones: TTabSheet;
    Viernes: TDBCheckBox;

    procedure BitBtn_Ver_Situacion_Registro_TemporadasClick(Sender: TObject);
    procedure BitBtn_Elegir_EmpresaClick(Sender: TObject);
    procedure BitBtn_Elegir_Servicio_SerieClick(Sender: TObject);
    procedure BitBtn_Elegir_TipoServicioClick(Sender: TObject);
    procedure Boton_Elegir_AcompananteClick(Sender: TObject);
    procedure DBGrid_PrincipalCellClick(Column: TColumn);
    procedure DBGrid_TemporadasDblClick(Sender: TObject);
    procedure DBGrid_TemporadasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_TemporadasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBNavigator_TemporadasBeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure Edit_Acompanante_CodigoPostalClick(Sender: TObject);
    procedure Edit_Acompanante_Empleado_deClick(Sender: TObject);
    procedure Edit_Acompanante_NIFClick(Sender: TObject);
    procedure Edit_Acompanante_PaisClick(Sender: TObject);
    procedure Edit_Acompanante_PoblacionClick(Sender: TObject);
    procedure Edit_Acompanante_ProvinciaClick(Sender: TObject);
    procedure Edit_Acompanante_SeguridadSocialClick(Sender: TObject);
    procedure Edit_Acompanante_DireccionClick(Sender: TObject);
    procedure Edit_Acompanante_eMailClick(Sender: TObject);
    procedure Edit_Acompanante_FAXClick(Sender: TObject);
    procedure Edit_Acompanante_MovilClick(Sender: TObject);
    procedure Edit_Acompanante_NombreClick(Sender: TObject);
    procedure Edit_Acompanante_Telefono_2Click(Sender: TObject);
    procedure Edit_Descripcion_EmpresaClick(Sender: TObject);
    procedure Edit_serie_codigoClick(Sender: TObject);
    procedure Edit_Descripcion_TipoServicioClick(Sender: TObject);
    procedure Edit_NIF_ContratanteClick(Sender: TObject);
    procedure Edit_Descripcion_ContratanteClick(Sender: TObject);
    procedure Edit_Acompanante_Telefono_1Click(Sender: TObject);
    procedure BitBtn_Elegir_ClienteClick(Sender: TObject);
    procedure Edit_Descripcion_ClienteClick(Sender: TObject);
    procedure BitBtn_Elegir_Tipo_VehiculoClick(Sender: TObject);
    procedure Edit_Descripcion_Tipo_VehiculoClick(Sender: TObject);
    procedure BitBtn_duplicarClick(Sender: TObject);
    procedure Bitbtn_Borrar_Fecha_Recogida_MonitorClick(Sender: TObject);
    procedure SQLQuery_TemporadasAfterPost(DataSet: TDataSet);
    procedure SQLQuery_TemporadasBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_TemporadasBeforePost(DataSet: TDataSet);

    procedure Campo_Foco_en_modo_Edicion_Inserccion; override;
    procedure NewRecord_Insert_SQLQuery_Principal; override;
    procedure Antes_del_Post_Principal_Sin_Rellenar_Permitido_SI( p_msg : TStrings ); override;
    procedure Antes_del_Post_Principal_Sin_Rellenar_Permitido_NO( p_msg, p_msg_Comprobar : TStrings ); override;
    procedure Antes_del_Post_Principal_Asignar_Valores; override;
    procedure Dibujar_Grid_Principal( p_Sender: TObject; const p_Rect: TRect; p_DataCol: Integer; p_Column: TColumn; p_State: TGridDrawState ); override;
    procedure Cerramos_Tablas_Ligadas; override;
    procedure Abrir_Conexiones_con_BD_TablasAdicionales; override;
    procedure Cambiar_WindowState; override;
    procedure para_Empezar_GroupBox_Registro; override;
    procedure Presentar_Datos; override;
    procedure Presentar_Datos_GroupBox_Registro; override;
    procedure Refrescar_Registros; override;
    procedure Refrescar_Registros_TablasLigadas; override;
    procedure Crear_OrderBy_tablas_adicionales; override;
    procedure Crear_tipos_orden_Principal; override;
    procedure Rellenar_Filtros_Impresion(var p_Ordenado_por : String); override;
    procedure Cambiar_Titulo_Form; override;
    procedure Cambiar_Nombre_Tabla_Principal; override;
    procedure Filtrar_tablas_adicionales( var p_Lineas_Filtro : TStrings; var p_Lineas_OrderBy : TStrings ); override;
    procedure Filtrar_Principal_queFiltro( var p_errores_Filtros : TStrings; var p_Registro_CRUD : TRegistro_CRUD; var p_ctdad_Rgtros : Integer; var p_a_Filtrar : TStrings ); override;
    function  Fue_Utilizado_Rgtro_SQLQuery_Principal : ShortInt; override;

  private
    { private declarations }
    private_Order_By_temporadas : array of TOrder_By;

    function  Se_duplico_SN( p_id : String ) : Boolean;
    procedure Borramos_Cliente_Contratante;
    procedure Borrar_Acompanante;
    procedure Rellenar_Datos_Monitor_Elegido(param_id : String);
    function  Filtrar_Temporadas( p_ver_bajas : ShortInt; p_Cambiamos_Filtro : Boolean; p_Lineas_Filtro, p_Lineas_OrderBy : TStrings ) : ShortInt;
    procedure Refrescar_Registros_Temporadas;
    procedure Borrar_Registro_Temporadas;
    procedure Insertar_Registro_Temporadas;
    procedure Editar_Registro_Temporadas;
    procedure Pintar_Dibujar_Celda( p_Sender: TObject; p_Dibujamos_Algo : Boolean; const p_Rect : TRect; p_DataCol : Integer; p_Column : TColumn; p_State : TGridDrawState );
    procedure Solo_Pintar_si_esDiaElegido( p_Sender: TObject; p_valor : String; const p_Rect : TRect; p_DataCol : Integer; p_Column : TColumn; p_State : TGridDrawState );
    function  es_Columna_donde_Dibujamos(p_Column : TColumn) : Boolean;
    function  Traer_Personal_xID( param_id : ShortString ) : TPersonal;

  public
    { public declarations }

  end;

var
  f_servicios_regulares_000: Tf_servicios_regulares_000;

implementation

{$R *.lfm}

uses menu, servicios_regulares_001;

procedure Tf_servicios_regulares_000.SQLQuery_TemporadasAfterPost(DataSet: TDataSet);
begin
  UTI_RGTROS_Grabar( 'servicios_regulares_periodos',
                     SQLTransaction_Principal,
                     SQLQuery_Temporadas,
                     Devolver_hacemos_commit_alFinalizar );

  Refrescar_Registros_Temporadas;
end;

procedure Tf_servicios_regulares_000.SQLQuery_TemporadasBeforeEdit(DataSet: TDataSet);
begin
  UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Temporadas );
end;

procedure Tf_servicios_regulares_000.SQLQuery_TemporadasBeforePost(DataSet: TDataSet);
begin
  UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Temporadas );
end;

procedure Tf_servicios_regulares_000.DBGrid_TemporadasDblClick(Sender: TObject);
begin
  Editar_Registro_Temporadas;
end;

procedure Tf_servicios_regulares_000.DBGrid_TemporadasDrawColumnCell( Sender: TObject;
                                                                      const Rect: TRect;
                                                                            DataCol: Integer;
                                                                            Column: TColumn;
                                                                            State: TGridDrawState );
begin
  UTI_GEN_Dibujar_Grid( Sender, SQLQuery_Temporadas, Rect, DataCol, Column, State );
end;

procedure Tf_servicios_regulares_000.DBGrid_TemporadasKeyDown( Sender: TObject;
                                                                  var Key: Word;
                                                                  Shift: TShiftState );
begin
  if Key = 13 then
  begin
    Editar_Registro_Temporadas;
  end;
end;

procedure Tf_servicios_regulares_000.DBNavigator_TemporadasBeforeAction( Sender: TObject;
                                                                            Button: TDBNavButtonType );
begin
  case Button of
    nbInsert : begin
      Insertar_Registro_Temporadas;
      Abort;
    end;

    nbEdit : begin
      Editar_Registro_Temporadas;
      Abort;
    end;

    nbDelete : begin
      Borrar_Registro_Temporadas;
      Abort;
    end;

    nbRefresh : begin
      Refrescar_Registros_Temporadas;
      Abort;
    end;
  end;
end;

procedure Tf_servicios_regulares_000.BitBtn_Ver_Situacion_Registro_TemporadasClick(Sender: TObject);
begin
  if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
  begin
    if SQLQuery_Temporadas.RecordCount > 0 then
    begin
      UTI_RGTRO_Ver_Estado_Registro( 'servicios_regulares_periodos',
                                     SQLQuery_Temporadas,
                                     DataSource_Temporadas,
                                     DBGrid_Temporadas );
    end;
  end;
end;

function Tf_servicios_regulares_000.Se_duplico_SN( p_id : String ) : Boolean;
begin
  Label_Duplicandose.Visible := true;
  Result                     := false;

  // DUPLICO CABECERA
  Label_Duplicandose.Caption := 'Duplicando cabecera del servicio';
  Application.ProcessMessages;

  if UTI_SERV_Duplicar_Serv_Regular_Cabecera( SQLQuery_Principalid.asString ) = false then
    Exit;

  // Se terminó la duñlicación
  Label_Duplicandose.Visible := false;
  Result                     := True;

  Application.ProcessMessages;
end;

procedure Tf_servicios_regulares_000.BitBtn_duplicarClick(Sender: TObject);
var var_msg               : TStrings;

    v_id_series_servicios : Largeint;
    v_id_clientes         : Largeint;
    v_descripcion         : String;

    v_Insert_WHEN         : TDateTime;
    v_Insert_Id_User      : Largeint;
begin
  if SQLQuery_Principal.RecordCount = 0 then
  begin
    var_msg := TStringList.Create;
    var_msg.Add('No hay ningún servicio para duplicar.');
    UTI_GEN_Aviso( true,
                   var_msg,
                   rs_No_Se_Puede, True, False );
    var_msg.Free;
    Exit;
  end;

  var_msg := TStringList.Create;
  var_msg.Add('¿Seguro que desea duplicar el servicio regular <<' + SQLQuery_Principaldescripcion.asString + '>> ?');
  if UTI_GEN_Aviso( true,
                    var_msg,
                    rs_OK, True, True ) = True then
  begin
    if Se_duplico_SN(SQLQuery_Principalid.asString) = false then
    begin
      var_msg.Clear;
      var_msg.Add('El servicio regular <<' + SQLQuery_Principaldescripcion.asString + '>> no se pudo duplicar ');
      UTI_GEN_Aviso( true,
                     var_msg,
                     rs_No_Se_Puede, True, False );
    end
    else
      Refrescar_registros;

  end;

  var_msg.Free;
end;

procedure Tf_servicios_regulares_000.NewRecord_Insert_SQLQuery_Principal;
begin
  with SQLQuery_Principal do
  begin
    // ********************************************************************************************* //
    // ** Asignamos valores de inicio si no los tenían                                            ** //
    // ********************************************************************************************* //
    FieldByName('fuera_del_municipio_SN').AsString            := 'N';
    FieldByName('Itinerarios_imprimir_en_partes_SN').AsString := 'S';
    FieldByName('conductores_cantidad').asString              := '1';

    FieldByName('lunes_SN').AsString                          := 'N';
    FieldByName('martes_SN').AsString                         := 'N';
    FieldByName('miercoles_SN').AsString                      := 'N';
    FieldByName('jueves_SN').AsString                         := 'N';
    FieldByName('viernes_SN').AsString                        := 'N';
    FieldByName('sabado_SN').AsString                         := 'N';
    FieldByName('domingo_SN').AsString                        := 'N';
  end;

end;

procedure Tf_servicios_regulares_000.Antes_del_Post_Principal_Sin_Rellenar_Permitido_SI( p_msg : TStrings );
begin
  { Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo

  // *********************************************************************************************** //
  // ** Ahora vienen las comprobaciones de porque no grabamos                                     ** //
  // *********************************************************************************************** //
  with SQLQuery_Principal do
  begin
    if Trim(DBEdit_Descripcion.Text) <> '' then
      FieldByName('descripcion').asString := AnsiUpperCase(Trim(FieldByName('descripcion').AsString))
    else
    begin
      p_msg.Add( rs_bcta_006 );
    end;

    if Trim(FieldByName('id_empresas').AsString) = '' then
    begin
      p_msg.Add( rs_bcta_007 );
    end;
  end;
}
end;

procedure Tf_servicios_regulares_000.Antes_del_Post_Principal_Sin_Rellenar_Permitido_NO( p_msg,
                                                                                         p_msg_Comprobar : TStrings );
begin
  // *********************************************************************************************** //
  // ** Ahora vienen las comprobaciones de porque no grabamos                                     ** //
  // *********************************************************************************************** //
  with SQLQuery_Principal do
  begin

    // ********************************************************************************************* //
    // ** Tengo que comprobar que la empresa puesta en la lengueta de facturación es la misma que ** //
    // ** la de la serie de servicio elegida.                                                     ** //
    // ********************************************************************************************* //
    if FieldByName('OT_id_empresas_series_servicios').AsString <> FieldByName('id_empresas').AsString then
    begin
      p_msg.Add(rs_serv_regulares_018);
    end;

    if Trim(FieldByName('id_series_servicios').AsString) = '' then
    begin
      p_msg.Add(rs_serv_regulares_019);
    end;

    if Trim(FieldByName('descripcion').AsString) = '' then
    begin
      p_msg.Add(rs_serv_regulares_020);
    end;

    if Trim(FieldByName('id_vehiculos_tipos').AsString) = '' then
    begin
      p_msg.Add(rs_serv_regulares_021);
    end;

    if Trim(FieldByName('id_empresas').AsString) = '' then
    begin
      p_msg.Add(rs_serv_regulares_022);
    end;

    if Trim(FieldByName('id_clientes').AsString) = '' then
    begin
      p_msg.Add(rs_serv_regulares_023);
    end;

  end;

end;

procedure Tf_servicios_regulares_000.Antes_del_Post_Principal_Asignar_Valores;
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

procedure Tf_servicios_regulares_000.Pintar_Dibujar_Celda( p_Sender: TObject;
                                                           p_Dibujamos_Algo : Boolean;
                                                           const p_Rect : TRect;
                                                                 p_DataCol : Integer;
                                                                 p_Column : TColumn;
                                                                 p_State : TGridDrawState );
begin
  with p_Sender as TDBGrid do
  begin
    if p_Dibujamos_Algo = false then
      DefaultDrawColumnCell( p_Rect,
                             p_DataCol,
                             p_Column,
                             p_State )
    else
      Canvas.StretchDraw( p_Rect,
                          Image_Punto_Rojo.Picture.Graphic );
  end;
end;

procedure Tf_servicios_regulares_000.Solo_Pintar_si_esDiaElegido( p_Sender: TObject;
                                                                  p_valor : String;
                                                                  const p_Rect : TRect;
                                                                        p_DataCol : Integer;
                                                                        p_Column : TColumn;
                                                                        p_State : TGridDrawState );
begin
  if p_valor = 'S' then
    Pintar_Dibujar_Celda( p_Sender, true, p_Rect, p_DataCol, p_Column, p_State )
  else
    Pintar_Dibujar_Celda( p_Sender, false, p_Rect, p_DataCol, p_Column, p_State );
end;

function Tf_servicios_regulares_000.es_Columna_donde_Dibujamos(p_Column : TColumn) : Boolean;
begin
  Result := true;  // SI ... Dibujamos en esa columna
  if (p_Column.FieldName <> 'es_Lunes')     and
     (p_Column.FieldName <> 'es_Martes')    and
     (p_Column.FieldName <> 'es_Miercoles') and
     (p_Column.FieldName <> 'es_Jueves')    and
     (p_Column.FieldName <> 'es_Viernes')   and
     (p_Column.FieldName <> 'es_Sabado')    and
     (p_Column.FieldName <> 'es_Domingo')   then
  begin
    Result := false; // NO ... Dibujamos en esa columna
  end;
end;

procedure Tf_servicios_regulares_000.Dibujar_Grid_Principal( p_Sender: TObject;
                                                             const p_Rect: TRect;
                                                             p_DataCol: Integer;
                                                             p_Column: TColumn;
                                                             p_State: TGridDrawState );
var var_Color_Normal : TColor;
begin
  with p_Sender as TDBGrid do
  begin
    if SQLQuery_Principal.RecordCount = 0 then Exit;

    var_Color_Normal := Canvas.Brush.Color;

    { Primero comprobamos si es un registro dado de baja o no }
    if not SQLQuery_Principal.FieldByName('Del_WHEN').IsNull then
    begin
      { Registro DADO de BAJA }
      Canvas.Font.Color := clSilver;
    end

    else
    begin
      { Registro de ALTA, cambiamos color pero sólo aquellas columnas que no van a ser dibujadas }
      if p_State <> [gdSelected] then
      begin
        if es_Columna_donde_Dibujamos(p_Column) = false then
          Canvas.font.Color := clBlack;
      end;
    end;

    { Ahora paso a dibujar una celda normal con los colores elegidos o una dibujada }
    if es_Columna_donde_Dibujamos(p_Column) = false then
    begin
      { No es una de las columnas a dibujar por lo que la pinto con los colores elegidos }
      Pintar_Dibujar_Celda( p_Sender, false, p_Rect, p_DataCol, p_Column, p_State );
    end

    else
    begin
      { Es una de las columnas a dibujar }
      if p_Column.FieldName = 'es_Lunes' then
        Solo_Pintar_si_esDiaElegido( p_Sender, SQLQuery_Principal.FieldByName('lunes_SN').asString, p_Rect, p_DataCol, p_Column, p_State );

      if p_Column.FieldName = 'es_Martes' then
        Solo_Pintar_si_esDiaElegido( p_Sender, SQLQuery_Principal.FieldByName('martes_SN').asString, p_Rect, p_DataCol, p_Column, p_State );

      if p_Column.FieldName = 'es_Miercoles' then
        Solo_Pintar_si_esDiaElegido( p_Sender, SQLQuery_Principal.FieldByName('miercoles_SN').asString, p_Rect, p_DataCol, p_Column, p_State );

      if p_Column.FieldName = 'es_Jueves' then
        Solo_Pintar_si_esDiaElegido( p_Sender, SQLQuery_Principal.FieldByName('jueves_SN').asString, p_Rect, p_DataCol, p_Column, p_State );

      if p_Column.FieldName = 'es_Viernes' then
        Solo_Pintar_si_esDiaElegido( p_Sender, SQLQuery_Principal.FieldByName('viernes_SN').asString, p_Rect, p_DataCol, p_Column, p_State );

      if p_Column.FieldName = 'es_Sabado' then
        Solo_Pintar_si_esDiaElegido( p_Sender, SQLQuery_Principal.FieldByName('sabado_SN').asString, p_Rect, p_DataCol, p_Column, p_State );

      if p_Column.FieldName = 'es_Domingo' then
        Solo_Pintar_si_esDiaElegido( p_Sender, SQLQuery_Principal.FieldByName('domingo_SN').asString, p_Rect, p_DataCol, p_Column, p_State );

    end;

    Canvas.Font.Color := var_Color_Normal;
  end;
end;

procedure Tf_servicios_regulares_000.Cerramos_Tablas_Ligadas;
begin
  Cerrar_Tabla( Nil,
                Nil,
                SQLQuery_Temporadas );
end;

procedure Tf_servicios_regulares_000.Abrir_Conexiones_con_BD_TablasAdicionales;
begin
  { Hacer algo parecido a lo de abajo ... pero ojito sólo si hay otras transacciones y otros conectores.
    Lo lógico es que nada más que usemos los de la conexión principal, aunque sean otras tablas adicionales.

  Abrir_Conexion_con_BD( SQLTransaction_Temporadas, SQLConnector_Temporadas);
  }
end;

procedure Tf_servicios_regulares_000.Cambiar_WindowState;
begin
  Self.WindowState := wsNormal; // Puede ser wsNormal, wsFullScreen, wsMaximized o wsMinimized
end;

procedure Tf_servicios_regulares_000.para_Empezar_GroupBox_Registro;
begin
  with SQLQuery_Principal do
  begin
    public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                       '',
                                                       '',

                                                       FieldByName('descripcion').AsString,
                                                       '',
                                                       '' );
  end;

  Presentar_Datos_GroupBox_Registro;
end;

procedure Tf_servicios_regulares_000.Presentar_Datos;
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

procedure Tf_servicios_regulares_000.Presentar_Datos_GroupBox_Registro;
var var_ValorFecha   : Real;
    var_Valor_Minuto : Extended;
    var_Horas        : Extended;
    var_Minutos      : Extended;
begin
  PageControl_Otros_Datos.ActivePage := TabSheet_Itinerario;

  with SQLQuery_Principal do
  begin
    if RecordCount > 0 then
    begin
      Edit_Descripcion_Cliente.Text                   := FieldByName('OT_cliente_descripcion').AsString;
      Edit_Subcuenta_Cliente.Text                     := FieldByName('OT_cliente_cuenta_contable').AsString;

      Edit_Descripcion_Tipo_Vehiculo.Text             := FieldByName('OT_vehiculos_tipos_descripcion').AsString;
      SpinEdit_Ctdad_Conductores.Value                := FieldByName('conductores_cantidad').Value;

      Edit_Acompanante_Nombre.Text                    := FieldByName('OT_monitor_nombre').AsString;
      Edit_Acompanante_Telefono_1.Text                := FieldByName('OT_monitor_Tfno_Fijo_1').AsString;
      Edit_Acompanante_Telefono_2.Text                := FieldByName('OT_monitor_Tfno_Fijo_2').AsString;
      Edit_Acompanante_FAX.Text                       := FieldByName('OT_monitor_FAX').AsString;
      Edit_Acompanante_Movil.Text                     := FieldByName('OT_monitor_Movil').AsString;
      Edit_Acompanante_eMail.Text                     := FieldByName('OT_monitor_eMail').AsString;
      Edit_Acompanante_Direccion.Text                 := FieldByName('OT_monitor_direccion').AsString;
      Edit_Acompanante_CodigoPostal.Text              := FieldByName('OT_monitor_Codigo_Postal').AsString;
      Edit_Acompanante_NIF.Text                       := FieldByName('OT_monitor_NIF').AsString;
      Edit_Acompanante_NIF_Caducidad.Text             := FieldByName('OT_monitor_NIF_caducidad').AsString;
      Edit_Acompanante_Poblacion.Text                 := FieldByName('OT_monitor_poblacion_descripcion').AsString;
      Edit_Acompanante_Provincia.Text                 := FieldByName('OT_monitor_provincia_descripcion').AsString;
      Edit_Acompanante_Pais.Text                      := FieldByName('OT_monitor_pais_descripcion').AsString;
      Edit_Acompanante_Empleado_de.Text               := FieldByName('OT_monitor_Empleado_De').AsString;
      Edit_Acompanante_SeguridadSocial.Text           := FieldByName('OT_monitor_Seguridad_Social').AsString;

      Edit_Descripcion_Contratante.Text               := FieldByName('OT_contratante_descripcion').AsString;
      Edit_NIF_Contratante.Text                       := FieldByName('OT_contratante_NIF').AsString;

      Edit_Descripcion_TipoServicio.Text              := FieldByName('OT_servicios_tipos_descripcion').AsString;

      Edit_serie_codigo.Text                          := FieldByName('OT_series_servicios_descripcion').AsString;
      Edit_Subcuenta_Ventas_de_la_Serie_Servicio.Text := FieldByName('OT_series_servicios_subcuenta_ventas').AsString;

      MaskEdit_Horas_Anticipacion.Text                := '0';
      MaskEdit_Minutos_Anticipacion.Text              := '0';

      if (not FieldByName('OT_periodo_inicio_servicio_anticipacion').IsNull) and
         (not FieldByName('OT_periodo_clientes_recogida_inicio').IsNull)     then
      begin
        var_ValorFecha                     := FieldByName('clientes_recogida_inicio').Value -
                                              FieldByName('inicio_servicio_anticipacion').Value;

        var_Valor_Minuto                   := StrToTime('00:02:00') - StrToTime('00:01:00');
        var_Minutos                        := Round(var_ValorFecha / var_Valor_Minuto);
        var_Horas                          := Trunc(var_Minutos / 60);
        var_Minutos                        := var_Minutos - (var_Horas * 60);

        MaskEdit_Horas_Anticipacion.Text   := FloatToStr(Round(var_Horas));
        MaskEdit_Minutos_Anticipacion.Text := FloatToStr(var_Minutos);
      end;

    end;
  end;
end;

procedure Tf_servicios_regulares_000.Refrescar_Registros;
var v_id_series_servicios : Largeint;
    v_id_clientes         : Largeint;
    v_descripcion         : String;

    v_Insert_WHEN         : TDateTime;
    v_Insert_Id_User      : Largeint;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    v_id_series_servicios := 0;

    with SQLQuery_Principal do
    begin
      if RecordCount > 0 then
      begin
        v_id_series_servicios := FieldByName('id_series_servicios').Value;
        v_id_clientes         := FieldByName('id_clientes').Value;
        v_descripcion         := FieldByName('descripcion').Value;

        v_Insert_WHEN         := FieldByName('Insert_WHEN').Value;
        v_Insert_Id_User      := FieldByName('Insert_Id_User').Value;
      end;
    end;

    Filtrar_Principal_Sin_Preguntar;

    if v_id_series_servicios <> 0 then
    begin
      SQLQuery_Principal.Locate( 'id_series_servicios;id_clientes;descripcion;Insert_WHEN;Insert_Id_User',
                                 VarArrayOf( [ v_id_series_servicios, v_id_clientes, v_descripcion, v_Insert_WHEN, v_Insert_Id_User ] ),
                                 [] );
    end;
end;

procedure Tf_servicios_regulares_000.Refrescar_Registros_TablasLigadas;
begin
  Refrescar_Registros_Temporadas;
end;

procedure Tf_servicios_regulares_000.Crear_OrderBy_tablas_adicionales;
begin
  // Tabla ligada Detalle movimientos entre almacenes
  SetLength(private_Order_By_temporadas, 1);

  private_Order_By_temporadas[0].Titulo       := rs_serv_regulares_017; // El índice 0 siempre será por el que empezará la aplicación y los filtros
  private_Order_By_temporadas[0].Memo_OrderBy := 'srp.id_servicios_regulares ASC, srp.desde_fecha ASC, srp.hasta_fecha ASC, srp.inicio_servicio_anticipacion ASC, srp.clientes_recogida_inicio ASC, srp.clientes_fin_servicio ASC';
end;

procedure Tf_servicios_regulares_000.Crear_tipos_orden_Principal;
begin
  SetLength(public_Order_By, 3);

  public_Order_By[0].Titulo       := 'Por cliente'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
  public_Order_By[0].Memo_OrderBy := 'sr.id_clientes ASC, ' +
                                     'per.inicio_servicio_anticipacion ASC, per.clientes_recogida_inicio ASC, per.clientes_fin_servicio ASC';

  public_Order_By[1].Titulo       := 'Por descripción';
  public_Order_By[1].Memo_OrderBy := 'sr.descripcion ASC, ' +
                                     'per.inicio_servicio_anticipacion ASC, per.clientes_recogida_inicio ASC, per.clientes_fin_servicio ASC';

  public_Order_By[2].Titulo       := 'Por horario';
  public_Order_By[2].Memo_OrderBy := 'per.inicio_servicio_anticipacion ASC, per.clientes_recogida_inicio ASC, per.clientes_fin_servicio ASC';

  Memo_OrderBy.Lines.Text         := public_Order_By[0].Memo_OrderBy;

  UTI_TB_Rellenar_ComboBox_Orden( true,
                                  ComboBox_Filtros,
                                  public_Order_By,
                                  0 );
end;

procedure Tf_servicios_regulares_000.Rellenar_Filtros_Impresion(var p_Ordenado_por : String);
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

procedure Tf_servicios_regulares_000.Cambiar_Titulo_Form;
begin
  Self.Caption := 'Mantenimiento de servicios regulares';
end;

procedure Tf_servicios_regulares_000.Cambiar_Nombre_Tabla_Principal;
begin
  pubic_nombre_tabla_Principal := 'servicios_regulares_periodos';
end;

procedure Tf_servicios_regulares_000.Filtrar_tablas_adicionales( var p_Lineas_Filtro : TStrings;
                                                                 var p_Lineas_OrderBy : TStrings );
var
  var_SQL_ADD : TStrings;
begin
  var_SQL_ADD := TStringList.Create;

  // *********************************************************************************************** //
  // ** TEMPORADAS                                                                                ** //
  // *********************************************************************************************** //
  var_SQL_ADD.Clear;
  var_SQL_ADD.Add( 'srp.id_servicios_regulares = ' + SQLQuery_Principal.FieldByName('id').AsString );
  UTI_TB_SQL_ADD( true,
                  p_Lineas_Filtro,
                  var_SQL_ADD );

  p_Lineas_OrderBy.Clear;
  Filtrar_Temporadas( RadioGroup_Bajas.ItemIndex,
                      false,
                      p_Lineas_Filtro,
                      p_Lineas_OrderBy );
  var_SQL_ADD.Free;
end;

procedure Tf_servicios_regulares_000.Filtrar_Principal_queFiltro( var p_errores_Filtros : TStrings;
                                                                  var p_Registro_CRUD : TRegistro_CRUD;
                                                                  var p_ctdad_Rgtros  : Integer;
                                                                  var p_a_Filtrar     : TStrings );
begin
  p_Registro_CRUD.name_tabla := 'sr';

  p_Registro_CRUD.Delete_SQL := '';

  p_Registro_CRUD.Update_SQL := UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Principal,
                                                              'servicios_regulares',
                                                              'u' );

  p_Registro_CRUD.Insert_SQL := UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Principal,
                                                              'servicios_regulares',
                                                              'i' );

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  p_Registro_CRUD.SELECT_SQL := 'SELECT per.inicio_en_cocheras_SN AS OT_periodo_inicio_en_cocheras_SN,' + ' ' +
                                       'per.desde_fecha AS OT_periodo_desde_fecha,' + ' ' +
                                       'per.hasta_fecha AS OT_periodo_hasta_fecha,' + ' ' +
                                       'per.inicio_servicio_anticipacion AS OT_periodo_inicio_servicio_anticipacion,' + ' ' +
                                       'per.clientes_recogida_inicio AS OT_periodo_clientes_recogida_inicio,' + ' ' +
                                       'per.clientes_fin_servicio AS OT_periodo_clientes_fin_servicio,' + ' ' +

                                       'sr.*,' + ' ' +

                                       'e.nombre_comercial as OT_empresa_descripcion,' + ' ' +

                                       'ss.descripcion as OT_series_servicios_descripcion,' + ' ' +
                                       'ss.subcuenta_ventas as OT_series_servicios_subcuenta_ventas,' + ' ' +
                                       'ss.id_empresas as OT_id_empresas_series_servicios,' + ' ' +

                                       'c.nombre_propietario as OT_cliente_descripcion,' + ' ' +
                                       'c.nif_cif as OT_cliente_NIF,' + ' ' +
                                       'c.Cta_Bco_Entidad || ' + UTI_GEN_Comillas('.') + ' || c.Cta_Bco_Sucursal || ' + UTI_GEN_Comillas('.') + ' || c.Cta_Bco_Digito_Control || ' + UTI_GEN_Comillas('.') + ' || c.Cta_Bco_Cuenta as OT_cliente_cuenta_bancaria,' + ' ' +
                                       'c.Cta_Bco_IBAN as OT_cliente_IBAN,' + ' ' +
                                       'c.Cta_Bco_BIC_SWIFT as OT_cliente_BIC_SWIFT,' + ' ' +
                                       'c.Direccion || c.Direccion_Numero || c.Direccion_Piso_Letra as OT_cliente_direccion,' + ' ' +
                                       'c.Codigo_Postal as OT_cliente_codigo_postal,' + ' ' +
                                       'c.Tfno_Fijo_1 as OT_cliente_Tfno_Fijo_1,' + ' ' +
                                       'c.Tfno_Fijo_2 as OT_cliente_Tfno_Fijo_2,' + ' ' +
                                       'c.FAX as OT_cliente_FAX,' + ' ' +
                                       'c.Movil as OT_cliente_Movil,' + ' ' +
                                       'c.Cuenta_Contable as OT_cliente_cuenta_contable,' + ' ' +

                                       'cfpago.descripcion as OT_cliente_forma_pago_descripcion,' + ' ' +
                                       'cpob.descripcion as OT_cliente_poblacion_descripcion,' + ' ' +
                                       'cprov.descripcion as OT_cliente_provincia_descripcion,' + ' ' +

                                       'cc.nombre_propietario as OT_contratante_descripcion,' + ' ' +
                                       'cc.nif_cif as OT_contratante_NIF,' + ' ' +

                                       'st.descripcion as OT_servicios_tipos_descripcion,' + ' ' +

                                       'p.nombre as OT_monitor_nombre,' + ' ' +
                                       'p.Direccion || p.Direccion_Numero || p.Direccion_Piso_Letra as OT_monitor_direccion,' + ' ' +
                                       'p.Codigo_Postal as OT_monitor_Codigo_Postal,' + ' ' +
                                       'p.nif_cif as OT_monitor_NIF,' + ' ' +
                                       'p.nif_cif_caducidad AS OT_monitor_NIF_caducidad,' + ' ' +
                                       'p.Seguridad_Social as OT_monitor_Seguridad_Social,' + ' ' +
                                       'p.eMail as OT_monitor_eMail,' + ' ' +
                                       'p.Tfno_Fijo_1 as OT_monitor_Tfno_Fijo_1,' + ' ' +
                                       'p.Tfno_Fijo_2 as OT_monitor_Tfno_Fijo_2,' + ' ' +
                                       'p.FAX as OT_monitor_FAX,' + ' ' +
                                       'p.Movil as OT_monitor_Movil,' + ' ' +

                                       'ppob.descripcion as OT_monitor_poblacion_descripcion,' + ' ' +
                                       'pprov.descripcion as OT_monitor_provincia_descripcion,' + ' ' +
                                       'pps.descripcion as OT_monitor_pais_descripcion,' + ' ' +
                                       'pprv.nombre_propietario AS OT_monitor_Empleado_De,' + ' ' +

                                       'vt.descripcion as OT_vehiculos_tipos_descripcion' + ' ' +

                                'FROM servicios_regulares AS sr' + ' ' +

                                'LEFT JOIN ( SELECT servicios_regulares_periodos.*' + ' ' +
                                             'FROM servicios_regulares_periodos' + ' ' +
                                             'ORDER BY servicios_regulares_periodos.id_servicios_regulares,' + ' ' +
                                                       'servicios_regulares_periodos.desde_fecha DESC,' + ' ' +
                                                       'servicios_regulares_periodos.hasta_fecha DESC,' + ' ' +
                                                       'servicios_regulares_periodos.inicio_servicio_anticipacion DESC,' + ' ' +
                                                       'servicios_regulares_periodos.clientes_recogida_inicio DESC,' + ' ' +
                                                       'servicios_regulares_periodos.clientes_fin_servicio DESC' + ' ' +
                                             'LIMIT 1 ) as per' + ' ' +
                                'ON sr.id = per.id_servicios_regulares ' +

                                'LEFT JOIN empresas AS e' + ' ' +
                                'ON sr.id_empresas = e.id' + ' ' +

                                'LEFT JOIN series_servicios AS ss' + ' ' +
                                'ON sr.id_series_servicios = ss.id' + ' ' +

                                'LEFT JOIN clientes AS c' + ' ' +
                                'ON sr.id_clientes = c.id' + ' ' +

                                'LEFT JOIN clientes AS cc' + ' ' +
                                'ON sr.id_clientes_contratante = cc.id' + ' ' +

                                'LEFT JOIN servicios_tipos AS st' + ' ' +
                                'ON sr.id_servicios_tipos = st.id' + ' ' +

                                'LEFT JOIN personal AS p' + ' ' +
                                'ON sr.id_personal_acompanante = p.id' + ' ' +

                                'LEFT JOIN poblaciones AS ppob' + ' ' +
                                'ON ppob.id = p.id_poblaciones' + ' ' +

                                'LEFT JOIN provincias AS pprov' + ' ' +
                                'ON pprov.id = p.id_provincias' + ' ' +

                                'LEFT JOIN paises AS pps' + ' ' +
                                'ON pps.id = p.id_paises' + ' ' +

                                'LEFT JOIN proveedores AS pprv' + ' ' +
                                'ON pprv.id = p.id_Empleado_de' + ' ' +

                                'LEFT JOIN formas_pago AS cfpago' + ' ' +
                                'ON cfpago.id = c.id_formas_pago' + ' ' +

                                'LEFT JOIN poblaciones AS cpob' + ' ' +
                                'ON cpob.id = c.id_poblaciones' + ' ' +

                                'LEFT JOIN provincias AS cprov' + ' ' +
                                'ON cprov.id = c.id_provincias' + ' ' +

                                'LEFT JOIN vehiculos_tipos AS vt' + ' ' +
                                'ON sr.id_vehiculos_tipos = vt.id';

  p_ctdad_Rgtros  := -1;

  UTI_FILTROS_pasarFiltros_aQuery( SQLQuery_Principal, SQLQuery_Filtros, p_errores_Filtros, p_Registro_CRUD, p_ctdad_Rgtros, p_a_Filtrar );
end;

procedure Tf_servicios_regulares_000.Edit_Acompanante_DireccionClick(Sender: TObject);
begin
  Borrar_Acompanante;
end;

procedure Tf_servicios_regulares_000.Edit_Acompanante_eMailClick(Sender: TObject);
begin
  Borrar_Acompanante;
end;

procedure Tf_servicios_regulares_000.Edit_Acompanante_FAXClick(Sender: TObject);
begin
  Borrar_Acompanante
end;

procedure Tf_servicios_regulares_000.Edit_Acompanante_MovilClick(Sender: TObject);
begin
  Borrar_Acompanante
end;

procedure Tf_servicios_regulares_000.Edit_Acompanante_NombreClick(Sender: TObject);
begin
  Borrar_Acompanante;
end;

procedure Tf_servicios_regulares_000.Edit_Acompanante_Telefono_2Click(Sender: TObject);
begin
  Borrar_Acompanante;
end;

procedure Tf_servicios_regulares_000.Edit_Descripcion_EmpresaClick(
  Sender: TObject);
var var_msg : TStrings;
begin
  var_msg := TStringList.Create;
  var_msg.Add('¿QUITAMOS la EMPRESA?');

  if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = true then
  begin
    SQLQuery_Principal.FieldByName('id_empresas').Clear;
    Edit_Descripcion_Empresa.Text := '';
  end;

  var_msg.Free;
end;

procedure Tf_servicios_regulares_000.Edit_serie_codigoClick(Sender: TObject);
var var_msg : TStrings;
begin
  var_msg := TStringList.Create;
  var_msg.Add('¿QUITAMOS la SERIE DEL SERVICIO?');

  if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = true then
  begin
    SQLQuery_Principal.FieldByName('id_series_servicios').Clear;
    Edit_serie_codigo.Text            := '';
    Edit_Subcuenta_Ventas_de_la_Serie_Servicio.Text := '';
  end;

  var_msg.Free;
end;

procedure Tf_servicios_regulares_000.Edit_Descripcion_TipoServicioClick(
  Sender: TObject);
var var_msg : TStrings;
begin
  var_msg := TStringList.Create;
  var_msg.Add('¿QUITAMOS el TIPO DE SERVICIO?');

  if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = true then
  begin
    SQLQuery_Principal.FieldByName('id_servicios_tipos').Clear;
    Edit_Descripcion_TipoServicio.Text := '';
  end;

  var_msg.Free;
end;

procedure Tf_servicios_regulares_000.Edit_NIF_ContratanteClick(
  Sender: TObject);
begin
  Borramos_Cliente_Contratante;
end;

procedure Tf_servicios_regulares_000.Edit_Descripcion_ContratanteClick(Sender: TObject);
begin
  Borramos_Cliente_Contratante;
end;

procedure Tf_servicios_regulares_000.Borramos_Cliente_Contratante;
var var_msg : TStrings;
begin
  var_msg := TStringList.Create;
  var_msg.Add('¿QUITAMOS el CONTRATANTE/CLIENTE?');
  if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = true then
  begin
    SQLQuery_Principal.FieldByName('id_clientes_contratante').Clear;
    Edit_Descripcion_Contratante.Text := '';
    Edit_NIF_Contratante.Text         := '';
  end;
  var_msg.Free;
end;

procedure Tf_servicios_regulares_000.Edit_Acompanante_Telefono_1Click(Sender: TObject);
begin
  Borrar_Acompanante;
end;

procedure Tf_servicios_regulares_000.Edit_Descripcion_ClienteClick(Sender: TObject);
var var_msg : TStrings;
begin
  var_msg := TStringList.Create;
  var_msg.Add('¿QUITAMOS el CLIENTE?');
  if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = true then
  begin
    SQLQuery_Principal.FieldByName('id_clientes').Clear;
    Edit_Descripcion_Cliente.Text := '';
    Edit_Subcuenta_Cliente.Text   := '';
  end;
  var_msg.Free;
end;

procedure Tf_servicios_regulares_000.BitBtn_Elegir_ClienteClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
  with SQLQuery_Principal do
  begin
      var_Registro := UTI_Abrir_Modulo_Clientes( '', '', true, false, '1' );
      if var_Registro.id_1 <> '' then
      begin
           FieldByName('id_clientes').AsString := Trim(var_Registro.id_1);
           Edit_Descripcion_Cliente.Text       := var_Registro.descripcion_1;
           Edit_Subcuenta_Cliente.Text         := var_Registro.descripcion_3;
      end;
  end;
end;

procedure Tf_servicios_regulares_000.BitBtn_Elegir_Tipo_VehiculoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
  with SQLQuery_Principal do
  begin
    var_Registro := UTI_Abrir_Modulo_TiposVehiculos( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
      FieldByName('id_vehiculos_tipos').AsString := Trim(var_Registro.id_1);
      Edit_Descripcion_Tipo_Vehiculo.Text        := var_Registro.descripcion_1;
    end;
  end;
end;

procedure Tf_servicios_regulares_000.Edit_Descripcion_Tipo_VehiculoClick(Sender: TObject);
var var_msg : TStrings;
begin
  var_msg := TStringList.Create;
  var_msg.Add('¿QUITAMOS el TIPO DE VEHICULO?');

  if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = true then
  begin
    SQLQuery_Principal.FieldByName('id_vehiculos_tipos').Clear;
    Edit_Descripcion_Tipo_Vehiculo.Text := '';
  end;

  var_msg.Free;
end;

procedure Tf_servicios_regulares_000.Borrar_Acompanante;
var var_msg : TStrings;
begin
  var_msg := TStringList.Create;
  var_msg.Add('¿QUITAMOS el ACOMPAÑANTE?');

  if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = true then
  begin
    SQLQuery_Principal.FieldByName('id_personal_acompanante').Clear;

    Edit_Acompanante_Nombre.Text          := '';
    Edit_Acompanante_NIF.Text             := '';
    Edit_Acompanante_NIF_Caducidad.Text   := '';
    Edit_Acompanante_Telefono_1.Text      := '';
    Edit_Acompanante_Telefono_2.Text      := '';
    Edit_Acompanante_FAX.Text             := '';
    Edit_Acompanante_Movil.Text           := '';
    Edit_Acompanante_Direccion.Text       := '';
    Edit_Acompanante_CodigoPostal.Text    := '';
    Edit_Acompanante_Poblacion.Text       := '';
    Edit_Acompanante_Provincia.Text       := '';
    Edit_Acompanante_Pais.Text            := '';
    Edit_Acompanante_Empleado_de.Text     := '';
    Edit_Acompanante_SeguridadSocial.Text := '';
    Edit_Acompanante_eMail.Text           := '';
  end;

  var_msg.Free;
end;

procedure Tf_servicios_regulares_000.Edit_Acompanante_NIFClick(Sender: TObject);
begin
  Borrar_Acompanante;
end;

procedure Tf_servicios_regulares_000.Edit_Acompanante_PaisClick(Sender: TObject);
begin
  Borrar_Acompanante;
end;

procedure Tf_servicios_regulares_000.Edit_Acompanante_PoblacionClick(Sender: TObject);
begin
  Borrar_Acompanante;
end;

procedure Tf_servicios_regulares_000.Edit_Acompanante_ProvinciaClick(Sender: TObject);
begin
  Borrar_Acompanante;
end;

procedure Tf_servicios_regulares_000.Edit_Acompanante_SeguridadSocialClick(Sender: TObject);
begin
  Borrar_Acompanante;
end;

procedure Tf_servicios_regulares_000.Edit_Acompanante_CodigoPostalClick(Sender: TObject);
begin
  Borrar_Acompanante;
end;

procedure Tf_servicios_regulares_000.BitBtn_Elegir_TipoServicioClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
  with SQLQuery_Principal do
  begin
    var_Registro := UTI_Abrir_Modulo_ServiciosTipos( '', '', true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
      FieldByName('id_servicios_tipos').AsString := Trim(var_Registro.id_1);
      Edit_Descripcion_TipoServicio.Text         := var_Registro.descripcion_1;
    end;
  end;
end;

procedure Tf_servicios_regulares_000.BitBtn_Elegir_Servicio_SerieClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
  with SQLQuery_Principal do
  begin
    var_Registro := UTI_Abrir_Modulo_ServiciosSeries( '', '', true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
      FieldByName('id_series_servicios').AsString             := Trim(var_Registro.id_1);
      FieldByName('OT_id_empresas_series_servicios').AsString := Trim(var_Registro.id_2);
      Edit_serie_codigo.Text                                  := var_Registro.descripcion_2;
      Edit_Subcuenta_Ventas_de_la_Serie_Servicio.Text         := Trim(var_Registro.id_3);
    end;
  end;

end;

procedure Tf_servicios_regulares_000.BitBtn_Elegir_EmpresaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
  with SQLQuery_Principal do
  begin
    var_Registro := UTI_Abrir_Modulo_Empresas( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
      FieldByName('id_empresas').AsString := Trim(var_Registro.id_1);
      Edit_Descripcion_Empresa.Text       := var_Registro.descripcion_1;
    end;
  end;
end;

procedure Tf_servicios_regulares_000.Boton_Elegir_AcompananteClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
  with SQLQuery_Principal do
  begin
    var_Registro := UTI_Abrir_Modulo_Clientes( '', '', true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
      FieldByName('id_personal_acompanante').AsString := Trim(var_Registro.id_1);
      Rellenar_Datos_Monitor_Elegido(FieldByName('id_personal_acompanante').AsString);
    end;
  end;
end;

procedure Tf_servicios_regulares_000.DBGrid_PrincipalCellClick(Column: TColumn);
begin
  inherited;
end;

procedure Tf_servicios_regulares_000.Bitbtn_Borrar_Fecha_Recogida_MonitorClick(Sender: TObject);
var var_msg : TStrings;
begin
  var_msg := TStringList.Create;
  var_msg.Add('¿QUITAMOS la HORA de RECOGIDA del ACOMPAÑANTE?');
  if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = true then
  begin
    SQLQuery_Principal.FieldByName('acompanante_recogida_hora').Clear;
  end;
  var_msg.Free;
end;

procedure Tf_servicios_regulares_000.Edit_Acompanante_Empleado_deClick(Sender: TObject);
begin
  Borrar_Acompanante;
end;

procedure Tf_servicios_regulares_000.Rellenar_Datos_Monitor_Elegido( param_id : String );
var var_Rgtro : TPersonal;
begin
  if Trim(param_id) = '' then Exit;

  var_Rgtro := Traer_Personal_xID( Trim(param_id) );

  if var_Rgtro.id <> '0' then
  begin
    Edit_Acompanante_Nombre.Text          := var_Rgtro.nombre;
    Edit_Acompanante_NIF.Text             := var_Rgtro.nif_cif;
    Edit_Acompanante_NIF_Caducidad.Text   := var_Rgtro.nif_cif_caducidad;
    Edit_Acompanante_Telefono_1.Text      := var_Rgtro.Tfno_Fijo_1;
    Edit_Acompanante_Telefono_2.Text      := var_Rgtro.Tfno_Fijo_2;
    Edit_Acompanante_FAX.Text             := var_Rgtro.FAX;
    Edit_Acompanante_Movil.Text           := var_Rgtro.Movil;

    Edit_Acompanante_Direccion.Text       := var_Rgtro.Direccion + ' ' +
                                             var_Rgtro.Direccion_Numero + ' ' +
                                             var_Rgtro.Direccion_Piso_Letra;

    Edit_Acompanante_CodigoPostal.Text    := var_Rgtro.Codigo_Postal;
    Edit_Acompanante_Poblacion.Text       := var_Rgtro.OT_descripcion_poblacion;
    Edit_Acompanante_Provincia.Text       := var_Rgtro.OT_descripcion_provincia;
    Edit_Acompanante_Pais.Text            := var_Rgtro.OT_descripcion_pais;
    Edit_Acompanante_Empleado_de.Text     := var_Rgtro.OT_Descripcion_Empleado_De;
    Edit_Acompanante_SeguridadSocial.Text := var_Rgtro.Seguridad_Social;
    Edit_Acompanante_eMail.Text           := var_Rgtro.eMail;
  end;
end;

procedure Tf_servicios_regulares_000.Insertar_Registro_Temporadas;
var
  var_Campos_para_Existe_ya : Array of TCampos_para_Existe_ya;
  var_msg                   : TStrings;
  var_Form                  : Tf_servicios_regulares_001;
  var_record_Existe         : Trecord_Existe;

begin
  if public_Solo_Ver = true then
  begin
    Exit;
  end;

  with SQLQuery_Temporadas do
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

        FieldByName('id_servicios_regulares').AsString       := SQLQuery_Principal.FieldByName('id').AsString;

        FieldByName('inicio_en_cocheras_SN').AsString        := SQLQuery_Principal.FieldByName('inicio_en_cocheras_SN').AsString;
        FieldByName('inicio_servicio_anticipacion').AsString := SQLQuery_Principal.FieldByName('inicio_servicio_anticipacion').AsString;
        FieldByName('clientes_recogida_inicio').AsString     := SQLQuery_Principal.FieldByName('clientes_recogida_inicio').AsString;
        FieldByName('clientes_fin_servicio').AsString        := SQLQuery_Principal.FieldByName('clientes_fin_servicio').AsString;


        var_Form := Tf_servicios_regulares_001.Create(nil);

        var_Form.para_Empezar_GroupBox_Registro;

        var_Form.ShowModal;
        if var_Form.public_Pulso_Aceptar = true then
        begin
          var_Form.Free;

          SetLength(var_Campos_para_Existe_ya, 3);

          var_Campos_para_Existe_ya[0].Campo_Valor  := FieldByName('id_servicios_regulares').AsString;
          var_Campos_para_Existe_ya[0].Campo_Nombre := 'id_servicios_regulares';
          var_Campos_para_Existe_ya[0].Campo_Tipo   := 0; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

          var_Campos_para_Existe_ya[1].Campo_Valor  := FieldByName('desde_fecha').AsString;
          var_Campos_para_Existe_ya[1].Campo_Nombre := 'desde_fecha';
          var_Campos_para_Existe_ya[1].Campo_Tipo   := 2; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

          var_Campos_para_Existe_ya[2].Campo_Valor  := FieldByName('hasta_fecha').AsString;
          var_Campos_para_Existe_ya[2].Campo_Nombre := 'hasta_fecha';
          var_Campos_para_Existe_ya[1].Campo_Tipo   := 2; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

          var_record_Existe := UTI_RGTRO_Existe_Ya( 'servicios_regulares_periodos',                                        // param_nombre_tabla
                                                    'ORDER BY servicios_regulares_periodos.id_servicios_regulares ASC, ' +
                                                             'servicios_regulares_periodos.desde_fecha ASC, ' +
                                                             'servicios_regulares_periodos.hasta_fecha ASC',               // param_order_by
                                                    '',                                                                    // param_id_a_no_traer ... Estoy insertando
                                                    var_Campos_para_Existe_ya );                                           // param_Campos_para_Existe_ya

          if var_record_Existe.Fallo_en_Conexion_BD = true then
          begin
            // var_Form.Free;
            Cancel;
          end else
          begin
            if var_record_Existe.Existe = false then
            begin
              FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
              FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

              UTI_RGTRO_Grabar_Antes( 'servicios_regulares_periodos', SQLQuery_Temporadas );
            end else
            begin
              Cancel;
              var_msg.Clear;

              var_msg.Add(rs_serv_regulares_014);

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

procedure Tf_servicios_regulares_000.Editar_Registro_Temporadas;
var
  var_Campos_para_Existe_ya : Array of TCampos_para_Existe_ya;
  var_msg                   : TStrings;
  var_Form                  : Tf_servicios_regulares_001;
  var_record_Existe         : Trecord_Existe;
  var_id                    : ShortString;

begin
  if public_Solo_Ver = true then
  begin
    Exit;
  end;

  with SQLQuery_Temporadas do
  begin
    var_msg := TStringList.Create;

    if RecordCount > 0 then
    begin
      var_id := FieldByName('id').AsString;

      if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
      begin
        if UTI_RGTRO_isLock( 'servicios_regulares_periodos',
                             FieldByName('id').AsString,
                             true ) = true then
        begin
          Exit;
        end else
        begin
          if UTI_RGTRO_Lock( 'servicios_regulares_periodos',
                             FieldByName('id').AsString ) = true then
               Edit
          else Exit;
        end;

        var_Form := Tf_servicios_regulares_001.Create(nil);

        var_Form.para_Empezar_GroupBox_Registro;

        var_Form.ShowModal;
        if var_Form.public_Pulso_Aceptar = true then
        begin

                    SetLength(var_Campos_para_Existe_ya, 3);

                    var_Campos_para_Existe_ya[0].Campo_Valor  := FieldByName('id_servicios_regulares').AsString;
                    var_Campos_para_Existe_ya[0].Campo_Nombre := 'id_servicios_regulares';
                    var_Campos_para_Existe_ya[0].Campo_Tipo   := 0; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                    var_Campos_para_Existe_ya[1].Campo_Valor  := FieldByName('desde_fecha').AsString;
                    var_Campos_para_Existe_ya[1].Campo_Nombre := 'desde_fecha';
                    var_Campos_para_Existe_ya[1].Campo_Tipo   := 2; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                    var_Campos_para_Existe_ya[2].Campo_Valor  := FieldByName('hasta_fecha').AsString;
                    var_Campos_para_Existe_ya[2].Campo_Nombre := 'hasta_fecha';
                    var_Campos_para_Existe_ya[1].Campo_Tipo   := 2; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                    var_record_Existe := UTI_RGTRO_Existe_Ya( 'servicios_regulares_periodos',                                        // param_nombre_tabla
                                                              'ORDER BY servicios_regulares_periodos.id_servicios_regulares ASC, ' +
                                                                       'servicios_regulares_periodos.desde_fecha ASC, ' +
                                                                       'servicios_regulares_periodos.hasta_fecha ASC',               // param_order_by
                                                              FieldByName('id').AsString,                                            // param_id_a_no_traer ... Estoy insertando
                                                              var_Campos_para_Existe_ya );                                           // param_Campos_para_Existe_ya

          if var_record_Existe.Fallo_en_Conexion_BD = true then
          begin
            var_Form.Free;
            Cancel;
          end else
          begin
            if var_record_Existe.Existe = false then
            begin
              if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( SQLQuery_Temporadas ) = true then
              begin
                FieldByName('Change_WHEN').Value               := UTI_CN_Fecha_Hora;
                FieldByName('Change_Id_User').Value            := Form_Menu.public_User;

                FieldByName('id_servicios_regulares').AsString := SQLQuery_Principal.FieldByName('id').AsString;

                UTI_RGTRO_Grabar_Antes( 'servicios_regulares_periodos', SQLQuery_Temporadas );
              end
              else
              begin
                Cancel;
              end;

              var_Form.Free;
            end else begin
              var_Form.Free;
              Cancel;
              var_msg.Clear;

              var_msg.Add(rs_serv_regulares_014);

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

        UTI_RGTRO_UnLock( 'servicios_regulares_periodos', var_id );
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

procedure Tf_servicios_regulares_000.Borrar_Registro_Temporadas;
begin
  if public_Solo_Ver = true then
  begin
    Exit;
  end;

  if UTI_USR_Permiso_SN(public_Menu_Worked, 'B', True) = True then
  begin
    UTI_RGTRO_Borrar( 'servicios_regulares_periodos',
                      SQLQuery_Temporadas,
                      public_Solo_Ver,
                      public_Menu_Worked );
  end;
end;

procedure Tf_servicios_regulares_000.Refrescar_Registros_Temporadas;
var var_Lineas_Filtro                : TStrings;
    var_Lineas_OrderBy               : TStrings;

    var_id_servicios_regulares       : Largeint;
    var_desde_fecha                  : TDateTime;
    var_hasta_fecha                  : TDateTime;
    var_inicio_en_cocheras_SN        : ShortString;
    var_inicio_servicio_anticipacion : TDateTime;
    var_clientes_recogida_inicio     : TDateTime;
    var_clientes_fin_servicio        : TDateTime;

    var_Hay_Datos                    : Boolean;
    var_ver_Bajas                    : ShortInt;
begin
    // ********************************************************************************************* //
    // ** Solo si la cabecera está en modo EDIT se abren las tablas hijas                         ** //
    // ********************************************************************************************* //
    if SQLQuery_Principal.State <> dsEdit then Exit;

    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_Hay_Datos := false;

    if SQLQuery_Temporadas.RecordCount > 0 then
    begin
        var_Hay_Datos                    := true;

        var_id_servicios_regulares       := SQLQuery_Temporadas.FieldByName('id_servicios_regulares').Value;
        var_desde_fecha                  := SQLQuery_Temporadas.FieldByName('desde_fecha').Value;
        var_hasta_fecha                  := SQLQuery_Temporadas.FieldByName('hasta_fecha').Value;
        var_inicio_en_cocheras_SN        := SQLQuery_Temporadas.FieldByName('inicio_en_cocheras_SN').Value;
        var_inicio_servicio_anticipacion := SQLQuery_Temporadas.FieldByName('inicio_servicio_anticipacion').Value;
        var_clientes_recogida_inicio     := SQLQuery_Temporadas.FieldByName('clientes_recogida_inicio').Value;
        var_clientes_fin_servicio        := SQLQuery_Temporadas.FieldByName('clientes_fin_servicio').Value;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Clear;
    var_Lineas_OrderBy.Clear;

    if Trim(SQLQuery_Principal.FieldByName('id').AsString) <> '' then
         var_Lineas_Filtro.Add('id_servicios_regulares = ' + Trim(SQLQuery_Principal.FieldByName('id').AsString))
    else var_Lineas_Filtro.Add('id_servicios_regulares = Null');

    var_ver_Bajas := RadioGroup_Bajas.ItemIndex;
    Filtrar_Temporadas( var_ver_Bajas,
                        false,
                        var_Lineas_Filtro,
                        var_Lineas_OrderBy );

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;

    if var_Hay_Datos = true then
    begin
      SQLQuery_Temporadas.Locate( 'id_servicios_regulares;desde_fecha;hasta_fecha;inicio_en_cocheras_SN;inicio_servicio_anticipacion;clientes_recogida_inicio;clientes_fin_servicio',
                                  VarArrayOf( [ var_id_servicios_regulares, var_desde_fecha, var_hasta_fecha, var_inicio_en_cocheras_SN, var_inicio_servicio_anticipacion, var_clientes_recogida_inicio, var_clientes_fin_servicio ] ),
                                  [] );
    end;
end;

function Tf_servicios_regulares_000.Filtrar_Temporadas( p_ver_bajas : ShortInt;
                                                        p_Cambiamos_Filtro : Boolean;
                                                        p_Lineas_Filtro,
                                                        p_Lineas_OrderBy : TStrings ) : ShortInt;
var
  var_a_Filtrar_Plus : TStrings;
begin
  var_a_Filtrar_Plus := TStringList.Create;
  var_a_Filtrar_Plus.Clear;

  UTI_FILTROS_Cambiamos_Orden_SN( p_Lineas_OrderBy, private_Order_By_temporadas[0].Memo_OrderBy );

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  Result := UTI_TB_Filtrar( private_Order_By_temporadas,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Temporadas,
                                                          'servicios_regulares_periodos',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Temporadas,
                                                          'servicios_regulares_periodos',
                                                          'i' ),

                            // var_ctdad_Rgtros,
                            -1,

                            SQLTransaction_Principal,
                            SQLConnector_Principal,
                            SQLQuery_Temporadas,

                            // name_tabla,
                            'srp',

                            p_ver_bajas,

                            // SELECT_SQL,
                            'SELECT srp.*' + ' ' +
                            'FROM servicios_regulares_periodos AS srp' + ' ',

                            p_Lineas_Filtro,
                            p_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            p_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true );  // no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_a_Filtrar_Plus.Free;
end;

procedure Tf_servicios_regulares_000.Campo_Foco_en_modo_Edicion_Inserccion;
begin
  Self.ActiveControl := BitBtn_Elegir_Servicio_Serie;
end;

function Tf_servicios_regulares_000.Traer_Personal_xID( param_id : ShortString ) : TPersonal;
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
    var_SQLQuery.Name     := 'SQLQuery_Traer_Personal_xID';
    var_SQLQuery.Database := var_SQLConnector;

    // ***************************************************************************************** //
    // ** Creamos la SQL                                                                      ** //
    // ***************************************************************************************** //
    var_SQLQuery.SQL.Clear;
    var_SQLQuery.SQL.AddStrings( 'SELECT p.*,' + ' ' +

                                        'pf.descripcion AS OT_Descripcion_Personal_Familias,' + ' ' +
                                        'pf.Cuenta_Contable AS OT_Cuenta_Contable_Personal_tipo,' + ' ' +

                                        'prv.nombre_propietario AS OT_Descripcion_Empleado_De,' + ' ' +

                                        'pb.descripcion AS OT_descripcion_poblacion,' + ' ' +
                                        'pr.descripcion AS OT_descripcion_provincia,' + ' ' +
                                        'ps.descripcion AS OT_descripcion_pais,' + ' ' +

                                        'ct_pb.descripcion AS OT_Cta_Bco_descripcion_poblacion,' + ' ' +
                                        'ct_pr.descripcion AS OT_Cta_Bco_descripcion_provincia,' + ' ' +
                                        'ct_ps.descripcion AS OT_Cta_Bco_descripcion_pais' + ' ' +

                                 'FROM personal AS p' + ' ' +

                                 'LEFT JOIN personal_familias AS pf' + ' ' +
                                 'ON p.id_personal_familias = pf.id' + ' ' +

                                 'LEFT JOIN proveedores AS prv' + ' ' +
                                 'ON p.id_Empleado_de = prv.id' + ' ' +

                                 'LEFT JOIN poblaciones AS pb' + ' ' +
                                 'ON p.id_poblaciones = pb.id' + ' ' +

                                 'LEFT JOIN provincias AS pr' + ' ' +
                                 'ON p.id_provincias = pr.id' + ' ' +

                                 'LEFT JOIN paises AS ps' + ' ' +
                                 'ON p.id_paises = ps.id' + ' ' +

                                 'LEFT JOIN poblaciones AS ct_pb' + ' ' +
                                 'ON p.id_Cta_Bco_poblaciones = ct_pb.id' + ' ' +

                                 'LEFT JOIN provincias AS ct_pr' + ' ' +
                                 'ON p.id_Cta_Bco_provincias = ct_pr.id' + ' ' +

                                 'LEFT JOIN paises AS ct_ps' + ' ' +
                                 'ON p.id_Cta_Bco_pais = ct_ps.id' + ' ' );

    // ***************************************************************************************** //
    // ** Continuamos con la confección de la SQL                                             ** //
    // ***************************************************************************************** //
    var_SQLQuery.SQL.Add( 'WHERE p.id = ' + Trim(param_id) );
    var_SQLQuery.SQL.Add( 'ORDER BY p.id ASC' );

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
        Result.id_Empleado_de                   := FieldByName('id_Empleado_de').AsString;
        Result.nombre                           := FieldByName('nombre').AsString;
        Result.id_personal_familias             := FieldByName('id_personal_familias').AsString;
        Result.nif_cif                          := FieldByName('nif_cif').AsString;
        Result.nif_cif_caducidad                := FieldByName('nif_cif_caducidad').AsString;
        Result.Fecha_Nacimiento                 := FieldByName('Fecha_Nacimiento').AsString;
        Result.Tfno_Fijo_1                      := FieldByName('Tfno_Fijo_1').AsString;
        Result.Tfno_Fijo_2                      := FieldByName('Tfno_Fijo_2').AsString;
        Result.FAX                              := FieldByName('FAX').AsString;
        Result.Movil                            := FieldByName('Movil').AsString;
        Result.eMail                            := FieldByName('eMail').AsString;
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
        Result.Activar_Proximidad_SN            := FieldByName('Activar_Proximidad_SN').AsString;
        Result.Cuenta_Contable                  := FieldByName('Cuenta_Contable').AsString;
        Result.Observaciones_Comentarios        := FieldByName('Observaciones_Comentarios').AsString;
        Result.Comision                         := FieldByName('Comision').AsString;
        Result.Controlar_su_Presencia           := FieldByName('Controlar_su_Presencia').AsString;
        Result.Seguridad_Social                 := FieldByName('Seguridad_Social').AsString;

        Result.Insert_WHEN                      := FieldByName('Insert_WHEN').AsString;
        Result.Insert_Id_User                   := FieldByName('Insert_Id_User').AsString;
        Result.Del_WHEN                         := FieldByName('Del_WHEN').AsString;
        Result.Del_Id_User                      := FieldByName('Del_Id_User').AsString;
        Result.Del_WHY                          := FieldByName('Del_WHY').AsString;
        Result.Change_WHEN                      := FieldByName('Change_WHEN').AsString;
        Result.Change_Id_User                   := FieldByName('Change_Id_User').AsString;

        Result.OT_Descripcion_Personal_Familias := FieldByName('OT_Descripcion_Personal_Familias').AsString;
        Result.OT_Cuenta_Contable_Personal_tipo := FieldByName('OT_Cuenta_Contable_Personal_tipo').AsString;
        Result.OT_Descripcion_Empleado_De       := FieldByName('OT_Descripcion_Empleado_De').AsString;
        Result.OT_descripcion_poblacion         := FieldByName('OT_descripcion_poblacion').AsString;
        Result.OT_descripcion_provincia         := FieldByName('OT_descripcion_provincia').AsString;
        Result.OT_descripcion_pais              := FieldByName('OT_descripcion_pais').AsString;
        Result.OT_Cta_Bco_descripcion_poblacion := FieldByName('OT_Cta_Bco_descripcion_poblacion').AsString;
        Result.OT_Cta_Bco_descripcion_provincia := FieldByName('OT_Cta_Bco_descripcion_provincia').AsString;
        Result.OT_Cta_Bco_descripcion_pais      := FieldByName('OT_Cta_Bco_descripcion_pais').AsString;
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
      UTI_GEN_Error_Log( 'Ocurrió un error al intentar traer todos los datos del empleado con' +
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

function Tf_servicios_regulares_000.Fue_Utilizado_Rgtro_SQLQuery_Principal : ShortInt;
begin
  Result := 0;

end;

end.

