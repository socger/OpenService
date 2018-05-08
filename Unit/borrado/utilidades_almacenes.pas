unit utilidades_almacenes;

{$mode objfpc}{$H+}

interface

uses
  Classes, Forms, db, sqldb, SysUtils, utilidades_bd, utilidades_general;

  procedure Marcha_Adelante_Stock( param_SQLQuery_Movimiento, param_SQLQuery_Movimiento_Detalle : TSQLQuery );
  procedure Marcha_Atras_Stock( param_SQLQuery_Movimiento, param_SQLQuery_Movimiento_Detalle : TSQLQuery );

  function  UTI_ALMACENES_Devuelve_Stock_Articulo_En_Almacen( param_id_articulos, param_id_almacenes : ShortString ) : Extended;
  function  UTI_ALMACENES_Existe_Articulo_En_Almacen( param_id_articulos, param_id_almacenes : ShortString ) : Boolean;
  function  UTI_ALMACENES_Crear_Articulo_En_Almacen( param_id_articulos, param_id_almacenes : ShortString ) : Boolean;
  function  UTI_ALMACENES_Update_STOCK( param_SQLQuery_Movimiento, param_SQLQuery_Movimiento_Detalle : TSQLQuery ) : Boolean;
  function  UTI_ALMACENES_Actualizar_Articulo_su_Stock( param_id_articulos, param_id_almacenes, param_Signo, param_Unidades : ShortString ) : Boolean;

implementation

function UTI_ALMACENES_Update_STOCK( param_SQLQuery_Movimiento,
                                     param_SQLQuery_Movimiento_Detalle : TSQLQuery ) : Boolean;
