unit utilidades_stock;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, sqldb, db, utilidades_bd, utilidades_general;

type
    TStock_Traerlo = record
        STOCK_es_Menor    : Boolean;
        Stock             : Extended;
        Stock_Minimo      : Extended;
        Stock_Maximo      : Extended;
        Pendiente_Recibir : Extended;
        Pendiente_Servir  : Extended;
    end;

  function UTI_STOCK_Traer_Stock_Articulo( param_id_articulos, param_id_almacenes : ShortString ) : TStock_Traerlo;
  function UTI_STOCK_es_Menor_SN( param_SQLQuery : TSQLQuery; param_id_almacenes : String) : TStock_Traerlo;

implementation

function UTI_STOCK_Traer_Stock_Articulo( param_id_articulos,
                                         param_id_almacenes : ShortString ) : TStock_Traerlo;
var var_SQLTransaction : TSQLTransaction;
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
                                  var_SQLConnector ) = false then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Creamos el SQLQuery y le pasamos el SQLConnector                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery          := TSQLQuery.Create(nil);
        var_SQLQuery.Name     := 'SQLQuery_UTI_STOCK_Traer_Stock_Articulo';
        var_SQLQuery.Database := var_SQLConnector;

        // ***************************************************************************************** //
        // ** Creamos la SQL                                                                      ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add( 'SELECT SUM(Stock) AS Stock_Actual,' );
        var_SQLQuery.SQL.Add(        'SUM(Stock_Minimo) AS Stock_Minimo,' );
        var_SQLQuery.SQL.Add(        'SUM(Stock_Maximo) AS Stock_Maximo,' );
        var_SQLQuery.SQL.Add(        'SUM(Pendiente_Recibir) AS Pendiente_Recibir,' );
        var_SQLQuery.SQL.Add(        'SUM(Pendiente_Servir) AS Pendiente_Servir' );
        var_SQLQuery.SQL.Add(   'FROM articulos_stock' );
        var_SQLQuery.SQL.Add(  'WHERE id_articulos = ' + param_id_articulos );

        // ***************************************************************************************** //
        // ** Si le hemos pedido el stock de un almacén en concreto pues lo añadimos al WHERE     ** //
        // ***************************************************************************************** //
        if Trim(param_id_almacenes) <> '' then
        begin
             var_SQLQuery.SQL.Add(    'AND id_almacenes = ' + param_id_almacenes );
        end;

        // ***************************************************************************************** //
        // ** Continuamos con la confección de la SQL                                             ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add(  'ORDER BY id_articulos ASC, id_almacenes ASC' );

        // ***************************************************************************************** //
        // ** Abrimos la Query                                                                    ** //
        // ***************************************************************************************** //
        if UTI_TB_Query_Open( '', '', '',
                              var_SQLConnector,
                              var_SQLQuery,
                              -1, // asi me trae todos los registros de golpe
                              var_SQLQuery.SQL.Text ) = false then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Hacemos las comprobaciones que nos hagan falta de la SQL que hemos hecho            ** //
        // ***************************************************************************************** //
        // ** Result = false enseña que no existe el artículo para el almacén que se busca        ** //
        // ***************************************************************************************** //
        if var_SQLQuery.FieldByName('Stock_Actual').IsNull then
             Result.Stock := 0
        else Result.Stock := var_SQLQuery.FieldByName('Stock_Actual').Value;

        if var_SQLQuery.FieldByName('Stock_Minimo').IsNull then
             Result.Stock_Minimo := 0
        else Result.Stock_Minimo := var_SQLQuery.FieldByName('Stock_Minimo').Value;

        if var_SQLQuery.FieldByName('Stock_Maximo').IsNull then
             Result.Stock_Maximo := 0
        else Result.Stock_Maximo := var_SQLQuery.FieldByName('Stock_Maximo').Value;

        if var_SQLQuery.FieldByName('Pendiente_Recibir').IsNull then
             Result.Pendiente_Recibir := 0
        else Result.Pendiente_Recibir := var_SQLQuery.FieldByName('Pendiente_Recibir').Value;

        if var_SQLQuery.FieldByName('Pendiente_Servir').IsNull then
             Result.Pendiente_Servir := 0
        else Result.Pendiente_Servir := var_SQLQuery.FieldByName('Pendiente_Servir').Value;

        // ***************************************************************************************** //
        // ** Cerramos la tabla y asi se cierra automaticamente La transacción y conexión con BD  ** //
        // ***************************************************************************************** //
        if UTI_TB_Cerrar( var_SQLConnector,
                          var_SQLTransaction,
                          var_SQLQuery ) = false then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Destruimos la tabla y conexiones                                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery.Free;
        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( 'Ocurrió un error al intentar traer el stock actual del ' +
                               'artículo en el almacén ' + Trim(param_id_almacenes) +
                               '. La tabla ha sido ' + var_SQLQuery.Name + ' desde el módulo ' +
                               Screen.ActiveForm.Name,
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

function UTI_STOCK_es_Menor_SN( param_SQLQuery : TSQLQuery;
                                param_id_almacenes : String) : TStock_Traerlo;
begin
    Result.STOCK_es_Menor := false;

    with param_SQLQuery do
    begin
        // ********************************************************************************* //
        // ** Solo si es un artículo, solo si está puesto el almacén y solo si se trata de** //
        // ** un articulo para control del stock, se comprobará si hay suficiente stock en** //
        // ** ese almacén                                                                 ** //
        // ********************************************************************************* //
        if Trim(param_id_almacenes) <> '' then
        begin
            // ********************************************************************************* //
            // ** Solo si es un artículo, solo si está puesto el almacén y solo si se trata de** //
            // ** un articulo para control del stock, se comprobará si hay suficiente stock en** //
            // ** ese almacén                                                                 ** //
            // ********************************************************************************* //
            if Trim(FieldByName('id_articulos').AsString) <> '' then
            begin
                // ************************************************************************* //
                // ** Resulta que se trata de un artículo                                 ** //
                // ************************************************************************* //
                if FieldByName('OT_Tipo_de_articulo').Value = 0 then
                begin
                    // ********************************************************************* //
                    // ** Resulta que se trata de un artículo para stock, asi que traemos ** //
                    // ** el stock actual del artículo en ese almacén                     ** //
                    // ********************************************************************* //
                    Result := UTI_STOCK_Traer_Stock_Articulo( FieldByName('id_articulos').AsString,
                                                              Trim(param_id_almacenes) );

                    if param_SQLQuery.State = dsEdit then
                    begin
                        // ***************************************************************** //
                        // ** Si estamos editando la línea detalle, al stock devuelto hay ** //
                        // ** que añadirle el valor anterior de Unidades (el que tenía    ** //
                        // ** antes de intentar modificar el registro                     ** //
                        // ***************************************************************** //
                        if Trim(Params.ParamByName('COPY_Unidades').AsString) <> '' then
                        begin
                            Result.Stock := Result.Stock +
                                            Params.ParamByName('COPY_Unidades').Value;
                        end;
                    end;

                    if Result.Stock < FieldByName('Unidades').Value then
                    begin
                        // ***************************************************************** //
                        // ** Resulta que el stock actual es menor que las unidades/ctdad.** //
                        // ** de la línea de detalle                                      ** //
                        // ***************************************************************** //
                        Result.STOCK_es_Menor := true;
                    end;
                end;
            end;
        end;
    end;
end;

end.


