unit utilidades_Filtros;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, utilidades_forms_Filtrar, utilidades_rgtro, sqldb, DBGrids, ExtDlgs, variants,
  utilidades_general, utilidades_bd, utilidades_datos_tablas, db, StdCtrls;

procedure UTI_FILTROS_vaciarlos( p_SQLQuery_Filtros : TSQLQuery; p_DBGrid_Filtros : TDBGrid );
procedure UTI_FILTROS_Esta_a_ReadOnLy( p_SQLQuery_Filtros : TSQLQuery; p_DBGrid_Filtros : TDBGrid );
procedure UTI_FILTROS_DobleClick_o_Enter( p_CalendarDialog: TCalendarDialog; p_SQLQuery_Principal, p_SQLQuery_Filtros : TSQLQuery; p_DBGrid_Filtros : TDBGrid );
procedure UTI_FILTROS_onEnter_enGrid( p_SQLQuery_Principal, p_SQLQuery_Filtros : TSQLQuery; p_DBGrid_Filtros : TDBGrid );
function  UTI_FILTROS_Traer_Filtros( p_SQLConnector_Principal: TSQLConnector; p_SQLTransaction_Principal: TSQLTransaction; p_SQLQuery_Filtros : TSQLQuery; p_Order_By_Filtros : array of TOrder_By; p_ver_bajas : ShortInt; p_Cambiamos_Filtro : Boolean; p_Lineas_Filtro, p_Lineas_OrderBy : TStrings ) : ShortInt;
procedure UTI_FILTROS_Refrescar_Filtros( p_SQLConnector_Principal: TSQLConnector; p_SQLTransaction_Principal: TSQLTransaction; p_Order_By_Filtros : array of TOrder_By; p_ver_Bajas : ShortInt; p_Menu_Worked : Integer; p_SQLQuery_Principal, p_SQLQuery_Filtros : TSQLQuery );
procedure UTI_FILTROS_Guardar_Cambios_de_Filtros(p_SQLQuery_Filtros : TSQLQuery);
procedure UTI_FILTROS_pasarFiltros_aQuery( p_SQLQuery_Principal, p_SQLQuery_Filtros : TSQLQuery; var p_errores_Filtros : TStrings; var p_Registro_CRUD : TRegistro_CRUD; var p_ctdad_Rgtros : Integer; var p_a_Filtrar : TStrings );

procedure UTI_FILTROS_queFiltro_es_Numero( p_SQLQuery_Filtros : TSQLQuery; p_errores : TStrings; var p_Registro_CRUD : TRegistro_CRUD; var p_ctdad_Rgtros : Integer; var p_a_Filtrar : TStrings );
procedure UTI_FILTROS_queFiltro_es_Numero_Comprobar_Errores( p_SQLQuery_Filtros : TSQLQuery; p_errores : TStrings );
procedure UTI_FILTROS_queFiltro_es_Numero_Crear_Filtro( p_SQLQuery_Filtros : TSQLQuery; p_SQL_ADD : TStrings; var p_Registro_CRUD : TRegistro_CRUD; var p_ctdad_Rgtros : Integer; var p_a_Filtrar : TStrings );
procedure UTI_FILTROS_queFiltro_sonIGUALES( p_SQL_ADD : TStrings; p_que_es : Integer; p_Desde_Valor : AnsiString; p_Hasta_Valor : AnsiString; p_Desde_Valor_parte_de_SQL_antes : AnsiString; p_Desde_Valor_parte_de_SQL_despues : AnsiString; p_Hasta_Valor_parte_de_SQL_antes : AnsiString; p_Hasta_Valor_parte_de_SQL_despues : AnsiString; p_nombre_campo : String; var p_Registro_CRUD : TRegistro_CRUD; var p_ctdad_Rgtros : Integer; var p_a_Filtrar : TStrings );
procedure UTI_FILTROS_Rellenamos_antes_despues( p_SQL_ADD : TStrings; p_que_es : Integer; p_valor : AnsiString; p_SQL_antes : AnsiString; p_SQL_despues : AnsiString );
procedure UTI_FILTROS_queFiltro_sonDIFERENTES( p_SQL_ADD : TStrings; p_que_es : Integer; p_Desde_Valor : AnsiString; p_Hasta_Valor : AnsiString; p_Desde_Valor_parte_de_SQL_antes : AnsiString; p_Desde_Valor_parte_de_SQL_despues : AnsiString; p_Hasta_Valor_parte_de_SQL_antes : AnsiString; p_Hasta_Valor_parte_de_SQL_despues : AnsiString; p_nombre_campo : String; var p_Registro_CRUD : TRegistro_CRUD; var p_ctdad_Rgtros : Integer; var p_a_Filtrar : TStrings );
procedure UTI_FILTROS_queFiltro_sinRELLENAR( p_SQL_ADD : TStrings; p_que_es : Integer; p_Desde_Valor : AnsiString; p_Hasta_Valor : AnsiString; p_Desde_Valor_parte_de_SQL_antes : AnsiString; p_Desde_Valor_parte_de_SQL_despues : AnsiString; p_Hasta_Valor_parte_de_SQL_antes : AnsiString; p_Hasta_Valor_parte_de_SQL_despues : AnsiString; p_nombre_campo : String; var p_Registro_CRUD : TRegistro_CRUD; var p_ctdad_Rgtros : Integer; var p_a_Filtrar : TStrings );

procedure UTI_FILTROS_queFiltro_es_Texto( p_SQLQuery_Filtros : TSQLQuery; p_errores : TStrings; var p_Registro_CRUD : TRegistro_CRUD; var p_ctdad_Rgtros : Integer; var p_a_Filtrar : TStrings );
procedure UTI_FILTROS_queFiltro_es_Texto_Comprobar_Errores( p_SQLQuery_Filtros : TSQLQuery; p_errores : TStrings );
procedure UTI_FILTROS_queFiltro_es_Texto_Crear_Filtro( p_SQLQuery_Filtros : TSQLQuery; p_SQL_ADD : TStrings; var p_Registro_CRUD : TRegistro_CRUD; var p_ctdad_Rgtros : Integer; var p_a_Filtrar : TStrings );

procedure UTI_FILTROS_queFiltro_es_DiaHora( p_SQLQuery_Filtros : TSQLQuery; p_errores : TStrings; var p_Registro_CRUD : TRegistro_CRUD; var p_ctdad_Rgtros : Integer; var p_a_Filtrar : TStrings );
procedure UTI_FILTROS_queFiltro_es_DiaHora_Comprobar_Errores( p_SQLQuery_Filtros : TSQLQuery; p_errores : TStrings );
procedure UTI_FILTROS_queFiltro_es_DiaHora_Crear_Filtro( p_SQLQuery_Filtros : TSQLQuery; p_SQL_ADD : TStrings; var p_Registro_CRUD : TRegistro_CRUD; var p_ctdad_Rgtros : Integer; var p_a_Filtrar : TStrings );

procedure UTI_FILTROS_queFiltro_es_Dia( p_SQLQuery_Filtros : TSQLQuery; p_errores : TStrings; var p_Registro_CRUD : TRegistro_CRUD; var p_ctdad_Rgtros : Integer; var p_a_Filtrar : TStrings );
procedure UTI_FILTROS_queFiltro_es_Dia_Comprobar_Errores( p_SQLQuery_Filtros : TSQLQuery; p_errores : TStrings );
procedure UTI_FILTROS_queFiltro_es_Dia_Crear_Filtro( p_SQLQuery_Filtros : TSQLQuery; p_SQL_ADD : TStrings; var p_Registro_CRUD : TRegistro_CRUD; var p_ctdad_Rgtros : Integer; var p_a_Filtrar : TStrings );

procedure UTI_FILTROS_queFiltro_es_Hora( p_SQLQuery_Filtros : TSQLQuery; p_errores : TStrings; var p_Registro_CRUD : TRegistro_CRUD; var p_ctdad_Rgtros : Integer; var p_a_Filtrar : TStrings );
procedure UTI_FILTROS_queFiltro_es_Hora_Comprobar_Errores( p_SQLQuery_Filtros : TSQLQuery; p_errores : TStrings );
procedure UTI_FILTROS_queFiltro_es_Hora_Crear_Filtro( p_SQLQuery_Filtros : TSQLQuery; p_SQL_ADD : TStrings; var p_Registro_CRUD : TRegistro_CRUD; var p_ctdad_Rgtros : Integer; var p_a_Filtrar : TStrings );

procedure UTI_FILTROS_Cambiamos_Orden_SN( p_Lineas_OrderBy : TStrings; p_OrderBy : String );
procedure UTI_FILTROS_Rellenamos_Filtros_SN( p_Filtros : AnsiString; p_OrderBy : AnsiString; p_Memo_Filtros : TMemo; p_Memo_OrderBy : TMemo );

implementation

// uses plantilla_000;

procedure UTI_FILTROS_Rellenamos_Filtros_SN( p_Filtros       : AnsiString;
                                             p_OrderBy       : AnsiString;
                                             p_Memo_Filtros  : TMemo;
                                             p_Memo_OrderBy  : TMemo );
begin
  if Trim(p_Filtros) <> '' then
    p_Memo_Filtros.Lines.Add(p_Filtros);

  if Trim(p_OrderBy) <> '' then
    p_Memo_OrderBy.Lines.Add(p_OrderBy);

end;

procedure UTI_FILTROS_Cambiamos_Orden_SN( p_Lineas_OrderBy : TStrings;
                                          p_OrderBy : String );
begin
  if Trim(p_Lineas_OrderBy.Text) = '' then
    p_Lineas_OrderBy.Text := p_OrderBy;

end;

procedure UTI_FILTROS_queFiltro_es_Hora_Crear_Filtro( p_SQLQuery_Filtros  : TSQLQuery;
                                                      p_SQL_ADD           : TStrings;
                                                      var p_Registro_CRUD : TRegistro_CRUD;
                                                      var p_ctdad_Rgtros  : Integer;
                                                      var p_a_Filtrar     : TStrings );
