unit impuestos_000;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, ComCtrls, DbCtrls, DBGrids, ButtonPanel, plantilla_000, utilidades_datos_tablas, variants,
  utilidades_rgtro, utilidades_general, utilidades_bd, utilidades_forms_Filtrar, utilidades_usuarios,
  utilidades_impuestos, Grids, utilidades_contabilidad;

resourcestring
  rs_impto_001 = 'No se puede añadir una composición si ya el impuesto tiene %';
  rs_impto_002 = 'Error.-';
  rs_impto_003 = 'No se puede añadir un impuesto que ya es un impuesto compuesto';
  rs_impto_004 = '* El % del impuesto.';
  rs_impto_005 = 'SE AVISA POR FALTA.-';
  rs_impto_006 = '* La descripción.';
  rs_impto_007 = '* Si se suma al total de factura o no.';
  rs_impto_008 = 'LA CUENTA CONTABLE';
  rs_impto_009 = 'AVISAMOS DE ... ';
  rs_impto_010 = 'Error al comprobar si el impuesto existe ya como composición del impuesto cabecera. La tabla ha sido ';
  rs_impto_011 = ' desde el módulo ';
  rs_impto_012 = 'Error al CREAR la composición ';
  rs_impto_013 = ' para el impuesto ';
  rs_impto_014 = '. La tabla ha sido ';
  rs_impto_015 = ' desde el módulo ';
  rs_impto_016 = 'No se pudo grabar el histórico de los cambios realizados al añadir al impuesto ';
  rs_impto_017 = ' como composición suya el impuesto ';
  rs_impto_018 = 'ERROR ... ';
  rs_impto_019 = 'No se puede borrar';
  rs_impto_020 = 'Este impuesto fue usado ya, no podemos borrarle ninguna línea de su composición.';
  rs_impto_021 = 'No se pudo comprobar si está usado el impuesto.';

