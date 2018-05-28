unit almacenes_000;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, ComCtrls, DbCtrls, DBGrids, ButtonPanel, plantilla_000, utilidades_datos_tablas, Grids,
  utilidades_rgtro, utilidades_general, utilidades_bd, utilidades_forms_Filtrar, utilidades_usuarios;

resourcestring
  rs_alm_001 = 'Mantenimiento de almacenes';
  rs_alm_004 = 'Por la descripción';
  rs_alm_005 = 'Por la id';
  rs_alm_006 = '* La descripción';
  rs_alm_007 = '* La empresa';
  rs_alm_008 = '* La dirección.';
  rs_alm_009 = '* La población.';
  rs_alm_010 = '* La provincia.';
  rs_alm_011 = '* El país.';
  rs_alm_012 = '* El responsable.';
  rs_alm_013 = '¿QUITAMOS la EMPRESA';
  rs_alm_014 = '¿QUITAMOS el PAIS';
  rs_alm_015 = '¿QUITAMOS la POBLACIÓN';
  rs_alm_016 = '¿QUITAMOS la PROVINCIA';

type

  { Tf_almacenes_000 }

  Tf_almacenes_000 = class(Tform_plantilla_000)
    BitBtn_SMS: TBitBtn;
    Boton_Elegir_Empresa: TBitBtn;
    Boton_Elegir_Pais: TBitBtn;
    BitBtn_ver_direccion_en_Maps: TBitBtn;
    Boton_Elegir_Poblacion: TBitBtn;
    Boton_Elegir_Provincia: TBitBtn;
    DBEdit_Codigo_Postal: TDBEdit;
    DBEdit_Descripcion: TDBEdit;
    DBEdit_Direccion: TDBEdit;
    DBEdit_Direccion_Numero: TDBEdit;
    DBEdit_Direccion_Piso_Letra: TDBEdit;
    DBEdit_eMail: TDBEdit;
    DBEdit_FAX: TDBEdit;
    DBEdit_Movil: TDBEdit;
    DBEdit_Responsable: TDBEdit;
    DBEdit_Tfno_Fijo_1: TDBEdit;
    DBEdit_Tfno_Fijo_2: TDBEdit;
    Edit_Descripcion_Empresa: TEdit;
    Edit_Descripcion_Pais: TEdit;
    Edit_Descripcion_Poblacion: TEdit;
    Edit_Descripcion_Provincia: TEdit;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    SQLQuery_PrincipalChange_Id_User: TLargeintField;
    SQLQuery_PrincipalChange_WHEN: TDateTimeField;
    SQLQuery_PrincipalCodigo_Postal: TStringField;
    SQLQuery_PrincipalDel_Id_User: TLargeintField;
    SQLQuery_PrincipalDel_WHEN: TDateTimeField;
    SQLQuery_PrincipalDel_WHY: TStringField;
    SQLQuery_Principaldescripcion: TStringField;
    SQLQuery_PrincipalDireccion: TStringField;
    SQLQuery_PrincipalDireccion_Numero: TStringField;
    SQLQuery_PrincipalDireccion_Piso_Letra: TStringField;
    SQLQuery_PrincipaleMail: TStringField;
    SQLQuery_PrincipalFAX: TStringField;
    SQLQuery_Principalid_empresas: TLargeintField;
    SQLQuery_Principalid_paises: TLargeintField;
    SQLQuery_Principalid_poblaciones: TLargeintField;
    SQLQuery_Principalid_provincias: TLargeintField;
    SQLQuery_PrincipalInsert_Id_User: TLargeintField;
    SQLQuery_PrincipalInsert_WHEN: TDateTimeField;
    SQLQuery_PrincipalMovil: TStringField;
    SQLQuery_PrincipalOT_Descripcion_Empresa: TStringField;
    SQLQuery_PrincipalOT_descripcion_pais: TStringField;
    SQLQuery_PrincipalOT_descripcion_poblacion: TStringField;
    SQLQuery_PrincipalOT_descripcion_provincia: TStringField;
    SQLQuery_PrincipalResponsable: TStringField;
    SQLQuery_PrincipalTfno_Fijo_1: TStringField;
    SQLQuery_PrincipalTfno_Fijo_2: TStringField;

    procedure Campo_Foco_en_modo_Edicion_Inserccion; override;
    procedure NewRecord_Insert_SQLQuery_Principal; override;
    procedure Antes_del_Post_Principal_Sin_Rellenar_Permitido_SI( p_msg : TStrings ); override;
    procedure Antes_del_Post_Principal_Sin_Rellenar_Permitido_NO( p_msg, p_msg_Comprobar : TStrings ); override;
    procedure Antes_del_Post_Principal_Asignar_Valores; override;
    procedure Filtrar_Principal_queFiltro( var p_errores_Filtros : TStrings; var p_Registro_CRUD : TRegistro_CRUD; var p_ctdad_Rgtros : Integer; var p_a_Filtrar : TStrings ); override;
    procedure Filtrar_tablas_adicionales( var p_Lineas_Filtro : TStrings; var p_Lineas_OrderBy : TStrings ); override;
    procedure Cambiar_Nombre_Tabla_Principal; override;
    procedure Cambiar_Titulo_Form; override;
    procedure Rellenar_Filtros_Impresion(var p_Ordenado_por : String); override;
    procedure Crear_tipos_orden_Principal; override;
    procedure Crear_OrderBy_tablas_adicionales; override;
    procedure Refrescar_Registros; override;
    procedure Refrescar_Registros_TablasLigadas; override;
    procedure Presentar_Datos; override;
    procedure Presentar_Datos_GroupBox_Registro; override;
    procedure para_Empezar_GroupBox_Registro; override;
    procedure Cambiar_WindowState; override;
    procedure Abrir_Conexiones_con_BD_TablasAdicionales; override;
    procedure Cerramos_Tablas_Ligadas; override;
    procedure Dibujar_Grid_Principal( p_Sender: TObject; const p_Rect: TRect; p_DataCol: Integer; p_Column: TColumn; p_State: TGridDrawState ); override;

    procedure BitBtn_ver_direccion_en_MapsClick(Sender: TObject);
    procedure Boton_Elegir_EmpresaClick(Sender: TObject);
    procedure Boton_Elegir_PaisClick(Sender: TObject);
    procedure Boton_Elegir_PoblacionClick(Sender: TObject);
    procedure Boton_Elegir_ProvinciaClick(Sender: TObject);
    procedure Edit_Descripcion_EmpresaClick(Sender: TObject);
    procedure Edit_Descripcion_PaisClick(Sender: TObject);
    procedure Edit_Descripcion_PoblacionClick(Sender: TObject);
    procedure Edit_Descripcion_ProvinciaClick(Sender: TObject);
    function  Fue_Utilizado_Rgtro_SQLQuery_Principal : ShortInt; override;

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  f_almacenes_000: Tf_almacenes_000;