var
  v_Desde_Valor                      : AnsiString;
  v_Hasta_Valor                      : AnsiString;
  v_Desde_Valor_parte_de_SQL_antes   : AnsiString;
  v_Desde_Valor_parte_de_SQL_despues : AnsiString;
  v_Hasta_Valor_parte_de_SQL_antes   : AnsiString;
  v_Hasta_Valor_parte_de_SQL_despues : AnsiString;
  v_nombre_campo                     : String;
begin
  v_nombre_campo                     := p_SQLQuery_Filtros.FieldByName('nombre_campo').asString;
  v_Desde_Valor                      := p_SQLQuery_Filtros.FieldByName('Desde_Valor').asString;
  v_Hasta_Valor                      := p_SQLQuery_Filtros.FieldByName('Hasta_Valor').asString;
  v_Desde_Valor_parte_de_SQL_antes   := p_SQLQuery_Filtros.FieldByName('Desde_Valor_parte_de_SQL_antes').asString;
  v_Desde_Valor_parte_de_SQL_despues := p_SQLQuery_Filtros.FieldByName('Desde_Valor_parte_de_SQL_despues').asString;
  v_Hasta_Valor_parte_de_SQL_antes   := p_SQLQuery_Filtros.FieldByName('Hasta_Valor_parte_de_SQL_antes').asString;
  v_Hasta_Valor_parte_de_SQL_despues := p_SQLQuery_Filtros.FieldByName('Hasta_Valor_parte_de_SQL_despues').asString;

  // Lo intruducido en el filtro un TDateTime

  // Esto lo hago porque si pones en una fecha por ejemplo ... 12
  // lazarus lo completa con 12/mesactual/añoactual y el usuario se pierde que ha ocurrido porque no da error
  // Así que lo traduzco para que sea visible para el usuario
  if (Trim(v_Desde_Valor) <> '') and
     (not p_SQLQuery_Filtros.FieldByName('Desde_Valor').isNull)           then
  begin
    p_SQLQuery_Filtros.Edit;
    p_SQLQuery_Filtros.FieldByName('Desde_Valor').Value := StrToTime(v_Desde_Valor);
    p_SQLQuery_Filtros.Post;
  end;

  if (Trim(v_Hasta_Valor) <> '') and
     (not p_SQLQuery_Filtros.FieldByName('Hasta_Valor').isNull)           then
  begin
    p_SQLQuery_Filtros.Edit;
    p_SQLQuery_Filtros.FieldByName('Hasta_Valor').Value := StrToTime(v_Hasta_Valor);
    p_SQLQuery_Filtros.Post;
  end;

  if (Trim(v_Hasta_Valor) <> '') and
     (Trim(v_Desde_Valor) <> '') then
  begin
    // ESTAN RELLENADOS EL DESDE Y EL HASTA
    if p_SQLQuery_Filtros.FieldByName('Hasta_Valor').Value = p_SQLQuery_Filtros.FieldByName('Desde_Valor').Value then
      UTI_FILTROS_queFiltro_sonIGUALES( p_SQL_ADD,
                                        5, // ES NUMERO
                                        v_Desde_Valor,
                                        v_Hasta_Valor,
                                        v_Desde_Valor_parte_de_SQL_antes,
                                        v_Desde_Valor_parte_de_SQL_despues,
                                        v_Hasta_Valor_parte_de_SQL_antes,
                                        v_Hasta_Valor_parte_de_SQL_despues,
                                        v_nombre_campo,
                                        p_Registro_CRUD,
                                        p_ctdad_Rgtros,
                                        p_a_Filtrar )
    else
      UTI_FILTROS_queFiltro_sonDIFERENTES( p_SQL_ADD,
                                           5, // p_que_es ... Hora
                                           v_Desde_Valor,
                                           v_Hasta_Valor,
                                           v_Desde_Valor_parte_de_SQL_antes,
                                           v_Desde_Valor_parte_de_SQL_despues,
                                           v_Hasta_Valor_parte_de_SQL_antes,
                                           v_Hasta_Valor_parte_de_SQL_despues,
                                           v_nombre_campo,
                                           p_Registro_CRUD,
                                           p_ctdad_Rgtros,
                                           p_a_Filtrar );
  end

  else
    UTI_FILTROS_queFiltro_sinRELLENAR( p_SQL_ADD,
                                       5, // ES dia/hora
                                       v_Desde_Valor,
                                       v_Hasta_Valor,
                                       v_Desde_Valor_parte_de_SQL_antes,
                                       v_Desde_Valor_parte_de_SQL_despues,
                                       v_Hasta_Valor_parte_de_SQL_antes,
                                       v_Hasta_Valor_parte_de_SQL_despues,
                                       v_nombre_campo,
                                       p_Registro_CRUD,
                                       p_ctdad_Rgtros,
                                       p_a_Filtrar );
end;

procedure UTI_FILTROS_queFiltro_es_Hora_Comprobar_Errores( p_SQLQuery_Filtros : TSQLQuery;
                                                           p_errores : TStrings );
var
  v_Error       : String;
  v_Desde_Valor : String;
  v_Hasta_Valor : String;
begin
  v_Desde_Valor := p_SQLQuery_Filtros.FieldByName('Desde_Valor').asString;
  v_Hasta_Valor := p_SQLQuery_Filtros.FieldByName('Hasta_Valor').asString;

  // Comprobamos si lo introducido para filtrar es una hora
  v_Error := UTI_GEN_Comprobar_Introducido_es_Hora( v_Desde_Valor,
                                                    p_SQLQuery_Filtros.FieldByName('Descripcion').asString );
  if Trim(v_Error) <> '' then
    p_errores.Add(v_Error);

  // Comprobamos si lo introducido para filtrar es una hora
  v_Error := UTI_GEN_Comprobar_Introducido_es_Hora( v_Hasta_Valor,
                                                    p_SQLQuery_Filtros.FieldByName('Descripcion').asString );
  if Trim(v_Error) <> '' then
    p_errores.Add(v_Error);

  // Comprobamos si lo introducido para filtrar, su valor hasta no es menor que su valor desde
  if (Trim(v_Hasta_Valor) <> '') and
     (Trim(v_Desde_Valor) <> '') then
  begin
    if (not p_SQLQuery_Filtros.FieldByName('Hasta_Valor').IsNull) and
       (not p_SQLQuery_Filtros.FieldByName('Desde_Valor').IsNull)  then
    begin
      Try
        if StrToTime(v_Hasta_Valor, FormatSettings) < StrToTime(v_Desde_Valor, FormatSettings) then
          p_errores.Add( '* El valor HASTA es menor que el valor DESDE del filtro <<' + p_SQLQuery_Filtros.FieldByName('Descripcion').asString + '>>');
      Except
      end;
    end;
  end;

end;

procedure UTI_FILTROS_queFiltro_es_Hora( p_SQLQuery_Filtros  : TSQLQuery;
                                         p_errores           : TStrings;
                                         var p_Registro_CRUD : TRegistro_CRUD;
                                         var p_ctdad_Rgtros  : Integer;
                                         var p_a_Filtrar     : TStrings );
var
  var_SQL_ADD : TStrings;
begin
  var_SQL_ADD := TStringList.Create;

  UTI_FILTROS_queFiltro_es_Hora_Comprobar_Errores( p_SQLQuery_Filtros, p_errores );

  // Si no hay errores pues pasamos el filtro
  if Trim(p_errores.Text) = '' then
    UTI_FILTROS_queFiltro_es_Hora_Crear_Filtro( p_SQLQuery_Filtros,
                                                var_SQL_ADD,
                                                p_Registro_CRUD,
                                                p_ctdad_Rgtros,
                                                p_a_Filtrar );

  var_SQL_ADD.Free;
end;

procedure UTI_FILTROS_queFiltro_es_Dia_Crear_Filtro( p_SQLQuery_Filtros  : TSQLQuery;
                                                     p_SQL_ADD           : TStrings;
                                                     var p_Registro_CRUD : TRegistro_CRUD;
                                                     var p_ctdad_Rgtros  : Integer;
                                                     var p_a_Filtrar     : TStrings );
var
  v_Desde_Valor                      : AnsiString;
  v_Hasta_Valor                      : AnsiString;
  v_Desde_Valor_parte_de_SQL_antes   : AnsiString;
  v_Desde_Valor_parte_de_SQL_despues : AnsiString;
  v_Hasta_Valor_parte_de_SQL_antes   : AnsiString;
  v_Hasta_Valor_parte_de_SQL_despues : AnsiString;
  v_nombre_campo                     : String;
