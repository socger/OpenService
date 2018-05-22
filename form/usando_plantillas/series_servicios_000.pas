unit series_servicios_000;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DBDateTimePicker, Forms, Controls, Graphics, Dialogs, ExtCtrls, Grids,
  StdCtrls, Buttons, ComCtrls, ButtonPanel, DbCtrls, DBGrids, plantilla_000, types, sqldb, db,
  variants, utilidades_datos_tablas, utilidades_forms_Filtrar, utilidades_general, utilidades_bd,
  utilidades_rgtro, utilidades_usuarios, utilidades_contabilidad;

resourcestring
  rs_sries_serv_001 = 'Mantenimiento de series para servicios';
  rs_sries_serv_002 = 'Por serie + empresa';
  rs_sries_serv_003 = 'Por la descripción';
  rs_sries_serv_004 = '* La descripción';
  rs_sries_serv_005 = '* El código';
  rs_sries_serv_006 = '* El inicio(desde) del periodo';
  rs_sries_serv_007 = '* La empresa';
  rs_sries_serv_008 = '* El tipo de diario';

type

  { Tf_series_servicios_000 }

  Tf_series_servicios_000 = class(Tform_plantilla_000)
    BitBtn_Elegir_Empresa: TBitBtn;
    BitBtn_Elegir_TipoDiario: TBitBtn;
    DBDateTimePicker_DesdeFecha: TDBDateTimePicker;
    DBDateTimePicker_HastaFecha: TDBDateTimePicker;
    DBEdit_Descripcion: TDBEdit;
    DBEdit_serie_codigo: TDBEdit;
    DBEdit_numero_siguiente: TDBEdit;
    Edit_Descripcion_Empresa: TEdit;
    Edit_Descripcion_TipoDiario: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label61: TLabel;
    Label63: TLabel;
    Label7: TLabel;
    Panel_1: TPanel;
    Panel_2: TPanel;
    Panel_3: TPanel;
    SQLQuery_PrincipalChange_Id_User: TLargeintField;
    SQLQuery_PrincipalChange_WHEN: TDateTimeField;
    SQLQuery_PrincipalDel_Id_User: TLargeintField;
    SQLQuery_PrincipalDel_WHEN: TDateTimeField;
    SQLQuery_PrincipalDel_WHY: TStringField;
    SQLQuery_Principaldescripcion: TStringField;
    SQLQuery_Principaldesde_fecha: TDateTimeField;
    SQLQuery_Principalhasta_fecha: TDateTimeField;
    SQLQuery_Principalid_diarios_tipos: TLargeintField;
    SQLQuery_Principalid_empresas: TLargeintField;
    SQLQuery_PrincipalInsert_Id_User: TLargeintField;
    SQLQuery_PrincipalInsert_WHEN: TDateTimeField;
    SQLQuery_Principalnumero_siguiente: TLargeintField;
    SQLQuery_PrincipalOT_descripcion_diarios_tipos: TStringField;
    SQLQuery_PrincipalOT_descripcion_empresa: TStringField;
    SQLQuery_Principalserie_codigo: TStringField;
    SQLQuery_Principalsubcuenta_ventas: TStringField;

    procedure BitBtn_Elegir_EmpresaClick(Sender: TObject);
    procedure BitBtn_Elegir_TipoDiarioClick(Sender: TObject);
    procedure DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Edit_Descripcion_EmpresaClick(Sender: TObject);

    procedure Campo_Foco_en_modo_Edicion_Inserccion; override;
    procedure NewRecord_Insert_SQLQuery_Principal; override;
    procedure Antes_del_Post_Principal_Sin_Rellenar_Permitido_SI( p_msg : TStrings ); override;
    procedure Antes_del_Post_Principal_Sin_Rellenar_Permitido_NO( p_msg, p_msg_Comprobar : TStrings ); override;
    procedure Antes_del_Post_Principal_Asignar_Valores; override;
    procedure Edit_Descripcion_TipoDiarioClick(Sender: TObject);
    procedure Filtrar_tablas_adicionales( var p_Lineas_Filtro : TStrings; var p_Lineas_OrderBy : TStrings ); override;
    procedure Cambiar_Nombre_Tabla_Principal; override;
    procedure Cambiar_Titulo_Form; override;
    procedure Rellenar_Filtros_Impresion(var p_Ordenado_por : String); override;
    procedure Crear_tipos_orden_Principal; override;
    procedure Crear_OrderBy_tablas_adicionales; override;
    procedure Refrescar_Registros; override;
    procedure Refrescar_Registros_TablasLigadas; override;
    procedure Filtrar_Principal_queFiltro( var p_errores_Filtros : TStrings; var p_Registro_CRUD : TRegistro_CRUD; var p_ctdad_Rgtros : Integer; var p_a_Filtrar : TStrings ); override;
    procedure Presentar_Datos; override;
    procedure Presentar_Datos_GroupBox_Registro; override;
    procedure para_Empezar_GroupBox_Registro; override;
    procedure Cambiar_WindowState; override;
    procedure Abrir_Conexiones_con_BD_TablasAdicionales; override;
    procedure Cerramos_Tablas_Ligadas; override;
    procedure Dibujar_Grid_Principal( p_Sender: TObject; const p_Rect: TRect; p_DataCol: Integer; p_Column: TColumn; p_State: TGridDrawState ); override;
    function  Fue_Utilizado_Rgtro_SQLQuery_Principal : ShortInt; override;

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  f_series_servicios_000: Tf_series_servicios_000;

