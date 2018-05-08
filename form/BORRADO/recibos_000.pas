unit recibos_000;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, DateTimePicker, ExtendedNotebook, Forms, Controls, Graphics,
  Dialogs, Buttons, ComCtrls, ExtCtrls, StdCtrls, DBGrids, DbCtrls, Grids, utilidades_bd,
  utilidades_general, utilidades_rgtro, utilidades_usuarios, utilidades_ventas, variants,
  utilidades_lineas_detalle, utilidades_datos_tablas, utilidades_stock, utilidades_forms_Filtrar;

type

  { Tform_recibos_000 }

  Tform_recibos_000 = class(TForm)
    BitBtn_Filtrar: TBitBtn;
    BitBtn_Imprimir: TBitBtn;
    BitBtn_SALIR: TBitBtn;
    BitBtn_Seleccionar: TBitBtn;
    BitBtn_Ver_Situacion_Registro: TBitBtn;
    Boton_Elegir_Alumno: TBitBtn;
    Boton_Elegir_Empresa: TBitBtn;
    Boton_Elegir_Forma_Pago: TBitBtn;
    ComboBox_Filtros: TComboBox;
    DataSource_Alb_Detalles: TDataSource;
    DataSource_Alb: TDataSource;
    DateTimePicker_Desde: TDateTimePicker;
    DateTimePicker_Hasta: TDateTimePicker;
    DBGrid_Principal: TDBGrid;
    DBNavigator1: TDBNavigator;
    Edit_Descripcion_Alumno: TEdit;
    Edit_Descripcion_Empresa: TEdit;
    Edit_Descripcion_Forma_Pago: TEdit;
    Edit_Descripcion_Recibo: TEdit;
    Edit_id_Alumno: TEdit;
    Edit_id_Empresas: TEdit;
    Edit_id_Forma_Pago: TEdit;
    GroupBox4: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label_Ctdad_Rgtros: TLabel;
    Label_Fecha2: TLabel;
    Memo_Filtros: TMemo;
    Memo_OrderBy: TMemo;
    PageControl_Filtros: TPageControl;
    Panel2: TPanel;
    Panel_Crear_Albaranes: TPanel;
    ProgressBar_Crear_Albaranes: TProgressBar;
    RadioButton_Albaranes_Solo: TRadioButton;
    RadioButton_Facturados_Solo: TRadioButton;
    RadioButton_Todos: TRadioButton;
    RadioGroup_Bajas: TRadioGroup;
    SQLQuery_AlbChange_Id_User: TLargeintField;
    SQLQuery_AlbChange_WHEN: TDateTimeField;
    SQLQuery_AlbCONCEPTO_SEPA: TStringField;
    SQLQuery_AlbDel_Id_User: TLargeintField;
    SQLQuery_AlbDel_WHEN: TDateTimeField;
    SQLQuery_AlbDel_WHY: TStringField;
    SQLQuery_AlbFecha: TDateTimeField;
    SQLQuery_Albid_clientes: TLargeintField;
    SQLQuery_Albid_empresas: TLargeintField;
    SQLQuery_Albid_formas_pago: TLargeintField;
    SQLQuery_AlbInsert_Id_User: TLargeintField;
    SQLQuery_AlbInsert_WHEN: TDateTimeField;
    SQLQuery_AlbNumero_Albaran: TLargeintField;
    SQLQuery_AlbNumero_Factura: TLargeintField;
    SQLQuery_AlbOT_descripcion_cliente: TStringField;
    SQLQuery_AlbOT_descripcion_empresa: TStringField;
    SQLQuery_AlbOT_descripcion_forma_pago: TStringField;
    SQLQuery_AlbOT_el_Albaran1: TStringField;
    SQLQuery_AlbSerie_Albaran: TStringField;
    SQLQuery_AlbSerie_Factura: TStringField;
    SQLQuery_Alb_Detalles: TSQLQuery;
    SQLQuery_Alb: TSQLQuery;
    SQLQuery_Albid: TLargeintField;
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
    SQLQuery_Alb_DetallesOT_Concepto_Articulo1: TStringField;
    SQLQuery_Alb_DetallesOT_descripcion_almacen: TStringField;
    SQLQuery_Alb_DetallesOT_descripcion_articulo: TStringField;
    SQLQuery_Alb_DetallesOT_descripcion_impuesto: TStringField;
    SQLQuery_Alb_DetallesOT_Excluirlo1: TStringField;
    SQLQuery_Alb_DetallesOT_Numero_Albaran: TLargeintField;
    SQLQuery_Alb_DetallesOT_para_Cobrar1: TFloatField;
    SQLQuery_Alb_DetallesOT_Serie_Albaran: TStringField;
    SQLQuery_Alb_DetallesOT_Tipo_de_articulo: TStringField;
    SQLQuery_Alb_DetallesPVP: TBCDField;
    SQLQuery_Alb_DetallesPVP_Impuestos_Incluidos: TBCDField;
    SQLQuery_Alb_DetallesPVP_Manual_Final: TBCDField;
    SQLQuery_Alb_DetallesRepetir_Cada: TLongintField;
    SQLQuery_Alb_DetallesSerie_Factura: TStringField;
    SQLQuery_Alb_DetallesUnidades: TBCDField;
    SQLQuery_Clientesid1: TLargeintField;
    TabSheet_Busqueda_Concreta: TTabSheet;
    TabSheet_Filtros_Generales: TTabSheet;

    procedure Boton_Elegir_AlumnoClick(Sender: TObject);
    procedure Boton_Elegir_EmpresaClick(Sender: TObject);
    procedure Boton_Elegir_Forma_PagoClick(Sender: TObject);
    procedure ComboBox_FiltrosChange(Sender: TObject);
    procedure Crear_Ristra_Albaranes_Recibos( param_msg : TStrings; param_id_Empresa_Rcbo, param_id_Alumno_Rcbo, param_id_Forma_Pago_Rcbo, param_Concepto_SEPA_Rcbo, param_Fecha_Rcbo : ShortString );
    procedure Crear_Ristra_Albaranes_Recibos_II( param_msg : TStrings; param_id_Empresa_Rcbo, param_id_Alumno_Rcbo, param_id_Forma_Pago_Rcbo, param_Concepto_SEPA_Rcbo, param_Fecha_Rcbo, param_Serie_Albaran, param_Numero_Albaran : ShortString );
    function  Crear_Ristra_Albaranes_Recibos_III( param_msg : TStrings; param_id_Empresa_Rcbo, param_id_Alumno_Rcbo, param_id_Forma_Pago_Rcbo, param_Concepto_SEPA_Rcbo, param_Fecha_Rcbo, param_Serie_Albaran, param_Numero_Albaran, param_id_albaranes : ShortString ) : Integer;
    procedure Edit_Descripcion_AlumnoClick(Sender: TObject);
    procedure Edit_Descripcion_EmpresaClick(Sender: TObject);
    procedure Edit_Descripcion_Forma_PagoClick(Sender: TObject);

    procedure Insertar_Registro;
    procedure Editar_Registro;
    procedure Filtrar_Principal_Sin_Preguntar;
    procedure Filtrar_tablas_ligadas;
    function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
    function  Filtrar_Alb_Detalles( param_Last_Column : TColumn; param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
    procedure BitBtn_FiltrarClick(Sender: TObject);
    procedure BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
    procedure no_Tocar;
    procedure Presentar_Datos;
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
    procedure Refrescar_Registros;
    procedure Refrescar_Registros_Alb_Detalles;
    procedure Cerramos_Tablas;
    procedure Cerramos_Tablas_Ligadas;
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
    procedure SQLQuery_Alb_DetallesBeforePost(DataSet: TDataSet);
    procedure SQLQuery_Alb_DetallesCalcFields(DataSet: TDataSet);

  private
    { private declarations }
    private_Salir_OK                  : Boolean;
    private_Last_Column               : TColumn;
    private_Order_By                  : array of TOrder_By;
    private_Order_By_Lineas_Detalles  : array of TOrder_By;
    private_Actualizado_Antes_de_Post : Boolean;
  public
    { public declarations }
    public_Solo_Ver                 : Boolean;
    public_Elegimos                 : Boolean;
    public_Menu_Worked              : Integer;
    public_Rgtro_Seleccionado       : Boolean;
    public_Last_Column_Alb_Detalles : TColumn;
  end;

var
  form_recibos_000: Tform_recibos_000;

implementation

{$R *.lfm}

uses dm_albaranes_ventas, menu, recibos_001, recibos_002, alumnos_000;

{ Tform_recibos_000 }

procedure Tform_recibos_000.FormActivate(Sender: TObject);
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

procedure Tform_recibos_000.FormCreate(Sender: TObject);
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

procedure Tform_recibos_000.para_Empezar;
begin
    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    if UTI_GEN_Form_Abierto_Ya('DataModule_Albaranes_Ventas') = False then
    begin
        DataModule_Albaranes_Ventas := TDataModule_Albaranes_Ventas.Create(Application);
    end;

    // ********************************************************************************************* //
    // ** Preparamos los diferentes tipos de orden preconfigurados                                ** //
    // ********************************************************************************************* //
    // ** ALUMNOS/CLIENTES                                                                        ** //
    // ********************************************************************************************* //
    SetLength(private_Order_By, 4);

    private_Order_By[0].Titulo       := 'Por fecha';
    private_Order_By[0].Memo_OrderBy := 'a.Fecha ASC';

    private_Order_By[1].Titulo       := 'Por el número de albarán'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[1].Memo_OrderBy := 'a.Serie_Albaran ASC, a.Numero_Albaran ASC';

    private_Order_By[2].Titulo       := 'Por empresa';
    private_Order_By[2].Memo_OrderBy := 'a.id_empresas ASC, a.Fecha ASC';

    private_Order_By[3].Titulo       := 'Por cliente';
    private_Order_By[3].Memo_OrderBy := 'a.id_clientes ASC, a.Fecha ASC';

    Memo_OrderBy.Lines.Text          := private_Order_By[0].Memo_OrderBy;

    UTI_TB_Rellenar_ComboBox_Orden( true,
                                    ComboBox_Filtros,
                                    private_Order_By,
                                    0 );

    // ********************************************************************************************* //
    // ** ALBARANES DETALLES                                                                      ** //
    // ********************************************************************************************* //
    SetLength(private_Order_By_Lineas_Detalles, 1);

    private_Order_By_Lineas_Detalles[0].Titulo       := 'Por id del albarán'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_Lineas_Detalles[0].Memo_OrderBy := 'ad.id_albaranes ASC, ad.id ASC';

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

procedure Tform_recibos_000.RadioGroup_BajasClick(Sender: TObject);
begin
    Refrescar_Registros;
end;

procedure Tform_recibos_000.FormClose(Sender: TObject; var CloseAction: TCloseAction);
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

procedure Tform_recibos_000.FormDestroy(Sender: TObject);
begin
    Cerramos_Tablas;
end;

procedure Tform_recibos_000.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_Albaranes_Ventas.SQLConnector_Alb,
                      DataModule_Albaranes_Ventas.SQLTransaction_Alb,
                      SQLQuery_Alb ) = false then UTI_GEN_Salir;

    DataModule_Albaranes_Ventas.Free;