begin
  v_nombre_campo                     := p_SQLQuery_Filtros.FieldByName('nombre_campo').asString;
  v_Desde_Valor                      := p_SQLQuery_Filtros.FieldByName('Desde_Valor').asString;
  v_Hasta_Valor                      := p_SQLQuery_Filtros.FieldByName('Hasta_Valor').asString;
  v_Desde_Valor_parte_de_SQL_antes   := p_SQLQuery_Filtros.FieldByName('Desde_Valor_parte_de_SQL_antes').asString;
  v_Desde_Valor_parte_de_SQL_despues := p_SQLQuery_Filtros.FieldByName('Desde_Valor_parte_de_SQL_despues').asString;
  v_Hasta_Valor_parte_de_SQL_antes   := p_SQLQuery_Filtros.FieldByName('Hasta_Valor_parte_de_SQL_antes').asString;
  v_Hasta_Valor_parte_de_SQL_despues := p_SQLQuery_Filtros.FieldByName('Hasta_Valor_parte_de_SQL_despues').asString;

  // Lo intruducido en el filtro un TDateTime

  // Esto lo hago porque si pones en una fecha por ejemplo ... 12
  // lazarus lo completa con 12/mesactual/añoactual y el usuario se pierde que ha ocurrido porque no da error
  // Así que lo traduzco para que sea visible para el usuario
  if (Trim(v_Desde_Valor) <> '') and
     (not p_SQLQuery_Filtros.FieldByName('Desde_Valor').isNull)           then
  begin
    p_SQLQuery_Filtros.Edit;
    p_SQLQuery_Filtros.FieldByName('Desde_Valor').Value := StrToDate(v_Desde_Valor);
    p_SQLQuery_Filtros.Post;
  end;

  if (Trim(v_Hasta_Valor) <> '') and
     (not p_SQLQuery_Filtros.FieldByName('Hasta_Valor').isNull)           then
  begin
    p_SQLQuery_Filtros.Edit;
    p_SQLQuery_Filtros.FieldByName('Hasta_Valor').Value := StrToDate(v_Hasta_Valor);
    p_SQLQuery_Filtros.Post;
  end;

  // Continuamos con la comprobación del filtro
  if (Trim(v_Hasta_Valor) <> '') and
     (Trim(v_Desde_Valor) <> '') then
  begin
    // ESTAN RELLENADOS EL DESDE Y EL HASTA
    if p_SQLQuery_Filtros.FieldByName('Hasta_Valor').Value = p_SQLQuery_Filtros.FieldByName('Desde_Valor').Value then
      UTI_FILTROS_queFiltro_sonIGUALES( p_SQL_ADD,
                                        4, // ES DIA
                                        v_Desde_Valor,
                                        v_Hasta_Valor,
                                        v_Desde_Valor_parte_de_SQL_antes,
                                        v_Desde_Valor_parte_de_SQL_despues,
                                        v_Hasta_Valor_parte_de_SQL_antes,
                                        v_Hasta_Valor_parte_de_SQL_despues,
                                        v_nombre_campo,
                                        p_Registro_CRUD,
                                        p_ctdad_Rgtros,
                                        p_a_Filtrar )
    else
      UTI_FILTROS_queFiltro_sonDIFERENTES( p_SQL_ADD,
                                           4, // p_que_es ... dia
                                           v_Desde_Valor,
                                           v_Hasta_Valor,
                                           v_Desde_Valor_parte_de_SQL_antes,
                                           v_Desde_Valor_parte_de_SQL_despues,
                                           v_Hasta_Valor_parte_de_SQL_antes,
                                           v_Hasta_Valor_parte_de_SQL_despues,
                                           v_nombre_campo,
                                           p_Registro_CRUD,
                                           p_ctdad_Rgtros,
                                           p_a_Filtrar );
  end

  else
    UTI_FILTROS_queFiltro_sinRELLENAR( p_SQL_ADD,
                                       4, // ES dia
                                       v_Desde_Valor,
                                       v_Hasta_Valor,
                                       v_Desde_Valor_parte_de_SQL_antes,
                                       v_Desde_Valor_parte_de_SQL_despues,
                                       v_Hasta_Valor_parte_de_SQL_antes,
                                       v_Hasta_Valor_parte_de_SQL_despues,
                                       v_nombre_campo,
                                       p_Registro_CRUD,
                                       p_ctdad_Rgtros,
                                       p_a_Filtrar );
end;

procedure UTI_FILTROS_queFiltro_es_Dia_Comprobar_Errores( p_SQLQuery_Filtros : TSQLQuery;
                                                          p_errores : TStrings );
var
  v_Error       : String;
  v_Desde_Valor : String;
  v_Hasta_Valor : String;
begin
  v_Desde_Valor := p_SQLQuery_Filtros.FieldByName('Desde_Valor').asString;
  v_Hasta_Valor := p_SQLQuery_Filtros.FieldByName('Hasta_Valor').asString;

  // Comprobamos si lo introducido para filtrar es un Dia
  v_Error := UTI_GEN_Comprobar_Introducido_es_Dia( v_Desde_Valor,
                                                   p_SQLQuery_Filtros.FieldByName('Descripcion').asString );
  if Trim(v_Error) <> '' then
    p_errores.Add(v_Error);

  // Comprobamos si lo introducido para filtrar es un Dia
  v_Error := UTI_GEN_Comprobar_Introducido_es_Dia( v_Hasta_Valor,
                                                   p_SQLQuery_Filtros.FieldByName('Descripcion').asString );
  if Trim(v_Error) <> '' then
    p_errores.Add(v_Error);

  // Comprobamos si lo introducido para filtrar, su valor hasta no es menor que su valor desde
  if (Trim(v_Hasta_Valor) <> '') and
     (Trim(v_Desde_Valor) <> '') then
  begin
    if (not p_SQLQuery_Filtros.FieldByName('Hasta_Valor').IsNull) and
       (not p_SQLQuery_Filtros.FieldByName('Desde_Valor').IsNull)  then
    begin
      Try
        if StrToDate(v_Hasta_Valor, FormatSettings) < StrToDate(v_Desde_Valor, FormatSettings) then
          p_errores.Add( '* El valor HASTA es menor que el valor DESDE del filtro <<' + p_SQLQuery_Filtros.FieldByName('Descripcion').asString + '>>');
      Except
      end;
    end;
  end;

end;

procedure UTI_FILTROS_queFiltro_es_Dia( p_SQLQuery_Filtros  : TSQLQuery;
                                        p_errores           : TStrings;
                                        var p_Registro_CRUD : TRegistro_CRUD;
                                        var p_ctdad_Rgtros  : Integer;
                                        var p_a_Filtrar     : TStrings );
var
  var_SQL_ADD : TStrings;
begin
  var_SQL_ADD := TStringList.Create;

  UTI_FILTROS_queFiltro_es_Dia_Comprobar_Errores( p_SQLQuery_Filtros, p_errores ) ;

  // Si no hay errores pues pasamos el filtro
  if Trim(p_errores.Text) = '' then
    UTI_FILTROS_queFiltro_es_Dia_Crear_Filtro( p_SQLQuery_Filtros,
                                               var_SQL_ADD,
                                               p_Registro_CRUD,
                                               p_ctdad_Rgtros,
                                               p_a_Filtrar );

  var_SQL_ADD.Free;
end;

procedure UTI_FILTROS_queFiltro_es_DiaHora_Crear_Filtro( p_SQLQuery_Filtros  : TSQLQuery;
                                                         p_SQL_ADD           : TStrings;
                                                         var p_Registro_CRUD : TRegistro_CRUD;
                                                         var p_ctdad_Rgtros  : Integer;
                                                         var p_a_Filtrar     : TStrings );
var
  v_Desde_Valor                      : AnsiString;
  v_Hasta_Valor                      : AnsiString;
  v_Desde_Valor_parte_de_SQL_antes   : AnsiString;
  v_Desde_Valor_parte_de_SQL_despues : AnsiString;
  v_Hasta_Valor_parte_de_SQL_antes   : AnsiString;
  v_Hasta_Valor_parte_de_SQL_despues : AnsiString;
  v_nombre_campo                     : String;
begin
  v_nombre_campo                     := p_SQLQuery_Filtros.FieldByName('nombre_campo').asString;
  v_Desde_Valor                      := p_SQLQuery_Filtros.FieldByName('Desde_Valor').asString;
  v_Hasta_Valor                      := p_SQLQuery_Filtros.FieldByName('Hasta_Valor').asString;
  v_Desde_Valor_parte_de_SQL_antes   := p_SQLQuery_Filtros.FieldByName('Desde_Valor_parte_de_SQL_antes').asString;
  v_Desde_Valor_parte_de_SQL_despues := p_SQLQuery_Filtros.FieldByName('Desde_Valor_parte_de_SQL_despues').asString;
  v_Hasta_Valor_parte_de_SQL_antes   := p_SQLQuery_Filtros.FieldByName('Hasta_Valor_parte_de_SQL_antes').asString;
  v_Hasta_Valor_parte_de_SQL_despues := p_SQLQuery_Filtros.FieldByName('Hasta_Valor_parte_de_SQL_despues').asString;

  // Lo intruducido en el filtro un TDateTime

  // Esto lo hago porque si pones en una fecha por ejemplo ... 12
  // lazarus lo completa con 12/mesactual/añoactual y el usuario se pierde que ha ocurrido porque no da error
  // Así que lo traduzco para que sea visible para el usuario
  if (Trim(v_Desde_Valor) <> '')                              and
     (not p_SQLQuery_Filtros.FieldByName('Desde_Valor').isNull) then
  begin
    p_SQLQuery_Filtros.Edit;
    p_SQLQuery_Filtros.FieldByName('Desde_Valor').Value := StrToDateTime(v_Desde_Valor);
    p_SQLQuery_Filtros.Post;
  end;

  if (Trim(v_Hasta_Valor) <> '')                              and
     (not p_SQLQuery_Filtros.FieldByName('Hasta_Valor').isNull) then
  begin
    p_SQLQuery_Filtros.Edit;
    p_SQLQuery_Filtros.FieldByName('Hasta_Valor').Value := StrToDateTime(v_Hasta_Valor);
    p_SQLQuery_Filtros.Post;
  end;

  // CONTINUAMOS CON LA CREACION DEL FILTRO
  if (Trim(v_Hasta_Valor) <> '') and
     (Trim(v_Desde_Valor) <> '') then
  begin
    // ESTAN RELLENADOS EL DESDE Y EL HASTA
    if p_SQLQuery_Filtros.FieldByName('Hasta_Valor').Value = p_SQLQuery_Filtros.FieldByName('Desde_Valor').Value then
      UTI_FILTROS_queFiltro_sonIGUALES( p_SQL_ADD,
                                        3, // ES NUMERO
                                        v_Desde_Valor,
                                        v_Hasta_Valor,
                                        v_Desde_Valor_parte_de_SQL_antes,
                                        v_Desde_Valor_parte_de_SQL_despues,
                                        v_Hasta_Valor_parte_de_SQL_antes,
                                        v_Hasta_Valor_parte_de_SQL_despues,
                                        v_nombre_campo,
                                        p_Registro_CRUD,
                                        p_ctdad_Rgtros,
                                        p_a_Filtrar )
    else
      UTI_FILTROS_queFiltro_sonDIFERENTES( p_SQL_ADD,
                                           3, // p_que_es ... dia/hora
                                           v_Desde_Valor,
                                           v_Hasta_Valor,
                                           v_Desde_Valor_parte_de_SQL_antes,
                                           v_Desde_Valor_parte_de_SQL_despues,
                                           v_Hasta_Valor_parte_de_SQL_antes,
                                           v_Hasta_Valor_parte_de_SQL_despues,
                                           v_nombre_campo,
                                           p_Registro_CRUD,
                                           p_ctdad_Rgtros,
                                           p_a_Filtrar );
  end

  else
    UTI_FILTROS_queFiltro_sinRELLENAR( p_SQL_ADD,
                                       3, // ES dia/hora
                                       v_Desde_Valor,
                                       v_Hasta_Valor,
                                       v_Desde_Valor_parte_de_SQL_antes,
                                       v_Desde_Valor_parte_de_SQL_despues,
                                       v_Hasta_Valor_parte_de_SQL_antes,
                                       v_Hasta_Valor_parte_de_SQL_despues,
                                       v_nombre_campo,
                                       p_Registro_CRUD,
                                       p_ctdad_Rgtros,
                                       p_a_Filtrar );