begin
    Result := false;

    // ********************************************************************************************* //
    // ** COMPROBAMOS SI EXISTEN LOS ARTICULOS EN LA TABLA QUE LLEVA EL STOCK SUYO POR ALMACEN    ** //
    // ********************************************************************************************* //
    // ** SI NO EXISTE EL ARTICULO PUES LO CREAMOS ANTES DE PASAR A ACTUALIZAR EL STOCK           ** //
    // ********************************************************************************************* //
    with param_SQLQuery_Movimiento_Detalle do
    begin
        // ***************************************************************************************** //
        // ** Si se introdujo el almacén de destino y no existe el artículo en este almacén pues  ** //
        // ** vamos y lo creamos                                                                  ** //
        // ***************************************************************************************** //
        if not param_SQLQuery_Movimiento.FieldByName('id_almacenes_destino').isNull then
        begin
            if UTI_ALMACENES_Existe_Articulo_En_Almacen( FieldByName('id_articulos').AsString,
                                                         param_SQLQuery_Movimiento.FieldByName('id_almacenes_destino').AsString ) = false then
            begin
                if UTI_ALMACENES_Crear_Articulo_En_Almacen( FieldByName('id_articulos').AsString,
                                                            param_SQLQuery_Movimiento.FieldByName('id_almacenes_destino').AsString ) = false then
                begin
                    UTI_GEN_Salir;
                end;
            end;
        end;

        // ***************************************************************************************** //
        // ** Si se introdujo el almacén de origen y no existe el artículo en este almacén pues   ** //
        // ** vamos y lo creamos                                                                  ** //
        // ***************************************************************************************** //
        if not param_SQLQuery_Movimiento.FieldByName('id_almacenes_origen').isNull then
        begin
            if UTI_ALMACENES_Existe_Articulo_En_Almacen( FieldByName('id_articulos').AsString,
                                                         param_SQLQuery_Movimiento.FieldByName('id_almacenes_origen').AsString ) = false then
            begin
                if UTI_ALMACENES_Crear_Articulo_En_Almacen( FieldByName('id_articulos').AsString,
                                                            param_SQLQuery_Movimiento.FieldByName('id_almacenes_origen').AsString ) = false then
                begin
                    UTI_GEN_Salir;
                end;
            end;
        end;
    end;

    // ********************************************************************************************* //
    // ** AHORA PASAMOS A ACTUALIZAR EL STOCK EL ARTICULO SEGUN EL ALMACEN                        ** //
    // ********************************************************************************************* //
    with param_SQLQuery_Movimiento_Detalle do
    begin
        // ***************************************************************************************** //
        // ** TENEMOS QUE DIFERENCIAR SI EL REGISTRO VIENE DE SER MODIFICADO O ES UNA INSERCCION  ** //
        // ** PUES EL STOCK DEL ALMACEN SE ACTUALIZARA DE MANERA DIFERENTE                        ** //
        // ***************************************************************************************** //
        if State = dsEdit then
        begin
            // ************************************************************************************* //
            // ** ESTA PARTE SOLO SE REALIZARA SI EL REGISTRO ESTA EN ESTADO DE MODIFICACION      ** //
            // ************************************************************************************* //

            // ************************************************************************************* //
            // ** PARA ENTENDER LA PARTE QUE VIENE AHORA TENEMOS QUE TENER MUY EN CUENTA QUE LOS  ** //
            // ** REGISTROS NUNCA SON BORRADOS LITERALMENTE, SINO QUE SON MARCADOS COMO BORRADOS  ** //
            // ** ASI PERMANECE UN REGISTRO COMPLETO DE CUALQUIER MODIFICACION DE LOS REGISTROS   ** //
            // ************************************************************************************* //
            if ( Trim(Params.ParamByName('COPY_Del_Id_User').AsString) = '' ) and
               ( Trim(FieldByName('Del_Id_User').AsString) = '' )             then
            begin
                // ********************************************************************************* //
                // ** Es una MODIFICACION de un registro                                          ** //
                // ********************************************************************************* //
                Marcha_Atras_Stock( param_SQLQuery_Movimiento,
                                    param_SQLQuery_Movimiento_Detalle );

                Marcha_Adelante_Stock( param_SQLQuery_Movimiento,
                                       param_SQLQuery_Movimiento_Detalle );
            end;

            if ( Trim(Params.ParamByName('COPY_Del_Id_User').AsString) <> '' ) and
               ( Trim(FieldByName('Del_Id_User').AsString) = '' )              then
            begin
                // ********************************************************************************* //
                // ** Es un ALTA de un registro borrado anteriormente                             ** //
                // ********************************************************************************* //
                Marcha_Adelante_Stock( param_SQLQuery_Movimiento,
                                       param_SQLQuery_Movimiento_Detalle );
            end;

            if ( Trim(Params.ParamByName('COPY_Del_Id_User').AsString) = '' ) and
               ( Trim(FieldByName('Del_Id_User').AsString) <> '' )            then
            begin
                // ********************************************************************************* //
                // ** Es un BORRADO de un registro                                                ** //
                // ********************************************************************************* //
                Marcha_Atras_Stock( param_SQLQuery_Movimiento,
                                    param_SQLQuery_Movimiento_Detalle );
            end;
        end;

        if State = dsInsert then
        begin
            // ************************************************************************************* //
            // ** ESTA PARTE SOLO SE REALIZARA SI EL REGISTRO ESTA EN ESTADO DE INSERCION.        ** //
            // ** ES DECIR QUE ES UN REGISTRO NUEVO                                               **
            // ************************************************************************************* //
            Marcha_Adelante_Stock( param_SQLQuery_Movimiento,
                                   param_SQLQuery_Movimiento_Detalle );
        end;
    end;

    Result := true;
end;

procedure Marcha_Adelante_Stock( param_SQLQuery_Movimiento,
                                 param_SQLQuery_Movimiento_Detalle : TSQLQuery );