end;

procedure Tform_recibos_000.Cerramos_Tablas_Ligadas;
begin
    if UTI_TB_Cerrar( DataModule_Albaranes_Ventas.SQLConnector_Alb_Detalles,
                      DataModule_Albaranes_Ventas.SQLTransaction_Alb_Detalles,
                      SQLQuery_Alb_Detalles ) = false then UTI_GEN_Salir;
end;

procedure Tform_recibos_000.SQLQuery_AlbCalcFields(DataSet: TDataSet);
begin
    with SQLQuery_Alb do
    begin
        // ***************************************************************************************** //
        // ** EL ALBARAN                                                                          ** //
        // ***************************************************************************************** //
        FieldByName('OT_el_Albaran').AsString := Trim(FieldByName('Serie_Albaran').AsString) +
                                                 '-' +
                                                 Trim(FieldByName('Numero_Albaran').AsString);
    end;
end;

procedure Tform_recibos_000.SQLQuery_AlbAfterPost(DataSet: TDataSet);
begin
    UTI_RGTRO_Grabar( 'albaranes_ventas',
                      DataModule_Albaranes_Ventas.SQLTransaction_Alb,
                      SQLQuery_Alb );

    Refrescar_Registros;
end;

procedure Tform_recibos_000.SQLQuery_AlbBeforePost(DataSet: TDataSet);
begin
    UTI_RGTRO_param_assign_value( SQLQuery_Alb );