end;

procedure UTI_FILTROS_queFiltro_es_DiaHora_Comprobar_Errores( p_SQLQuery_Filtros : TSQLQuery;
                                                              p_errores : TStrings );
var
  v_Error       : String;
  v_Desde_Valor : String;
  v_Hasta_Valor : String;
begin
  v_Desde_Valor := p_SQLQuery_Filtros.FieldByName('Desde_Valor').asString;
  v_Hasta_Valor := p_SQLQuery_Filtros.FieldByName('Hasta_Valor').asString;

  // Comprobamos si lo introducido para filtrar es un Dia+Hora
  v_Error := UTI_GEN_Comprobar_Introducido_es_DiaHora( v_Desde_Valor,
                                                       p_SQLQuery_Filtros.FieldByName('Descripcion').asString );
  if Trim(v_Error) <> '' then
    p_errores.Add(v_Error);

  // Comprobamos si lo introducido para filtrar es un Dia+Hora
  v_Error := UTI_GEN_Comprobar_Introducido_es_DiaHora( v_Hasta_Valor,
                                                       p_SQLQuery_Filtros.FieldByName('Descripcion').asString );
  if Trim(v_Error) <> '' then
    p_errores.Add(v_Error);

  // Comprobamos si lo introducido para filtrar, su valor hasta no es menor que su valor desde
  if (Trim(v_Hasta_Valor) <> '') and
     (Trim(v_Desde_Valor) <> '') then
  begin
    if (not p_SQLQuery_Filtros.FieldByName('Hasta_Valor').IsNull) and
       (not p_SQLQuery_Filtros.FieldByName('Desde_Valor').IsNull)  then
    begin
      Try
        if StrToDateTime(v_Hasta_Valor, FormatSettings) < StrToDateTime(v_Desde_Valor, FormatSettings) then
          p_errores.Add( '* El valor HASTA es menor que el valor DESDE del filtro <<' + p_SQLQuery_Filtros.FieldByName('Descripcion').asString + '>>');
      Except
      end;
    end;
  end;

end;

procedure UTI_FILTROS_queFiltro_es_DiaHora( p_SQLQuery_Filtros  : TSQLQuery;
                                            p_errores           : TStrings;
                                            var p_Registro_CRUD : TRegistro_CRUD;
                                            var p_ctdad_Rgtros  : Integer;
                                            var p_a_Filtrar     : TStrings );
var
  var_SQL_ADD : TStrings;
begin
  var_SQL_ADD := TStringList.Create;

  UTI_FILTROS_queFiltro_es_DiaHora_Comprobar_Errores( p_SQLQuery_Filtros, p_errores ) ;

  // Si no hay errores pues pasamos el filtro
  if Trim(p_errores.Text) = '' then
    UTI_FILTROS_queFiltro_es_DiaHora_Crear_Filtro( p_SQLQuery_Filtros,
                                                   var_SQL_ADD,
                                                   p_Registro_CRUD,
                                                   p_ctdad_Rgtros,
                                                   p_a_Filtrar );

  var_SQL_ADD.Free;
end;

procedure UTI_FILTROS_queFiltro_es_Texto_Crear_Filtro( p_SQLQuery_Filtros  : TSQLQuery;
                                                       p_SQL_ADD           : TStrings;
                                                       var p_Registro_CRUD : TRegistro_CRUD;
                                                       var p_ctdad_Rgtros  : Integer;
                                                       var p_a_Filtrar     : TStrings );
var
  v_Desde_Valor                      : AnsiString;
  v_Hasta_Valor                      : AnsiString;
  v_Desde_Valor_parte_de_SQL_antes   : AnsiString;
  v_Desde_Valor_parte_de_SQL_despues : AnsiString;
  v_Hasta_Valor_parte_de_SQL_antes   : AnsiString;
  v_Hasta_Valor_parte_de_SQL_despues : AnsiString;
  v_nombre_campo                     : String;
begin
  v_nombre_campo                     := p_SQLQuery_Filtros.FieldByName('nombre_campo').asString;
  v_Desde_Valor                      := p_SQLQuery_Filtros.FieldByName('Desde_Valor').asString;
  v_Hasta_Valor                      := p_SQLQuery_Filtros.FieldByName('Hasta_Valor').asString;
  v_Desde_Valor_parte_de_SQL_antes   := p_SQLQuery_Filtros.FieldByName('Desde_Valor_parte_de_SQL_antes').asString;
  v_Desde_Valor_parte_de_SQL_despues := p_SQLQuery_Filtros.FieldByName('Desde_Valor_parte_de_SQL_despues').asString;
  v_Hasta_Valor_parte_de_SQL_antes   := p_SQLQuery_Filtros.FieldByName('Hasta_Valor_parte_de_SQL_antes').asString;
  v_Hasta_Valor_parte_de_SQL_despues := p_SQLQuery_Filtros.FieldByName('Hasta_Valor_parte_de_SQL_despues').asString;

  if (Trim(v_Hasta_Valor) <> '') and
     (Trim(v_Desde_Valor) <> '') then
  begin
    // ESTAN RELLENADOS EL DESDE Y EL HASTA
    if p_SQLQuery_Filtros.FieldByName('Hasta_Valor').Value = p_SQLQuery_Filtros.FieldByName('Desde_Valor').Value then
      UTI_FILTROS_queFiltro_sonIGUALES( p_SQL_ADD,
                                        1, // ES TEXTO
                                        v_Desde_Valor,
                                        v_Hasta_Valor,
                                        v_Desde_Valor_parte_de_SQL_antes,
                                        v_Desde_Valor_parte_de_SQL_despues,
                                        v_Hasta_Valor_parte_de_SQL_antes,
                                        v_Hasta_Valor_parte_de_SQL_despues,
                                        v_nombre_campo,
                                        p_Registro_CRUD,
                                        p_ctdad_Rgtros,
                                        p_a_Filtrar )
    else
      UTI_FILTROS_queFiltro_sonDIFERENTES( p_SQL_ADD,
                                           1, // p_que_es ... texto
                                           v_Desde_Valor,
                                           v_Hasta_Valor,
                                           v_Desde_Valor_parte_de_SQL_antes,
                                           v_Desde_Valor_parte_de_SQL_despues,
                                           v_Hasta_Valor_parte_de_SQL_antes,
                                           v_Hasta_Valor_parte_de_SQL_despues,
                                           v_nombre_campo,
                                           p_Registro_CRUD,
                                           p_ctdad_Rgtros,
                                           p_a_Filtrar );
  end

  else
    UTI_FILTROS_queFiltro_sinRELLENAR( p_SQL_ADD,
                                       1, // ES texto
                                       v_Desde_Valor,
                                       v_Hasta_Valor,
                                       v_Desde_Valor_parte_de_SQL_antes,
                                       v_Desde_Valor_parte_de_SQL_despues,
                                       v_Hasta_Valor_parte_de_SQL_antes,
                                       v_Hasta_Valor_parte_de_SQL_despues,
                                       v_nombre_campo,
                                       p_Registro_CRUD,
                                       p_ctdad_Rgtros,
                                       p_a_Filtrar );

end;

procedure UTI_FILTROS_queFiltro_es_Texto_Comprobar_Errores( p_SQLQuery_Filtros : TSQLQuery;
                                                            p_errores : TStrings );
begin
  // Comprobamos si lo introducido para filtrar, su valor hasta no es menor que su valor desde
  if (Trim(p_SQLQuery_Filtros.FieldByName('Hasta_Valor').asString) <> '') and
     (Trim(p_SQLQuery_Filtros.FieldByName('Desde_Valor').asString) <> '') then
  begin
    if (not p_SQLQuery_Filtros.FieldByName('Hasta_Valor').IsNull) and
       (not p_SQLQuery_Filtros.FieldByName('Desde_Valor').IsNull)  then
    begin
      Try
        if p_SQLQuery_Filtros.FieldByName('Hasta_Valor').asString < p_SQLQuery_Filtros.FieldByName('Desde_Valor').asString then
          p_errores.Add( '* El valor HASTA es menor que el valor DESDE del filtro <<' + p_SQLQuery_Filtros.FieldByName('Descripcion').asString + '>>');
      Except
      end;
    end;
  end;

end;

procedure UTI_FILTROS_queFiltro_es_Texto( p_SQLQuery_Filtros  : TSQLQuery;
                                          p_errores           : TStrings;
                                          var p_Registro_CRUD : TRegistro_CRUD;
                                          var p_ctdad_Rgtros  : Integer;
                                          var p_a_Filtrar     : TStrings );
var
  var_SQL_ADD : TStrings;
begin
  var_SQL_ADD := TStringList.Create;

  UTI_FILTROS_queFiltro_es_Texto_Comprobar_Errores( p_SQLQuery_Filtros, p_errores );

  // Si no hay errores pues pasamos el filtro
  if Trim(p_errores.Text) = '' then
    UTI_FILTROS_queFiltro_es_Texto_Crear_Filtro( p_SQLQuery_Filtros,
                                                 var_SQL_ADD,
                                                 p_Registro_CRUD,
                                                 p_ctdad_Rgtros,
                                                 p_a_Filtrar );

  var_SQL_ADD.Free;
end;

