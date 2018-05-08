unit elegir_diarios_tipos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  grids, Buttons, DbCtrls, DBGrids, plantilla_000, utilidades_datos_tablas, utilidades_bd,
  utilidades_rgtro, utilidades_general;

resourcestring
  rs_dia_tip_001 = 'Elegir tipo de diario';
  rs_dia_tip_002 = 'Por la descripción';
  rs_dia_tip_003 = 'Por la id';

type

  { Tf_elegir_diarios_tipos }

  Tf_elegir_diarios_tipos = class(Tform_plantilla_000)
    SQLQuery_PrincipalChange_Id_User: TLargeintField;
    SQLQuery_PrincipalChange_WHEN: TDateTimeField;
    SQLQuery_PrincipalDel_Id_User: TLargeintField;
    SQLQuery_PrincipalDel_WHEN: TDateTimeField;
    SQLQuery_PrincipalDel_WHY: TStringField;
    SQLQuery_Principaldescripcion: TStringField;
    SQLQuery_PrincipalInsert_Id_User: TLargeintField;
    SQLQuery_PrincipalInsert_WHEN: TDateTimeField;

    procedure Campo_Foco_en_modo_Edicion_Inserccion; override;
    procedure Filtrar_tablas_adicionales( var p_Lineas_Filtro : TStrings; var p_Lineas_OrderBy : TStrings ); override;
    procedure Cambiar_Nombre_Tabla_Principal; override;
    procedure Cambiar_Titulo_Form; override;
    procedure Crear_tipos_orden_Principal; override;
    procedure Refrescar_Registros; override;
    procedure Refrescar_Registros_TablasLigadas; override;
    procedure SQLQuery_PrincipalAfterOpen(DataSet: TDataSet);
    procedure SQLQuery_PrincipalAfterPost(DataSet: TDataSet);
    procedure SQLQuery_PrincipalAfterScroll(DataSet: TDataSet);
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
  f_elegir_diarios_tipos: Tf_elegir_diarios_tipos;

implementation

{$R *.lfm}

procedure Tf_elegir_diarios_tipos.Filtrar_tablas_adicionales( var p_Lineas_Filtro : TStrings;
                                                              var p_Lineas_OrderBy : TStrings );
begin
  // *********************************************************************************************** //
  // ** no hay tablas ligadas                                                                     ** //
  // *********************************************************************************************** //
end;

procedure Tf_elegir_diarios_tipos.Cambiar_Nombre_Tabla_Principal;
begin
  pubic_nombre_tabla_Principal := 'diarios_tipos';
end;

procedure Tf_elegir_diarios_tipos.Cambiar_Titulo_Form;
begin
  Self.Caption := rs_dia_tip_001;
end;

procedure Tf_elegir_diarios_tipos.Crear_tipos_orden_Principal;
begin
  SetLength(public_Order_By, 2);

  public_Order_By[0].Titulo       := rs_dia_tip_002; // El índice 0 siempre será por el que empezará la aplicación y los filtros
  public_Order_By[0].Memo_OrderBy := 'dt.descripcion ASC';

  public_Order_By[1].Titulo       := rs_dia_tip_003;
  public_Order_By[1].Memo_OrderBy := 'dt.id ASC';

  Memo_OrderBy.Lines.Text          := public_Order_By[0].Memo_OrderBy;

  UTI_TB_Rellenar_ComboBox_Orden( true,
                                  ComboBox_Filtros,
                                  public_Order_By,
                                  0 );
end;

procedure Tf_elegir_diarios_tipos.Refrescar_Registros;
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

procedure Tf_elegir_diarios_tipos.Refrescar_Registros_TablasLigadas;
begin
  // No hay tablas ligadas de momento
end;

procedure Tf_elegir_diarios_tipos.SQLQuery_PrincipalAfterOpen(DataSet: TDataSet
  );
begin
  inherited;
end;

procedure Tf_elegir_diarios_tipos.SQLQuery_PrincipalAfterPost(DataSet: TDataSet
  );
begin
  inherited;
end;

procedure Tf_elegir_diarios_tipos.SQLQuery_PrincipalAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
end;

procedure Tf_elegir_diarios_tipos.Cambiar_WindowState;
begin
  Self.WindowState := wsNormal; // Puede ser wsNormal, wsFullScreen, wsMaximized o wsMinimized
end;

procedure Tf_elegir_diarios_tipos.Dibujar_Grid_Principal( p_Sender: TObject;
                                                             const p_Rect: TRect;
                                                             p_DataCol: Integer;
                                                             p_Column: TColumn;
                                                             p_State: TGridDrawState );
begin
  UTI_GEN_Dibujar_Grid( p_Sender, SQLQuery_Principal, p_Rect, p_DataCol, p_Column, p_State );
end;

procedure Tf_elegir_diarios_tipos.Filtrar_Principal_queFiltro( var p_errores_Filtros : TStrings;
                                                               var p_Registro_CRUD : TRegistro_CRUD;
                                                               var p_ctdad_Rgtros  : Integer;
                                                               var p_a_Filtrar     : TStrings );
begin
  p_ctdad_Rgtros             := -1;
  p_Registro_CRUD.name_tabla := 'dt';
  p_Registro_CRUD.Delete_SQL := '';
  p_Registro_CRUD.Update_SQL := UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Principal,
                                                              'diarios_tipos',
                                                              'u' );

  p_Registro_CRUD.Insert_SQL := UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Principal,
                                                              'diarios_tipos',
                                                              'i' );

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  p_Registro_CRUD.SELECT_SQL := 'SELECT dt.*' + ' ' +
                                'FROM diarios_tipos AS dt' + ' ';

  Filtrar_Principal_queFiltro_sus_Filtros( p_Registro_CRUD, p_ctdad_Rgtros, p_a_Filtrar );
end;

procedure Tf_elegir_diarios_tipos.Campo_Foco_en_modo_Edicion_Inserccion;
begin
  Self.ActiveControl := GroupBox_Registro;
end;

function Tf_elegir_diarios_tipos.Fue_Utilizado_Rgtro_SQLQuery_Principal : ShortInt;
begin
  Result := 0;

end;

end.


