unit visitas_000;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, DateTimePicker, Forms, Controls, Graphics, Dialogs, variants,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, DBGrids, DbCtrls, Grids, utilidades_bd, utilidades_general,
  utilidades_datos_tablas, utilidades_usuarios, utilidades_rgtro, utilidades_forms_Filtrar;

type

  { Tform_visitas_000 }

  Tform_visitas_000 = class(TForm)
    BitBtn_Filtrar: TBitBtn;
    BitBtn_Imprimir: TBitBtn;
    BitBtn_SALIR: TBitBtn;
    BitBtn_Seleccionar: TBitBtn;
    BitBtn_ver_Pedidos: TBitBtn;
    BitBtn_ver_Presupuestos: TBitBtn;
    BitBtn_Ver_Situacion_Registro: TBitBtn;
    Boton_Elegir_Cliente: TBitBtn;
    Boton_Elegir_Ruta: TBitBtn;
    Boton_Elegir_Actividad: TBitBtn;
    Boton_Elegir_Tipo_Cliente: TBitBtn;
    Boton_Elegir_Provincia: TBitBtn;
    Boton_Elegir_Visita_Tipo: TBitBtn;
    Boton_Elegir_Representante: TBitBtn;
    Boton_Elegir_Visita_Resultado: TBitBtn;
    ComboBox_Filtros: TComboBox;
    DataSource_Visitas: TDataSource;
    DateTimePicker_Visitado_Desde: TDateTimePicker;
    DateTimePicker_Proxima_Visita_Desde: TDateTimePicker;
    DateTimePicker_Visitado_Hasta: TDateTimePicker;
    DateTimePicker_Proxima_Visita_Hasta: TDateTimePicker;
    DBGrid_Principal: TDBGrid;
    DBNavigator1: TDBNavigator;
    Edit_Descripcion_Cliente: TEdit;
    Edit_Descripcion_Ruta: TEdit;
    Edit_Descripcion_Actividad: TEdit;
    Edit_Descripcion_Tipo_Cliente: TEdit;
    Edit_Descripcion_Provincia: TEdit;
    Edit_Descripcion_Visita_Resultado: TEdit;
    Edit_Descripcion_Visita_Tipo: TEdit;
    Edit_Descripcion_Representante: TEdit;
    Edit_id_Cliente: TEdit;
    Edit_id: TEdit;
    Edit_id_Ruta: TEdit;
    Edit_id_Actividad: TEdit;
    Edit_id_Tipo_Cliente: TEdit;
    Edit_id_Provincia: TEdit;
    Edit_id_Visita_Tipo: TEdit;
    Edit_id_representantes: TEdit;
    Edit_id_Visita_Resultado: TEdit;
    Edit_Comentario: TEdit;
    Image_Confirmado: TImage;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label_Ctdad_Con_Pto: TLabel;
    Label_Ctdad_Rgtros2: TLabel;
    Label_Ctdad_Rgtros6: TLabel;
    Label_Ctdad_Sin_Pedido: TLabel;
    Label_Ctdad_Rgtros1: TLabel;
    Label_Ctdad_Rgtros: TLabel;
    Label_Ctdad_Rgtros5: TLabel;
    Label_Ctdad_Con_Pedido: TLabel;
    Label_Ctdad_Sin_Pto: TLabel;
    Label_Fecha2: TLabel;
    Memo_Filtros: TMemo;
    Memo_OrderBy: TMemo;
    PageControl_Filtros: TPageControl;
    RadioGroup_Bajas: TRadioGroup;
    SQLQuery_Visitas: TSQLQuery;
    SQLQuery_VisitasChange_Id_User: TLargeintField;
    SQLQuery_VisitasChange_WHEN: TDateTimeField;
    SQLQuery_VisitasComentario: TStringField;
    SQLQuery_VisitasDel_Id_User: TLargeintField;
    SQLQuery_VisitasDel_WHEN: TDateTimeField;
    SQLQuery_VisitasDel_WHY: TStringField;
    SQLQuery_VisitasFecha_Visita: TDateTimeField;
    SQLQuery_VisitasFecha_Visita_Proxima: TDateTimeField;
    SQLQuery_Visitasid: TLargeintField;
    SQLQuery_Visitasid_clientes: TLargeintField;
    SQLQuery_Visitasid_clientes_contactos: TLargeintField;
    SQLQuery_Visitasid_representantes: TLargeintField;
    SQLQuery_Visitasid_visitas_resultados: TLargeintField;
    SQLQuery_Visitasid_visitas_tipos: TLargeintField;
    SQLQuery_VisitasInsert_Id_User: TLargeintField;
    SQLQuery_VisitasInsert_WHEN: TDateTimeField;
    SQLQuery_VisitasOT_descripcion_actividad: TStringField;
    SQLQuery_VisitasOT_descripcion_cliente: TStringField;
    SQLQuery_VisitasOT_descripcion_cliente_tipo: TStringField;
    SQLQuery_VisitasOT_descripcion_Contacto: TStringField;
    SQLQuery_VisitasOT_descripcion_pais: TStringField;
    SQLQuery_VisitasOT_descripcion_poblacion: TStringField;
    SQLQuery_VisitasOT_descripcion_provincia: TStringField;
    SQLQuery_VisitasOT_descripcion_representante: TStringField;
    SQLQuery_VisitasOT_descripcion_ruta: TStringField;
    SQLQuery_VisitasOT_descripcion_visita_resultado: TStringField;
    SQLQuery_VisitasOT_descripcion_visita_tipo: TStringField;
    SQLQuery_VisitasOT_FAX: TStringField;
    SQLQuery_VisitasOT_id_actividades: TLargeintField;
    SQLQuery_VisitasOT_id_clientes_tipos: TLargeintField;
    SQLQuery_VisitasOT_id_paises: TLargeintField;
    SQLQuery_VisitasOT_id_poblaciones: TLargeintField;
    SQLQuery_VisitasOT_id_provincias: TLargeintField;
    SQLQuery_VisitasOT_id_rutas: TLargeintField;
    SQLQuery_VisitasOT_Movil: TStringField;
    SQLQuery_VisitasOT_nif_cif: TStringField;
    SQLQuery_VisitasOT_Tfno_Fijo_1: TStringField;
    SQLQuery_VisitasOT_Tfno_Fijo_2: TStringField;
    SQLQuery_VisitasPedido_Realizado_SN: TStringField;
    SQLQuery_VisitasPresupuesto_Realizado_SN: TStringField;
    TabSheet_Busqueda_Concreta: TTabSheet;
    TabSheet_Filtros_Generales: TTabSheet;

    procedure BitBtn_ver_PedidosClick(Sender: TObject);
    procedure BitBtn_ver_PresupuestosClick(Sender: TObject);
    procedure ComboBox_FiltrosChange(Sender: TObject);
    procedure Insertar_Planificacion( param_nombre_campo, param_id : ShortString );
    procedure Boton_Elegir_ActividadClick(Sender: TObject);
    function  Insertar_Planificacion_Visitas( param_nombre_campo, param_id : ShortString ) : ShortString;
    procedure Boton_Elegir_ClienteClick(Sender: TObject);
    procedure Boton_Elegir_ProvinciaClick(Sender: TObject);
    procedure Boton_Elegir_RepresentanteClick(Sender: TObject);
    procedure Boton_Elegir_RutaClick(Sender: TObject);
    procedure Boton_Elegir_Tipo_ClienteClick(Sender: TObject);
    procedure Boton_Elegir_Visita_ResultadoClick(Sender: TObject);
    procedure Boton_Elegir_Visita_TipoClick(Sender: TObject);
    procedure Edit_Descripcion_ActividadClick(Sender: TObject);
    procedure Edit_Descripcion_ClienteClick(Sender: TObject);
    procedure Edit_Descripcion_ProvinciaClick(Sender: TObject);
    procedure Edit_Descripcion_RepresentanteClick(Sender: TObject);
    procedure Edit_Descripcion_RutaClick(Sender: TObject);
    procedure Edit_Descripcion_Tipo_ClienteClick(Sender: TObject);
    procedure Edit_Descripcion_Visita_ResultadoClick(Sender: TObject);
    procedure Edit_Descripcion_Visita_TipoClick(Sender: TObject);
    procedure Presentar_Datos;
    procedure Insertar_Registro;
    procedure Editar_Registro;
    procedure Seleccionado_Rgtro;
    procedure Refrescar_Registros;
    procedure Filtrar_tablas_ligadas;
    procedure BitBtn_ImprimirClick(Sender: TObject);
    procedure BitBtn_SALIRClick(Sender: TObject);
    procedure BitBtn_SeleccionarClick(Sender: TObject);
    procedure BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
    procedure DBGrid_PrincipalCellClick(Column: TColumn);
    procedure DBGrid_PrincipalDblClick(Sender: TObject);
    procedure DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
    function  Filtrar_Principal( param_con_Pedido_SN : ShortString; param_Cambiamos_Filtro : Boolean ) : ShortInt;
    procedure Filtrar_Principal_Sin_Preguntar;
    procedure no_Tocar;
    procedure Cerramos_Tablas;
    procedure Cerramos_Tablas_Ligadas;
    procedure BitBtn_FiltrarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure para_Empezar;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RadioGroup_BajasClick(Sender: TObject);
    procedure SQLQuery_VisitasAfterPost(DataSet: TDataSet);
    procedure SQLQuery_VisitasAfterScroll(DataSet: TDataSet);
    procedure SQLQuery_VisitasBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_VisitasBeforePost(DataSet: TDataSet);

  private
    { private declarations }
    private_Salir_OK : Boolean;
    private_Order_By : array of TOrder_By;
  public
    { public declarations }
    public_Solo_Ver                  : Boolean;
    public_Elegimos                  : Boolean;
    public_Menu_Worked               : Integer;
    public_Rgtro_Seleccionado        : Boolean;

    public_llamado_desde             : String;
    public_llamado_desde_id          : String;
    public_llamado_desde_Descripcion : String;
  end;