begin
    with param_SQLQuery_Movimiento_Detalle do
    begin
        // ***************************************************************************************** //
        // ** Ahora tenemos que poner el stock real como queda, sea que venga de una modificación ** //
        // ** o de una inserión                                                                   ** //
        // ***************************************************************************************** //
        // ** Tenemos que ---RESTAR--- el valor del campo ---Unidades--- al stock del artículo    ** //
        // ** en el almacén de origen (si fué puesto el almacén de origen).                       ** //
        // ***************************************************************************************** //
        if not param_SQLQuery_Movimiento.FieldByName('id_almacenes_origen').isNull then
        begin
            if UTI_ALMACENES_Actualizar_Articulo_su_Stock( FieldByName('id_articulos').AsString,
                                                           param_SQLQuery_Movimiento.FieldByName('id_almacenes_origen').AsString,
                                                           '-',
                                                           FieldByName('Unidades').AsString ) = false then
            begin
                 UTI_GEN_Salir;
            end;
        end;

        // ***************************************************************************************** //
        // ** Y tenemos que ---SUMAR--- el valor del campo ---Unidades--- al stock del artículo   ** //
        // ***************************************************************************************** //
        // ** en el almacén de destino(si fué puesto el almacén de destino).                      ** //
        // ***************************************************************************************** //
        if not param_SQLQuery_Movimiento.FieldByName('id_almacenes_destino').isNull then
        begin
            if UTI_ALMACENES_Actualizar_Articulo_su_Stock( FieldByName('id_articulos').AsString,
                                                           param_SQLQuery_Movimiento.FieldByName('id_almacenes_destino').AsString,
                                                           '+',
                                                           FieldByName('Unidades').AsString ) = false then
            begin
                UTI_GEN_Salir;
            end;
        end;
    end;
end;

procedure Marcha_Atras_Stock( param_SQLQuery_Movimiento,
                              param_SQLQuery_Movimiento_Detalle : TSQLQuery );
begin
    with param_SQLQuery_Movimiento_Detalle do
    begin
        // ************************************************************************************* //
        // ** Tenemos que ---SUMAR--- el valor del campo ---COPY_Unidades--- al stock del     ** //
        // ** COPY_id_articulos en el COPY_id_almacenes_origen (si fué puesto este almacén).  ** //
        // ************************************************************************************* //
        if Trim(param_SQLQuery_Movimiento.Params.ParamByName('COPY_id_almacenes_origen').AsString) <> '' then
        begin
            if UTI_ALMACENES_Actualizar_Articulo_su_Stock( Params.ParamByName('COPY_id_articulos').AsString,
                                                           param_SQLQuery_Movimiento.Params.ParamByName('COPY_id_almacenes_origen').AsString,
                                                           '+',
                                                           Params.ParamByName('COPY_Unidades').AsString ) = false then
            begin
                UTI_GEN_Salir;
            end;
        end;

        // ************************************************************************************* //
        // ** Y tenemos que ---RESTAR--- el valor del campo ---COPY_Unidades--- al stock del  ** //
        // ** COPY_id_articulos en el COPY_id_almacenes_destino(si fué puesto este almacén).  ** //
        // ************************************************************************************* //
        if Trim(param_SQLQuery_Movimiento.Params.ParamByName('COPY_id_almacenes_destino').AsString) <> '' then
        begin
            if UTI_ALMACENES_Actualizar_Articulo_su_Stock( Params.ParamByName('COPY_id_articulos').AsString,
                                                           param_SQLQuery_Movimiento.Params.ParamByName('COPY_id_almacenes_destino').AsString,
                                                           '-',
                                                           Params.ParamByName('COPY_Unidades').AsString ) = false then
            begin
                UTI_GEN_Salir;
            end;
        end;
    end;
end;

function UTI_ALMACENES_Existe_Articulo_En_Almacen( param_id_articulos,
                                                   param_id_almacenes : ShortString ) : Boolean;
