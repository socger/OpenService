unit plantilla_000;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, Buttons,
  ComCtrls, DBGrids, DbCtrls, types, sqldb, db, Grids, ButtonPanel, ExtDlgs, utilidades_datos_tablas,
  variants, utilidades_general, utilidades_rgtro, utilidades_usuarios, utilidades_forms_Filtrar,
  utilidades_bd, utilidades_ini;

type

  { Tform_plantilla_000 }

  Tform_plantilla_000 = class(TForm)
    BitBtn_Vaciar_Filtros: TBitBtn;
    BitBtn_Filtrar: TBitBtn;
    BitBtn_Filtrar1: TBitBtn;
    BitBtn_Filtros_Abrir: TBitBtn;
    BitBtn_Filtros_Cerrar: TBitBtn;
    BitBtn_Imprimir: TBitBtn;
    BitBtn_SALIR: TBitBtn;
    BitBtn_Seleccionar: TBitBtn;
    BitBtn_Ver_Situacion_Registro: TBitBtn;
    ButtonPanel1: TButtonPanel;
    CalendarDialog1: TCalendarDialog;
    ComboBox_Filtros: TComboBox;
    DataSource_Filtros: TDataSource;
    DataSource_Principal: TDataSource;
    DBEdit_Id: TDBEdit;
    DBGrid_Filtros: TDBGrid;
    DBGrid_Principal: TDBGrid;
    DBNavigatorDBGrid_Filtros: TDBNavigator;
    DBNavigatorPrincpal: TDBNavigator;
    GroupBox1: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox_Filtros: TGroupBox;
    GroupBox_Grid: TGroupBox;
    GroupBox_Registro: TGroupBox;
    Image_Boton_Busqueda: TImage;
    Image_Boton_Busqueda_NO: TImage;
    Image_Boton_Calendario: TImage;
    Label62: TLabel;
    Label_Ctdad_Rgtros: TLabel;
    Label_Fecha2: TLabel;
    Memo_Filtros: TMemo;
    Memo_OrderBy: TMemo;
    Panel1: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel_Barra_Filtros: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel_Barra_DBGrid_Filtros: TPanel;
    Panel_Barra_Superior1: TPanel;
    Panel_de_Abajo: TPanel;
    Panel2: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel_Barra_Superior: TPanel;
    Panel_Filtramos_por: TPanel;
    Panel_Otros_Campos_no_Grid: TPanel;
    RadioGroup_Bajas: TRadioGroup;
    Shape1: TShape;
    SQLConnector_Principal: TSQLConnector;
    SQLQuery_Filtros: TSQLQuery;
    SQLQuery_FiltrosChange_Id_User: TLargeintField;
    SQLQuery_FiltrosChange_WHEN: TDateTimeField;
    SQLQuery_FiltrosDel_Id_User: TLargeintField;
    SQLQuery_FiltrosDel_WHEN: TDateTimeField;
    SQLQuery_FiltrosDel_WHY: TStringField;
    SQLQuery_FiltrosDescripcion: TStringField;
    SQLQuery_FiltrosDesde_Valor: TStringField;
    SQLQuery_FiltrosDesde_Valor_parte_de_SQL_antes: TStringField;
    SQLQuery_FiltrosDesde_Valor_parte_de_SQL_despues: TStringField;
    SQLQuery_FiltrosDesde_Valor_pedir_SN: TStringField;
    SQLQuery_FiltrosHasta_Valor: TStringField;
    SQLQuery_FiltrosHasta_Valor_parte_de_SQL_antes: TStringField;
    SQLQuery_FiltrosHasta_Valor_parte_de_SQL_despues: TStringField;
    SQLQuery_FiltrosHasta_Valor_pedir_SN: TStringField;
    SQLQuery_Filtrosid: TLargeintField;
    SQLQuery_Filtrosid_menus: TLargeintField;
    SQLQuery_FiltrosInsert_Id_User: TLargeintField;
    SQLQuery_FiltrosInsert_WHEN: TDateTimeField;
    SQLQuery_Filtrosnombre_campo: TStringField;
    SQLQuery_Filtrosorden: TLargeintField;
    SQLQuery_Filtrosparte_de_SQL_tipoDato: TStringField;
    SQLQuery_Principal: TSQLQuery;
    SQLQuery_Principalid: TLargeintField;
    SQLTransaction_Principal: TSQLTransaction;

    procedure BitBtn_Filtrar1Click(Sender: TObject);
    procedure BitBtn_FiltrarExecute(Sender: TObject);
    procedure BitBtn_Vaciar_FiltrosClick(Sender: TObject);
    procedure BitBtn_FiltrarClick(Sender: TObject);
    procedure BitBtn_Filtros_CerrarClick(Sender: TObject);
    procedure BitBtn_Filtros_AbrirClick(Sender: TObject);
    procedure BitBtn_ImprimirClick(Sender: TObject);
    procedure BitBtn_SALIRClick(Sender: TObject);
    procedure BitBtn_SeleccionarClick(Sender: TObject);
    procedure BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure ComboBox_FiltrosChange(Sender: TObject);
    procedure DBGrid_FiltrosCellClick(Column: TColumn);
    procedure DBGrid_FiltrosColEnter(Sender: TObject);
    procedure DBGrid_FiltrosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_FiltrosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid_FiltrosKeyPress(Sender: TObject; var Key: char);
    procedure DBGrid_PrincipalCellClick(Column: TColumn);
    procedure DBGrid_PrincipalDblClick(Sender: TObject);
    procedure DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBNavigatorDBGrid_FiltrosBeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure DBNavigatorPrincpalBeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure RadioGroup_BajasClick(Sender: TObject);
    procedure SQLQuery_FiltrosAfterEdit(DataSet: TDataSet);
    procedure SQLQuery_FiltrosAfterPost(DataSet: TDataSet);
    procedure SQLQuery_FiltrosBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_FiltrosBeforePost(DataSet: TDataSet);
    procedure SQLQuery_FiltrosNewRecord(DataSet: TDataSet);
    procedure SQLQuery_PrincipalAfterPost(DataSet: TDataSet);
    procedure SQLQuery_PrincipalAfterScroll(DataSet: TDataSet);
    procedure SQLQuery_PrincipalBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_PrincipalBeforePost(DataSet: TDataSet);

    procedure Cambiar_Nombre_Tabla_Principal; virtual;
    procedure Cambiar_Titulo_Form; virtual;
    procedure Configurar_los_Grids; virtual;
    procedure Abrir_Conexiones_con_BD_TablasAdicionales; virtual;
    procedure Filtrar_tablas_adicionales( var p_Lineas_Filtro : TStrings; var p_Lineas_OrderBy : TStrings ); virtual;

    procedure Campo_Foco_en_modo_Edicion_Inserccion; virtual;
    procedure NewRecord_Insert_SQLQuery_Principal; virtual;
    procedure Antes_del_Post_Principal_Sin_Rellenar_Permitido_SI( p_msg : TStrings ); virtual;
    procedure Antes_del_Post_Principal_Sin_Rellenar_Permitido_NO( p_msg, p_msg_Comprobar : TStrings ); virtual;
    procedure Antes_del_Post_Principal_Asignar_Valores; virtual;
    procedure Rellenar_Filtros_Impresion(var p_Ordenado_por : String); virtual;
    procedure Crear_tipos_orden_Principal; virtual;
    procedure Crear_OrderBy_tablas_adicionales; virtual;
    procedure Refrescar_Registros; virtual;
    procedure SQLQuery_PrincipalNewRecord(DataSet: TDataSet);
    procedure Filtrar_Principal_queFiltro( var p_errores_Filtros : TStrings; var p_Registro_CRUD : TRegistro_CRUD; var p_ctdad_Rgtros : Integer; var p_a_Filtrar : TStrings ); virtual;
    procedure Presentar_Datos; virtual;
    procedure Presentar_Datos_GroupBox_Registro; virtual;
    procedure para_Empezar_GroupBox_Registro; virtual;
    procedure Cambiar_WindowState; virtual;
    procedure Cerramos_Tablas_Ligadas; virtual;
    procedure Refrescar_Registros_TablasLigadas; virtual;
    procedure Dibujar_Grid_Principal( p_Sender: TObject; const p_Rect: TRect; p_DataCol: Integer; p_Column: TColumn; p_State: TGridDrawState ); virtual;
    function  Fue_Utilizado_Rgtro_SQLQuery_Principal : ShortInt; virtual;

  private
    { private declarations }
    private_Salir_OK         : Boolean;
    private_Order_By_Filtros : array of TOrder_By;

    procedure Que_Hacemos_Si_DobleClick_o_Enter_enFiltros;
    procedure Que_Hacemos_conReadOnly_enFiltros;

    procedure Filtrar_Principal_queFiltro_es_Numero( p_errores : TStrings; var p_Registro_CRUD : TRegistro_CRUD; var p_ctdad_Rgtros  : Integer; var p_a_Filtrar : TStrings );
    procedure Filtrar_Principal_queFiltro_es_Numero_Comprobar_Errores( p_errores : TStrings );
    procedure Filtrar_Principal_queFiltro_es_Numero_Crear_Filtro( p_SQL_ADD : TStrings; var p_Registro_CRUD : TRegistro_CRUD; var p_ctdad_Rgtros  : Integer; var p_a_Filtrar : TStrings );

    procedure Filtrar_Principal_queFiltro_es_Dia( p_errores : TStrings; var p_Registro_CRUD : TRegistro_CRUD; var p_ctdad_Rgtros : Integer; var p_a_Filtrar : TStrings );
    procedure Filtrar_Principal_queFiltro_es_Dia_Comprobar_Errores( p_errores : TStrings );
    procedure Filtrar_Principal_queFiltro_es_Dia_Crear_Filtro( p_SQL_ADD : TStrings; var p_Registro_CRUD : TRegistro_CRUD; var p_ctdad_Rgtros  : Integer; var p_a_Filtrar : TStrings );

    procedure Filtrar_Principal_queFiltro_es_Hora( p_errores : TStrings; var p_Registro_CRUD : TRegistro_CRUD; var p_ctdad_Rgtros : Integer; var p_a_Filtrar : TStrings );
    procedure Filtrar_Principal_queFiltro_es_Hora_Comprobar_Errores( p_errores : TStrings );
    procedure Filtrar_Principal_queFiltro_es_Hora_Crear_Filtro( p_SQL_ADD : TStrings; var p_Registro_CRUD : TRegistro_CRUD; var p_ctdad_Rgtros : Integer; var p_a_Filtrar : TStrings );

    procedure Filtrar_Principal_queFiltro_es_DiaHora( p_errores : TStrings; var p_Registro_CRUD : TRegistro_CRUD; var p_ctdad_Rgtros : Integer; var p_a_Filtrar : TStrings );
    procedure Filtrar_Principal_queFiltro_es_DiaHora_Comprobar_Errores( p_errores : TStrings);
    procedure Filtrar_Principal_queFiltro_es_DiaHora_Crear_Filtro( p_SQL_ADD : TStrings; var p_Registro_CRUD : TRegistro_CRUD; var p_ctdad_Rgtros  : Integer; var p_a_Filtrar : TStrings );

    procedure Filtrar_Principal_queFiltro_es_Texto( p_errores : TStrings; var p_Registro_CRUD : TRegistro_CRUD; var p_ctdad_Rgtros : Integer; var p_a_Filtrar : TStrings );
    procedure Filtrar_Principal_queFiltro_es_Texto_Comprobar_Errores( p_errores : TStrings );
    procedure Filtrar_Principal_queFiltro_es_Texto_Crear_Filtro( p_SQL_ADD : TStrings; var p_Registro_CRUD : TRegistro_CRUD; var p_ctdad_Rgtros  : Integer; var p_a_Filtrar : TStrings );

    procedure Rellenamos_Filtro_con_antes_y_despues( p_SQL_ADD : TStrings; p_que_es : Integer; p_valor : AnsiString; p_SQL_antes : AnsiString; p_SQL_despues : AnsiString );

    procedure Filtrar_Principal_queFiltro_sonIGUALES( p_SQL_ADD : TStrings; p_que_es : Integer; p_Desde_Valor : AnsiString; p_Hasta_Valor : AnsiString; p_Desde_Valor_parte_de_SQL_antes : AnsiString; p_Desde_Valor_parte_de_SQL_despues : AnsiString; p_Hasta_Valor_parte_de_SQL_antes : AnsiString; p_Hasta_Valor_parte_de_SQL_despues : AnsiString; p_nombre_campo : String; var p_Registro_CRUD : TRegistro_CRUD; var p_ctdad_Rgtros : Integer; var p_a_Filtrar : TStrings );
    procedure Filtrar_Principal_queFiltro_sonDIFERENTES( p_SQL_ADD : TStrings; p_que_es : Integer;  p_Desde_Valor : AnsiString; p_Hasta_Valor : AnsiString; p_Desde_Valor_parte_de_SQL_antes : AnsiString; p_Desde_Valor_parte_de_SQL_despues : AnsiString; p_Hasta_Valor_parte_de_SQL_antes : AnsiString; p_Hasta_Valor_parte_de_SQL_despues : AnsiString; p_nombre_campo : String; var p_Registro_CRUD : TRegistro_CRUD; var p_ctdad_Rgtros : Integer; var p_a_Filtrar : TStrings );
    procedure Filtrar_Principal_queFiltro_sinRELLENAR( p_SQL_ADD : TStrings; p_que_es : Integer;  p_Desde_Valor : AnsiString; p_Hasta_Valor : AnsiString; p_Desde_Valor_parte_de_SQL_antes : AnsiString; p_Desde_Valor_parte_de_SQL_despues : AnsiString; p_Hasta_Valor_parte_de_SQL_antes : AnsiString; p_Hasta_Valor_parte_de_SQL_despues : AnsiString; p_nombre_campo : String; var p_Registro_CRUD : TRegistro_CRUD; var p_ctdad_Rgtros : Integer; var p_a_Filtrar : TStrings );

    procedure Guardar_Filtros;
    procedure NewRecord_Insert_SQLQuery_Filtros;

    function  Filtrar_Principal( p_Cambiamos_Filtro : Boolean ) : ShortInt;
    procedure Filtrar_por_AfterScroll_SQLQuery_Principal;

    procedure Abrir_Conexiones_con_BD;
    function  Antes_del_Post_Principal : Boolean;
    function  SeCambioAlgoEnRgtro : Boolean;
    function  Hacer_Post_al_Rgtro : Boolean;
    procedure Ver_Registro;
    procedure Ver_Grid;
    procedure Hacer_Cancel_al_Rgtro;
    procedure Insertar_Registro;
    procedure Editar_Registro;
    procedure Borrar_Registro_SQLQuery_Principal;
    procedure Abrir_Panel_Filtros;
    procedure Cerrar_Panel_Filtros;
    procedure no_Tocar;
    procedure PulsoBotonFiltrar;
    procedure Cerramos_Tablas;
    procedure Seleccionado_Rgtro;
    procedure Crear_tipos_orden_Filtros;
    procedure Refrescar_Registros_Filtros;
    procedure Grabar_datos_Necesarios_Filtro;
    function  Filtrar_Filtros( p_ver_bajas : ShortInt; p_Cambiamos_Filtro : Boolean; p_Lineas_Filtro, p_Lineas_OrderBy : TStrings ) : ShortInt;
    procedure Filtros_Comprobar_que_Boton_Pintar( p_nombre_campo : String; Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState );

  public
    { public declarations }
    public_hacemos_commit_alFinalizar : String;
    public_Solo_Ver                   : Boolean;
    public_Elegimos                   : Boolean;
    public_Menu_Worked                : Integer;
    public_Rgtro_Seleccionado         : Boolean;
    public_Record_Rgtro               : TRecord_Rgtro_Comun;

    public_Order_By                   : array of TOrder_By;
    pubic_nombre_tabla_Principal      : String;

    procedure Filtrar_Principal_queFiltro_sus_Filtros( var p_errores_Filtros : TStrings; var p_Registro_CRUD : TRegistro_CRUD; var p_ctdad_Rgtros : Integer; var p_a_Filtrar : TStrings );
    procedure Filtrar_Principal_HemosFiltradoPor(var p_Ordenado_por : String);

    procedure para_Empezar;
    procedure Cambiar_Estilo_Form;
    procedure Filtrar_Principal_Sin_Preguntar;
    procedure Abrir_Conexion_con_BD( p_SQLTransaction : TSQLTransaction; p_SQLConnector : TSQLConnector );
    procedure Cerrar_Tabla( p_SQLConnector: TSQLConnector; p_SQLTransaction: TSQLTransaction; p_SQLQuery : TSQLQuery );
    procedure Comprobar_si_Cambiamos_Orden( p_Lineas_OrderBy : TStrings; p_OrderBy : String );
    function  Devolver_hacemos_commit_alFinalizar : Boolean;

  end;

var
  form_plantilla_000: Tform_plantilla_000;

implementation

{$R *.lfm}

uses menu;

{ Tform_plantilla_000 }

procedure Tform_plantilla_000.Hacer_Cancel_al_Rgtro;
begin
  with SQLQuery_Principal do
  begin
    Cancel;
  end;
end;

procedure Tform_plantilla_000.BitBtn_SALIRClick(Sender: TObject);
begin
  private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

  Close;
end;