type

  { Tf_impuestos_000 }

  Tf_impuestos_000 = class(Tform_plantilla_000)
    BitBtn_Ver_Situacion_Registro_Composiciones: TBitBtn;
    DataSource_ImptosComp: TDataSource;
    DBCheckBox_IVA_con_Recargo_SN: TDBCheckBox;
    DBEdit_Cuenta_Contable: TDBEdit;
    DBEdit_Descripcion: TDBEdit;
    DBEdit_Tanto_Por_Ciento: TDBEdit;
    DBGrid_Impuestos_Composiciones: TDBGrid;
    DBNavigator_Impuestos_Composiciones: TDBNavigator;
    GroupBox_Impuestos_Composicion: TGroupBox;
    Image_Compuesto: TImage;
    Label17: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    SQLQuery_Impuestosid1: TLargeintField;
    SQLQuery_ImptosComp: TSQLQuery;
    SQLQuery_ImptosCompChange_Id_User: TLargeintField;
    SQLQuery_ImptosCompChange_WHEN: TDateTimeField;
    SQLQuery_ImptosCompDel_Id_User: TLargeintField;
    SQLQuery_ImptosCompDel_WHEN: TDateTimeField;
    SQLQuery_ImptosCompDel_WHY: TStringField;
    SQLQuery_ImptosCompid_impuestos: TLargeintField;
    SQLQuery_ImptosCompid_impuestos_al_que_pertenece: TLargeintField;
    SQLQuery_ImptosCompInsert_Id_User: TLargeintField;
    SQLQuery_ImptosCompInsert_WHEN: TDateTimeField;
    SQLQuery_ImptosCompOT_Cuenta_Contable: TStringField;
    SQLQuery_ImptosCompOT_descripcion_impuesto: TStringField;
    SQLQuery_ImptosCompOT_Sumado_A_Ftra_SN: TStringField;
    SQLQuery_ImptosCompOT_Tanto_Por_Ciento: TBCDField;
    SQLQuery_PrincipalChange_Id_User: TLargeintField;
    SQLQuery_PrincipalChange_WHEN: TDateTimeField;
    SQLQuery_PrincipalCuenta_Contable: TStringField;
    SQLQuery_PrincipalDel_Id_User: TLargeintField;
    SQLQuery_PrincipalDel_WHEN: TDateTimeField;
    SQLQuery_PrincipalDel_WHY: TStringField;
    SQLQuery_Principaldescripcion: TStringField;
    SQLQuery_PrincipalInsert_Id_User: TLargeintField;
    SQLQuery_PrincipalInsert_WHEN: TDateTimeField;
    SQLQuery_PrincipalSumado_A_Ftra_SN: TStringField;
    SQLQuery_PrincipalTanto_Por_Ciento: TBCDField;

    procedure Campo_Foco_en_modo_Edicion_Inserccion; override;
    procedure NewRecord_Insert_SQLQuery_Principal; override;
    procedure Antes_del_Post_Principal_Sin_Rellenar_Permitido_SI( p_msg : TStrings ); override;
    procedure Antes_del_Post_Principal_Sin_Rellenar_Permitido_NO( p_msg, p_msg_Comprobar : TStrings ); override;
    procedure Antes_del_Post_Principal_Asignar_Valores; override;
    procedure Filtrar_tablas_adicionales( var p_Lineas_Filtro : TStrings; var p_Lineas_OrderBy : TStrings ); override;
    procedure Presentar_Datos_GroupBox_Registro; override;
    procedure Filtrar_Principal_queFiltro( var p_errores_Filtros : TStrings; var p_Registro_CRUD : TRegistro_CRUD; var p_ctdad_Rgtros : Integer; var p_a_Filtrar : TStrings ); override;
    procedure Cambiar_Nombre_Tabla_Principal; override;
    procedure Cambiar_Titulo_Form; override;
    procedure Rellenar_Filtros_Impresion(var p_Ordenado_por : String); override;
    procedure Crear_tipos_orden_Principal; override;
    procedure Crear_OrderBy_tablas_adicionales; override;
    procedure Refrescar_Registros; override;
    procedure Presentar_Datos; override;
    procedure para_Empezar_GroupBox_Registro; override;
    procedure Cambiar_WindowState; override;
    procedure Abrir_Conexiones_con_BD_TablasAdicionales; override;
    procedure Cerramos_Tablas_Ligadas; override;
    procedure Refrescar_Registros_TablasLigadas; override;
    procedure Dibujar_Grid_Principal( p_Sender: TObject; const p_Rect: TRect; p_DataCol: Integer; p_Column: TColumn; p_State: TGridDrawState ); override;

    procedure Borrar_Impuesto_a_Composiciones;
    procedure Cauto_Composicion_Y_Guardo_en_Historico_sus_Cambios( p_id_impuestos, p_id_impuestos_al_que_pertenece, p_descripcion : ShortString );
    procedure Asignar_Impuesto_a_Composiciones;
    function  Asignar_Impuesto_a_Composiciones_2( p_id_impuestos, p_descripcion_impuestos, p_id_impuestos_al_que_pertenece, p_descripcion_impuestos_al_que_pertenece : String ) : Boolean;
    procedure BitBtn_Ver_Situacion_Registro_ComposicionesClick(Sender: TObject);
    procedure DBGrid_Impuestos_ComposicionesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBNavigator_Impuestos_ComposicionesBeforeAction(Sender: TObject; Button: TDBNavButtonType);
    function  Filtrar_impuestos_composiciones( p_ver_bajas : ShortInt; p_Cambiamos_Filtro : Boolean; p_Lineas_Filtro, p_Lineas_OrderBy : TStrings ) : ShortInt;
    function  Existe_Impuesto_Composicion_Ya( p_id_impuestos, p_id_impuestos_al_que_pertenece : ShortString ) : Trecord_Existe;
    function  Elegir_Impuesto(p_familia : ShortString) : TRecord_Rgtro_Comun;
    procedure SQLQuery_ImptosCompAfterPost(DataSet: TDataSet);
    procedure SQLQuery_ImptosCompBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_ImptosCompBeforePost(DataSet: TDataSet);
    function  Fue_Utilizado_Rgtro_SQLQuery_Principal : ShortInt; override;

  private
    { private declarations }
    private_Order_By_composiciones : array of TOrder_By;

    procedure Refrescar_Registros_Composiciones;

  public
    { public declarations }

  end;

var
  f_impuestos_000: Tf_impuestos_000;

implementation

{$R *.lfm}

uses menu;

function Tf_impuestos_000.Filtrar_impuestos_composiciones( p_ver_bajas : ShortInt;
                                                           p_Cambiamos_Filtro : Boolean;
                                                           p_Lineas_Filtro,
                                                           p_Lineas_OrderBy : TStrings ) : ShortInt;
var
  var_a_Filtrar_Plus : TStrings;