var
  form_visitas_000: Tform_visitas_000;

implementation

{$R *.lfm}

uses dm_visitas, menu, visitas_001;

{ Tform_visitas_000 }

procedure Tform_visitas_000.FormActivate(Sender: TObject);
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

procedure Tform_visitas_000.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
    if private_Salir_OK = False then
    begin
     { ********************************************************************
       Intento BitBtn_SALIR de la aplicación de un modo no permitido.
       ********************************************************************
       Pero si desde el menu principal está a true la variable
       public_Salir_Ok, significa que hay que salir si o si pues se pulsó
       cancelar al preguntar otra vez por la contraseña
       ******************************************************************** }
       if form_Menu.public_Salir_OK = False then CloseAction := caNone;
    end else begin
     { ********************************************************************
       Fue correcto el modo como quiere BitBtn_SALIR de la aplicación
       ******************************************************************** }
    end;
end;

procedure Tform_visitas_000.FormDestroy(Sender: TObject);
begin
     Cerramos_Tablas;
end;

procedure Tform_visitas_000.FormCreate(Sender: TObject);
var var_Present          : TDateTime;

    var_Year             : Word;
    var_Month            : Word;
    var_Day              : Word;

    var_Hour             : Word;
    var_Min              : Word;
    var_Sec              : Word;
    var_MSec             : Word;
