unit utilidades_bd;

{$mode objfpc}{$H+}

interface

uses
  Controls, Forms, LazFileUtils, Classes, SysUtils, DB, sqldb, IniFiles, Dialogs, utilidades_general,
  StdCtrls;

type

  TOrder_By = record
      Titulo       : String;
      Memo_OrderBy : String;
  end;

  Trecord_CN_Conexion = record
      con_Exito                     : boolean;
      ConnectorType                 : String;
      DatabaseName                  : String;
      HostName                      : String;
      Port                          : String;
      Password                      : String;
      UserName                      : String;
      min_no_Work                   : String;
      NumTerminal                   : String;
      Language                      : String;
      Impresora_descripcion_Elegida : String;
      Impresora_Ctdad_Copias        : String;
  end;

  Trecord_Cambiar_Filtros_Devuelve = record
      Cambio_Filtro : Boolean;
      Ok            : boolean;
      bajas         : ShortInt;
  end;

function  UTI_CN_Connector_Open( param_SQLTransaction: TSQLTransaction; param_SQLConnector: TSQLConnector ): boolean;
function  UTI_CN_Connector_Close( param_SQLTransaction: TSQLTransaction; param_SQLConnector: TSQLConnector ): Boolean;

function  UTI_CN_Fecha_Hora : TDateTime;
function  UTI_CN_Configuracion_INI_Traerla : Trecord_CN_Conexion;
function  UTI_CN_Configuracion_INI_Grabar_Idioma( param_Idioma : ShortString ) : Boolean;

function  UTI_TB_Borrar_Tabla_Sin_Respetar_Autoinc( param_tabla : String ) : Boolean;
function  UTI_TB_Borrar_Tabla_Respetando_Autoinc( param_tabla : String ) : Boolean;
function  UTI_TB_Quitar_AndOr_Principio( param_SQL : Ansistring ) : AnsiString;
procedure UTI_TB_Ver_Bajas_SN(param_nombre_tabla : String; param_SQL: TStrings; param_ver_Bajas: shortint);
function  UTI_TB_Cambiar_Filtros( param_Order_By : array of TOrder_By; param_Ver_Bajas : ShortInt; param_nombre_tabla : String; param_SQLQuery : TSQLQuery; param_SQL_WHERE, param_SQL_ORDER_BY : TStrings ) : Trecord_Cambiar_Filtros_Devuelve;
function  UTI_TB_Filtrar( param_Order_By : array of TOrder_By; param_DeleteSQL, param_UpdateSQL, param_InsertSQL : String; param_ctdad_Rgtros : Integer; param_SQLTransaction : TSQLTransaction; param_SQLConnector : TSQLConnector; param_SQLQuery : TSQLQuery; param_nombre_tabla : String; param_Ver_Bajas : ShortInt; param_SQL_SELECT_FROM_JOIN : String; param_SQL_WHERE, param_SQL_ORDER_BY, param_SQL_WHERE_PLUS : TStrings; param_Cambiamos_Filtro : Boolean; param_no_Cerrar_Conexion : Boolean = false; param_ver_SQL_despues_Abrir : Boolean ) : ShortInt;
function  UTI_TB_Cerrar(param_SQLConnector: TSQLConnector; param_SQLTransaction: TSQLTransaction; param_SQLQuery: TSQLQuery): boolean;
procedure UTI_TB_Quitar_Filtro(param_Frase : AnsiString; param_SQL : TStrings);
procedure UTI_TB_Rellenar_ComboBox_Orden( param_Vaciamos_ComboBox : Boolean; param_ComboBox : TComboBox; param_Opciomes : array of TOrder_By; param_Indice_donde_Arrancamos : Integer);
procedure UTI_TB_SQL_ADD( param_Vaciar : Boolean; param_WHERE_OLD, param_para_anadir_WHERE : TStrings );

function  UTI_TB_Query_Open( param_DeleteSQL, param_UpdateSQL, param_InsertSQL : String; param_SQLConnector: TSQLConnector; param_SQLQuery: TSQLQuery; param_PacketRecords: integer; param_SQL: string; param_no_Cerrar_Conexion : Boolean = false ) : Boolean;
function  UTI_TB_Query_Open_2( param_DeleteSQL, param_UpdateSQL, param_InsertSQL : String; param_SQLQuery: TSQLQuery; param_PacketRecords: integer; param_SQL: string ) : boolean;

function  UTI_RGTROS_Grabar( param_Nombre_Tabla : ShortString; param_SQLTransaction : TSQLTransaction; param_SQLQuery : TSQLQuery; param_hacemos_commit_alFinalizar : Boolean ) : Boolean;

procedure UTI_RGTROS_rollback( param_SQLTransaction : TSQLTransaction );
procedure UTI_RGTROS_commit( param_SQLTransaction : TSQLTransaction );

function  UTI_RGTROS_Historico_Update( param_Nombre_Tabla : ShortString; param_SQLQuery_Leer : TSQLQuery ) : Boolean;
function  UTI_RGTROS_Traer_Fecha_delRegistro( param_SQLQuery_Leer : TSQLQuery ) : ShortString;
function  UTI_RGTROS_Traer_Ultima_ID( param_SQLQuery : TSQLQuery ) : ShortString;
function  UTI_RGTROS_Historico_OLD_Valor( param_nombre_tabla, param_id, param_Campo_Nombre : ShortString; param_SQLQuery : TSQLQuery ) : String;
function  UTI_RGTROS_Historico_Update_2( param_SQLQuery_Leer, param_SQLQuery_Grabar : TSQLQuery; param_nombre_tabla, param_id, param_User, param_Terminal : ShortString; param_Momento : TDateTime ) : Boolean;
procedure UTI_RGTROS_guardar_valorCampo_BoforeEdit( param_SQLQuery : TSQLQuery );
procedure UTI_RGTROS_guardar_valorCampo_BoforePost( param_SQLQuery : TSQLQuery );
function  UTI_RGTROS_se_uso( param_SQL : TStrings  ) : ShortInt;

implementation

uses filtrar_registros, estado_registro, menu, utilidades_rgtro;

