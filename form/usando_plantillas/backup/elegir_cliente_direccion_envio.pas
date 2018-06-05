unit elegir_cliente_direccion_envio;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, Buttons,
  ComCtrls, ButtonPanel, DbCtrls, DBGrids, plantilla_000, db, sqldb, utilidades_datos_tablas, grids,
  utilidades_rgtro, utilidades_bd, utilidades_general;

resourcestring
  rs_elegir_cliente_direccion_envio_001 = 'Elegir dirección de envío de un cliente';
  rs_elegir_cliente_direccion_envio_002 = 'Por nombre';
  rs_elegir_cliente_direccion_envio_003 = 'Por la id';

type

  { Tf_elegir_cliente_direccion_envio }

  Tf_elegir_cliente_direccion_envio = class(Tform_plantilla_000)
    SQLQuery_PrincipalChange_Id_User: TLargeintField;
    SQLQuery_PrincipalChange_WHEN: TDateTimeField;
    SQLQuery_PrincipalCodigo_Postal: TStringField;
    SQLQuery_PrincipalDel_Id_User: TLargeintField;
    SQLQuery_PrincipalDel_WHEN: TDateTimeField;
    SQLQuery_PrincipalDel_WHY: TStringField;
    SQLQuery_PrincipalDireccion: TStringField;
    SQLQuery_PrincipalDireccion_Numero: TStringField;
    SQLQuery_PrincipalDireccion_Piso_Letra: TStringField;
    SQLQuery_PrincipaleMail: TStringField;
    SQLQuery_PrincipalFAX: TStringField;
    SQLQuery_Principalid_clientes: TLargeintField;
    SQLQuery_Principalid_clientes_contactos: TLargeintField;
    SQLQuery_Principalid_paises: TLargeintField;
    SQLQuery_Principalid_poblaciones: TLargeintField;
    SQLQuery_Principalid_provincias: TLargeintField;
    SQLQuery_PrincipalInsert_Id_User: TLargeintField;
    SQLQuery_PrincipalInsert_WHEN: TDateTimeField;
    SQLQuery_PrincipalMovil: TStringField;
    SQLQuery_PrincipalOT_descripcion_Contacto: TStringField;
    SQLQuery_PrincipalOT_descripcion_pais: TStringField;
    SQLQuery_PrincipalOT_descripcion_poblacion: TStringField;
    SQLQuery_PrincipalOT_descripcion_provincia: TStringField;
    SQLQuery_PrincipalOT_Direccion_Entera1: TStringField;
    SQLQuery_PrincipalOT_todos_los_Tfnos1: TStringField;
    SQLQuery_PrincipalPortes_Pagados_SN: TStringField;
    SQLQuery_PrincipalTfno_Fijo_1: TStringField;
    SQLQuery_PrincipalTfno_Fijo_2: TStringField;

    procedure SQLQuery_PrincipalCalcFields(DataSet: TDataSet);

    procedure Campo_Foco_en_modo_Edicion_Inserccion; override;
    procedure Filtrar_tablas_adicionales( var p_Lineas_Filtro : TStrings; var p_Lineas_OrderBy : TStrings ); override;
    procedure Cambiar_Nombre_Tabla_Principal; override;
    procedure Cambiar_Titulo_Form; override;
    procedure Crear_tipos_orden_Principal; override;
    procedure Refrescar_Registros; override;
    procedure Refrescar_Registros_TablasLigadas; override;
    procedure Filtrar_Principal_queFiltro( var p_errores_Filtros : TStrings; var p_Registro_CRUD : TRegistro_CRUD; var p_ctdad_Rgtros : Integer; var p_a_Filtrar : TStrings ); override;
    procedure Cambiar_WindowState; override;
    procedure Dibujar_Grid_Principal( p_Sender: TObject; const p_Rect: TRect; p_DataCol: Integer; p_Column: TColumn; p_State: TGridDrawState ); override;
    function  Fue_Utilizado_Rgtro_SQLQuery_Principal : ShortInt; override;

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  f_elegir_cliente_direccion_envio: Tf_elegir_cliente_direccion_envio;