procedure UTI_FILTROS_queFiltro_sinRELLENAR( p_SQL_ADD                          : TStrings;
                                             p_que_es                           : Integer;
                                             p_Desde_Valor                      : AnsiString;
                                             p_Hasta_Valor                      : AnsiString;
                                             p_Desde_Valor_parte_de_SQL_antes   : AnsiString;
                                             p_Desde_Valor_parte_de_SQL_despues : AnsiString;
                                             p_Hasta_Valor_parte_de_SQL_antes   : AnsiString;
                                             p_Hasta_Valor_parte_de_SQL_despues : AnsiString;
                                             p_nombre_campo                     : String;
                                             var p_Registro_CRUD                : TRegistro_CRUD;
                                             var p_ctdad_Rgtros                 : Integer;
                                             var p_a_Filtrar                    : TStrings );
begin
  // O EL DESDE O EL HASTA NO ESTAN RELLENOS
  p_SQL_ADD.Clear;

  // NO ESTA RELLENADO EL DEBE
  if Trim(p_Desde_Valor) <> '' then
  begin
    if ( Trim(p_Desde_Valor_parte_de_SQL_antes) = '' )   and
       ( Trim(p_Desde_Valor_parte_de_SQL_despues) = '' ) then
    begin
      // No hay nada para sustituir al standard de filtro
      if p_que_es = 1 then // Es ... TEXTO
        p_SQL_ADD.Add( 'UPPER(' + Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) + ')' +
                       ' >= UPPER(' + UTI_GEN_Comillas(Trim(p_Desde_Valor)) + ')' );

      if p_que_es = 2 then // Es ... NUMERO
        p_SQL_ADD.Add( Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) +
                       ' >= ' + Trim(p_Desde_Valor) );

      if p_que_es = 3 then // Es ... DIAHORA
        p_SQL_ADD.Add( Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) +
                       ' >= ' + UTI_GEN_Comillas(  UTI_GEN_Format_Fecha_Hora( StrToDateTime(p_Desde_Valor), true )  )
                     );

      if p_que_es = 4 then // Es ... DIA
        p_SQL_ADD.Add( Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) +
                        ' >= ' + UTI_GEN_Comillas(  UTI_GEN_Format_Fecha_Hora( StrToDate(p_Desde_Valor), false )  )
                     );

      if p_que_es = 5 then // Es ... HORA
        p_SQL_ADD.Add( Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) +
                        ' >= ' + UTI_GEN_Comillas(Trim(p_Desde_Valor))
                     );
    end

    else
    begin
      // Hay algo que va a sustituir al standard del filtro
      UTI_FILTROS_Rellenamos_antes_despues( p_SQL_ADD,
                                            p_que_es,
                                            p_Desde_Valor,
                                            p_Desde_Valor_parte_de_SQL_antes,
                                            p_Desde_Valor_parte_de_SQL_despues );
    end;

  end;

  // NO ESTA RELLENADO EL HASTA
  if Trim(p_Hasta_Valor) <> '' then
  begin
    if ( Trim(p_Hasta_Valor_parte_de_SQL_antes) = '' )   and
       ( Trim(p_Hasta_Valor_parte_de_SQL_despues) = '' ) then
    begin
      // No hay nada para sustituir al standard de filtro

      if p_que_es = 1 then // Es ... TEXTO
        p_SQL_ADD.Add( 'UPPER(' + Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) + ')' +
                       ' <= UPPER(' + UTI_GEN_Comillas(Trim(p_Hasta_Valor)) + ')' );

      if p_que_es = 2 then // Es ... NUMERO
        p_SQL_ADD.Add( Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) +
                       ' <= ' + Trim(p_Hasta_Valor) );

      if p_que_es = 3 then // Es ... DIAHORA
        p_SQL_ADD.Add(  Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) +
                        ' <= ' + UTI_GEN_Comillas(  UTI_GEN_Format_Fecha_Hora( StrToDateTime(p_Hasta_Valor), true )  )
                     );

      if p_que_es = 4 then // Es ... DIA
        p_SQL_ADD.Add( Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) +
                        ' <= ' + UTI_GEN_Comillas(  UTI_GEN_Format_Fecha_Hora( StrToDate(p_Hasta_Valor), false )  )
                     );

      if p_que_es = 5 then // Es ... HORA
        p_SQL_ADD.Add( Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) +
                        ' <= ' + UTI_GEN_Comillas(Trim(p_Hasta_Valor))
                     );

    end

    else
    begin
      // Hay algo que va a sustituir al standard del filtro
      UTI_FILTROS_Rellenamos_antes_despues( p_SQL_ADD,
                                            p_que_es,
                                            p_Hasta_Valor,
                                            p_Hasta_Valor_parte_de_SQL_antes,
                                            p_Hasta_Valor_parte_de_SQL_despues );
    end;

  end;

  UTI_TB_SQL_ADD( false, p_a_Filtrar, p_SQL_ADD );

end;

procedure UTI_FILTROS_queFiltro_sonDIFERENTES( p_SQL_ADD                          : TStrings;
                                               p_que_es                           : Integer;
                                               p_Desde_Valor                      : AnsiString;
                                               p_Hasta_Valor                      : AnsiString;
                                               p_Desde_Valor_parte_de_SQL_antes   : AnsiString;
                                               p_Desde_Valor_parte_de_SQL_despues : AnsiString;
                                               p_Hasta_Valor_parte_de_SQL_antes   : AnsiString;
                                               p_Hasta_Valor_parte_de_SQL_despues : AnsiString;
                                               p_nombre_campo                     : String;
                                               var p_Registro_CRUD                : TRegistro_CRUD;
                                               var p_ctdad_Rgtros                 : Integer;
                                               var p_a_Filtrar                    : TStrings );
begin
  // son diferentes el desde y el hasta
  // hacer algo parecido a
  // WHERE ProductName NOT BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'

  p_SQL_ADD.Clear;

  if ( Trim(p_Desde_Valor_parte_de_SQL_antes) = '' )   and
     ( Trim(p_Desde_Valor_parte_de_SQL_despues) = '' ) and
     ( Trim(p_Hasta_Valor_parte_de_SQL_antes) = '' )   and
     ( Trim(p_Hasta_Valor_parte_de_SQL_despues) = '' ) then
  begin
    // No hay nada para sustituir al standard de filtro

    if p_que_es = 1 then // Es ... TEXTO
      p_SQL_ADD.Add( 'UPPER(' + Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) + ')' +
                     ' BETWEEN UPPER(' + UTI_GEN_Comillas(Trim(p_Desde_Valor)) + ')' +
                     ' AND UPPER(' + UTI_GEN_Comillas(Trim(p_Hasta_Valor)) + ')' );

    if p_que_es = 2 then // Es ... NUMERO
      p_SQL_ADD.Add( Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) +
                     ' BETWEEN ' + Trim(p_Desde_Valor) +
                     ' AND ' + Trim(p_Hasta_Valor) );

    if p_que_es = 3 then // Es ... DIAHORA
      p_SQL_ADD.Add(  Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) +
                      ' BETWEEN ' + UTI_GEN_Comillas(  UTI_GEN_Format_Fecha_Hora( StrToDateTime(p_Desde_Valor), true )  ) +
                          ' AND ' + UTI_GEN_Comillas(  UTI_GEN_Format_Fecha_Hora( StrToDateTime(p_Hasta_Valor), true )  )
                   );

    if p_que_es = 4 then // Es ... DIA
      p_SQL_ADD.Add( Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) +
                      ' BETWEEN ' + UTI_GEN_Comillas(  UTI_GEN_Format_Fecha_Hora( StrToDate(p_Desde_Valor), false )  ) +
                          ' AND ' + UTI_GEN_Comillas(  UTI_GEN_Format_Fecha_Hora( StrToDate(p_Hasta_Valor), false )  )
                   );

    if p_que_es = 5 then // Es ... HORA
      p_SQL_ADD.Add( Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) +
                      ' BETWEEN ' + UTI_GEN_Comillas(Trim(p_Desde_Valor)) +
                          ' AND ' + UTI_GEN_Comillas(Trim(p_Hasta_Valor))
                   );

  end

  else
  begin
    // Hay algo que va a sustituir al standard del filtro
    UTI_FILTROS_Rellenamos_antes_despues( p_SQL_ADD,
                                          p_que_es,
                                          p_Desde_Valor,
                                          p_Desde_Valor_parte_de_SQL_antes,
                                          p_Desde_Valor_parte_de_SQL_despues );

    UTI_FILTROS_Rellenamos_antes_despues( p_SQL_ADD,
                                          p_que_es,
                                          p_Hasta_Valor,
                                          p_Hasta_Valor_parte_de_SQL_antes,
                                          p_Hasta_Valor_parte_de_SQL_despues );
  end;

  UTI_TB_SQL_ADD( false, p_a_Filtrar, p_SQL_ADD );
end;

procedure UTI_FILTROS_Rellenamos_antes_despues( p_SQL_ADD     : TStrings;
                                                p_que_es      : Integer;
                                                p_valor       : AnsiString;
                                                p_SQL_antes   : AnsiString;
                                                p_SQL_despues : AnsiString );
begin
  if p_que_es = 1 then // Es ... TEXTO
    p_SQL_ADD.Add( Trim(p_SQL_antes) +
                   ' ' +
                   UTI_GEN_Comillas( Trim(p_valor) ) +
                   ' ' +
                   Trim(p_SQL_despues) );

  if p_que_es = 2 then // Es ... NUMERO
    p_SQL_ADD.Add( Trim(p_SQL_antes) +
                   ' ' +
                   Trim(p_valor) +
                   ' ' +
                   Trim(p_SQL_despues) );

  if p_que_es = 3 then // Es ... DIAHORA
    p_SQL_ADD.Add( Trim(p_SQL_antes) +
                   ' ' +
                   UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora( StrToDateTime(p_valor),
                                                                true ) ) +
                   ' ' +
                   Trim(p_SQL_despues) );

  if p_que_es = 4 then // Es ... DIA
    p_SQL_ADD.Add( Trim(p_SQL_antes) +
                   ' ' +
                   UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora( StrToDate(p_valor),
                                                                true ) ) +
                   ' ' +
                   Trim(p_SQL_despues) );

  if p_que_es = 5 then // Es ... HORA
    p_SQL_ADD.Add( Trim(p_SQL_antes) +
                   ' ' +
                   UTI_GEN_Comillas(p_valor) +
                   ' ' +
                   Trim(p_SQL_despues) );