begin
    { ****************************************************************************
      Obligado en cada formulario para no olvidarlo
      **************************************************************************** }
      with Self do
      begin
          Color       := $00C2C29E;
          Position    := poScreenCenter;
          BorderIcons := [];
          BorderStyle := bsSingle;
      end;

      private_Salir_OK := false;

    { ****************************************************************************
      Solo para formularios que traten con datos
      **************************************************************************** }
      public_Solo_Ver                 := false;
      public_Elegimos                 := false;

      public_Rgtro_Seleccionado       := false;

      // ********************************************************************************************* //
      // ** SOLO PARA ESTE FORM                                                                     ** //
      // ********************************************************************************************* //
      var_Present := Now;
      DecodeDate(var_Present, var_Year, var_Month, var_Day);
      DecodeTime(var_Present, var_Hour, var_Min, var_Sec, var_MSec);

      DateTimePicker_Visitado_Desde.Date := StrToDate( '01/01/' + IntToStr(var_Year - 1) );
      DateTimePicker_Visitado_Hasta.Date := StrToDate( '31/12/' + IntToStr(var_Year + 1) );
end;

procedure Tform_visitas_000.para_Empezar;
begin
  { ****************************************************************************
    Solo para formularios que traten con datos
    **************************************************************************** }
    if UTI_GEN_Form_Abierto_Ya('DataModule_visitas') = False then
    begin
        DataModule_visitas := TDataModule_visitas.Create(Application);
    end;

  { ****************************************************************************
    Preparamos los diferentes tipos de orden preconfigurados
    **************************************************************************** }
    SetLength(private_Order_By, 9);

    private_Order_By[0].Titulo       := 'Por fecha de visita realizada'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[0].Memo_OrderBy := 'vis.Fecha_Visita ASC, vis.id ASC';

    private_Order_By[1].Titulo       := 'Por fecha de visita próxima'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[1].Memo_OrderBy := 'vis.Fecha_Visita_Proxima ASC, vis.id ASC';

    private_Order_By[2].Titulo       := 'Por representante + fecha de visita realizada'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[2].Memo_OrderBy := 'vis.id_representantes ASC, vis.Fecha_Visita ASC, vis.id ASC';

    private_Order_By[3].Titulo       := 'Por representante + fecha de visita próxima'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[3].Memo_OrderBy := 'vis.id_representantes ASC, vis.Fecha_Visita_Proxima ASC, vis.id ASC';

    private_Order_By[4].Titulo       := 'Por tipo de visita + fecha de visita realizada'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[4].Memo_OrderBy := 'vis.id_visitas_tipos ASC, vis.Fecha_Visita ASC, vis.id ASC';

    private_Order_By[5].Titulo       := 'Por resultado + fecha de visita realizada'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[5].Memo_OrderBy := 'vis.id_visitas_resultados ASC, vis.Fecha_Visita ASC, vis.id ASC';

    private_Order_By[6].Titulo       := 'Por cliente + fecha de visita realizada'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[6].Memo_OrderBy := 'vis.id_clientes ASC, vis.Fecha_Visita ASC, vis.id ASC';

    private_Order_By[7].Titulo       := 'Por cliente + fecha de visita próxima'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[7].Memo_OrderBy := 'vis.id_clientes ASC, vis.Fecha_Visita_Proxima ASC, vis.id ASC';

    private_Order_By[8].Titulo       := 'Por la id';
    private_Order_By[8].Memo_OrderBy := 'vis.id ASC';

    Memo_OrderBy.Lines.Text          := private_Order_By[0].Memo_OrderBy;

    UTI_TB_Rellenar_ComboBox_Orden( true,
                                    ComboBox_Filtros,
                                    private_Order_By,
                                    0 );

  { ****************************************************************************
    Filtramos los datos
    **************************************************************************** }
    Filtrar_Principal_Sin_Preguntar;

    Presentar_Datos;

    // ********************************************************************************************* //
    // ** SOLO PARA ESTE FORM                                                                     ** //
    // ********************************************************************************************* //
    PageControl_Filtros.ActivePage := TabSheet_Busqueda_Concreta;