implementation

{$R *.lfm}

{ Tf_elegir_cliente_direccion_envio }

procedure Tf_elegir_cliente_direccion_envio.SQLQuery_PrincipalCalcFields(DataSet: TDataSet);
begin
  with SQLQuery_Principal do
  begin
    // ***************************************************************************************** //
    // ** TELEFONOS                                                                           ** //
    // ***************************************************************************************** //
    FieldByName('OT_todos_los_Tfnos').AsString := '';

    // Tfno_Fijo_1
    if Trim(FieldByName('Tfno_Fijo_1').AsString) <> '' then
    begin
      if Trim(FieldByName('OT_todos_los_Tfnos').AsString) <> '' then
      begin
          FieldByName('OT_todos_los_Tfnos').AsString :=
                Trim(FieldByName('OT_todos_los_Tfnos').AsString) + ', ';
      end;

      FieldByName('OT_todos_los_Tfnos').AsString :=
            Trim(FieldByName('OT_todos_los_Tfnos').AsString) + ' ' +
            Trim(FieldByName('Tfno_Fijo_1').AsString);
    end;

    // Tfno_Fijo_2
    if Trim(FieldByName('Tfno_Fijo_2').AsString) <> '' then
    begin
      if Trim(FieldByName('OT_todos_los_Tfnos').AsString) <> '' then
      begin
        FieldByName('OT_todos_los_Tfnos').AsString :=
              Trim(FieldByName('OT_todos_los_Tfnos').AsString) + ', ';
      end;

      FieldByName('OT_todos_los_Tfnos').AsString :=
            Trim(FieldByName('OT_todos_los_Tfnos').AsString) + ' ' +
            Trim(FieldByName('Tfno_Fijo_2').AsString);
    end;

    // Movil
    if Trim(FieldByName('Movil').AsString) <> '' then
    begin
      if Trim(FieldByName('OT_todos_los_Tfnos').AsString) <> '' then
      begin
        FieldByName('OT_todos_los_Tfnos').AsString :=
              Trim(FieldByName('OT_todos_los_Tfnos').AsString) + ', ';
      end;

      FieldByName('OT_todos_los_Tfnos').AsString :=
            Trim(FieldByName('OT_todos_los_Tfnos').AsString) + ' ' +
            Trim(FieldByName('Movil').AsString);
    end;

    // ***************************************************************************************** //
    // ** DIRECCION ENTERA                                                                    ** //
    // ***************************************************************************************** //
    FieldByName('OT_Direccion_Entera').AsString := '';

    // Direccion
    if Trim(FieldByName('Direccion').AsString) <> '' then
    begin
      if Trim(FieldByName('OT_Direccion_Entera').AsString) <> '' then
      begin
        FieldByName('OT_Direccion_Entera').AsString :=
              Trim(FieldByName('OT_Direccion_Entera').AsString) + ', ';
      end;

      FieldByName('OT_Direccion_Entera').AsString :=
            Trim(FieldByName('OT_Direccion_Entera').AsString) + ' ' +
            Trim(FieldByName('Direccion').AsString);
    end;

    // Direccion_Numero
    if Trim(FieldByName('Direccion_Numero').AsString) <> '' then
    begin
      if Trim(FieldByName('OT_Direccion_Entera').AsString) <> '' then
      begin
        FieldByName('OT_Direccion_Entera').AsString :=
              Trim(FieldByName('OT_Direccion_Entera').AsString) + ', ';
      end;

      FieldByName('OT_Direccion_Entera').AsString :=
            Trim(FieldByName('OT_Direccion_Entera').AsString) + ' ' +
            Trim(FieldByName('Direccion_Numero').AsString);
    end;

    // Direccion_Piso_Letra
    if Trim(FieldByName('Direccion_Piso_Letra').AsString) <> '' then
    begin
      if Trim(FieldByName('OT_Direccion_Entera').AsString) <> '' then
      begin
        FieldByName('OT_Direccion_Entera').AsString :=
              Trim(FieldByName('OT_Direccion_Entera').AsString) + ', ';
      end;

      FieldByName('OT_Direccion_Entera').AsString :=
            Trim(FieldByName('OT_Direccion_Entera').AsString) + ' ' +
            Trim(FieldByName('Direccion_Piso_Letra').AsString);
    end;

    // Codigo_Postal
    if Trim(FieldByName('Codigo_Postal').AsString) <> '' then
    begin
      if Trim(FieldByName('OT_Direccion_Entera').AsString) <> '' then
      begin
        FieldByName('OT_Direccion_Entera').AsString :=
              Trim(FieldByName('OT_Direccion_Entera').AsString) + ', ';
      end;

      FieldByName('OT_Direccion_Entera').AsString :=
            Trim(FieldByName('OT_Direccion_Entera').AsString) + ' ' +
            Trim(FieldByName('Codigo_Postal').AsString);
    end;

    // OT_descripcion_poblacion
    if Trim(FieldByName('OT_descripcion_poblacion').AsString) <> '' then
    begin
      if Trim(FieldByName('OT_Direccion_Entera').AsString) <> '' then
      begin
        FieldByName('OT_Direccion_Entera').AsString :=
              Trim(FieldByName('OT_Direccion_Entera').AsString) + ', ';
      end;

      FieldByName('OT_Direccion_Entera').AsString :=
            Trim(FieldByName('OT_Direccion_Entera').AsString) + ' ' +
            Trim(FieldByName('OT_descripcion_poblacion').AsString);
    end;

    // OT_descripcion_provincia
    if Trim(FieldByName('OT_descripcion_provincia').AsString) <> '' then
    begin
      if Trim(FieldByName('OT_Direccion_Entera').AsString) <> '' then
      begin
        FieldByName('OT_Direccion_Entera').AsString :=
              Trim(FieldByName('OT_Direccion_Entera').AsString) + ', ';
      end;

      FieldByName('OT_Direccion_Entera').AsString :=
            Trim(FieldByName('OT_Direccion_Entera').AsString) + ' ' +
            Trim(FieldByName('OT_descripcion_provincia').AsString);
    end;

    // OT_descripcion_pais
    if Trim(FieldByName('OT_descripcion_pais').AsString) <> '' then
    begin
      if Trim(FieldByName('OT_Direccion_Entera').AsString) <> '' then
      begin
        FieldByName('OT_Direccion_Entera').AsString :=
              Trim(FieldByName('OT_Direccion_Entera').AsString) + ', ';
      end;

      FieldByName('OT_Direccion_Entera').AsString :=
            Trim(FieldByName('OT_Direccion_Entera').AsString) + ' ' +
            Trim(FieldByName('OT_descripcion_pais').AsString);
    end;
  end;
