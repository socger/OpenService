unit utilidades_almacenes;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, sqldb, utilidades_datos_tablas, utilidades_general;

type
    TCuantos_Almacenes_Hay = record
      Error    : Boolean;
      Cuantos  : LongInt;
      id_de_1o : Int64;
    end;

  procedure UTI_ALMAC_Asignar_almacen( param_tabla : TSQLQuery ) ;
  function  UTI_ALMAC_Cuantos_almacenes_hay : TCuantos_Almacenes_Hay;
  function  Traer_Almacenes_xID( param_id : ShortString ) : TAlmacenes;

implementation

uses utilidades_bd;

function UTI_ALMAC_Cuantos_almacenes_hay : TCuantos_Almacenes_Hay;
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
        var_SQLQuery.Name     := 'SQLQuery_UTI_ALMAC_Cuantos_almacenes_hay';
        var_SQLQuery.Database := var_SQLConnector;

        // ***************************************************************************************** //
        // ** Creamos la SQL                                                                      ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add( 'SELECT id' );
        var_SQLQuery.SQL.Add(   'FROM almacenes' );
        var_SQLQuery.SQL.Add(  'WHERE Del_WHEN IS NULL' );

        // ***************************************************************************************** //
        // ** Continuamos con la confección de la SQL                                             ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add(  'ORDER BY id ASC' );

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
        var_SQLQuery.First;

        Result.Error    := false;
        Result.Cuantos  := var_SQLQuery.RecordCount;
        Result.id_de_1o := var_SQLQuery.FieldByName('id').Value;

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
            Result.Error    := true;
            Result.Cuantos  := 0;
            Result.id_de_1o := 0;

            UTI_GEN_Error_Log( 'Ocurrió un error al traer la cantidad de almacenes creados y activos',
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

procedure UTI_ALMAC_Asignar_almacen( param_tabla : TSQLQuery ) ;
var var_Cuantos_Almacenes_Hay : TCuantos_Almacenes_Hay;
    var_Registro_Almacen      : TAlmacenes;
    var_msg                   : TStrings;
begin
    var_msg := TStringList.Create;

    var_Cuantos_Almacenes_Hay := UTI_ALMAC_Cuantos_almacenes_hay;
    if var_Cuantos_Almacenes_Hay.Error = false then
    begin
        // ***************************************************************************************** //
        // ** No se produjo error al traer la cantidad de empresas                                ** //
        // ***************************************************************************************** //
        if var_Cuantos_Almacenes_Hay.Cuantos = 1 then
        begin
            // ************************************************************************************* //
            // ** Hay un solo almacén creado por lo que lo ponemos automáticamente                ** //
            // ************************************************************************************* //
            var_Registro_Almacen := Traer_Almacenes_xID( Trim(FloatToStr(var_Cuantos_Almacenes_Hay.id_de_1o)) );
            with param_tabla do
            begin
                FieldByName('id_almacenes').AsString           := var_Registro_Almacen.id;
                FieldByName('OT_descripcion_almacen').AsString := var_Registro_Almacen.descripcion;
            end;
        end;
    end;

    var_msg.Free;
end;

function Traer_Almacenes_xID( param_id : ShortString ) : TAlmacenes;
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

        if UTI_CN_Abrir( var_SQLTransaction,
                         var_SQLConnector ) = false then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Creamos el SQLQuery y le pasamos el SQLConnector                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery          := TSQLQuery.Create(nil);
        var_SQLQuery.Name     := 'SQLQuery_Traer_Almacenes_xID';
        var_SQLQuery.Database := var_SQLConnector;

        { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
          y que por lo se debe de permitir modificarlos en ningún módulo }

        var_SQLQuery.SQL.Clear;
        var_SQLQuery.SQL.AddStrings( 'SELECT alm.*, ' + ' ' +

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
                                     'ON alm.id_paises = ps.id ' + ' ' );

        // ***************************************************************************************** //
        // ** Continuamos con la confección de la SQL                                             ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add( 'WHERE alm.id = ' + Trim(param_id) );
        var_SQLQuery.SQL.Add( 'ORDER BY alm.id ASC' );

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
        // ** Result = 0 aclarara que no existe el registro buscado por su id                     ** //
        // ***************************************************************************************** //
        if var_SQLQuery.RecordCount = 0 then
             Result.id := '0' // No encontremos este registro
        else begin
             with var_SQLQuery do
             begin
                 Result.id                   := FieldByName('id').AsString;

                 Result.descripcion          := FieldByName('descripcion').AsString;
                 Result.Responsable          := FieldByName('Responsable').AsString;
                 Result.Direccion            := FieldByName('Direccion').AsString;
                 Result.Direccion_Numero     := FieldByName('Direccion_Numero').AsString;
                 Result.Direccion_Piso_Letra := FieldByName('Direccion_Piso_Letra').AsString;
                 Result.Codigo_Postal        := FieldByName('Codigo_Postal').AsString;
                 Result.id_poblaciones       := FieldByName('id_poblaciones').AsString;
                 Result.id_provincias        := FieldByName('id_provincias').AsString;
                 Result.id_paises            := FieldByName('id_paises').AsString;
                 Result.Tfno_Fijo_1          := FieldByName('Tfno_Fijo_1').AsString;
                 Result.Tfno_Fijo_2          := FieldByName('Tfno_Fijo_2').AsString;
                 Result.FAX                  := FieldByName('FAX').AsString;
                 Result.Movil                := FieldByName('Movil').AsString;
                 Result.eMail                := FieldByName('eMail').AsString;
                 Result.id_empresas          := FieldByName('id_empresas').AsString;

                 Result.Insert_WHEN          := FieldByName('Insert_WHEN').AsString;
                 Result.Insert_Id_User       := FieldByName('Insert_Id_User').AsString;
                 Result.Del_WHEN             := FieldByName('Del_WHEN').AsString;
                 Result.Del_Id_User          := FieldByName('Del_Id_User').AsString;
                 Result.Del_WHY              := FieldByName('Del_WHY').AsString;
                 Result.Change_WHEN          := FieldByName('Change_WHEN').AsString;
                 Result.Change_Id_User       := FieldByName('Change_Id_User').AsString;
             end;
        end;

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
            UTI_GEN_Error_Log( 'Ocurrió un error al intentar traer todos los datos del almacén/tienda con' +
                               ' la id ' + Trim(param_id) + '. La tabla ha sido ' +
                               var_SQLQuery.Name + ' desde el módulo ' + Screen.ActiveForm.Name,
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

initialization

finalization

end.

