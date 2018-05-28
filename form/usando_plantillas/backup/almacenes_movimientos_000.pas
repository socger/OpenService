unit almacenes_movimientos_000;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, DBDateTimePicker, DateTimePicker,
  Forms, Controls, Grids, Graphics, Dialogs, ExtCtrls, StdCtrls, Buttons,
  ComCtrls, DbCtrls, DBGrids, ButtonPanel, ActnList, variants, plantilla_000,
  utilidades_datos_tablas, utilidades_rgtro, utilidades_bd, utilidades_general,
  utilidades_forms_Filtrar, utilidades_usuarios, utilidades_impuestos;

resourcestring
  rs_alm_mov_006 = 'Por fecha';
  rs_alm_mov_007 = 'Por almacén de destino';
  rs_alm_mov_008 = 'Por nombre';
  rs_alm_mov_009 = '* La fecha del movimiento.';
  rs_alm_mov_010 = '* El almacén de destino.';
  rs_alm_mov_011 = '* Si el tipo de movimiento es "Entrada manual", no puede existir el almacén de origen.';
  rs_alm_mov_012 = '* Si el tipo de movimiento es "Traspaso entre almacenes", necesitamos el almacén de origen.';
  rs_alm_mov_013 = '* El tipo de movimiento.';
  rs_alm_mov_014 = '¿Quitamos el ALMACEN DE DESTINO?';
  rs_alm_mov_015 = '¿Quitamos el ALMACEN DE ORIGEN?';
  rs_alm_mov_016 = '¿Quitamos el CONCEPTO?';
  rs_alm_mov_017 = 'Artículo repetido para este movimiento de almacén.';
  rs_alm_mov_018 = 'Error al comprobar si el artículo ya fué puesto para este movimiento de almacén. La tabla ha sido ';
  rs_alm_mov_019 = ' desde el módulo ';