end;

procedure Tf_elegir_cliente_direccion_envio.Filtrar_tablas_adicionales( var p_Lineas_Filtro : TStrings;
                                                                        var p_Lineas_OrderBy : TStrings );
begin
  // *********************************************************************************************** //
  // ** no hay tablas ligadas                                                                     ** //
  // *********************************************************************************************** //
end;

procedure Tf_elegir_cliente_direccion_envio.Cambiar_Nombre_Tabla_Principal;
begin
  pubic_nombre_tabla_Principal := 'clientes_envios';
end;

procedure Tf_elegir_cliente_direccion_envio.Cambiar_Titulo_Form;
begin
  Self.Caption := rs_elegir_cliente_direccion_envio_001;
end;

procedure Tf_elegir_cliente_direccion_envio.Crear_tipos_orden_Principal;
begin
  SetLength(public_Order_By, 2);

  public_Order_By[0].Titulo       := rs_elegir_cliente_direccion_envio_002; // El índice 0 siempre será por el que empezará la aplicación y los filtros
  public_Order_By[0].Memo_OrderBy := 'ce.id_clientes ASC, ce.Direccion ASC, ce.Direccion_Numero ASC, ce.Direccion_Piso_Letra ASC, ce.Codigo_Postal ASC, ce.id_poblaciones ASC, ce.id_provincias ASC, ce.id_paises ASC';

  public_Order_By[1].Titulo       := rs_elegir_cliente_direccion_envio_003;
  public_Order_By[1].Memo_OrderBy := 'ce.id ASC';

  Memo_OrderBy.Lines.Text          := public_Order_By[0].Memo_OrderBy;

  UTI_TB_Rellenar_ComboBox_Orden( true,
                                  ComboBox_Filtros,
                                  public_Order_By,
                                  0 );