end;

procedure Tform_recibos_000.SQLQuery_AlbAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure Tform_recibos_000.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    If public_Elegimos then
         Seleccionado_Rgtro
    else Editar_Registro;
end;

procedure Tform_recibos_000.DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    UTI_GEN_Dibujar_Grid( Sender, SQLQuery_Alb, Rect, DataCol, Column, State );
end;

procedure Tform_recibos_000.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then
    begin
        If public_Elegimos then
             Seleccionado_Rgtro
        else Editar_Registro;
    end;
end;

procedure Tform_recibos_000.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

procedure Tform_recibos_000.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure Tform_recibos_000.DBGrid_PrincipalTitleClick(Column: TColumn);
begin
    private_Last_Column := UTI_GEN_Ordenar_dbGrid( private_Last_Column,
                                                   Column, SQLQuery_Alb );
end;

procedure Tform_recibos_000.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_recibos_000.BitBtn_SeleccionarClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
end;

procedure Tform_recibos_000.Seleccionado_Rgtro;
begin
    private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    public_Rgtro_Seleccionado := true;
    Close;
end;

procedure Tform_recibos_000.DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
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
                UTI_RGTRO_Borrar( 'albaranes_ventas',
                                  SQLQuery_Alb,
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

procedure Tform_recibos_000.BitBtn_ImprimirClick(Sender: TObject);
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

    if Trim(Edit_Descripcion_Recibo.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con descripción del recibo %' +
                            Trim(Edit_Descripcion_Recibo.Text) + '%';
    end;

    if (not DateTimePicker_Hasta.DateIsNull) or
       (not DateTimePicker_Desde.DateIsNull) then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', recibo entre ' +
                            DateToStr(DateTimePicker_Desde.Date) +
                            ' y el ' +
                            DateToStr(DateTimePicker_Hasta.Date);
    end;

    if Trim(Edit_Descripcion_Forma_Pago.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con forma de pago = ' +
                            Trim(Edit_Descripcion_Forma_Pago.Text);
    end;

    if Trim(Edit_Descripcion_Alumno.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con alumno = ' +
                            Trim(Edit_Descripcion_Alumno.Text);
    end;

    if Trim(Edit_Descripcion_Empresa.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con empresa = ' +
                            Trim(Edit_Descripcion_Empresa.Text);
    end;

    if RadioButton_Facturados_Solo.Checked = true then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', ver sólo los facturados';
    end;

    if RadioButton_Albaranes_Solo.Checked = true then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', ver sólo los no facturados';
    end;

    if RadioButton_Todos.Checked = true then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', ver estado = todos';
    end;

    // ********************************************************************************************* //
    // ** Configuramos la llamada al generador de informes                                        ** //
    // ********************************************************************************************* //
    var_Ficheros := TStringList.Create;

    var_Ficheros.Add( 'listado_alumnos_recibos.lrf' );

    UTI_GEN_Informes( var_Ordenado_por,
                      SQLQuery_Alb,
                      DataSource_Alb,
                      Nil,
                      Nil,
                      public_Menu_Worked,
                      public_Solo_Ver,
                      '',
                      '',
                      var_Ficheros );

    var_Ficheros.Free;
end;

procedure Tform_recibos_000.no_Tocar;
begin
    BitBtn_Imprimir.Enabled := False;
end;

procedure Tform_recibos_000.Presentar_Datos;
begin
     /// guardar por lo que pueda pasar
end;

procedure Tform_recibos_000.BitBtn_FiltrarClick(Sender: TObject);
begin
    if PageControl_Filtros.ActivePage = TabSheet_Busqueda_Concreta then
    begin
        Filtrar_Principal_Sin_Preguntar;
    end else begin
        RadioGroup_Bajas.ItemIndex := Filtrar_Principal( true );
    end;
end;

procedure Tform_recibos_000.BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if SQLQuery_Alb.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'albaranes_ventas',
                                           SQLQuery_Alb,
                                           DataSource_Alb,
                                           DBGrid_Principal );
        end;
    end;
end;

procedure Tform_recibos_000.SQLQuery_AlbBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTRO_param_assign_value_Edit( SQLQuery_Alb );
end;

procedure Tform_recibos_000.SQLQuery_Alb_DetallesBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTRO_param_assign_value_Edit( SQLQuery_Alb_Detalles );
end;

procedure Tform_recibos_000.SQLQuery_Alb_DetallesAfterPost(DataSet: TDataSet);
begin
    if private_Actualizado_Antes_de_Post = true then
    begin
        UTI_RGTRO_Grabar( 'albaranes_ventas_detalles',
                          DataModule_Albaranes_Ventas.SQLTransaction_Alb_Detalles,
                          SQLQuery_Alb_Detalles );
    end;

    Refrescar_Registros_Alb_Detalles;
end;

procedure Tform_recibos_000.SQLQuery_Alb_DetallesCalcFields(DataSet: TDataSet);
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
        var_Valores_Linea := UTI_VENTAS_Calculo_de_Linea_Detalle(form_recibos_000.SQLQuery_Alb_Detalles);

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

procedure Tform_recibos_000.Refrescar_Registros;
var var_id_empresas    : Int64;
    var_Serie_Albaran  : ShortString;
    var_Numero_Albaran : Int64;
    var_id_clientes    : Int64;
    var_Fecha          : TDateTime;
    var_id_formas_pago : Int64;
    var_CONCEPTO_SEPA  : ShortString;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_id_empresas    := 0;
    var_Serie_Albaran  := '';
    var_Numero_Albaran := 0;
    var_id_clientes    := 0;
    var_id_formas_pago := 0;
    var_CONCEPTO_SEPA  := '';

    with SQLQuery_Alb do
    begin
        if RecordCount > 0 then
        begin
            var_id_empresas    := FieldByName('id_empresas').Value;
            var_Serie_Albaran  := FieldByName('Serie_Albaran').Value;
            var_Numero_Albaran := FieldByName('Numero_Albaran').Value;
            var_id_clientes    := FieldByName('id_clientes').Value;
            var_id_formas_pago := FieldByName('id_formas_pago').Value;
            var_CONCEPTO_SEPA  := FieldByName('CONCEPTO_SEPA').Value;
        end;
    end;

    Filtrar_Principal_Sin_Preguntar;

    if var_id_empresas <> 0 then
    begin
         SQLQuery_Alb.Locate( 'id_empresas;Serie_Albaran;Numero_Albaran;id_clientes;id_formas_pago;CONCEPTO_SEPA',

                              VarArrayOf( [ var_id_empresas, var_Serie_Albaran, var_Numero_Albaran,
                                            var_id_clientes, var_id_formas_pago, var_CONCEPTO_SEPA ] ),
                              [] );
    end;
end;

procedure Tform_recibos_000.Refrescar_Registros_Alb_Detalles;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
    var_id             : ShortString;
    var_ver_Bajas      : ShortInt;
begin
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

    UTI_RGTRO_Add_to_Where( true,
                            var_Lineas_Filtro,
                            'ad.id_albaranes = ' + SQLQuery_Alb.FieldByName('id').AsString );

    var_ver_Bajas := RadioGroup_Bajas.ItemIndex;

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

procedure Tform_recibos_000.Filtrar_tablas_ligadas;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
begin
    if SQLQuery_Alb.RecordCount = 0 then Exit;

    if SQLQuery_Alb.State = dsInsert then
    begin
        Cerramos_Tablas_Ligadas;
        Exit;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    // ********************************************************************************************* //
    // ** ALBARANES DETALLES                                                                      ** //
    // ********************************************************************************************* //
    UTI_RGTRO_Add_to_Where( true,
                            var_Lineas_Filtro,
                            'ad.id_albaranes = ' + SQLQuery_Alb.FieldByName('id').AsString );

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

function Tform_recibos_000.Filtrar_Alb_Detalles( param_Last_Column : TColumn;
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
                              DataModule_Albaranes_Ventas.SQLTransaction_Alb_Detalles,
                              DataModule_Albaranes_Ventas.SQLConnector_Alb_Detalles,
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

procedure Tform_recibos_000.Filtrar_Principal_Sin_Preguntar;
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

procedure Tform_recibos_000.Editar_Registro;
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
                if UTI_RGTRO_isLock( 'albaranes_ventas',
                                     var_id,
                                     true ) = true then
                begin
                    Exit;
                end else begin
                    if UTI_RGTRO_Lock( 'albaranes_ventas',
                                       var_id ) = true then
                         Edit
                    else Exit;
                end;

                Application.CreateForm(Tform_recibos_002, form_recibos_002);

                form_recibos_002.RadioGroup_Bajas.ItemIndex := RadioGroup_Bajas.ItemIndex;
                form_recibos_002.public_Menu_Worked         := public_Menu_Worked;

                if public_Solo_Ver = true then
                begin
                    form_recibos_002.public_Solo_Ver := true;
                end;

                form_recibos_002.para_Empezar;

                form_recibos_002.ShowModal;
                if form_recibos_002.public_Pulso_Aceptar = true then
                begin
                    if ( Trim(Params.ParamByName('COPY_' + 'id_empresas').AsString)    <> Trim(FieldByName('id_empresas').AsString) )    or
                       ( Trim(Params.ParamByName('COPY_' + 'Serie_Albaran').AsString)  <> Trim(FieldByName('Serie_Albaran').AsString) )  or
                       ( Trim(Params.ParamByName('COPY_' + 'Numero_Albaran').AsString) <> Trim(FieldByName('Numero_Albaran').AsString) ) or
                       ( Trim(Params.ParamByName('COPY_' + 'id_clientes').AsString)    <> Trim(FieldByName('id_clientes').AsString) )    or
                       ( Trim(Params.ParamByName('COPY_' + 'Fecha').AsString)          <> Trim(FieldByName('Fecha').AsString) )          or
                       ( Trim(Params.ParamByName('COPY_' + 'id_formas_pago').AsString) <> Trim(FieldByName('id_formas_pago').AsString) ) or
                       ( Trim(Params.ParamByName('COPY_' + 'CONCEPTO_SEPA').AsString)  <> Trim(FieldByName('CONCEPTO_SEPA').AsString) )  then
                    begin
                        FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                        FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                        UTI_RGTRO_Grabar_Antes( 'albaranes_ventas', SQLQuery_Alb );
                    end else begin
                        Cancel;
                    end;
                end else begin
                    Cancel;
                end;

                form_recibos_002.Free;

                UTI_RGTRO_UnLock( 'albaranes_ventas', var_id );
            end;
        end else begin
            var_msg.Add(rs_no_Hay_Rgtros);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        end;
    end;

    var_msg.Free;
end;

procedure Tform_recibos_000.Insertar_Registro;
var var_msg                : TStrings;
    var_id_Empresa_Rcbo    : ShortString;
    var_id_Alumno_Rcbo     : ShortString;
    var_id_Forma_Pago_Rcbo : ShortString;
    var_Concepto_SEPA_Rcbo : ShortString;
    var_Fecha_Rcbo         : ShortString;
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
                Application.CreateForm(Tform_recibos_001, form_recibos_001);

                form_recibos_001.para_Empezar;

                form_recibos_001.ShowModal;

                if form_recibos_001.public_Pulso_Aceptar = true then
                begin
                    var_id_Empresa_Rcbo    := form_recibos_001.Edit_id_Empresa.Text;
                    var_id_Alumno_Rcbo     := form_recibos_001.Edit_id_Alumno.Text;
                    var_id_Forma_Pago_Rcbo := form_recibos_001.Edit_id_Forma_Pago.Text;
                    var_Concepto_SEPA_Rcbo := form_recibos_001.Edit_Concepto_SEPA.Text;
                    var_Fecha_Rcbo         := DateToStr(form_recibos_001.DateTimePicker_Rcbo_Next.Date);

                    form_recibos_001.Free;

                    Crear_Ristra_Albaranes_Recibos( var_msg,
                                                    var_id_Empresa_Rcbo,
                                                    var_id_Alumno_Rcbo,
                                                    var_id_Forma_Pago_Rcbo,
                                                    var_Concepto_SEPA_Rcbo,
                                                    var_Fecha_Rcbo );

                    if Trim(var_msg.Text) <> '' then
                    begin
                        UTI_GEN_Aviso(true, var_msg, 'PROBLEMAS', True, False);
                    end;

                    Refrescar_Registros;
                end;
            end;
        end;

        var_msg.Free;
    end;
end;

procedure Tform_recibos_000.Boton_Elegir_Forma_PagoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Form( true, false, '', 80 );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Forma_Pago.Text          := Trim(var_Registro.id_1);
        Edit_Descripcion_Forma_Pago.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_recibos_000.ComboBox_FiltrosChange(Sender: TObject);
begin
    Memo_OrderBy.Lines.Clear;
    Memo_OrderBy.Lines.Add( private_Order_By[ComboBox_Filtros.ItemIndex].Memo_OrderBy );
    BitBtn_FiltrarClick(Nil);
end;

procedure Tform_recibos_000.Boton_Elegir_AlumnoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Form( true, false, '', 330 );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Alumno.Text          := Trim(var_Registro.id_1);
        Edit_Descripcion_Alumno.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_recibos_000.Boton_Elegir_EmpresaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Form( true, false, '', 250 );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Empresas.Text         := Trim(var_Registro.id_1);
        Edit_Descripcion_Empresa.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_recibos_000.Edit_Descripcion_AlumnoClick(Sender: TObject);
begin
    Edit_id_Alumno.Text          := '';
    Edit_Descripcion_Alumno.Text := '';
end;

procedure Tform_recibos_000.Edit_Descripcion_EmpresaClick(Sender: TObject);
begin
    Edit_id_Empresas.Text         := '';
    Edit_Descripcion_Empresa.Text := '';
end;

procedure Tform_recibos_000.Edit_Descripcion_Forma_PagoClick(Sender: TObject);
begin
    Edit_id_Forma_Pago.Text          := '';
    Edit_Descripcion_Forma_Pago.Text := '';
end;

function Tform_recibos_000.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
var var_Registro_CRUD : TRegistro_CRUD;
    var_ctdad_Rgtros  : Integer;
    var_a_Filtrar     : TStrings;
begin
    var_a_Filtrar := TStringList.Create;
    var_a_Filtrar.Clear;

    var_ctdad_Rgtros  := -1;
    var_Registro_CRUD := UTI_DATOS_TABLA_albaranes_ventas_CRUD;

    // ********************************************************************************************* //
    // ** AHORA PONDREMOS EL RESTO DE LOS FILTROS QUE NO SON GENERALES                            ** //
    // ********************************************************************************************* //
    // ** Primero buscaremos en el nombre y apellido el texto a buscar                              ** //
    // ********************************************************************************************* //
    if Trim(Edit_Descripcion_Recibo.Text) <> '' then
    begin
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'a.CONCEPTO_SEPA LIKE ' +
                                UTI_GEN_Comillas('%' + Trim(Edit_Descripcion_Recibo.Text) + '%') );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la fecha del recibo                                                ** //
    // ********************************************************************************************* //
    if (not DateTimePicker_Hasta.DateIsNull) and
       (not DateTimePicker_Desde.DateIsNull) then
    begin
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'a.Fecha <= ' +
                                UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Hasta.Date, false) +
                                                  ' 23:59:59' ) );
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'a.Fecha >= ' +
                                UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Desde.Date, false) +
                                                  ' 00:00:00' ) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la forma de pago                                                   ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Forma_Pago.Text) <> '' then
    begin
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'a.id_formas_pago = ' + Trim(Edit_id_Forma_Pago.Text) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la id del alumno                                                   ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Alumno.Text) <> '' then
    begin
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'a.id_clientes = ' + Trim(Edit_id_Alumno.Text) );
    end;


    // ********************************************************************************************* //
    // ** Ahora buscaremos por la id de la empresa                                                ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Empresas.Text) <> '' then
    begin
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'a.id_empresas = ' + Trim(Edit_id_Empresas.Text) );
    end;


    // ********************************************************************************************* //
    // ** Ahora filtraremos por el estado del recibo (sólo albaranes, solo facturas o todos)      ** //
    // ********************************************************************************************* //
    if RadioButton_Facturados_Solo.Checked = true then
    begin
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'NOT a.Numero_Factura IS NULL' );
    end;

    if RadioButton_Albaranes_Solo.Checked = true then
    begin
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'a.Numero_Factura IS NULL' );
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
                              DataModule_Albaranes_Ventas.SQLTransaction_Alb,
                              DataModule_Albaranes_Ventas.SQLConnector_Alb,
                              SQLQuery_Alb,

                              var_Registro_CRUD.name_tabla,
                              RadioGroup_Bajas.ItemIndex,

                              var_Registro_CRUD.SELECT_SQL,

                              Memo_Filtros.Lines,
                              Memo_OrderBy.Lines,
                              var_a_Filtrar.Text,

                              param_Cambiamos_Filtro );

    UTI_GEN_Borrar_Imagen_Orden_Grid(private_Last_Column);

    var_a_Filtrar.Free;

    Label_Ctdad_Rgtros.Caption := IntToStr(SQLQuery_Alb.RecordCount);

    //Filtrar_tablas_ligadas;