type

  { Tf_almacenes_movimientos_000 }

  Tf_almacenes_movimientos_000 = class(Tform_plantilla_000)
    BitBtn_Ver_Situacion_Registro_AMD: TBitBtn;
    Boton_Elegir_Almacen_Destino: TBitBtn;
    Boton_Elegir_Almacen_Origen: TBitBtn;
    Boton_Elegir_Concepto: TBitBtn;
    DataSource_AMD: TDataSource;
    DBDateTimePicker_Fecha_Movimiento: TDBDateTimePicker;
    DBGrid_AMD: TDBGrid;
    DBNavigator_AMD: TDBNavigator;
    DBRadioGroup_Tipo_Cuenta: TDBRadioGroup;
    Edit_Descripcion_Almacen_Destino: TEdit;
    Edit_Descripcion_Almacen_Origen: TEdit;
    Edit_Descripcion_Concepto: TEdit;
    GroupBox_AMD: TGroupBox;
    Label1: TLabel;
    Label6: TLabel;
    Label64: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel_Tipo_Movimiento: TPanel;
    SQLQuery_AMD: TSQLQuery;
    SQLQuery_AMDChange_Id_User: TLargeintField;
    SQLQuery_AMDChange_WHEN: TDateTimeField;
    SQLQuery_AMDDel_Id_User: TLargeintField;
    SQLQuery_AMDDel_WHEN: TDateTimeField;
    SQLQuery_AMDDel_WHY: TStringField;
    SQLQuery_AMDid: TLargeintField;
    SQLQuery_AMDid_almacenes_destino: TLargeintField;
    SQLQuery_AMDid_almacenes_movimientos: TLargeintField;
    SQLQuery_AMDid_almacenes_origen: TLargeintField;
    SQLQuery_AMDid_articulos: TLargeintField;
    SQLQuery_AMDInsert_Id_User: TLargeintField;
    SQLQuery_AMDInsert_WHEN: TDateTimeField;
    SQLQuery_AMDOT_descripcion_articulo: TStringField;
    SQLQuery_AMDOT_Tipo_de_articulo: TStringField;
    SQLQuery_AMDUnidades: TBCDField;
    SQLQuery_PrincipalChange_Id_User: TLargeintField;
    SQLQuery_PrincipalChange_WHEN: TDateTimeField;
    SQLQuery_PrincipalDel_Id_User: TLargeintField;
    SQLQuery_PrincipalDel_WHEN: TDateTimeField;
    SQLQuery_PrincipalDel_WHY: TStringField;
    SQLQuery_PrincipalFecha_Movimiento: TDateTimeField;
    SQLQuery_Principalid_almacenes_destino: TLargeintField;
    SQLQuery_Principalid_almacenes_origen: TLargeintField;
    SQLQuery_Principalid_conceptos_almacen_traspaso: TLargeintField;
    SQLQuery_PrincipalInsert_Id_User: TLargeintField;
    SQLQuery_PrincipalInsert_WHEN: TDateTimeField;
    SQLQuery_PrincipalOT_descripcion_almacen_destino: TStringField;
    SQLQuery_PrincipalOT_descripcion_almacen_origen: TStringField;
    SQLQuery_PrincipalOT_descripcion_conceptos_almacen_traspaso: TStringField;
    SQLQuery_PrincipalTipo_Movimiento: TStringField;

    procedure BitBtn_Ver_Situacion_Registro_AMDClick(Sender: TObject);
    procedure Boton_Elegir_Almacen_DestinoClick(Sender: TObject);
    procedure Boton_Elegir_Almacen_OrigenClick(Sender: TObject);
    procedure Boton_Elegir_ConceptoClick(Sender: TObject);
    procedure DBGrid_AMDDblClick(Sender: TObject);
    procedure DBGrid_AMDDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_AMDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBNavigator_AMDBeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure Edit_Descripcion_Almacen_DestinoClick(Sender: TObject);
    procedure Edit_Descripcion_Almacen_OrigenClick(Sender: TObject);
    procedure Edit_Descripcion_ConceptoClick(Sender: TObject);
    procedure SQLQuery_AMDAfterPost(DataSet: TDataSet);
    procedure SQLQuery_AMDBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_AMDBeforePost(DataSet: TDataSet);

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
    procedure Crear_OrderBy_tablas_adicionales; override;
    procedure Crear_tipos_orden_Principal; override;
    procedure Rellenar_Filtros_Impresion(var p_Ordenado_por : String); override;
    procedure Cambiar_Titulo_Form; override;
    procedure Cambiar_Nombre_Tabla_Principal; override;
    procedure Refrescar_Registros_TablasLigadas; override;
    procedure Filtrar_Principal_queFiltro( var p_errores_Filtros : TStrings; var p_Registro_CRUD : TRegistro_CRUD; var p_ctdad_Rgtros : Integer; var p_a_Filtrar : TStrings ); override;
    procedure Filtrar_tablas_adicionales( var p_Lineas_Filtro : TStrings; var p_Lineas_OrderBy : TStrings ); override;
    function  Fue_Utilizado_Rgtro_SQLQuery_Principal : ShortInt; override;

  private
    { private declarations }
    private_Order_By_AMD : array of TOrder_By;

    function  Filtrar_AMD( p_ver_bajas : ShortInt; p_Cambiamos_Filtro : Boolean; p_Lineas_Filtro, p_Lineas_OrderBy : TStrings ) : ShortInt;
    procedure Refrescar_Registros_AMD;
    procedure Borrar_Registro_AMD;
    procedure Insertar_Registro_AMD;
    function  Existe_Articulo_Ya( param_id, param_id_almacenes_movimientos, param_id_articulos : String ) : Trecord_Existe;
    procedure Editar_Registro_AMD;

  public
    { public declarations }

  end;

var
  f_almacenes_movimientos_000: Tf_almacenes_movimientos_000;

implementation

{$R *.lfm}

uses menu, almacenes_movimientos_001;

{ Tf_almacenes_movimientos_000 }

procedure Tf_almacenes_movimientos_000.Dibujar_Grid_Principal( p_Sender: TObject;
                                                                  const p_Rect: TRect;
                                                                  p_DataCol: Integer;
                                                                  p_Column: TColumn;
                                                                  p_State: TGridDrawState );
begin
  UTI_GEN_Dibujar_Grid( p_Sender, SQLQuery_Principal, p_Rect, p_DataCol, p_Column, p_State );
end;

procedure Tf_almacenes_movimientos_000.Cerramos_Tablas_Ligadas;
begin
  Cerrar_Tabla( Nil,
                Nil,
                SQLQuery_AMD );
end;

procedure Tf_almacenes_movimientos_000.Abrir_Conexiones_con_BD_TablasAdicionales;
begin
  { Hacer algo parecido a lo de abajo ... pero ojito sólo si hay otras transacciones y otros conectores.
    Lo lógico es que nada más que usemos los de la conexión principal, aunque sean otras tablas adicionales.

  Abrir_Conexion_con_BD( SQLTransaction_AMD, SQLConnector_AMD);
  }
end;

procedure Tf_almacenes_movimientos_000.Cambiar_WindowState;
begin
  Self.WindowState := wsNormal; // Puede ser wsNormal, wsFullScreen, wsMaximized o wsMinimized
end;