begin
  var_a_Filtrar_Plus := TStringList.Create;
  var_a_Filtrar_Plus.Clear;

  Comprobar_si_Cambiamos_Orden( p_Lineas_OrderBy,
                                private_Order_By_composiciones[0].Memo_OrderBy );

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  Result := UTI_TB_Filtrar( private_Order_By_composiciones,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_ImptosComp,
                                                          'impuestos_composiciones',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_ImptosComp,
                                                          'impuestos_composiciones',
                                                          'i' ),

                            // var_ctdad_Rgtros,
                            -1,

                            SQLTransaction_Principal,
                            SQLConnector_Principal,
                            SQLQuery_ImptosComp,

                            // name_tabla,
                            'ic',

                            p_ver_bajas,

                            // SELECT_SQL,
                            'SELECT ic.*,' + ' ' +

                                   'i.descripcion AS OT_descripcion_impuesto,' + ' ' +
                                   'i.Cuenta_Contable AS OT_Cuenta_Contable,' + ' ' +
                                   'i.Sumado_A_Ftra_SN AS OT_Sumado_A_Ftra_SN,' + ' ' +
                                   'i.Tanto_Por_Ciento AS OT_Tanto_Por_Ciento' + ' ' +

                            'FROM impuestos_composiciones AS ic' + ' ' +

                            'LEFT JOIN impuestos AS i' + ' ' +
                            'ON ic.id_impuestos = i.id' + ' ',

                            p_Lineas_Filtro,
                            p_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            p_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_a_Filtrar_Plus.Free;
end;

procedure Tf_impuestos_000.Refrescar_Registros;
var var_descripcion : String;
begin
  var_descripcion := '';

  if SQLQuery_Principal.RecordCount > 0 then
  begin
    var_descripcion := SQLQuery_Principal.FieldByName('descripcion').Value;
  end;

  Filtrar_Principal_Sin_Preguntar;

  if Trim(var_descripcion) <> '' then
  begin
    SQLQuery_Principal.Locate( 'descripcion',
                               var_descripcion,
                               [] );
  end;
end;

procedure Tf_impuestos_000.Refrescar_Registros_Composiciones;
var var_Lineas_Filtro                 : TStrings;
    var_Lineas_OrderBy                : TStrings;
    var_id_impuestos_al_que_pertenece : Int64;
    var_id_impuestos                  : Int64;
    var_ver_Bajas                     : ShortInt;
begin
  // ********************************************************************************************* //
  // ** Solo si la cabecera está en modo EDIT se abren las tablas hijas                         ** //
  // ********************************************************************************************* //
  if SQLQuery_Principal.State <> dsEdit then Exit;

  // ********************************************************************************************* //
  // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
  // ********************************************************************************************* //
  var_id_impuestos_al_que_pertenece := 0;
  var_id_impuestos                  := 0;

  if SQLQuery_ImptosComp.RecordCount > 0 then
  begin
    var_id_impuestos_al_que_pertenece := SQLQuery_ImptosComp.FieldByName('id_impuestos_al_que_pertenece').Value;
    var_id_impuestos                  := SQLQuery_ImptosComp.FieldByName('id_impuestos').Value;
  end;

  var_Lineas_Filtro  := TStringList.Create;
  var_Lineas_OrderBy := TStringList.Create;

  var_Lineas_Filtro.Clear;
  var_Lineas_OrderBy.Clear;

  if Trim(SQLQuery_Principal.FieldByName('id').AsString) <> '' then
       var_Lineas_Filtro.Add('ic.id_impuestos_al_que_pertenece = ' + Trim(SQLQuery_Principal.FieldByName('id').AsString))
  else var_Lineas_Filtro.Add('ic.id_impuestos_al_que_pertenece = Null');

  var_ver_Bajas := RadioGroup_Bajas.ItemIndex;
  Filtrar_impuestos_composiciones( var_ver_Bajas,
                                   false,
                                   var_Lineas_Filtro,
                                   var_Lineas_OrderBy );

  var_Lineas_Filtro.Free;
  var_Lineas_OrderBy.Free;

  if var_id_impuestos_al_que_pertenece <> 0 then
  begin
    SQLQuery_ImptosComp.Locate( 'id_impuestos_al_que_pertenece;id_impuestos',
                                             VarArrayOf( [ var_id_impuestos_al_que_pertenece,
                                                           var_id_impuestos ] ),
                                             [] );
  end;
end;