end;

procedure Tform_visitas_000.no_Tocar;
begin
    BitBtn_Imprimir.Enabled := False;
end;

procedure Tform_visitas_000.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_visitas.SQLConnector,
                      DataModule_visitas.SQLTransaction,
                      SQLQuery_Visitas ) = false then UTI_GEN_Salir;

    DataModule_visitas.Free;
end;

procedure Tform_visitas_000.Cerramos_Tablas_Ligadas;
begin
    { ESTE form NO TIENE TABLAS LIGADAS

        if UTI_TB_Cerrar( DataModule_del_form_000.SQLConnector_de_la_tabla,
                          DataModule_Users.SQLTransaction_de_la_tabla,
                          SQLQuery_la_tabla ) = false then UTI_GEN_Salir;
    }
end;

procedure Tform_visitas_000.Filtrar_Principal_Sin_Preguntar;
begin
    Filtrar_Principal( 'S', false );
    Filtrar_Principal( 'N', false );
    Filtrar_Principal( 'PTO_N', false );
    Filtrar_Principal( 'PTO_S', false );

    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( '',  false );
end;

procedure Tform_visitas_000.RadioGroup_BajasClick(Sender: TObject);
begin
     Refrescar_Registros;
end;

procedure Tform_visitas_000.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_visitas_000.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure Tform_visitas_000.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    If public_Elegimos then
         Seleccionado_Rgtro
    else Editar_Registro;
end;

procedure Tform_visitas_000.DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    UTI_GEN_Dibujar_Grid( Sender, SQLQuery_Visitas, Rect, DataCol, Column, State );
end;

procedure Tform_visitas_000.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if Key = 13 then
    begin
        If public_Elegimos then
             Seleccionado_Rgtro
        else Editar_Registro;
    end;
end;

procedure Tform_visitas_000.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

procedure Tform_visitas_000.DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
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
                UTI_RGTRO_Borrar( 'visitas',
                                  SQLQuery_Visitas,
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

procedure Tform_visitas_000.BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if SQLQuery_Visitas.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'visitas',
                                           SQLQuery_Visitas,
                                           DataSource_Visitas,
                                           DBGrid_Principal );
        end;
    end;
end;

