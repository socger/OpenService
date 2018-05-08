unit visitas_por_cliente_000;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, DateTimePicker, Forms, Controls, Graphics, Dialogs, ComCtrls,
  StdCtrls, Buttons, DBGrids, DbCtrls, ExtCtrls, Grids, utilidades_bd, variants, utilidades_general,
  utilidades_rgtro, utilidades_usuarios, utilidades_datos_tablas, utilidades_forms_Filtrar;

type

  { Tform_visitas_por_cliente_000 }

  Tform_visitas_por_cliente_000 = class(TForm)
    BitBtn_Filtrar: TBitBtn;
    BitBtn_Imprimir: TBitBtn;
    BitBtn_SALIR: TBitBtn;
    BitBtn_ver_Pedidos: TBitBtn;
    BitBtn_ver_Presupuestos: TBitBtn;
    BitBtn_Ver_Situacion_Registro_1: TBitBtn;
    BitBtn_Ver_Situacion_Registro_2: TBitBtn;
    Boton_Elegir_Actividad: TBitBtn;
    Boton_Elegir_Provincia: TBitBtn;
    Boton_Elegir_Representante: TBitBtn;
    Boton_Elegir_Ruta: TBitBtn;
    Boton_Elegir_Tipo_Cliente: TBitBtn;
    Boton_Elegir_Visita_Resultado: TBitBtn;
    Boton_Elegir_Visita_Tipo: TBitBtn;
    DataSource_2: TDataSource;
    DataSource_1: TDataSource;
    DateTimePicker_Proxima_Visita_Desde: TDateTimePicker;
    DateTimePicker_Proxima_Visita_Hasta: TDateTimePicker;
    DateTimePicker_Visitado_Desde: TDateTimePicker;
    DateTimePicker_Visitado_Hasta: TDateTimePicker;
    DBGrid_1: TDBGrid;
    DBGrid_2: TDBGrid;
    DBNavigator_1: TDBNavigator;
    DBNavigator_2: TDBNavigator;
    Edit_Comentario: TEdit;
    Edit_Descripcion_Actividad: TEdit;
    Edit_Descripcion_Provincia: TEdit;
    Edit_Descripcion_Representante: TEdit;
    Edit_Descripcion_Ruta: TEdit;
    Edit_Descripcion_Tipo_Cliente: TEdit;
    Edit_Descripcion_Visita_Resultado: TEdit;
    Edit_Descripcion_Visita_Tipo: TEdit;
    Edit_id_Actividad: TEdit;
    Edit_id_Provincia: TEdit;
    Edit_id_representantes: TEdit;
    Edit_id_Ruta: TEdit;
    Edit_id_Tipo_Cliente: TEdit;
    Edit_id_Visita_Resultado: TEdit;
    Edit_id_Visita_Tipo: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label_Ctdad_Con_Pedido: TLabel;
    Label_Ctdad_Con_Pto: TLabel;
    Label_Ctdad_Rgtros: TLabel;
    Label_Ctdad_Rgtros1: TLabel;
    Label_Ctdad_Rgtros2: TLabel;
    Label_Ctdad_Rgtros5: TLabel;
    Label_Ctdad_Rgtros6: TLabel;
    Label_Ctdad_Sin_Pedido: TLabel;
    Label_Ctdad_Sin_Pto: TLabel;
    Memo_Filtros: TMemo;
    Memo_OrderBy: TMemo;
    PageControl_Filtros: TPageControl;
    RadioGroup_Bajas: TRadioGroup;
    SQLQuery_2: TSQLQuery;
    SQLQuery_2Change_Id_User: TLargeintField;
    SQLQuery_2Change_WHEN: TDateTimeField;
    SQLQuery_2Comentario: TStringField;
    SQLQuery_2Del_Id_User: TLargeintField;
    SQLQuery_2Del_WHEN: TDateTimeField;
    SQLQuery_2Del_WHY: TStringField;
    SQLQuery_2FAX: TStringField;
    SQLQuery_2Fecha_Visita: TDateTimeField;
    SQLQuery_2Fecha_Visita_Proxima: TDateTimeField;
    SQLQuery_2id: TLargeintField;
    SQLQuery_2id_actividades: TLargeintField;
    SQLQuery_2id_clientes: TLargeintField;
    SQLQuery_2id_clientes_contactos: TLargeintField;
    SQLQuery_2id_clientes_tipos: TLargeintField;
    SQLQuery_2id_paises: TLargeintField;
    SQLQuery_2id_poblaciones: TLargeintField;
    SQLQuery_2id_provincias: TLargeintField;
    SQLQuery_2id_representantes: TLargeintField;
    SQLQuery_2id_rutas: TLargeintField;
    SQLQuery_2id_visitas_resultados: TLargeintField;
    SQLQuery_2id_visitas_tipos: TLargeintField;
    SQLQuery_2Insert_Id_User: TLargeintField;
    SQLQuery_2Insert_WHEN: TDateTimeField;
    SQLQuery_2Movil: TStringField;
    SQLQuery_2nif_cif: TStringField;
    SQLQuery_2OT_descripcion_actividad: TStringField;
    SQLQuery_2OT_descripcion_cliente: TStringField;
    SQLQuery_2OT_descripcion_cliente_tipo: TStringField;
    SQLQuery_2OT_descripcion_Contacto: TStringField;
    SQLQuery_2OT_descripcion_pais: TStringField;
    SQLQuery_2OT_descripcion_poblacion: TStringField;
    SQLQuery_2OT_descripcion_provincia: TStringField;
    SQLQuery_2OT_descripcion_representante: TStringField;
    SQLQuery_2OT_descripcion_ruta: TStringField;
    SQLQuery_2OT_descripcion_visita_resultado: TStringField;
    SQLQuery_2OT_descripcion_visita_tipo: TStringField;
    SQLQuery_2Pedido_Realizado_SN: TStringField;
    SQLQuery_2Presupuesto_Realizado_SN: TStringField;
    SQLQuery_2Tfno_Fijo_1: TStringField;
    SQLQuery_2Tfno_Fijo_2: TStringField;
    SQLQuery_1: TSQLQuery;
    SQLQuery_1Activar_Proximidad_SN: TStringField;
    SQLQuery_1Agrupar_Albaranes_SN: TStringField;
    SQLQuery_1Cantidad_Hermanos: TSmallintField;
    SQLQuery_1Change_Id_User: TLargeintField;
    SQLQuery_1Change_WHEN: TDateTimeField;
    SQLQuery_1Codigo_Postal: TStringField;
    SQLQuery_1Cta_Bco_BIC_SWIFT: TStringField;
    SQLQuery_1Cta_Bco_Codigo_Postal: TStringField;
    SQLQuery_1Cta_Bco_Cuenta: TStringField;
    SQLQuery_1Cta_Bco_Digito_Control: TStringField;
    SQLQuery_1Cta_Bco_Direccion: TStringField;
    SQLQuery_1Cta_Bco_Direccion_Numero: TStringField;
    SQLQuery_1Cta_Bco_Direccion_Piso_Letra: TStringField;
    SQLQuery_1Cta_Bco_Entidad: TStringField;
    SQLQuery_1Cta_Bco_IBAN: TStringField;
    SQLQuery_1Cta_Bco_Mandato_Fecha_de_Firma: TDateTimeField;
    SQLQuery_1Cta_Bco_Mandato_Ref: TStringField;
    SQLQuery_1Cta_Bco_Sucursal: TStringField;
    SQLQuery_1Cuenta_Contable: TStringField;
    SQLQuery_1Del_Id_User: TLargeintField;
    SQLQuery_1Del_WHEN: TDateTimeField;
    SQLQuery_1Del_WHY: TStringField;
    SQLQuery_1Descuento_Comercial_1: TBCDField;
    SQLQuery_1Descuento_Comercial_2: TBCDField;
    SQLQuery_1Descuento_Final: TBCDField;
    SQLQuery_1Descuento_Pronto_Pago: TBCDField;
    SQLQuery_1Direccion: TStringField;
    SQLQuery_1Direccion_Numero: TStringField;
    SQLQuery_1Direccion_Piso_Letra: TStringField;
    SQLQuery_1eMail: TStringField;
    SQLQuery_1Estudia_SN: TStringField;
    SQLQuery_1Estudios_Trabajos: TStringField;
    SQLQuery_1FAX: TStringField;
    SQLQuery_1Fecha_Nacimiento: TDateTimeField;
    SQLQuery_1Forma_pago_Dia_1: TSmallintField;
    SQLQuery_1Forma_pago_Dia_2: TSmallintField;
    SQLQuery_1Forma_pago_Vacaciones_Dia_Fin: TSmallintField;
    SQLQuery_1Forma_pago_Vacaciones_Dia_Inicio: TSmallintField;
    SQLQuery_1Forma_pago_Vacaciones_Mes_Fin: TSmallintField;
    SQLQuery_1Forma_pago_Vacaciones_Mes_Inicio: TSmallintField;
    SQLQuery_1id: TLargeintField;
    SQLQuery_1id_actividades: TLargeintField;
    SQLQuery_1id_Agencias_Transporte: TLargeintField;
    SQLQuery_1id_clientes_tipos: TLargeintField;
    SQLQuery_1id_Cta_Bco_pais: TLargeintField;
    SQLQuery_1id_Cta_Bco_poblaciones: TLargeintField;
    SQLQuery_1id_Cta_Bco_provincias: TLargeintField;
    SQLQuery_1id_formas_pago: TLargeintField;
    SQLQuery_1id_paises: TLargeintField;
    SQLQuery_1id_poblaciones: TLargeintField;
    SQLQuery_1id_provincias: TLargeintField;
    SQLQuery_1id_Representantes: TLargeintField;
    SQLQuery_1id_rutas: TLargeintField;
    SQLQuery_1id_tarifas: TLargeintField;
    SQLQuery_1Insert_Id_User: TLargeintField;
    SQLQuery_1Insert_WHEN: TDateTimeField;
    SQLQuery_1IVA_con_Recargo_SN: TStringField;
    SQLQuery_1IVA_Excluido_SN: TStringField;
    SQLQuery_1Movil: TStringField;
    SQLQuery_1nif_cif: TStringField;
    SQLQuery_1nombre_comercial: TStringField;
    SQLQuery_1nombre_propietario: TStringField;
    SQLQuery_1Observaciones_Comentarios: TStringField;
    SQLQuery_1OT_Cta_Bco_descripcion_pais: TStringField;
    SQLQuery_1OT_Cta_Bco_descripcion_poblacion: TStringField;
    SQLQuery_1OT_Cta_Bco_descripcion_provincia: TStringField;
    SQLQuery_1OT_Cuenta_Contable_cliente_tipo: TStringField;
    SQLQuery_1OT_descripcion_actividad: TStringField;
    SQLQuery_1OT_descripcion_agencia_transporte: TStringField;
    SQLQuery_1OT_descripcion_cliente_tipo: TStringField;
    SQLQuery_1OT_descripcion_forma_pago: TStringField;
    SQLQuery_1OT_descripcion_pais: TStringField;
    SQLQuery_1OT_descripcion_poblacion: TStringField;
    SQLQuery_1OT_descripcion_provincia: TStringField;
    SQLQuery_1OT_descripcion_representante: TStringField;
    SQLQuery_1OT_descripcion_ruta: TStringField;
    SQLQuery_1OT_descripcion_tarifa: TStringField;
    SQLQuery_1OT_Movil_agencia_transporte: TStringField;
    SQLQuery_1OT_Movil_representante: TStringField;
    SQLQuery_1OT_Tfno_Fijo_1_agencia_transporte: TStringField;
    SQLQuery_1OT_Tfno_Fijo_1_representante: TStringField;
    SQLQuery_1OT_todos_los_Tfnos: TStringField;
    SQLQuery_1pagina_web: TStringField;
    SQLQuery_1Portes_Pagados_SN: TStringField;
    SQLQuery_1Retencion: TBCDField;
    SQLQuery_1Riesgo_Acumulado: TBCDField;
    SQLQuery_1Riesgo_Autorizado: TBCDField;
    SQLQuery_1Tfno_Fijo_1: TStringField;
    SQLQuery_1Tfno_Fijo_2: TStringField;
    SQLQuery_1Trabaja_SN: TStringField;
    SQLQuery_1Vencimientos_automaticos_SN: TStringField;
    TabSheet_Busqueda_Concreta: TTabSheet;
    TabSheet_Filtros_Generales: TTabSheet;

    procedure BitBtn_FiltrarClick(Sender: TObject);
    procedure BitBtn_ver_PedidosClick(Sender: TObject);
    procedure BitBtn_ver_PresupuestosClick(Sender: TObject);
    procedure Boton_Elegir_ActividadClick(Sender: TObject);
    procedure Boton_Elegir_RepresentanteClick(Sender: TObject);
    procedure Boton_Elegir_RutaClick(Sender: TObject);
    procedure Boton_Elegir_Tipo_ClienteClick(Sender: TObject);
    procedure Boton_Elegir_Visita_ResultadoClick(Sender: TObject);
    procedure Boton_Elegir_Visita_TipoClick(Sender: TObject);
    procedure Edit_Descripcion_ActividadClick(Sender: TObject);
    procedure Edit_Descripcion_RepresentanteClick(Sender: TObject);
    procedure Edit_Descripcion_RutaClick(Sender: TObject);
    procedure Edit_Descripcion_Tipo_ClienteClick(Sender: TObject);
    procedure Edit_Descripcion_Visita_ResultadoClick(Sender: TObject);
    procedure Edit_Descripcion_Visita_TipoClick(Sender: TObject);
    procedure Refrescar_Registros_Detalles(param_con_Pedido_SN : ShortString);
    procedure Insertar_Registro;
    procedure Editar_Registro;
    procedure Filtrar_tablas_ligadas(param_con_Pedido_SN : ShortString);
    procedure Pasar_Filtros_a_Visitas( param_con_Pedido_SN : ShortString; param_Lineas_Filtro : TStrings );
    procedure Filtrar_Principal_Sin_Preguntar;
    procedure Refrescar_Registros;
    procedure BitBtn_Ver_Situacion_Registro_1Click(Sender: TObject);
    function  Filtrar_Visitas( param_con_Pedido_SN : ShortString; param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
    function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
    procedure BitBtn_Ver_Situacion_Registro_2Click(Sender: TObject);
    procedure Presentar_Datos;
    procedure BitBtn_ImprimirClick(Sender: TObject);
    procedure BitBtn_SALIRClick(Sender: TObject);
    procedure Cerramos_Tablas;
    procedure Cerramos_Tablas_Ligadas;
    procedure DBGrid_1CellClick(Column: TColumn);
    procedure DBGrid_1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_2DblClick(Sender: TObject);
    procedure DBGrid_2DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid_2KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBNavigator_1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure DBNavigator_2BeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure para_Empezar;
    procedure Boton_Elegir_ProvinciaClick(Sender: TObject);
    procedure Edit_Descripcion_ProvinciaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup_BajasClick(Sender: TObject);
    procedure SQLQuery_1AfterPost(DataSet: TDataSet);
    procedure SQLQuery_1AfterScroll(DataSet: TDataSet);
    procedure SQLQuery_1BeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_1BeforePost(DataSet: TDataSet);
    procedure SQLQuery_2AfterPost(DataSet: TDataSet);
    procedure SQLQuery_2BeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_2BeforePost(DataSet: TDataSet);

  private
    { private declarations }
    private_Salir_OK   : Boolean;
    private_Order_By_1 : array of TOrder_By;
    private_Order_By_2 : array of TOrder_By;
  public
    { public declarations }
    public_Menu_Worked    : Integer;
  end;

var
  form_visitas_por_cliente_000: Tform_visitas_por_cliente_000;

implementation

{$R *.lfm}

uses dm_visitas_por_cliente, menu, visitas_000;

{ Tform_visitas_por_cliente_000 }

procedure Tform_visitas_por_cliente_000.FormCreate(Sender: TObject);
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
    // ** SOLO PARA ESTE FORM                                                                     ** //
    // ********************************************************************************************* //
    var_Present := Now;
    DecodeDate(var_Present, var_Year, var_Month, var_Day);
    DecodeTime(var_Present, var_Hour, var_Min, var_Sec, var_MSec);

    DateTimePicker_Visitado_Desde.Date := StrToDate( '01/01/' + IntToStr(var_Year - 1) );
    DateTimePicker_Visitado_Hasta.Date := StrToDate( '31/12/' + IntToStr(var_Year + 1) );
end;

procedure Tform_visitas_por_cliente_000.para_Empezar;
begin
    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    if UTI_GEN_Form_Abierto_Ya('DataModule_visitas_por_cliente') = False then
    begin
        DataModule_visitas_por_cliente := TDataModule_visitas_por_cliente.Create(Application);
    end;

    // ********************************************************************************************* //
    // ** Preparamos los diferentes tipos de orden preconfigurados                                ** //
    // ********************************************************************************************* //
    // ** ALUMNOS/CLIENTES                                                                        ** //
    // ********************************************************************************************* //
    SetLength(private_Order_By_1, 1);

    private_Order_By_1[0].Titulo       := 'Por nombre propietario'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_1[0].Memo_OrderBy := 'cl.nombre_propietario ASC';

    Memo_OrderBy.Lines.Text          := private_Order_By_1[0].Memo_OrderBy;

    // ********************************************************************************************* //
    // ** LINEAS DETALLE                                                                          ** //
    // ********************************************************************************************* //
    SetLength(private_Order_By_2, 1);

    private_Order_By_2[0].Titulo       := 'Por fecha de visita realizada'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_2[0].Memo_OrderBy := 'vis.Fecha_Visita ASC, vis.id ASC';

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

procedure Tform_visitas_por_cliente_000.RadioGroup_BajasClick(Sender: TObject);
begin
    Refrescar_Registros;
end;

procedure Tform_visitas_por_cliente_000.FormClose(Sender: TObject; var CloseAction: TCloseAction);
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
            if form_Menu.public_Salir_OK = False then CloseAction := caNone;
    end else begin
        // ************************************************************************************* //
        // ** Fue correcto el modo como quiere BitBtn_SALIR de la aplicación                  ** //
        // ************************************************************************************* //
    end;
end;

procedure Tform_visitas_por_cliente_000.FormDestroy(Sender: TObject);
begin
    Cerramos_Tablas;
end;

procedure Tform_visitas_por_cliente_000.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_visitas_por_cliente.SQLCon_Cli,
                      DataModule_visitas_por_cliente.SQLTran_Cli,
                      SQLQuery_1 ) = false then UTI_GEN_Salir;

    DataModule_visitas_por_cliente.Free;