var var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;

    var_msg            : TStrings;
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
        var_SQLQuery.Name     := 'SQLQuery_UTI_ALMACENES_Existe_Articulo_En_Almacen';
        var_SQLQuery.Database := var_SQLConnector;

        // ***************************************************************************************** //
        // ** Creamos la SQL que nos va a decir si el artículo existe en almacén destino          ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add( 'SELECT COUNT(*) AS existe' );
        var_SQLQuery.SQL.Add(   'FROM articulos_stock' );
        var_SQLQuery.SQL.Add(  'WHERE id_articulos = ' + param_id_articulos );
        var_SQLQuery.SQL.Add(    'AND id_almacenes = ' + param_id_almacenes );
        var_SQLQuery.SQL.Add(  'ORDER BY id_articulos ASC, id_almacenes ASC' );

        // ***************************************************************************************** //
        // ** Abrimos la Query                                                                    ** //
        // ***************************************************************************************** //
        if UTI_TB_Abrir( '', '', '',
                         var_SQLConnector,
                         var_SQLTransaction,
                         var_SQLQuery,
                         -1, // asi me trae todos los registros de golpe
                         var_SQLQuery.SQL.Text ) = false then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Hacemos las comprobaciones que nos hagan falta de la SQL que hemos hecho            ** //
        // ***************************************************************************************** //
        // ** Result = false enseña que no existe el artículo para el almacén que se busca        ** //
        // ***************************************************************************************** //
        Result := true;
        if (var_SQLQuery.FieldByName('existe').IsNull)    or
           (var_SQLQuery.FieldByName('existe').Value = 0) then
        begin
             Result := false;
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
        on error : EDatabaseError do
        begin
            var_msg := TStringList.Create;
            var_msg.Clear;

            var_msg.Add( 'Ocurrió un error al intentar comprobar si existe ' +
                         'el artículo en el almacén ' + Trim(param_id_almacenes) );

            var_msg.Add( 'La tabla ha sido ' + var_SQLQuery.Name + ' desde el módulo ' +
                         Screen.ActiveForm.Name );

            var_msg.Add( ' ');
            var_msg.Add('Este es el mensaje de error: ');
            var_msg.Add( ' ');
            var_msg.Add(error.Message);

            UTI_GEN_Aviso(var_msg, 'ERROR', true, false);

            var_msg.Add( 'ooo OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO ooo');
            var_msg.Add( ' ');

            UTI_GEN_Log(var_msg.Text);

            var_msg.Free;

            try
                var_SQLTransaction.Free;
                var_SQLConnector.Free;
                var_SQLQuery.Free;
            except
            end;
        end;
    end;
end;

function UTI_ALMACENES_Crear_Articulo_En_Almacen( param_id_articulos,
                                                  param_id_almacenes : ShortString ) : Boolean;
var var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;

    var_msg            : TStrings;