end;

procedure Tform_recibos_000.Crear_Ristra_Albaranes_Recibos( param_msg : TStrings;
                                                            param_id_Empresa_Rcbo,
                                                            param_id_Alumno_Rcbo,
                                                            param_id_Forma_Pago_Rcbo,
                                                            param_Concepto_SEPA_Rcbo,
                                                            param_Fecha_Rcbo : ShortString );
var var_Registro_Empresa : TEmpresas;
var var_msg              : TStrings;
begin
    var_msg := TStringList.Create;
    var_Registro_Empresa.id := param_id_Empresa_Rcbo;

    UTI_VENTAS_Devolver_Numeracion_Albaran( var_msg,
                                            var_Registro_Empresa,
                                            false,   // Para que no desbloquee el registro de empresas, pues lo desbloqueo despues de crear la ristra de albaranes
                                            false ); // Para que no actualice la empresa con el siguiente albarán, pues lo actualizo conforme creo la ristra de albaranes

    if Trim(var_msg.Text) <> '' then
    begin
        param_msg.AddStrings(var_msg);
        Exit;
    end;

    var_msg.Free;

    Crear_Ristra_Albaranes_Recibos_II( param_msg,
                                       param_id_Empresa_Rcbo,
                                       param_id_Alumno_Rcbo,
                                       param_id_Forma_Pago_Rcbo,
                                       param_Concepto_SEPA_Rcbo,
                                       param_Fecha_Rcbo,

                                       var_Registro_Empresa.Serie_Albaran,
                                       var_Registro_Empresa.Numero_Albaran );


    // ********************************************************************************************* //
    // ** Libero el registro de empresas                                                          ** //
    // ********************************************************************************************* //
    UTI_RGTRO_UnLock( 'empresas', param_id_Empresa_Rcbo );