end;

procedure UTI_FILTROS_queFiltro_sonIGUALES( p_SQL_ADD                          : TStrings;
                                            p_que_es                           : Integer;
                                            p_Desde_Valor                      : AnsiString;
                                            p_Hasta_Valor                      : AnsiString;
                                            p_Desde_Valor_parte_de_SQL_antes   : AnsiString;
                                            p_Desde_Valor_parte_de_SQL_despues : AnsiString;
                                            p_Hasta_Valor_parte_de_SQL_antes   : AnsiString;
                                            p_Hasta_Valor_parte_de_SQL_despues : AnsiString;
                                            p_nombre_campo                     : String;
                                            var p_Registro_CRUD                : TRegistro_CRUD;
                                            var p_ctdad_Rgtros                 : Integer;
                                            var p_a_Filtrar                    : TStrings );
begin
  p_SQL_ADD.Clear;

  if ( Trim(p_Desde_Valor_parte_de_SQL_antes) = '' )   and
     ( Trim(p_Desde_Valor_parte_de_SQL_despues) = '' ) and
     ( Trim(p_Hasta_Valor_parte_de_SQL_antes) = '' )   and
     ( Trim(p_Hasta_Valor_parte_de_SQL_despues) = '' ) then
  begin
    // No hay nada para sustituir al standard de filtro

    if p_que_es = 1 then // Es ... TEXTO
      // Así que vamos a intentar hacer algo parecido a upper(menus.Descripcion) like CONCAT('%', upper('nus'), '%')
      // ó podríamos haber hecho algo parecido a upper(menus.Descripcion) like '%NUS%'
      p_SQL_ADD.Add( 'UPPER(' + Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) + ')' +
                     ' LIKE CONCAT(' + UTI_GEN_Comillas('%') + ',' +
                                      ' UPPER(' +  UTI_GEN_Comillas(Trim(p_Hasta_Valor)) + '), ' +
                                        UTI_GEN_Comillas('%') + ')' );

    if p_que_es = 2 then // Es ... NUMERO
      p_SQL_ADD.Add( Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) +
                     ' = ' + Trim(p_Hasta_Valor) );

    if p_que_es = 3 then // Es ... DIAHORA
      p_SQL_ADD.Add( Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) +
                     ' = ' + UTI_GEN_Comillas(  UTI_GEN_Format_Fecha_Hora( StrToDateTime(p_Hasta_Valor), true )  )
                   );

    if p_que_es = 4 then // Es ... DIA
      p_SQL_ADD.Add( Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) +
                        ' = ' + UTI_GEN_Comillas(  UTI_GEN_Format_Fecha_Hora( StrToDate(p_Hasta_Valor), false )  )
                   );

    if p_que_es = 5 then // Es ... HORA
      p_SQL_ADD.Add( Trim(p_Registro_CRUD.name_tabla) + '.' + Trim(p_nombre_campo) +
                        ' = ' + UTI_GEN_Comillas(Trim(p_Hasta_Valor))
                   );
  end

  else
  begin
    // Hay algo que va a sustituir al standard del filtro
    UTI_FILTROS_Rellenamos_antes_despues( p_SQL_ADD,
                                          p_que_es,
                                          p_Desde_Valor,
                                          p_Desde_Valor_parte_de_SQL_antes,
                                          p_Desde_Valor_parte_de_SQL_despues );

    UTI_FILTROS_Rellenamos_antes_despues( p_SQL_ADD,
                                          p_que_es,
                                          p_Hasta_Valor,
                                          p_Hasta_Valor_parte_de_SQL_antes,
                                          p_Hasta_Valor_parte_de_SQL_despues );
  end;

  UTI_TB_SQL_ADD( false, p_a_Filtrar, p_SQL_ADD );
end;

procedure UTI_FILTROS_queFiltro_es_Numero_Crear_Filtro( p_SQLQuery_Filtros  : TSQLQuery;
                                                        p_SQL_ADD           : TStrings;
                                                        var p_Registro_CRUD : TRegistro_CRUD;
                                                        var p_ctdad_Rgtros  : Integer;
                                                        var p_a_Filtrar     : TStrings );
var
  v_Desde_Valor                      : AnsiString;
  v_Hasta_Valor                      : AnsiString;
  v_Desde_Valor_parte_de_SQL_antes   : AnsiString;
  v_Desde_Valor_parte_de_SQL_despues : AnsiString;
  v_Hasta_Valor_parte_de_SQL_antes   : AnsiString;
  v_Hasta_Valor_parte_de_SQL_despues : AnsiString;
  v_nombre_campo                     : String;
begin
  v_nombre_campo                     := p_SQLQuery_Filtros.FieldByName('nombre_campo').asString;
  v_Desde_Valor                      := p_SQLQuery_Filtros.FieldByName('Desde_Valor').asString;
  v_Hasta_Valor                      := p_SQLQuery_Filtros.FieldByName('Hasta_Valor').asString;
  v_Desde_Valor_parte_de_SQL_antes   := p_SQLQuery_Filtros.FieldByName('Desde_Valor_parte_de_SQL_antes').asString;
  v_Desde_Valor_parte_de_SQL_despues := p_SQLQuery_Filtros.FieldByName('Desde_Valor_parte_de_SQL_despues').asString;
  v_Hasta_Valor_parte_de_SQL_antes   := p_SQLQuery_Filtros.FieldByName('Hasta_Valor_parte_de_SQL_antes').asString;
  v_Hasta_Valor_parte_de_SQL_despues := p_SQLQuery_Filtros.FieldByName('Hasta_Valor_parte_de_SQL_despues').asString;

  if (Trim(v_Hasta_Valor) <> '') and
     (Trim(v_Desde_Valor) <> '') then
  begin
    // ESTAN RELLENADOS EL DESDE Y EL HASTA
    if p_SQLQuery_Filtros.FieldByName('Hasta_Valor').Value = p_SQLQuery_Filtros.FieldByName('Desde_Valor').Value then
      UTI_FILTROS_queFiltro_sonIGUALES( p_SQL_ADD,
                                        2, // ES NUMERO
                                        v_Desde_Valor,
                                        v_Hasta_Valor,
                                        v_Desde_Valor_parte_de_SQL_antes,
                                        v_Desde_Valor_parte_de_SQL_despues,
                                        v_Hasta_Valor_parte_de_SQL_antes,
                                        v_Hasta_Valor_parte_de_SQL_despues,
                                        v_nombre_campo,
                                        p_Registro_CRUD,
                                        p_ctdad_Rgtros,
                                        p_a_Filtrar )
    else
      UTI_FILTROS_queFiltro_sonDIFERENTES( p_SQL_ADD,
                                                 2, // p_que_es ... Numero
                                                 v_Desde_Valor,
                                                 v_Hasta_Valor,
                                                 v_Desde_Valor_parte_de_SQL_antes,
                                                 v_Desde_Valor_parte_de_SQL_despues,
                                                 v_Hasta_Valor_parte_de_SQL_antes,
                                                 v_Hasta_Valor_parte_de_SQL_despues,
                                                 v_nombre_campo,
                                                 p_Registro_CRUD,
                                                 p_ctdad_Rgtros,
                                                 p_a_Filtrar );
  end

  else
    UTI_FILTROS_queFiltro_sinRELLENAR( p_SQL_ADD,
                                       2, // ES numero
                                       v_Desde_Valor,
                                       v_Hasta_Valor,
                                       v_Desde_Valor_parte_de_SQL_antes,
                                       v_Desde_Valor_parte_de_SQL_despues,
                                       v_Hasta_Valor_parte_de_SQL_antes,
                                       v_Hasta_Valor_parte_de_SQL_despues,
                                       v_nombre_campo,
                                       p_Registro_CRUD,
                                       p_ctdad_Rgtros,
                                       p_a_Filtrar );
end;

procedure UTI_FILTROS_queFiltro_es_Numero_Comprobar_Errores( p_SQLQuery_Filtros : TSQLQuery;
                                                             p_errores : TStrings );
var
  v_Error       : String;
  v_Desde_Valor : String;
  v_Hasta_Valor : String;
begin
  v_Desde_Valor := p_SQLQuery_Filtros.FieldByName('Desde_Valor').asString;
  v_Hasta_Valor := p_SQLQuery_Filtros.FieldByName('Hasta_Valor').asString;

  // Comprobamos si lo introducido para filtrar es un número
  v_Error := UTI_GEN_Comprobar_Introducido_es_Numero( v_Desde_Valor,
                                                      p_SQLQuery_Filtros.FieldByName('Descripcion').asString );
  if Trim(v_Error) <> '' then
    p_errores.Add(v_Error);

  // Comprobamos si lo introducido para filtrar es un número
  v_Error := UTI_GEN_Comprobar_Introducido_es_Numero( v_Hasta_Valor,
                                                      p_SQLQuery_Filtros.FieldByName('Descripcion').asString );
  if Trim(v_Error) <> '' then
    p_errores.Add(v_Error);

  // Comprobamos si lo introducido para filtrar, su valor hasta no es menor que su valor desde
  if (Trim(v_Hasta_Valor) <> '') and
     (Trim(v_Desde_Valor) <> '') then
  begin
    if (not p_SQLQuery_Filtros.FieldByName('Hasta_Valor').IsNull) and
       (not p_SQLQuery_Filtros.FieldByName('Desde_Valor').IsNull)  then
    begin
      Try
        if StrToCurr(v_Hasta_Valor, FormatSettings) < StrToCurr(v_Desde_Valor, FormatSettings) then
          p_errores.Add( '* El valor HASTA es menor que el valor DESDE del filtro <<' + p_SQLQuery_Filtros.FieldByName('Descripcion').asString + '>>');
      Except
      end;
    end;
  end;

end;