procedure Tform_plantilla_000.ComboBox_FiltrosChange(Sender: TObject);
begin
  Memo_OrderBy.Lines.Text := public_Order_By[ComboBox_Filtros.ItemIndex].Memo_OrderBy;
  PulsoBotonFiltrar;
end;

procedure Tform_plantilla_000.Que_Hacemos_conReadOnly_enFiltros;
begin
  if DBGrid_Filtros.SelectedIndex = 1 then  // Desde_Valor
  begin
    DBGrid_Filtros.SelectedField.ReadOnly := false;
    if UpperCase(SQLQuery_FiltrosDesde_Valor_pedir_SN.asString) = UpperCase('N') then
      DBGrid_Filtros.SelectedField.ReadOnly := true;
  end;

  if DBGrid_Filtros.SelectedIndex = 3 then  // Hasta_Valor
  begin
    DBGrid_Filtros.SelectedField.ReadOnly := false;
    if UpperCase(SQLQuery_FiltrosHasta_Valor_pedir_SN.asString) = UpperCase('N') then
      DBGrid_Filtros.SelectedField.ReadOnly := true;
  end;

end;
procedure Tform_plantilla_000.Que_Hacemos_Si_DobleClick_o_Enter_enFiltros;
var
  v_nombre_campo  : String;
  v_Registro      : TRecord_Rgtro_Comun;
  v_Hemos_Llamado : Boolean;