procedure Tf_almacenes_movimientos_000.para_Empezar_GroupBox_Registro;
begin
  with SQLQuery_Principal do
  begin
    public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                       '',
                                                       '',

                                                       '',
                                                       '',
                                                       '' );
  end;

  Presentar_Datos_GroupBox_Registro;
end;

procedure Tf_almacenes_movimientos_000.Presentar_Datos;
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

procedure Tf_almacenes_movimientos_000.Presentar_Datos_GroupBox_Registro;
begin
  with SQLQuery_Principal do
  begin
    if RecordCount > 0 then
    begin
      Edit_Descripcion_Almacen_Destino.Text := FieldByName('OT_descripcion_almacen_destino').AsString;
      Edit_Descripcion_Almacen_Origen.Text  := FieldByName('OT_descripcion_almacen_origen').AsString;
      Edit_Descripcion_Concepto.Text        := FieldByName('OT_descripcion_conceptos_almacen_traspaso').AsString;
    end;
  end;
end;

procedure Tf_almacenes_movimientos_000.Refrescar_Registros;
var var_Fecha_Movimiento     : TDateTime;
    var_Tipo_Movimiento      : ShortString;
    var_id_almacenes_destino : Largeint;
    var_Insert_WHEN          : TDateTime;
    var_Insert_Id_User       : Largeint;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_Tipo_Movimiento := '';

    with SQLQuery_Principal do
    begin
      if RecordCount > 0 then
      begin
        var_Fecha_Movimiento     := FieldByName('Fecha_Movimiento').Value;
        var_Tipo_Movimiento      := FieldByName('Tipo_Movimiento').Value;
        var_id_almacenes_destino := FieldByName('id_almacenes_destino').Value;
        var_Insert_WHEN          := FieldByName('Insert_WHEN').Value;
        var_Insert_Id_User       := FieldByName('Insert_Id_User').Value;
      end;
    end;

    Filtrar_Principal_Sin_Preguntar;

    if Trim(var_Tipo_Movimiento) <> '' then
    begin
      SQLQuery_Principal.Locate( 'Fecha_Movimiento;Tipo_Movimiento;id_almacenes_destino;Insert_WHEN;Insert_Id_User',
                                 VarArrayOf( [ var_Fecha_Movimiento, var_Tipo_Movimiento, var_id_almacenes_destino, var_Insert_WHEN, var_Insert_Id_User ] ),
                                 [] );

      { jerofa Este locate dice que si que encuentra el registro, pero no lo hace asi que igual es problema
        del query y tengo que cambiarlo }
    end;
end;

procedure Tf_almacenes_movimientos_000.Crear_OrderBy_tablas_adicionales;
begin
  // Tabla ligada Detalle movimientos entre almacenes
  SetLength(private_Order_By_AMD, 1);

  private_Order_By_AMD[0].Titulo       := rs_alm_mov_008; // El índice 0 siempre será por el que empezará la aplicación y los filtros
  private_Order_By_AMD[0].Memo_OrderBy := 'amd.id_almacenes_movimientos ASC, amd.id_articulos ASC, amd.Unidades ASC';
end;

procedure Tf_almacenes_movimientos_000.Crear_tipos_orden_Principal;
begin
  SetLength(public_Order_By, 2);

  public_Order_By[0].Titulo       := rs_alm_mov_006; // El índice 0 siempre será por el que empezará la aplicación y los filtros
  public_Order_By[0].Memo_OrderBy := 'am.Fecha_Movimiento ASC, am.id_almacenes_destino ASC, am.id_almacenes_origen ASC';

  public_Order_By[1].Titulo       := rs_alm_mov_007;
  public_Order_By[1].Memo_OrderBy := 'am.id_almacenes_destino ASC, am.Fecha_Movimiento ASC';

  Memo_OrderBy.Lines.Text          := public_Order_By[0].Memo_OrderBy;

  UTI_TB_Rellenar_ComboBox_Orden( true,
                                  ComboBox_Filtros,
                                  public_Order_By,
                                  0 );
end;

procedure Tf_almacenes_movimientos_000.Rellenar_Filtros_Impresion(var p_Ordenado_por : String);
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

procedure Tf_almacenes_movimientos_000.Cambiar_Titulo_Form;
begin
  Self.Caption := 'Mantenimiento de entradas a almacén';
end;

procedure Tf_almacenes_movimientos_000.Cambiar_Nombre_Tabla_Principal;
begin
  pubic_nombre_tabla_Principal := 'almacenes_movimientos';
end;

