unit utilidades_ventas;

{$mode objfpc}{$H+}

interface

uses
  Classes, Forms, SysUtils, sqldb, utilidades_datos_tablas, utilidades_bd, utilidades_general,
  utilidades_rgtro;

type

  TUTI_VENTAS_Ctdad_Rgtros_Detalle = record
      Total_Lineas            : Int64;
      Total_Lineas_Sin_Marcar : Int64;
      Total_Lineas_Marcadas   : Int64;
  end;

  function  UTI_VENTAS_Esta_Cerrado_SN( param_tabla, param_id : String ) : ShortString;

  function  UTI_VENTAS_Estado_Lineas_Detalle( param_SQLQuery : TSQLQuery; param_Nombre_Campo_Serie, param_Nombre_Campo_Numero : String ) : TUTI_VENTAS_Ctdad_Rgtros_Detalle;
  function  UTI_VENTAS_Cerrar_SN( param_tabla, param_Cerrar_SN { S o N }, param_id, param_Serie, param_Numero : String ) : Boolean;

  function  UTI_VENTAS_Esta_Ftra_Tiene_Albaranes( param_id_facturas : ShortString ) : String;

  function  UTI_VENTAS_Update_Next_No_Pedido( param_id_empresas, param_Numero : ShortString ) : Boolean;
  function  UTI_VENTAS_Update_Next_No_Presupuesto( param_id_empresas, param_Numero : ShortString ) : Boolean;
  function  UTI_VENTAS_Update_Next_No_Albaran( param_id_empresas, param_Numero_Albaran : ShortString ) : Boolean;
  function  UTI_VENTAS_Update_Next_No_Factura( param_id_empresas, param_Numero_Factura : ShortString ) : Boolean;
  function  UTI_VENTAS_Update_Next_No_Abono( param_id_empresas, param_Numero_Abono : ShortString ) : Boolean;

  function  UTI_VENTAS_Devolver_Numeracion_Presupuesto( param_msg : TStrings; param_Registro_Empresa : TEmpresas; param_DESbloqueamos_empresa, param_Save_Next : Boolean ) : TEmpresas;
  function  UTI_VENTAS_Devolver_Numeracion_Pedido( param_msg : TStrings; param_Registro_Empresa : TEmpresas; param_DESbloqueamos_empresa, param_Save_Next : Boolean ) : TEmpresas;
  function  UTI_VENTAS_Devolver_Numeracion_Albaran( param_msg : TStrings; param_Registro_Empresa : TEmpresas; param_DESbloqueamos_empresa, param_Save_Next : Boolean ) : TEmpresas;
  function  UTI_VENTAS_Devolver_Numeracion_Factura( param_msg : TStrings; param_Registro_Empresa : TEmpresas; param_DESbloqueamos_empresa, param_Save_Next : Boolean ) : TEmpresas;
  function  UTI_VENTAS_Devolver_Numeracion_Abono( param_msg : TStrings; param_Registro_Empresa : TEmpresas; param_DESbloqueamos_empresa, param_Save_Next : Boolean ) : TEmpresas;

  function  UTI_VENTAS_Crear_Cabecera_Albaran( param_id_empresas, param_id_clientes, param_Fecha, param_id_formas_pago, param_CONCEPTO_SEPA, param_Total, param_Serie_Albaran, param_Numero_Albaran, param_Insert_WHEN, param_Insert_Id_User : ShortString ) : Boolean;

  function  UTI_VENTAS_Devolver_id_Albaran( param_Serie, param_Numero : ShortString ) : String;
  function  UTI_VENTAS_Devolver_id_factura( param_Serie, param_Numero : ShortString ) : String;

  function  UTI_VENTAS_Traer_Empresas_xID( param_id : ShortString ) : TEmpresas;

implementation

function UTI_VENTAS_Crear_Cabecera_Albaran( param_id_empresas,
                                            param_id_clientes,
                                            param_Fecha,
                                            param_id_formas_pago,
                                            param_CONCEPTO_SEPA,
                                            param_Total,
                                            param_Serie_Albaran,
                                            param_Numero_Albaran,
                                            param_Insert_WHEN,
                                            param_Insert_Id_User : ShortString ) : Boolean;
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
                                  var_SQLConnector ) = False then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** CREAMOS LA SQL                                                                      ** //
        // ***************************************************************************************** //
        var_SQL := TStringList.Create;

        var_SQL.Add( 'INSERT INTO albaranes' );
        var_SQL.Add(        '( id_empresas,' );
        var_SQL.Add(          'Serie_Albaran,' );
        var_SQL.Add(          'Numero_Albaran,' );
        var_SQL.Add(          'id_clientes,' );
        var_SQL.Add(          'Fecha,' );
        var_SQL.Add(          'id_formas_pago,' );
        var_SQL.Add(          'CONCEPTO_SEPA,' );
        var_SQL.Add(          'Total,' );

        var_SQL.Add(          'Insert_WHEN,' );
        var_SQL.Add(          'Insert_Id_User )' );

        var_SQL.Add( 'VALUES' );
        var_SQL.Add(        '( ' + Trim(param_id_empresas) + ',' );
        var_SQL.Add(               UTI_GEN_Comillas(Trim(param_Serie_Albaran)) + ',' );
        var_SQL.Add(               Trim(param_Numero_Albaran) + ',' );
        var_SQL.Add(               Trim(param_id_clientes) + ',' );
        var_SQL.Add(               UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora( StrToDateTime(Trim(param_Fecha)),
                                                                                false ) ) + ',' );

        var_SQL.Add(            '( SELECT id_formas_pago' );
        var_SQL.Add(              'FROM clientes' );
        var_SQL.Add(              'WHERE id = ' + Trim(param_id_clientes) );
        var_SQL.Add(              'ORDER BY id ),' );