procedure UTI_FILTROS_queFiltro_es_Numero( p_SQLQuery_Filtros : TSQLQuery;
                                           p_errores           : TStrings;
                                           var p_Registro_CRUD : TRegistro_CRUD;
                                           var p_ctdad_Rgtros  : Integer;
                                           var p_a_Filtrar     : TStrings );
var
  var_SQL_ADD : TStrings;
begin
  var_SQL_ADD := TStringList.Create;

  UTI_FILTROS_queFiltro_es_Numero_Comprobar_Errores( p_SQLQuery_Filtros, p_errores );

  // Si no hay errores pues pasamos el filtro
  if Trim(p_errores.Text) = '' then
    UTI_FILTROS_queFiltro_es_Numero_Crear_Filtro( p_SQLQuery_Filtros,
                                                  var_SQL_ADD,
                                                  p_Registro_CRUD,
                                                  p_ctdad_Rgtros,
                                                  p_a_Filtrar );

  var_SQL_ADD.Free;
end;

procedure UTI_FILTROS_pasarFiltros_aQuery( p_SQLQuery_Principal,
                                           p_SQLQuery_Filtros : TSQLQuery;
                                           var p_errores_Filtros : TStrings;
                                           var p_Registro_CRUD : TRegistro_CRUD;
                                           var p_ctdad_Rgtros  : Integer;
                                           var p_a_Filtrar     : TStrings );
var
  v_nombre_campo : String;