procedure Tform_visitas_000.BitBtn_ImprimirClick(Sender: TObject);
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

    if Trim(Edit_Comentario.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con comentario %' +
                            Trim(Edit_Comentario.Text) + '%';
    end;

    if Trim(Edit_Descripcion_Cliente.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con cliente = ' +
                            Trim(Edit_Descripcion_Cliente.Text);
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
                      SQLQuery_Visitas,
                      DataSource_Visitas,
                      Nil,
                      Nil,
                      Nil,
                      public_Menu_Worked,
                      public_Solo_Ver,
                      '',
                      '',
                      var_Ficheros );

    var_Ficheros.Free;
end;

procedure Tform_visitas_000.BitBtn_SeleccionarClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
end;

procedure Tform_visitas_000.Filtrar_tablas_ligadas;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
begin
    if SQLQuery_Visitas.RecordCount = 0 then Exit;

    if SQLQuery_Visitas.State = dsInsert then
    begin
        Cerramos_Tablas_Ligadas;
        Exit;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;
end;

procedure Tform_visitas_000.Insertar_Registro;
var var_msg  : TStrings;
    var_Form : Tform_visitas_001;
begin
    with SQLQuery_Visitas do
    begin
        var_msg := TStringList.Create;

        if UTI_USR_Permiso_SN(public_Menu_Worked, 'A', True) = True then
        begin
            if public_Solo_Ver = True then
            begin
                var_msg.Add(rs_Solo_Visualizar);
                UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            end else begin
                Insert ;

                FieldByName('Pedido_Realizado_SN').Value      := 'N';
                FieldByName('Presupuesto_Realizado_SN').Value := 'N';

                var_Form := Tform_visitas_001.Create(nil);

                // ********************************************************************************* //
                // ** Puede que sea llamado desde otro modulo                                     ** //
                // ********************************************************************************* //
                if Trim(public_llamado_desde) <> '' then
                begin
                    if Trim(public_llamado_desde) = 'form_visitas_por_cliente_000' then
                    begin
                        FieldByName('id_clientes').AsString    := public_llamado_desde_id;
                        var_Form.Edit_Descripcion_Cliente.Text := public_llamado_desde_Descripcion;
                        var_Form.No_Tocar_Cliente;
                    end;

                    if Trim(public_llamado_desde) = 'form_visitas_por_representante_000' then
                    begin
                        FieldByName('id_representantes').AsString    := public_llamado_desde_id;
                        var_Form.Edit_Descripcion_Representante.Text := public_llamado_desde_Descripcion;
                        var_Form.No_Tocar_Representante;
                    end;
                end;

                var_Form.ShowModal;
                if var_Form.public_Pulso_Aceptar = true then
                    begin
                        FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
                        FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                        UTI_RGTRO_Grabar_Antes( 'visitas',
                                                SQLQuery_Visitas );
                    end
                else Cancel;

                var_Form.Free;
            end;
        end;

        var_msg.Free;
    end;
end;

procedure Tform_visitas_000.Seleccionado_Rgtro;
begin
    private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    public_Rgtro_Seleccionado := true;
    Close;
end;

procedure Tform_visitas_000.Presentar_Datos;
begin
     /// guardar por lo que pueda pasar
end;

procedure Tform_visitas_000.SQLQuery_VisitasAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'visitas',
                       DataModule_visitas.SQLTransaction,
                       SQLQuery_Visitas,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros;
end;

procedure Tform_visitas_000.SQLQuery_VisitasAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure Tform_visitas_000.SQLQuery_VisitasBeforePost(DataSet: TDataSet);
begin
     UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Visitas );
end;

procedure Tform_visitas_000.SQLQuery_VisitasBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Visitas );
end;

procedure Tform_visitas_000.Editar_Registro;
var var_msg  : TStrings;
    var_Form : Tform_visitas_001;
    var_id   : ShortString;
begin
    with SQLQuery_Visitas do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
        begin
            var_id := FieldByName('id').AsString;

            if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
            begin
                if UTI_RGTRO_isLock( 'visitas',
                                     FieldByName('id').AsString,
                                     true ) = true then
                begin
                    Exit;
                end else begin
                    if UTI_RGTRO_Lock( 'visitas',
                                       FieldByName('id').AsString ) = true then
                         Edit
                    else Exit;
                end;

                var_Form := Tform_visitas_001.Create(nil);

                var_Form.public_Menu_Worked := public_Menu_Worked;

                if public_Solo_Ver = true then
                begin
                    var_Form.public_Solo_Ver := true;
                end;

                var_Form.para_Empezar;

                var_Form.ShowModal;
                if var_Form.public_Pulso_Aceptar = true then
                begin
                    if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( SQLQuery_Visitas ) = true then
                    begin
                        FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                        FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                        UTI_RGTRO_Grabar_Antes( 'visitas',
                                                SQLQuery_Visitas );
                    end else begin
                        Cancel;
                    end;
                end else begin
                    Cancel;
                end;

                var_Form.Free;

                UTI_RGTRO_UnLock( 'visitas',
                                  var_id );
            end;
        end else begin
            var_msg.Add(rs_no_Hay_Rgtros);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        end;
    end;
    var_msg.Free;
end;