end;

procedure Tf_elegir_cliente_direccion_envio.Refrescar_Registros;
var var_id : LargeInt;
begin
  var_id := 0;

  if SQLQuery_Principal.RecordCount > 0 then
  begin
    var_id := SQLQuery_Principal.FieldByName('id').Value;
  end;

  Filtrar_Principal_Sin_Preguntar;

  if var_id <> 0 then
  begin
    SQLQuery_Principal.Locate( 'id',
                               var_id,
                               [] );
  end;
end;

procedure Tf_elegir_cliente_direccion_envio.Refrescar_Registros_TablasLigadas;
begin
  // No hay tablas ligadas de momento
end;

procedure Tf_elegir_cliente_direccion_envio.Cambiar_WindowState;
begin
  Self.WindowState := wsNormal; // Puede ser wsNormal, wsFullScreen, wsMaximized o wsMinimized
end;

procedure Tf_elegir_cliente_direccion_envio.Dibujar_Grid_Principal( p_Sender: TObject;
                                                                    const p_Rect: TRect;
                                                                    p_DataCol: Integer;
                                                                    p_Column: TColumn;
                                                                    p_State: TGridDrawState );
begin
  UTI_GEN_Dibujar_Grid( p_Sender, SQLQuery_Principal, p_Rect, p_DataCol, p_Column, p_State );
end;

procedure Tf_elegir_cliente_direccion_envio.Filtrar_Principal_queFiltro( var p_errores_Filtros : TStrings;
                                                                         var p_Registro_CRUD : TRegistro_CRUD;
                                                                         var p_ctdad_Rgtros  : Integer;
                                                                         var p_a_Filtrar     : TStrings );
begin
  p_ctdad_Rgtros             := -1;
  p_Registro_CRUD.name_tabla := 'ce';
  p_Registro_CRUD.Delete_SQL := '';
  p_Registro_CRUD.Update_SQL := UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Principal,
                                                              'clientes_envios',
                                                              'u' );

  p_Registro_CRUD.Insert_SQL := UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Principal,
                                                              'clientes_envios',
                                                              'i' );

  // ********************************************************************************************* //
  // ** No olvidemos que los campos que empiezan por OT_ son campos que pertenecen a otras      ** //
  // ** tablas(JOIN de la SELECT) y que por lo tanto no voy a permitir hacer nada con ellos en  ** //
  // ** form_filtrar_registros y de momento tampoco en form_ordenado_por                        ** //
  // ********************************************************************************************* //
  p_Registro_CRUD.SELECT_SQL := 'SELECT ce.*,' + ' ' +

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
                       'ON ce.id_clientes_contactos = cc.id' + ' ';

  UTI_FILTROS_pasarFiltros_aQuery( SQLQuery_Principal, SQLQuery_Filtros, p_errores_Filtros, p_Registro_CRUD, p_ctdad_Rgtros, p_a_Filtrar );
end;

procedure Tf_elegir_cliente_direccion_envio.Campo_Foco_en_modo_Edicion_Inserccion;
begin
  Self.ActiveControl := GroupBox_Registro;
end;

function Tf_elegir_cliente_direccion_envio.Fue_Utilizado_Rgtro_SQLQuery_Principal : ShortInt;
begin
  Result := 0;

end;

end.