procedure Tf_impuestos_000.Abrir_Conexiones_con_BD_TablasAdicionales;
begin
  { Hacer algo parecido a lo de abajo ... pero ojito sólo si hay otras transacciones y otros conectores.
    Lo lógico es que nada más que usemos los de la conexión principal, aunque sean otras tablas adicionales.

  Abrir_Conexion_con_BD( SQLTransaction_ImptosComp, SQLConnector_ImptosComp);
  }
end;

procedure Tf_impuestos_000.Cambiar_Nombre_Tabla_Principal;
begin
  pubic_nombre_tabla_Principal := 'impuestos';
end;

procedure Tf_impuestos_000.Cambiar_Titulo_Form;
begin
  Self.Caption := 'Mantenimiento de impuestos';
end;

procedure Tf_impuestos_000.Rellenar_Filtros_Impresion(var p_Ordenado_por : String);
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

procedure Tf_impuestos_000.Crear_tipos_orden_Principal;
begin
  SetLength(public_Order_By, 2);

  public_Order_By[0].Titulo       := 'Por la descripción'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
  public_Order_By[0].Memo_OrderBy := 'i.descripcion ASC';

  public_Order_By[1].Titulo       := 'Por la id';
  public_Order_By[1].Memo_OrderBy := 'i.id ASC';

  Memo_OrderBy.Lines.Text          := public_Order_By[0].Memo_OrderBy;

  UTI_TB_Rellenar_ComboBox_Orden( true,
                                  ComboBox_Filtros,
                                  public_Order_By,
                                  0 );
end;

procedure Tf_impuestos_000.Crear_OrderBy_tablas_adicionales;
begin
  // Tabla ligada composiciones
  SetLength(private_Order_By_composiciones, 1);

  private_Order_By_composiciones[0].Titulo       := 'Por la id del impuesto'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
  private_Order_By_composiciones[0].Memo_OrderBy := 'ic.id_impuestos_al_que_pertenece ASC, ic.id_impuestos ASC';
end;

procedure Tf_impuestos_000.Presentar_Datos;
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

procedure Tf_impuestos_000.para_Empezar_GroupBox_Registro;
begin
  with SQLQuery_Principal do
  begin
    public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                       '',
                                                       '',

                                                       FieldByName('descripcion').AsString,
                                                       FieldByName('Tanto_Por_Ciento').AsString,
                                                       FieldByName('Sumado_A_Ftra_SN').AsString );
  end;

  Presentar_Datos_GroupBox_Registro;
end;

procedure Tf_impuestos_000.Cambiar_WindowState;
begin
  Self.WindowState := wsNormal; // Puede ser wsNormal, wsFullScreen, wsMaximized o wsMinimized
end;

procedure Tf_impuestos_000.Cerramos_Tablas_Ligadas;
begin
  Cerrar_Tabla( Nil,
                Nil,
                SQLQuery_ImptosComp );
end;

procedure Tf_impuestos_000.Refrescar_Registros_TablasLigadas;
begin
  Refrescar_Registros_Composiciones;
end;