begin
  // Por si queremos hacer algo al hacer doble click en una celda;

  if (DBGrid_Filtros.SelectedIndex = 2) or
     (DBGrid_Filtros.SelectedIndex = 4) then
  begin
    v_nombre_campo := SQLQuery_Filtros.FieldByName('nombre_campo').asString;

    if DBGrid_Filtros.SelectedIndex = 2 then
    begin
      v_Hemos_Llamado := false;

      if (UTI_RGTRO_Campo_es_DiaHora( SQLQuery_Principal.FieldByName(v_nombre_campo).DataType,
                                         SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true) or
         (UTI_RGTRO_Campo_es_Dia( SQLQuery_Principal.FieldByName(v_nombre_campo).DataType,
                                  SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true)        then
      begin
        v_Hemos_Llamado := true;
        if CalendarDialog1.Execute then
        begin
          if SQLQuery_Filtros.State <> dsEdit then
            SQLQuery_Filtros.Edit;

          SQLQuery_FiltrosDesde_Valor.asString := DateToStr(CalendarDialog1.Date);
        end;
      end;

      if (UTI_RGTRO_Campo_es_Numero( SQLQuery_Principal.FieldByName(v_nombre_campo).DataType,
                                     SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true) and
         (UpperCase(Copy(v_nombre_campo, 1, 3)) = 'ID_')                                                      then
      begin
        v_Hemos_Llamado := true;
        v_Registro      := UTI_Abrir_Form( true, true, v_nombre_campo );

        if v_Registro.id_1 <> '' then
        begin
          if SQLQuery_Filtros.State <> dsEdit then
            SQLQuery_Filtros.Edit;

           SQLQuery_FiltrosDesde_Valor.asString := v_Registro.id_1;
        end;
      end;

      if v_Hemos_Llamado = false then
        DBGrid_Filtros.SelectedIndex := DBGrid_Filtros.SelectedIndex + 1;

    end;

    if DBGrid_Filtros.SelectedIndex = 4 then
    begin
      v_Hemos_Llamado := false;

      if (UTI_RGTRO_Campo_es_DiaHora( SQLQuery_Principal.FieldByName(v_nombre_campo).DataType,
                                      SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true) or
         (UTI_RGTRO_Campo_es_Dia( SQLQuery_Principal.FieldByName(v_nombre_campo).DataType,
                                  SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true)     then
      begin
        v_Hemos_Llamado := true;
        if CalendarDialog1.Execute then
        begin
          if SQLQuery_Filtros.State <> dsEdit then
            SQLQuery_Filtros.Edit;

          SQLQuery_FiltrosHasta_Valor.asString := DateToStr(CalendarDialog1.Date);
        end;
      end;

      if (UTI_RGTRO_Campo_es_Numero( SQLQuery_Principal.FieldByName(v_nombre_campo).DataType,
                                     SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true) and
         (UpperCase(Copy(v_nombre_campo, 1, 3)) = 'ID_')                                                      then
      begin
        v_Hemos_Llamado := true;
        v_Registro      := UTI_Abrir_Form( true, true, v_nombre_campo );

        if v_Registro.id_1 <> '' then
        begin
          if SQLQuery_Filtros.State <> dsEdit then
            SQLQuery_Filtros.Edit;

           SQLQuery_FiltrosHasta_Valor.asString := v_Registro.id_1;
        end;
      end;

      if v_Hemos_Llamado = false then
        DBGrid_Filtros.SelectedIndex := 1;

    end;
  end;

end;

procedure Tform_plantilla_000.DBGrid_FiltrosCellClick(Column: TColumn);
begin
  // Por si queremos hacer algo al hacer doble click en una celda;
  Que_Hacemos_Si_DobleClick_o_Enter_enFiltros;
  Que_Hacemos_conReadOnly_enFiltros;
end;

procedure Tform_plantilla_000.DBGrid_FiltrosColEnter(Sender: TObject);
var
  v_nombre_campo    : String;
  v_es_Hora_o_Fecha : Boolean;
  v_aceptada        : Boolean;

begin
{
  s := DBGrid_Filtros.DataSource.DataSet.FieldByName('ID').AsString;
  s := DBGrid_Filtros.SelectedField.AsString;  // for field value
  s := DBGrid_Filtros.SelectedField.FieldName;  // for fiels name
  DBGrid_Filtros.SelectedIndex // Número de columna elegida
  DBGrid_Filtros.DataSource.DataSet.RecNo; //row

  if DBGrid_Filtros.SelectedIndex = 2 {Hasta} then
  begin
    if SQLQuery_FiltrosHasta_Valor.isNull then
    begin
      if not SQLQuery_FiltrosDesde_Valor.IsNull then
      begin
        SQLQuery_FiltrosHasta_Valor.asString := SQLQuery_FiltrosDesde_Valor.asString;
      end;
    end;
  end;
}

  v_nombre_campo := SQLQuery_Filtros.FieldByName('nombre_campo').asString;

  // DBGrid_Filtros.SelectedField.Size:=; Se podría completar si nos interesara

  if DBGrid_Filtros.SelectedIndex = 0 then
    DBGrid_Filtros.SelectedIndex := DBGrid_Filtros.SelectedIndex + 1;

  if (DBGrid_Filtros.SelectedIndex = 1) or    // Desde_Valor
     (DBGrid_Filtros.SelectedIndex = 3) then  // Hasta_Valor
  begin
    v_es_Hora_o_Fecha := false;

    if UTI_RGTRO_Campo_es_Hora( SQLQuery_Principal.FieldByName(v_nombre_campo).DataType,
                                SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true then
    begin
      v_es_Hora_o_Fecha := true;
      if DBGrid_Filtros.SelectedIndex = 1 then
        SQLQuery_FiltrosDesde_Valor.EditMask := '00:00:00';

      if DBGrid_Filtros.SelectedIndex = 3 then
        SQLQuery_FiltrosHasta_Valor.EditMask := '00:00:00';
    end;

    if (UTI_RGTRO_Campo_es_DiaHora( SQLQuery_Principal.FieldByName(v_nombre_campo).DataType,
                                    SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true) or
       (UTI_RGTRO_Campo_es_Dia( SQLQuery_Principal.FieldByName(v_nombre_campo).DataType,
                                SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true)     then
    begin
      v_es_Hora_o_Fecha := true;
      if DBGrid_Filtros.SelectedIndex = 1 then
        SQLQuery_FiltrosDesde_Valor.EditMask := '00/00/0000';

      if DBGrid_Filtros.SelectedIndex = 3 then
        SQLQuery_FiltrosHasta_Valor.EditMask := '00/00/0000';
    end;

    if UTI_RGTRO_Campo_es_Dia( SQLQuery_Principal.FieldByName(v_nombre_campo).DataType,
                               SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true then
    begin
      v_es_Hora_o_Fecha := true;
      if DBGrid_Filtros.SelectedIndex = 1 then
        SQLQuery_FiltrosDesde_Valor.EditMask := '00/00/0000';

      if DBGrid_Filtros.SelectedIndex = 3 then
        SQLQuery_FiltrosHasta_Valor.EditMask := '00/00/0000';
    end;

    if v_es_Hora_o_Fecha = false then
    begin
      if DBGrid_Filtros.SelectedIndex = 1 then
        SQLQuery_FiltrosDesde_Valor.EditMask := '';

      if DBGrid_Filtros.SelectedIndex = 3 then
        SQLQuery_FiltrosHasta_Valor.EditMask := '';
    end;

  end;

  if DBGrid_Filtros.SelectedIndex = 3 then // Antes era así ... if DBGrid_Filtros.SelectedField.FieldName = 'Hasta_Valor' then
  begin
    if SQLQuery_FiltrosHasta_Valor.isNull then
    begin
      if not SQLQuery_FiltrosDesde_Valor.IsNull then
      begin
        if SQLQuery_Filtros.State <> dsEdit then
          SQLQuery_Filtros.Edit;

        SQLQuery_FiltrosHasta_Valor.asString := SQLQuery_FiltrosDesde_Valor.asString;
      end;
    end;
  end;

  if (DBGrid_Filtros.SelectedIndex = 2) or
     (DBGrid_Filtros.SelectedIndex = 4) then
  begin
    v_aceptada := false;

    if (UTI_RGTRO_Campo_es_DiaHora( SQLQuery_Principal.FieldByName(v_nombre_campo).DataType,
                                    SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true) or
       (UTI_RGTRO_Campo_es_Dia( SQLQuery_Principal.FieldByName(v_nombre_campo).DataType,
                                SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true)     then
    begin
      v_aceptada := true;
    end;

    if (UTI_RGTRO_Campo_es_Numero( SQLQuery_Principal.FieldByName(v_nombre_campo).DataType,
                                   SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true) and
       (UpperCase(Copy(v_nombre_campo, 1, 3)) = 'ID_')                                                      then
    begin
      v_aceptada := true;
    end;

    if v_aceptada = false then
    begin
      if DBGrid_Filtros.SelectedIndex = 4 then
        DBGrid_Filtros.SelectedIndex := 1
      else
        DBGrid_Filtros.SelectedIndex := DBGrid_Filtros.SelectedIndex + 1;
    end;

  end;

end;

procedure Tform_plantilla_000.no_Tocar;
begin
  BitBtn_Imprimir.Enabled := False;
end;

procedure Tform_plantilla_000.FormActivate(Sender: TObject);
begin
  Cambiar_Estilo_Form;

  If public_Elegimos = true then
  begin
    BitBtn_Seleccionar.Visible := true;
    BitBtn_Imprimir.Visible    := false;

    with Self do
    begin
      Color := $00B9959C;
    end;
  end;

  if public_Solo_Ver = true then
  begin
    no_Tocar;
  end;

end;

procedure Tform_plantilla_000.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  if private_Salir_OK = False then
  begin
    // ********************************************************************************************* //
    // ** Intento BitBtn_SALIR de la aplicación de un modo no permitido.                          ** //
    // ********************************************************************************************* //
    // ** Pero si desde el menu principal está a true la variable public_Salir_Ok, significa que  ** //
    // ** hay que salir si o si pues se pulsó cancelar al preguntar otra vez por la contraseña    ** //
    // ********************************************************************************************* //
     if form_Menu.public_Salir_OK = False then
     begin
       CloseAction := TCloseAction.caNone;
     end;
  end else begin
    // ********************************************************************************************* //
    // ** Fue correcto el modo como quiere BitBtn_SALIR de la aplicación                          ** //
    // ********************************************************************************************* //
  end;
end;

procedure Tform_plantilla_000.Cambiar_Estilo_Form;
var
  v_i    : Integer;
  v_Skin : Trecord_Skin;
begin
  with Self do
  begin
    Color       := $00C2C29E;
    Position    := poScreenCenter;
    BorderIcons := [];
    BorderStyle := bsSingle;
  end;

  Cambiar_WindowState;

  v_Skin := UTI_INI_Configuracion_Skin;

  for v_i := 0 to (ComponentCount - 1) do
  begin
    if (Components[v_i] is TDBGrid) then
    begin
      if TDBGrid(Components[v_i]).Name <> 'DBGrid_Filtros' then
      begin
        TDBGrid(Components[v_i]).Color          := TColor(v_Skin.DbGrid_Color);
        TDBGrid(Components[v_i]).AlternateColor := TColor(v_Skin.DbGrid_Color_AlternateColor);
      end

      else
      begin
        TDBGrid(Components[v_i]).Color          := TColor(v_Skin.DbGrid_Filtros_Color);
        TDBGrid(Components[v_i]).AlternateColor := TColor(v_Skin.DbGrid_Filtros_Color_AlternateColor);
      end;

      jerofa hay que ver también cuando es elegido como se van a rellenar los colores de los grids
      y del fondo del form

      y los dbEdit y Edit

      También los grids de filtros ... ver sus colores


    end;

  end;

  Application.ProcessMessages;
end;

procedure Tform_plantilla_000.RadioGroup_BajasClick(Sender: TObject);
begin
{ se quita porque da problemas con el nuevo modo de filtrar ... lo hace dos veces
if GroupBox_Grid.Visible then
       Refrescar_Registros
  else Refrescar_Registros_TablasLigadas;
}
end;

procedure Tform_plantilla_000.SQLQuery_FiltrosAfterEdit(DataSet: TDataSet);
begin
  Grabar_datos_Necesarios_Filtro;
end;

procedure Tform_plantilla_000.SQLQuery_FiltrosBeforeEdit(DataSet: TDataSet);
begin
//  UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Filtros );
end;

procedure Tform_plantilla_000.SQLQuery_FiltrosBeforePost(DataSet: TDataSet);
begin
//   UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Filtros );
end;

procedure Tform_plantilla_000.SQLQuery_FiltrosNewRecord(DataSet: TDataSet);
begin
//   Grabar_datos_Necesarios_Filtro;
end;

procedure Tform_plantilla_000.Grabar_datos_Necesarios_Filtro;
begin
  SQLQuery_Filtrosid_menus.Value := public_Menu_Worked;
end;

procedure Tform_plantilla_000.Abrir_Panel_Filtros;
begin
  Guardar_Filtros;

  //  x_DBGrid_Filtros.Options := [dgTitles,dgIndicator,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgDisableDelete,dgDisableInsert, dgEditing];
  BitBtn_Filtros_Abrir.Visible  := false;
  BitBtn_Filtros_Cerrar.Visible := true;

  GroupBox_Grid.Enabled         := false;
  GroupBox_Filtros.Align        := alRight;
  GroupBox_Filtros.Visible      := true;
end;

procedure Tform_plantilla_000.Cerrar_Panel_Filtros;
begin
  Guardar_Filtros;

  BitBtn_Filtros_Abrir.Visible  := true;
  BitBtn_Filtros_Cerrar.Visible := false;

  GroupBox_Filtros.Visible      := false;
  GroupBox_Grid.Enabled         := true;
end;

procedure Tform_plantilla_000.BitBtn_Filtros_AbrirClick(Sender: TObject);
begin
  Abrir_Panel_Filtros;

  if DBGrid_Filtros.CanFocus then
  begin
    DBGrid_Filtros.SetFocus;
    DBGrid_Filtros.SelectedIndex := 1;
  end;
end;

procedure Tform_plantilla_000.BitBtn_Filtros_CerrarClick(Sender: TObject);
begin
  Cerrar_Panel_Filtros;

  if DBGrid_Principal.canFocus then
    DBGrid_Principal.SetFocus;
end;

procedure Tform_plantilla_000.BitBtn_FiltrarClick(Sender: TObject);
begin
  PulsoBotonFiltrar;
end;

procedure Tform_plantilla_000.BitBtn_Filtrar1Click(Sender: TObject);
begin
  RadioGroup_Bajas.ItemIndex := Filtrar_Principal( true );
end;

procedure Tform_plantilla_000.BitBtn_FiltrarExecute(Sender: TObject);
begin

end;

procedure Tform_plantilla_000.BitBtn_Vaciar_FiltrosClick(Sender: TObject);
begin
  with SQLQuery_Filtros do
  begin
    First;

    While not Eof do
    begin
      Edit;
        DBGrid_Filtros.SelectedIndex := 1;
        DBGrid_Filtros.SelectedField.ReadOnly := false;

        DBGrid_Filtros.SelectedIndex := 3;
        DBGrid_Filtros.SelectedField.ReadOnly := false;

        FieldByName('Desde_Valor').Clear;
        FieldByName('Hasta_Valor').Clear;
      Post;

      Next;
    end;

    First;
  end;
end;

procedure Tform_plantilla_000.FormDestroy(Sender: TObject);
begin
  Cerramos_Tablas;
end;

procedure Tform_plantilla_000.FormShow(Sender: TObject);
var
  var_msg : TStrings;
begin
  DBGrid_Principal.SetFocus;

  if Trim(public_hacemos_commit_alFinalizar) = '' then
  begin
    var_msg := TStringList.Create;
    var_msg.Clear;

    var_msg.Add( 'Para el módulo ' +
                 UTI_USR_Permiso_SN_TraerNombreModulo(public_Menu_Worked) +
                 ' que intentamos abrir, no se cuando hacer el commit' );

    UTI_GEN_Aviso( true, var_msg, rs_No_Se_Puede, true, false );
    var_msg.Free;

    Close;
  end;
end;

procedure Tform_plantilla_000.Cerrar_Tabla( p_SQLConnector: TSQLConnector;
                                            p_SQLTransaction: TSQLTransaction;
                                            p_SQLQuery : TSQLQuery );
begin
  if UTI_TB_Cerrar( p_SQLConnector,
                    p_SQLTransaction,
                    p_SQLQuery ) = false then
  begin
    UTI_GEN_Salir;
  end;
end;

procedure Tform_plantilla_000.Cerramos_Tablas;
begin
  Cerramos_Tablas_Ligadas;
  Cerrar_Tabla( SQLConnector_Principal,
                SQLTransaction_Principal,
                SQLQuery_Principal );
end;

procedure Tform_plantilla_000.DBGrid_PrincipalDblClick(Sender: TObject);
begin
  If public_Elegimos then
       Seleccionado_Rgtro
  else Editar_Registro;
end;

procedure Tform_plantilla_000.DBGrid_PrincipalDrawColumnCell( Sender: TObject;
                                                              const Rect: TRect;
                                                              DataCol: Integer;
                                                              Column: TColumn;
                                                              State: TGridDrawState );
begin
  Dibujar_Grid_Principal( Sender, Rect, DataCol, Column, State );
end;

procedure Tform_plantilla_000.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
  if Key = 13 then
  begin
    If public_Elegimos then
         Seleccionado_Rgtro
    else Editar_Registro;

    key := 12;
  end;

end;

procedure Tform_plantilla_000.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
  if (key = 40) or (key = 38) then
  begin
    // Por si queremos hacer algo si se pulsa flecha arriba o flecha abajo;
  end;
end;

procedure Tform_plantilla_000.DBGrid_PrincipalCellClick(Column: TColumn);
begin
  // Por si queremos hacer algo al pulsar una celda;
end;

procedure Tform_plantilla_000.Seleccionado_Rgtro;
begin
  private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
  public_Rgtro_Seleccionado := true;

  Close;
end;

procedure Tform_plantilla_000.SQLQuery_PrincipalAfterScroll(DataSet: TDataSet);
begin
  Filtrar_por_AfterScroll_SQLQuery_Principal;
end;

procedure Tform_plantilla_000.SQLQuery_PrincipalBeforePost(DataSet: TDataSet);
begin
  UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Principal );
end;

function Tform_plantilla_000.Devolver_hacemos_commit_alFinalizar : Boolean;
begin
  Result := false;

  if Trim(public_hacemos_commit_alFinalizar) = '1' then
  begin
    Result := true;
  end;
end;

procedure Tform_plantilla_000.SQLQuery_PrincipalAfterPost(DataSet: TDataSet);
begin
  UTI_RGTROS_Grabar( pubic_nombre_tabla_Principal,
                     SQLTransaction_Principal,
                     SQLQuery_Principal,
                     Devolver_hacemos_commit_alFinalizar );

  Refrescar_Registros;
end;

procedure Tform_plantilla_000.SQLQuery_PrincipalBeforeEdit(DataSet: TDataSet);
begin
  UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Principal );
end;

procedure Tform_plantilla_000.DBNavigatorPrincpalBeforeAction(Sender: TObject;
    Button: TDBNavButtonType);
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
      Borrar_Registro_SQLQuery_Principal;
      Abort;
    end;

    nbRefresh : begin
      Refrescar_Registros;
      Abort;
    end;

  end;
end;

procedure Tform_plantilla_000.BitBtn_SeleccionarClick(Sender: TObject);
begin
  Seleccionado_Rgtro;
end;

procedure Tform_plantilla_000.BitBtn_ImprimirClick(Sender: TObject);
var var_Ficheros     : TStrings;
    var_Ordenado_por : String;
begin
  Rellenar_Filtros_Impresion(var_Ordenado_por);

  // *********************************************************************************************** //
  // ** Configuramos la llamada al generador de informes                                          ** //
  // *********************************************************************************************** //
  var_Ficheros := TStringList.Create;

  UTI_GEN_Informes( var_Ordenado_por,
                    SQLQuery_Principal,
                    DataSource_Principal,
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

procedure Tform_plantilla_000.BitBtn_Ver_Situacion_RegistroClick( Sender: TObject);
begin
  if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
  begin
      if SQLQuery_Principal.RecordCount > 0 then
      begin
          UTI_RGTRO_Ver_Estado_Registro( pubic_nombre_tabla_Principal,
                                         SQLQuery_Principal,
                                         DataSource_Principal,
                                         DBGrid_Principal );
      end;
  end;
end;

procedure Tform_plantilla_000.Filtrar_por_AfterScroll_SQLQuery_Principal;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
begin
  if SQLQuery_Principal.RecordCount = 0 then
  begin
    Exit;
  end;

  if SQLQuery_Principal.State = dsInsert then
  begin
    Cerramos_Tablas_Ligadas;
    Exit;
  end;

  // *********************************************************************************************** //
  // ** Creamos los TStrings                                                                      ** //
  // *********************************************************************************************** //
  var_Lineas_Filtro  := TStringList.Create;
  var_Lineas_OrderBy := TStringList.Create;

  Filtrar_tablas_adicionales( var_Lineas_Filtro,
                              var_Lineas_OrderBy );

  // *********************************************************************************************** //
  // ** Continuamos vaciando los TStrings                                                         ** //
  // *********************************************************************************************** //
  var_Lineas_Filtro.Free;
  var_Lineas_OrderBy.Free;
end;

procedure Tform_plantilla_000.Filtrar_Principal_Sin_Preguntar;
begin
  RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

procedure Tform_plantilla_000.Ver_Registro;
begin
  GroupBox_Grid.Visible        := false;
  Panel_Barra_Superior.Visible := false;
  GroupBox_Registro.Visible    := true;

  Campo_Foco_en_modo_Edicion_Inserccion;
end;

procedure Tform_plantilla_000.Campo_Foco_en_modo_Edicion_Inserccion;
begin
  Self.ActiveControl := GroupBox_Registro;
end;

procedure Tform_plantilla_000.Ver_Grid;
begin
  GroupBox_Grid.Visible        := true;
  Panel_Barra_Superior.Visible := true;
  GroupBox_Registro.Visible    := false;

  DBGrid_Principal.SetFocus;
end;

procedure Tform_plantilla_000.Insertar_Registro;
var var_msg : TStrings;
begin
  with SQLQuery_Principal do
  begin
    var_msg := TStringList.Create;

    if UTI_USR_Permiso_SN(public_Menu_Worked, 'A', True) = True then
    begin
      if public_Solo_Ver = True then
      begin
        var_msg.Add(rs_Solo_Visualizar);
        UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
      end

      else
      begin
        Insert;

        Ver_Registro;

        para_Empezar_GroupBox_Registro;
      end;
    end;

    var_msg.Free;
  end;
end;

procedure Tform_plantilla_000.Editar_Registro;
var var_msg : TStrings;
    var_id  : ShortString;
begin
  with SQLQuery_Principal do
  begin
    if RecordCount > 0 then
    begin
      if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
      begin
        var_id := FieldByName('id').AsString;

        if UTI_RGTRO_isLock( pubic_nombre_tabla_Principal,
                             var_id,
                             true ) = true then
        begin
          Exit;
        end else begin
          if UTI_RGTRO_Lock( pubic_nombre_tabla_Principal,
                             var_id ) = true then
               Edit
          else Exit;
        end;

        Ver_Registro;
        para_Empezar_GroupBox_Registro;
      end;
    end else begin
      var_msg := TStringList.Create;
      var_msg.Add(rs_no_Hay_Rgtros);
      UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
      var_msg.Free;
    end;
  end;

end;

procedure Tform_plantilla_000.Rellenar_Filtros_Impresion(var p_Ordenado_por : String);
begin
  { Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo

  // *********************************************************************************************** //
  // ** Configuramos el título del listado                                                        ** //
  // *********************************************************************************************** //
  p_Ordenado_por := rs_Filtros_Otros_1 +
                    Trim(ComboBox_Filtros.Text);

  if Trim(Memo_Filtros.Lines.Text) <> '' then
  begin
      p_Ordenado_por := p_Ordenado_por +
                        rs_Filtros_Otros_2 +
                        Trim(Memo_Filtros.Lines.Text);
  end;

  Filtrar_Principal_HemosFiltradoPor(p_Ordenado_por);
  }
end;

procedure Tform_plantilla_000.Crear_OrderBy_tablas_adicionales;
begin
  { Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo

  // Tabla ligada 001
  SetLength(private_Order_By_TablaLigada001, 1);

  private_Order_By_TablaLigada001[0].Titulo       := 'Por la id del impuesto'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
  private_Order_By_TablaLigada001[0].Memo_OrderBy := 'ic.id_impuestos_al_que_pertenece ASC, ic.id_impuestos ASC';

  // Tabla ligada 002
  SetLength(private_Order_By_TablaLigada002, 1);

  private_Order_By_TablaLigada002[0].Titulo       := 'Por la id del impuesto'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
  private_Order_By_TablaLigada002[0].Memo_OrderBy := 'ic.id_impuestos_al_que_pertenece ASC, ic.id_impuestos ASC';
  }
end;

procedure Tform_plantilla_000.Crear_tipos_orden_Principal;
begin
  { Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo

  // ********************************************************************************************* //
  // ** Preparamos los diferentes tipos de orden preconfigurados                                ** //
  // ********************************************************************************************* //
  SetLength(public_Order_By, 5);

  public_Order_By[0].Titulo       := 'Por el nombre de fichero'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
  public_Order_By[0].Memo_OrderBy := 'i.nombre_fichero ASC';

  public_Order_By[1].Titulo       := 'Por el módulo + nombre de fichero';
  public_Order_By[1].Memo_OrderBy := 'i.id_menus ASC, i.nombre_fichero ASC';

  public_Order_By[2].Titulo       := 'Por la descripción'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
  public_Order_By[2].Memo_OrderBy := 'i.descripcion ASC';

  public_Order_By[3].Titulo       := 'Por el módulo + descripción';
  public_Order_By[3].Memo_OrderBy := 'i.id_menus ASC, i.descripcion ASC';

  public_Order_By[4].Titulo       := 'Por la id';
  public_Order_By[4].Memo_OrderBy := 'i.id ASC';

  Memo_OrderBy.Lines.Text          := public_Order_By[3].Memo_OrderBy;

  UTI_TB_Rellenar_ComboBox_Orden( true,
                                  ComboBox_Filtros,
                                  public_Order_By,
                                  0 );

}

end;

procedure Tform_plantilla_000.Filtrar_tablas_adicionales( var p_Lineas_Filtro : TStrings;
                                                          var p_Lineas_OrderBy : TStrings );
// var var_SQL_ADD   : TStrings;
begin

  { Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo

  var_SQL_ADD   := TStringList.Create;

  // *********************************************************************************************** //
  // ** IMPUESTOS_COMBINACIONES                                                                   ** //
  // *********************************************************************************************** //
  var_SQL_ADD.Clear;
  var_SQL_ADD.Add( 'ic.id_impuestos_al_que_pertenece = ' + SQLQuery_Principal.FieldByName('id').AsString );
  UTI_TB_SQL_ADD( true,
                  p_Lineas_Filtro,
                  var_SQL_ADD );

  p_Lineas_OrderBy.Clear;
  Filtrar_impuestos_composiciones( RadioGroup_Bajas.ItemIndex,
                                   false,
                                   p_Lineas_Filtro,
                                   p_Lineas_OrderBy );
  var_SQL_ADD.Free;
  }
end;

procedure Tform_plantilla_000.Refrescar_Registros;
{ Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo

var var_nombre_fichero : String;
    var_id_menus       : Integer;
}
begin
  { Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo

  // *********************************************************************************************** //
  // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                               ** //
  // *********************************************************************************************** //
  var_nombre_fichero := '';
  var_id_menus       := 0;

  if SQLQuery_Principal.RecordCount > 0 then
  begin
    var_nombre_fichero := SQLQuery_Principal.FieldByName('nombre_fichero').Value;
    var_id_menus       := SQLQuery_Principal.FieldByName('id_menus').Value;
  end;

  Filtrar_Principal_Sin_Preguntar;

  if Trim(var_nombre_fichero) <> '' then
  begin
    SQLQuery_Principal.Locate( 'nombre_fichero;id_menus',
                               VarArrayOf( [ var_nombre_fichero, var_id_menus ] ),
                               [] );
  end;
}
end;

procedure Tform_plantilla_000.SQLQuery_PrincipalNewRecord(DataSet: TDataSet);
begin
  NewRecord_Insert_SQLQuery_Principal;
end;

procedure Tform_plantilla_000.Presentar_Datos;
begin
  { Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo

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
  }
end;

procedure Tform_plantilla_000.Presentar_Datos_GroupBox_Registro;
begin
  { Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo

  with SQLQuery_Principal do
  begin
    if RecordCount > 0 then
    begin
      Edit_Descripcion_Menu.Text := FieldByName('OT_Descripcion_Menu').AsString;
    end;
  end;
  }
end;

procedure Tform_plantilla_000.NewRecord_Insert_SQLQuery_Principal;
begin
  { Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo

  with SQLQuery_Principal do
  begin
    // ********************************************************************************************* //
    // ** CAMPOS QUE SON OBLIGADOS                                                                ** //
    // ********************************************************************************************* //
    FieldByName('numero_siguiente').AsString := '1';

  end;
}
end;

procedure Tform_plantilla_000.para_Empezar_GroupBox_Registro;
begin
  { Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo

  with SQLQuery_Principal do
  begin
    public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                       FieldByName('id_menus').AsString,
                                                       '',
                                                       FieldByName('nombre_fichero').AsString,
                                                       FieldByName('descripcion').AsString,
                                                       '');
  end;

  Presentar_Datos_GroupBox_Registro;
  }
end;

procedure Tform_plantilla_000.Cambiar_WindowState;
begin
  { Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo }

  Self.WindowState := wsNormal; // Puede ser wsNormal, wsFullScreen, wsMaximized o wsMinimized
end;

procedure Tform_plantilla_000.Cerramos_Tablas_Ligadas;
begin
  { Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo

  Cerrar_Tabla( Nil, // ó SQLConnector_Tabla001,
                Nil, // ó SQLTransaction_Tabla001,
                SQLQuery_Tabla001 );
  }
end;

procedure Tform_plantilla_000.Borrar_Registro_SQLQuery_Principal;
var var_msg    : TStrings;
    var_se_uso : ShortInt;
begin
  if UTI_USR_Permiso_SN(public_Menu_Worked, 'B', True) = True then
  begin
    with SQLQuery_Principal do
    begin
      var_se_uso := Fue_Utilizado_Rgtro_SQLQuery_Principal;

      if var_se_uso = 0 then
      begin
        UTI_RGTRO_Borrar( pubic_nombre_tabla_Principal,
                          SQLQuery_Principal,
                          public_Solo_Ver,
                          public_Menu_Worked );
      end
      else begin
        var_msg := TStringList.Create;
        var_msg.Add('No se puede borrar');
        var_msg.Add(' ');

        if var_se_uso = 1 then
        begin
          var_msg.Add('Este registro ha sido usado.');
        end
        else begin
          var_msg.Add('No se pudo comprobar si está usado este registro.');
        end;

        UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        var_msg.Free;
      end;
    end;
  end;
end;

function Tform_plantilla_000.Fue_Utilizado_Rgtro_SQLQuery_Principal : ShortInt;
var
  var_SQL : TStrings;
  v_id    : String;
begin
  {
  jerofa esto hay que implementarlo bien en todos los módulos hijos de esta plantilla,
  pero a lo mejor se podría solucionar creando foreign keys de la tabla principal

  jerofa esto tienes que crearlo en todos los módulos hijos de plantilla_000 pero puede o no usarse
  este es un ejemplo usandose
  Si no se fa a usar simplemente poner .... Result := 0; para que se pueda borrar el registro

  Result := 0;
}
  v_id    := SQLQuery_Principal.FieldByName('id').AsString;
  var_SQL := TStringList.Create;

  var_SQL.Add( 'SELECT Count(*) as cantidad' );
  var_SQL.Add( 'FROM presupuestos_ventas_detalles' );
  var_SQL.Add( 'WHERE id_impuestos_Ventas = ' + Trim(v_id) );
  var_SQL.Add( '  AND Del_WHEN IS NULL' );

  var_SQL.Add( 'UNION' );

  var_SQL.Add( 'SELECT Count(*) as cantidad' );
  var_SQL.Add( 'FROM pedidos_ventas_detalles' );
  var_SQL.Add( 'WHERE id_impuestos_Ventas = ' + Trim(v_id) );
  var_SQL.Add( '  AND Del_WHEN IS NULL' );

  var_SQL.Add( 'UNION' );

  var_SQL.Add( 'SELECT Count(*) as cantidad' );
  var_SQL.Add( 'FROM albaranes_ventas_detalles' );
  var_SQL.Add( 'WHERE id_impuestos_Ventas = ' + Trim(v_id) );
  var_SQL.Add( '  AND Del_WHEN IS NULL' );

  var_SQL.Add( 'UNION' );

  var_SQL.Add( 'SELECT Count(*) as cantidad' );
  var_SQL.Add( 'FROM facturas_ventas_detalles' );
  var_SQL.Add( 'WHERE id_impuestos_Ventas = ' + Trim(v_id) );
  var_SQL.Add( '  AND Del_WHEN IS NULL' );

  Result := UTI_RGTROS_se_uso(var_SQL);

  var_SQL.Free;
end;

procedure Tform_plantilla_000.Refrescar_Registros_TablasLigadas;
begin
  { Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo

  Refrescar_Tabla_001;
  Refrescar_Tabla_002;
  Refrescar_Tabla_003;
  }
end;

procedure Tform_plantilla_000.Dibujar_Grid_Principal( p_Sender: TObject;
                                                      const p_Rect: TRect;
                                                      p_DataCol: Integer;
                                                      p_Column: TColumn;
                                                      p_State: TGridDrawState );
begin
  { Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo

  UTI_GEN_Dibujar_Grid( p_Sender, SQLQuery_Principal, p_Rect, p_DataCol, p_Column, p_State );
  }
end;

function Tform_plantilla_000.Hacer_Post_al_Rgtro : Boolean;
begin
  with SQLQuery_Principal do
  begin
    Result := SeCambioAlgoEnRgtro;

    if Result = true then
    begin
      if Antes_del_Post_Principal = false then
      begin
        // ***************************************************************************************** //
        // ** No pasó algunas normas o no pudo asignar valores a los campos que son not null      ** //
        // ***************************************************************************************** //
        Result := false;
        Exit;
      end;

      if SQLQuery_Principal.State = dsEdit then
      begin
        // ***************************************************************************************** //
        // ** Modificando                                                                         ** //
        // ***************************************************************************************** //
        FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
        FieldByName('Change_Id_User').Value := Form_Menu.public_User;
      end else
      begin
        // ***************************************************************************************** //
        // ** Creando                                                                             ** //
        // ***************************************************************************************** //
        FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
        FieldByName('Insert_Id_User').Value := Form_Menu.public_User;
      end;

      UTI_RGTRO_Grabar_Antes( pubic_nombre_tabla_Principal, SQLQuery_Principal );
    end else
    begin
      Result := true;
      Hacer_Cancel_al_Rgtro;
    end;
  end;
end;

function Tform_plantilla_000.SeCambioAlgoEnRgtro : Boolean;
begin
  Result := true;

  with SQLQuery_Principal do
  begin
    ButtonPanel1.SetFocus; // Con esto consigo que salga del campo que este y pueda actualizarlo

    if State = dsEdit then
    begin
      Result := UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( SQLQuery_Principal );
    end;

  end;

end;

procedure Tform_plantilla_000.Antes_del_Post_Principal_Asignar_Valores;
begin
  { Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo

  // *********************************************************************************************** //
  // ** Asignamos valores si no los tenían                                                        ** //
  // *********************************************************************************************** //
  with SQLQuery_Principal do
  begin

    if FieldByName('').IsNull then
    begin
      FieldByName('Nombre_Campo').Value := Valor_Campo;
    end;

  end;
}
end;

function Tform_plantilla_000.Antes_del_Post_Principal : Boolean;
var var_msg           : TStrings;
    var_msg_Comprobar : TStrings;
    var_record_Existe : Trecord_Existe;
begin
  Result := true;

  var_msg := TStringList.Create;
  var_msg.Clear;

  var_msg_Comprobar := TStringList.Create;
  var_msg_Comprobar.Clear;

  Antes_del_Post_Principal_Asignar_Valores;

  Antes_del_Post_Principal_Sin_Rellenar_Permitido_NO(var_msg, var_msg_Comprobar);

  var_msg_Comprobar.Clear;
  Antes_del_Post_Principal_Sin_Rellenar_Permitido_SI(var_msg_Comprobar);

  if Trim(var_msg.Text) <> '' then
  begin
    Result := false;
    UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
  end;

  if Trim(var_msg_Comprobar.Text) <> '' then
  begin
    UTI_GEN_Aviso(false, var_msg_Comprobar, rs_falta, True, False);
  end;

  var_msg.Free;
  var_msg_Comprobar.Free;
end;

procedure Tform_plantilla_000.Antes_del_Post_Principal_Sin_Rellenar_Permitido_SI(p_msg : TStrings);
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

procedure Tform_plantilla_000.Antes_del_Post_Principal_Sin_Rellenar_Permitido_NO( p_msg,
                                                                                  p_msg_Comprobar : TStrings );
var var_record_Existe : Trecord_Existe;
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

    if Trim(FieldByName('Direccion').AsString) = '' then
    begin
      p_msg.Add( rs_bcta_008 );
    end;

    if Trim(FieldByName('id_poblaciones').AsString) = '' then
    begin
      p_msg.Add( rs_bcta_009 );
    end;

    if Trim(FieldByName('id_provincias').AsString) = '' then
    begin
      p_msg.Add( rs_bcta_010 );
    end;

    if Trim(FieldByName('id_paises').AsString) = '' then
    begin
      p_msg.Add( rs_bcta_011 );
    end;

    if Trim(FieldByName('Responsable').AsString) = '' then
    begin
      p_msg.Add( rs_bcta_012 );
    end;

    // ********************************************************************************************* //
    // ** Comprobamos que el iban es correcto                                                     ** //
    // ********************************************************************************************* //
    p_msg_Comprobar.Clear;
    Comprobar_Cuenta_IBAN(p_msg_Comprobar);

    if Trim(p_msg_Comprobar.Text) <> '' then
    begin
      p_msg.AddStrings( p_msg_Comprobar );
    end;

    // ********************************************************************************************* //
    // ** Comprobamos que la cuenta contable es correcta                                          ** //
    // ********************************************************************************************* //
    p_msg_Comprobar.Clear;
    UTI_CONTA_esta_Cta_Ctble_BIEN( form_menu.public_User_Configuracion.Bancos_Cuenta_Contable_SN,
                                   p_msg_Comprobar,
                                   SQLQuery_Principal,
                                   '',
                                   'bancos_empresas',
                                   'Cuenta_Contable',
                                   rs_bcta_019 );

    if Trim(p_msg_Comprobar.Text) <> '' then
    begin
      p_msg.AddStrings( p_msg_Comprobar );
    end;

    // ********************************************************************************************* //
    // ** Comprobamos que la cuenta contable no esté ya creada para otra cuenta bancaria          ** //
    // ********************************************************************************************* //
    if SQLQuery_Principal.State = dsInsert then
    begin
      var_record_Existe := Existe_la_Cta_Ya( '',
                                             FieldByName('descripcion').AsString );
    end;

    if SQLQuery_Principal.State = dsEdit then
    begin
      var_record_Existe := Existe_la_Cta_Ya( FieldByName('id').AsString,
                                             FieldByName('descripcion').AsString );

    end;

    if (SQLQuery_Principal.State = dsInsert) or
       (SQLQuery_Principal.State = dsEdit)   then
    begin
      if var_record_Existe.Fallo_en_Conexion_BD = true then
      begin
        p_msg.Add( rs_bcta_017 );
      end
      else
      begin
        if var_record_Existe.Existe = true then
        begin
          p_msg.Add( rs_bcta_018 + Trim(FieldByName('id_empresas').AsString) );

          if UpperCase(var_record_Existe.deBaja) = 'S' then
          begin
            p_msg.Add(rs_Rgtro_Borrado);
          end;
        end;

      end;
    end;

  end;
}
end;

procedure Tform_plantilla_000.para_Empezar;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
begin
  // *********************************************************************************************** //
  // ** Traemos los tipos de filtros para la tabla principal                                      ** //
  // *********************************************************************************************** //
  Crear_tipos_orden_Filtros;

  var_Lineas_Filtro  := TStringList.Create;
  var_Lineas_OrderBy := TStringList.Create;

  var_Lineas_Filtro.Clear;
  var_Lineas_OrderBy.Clear;

  if Trim(IntToStr(public_Menu_Worked)) <> '' then
       var_Lineas_Filtro.Add('mf.id_menus = ' + IntToStr(public_Menu_Worked) )
  else var_Lineas_Filtro.Add('mf.id_menus = Null');

  Filtrar_Filtros( RadioGroup_Bajas.ItemIndex,
                   false,
                   var_Lineas_Filtro,
                   var_Lineas_OrderBy );

  var_Lineas_Filtro.Free;
  var_Lineas_OrderBy.Free;

  // *********************************************************************************************** //
  // ** Preparamos los tipos de ordenación                                                        ** //
  // *********************************************************************************************** //
  Crear_tipos_orden_Principal;
  Crear_OrderBy_tablas_adicionales;

  // *********************************************************************************************** //
  // ** Filtramos los datos                                                                       ** //
  // *********************************************************************************************** //
  Filtrar_Principal_Sin_Preguntar;

  Presentar_Datos;
end;

procedure Tform_plantilla_000.PulsoBotonFiltrar;
begin
  Guardar_Filtros;
  Filtrar_Principal_Sin_Preguntar;
end;

function Tform_plantilla_000.Filtrar_Principal( p_Cambiamos_Filtro : Boolean ) : ShortInt;
var var_Registro_CRUD   : TRegistro_CRUD;
    var_ctdad_Rgtros    : Integer;
    var_a_Filtrar       : TStrings;
    var_errores_Filtros : TStrings;
    var_Continuamos     : Boolean;
begin
  var_a_Filtrar := TStringList.Create;
  var_a_Filtrar.Clear;

  var_ctdad_Rgtros := -9999;

  // Vamos a pasar los filtros, pero comprobamos que no hubiera ningún error
  // entre los valores desde/hasta de los filtros
  var_errores_Filtros := TStringList.Create;
  var_errores_Filtros.Clear;

  var_Continuamos := true;
  Filtrar_Principal_queFiltro( var_errores_Filtros,
                               var_Registro_Crud,
                               var_ctdad_Rgtros,
                               var_a_Filtrar );

  if Trim(var_errores_Filtros.Text) <> '' then
  begin
    UTI_GEN_Aviso( true, var_errores_Filtros, rs_No_Se_Puede, true, false );
    var_Continuamos := false;
  end;

  var_errores_Filtros.Free;

  if var_Continuamos = true then
  begin
    // Esto de abajo lo hago por si acaso todavía no tiene ningún valor var_ctdad_Rgros
    if var_ctdad_Rgtros = -9999 then
      var_ctdad_Rgtros := -1;

    // ********************************************************************************************* //
    // ** Pasamos a filtrar los registros                                                         ** //
    // ********************************************************************************************* //
    Result := UTI_TB_Filtrar( public_Order_By,

                              var_Registro_CRUD.Delete_SQL,
                              var_Registro_CRUD.Update_SQL,
                              var_Registro_CRUD.Insert_SQL,

                              var_ctdad_Rgtros,

                              SQLTransaction_Principal,
                              SQLConnector_Principal,
                              SQLQuery_Principal,

                              var_Registro_CRUD.name_tabla,

                              RadioGroup_Bajas.ItemIndex,

                              var_Registro_CRUD.SELECT_SQL,

                              Memo_Filtros.Lines,
                              Memo_OrderBy.Lines,
                              var_a_Filtrar,

                              p_Cambiamos_Filtro,
                              false,   // param_ver_SQL_despues_Abrir : Boolean;
                              true );  // no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

    Cerrar_Panel_Filtros;
  end;

  var_a_Filtrar.Free;

  Label_Ctdad_Rgtros.Caption := IntToStr(SQLQuery_Principal.RecordCount);

  BitBtn_Ver_Situacion_Registro.Enabled := false;
  BitBtn_Seleccionar.Enabled            := false;
  BitBtn_Imprimir.Enabled               := false;

  if SQLQuery_Principal.RecordCount > 0 then
  begin
    BitBtn_Ver_Situacion_Registro.Enabled := true;
    BitBtn_Seleccionar.Enabled            := true;
    BitBtn_Imprimir.Enabled               := true;
  end;

end;

procedure Tform_plantilla_000.Abrir_Conexion_con_BD( p_SQLTransaction : TSQLTransaction;
                                                     p_SQLConnector : TSQLConnector );
begin
  if UTI_CN_Connector_Open( p_SQLTransaction,
                            p_SQLConnector ) = false then
  begin
    UTI_GEN_Salir;
  end;
end;

procedure Tform_plantilla_000.Crear_tipos_orden_Filtros;
begin
  // CLIENTES_CONTACTOS
  SetLength(private_Order_By_Filtros, 1);

  private_Order_By_Filtros[0].Titulo       := 'Por orden'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
  private_Order_By_Filtros[0].Memo_OrderBy := 'mf.id_menus ASC, mf.orden ASC';

end;

procedure Tform_plantilla_000.FormCreate(Sender: TObject);
begin
  Cerrar_Panel_Filtros;

  Cambiar_Nombre_Tabla_Principal;
  Cambiar_Titulo_Form;
  Configurar_los_Grids;

  Abrir_Conexiones_con_BD;

  private_Salir_OK          := false;
  public_Solo_Ver           := false;
  public_Elegimos           := false;
  public_Rgtro_Seleccionado := false;
  GroupBox_Registro.Visible := false;
end;

procedure Tform_plantilla_000.Abrir_Conexiones_con_BD;
begin
  Abrir_Conexion_con_BD( SQLTransaction_Principal, SQLConnector_Principal);
  Abrir_Conexiones_con_BD_TablasAdicionales;
end;

procedure Tform_plantilla_000.Cambiar_Nombre_Tabla_Principal;
begin
  { Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo }

  pubic_nombre_tabla_Principal := 'principal';
end;

procedure Tform_plantilla_000.Cambiar_Titulo_Form;
begin
  { Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo }

  Self.Caption := 'Mantenimiento de ... ';
end;

procedure Tform_plantilla_000.Configurar_los_Grids;
begin
  DBGrid_Principal.AutoAdvance := aaLeft; { Para que al pulsar al return (key=13) no se vaya a otro registro }
end;

procedure Tform_plantilla_000.Abrir_Conexiones_con_BD_TablasAdicionales;
begin
  { Hacer algo parecido a lo de abajo ... pero ojito sólo si hay otras transacciones y otros conectores.
    Lo lógico es que nada más que usemos los de la conexión principal, aunque sean otras tablas adicionales.

  Abrir_Conexion_con_BD( SQLTransaction_TablaHija001, SQLConnector_TablaHija001);
  Abrir_Conexion_con_BD( SQLTransaction_TablaHija002, SQLConnector_TablaHija002);
  }
end;

procedure Tform_plantilla_000.Comprobar_si_Cambiamos_Orden( p_Lineas_OrderBy : TStrings;
                                                            p_OrderBy : String );
begin
  if Trim(p_Lineas_OrderBy.Text) = '' then
  begin
    p_Lineas_OrderBy.Text := p_OrderBy;
  end;
end;

procedure Tform_plantilla_000.OKButtonClick(Sender: TObject);
var var_id : String;
begin
  var_id := SQLQuery_Principal.FieldByName('id').AsString;

  if Hacer_Post_al_Rgtro = true then
  begin
    if Trim(var_id) <> '' then
    begin
      if Devolver_hacemos_commit_alFinalizar = true then
      begin
        UTI_RGTROS_commit( SQLTransaction_Principal );
      end;

      UTI_RGTRO_UnLock( pubic_nombre_tabla_Principal, Trim(var_id) );
    end;

    Ver_Grid;
  end;
end;

procedure Tform_plantilla_000.CancelButtonClick(Sender: TObject);
var var_id : String;
begin
  var_id := SQLQuery_Principal.FieldByName('id').AsString;

  Hacer_Cancel_al_Rgtro;

  if Trim(var_id) <> '' then
  begin
    if Devolver_hacemos_commit_alFinalizar = true then
    begin
      UTI_RGTROS_rollback( SQLTransaction_Principal );
      Filtrar_por_AfterScroll_SQLQuery_Principal;
    end;

    UTI_RGTRO_UnLock( pubic_nombre_tabla_Principal, Trim(var_id));
  end;

  Ver_Grid;
end;

function Tform_plantilla_000.Filtrar_Filtros( p_ver_bajas : ShortInt;
                                              p_Cambiamos_Filtro : Boolean;
                                              p_Lineas_Filtro,
                                              p_Lineas_OrderBy : TStrings ) : ShortInt;
var
  var_a_Filtrar : TStrings;
  var_a_SQL     : TStrings;
begin
  var_a_Filtrar := TStringList.Create;
  var_a_SQL     := TStringList.Create;

  var_a_Filtrar.Clear;
  var_a_SQL.Clear;

  //  if form_Menu.public_User = 0 then
  var_a_SQL.ADD( 'SELECT mf.*' );

  var_a_SQL.ADD(   'FROM menus_filtros mf' );

  Comprobar_si_Cambiamos_Orden( p_Lineas_OrderBy,
                                private_Order_By_Filtros[0].Memo_OrderBy );

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }
  Result := UTI_TB_Filtrar( private_Order_By_Filtros,
                            '', // Delete_SQL

                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Filtros,
                                                          'menus_filtros',
                                                          'u' ), // Update_SQL

                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Filtros,
                                                          'menus_filtros',
                                                          'i' ), // Insert_SQL,

                            - 1, // var_ctdad_Rgtros,
                            SQLTransaction_Principal,
                            SQLConnector_Principal,
                            SQLQuery_Filtros,
                            'mf', // name_tabla,
                            p_ver_bajas, // True or false

                            var_a_SQL.Text, // SELECT_SQL,

                            p_Lineas_Filtro,
                            p_Lineas_OrderBy,
                            var_a_Filtrar,
                            p_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true );  // no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_a_SQL.Free;
  var_a_Filtrar.Free;
end;

procedure Tform_plantilla_000.Refrescar_Registros_Filtros;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;

    var_id_menus       : Largeint;
    var_Descripcion    : String;

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

  if SQLQuery_Filtros.RecordCount > 0 then
  begin
    var_Hay_Datos   := true;
    var_id_menus    := SQLQuery_Filtros.FieldByName('id_menus').Value;
    var_Descripcion := SQLQuery_Filtros.FieldByName('Descripcion').Value;
  end;

  var_Lineas_Filtro  := TStringList.Create;
  var_Lineas_OrderBy := TStringList.Create;

  var_Lineas_Filtro.Clear;
  var_Lineas_OrderBy.Clear;

  if Trim(IntToStr(public_Menu_Worked)) <> '' then
       var_Lineas_Filtro.Add( 'menus_filtros.id_menus = ' + Trim(IntToStr(public_Menu_Worked)) )
  else var_Lineas_Filtro.Add( 'menus_filtros.id_menus = Null' );

  var_ver_Bajas := RadioGroup_Bajas.ItemIndex;

  Filtrar_Filtros( var_ver_Bajas,
                   false,
                   var_Lineas_Filtro,
                   var_Lineas_OrderBy );

  var_Lineas_Filtro.Free;
  var_Lineas_OrderBy.Free;

  if var_Hay_Datos = true then
  begin
    SQLQuery_Filtros.Locate( 'id_menus;Descripcion',
                             VarArrayOf( [ var_id_menus, var_Descripcion ] ),
                             [] );
  end;
end;

procedure Tform_plantilla_000.DBNavigatorDBGrid_FiltrosBeforeAction( Sender: TObject;
                                                                     Button: TDBNavButtonType );
begin
  case Button of
    nbRefresh : begin
      Refrescar_Registros_Filtros;
      Abort;
    end;
  end;

end;

procedure Tform_plantilla_000.NewRecord_Insert_SQLQuery_Filtros;
begin
  with SQLQuery_Filtros do
  begin
    // ******************************************************************************************* //
    // ** Asignamos valores de inicio si no los tenían                                          ** //
    // ******************************************************************************************* //
    FieldByName('id_menus').AsString := IntToStr(public_Menu_Worked);
  end;
end;

procedure Tform_plantilla_000.Guardar_Filtros;
begin
  if (SQLQuery_Filtros.State = dsInsert) or
     (SQLQuery_Filtros.State = dsEdit)   then
  begin
    SQLQuery_Filtros.Post;
  end;
end;

procedure Tform_plantilla_000.Filtrar_Principal_queFiltro( var p_errores_Filtros : TStrings;
                                                           var p_Registro_CRUD : TRegistro_CRUD;
                                                           var p_ctdad_Rgtros  : Integer;
                                                           var p_a_Filtrar     : TStrings );
begin
{ Hacer algo parecido a esto

  p_ctdad_Rgtros             := -1;
  p_Registro_CRUD.name_tabla := 'i';

  p_Registro_CRUD.Delete_SQL := '';

  p_Registro_CRUD.Update_SQL := UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Principal,
                                                              'informes',
                                                              'u' );

  p_Registro_CRUD.Insert_SQL := UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Principal,
                                                              'informes',
                                                              'i' );

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  p_Registro_CRUD.SELECT_SQL := 'SELECT i.*,' + ' ' +
                                       'm.Descripcion AS OT_Descripcion_Menu' + ' ' +
                                'FROM informes AS i' + ' ' +

                                'LEFT JOIN menus AS m' + ' ' +
                                'ON i.id_menus = m.id' + ' ';

  if Filtrar_Principal_queFiltro_sus_Filtros( p_errores_Filtros, p_Registro_CRUD, p_ctdad_Rgtros, p_a_Filtrar ) = false then
  begin
  end;
}
end;

procedure Tform_plantilla_000.Filtrar_Principal_queFiltro_sus_Filtros( var p_errores_Filtros : TStrings;
                                                                       var p_Registro_CRUD : TRegistro_CRUD;
                                                                       var p_ctdad_Rgtros  : Integer;
                                                                       var p_a_Filtrar     : TStrings );
var
  v_nombre_campo : String;

begin
  SQLQuery_Filtros.First;

  While not SQLQuery_Filtros.Eof do
  begin
    v_nombre_campo := SQLQuery_Filtros.FieldByName('nombre_campo').asString;

    if UTI_RGTRO_Campo_es_Numero( SQLQuery_Principal.FieldByName(v_nombre_campo).DataType,
                                  SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true then
    begin
      Filtrar_Principal_queFiltro_es_Numero( p_errores_Filtros, p_Registro_CRUD, p_ctdad_Rgtros, p_a_Filtrar );
    end;

    if UTI_RGTRO_Campo_es_Texto( SQLQuery_Principal.FieldByName(v_nombre_campo).DataType,
                                 SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true then
    begin
      Filtrar_Principal_queFiltro_es_Texto( p_errores_Filtros, p_Registro_CRUD, p_ctdad_Rgtros, p_a_Filtrar );
    end;

    if UTI_RGTRO_Campo_es_DiaHora( SQLQuery_Principal.FieldByName(v_nombre_campo).DataType,
                                   SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true then
    begin
      Filtrar_Principal_queFiltro_es_DiaHora( p_errores_Filtros, p_Registro_CRUD, p_ctdad_Rgtros, p_a_Filtrar );
    end;

    if UTI_RGTRO_Campo_es_Dia( SQLQuery_Principal.FieldByName(v_nombre_campo).DataType,
                               SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true then
    begin
      Filtrar_Principal_queFiltro_es_Dia( p_errores_Filtros, p_Registro_CRUD, p_ctdad_Rgtros, p_a_Filtrar );
    end;

    if UTI_RGTRO_Campo_es_Hora( SQLQuery_Principal.FieldByName(v_nombre_campo).DataType,
                                SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true then
    begin
      Filtrar_Principal_queFiltro_es_Hora( p_errores_Filtros, p_Registro_CRUD, p_ctdad_Rgtros, p_a_Filtrar );
    end;

    SQLQuery_Filtros.Next;
  end;

  SQLQuery_Filtros.First;

end;

procedure Tform_plantilla_000.Filtrar_Principal_HemosFiltradoPor(var p_Ordenado_por : String);
var
  v_Desde_Valor : String;
  v_Hasta_Valor : String;
begin
  v_Desde_Valor := SQLQuery_Filtros.FieldByName('Desde_Valor').asString;
  v_Hasta_Valor := SQLQuery_Filtros.FieldByName('Hasta_Valor').asString;

  SQLQuery_Filtros.First;

  While not SQLQuery_Filtros.Eof do
  begin
    if (not SQLQuery_Filtros.FieldByName('Hasta_Valor').IsNull) or
       (not SQLQuery_Filtros.FieldByName('Desde_Valor').IsNull) then
    begin
      p_Ordenado_por := p_Ordenado_por + ', ' + Trim(SQLQuery_Filtros.FieldByName('Descripcion').asString);

      if (not SQLQuery_Filtros.FieldByName('Hasta_Valor').IsNull) and
         (not SQLQuery_Filtros.FieldByName('Desde_Valor').IsNull) then
      begin
        if v_Hasta_Valor = v_Desde_Valor then
          p_Ordenado_por := p_Ordenado_por + ' contenta ' + UpperCase(Trim(v_Desde_Valor))
        else
          p_Ordenado_por := p_Ordenado_por + ' entre ' + UpperCase(Trim(v_Desde_Valor)) +
                                             ' y ' +     UpperCase(Trim(v_Hasta_Valor));
      end

      else
      begin
        if not SQLQuery_Filtros.FieldByName('Hasta_Valor').IsNull then
        begin
          p_Ordenado_por := p_Ordenado_por + ' <= ' + UpperCase(Trim(v_Hasta_Valor));
        end;

        if not SQLQuery_Filtros.FieldByName('Desde_Valor').IsNull then
        begin
          p_Ordenado_por := p_Ordenado_por + ' >= ' + UpperCase(Trim(v_Desde_Valor));
        end;
      end;

    end;

    SQLQuery_Filtros.Next;
  end;
end;

procedure Tform_plantilla_000.SQLQuery_FiltrosAfterPost(DataSet: TDataSet);
begin
{
  UTI_RGTROS_Grabar( 'menus_filtros',
                     SQLTransaction_Principal,
                     SQLQuery_Filtros,
                     false );

  Refrescar_Registros_Filtros;
}
end;

procedure Tform_plantilla_000.DBGrid_FiltrosDrawColumnCell( Sender: TObject;
                                                            const Rect: TRect;
                                                            DataCol: Integer;
                                                            Column: TColumn;
                                                            State: TGridDrawState );
var
  var_Color_Normal   : TColor;
  v_nombre_campo     : String;
  v_Pintamos_en_Gris : Boolean;

begin
  with Sender as TDBGrid do
  begin
    if SQLQuery_Filtros.RecordCount = 0 then
      Exit;

    var_Color_Normal := Canvas.Brush.Color;

    // Primero comprobamos si es un registro dado de baja o no
    if not SQLQuery_Filtros.FieldByName('Del_WHEN').IsNull then
    begin
      // Registro DADO de BAJA
      Canvas.Font.Color := clSilver;
    end

    else
    begin
      // Registro DADO de ALTA, NO BAJA
      // Así que las pinto, pero sólo si no son las columnas que van a ser dibujadas
      if State <> [gdSelected] then
      begin
        if (Column.FieldName <> 'Boton_Desde_Filtro') and
           (Column.FieldName <> 'Boton_Hasta_Filtro') then
        begin
          Canvas.font.Color := clBlack;
        end;
      end;
    end;

    // Ahora paso a dibujar una celda normal con los colores elegidos o una dibujada
    if (Column.FieldName <> 'Boton_Desde_Filtro') and
       (Column.FieldName <> 'Boton_Hasta_Filtro') then
    begin
      // No es una de las columnas a dibujar por lo que la pinto con los colores elegidos
      v_Pintamos_en_Gris := false;
      if    (     (Column.FieldName = 'Desde_Valor')
              and (UpperCase(SQLQuery_Filtros.FieldByName('Desde_Valor_pedir_SN').asString) = UpperCase('N')) )
         or (     (Column.FieldName = 'Hasta_Valor')
              and (UpperCase(SQLQuery_Filtros.FieldByName('Hasta_Valor_pedir_SN').asString) = UpperCase('N')) ) then
     begin
       v_Pintamos_en_Gris := true;
     end;

     if v_Pintamos_en_Gris = false then
       DefaultDrawColumnCell(Rect, DataCol, Column, State)
     else
       DBGrid_Filtros.Canvas.StretchDraw(Rect, Image_Boton_Busqueda_NO.Picture.Graphic);
    end

    else
    begin
      // Es una de las columnas a dibujar
      v_nombre_campo := SQLQuery_Filtros.FieldByName('nombre_campo').asString;

      if Column.FieldName <> 'Boton_Desde_Filtro' then
        Filtros_Comprobar_que_Boton_Pintar( v_nombre_campo, Sender, Rect, DataCol, Column, State );

      if Column.FieldName <> 'Boton_Hasta_Filtro' then
        Filtros_Comprobar_que_Boton_Pintar( v_nombre_campo, Sender, Rect, DataCol, Column, State );

    end;

    Canvas.Font.Color := var_Color_Normal;
  end;
end;

procedure Tform_plantilla_000.DBGrid_FiltrosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  // Por si queremos hacer algo al hacer enter en una celda;
  if key = 13 then
    Que_Hacemos_Si_DobleClick_o_Enter_enFiltros;

  Que_Hacemos_conReadOnly_enFiltros;
end;

procedure Tform_plantilla_000.Filtros_Comprobar_que_Boton_Pintar( p_nombre_campo : String;
                                                                  Sender: TObject;
                                                                  const Rect: TRect;
                                                                  DataCol: Integer;
                                                                  Column: TColumn;
                                                                  State: TGridDrawState );
begin
  if (UTI_RGTRO_Campo_es_Numero( SQLQuery_Principal.FieldByName(p_nombre_campo).DataType,
                                 SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true) and
     (UpperCase(Copy(p_nombre_campo, 1, 3)) = 'ID_')                                                      then
  begin
    DBGrid_Filtros.Canvas.StretchDraw(Rect, Image_Boton_Busqueda.Picture.Graphic);
  end

  else if (UTI_RGTRO_Campo_es_DiaHora( SQLQuery_Principal.FieldByName(p_nombre_campo).DataType,
                                       SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true) or
          (UTI_RGTRO_Campo_es_Dia( SQLQuery_Principal.FieldByName(p_nombre_campo).DataType,
                                   SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true)     then
  begin
    DBGrid_Filtros.Canvas.StretchDraw(Rect, Image_Boton_Calendario.Picture.Graphic);
  end

  else
  begin
    DBGrid_Filtros.Canvas.StretchDraw(Rect, Image_Boton_Busqueda_NO.Picture.Graphic);
  end;
end;

procedure Tform_plantilla_000.DBGrid_FiltrosKeyPress(Sender: TObject; var Key: char);
var
  v_nombre_campo : String;
begin
  v_nombre_campo := SQLQuery_Filtros.FieldByName('nombre_campo').asString;

  if (UTI_RGTRO_Campo_es_Numero( SQLQuery_Principal.FieldByName(v_nombre_campo).DataType,
                                 SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true) and
     ( Pos( UpperCase(SQLQuery_Principal.FieldByName(v_nombre_campo).asString), UpperCase('_SN') ) > 0 )  then
  begin
    if (UpperCase(key) <> 'S') and
       (UpperCase(key) <> 'N') then
    begin
      key := char('');
    end;
  end;

end;

procedure Tform_plantilla_000.Filtrar_Principal_queFiltro_es_Texto( p_errores           : TStrings;
                                                                    var p_Registro_CRUD : TRegistro_CRUD;
                                                                    var p_ctdad_Rgtros  : Integer;
                                                                    var p_a_Filtrar     : TStrings );
var
  var_SQL_ADD : TStrings;
begin
  var_SQL_ADD := TStringList.Create;

  Filtrar_Principal_queFiltro_es_Texto_Comprobar_Errores( p_errores );

  // Si no hay errores pues pasamos el filtro
  if Trim(p_errores.Text) = '' then
    Filtrar_Principal_queFiltro_es_Texto_Crear_Filtro( var_SQL_ADD,
                                                       p_Registro_CRUD,
                                                       p_ctdad_Rgtros,
                                                       p_a_Filtrar );

  var_SQL_ADD.Free;
end;

procedure Tform_plantilla_000.Filtrar_Principal_queFiltro_es_Numero( p_errores           : TStrings;
                                                                     var p_Registro_CRUD : TRegistro_CRUD;
                                                                     var p_ctdad_Rgtros  : Integer;
                                                                     var p_a_Filtrar     : TStrings );
var
  var_SQL_ADD : TStrings;
begin
  var_SQL_ADD := TStringList.Create;

  Filtrar_Principal_queFiltro_es_Numero_Comprobar_Errores( p_errores );

  // Si no hay errores pues pasamos el filtro
  if Trim(p_errores.Text) = '' then
    Filtrar_Principal_queFiltro_es_Numero_Crear_Filtro( var_SQL_ADD,
                                                        p_Registro_CRUD,
                                                        p_ctdad_Rgtros,
                                                        p_a_Filtrar );

  var_SQL_ADD.Free;
end;

procedure Tform_plantilla_000.Filtrar_Principal_queFiltro_es_DiaHora( p_errores           : TStrings;
                                                                      var p_Registro_CRUD : TRegistro_CRUD;
                                                                      var p_ctdad_Rgtros  : Integer;
                                                                      var p_a_Filtrar     : TStrings );
var
  var_SQL_ADD : TStrings;
begin
  var_SQL_ADD := TStringList.Create;

  Filtrar_Principal_queFiltro_es_DiaHora_Comprobar_Errores( p_errores ) ;

  // Si no hay errores pues pasamos el filtro
  if Trim(p_errores.Text) = '' then
    Filtrar_Principal_queFiltro_es_DiaHora_Crear_Filtro( var_SQL_ADD,
                                                         p_Registro_CRUD,
                                                         p_ctdad_Rgtros,
                                                         p_a_Filtrar );

  var_SQL_ADD.Free;
end;

procedure Tform_plantilla_000.Filtrar_Principal_queFiltro_es_Dia( p_errores           : TStrings;
                                                                  var p_Registro_CRUD : TRegistro_CRUD;
                                                                  var p_ctdad_Rgtros  : Integer;
                                                                  var p_a_Filtrar     : TStrings );
var
  var_SQL_ADD : TStrings;
begin
  var_SQL_ADD := TStringList.Create;

  Filtrar_Principal_queFiltro_es_Dia_Comprobar_Errores( p_errores ) ;

  // Si no hay errores pues pasamos el filtro
  if Trim(p_errores.Text) = '' then
    Filtrar_Principal_queFiltro_es_Dia_Crear_Filtro( var_SQL_ADD,
                                                     p_Registro_CRUD,
                                                     p_ctdad_Rgtros,
                                                     p_a_Filtrar );

  var_SQL_ADD.Free;
end;

procedure Tform_plantilla_000.Filtrar_Principal_queFiltro_es_Hora( p_errores           : TStrings;
                                                                   var p_Registro_CRUD : TRegistro_CRUD;
                                                                   var p_ctdad_Rgtros  : Integer;
                                                                   var p_a_Filtrar     : TStrings );
var
  var_SQL_ADD : TStrings;
begin
  var_SQL_ADD := TStringList.Create;

  Filtrar_Principal_queFiltro_es_Hora_Comprobar_Errores( p_errores );

  // Si no hay errores pues pasamos el filtro
  if Trim(p_errores.Text) = '' then
    Filtrar_Principal_queFiltro_es_Hora_Crear_Filtro( var_SQL_ADD,
                                                      p_Registro_CRUD,
                                                      p_ctdad_Rgtros,
                                                      p_a_Filtrar );

  var_SQL_ADD.Free;
end;

// ********************************************************************* //
// ** Filtrar_Principal_queFiltro_es_ ... algo ... _Comprobar_Errores ** //
// ********************************************************************* //
procedure Tform_plantilla_000.Filtrar_Principal_queFiltro_es_Numero_Comprobar_Errores( p_errores : TStrings );
var
  v_Error       : String;
  v_Desde_Valor : String;
  v_Hasta_Valor : String;
begin
  v_Desde_Valor := SQLQuery_Filtros.FieldByName('Desde_Valor').asString;
  v_Hasta_Valor := SQLQuery_Filtros.FieldByName('Hasta_Valor').asString;

  // Comprobamos si lo introducido para filtrar es un número
  v_Error := UTI_GEN_Comprobar_Introducido_es_Numero( v_Desde_Valor,
                                                      SQLQuery_Filtros.FieldByName('Descripcion').asString );
  if Trim(v_Error) <> '' then
    p_errores.Add(v_Error);

  // Comprobamos si lo introducido para filtrar es un número
  v_Error := UTI_GEN_Comprobar_Introducido_es_Numero( v_Hasta_Valor,
                                                      SQLQuery_Filtros.FieldByName('Descripcion').asString );
  if Trim(v_Error) <> '' then
    p_errores.Add(v_Error);

  // Comprobamos si lo introducido para filtrar, su valor hasta no es menor que su valor desde
  if (Trim(v_Hasta_Valor) <> '') and
     (Trim(v_Desde_Valor) <> '') then
  begin
    if (not SQLQuery_Filtros.FieldByName('Hasta_Valor').IsNull) and
       (not SQLQuery_Filtros.FieldByName('Desde_Valor').IsNull)  then
    begin
      Try
        if StrToCurr(v_Hasta_Valor, FormatSettings) < StrToCurr(v_Desde_Valor, FormatSettings) then
          p_errores.Add( '* El valor HASTA es menor que el valor DESDE del filtro <<' + SQLQuery_Filtros.FieldByName('Descripcion').asString + '>>');
      Except
      end;
    end;
  end;

end;

procedure Tform_plantilla_000.Filtrar_Principal_queFiltro_es_DiaHora_Comprobar_Errores( p_errores : TStrings);
var
  v_Error       : String;
  v_Desde_Valor : String;
  v_Hasta_Valor : String;
begin
  v_Desde_Valor := SQLQuery_Filtros.FieldByName('Desde_Valor').asString;
  v_Hasta_Valor := SQLQuery_Filtros.FieldByName('Hasta_Valor').asString;

  // Comprobamos si lo introducido para filtrar es un Dia+Hora
  v_Error := UTI_GEN_Comprobar_Introducido_es_DiaHora( v_Desde_Valor,
                                                       SQLQuery_Filtros.FieldByName('Descripcion').asString );
  if Trim(v_Error) <> '' then
    p_errores.Add(v_Error);

  // Comprobamos si lo introducido para filtrar es un Dia+Hora
  v_Error := UTI_GEN_Comprobar_Introducido_es_DiaHora( v_Hasta_Valor,
                                                       SQLQuery_Filtros.FieldByName('Descripcion').asString );
  if Trim(v_Error) <> '' then
    p_errores.Add(v_Error);

  // Comprobamos si lo introducido para filtrar, su valor hasta no es menor que su valor desde
  if (Trim(v_Hasta_Valor) <> '') and
     (Trim(v_Desde_Valor) <> '') then
  begin
    if (not SQLQuery_Filtros.FieldByName('Hasta_Valor').IsNull) and
       (not SQLQuery_Filtros.FieldByName('Desde_Valor').IsNull)  then
    begin
      Try
        if StrToDateTime(v_Hasta_Valor, FormatSettings) < StrToDateTime(v_Desde_Valor, FormatSettings) then
          p_errores.Add( '* El valor HASTA es menor que el valor DESDE del filtro <<' + SQLQuery_Filtros.FieldByName('Descripcion').asString + '>>');
      Except
      end;
    end;
  end;

end;

procedure Tform_plantilla_000.Filtrar_Principal_queFiltro_es_Dia_Comprobar_Errores( p_errores : TStrings );
var
  v_Error       : String;
  v_Desde_Valor : String;
  v_Hasta_Valor : String;
begin
  v_Desde_Valor := SQLQuery_Filtros.FieldByName('Desde_Valor').asString;
  v_Hasta_Valor := SQLQuery_Filtros.FieldByName('Hasta_Valor').asString;

  // Comprobamos si lo introducido para filtrar es un Dia
  v_Error := UTI_GEN_Comprobar_Introducido_es_Dia( v_Desde_Valor,
                                                   SQLQuery_Filtros.FieldByName('Descripcion').asString );
  if Trim(v_Error) <> '' then
    p_errores.Add(v_Error);

  // Comprobamos si lo introducido para filtrar es un Dia
  v_Error := UTI_GEN_Comprobar_Introducido_es_Dia( v_Hasta_Valor,
                                                   SQLQuery_Filtros.FieldByName('Descripcion').asString );
  if Trim(v_Error) <> '' then
    p_errores.Add(v_Error);

  // Comprobamos si lo introducido para filtrar, su valor hasta no es menor que su valor desde
  if (Trim(v_Hasta_Valor) <> '') and
     (Trim(v_Desde_Valor) <> '') then
  begin
    if (not SQLQuery_Filtros.FieldByName('Hasta_Valor').IsNull) and
       (not SQLQuery_Filtros.FieldByName('Desde_Valor').IsNull)  then
    begin
      Try
        if StrToDate(v_Hasta_Valor, FormatSettings) < StrToDate(v_Desde_Valor, FormatSettings) then
          p_errores.Add( '* El valor HASTA es menor que el valor DESDE del filtro <<' + SQLQuery_Filtros.FieldByName('Descripcion').asString + '>>');
      Except
      end;
    end;
  end;

end;

procedure Tform_plantilla_000.Filtrar_Principal_queFiltro_es_Hora_Comprobar_Errores( p_errores : TStrings );
var
  v_Error       : String;
  v_Desde_Valor : String;
  v_Hasta_Valor : String;
begin
  v_Desde_Valor := SQLQuery_Filtros.FieldByName('Desde_Valor').asString;
  v_Hasta_Valor := SQLQuery_Filtros.FieldByName('Hasta_Valor').asString;

  // Comprobamos si lo introducido para filtrar es una hora
  v_Error := UTI_GEN_Comprobar_Introducido_es_Hora( v_Desde_Valor,
                                                    SQLQuery_Filtros.FieldByName('Descripcion').asString );
  if Trim(v_Error) <> '' then
    p_errores.Add(v_Error);

  // Comprobamos si lo introducido para filtrar es una hora
  v_Error := UTI_GEN_Comprobar_Introducido_es_Hora( v_Hasta_Valor,
                                                    SQLQuery_Filtros.FieldByName('Descripcion').asString );
  if Trim(v_Error) <> '' then
    p_errores.Add(v_Error);

  // Comprobamos si lo introducido para filtrar, su valor hasta no es menor que su valor desde
  if (Trim(v_Hasta_Valor) <> '') and
     (Trim(v_Desde_Valor) <> '') then
  begin
    if (not SQLQuery_Filtros.FieldByName('Hasta_Valor').IsNull) and
       (not SQLQuery_Filtros.FieldByName('Desde_Valor').IsNull)  then
    begin
      Try
        if StrToTime(v_Hasta_Valor, FormatSettings) < StrToTime(v_Desde_Valor, FormatSettings) then
          p_errores.Add( '* El valor HASTA es menor que el valor DESDE del filtro <<' + SQLQuery_Filtros.FieldByName('Descripcion').asString + '>>');
      Except
      end;
    end;
  end;

end;

procedure Tform_plantilla_000.Filtrar_Principal_queFiltro_es_Texto_Comprobar_Errores( p_errores : TStrings );
begin
  // Comprobamos si lo introducido para filtrar, su valor hasta no es menor que su valor desde
  if (Trim(SQLQuery_Filtros.FieldByName('Hasta_Valor').asString) <> '') and
     (Trim(SQLQuery_Filtros.FieldByName('Desde_Valor').asString) <> '') then
  begin
    if (not SQLQuery_Filtros.FieldByName('Hasta_Valor').IsNull) and
       (not SQLQuery_Filtros.FieldByName('Desde_Valor').IsNull)  then
    begin
      Try
        if SQLQuery_Filtros.FieldByName('Hasta_Valor').asString < SQLQuery_Filtros.FieldByName('Desde_Valor').asString then
          p_errores.Add( '* El valor HASTA es menor que el valor DESDE del filtro <<' + SQLQuery_Filtros.FieldByName('Descripcion').asString + '>>');
      Except
      end;
    end;
  end;

end;

// **************************************************************** //
// ** Filtrar_Principal_queFiltro_es_ ... algo ... _Crear_Filtro ** //
// **************************************************************** //
procedure Tform_plantilla_000.Filtrar_Principal_queFiltro_es_Numero_Crear_Filtro( p_SQL_ADD           : TStrings;
                                                                                  var p_Registro_CRUD : TRegistro_CRUD;
                                                                                  var p_ctdad_Rgtros  : Integer;
                                                                                  var p_a_Filtrar     : TStrings );
var
  v_Desde_Valor                      : AnsiString;
  v_Hasta_Valor                      : AnsiString;
  v_Desde_Valor_parte_de_SQL_antes   : AnsiString;
  v_Desde_Valor_parte_de_SQL_despues : AnsiString;
  v_Hasta_Valor_parte_de_SQL_antes   : AnsiString;
  v_Hasta_Valor_parte_de_SQL_despues : AnsiString;
  v_nombre_campo                     : String;
begin
  v_nombre_campo                     := SQLQuery_Filtros.FieldByName('nombre_campo').asString;
  v_Desde_Valor                      := SQLQuery_Filtros.FieldByName('Desde_Valor').asString;
  v_Hasta_Valor                      := SQLQuery_Filtros.FieldByName('Hasta_Valor').asString;
  v_Desde_Valor_parte_de_SQL_antes   := SQLQuery_Filtros.FieldByName('Desde_Valor_parte_de_SQL_antes').asString;
  v_Desde_Valor_parte_de_SQL_despues := SQLQuery_Filtros.FieldByName('Desde_Valor_parte_de_SQL_despues').asString;
  v_Hasta_Valor_parte_de_SQL_antes   := SQLQuery_Filtros.FieldByName('Hasta_Valor_parte_de_SQL_antes').asString;
  v_Hasta_Valor_parte_de_SQL_despues := SQLQuery_Filtros.FieldByName('Hasta_Valor_parte_de_SQL_despues').asString;

  if (Trim(v_Hasta_Valor) <> '') and
     (Trim(v_Desde_Valor) <> '') then
  begin
    // ESTAN RELLENADOS EL DESDE Y EL HASTA
    if SQLQuery_Filtros.FieldByName('Hasta_Valor').Value = SQLQuery_Filtros.FieldByName('Desde_Valor').Value then
      Filtrar_Principal_queFiltro_sonIGUALES( p_SQL_ADD,
                                              2, // ES NUMERO
                                              v_Desde_Valor,
                                              v_Hasta_Valor,
                                              v_Desde_Valor_parte_de_SQL_antes,
                                              v_Desde_Valor_parte_de_SQL_despues,
                                              v_Hasta_Valor_parte_de_SQL_antes,
                                              v_Hasta_Valor_parte_de_SQL_despues,
                                              v_nombre_campo,
                                              p_Registro_CRUD,
                                              p_ctdad_Rgtros,
                                              p_a_Filtrar )
    else
      Filtrar_Principal_queFiltro_sonDIFERENTES( p_SQL_ADD,
                                                 2, // p_que_es ... Numero
                                                 v_Desde_Valor,
                                                 v_Hasta_Valor,
                                                 v_Desde_Valor_parte_de_SQL_antes,
                                                 v_Desde_Valor_parte_de_SQL_despues,
                                                 v_Hasta_Valor_parte_de_SQL_antes,
                                                 v_Hasta_Valor_parte_de_SQL_despues,
                                                 v_nombre_campo,
                                                 p_Registro_CRUD,
                                                 p_ctdad_Rgtros,
                                                 p_a_Filtrar );
  end

  else
    Filtrar_Principal_queFiltro_sinRELLENAR( p_SQL_ADD,
                                             2, // ES numero
                                             v_Desde_Valor,
                                             v_Hasta_Valor,
                                             v_Desde_Valor_parte_de_SQL_antes,
                                             v_Desde_Valor_parte_de_SQL_despues,
                                             v_Hasta_Valor_parte_de_SQL_antes,
                                             v_Hasta_Valor_parte_de_SQL_despues,
                                             v_nombre_campo,
                                             p_Registro_CRUD,
                                             p_ctdad_Rgtros,
                                             p_a_Filtrar );
end;

procedure Tform_plantilla_000.Filtrar_Principal_queFiltro_es_DiaHora_Crear_Filtro( p_SQL_ADD           : TStrings;
                                                                                   var p_Registro_CRUD : TRegistro_CRUD;
                                                                                   var p_ctdad_Rgtros  : Integer;
                                                                                   var p_a_Filtrar     : TStrings );
var
  v_Desde_Valor                      : AnsiString;
  v_Hasta_Valor                      : AnsiString;
  v_Desde_Valor_parte_de_SQL_antes   : AnsiString;
  v_Desde_Valor_parte_de_SQL_despues : AnsiString;
  v_Hasta_Valor_parte_de_SQL_antes   : AnsiString;
  v_Hasta_Valor_parte_de_SQL_despues : AnsiString;
  v_nombre_campo                     : String;
begin
  v_nombre_campo                     := SQLQuery_Filtros.FieldByName('nombre_campo').asString;
  v_Desde_Valor                      := SQLQuery_Filtros.FieldByName('Desde_Valor').asString;
  v_Hasta_Valor                      := SQLQuery_Filtros.FieldByName('Hasta_Valor').asString;
  v_Desde_Valor_parte_de_SQL_antes   := SQLQuery_Filtros.FieldByName('Desde_Valor_parte_de_SQL_antes').asString;
  v_Desde_Valor_parte_de_SQL_despues := SQLQuery_Filtros.FieldByName('Desde_Valor_parte_de_SQL_despues').asString;
  v_Hasta_Valor_parte_de_SQL_antes   := SQLQuery_Filtros.FieldByName('Hasta_Valor_parte_de_SQL_antes').asString;
  v_Hasta_Valor_parte_de_SQL_despues := SQLQuery_Filtros.FieldByName('Hasta_Valor_parte_de_SQL_despues').asString;

  // Lo intruducido en el filtro un TDateTime

  // Esto lo hago porque si pones en una fecha por ejemplo ... 12
  // lazarus lo completa con 12/mesactual/añoactual y el usuario se pierde que ha ocurrido porque no da error
  // Así que lo traduzco para que sea visible para el usuario
  if (Trim(v_Desde_Valor) <> '')                              and
     (not SQLQuery_Filtros.FieldByName('Desde_Valor').isNull) then
  begin
    SQLQuery_Filtros.Edit;
    SQLQuery_Filtros.FieldByName('Desde_Valor').Value := StrToDateTime(v_Desde_Valor);
    SQLQuery_Filtros.Post;
  end;

  if (Trim(v_Hasta_Valor) <> '')                              and
     (not SQLQuery_Filtros.FieldByName('Hasta_Valor').isNull) then
  begin
    SQLQuery_Filtros.Edit;
    SQLQuery_Filtros.FieldByName('Hasta_Valor').Value := StrToDateTime(v_Hasta_Valor);
    SQLQuery_Filtros.Post;
  end;

  // CONTINUAMOS CON LA CREACION DEL FILTRO
  if (Trim(v_Hasta_Valor) <> '') and
     (Trim(v_Desde_Valor) <> '') then
  begin
    // ESTAN RELLENADOS EL DESDE Y EL HASTA
    if SQLQuery_Filtros.FieldByName('Hasta_Valor').Value = SQLQuery_Filtros.FieldByName('Desde_Valor').Value then
      Filtrar_Principal_queFiltro_sonIGUALES( p_SQL_ADD,
                                              3, // ES NUMERO
                                              v_Desde_Valor,
                                              v_Hasta_Valor,
                                              v_Desde_Valor_parte_de_SQL_antes,
                                              v_Desde_Valor_parte_de_SQL_despues,
                                              v_Hasta_Valor_parte_de_SQL_antes,
                                              v_Hasta_Valor_parte_de_SQL_despues,
                                              v_nombre_campo,
                                              p_Registro_CRUD,
                                              p_ctdad_Rgtros,
                                              p_a_Filtrar )
    else
      Filtrar_Principal_queFiltro_sonDIFERENTES( p_SQL_ADD,
                                                 3, // p_que_es ... dia/hora
                                                 v_Desde_Valor,
                                                 v_Hasta_Valor,
                                                 v_Desde_Valor_parte_de_SQL_antes,
                                                 v_Desde_Valor_parte_de_SQL_despues,
                                                 v_Hasta_Valor_parte_de_SQL_antes,
                                                 v_Hasta_Valor_parte_de_SQL_despues,
                                                 v_nombre_campo,
                                                 p_Registro_CRUD,
                                                 p_ctdad_Rgtros,
                                                 p_a_Filtrar );
  end

  else
    Filtrar_Principal_queFiltro_sinRELLENAR( p_SQL_ADD,
                                             3, // ES dia/hora
                                             v_Desde_Valor,
                                             v_Hasta_Valor,
                                             v_Desde_Valor_parte_de_SQL_antes,
                                             v_Desde_Valor_parte_de_SQL_despues,
                                             v_Hasta_Valor_parte_de_SQL_antes,
                                             v_Hasta_Valor_parte_de_SQL_despues,
                                             v_nombre_campo,
                                             p_Registro_CRUD,
                                             p_ctdad_Rgtros,
                                             p_a_Filtrar );
end;

procedure Tform_plantilla_000.Filtrar_Principal_queFiltro_es_Dia_Crear_Filtro( p_SQL_ADD           : TStrings;
                                                                               var p_Registro_CRUD : TRegistro_CRUD;
                                                                               var p_ctdad_Rgtros  : Integer;
                                                                               var p_a_Filtrar     : TStrings );
var
  v_Desde_Valor                      : AnsiString;
  v_Hasta_Valor                      : AnsiString;
  v_Desde_Valor_parte_de_SQL_antes   : AnsiString;
  v_Desde_Valor_parte_de_SQL_despues : AnsiString;
  v_Hasta_Valor_parte_de_SQL_antes   : AnsiString;
  v_Hasta_Valor_parte_de_SQL_despues : AnsiString;
  v_nombre_campo                     : String;
begin
  v_nombre_campo                     := SQLQuery_Filtros.FieldByName('nombre_campo').asString;
  v_Desde_Valor                      := SQLQuery_Filtros.FieldByName('Desde_Valor').asString;
  v_Hasta_Valor                      := SQLQuery_Filtros.FieldByName('Hasta_Valor').asString;
  v_Desde_Valor_parte_de_SQL_antes   := SQLQuery_Filtros.FieldByName('Desde_Valor_parte_de_SQL_antes').asString;
  v_Desde_Valor_parte_de_SQL_despues := SQLQuery_Filtros.FieldByName('Desde_Valor_parte_de_SQL_despues').asString;
  v_Hasta_Valor_parte_de_SQL_antes   := SQLQuery_Filtros.FieldByName('Hasta_Valor_parte_de_SQL_antes').asString;
  v_Hasta_Valor_parte_de_SQL_despues := SQLQuery_Filtros.FieldByName('Hasta_Valor_parte_de_SQL_despues').asString;

  // Lo intruducido en el filtro un TDateTime

  // Esto lo hago porque si pones en una fecha por ejemplo ... 12
  // lazarus lo completa con 12/mesactual/añoactual y el usuario se pierde que ha ocurrido porque no da error
  // Así que lo traduzco para que sea visible para el usuario
  if (Trim(v_Desde_Valor) <> '') and
     (not SQLQuery_Filtros.FieldByName('Desde_Valor').isNull)           then
  begin
    SQLQuery_Filtros.Edit;
    SQLQuery_Filtros.FieldByName('Desde_Valor').Value := StrToDate(v_Desde_Valor);
    SQLQuery_Filtros.Post;
  end;

  if (Trim(v_Hasta_Valor) <> '') and
     (not SQLQuery_Filtros.FieldByName('Hasta_Valor').isNull)           then
  begin
    SQLQuery_Filtros.Edit;
    SQLQuery_Filtros.FieldByName('Hasta_Valor').Value := StrToDate(v_Hasta_Valor);
    SQLQuery_Filtros.Post;
  end;

  // Continuamos con la comprobación del filtro
  if (Trim(v_Hasta_Valor) <> '') and
     (Trim(v_Desde_Valor) <> '') then
  begin
    // ESTAN RELLENADOS EL DESDE Y EL HASTA
    if SQLQuery_Filtros.FieldByName('Hasta_Valor').Value = SQLQuery_Filtros.FieldByName('Desde_Valor').Value then
      Filtrar_Principal_queFiltro_sonIGUALES( p_SQL_ADD,
                                              4, // ES DIA
                                              v_Desde_Valor,
                                              v_Hasta_Valor,
                                              v_Desde_Valor_parte_de_SQL_antes,
                                              v_Desde_Valor_parte_de_SQL_despues,
                                              v_Hasta_Valor_parte_de_SQL_antes,
                                              v_Hasta_Valor_parte_de_SQL_despues,
                                              v_nombre_campo,
                                              p_Registro_CRUD,
                                              p_ctdad_Rgtros,
                                              p_a_Filtrar )
    else
      Filtrar_Principal_queFiltro_sonDIFERENTES( p_SQL_ADD,
                                                 4, // p_que_es ... dia
                                                 v_Desde_Valor,
                                                 v_Hasta_Valor,
                                                 v_Desde_Valor_parte_de_SQL_antes,
                                                 v_Desde_Valor_parte_de_SQL_despues,
                                                 v_Hasta_Valor_parte_de_SQL_antes,
                                                 v_Hasta_Valor_parte_de_SQL_despues,
                                                 v_nombre_campo,
                                                 p_Registro_CRUD,
                                                 p_ctdad_Rgtros,
                                                 p_a_Filtrar );
  end

  else
    Filtrar_Principal_queFiltro_sinRELLENAR( p_SQL_ADD,
                                             4, // ES dia
                                             v_Desde_Valor,
                                             v_Hasta_Valor,
                                             v_Desde_Valor_parte_de_SQL_antes,
                                             v_Desde_Valor_parte_de_SQL_despues,
                                             v_Hasta_Valor_parte_de_SQL_antes,
                                             v_Hasta_Valor_parte_de_SQL_despues,
                                             v_nombre_campo,
                                             p_Registro_CRUD,
                                             p_ctdad_Rgtros,
                                             p_a_Filtrar );
end;

procedure Tform_plantilla_000.Filtrar_Principal_queFiltro_es_Hora_Crear_Filtro( p_SQL_ADD           : TStrings;
                                                                                var p_Registro_CRUD : TRegistro_CRUD;
                                                                                var p_ctdad_Rgtros  : Integer;
                                                                                var p_a_Filtrar     : TStrings );
var
  v_Desde_Valor                      : AnsiString;
  v_Hasta_Valor                      : AnsiString;
  v_Desde_Valor_parte_de_SQL_antes   : AnsiString;
  v_Desde_Valor_parte_de_SQL_despues : AnsiString;
  v_Hasta_Valor_parte_de_SQL_antes   : AnsiString;
  v_Hasta_Valor_parte_de_SQL_despues : AnsiString;
  v_nombre_campo                     : String;
begin
  v_nombre_campo                     := SQLQuery_Filtros.FieldByName('nombre_campo').asString;
  v_Desde_Valor                      := SQLQuery_Filtros.FieldByName('Desde_Valor').asString;
  v_Hasta_Valor                      := SQLQuery_Filtros.FieldByName('Hasta_Valor').asString;
  v_Desde_Valor_parte_de_SQL_antes   := SQLQuery_Filtros.FieldByName('Desde_Valor_parte_de_SQL_antes').asString;
  v_Desde_Valor_parte_de_SQL_despues := SQLQuery_Filtros.FieldByName('Desde_Valor_parte_de_SQL_despues').asString;
  v_Hasta_Valor_parte_de_SQL_antes   := SQLQuery_Filtros.FieldByName('Hasta_Valor_parte_de_SQL_antes').asString;
  v_Hasta_Valor_parte_de_SQL_despues := SQLQuery_Filtros.FieldByName('Hasta_Valor_parte_de_SQL_despues').asString;

  // Lo intruducido en el filtro un TDateTime

  // Esto lo hago porque si pones en una fecha por ejemplo ... 12
  // lazarus lo completa con 12/mesactual/añoactual y el usuario se pierde que ha ocurrido porque no da error
  // Así que lo traduzco para que sea visible para el usuario
  if (Trim(v_Desde_Valor) <> '') and
     (not SQLQuery_Filtros.FieldByName('Desde_Valor').isNull)           then
  begin
    SQLQuery_Filtros.Edit;
    SQLQuery_Filtros.FieldByName('Desde_Valor').Value := StrToTime(v_Desde_Valor);
    SQLQuery_Filtros.Post;
  end;

  if (Trim(v_Hasta_Valor) <> '') and
     (not SQLQuery_Filtros.FieldByName('Hasta_Valor').isNull)           then
  begin
    SQLQuery_Filtros.Edit;
    SQLQuery_Filtros.FieldByName('Hasta_Valor').Value := StrToTime(v_Hasta_Valor);
    SQLQuery_Filtros.Post;
  end;

  if (Trim(v_Hasta_Valor) <> '') and
     (Trim(v_Desde_Valor) <> '') then
  begin
    // ESTAN RELLENADOS EL DESDE Y EL HASTA
    if SQLQuery_Filtros.FieldByName('Hasta_Valor').Value = SQLQuery_Filtros.FieldByName('Desde_Valor').Value then
      Filtrar_Principal_queFiltro_sonIGUALES( p_SQL_ADD,
                                              5, // ES NUMERO
                                              v_Desde_Valor,
                                              v_Hasta_Valor,
                                              v_Desde_Valor_parte_de_SQL_antes,
                                              v_Desde_Valor_parte_de_SQL_despues,
                                              v_Hasta_Valor_parte_de_SQL_antes,
                                              v_Hasta_Valor_parte_de_SQL_despues,
                                              v_nombre_campo,
                                              p_Registro_CRUD,
                                              p_ctdad_Rgtros,
                                              p_a_Filtrar )
    else
      Filtrar_Principal_queFiltro_sonDIFERENTES( p_SQL_ADD,
                                                 5, // p_que_es ... Hora
                                                 v_Desde_Valor,
                                                 v_Hasta_Valor,
                                                 v_Desde_Valor_parte_de_SQL_antes,
                                                 v_Desde_Valor_parte_de_SQL_despues,
                                                 v_Hasta_Valor_parte_de_SQL_antes,
                                                 v_Hasta_Valor_parte_de_SQL_despues,
                                                 v_nombre_campo,
                                                 p_Registro_CRUD,
                                                 p_ctdad_Rgtros,
                                                 p_a_Filtrar );
  end

  else
    Filtrar_Principal_queFiltro_sinRELLENAR( p_SQL_ADD,
                                             5, // ES dia/hora
                                             v_Desde_Valor,
                                             v_Hasta_Valor,
                                             v_Desde_Valor_parte_de_SQL_antes,
                                             v_Desde_Valor_parte_de_SQL_despues,
                                             v_Hasta_Valor_parte_de_SQL_antes,
                                             v_Hasta_Valor_parte_de_SQL_despues,
                                             v_nombre_campo,
                                             p_Registro_CRUD,
                                             p_ctdad_Rgtros,
                                             p_a_Filtrar );
end;

procedure Tform_plantilla_000.Filtrar_Principal_queFiltro_es_Texto_Crear_Filtro( p_SQL_ADD           : TStrings;
                                                                                 var p_Registro_CRUD : TRegistro_CRUD;
                                                                                 var p_ctdad_Rgtros  : Integer;
                                                                                 var p_a_Filtrar     : TStrings );
var
  v_Desde_Valor                      : AnsiString;
  v_Hasta_Valor                      : AnsiString;
  v_Desde_Valor_parte_de_SQL_antes   : AnsiString;
  v_Desde_Valor_parte_de_SQL_despues : AnsiString;
  v_Hasta_Valor_parte_de_SQL_antes   : AnsiString;
  v_Hasta_Valor_parte_de_SQL_despues : AnsiString;
  v_nombre_campo                     : String;
begin
  v_nombre_campo                     := SQLQuery_Filtros.FieldByName('nombre_campo').asString;
  v_Desde_Valor                      := SQLQuery_Filtros.FieldByName('Desde_Valor').asString;
  v_Hasta_Valor                      := SQLQuery_Filtros.FieldByName('Hasta_Valor').asString;
  v_Desde_Valor_parte_de_SQL_antes   := SQLQuery_Filtros.FieldByName('Desde_Valor_parte_de_SQL_antes').asString;
  v_Desde_Valor_parte_de_SQL_despues := SQLQuery_Filtros.FieldByName('Desde_Valor_parte_de_SQL_despues').asString;
  v_Hasta_Valor_parte_de_SQL_antes   := SQLQuery_Filtros.FieldByName('Hasta_Valor_parte_de_SQL_antes').asString;
  v_Hasta_Valor_parte_de_SQL_despues := SQLQuery_Filtros.FieldByName('Hasta_Valor_parte_de_SQL_despues').asString;

  if (Trim(v_Hasta_Valor) <> '') and
     (Trim(v_Desde_Valor) <> '') then
  begin
    // ESTAN RELLENADOS EL DESDE Y EL HASTA
    if SQLQuery_Filtros.FieldByName('Hasta_Valor').Value = SQLQuery_Filtros.FieldByName('Desde_Valor').Value then
      Filtrar_Principal_queFiltro_sonIGUALES( p_SQL_ADD,
                                              1, // ES TEXTO
                                              v_Desde_Valor,
                                              v_Hasta_Valor,
                                              v_Desde_Valor_parte_de_SQL_antes,
                                              v_Desde_Valor_parte_de_SQL_despues,
                                              v_Hasta_Valor_parte_de_SQL_antes,
                                              v_Hasta_Valor_parte_de_SQL_despues,
                                              v_nombre_campo,
                                              p_Registro_CRUD,
                                              p_ctdad_Rgtros,
                                              p_a_Filtrar )
    else
      Filtrar_Principal_queFiltro_sonDIFERENTES( p_SQL_ADD,
                                                 1, // p_que_es ... texto
                                                 v_Desde_Valor,
                                                 v_Hasta_Valor,
                                                 v_Desde_Valor_parte_de_SQL_antes,
                                                 v_Desde_Valor_parte_de_SQL_despues,
                                                 v_Hasta_Valor_parte_de_SQL_antes,
                                                 v_Hasta_Valor_parte_de_SQL_despues,
                                                 v_nombre_campo,
                                                 p_Registro_CRUD,
                                                 p_ctdad_Rgtros,
                                                 p_a_Filtrar );
  end

  else
    Filtrar_Principal_queFiltro_sinRELLENAR( p_SQL_ADD,
                                             1, // ES texto
                                             v_Desde_Valor,
                                             v_Hasta_Valor,
                                             v_Desde_Valor_parte_de_SQL_antes,
                                             v_Desde_Valor_parte_de_SQL_despues,
                                             v_Hasta_Valor_parte_de_SQL_antes,
                                             v_Hasta_Valor_parte_de_SQL_despues,
                                             v_nombre_campo,
                                             p_Registro_CRUD,
                                             p_ctdad_Rgtros,
                                             p_a_Filtrar );

end;

procedure Tform_plantilla_000.Rellenamos_Filtro_con_antes_y_despues( p_SQL_ADD     : TStrings;
                                                                     p_que_es      : Integer;
                                                                     p_valor       : AnsiString;
                                                                     p_SQL_antes   : AnsiString;
                                                                     p_SQL_despues : AnsiString );
begin
  if p_que_es = 1 then // Es ... TEXTO
    p_SQL_ADD.Add( Trim(p_SQL_antes) +
                   ' ' +
                   UTI_GEN_Comillas( Trim(p_valor) ) +
                   ' ' +
                   Trim(p_SQL_despues) );

  if p_que_es = 2 then // Es ... NUMERO
    p_SQL_ADD.Add( Trim(p_SQL_antes) +
                   ' ' +
                   Trim(p_valor) +
                   ' ' +
                   Trim(p_SQL_despues) );

  if p_que_es = 3 then // Es ... DIAHORA
    p_SQL_ADD.Add( Trim(p_SQL_antes) +
                   ' ' +
                   UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora( StrToDateTime(p_valor),
                                                                true ) ) +
                   ' ' +
                   Trim(p_SQL_despues) );

  if p_que_es = 4 then // Es ... DIA
    p_SQL_ADD.Add( Trim(p_SQL_antes) +
                   ' ' +
                   UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora( StrToDate(p_valor),
                                                                true ) ) +
                   ' ' +
                   Trim(p_SQL_despues) );

  if p_que_es = 5 then // Es ... HORA
    p_SQL_ADD.Add( Trim(p_SQL_antes) +
                   ' ' +
                   UTI_GEN_Comillas(p_valor) +
                   ' ' +
                   Trim(p_SQL_despues) );
end;

procedure Tform_plantilla_000.Filtrar_Principal_queFiltro_sonIGUALES( p_SQL_ADD                          : TStrings;
                                                                      p_que_es                           : Integer;
                                                                      p_Desde_Valor                      : AnsiString;
                                                                      p_Hasta_Valor                      : AnsiString;
                                                                      p_Desde_Valor_parte_de_SQL_antes   : AnsiString;
                                                                      p_Desde_Valor_parte_de_SQL_despues : AnsiString;
                                                                      p_Hasta_Valor_parte_de_SQL_antes   : AnsiString;
                                                                      p_Hasta_Valor_parte_de_SQL_despues : AnsiString;
                                                                      p_nombre_campo                     : String;
                                                                      var p_Registro_CRUD                : TRegistro_CRUD;
                                                                      var p_ctdad_Rgtros                 : Integer;
                                                                      var p_a_Filtrar                    : TStrings );
begin
  p_SQL_ADD.Clear;

  if ( Trim(p_Desde_Valor_parte_de_SQL_antes) = '' )   and
     ( Trim(p_Desde_Valor_parte_de_SQL_despues) = '' ) and
     ( Trim(p_Hasta_Valor_parte_de_SQL_antes) = '' )   and
     ( Trim(p_Hasta_Valor_parte_de_SQL_despues) = '' ) then
  begin
    // No hay nada para sustituir al standard de filtro

    if p_que_es = 1 then // Es ... TEXTO
      // Así que vamos a intentar hacer algo parecido a upper(menus.Descripcion) like CONCAT('%', upper('nus'), '%')
      // ó podríamos haber hecho algo parecido a upper(menus.Descripcion) like '%NUS%'
      p_SQL_ADD.Add( 'UPPER(' + Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) + ')' +
                     ' LIKE CONCAT(' + UTI_GEN_Comillas('%') + ',' +
                                      ' UPPER(' +  UTI_GEN_Comillas(Trim(p_Hasta_Valor)) + '), ' +
                                        UTI_GEN_Comillas('%') + ')' );

    if p_que_es = 2 then // Es ... NUMERO
      p_SQL_ADD.Add( Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) +
                     ' = ' + Trim(p_Hasta_Valor) );

    if p_que_es = 3 then // Es ... DIAHORA
      p_SQL_ADD.Add( Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) +
                     ' = ' + UTI_GEN_Comillas(  UTI_GEN_Format_Fecha_Hora( StrToDateTime(p_Hasta_Valor), true )  )
                   );

    if p_que_es = 4 then // Es ... DIA
      p_SQL_ADD.Add( Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) +
                        ' = ' + UTI_GEN_Comillas(  UTI_GEN_Format_Fecha_Hora( StrToDate(p_Hasta_Valor), false )  )
                   );

    if p_que_es = 5 then // Es ... HORA
      p_SQL_ADD.Add( Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) +
                        ' = ' + UTI_GEN_Comillas(Trim(p_Hasta_Valor))
                   );
  end

  else
  begin
    // Hay algo que va a sustituir al standard del filtro
    Rellenamos_Filtro_con_antes_y_despues( p_SQL_ADD,
                                           p_que_es,
                                           p_Desde_Valor,
                                           p_Desde_Valor_parte_de_SQL_antes,
                                           p_Desde_Valor_parte_de_SQL_despues );

    Rellenamos_Filtro_con_antes_y_despues( p_SQL_ADD,
                                           p_que_es,
                                           p_Hasta_Valor,
                                           p_Hasta_Valor_parte_de_SQL_antes,
                                           p_Hasta_Valor_parte_de_SQL_despues );
  end;

  UTI_TB_SQL_ADD( false, p_a_Filtrar, p_SQL_ADD );
end;

procedure Tform_plantilla_000.Filtrar_Principal_queFiltro_sonDIFERENTES( p_SQL_ADD                          : TStrings;
                                                                         p_que_es                           : Integer;
                                                                         p_Desde_Valor                      : AnsiString;
                                                                         p_Hasta_Valor                      : AnsiString;
                                                                         p_Desde_Valor_parte_de_SQL_antes   : AnsiString;
                                                                         p_Desde_Valor_parte_de_SQL_despues : AnsiString;
                                                                         p_Hasta_Valor_parte_de_SQL_antes   : AnsiString;
                                                                         p_Hasta_Valor_parte_de_SQL_despues : AnsiString;
                                                                         p_nombre_campo                     : String;
                                                                         var p_Registro_CRUD                : TRegistro_CRUD;
                                                                         var p_ctdad_Rgtros                 : Integer;
                                                                         var p_a_Filtrar                    : TStrings );
begin
  // son diferentes el desde y el hasta
  // hacer algo parecido a
  // WHERE ProductName NOT BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'

  p_SQL_ADD.Clear;

  if ( Trim(p_Desde_Valor_parte_de_SQL_antes) = '' )   and
     ( Trim(p_Desde_Valor_parte_de_SQL_despues) = '' ) and
     ( Trim(p_Hasta_Valor_parte_de_SQL_antes) = '' )   and
     ( Trim(p_Hasta_Valor_parte_de_SQL_despues) = '' ) then
  begin
    // No hay nada para sustituir al standard de filtro

    if p_que_es = 1 then // Es ... TEXTO
      p_SQL_ADD.Add( 'UPPER(' + Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) + ')' +
                     ' BETWEEN UPPER(' + UTI_GEN_Comillas(Trim(p_Desde_Valor)) + ')' +
                     ' AND UPPER(' + UTI_GEN_Comillas(Trim(p_Hasta_Valor)) + ')' );

    if p_que_es = 2 then // Es ... NUMERO
      p_SQL_ADD.Add( Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) +
                     ' BETWEEN ' + Trim(p_Desde_Valor) +
                     ' AND ' + Trim(p_Hasta_Valor) );

    if p_que_es = 3 then // Es ... DIAHORA
      p_SQL_ADD.Add(  Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) +
                      ' BETWEEN ' + UTI_GEN_Comillas(  UTI_GEN_Format_Fecha_Hora( StrToDateTime(p_Desde_Valor), true )  ) +
                          ' AND ' + UTI_GEN_Comillas(  UTI_GEN_Format_Fecha_Hora( StrToDateTime(p_Hasta_Valor), true )  )
                   );

    if p_que_es = 4 then // Es ... DIA
      p_SQL_ADD.Add( Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) +
                      ' BETWEEN ' + UTI_GEN_Comillas(  UTI_GEN_Format_Fecha_Hora( StrToDate(p_Desde_Valor), false )  ) +
                          ' AND ' + UTI_GEN_Comillas(  UTI_GEN_Format_Fecha_Hora( StrToDate(p_Hasta_Valor), false )  )
                   );

    if p_que_es = 5 then // Es ... HORA
      p_SQL_ADD.Add( Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) +
                      ' BETWEEN ' + UTI_GEN_Comillas(Trim(p_Desde_Valor)) +
                          ' AND ' + UTI_GEN_Comillas(Trim(p_Hasta_Valor))
                   );

  end

  else
  begin
    // Hay algo que va a sustituir al standard del filtro
    Rellenamos_Filtro_con_antes_y_despues( p_SQL_ADD,
                                           p_que_es,
                                           p_Desde_Valor,
                                           p_Desde_Valor_parte_de_SQL_antes,
                                           p_Desde_Valor_parte_de_SQL_despues );

    Rellenamos_Filtro_con_antes_y_despues( p_SQL_ADD,
                                           p_que_es,
                                           p_Hasta_Valor,
                                           p_Hasta_Valor_parte_de_SQL_antes,
                                           p_Hasta_Valor_parte_de_SQL_despues );
  end;

  UTI_TB_SQL_ADD( false, p_a_Filtrar, p_SQL_ADD );
end;

procedure Tform_plantilla_000.Filtrar_Principal_queFiltro_sinRELLENAR( p_SQL_ADD                          : TStrings;
                                                                       p_que_es                           : Integer;
                                                                       p_Desde_Valor                      : AnsiString;
                                                                       p_Hasta_Valor                      : AnsiString;
                                                                       p_Desde_Valor_parte_de_SQL_antes   : AnsiString;
                                                                       p_Desde_Valor_parte_de_SQL_despues : AnsiString;
                                                                       p_Hasta_Valor_parte_de_SQL_antes   : AnsiString;
                                                                       p_Hasta_Valor_parte_de_SQL_despues : AnsiString;
                                                                       p_nombre_campo                     : String;
                                                                       var p_Registro_CRUD                : TRegistro_CRUD;
                                                                       var p_ctdad_Rgtros                 : Integer;
                                                                       var p_a_Filtrar                    : TStrings );
begin
  // O EL DESDE O EL HASTA NO ESTAN RELLENOS
  p_SQL_ADD.Clear;

  // NO ESTA RELLENADO EL DEBE
  if Trim(p_Desde_Valor) <> '' then
  begin
    if ( Trim(p_Desde_Valor_parte_de_SQL_antes) = '' )   and
       ( Trim(p_Desde_Valor_parte_de_SQL_despues) = '' ) then
    begin
      // No hay nada para sustituir al standard de filtro
      if p_que_es = 1 then // Es ... TEXTO
        p_SQL_ADD.Add( 'UPPER(' + Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) + ')' +
                       ' >= UPPER(' + UTI_GEN_Comillas(Trim(p_Desde_Valor)) + ')' );

      if p_que_es = 2 then // Es ... NUMERO
        p_SQL_ADD.Add( Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) +
                       ' >= ' + Trim(p_Desde_Valor) );

      if p_que_es = 3 then // Es ... DIAHORA
        p_SQL_ADD.Add( Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) +
                       ' >= ' + UTI_GEN_Comillas(  UTI_GEN_Format_Fecha_Hora( StrToDateTime(p_Desde_Valor), true )  )
                     );

      if p_que_es = 4 then // Es ... DIA
        p_SQL_ADD.Add( Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) +
                        ' >= ' + UTI_GEN_Comillas(  UTI_GEN_Format_Fecha_Hora( StrToDate(p_Desde_Valor), false )  )
                     );

      if p_que_es = 5 then // Es ... HORA
        p_SQL_ADD.Add( Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) +
                        ' >= ' + UTI_GEN_Comillas(Trim(p_Desde_Valor))
                     );
    end

    else
    begin
      // Hay algo que va a sustituir al standard del filtro
      Rellenamos_Filtro_con_antes_y_despues( p_SQL_ADD,
                                             p_que_es,
                                             p_Desde_Valor,
                                             p_Desde_Valor_parte_de_SQL_antes,
                                             p_Desde_Valor_parte_de_SQL_despues );
    end;

  end;

  // NO ESTA RELLENADO EL HASTA
  if Trim(p_Hasta_Valor) <> '' then
  begin
    if ( Trim(p_Hasta_Valor_parte_de_SQL_antes) = '' )   and
       ( Trim(p_Hasta_Valor_parte_de_SQL_despues) = '' ) then
    begin
      // No hay nada para sustituir al standard de filtro

      if p_que_es = 1 then // Es ... TEXTO
        p_SQL_ADD.Add( 'UPPER(' + Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) + ')' +
                       ' <= UPPER(' + UTI_GEN_Comillas(Trim(p_Hasta_Valor)) + ')' );

      if p_que_es = 2 then // Es ... NUMERO
        p_SQL_ADD.Add( Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) +
                       ' <= ' + Trim(p_Hasta_Valor) );

      if p_que_es = 3 then // Es ... DIAHORA
        p_SQL_ADD.Add(  Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) +
                        ' <= ' + UTI_GEN_Comillas(  UTI_GEN_Format_Fecha_Hora( StrToDateTime(p_Hasta_Valor), true )  )
                     );

      if p_que_es = 4 then // Es ... DIA
        p_SQL_ADD.Add( Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) +
                        ' <= ' + UTI_GEN_Comillas(  UTI_GEN_Format_Fecha_Hora( StrToDate(p_Hasta_Valor), false )  )
                     );

      if p_que_es = 5 then // Es ... HORA
        p_SQL_ADD.Add( Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) +
                        ' <= ' + UTI_GEN_Comillas(Trim(p_Hasta_Valor))
                     );

    end

    else
    begin
      // Hay algo que va a sustituir al standard del filtro
      Rellenamos_Filtro_con_antes_y_despues( p_SQL_ADD,
                                             p_que_es,
                                             p_Hasta_Valor,
                                             p_Hasta_Valor_parte_de_SQL_antes,
                                             p_Hasta_Valor_parte_de_SQL_despues );
    end;

  end;

  UTI_TB_SQL_ADD( false, p_a_Filtrar, p_SQL_ADD );

