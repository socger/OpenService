unit impresoras_000;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, ComCtrls, DbCtrls, DBGrids, ButtonPanel, plantilla_000, Grids, Spin, utilidades_datos_tablas,
  types, utilidades_rgtro, utilidades_general, utilidades_bd, utilidades_forms_Filtrar, utilidades_usuarios,
  utilidades_Filtros, utilidades_impresoras;

resourcestring
  rs_impr_001 = 'Mantenimiento de impresoras';
  rs_impr_003 = 'Por la descripción';
  rs_impr_004 = 'Por la id';
  rs_impr_005 = '* La impresora';
  rs_impr_006 = 'No se pudo comprobar si ya existe la impresora.';
  rs_impr_007 = 'Impresora repetida.';

type

  { Tf_impresoras_000 }

  Tf_impresoras_000 = class(Tform_plantilla_000)
    BitBtn_Considerar_como_cerrado: TBitBtn;
    Boton_Elegir_Impresora: TBitBtn;
    DBCheckBox1: TDBCheckBox;
    Edit_Descripcion_Impresora: TEdit;
    Image_Predeterminada: TImage;
    Label17: TLabel;
    Label_Copias: TLabel;
    Panel16: TPanel;
    SpinEdit_Copias: TSpinEdit;
    SQLQuery_PrincipalChange_Id_User: TLargeintField;
    SQLQuery_PrincipalChange_WHEN: TDateTimeField;
    SQLQuery_PrincipalCopias_a_Imprimir: TLongintField;
    SQLQuery_PrincipalDel_Id_User: TLargeintField;
    SQLQuery_PrincipalDel_WHEN: TDateTimeField;
    SQLQuery_PrincipalDel_WHY: TStringField;
    SQLQuery_Principaldescripcion: TStringField;
    SQLQuery_PrincipalInsert_Id_User: TLargeintField;
    SQLQuery_PrincipalInsert_WHEN: TDateTimeField;
    SQLQuery_Principalpredeterminada_SN: TStringField;

    procedure BitBtn_Considerar_como_cerradoClick(Sender: TObject);
    procedure Boton_Elegir_ImpresoraClick(Sender: TObject);
    procedure Edit_Descripcion_ImpresoraClick(Sender: TObject);

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
  f_impresoras_000: Tf_impresoras_000;

implementation

{$R *.lfm}

uses menu;

procedure Tf_impresoras_000.Filtrar_Principal_queFiltro( var p_errores_Filtros : TStrings;
                                                         var p_Registro_CRUD : TRegistro_CRUD;
                                                         var p_ctdad_Rgtros  : Integer;
                                                         var p_a_Filtrar     : TStrings );
begin
  p_ctdad_Rgtros             := -1;
  p_Registro_CRUD.name_tabla := 'i';
  p_Registro_CRUD.Delete_SQL := '';
  p_Registro_CRUD.Update_SQL := UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Principal,
                                                              'impresoras',
                                                              'u' );

  p_Registro_CRUD.Insert_SQL := UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Principal,
                                                              'impresoras',
                                                              'i' );

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  p_Registro_CRUD.SELECT_SQL := 'SELECT i.*' + ' ' +
                                'FROM impresoras AS i' + ' ';

  UTI_FILTROS_pasarFiltros_aQuery( SQLQuery_Principal, SQLQuery_Filtros, p_errores_Filtros, p_Registro_CRUD, p_ctdad_Rgtros, p_a_Filtrar );
end;

procedure Tf_impresoras_000.Filtrar_tablas_adicionales( var p_Lineas_Filtro : TStrings;
                                                        var p_Lineas_OrderBy : TStrings );
begin
  // *********************************************************************************************** //
  // ** no hay tablas ligadas                                                                     ** //
  // *********************************************************************************************** //
end;

procedure Tf_impresoras_000.Boton_Elegir_ImpresoraClick(Sender: TObject);
var var_Impresora_Predeterminada : TImpresora_Predeterminada;
    var_msg                      : TStrings;