begin
    Result := false;

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
        var_SQLQuery.Name     := 'SQLQuery_UTI_ALMACENES_Crear_Articulo_En_Almacen';
        var_SQLQuery.Database := var_SQLConnector;

        // ***************************************************************************************** //
        // ** Creamos la SQL que nos va a decir si el artículo existe en almacén destino          ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add( 'INSERT INTO articulos_stock' );
        var_SQLQuery.SQL.Add(      '( id_articulos,' );
        var_SQLQuery.SQL.Add(       ' id_almacenes,' );
        var_SQLQuery.SQL.Add(       ' Stock )' );
        var_SQLQuery.SQL.Add( 'VALUES' );
        var_SQLQuery.SQL.Add(      '( ' + param_id_articulos + ',' );
        var_SQLQuery.SQL.Add(             param_id_almacenes + ',' );
        var_SQLQuery.SQL.Add(            '0 )' );

        // ************************************************************************ //
        // ** Ejecutamos la SQL                                                  ** //
        // ************************************************************************ //
        var_SQLQuery.ExecSQL;
        var_SQLTransaction.Commit;

        // ***************************************************************************************** //
        // ** Cerramos La transacción y la conexión con la BD                                     ** //
        // ***************************************************************************************** //
        if UTI_CN_Cerrar( var_SQLTransaction,
                          var_SQLConnector ) = false then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Destruimos la tabla y conexiones                                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery.Free;
        var_SQLTransaction.Free;
        var_SQLConnector.Free;

        Result := true;
    except
        on error : EDatabaseError do
        begin

            var_msg := TStringList.Create;
            var_msg.Clear;

            var_msg.Add( 'Ocurrió un error al intentar crear el artículo ' + Trim(param_id_articulos) +
                        ' en el almacén ' + Trim(param_id_almacenes) );

            var_msg.Add( 'La tabla ha sido ' + var_SQLQuery.Name + ' desde el módulo ' +
                         Screen.ActiveForm.Name );

            var_msg.Add( ' ');
            var_msg.Add('Este es el mensaje de error: ');
            var_msg.Add( ' ');
            var_msg.Add(error.Message);

            UTI_GEN_Aviso(var_msg, 'ERROR', true, false);

            var_msg.Add( 'ooo OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO ooo');
            var_msg.Add( ' ');

            UTI_GEN_Log(var_msg.Text);

            var_msg.Free;

            try
                var_SQLTransaction.Free;
                var_SQLConnector.Free;
                var_SQLQuery.Free;
            except
            end;
        end;
    end;
end;

function UTI_ALMACENES_Actualizar_Articulo_su_Stock( param_id_articulos,
                                                     param_id_almacenes,
                                                     param_Signo,
                                                     param_Unidades : ShortString ) : Boolean;
var var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;

    var_msg            : TStrings;
begin
    Result := false;

    // ********************************************************************************************* //
    // ** Si nos olvidemos de decirle si suma o resta el stock pues no hace nada                  ** //
    // ********************************************************************************************* //
    if (UpperCase(Trim(param_Signo)) <> '+') and
       (UpperCase(Trim(param_Signo)) <> '-') then Exit;

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
        var_SQLQuery.Name     := 'SQLQuery_UTI_ALMACENES_Actualizar_Articulo_su_Stock';
        var_SQLQuery.Database := var_SQLConnector;

        // ***************************************************************************************** //
        // ** Creamos la SQL que nos va a actualizar o decrementar el stock del articulo segun el ** //
        // ** almacén al que pertenezca dicho articulo                                            ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add( 'UPDATE articulos_stock' );

        var_SQLQuery.SQL.Add(    'SET Stock = Stock ' + param_Signo + ' ' + param_Unidades );

        // ***************************************************************************************** //
        // ** Continuamos con el resto de la SQL                                                  ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add(  'WHERE id_articulos = ' + param_id_articulos );
        var_SQLQuery.SQL.Add(    'AND id_almacenes = ' + param_id_almacenes + ';' );

        // ************************************************************************ //
        // ** Ejecutamos la SQL                                                  ** //
        // ************************************************************************ //
        var_SQLQuery.ExecSQL;
        var_SQLTransaction.Commit;

        // ***************************************************************************************** //
        // ** Cerramos La transacción y la conexión con la BD                                     ** //
        // ***************************************************************************************** //
        if UTI_CN_Cerrar( var_SQLTransaction,
                          var_SQLConnector ) = false then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Destruimos la tabla y conexiones                                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery.Free;
        var_SQLTransaction.Free;
        var_SQLConnector.Free;

        Result := true;
    except
        on error : EDatabaseError do
        begin
            var_msg := TStringList.Create;
            var_msg.Clear;

            var_msg.Add( 'Ocurrió un error al intentar actualizar el stock del artículo ' + Trim(param_id_articulos) +
                        ' en el almacén ' + Trim(param_id_almacenes) );

            var_msg.Add( 'La tabla ha sido ' + var_SQLQuery.Name + ' desde el módulo ' +
                         Screen.ActiveForm.Name );

            var_msg.Add( ' ');
            var_msg.Add('Este es el mensaje de error: ');
            var_msg.Add( ' ');
            var_msg.Add(error.Message);

            UTI_GEN_Aviso(var_msg, 'ERROR', true, false);

            var_msg.Add( 'ooo OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO ooo');
            var_msg.Add( ' ');

            UTI_GEN_Log(var_msg.Text);

            var_msg.Free;

            try
                var_SQLTransaction.Free;
                var_SQLConnector.Free;
                var_SQLQuery.Free;
            except
            end;
        end;
    end;