end;

end.

(*
En el init debería de tener los colores con los que configuro las plantillas (grids, etc)

En form_visitas_001 hay una llamada desde el botón de elegir cliente a clientes_000 que antes se hacía a pelo
en vez de usar utilidades_forms_filtrar ... esto se tiene que solucionar todos deben de llamar a utilidades_forms_filtrar ... pero
lo que me preocupa es que antes de llamar pasa unos filtros que yo todavía no he preparado para que plantilla_000 los absorva y los
ponga al filtrar la tabla principal

Desde clientes no se pueden crear direcciones de envio. Tampoco se pueden crear clientes contactos ni direcciones de envío cuando se
está creando el cliente. Luego en modificaciones del cliente si que se pueden dar de alta contactos, pero no direcciones


Desde f_impuestos_000 cuando intengas añadir un nuevo impuesto (composición) da errores ... verlos detenídamente.
Los f_elige cuando son llamados podemos ponerle el public_Menu_Worked que queramos en la llamada, en vez de poner el mismo desde el que son llamados
... jerofa comprobar si esto funciona (f_servicios_Regulares_000) con los campos lunes_SN, martes_SN, etc ... en general todos los boolean

CUANDO ESTAS PIDIENDO EL VALOR DESDE O HASTA DEL FILTRO PONERLE UN MAX SIZE SEGUN EL SIZE DEL CAMPO DE LA TABLA

En el módulo f_servicios_regulares_000 uno de los filtros es NO_CAMPO_activo_al
lo hace sobre la sql que trae los servicios regulares
habría que mirar, que ya no lo tiene, como implementarle la parte que hacía antes que era ...

Result.SELECT_SQL := Result.SELECT_SQL + ' ' +
                     'RIGHT JOIN servicios_regulares_periodos AS srp' + ' ' +
                     'ON sr.id = srp.id_servicios_regulares' + ' ' +
                        'AND ' +  UTI_GEN_Comillas(p_desde_fecha) + ' BETWEEN srp.desde_fecha AND srp.hasta_fecha' + ' ' +
                        'AND ' +  UTI_GEN_Comillas(p_hasta_fecha) + ' BETWEEN srp.desde_fecha AND srp.hasta_fecha';

igual habría que poner el margen de fechas después del where no en el right join ... ver como hacerlo

Todos los f_elige_ ... hay que ponerle filtros

ver porque en el mantenimiento de clientes todos los iconos de búsqueda
están como enabled = false y no se pueden usar ... prismáticos ... ahora funcionan, pero
por ejemplo en el mantenimiento de direcciones de envíos no funciona por lo que no puedo llamar a f_elige_contacto
tampoco funciona en el mantenimiento de clientes el botón de provincia (elegirla)
Ver si es que ocurre que sólo funcionan los botones en este mantenimiento en modo edición.

Hay muchos mantenimientos que no tienen filtros ... crearlos que si no fallaría ... o lo mejor sería que si no tuviera filtros pues que avisara de ello
Ver que todos los f_modulos están funcionando bien con los filtros, porque el oncellenter del grid de filtros falla
Cambiar el diseño del panel de filtros en todos los f_
En todos los f_ hay que redimensionarlos porque ahora no tenemos el panel filtro arriba por lo que su tamaño sería menor


jerofa
Hay que arreglar todos los f_ que deriven de plantilla_000 .... su redimensionamiento en height porque ya no
tienen el panel/groupBox de arriba

falla f_clientes_tipos_000

falla por la sql que intenta crear en f_clientes_000
por los filtros que no usa y porque los intenta crear en un string y no en un tStringList

function Tform_plantilla_000.Comprobar_en_Filtros_DesdeHasta : Boolean;
var
  var_msg : TStrings;
begin
  var_msg := TStringList.Create;
  var_msg.Clear;

  Result := true;

  SQLQuery_Filtros.First;

  While not SQLQuery_Filtros.Eof do
  begin
    if (Trim(SQLQuery_Filtros.FieldByName('Hasta_Valor').asString) <> '') and
       (Trim(SQLQuery_Filtros.FieldByName('Desde_Valor').asString) <> '') then
    begin
      if (not SQLQuery_Filtros.FieldByName('Hasta_Valor').IsNull) and
         (not SQLQuery_Filtros.FieldByName('Desde_Valor').IsNull)  then
      begin
        if SQLQuery_Filtros.FieldByName('Hasta_Valor').Value < SQLQuery_Filtros.FieldByName('Desde_Valor').Value then
        esta comprobación tengo que hacerla viendo o devolviendo el datetime o el date o lo que sea si es numero
          var_msg.Add( '* El valor hasta es menor que el valor desde del filtro <<' + SQLQuery_Filtros.FieldByName('Descripcion').asString + '>>');
      end;
    end;

    SQLQuery_Filtros.Next;
  end;

  if Trim(var_msg.Text) <> '' then
  begin
    Result := false;
    UTI_GEN_Aviso( true, var_msg, rs_No_Se_Puede, true, false );
  end;

  var_msg.Free;

end;

*)