implementation

{$R *.lfm}

uses menu;

{ Tf_series_servicios_000 }

procedure Tf_series_servicios_000.BitBtn_Elegir_EmpresaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
  with SQLQuery_Principal do
  begin
    var_Registro := UTI_Abrir_Modulo_Empresas( true, false, 250, '1' );
    if var_Registro.id_1 <> '' then
    begin
      FieldByName('id_empresas').AsString := Trim(var_Registro.id_1);
      Edit_Descripcion_Empresa.Text       := var_Registro.descripcion_1;
    end;
  end;
end;

procedure Tf_series_servicios_000.Edit_Descripcion_EmpresaClick(Sender: TObject);
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

procedure Tf_series_servicios_000.Filtrar_tablas_adicionales( var p_Lineas_Filtro : TStrings;
                                                              var p_Lineas_OrderBy : TStrings );
begin
  // *********************************************************************************************** //
  // ** no hay tablas ligadas                                                                     ** //
  // *********************************************************************************************** //
end;

procedure Tf_series_servicios_000.Cambiar_Nombre_Tabla_Principal;
begin
  pubic_nombre_tabla_Principal := 'series_servicios';
end;

procedure Tf_series_servicios_000.Cambiar_Titulo_Form;
begin
  Self.Caption := rs_sries_serv_001;
end;

procedure Tf_series_servicios_000.Crear_tipos_orden_Principal;
begin
  SetLength(public_Order_By, 2);

  public_Order_By[0].Titulo       := rs_sries_serv_002; // El índice 0 siempre será por el que empezará la aplicación y los filtros
  public_Order_By[0].Memo_OrderBy := 'ss.serie_codigo ASC, ss.id_empresas ASC';

  public_Order_By[1].Titulo       := rs_sries_serv_003;
  public_Order_By[1].Memo_OrderBy := 'ss.descripcion ASC';

  Memo_OrderBy.Lines.Text         := public_Order_By[0].Memo_OrderBy;

  UTI_TB_Rellenar_ComboBox_Orden( true,
                                  ComboBox_Filtros,
                                  public_Order_By,
                                  0 );
end;

procedure Tf_series_servicios_000.Crear_OrderBy_tablas_adicionales;
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

procedure Tf_series_servicios_000.Refrescar_Registros;
var v_serie_codigo : String;
    v_id_empresas  : Integer;
begin
  // *********************************************************************************************** //
  // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                               ** //
  // *********************************************************************************************** //
  v_serie_codigo := '';
  v_id_empresas  := 0;

  if SQLQuery_Principal.RecordCount > 0 then
  begin
    v_serie_codigo := SQLQuery_Principal.FieldByName('serie_codigo').Value;
    v_id_empresas  := SQLQuery_Principal.FieldByName('id_empresas').Value;
  end;

  Filtrar_Principal_Sin_Preguntar;

  if Trim(v_serie_codigo) <> '' then
  begin
    SQLQuery_Principal.Locate( 'serie_codigo;id_empresas',
                               VarArrayOf( [ v_serie_codigo, v_id_empresas ] ),
                               [] );
  end;

