unit elegir_cliente_contacto;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  grids, Buttons, ComCtrls, ButtonPanel, DbCtrls, DBGrids, plantilla_000, utilidades_datos_tablas,
  utilidades_rgtro, utilidades_bd, utilidades_general;

resourcestring
  rs_elegir_cliente_contacto_001 = 'Elegir el contacto de un cliente';
  rs_elegir_cliente_contacto_002 = 'Por nombre';
  rs_elegir_cliente_contacto_003 = 'Por la id';
type

  { Tf_elegir_cliente_contacto }

  Tf_elegir_cliente_contacto = class(Tform_plantilla_000)
    Edit_Descripcion: TEdit;
    Label6: TLabel;
    SQLQuery_PrincipalCargo_Puesto: TStringField;
    SQLQuery_PrincipalChange_Id_User: TLargeintField;
    SQLQuery_PrincipalChange_WHEN: TDateTimeField;
    SQLQuery_PrincipalDel_Id_User: TLargeintField;
    SQLQuery_PrincipalDel_WHEN: TDateTimeField;
    SQLQuery_PrincipalDel_WHY: TStringField;
    SQLQuery_PrincipaleMail: TStringField;
    SQLQuery_PrincipalFAX: TStringField;
    SQLQuery_PrincipalFecha_Nacimiento: TDateTimeField;
    SQLQuery_Principalid_clientes: TLargeintField;
    SQLQuery_PrincipalInsert_Id_User: TLargeintField;
    SQLQuery_PrincipalInsert_WHEN: TDateTimeField;
    SQLQuery_PrincipalMovil: TStringField;
    SQLQuery_Principalnif_cif: TStringField;
    SQLQuery_Principalnombre: TStringField;
    SQLQuery_PrincipalOT_todos_los_Tfnos1: TStringField;
    SQLQuery_Principalpagina_web: TStringField;
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
  f_elegir_cliente_contacto: Tf_elegir_cliente_contacto;

implementation

{$R *.lfm}

{ Tf_elegir_cliente_contacto }

procedure Tf_elegir_cliente_contacto.Filtrar_tablas_adicionales( var p_Lineas_Filtro : TStrings;
                                                                 var p_Lineas_OrderBy : TStrings );
begin
  // *********************************************************************************************** //
  // ** no hay tablas ligadas                                                                     ** //
  // *********************************************************************************************** //
end;

procedure Tf_elegir_cliente_contacto.Cambiar_Nombre_Tabla_Principal;
begin
  pubic_nombre_tabla_Principal := 'clientes_contactos';
end;

procedure Tf_elegir_cliente_contacto.Cambiar_Titulo_Form;
begin
  Self.Caption := rs_elegir_cliente_contacto_001;
end;

procedure Tf_elegir_cliente_contacto.Crear_tipos_orden_Principal;
begin
  SetLength(public_Order_By, 2);

  public_Order_By[0].Titulo       := rs_elegir_cliente_contacto_002; // El índice 0 siempre será por el que empezará la aplicación y los filtros
  public_Order_By[0].Memo_OrderBy := 'cc.id_clientes ASC, cc.nombre ASC';

  public_Order_By[1].Titulo       := rs_elegir_cliente_contacto_003;
  public_Order_By[1].Memo_OrderBy := 'cc.id ASC';

  Memo_OrderBy.Lines.Text          := public_Order_By[0].Memo_OrderBy;

  UTI_TB_Rellenar_ComboBox_Orden( true,
                                  ComboBox_Filtros,
                                  public_Order_By,
                                  0 );
end;

procedure Tf_elegir_cliente_contacto.Refrescar_Registros;
var var_descripcion : String;
begin
  var_descripcion := '';

  if SQLQuery_Principal.RecordCount > 0 then
  begin
    var_descripcion := SQLQuery_Principal.FieldByName('nombre').Value;
  end;

  Filtrar_Principal_Sin_Preguntar;

  if Trim(var_descripcion) <> '' then
  begin
    SQLQuery_Principal.Locate( 'nombre',
                               var_descripcion,
                               [] );
  end;
end;

procedure Tf_elegir_cliente_contacto.Refrescar_Registros_TablasLigadas;
begin
  // No hay tablas ligadas de momento
end;

procedure Tf_elegir_cliente_contacto.SQLQuery_PrincipalCalcFields(
  DataSet: TDataSet);
begin
  with SQLQuery_Principal do
  begin
    // TELEFONOS
    FieldByName('OT_todos_los_Tfnos').AsString := '';

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
  end;
end;

procedure Tf_elegir_cliente_contacto.Cambiar_WindowState;
begin
  Self.WindowState := wsNormal; // Puede ser wsNormal, wsFullScreen, wsMaximized o wsMinimized
end;

procedure Tf_elegir_cliente_contacto.Dibujar_Grid_Principal( p_Sender: TObject;
                                                             const p_Rect: TRect;
                                                             p_DataCol: Integer;
                                                             p_Column: TColumn;
                                                             p_State: TGridDrawState );
begin
  UTI_GEN_Dibujar_Grid( p_Sender, SQLQuery_Principal, p_Rect, p_DataCol, p_Column, p_State );
end;

procedure Tf_elegir_cliente_contacto.Filtrar_Principal_queFiltro( var p_errores_Filtros : TStrings;
                                                                  var p_Registro_CRUD : TRegistro_CRUD;
                                                                  var p_ctdad_Rgtros  : Integer;
                                                                  var p_a_Filtrar     : TStrings );
begin
  p_ctdad_Rgtros             := -1;
  p_Registro_CRUD.name_tabla := 'cc';
  p_Registro_CRUD.Delete_SQL := '';
  p_Registro_CRUD.Update_SQL := UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Principal,
                                                              'clientes_contactos',
                                                              'u' );

  p_Registro_CRUD.Insert_SQL := UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Principal,
                                                              'clientes_contactos',
                                                              'i' );

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  p_Registro_CRUD.SELECT_SQL := 'SELECT cc.*' + ' ' +
                                'FROM clientes_contactos AS cc' + ' ';

  Filtrar_Principal_queFiltro_sus_Filtros( p_Registro_CRUD, p_ctdad_Rgtros, p_a_Filtrar );
end;

procedure Tf_elegir_cliente_contacto.Campo_Foco_en_modo_Edicion_Inserccion;
begin
  Self.ActiveControl := GroupBox_Registro;
end;

function Tf_elegir_cliente_contacto.Fue_Utilizado_Rgtro_SQLQuery_Principal : ShortInt;
begin
  Result := 0;

end;

end.

