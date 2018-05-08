unit utilidades_empresas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, Forms, utilidades_datos_tablas, utilidades_general;

type
    TCuantas_Empresas_Hay = record
      Error    : Boolean;
      Cuantas  : LongInt;
      id_de_1a : Int64;
    end;

  procedure UTI_EMPRE_Asignar_Empresa( param_tabla : TSQLQuery ) ;
  function  UTI_EMPRE_Cuantas_empresas_hay : TCuantas_Empresas_Hay;
  function  UTI_EMPRE_Traer_Empresas_xID( param_id : ShortString ) : TEmpresas;

implementation

uses menu, avisos, barra_progreso, informe, utilidades_usuarios, utilidades_bd;

function UTI_EMPRE_Cuantas_empresas_hay : TCuantas_Empresas_Hay;
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
        var_SQLQuery.Name     := 'SQLQuery_UTI_EMPRE_Cuantas_empresas_hay';
        var_SQLQuery.Database := var_SQLConnector;

        // ***************************************************************************************** //
        // ** Creamos la SQL                                                                      ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add( 'SELECT id' );
        var_SQLQuery.SQL.Add(   'FROM empresas' );
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
        Result.Cuantas  := var_SQLQuery.RecordCount;
        Result.id_de_1a := var_SQLQuery.FieldByName('id').Value;

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
            Result.Cuantas  := 0;
            Result.id_de_1a := 0;

            UTI_GEN_Error_Log( 'Ocurrió un error al traer la cantidad de empresas creadas y activas',
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

function UTI_EMPRE_Traer_Empresas_xID( param_id : ShortString ) : TEmpresas;
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
        var_SQLQuery.Name     := 'SQLQuery_UTI_EMPRE_Traer_Empresas_xID';
        var_SQLQuery.Database := var_SQLConnector;

        { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
          y que por lo se debe de permitir modificarlos en ningún módulo }

        var_SQLQuery.SQL.Clear;
        var_SQLQuery.SQL.AddStrings( 'SELECT e.*,' + ' ' +

                                            'pb.descripcion AS OT_descripcion_poblacion,' + ' ' +
                                            'pr.descripcion AS OT_descripcion_provincia,' + ' ' +
                                            'ps.descripcion AS OT_descripcion_pais' + ' ' +

                                     'FROM empresas AS e' + ' ' +

                                     'LEFT JOIN poblaciones AS pb' + ' ' +
                                     'ON e.id_poblaciones = pb.id' + ' ' +

                                     'LEFT JOIN provincias AS pr' + ' ' +
                                     'ON e.id_provincias = pr.id' + ' ' +

                                     'LEFT JOIN paises AS ps' + ' ' +
                                     'ON e.id_paises = ps.id' + ' ' );

        // ***************************************************************************************** //
        // ** Continuamos con la confección de la SQL                                             ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add( 'WHERE e.id = ' + Trim(param_id) );
        var_SQLQuery.SQL.Add( 'ORDER BY e.id ASC' );

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
                 Result.id                                  := FieldByName('id').AsString;
                 Result.nombre_comercial                    := FieldByName('nombre_comercial').AsString;
                 Result.Responsable                         := FieldByName('Responsable').AsString;
                 Result.nif_cif                             := FieldByName('nif_cif').AsString;
                 Result.Tfno_Fijo_1                         := FieldByName('Tfno_Fijo_1').AsString;
                 Result.Tfno_Fijo_2                         := FieldByName('Tfno_Fijo_2').AsString;
                 Result.FAX                                 := FieldByName('FAX').AsString;
                 Result.Movil                               := FieldByName('Movil').AsString;
                 Result.eMail                               := FieldByName('eMail').AsString;
                 Result.pagina_web                          := FieldByName('pagina_web').AsString;
                 Result.Direccion                           := FieldByName('Direccion').AsString;
                 Result.Direccion_Numero                    := FieldByName('Direccion_Numero').AsString;
                 Result.Direccion_Piso_Letra                := FieldByName('Direccion_Piso_Letra').AsString;
                 Result.Codigo_Postal                       := FieldByName('Codigo_Postal').AsString;
                 Result.id_poblaciones                      := FieldByName('id_poblaciones').AsString;
                 Result.id_provincias                       := FieldByName('id_provincias').AsString;
                 Result.id_paises                           := FieldByName('id_paises').AsString;
                 Result.Observaciones_Comentarios           := FieldByName('Observaciones_Comentarios').AsString;

                 Result.Serie_Presupuesto                   := FieldByName('Serie_Presupuesto').AsString;
                 Result.Numero_Presupuesto                  := FieldByName('Numero_Presupuesto').AsString;

                 Result.Serie_Pedido                        := FieldByName('Serie_Pedido').AsString;
                 Result.Numero_Pedido                       := FieldByName('Numero_Pedido').AsString;

                 Result.Serie_Albaran                       := FieldByName('Serie_Albaran').AsString;
                 Result.Numero_Albaran                      := FieldByName('Numero_Albaran').AsString;

                 Result.Serie_Factura                       := FieldByName('Serie_Factura').AsString;
                 Result.Numero_Factura                      := FieldByName('Numero_Factura').AsString;

                 Result.Serie_Abono                         := FieldByName('Serie_Abono').AsString;
                 Result.Numero_Abono                        := FieldByName('Numero_Abono').AsString;

                 Result.Serie_Presupuesto_Compras           := FieldByName('Serie_Presupuesto_Compras').AsString;
                 Result.Numero_Presupuesto_Compras          := FieldByName('Numero_Presupuesto_Compras').AsString;

                 Result.Serie_Pedido_Compras                := FieldByName('Serie_Pedido_Compras').AsString;
                 Result.Numero_Pedido_Compras               := FieldByName('Numero_Pedido_Compras').AsString;

                 Result.Serie_Albaran_Compras               := FieldByName('Serie_Albaran_Compras').AsString;
                 Result.Numero_Albaran_Compras              := FieldByName('Numero_Albaran_Compras').AsString;

                 Result.Serie_Factura_Compras               := FieldByName('Serie_Factura_Compras').AsString;
                 Result.Numero_Factura_Compras              := FieldByName('Numero_Factura_Compras').AsString;

                 Result.Serie_Abono_Compras                 := FieldByName('Serie_Abono_Compras').AsString;
                 Result.Numero_Abono_Compras                := FieldByName('Numero_Abono_Compras').AsString;

                 Result.Insert_WHEN                         := FieldByName('Insert_WHEN').AsString;
                 Result.Insert_Id_User                      := FieldByName('Insert_Id_User').AsString;
                 Result.Del_WHEN                            := FieldByName('Del_WHEN').AsString;
                 Result.Del_Id_User                         := FieldByName('Del_Id_User').AsString;
                 Result.Del_WHY                             := FieldByName('Del_WHY').AsString;
                 Result.Change_WHEN                         := FieldByName('Change_WHEN').AsString;
                 Result.Change_Id_User                      := FieldByName('Change_Id_User').AsString;

                 Result.OT_descripcion_poblacion            := FieldByName('OT_descripcion_poblacion').AsString;
                 Result.OT_descripcion_provincia            := FieldByName('OT_descripcion_provincia').AsString;
                 Result.OT_descripcion_pais                 := FieldByName('OT_descripcion_pais').AsString;
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
            UTI_GEN_Error_Log( 'Ocurrió un error al intentar traer todos los datos de la empresa con' +
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

procedure UTI_EMPRE_Asignar_Empresa( param_tabla : TSQLQuery ) ;
var var_Cuantas_Empresas_Hay : TCuantas_Empresas_Hay;
    var_Registro_Empresa     : TEmpresas;
    var_msg                  : TStrings;
begin
    var_msg := TStringList.Create;

    var_Cuantas_Empresas_Hay := UTI_EMPRE_Cuantas_empresas_hay;
    if var_Cuantas_Empresas_Hay.Error = false then
    begin
        // ***************************************************************************************** //
        // ** No se produjo error al traer la cantidad de empresas                                ** //
        // ***************************************************************************************** //
        if var_Cuantas_Empresas_Hay.Cuantas = 1 then
        begin
            // ************************************************************************************* //
            // ** Hay una sola empresa creada por lo que la ponemos automáticamente               ** //
            // ************************************************************************************* //
            var_Registro_Empresa := UTI_EMPRE_Traer_Empresas_xID( Trim(FloatToStr(var_Cuantas_Empresas_Hay.id_de_1a)) );
            with param_tabla do
            begin
                FieldByName('id_empresas').AsString            := var_Registro_Empresa.id;
                FieldByName('OT_descripcion_empresa').AsString := var_Registro_Empresa.nombre_comercial;
            end;
        end else begin
            // ************************************************************************************* //
            // ** Hay más de una empresa creada, así que vamos a comprobar si el usuario ya tiene ** //
            // ** una seleccionada desde la aplicación                                            ** //
            // ************************************************************************************* //
            with param_tabla do
            begin
                if Trim(form_menu.public_User_Registro_Empresa_Elegida.id) <> '' then
                begin
                    var_msg.Clear;
                    var_msg.Add('Tiene seleccionada para trabajar la empresa << ' +
                                form_menu.public_User_Registro_Empresa_Elegida.nombre_comercial +
                                ' >>, ¿LA AÑADIMOS?' );

                    if UTI_GEN_Aviso(true,  var_msg, '¿QUE HACEMOS?', true, true ) = true then
                    begin
                        FieldByName('id_empresas').AsString            := form_menu.public_User_Registro_Empresa_Elegida.id;
                        FieldByName('OT_descripcion_empresa').AsString := form_menu.public_User_Registro_Empresa_Elegida.nombre_comercial;
                    end;
                end;
            end;
        end;
    end;

    var_msg.Free;
end;

initialization

finalization

end.