end;

function UTI_ALMACENES_Devuelve_Stock_Articulo_En_Almacen( param_id_articulos,
                                                           param_id_almacenes : ShortString ) : Extended;
var var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;

    var_msg            : TStrings;
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
        var_SQLQuery.Name     := 'SQLQuery_UTI_ALMACENES_Devuelve_Stock_Articulo_En_Almacen';
        var_SQLQuery.Database := var_SQLConnector;

        // ***************************************************************************************** //
        // ** Creamos la SQL que nos va a decir si el artículo existe en almacén destino          ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add( 'SELECT SUM(Stock) AS Stock_Actual' );
        var_SQLQuery.SQL.Add(   'FROM articulos_stock' );
        var_SQLQuery.SQL.Add(  'WHERE id_articulos = :id_articulos' );
        var_SQLQuery.SQL.Add(    'AND id_almacenes = :id_almacenes' );
        var_SQLQuery.SQL.Add(  'ORDER BY id_articulos ASC, id_almacenes ASC' );

        // ***************************************************************************************** //
        // ** Creamos los parámetros que necesita la sql                                          ** //
        // ***************************************************************************************** //
        var_SQLQuery.Params.CreateParam(ftUnknown, 'id_articulos', ptUnknown);
        var_SQLQuery.Params.CreateParam(ftUnknown, 'id_almacenes', ptUnknown);

        // ***************************************************************************************** //
        // ** Les pasamos los valores a los parámetros de la sql                                  ** //
        // ***************************************************************************************** //
        var_SQLQuery.Params.ParamByName('id_articulos').AsString := param_id_articulos;
        var_SQLQuery.Params.ParamByName('id_almacenes').AsString := param_id_almacenes;

        // ***************************************************************************************** //
        // ** Abrimos la Query                                                                    ** //
        // ***************************************************************************************** //
        if UTI_TB_Abrir( '', '', '',
                         var_SQLConnector,
                         var_SQLTransaction,
                         var_SQLQuery,
                         -1, // asi me trae todos los registros de golpe
                         var_SQLQuery.SQL.Text ) = false then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Hacemos las comprobaciones que nos hagan falta de la SQL que hemos hecho            ** //
        // ***************************************************************************************** //
        // ** Result = false enseña que no existe el artículo para el almacén que se busca        ** //
        // ***************************************************************************************** //
        Result := var_SQLQuery.FieldByName('Stock_Actual').Value;

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
        on error : EDatabaseError do
        begin
            var_msg := TStringList.Create;
            var_msg.Clear;

            var_msg.Add( 'Ocurrió un error al intentar traer el stock actual del ' +
                         'artículo en el almacén ' + Trim(param_id_almacenes) );

            var_msg.Add( 'La tabla ha sido ' + var_SQLQuery.Name + ' desde el módulo ' +
                         Screen.ActiveForm.Name );

            var_msg.Add( ' ');
            var_msg.Add('Este es el mensaje de error: ');
            var_msg.Add( ' ');
            var_msg.Add(error.Message);

            UTI_GEN_Aviso(var_msg, 'ERROR', true, false);

            var_msg.Add( 'ooo OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO ooo');
            var_msg.Add( ' ');

            UTI_GEN_Log(var_msg.Text);

            var_msg.Free;

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