begin
  p_SQLQuery_Filtros.First;

  While not p_SQLQuery_Filtros.Eof do
  begin
    v_nombre_campo := p_SQLQuery_Filtros.FieldByName('nombre_campo').asString;

    if UTI_RGTRO_Campo_es_Numero( p_SQLQuery_Principal.FieldByName(v_nombre_campo).DataType,
                                  p_SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true then
    begin
      UTI_FILTROS_queFiltro_es_Numero( p_SQLQuery_Filtros, p_errores_Filtros, p_Registro_CRUD, p_ctdad_Rgtros, p_a_Filtrar );
    end;

    if UTI_RGTRO_Campo_es_Texto( p_SQLQuery_Principal.FieldByName(v_nombre_campo).DataType,
                                 p_SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true then
    begin
      UTI_FILTROS_queFiltro_es_Texto( p_SQLQuery_Filtros, p_errores_Filtros, p_Registro_CRUD, p_ctdad_Rgtros, p_a_Filtrar );
    end;

    if UTI_RGTRO_Campo_es_DiaHora( p_SQLQuery_Principal.FieldByName(v_nombre_campo).DataType,
                                   p_SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true then
    begin
      UTI_FILTROS_queFiltro_es_DiaHora( p_SQLQuery_Filtros, p_errores_Filtros, p_Registro_CRUD, p_ctdad_Rgtros, p_a_Filtrar );
    end;

    if UTI_RGTRO_Campo_es_Dia( p_SQLQuery_Principal.FieldByName(v_nombre_campo).DataType,
                               p_SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true then
    begin
      UTI_FILTROS_queFiltro_es_Dia( p_SQLQuery_Filtros, p_errores_Filtros, p_Registro_CRUD, p_ctdad_Rgtros, p_a_Filtrar );
    end;

    if UTI_RGTRO_Campo_es_Hora( p_SQLQuery_Principal.FieldByName(v_nombre_campo).DataType,
                                p_SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true then
    begin
      UTI_FILTROS_queFiltro_es_Hora( p_SQLQuery_Filtros, p_errores_Filtros, p_Registro_CRUD, p_ctdad_Rgtros, p_a_Filtrar );
    end;

    p_SQLQuery_Filtros.Next;
  end;

  p_SQLQuery_Filtros.First;

end;

procedure UTI_FILTROS_DobleClick_o_Enter( p_CalendarDialog: TCalendarDialog;
                                          p_SQLQuery_Principal,
                                          p_SQLQuery_Filtros : TSQLQuery;
                                          p_DBGrid_Filtros : TDBGrid );
var
  v_nombre_campo  : String;
  v_Registro      : TRecord_Rgtro_Comun;
  v_Hemos_Llamado : Boolean;
begin
  // Por si queremos hacer algo al hacer doble click en una celda;

  if    ( p_DBGrid_Filtros.SelectedIndex = 2 )
     or ( p_DBGrid_Filtros.SelectedIndex = 4 ) then
  begin
    v_nombre_campo := p_SQLQuery_Filtros.FieldByName('nombre_campo').asString;

    if p_DBGrid_Filtros.SelectedIndex = 2 then
    begin
      v_Hemos_Llamado := false;

      if   ( UTI_RGTRO_Campo_es_DiaHora( p_SQLQuery_Principal.FieldByName(v_nombre_campo).DataType,
                                         p_SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true )
         or ( UTI_RGTRO_Campo_es_Dia( p_SQLQuery_Principal.FieldByName(v_nombre_campo).DataType,
                                      p_SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true ) then
      begin
        v_Hemos_Llamado := true;
        if p_CalendarDialog.Execute then
        begin
          if p_SQLQuery_Filtros.State <> dsEdit then
            p_SQLQuery_Filtros.Edit;

          p_SQLQuery_Filtros.FieldByName('Desde_Valor').asString := DateToStr(p_CalendarDialog.Date);
        end;
      end;

      if      ( UTI_RGTRO_Campo_es_Numero( p_SQLQuery_Principal.FieldByName(v_nombre_campo).DataType,
                                           p_SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true )
          and ( UpperCase(Copy(v_nombre_campo, 1, 3)) = 'ID_' ) then
      begin
        v_Hemos_Llamado := true;
        v_Registro      := UTI_Abrir_Form( '', '', true, true, v_nombre_campo );

        if v_Registro.id_1 <> '' then
        begin
          if p_SQLQuery_Filtros.State <> dsEdit then
            p_SQLQuery_Filtros.Edit;

           p_SQLQuery_Filtros.FieldByName('Desde_Valor').asString := v_Registro.id_1;
        end;
      end;

      if v_Hemos_Llamado = false then
        p_DBGrid_Filtros.SelectedIndex := p_DBGrid_Filtros.SelectedIndex + 1;

    end;

    if p_DBGrid_Filtros.SelectedIndex = 4 then
    begin
      v_Hemos_Llamado := false;

      if    ( UTI_RGTRO_Campo_es_DiaHora( p_SQLQuery_Principal.FieldByName(v_nombre_campo).DataType,
                                          p_SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true )
         or ( UTI_RGTRO_Campo_es_Dia( p_SQLQuery_Principal.FieldByName(v_nombre_campo).DataType,
                                      p_SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true ) then
      begin
        v_Hemos_Llamado := true;
        if p_CalendarDialog.Execute then
        begin
          if p_SQLQuery_Filtros.State <> dsEdit then
            p_SQLQuery_Filtros.Edit;

          p_SQLQuery_Filtros.FieldByName('Hasta_Valor').asString := DateToStr(p_CalendarDialog.Date);
        end;
      end;

      if     ( UTI_RGTRO_Campo_es_Numero( p_SQLQuery_Principal.FieldByName(v_nombre_campo).DataType,
                                          p_SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true )
         and ( UpperCase(Copy(v_nombre_campo, 1, 3)) = 'ID_' ) then
      begin
        v_Hemos_Llamado := true;
        v_Registro      := UTI_Abrir_Form( '', '', true, true, v_nombre_campo );

        if v_Registro.id_1 <> '' then
        begin
          if p_SQLQuery_Filtros.State <> dsEdit then
            p_SQLQuery_Filtros.Edit;

           p_SQLQuery_Filtros.FieldByName('Hasta_Valor').asString := v_Registro.id_1;
        end;
      end;

      if v_Hemos_Llamado = false then
        p_DBGrid_Filtros.SelectedIndex := 1;

    end;
  end;

end;

procedure UTI_FILTROS_Esta_a_ReadOnLy( p_SQLQuery_Filtros : TSQLQuery;
                                       p_DBGrid_Filtros : TDBGrid );
begin
  if p_DBGrid_Filtros.SelectedIndex = 1 then  // Desde_Valor
  begin
    p_DBGrid_Filtros.SelectedField.ReadOnly := false;
    if UpperCase(p_SQLQuery_Filtros.FieldByName('Desde_Valor_pedir_SN').asString) = UpperCase('N') then
      p_DBGrid_Filtros.SelectedField.ReadOnly := true;
  end;

  if p_DBGrid_Filtros.SelectedIndex = 3 then  // Hasta_Valor
  begin
    p_DBGrid_Filtros.SelectedField.ReadOnly := false;
    if UpperCase(p_SQLQuery_Filtros.FieldByName('Hasta_Valor_pedir_SN').asString) = UpperCase('N') then
      p_DBGrid_Filtros.SelectedField.ReadOnly := true;
  end;

end;

procedure UTI_FILTROS_vaciarlos( p_SQLQuery_Filtros : TSQLQuery;
                                 p_DBGrid_Filtros : TDBGrid );
begin
  p_SQLQuery_Filtros.First;

  While not p_SQLQuery_Filtros.Eof do
  begin
    p_SQLQuery_Filtros.Edit;
      p_DBGrid_Filtros.SelectedIndex := 1;
      p_DBGrid_Filtros.SelectedField.ReadOnly := false;

      p_DBGrid_Filtros.SelectedIndex := 3;
      p_DBGrid_Filtros.SelectedField.ReadOnly := false;

      p_SQLQuery_Filtros.FieldByName('Desde_Valor').Clear;
      p_SQLQuery_Filtros.FieldByName('Hasta_Valor').Clear;
    p_SQLQuery_Filtros.Post;

    p_SQLQuery_Filtros.Next;
  end;

  p_SQLQuery_Filtros.First;
end;

procedure UTI_FILTROS_onEnter_enGrid( p_SQLQuery_Principal,
                                      p_SQLQuery_Filtros : TSQLQuery;
                                      p_DBGrid_Filtros : TDBGrid );
var
  v_nombre_campo    : String;
  v_es_Hora_o_Fecha : Boolean;
  v_aceptada        : Boolean;
  v_max_size        : Integer;

begin
  v_nombre_campo := p_SQLQuery_Filtros.FieldByName('nombre_campo').asString;

  if p_DBGrid_Filtros.SelectedIndex = 0 then
    p_DBGrid_Filtros.SelectedIndex := p_DBGrid_Filtros.SelectedIndex + 1;

  if (p_DBGrid_Filtros.SelectedIndex = 1) or    // Desde_Valor
     (p_DBGrid_Filtros.SelectedIndex = 3) then  // Hasta_Valor
  begin
    // Con esto de a continuación cambiaríamos el size de la columna del grid para desdevalor y
    // hastavalor. Pero no funciona como quisiera ... aparentemente no hace nada
    v_max_size                          := p_SQLQuery_Principal.FieldByName(v_nombre_campo).Size;
    p_DBGrid_Filtros.Columns[1].MaxSize := v_max_size;
    p_DBGrid_Filtros.Columns[3].MaxSize := v_max_size;

    // A partir de aquí cambiamos el editMask
    v_es_Hora_o_Fecha := false;

    if UTI_RGTRO_Campo_es_Hora( p_SQLQuery_Principal.FieldByName(v_nombre_campo).DataType,
                                p_SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true then
    begin
      v_es_Hora_o_Fecha := true;
      if p_DBGrid_Filtros.SelectedIndex = 1 then
        p_SQLQuery_Filtros.FieldByName('Desde_Valor').EditMask := '00:00:00';

      if p_DBGrid_Filtros.SelectedIndex = 3 then
        p_SQLQuery_Filtros.FieldByName('Hasta_Valor').EditMask := '00:00:00';
    end;

    if    (UTI_RGTRO_Campo_es_DiaHora( p_SQLQuery_Principal.FieldByName(v_nombre_campo).DataType,
                                       p_SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true)
       or (UTI_RGTRO_Campo_es_Dia( p_SQLQuery_Principal.FieldByName(v_nombre_campo).DataType,
                                   p_SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true) then
    begin
      v_es_Hora_o_Fecha := true;
      if p_DBGrid_Filtros.SelectedIndex = 1 then
        p_SQLQuery_Filtros.FieldByName('Desde_Valor').EditMask := '00/00/0000';

      if p_DBGrid_Filtros.SelectedIndex = 3 then
        p_SQLQuery_Filtros.FieldByName('Hasta_Valor').EditMask := '00/00/0000';
    end;

    if UTI_RGTRO_Campo_es_Dia( p_SQLQuery_Principal.FieldByName(v_nombre_campo).DataType,
                               p_SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true then
    begin
      v_es_Hora_o_Fecha := true;
      if p_DBGrid_Filtros.SelectedIndex = 1 then
        p_SQLQuery_Filtros.FieldByName('Desde_Valor').EditMask := '00/00/0000';

      if p_DBGrid_Filtros.SelectedIndex = 3 then
        p_SQLQuery_Filtros.FieldByName('Hasta_Valor').EditMask := '00/00/0000';
    end;

    if v_es_Hora_o_Fecha = false then
    begin
      if p_DBGrid_Filtros.SelectedIndex = 1 then
        p_SQLQuery_Filtros.FieldByName('Desde_Valor').EditMask := '';

      if p_DBGrid_Filtros.SelectedIndex = 3 then
        p_SQLQuery_Filtros.FieldByName('Hasta_Valor').EditMask := '';
    end;

  end;

  if p_DBGrid_Filtros.SelectedIndex = 3 then // Antes era así ... if p_DBGrid_Filtros.SelectedField.FieldName = 'Hasta_Valor' then
  begin
    if p_SQLQuery_Filtros.FieldByName('Hasta_Valor').isNull then
    begin
      if not p_SQLQuery_Filtros.FieldByName('Desde_Valor').IsNull then
      begin
        if p_SQLQuery_Filtros.State <> dsEdit then
          p_SQLQuery_Filtros.Edit;

        p_SQLQuery_Filtros.FieldByName('Hasta_Valor').asString := p_SQLQuery_Filtros.FieldByName('Desde_Valor').asString;
      end;
    end;
  end;

  if    (p_DBGrid_Filtros.SelectedIndex = 2)
     or (p_DBGrid_Filtros.SelectedIndex = 4) then
  begin
    v_aceptada := false;

    if    (UTI_RGTRO_Campo_es_DiaHora( p_SQLQuery_Principal.FieldByName(v_nombre_campo).DataType,
                                       p_SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true)
       or (UTI_RGTRO_Campo_es_Dia( p_SQLQuery_Principal.FieldByName(v_nombre_campo).DataType,
                                   p_SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true) then
    begin
      v_aceptada := true;
    end;

    if     (UTI_RGTRO_Campo_es_Numero( p_SQLQuery_Principal.FieldByName(v_nombre_campo).DataType,
                                       p_SQLQuery_Filtros.FieldByName('parte_de_SQL_tipoDato').asString ) = true)
       and (UpperCase(Copy(v_nombre_campo, 1, 3)) = 'ID_') then
    begin
      v_aceptada := true;
    end;

    if v_aceptada = false then
    begin
      if p_DBGrid_Filtros.SelectedIndex = 4 then
        p_DBGrid_Filtros.SelectedIndex := 1
      else
        p_DBGrid_Filtros.SelectedIndex := p_DBGrid_Filtros.SelectedIndex + 1;
    end;

  end;

end;

procedure UTI_FILTROS_Refrescar_Filtros( p_SQLConnector_Principal: TSQLConnector;
                                         p_SQLTransaction_Principal: TSQLTransaction;
                                         p_Order_By_Filtros : array of TOrder_By;
                                         p_ver_Bajas : ShortInt;
                                         p_Menu_Worked : Integer;
                                         p_SQLQuery_Principal,
                                         p_SQLQuery_Filtros : TSQLQuery );
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;

    var_id_menus       : Largeint;
    var_Descripcion    : String;

    var_Hay_Datos      : Boolean;

begin
  // ********************************************************************************************* //
  // ** Solo si la cabecera está en modo EDIT se abren las tablas hijas                         ** //
  // ********************************************************************************************* //
  if p_SQLQuery_Principal.State <> dsEdit then Exit;

  // ********************************************************************************************* //
  // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
  // ********************************************************************************************* //
  var_Hay_Datos := false;

  if p_SQLQuery_Filtros.RecordCount > 0 then
  begin
    var_Hay_Datos   := true;
    var_id_menus    := p_SQLQuery_Filtros.FieldByName('id_menus').Value;
    var_Descripcion := p_SQLQuery_Filtros.FieldByName('Descripcion').Value;
  end;

  var_Lineas_Filtro  := TStringList.Create;
  var_Lineas_OrderBy := TStringList.Create;

  var_Lineas_Filtro.Clear;
  var_Lineas_OrderBy.Clear;

  if Trim(IntToStr(p_Menu_Worked)) <> '' then
       var_Lineas_Filtro.Add( 'menus_filtros.id_menus = ' + Trim(IntToStr(p_Menu_Worked)) )
  else var_Lineas_Filtro.Add( 'menus_filtros.id_menus = Null' );

  UTI_FILTROS_Traer_Filtros( p_SQLConnector_Principal,
                             p_SQLTransaction_Principal,
                             p_SQLQuery_Filtros,
                             p_Order_By_Filtros,
                             p_ver_bajas,
                             false,
                             var_Lineas_Filtro,
                             var_Lineas_OrderBy );

  var_Lineas_Filtro.Free;
  var_Lineas_OrderBy.Free;

  if var_Hay_Datos = true then
  begin
    p_SQLQuery_Filtros.Locate( 'id_menus;Descripcion',
                               VarArrayOf( [ var_id_menus, var_Descripcion ] ),
                               [] );
  end;
end;

function UTI_FILTROS_Traer_Filtros( p_SQLConnector_Principal: TSQLConnector;
                                    p_SQLTransaction_Principal: TSQLTransaction;
                                    p_SQLQuery_Filtros : TSQLQuery;
                                    p_Order_By_Filtros : array of TOrder_By;
                                    p_ver_bajas : ShortInt;
                                    p_Cambiamos_Filtro : Boolean;
                                    p_Lineas_Filtro,
                                    p_Lineas_OrderBy : TStrings ) : ShortInt;
var
  var_a_Filtrar : TStrings;
  var_a_SQL     : TStrings;
begin
  var_a_Filtrar := TStringList.Create;
  var_a_SQL     := TStringList.Create;

  var_a_Filtrar.Clear;
  var_a_SQL.Clear;

  //  if form_Menu.public_User = 0 then
  var_a_SQL.ADD( 'SELECT mf.*' );
  var_a_SQL.ADD(   'FROM menus_filtros mf' );

  UTI_FILTROS_Cambiamos_Orden_SN( p_Lineas_OrderBy, p_Order_By_Filtros[0].Memo_OrderBy );

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }
  Result := UTI_TB_Filtrar( p_Order_By_Filtros,
                            '', // Delete_SQL

                            UTI_DATOS_TABLA_Rellenar_SQL( p_SQLQuery_Filtros,
                                                          'menus_filtros',
                                                          'u' ), // Update_SQL

                            UTI_DATOS_TABLA_Rellenar_SQL( p_SQLQuery_Filtros,
                                                          'menus_filtros',
                                                          'i' ), // Insert_SQL,

                            - 1, // var_ctdad_Rgtros,
                            p_SQLTransaction_Principal,
                            p_SQLConnector_Principal,
                            p_SQLQuery_Filtros,
                            'mf', // name_tabla,
                            p_ver_bajas, // True or false

                            var_a_SQL.Text, // SELECT_SQL,

                            p_Lineas_Filtro,
                            p_Lineas_OrderBy,
                            var_a_Filtrar,
                            p_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true );  // no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_a_SQL.Free;
  var_a_Filtrar.Free;
end;

procedure UTI_FILTROS_Guardar_Cambios_de_Filtros(p_SQLQuery_Filtros : TSQLQuery);
begin
  if (p_SQLQuery_Filtros.State = dsInsert) or
     (p_SQLQuery_Filtros.State = dsEdit)   then
  begin
    p_SQLQuery_Filtros.Post;
  end;
end;

end.