begin
  if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = true then
  begin
    var_Impresora_Predeterminada := UTI_IMPRESORAS_Elegir_Impresora;
    if UpperCase(var_Impresora_Predeterminada.Error) = 'N' then
    begin
      with SQLQuery_Principal do
      begin
        FieldByName('descripcion').AsString       := var_Impresora_Predeterminada.Impresora_descripcion_Elegida;
        FieldByName('Copias_a_Imprimir').AsString := var_Impresora_Predeterminada.Impresora_Ctdad_Copias;
      end;

      Edit_Descripcion_Impresora.Text := var_Impresora_Predeterminada.Impresora_descripcion_Elegida;
      SpinEdit_Copias.Value           := StrToInt(var_Impresora_Predeterminada.Impresora_Ctdad_Copias);
    end else
    begin
      var_msg := TStringList.Create;
      var_msg.Clear;
      var_msg.Add('No se pudo elegir una impresora.');
      UTI_GEN_Aviso(true, var_msg, rs_Falta, True, False);
      var_msg.Free;
    end;

  end;

end;

procedure Tf_impresoras_000.Edit_Descripcion_ImpresoraClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS la impresora');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         SQLQuery_Principal.FieldByName('descripcion').Clear;
         Edit_Descripcion_Impresora.Text := '';
    end;
    var_msg.Free;
end;

procedure Tf_impresoras_000.Cambiar_Nombre_Tabla_Principal;
begin
  pubic_nombre_tabla_Principal := 'impresoras';
end;

procedure Tf_impresoras_000.Cambiar_Titulo_Form;
begin
  Self.Caption := rs_impr_001;
end;

procedure Tf_impresoras_000.Rellenar_Filtros_Impresion(var p_Ordenado_por : String);
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

procedure Tf_impresoras_000.Crear_tipos_orden_Principal;
begin
  SetLength(public_Order_By, 2);

  public_Order_By[0].Titulo       := rs_impr_003; // El índice 0 siempre será por el que empezará la aplicación y los filtros
  public_Order_By[0].Memo_OrderBy := 'i.descripcion ASC';

  public_Order_By[1].Titulo       := rs_impr_004;
  public_Order_By[1].Memo_OrderBy := 'i.id ASC';

  Memo_OrderBy.Lines.Text          := public_Order_By[0].Memo_OrderBy;

  UTI_TB_Rellenar_ComboBox_Orden( true,
                                  ComboBox_Filtros,
                                  public_Order_By,
                                  0 );
end;

procedure Tf_impresoras_000.Crear_OrderBy_tablas_adicionales;
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

procedure Tf_impresoras_000.Refrescar_Registros;
var var_descripcion : String;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_descripcion := '';

    if SQLQuery_Principal.RecordCount > 0 then
    begin
        var_descripcion := SQLQuery_Principal.FieldByName('descripcion').Value;
    end;

    Filtrar_Principal_Sin_Preguntar;

    if Trim(var_descripcion) <> '' then
    begin
      SQLQuery_Principal.Locate('descripcion', var_descripcion, []);
    end;
end;

procedure Tf_impresoras_000.Refrescar_Registros_TablasLigadas;
begin
  { Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo

  Refrescar_Tabla_001;
  Refrescar_Tabla_002;
  Refrescar_Tabla_003;
  }
end;

procedure Tf_impresoras_000.Presentar_Datos;
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

procedure Tf_impresoras_000.Presentar_Datos_GroupBox_Registro;
begin
  with SQLQuery_Principal do
  begin
    if RecordCount > 0 then
    begin
      Edit_Descripcion_Impresora.Text := FieldByName('descripcion').AsString;

      if Trim(FieldByName('Copias_a_Imprimir').AsString) <> '' then
      begin
        SpinEdit_Copias.Value := FieldByName('Copias_a_Imprimir').Value;
      end;
    end;
  end;
end;

procedure Tf_impresoras_000.para_Empezar_GroupBox_Registro;
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

procedure Tf_impresoras_000.Cambiar_WindowState;
begin
  Self.WindowState := wsNormal; // Puede ser wsNormal, wsFullScreen, wsMaximized o wsMinimized
end;

procedure Tf_impresoras_000.Abrir_Conexiones_con_BD_TablasAdicionales;
begin
  { Hacer algo parecido a lo de abajo ... pero ojito sólo si hay otras transacciones y otros conectores.
    Lo lógico es que nada más que usemos los de la conexión principal, aunque sean otras tablas adicionales.

  Abrir_Conexion_con_BD( SQLTransaction_TablaHija001, SQLConnector_TablaHija001);
  Abrir_Conexion_con_BD( SQLTransaction_TablaHija002, SQLConnector_TablaHija002);
  }