end;

procedure Tform_visitas_por_cliente_000.Cerramos_Tablas_Ligadas;
begin
    if UTI_TB_Cerrar( DataModule_visitas_por_cliente.SQLCon_Visita,
                      DataModule_visitas_por_cliente.SQLTran_Visita,
                      SQLQuery_2 ) = false then UTI_GEN_Salir;
end;

procedure Tform_visitas_por_cliente_000.SQLQuery_1AfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'clientes',
                       DataModule_visitas_por_cliente.SQLTran_Cli,
                       SQLQuery_1,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros;
end;

procedure Tform_visitas_por_cliente_000.SQLQuery_2AfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'visitas',
                       DataModule_visitas_por_cliente.SQLTran_Visita,
                       SQLQuery_2,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros_Detalles('S');
    Refrescar_Registros_Detalles('N');
    Refrescar_Registros_Detalles('PTO_S');
    Refrescar_Registros_Detalles('PTO_N');
    Refrescar_Registros_Detalles('');
end;

procedure Tform_visitas_por_cliente_000.SQLQuery_1BeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_1 );
end;

procedure Tform_visitas_por_cliente_000.SQLQuery_2BeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_2 );
end;

procedure Tform_visitas_por_cliente_000.SQLQuery_1BeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_1 );
end;