procedure Tf_impuestos_000.Dibujar_Grid_Principal( p_Sender: TObject;
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

    // ********************************************************************************************* //
    // ** Primero comprobamos si es un registro dado de baja o no                                 ** //
    // ********************************************************************************************* //
    if not SQLQuery_Principal.FieldByName('Del_WHEN').IsNull then
    begin
      // ******************************************************************************************* //
      // ** Registro DADO de BAJA                                                                 ** //
      // ******************************************************************************************* //
      Canvas.Font.Color := clSilver;
    end else begin
      // ******************************************************************************************* //
      // ** Registro DADO de ALTA, NO BAJA                                                        ** //
      // ******************************************************************************************* //
      // ** Así que las pinto, pero sólo si no son las columnas que van a ser dibujadas           ** //
      // ******************************************************************************************* //
      if p_State <> [gdSelected] then
      begin
        if (p_Column.FieldName <> 'COLUMNA_CON_IMAGEN') then
        begin
          Canvas.font.Color := clBlack;
        end;
      end;
    end;

    // ********************************************************************************************* //
    // ** Ahora paso a dibujar una celda normal con los colores elegidos o una dibujada           ** //
    // ********************************************************************************************* //
    if (p_Column.FieldName <> 'COLUMNA_CON_IMAGEN') then
    begin
      // ******************************************************************************************* //
      // ** No es una de las columnas a dibujar por lo que la pinto con los colores elegidos      ** //
      // ******************************************************************************************* //
      DefaultDrawColumnCell(p_Rect, p_DataCol, p_Column, p_State)
    end else begin
      // ******************************************************************************************* //
      // ** Es una de las columnas a dibujar                                                      ** //
      // ******************************************************************************************* //
      if p_Column.FieldName = 'COLUMNA_CON_IMAGEN'  then
      begin
        if SQLQuery_Principal.FieldByName('Tanto_Por_Ciento').AsString = '' then
        begin
          Canvas.StretchDraw(p_Rect, Image_Compuesto.Picture.Graphic);
        end;
      end;
    end;

    Canvas.Font.Color := var_Color_Normal;
  end;
end;

procedure Tf_impuestos_000.Asignar_Impuesto_a_Composiciones;
var var_Registro      : TRecord_Rgtro_Comun;
    var_msg           : TStrings;
    var_record_Existe : Trecord_Existe;
begin
  var_msg := TStringList.Create;

  if Trim(DBEdit_Tanto_Por_Ciento.Text) <> '' then
  begin
    var_msg.Add(rs_impto_001);
    UTI_GEN_Aviso(true, var_msg, rs_impto_002, True, False);

    var_msg.Free;
    Exit;
  end;

  with SQLQuery_ImptosComp do
  begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
    begin
      var_Registro := Elegir_Impuesto(SQLQuery_Principal.FieldByName('id').AsString);

      if var_Registro.id_1 <> '' then
      begin
        if Trim(var_Registro.descripcion_2) = '' then
        begin
          var_msg.Add(rs_impto_003);
          UTI_GEN_Aviso(true, var_msg, rs_impto_002, True, False);

          var_msg.Free;
          Exit;
        end;

        var_record_Existe := Existe_Impuesto_Composicion_Ya( var_Registro.id_1,
                                                             SQLQuery_Principal.FieldByName('id').asString );

        if var_record_Existe.Fallo_en_Conexion_BD = true then
        begin
        end else begin
          if var_record_Existe.Existe = false then
          begin
            if Asignar_Impuesto_a_Composiciones_2( var_Registro.id_1,
                                                   var_Registro.descripcion_1,
                                                   SQLQuery_Principal.FieldByName('id').AsString,
                                                   SQLQuery_Principal.FieldByName('descripcion').asString ) = true then
            begin
              // ********************************************************************* //
              // ** Si se consiguió asignar la subfamilia a la familia, lo que hace-** //
              // ** mos es refrescar la tabla de subfamilias, buscar el registro re-** //
              // ** cién creado y guardar los cambios realizados sobre el registro  ** //
              // ** en el historico de cambios                                      ** //
              // ********************************************************************* //
              Refrescar_Registros_Composiciones;


              with SQLQuery_ImptosComp do
              begin
                Locate( 'id_impuestos_al_que_pertenece;id_impuestos',
                       VarArrayOf( [ SQLQuery_Principal.FieldByName('id').Value,
                                     StrToInt64(var_Registro.id_1) ] ),
                       [] );
              end;

              with SQLQuery_Principal do
              begin
                Cauto_Composicion_Y_Guardo_en_Historico_sus_Cambios( var_Registro.id_1,
                                                                     SQLQuery_Principal.FieldByName('id').asString,
                                                                     var_Registro.descripcion_1 );
              end;
            end;
          end else begin
            var_msg.Clear;

            var_msg.Add( 'Composición repetida.');

            if UpperCase(var_record_Existe.deBaja) = 'S' then
            begin
              var_msg.Add(rs_Rgtro_Borrado);
            end;

            UTI_GEN_Aviso(true, var_msg, rs_Ya_Existe, True, False);
          end;
        end;
      end;

    end;

    var_msg.Free;
  end;
end;

function Tf_impuestos_000.Existe_Impuesto_Composicion_Ya( p_id_impuestos,
                                                             p_id_impuestos_al_que_pertenece : ShortString ) : Trecord_Existe;
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

    var_SQL.Add('SELECT i.*' );
    var_SQL.Add(  'FROM impuestos_composiciones AS i' );

    var_SQL.Add(' WHERE i.id_impuestos_al_que_pertenece = ' +  Trim(p_id_impuestos_al_que_pertenece) );
    var_SQL.Add(  ' AND i.id_impuestos = ' +  Trim(p_id_impuestos) );

    var_SQL.Add(' ORDER BY i.id_impuestos_al_que_pertenece ASC, id_impuestos ASC' );

    // ********************************************************************************************* //
    // ** Abrimos la tabla                                                                        ** //
    // ********************************************************************************************* //
    var_SQLQuery      := TSQLQuery.Create(nil);
    var_SQLQuery.Name := 'SQLQuery_Existe_Impuesto_Composicion_Ya';

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
      UTI_GEN_Error_Log( rs_impto_010 + var_SQLQuery.Name + rs_impto_011 + Screen.ActiveForm.Name,
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

function Tf_impuestos_000.Asignar_Impuesto_a_Composiciones_2( p_id_impuestos,
                                                                 p_descripcion_impuestos,
                                                                 p_id_impuestos_al_que_pertenece,
                                                                 p_descripcion_impuestos_al_que_pertenece : String ) : Boolean;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
    var_Fecha          : ShortString;
begin
  Result := true;

  Try
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

    var_Fecha := UTI_GEN_Format_Fecha_Hora(UTI_CN_Fecha_Hora, true);

    var_SQL.Add( 'INSERT INTO impuestos_composiciones' );
    var_SQL.Add(      '( id_impuestos_al_que_pertenece,' );
    var_SQL.Add(        'id_impuestos,' );

    var_SQL.Add(        'Insert_WHEN,' );
    var_SQL.Add(        'Insert_Id_User )' );
    var_SQL.Add( 'VALUES' );
    var_SQL.Add(      '( '  + Trim(p_id_impuestos_al_que_pertenece) + ',' );
    var_SQL.Add(              Trim(p_id_impuestos) + ',' );

    var_SQL.Add(              UTI_GEN_Comillas(UTI_GEN_Format_Fecha_Hora(UTI_CN_Fecha_Hora, true)) + ',' );
    var_SQL.Add(              IntToStr(Form_Menu.public_User) + ' )' );

    // ********************************************************************************************* //
    // ** Abrimos la tabla                                                                        ** //
    // ********************************************************************************************* //
    var_SQLQuery          := TSQLQuery.Create(nil);

    var_SQLQuery.Database := var_SQLConnector;
    var_SQLQuery.SQL.Text := var_SQL.Text;

    var_SQLQuery.Name     := 'SQLQuery_Asignar_Impuesto_a_Composiciones_2';


    var_SQLQuery.ExecSQL;
    var_SQLTransaction.Commit;


    // ********************************************************************************************* //
    // ** Destruimos la tabla y conexiones                                                        ** //
    // ********************************************************************************************* //
    var_SQLQuery.Free;
    var_SQL.Free;

    // ********************************************************************************************* //
    // ** Cerramos La transacción y la conexión con la BD                                         ** //
    // ********************************************************************************************* //
    if UTI_CN_Connector_Close( var_SQLTransaction,
                               var_SQLConnector ) = False then UTI_GEN_Salir;

    var_SQLTransaction.Free;
    var_SQLConnector.Free;
  Except
    on error : Exception do
    begin
      UTI_GEN_Error_Log( rs_impto_012 + Trim(p_descripcion_impuestos) +
                         rs_impto_013 + Trim(p_descripcion_impuestos_al_que_pertenece) +
                         rs_impto_014 + var_SQLQuery.Name + rs_impto_015 + Screen.ActiveForm.Name,
                         error );
      try
        var_SQL.Free;
        var_SQLTransaction.Free;
        var_SQLConnector.Free;
        var_SQLQuery.Free;
      except
      end;

      Result := false
    end;
  end;
end;

procedure Tf_impuestos_000.Cauto_Composicion_Y_Guardo_en_Historico_sus_Cambios( p_id_impuestos,
                                                                                   p_id_impuestos_al_que_pertenece,
                                                                                   p_descripcion : ShortString );
var var_SQL : TStrings;
begin
    // ********************************************************************* //
    // ** Esto lo hago porque puede ser que los criterios de filtrado me  ** //
    // ** eviten filtrar el registro recien creado                        ** //
    // ********************************************************************* //
    var_SQL := TStringList.Create;

    var_SQL.Add('SELECT i.*' );
    var_SQL.Add(  'FROM impuestos_composiciones AS i' );

    var_SQL.Add(' WHERE i.id_impuestos_al_que_pertenece = ' +  Trim(p_id_impuestos_al_que_pertenece) );
    var_SQL.Add(  ' AND i.id_impuestos = ' +  Trim(p_id_impuestos) );

    var_SQL.Add(' ORDER BY i.id_impuestos_al_que_pertenece ASC, id_impuestos ASC' );

    if UTI_RGTRO_Buscar_Rgtro_y_Grabar_Cambios_en_Historico( 'SQLQuery_Impuestos_Composiciones',
                                                             var_SQL ) = false then
    begin
        var_SQL.Clear;

        var_SQL.Add( rs_impto_016 + Trim(SQLQuery_Principal.FieldByName('descripcion').AsString) +
                     rs_impto_017 + Trim(p_descripcion) );

        UTI_GEN_Aviso(true, var_SQL, rs_impto_018, True, False);
    end;

    var_SQL.Free;
end;

procedure Tf_impuestos_000.Borrar_Impuesto_a_Composiciones;
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
        UTI_RGTRO_Borrar( 'impuestos_composiciones',
                          SQLQuery_ImptosComp,
                          public_Solo_Ver,
                          public_Menu_Worked );
      end else begin
        var_msg := TStringList.Create;
        var_msg.Add(rs_impto_019);
        var_msg.Add(' ');

        if var_se_uso = 1 then
        begin
          var_msg.Add(rs_impto_020);
        end
        else begin
          var_msg.Add(rs_impto_021);
        end;

        UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        var_msg.Free;
      end;
    end;
  end;
end;

function Tf_impuestos_000.Elegir_Impuesto(p_familia : ShortString) : TRecord_Rgtro_Comun;
var var_msg : TStrings;
begin
  jerofa esto esta sustituido por UTI_Abrir_Modulo_Elegir_Impuestos
  y hay que hacer lo mismo con todos los elige

  Result.id_1 := '';

  if UTI_GEN_Form_Abierto_Ya('f_elegir_impuestos') = false then
  begin
    Application.CreateForm(Tf_elegir_impuestos, f_elegir_impuestos);

    f_elegir_impuestos.public_id_impuesto_que_no_tiene_que_aparecer := p_familia;

    f_elegir_impuestos.public_hacemos_commit_alFinalizar := '1';
    f_elegir_impuestos.public_Solo_Ver                   := true;
    f_elegir_impuestos.public_Elegimos                   := true;
    f_elegir_impuestos.public_Menu_Worked                := 201; // public_Menu_Worked;

    f_elegir_impuestos.para_Empezar;

    f_elegir_impuestos.ShowModal;

    if f_elegir_impuestos.public_Rgtro_Seleccionado = true then
    begin
      with f_elegir_impuestos.SQLQuery_Principal do
      begin
        Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                              '',
                                              '',

                                              FieldByName('descripcion').AsString,
                                              FieldByName('Tanto_Por_Ciento').AsString,
                                              FieldByName('Sumado_A_Ftra_SN').AsString );
      end;
    end;

    f_elegir_impuestos.Free;
  end else begin
    var_msg := TStringList.Create;
    var_msg.Add(rs_Modulo_Abierto);
    UTI_GEN_Aviso(true, var_msg, rs_impto_009, True, False);
    var_msg.Free;
    Exit;
  end;
end;

procedure Tf_impuestos_000.SQLQuery_ImptosCompBeforePost(DataSet: TDataSet);
begin
  UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_ImptosComp );