end;

procedure Tf_impresoras_000.Cerramos_Tablas_Ligadas;
begin
  { Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo

  Cerrar_Tabla( Nil,
                Nil,
                SQLQuery_Tabla001 );
  }
end;

procedure Tf_impresoras_000.Dibujar_Grid_Principal( p_Sender: TObject;
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

      // ***************************************************************************************** //
      // ** Primero comprobamos si es un registro dado de baja o no                             ** //
      // ***************************************************************************************** //
      if not SQLQuery_Principal.FieldByName('Del_WHEN').IsNull then
      begin
          // ********************************************************************************* //
          // ** Registro DADO de BAJA                                                       ** //
          // ********************************************************************************* //
          Canvas.Font.Color := clSilver;
      end else begin
          // ********************************************************************************* //
          // ** Registro DADO de ALTA, NO BAJA                                              ** //
          // ********************************************************************************* //
          // ** Así que las pinto, pero sólo si no son las columnas que van a               ** //
          // ** ser dibujadas                                                               ** //
          // ********************************************************************************* //
          if p_State <> [gdSelected] then
          begin
              if (p_Column.FieldName <> 'predeterminada') then
              begin
                  Canvas.font.Color := clBlack;
              end;
          end;
      end;

      // ***************************************************************************************** //
      // ** Ahora paso a dibujar una celda normal con los colores elegidos o una                ** //
      // ** dibujada                                                                            ** //
      // ***************************************************************************************** //
      if (p_Column.FieldName <> 'predeterminada') then
      begin
          // ********************************************************************************* //
          // ** No es una de las columnas a dibujar por lo que la pinto con los             ** //
          // ** colores elegidos                                                            ** //
          // ********************************************************************************* //
          DefaultDrawColumnCell(p_Rect, p_DataCol, p_Column, p_State);
      end else begin
          // ********************************************************************************* //
          // ** Es una de las columnas a dibujar                                            ** //
          // ********************************************************************************* //
          // ** COLUMNA CONFIRMADA                                                          ** //
          // ********************************************************************************* //
          if p_Column.FieldName = 'predeterminada'  then
          begin
              if SQLQuery_Principal.FieldByName('predeterminada_SN').Value = 'S' then
                   Canvas.StretchDraw(p_Rect, Image_Predeterminada.Picture.Graphic)
              else DefaultDrawColumnCell(p_Rect, p_DataCol, p_Column, p_State);
          end;
      end;

      Canvas.Font.Color := var_Color_Normal;
  end;
end;

procedure Tf_impresoras_000.BitBtn_Considerar_como_cerradoClick(Sender: TObject);
var var_msg : TStrings;
begin
  with SQLQuery_Principal do
  begin
    if RecordCount <> 0 then
    begin
      if UTI_IMPRESORAS_Crear_Predeterminada( FieldByName('id').AsString,
                                              FieldByName('descripcion').AsString ) = false then
      begin
        var_msg := TStringList.Create;
        var_msg.Add('No se pudo poner como predeterminada.');
        UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        var_msg.Free;
      end else begin
        // ********************************************************************************* //
        // ** Refrescar los registros para presentar la nueva impresora predeterminada    ** //
        // ********************************************************************************* //
        Refrescar_Registros;

        // ********************************************************************************* //
        // ** Asignamos a la aplicación cual es la impresora predeterminada y cantidad de ** //
        // ** copias preconfiguradas cuando se use                                        ** //
        // ********************************************************************************* //
        form_menu.Traer_Impresora_Predeterminada;
      end;
    end else
    begin

    end;
  end;
end;

procedure Tf_impresoras_000.Antes_del_Post_Principal_Sin_Rellenar_Permitido_SI( p_msg : TStrings );
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

procedure Tf_impresoras_000.Antes_del_Post_Principal_Asignar_Valores;
begin
  // *********************************************************************************************** //
  // ** Asignamos valores si no los tenían                                                        ** //
  // *********************************************************************************************** //
  with SQLQuery_Principal do
  begin
    if FieldByName('predeterminada_SN').IsNull then
    begin
      FieldByName('predeterminada_SN').AsString := 'N';
    end;

    FieldByName('Copias_a_Imprimir').Value := SpinEdit_Copias.Value;

  end;

end;

procedure Tf_impresoras_000.Antes_del_Post_Principal_Sin_Rellenar_Permitido_NO( p_msg,
                                                                                p_msg_Comprobar : TStrings );
var
  var_Campos_para_Existe_ya : Array of TCampos_para_Existe_ya;
  var_record_Existe         : Trecord_Existe;

begin
  // *********************************************************************************************** //
  // ** Ahora vienen las comprobaciones de porque no grabamos                                     ** //
  // *********************************************************************************************** //
  with SQLQuery_Principal do
  begin
    if Trim(FieldByName('descripcion').AsString) = '' then
    begin
      p_msg.Add( rs_impr_005);
    end;

    // ********************************************************************************************* //
    // ** Comprobamos que la cuenta contable no esté ya creada para otra cuenta bancaria          ** //
    // ********************************************************************************************* //
(*
    if var_record_Existe.Fallo_en_Conexion_BD = true then
    begin
      Result := false;
    end else
    begin
      if var_record_Existe.Existe = true then
      begin
        Result := false;

        var_msg := TStringList.Create;

        var_msg.Clear;
        var_msg.Add( 'Impresora repetida.');

        if UpperCase(var_record_Existe.deBaja) = 'S' then
        begin
          var_msg.Add(rs_Rgtro_Borrado);
        end;

        UTI_GEN_Aviso(true, var_msg, rs_Ya_Existe, True, False);

        var_msg.Free;
      end;
    end;

*)
    if SQLQuery_Principal.State = dsInsert then
    begin
      SetLength(var_Campos_para_Existe_ya, 1);

      var_Campos_para_Existe_ya[0].Campo_Valor  := FieldByName('descripcion').AsString;
      var_Campos_para_Existe_ya[0].Campo_Nombre := 'descripcion';
      var_Campos_para_Existe_ya[0].Campo_Tipo   := 1; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

      var_record_Existe := UTI_RGTRO_Existe_Ya( 'impresoras',                          // param_nombre_tabla
                                                'ORDER BY impresoras.descripcion ASC', // param_order_by
                                                '',                                    // param_id_a_no_traer ... Estoy insertando
                                                var_Campos_para_Existe_ya );           // param_Campos_para_Existe_ya
    end;

    if SQLQuery_Principal.State = dsEdit then
    begin
      SetLength(var_Campos_para_Existe_ya, 1);

      var_Campos_para_Existe_ya[0].Campo_Valor  := FieldByName('descripcion').AsString;
      var_Campos_para_Existe_ya[0].Campo_Nombre := 'descripcion';
      var_Campos_para_Existe_ya[0].Campo_Tipo   := 1; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

      var_record_Existe := UTI_RGTRO_Existe_Ya( 'impresoras',                          // param_nombre_tabla
                                                'ORDER BY impresoras.descripcion ASC', // param_order_by
                                                FieldByName('id').AsString,            // param_id_a_no_traer ... Estoy insertando
                                                var_Campos_para_Existe_ya );           // param_Campos_para_Existe_ya
    end;

    if (SQLQuery_Principal.State = dsInsert) or
       (SQLQuery_Principal.State = dsEdit)   then
    begin
      if var_record_Existe.Fallo_en_Conexion_BD = true then
      begin
        p_msg.Add( rs_impr_006 );
      end
      else
      begin
        if var_record_Existe.Existe = true then
        begin
          p_msg.Add( rs_impr_007 );

          if UpperCase(var_record_Existe.deBaja) = 'S' then
          begin
            p_msg.Add(rs_Rgtro_Borrado);
          end;
        end;

      end;
    end;

  end;

end;

procedure Tf_impresoras_000.NewRecord_Insert_SQLQuery_Principal;
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

procedure Tf_impresoras_000.Campo_Foco_en_modo_Edicion_Inserccion;
begin
  Self.ActiveControl := Boton_Elegir_Impresora;
end;

function Tf_impresoras_000.Fue_Utilizado_Rgtro_SQLQuery_Principal : ShortInt;
begin
  Result := 0;

end;

end.