end;

procedure Tform_recibos_000.Crear_Ristra_Albaranes_Recibos_II( param_msg : TStrings;
                                                               param_id_Empresa_Rcbo,

                                                               param_id_Alumno_Rcbo,
                                                               param_id_Forma_Pago_Rcbo,

                                                               param_Concepto_SEPA_Rcbo,
                                                               param_Fecha_Rcbo,
                                                               param_Serie_Albaran,
                                                               param_Numero_Albaran : ShortString );
var var_id_Clientes    : ShortString;
    var_Desbloquear    : Boolean;
    var_Numero_Albaran : Int64;
    var_Errores        : Integer;
    var_id_albaranes   : ShortString;
begin
    // ********************************************************************************************* //
    // ** Vamos a usar form_alumnos_000 para crear los recibos                                    ** //
    // ********************************************************************************************* //
    Application.CreateForm(Tform_alumnos_000, form_alumnos_000);

    form_alumnos_000.public_Solo_Ver                     := false;
    form_alumnos_000.public_Elegimos                     := false;
    form_alumnos_000.public_Menu_Worked                  := 330;

    form_alumnos_000.RadioButton_Periodo_Activos.Checked := true;

    form_alumnos_000.Edit_id_Forma_Pago.Text             := param_id_Forma_Pago_Rcbo;
    form_alumnos_000.Edit_id_Alumno_Rcbo.Text            := param_id_Alumno_Rcbo;

    form_alumnos_000.para_Empezar;

  { jeromito }
  { recorrer todo y avisar de la cantidad de albaranes a crear y del importe de todo
    que pregunte si facturamos y que luego si dice que si pues que cree los albaranes
    creo que sería mejor al principio bloquear todos los clientes y todas sus lineas
    y luego cuando se termine de crear los albaranes pues liberar todo }

    var_Numero_Albaran := StrToInt64(param_Numero_Albaran);

    with form_alumnos_000.SQLQuery_Clientes do
    begin
        // ***************************************************************************************** //
        // ** Se prepara la barra de progreso que recorrerá todos los clientes activos            ** //
        // ***************************************************************************************** //
        ProgressBar_Crear_Albaranes.Position := 0;
        ProgressBar_Crear_Albaranes.Max      := RecordCount;
        Panel_Crear_Albaranes.Visible        := true;

        // ***************************************************************************************** //
        // ** Recorremos todos los clientes activos                                               ** //
        // ***************************************************************************************** //
        First;
        While not EOF do
        begin
            // ************************************************************************************* //
            // ** Aumentamos la barra de progreso y pasamos al siguiente cliente / alumno         ** //         // ************************************************************************************* //
            // ************************************************************************************* //
            ProgressBar_Crear_Albaranes.Position := ProgressBar_Crear_Albaranes.Position + 1;

            var_id_Clientes := FieldByName('id').AsString;

            with form_alumnos_000.SQLQuery_Alb_Detalles do
            begin
                // ********************************************************************************* //
                // ** Solo si tiene lineas de artículos / cuotas, creamos el albarán              ** //
                // ********************************************************************************* //
                if RecordCount > 0 then
                begin
                    // ***************************************************************************** //
                    // ** Bloquear registro de cliente, así nadie podrá añadir/modificar ningún   ** //
                    // ** artículo/cuota                                                          ** //
                    // ***************************************************************************** //
                    var_Desbloquear := true;

                    if UTI_RGTRO_isLock( 'clientes',
                                         var_id_Clientes,
                                         true ) = true then
                    begin
                        // ************************************************************************* //
                        // ** YA ESTABA BLOQUEADO, no continuamos                                 ** //
                        // ************************************************************************* //
                        param_msg.Add( '* El registro del cliente ' +
                                       form_alumnos_000.SQLQuery_Clientes.FieldByName('OT_descripcion_cliente').AsString +
                                       ' ahora mismo alguien lo está bloqueando, por lo que no' +
                                       ' podemos facturarle a él. Pero seguimos con la creación de albaranes de otros clientes' );

                        var_Desbloquear := False;
                    end else begin
                        // ************************************************************************* //
                        // ** NO ESTA BLOQUEADO ASI QUE INTENTAMOS BLOQUEARLO                     ** //
                        // ************************************************************************* //
                        if UTI_RGTRO_Lock( 'clientes',
                                           var_id_Clientes ) = false then
                        begin
                            // ********************************************************************* //
                            // ** NO SE PUDO BLOQUEAR, ASI QUE NO CONTINUAMOS                     ** //
                            // ********************************************************************* //
                            param_msg.Add( '* El registro del cliente ' +
                                           form_alumnos_000.SQLQuery_Clientes.FieldByName('OT_descripcion_cliente').AsString +
                                           ' no se pudo bloquear, por lo que no' +
                                           ' podemos facturarle a él. Pero seguimos con la creación de albaranes de otros clientes' );

                            var_Desbloquear := False;
                        end else begin
                            // ********************************************************************* //
                            // ** Como se pudo bloquear el registro continuamos con la creación de** //
                            // ** los albaranes                                                   ** //
                            // ********************************************************************* //
                            // ** Creamos la cabecera del albarán                                 ** //
                            // ********************************************************************* //
                            with SQLQuery_Alb do
                            begin
                                Insert;

                                    FieldByName('id_empresas').AsString    := param_id_Empresa_Rcbo;
                                    FieldByName('Serie_Albaran').AsString  := param_Serie_Albaran;
                                    FieldByName('Numero_Albaran').AsString := FloatToStr(var_Numero_Albaran);
                                    FieldByName('id_clientes').AsString    := var_id_Clientes;
                                    FieldByName('Fecha').AsString          := param_Fecha_Rcbo;

                                    // ************************************************************* //
                                    // ** AQUI TENGO QUE PONER LA FORMA DE PAGO DEL CLIENTE ACTUAL** //
                                    // ************************************************************* //
                                    FieldByName('id_formas_pago').AsString := form_alumnos_000.SQLQuery_Clientes.FieldByName('id_formas_pago').AsString;

                                    FieldByName('CONCEPTO_SEPA').AsString  := param_Concepto_SEPA_Rcbo;

                                    FieldByName('Insert_WHEN').Value       := UTI_CN_Fecha_Hora;
                                    FieldByName('Insert_Id_User').Value    := Form_Menu.public_User;

                                if UTI_RGTRO_Grabar_Antes( 'albaranes_ventas', SQLQuery_Alb ) = false then
                                begin
                                    param_msg.Add( '* Para el cliente ' +
                                                   form_alumnos_000.SQLQuery_Clientes.FieldByName('OT_descripcion_cliente').AsString +
                                                   ' ocurrio un error al crear la cabecera del próximo albarán.' +
                                                   'No se completo su proceso de crear su albarán, por lo que no' +
                                                   ' podemos continuar con la creación de albaranes.' );
                                    Exit;
                                end;
                            end;

                            var_id_albaranes := UTI_VENTAS_Devolver_id_Albaran( param_Serie_Albaran,
                                                                                FloatToStr(var_Numero_Albaran) );
                            if var_id_albaranes = '0' then
                            begin
                                param_msg.Add( '* Para el cliente ' +
                                               form_alumnos_000.SQLQuery_Clientes.FieldByName('OT_descripcion_cliente').AsString +
                                               ' ocurrio un error al traer la id de la la cabecera del albarán ' +
                                               Trim(param_Serie_Albaran) + '/' + Trim(FloatToStr(var_Numero_Albaran)) +
                                               '. Por lo que no' +
                                               ' podemos continuar con la creación de albaranes.' );
                                Exit;
                            end;

                            var_Errores := Crear_Ristra_Albaranes_Recibos_III( param_msg,
                                                                               param_id_Empresa_Rcbo,
                                                                               param_id_Alumno_Rcbo,
                                                                               param_id_Forma_Pago_Rcbo,
                                                                               param_Concepto_SEPA_Rcbo,
                                                                               param_Fecha_Rcbo,

                                                                               param_Serie_Albaran,
                                                                               FloatToStr(var_Numero_Albaran),
                                                                               var_id_albaranes );
                            if var_Errores > 0 then
                            begin
                                param_msg.Add( '* Del cliente ' +
                                               form_alumnos_000.SQLQuery_Clientes.FieldByName('OT_descripcion_cliente').AsString +
                                               ' no se pudieron convertir algunas líneas en albaranes. Otras líneas si se pudieron.' +
                                               ' Por lo que no se completo su proceso de crear albaranes. Pero seguimos con la creación de albaranes de otros clientes' );
                            end;
                        end;
                    end;

                    // ***************************************************************************** //
                    // ** Libero el registro de clientes                                          ** //
                    // ***************************************************************************** //
                    if var_Desbloquear = true then
                    begin
                        UTI_RGTRO_UnLock( 'clientes', var_id_Clientes );
                    end;
                end;
            end;

            var_Numero_Albaran := var_Numero_Albaran + 1;

            // ************************************************************************************* //
            // ** Guardamos el proximo numero de albaran en la empresa                            ** //
            // ************************************************************************************* //
            if UTI_VENTAS_Update_Next_No_Albaran( param_id_Empresa_Rcbo,
                                                  IntToStr(var_Numero_Albaran) ) = false then
            begin
                param_msg.Add( '* No se pudo actualizar el próximo número de albaran a crear, por lo que no' +
                               ' podemos continuar con la creación de albaranes.' );
                Exit;
            end;

            Next;
        end;
    end;

    // ********************************************************************************************* //
    // ** Ponemos en modo invisible la barrra de progreso y liberamos el form_alumnos_000         ** //
    // ********************************************************************************************* //
    Panel_Crear_Albaranes.Visible := false;

    form_alumnos_000.Close;
    form_alumnos_000.Free;