procedure Tf_almacenes_movimientos_000.Edit_Descripcion_Almacen_DestinoClick(Sender: TObject);
var var_msg : TStrings;
begin
  var_msg := TStringList.Create;
  var_msg.Add(rs_alm_mov_014);
  if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
  begin
    SQLQuery_Principal.FieldByName('id_almacenes_destino').Clear;
    Edit_Descripcion_Almacen_Destino.Text := '';
  end;
  var_msg.Free;
end;

procedure Tf_almacenes_movimientos_000.Edit_Descripcion_Almacen_OrigenClick(Sender: TObject);
var var_msg : TStrings;
begin
  var_msg := TStringList.Create;
  var_msg.Add(rs_alm_mov_015);
  if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
  begin
    SQLQuery_Principal.FieldByName('id_almacenes_origen').Clear;
    Edit_Descripcion_Almacen_Origen.Text := '';
  end;
  var_msg.Free;
end;

procedure Tf_almacenes_movimientos_000.Edit_Descripcion_ConceptoClick(Sender: TObject);
var var_msg : TStrings;
begin
  var_msg := TStringList.Create;
  var_msg.Add(rs_alm_mov_016);
  if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
  begin
    SQLQuery_Principal.FieldByName('id_conceptos_almacen_traspaso').Clear;
    Edit_Descripcion_Concepto.Text := '';
  end;
  var_msg.Free;
end;

procedure Tf_almacenes_movimientos_000.DBGrid_AMDDrawColumnCell( Sender: TObject;
                                                                    const Rect: TRect;
                                                                    DataCol: Integer;
                                                                    Column: TColumn;
                                                                    State: TGridDrawState );
begin
  UTI_GEN_Dibujar_Grid( Sender, SQLQuery_AMD, Rect, DataCol, Column, State );
end;

procedure Tf_almacenes_movimientos_000.Boton_Elegir_ConceptoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
  with SQLQuery_Principal do
  begin
    var_Registro := UTI_Abrir_Modulo_ConceptosPorTraspasoAlmacen( true, false, 290, '1' );
    if var_Registro.id_1 <> '' then
    begin
      FieldByName('id_conceptos_almacen_traspaso').AsString := Trim(var_Registro.id_1);
      Edit_Descripcion_Concepto.Text                        := var_Registro.descripcion_1;
    end;
  end;
end;

