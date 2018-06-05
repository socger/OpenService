unit reportes_000;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, Buttons,
  ComCtrls, DbCtrls, DBGrids, ButtonPanel, plantilla_000, types, sqldb, db, utilidades_datos_tablas,
  Grids, variants, utilidades_rgtro, utilidades_bd, utilidades_forms_Filtrar, utilidades_general,
  utilidades_Filtros, utilidades_usuarios;

resourcestring
  rs_rep_001 = 'Por el nombre de fichero';
  rs_rep_002 = 'Por el módulo + nombre de fichero';
  rs_rep_003 = 'Por la descripción';
  rs_rep_004 = 'Por el módulo + descripción';
  rs_rep_005 = 'Por la id';
  rs_rep_009 = 'Mantenimiento de reportes';
  rs_rep_010 = 'Diseño de informes|*.LRF;*.lrf';
  rs_rep_011 = 'Error al intentar traer los *.lfr que existen en el directorio ';
  rs_rep_012 = '¿QUITAMOS el MODULO';
  rs_rep_013 = '* El nombre de fichero.';
  rs_rep_014 = '* El módulo al que pertenece.';
  rs_rep_015 = '* La descripción del informe.';

type

  { Tf_reportes_000 }

  Tf_reportes_000 = class(Tform_plantilla_000)
    Boton_Elegir_Fichero: TBitBtn;
    Boton_Elegir_Menu: TBitBtn;
    DBEdit_Descripcion: TDBEdit;
    DBEdit_nombre_fichero: TDBEdit;
    Edit_Descripcion_Menu: TEdit;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    OpenDialog1: TOpenDialog;
    SQLQuery_PrincipalChange_Id_User: TLargeintField;
    SQLQuery_PrincipalChange_WHEN: TDateTimeField;
    SQLQuery_PrincipalDel_Id_User: TLargeintField;
    SQLQuery_PrincipalDel_WHEN: TDateTimeField;
    SQLQuery_PrincipalDel_WHY: TStringField;
    SQLQuery_Principaldescripcion: TStringField;
    SQLQuery_Principalid_menus: TLargeintField;
    SQLQuery_PrincipalInsert_Id_User: TLargeintField;
    SQLQuery_PrincipalInsert_WHEN: TDateTimeField;
    SQLQuery_Principalnombre_fichero: TStringField;
    SQLQuery_PrincipalOT_Descripcion_Menu: TStringField;

    procedure Boton_Elegir_FicheroClick(Sender: TObject);
    procedure Boton_Elegir_MenuClick(Sender: TObject);
    procedure Edit_Descripcion_MenuClick(Sender: TObject);

    procedure Campo_Foco_en_modo_Edicion_Inserccion; override;
    procedure NewRecord_Insert_SQLQuery_Principal; override;
    procedure Antes_del_Post_Principal_Sin_Rellenar_Permitido_SI( p_msg : TStrings ); override;
    procedure Antes_del_Post_Principal_Sin_Rellenar_Permitido_NO( p_msg, p_msg_Comprobar : TStrings ); override;
    procedure Antes_del_Post_Principal_Asignar_Valores; override;
    procedure Filtrar_tablas_adicionales( var p_Lineas_Filtro : TStrings; var p_Lineas_OrderBy : TStrings ); override;
    procedure Cambiar_Nombre_Tabla_Principal; override;
    procedure Cambiar_Titulo_Form; override;
    procedure Rellenar_Filtros_Impresion(var p_Ordenado_por : String); override;
    procedure Crear_tipos_orden_Principal; override;
    procedure Crear_OrderBy_tablas_adicionales; override;
    procedure Refrescar_Registros; override;
    procedure Filtrar_Principal_queFiltro( var p_errores_Filtros : TStrings; var p_Registro_CRUD : TRegistro_CRUD; var p_ctdad_Rgtros : Integer; var p_a_Filtrar : TStrings ); override;
    procedure Presentar_Datos; override;
    procedure Presentar_Datos_GroupBox_Registro; override;
    procedure para_Empezar_GroupBox_Registro; override;
    procedure Cambiar_WindowState; override;
    procedure Abrir_Conexiones_con_BD_TablasAdicionales; override;
    procedure Cerramos_Tablas_Ligadas; override;
    procedure Refrescar_Registros_TablasLigadas; override;
    procedure Dibujar_Grid_Principal( p_Sender: TObject; const p_Rect: TRect; p_DataCol: Integer; p_Column: TColumn; p_State: TGridDrawState ); override;
    function  Fue_Utilizado_Rgtro_SQLQuery_Principal : ShortInt; override;

  private
    { private declarations }

  public
    { public declarations }

  end;