function UTI_TB_Borrar_Tabla_Sin_Respetar_Autoinc( param_tabla : String ) : Boolean;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
    Result := true;

    Try
        // ***************************************************************************************** //
        // ** Creamos la Transaccion y la conexión con el motor BD, y la abrimos                  ** //
        // ***************************************************************************************** //
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Connector_Open( var_SQLTransaction,
                                  var_SQLConnector ) = False then
        begin
          UTI_GEN_Salir;
        end;

        // ***************************************************************************************** //
        // ** CREAMOS LA SQL                                                                      ** //
        // ***************************************************************************************** //
        var_SQL := TStringList.Create;

        var_SQL.Add( 'TRUNCATE TABLE ' + param_tabla );

        // ***************************************************************************************** //
        // ** Creamos el SQLQuery y Ejecutamos la sql                                             ** //
        // ***************************************************************************************** //
        var_SQLQuery          := TSQLQuery.Create(nil);

        var_SQLQuery.Database := var_SQLConnector;
        var_SQLQuery.SQL.Text := var_SQL.Text;

        var_SQLQuery.Name     := 'SQLQuery_UTI_TB_Borrar_Tabla_Sin_Respetar_Autoinc';

        var_SQLQuery.ExecSQL;
        var_SQLTransaction.Commit;

        // ***************************************************************************************** //
        // ** Destruimos el SQLQuery la SQL creada                                                ** //
        // ***************************************************************************************** //
        var_SQLQuery.Free;
        var_SQL.Free;

        // ***************************************************************************************** //
        // ** Cerramos La transacción y la conexión con la BD                                     ** //
        // ***************************************************************************************** //
        if UTI_CN_Connector_Close( var_SQLTransaction,
                                   var_SQLConnector ) = False then UTI_GEN_Salir;

        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    Except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( 'Error al borrar, respetando los AutoInc, todos los registros de la tabla ' +
                               param_tabla,
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

function UTI_TB_Borrar_Tabla_Respetando_Autoinc( param_tabla : String ) : Boolean;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
    Result := true;

    Try
        // ***************************************************************************************** //
        // ** Creamos la Transaccion y la conexión con el motor BD, y la abrimos                  ** //
        // ***************************************************************************************** //
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Connector_Open( var_SQLTransaction,
                                  var_SQLConnector ) = false then
        begin
          UTI_GEN_Salir;
        end;

        // ***************************************************************************************** //
        // ** CREAMOS LA SQL                                                                      ** //
        // ***************************************************************************************** //
        var_SQL := TStringList.Create;

        var_SQL.Add( 'DELETE FROM ' + param_tabla );

        // ***************************************************************************************** //
        // ** Creamos el SQLQuery y Ejecutamos la sql                                             ** //
        // ***************************************************************************************** //
        var_SQLQuery          := TSQLQuery.Create(nil);

        var_SQLQuery.Database := var_SQLConnector;
        var_SQLQuery.SQL.Text := var_SQL.Text;

        var_SQLQuery.Name     := 'SQLQuery_UTI_TB_Borrar_Tabla_Respetando_Autoinc';

        var_SQLQuery.ExecSQL;
        var_SQLTransaction.Commit;

        // ***************************************************************************************** //
        // ** Destruimos el SQLQuery la SQL creada                                                ** //
        // ***************************************************************************************** //
        var_SQLQuery.Free;
        var_SQL.Free;

        // ***************************************************************************************** //
        // ** Cerramos La transacción y la conexión con la BD                                     ** //
        // ***************************************************************************************** //
        if UTI_CN_Connector_Close( var_SQLTransaction,
                                   var_SQLConnector ) = False then UTI_GEN_Salir;

        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    Except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( 'Error al borrar, respetando los AutoInc, todos los registros de la tabla ' +
                               param_tabla,
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

function UTI_CN_Fecha_Hora : TDateTime;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_CN_Conexion    : Trecord_CN_Conexion;
    var_SQLQuery       : TSQLQuery;
begin
  { ****************************************************************************
    Creamos la Transaccion y la conexión con el motor BD, y la abrimos
    **************************************************************************** }
    var_SQLTransaction := TSQLTransaction.Create(nil);
    var_SQLConnector   := TSQLConnector.Create(nil);

    if UTI_CN_Connector_Open( var_SQLTransaction,
                              var_SQLConnector ) = false then
    begin
      UTI_GEN_Salir;
    end;

  { ****************************************************************************
    Creamos la SQL Según el motor de BD
    **************************************************************************** }
    var_SQL := TStringList.Create;

    var_CN_Conexion := UTI_CN_Configuracion_INI_Traerla;
    if var_CN_Conexion.con_Exito = False then UTI_GEN_Salir;

    if UpperCase(Copy(var_CN_Conexion.ConnectorType, 1, 5)) = UpperCase('MySQL') then
    begin
        var_SQL.Add('SELECT NOW() AS Momento');
    end;

    if Trim(var_CN_Conexion.ConnectorType) = 'MSSQLServer' then
    begin
        var_SQL.Add('SELECT GETDATE() AS Momento');
    end;

    if Trim(var_CN_Conexion.ConnectorType) = 'Firebird' then
    begin
        var_SQL.Add('select current_timestamp as Momento from rdb$database;');
    end;

    if Trim(var_CN_Conexion.ConnectorType) = 'Oracle' then
    begin
        var_SQL.Add('SELECT tt_sysdate AS Momento FROM dual;');
    end;

    if Trim(var_CN_Conexion.ConnectorType) = 'PostgreSQL' then
    begin
        var_SQL.Add('SELECT CURRENT_TIMESTAMP AS Momento;');
    end;

    if Trim(var_CN_Conexion.ConnectorType) = 'SQLite3' then
    begin
        // SELECT datetime('now') AS Momento;
        var_SQL.Add('SELECT datetime(' + UTI_GEN_Comillas( 'now' ) + ') AS Momento;');
    end;

    if Trim(var_CN_Conexion.ConnectorType) = 'Sybase' then
    begin
        var_SQL.Add('SELECT getdate() AS Momento');
    end;

  { ****************************************************************************
    Pasamos a traer la fecha y a devolverla
    **************************************************************************** }
    var_SQLQuery          := TSQLQuery.Create(nil);
    var_SQLQuery.Name     := 'SQLQuery_UTI_CN_Fecha_Hora';
    var_SQLQuery.Database := var_SQLConnector;

    if UTI_TB_Query_Open( '',
                          '',
                          '',
                          var_SQLConnector,
                          var_SQLQuery,
                          -1, // asi me trae todos los registros de golpe
                          var_SQL.Text ) = False then UTI_GEN_Salir;

    Result := var_SQLQuery.FieldByName('Momento').Value;

    if UTI_TB_Cerrar( var_SQLConnector,
                      var_SQLTransaction,
                      var_SQLQuery ) = false then UTI_GEN_Salir;

    var_SQLQuery.Free;

    var_SQL.Free;

    var_SQLTransaction.Free;
    var_SQLConnector.Free;
end;

function UTI_TB_Quitar_AndOr_Principio( param_SQL : Ansistring ) : AnsiString;
begin
    if UpperCase(Copy(Trim(param_SQL), 0, 3)) = UpperCase('AND') then
    begin
        param_SQL := Copy(Trim(param_SQL), 4, (length(param_SQL) - 4));
    end;

    if UpperCase(Copy(Trim(param_SQL), 0, 2)) = UpperCase('OR') then
    begin
        param_SQL := Copy(Trim(param_SQL), 3, (length(param_SQL) - 3));
    end;

    Result := Trim(param_SQL);
end;

procedure UTI_TB_Quitar_Filtro( param_Frase : AnsiString;
                                param_SQL : TStrings );
var var_Pos             : Integer;
    var_Frase_Principio : AnsiString;
    var_Frase_Final     : AnsiString;
    var_Total           : Integer;
    var_Buscar          : AnsiString; // string;
begin
    var_Buscar := param_SQL.Text;
    var_Pos    := Pos(UpperCase(param_Frase), UpperCase(param_SQL.Text));

    if var_Pos > 0 then
    begin
        var_Frase_Principio := Trim(Copy(var_Buscar, 0, (var_Pos - 1)));

        var_Total           := var_Pos + Length(param_Frase);
        var_Frase_Final     := Trim(  Copy( var_Buscar,
                                            var_Total,
                                            length(var_Buscar) - (var_Total - 1) )  );

        var_Buscar          := var_Frase_Principio + var_Frase_Final;

        param_SQL.Clear;
        param_SQL.Add(var_Buscar);
    end;
end;

procedure UTI_TB_Ver_Bajas_SN( param_nombre_tabla : String;
                               param_SQL : TStrings;
                               param_ver_Bajas : shortint );
begin
  // Quitamos si ya está anteriormente este filtro
  if Trim(param_nombre_tabla) <> '' then
    begin
      UTI_TB_Quitar_Filtro('AND ' + Trim(param_nombre_tabla) + '.Del_WHEN IS NULL', param_SQL);
    end
  else
    begin
      UTI_TB_Quitar_Filtro('AND Del_WHEN IS NULL', param_SQL);
    end;

  if Trim(param_nombre_tabla) <> '' then
    begin
      UTI_TB_Quitar_Filtro('OR ' + Trim(param_nombre_tabla) + '.Del_WHEN IS NULL', param_SQL);
    end
  else
    begin
      UTI_TB_Quitar_Filtro('OR Del_WHEN IS NULL', param_SQL);
    end;

  if Trim(param_nombre_tabla) <> '' then
    begin
      UTI_TB_Quitar_Filtro( Trim(param_nombre_tabla) + '.Del_WHEN IS NULL', param_SQL);
    end
  else
    begin
      UTI_TB_Quitar_Filtro('Del_WHEN IS NULL', param_SQL);
    end;

  if param_ver_Bajas = 1 then
  begin
    { Se pidió NO VER las bajas, asi que como no existe( lo hemos quitado anteriormente ), pues lo añadimos }
    if Trim(param_SQL.Text) <> '' then
      begin
        // param_SQL ya tenía algo
        if (UpperCase(Copy(Trim(param_SQL.Text), 0, 3)) <> UpperCase('AND')) and
           (UpperCase(Copy(Trim(param_SQL.Text), 0, 2)) <> UpperCase('OR'))  then
          begin
            if Trim(param_nombre_tabla) <> '' then
              begin
                param_SQL.Text := Trim(param_nombre_tabla) + '.Del_WHEN IS NULL' + ' AND ' + Trim(param_SQL.Text);
              end
            else
              begin
                param_SQL.Text := 'Del_WHEN IS NULL' + ' AND ' + Trim(param_SQL.Text);
              end;
          end
        else
          begin
            if Trim(param_nombre_tabla) <> '' then
              begin
                param_SQL.Text := Trim(param_nombre_tabla) + '.Del_WHEN IS NULL' + ' ' + Trim(param_SQL.Text);
              end
            else
              begin
                param_SQL.Text := 'Del_WHEN IS NULL' + ' ' + Trim(param_SQL.Text);
              end;
          end;
      end
    else
      begin
        // param_SQL no tenía nada
        if Trim(param_nombre_tabla) <> '' then
          begin
            param_SQL.Text := Trim(param_nombre_tabla) + '.Del_WHEN IS NULL';
          end
        else
          begin
            param_SQL.Text := 'Del_WHEN IS NULL';
          end;
      end;
  end;

end;

function UTI_TB_Cambiar_Filtros( param_Order_By : array of TOrder_By;
                                 param_Ver_Bajas : ShortInt;
                                 param_nombre_tabla : String;
                                 param_SQLQuery : TSQLQuery;
                                 param_SQL_WHERE,
                                 param_SQL_ORDER_BY : TStrings ) : Trecord_Cambiar_Filtros_Devuelve;
var var_Form_Filtrar_Registros : TForm_Filtrar_Registros;
//  var_Contador               : ShortInt;
begin
    var_Form_Filtrar_Registros := TForm_Filtrar_Registros.Create(nil);

    var_Form_Filtrar_Registros.RadioGroup_Bajas.ItemIndex := param_Ver_Bajas;
    var_Form_Filtrar_Registros.public_nombre_tabla := param_nombre_tabla;

  { ****************************************************************************
    Movemos los campos a form_Filtrar_Registros
    **************************************************************************** }
    var_Form_Filtrar_Registros.public_Campos.Assign(param_SQLQuery.FieldDefs);
    var_Form_Filtrar_Registros.Rellenar_Campos;

  { ****************************************************************************
    Añadimos los anteriores filtros
    **************************************************************************** }
    var_Form_Filtrar_Registros.AnadirStrings_Filtros(param_SQL_WHERE);
    var_Form_Filtrar_Registros.AnadirStrings_OrderBy(param_SQL_ORDER_BY);

{
    SetLength( var_Form_Filtrar_Registros.public_Order_By,
               (length(param_Order_By) + 1) );

    var_Form_Filtrar_Registros.public_Order_By[0].Titulo       := 'Por campo elegido (ASC / DESC)';
    var_Form_Filtrar_Registros.public_Order_By[0].Memo_OrderBy := param_Order_By[var_Contador].Memo_OrderBy;

    for var_Contador := 0 to (Length(param_Order_By) - 1) do
    begin
        var_Form_Filtrar_Registros.public_Order_By[var_Contador + 1].Titulo       := param_Order_By[var_Contador].Titulo;
        var_Form_Filtrar_Registros.public_Order_By[var_Contador + 1].Memo_OrderBy := param_Order_By[var_Contador].Memo_OrderBy;
    end;
}
    var_Form_Filtrar_Registros.Rellenar_Filtros( param_Order_By );

  { ****************************************************************************
    Añadimos el anterior filtro y vemos si no pulso cancelar para devolver que
    filtramos o no
    **************************************************************************** }
    Result.bajas         := var_Form_Filtrar_Registros.RadioGroup_Bajas.ItemIndex;

    Result.Cambio_Filtro := true;

    Result.Ok            := false;

    var_Form_Filtrar_Registros.ShowModal;
    if var_Form_Filtrar_Registros.public_Pulso_Aceptar = true then
    begin
        param_SQL_WHERE.Assign(var_Form_Filtrar_Registros.Memo_Filtros.Lines);
        if var_Form_Filtrar_Registros.ComboBox_Filtros.ItemIndex = 0 then
             param_SQL_ORDER_BY.Assign(var_Form_Filtrar_Registros.Memo_OrderBy.Lines)
        else param_SQL_ORDER_BY.Text := param_Order_By[var_Form_Filtrar_Registros.ComboBox_Filtros.ItemIndex - 1].Memo_OrderBy;

        Result.Ok    := true;
        Result.bajas := var_Form_Filtrar_Registros.RadioGroup_Bajas.ItemIndex;
    end;

  { ****************************************************************************
    Destruimos el formulario para Filtrar_Registros
    **************************************************************************** }
    var_Form_Filtrar_Registros.Free;
end;

function UTI_TB_Cerrar( param_SQLConnector: TSQLConnector;
                        param_SQLTransaction: TSQLTransaction;
                        param_SQLQuery : TSQLQuery ) : Boolean;
begin
  try
    Result := True;
    param_SQLQuery.Active := False;

    if Assigned(param_SQLConnector) then
    begin
      Result := UTI_CN_Connector_Close( param_SQLTransaction, param_SQLConnector );
    end;

  except
    on error : Exception do
    begin
      Result := False;

      UTI_GEN_Error_Log( 'Error al CERRAR la TABLA ' + param_SQLQuery.Name + ' desde ' +
                         Screen.ActiveForm.Name,
                         error );
    end;
  end;

end;

function UTI_CN_Configuracion_INI_Traerla : Trecord_CN_Conexion;
var var_fichero_ini : TIniFile;
begin
    if (FileExists(GetCurrentDirUTF8 + '\ini\socger.ini')) then
    begin
        try
            var_fichero_ini                      := TIniFile.Create(GetCurrentDirUTF8 + '\ini\socger.ini');
            Result.con_Exito                     := true;
            Result.ConnectorType                 := var_fichero_ini.ReadString('HowConnectBD', 'ConnectorType', '');
            Result.DatabaseName                  := var_fichero_ini.ReadString('HowConnectBD', 'DatabaseName', '');
            Result.HostName                      := var_fichero_ini.ReadString('HowConnectBD', 'HostName', '');
            Result.Port                          := var_fichero_ini.ReadString('HowConnectBD', 'Port', '');
            Result.Password                      := var_fichero_ini.ReadString('HowConnectBD', 'Password', '');
            Result.UserName                      := var_fichero_ini.ReadString('HowConnectBD', 'UserName', '');

            Result.min_no_Work                   := var_fichero_ini.ReadString('Config', 'min_no_Work', '');
            Result.NumTerminal                   := var_fichero_ini.ReadString('Config', 'NumTerminal', '');
            Result.Language                      := var_fichero_ini.ReadString('Config', 'Language', '');

            Result.Impresora_descripcion_Elegida := var_fichero_ini.ReadString('Config', 'Impresora_descripcion_Elegida', '');
            Result.Impresora_Ctdad_Copias        := var_fichero_ini.ReadString('Config', 'Impresora_Ctdad_Copias', '');

            var_fichero_ini.Free;
        except
            on error : Exception do
            begin
                UTI_GEN_Error_Log( 'Error al ABRIR el fichero de CONFIGURACION' + ' desde ' +
                                   Screen.ActiveForm.Name,
                                   error );
                try
                    var_fichero_ini.Free;
                Except
                end;

                Result.con_Exito := False;
            end;
        end;
    end;
end;

function UTI_TB_Filtrar( param_Order_By : array of TOrder_By;
                         param_DeleteSQL,
                         param_UpdateSQL,
                         param_InsertSQL : String;
                         param_ctdad_Rgtros : Integer;
                         param_SQLTransaction : TSQLTransaction;
                         param_SQLConnector : TSQLConnector;
                         param_SQLQuery : TSQLQuery;
                         param_nombre_tabla : String;
                         param_Ver_Bajas : ShortInt;
                         param_SQL_SELECT_FROM_JOIN : String;

                         param_SQL_WHERE,
                         param_SQL_ORDER_BY,
                         param_SQL_WHERE_PLUS : TStrings;

                         param_Cambiamos_Filtro : Boolean;
                         param_ver_SQL_despues_Abrir : Boolean;
                         param_no_Cerrar_Conexion : Boolean {= false} ) : ShortInt;
var var_SQL       : String;
    var_Devuelto  : Trecord_Cambiar_Filtros_Devuelve;
    var_msg       : TStrings;
    var_a_Filtrar : TStrings;
begin
    var_a_Filtrar := TStringList.Create;

    // ********************************************************************************************* //
    // ** Si param_Ver_Bajas es 0 se ven las bajas y las altas                                    ** //
    // **                    es 1 se ven sólo las altas                                           ** //
    // **                    es 2 NO SE HACE nada con las bajas, se deja como venga en el filtro  ** //
    // ********************************************************************************************* //
    if param_Ver_Bajas <> 2 then
    begin
         UTI_TB_Ver_Bajas_SN(param_nombre_tabla, param_SQL_WHERE, param_Ver_Bajas);
    end;

    var_Devuelto.Cambio_Filtro := false;
    var_Devuelto.Ok            := false;
    var_Devuelto.bajas         := param_Ver_Bajas;

    if param_Cambiamos_Filtro = true then
    begin
        // ***************************************************************************************** //
        // ** Llamamos al formuloario que crea/modifica los filtros                               ** //
        // ** Por supuesto, pasamos también los forms ya creados                                  ** //
        // ***************************************************************************************** //
        var_Devuelto := UTI_TB_Cambiar_Filtros( param_Order_By,
                                                param_Ver_Bajas,
                                                param_nombre_tabla,
                                                param_SQLQuery,
                                                param_SQL_WHERE,
                                                param_SQL_ORDER_BY );
    end;

    // ********************************************************************************************* //
    // ** Devolvemos si se ha cambiado el ver bajas SI o NO                                       ** //
    // ********************************************************************************************* //
    Result := var_Devuelto.bajas;

    if (var_Devuelto.Cambio_Filtro = true) and
       (var_Devuelto.Ok = false)           then Exit;

    var_SQL := param_SQL_SELECT_FROM_JOIN;

    if ( Trim(param_SQL_WHERE.Text) <> '' )      or
       ( Trim(param_SQL_WHERE_PLUS.Text) <> '' ) then
    begin
        param_SQL_WHERE.Text := UTI_TB_Quitar_AndOr_Principio(param_SQL_WHERE.Text);

        var_a_Filtrar.Clear;
        var_a_Filtrar.AddStrings(param_SQL_WHERE);

        // var_a_Filtrar.Add(param_SQL_WHERE_PLUS);

        if Trim(param_SQL_WHERE_PLUS.Text) <> '' then
        begin
            UTI_TB_SQL_ADD( false,
                            var_a_Filtrar,
                            param_SQL_WHERE_PLUS );
        end;

        var_a_Filtrar.Text := UTI_TB_Quitar_AndOr_Principio(var_a_Filtrar.Text);

        var_SQL := Trim(var_SQL) + ' ' +
                   'WHERE' + ' ' + Trim(var_a_Filtrar.Text);
    end;

    // ********************************************************************************************* //
    // ** El order by solo lo ponemos si se le pasó                                               ** //
    // ********************************************************************************************* //
    if param_SQL_ORDER_BY.Text <> '' then
    begin
        var_SQL := Trim(var_SQL) + ' ORDER BY ' + param_SQL_ORDER_BY.Text;
    end;

    if UTI_TB_Query_Open( param_DeleteSQL,
                          param_UpdateSQL,
                          param_InsertSQL,
                          param_SQLConnector,
                          param_SQLQuery,
                          param_ctdad_Rgtros,
                          var_SQL,
                          param_no_Cerrar_Conexion ) = false then
    begin
      // ESTAS LINEAS DE ABAJO SIRVEN PARA DESCUBRIR PORQUE LA SQL NO SE REALIZA BIEN
      var_msg := TStringList.Create;
      var_msg.add(var_SQL);
      UTI_GEN_Aviso(true, var_msg, 'ERROR', True, False);
      var_msg.free;

      UTI_GEN_Salir;
    end else begin
      if param_ver_SQL_despues_Abrir = true then
      begin
        // ESTAS LINEAS DE ABAJO SIRVEN PARA DESCUBRIR PORQUE LA SQL SE REALIZA BIEN, pero no como ntros queremos
        var_msg := TStringList.Create;
        var_msg.add(var_SQL);
        UTI_GEN_Aviso(true, var_msg, 'ERROR', True, False);
        var_msg.free;
      end;

    end;

    var_a_Filtrar.Free;
end;

procedure UTI_TB_Rellenar_ComboBox_Orden( param_Vaciamos_ComboBox : Boolean;
                                          param_ComboBox : TComboBox;
                                          param_Opciomes : array of TOrder_By;
                                          param_Indice_donde_Arrancamos : Integer);
var var_Contador : ShortInt;
begin
    // ********************************************************************************************* //
    // ** Rellenamos el combobox de los campos de la tabla devueltos por la sql                   ** //
    // ********************************************************************************************* //
    if param_Vaciamos_ComboBox = true then
    begin
        param_ComboBox.Items.Clear;
    end;

    for var_Contador := 0 to (length(param_Opciomes) - 1) do
    begin
        param_ComboBox.Items.Add(param_Opciomes[var_Contador].Titulo);
    end;

    param_ComboBox.ItemIndex := param_Indice_donde_Arrancamos;
end;

function UTI_CN_Configuracion_INI_Grabar_Idioma( param_Idioma : ShortString ) : Boolean;
var var_fichero_ini : TIniFile;
begin
    Result := true;
    try
        var_fichero_ini := TIniFile.Create(GetCurrentDirUTF8 + '\ini\socger.ini');

        var_fichero_ini.WriteString('Config', 'Language', param_Idioma);

        var_fichero_ini.Free;
    except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( 'Error al actualizar el idioma de la aplicación' + ' desde ' +
                               Screen.ActiveForm.Name,
                               error );
            try
                var_fichero_ini.Free;
            Except
            end;

            Result := false;
        end;
    end;
end;

procedure UTI_RGTROS_commit( param_SQLTransaction : TSQLTransaction );
begin
  param_SQLTransaction.CommitRetaining;
end;

procedure UTI_RGTROS_rollback( param_SQLTransaction : TSQLTransaction );
begin
  param_SQLTransaction.RollbackRetaining;
end;

function UTI_RGTROS_Grabar( param_Nombre_Tabla : ShortString;
                            param_SQLTransaction : TSQLTransaction;
                            param_SQLQuery : TSQLQuery;
                            param_hacemos_commit_alFinalizar : Boolean ) : Boolean;
{
var
  var_msg : String;
  var_Commit_SN : Boolean;
}
begin
  { Vamos a intentar grabar los cambios realizados por el usuario en el registro }
  Result := false;

  if param_SQLQuery.Transaction.Active then

  // if param_SQLTransaction.Active then
  begin
    Try
      { Evidentemente sólo se realizarán los cambios si la Transaction está activa }
      param_SQLQuery.ApplyUpdates;
      Result := true;

      { Comprobamos si hay que guardar o no los cambios del registro para guardar un histórico de él }
      form_Menu.Traer_Configuracion_APP;
      if Trim(UpperCase(form_menu.public_User_Configuracion.Guardar_Cambios_de_Registros_SN)) = 'S' then
      begin
        if UTI_RGTROS_Historico_Update( param_Nombre_Tabla,
                                        param_SQLQuery ) = false then
        begin
          { Si no consigue guardar en el histórico todos los cambios de la tabla, pues hechamos marcha atras de todo }
          Result := false;
        end

        else
        begin
          Result := true;
        end;
      end;

      if Result = true then
      begin
        { No se produjo ningún error en la actualización de los cambios en la BD, por lo que liberamos la Transacción }
        if param_hacemos_commit_alFinalizar = false then
        begin
          UTI_RGTROS_commit( param_SQLTransaction );
        end

        else
        begin
          // Resulta que vamos a hacer el commit al final, cuando se pulse sobre el botón aceptar del módulo en el que estemos
          // insertando o modificando registros
        end;
      end

      else
      begin
        { Hubieron errores al guardar el histórico de los cambios realizados, damos marcha atrás a los cambios realizados }
        UTI_RGTROS_rollback( param_SQLTransaction );
      end;

    Except
      on error : Exception do
      begin
        Result := false;

        { Se produjo un error en la actualización de los cambios en la BD, por lo que damos marcha atrás a todos los cambios }
        UTI_RGTROS_rollback( param_SQLTransaction );

        { Guardamos el error en el fichero .log y lo presentamos por pantalla }
        UTI_GEN_Error_Log( 'Ocurrió un error de conexión con la BD. La tabla ha sido ' +
                           param_SQLQuery.Name + ' desde el módulo ' +
                           Screen.ActiveForm.Name,
                           error );
      end;
    end;

  end;

end;

function UTI_RGTROS_Historico_Update( param_Nombre_Tabla : ShortString;
                                      param_SQLQuery_Leer : TSQLQuery ) : Boolean;
var
  var_SQLQuery     : TSQLQuery;
  var_msg          : TStrings;

  var_nombre_tabla : ShortString;
  var_id           : ShortString;
  var_User         : ShortString;
  var_Terminal     : ShortString;
  var_Momento      : TDateTime;
begin
  Result := false;

  try
    // Creamos el SQLQuery
    var_SQLQuery          := TSQLQuery.Create(nil);
    var_SQLQuery.Database := param_SQLQuery_Leer.Database;

    // Grabajos en el histórico de los cambios del registro este nuevo cambio realizado por una insercción
    // o un update

    // PRIMERO VEMOS CUAL ES EL NOMBRE DE LA TABLA
    if Trim(param_Nombre_Tabla) <> '' then
      var_nombre_tabla := Trim(param_Nombre_Tabla)
    else
      var_nombre_tabla := Trim(param_SQLQuery_Leer.Name);

    // VEMOS CUAL ES EL USUARIO QUE CREA O MODIFICA EL REGISTRO
    var_User  := Trim(IntToStr(Form_Menu.public_User));

    // VEMOS CUAL ES LA id DEL REGISTRO
    var_id := Trim(param_SQLQuery_Leer.FieldByName('id').asString);
    if Trim(var_id) = '' then
    begin
      // Era una insercion y no tenía el id, así que lo buscamos
      var_id := UTI_RGTROS_Traer_Ultima_ID( var_SQLQuery );

      if Trim(var_id) = '' then
      begin
        var_msg := TStringList.Create;
        var_msg.Clear;

        var_msg.Add( 'No se pudo encontrar el registro recién creado para actualizar su histórico, así que no se guarda nada.' );
        var_msg.Add( ' ' );
        var_msg.Add( 'Hechamos marcha atrás a todo.' );
        UTI_GEN_Aviso(true, var_msg, 'ERROR', True, False);
        var_msg.Free;

        var_SQLQuery.Free;
        Exit;
      end;

    end;

   // VEMOS CUAL ES LA TERMINAL, SI NO ESTA CONFIGURADA EN EL FICHERO .INI SE PONDRA LA TERMINAL COMO 0
    var_Terminal := '0';
    if Trim(form_menu.public_Terminal) <> '' then
    begin
      var_Terminal := form_menu.public_Terminal;
    end;

    // Fecha para el histórico
    var_Momento := StrToDateTime(Trim(UTI_RGTROS_Traer_Fecha_delRegistro( param_SQLQuery_Leer )));

    // Creamos la SQL
    with var_SQLQuery do
    begin
      SQL.Clear;

      SQL.Add( 'INSERT INTO users_row_changes' );
      SQL.Add(     '( tb,' );
      SQL.Add(       'id,' );
      SQL.Add(       'Momento,' );
      SQL.Add(       'Id_Users,' );
      SQL.Add(       'id_terminales )' );
      SQL.Add( 'VALUES' );
      SQL.Add(     '( :tb,' );
      SQL.Add(       ':id,' );
      SQL.Add(       ':Momento,' );
      SQL.Add(       ':Id_Users,' );
      SQL.Add(       ':id_terminales )' );

      Name := 'SQLQuery_UTI_RGTROS_Historico_Update';

      // Le pasamos los valores a los parámetros de la sql
      Params.ParamByName('tb').AsString         := var_nombre_tabla;
      Params.ParamByName('id').AsString         := var_id;
      Params.ParamByName('Momento').Value       := var_Momento;
      Params.ParamByName('Id_Users').Value      := var_User;
      Params.ParamByName('id_terminales').Value := var_Terminal;
    end;

    // Ejecutamos la SQL
    var_SQLQuery.ExecSQL;

    if UTI_RGTROS_Historico_Update_2( param_SQLQuery_Leer,
                                      var_SQLQuery,
                                      var_nombre_tabla,
                                      var_id,
                                      var_User,
                                      var_Terminal,
                                      var_Momento ) = true then
    begin
      Result := true;
    end;

    // Destruimos la tabla
    var_SQLQuery.Free;

  except
    on error : Exception do
    begin
      Result := false;

      UTI_GEN_Error_Log( 'Ocurrió un error al intentar grabar en el histórico los cambios' +
                         ' realizados en el registro. La tabla ha sido ' +
                         param_SQLQuery_Leer.Name + ' desde el módulo ' +
                         Screen.ActiveForm.Name,
                         error );

      try
        var_SQLQuery.Free;
      except
      end;

    end;
  end;

end;

function UTI_RGTROS_Historico_Update_2( param_SQLQuery_Leer,
                                        param_SQLQuery_Grabar : TSQLQuery;
                                        param_nombre_tabla,
                                        param_id,
                                        param_User,
                                        param_Terminal : ShortString;
                                        param_Momento : TDateTime ) : Boolean;
var var_Contador         : Integer;
    var_Valor            : String;
    var_fallo_alguna_vez : Boolean;
    var_Nombre_Campo     : String;
begin
  Result := false;

  try
    // Pasamos a grabar ahora el registro sobre la otra tabla, la del detalle de los campos
    var_fallo_alguna_vez := false;

    for var_Contador := 0 to param_SQLQuery_Leer.Fields.Count - 1 do
    begin
      var_Nombre_Campo := param_SQLQuery_Leer.Fields[var_Contador].FieldName;

      // LOS CAMPOS QUE EMPIEZAN POR OT_ SON CAMPOS JOIN, asi que no guardo cambios
      If Pos( UpperCase('OT_'), UpperCase(var_Nombre_Campo) ) = 0 then
      begin
        // Busca el último valor para ese campo en la tabla precisa y en el id preciso.

        // Tengo que ver si su último valor no es el mismo que el actual, si no lo es
        // pues grabo su nuevo valor. Si no existe este campo (no se creo o modifocó
        // todavía), pues grabo su nuevo valor.

        // Por supuesto si es un campo ID no hago nada, no grabo nada.
        if UpperCase(Trim(var_Nombre_Campo)) <> 'ID' then
        begin
          var_Valor := UTI_RGTROS_Historico_OLD_Valor( param_nombre_tabla,
                                                       param_id,
                                                       Trim(var_Nombre_Campo),
                                                       param_SQLQuery_Grabar );
          if var_Valor = 'ERROR' then
          begin
            var_fallo_alguna_vez := true;
          end else begin
            if var_Valor <> param_SQLQuery_Leer.Fields[var_Contador].AsString then
            begin
              // LOS CAMPOS QUE EMPIEZAN POR OT_ SON CAMPOS JOIN, asi que no guardo cambios
              with param_SQLQuery_Grabar do
              begin
                SQL.Clear;

                SQL.Add( 'INSERT INTO users_row_changes_fields' );
                SQL.Add(     '( tb,' );
                SQL.Add(       'id,' );
                SQL.Add(       'Momento,' );
                SQL.Add(       'Id_Users,' );
                SQL.Add(       'id_terminales,' );

                SQL.Add(       'Campo_Nombre,' );
                SQL.Add(       'Campo_Valor,' );
                SQL.Add(       'Campo_Valor_OLD )' );

                SQL.Add( 'VALUES' );
                SQL.Add(     '( :tb,' );
                SQL.Add(       ':id,' );
                SQL.Add(       ':Momento,' );
                SQL.Add(       ':Id_Users,' );
                SQL.Add(       ':id_terminales,' );

                SQL.Add(       ':Campo_Nombre,' );
                SQL.Add(       ':Campo_Valor,' );
                SQL.Add(       ':Campo_Valor_OLD )' );

                // Les pasamos los valores a los parámetros de la sql
                Params.ParamByName('tb').AsString              := param_nombre_tabla;
                Params.ParamByName('id').AsString              := param_id;
                Params.ParamByName('Momento').Value            := param_Momento;
                Params.ParamByName('Id_Users').Value           := param_User;
                Params.ParamByName('id_terminales').Value      := param_Terminal;

                Params.ParamByName('Campo_Nombre').AsString    := Trim(var_Nombre_Campo);
                Params.ParamByName('Campo_Valor').AsString     := param_SQLQuery_Leer.Fields[var_Contador].AsString;
                Params.ParamByName('Campo_Valor_OLD').AsString := var_Valor;

                ExecSQL;
              end;
            end;
          end;
        end;
      end;

    end;

    if var_fallo_alguna_vez = false then
    begin
      Result := true;
    end;

  except
    on error : Exception do
    begin
      Result := false;

      UTI_GEN_Error_Log( 'Ocurrió un error al intentar grabar en el histórico los cambios' +
                         ' realizados en el registro. Pero en el detalle de cada campo.' +
                         ' La tabla ha sido ' + param_SQLQuery_Grabar.Name +
                         ' desde el módulo ' + Screen.ActiveForm.Name,
                         error );
    end;
  end;
end;

function UTI_RGTROS_Traer_Fecha_delRegistro( param_SQLQuery_Leer : TSQLQuery ) : ShortString;
begin
  // VEMOS CUAL ES EL MOMENTO EN EL QUE SE CREA O MODIFICA EL REGISTRO
  // ESTE MOMENTO CAMBIARA SEGUN SEA UNA MODIFICACION O UN ALTA O UN BORRADO
  Result := '';

  if not param_SQLQuery_Leer.FieldByName('Insert_WHEN').IsNull then
  begin
    if Trim(Result) = '' then
    begin
      Result := param_SQLQuery_Leer.FieldByName('Insert_WHEN').AsString;
    end else begin
      if StrToDateTime(Trim(Result)) < param_SQLQuery_Leer.FieldByName('Insert_WHEN').Value then
      begin
        Result := param_SQLQuery_Leer.FieldByName('Insert_WHEN').AsString;
      end;
    end;
  end;

  if not param_SQLQuery_Leer.FieldByName('Del_WHEN').IsNull then
  begin
    if Trim(Result) = '' then
    begin
      Result := param_SQLQuery_Leer.FieldByName('Del_WHEN').AsString;
    end else begin
      if StrToDateTime(Trim(Result)) < param_SQLQuery_Leer.FieldByName('Del_WHEN').Value then
      begin
        Result := param_SQLQuery_Leer.FieldByName('Del_WHEN').AsString;
      end;
    end;
  end;

  if not param_SQLQuery_Leer.FieldByName('Change_WHEN').IsNull then
  begin
    if Trim(Result) = '' then
    begin
      Result := param_SQLQuery_Leer.FieldByName('Change_WHEN').AsString;
    end else begin
      if StrToDateTime(Trim(Result)) < param_SQLQuery_Leer.FieldByName('Change_WHEN').Value then
      begin
        Result := param_SQLQuery_Leer.FieldByName('Change_WHEN').AsString;
      end;
    end;
  end;

  // Si aun así Result no tiene un valor pues se lo sacamos a UTI_CN_Fecha_Hora
  if Trim(Result) = '' then
  begin
    Result := DateTimeToStr(UTI_CN_Fecha_Hora); // Resulta que Result no pudo traer ningun valor
  end;

end;

function UTI_RGTROS_Traer_Ultima_ID( param_SQLQuery : TSQLQuery ) : ShortString;
var
  var_SQL : String;
begin
  try
    // Creamos la SQL
    var_SQL             := 'SELECT last_insert_id() as id;';

    param_SQLQuery.Name := 'SQLQuery_UTI_RGTROS_Traer_Ultima_ID';

    Result              := '';

    // Ejecutamos la SQL que nos traerá la id
    if UTI_TB_Query_Open_2( '',
                            '',
                            '',
                            param_SQLQuery,
                            -1,                         // asi me trae todos los registros de golpe
                            var_SQL ) = false then
    begin
      // Dio un error en la apertura de la tabla por lo que voy a devolver que no se pudo traer la id
      Exit;
    end;

    // Devolvemos el valor de la id
    if param_SQLQuery.RecordCount > 0 then
    begin
      if not param_SQLQuery.FieldByName('id').IsNull then
      begin
        Result := param_SQLQuery.FieldByName('id').AsString;
        if Trim(Result) = '0' then
        begin
          Result := '';
        end;

      end;
    end;

  except
    on error : Exception do
    begin
      Result := '';

      UTI_GEN_Error_Log( 'Ocurrió un error al traer la id del registro que intentamos grabar' +
                         ' en el histórico sus cambios realizados. La tabla ha sido ' +
                         param_SQLQuery.Name + ' desde el módulo ' + Screen.ActiveForm.Name,
                         error );
    end;
  end;

end;

function UTI_RGTROS_Historico_OLD_Valor( param_nombre_tabla,
                                         param_id,
                                         param_Campo_Nombre : ShortString;
                                         param_SQLQuery : TSQLQuery ) : String;
begin
    try
        with param_SQLQuery do
        begin
          Name := 'SQLQuery_UTI_RGTROS_Historico_OLD_Valor';

          // Creamos la SQL
          SQL.Clear;

          SQL.Add( 'SELECT Campo_Valor FROM users_row_changes_fields' );
          SQL.Add(  'WHERE tb = ' + UTI_GEN_Comillas(param_nombre_tabla) );
          SQL.Add(    'AND id = ' + Trim(param_id) );
          SQL.Add(    'AND Campo_Nombre = ' + UTI_GEN_Comillas(param_Campo_Nombre) );
          SQL.Add(  'ORDER BY tb ASC, ' +
                             'id ASC, ' +
                             'Momento DESC' );
          SQL.Add( 'LIMIT 1' );
        end;

        // Ejecutamos la SQL
        if UTI_TB_Query_Open_2( '',
                                '',
                                '',
                                param_SQLQuery,
                                -1,                         // asi me trae todos los registros de golpe
                                param_SQLQuery.SQL.Text ) = false then
        begin
          Result := 'ERROR';
        end
        else begin
          // Devolvemos el valor OLD
          Result := '';
          if param_SQLQuery.RecordCount > 0 then
          begin
            if not param_SQLQuery.FieldByName('Campo_Valor').IsNull then
            begin
              Result := param_SQLQuery.FieldByName('Campo_Valor').AsString;
            end;
          end;
        end;

    except
      on error : Exception do
      begin
        Result := 'ERROR';

        UTI_GEN_Error_Log( 'Ocurrió un error al intentar encontrar en el histórico el último' +
                           ' valor de un campo. La tabla ha sido ' + param_SQLQuery.Name +
                           ' desde el módulo ' + Screen.ActiveForm.Name,
                           error );
      end;
    end;
end;

procedure UTI_RGTROS_guardar_valorCampo_BoforePost( param_SQLQuery : TSQLQuery );
var
  var_Contador : ShortInt;
begin
  // Esto es para guardar en parámetros su valor actual, es decir el valor que tiene después hacerse
  // el Edit y antes de grabarse el registro. Por eso se pone en el beforePost de la tabla
  with param_SQLQuery do
  begin
    Params.Clear;

    for var_Contador := 0 to (FieldDefs.Count - 1) do
    begin
      Params.CreateParam(ftUnknown, FieldDefs.Items[var_Contador].Name, ptUnknown);
    end;
  end;

  param_SQLQuery.Params.CopyParamValuesFromDataset(param_SQLQuery, true);
end;

procedure UTI_RGTROS_guardar_valorCampo_BoforeEdit( param_SQLQuery : TSQLQuery );
var
  var_Contador      : Integer;
  var_Nombre_Params : ShortString;
  var_Nombre_Campo  : ShortString;
begin
  // Esto es para guardar en parámetros su valor antes de hacer cualquier modificación del registro.
  // Por eso se pone en el beforeEdit de la tabla.
  with param_SQLQuery do
  begin
    Params.Clear;

    for var_Contador := 0 to (FieldDefs.Count - 1) do
    begin
      var_Nombre_Params := 'COPY_' + FieldDefs.Items[var_Contador].Name;
      var_Nombre_Campo  := FieldDefs.Items[var_Contador].Name;

      Params.CreateParam(ftUnknown, Trim(var_Nombre_Params), ptUnknown);

      Params.ParamByName(Trim(var_Nombre_Params)).AsString := FieldByName(Trim(var_Nombre_Campo)).AsString;
    end;
  end;

end;

function UTI_RGTROS_se_uso( param_SQL : TStrings ) : ShortInt;
var var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
  try
    // Creamos la Transaccion y la conexión con el motor BD, y la abrimos
    var_SQLTransaction := TSQLTransaction.Create(nil);
    var_SQLConnector   := TSQLConnector.Create(nil);

    if UTI_CN_Connector_Open( var_SQLTransaction,
                              var_SQLConnector ) = false then
    begin
      UTI_GEN_Salir;
    end;

    // Creamos el SQLQuery y le pasamos el SQLConnector
    var_SQLQuery          := TSQLQuery.Create(nil);
    var_SQLQuery.Name     := 'SQLQuery_se_uso_Rgtro_SQLQuery_Principal';
    var_SQLQuery.Database := var_SQLConnector;

    // Creamos la SQL
    var_SQLQuery.SQL.Clear;
    var_SQLQuery.SQL.AddStrings(param_SQL);

    // Abrimos la Query
    if UTI_TB_Query_Open( '',
                          '',
                          '',
                          var_SQLConnector,
                          var_SQLQuery,
                          -1, // asi me trae todos los registros de golpe
                          var_SQLQuery.SQL.Text ) = false then UTI_GEN_Salir;

    // Hacemos las comprobaciones que nos hagan falta de la SQL que hemos hecho
    // Result = 0, resulta que aunque es un impuesto compuesto, pues no ha encontrado todas sus partes
    Result := 0;

    with var_SQLQuery do
    begin
      First;

      while not eof do
      begin
        if FieldByName('cantidad').Value > 0 then
        begin
          Result := 1;
        end;

        Next;
      end;
    end;

    // ***************************************************************************************** //
    // ** Cerramos la tabla y asi se cierra automaticamente La transacción y conexión con BD  ** //
    // ***************************************************************************************** //
    if UTI_TB_Cerrar( var_SQLConnector,
                      var_SQLTransaction,
                      var_SQLQuery ) = false then
    begin
      UTI_GEN_Salir;
    end;

    // ***************************************************************************************** //
    // ** Destruimos la tabla y conexiones                                                    ** //
    // ***************************************************************************************** //
    var_SQLQuery.Free;
    var_SQLTransaction.Free;
    var_SQLConnector.Free;
  except
    on error : Exception do
    begin
      Result := 2; // Error en el acceso
      UTI_GEN_Error_Log( 'Ocurrió un error al intentar saber si el registro se ha usado alguna vez.',
                         error );
      try
        var_SQLTransaction.Free;
        var_SQLConnector.Free;
        var_SQLQuery.Free;
      except
      end;
    end;
  end;
end;

function UTI_TB_Query_Open_2( param_DeleteSQL,
                              param_UpdateSQL,
                              param_InsertSQL : String;
                              param_SQLQuery: TSQLQuery;
                              param_PacketRecords: integer;
                              param_SQL: string ) : boolean;
var var_msg : TStrings;
begin
  try
    Result := True;

    with param_SQLQuery do
    begin
      Active          := False;
      AutoCalcFields  := True;
      Database        := param_SQLQuery.Database;
      PacketRecords   := param_PacketRecords;

      MaxIndexesCount := 100;  // Ensure the TSQLQuery.MaxIndexesCount is large enough to hold the new indexes you will be creating. For this example I had it set to 100.
      IndexFieldNames := '';   // Esto nos permite ordenar el DbGrid, o mas bien el TDataSet, ejemplo IndexFieldNames := 'LastName;FirstName';

      Filtered        := true; // Lo pongo a true porque puede ser que en el onfilter del sqlquery ponga algo

      ParseSQL        := true; // Esto es obligado porque ntros vamos a controlar las sql con parametros

      DeleteSQL.Text  := Trim(param_DeleteSQL);
      UpdateSQL.Text  := Trim(param_UpdateSQL);
      InsertSQL.Text  := Trim(param_InsertSQL);

      SQL.Clear;
      SQL.Add(param_SQL);

      if param_PacketRecords = 999 then
      begin
        {jeromito}
        var_msg := TStringList.Create;
        var_msg.add(param_SQL);
        UTI_GEN_Aviso(true, var_msg, 'ERROR', True, False);
        var_msg.free;
      end;

      UpdateMode         := upWhereKeyOnly;
      UsePrimaryKeyAsKey := True;

      Active             := true;

      { Copiado de ... http://wiki.freepascal.org/SqlDBHowto/es

        ¿Por qué TSQLQuery.RecordCount siempre devuelve 0?
        Para contar los registros de un dataset, usaremos RecordCount.

        Sin embargo, observa que RecordCount muestra el número de registros que se ha cargado
        desde el servidor.

        SQLdb no lee todos los registros al abrir un TSQLQuery de forma predeterminada, sólo
        los 10 primeros.

        Sólo cuando se accede al undécimo registro entonces el siguiente conjunto de 10 registros
        se carga. Usando .Last todos los registros se cargarán.

        Si desea conocer el número real de registros en el servidor hay que llamar primero '.Last'
        y luego llamar a .RecordCount.

        Hay una alternativa disponible. El número de registros devueltos por el servidor está
        determinado por el valor de la propiedad PacketRecords. El valor por defecto es 10, si se pone
        a -1 entonces todos los registros serán cargados a la vez. }
    end;

  except
    on error : Exception do
    begin
      Result := False;

      UTI_GEN_Error_Log( 'Error al ABRIR la TABLA ' + param_SQLQuery.Name + ' desde ' +
                         Screen.ActiveForm.Name,
                         error );
    end;
  end;

end;

function UTI_TB_Query_Open( param_DeleteSQL,
                            param_UpdateSQL,
                            param_InsertSQL : String;
                            param_SQLConnector: TSQLConnector;
                            param_SQLQuery: TSQLQuery;
                            param_PacketRecords: integer;
                            param_SQL: string;
                            param_no_Cerrar_Conexion : Boolean = false ) : Boolean;
begin
    if param_no_Cerrar_Conexion = false then
    begin
      if UTI_TB_Cerrar( param_SQLConnector,
                        param_SQLConnector.Transaction,
                        param_SQLQuery) = false then
      begin
        UTI_GEN_Salir;
      end;

      param_SQLConnector.Connected          := true;
      param_SQLConnector.Transaction.Active := true;
    end;

    Result := UTI_TB_Query_Open_2( param_DeleteSQL,
                                   param_UpdateSQL,
                                   param_InsertSQL,
                                   param_SQLQuery,
                                   param_PacketRecords,
                                   param_SQL );
end;

function UTI_CN_Connector_Open( param_SQLTransaction: TSQLTransaction;
                                param_SQLConnector: TSQLConnector ) : Boolean;
var var_CN_Conexion : Trecord_CN_Conexion;
begin
    Result := True;

    if UTI_CN_Connector_Close( param_SQLTransaction,
                               param_SQLConnector ) = false then
    begin
      UTI_GEN_Salir;
    end;

    with param_SQLTransaction do
    begin
        Action := caCommit;
        Database := param_SQLConnector;
        Params.Clear;
        Tag := 0;
    end;

    var_CN_Conexion := UTI_CN_Configuracion_INI_Traerla;

    if var_CN_Conexion.con_Exito = True then
    begin
        with param_SQLConnector do
        begin
            CharSet        := 'utf8';
            ConnectorType  := Trim(var_CN_Conexion.ConnectorType);//'MySQL 5.0';
            DatabaseName   := var_CN_Conexion.DatabaseName;
            HostName       := var_CN_Conexion.HostName;

            Params.Clear;
            if UpperCase(Copy(var_CN_Conexion.ConnectorType, 1, 5)) = UpperCase('MySQL') then
            begin
                Params.Add('Port=' + Trim(var_CN_Conexion.Port) );
            end;

            KeepConnection := False;

            LoginPrompt    := False;
            Password       := var_CN_Conexion.Password;
            Role           := '';
            Tag            := 0;
            Transaction    := param_SQLTransaction;
            UserName       := var_CN_Conexion.UserName;

          { LogEvents      := LogAllEvents; // Para registrar los sucesos tenemos que decirle que hacer  = [detCustom, detPrepare, detExecute, detFetch, detCommit, detRollBack]
                                            // ... and to which procedure the connection should send the events:
            OnLog          := @Self.GetLogEvent; }
        end;
    end
    else begin
        Result := False;
    end;
end;

function UTI_CN_Connector_Close( param_SQLTransaction: TSQLTransaction;
                                 param_SQLConnector: TSQLConnector ) : Boolean;
begin
  // Cerramos La transacción y la conexión con la BD
  try
    Result := True;

    if param_SQLTransaction.Active = true then
    begin
      param_SQLTransaction.Active  := False;
    end;

    if param_SQLConnector.Connected = true then
    begin
      param_SQLConnector.Connected := False;
    end;

  except
    on error : Exception do
    begin
      Result := False;

      UTI_GEN_Error_Log( 'Error al CERRAR la CONEXION con el MOTOR de la BD' + ' desde ' +
                         Screen.ActiveForm.Name,
                         error );
    end;
  end;

end;

procedure UTI_TB_SQL_ADD( param_Vaciar : Boolean;
                          param_WHERE_OLD,
                          param_para_anadir_WHERE : TStrings );   // jeromillo ahora tendrás que cambiar todas las llamadas a esta procedure
var
  var_valor_old : TStrings;
begin
  var_valor_old := TStringList.Create;

  // ********************************************************************************************* //
  // ** NO CAMBIAR EL ORDEN DE LAS LINEAS DE ABAJO                                              ** //
  // ********************************************************************************************* //
      UTI_TB_Quitar_Filtro( 'AND ' + Trim(param_para_anadir_WHERE.Text), param_WHERE_OLD);
      UTI_TB_Quitar_Filtro( 'OR ' + Trim(param_para_anadir_WHERE.Text), param_WHERE_OLD);
      UTI_TB_Quitar_Filtro( Trim(param_para_anadir_WHERE.Text), param_WHERE_OLD);
  // ********************************************************************************************* //
  // ** NO CAMBIAR EL ORDEN DE LAS LINEAS DE ARRIBA                                             ** //
  // ********************************************************************************************* //

  // ********************************************************************************************* //
  // ** LE QUITAMOS TODOS LOS OR o AND QUE HUBIERAN AL PRINCIPIO DE param_WHERE_OLD             ** //
  // ********************************************************************************************* //
  var_valor_old.Clear;
  var_valor_old.AddStrings(param_WHERE_OLD);

  param_WHERE_OLD.Clear;
  param_WHERE_OLD.AddStrings( UTI_TB_Quitar_AndOr_Principio(var_valor_old.Text) ); // jeromillo aqui paso un tstrings pero la funcion UTI_TB_Quitar_AndOr_Principio quiere un string

  if param_Vaciar = true then
  begin
    param_WHERE_OLD.Clear;
    param_WHERE_OLD.AddStrings(param_para_anadir_WHERE);
  end

  else
  begin
    if Trim(param_WHERE_OLD.Text) = '' then
    begin
      param_WHERE_OLD.Clear;
      param_WHERE_OLD.AddStrings(param_para_anadir_WHERE);
    end

    else
    begin
      var_valor_old.Clear;
      var_valor_old.AddStrings(param_WHERE_OLD);

      param_WHERE_OLD.Clear;

      param_WHERE_OLD.AddStrings( param_para_anadir_WHERE );
      param_WHERE_OLD.Add( ' AND ' );
      param_WHERE_OLD.AddStrings( var_valor_old );

    end;
  end;

  // ********************************************************************************************* //
  // ** LE QUITAMOS TODOS LOS OR o AND QUE HUBIERAN AL PRINCIPIO DE param_WHERE_OLD             ** //
  // ********************************************************************************************* //
  var_valor_old.Clear;
  var_valor_old.AddStrings(param_WHERE_OLD);

//    param_WHERE_OLD.Text := UTI_TB_Quitar_AndOr_Principio(Trim(param_WHERE_OLD.Text));
  param_WHERE_OLD.Clear;
  param_WHERE_OLD.AddStrings( UTI_TB_Quitar_AndOr_Principio( var_valor_old.Text) ); // jeromillo aqui paso un tstrings pero la funcion UTI_TB_Quitar_AndOr_Principio quiere un string

  var_valor_old.Free;
end;

end.


