unit elegir_impuestos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs, plantilla_000, DbGrids,
  Grids, ExtCtrls, StdCtrls, Buttons, ComCtrls, DbCtrls, ButtonPanel, utilidades_datos_tablas,
  utilidades_bd, utilidades_rgtro, utilidades_general;

resourcestring
  rs_imptos_eleg_001 = 'Elegir impuesto';
  rs_imptos_eleg_002 = 'Por la descripción';
  rs_imptos_eleg_003 = 'Por la id';

type

  { Tf_elegir_impuestos }

  Tf_elegir_impuestos = class(Tform_plantilla_000)
    Image_Compuesto: TImage;
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
    public_id_impuesto_que_no_tiene_que_aparecer : ShortString;

  end;

var
  f_elegir_impuestos: Tf_elegir_impuestos;

implementation

{$R *.lfm}

procedure Tf_elegir_impuestos.Filtrar_tablas_adicionales( var p_Lineas_Filtro : TStrings;
                                                          var p_Lineas_OrderBy : TStrings );
begin
  // *********************************************************************************************** //
  // ** no hay tablas ligadas                                                                     ** //
  // *********************************************************************************************** //
end;

procedure Tf_elegir_impuestos.Cambiar_Nombre_Tabla_Principal;
begin
  pubic_nombre_tabla_Principal := 'impuestos';
end;

procedure Tf_elegir_impuestos.Cambiar_Titulo_Form;
begin
  Self.Caption := rs_imptos_eleg_001;
end;

procedure Tf_elegir_impuestos.Crear_tipos_orden_Principal;
begin
  SetLength(public_Order_By, 2);

  public_Order_By[0].Titulo       := rs_imptos_eleg_002; // El índice 0 siempre será por el que empezará la aplicación y los filtros
  public_Order_By[0].Memo_OrderBy := 'i.descripcion ASC';

  public_Order_By[1].Titulo       := rs_imptos_eleg_003;
  public_Order_By[1].Memo_OrderBy := 'i.id ASC';

  Memo_OrderBy.Lines.Text          := public_Order_By[0].Memo_OrderBy;

  UTI_TB_Rellenar_ComboBox_Orden( true,
                                  ComboBox_Filtros,
                                  public_Order_By,
                                  0 );
end;

procedure Tf_elegir_impuestos.Refrescar_Registros;
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

procedure Tf_elegir_impuestos.Refrescar_Registros_TablasLigadas;
begin
  // No hay tablas ligadas de momento
end;

procedure Tf_elegir_impuestos.Filtrar_Principal_queFiltro( var p_errores_Filtros : TStrings;
                                                           var p_Registro_CRUD : TRegistro_CRUD;
                                                           var p_ctdad_Rgtros  : Integer;
                                                           var p_a_Filtrar     : TStrings );
var
  var_SQL_ADD : TStrings;
begin
  var_SQL_ADD                := TStringList.Create;

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

  if Trim(public_id_impuesto_que_no_tiene_que_aparecer) <> '' then
  begin
      var_SQL_ADD.Clear;
      var_SQL_ADD.Add( 'i.id <> ' + Trim(public_id_impuesto_que_no_tiene_que_aparecer) );
      UTI_TB_SQL_ADD( true,
                      Memo_Filtros.Lines,
                      var_SQL_ADD );
  end;

  Filtrar_Principal_queFiltro_sus_Filtros( p_errores_Filtros, p_Registro_CRUD, p_ctdad_Rgtros, p_a_Filtrar );
  var_SQL_ADD.Free;
end;

procedure Tf_elegir_impuestos.Cambiar_WindowState;
begin
  Self.WindowState := wsNormal; // Puede ser wsNormal, wsFullScreen, wsMaximized o wsMinimized
end;

procedure Tf_elegir_impuestos.Dibujar_Grid_Principal( p_Sender: TObject;
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

procedure Tf_elegir_impuestos.Campo_Foco_en_modo_Edicion_Inserccion;
begin
  Self.ActiveControl := GroupBox_Registro;
end;

function Tf_elegir_impuestos.Fue_Utilizado_Rgtro_SQLQuery_Principal : ShortInt;
begin
  Result := 0;

end;

end.