var
  f_reportes_000: Tf_reportes_000;

implementation

{$R *.lfm}

uses menu;

procedure Tf_reportes_000.Crear_tipos_orden_Principal;
begin
  // ********************************************************************************************* //
  // ** Preparamos los diferentes tipos de orden preconfigurados                                ** //
  // ********************************************************************************************* //
  SetLength(public_Order_By, 5);

  public_Order_By[0].Titulo       := rs_rep_001; // El índice 0 siempre será por el que empezará la aplicación y los filtros
  public_Order_By[0].Memo_OrderBy := 'i.nombre_fichero ASC';

  public_Order_By[1].Titulo       := rs_rep_002;
  public_Order_By[1].Memo_OrderBy := 'i.id_menus ASC, i.nombre_fichero ASC';

  public_Order_By[2].Titulo       := rs_rep_003;
  public_Order_By[2].Memo_OrderBy := 'i.descripcion ASC';

  public_Order_By[3].Titulo       := rs_rep_004;
  public_Order_By[3].Memo_OrderBy := 'i.id_menus ASC, i.descripcion ASC';

  public_Order_By[4].Titulo       := rs_rep_005;
  public_Order_By[4].Memo_OrderBy := 'i.id ASC';

  Memo_OrderBy.Lines.Text          := public_Order_By[3].Memo_OrderBy;

  UTI_TB_Rellenar_ComboBox_Orden( true,
                                  ComboBox_Filtros,
                                  public_Order_By,
                                  0 );
end;

procedure Tf_reportes_000.Cambiar_Nombre_Tabla_Principal;
begin
  pubic_nombre_tabla_Principal := 'principal';
end;

procedure Tf_reportes_000.Cambiar_Titulo_Form;
begin
  Self.Caption := rs_rep_009;
end;

procedure Tf_reportes_000.Filtrar_tablas_adicionales( var p_Lineas_Filtro : TStrings;
                                                      var p_Lineas_OrderBy : TStrings );
begin
  // *********************************************************************************************** //
  // ** no hay tablas ligadas                                                                     ** //
  // *********************************************************************************************** //
end;