procedure Tf_almacenes_movimientos_000.Boton_Elegir_Almacen_OrigenClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
  with SQLQuery_Principal do
  begin
    var_Registro := UTI_Abrir_Modulo_Almacenes( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
      FieldByName('id_almacenes_origen').AsString := Trim(var_Registro.id_1);
      Edit_Descripcion_Almacen_Origen.Text        := var_Registro.descripcion_1;
    end;
  end;
end;

procedure Tf_almacenes_movimientos_000.BitBtn_Ver_Situacion_Registro_AMDClick(Sender: TObject);
begin
  if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
  begin
      if SQLQuery_AMD.RecordCount > 0 then
      begin
          UTI_RGTRO_Ver_Estado_Registro( 'almacenes_movimientos_detalles',
                                         SQLQuery_AMD,
                                         DataSource_AMD,
                                         DBGrid_AMD );
      end;
  end;
end;

procedure Tf_almacenes_movimientos_000.Boton_Elegir_Almacen_DestinoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
  with SQLQuery_Principal do
  begin
    var_Registro := UTI_Abrir_Modulo_Almacenes( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
      FieldByName('id_almacenes_destino').AsString := Trim(var_Registro.id_1);
      Edit_Descripcion_Almacen_Destino.Text        := var_Registro.descripcion_1;
    end;
  end;
end;

procedure Tf_almacenes_movimientos_000.Editar_Registro_AMD;
var var_msg           : TStrings;
    var_Form          : Tf_almacenes_movimientos_001;
    var_record_Existe : Trecord_Existe;
    var_id            : ShortString;
begin
  if public_Solo_Ver = true then
  begin
    Exit;
  end;

  with SQLQuery_AMD do
  begin
    var_msg := TStringList.Create;

    if RecordCount > 0 then
    begin
      var_id := FieldByName('id').AsString;

      if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
      begin
        if UTI_RGTRO_isLock( 'almacenes_movimientos_detalles',
                             FieldByName('id').AsString,
                             true ) = true then
        begin
          Exit;
        end else
        begin
          if UTI_RGTRO_Lock( 'almacenes_movimientos_detalles',
                             FieldByName('id').AsString ) = true then
               Edit
          else Exit;
        end;

        var_Form := Tf_almacenes_movimientos_001.Create(nil);

        var_Form.para_Empezar_GroupBox_Registro;

        var_Form.ShowModal;
        if var_Form.public_Pulso_Aceptar = true then
        begin
          var_record_Existe := Existe_Articulo_Ya( FieldByName('id').AsString, // Estoy insertando/creando y lo que tengo que comprobar es que no exista la pwd en cualquier otro usuario, por lo que el campo id_Users no lo paso
                                                   FieldByName('id_almacenes_movimientos').AsString,
                                                   FieldByName('id_articulos').AsString );

          if var_record_Existe.Fallo_en_Conexion_BD = true then
          begin
            var_Form.Free;
            Cancel;
          end else
          begin
            if var_record_Existe.Existe = false then
            begin
              if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( SQLQuery_AMD ) = true then
              begin
                FieldByName('Change_WHEN').Value             := UTI_CN_Fecha_Hora;
                FieldByName('Change_Id_User').Value          := Form_Menu.public_User;

                FieldByName('id_almacenes_destino').AsString := SQLQuery_Principal.FieldByName('id_almacenes_destino').AsString;
                FieldByName('id_almacenes_origen').AsString  := SQLQuery_Principal.FieldByName('id_almacenes_origen').AsString;

                UTI_RGTRO_Grabar_Antes( 'almacenes_movimientos_detalles', SQLQuery_AMD );
              end else
              begin
                Cancel;
              end;

              var_Form.Free;
            end else begin
              var_Form.Free;
              Cancel;
              var_msg.Clear;

              var_msg.Add(rs_alm_mov_017);

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

        UTI_RGTRO_UnLock( 'almacenes_movimientos_detalles', var_id );
      end;
    end else
    begin
      var_msg.Add(rs_no_Hay_Rgtros);
      UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
    end;
  end;

  var_msg.Free;
end;

procedure Tf_almacenes_movimientos_000.DBGrid_AMDDblClick(Sender: TObject);
begin
  Editar_Registro_AMD;
end;

procedure Tf_almacenes_movimientos_000.DBGrid_AMDKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then Editar_Registro_AMD;
end;

function Tf_almacenes_movimientos_000.Existe_Articulo_Ya( param_id,
                                                             param_id_almacenes_movimientos,
                                                             param_id_articulos : String ) : Trecord_Existe;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
  try
    // ********************************************************************************************* //
    // ** Creamos la Transaccion y la conexión con el motor BD, y la abrimos                      ** //
    // ********************************************************************************************* //
    var_SQLTransaction := TSQLTransaction.Create(nil);
    var_SQLConnector   := TSQLConnector.Create(nil);

    if UTI_CN_Connector_Open( var_SQLTransaction,
                              var_SQLConnector ) = False then UTI_GEN_Salir;

    // ********************************************************************************************* //
    // ** Creamos la SQL Según el motor de BD                                                     ** //
    // ********************************************************************************************* //
    var_SQL := TStringList.Create;

    var_SQL.Add('SELECT amd.*' );
    var_SQL.Add(  'FROM almacenes_movimientos_detalles AS amd' );
    var_SQL.Add(' WHERE amd.id_articulos = ' +  Trim(param_id_articulos) );
    var_SQL.Add(  ' AND amd.id_almacenes_movimientos = ' +  Trim(param_id_almacenes_movimientos) );

    if Trim(param_id) <> '' then
    begin
      var_SQL.Add(  ' AND NOT amd.id = ' + Trim(param_id) );
    end;

    var_SQL.Add(' ORDER BY amd.id_almacenes_movimientos ASC, amd.id_articulos ASC, amd.Unidades ASC' );

    // ********************************************************************************************* //
    // ** Abrimos la tabla                                                                        ** //
    // ********************************************************************************************* //
    var_SQLQuery      := TSQLQuery.Create(nil);
    var_SQLQuery.Name := 'SQLQuery_Existe_Articulo_Ya';

    if UTI_TB_Query_Open( '', '', '',
                          var_SQLConnector,
                          var_SQLQuery,
                          -1, // asi me trae todos los registros de golpe
                          var_SQL.Text ) = False then UTI_GEN_Salir;

    // ********************************************************************************************* //
    // ** TRABAJAMOS CON LOS REGISTROS DEVUELTOS                                                  ** //
    // ********************************************************************************************* //
    // ** Si el módulo no se creó, no se permite entrar en él ... Result := False                 ** //
    // ********************************************************************************************* //
    Result.Fallo_en_Conexion_BD := false;
    Result.Existe               := false;
    Result.deBaja               := 'N';

    if var_SQLQuery.RecordCount > 0 then
    begin
      Result.Existe := true;
      if not var_SQLQuery.FieldByName('Del_WHEN').IsNull then Result.deBaja := 'S';
    end;

    // ********************************************************************************************* //
    // ** Cerramos la tabla                                                                       ** //
    // ********************************************************************************************* //
    if UTI_TB_Cerrar( var_SQLConnector,
                      var_SQLTransaction,
                      var_SQLQuery ) = false then UTI_GEN_Salir;

    var_SQLQuery.Free;

    var_SQL.Free;

    var_SQLTransaction.Free;
    var_SQLConnector.Free;
  except
    on error : Exception do
    begin
      UTI_GEN_Error_Log( rs_alm_mov_018 + var_SQLQuery.Name +
                         rs_alm_mov_019 + Screen.ActiveForm.Name,
                         error );
      try
        var_SQL.Free;
        var_SQLTransaction.Free;
        var_SQLConnector.Free;
        var_SQLQuery.Free;
      except
      end;

      Result.Fallo_en_Conexion_BD := true;
    end;
  end;
end;

procedure Tf_almacenes_movimientos_000.Insertar_Registro_AMD;
var var_msg           : TStrings;
    var_Form          : Tf_almacenes_movimientos_001;
    var_record_Existe : Trecord_Existe;
begin
  if public_Solo_Ver = true then
  begin
    Exit;
  end;

  with SQLQuery_AMD do
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

        FieldByName('id_almacenes_movimientos').AsString := SQLQuery_Principal.FieldByName('id').AsString;

        FieldByName('id_almacenes_destino').AsString     := SQLQuery_Principal.FieldByName('id_almacenes_destino').AsString;
        FieldByName('id_almacenes_origen').AsString      := SQLQuery_Principal.FieldByName('id_almacenes_origen').AsString;

        var_Form := Tf_almacenes_movimientos_001.Create(nil);

        var_Form.para_Empezar_GroupBox_Registro;

        var_Form.ShowModal;
        if var_Form.public_Pulso_Aceptar = true then
        begin
          var_Form.Free;
          var_record_Existe := Existe_Articulo_Ya( '', // Estoy insertando/creando y lo que tengo que comprobar es que no exista la pwd en cualquier otro usuario, por lo que el campo id_Users no lo paso
                                                   FieldByName('id_almacenes_movimientos').AsString,
                                                   FieldByName('id_articulos').AsString );

          if var_record_Existe.Fallo_en_Conexion_BD = true then
          begin
            // var_Form.Free;
            Cancel;
          end
          else
          begin
            if var_record_Existe.Existe = false then
            begin
              FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
              FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

              UTI_RGTRO_Grabar_Antes( 'almacenes_movimientos_detalles', SQLQuery_AMD );
            end
            else
            begin
              Cancel;
              var_msg.Clear;

              var_msg.Add(rs_alm_mov_017);

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

procedure Tf_almacenes_movimientos_000.Borrar_Registro_AMD;
begin
  if public_Solo_Ver = true then
  begin
    Exit;
  end;

  if UTI_USR_Permiso_SN(public_Menu_Worked, 'B', True) = True then
  begin
    UTI_RGTRO_Borrar( 'almacenes_movimientos_detalles',
                      f_almacenes_movimientos_000.SQLQuery_AMD,
                      public_Solo_Ver,
                      public_Menu_Worked );
  end;
end;

procedure Tf_almacenes_movimientos_000.Refrescar_Registros_AMD;
var var_Lineas_Filtro            : TStrings;
    var_Lineas_OrderBy           : TStrings;

    var_id_almacenes_movimientos : Largeint;
    var_id_articulos             : Largeint;
    var_Unidades                 : Extended;

    var_Hay_Datos                : Boolean;

    var_ver_Bajas                : ShortInt;
begin
    // ********************************************************************************************* //
    // ** Solo si la cabecera está en modo EDIT se abren las tablas hijas                         ** //
    // ********************************************************************************************* //
    if SQLQuery_Principal.State <> dsEdit then Exit;

    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_Hay_Datos := false;

    if SQLQuery_AMD.RecordCount > 0 then
    begin
        var_Hay_Datos                := true;
        var_id_almacenes_movimientos := SQLQuery_AMD.FieldByName('id_almacenes_movimientos').Value;
        var_id_articulos             := SQLQuery_AMD.FieldByName('id_articulos').Value;
        var_Unidades                 := SQLQuery_AMD.FieldByName('Unidades').Value;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Clear;
    var_Lineas_OrderBy.Clear;

    if Trim(SQLQuery_Principal.FieldByName('id').AsString) <> '' then
         var_Lineas_Filtro.Add('id_almacenes_movimientos = ' + Trim(SQLQuery_Principal.FieldByName('id').AsString))
    else var_Lineas_Filtro.Add('id_almacenes_movimientos = Null');

    var_ver_Bajas := RadioGroup_Bajas.ItemIndex;
    Filtrar_AMD( var_ver_Bajas,
                 false,
                 var_Lineas_Filtro,
                 var_Lineas_OrderBy );

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;

    if var_Hay_Datos = true then
    begin
         SQLQuery_AMD.Locate( 'id_almacenes_movimientos;id_articulos;Unidades',
                              VarArrayOf( [ var_id_almacenes_movimientos, var_id_articulos, var_Unidades ] ),
                              [] );
    end;
end;

procedure Tf_almacenes_movimientos_000.Refrescar_Registros_TablasLigadas;
begin
  Refrescar_Registros_AMD;
end;

function Tf_almacenes_movimientos_000.Filtrar_AMD( p_ver_bajas : ShortInt;
                                                      p_Cambiamos_Filtro : Boolean;
                                                      p_Lineas_Filtro,
                                                      p_Lineas_OrderBy : TStrings ) : ShortInt;
var
  var_a_Filtrar_Plus : TStrings;
begin
  var_a_Filtrar_Plus := TStringList.Create;
  var_a_Filtrar_Plus.Clear;

  Comprobar_si_Cambiamos_Orden( p_Lineas_OrderBy,
                                private_Order_By_AMD[0].Memo_OrderBy );

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  Result := UTI_TB_Filtrar( private_Order_By_AMD,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_AMD,
                                                          'almacenes_movimientos_detalles',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_AMD,
                                                          'almacenes_movimientos_detalles',
                                                          'i' ),

                            // var_ctdad_Rgtros,
                            -1,

                            SQLTransaction_Principal,
                            SQLConnector_Principal,
                            SQLQuery_AMD,

                            // name_tabla,
                            'amd',

                            p_ver_bajas,

                            // SELECT_SQL,
                            'SELECT amd.*,' + ' ' +
                                   'art.Tipo_de_articulo AS OT_Tipo_de_articulo,' + ' ' +
                                   'art.descripcion AS OT_descripcion_articulo' + ' ' +
                            'FROM almacenes_movimientos_detalles AS amd' + ' ' +

                            'LEFT JOIN articulos AS art' + ' ' +
                            'ON amd.id_articulos = art.id' + ' ',

                            p_Lineas_Filtro,
                            p_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            p_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_a_Filtrar_Plus.Free;
end;

procedure Tf_almacenes_movimientos_000.DBNavigator_AMDBeforeAction(Sender: TObject; Button: TDBNavButtonType);
begin
  case Button of
    nbInsert : begin
      Insertar_Registro_AMD;
      Abort;
    end;

    nbEdit : begin
      Editar_Registro_AMD;
      Abort;
    end;

    nbDelete : begin
      Borrar_Registro_AMD;
      Abort;
    end;

    nbRefresh : begin
      Refrescar_Registros_AMD;
      Abort;
    end;
  end;
end;

procedure Tf_almacenes_movimientos_000.Filtrar_Principal_queFiltro( var p_errores_Filtros : TStrings;
                                                                    var p_Registro_CRUD : TRegistro_CRUD;
                                                                    var p_ctdad_Rgtros  : Integer;
                                                                    var p_a_Filtrar     : TStrings );
begin
  p_ctdad_Rgtros             := -1;
  p_Registro_CRUD.name_tabla := 'am';
  p_Registro_CRUD.Delete_SQL := '';
  p_Registro_CRUD.Update_SQL := UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Principal,
                                                              'almacenes_movimientos',
                                                              'u' );

  p_Registro_CRUD.Insert_SQL := UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Principal,
                                                              'almacenes_movimientos',
                                                              'i' );

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  p_Registro_CRUD.SELECT_SQL := 'SELECT am.*,' + ' ' +

                                       'ad.descripcion AS OT_descripcion_almacen_destino,' + ' ' +
                                       'ao.descripcion AS OT_descripcion_almacen_origen,' + ' ' +

                                       'cat.descripcion AS OT_descripcion_conceptos_almacen_traspaso' + ' ' +

                                'FROM almacenes_movimientos AS am' + ' ' +

                                'LEFT JOIN almacenes AS ad' + ' ' +
                                'ON am.id_almacenes_destino = ad.id' + ' ' +

                                'LEFT JOIN almacenes AS ao' + ' ' +
                                'ON am.id_almacenes_origen = ao.id' + ' ' +

                                'LEFT JOIN conceptos_almacen_traspaso AS cat' + ' ' +
                                'ON am.id_conceptos_almacen_traspaso = cat.id' + ' ';

  Filtrar_Principal_queFiltro_sus_Filtros( p_errores_Filtros, p_Registro_CRUD, p_ctdad_Rgtros, p_a_Filtrar );