end;

procedure Tf_impuestos_000.SQLQuery_ImptosCompBeforeEdit(DataSet: TDataSet);
begin
  UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_ImptosComp );
end;

procedure Tf_impuestos_000.SQLQuery_ImptosCompAfterPost(DataSet: TDataSet);
begin
  UTI_RGTROS_Grabar( 'impuestos_composiciones',
                     SQLTransaction_Principal,
                     SQLQuery_ImptosComp,
                     Devolver_hacemos_commit_alFinalizar );

  Refrescar_Registros_Composiciones;
end;

procedure Tf_impuestos_000.DBNavigator_Impuestos_ComposicionesBeforeAction(Sender: TObject; Button: TDBNavButtonType);
begin
  case Button of
    nbInsert : begin
      Asignar_Impuesto_a_Composiciones;
      Abort;
    end;

    nbDelete : begin
      Borrar_Impuesto_a_Composiciones;
      Abort;
    end;

    nbRefresh : begin
      Refrescar_Registros_Composiciones;
      Abort;
    end;
  end;
end;

procedure Tf_impuestos_000.DBGrid_Impuestos_ComposicionesDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  UTI_GEN_Dibujar_Grid( Sender, SQLQuery_ImptosComp, Rect, DataCol, Column, State );
end;

procedure Tf_impuestos_000.BitBtn_Ver_Situacion_Registro_ComposicionesClick(Sender: TObject);
begin
  if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
  begin
    if SQLQuery_ImptosComp.RecordCount > 0 then
    begin
      UTI_RGTRO_Ver_Estado_Registro( 'impuestos_composiciones',
                                     SQLQuery_ImptosComp,
                                     DataSource_ImptosComp,
                                     DBGrid_Impuestos_Composiciones );
    end;
  end;