procedure Tf_reportes_000.Boton_Elegir_MenuClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
  with SQLQuery_Principal do
  begin
    var_Registro := UTI_Abrir_Modulo_Menus( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
      FieldByName('id_menus').AsString := Trim(var_Registro.id_1);
      Edit_Descripcion_Menu.Text       := var_Registro.descripcion_1;
    end;
  end;
end;

procedure Tf_reportes_000.Boton_Elegir_FicheroClick(Sender: TObject);
begin
  Try
    OpenDialog1.InitialDir := form_menu.public_path_listados;
    OpenDialog1.FileName   := '';
    OpenDialog1.Filter     := rs_rep_010;

    if OpenDialog1.Execute then
    begin
      if Trim(OpenDialog1.Filename) <> '' then
      begin
          SQLQuery_Principal.FieldByName('nombre_fichero').AsString := OpenDialog1.FileName;
      end;
    end;
  Except
    on error : Exception do
    begin
      UTI_GEN_Error_Log( rs_rep_011 + form_menu.public_path_listados, error );
    end;
  end;
end;

procedure Tf_reportes_000.Edit_Descripcion_MenuClick(Sender: TObject);
var var_msg : TStrings;
begin
  var_msg := TStringList.Create;
  var_msg.Add(rs_rep_012);
  if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
  begin
     SQLQuery_Principal.FieldByName('id_menus').Clear;
     Edit_Descripcion_Menu.Text := '';
  end;
  var_msg.Free;
end;

procedure Tf_reportes_000.Refrescar_Registros;
var var_nombre_fichero : String;
    var_id_menus       : Integer;
begin
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
end;

procedure Tf_reportes_000.Filtrar_Principal_queFiltro( var p_errores_Filtros : TStrings;
                                                       var p_Registro_CRUD : TRegistro_CRUD;
                                                       var p_ctdad_Rgtros  : Integer;
                                                       var p_a_Filtrar     : TStrings );
begin
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

  UTI_FILTROS_pasarFiltros_aQuery( SQLQuery_Principal, SQLQuery_Filtros, p_errores_Filtros, p_Registro_CRUD, p_ctdad_Rgtros, p_a_Filtrar );
end;

procedure Tf_reportes_000.Presentar_Datos_GroupBox_Registro;
begin
  with SQLQuery_Principal do
  begin
    if RecordCount > 0 then
    begin
      Edit_Descripcion_Menu.Text := FieldByName('OT_Descripcion_Menu').AsString;
    end;
  end;
end;

procedure Tf_reportes_000.para_Empezar_GroupBox_Registro;
begin
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
end;

procedure Tf_reportes_000.Presentar_Datos;
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

procedure Tf_reportes_000.Cambiar_WindowState;
begin
  Self.WindowState := wsNormal; // Puede ser wsNormal, wsFullScreen, wsMaximized o wsMinimized
end;

procedure Tf_reportes_000.Abrir_Conexiones_con_BD_TablasAdicionales;
begin
  { Hacer algo parecido a lo de abajo ... pero ojito sólo si hay otras transacciones y otros conectores.
    Lo lógico es que nada más que usemos los de la conexión principal, aunque sean otras tablas adicionales.

  Abrir_Conexion_con_BD( SQLTransaction_TablaHija001, SQLConnector_TablaHija001);
  Abrir_Conexion_con_BD( SQLTransaction_TablaHija002, SQLConnector_TablaHija002);
  }
end;

procedure Tf_reportes_000.Crear_OrderBy_tablas_adicionales;
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

procedure Tf_reportes_000.Cerramos_Tablas_Ligadas;
begin
  { Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo

  Cerrar_Tabla( Nil,
                Nil,
                SQLQuery_Tabla001 );
  }
end;

procedure Tf_reportes_000.Refrescar_Registros_TablasLigadas;
begin
  { Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo

  Refrescar_Tabla_001;
  Refrescar_Tabla_002;
  Refrescar_Tabla_003;
  }
end;

procedure Tf_reportes_000.Dibujar_Grid_Principal( p_Sender: TObject;
                                                     const p_Rect: TRect;
                                                     p_DataCol: Integer;
                                                     p_Column: TColumn;
                                                     p_State: TGridDrawState );
begin
  UTI_GEN_Dibujar_Grid( p_Sender, SQLQuery_Principal, p_Rect, p_DataCol, p_Column, p_State );
end;

procedure Tf_reportes_000.Antes_del_Post_Principal_Sin_Rellenar_Permitido_SI( p_msg : TStrings );
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

procedure Tf_reportes_000.Antes_del_Post_Principal_Asignar_Valores;
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

procedure Tf_reportes_000.Antes_del_Post_Principal_Sin_Rellenar_Permitido_NO( p_msg,
                                                                              p_msg_Comprobar : TStrings );
begin
  // *********************************************************************************************** //
  // ** Ahora vienen las comprobaciones de porque no grabamos                                     ** //
  // *********************************************************************************************** //
  with SQLQuery_Principal do
  begin

    if Trim(FieldByName('nombre_fichero').AsString) = '' then
    begin
      p_msg.Add( rs_rep_013);
    end;

    if Trim(FieldByName('id_menus').AsString) = '' then
    begin
      p_msg.Add( rs_rep_014 );
    end;

    if Trim(FieldByName('descripcion').AsString) = '' then
    begin
      p_msg.Add( rs_rep_015 );
    end;

  end;

end;

procedure Tf_reportes_000.NewRecord_Insert_SQLQuery_Principal;
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

procedure Tf_reportes_000.Campo_Foco_en_modo_Edicion_Inserccion;
begin
  Self.ActiveControl := DBEdit_nombre_fichero;
end;

function Tf_reportes_000.Fue_Utilizado_Rgtro_SQLQuery_Principal : ShortInt;
begin
  Result := 0;

end;

procedure Tf_reportes_000.Rellenar_Filtros_Impresion(var p_Ordenado_por : String);
begin
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
end;

end.