implementation

{$R *.lfm}

uses menu;

procedure Tf_almacenes_000.Boton_Elegir_EmpresaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
  with SQLQuery_Principal do
  begin
    var_Registro := UTI_Abrir_Modulo_Empresas( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
      FieldByName('id_empresas').AsString := Trim(var_Registro.id_1);
      Edit_Descripcion_Empresa.Text       := var_Registro.descripcion_1;
    end;
  end;
end;

procedure Tf_almacenes_000.Boton_Elegir_PaisClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
  with SQLQuery_Principal do
  begin
    var_Registro := UTI_Abrir_Modulo_Paises( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
      FieldByName('id_paises').AsString := Trim(var_Registro.id_1);
      Edit_Descripcion_Pais.Text        := var_Registro.descripcion_1;
    end;
  end;
end;

procedure Tf_almacenes_000.Boton_Elegir_PoblacionClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
  with SQLQuery_Principal do
  begin
    var_Registro := UTI_Abrir_Modulo_Poblaciones( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
      FieldByName('id_poblaciones').AsString := Trim(var_Registro.id_1);
      FieldByName('id_provincias').AsString  := Trim(var_Registro.id_2);
      FieldByName('id_paises').AsString      := Trim(var_Registro.id_3);

      Edit_Descripcion_Poblacion.Text        := var_Registro.descripcion_1;
      Edit_Descripcion_Provincia.Text        := var_Registro.descripcion_2;
      Edit_Descripcion_Pais.Text             := var_Registro.descripcion_3;
    end;
  end;
end;

procedure Tf_almacenes_000.Boton_Elegir_ProvinciaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
  with SQLQuery_Principal do
  begin
    var_Registro := UTI_Abrir_Modulo_Provincias( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
      FieldByName('id_provincias').AsString := Trim(var_Registro.id_1);
      FieldByName('id_paises').AsString     := Trim(var_Registro.id_2);

      Edit_Descripcion_Provincia.Text       := var_Registro.descripcion_1;
      Edit_Descripcion_Pais.Text            := var_Registro.descripcion_2;
    end;
  end;
end;

procedure Tf_almacenes_000.Edit_Descripcion_EmpresaClick(Sender: TObject);
var var_msg : TStrings;
begin
  var_msg := TStringList.Create;
  var_msg.Add(rs_alm_013);
  if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
  begin
    SQLQuery_Principal.FieldByName('id_empresas').Clear;
    Edit_Descripcion_Empresa.Text := '';
  end;
  var_msg.Free;
end;

procedure Tf_almacenes_000.Edit_Descripcion_PaisClick(Sender: TObject);
var var_msg : TStrings;
begin
  var_msg := TStringList.Create;
  var_msg.Add(rs_alm_014);
  if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
  begin
    SQLQuery_Principal.FieldByName('id_paises').Clear;
    Edit_Descripcion_Pais.Text := '';
  end;
  var_msg.Free;
end;

procedure Tf_almacenes_000.Edit_Descripcion_PoblacionClick(Sender: TObject);
var var_msg : TStrings;
begin
  var_msg := TStringList.Create;
  var_msg.Add(rs_alm_015);
  if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
  begin
    SQLQuery_Principal.FieldByName('id_poblaciones').Clear;
    Edit_Descripcion_Poblacion.Text := '';
  end;
  var_msg.Free;
end;

procedure Tf_almacenes_000.Edit_Descripcion_ProvinciaClick(Sender: TObject);
var var_msg : TStrings;
begin
  var_msg := TStringList.Create;
  var_msg.Add(rs_alm_016);
  if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
  begin
    SQLQuery_Principal.FieldByName('id_provincias').Clear;
    Edit_Descripcion_Provincia.Text := '';
  end;
  var_msg.Free;
end;

procedure Tf_almacenes_000.Filtrar_Principal_queFiltro( var p_errores_Filtros : TStrings;
                                                        var p_Registro_CRUD : TRegistro_CRUD;
                                                        var p_ctdad_Rgtros  : Integer;
                                                        var p_a_Filtrar     : TStrings );
begin
  p_ctdad_Rgtros             := -1;
  p_Registro_CRUD.name_tabla := 'alm';
  p_Registro_CRUD.Delete_SQL := '';
  p_Registro_CRUD.Update_SQL := UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Principal,
                                                              'almacenes',
                                                              'u' );

  p_Registro_CRUD.Insert_SQL := UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Principal,
                                                              'almacenes',
                                                              'i' );

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  p_Registro_CRUD.SELECT_SQL := 'SELECT alm.*, ' + ' ' +

                                       'e.nombre_comercial AS OT_Descripcion_Empresa, ' + ' ' +

                                       'pb.descripcion AS OT_descripcion_poblacion, ' + ' ' +
                                       'pr.descripcion AS OT_descripcion_provincia, ' + ' ' +
                                       'ps.descripcion AS OT_descripcion_pais ' + ' ' +

                                'FROM almacenes AS alm ' + ' ' +

                                'LEFT JOIN empresas AS e ' + ' ' +
                                'ON alm.id_empresas = e.id ' + ' ' +

                                'LEFT JOIN poblaciones AS pb ' + ' ' +
                                'ON alm.id_poblaciones = pb.id ' + ' ' +

                                'LEFT JOIN provincias AS pr ' + ' ' +
                                'ON alm.id_provincias = pr.id ' + ' ' +

                                'LEFT JOIN paises AS ps ' + ' ' +
                                'ON alm.id_paises = ps.id ' + ' ';

  Filtrar_Principal_queFiltro_sus_Filtros( p_errores_Filtros, p_Registro_CRUD, p_ctdad_Rgtros, p_a_Filtrar );
end;

procedure Tf_almacenes_000.Filtrar_tablas_adicionales( var p_Lineas_Filtro : TStrings;
                                                       var p_Lineas_OrderBy : TStrings );
begin
  // *********************************************************************************************** //
  // ** no hay tablas ligadas                                                                     ** //
  // *********************************************************************************************** //
end;

procedure Tf_almacenes_000.Cambiar_Nombre_Tabla_Principal;
begin
  pubic_nombre_tabla_Principal := 'almacenes';
end;

procedure Tf_almacenes_000.Cambiar_Titulo_Form;
begin
  Self.Caption := rs_alm_001;
end;

procedure Tf_almacenes_000.Rellenar_Filtros_Impresion(var p_Ordenado_por : String);
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

procedure Tf_almacenes_000.Crear_tipos_orden_Principal;
begin
  SetLength(public_Order_By, 2);

  public_Order_By[0].Titulo       := rs_alm_004; // El índice 0 siempre será por el que empezará la aplicación y los filtros
  public_Order_By[0].Memo_OrderBy := 'alm.descripcion ASC';

  public_Order_By[1].Titulo       := rs_alm_005;
  public_Order_By[1].Memo_OrderBy := 'alm.id ASC';

  Memo_OrderBy.Lines.Text         := public_Order_By[0].Memo_OrderBy;

  UTI_TB_Rellenar_ComboBox_Orden( true,
                                  ComboBox_Filtros,
                                  public_Order_By,
                                  0 );
end;

procedure Tf_almacenes_000.Crear_OrderBy_tablas_adicionales;
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

procedure Tf_almacenes_000.Refrescar_Registros;
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
    SQLQuery_Principal.Locate( 'descripcion', var_descripcion, [] );
  end;
end;

procedure Tf_almacenes_000.Refrescar_Registros_TablasLigadas;
begin
  { Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo

  Refrescar_Tabla_001;
  Refrescar_Tabla_002;
  Refrescar_Tabla_003;
  }
end;

procedure Tf_almacenes_000.Presentar_Datos;
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

procedure Tf_almacenes_000.Presentar_Datos_GroupBox_Registro;
begin
  with SQLQuery_Principal do
  begin
    if RecordCount > 0 then
    begin
      Edit_Descripcion_Poblacion.Text := FieldByName('OT_descripcion_poblacion').AsString;
      Edit_Descripcion_Provincia.Text := FieldByName('OT_descripcion_provincia').AsString;
      Edit_Descripcion_Pais.Text      := FieldByName('OT_descripcion_pais').AsString;
      Edit_Descripcion_Empresa.Text   := FieldByName('OT_Descripcion_Empresa').AsString;
    end;
  end;
end;

procedure Tf_almacenes_000.para_Empezar_GroupBox_Registro;
begin
  with SQLQuery_Principal do
  begin
    public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                       '',
                                                       '',
                                                       FieldByName('descripcion').AsString,
                                                       '',
                                                       '' );
  end;

  Presentar_Datos_GroupBox_Registro;
end;

procedure Tf_almacenes_000.Cambiar_WindowState;
begin
  Self.WindowState := wsNormal; // Puede ser wsNormal, wsFullScreen, wsMaximized o wsMinimized
end;

procedure Tf_almacenes_000.Abrir_Conexiones_con_BD_TablasAdicionales;
begin
  { Hacer algo parecido a lo de abajo ... pero ojito sólo si hay otras transacciones y otros conectores.
    Lo lógico es que nada más que usemos los de la conexión principal, aunque sean otras tablas adicionales.

  Abrir_Conexion_con_BD( SQLTransaction_TablaHija001, SQLConnector_TablaHija001);
  Abrir_Conexion_con_BD( SQLTransaction_TablaHija002, SQLConnector_TablaHija002);
  }
end;

procedure Tf_almacenes_000.Cerramos_Tablas_Ligadas;
begin
  { Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo

  Cerrar_Tabla( Nil,
                Nil,
                SQLQuery_Tabla001 );
  }
end;

procedure Tf_almacenes_000.Dibujar_Grid_Principal( p_Sender: TObject;
                                                   const p_Rect: TRect;
                                                   p_DataCol: Integer;
                                                   p_Column: TColumn;
                                                   p_State: TGridDrawState );
begin
  UTI_GEN_Dibujar_Grid( p_Sender, SQLQuery_Principal, p_Rect, p_DataCol, p_Column, p_State );
end;

procedure Tf_almacenes_000.Antes_del_Post_Principal_Sin_Rellenar_Permitido_SI( p_msg : TStrings );
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

procedure Tf_almacenes_000.Antes_del_Post_Principal_Asignar_Valores;
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

procedure Tf_almacenes_000.Antes_del_Post_Principal_Sin_Rellenar_Permitido_NO( p_msg,
                                                                               p_msg_Comprobar : TStrings );
begin
  // *********************************************************************************************** //
  // ** Ahora vienen las comprobaciones de porque no grabamos                                     ** //
  // *********************************************************************************************** //
  with SQLQuery_Principal do
  begin

    if Trim(DBEdit_Descripcion.Text) <> '' then
         FieldByName('descripcion').asString := AnsiUpperCase(Trim(FieldByName('descripcion').AsString))
    else p_msg.Add( rs_alm_006 );

    if Trim(FieldByName('id_empresas').AsString) = '' then
    begin
      p_msg.Add( rs_alm_007 );
    end;

    if Trim(FieldByName('Direccion').AsString) = '' then
    begin
      p_msg.Add( rs_alm_008 );
    end;

    if Trim(FieldByName('id_poblaciones').AsString) = '' then
    begin
      p_msg.Add( rs_alm_009 );
    end;

    if Trim(FieldByName('id_provincias').AsString) = '' then
    begin
      p_msg.Add( rs_alm_010 );
    end;

    if Trim(FieldByName('id_paises').AsString) = '' then
    begin
      p_msg.Add( rs_alm_011 );
    end;

    if Trim(FieldByName('Responsable').AsString) = '' then
    begin
      p_msg.Add( rs_alm_012 );
    end;

  end;

end;

procedure Tf_almacenes_000.NewRecord_Insert_SQLQuery_Principal;
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

procedure Tf_almacenes_000.BitBtn_ver_direccion_en_MapsClick(Sender: TObject);
begin
  UTI_GEN_ver_direccion_en_Internet;
end;

procedure Tf_almacenes_000.Campo_Foco_en_modo_Edicion_Inserccion;
begin
  Self.ActiveControl := DBEdit_Descripcion;
end;

function Tf_almacenes_000.Fue_Utilizado_Rgtro_SQLQuery_Principal : ShortInt;
begin
  Result := 0;

end;

end.