end;

function Tform_recibos_000.Crear_Ristra_Albaranes_Recibos_III( param_msg : TStrings;
                                                               param_id_Empresa_Rcbo,
                                                               param_id_Alumno_Rcbo,
                                                               param_id_Forma_Pago_Rcbo,
                                                               param_Concepto_SEPA_Rcbo,
                                                               param_Fecha_Rcbo,
                                                               param_Serie_Albaran,
                                                               param_Numero_Albaran,
                                                               param_id_albaranes : ShortString ) : Integer;
var var_Desbloquear                  : Boolean;
    var_id_albaranes_ventas_detalles : ShortString;
begin
    Result := 0;

    // ********************************************************************************************* //
    // ** Recorremos todas las lineas de detalle del cliente                                      ** //
    // ********************************************************************************************* //
    with form_alumnos_000.SQLQuery_Alb_Detalles do
    begin
        First;
        While not EOF do
        begin
            // ************************************************************************************* //
            // ** Bloquear registro de detalle de líneas a facturar del cliente                   ** //
            // ************************************************************************************* //
            var_Desbloquear                  := true;
            var_id_albaranes_ventas_detalles := FieldByName('id').AsString;

            if UTI_RGTRO_isLock( 'albaranes_ventas_detalles',
                                 var_id_albaranes_ventas_detalles,
                                 true ) = true then
            begin
                // ************************************************************************************* //
                // ** YA ESTABA BLOQUEADO, no continuamos                                             ** //
                // ************************************************************************************* //
                Result := Result + 1; // Cantidad de lineas de albaran que no pueden ser facturados

                param_msg.Add( '    ' + Trim(IntToStr(Result)) + '.-' +
                               ' El registro de línea de albarán con id ' + FieldByName('id').asstring +
                               ' del cliente ' +
                               form_alumnos_000.SQLQuery_Clientes.FieldByName('OT_descripcion_cliente').AsString +
                               ' ahora mismo alguien lo está bloqueando, por lo que no' +
                               ' podemos facturarlo' );

                var_Desbloquear := False;
            end else begin
                // ********************************************************************************* //
                // ** NO ESTA BLOQUEADO ASI QUE INTENTAMOS BLOQUEARLO                             ** //
                // ********************************************************************************* //
                if UTI_RGTRO_Lock( 'albaranes_ventas_detalles',
                                   var_id_albaranes_ventas_detalles ) = false then
                begin
                    // ***************************************************************************** //
                    // ** NO SE PUDO BLOQUEAR, ASI QUE NO CONTINUAMOS                             ** //
                    // ***************************************************************************** //
                    Result := Result + 1; // // Cantidad de lineas de albaran que no pueden ser facturados

                    param_msg.Add( '    ' + Trim(IntToStr(Result)) + '.- ' +
                                   ' El registro de línea de albarán con id ' + FieldByName('id').asstring +
                                   ' del cliente ' +
                                   form_alumnos_000.SQLQuery_Clientes.FieldByName('OT_descripcion_cliente').AsString +
                                   ' no se pudo bloquear, por lo que no' +
                                   ' podemos convertirlo en línea para el albarán ' +
                                   param_Serie_Albaran + '/' + param_Numero_Albaran );

                    var_Desbloquear := False;
                end else begin
                    // ***************************************************************************** //
                    // ** Actualizamos al nuevo numero de albaran el detalle                      ** //
                    // ***************************************************************************** //
                            form_alumnos_000.SQLQuery_Alb_Detalles.Edit;
                                FieldByName('id_albaranes').AsString := param_id_albaranes;
                                FieldByName('Change_WHEN').Value     := UTI_CN_Fecha_Hora;
                                FieldByName('Change_Id_User').Value  := Form_Menu.public_User;
                            // form_alumnos_000.SQLQuery_Alb_Detalles.Post;

                    if UTI_RGTRO_Grabar_Antes( 'albaranes_ventas_detalles',
                                               form_alumnos_000.SQLQuery_Alb_Detalles ) = false then
                    begin
                        Result := Result + 1; // // Cantidad de lineas de albaran que no pueden ser facturados

                        param_msg.Add( '    ' + Trim(IntToStr(Result)) + '.- ' +
                                       ' El registro de línea de albarán con id ' + FieldByName('id').asstring +
                                       ' del cliente ' +
                                       form_alumnos_000.SQLQuery_Clientes.FieldByName('OT_descripcion_cliente').AsString +
                                       ' no se pudo convertir en línea para el albarán ' +
                                       param_Serie_Albaran + '/' + param_Numero_Albaran );
                    end;
                end;
            end;

           // ************************************************************************************** //
           // ** Libero el registro de albaranes_ventas_detalles                                  ** //
           // ************************************************************************************** //
           if var_Desbloquear = true then
           begin
                UTI_RGTRO_UnLock( 'albaranes_ventas_detalles', var_id_albaranes_ventas_detalles );
           end;

           // Next; // ** NO HACE FALTA PORQUE EN form_Alumnos_000 cada vez que hacemos un post se refresca con id_albaranes = 0
        end;
    end;