end;

procedure Tf_almacenes_movimientos_000.Filtrar_tablas_adicionales( var p_Lineas_Filtro : TStrings;
                                                                   var p_Lineas_OrderBy : TStrings );
var
  var_SQL_ADD : TStrings;
begin
  var_SQL_ADD := TStringList.Create;

  // ********************************************************************************************* //
  // ** ALMACENES MOVIMIENTOS DETALLES                                                          ** //
  // ********************************************************************************************* //
  var_SQL_ADD.Clear;
  var_SQL_ADD.Add( 'amd.id_almacenes_movimientos = ' + SQLQuery_Principal.FieldByName('id').AsString );
  UTI_TB_SQL_ADD( true,
                  p_Lineas_Filtro,
                  var_SQL_ADD );

  p_Lineas_OrderBy.Clear;

  Filtrar_AMD( RadioGroup_Bajas.ItemIndex,
               false,
               p_Lineas_Filtro,
               p_Lineas_OrderBy );
  var_SQL_ADD.Free;
end;

procedure Tf_almacenes_movimientos_000.SQLQuery_AMDAfterPost(DataSet: TDataSet);
begin
  UTI_RGTROS_Grabar( 'almacenes_movimientos_detalles',
                     SQLTransaction_Principal,
                     SQLQuery_AMD,
                     Devolver_hacemos_commit_alFinalizar );

  Refrescar_Registros_AMD;