procedure Tform_visitas_por_cliente_000.SQLQuery_2BeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_2 );
end;

procedure Tform_visitas_por_cliente_000.SQLQuery_1AfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas('S');
    Filtrar_tablas_ligadas('N');
    Filtrar_tablas_ligadas('PTO_S');
    Filtrar_tablas_ligadas('PTO_N');
    Filtrar_tablas_ligadas('');
end;

procedure Tform_visitas_por_cliente_000.BitBtn_ImprimirClick(Sender: TObject);
var var_Ficheros     : TStrings;
    var_Ordenado_por : String;
begin
    // ********************************************************************************************* //
    // ** Configuramos el título del listado                                                      ** //
    // ********************************************************************************************* //
    var_Ordenado_por := '';

    if Trim(Memo_Filtros.Lines.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            rs_Filtros_Otros_2 +
                            Trim(Memo_Filtros.Lines.Text);
    end;

    if Trim(Edit_Comentario.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con comentario %' +
                            Trim(Edit_Comentario.Text) + '%';
    end;

    if Trim(Edit_Descripcion_Tipo_Cliente.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con tipo cliente = ' +
                            Trim(Edit_Descripcion_Tipo_Cliente.Text);
    end;

    if Trim(Edit_Descripcion_Provincia.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con provincia = ' +
                            Trim(Edit_Descripcion_Provincia.Text);
    end;

    if (not DateTimePicker_Visitado_Hasta.DateIsNull) or
       (not DateTimePicker_Visitado_Desde.DateIsNull) then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', visitado entre ' +
                            DateToStr(DateTimePicker_Visitado_Desde.Date) +
                            ' y ' +
                            DateToStr(DateTimePicker_Visitado_Hasta.Date);
    end;

    if (not DateTimePicker_Proxima_Visita_Hasta.DateIsNull) or
       (not DateTimePicker_Proxima_Visita_Desde.DateIsNull) then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', visita próxima entre ' +
                            DateToStr(DateTimePicker_Proxima_Visita_Desde.Date) +
                            ' y ' +
                            DateToStr(DateTimePicker_Proxima_Visita_Hasta.Date);
    end;

    if Trim(Edit_Descripcion_Visita_Tipo.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con tipo/motivo visita = ' +
                            Trim(Edit_Descripcion_Visita_Tipo.Text);
    end;

    if Trim(Edit_Descripcion_Visita_Resultado.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con resultado de visita = ' +
                            Trim(Edit_Descripcion_Visita_Resultado.Text);
    end;

    if Trim(Edit_Descripcion_Ruta.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con ruta/zona = ' +
                            Trim(Edit_Descripcion_Ruta.Text);
    end;

    if Trim(Edit_Descripcion_Actividad.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con actividad = ' +
                            Trim(Edit_Descripcion_Actividad.Text);
    end;

    if Trim(Edit_Descripcion_Representante.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con representante = ' +
                            Trim(Edit_Descripcion_Representante.Text);
    end;

    // ********************************************************************************************* //
    // ** Configuramos la llamada al generador de informes                                        ** //
    // ********************************************************************************************* //
    var_Ficheros := TStringList.Create;

    UTI_GEN_Informes( var_Ordenado_por,
                      SQLQuery_1,
                      DataSource_1,
                      Nil,
                      Nil,
                      Nil,
                      public_Menu_Worked,
                      false, // public_Solo_Ver
                      '',
                      '',
                      var_Ficheros );

    var_Ficheros.Free;
end;

procedure Tform_visitas_por_cliente_000.DBNavigator_1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
begin
    case Button of
        nbRefresh : begin
            Refrescar_Registros;
            Abort;
        end;
    end;
end;

procedure Tform_visitas_por_cliente_000.DBNavigator_2BeforeAction(Sender: TObject; Button: TDBNavButtonType);
begin
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
                UTI_RGTRO_Borrar( 'visitas',
                                  SQLQuery_2,
                                  false, //public_Solo_Ver,
                                  public_Menu_Worked );
            end;
            Abort;
        end;

        nbRefresh : begin
            Refrescar_Registros_Detalles('S');
            Refrescar_Registros_Detalles('N');
            Refrescar_Registros_Detalles('PTO_S');
            Refrescar_Registros_Detalles('PTO_N');
            Refrescar_Registros_Detalles('');
            Abort;
        end;
    end;
end;

procedure Tform_visitas_por_cliente_000.DBGrid_1DrawColumnCell( Sender: TObject;
                                                                const Rect: TRect;
                                                                DataCol: Integer;
                                                                Column: TColumn;
                                                                State: TGridDrawState );
begin
    UTI_GEN_Dibujar_Grid( Sender, SQLQuery_1, Rect, DataCol, Column, State );
end;

procedure Tform_visitas_por_cliente_000.DBGrid_2DrawColumnCell( Sender: TObject;
                                                                const Rect: TRect;
                                                                DataCol: Integer;
                                                                Column: TColumn;
                                                                State: TGridDrawState );
begin
    UTI_GEN_Dibujar_Grid( Sender, SQLQuery_2, Rect, DataCol, Column, State );
end;

procedure Tform_visitas_por_cliente_000.DBGrid_2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if Key = 13 then
    begin
        Editar_Registro;
    end;
end;

procedure Tform_visitas_por_cliente_000.DBGrid_2KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
        // Filtrar_tablas_ligadas('S');
        // Filtrar_tablas_ligadas('N');
        // Filtrar_tablas_ligadas('PTO_S');
        // Filtrar_tablas_ligadas('PTO_N');
        // Filtrar_tablas_ligadas('');
    end;
end;

procedure Tform_visitas_por_cliente_000.DBGrid_1CellClick(Column: TColumn);
begin
    // Filtrar_tablas_ligadas('S');
    // Filtrar_tablas_ligadas('N');
    // Filtrar_tablas_ligadas('PTO_S');
    // Filtrar_tablas_ligadas('PTO_N');
    // Filtrar_tablas_ligadas('');
end;

procedure Tform_visitas_por_cliente_000.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_visitas_por_cliente_000.DBGrid_2DblClick(Sender: TObject);
begin
    Editar_Registro;
end;

procedure Tform_visitas_por_cliente_000.Presentar_Datos;
begin
     /// guardar por lo que pueda pasar
end;

procedure Tform_visitas_por_cliente_000.BitBtn_Ver_Situacion_Registro_1Click(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if SQLQuery_1.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'clientes',
                                           SQLQuery_1,
                                           DataSource_1,
                                           DBGrid_1 );
        end;
    end;
end;

procedure Tform_visitas_por_cliente_000.BitBtn_Ver_Situacion_Registro_2Click(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if SQLQuery_2.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'visitas',
                                           SQLQuery_2,
                                           DataSource_2,
                                           DBGrid_2 );
        end;
    end;
end;

procedure Tform_visitas_por_cliente_000.Refrescar_Registros;
var var_nombre_propietario : String;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_nombre_propietario := '';

    if SQLQuery_1.RecordCount > 0 then
    begin
        var_nombre_propietario := SQLQuery_1.FieldByName('nombre_propietario').Value;
    end;

    Filtrar_Principal_Sin_Preguntar;

    if Trim(var_nombre_propietario) <> '' then
    begin
        SQLQuery_1.Locate( 'nombre_propietario',
                           var_nombre_propietario,
                           [] );
    end;
end;

function Tform_visitas_por_cliente_000.Filtrar_Visitas( param_con_Pedido_SN : ShortString;
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
    param_Lineas_OrderBy.Text := private_Order_By_2[0].Memo_OrderBy;
  end;

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  Result := UTI_TB_Filtrar( private_Order_By_2,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_2,
                                                          'visitas',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_2,
                                                          'visitas',
                                                          'i' ),

                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_visitas_por_cliente.SQLTran_Visita,
                            DataModule_visitas_por_cliente.SQLCon_Visita,
                            SQLQuery_2,

                            // name_tabla,
                            'vis',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT vis.*,' + ' ' +

                                   'c.nombre_propietario AS OT_descripcion_cliente,' + ' ' +
                                   'c.id_clientes_tipos AS OT_id_clientes_tipos,' + ' ' +
                                   'c.id_actividades AS OT_id_actividades,' + ' ' +
                                   'c.id_rutas AS OT_id_rutas,' + ' ' +
                                   'c.nif_cif AS OT_nif_cif,' + ' ' +
                                   'c.id_poblaciones AS OT_id_poblaciones,' + ' ' +
                                   'c.id_provincias AS OT_id_provincias,' + ' ' +
                                   'c.id_paises AS OT_id_paises,' + ' ' +
                                   'c.Tfno_Fijo_1 AS OT_Tfno_Fijo_1,' + ' ' +
                                   'c.Tfno_Fijo_2 AS OT_Tfno_Fijo_2,' + ' ' +
                                   'c.FAX AS OT_FAX,' + ' ' +
                                   'c.Movil AS OT_Movil,' + ' ' +

                                   'cc.nombre AS OT_descripcion_Contacto,' + ' ' +
                                   'ct.descripcion AS OT_descripcion_cliente_tipo,' + ' ' +
                                   'act.descripcion AS OT_descripcion_actividad,' + ' ' +
                                   'rt.descripcion AS OT_descripcion_ruta,' + ' ' +

                                   'pb.descripcion AS OT_descripcion_poblacion,' + ' ' +
                                   'pr.descripcion AS OT_descripcion_provincia,' + ' ' +
                                   'ps.descripcion AS OT_descripcion_pais,' + ' ' +

                                   'rep.nombre_propietario AS OT_descripcion_representante,' + ' ' +
                                   'vist.descripcion AS OT_descripcion_visita_tipo,' + ' ' +
                                   'visr.descripcion AS OT_descripcion_visita_resultado' + ' ' +

                            'FROM visitas AS vis ' + ' ' +

                            'LEFT JOIN clientes AS c' + ' ' +
                            'ON vis.id_clientes = c.id' + ' ' +

                            'LEFT JOIN poblaciones AS pb' + ' ' +
                            'ON c.id_poblaciones = pb.id' + ' ' +

                            'LEFT JOIN provincias AS pr' + ' ' +
                            'ON c.id_provincias = pr.id' + ' ' +

                            'LEFT JOIN paises AS ps' + ' ' +
                            'ON c.id_paises = ps.id' + ' ' +

                            'LEFT JOIN clientes_tipos AS ct' + ' ' +
                            'ON c.id_clientes_tipos = ct.id' + ' ' +

                            'LEFT JOIN actividades AS act' + ' ' +
                            'ON c.id_actividades = act.id' + ' ' +

                            'LEFT JOIN rutas AS rt' + ' ' +
                            'ON c.id_rutas = rt.id' + ' ' +

                            'LEFT JOIN visitas_tipos AS vist' + ' ' +
                            'ON vis.id_visitas_tipos = vist.id' + ' ' +

                            'LEFT JOIN visitas_resultados AS visr' + ' ' +
                            'ON vis.id_visitas_resultados = visr.id' + ' ' +

                            'LEFT JOIN clientes_contactos AS cc' + ' ' +
                            'ON vis.id_clientes_contactos = cc.id' + ' ' +

                            'LEFT JOIN representantes AS rep' + ' ' +
                            'ON vis.id_representantes = rep.id' + ' ',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            param_Cambiamos_Filtro );

  var_a_Filtrar_Plus.Free;

  if Trim(param_con_Pedido_SN) = ''  then
  begin
      Label_Ctdad_Rgtros.Caption := IntToStr(SQLQuery_2.RecordCount);
  end;

  if Trim(UpperCase(param_con_Pedido_SN)) = 'N' then
  begin
       Label_Ctdad_Sin_Pedido.Caption := IntToStr(SQLQuery_2.RecordCount);
  end;

  if Trim(UpperCase(param_con_Pedido_SN)) = 'S' then
  begin
      Label_Ctdad_Con_Pedido.Caption := IntToStr(SQLQuery_2.RecordCount);
  end;

  if Trim(UpperCase(param_con_Pedido_SN)) = 'PTO_N' then
  begin
       Label_Ctdad_Sin_Pto.Caption := IntToStr(SQLQuery_2.RecordCount);
  end;

  if Trim(UpperCase(param_con_Pedido_SN)) = 'PTO_S' then
  begin
      Label_Ctdad_Con_Pto.Caption := IntToStr(SQLQuery_2.RecordCount);
  end;
end;

procedure Tform_visitas_por_cliente_000.Filtrar_Principal_Sin_Preguntar;
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

function Tform_visitas_por_cliente_000.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
var
  var_a_Filtrar : TStrings;
begin
    var_a_Filtrar := TStringList.Create;
    var_a_Filtrar.Clear;

    { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
      y que por lo se debe de permitir modificarlos en ningún módulo }

    Result := UTI_TB_Filtrar( private_Order_By_1,

                              // Delete_SQL,
                              '',

                              // Update_SQL,
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_1,
                                                            'clientes',
                                                            'u' ),

                              // Insert_SQL,
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_1,
                                                            'clientes',
                                                            'i' ),

                              // var_ctdad_Rgtros,
                              -1,

                              DataModule_visitas_por_cliente.SQLTran_Cli,
                              DataModule_visitas_por_cliente.SQLCon_Cli,
                              SQLQuery_1,

                              // name_tabla,
                              'cl',

                              RadioGroup_Bajas.ItemIndex,

                              // SELECT_SQL,
                              'SELECT cl.*,' + ' ' +

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
                              'ON cl.id_Representantes = rp.id' + ' ',

                              Memo_Filtros.Lines,
                              Memo_OrderBy.Lines,
                              var_a_Filtrar,

                              param_Cambiamos_Filtro );

    if SQLQuery_1.RecordCount = 0 then
    begin
        Cerramos_Tablas_Ligadas;
    end;

    var_a_Filtrar.Free;

    // Filtrar_tablas_ligadas('S');
    // Filtrar_tablas_ligadas('N');
    // Filtrar_tablas_ligadas('PTO_S');
    // Filtrar_tablas_ligadas('PTO_N');
    // Filtrar_tablas_ligadas('');
end;

procedure Tform_visitas_por_cliente_000.Editar_Registro;
var var_msg : TStrings;
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = true then
    begin
       if UTI_GEN_Form_Abierto_Ya('form_visitas_000') = false then
       begin
           Application.CreateForm(Tform_visitas_000, form_visitas_000);

           form_visitas_000.public_Solo_Ver    := false;
           form_visitas_000.public_Elegimos    := false;
           form_visitas_000.public_Menu_Worked := public_Menu_Worked;

           form_visitas_000.DateTimePicker_Visitado_Desde.Date := Int(SQLQuery_2.FieldByName('Fecha_Visita').Value);
           form_visitas_000.DateTimePicker_Visitado_Hasta.Date := Int(SQLQuery_2.FieldByName('Fecha_Visita').Value);
           form_visitas_000.Edit_id.Text                       := SQLQuery_2.FieldByName('id').AsString;

           form_visitas_000.para_Empezar;

           form_visitas_000.Editar_Registro;

           form_visitas_000.Free;

           Refrescar_Registros_Detalles('S');
           Refrescar_Registros_Detalles('N');
           Refrescar_Registros_Detalles('PTO_S');
           Refrescar_Registros_Detalles('PTO_N');
           Refrescar_Registros_Detalles('');
       end else begin
           var_msg := TStringList.Create;
           var_msg.Add(rs_Modulo_Abierto);
           UTI_GEN_Aviso(true, var_msg, 'NO SE PUEDE ...', True, False);
           var_msg.Free;
       end;
    end;
end;

procedure Tform_visitas_por_cliente_000.Insertar_Registro;
var var_msg : TStrings;
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = true then
    begin
       if UTI_GEN_Form_Abierto_Ya('form_visitas_000') = false then
       begin
           Application.CreateForm(Tform_visitas_000, form_visitas_000);

           form_visitas_000.public_Solo_Ver    := false;
           form_visitas_000.public_Elegimos    := false;
           form_visitas_000.public_Menu_Worked := public_Menu_Worked;

           form_visitas_000.DateTimePicker_Visitado_Desde.Date := Date;
           form_visitas_000.DateTimePicker_Visitado_Hasta.Date := Date;

           form_visitas_000.para_Empezar;

           form_visitas_000.public_llamado_desde             := 'form_visitas_por_cliente_000';
           form_visitas_000.public_llamado_desde_id          := SQLQuery_1.FieldByName('id').AsString;
           form_visitas_000.public_llamado_desde_Descripcion := SQLQuery_1.FieldByName('nombre_propietario').AsString;

           form_visitas_000.Insertar_Registro;

           form_visitas_000.Free;

           Filtrar_tablas_ligadas('S');
           Filtrar_tablas_ligadas('N');
           Filtrar_tablas_ligadas('PTO_S');
           Filtrar_tablas_ligadas('PTO_N');
           Filtrar_tablas_ligadas('');
       end else begin
           var_msg := TStringList.Create;
           var_msg.Add(rs_Modulo_Abierto);
           UTI_GEN_Aviso(true, var_msg, 'NO SE PUEDE ...', True, False);
           var_msg.Free;
       end;
    end;
end;

procedure Tform_visitas_por_cliente_000.Pasar_Filtros_a_Visitas( param_con_Pedido_SN : ShortString;
                                                                 param_Lineas_Filtro : TStrings );
var
  var_SQL_ADD : TStrings;
begin
    var_SQL_ADD := TStringList.Create;

    // ********************************************************************************************* //
    // ** LE PASO LA ID DE LA TABLA MADRE                                                         ** //
    // ********************************************************************************************* //

    // ********************************************************************************************* //
    // ** Ahora buscaremos por EL CLIENTE                                                         ** //
    // ********************************************************************************************* //
    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'vis.id_clientes = ' + SQLQuery_1.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    param_Lineas_Filtro,
                    var_SQL_ADD );

    // ********************************************************************************************* //
    // ** AHORA PONDREMOS EL RESTO DE LOS FILTROS QUE NO SON GENERALES                            ** //
    // ********************************************************************************************* //
    // ** Primero buscaremos en el comentario                                                     ** //
    // ********************************************************************************************* //
    if Trim(Edit_Comentario.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'vis.Comentario LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Comentario.Text) + '%') );
        UTI_TB_SQL_ADD( false,
                        param_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por EL tipo de CLIENTE                                                 ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Tipo_Cliente.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'c.id_clientes_tipos = ' + Trim(Edit_id_Tipo_Cliente.Text) );
        UTI_TB_SQL_ADD( false,
                        param_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por LA PROVINCIA                                                       ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Provincia.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'c.id_provincias = ' + Trim(Edit_id_Provincia.Text) );
        UTI_TB_SQL_ADD( false,
                        param_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la fecha de VISITA                                                 ** //
    // ********************************************************************************************* //
    if (not DateTimePicker_Visitado_Hasta.DateIsNull) and
       (not DateTimePicker_Visitado_Desde.DateIsNull) then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'vis.Fecha_Visita <= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Visitado_Hasta.Date, false) + ' 23:59:59' ) );
        UTI_TB_SQL_ADD( false,
                        param_Lineas_Filtro,
                        var_SQL_ADD );

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'vis.Fecha_Visita >= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Visitado_Desde.Date, false) + ' 00:00:00' ) );
        UTI_TB_SQL_ADD( false,
                        param_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la fecha de proxima VISITA                                         ** //
    // ********************************************************************************************* //
    if (not DateTimePicker_Proxima_Visita_Hasta.DateIsNull) and
       (not DateTimePicker_Proxima_Visita_Desde.DateIsNull) then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'vis.Fecha_Visita_Proxima <= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Proxima_Visita_Hasta.Date, false) + ' 23:59:59' ) );
        UTI_TB_SQL_ADD( false,
                        param_Lineas_Filtro,
                        var_SQL_ADD );

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'vis.Fecha_Visita_Proxima >= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Proxima_Visita_Desde.Date, false) + ' 00:00:00' ) );
        UTI_TB_SQL_ADD( false,
                        param_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por EL TIPO DE VISITA                                                  ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Visita_Tipo.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'vis.id_visitas_tipos = ' + Trim(Edit_id_Visita_Tipo.Text) );
        UTI_TB_SQL_ADD( false,
                        param_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por EL RESULTADO DE VISITA                                             ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Visita_Resultado.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'vis.id_visitas_resultados = ' + Trim(Edit_id_Visita_Resultado.Text) );
        UTI_TB_SQL_ADD( false,
                        param_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por LA RUTA                                                            ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Ruta.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'c.id_rutas = ' + Trim(Edit_id_Ruta.Text) );
        UTI_TB_SQL_ADD( false,
                        param_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por LA ACTIVIDAD                                                       ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Actividad.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'c.id_actividades = ' + Trim(Edit_id_Actividad.Text) );
        UTI_TB_SQL_ADD( false,
                        param_Lineas_Filtro,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por EL REPRESENTANTE                                                   ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_representantes.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'vis.id_representantes = ' + Trim(Edit_id_representantes.Text) );
        UTI_TB_SQL_ADD( false,
                        param_Lineas_Filtro,
                        var_SQL_ADD );
    end;


        // ********************************************************************************************* //
        // ** Ahora buscaremos por SI TIENE PEDIDOS O NO ESTA VISITA                                  ** //
        // ********************************************************************************************* //
        if Trim(param_con_Pedido_SN) <> '' then
        begin
            if (Trim(UpperCase(param_con_Pedido_SN)) = 'S') or
               (Trim(UpperCase(param_con_Pedido_SN)) = 'N') then
            begin
                var_SQL_ADD.Clear;
                var_SQL_ADD.Add( 'vis.Pedido_Realizado_SN = ' + UTI_GEN_Comillas(Trim(UpperCase(param_con_Pedido_SN))) );
                UTI_TB_SQL_ADD( false,
                                param_Lineas_Filtro,
                                var_SQL_ADD );
            end else begin
                if Trim(UpperCase(param_con_Pedido_SN)) = 'PTO_S' then
                begin
                    var_SQL_ADD.Clear;
                    var_SQL_ADD.Add( 'vis.Presupuesto_Realizado_SN = ' + UTI_GEN_Comillas('S') );
                    UTI_TB_SQL_ADD( false,
                                    param_Lineas_Filtro,
                                    var_SQL_ADD );
                end;

                if Trim(UpperCase(param_con_Pedido_SN)) = 'PTO_N' then
                begin
                    var_SQL_ADD.Clear;
                    var_SQL_ADD.Add( 'vis.Presupuesto_Realizado_SN = ' + UTI_GEN_Comillas('N') );
                    UTI_TB_SQL_ADD( false,
                                    param_Lineas_Filtro,
                                    var_SQL_ADD );
                end;
            end;
        end;
    var_SQL_ADD.Free;
end;

procedure Tform_visitas_por_cliente_000.Filtrar_tablas_ligadas(param_con_Pedido_SN : ShortString);
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
begin
    if SQLQuery_1.RecordCount = 0 then Exit;

    if SQLQuery_1.State = dsInsert then
    begin
        Cerramos_Tablas_Ligadas;
        Exit;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    Pasar_Filtros_a_Visitas(param_con_Pedido_SN, var_Lineas_Filtro);

    var_Lineas_OrderBy.Clear;
    Filtrar_Visitas( param_con_Pedido_SN,
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

procedure Tform_visitas_por_cliente_000.Refrescar_Registros_Detalles(param_con_Pedido_SN : ShortString);
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
    var_ver_Bajas      : ShortInt;
    var_Fecha_Visita   : TDateTime;
    var_id_clientes    : Int64;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_id_clientes := 0;

    with SQLQuery_2 do
    begin
        if RecordCount > 0 then
        begin
            var_Fecha_Visita := SQLQuery_2.FieldByName('Fecha_Visita').Value;
            var_id_clientes  := SQLQuery_2.FieldByName('id_clientes').Value;
        end;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Clear;
    var_Lineas_OrderBy.Clear;

    Pasar_Filtros_a_Visitas(param_con_Pedido_SN, var_Lineas_Filtro);

    var_ver_Bajas := RadioGroup_Bajas.ItemIndex;

    Filtrar_Visitas( param_con_Pedido_SN,
                     var_ver_Bajas,
                     false,
                     var_Lineas_Filtro,
                     var_Lineas_OrderBy );

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;

    if var_id_clientes <> 0 then
    begin
        SQLQuery_2.Locate( 'Fecha_Visita;id_clientes',
                           VarArrayOf( [ var_Fecha_Visita, var_id_clientes ] ),
                           [] );
    end;
end;

procedure Tform_visitas_por_cliente_000.Boton_Elegir_Tipo_ClienteClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Clientes_tipos( true, false, 70, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Tipo_Cliente.Text          := Trim(var_Registro.id_1);
        Edit_Descripcion_Tipo_Cliente.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_visitas_por_cliente_000.Boton_Elegir_ProvinciaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Provincias( true, false, 100, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Provincia.Text          := Trim(var_Registro.id_1);
        Edit_Descripcion_Provincia.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_visitas_por_cliente_000.Boton_Elegir_Visita_TipoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_VisitasTipos( true, false, 470, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Visita_Tipo.Text          := Trim(var_Registro.id_1);
        Edit_Descripcion_Visita_Tipo.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_visitas_por_cliente_000.Boton_Elegir_Visita_ResultadoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_VisitasResultados( true, false, 480, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Visita_Resultado.Text          := Trim(var_Registro.id_1);
        Edit_Descripcion_Visita_Resultado.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_visitas_por_cliente_000.Boton_Elegir_RutaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Rutas( true, false, 510, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Ruta.Text          := Trim(var_Registro.id_1);
        Edit_Descripcion_Ruta.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_visitas_por_cliente_000.Boton_Elegir_ActividadClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Actividades( true, false, 500, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Actividad.Text          := Trim(var_Registro.id_1);
        Edit_Descripcion_Actividad.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_visitas_por_cliente_000.Boton_Elegir_RepresentanteClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Representantes( true, false, 130, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_representantes.Text         := Trim(var_Registro.id_1);
        Edit_Descripcion_Representante.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_visitas_por_cliente_000.Edit_Descripcion_Tipo_ClienteClick(Sender: TObject);
begin
    Edit_id_Tipo_Cliente.Text          := '';
    Edit_Descripcion_Tipo_Cliente.Text := '';
end;

procedure Tform_visitas_por_cliente_000.Edit_Descripcion_ProvinciaClick(Sender: TObject);
begin
    Edit_id_Provincia.Text          := '';
    Edit_Descripcion_Provincia.Text := '';
end;

procedure Tform_visitas_por_cliente_000.Edit_Descripcion_Visita_TipoClick(Sender: TObject);
begin
    Edit_id_Visita_Tipo.Text          := '';
    Edit_Descripcion_Visita_Tipo.Text := '';
end;

procedure Tform_visitas_por_cliente_000.Edit_Descripcion_Visita_ResultadoClick(Sender: TObject);
begin
    Edit_id_Visita_Resultado.Text          := '';
    Edit_Descripcion_Visita_Resultado.Text := '';
end;

procedure Tform_visitas_por_cliente_000.Edit_Descripcion_RutaClick(Sender: TObject);
begin
    Edit_id_Ruta.Text          := '';
    Edit_Descripcion_Ruta.Text := '';
end;

procedure Tform_visitas_por_cliente_000.Edit_Descripcion_ActividadClick(Sender: TObject);
begin
    Edit_id_Actividad.Text          := '';
    Edit_Descripcion_Actividad.Text := '';
end;

procedure Tform_visitas_por_cliente_000.Edit_Descripcion_RepresentanteClick(Sender: TObject);
begin
    Edit_id_representantes.Text         := '';
    Edit_Descripcion_Representante.Text := '';
end;

procedure Tform_visitas_por_cliente_000.BitBtn_FiltrarClick(Sender: TObject);
var var_msg : TStrings;
begin
    // ********************************************************************************************* //
    // ** COMPROBAMOS SI EL MARGEN DE FECHAS ESTA BIEN INTRODUCIDO                                ** //
    // ********************************************************************************************* //
    var_msg := TStringList.Create;

    if UTI_GEN_Comprobar_2_Fechas( DateTimePicker_Visitado_Desde,
                                   DateTimePicker_Visitado_Hasta ) = false then
    begin
        var_msg.Add('* Fechas mal introducidas para margen de visitas.');
    end;

    if UTI_GEN_Comprobar_2_Fechas( DateTimePicker_Proxima_Visita_Desde,
                                   DateTimePicker_Proxima_Visita_Hasta ) = false then
    begin
        var_msg.Add('* Fechas mal introducidas para margen de próximas visitas.');
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
    Filtrar_tablas_ligadas('S');
    Filtrar_tablas_ligadas('N');
    Filtrar_tablas_ligadas('PTO_S');
    Filtrar_tablas_ligadas('PTO_N');
    Filtrar_tablas_ligadas('');
end;

procedure Tform_visitas_por_cliente_000.BitBtn_ver_PedidosClick(Sender: TObject
  );
begin
    UTI_Abrir_Modulo_PedidosVentas( true, false, 450, '1' );
end;

procedure Tform_visitas_por_cliente_000.BitBtn_ver_PresupuestosClick(
  Sender: TObject);
begin
    UTI_Abrir_Modulo_PresupuestosVentas( true, false, 440, '1' );
end;

end.