//         var_SQL.Add(               Trim(param_id_formas_pago) + ',' );

        var_SQL.Add(               UTI_GEN_Comillas(Trim(param_CONCEPTO_SEPA)) + ',' );
        var_SQL.Add(               Trim(param_Total) + ',' );

        var_SQL.Add(               UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora( StrToDateTime(Trim(param_Insert_WHEN)),
                                                                                false ) ) + ',' );
        var_SQL.Add(               Trim(param_Insert_Id_User) + ' )' );

        // ***************************************************************************************** //
        // ** Creamos el SQLQuery y Ejecutamos la sql                                             ** //
        // ***************************************************************************************** //
        var_SQLQuery          := TSQLQuery.Create(nil);

        var_SQLQuery.Database := var_SQLConnector;
        var_SQLQuery.SQL.Text := var_SQL.Text;

        var_SQLQuery.Name     := 'SQLQuery_UTI_VENTAS_Crear_Cabecera_Albaran';

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
        if UTI_CN_Close( var_SQLTransaction,
                         var_SQLConnector ) = False then UTI_GEN_Salir;

        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    Except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( 'Error al CREAR la cabecera del albarán número ' +
                               Trim(param_Numero_Albaran) + ' de la serie ' +
                               Trim(param_Serie_Albaran),
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

function UTI_VENTAS_Update_Next_No_Albaran( param_id_empresas,
                                            param_Numero_Albaran : ShortString ) : Boolean;
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
                                  var_SQLConnector ) = False then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** CREAMOS LA SQL                                                                      ** //
        // ***************************************************************************************** //
        var_SQL := TStringList.Create;

        var_SQL.Add( 'UPDATE empresas' );
        var_SQL.Add(    'SET Numero_Albaran = ' + Trim(param_Numero_Albaran) );
        var_SQL.Add( 'WHERE id = ' + Trim(param_id_empresas) );

        // ***************************************************************************************** //
        // ** Creamos el SQLQuery y Ejecutamos la sql                                             ** //
        // ***************************************************************************************** //
        var_SQLQuery          := TSQLQuery.Create(nil);

        var_SQLQuery.Database := var_SQLConnector;
        var_SQLQuery.SQL.Text := var_SQL.Text;

        var_SQLQuery.Name     := 'SQLQuery_UTI_VENTAS_Update_Next_No_Albaran';

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
        if UTI_CN_Close( var_SQLTransaction,
                         var_SQLConnector ) = False then UTI_GEN_Salir;

        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    Except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( 'Error al actualizar el número de albarán a ' +
                               Trim(param_Numero_Albaran) +
                               ' a la empresa ' +
                               Trim(param_id_empresas),
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

function UTI_VENTAS_Devolver_id_Albaran( param_Serie,
                                         param_Numero : ShortString ) : String;
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
        var_SQLQuery.Name     := 'SQLQuery_UTI_VENTAS_Devolver_id_Albaran';
        var_SQLQuery.Database := var_SQLConnector;

        // ***************************************************************************************** //
        // ** Creamos la SQL                                                                      ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add( 'SELECT id' );
        var_SQLQuery.SQL.Add( 'FROM albaranes_ventas' );

        var_SQLQuery.SQL.Add( 'WHERE Serie_Albaran = ' + UTI_GEN_Comillas(param_Serie) );
        var_SQLQuery.SQL.Add( 'AND Numero_Albaran = ' + param_Numero );

        // ***************************************************************************************** //
        // ** Continuamos con la confección de la SQL                                             ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add(  'ORDER BY Serie_Albaran ASC, Numero_Albaran ASC' );

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
        // ** Result = 0 aclarara que no existe ninguna venta todavia                             ** //
        // ***************************************************************************************** //
        if var_SQLQuery.RecordCount = 0 then
        begin
             Result := '0'; // No encontremos este registro
        end else begin
             with var_SQLQuery do
             begin
                 Result := FieldByName('id').AsString;
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
            Result := '0'; // No encontremos este registro

            UTI_GEN_Error_Log( 'Ocurrió un error al intentar traer la ID del albarán ' +
                               Trim(param_Serie) + '/' + Trim(param_Numero) +
                               '. La tabla ha sido ' + var_SQLQuery.Name +
                               ' desde el módulo ' + Screen.ActiveForm.Name,
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

function UTI_VENTAS_Devolver_Numeracion_Albaran( param_msg : TStrings;
                                                 param_Registro_Empresa : TEmpresas;
                                                 param_DESbloqueamos_empresa,
                                                 param_Save_Next : Boolean ) : TEmpresas;
var var_Next_Albaran : Integer;
begin
    // ############################################################################################# //
    // ## DE MOMENTO NO PUEDO QUITARLO PORQUE SI NO NO PUEDO ENCONTRAR LA CABECERA DESPUES DE SER ## //
    // ## CREADA AL REFRESCAR AUTOMATICAMENTE EL REGISTRO DESPUES DEL AFTER POST                  ## //
    // ############################################################################################# //


    // ********************************************************************************************* //
    // ** Lo primero es traer la próxima numeración. Esto lo trae de la empresa.                  ** //
    // ** Pero antes tengo que comprobar que nadie esté bloqueando el registro de la empresa, pues** //
    // ** este entre otras cosas lleva la numeración y así controlo que nadie cree al mismo tiempo** //
    // ********************************************************************************************* //
    if UTI_RGTRO_isLock( 'empresas',
                         param_Registro_Empresa.id,
                         true ) = true then
    begin
        // ***************************************************************************************** //
        // ** El registro ya está bloqueado por lo que no continuamos                             ** //
        // ***************************************************************************************** //
        param_msg.Add( '* El registro de la empresa ahora mismo alguien lo está bloqueando,' +
                       ' por lo que no se pueden crear albaranes' );
        Exit;
    end else begin
        if UTI_RGTRO_Lock( 'empresas',
                           param_Registro_Empresa.id ) = false then
        begin
            // ************************************************************************************* //
            // ** NO SE PUDO BLOQUEAR, ASI QUE NO CONTINUAMOS                                     ** //
            // ************************************************************************************* //
            param_msg.Add( '* El registro de la empresa no se pudo bloquear,' +
                           ' por lo que no se pueden crear albaranes' );
            Exit;
        end else begin
            // ************************************************************************************* //
            // ** REGISTRO DE EMPRESA BLOQUEADO, continuamos con la creación de los albaranes     ** //
            // ************************************************************************************* //
           param_Registro_Empresa := UTI_VENTAS_Traer_Empresas_xID( Trim(param_Registro_Empresa.id) );

         { if (Trim(param_Registro_Empresa.Serie_Albaran) = '')  or
              (Trim(param_Registro_Empresa.Numero_Albaran) = '') then }
           if Trim(param_Registro_Empresa.Numero_Albaran) = '' then
           begin
               param_msg.Add( '* A la empresa ' +
                              Trim(param_Registro_Empresa.nombre_comercial) +
                              ' le falta configurar la numeración para sus próximos albaranes,' +
                              ' por lo que no se puede crear el nuevo albarán.' );

               // ********************************************************************************** //
               // ** Libero el registro de empresas porque esta funcion lo habia bloqueado        ** //
               // ********************************************************************************** //
               UTI_RGTRO_UnLock( 'empresas', param_Registro_Empresa.id );

               Exit;
           end else begin
               // ********************************************************************************** //
               // ** Ya conozco el próximo albarán y está guardado en:                            ** //
               // ** param_Registro_Empresa.Serie_Albaran                                         ** //
               // ** param_Registro_Empresa.Numero_Albaran                                        ** //
               // ********************************************************************************** //

               if param_Save_Next = true then
               begin
                   // ****************************************************************************** //
                   // ** Actualizamos el registro de la empresa al siguiente número de empresa    ** //
                   // ****************************************************************************** //
                   var_Next_Albaran := StrToInt( Trim(param_Registro_Empresa.Numero_Albaran) ) + 1;

                   if UTI_VENTAS_Update_Next_No_Albaran( param_Registro_Empresa.id,
                                                         IntToStr(var_Next_Albaran) ) = false then
                   begin
                       param_msg.Add( '* No se pudo actualizar el próximo número de albaran a crear' +
                                      ', por lo que no podemos continuar con la creación de la ' +
                                      'cabecera del albarán.' +
                                      Trim(param_Registro_Empresa.Serie_Albaran) + '/' +
                                      Trim(param_Registro_Empresa.Numero_Albaran) );
                       Exit;
                   end;
               end;

               // ********************************************************************************** //
               // ** Sólo libero el rgtro.de empresas si param_DESbloqueamos_empresa = true       ** //
               // ********************************************************************************** //
               if param_DESbloqueamos_empresa = true then
               begin
                   UTI_RGTRO_UnLock( 'empresas', param_Registro_Empresa.id );
               end;

               // ********************************************************************************** //
               // ** No se produjo ningún error durante la grabación del próximo albarán y el     ** //
               // ** del registro de la empresa, por lo que devolvemos el registro de la empresa  ** //
               // ********************************************************************************** //
               Result := param_Registro_Empresa;
               Exit;
           end;
        end;
    end;
end;

function UTI_VENTAS_Update_Next_No_Presupuesto( param_id_empresas,
                                                param_Numero : ShortString ) : Boolean;
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
                                  var_SQLConnector ) = False then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** CREAMOS LA SQL                                                                      ** //
        // ***************************************************************************************** //
        var_SQL := TStringList.Create;

        var_SQL.Add( 'UPDATE empresas' );
        var_SQL.Add(    'SET Numero_Presupuesto = ' + Trim(param_Numero) );
        var_SQL.Add( 'WHERE id = ' + Trim(param_id_empresas) );

        // ***************************************************************************************** //
        // ** Creamos el SQLQuery y Ejecutamos la sql                                             ** //
        // ***************************************************************************************** //
        var_SQLQuery          := TSQLQuery.Create(nil);

        var_SQLQuery.Database := var_SQLConnector;
        var_SQLQuery.SQL.Text := var_SQL.Text;

        var_SQLQuery.Name     := 'SQLQuery_UTI_VENTAS_Update_Next_No_Presupuesto';

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
        if UTI_CN_Close( var_SQLTransaction,
                         var_SQLConnector ) = False then UTI_GEN_Salir;

        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    Except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( 'Error al actualizar el número de presupuesto a ' +
                               Trim(param_Numero) +
                               ' a la empresa ' +
                               Trim(param_id_empresas),
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

function UTI_VENTAS_Devolver_Numeracion_Presupuesto( param_msg : TStrings;
                                                     param_Registro_Empresa : TEmpresas;
                                                     param_DESbloqueamos_empresa,
                                                     param_Save_Next : Boolean ) : TEmpresas;
var var_Next_Pto : Integer;
begin
    // ############################################################################################# //
    // ## DE MOMENTO NO PUEDO QUITARLO PORQUE SI NO NO PUEDO ENCONTRAR LA CABECERA DESPUES DE SER ## //
    // ## CREADA AL REFRESCAR AUTOMATICAMENTE EL REGISTRO DESPUES DEL AFTER POST                  ## //
    // ############################################################################################# //


    // ********************************************************************************************* //
    // ** Lo primero es traer la próxima numeración. Esto lo trae de la empresa.                  ** //
    // ** Pero antes tengo que comprobar que nadie esté bloqueando el registro de la empresa, pues** //
    // ** este entre otras cosas lleva la numeración y así controlo que nadie cree al mismo tiempo** //
    // ********************************************************************************************* //
    if UTI_RGTRO_isLock( 'empresas',
                         param_Registro_Empresa.id,
                         true ) = true then
    begin
        // ***************************************************************************************** //
        // ** El registro ya está bloqueado por lo que no continuamos                             ** //
        // ***************************************************************************************** //
        param_msg.Add( '* El registro de la empresa ahora mismo alguien lo está bloqueando,' +
                       ' por lo que no se pueden crear presupuestos' );
        Exit;
    end else begin
        if UTI_RGTRO_Lock( 'empresas',
                           param_Registro_Empresa.id ) = false then
        begin
            // ************************************************************************************* //
            // ** NO SE PUDO BLOQUEAR, ASI QUE NO CONTINUAMOS                                     ** //
            // ************************************************************************************* //
            param_msg.Add( '* El registro de la empresa no se pudo bloquear,' +
                           ' por lo que no se pueden crear presupuestos' );
            Exit;
        end else begin
            // ************************************************************************************* //
            // ** REGISTRO DE EMPRESA BLOQUEADO, continuamos con la creación de los presupuestos  ** //
            // ************************************************************************************* //
           param_Registro_Empresa := UTI_VENTAS_Traer_Empresas_xID( Trim(param_Registro_Empresa.id) );

           if Trim(param_Registro_Empresa.Numero_Presupuesto) = '' then
           begin
               param_msg.Add( '* A la empresa ' +
                              Trim(param_Registro_Empresa.nombre_comercial) +
                              ' le falta configurar la numeración para sus próximos presupuestos,' +
                              ' por lo que no se puede crear el nuevo presupuesto.' );

               // ********************************************************************************** //
               // ** Libero el registro de empresas porque esta funcion lo habia bloqueado        ** //
               // ********************************************************************************** //
               UTI_RGTRO_UnLock( 'empresas', param_Registro_Empresa.id );

               Exit;
           end else begin
               // ********************************************************************************** //
               // ** Ya conozco el próximo presupuesto y está guardado en:                        ** //
               // ** param_Registro_Empresa.Serie_Presupuesto                                     ** //
               // ** param_Registro_Empresa.Numero_Presupuesto                                    ** //
               // ********************************************************************************** //

               if param_Save_Next = true then
               begin
                   // ****************************************************************************** //
                   // ** Actualizamos el registro de la empresa al siguiente número de empresa    ** //
                   // ****************************************************************************** //
                   var_Next_Pto := StrToInt( Trim(param_Registro_Empresa.Numero_Presupuesto) ) + 1;

                   if UTI_VENTAS_Update_Next_No_Presupuesto( param_Registro_Empresa.id,
                                                             IntToStr(var_Next_Pto) ) = false then
                   begin
                       param_msg.Add( '* No se pudo actualizar el próximo número de presupuesto a crear' +
                                      ', por lo que no podemos continuar con la creación de la ' +
                                      'cabecera del presupuesto.' +
                                      Trim(param_Registro_Empresa.Serie_Presupuesto) + '/' +
                                      Trim(param_Registro_Empresa.Numero_Presupuesto) );
                       Exit;
                   end;
               end;

               // ********************************************************************************** //
               // ** Sólo libero el rgtro.de empresas si param_DESbloqueamos_empresa = true       ** //
               // ********************************************************************************** //
               if param_DESbloqueamos_empresa = true then
               begin
                   UTI_RGTRO_UnLock( 'empresas', param_Registro_Empresa.id );
               end;

               // ********************************************************************************** //
               // ** No se produjo ningún error durante la grabación del próximo presupuesto y el ** //
               // ** del registro de la empresa, por lo que devolvemos el registro de la empresa  ** //
               // ********************************************************************************** //
               Result := param_Registro_Empresa;
               Exit;
           end;
        end;
    end;
end;

function UTI_VENTAS_Devolver_Numeracion_Pedido( param_msg : TStrings;
                                                param_Registro_Empresa : TEmpresas;
                                                param_DESbloqueamos_empresa,
                                                param_Save_Next : Boolean ) : TEmpresas;
var var_Next_Pedido : Integer;
begin
    // ############################################################################################# //
    // ## DE MOMENTO NO PUEDO QUITARLO PORQUE SI NO NO PUEDO ENCONTRAR LA CABECERA DESPUES DE SER ## //
    // ## CREADA AL REFRESCAR AUTOMATICAMENTE EL REGISTRO DESPUES DEL AFTER POST                  ## //
    // ############################################################################################# //


    // ********************************************************************************************* //
    // ** Lo primero es traer la próxima numeración. Esto lo trae de la empresa.                  ** //
    // ** Pero antes tengo que comprobar que nadie esté bloqueando el registro de la empresa, pues** //
    // ** este entre otras cosas lleva la numeración y así controlo que nadie cree al mismo tiempo** //
    // ********************************************************************************************* //
    if UTI_RGTRO_isLock( 'empresas',
                         param_Registro_Empresa.id,
                         true ) = true then
    begin
        // ***************************************************************************************** //
        // ** El registro ya está bloqueado por lo que no continuamos                             ** //
        // ***************************************************************************************** //
        param_msg.Add( '* El registro de la empresa ahora mismo alguien lo está bloqueando,' +
                       ' por lo que no se pueden crear pedidos.' );
        Exit;
    end else begin
        if UTI_RGTRO_Lock( 'empresas',
                           param_Registro_Empresa.id ) = false then
        begin
            // ************************************************************************************* //
            // ** NO SE PUDO BLOQUEAR, ASI QUE NO CONTINUAMOS                                     ** //
            // ************************************************************************************* //
            param_msg.Add( '* El registro de la empresa no se pudo bloquear,' +
                           ' por lo que no se pueden crear pedidos.' );
            Exit;
        end else begin
            // ************************************************************************************* //
            // ** REGISTRO DE EMPRESA BLOQUEADO, continuamos con la creación de los pedidos       ** //
            // ************************************************************************************* //
           param_Registro_Empresa := UTI_VENTAS_Traer_Empresas_xID( Trim(param_Registro_Empresa.id) );

         { if (Trim(param_Registro_Empresa.Serie_Pedido) = '')  or
              (Trim(param_Registro_Empresa.Numero_Pedido) = '') then }
           if Trim(param_Registro_Empresa.Numero_Pedido) = '' then
           begin
               param_msg.Add( '* A la empresa ' +
                              Trim(param_Registro_Empresa.nombre_comercial) +
                              ' le falta configurar la numeración para sus próximos pedidos,' +
                              ' por lo que no se puede crear el nuevo pedido.' );

               // ********************************************************************************** //
               // ** Libero el registro de empresas porque esta funcion lo habia bloqueado        ** //
               // ********************************************************************************** //
               UTI_RGTRO_UnLock( 'empresas', param_Registro_Empresa.id );

               Exit;
           end else begin
               // ********************************************************************************** //
               // ** Ya conozco el próximo pedido y está guardado en:                             ** //
               // ** param_Registro_Empresa.Serie_Pedido                                          ** //
               // ** param_Registro_Empresa.Numero_Pedido                                         ** //
               // ********************************************************************************** //

               if param_Save_Next = true then
               begin
                   // ****************************************************************************** //
                   // ** Actualizamos el registro de la empresa al siguiente número de empresa    ** //
                   // ****************************************************************************** //
                   var_Next_Pedido := StrToInt( Trim(param_Registro_Empresa.Numero_Pedido) ) + 1;

                   if UTI_VENTAS_Update_Next_No_Pedido( param_Registro_Empresa.id,
                                                        IntToStr(var_Next_Pedido) ) = false then
                   begin
                       param_msg.Add( '* No se pudo actualizar el próximo número de pedido a crear' +
                                      ', por lo que no podemos continuar con la creación de la ' +
                                      'cabecera del pedido.' +
                                      Trim(param_Registro_Empresa.Serie_Pedido) + '/' +
                                      Trim(param_Registro_Empresa.Numero_Pedido) );
                       Exit;
                   end;
               end;

               // ********************************************************************************** //
               // ** Sólo libero el rgtro.de empresas si param_DESbloqueamos_empresa = true       ** //
               // ********************************************************************************** //
               if param_DESbloqueamos_empresa = true then
               begin
                   UTI_RGTRO_UnLock( 'empresas', param_Registro_Empresa.id );
               end;

               // ********************************************************************************** //
               // ** No se produjo ningún error durante la grabación del próximo pedido y el      ** //
               // ** del registro de la empresa, por lo que devolvemos el registro de la empresa  ** //
               // ********************************************************************************** //
               Result := param_Registro_Empresa;
               Exit;
           end;
        end;
    end;
end;

function UTI_VENTAS_Update_Next_No_Pedido( param_id_empresas,
                                           param_Numero : ShortString ) : Boolean;
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
                                  var_SQLConnector ) = False then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** CREAMOS LA SQL                                                                      ** //
        // ***************************************************************************************** //
        var_SQL := TStringList.Create;

        var_SQL.Add( 'UPDATE empresas' );
        var_SQL.Add(    'SET Numero_Pedido = ' + Trim(param_Numero) );
        var_SQL.Add( 'WHERE id = ' + Trim(param_id_empresas) );

        // ***************************************************************************************** //
        // ** Creamos el SQLQuery y Ejecutamos la sql                                             ** //
        // ***************************************************************************************** //
        var_SQLQuery          := TSQLQuery.Create(nil);

        var_SQLQuery.Database := var_SQLConnector;
        var_SQLQuery.SQL.Text := var_SQL.Text;

        var_SQLQuery.Name     := 'SQLQuery_UTI_VENTAS_Update_Next_No_Pedido';

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
        if UTI_CN_Close( var_SQLTransaction,
                         var_SQLConnector ) = False then UTI_GEN_Salir;

        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    Except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( 'Error al actualizar el número de pedido a ' +
                               Trim(param_Numero) +
                               ' a la empresa ' +
                               Trim(param_id_empresas),
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

function UTI_VENTAS_Update_Next_No_Factura( param_id_empresas,
                                            param_Numero_Factura : ShortString ) : Boolean;
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
                                  var_SQLConnector ) = False then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** CREAMOS LA SQL                                                                      ** //
        // ***************************************************************************************** //
        var_SQL := TStringList.Create;

        var_SQL.Add( 'UPDATE empresas' );
        var_SQL.Add(    'SET Numero_Factura = ' + Trim(param_Numero_Factura) );
        var_SQL.Add( 'WHERE id = ' + Trim(param_id_empresas) );

        // ***************************************************************************************** //
        // ** Creamos el SQLQuery y Ejecutamos la sql                                             ** //
        // ***************************************************************************************** //
        var_SQLQuery          := TSQLQuery.Create(nil);

        var_SQLQuery.Database := var_SQLConnector;
        var_SQLQuery.SQL.Text := var_SQL.Text;

        var_SQLQuery.Name     := 'SQLQuery_UTI_VENTAS_Update_Next_No_Factura';

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
        if UTI_CN_Close( var_SQLTransaction,
                         var_SQLConnector ) = False then UTI_GEN_Salir;

        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    Except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( 'Error al actualizar el número de factura a ' +
                               Trim(param_Numero_Factura) +
                               ' a la empresa ' +
                               Trim(param_id_empresas),
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

function UTI_VENTAS_Devolver_id_factura( param_Serie,
                                         param_Numero : ShortString ) : String;
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
        var_SQLQuery.Name     := 'SQLQuery_UTI_VENTAS_Devolver_id_factura';
        var_SQLQuery.Database := var_SQLConnector;

        // ***************************************************************************************** //
        // ** Creamos la SQL                                                                      ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add( 'SELECT id' );
        var_SQLQuery.SQL.Add( 'FROM facturas_ventas' );

        var_SQLQuery.SQL.Add( 'WHERE Serie_Factura = ' + UTI_GEN_Comillas(param_Serie) );
        var_SQLQuery.SQL.Add( 'AND Numero_Factura = ' + param_Numero );

        // ***************************************************************************************** //
        // ** Continuamos con la confección de la SQL                                             ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add(  'ORDER BY Serie_Factura ASC, Numero_Factura ASC' );

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
        // ** Result = 0 aclarara que no existe ninguna venta todavia                             ** //
        // ***************************************************************************************** //
        if var_SQLQuery.RecordCount = 0 then
        begin
             Result := '0'; // No encontremos este registro
        end else begin
             with var_SQLQuery do
             begin
                 Result := FieldByName('id').AsString;
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
            Result := '0'; // No encontremos este registro

            UTI_GEN_Error_Log( 'Ocurrió un error al intentar traer la ID de la factura ' +
                               Trim(param_Serie) + '/' + Trim(param_Numero) +
                               '. La tabla ha sido ' + var_SQLQuery.Name +
                               ' desde el módulo ' + Screen.ActiveForm.Name,
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

function UTI_VENTAS_Devolver_Numeracion_Factura( param_msg : TStrings;
                                                 param_Registro_Empresa : TEmpresas;
                                                 param_DESbloqueamos_empresa,
                                                 param_Save_Next : Boolean ) : TEmpresas;
var var_Next_Factura : Integer;
begin
    // ############################################################################################# //
    // ## DE MOMENTO NO PUEDO QUITARLO PORQUE SI NO NO PUEDO ENCONTRAR LA CABECERA DESPUES DE SER ## //
    // ## CREADA AL REFRESCAR AUTOMATICAMENTE EL REGISTRO DESPUES DEL AFTER POST                  ## //
    // ############################################################################################# //


    // ********************************************************************************************* //
    // ** Lo primero es traer la próxima numeración. Esto lo trae de la empresa.                  ** //
    // ** Pero antes tengo que comprobar que nadie esté bloqueando el registro de la empresa, pues** //
    // ** este entre otras cosas lleva la numeración y así controlo que nadie cree al mismo tiempo** //
    // ********************************************************************************************* //
    if UTI_RGTRO_isLock( 'empresas',
                         param_Registro_Empresa.id,
                         true ) = true then
    begin
        // ***************************************************************************************** //
        // ** El registro ya está bloqueado por lo que no continuamos                             ** //
        // ***************************************************************************************** //
        param_msg.Add( '* El registro de la empresa ahora mismo alguien lo está bloqueando,' +
                       ' por lo que no se pueden crear facturas' );
        Exit;
    end else begin
        if UTI_RGTRO_Lock( 'empresas',
                           param_Registro_Empresa.id ) = false then
        begin
            // ************************************************************************************* //
            // ** NO SE PUDO BLOQUEAR, ASI QUE NO CONTINUAMOS                                     ** //
            // ************************************************************************************* //
            param_msg.Add( '* El registro de la empresa no se pudo bloquear,' +
                           ' por lo que no se pueden crear facturas' );
            Exit;
        end else begin
            // ************************************************************************************* //
            // ** REGISTRO DE EMPRESA BLOQUEADO, continuamos con la creación de las facturas      ** //
            // ************************************************************************************* //
           param_Registro_Empresa := UTI_VENTAS_Traer_Empresas_xID( Trim(param_Registro_Empresa.id) );

         { if (Trim(param_Registro_Empresa.Serie_Factura) = '')  or
              (Trim(param_Registro_Empresa.Numero_Factura) = '') then }
           if Trim(param_Registro_Empresa.Numero_Factura) = '' then
           begin
               param_msg.Add( '* A la empresa ' +
                              Trim(param_Registro_Empresa.nombre_comercial) +
                              ' le falta configurar la numeración para sus próximas facturas,' +
                              ' por lo que no se puede crear la nueva factura.' );

               // ********************************************************************************** //
               // ** Libero el registro de empresas porque esta funcion lo habia bloqueado        ** //
               // ********************************************************************************** //
               UTI_RGTRO_UnLock( 'empresas', param_Registro_Empresa.id );

               Exit;
           end else begin
               // ********************************************************************************** //
               // ** Ya conozco la próxima factura y está guardado en:                            ** //
               // ** param_Registro_Empresa.Serie_Factura                                         ** //
               // ** param_Registro_Empresa.Numero_Factura                                        ** //
               // ********************************************************************************** //

               if param_Save_Next = true then
               begin
                   // ****************************************************************************** //
                   // ** Actualizamos el registro de la empresa al siguiente número de empresa    ** //
                   // ****************************************************************************** //
                   var_Next_Factura := StrToInt( Trim(param_Registro_Empresa.Numero_Factura) ) + 1;

                   if UTI_VENTAS_Update_Next_No_Factura( param_Registro_Empresa.id,
                                                         IntToStr(var_Next_Factura) ) = false then
                   begin
                       param_msg.Add( '* No se pudo actualizar el próximo número de factura a crear' +
                                      ', por lo que no podemos continuar con la creación de la ' +
                                      'cabecera de la factura.' +
                                      Trim(param_Registro_Empresa.Serie_Factura) + '/' +
                                      Trim(param_Registro_Empresa.Numero_Factura) );
                       Exit;
                   end;
               end;

               // ********************************************************************************** //
               // ** Sólo libero el rgtro.de empresas si param_DESbloqueamos_empresa = true       ** //
               // ********************************************************************************** //
               if param_DESbloqueamos_empresa = true then
               begin
                   UTI_RGTRO_UnLock( 'empresas', param_Registro_Empresa.id );
               end;

               // ********************************************************************************** //
               // ** No se produjo ningún error durante la grabación de la próxima factura y del  ** //
               // ** registro de la empresa, por lo que devolvemos el registro de la empresa      ** //
               // ********************************************************************************** //
               Result := param_Registro_Empresa;
               Exit;
           end;
        end;
    end;
end;

function UTI_VENTAS_Devolver_Numeracion_Abono( param_msg : TStrings;
                                               param_Registro_Empresa : TEmpresas;
                                               param_DESbloqueamos_empresa,
                                               param_Save_Next : Boolean ) : TEmpresas;
var var_Next_Abono : Integer;
begin
    // ############################################################################################# //
    // ## DE MOMENTO NO PUEDO QUITARLO PORQUE SI NO NO PUEDO ENCONTRAR LA CABECERA DESPUES DE SER ## //
    // ## CREADA AL REFRESCAR AUTOMATICAMENTE EL REGISTRO DESPUES DEL AFTER POST                  ## //
    // ############################################################################################# //


    // ********************************************************************************************* //
    // ** Lo primero es traer la próxima numeración. Esto lo trae de la empresa.                  ** //
    // ** Pero antes tengo que comprobar que nadie esté bloqueando el registro de la empresa, pues** //
    // ** este entre otras cosas lleva la numeración y así controlo que nadie cree al mismo tiempo** //
    // ********************************************************************************************* //
    if UTI_RGTRO_isLock( 'empresas',
                         param_Registro_Empresa.id,
                         true ) = true then
    begin
        // ***************************************************************************************** //
        // ** El registro ya está bloqueado por lo que no continuamos                             ** //
        // ***************************************************************************************** //
        param_msg.Add( '* El registro de la empresa ahora mismo alguien lo está bloqueando,' +
                       ' por lo que no se pueden crear facturas' );
        Exit;
    end else begin
        if UTI_RGTRO_Lock( 'empresas',
                           param_Registro_Empresa.id ) = false then
        begin
            // ************************************************************************************* //
            // ** NO SE PUDO BLOQUEAR, ASI QUE NO CONTINUAMOS                                     ** //
            // ************************************************************************************* //
            param_msg.Add( '* El registro de la empresa no se pudo bloquear,' +
                           ' por lo que no se pueden crear abonos' );
            Exit;
        end else begin
            // ************************************************************************************* //
            // ** REGISTRO DE EMPRESA BLOQUEADO, continuamos con la creación de las facturas      ** //
            // ************************************************************************************* //
           param_Registro_Empresa := UTI_VENTAS_Traer_Empresas_xID( Trim(param_Registro_Empresa.id) );

         { if (Trim(param_Registro_Empresa.Serie_Factura) = '')  or
              (Trim(param_Registro_Empresa.Numero_Factura) = '') then }
           if Trim(param_Registro_Empresa.Numero_Abono) = '' then
           begin
               param_msg.Add( '* A la empresa ' +
                              Trim(param_Registro_Empresa.nombre_comercial) +
                              ' le falta configurar la numeración para sus próximos abonos,' +
                              ' por lo que no se puede crear el nuevo abono.' );

               // ********************************************************************************** //
               // ** Libero el registro de empresas porque esta funcion lo habia bloqueado        ** //
               // ********************************************************************************** //
               UTI_RGTRO_UnLock( 'empresas', param_Registro_Empresa.id );

               Exit;
           end else begin
               // ********************************************************************************** //
               // ** Ya conozco la próxima factura y está guardado en:                            ** //
               // ** param_Registro_Empresa.Serie_Factura                                         ** //
               // ** param_Registro_Empresa.Numero_Factura                                        ** //
               // ********************************************************************************** //

               if param_Save_Next = true then
               begin
                   // ****************************************************************************** //
                   // ** Actualizamos el registro de la empresa al siguiente número de empresa    ** //
                   // ****************************************************************************** //
                   var_Next_Abono := StrToInt( Trim(param_Registro_Empresa.Numero_Abono) ) + 1;

                   if UTI_VENTAS_Update_Next_No_Abono( param_Registro_Empresa.id,
                                                       IntToStr(var_Next_Abono) ) = false then
                   begin
                       param_msg.Add( '* No se pudo actualizar el próximo número de abono a crear' +
                                      ', por lo que no podemos continuar con la creación de la ' +
                                      'cabecera del abono.' +
                                      Trim(param_Registro_Empresa.Serie_Abono) + '/' +
                                      Trim(param_Registro_Empresa.Numero_Abono) );
                       Exit;
                   end;
               end;

               // ********************************************************************************** //
               // ** Sólo libero el rgtro.de empresas si param_DESbloqueamos_empresa = true       ** //
               // ********************************************************************************** //
               if param_DESbloqueamos_empresa = true then
               begin
                   UTI_RGTRO_UnLock( 'empresas', param_Registro_Empresa.id );
               end;

               // ********************************************************************************** //
               // ** No se produjo ningún error durante la grabación de la próxima factura y del  ** //
               // ** registro de la empresa, por lo que devolvemos el registro de la empresa      ** //
               // ********************************************************************************** //
               Result := param_Registro_Empresa;
               Exit;
           end;
        end;
    end;
end;

function UTI_VENTAS_Update_Next_No_Abono( param_id_empresas,
                                          param_Numero_Abono : ShortString ) : Boolean;
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
                                  var_SQLConnector ) = False then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** CREAMOS LA SQL                                                                      ** //
        // ***************************************************************************************** //
        var_SQL := TStringList.Create;

        var_SQL.Add( 'UPDATE empresas' );
        var_SQL.Add(    'SET Numero_Abono = ' + Trim(param_Numero_Abono) );
        var_SQL.Add( 'WHERE id = ' + Trim(param_id_empresas) );

        // ***************************************************************************************** //
        // ** Creamos el SQLQuery y Ejecutamos la sql                                             ** //
        // ***************************************************************************************** //
        var_SQLQuery          := TSQLQuery.Create(nil);

        var_SQLQuery.Database := var_SQLConnector;
        var_SQLQuery.SQL.Text := var_SQL.Text;

        var_SQLQuery.Name     := 'SQLQuery_UTI_VENTAS_Update_Next_No_Abono';

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
        if UTI_CN_Close( var_SQLTransaction,
                         var_SQLConnector ) = False then UTI_GEN_Salir;

        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    Except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( 'Error al actualizar el número de abono a ' +
                               Trim(param_Numero_Abono) +
                               ' a la empresa ' +
                               Trim(param_id_empresas),
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

function UTI_VENTAS_Esta_Ftra_Tiene_Albaranes( param_id_facturas : ShortString ) : String;
var var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
    if Trim(param_id_facturas) = '' then
    begin
        // ***************************************************************************************** //
        // ** Probablemente nos han mandado una id vacía porque se trata de una insert y todavía  ** //
        // ** no sabemos cual es la id. Pero lo que si que vamos a devolver es 0 = no cartera     ** //
        // ** Y no pasamos por la sql de abajo porque daría un error                              ** //
        // ***************************************************************************************** //
        Result := '0';
        Exit;
    end;

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
        var_SQLQuery.Name     := 'SQLQuery_Esta_Ftra_Tiene_Albaranes';
        var_SQLQuery.Database := var_SQLConnector;

        // ***************************************************************************************** //
        // ** Creamos la SQL                                                                      ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add( 'SELECT COUNT(*) as Existe' );
        var_SQLQuery.SQL.Add( 'FROM facturas_ventas_detalles' );

        var_SQLQuery.SQL.Add( 'WHERE id_facturas = ' + Trim(param_id_facturas) );
        var_SQLQuery.SQL.Add(   'AND NOT Numero_Albaran IS NULL' );

        // ***************************************************************************************** //
        // ** Continuamos con la confección de la SQL                                             ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add(  'ORDER BY id_facturas ASC, id ASC' );

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
        // ** Result = 0 aclarara que no existe ninguna venta todavia                             ** //
        // ***************************************************************************************** //
        with var_SQLQuery do
        begin
            Result := FieldByName('Existe').AsString;
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
            Result := '0'; // No encontremos este registro

            UTI_GEN_Error_Log( 'Ocurrió un error al intentar ver si existen ALBARANES para ' +
                               'la factura con la id ' + Trim(param_id_facturas) + '. ' +
                               'La tabla ha sido ' + var_SQLQuery.Name +
                               ' desde el módulo ' + Screen.ActiveForm.Name,
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

function UTI_VENTAS_Cerrar_SN( param_tabla,
                               param_Cerrar_SN { S o N },
                               param_id,
                               param_Serie,
                               param_Numero : String ) : Boolean;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
    var_msg            : TStrings;
begin
    Result := true;

    Try
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

        var_SQL.Add( 'UPDATE ' + Trim(param_tabla) );
        var_SQL.Add(    'SET Cerrado_SN = ' + UTI_GEN_Comillas(UpperCase(Trim(param_Cerrar_SN))) );
        var_SQL.Add(  'WHERE id = ' + Trim(param_id) );

        // ***************************************************************************************** //
        // ** Ejecutamos la SQL                                                                   ** //
        // ***************************************************************************************** //
        var_SQLQuery          := TSQLQuery.Create(nil);

        var_SQLQuery.Database := var_SQLConnector;
        var_SQLQuery.SQL.Text := var_SQL.Text;

        var_SQLQuery.Name     := 'SQLQuery_UTI_VENTAS_Cerrar_SN';

        var_SQLQuery.ExecSQL;
        var_SQLTransaction.Commit;

        // ***************************************************************************************** //
        // ** Destruimos la tabla y conexiones                                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery.Free;
        var_SQL.Free;

        // ***************************************************************************************** //
        // ** Cerramos La transacción y la conexión con la BD                                     ** //
        // ***************************************************************************************** //
        if UTI_CN_Close( var_SQLTransaction,
                         var_SQLConnector ) = False then UTI_GEN_Salir;

        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    Except
        on error : Exception do
        begin
            Result  := false;

            var_msg := TStringList.Create;
            if UpperCase(Trim(param_Cerrar_SN)) = 'S' then
            begin
                var_msg.Add( 'No se pudo considerar como cerrado la SERIE/NUMERO: ' +
                             Trim(param_Serie) + '/' + Trim(param_Numero) + '.' );
            end else begin
                var_msg.Add( 'No se pudo considerar como no cerrado la SERIE/NUMERO: ' +
                             Trim(param_Serie) + '/' + Trim(param_Numero) + '.' );
            end;

            UTI_GEN_Error_Log( var_msg.Text, error );
            UTI_GEN_Aviso(true, var_msg, 'No se pudo', True, False);
            var_msg.Free;

            try
                var_SQL.Free;
                var_SQLTransaction.Free;
                var_SQLConnector.Free;
                var_SQLQuery.Free;
            except
            end;
        end;
    end;
end;

function UTI_VENTAS_Estado_Lineas_Detalle( param_SQLQuery : TSQLQuery;
                                           param_Nombre_Campo_Serie,
                                           param_Nombre_Campo_Numero : String ) : TUTI_VENTAS_Ctdad_Rgtros_Detalle;
begin
    // ********************************************************************************************* //
    // ** Comprobar si tiene alguna línea sin convertir en albarán                                ** //
    // ********************************************************************************************* //
    with param_SQLQuery do
    begin
        Result.Total_Lineas            := 0;
        Result.Total_Lineas_Sin_Marcar := 0;
        Result.Total_Lineas_Marcadas   := 0;

        First;
        While not eof do
        begin
            if FieldByName('Del_WHEN').IsNull then
            begin
                Result.Total_Lineas := Result.Total_Lineas + 1;

                // ********************************************************************************* //
                // ** Comprobar si tiene alguna línea de detalle sin convertir todavía en pedido  ** //
                // ********************************************************************************* //
                if (FieldByName(Trim(param_Nombre_Campo_Serie)).IsNull)  and
                   (FieldByName(Trim(param_Nombre_Campo_Numero)).IsNull) then
                begin
                    Result.Total_Lineas_Sin_Marcar := Result.Total_Lineas_Sin_Marcar + 1;
                end else begin
                    Result.Total_Lineas_Marcadas := Result.Total_Lineas_Marcadas + 1;
                end;
            end;

            Next;
        end;
    end;
end;

function UTI_VENTAS_Esta_Cerrado_SN( param_tabla,
                                     param_id : String ) : ShortString;
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
        var_SQLQuery.Name     := 'SQLQuery_UTI_VENTAS_Esta_Cerrado_SN';
        var_SQLQuery.Database := var_SQLConnector;

        // ***************************************************************************************** //
        // ** Creamos la SQL                                                                      ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add( 'SELECT Cerrado_SN' );
        var_SQLQuery.SQL.Add( 'FROM ' + Trim(param_tabla) );

        var_SQLQuery.SQL.Add( 'WHERE id = ' + param_id );

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
        // ** Result = 0 aclarara que no existe ninguna venta todavia                             ** //
        // ***************************************************************************************** //
        Result := ''; // No encontremos este registro
        if var_SQLQuery.RecordCount <> 0 then
        begin
            with var_SQLQuery do
            begin
                Result := FieldByName('Cerrado_SN').AsString;
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
            Result := ''; // No encontremos este registro

            UTI_GEN_Error_Log( 'Ocurrió un error al comprobar si estaba cerrado ' +
                               Trim(param_tabla) + ' con id = ' + Trim(param_id) +
                               '. Desde el módulo ' + Screen.ActiveForm.Name,
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

function UTI_VENTAS_Traer_Empresas_xID( param_id : ShortString ) : TEmpresas;
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
        var_SQLQuery.Name     := 'SQLQuery_UTI_VENTAS_Traer_Empresas_xID';
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

end.