end;

procedure Tf_impuestos_000.Filtrar_tablas_adicionales( var p_Lineas_Filtro : TStrings;
                                                       var p_Lineas_OrderBy : TStrings );
var
  var_SQL_ADD : TStrings;
begin
  var_SQL_ADD := TStringList.Create;

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
end;

procedure Tf_impuestos_000.Presentar_Datos_GroupBox_Registro;
begin
  with SQLQuery_Principal do
  begin
    if RecordCount > 0 then
    begin
    end;
  end;
end;

procedure Tf_impuestos_000.Filtrar_Principal_queFiltro( var p_errores_Filtros : TStrings;
                                                        var p_Registro_CRUD : TRegistro_CRUD;
                                                        var p_ctdad_Rgtros  : Integer;
                                                        var p_a_Filtrar     : TStrings );
begin
  p_ctdad_Rgtros             := -1;
  p_Registro_CRUD.name_tabla := 'i';
  p_Registro_CRUD.Delete_SQL := '';
  p_Registro_CRUD.Update_SQL := UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Principal,
                                                              'impuestos',
                                                              'u' );

  p_Registro_CRUD.Insert_SQL := UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Principal,
                                                              'impuestos',
                                                              'i' );

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  p_Registro_CRUD.SELECT_SQL := 'SELECT i.*' + ' ' +
                                'FROM impuestos AS i' + ' ';

  Filtrar_Principal_queFiltro_sus_Filtros( p_errores_Filtros, p_Registro_CRUD, p_ctdad_Rgtros, p_a_Filtrar );