procedure Tform_visitas_000.Boton_Elegir_ClienteClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Clientes( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Cliente.Text          := Trim(var_Registro.id_1);
        Edit_Descripcion_Cliente.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_visitas_000.Edit_Descripcion_ClienteClick(Sender: TObject);
begin
    Edit_id_Cliente.Text          := '';
    Edit_Descripcion_Cliente.Text := '';
end;

procedure Tform_visitas_000.Boton_Elegir_Visita_TipoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_VisitasTipos( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Visita_Tipo.Text          := Trim(var_Registro.id_1);
        Edit_Descripcion_Visita_Tipo.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_visitas_000.Edit_Descripcion_ActividadClick(Sender: TObject);
begin
    Edit_id_Actividad.Text          := '';
    Edit_Descripcion_Actividad.Text := '';
end;

procedure Tform_visitas_000.Edit_Descripcion_Visita_TipoClick(Sender: TObject);
begin
    Edit_id_Visita_Tipo.Text          := '';
    Edit_Descripcion_Visita_Tipo.Text := '';
end;

procedure Tform_visitas_000.Boton_Elegir_Visita_ResultadoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_VisitasResultados( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Visita_Resultado.Text          := Trim(var_Registro.id_1);
        Edit_Descripcion_Visita_Resultado.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_visitas_000.Edit_Descripcion_Visita_ResultadoClick(Sender: TObject);
begin
    Edit_id_Visita_Resultado.Text          := '';
    Edit_Descripcion_Visita_Resultado.Text := '';
end;

procedure Tform_visitas_000.Boton_Elegir_RepresentanteClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Representantes( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_representantes.Text         := Trim(var_Registro.id_1);
        Edit_Descripcion_Representante.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_visitas_000.Edit_Descripcion_RepresentanteClick(Sender: TObject);
begin
    Edit_id_representantes.Text         := '';
    Edit_Descripcion_Representante.Text := '';
end;

procedure Tform_visitas_000.Edit_Descripcion_RutaClick(Sender: TObject);
begin
    Edit_id_Ruta.Text          := '';
    Edit_Descripcion_Ruta.Text := '';
end;

procedure Tform_visitas_000.Edit_Descripcion_Tipo_ClienteClick(Sender: TObject);
begin
    Edit_id_Tipo_Cliente.Text          := '';
    Edit_Descripcion_Tipo_Cliente.Text := '';
end;

procedure Tform_visitas_000.Refrescar_Registros;
var var_Fecha_Visita : TDateTime;
    var_id_clientes  : Int64;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_id_clientes  := 0;

    if SQLQuery_Visitas.RecordCount > 0 then
    begin
        var_Fecha_Visita := SQLQuery_Visitas.FieldByName('Fecha_Visita').Value;
        var_id_clientes  := SQLQuery_Visitas.FieldByName('id_clientes').Value;
    end;

    Filtrar_Principal_Sin_Preguntar;

    if var_id_clientes <> 0 then
    begin
        SQLQuery_Visitas.Locate( 'Fecha_Visita;id_clientes',
                                 VarArrayOf( [ var_Fecha_Visita, var_id_clientes ] ),
                                 [] );
    end;
end;

procedure Tform_visitas_000.Boton_Elegir_RutaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Rutas( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Ruta.Text          := Trim(var_Registro.id_1);
        Edit_Descripcion_Ruta.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_visitas_000.Boton_Elegir_ActividadClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Actividades( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Actividad.Text          := Trim(var_Registro.id_1);
        Edit_Descripcion_Actividad.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_visitas_000.Boton_Elegir_Tipo_ClienteClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Clientes_tipos( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Tipo_Cliente.Text          := Trim(var_Registro.id_1);
        Edit_Descripcion_Tipo_Cliente.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_visitas_000.Boton_Elegir_ProvinciaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Provincias( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Provincia.Text          := Trim(var_Registro.id_1);
        Edit_Descripcion_Provincia.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_visitas_000.Edit_Descripcion_ProvinciaClick(Sender: TObject);
begin
    Edit_id_Provincia.Text          := '';
    Edit_Descripcion_Provincia.Text := '';
end;

procedure Tform_visitas_000.BitBtn_FiltrarClick(Sender: TObject);
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
    if PageControl_Filtros.ActivePage = TabSheet_Busqueda_Concreta then
    begin
        Filtrar_Principal_Sin_Preguntar;
    end else begin
        Filtrar_Principal( 'S', true );
        Filtrar_Principal( 'N', true );
        Filtrar_Principal( 'PTO_N', false );
        Filtrar_Principal( 'PTO_S', false );

        RadioGroup_Bajas.ItemIndex := Filtrar_Principal( '', true );
    end;
end;

function Tform_visitas_000.Filtrar_Principal( param_con_Pedido_SN : ShortString;
                                              param_Cambiamos_Filtro : Boolean ) : ShortInt;
var
  var_a_Filtrar : TStrings;
  var_SQL_ADD   : TStrings;
begin
    var_SQL_ADD   := TStringList.Create;
    var_a_Filtrar := TStringList.Create;
    var_a_Filtrar.Clear;

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
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la id del registro                                                 ** //
    // ********************************************************************************************* //
    if Trim(Edit_id.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'vis.id = ' + Trim(Edit_id.Text) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por EL CLIENTE                                                         ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Cliente.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'vis.id_clientes = ' + Trim(Edit_id_Cliente.Text) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
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
                        var_a_Filtrar,
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
                        var_a_Filtrar,
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
                        var_a_Filtrar,
                        var_SQL_ADD );

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'vis.Fecha_Visita >= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Visitado_Desde.Date, false) + ' 00:00:00' ) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
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
                        var_a_Filtrar,
                        var_SQL_ADD );

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'vis.Fecha_Visita_Proxima >= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Proxima_Visita_Desde.Date, false) + ' 00:00:00' ) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
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
                        var_a_Filtrar,
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
                        var_a_Filtrar,
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
                        var_a_Filtrar,
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
                        var_a_Filtrar,
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
                        var_a_Filtrar,
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
                            var_a_Filtrar,
                            var_SQL_ADD );
        end else begin
            if Trim(UpperCase(param_con_Pedido_SN)) = 'PTO_S' then
            begin
                var_SQL_ADD.Clear;
                var_SQL_ADD.Add( 'vis.Presupuesto_Realizado_SN = ' + UTI_GEN_Comillas('S') );
                UTI_TB_SQL_ADD( false,
                                var_a_Filtrar,
                                var_SQL_ADD );
            end;

            if Trim(UpperCase(param_con_Pedido_SN)) = 'PTO_N' then
            begin
                var_SQL_ADD.Clear;
                var_SQL_ADD.Add( 'vis.Presupuesto_Realizado_SN = ' + UTI_GEN_Comillas('N') );
                UTI_TB_SQL_ADD( false,
                                var_a_Filtrar,
                                var_SQL_ADD );
            end;
        end;
    end;

    { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
      y que por lo se debe de permitir modificarlos en ningún módulo }

    Result := UTI_TB_Filtrar( private_Order_By,

                              // Delete_SQL,
                              '',

                              // Update_SQL,
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Visitas,
                                                            'visitas',
                                                            'u' ),

                              // Insert_SQL,
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Visitas,
                                                            'visitas',
                                                            'i' ),

                              // var_ctdad_Rgtros,
                              -1,

                              DataModule_visitas.SQLTransaction,
                              DataModule_visitas.SQLConnector,
                              SQLQuery_Visitas,

                              // name_tabla,
                              'vis',

                              RadioGroup_Bajas.ItemIndex,

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

                              Memo_Filtros.Lines,
                              Memo_OrderBy.Lines,
                              var_a_Filtrar,

                              param_Cambiamos_Filtro,
                              false,   // param_ver_SQL_despues_Abrir : Boolean;
                              true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

    var_a_Filtrar.Free;

    if Trim(param_con_Pedido_SN) = ''  then
    begin
         Label_Ctdad_Rgtros.Caption     := IntToStr(SQLQuery_Visitas.RecordCount);
    end;

    if Trim(UpperCase(param_con_Pedido_SN)) = 'N' then
    begin
         Label_Ctdad_Sin_Pedido.Caption := IntToStr(SQLQuery_Visitas.RecordCount);
    end;

    if Trim(UpperCase(param_con_Pedido_SN)) = 'S' then
    begin
        Label_Ctdad_Con_Pedido.Caption := IntToStr(SQLQuery_Visitas.RecordCount);
    end;

    if Trim(UpperCase(param_con_Pedido_SN)) = 'PTO_N' then
    begin
         Label_Ctdad_Sin_Pto.Caption := IntToStr(SQLQuery_Visitas.RecordCount);
    end;

    if Trim(UpperCase(param_con_Pedido_SN)) = 'PTO_S' then
    begin
        Label_Ctdad_Con_Pto.Caption := IntToStr(SQLQuery_Visitas.RecordCount);
    end;

    //Filtrar_tablas_ligadas;
    var_SQL_ADD.Free;
end;

function Tform_visitas_000.Insertar_Planificacion_Visitas( param_nombre_campo,
                                                           param_id : ShortString ) : ShortString;
var var_msg  : TStrings;
    var_Form : Tform_visitas_001;
begin
    with SQLQuery_Visitas do
    begin
        var_msg := TStringList.Create;

        if UTI_USR_Permiso_SN(public_Menu_Worked, 'A', True) = True then
        begin
            if public_Solo_Ver = True then
            begin
                var_msg.Add(rs_Solo_Visualizar);
                UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            end else begin
                Insert ;

                FieldByName('Pedido_Realizado_SN').Value      := 'N';
                FieldByName('Presupuesto_Realizado_SN').Value := 'N';

                var_Form := Tform_visitas_001.Create(nil);

                var_Form.public_planificacion := true;
                var_Form.No_Tocar_Por_Planificacion;


                var_Form.para_Empezar;

                var_Form.ShowModal;
                if var_Form.public_Pulso_Aceptar = true then
                    begin
                        FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
                        FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                        { UTI_RGTRO_Grabar_Antes( 'visitas',
                                                   SQLQuery_Visitas ); }

                        Insertar_Planificacion( param_nombre_campo,
                                                param_id );
                        Result := DateToStr(Int(SQLQuery_Visitas.FieldByName('Fecha_Visita').Value));
                    end
                else
                    begin
                        Result := '';
                        Cancel;
                    end;

                var_Form.Free;
            end;
        end;

        var_msg.Free;
    end;
end;

procedure Tform_visitas_000.Insertar_Planificacion( param_nombre_campo,
                                                    param_id : ShortString );
var var_msg            : TStrings;
    var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
    with SQLQuery_Visitas do
    begin
        Try
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

            var_SQL.Add( 'INSERT INTO visitas' );
            var_SQL.Add(        '( Fecha_Visita,' );
            var_SQL.Add(          'id_clientes,' );
            var_SQL.Add(          'id_representantes,' );

            if Trim(FieldByName('id_visitas_tipos').AsString) <> '' then
            begin
                var_SQL.Add( 'id_visitas_tipos,' );
            end;

            if Trim(FieldByName('Comentario').AsString) <> '' then
            begin
                var_SQL.Add( 'Comentario,' );
            end;

            var_SQL.Add(          'Insert_WHEN,' );
            var_SQL.Add(          'Insert_Id_User )' );

            var_SQL.Add( 'SELECT ' + UTI_GEN_Comillas(UTI_GEN_Format_Fecha_Hora(FieldByName('Fecha_Visita').Value, True)) + ',' );
            var_SQL.Add(            'id,' );
            var_SQL.Add(            FieldByName('id_representantes').AsString + ',' );

            if Trim(FieldByName('id_visitas_tipos').AsString) <> '' then
            begin
                var_SQL.Add( FieldByName('id_visitas_tipos').AsString + ',' );
            end;

            if Trim(FieldByName('Comentario').AsString) <> '' then
            begin
                var_SQL.Add( UTI_GEN_Comillas(Trim(FieldByName('Comentario').AsString)) + ',' );
            end;

            var_SQL.Add(         UTI_GEN_Comillas(UTI_GEN_Format_Fecha_Hora(FieldByName('Insert_WHEN').Value, True)) + ',' );
            var_SQL.Add(         Trim(FieldByName('Insert_Id_User').AsString) );

            var_SQL.Add(   'FROM clientes' );
            var_SQL.Add(  'WHERE Del_WHEN IS NULL' );
            var_SQL.Add(    'AND ' + Trim(param_nombre_campo) + ' = ' + Trim(param_id) );

            // ***************************************************************************************** //
            // ** Ejecutamos la SQL                                                                   ** //
            // ***************************************************************************************** //
            var_SQLQuery          := TSQLQuery.Create(nil);

            var_SQLQuery.Database := var_SQLConnector;
            var_SQLQuery.SQL.Text := var_SQL.Text;

            var_SQLQuery.Name     := 'SQLQuery_Insertar_Planificacion';

          { var_msg := TStringList.Create;
            var_msg.Add(var_SQLQuery.SQL.Text);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free; }

            var_SQLQuery.ExecSQL;
            var_SQLTransaction.Commit;


          { ****************************************************************************
            Destruimos la tabla y conexiones
            **************************************************************************** }
            var_SQLQuery.Free;
            var_SQL.Free;

          { ****************************************************************************
            Cerramos La transacción y la conexión con la BD
            **************************************************************************** }
            if UTI_CN_Connector_Close( var_SQLTransaction,
                                       var_SQLConnector ) = False then UTI_GEN_Salir;

            var_SQLTransaction.Free;
            var_SQLConnector.Free;
        Except
            on error : Exception do
            begin
                UTI_GEN_Error_Log( 'Error al CREAR la planificación de visitas.',
                                   error );
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

procedure Tform_visitas_000.BitBtn_ver_PresupuestosClick(Sender: TObject);
begin
    UTI_Abrir_Modulo_PresupuestosVentas( true, false, '1' );
end;

procedure Tform_visitas_000.ComboBox_FiltrosChange(Sender: TObject);
begin
    Memo_OrderBy.Lines.Clear;
    Memo_OrderBy.Lines.Add( private_Order_By[ComboBox_Filtros.ItemIndex].Memo_OrderBy );
    BitBtn_FiltrarClick(Nil);
end;

procedure Tform_visitas_000.BitBtn_ver_PedidosClick(Sender: TObject);
begin
    UTI_Abrir_Modulo_PedidosVentas( true, false, '1' );
end;

end.