end;

procedure Tf_almacenes_movimientos_000.SQLQuery_AMDBeforeEdit(DataSet: TDataSet);
begin
  UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_AMD );
end;

procedure Tf_almacenes_movimientos_000.SQLQuery_AMDBeforePost(DataSet: TDataSet);
begin
  UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_AMD );
end;

procedure Tf_almacenes_movimientos_000.Antes_del_Post_Principal_Sin_Rellenar_Permitido_SI( p_msg : TStrings );
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

procedure Tf_almacenes_movimientos_000.Antes_del_Post_Principal_Asignar_Valores;
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

procedure Tf_almacenes_movimientos_000.Antes_del_Post_Principal_Sin_Rellenar_Permitido_NO( p_msg,
                                                                                           p_msg_Comprobar : TStrings );
begin
  // *********************************************************************************************** //
  // ** Ahora vienen las comprobaciones de porque no grabamos                                     ** //
  // *********************************************************************************************** //
  with SQLQuery_Principal do
  begin

    if FieldByName('Fecha_Movimiento').IsNull then
    begin
      p_msg.Add(rs_alm_mov_009);
    end else begin
      FieldByName('Fecha_Movimiento').asstring := FieldByName('Fecha_Movimiento').asstring;
    end;

    if Trim(FieldByName('id_almacenes_destino').AsString) = '' then
    begin
      p_msg.Add(rs_alm_mov_010);
    end;

    if Trim(FieldByName('Tipo_Movimiento').AsString) = '' then
    begin
      p_msg.Add(rs_alm_mov_013);
    end
    else
    begin
      if (Trim(FieldByName('Tipo_Movimiento').AsString) = '2')     and
         (Trim(FieldByName('id_almacenes_origen').AsString) <> '') then
      begin
        p_msg.Add(rs_alm_mov_011);
      end;

      if (Trim(FieldByName('Tipo_Movimiento').AsString) = '1')     and
         (Trim(FieldByName('id_almacenes_origen').AsString) = '') then
      begin
        p_msg.Add(rs_alm_mov_012);
      end;
    end;

  end;

end;

procedure Tf_almacenes_movimientos_000.NewRecord_Insert_SQLQuery_Principal;
begin
  { Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo

  with SQLQuery_Principal do
  begin
    // ********************************************************************************************* //
    // ** Asignamos valores de iniciosi no los tenían                                             ** //
    // ********************************************************************************************* //
    FieldByName('numero_siguiente').AsString := '1';

  end;
}
end;

procedure Tf_almacenes_movimientos_000.Campo_Foco_en_modo_Edicion_Inserccion;
begin
  Self.ActiveControl := DBDateTimePicker_Fecha_Movimiento;
end;

function Tf_almacenes_movimientos_000.Fue_Utilizado_Rgtro_SQLQuery_Principal : ShortInt;
begin
  Result := 0;

end;

end.

