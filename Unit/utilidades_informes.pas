unit utilidades_informes;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb;
  // Classes, SysUtils, sqldb, Forms, printers;

  procedure UTI_INFORMES_Traer_Informes_por_Modulo( param_Menu_Worked : Integer; param_Ficheros, param_Descripcion : TStrings );

implementation

   uses utilidades_bd, utilidades_general;

// function UTI_IMPRESORAS_Traer_Predeterminada : TImpresora_Predeterminada;
procedure UTI_INFORMES_Traer_Informes_por_Modulo( param_Menu_Worked : Integer;
                                                  param_Ficheros, param_Descripcion : TStrings );
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
    try
        // ***************************************************************************************** //
        // ** Creamos la Transaccion y la conexión con el motor BD, y la abrimos                  ** //
        // ***************************************************************************************** //
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Connector_Open( var_SQLTransaction,
                                  var_SQLConnector ) = False then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Creamos la SQL Según el motor de BD                                                 ** //
        // ***************************************************************************************** //
        var_SQL := TStringList.Create;

        var_SQL.Add ( 'SELECT *' );
        var_SQL.Add(    'FROM informes' );
        var_SQL.Add(   'WHERE id_menus = ' + Trim(IntToStr(param_Menu_Worked)) );
        var_SQL.Add(     'AND Del_WHEN IS NULL ' );
        var_SQL.Add (  'ORDER BY Id' );

        // ***************************************************************************************** //
        // ** Abrimos la tabla                                                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery      := TSQLQuery.Create(nil);
        var_SQLQuery.Name := 'SQLQuery_UTI_INFORMES_Traer_Informes_por_Modulo';

        if UTI_TB_Query_Open( '', '', '',
                              var_SQLConnector,
                              var_SQLQuery,
                              -1, // asi me trae todos los registros de golpe
                              var_SQL.Text ) = False then
        begin
            UTI_GEN_Salir;
        end;

        // ***************************************************************************************** //
        // ** TRABAJAMOS CON LOS REGISTROS DEVUELTOS                                              ** //
        // ***************************************************************************************** //
        // ** Si el módulo no se creó, no se permite entrar en él ... Result := False             ** //
        // ***************************************************************************************** //
        if var_SQLQuery.RecordCount > 0 then
        begin
            param_Ficheros.Clear;
            param_Descripcion.Clear;

            var_SQLQuery.First;

            While not var_SQLQuery.EOF do
            begin
                if Trim(var_SQLQuery.FieldByName('nombre_fichero').AsString) <> '' then
                begin
                    param_Ficheros.Add( Trim(var_SQLQuery.FieldByName('nombre_fichero').AsString) );
                end else begin
                    param_Ficheros.Add( ' ' );
                end;

                if Trim(var_SQLQuery.FieldByName('descripcion').AsString) <> '' then
                begin
                    param_Descripcion.Add( Trim(var_SQLQuery.FieldByName('descripcion').AsString) );
                end else begin
                    param_Descripcion.Add( ' ' );
                end;

                var_SQLQuery.Next;
            end;
        end;

        // ***************************************************************************************** //
        // ** Cerramos la tabla                                                                   ** //
        // ***************************************************************************************** //
        if UTI_TB_Cerrar( var_SQLConnector,
                          var_SQLTransaction,
                          var_SQLQuery ) = false then
        begin
            UTI_GEN_Salir;
        end;

        var_SQLQuery.Free;
        var_SQL.Free;
        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    Except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( 'No se pudo traer la impresora predeterminada.', error );
            try
                // ********************************************************************************* //
                // ** Intentamos vaciar la memoria                                                ** //
                // ********************************************************************************* //
                var_SQLQuery.Free;
                var_SQL.Free;
                var_SQLTransaction.Free;
                var_SQLConnector.Free;
            except
            end;
        end;
    end;
end;

end.