end;


procedure Tf_impuestos_000.Antes_del_Post_Principal_Sin_Rellenar_Permitido_SI( p_msg : TStrings );
begin
  // *********************************************************************************************** //
  // ** Ahora vienen las comprobaciones de porque no grabamos                                     ** //
  // *********************************************************************************************** //
  with SQLQuery_Principal do
  begin

    if Trim(FieldByName('Tanto_Por_Ciento').AsString) = '' then
    begin
      if SQLQuery_ImptosComp.RecordCount = 0 then
      begin
        p_msg.Add( rs_impto_004);
      end;
    end;

  end;

end;

procedure Tf_impuestos_000.Antes_del_Post_Principal_Sin_Rellenar_Permitido_NO( p_msg,
                                                                               p_msg_Comprobar : TStrings );
begin
  // *********************************************************************************************** //
  // ** Ahora vienen las comprobaciones de porque no grabamos                                     ** //
  // *********************************************************************************************** //
  with SQLQuery_Principal do
  begin

    if Trim(FieldByName('descripcion').AsString) = '' then
    begin
      p_msg.Add(rs_impto_006);
    end;

    if Trim(FieldByName('Sumado_A_Ftra_SN').AsString) = '' then
    begin
      p_msg.Add(rs_impto_007);
    end;

    form_Menu.Traer_Configuracion_APP;

    // ********************************************************************************************* //
    // ** Comprobamos que la cuenta contable es correcta                                          ** //
    // ********************************************************************************************* //
    p_msg_Comprobar.Clear;
    UTI_CONTA_esta_Cta_Ctble_BIEN( form_menu.public_User_Configuracion.Impuestos_Obligar_Cuenta_Contable_SN, //.... aqui tambien permitir el control de exigirlo o no
                                   p_msg_Comprobar,
                                   SQLQuery_Principal,
                                   '',
                                   'impuestos',
                                   'Cuenta_Contable',
                                   rs_impto_008 );

    if Trim(p_msg_Comprobar.Text) <> '' then
    begin
      p_msg.AddStrings( p_msg_Comprobar );
    end;

  end;

end;

procedure Tf_impuestos_000.Antes_del_Post_Principal_Asignar_Valores;
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

procedure Tf_impuestos_000.NewRecord_Insert_SQLQuery_Principal;
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

procedure Tf_impuestos_000.Campo_Foco_en_modo_Edicion_Inserccion;
begin
  Self.ActiveControl := DBEdit_Descripcion;
end;

function Tf_impuestos_000.Fue_Utilizado_Rgtro_SQLQuery_Principal : ShortInt;
var
  var_SQL : TStrings;
  v_id    : String;
begin
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

end.