end;

procedure Tform_recibos_000.SQLQuery_Alb_DetallesBeforePost(DataSet: TDataSet);
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

{
procedure Tform_recibos_000.SQLQuery_Alb_DetallesBeforePost(DataSet: TDataSet);
var var_Actualizamos_Stock : Boolean;
begin
    // ********************************************************************************************* //
    // ** Ojito, que sólo actualizaremos el stock de artículos en donde su campo Tipo_de_articulo ** //
    // ** sea con valor .. 0 .. es decir que sea actualizable su stock y por supuesto que tuvieran** //
    // ** unidades a descontar en la línea de detalle del albarán                                 ** //
    // ********************************************************************************************* //
    var_Actualizamos_Stock := false;

    if SQLQuery_Alb_Detalles.FieldByName('OT_Tipo_de_articulo').Value = 0 then
    begin
        if not SQLQuery_Alb_Detalles.FieldByName('Unidades').IsNull then
        begin
            if SQLQuery_Alb_Detalles.FieldByName('Unidades').Value <> 0 then
            begin
                var_Actualizamos_Stock := true;
            end;
        end;
    end;

    if var_Actualizamos_Stock = true then
    begin
        // ***************************************************************************************** //
        // ** Actualizamos el stock                                                               ** //
        // ***************************************************************************************** //
        if UTI_STOCK_Update_STOCK( true,
                                   SQLQuery_Alb_Detalles,
                                   SQLQuery_Alb_Detalles ) = true then
        begin
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
        // ** No actualizamos el stock, así que usamos el método tradicional del commit           ** //
        // ***************************************************************************************** //
        private_Actualizado_Antes_de_Post := true;
        UTI_RGTRO_param_assign_value( SQLQuery_Alb_Detalles );
    end;
end;


}