end;

procedure Tf_series_servicios_000.Refrescar_Registros_TablasLigadas;
begin
  { Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo

  Refrescar_Tabla_001;
  Refrescar_Tabla_002;
  Refrescar_Tabla_003;
  }
end;

procedure Tf_series_servicios_000.Filtrar_Principal_queFiltro( var p_errores_Filtros : TStrings;
                                                               var p_Registro_CRUD : TRegistro_CRUD;
                                                               var p_ctdad_Rgtros  : Integer;
                                                               var p_a_Filtrar     : TStrings );
begin
  p_Registro_CRUD.name_tabla := 'ss';

  p_Registro_CRUD.Delete_SQL := '';

  p_Registro_CRUD.Update_SQL := UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Principal,
                                                              'series_servicios',
                                                              'u' );

  p_Registro_CRUD.Insert_SQL := UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Principal,
                                                              'series_servicios',
                                                              'i' );

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  p_Registro_CRUD.SELECT_SQL := 'SELECT ss.*, ' + ' ' +
                                       'dt.descripcion AS OT_descripcion_diarios_tipos,' + ' ' +
                                       'emp.nombre_comercial AS OT_descripcion_empresa ' + ' ' +
                                'FROM series_servicios AS ss ' + ' ' +

                                'LEFT JOIN diarios_tipos AS dt' + ' ' +
                                'ON dt.id = ss.id_diarios_tipos' + ' ' +

                                'LEFT JOIN empresas AS emp' + ' ' +
                                'ON emp.id = ss.id_empresas' + ' ';

  p_ctdad_Rgtros  := -1;

  Filtrar_Principal_queFiltro_sus_Filtros( p_errores_Filtros, p_Registro_CRUD, p_ctdad_Rgtros, p_a_Filtrar );
end;

procedure Tf_series_servicios_000.Presentar_Datos;
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

procedure Tf_series_servicios_000.Presentar_Datos_GroupBox_Registro;
begin
  with SQLQuery_Principal do
  begin
    if RecordCount > 0 then
    begin
      Edit_Descripcion_Empresa.Text    := fieldByName('OT_descripcion_empresa').asString;
      Edit_Descripcion_TipoDiario.Text := fieldByName('OT_descripcion_diarios_tipos').asString;
    end;
  end;
end;

procedure Tf_series_servicios_000.para_Empezar_GroupBox_Registro;
begin
  with SQLQuery_Principal do
  begin
    public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                       FieldByName('id_empresas').AsString,
                                                       FieldByName('subcuenta_ventas').AsString,
                                                       FieldByName('descripcion').AsString,
                                                       FieldByName('serie_codigo').AsString,
                                                       FieldByName('numero_siguiente').AsString );
  end;

  Presentar_Datos_GroupBox_Registro;
end;

procedure Tf_series_servicios_000.Cambiar_WindowState;
begin
  Self.WindowState := wsNormal; // Puede ser wsNormal, wsFullScreen, wsMaximized o wsMinimized
end;

procedure Tf_series_servicios_000.Abrir_Conexiones_con_BD_TablasAdicionales;
begin
  { Hacer algo parecido a lo de abajo ... pero ojito sólo si hay otras transacciones y otros conectores.
    Lo lógico es que nada más que usemos los de la conexión principal, aunque sean otras tablas adicionales.

  Abrir_Conexion_con_BD( SQLTransaction_TablaHija001, SQLConnector_TablaHija001);
  Abrir_Conexion_con_BD( SQLTransaction_TablaHija002, SQLConnector_TablaHija002);
  }
end;

procedure Tf_series_servicios_000.Cerramos_Tablas_Ligadas;
begin
  { Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo

  Cerrar_Tabla( Nil,
                Nil,
                SQLQuery_Tabla001 );
  }
end;

procedure Tf_series_servicios_000.Dibujar_Grid_Principal( p_Sender: TObject;
                                                             const p_Rect: TRect;
                                                             p_DataCol: Integer;
                                                             p_Column: TColumn;
                                                             p_State: TGridDrawState );
begin
  UTI_GEN_Dibujar_Grid( p_Sender, SQLQuery_Principal, p_Rect, p_DataCol, p_Column, p_State );
end;

procedure Tf_series_servicios_000.Rellenar_Filtros_Impresion(var p_Ordenado_por : String);
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

procedure Tf_series_servicios_000.DBGrid_PrincipalDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
end;

procedure Tf_series_servicios_000.BitBtn_Elegir_TipoDiarioClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
  var_Registro := UTI_Abrir_Modulo_Elegir_cliente_contacto( true, true, 740, '1' );

  if var_Registro.id_1 <> '' then
  begin
    SQLQuery_Principalid_diarios_tipos.AsString := var_Registro.id_1;
    Edit_Descripcion_TipoDiario.Text            := var_Registro.descripcion_1;
  end;
end;

procedure Tf_series_servicios_000.Edit_Descripcion_TipoDiarioClick(Sender: TObject);
var var_msg : TStrings;
begin
  var_msg := TStringList.Create;
  var_msg.Add('¿QUITAMOS el TIPO DE DIARIO?');

  if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = true then
  begin
    SQLQuery_Principal.FieldByName('id_diarios_tipos').Clear;
    Edit_Descripcion_TipoDiario.Text := '';
  end;

  var_msg.Free;
end;

procedure Tf_series_servicios_000.Antes_del_Post_Principal_Asignar_Valores;
begin
  // *********************************************************************************************** //
  // ** Asignamos valores si no los tenían                                                        ** //
  // *********************************************************************************************** //
  with SQLQuery_Principal do
  begin
    if (FieldByName('numero_siguiente').IsNull)              or
       (Trim(FieldByName('numero_siguiente').asString) = '') then
    begin
      FieldByName('numero_siguiente').AsString := '1';
    end;

  end;

end;

procedure Tf_series_servicios_000.Antes_del_Post_Principal_Sin_Rellenar_Permitido_SI( p_msg : TStrings );
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

procedure Tf_series_servicios_000.Antes_del_Post_Principal_Sin_Rellenar_Permitido_NO( p_msg,
                                                                                      p_msg_Comprobar : TStrings );
begin
  // *********************************************************************************************** //
  // ** Ahora vienen las comprobaciones de porque no grabamos                                     ** //
  // *********************************************************************************************** //
  with SQLQuery_Principal do
  begin

    if Trim(DBEdit_Descripcion.Text) <> '' then
    begin
      FieldByName('descripcion').asString := AnsiUpperCase(Trim(FieldByName('descripcion').AsString));
    end else begin
      p_msg.Add(rs_sries_serv_004);
    end;

    if Trim(DBEdit_serie_codigo.Text) <> '' then
    begin
      FieldByName('serie_codigo').asString := AnsiUpperCase(Trim(FieldByName('serie_codigo').AsString));
    end else begin
      p_msg.Add(rs_sries_serv_005);
    end;

    if Trim(FieldByName('id_empresas').asString) = '' then
    begin
      p_msg.Add(rs_sries_serv_007);
    end;

    if Trim(FieldByName('id_diarios_tipos').asString) = '' then
    begin
      p_msg.Add(rs_sries_serv_008);
    end;

    if FieldByName('desde_fecha').isNull then
    begin
      p_msg.Add(rs_sries_serv_006);
    end;

  end;

end;

procedure Tf_series_servicios_000.NewRecord_Insert_SQLQuery_Principal;
begin
  with SQLQuery_Principal do
  begin
    // ********************************************************************************************* //
    // ** Asignamos valores de iniciosi no los tenían                                             ** //
    // ********************************************************************************************* //
    FieldByName('numero_siguiente').AsString := '1';

  end;

end;

procedure Tf_series_servicios_000.Campo_Foco_en_modo_Edicion_Inserccion;
begin
  Self.ActiveControl := DBEdit_serie_codigo;
end;

function Tf_series_servicios_000.Fue_Utilizado_Rgtro_SQLQuery_Principal : ShortInt;
begin
  Result := 0;

end;

end.


