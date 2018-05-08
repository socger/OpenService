unit utilidades_impuestos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, utilidades_datos_tablas, utilidades_bd, utilidades_general, Forms;


type
    TCuantos_Impuestos_Hay = record
      Error    : Boolean;
      Cuantos  : LongInt;
      id_de_1o : Int64;
    end;

type
    TCalculo_de_impuestos = record
      Importe     : Extended;
      CompuestoSN : Boolean;
    end;

  function  UTI_IMPTOS_Existe_alguna_parte_del_impto_compuesto_en_otro_compuesto( param_id_cabeceras, param_id_impuestos, param_tabla : String ) : String;
  function  UTI_IMPTOS_Existe_el_impto_NOcompuesto_como_compuesto( param_id_cabeceras, param_id_impuestos, param_tabla : String ) : String;
  function  UTI_IMPTOS_Existe_el_impto_compuesto_como_NOcompuesto( param_id_cabeceras, param_id_impuestos, param_tabla : String ) : String;
  procedure UTI_IMPTOS_Asignar_Impto( param_tabla : TSQLQuery; param_Campo : String ) ;
  function  UTI_IMPTOS_Cuantos_impuestos_hay : TCuantos_Impuestos_Hay;
  function  UTI_IMPTOS_Traer_Impuestos_xID( param_id : ShortString ) : Timpuestos;

implementation

uses menu;

function UTI_IMPTOS_Traer_Impuestos_xID( param_id : ShortString ) : Timpuestos;
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
        var_SQLQuery.Name     := 'SQLQuery_UTI_IMPTOS_Traer_Impuestos_xID';
        var_SQLQuery.Database := var_SQLConnector;

        // ***************************************************************************************** //
        // ** Creamos la SQL                                                                      ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Clear;
        var_SQLQuery.SQL.Add( 'SELECT i.*' + ' ' +
                              'FROM impuestos AS i' + ' ' );

        // ***************************************************************************************** //
        // ** Continuamos con la confección de la SQL                                             ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add( 'WHERE i.id = ' + Trim(param_id) );
        var_SQLQuery.SQL.Add( 'ORDER BY i.id ASC' );

        // ***************************************************************************************** //
        // ** Abrimos la Query                                                                    ** //
        // ***************************************************************************************** //
        if UTI_TB_Query_Open( '',
                              '',
                              '',
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
                 Result.id               := FieldByName('id').AsString;
                 Result.descripcion      := FieldByName('descripcion').AsString;
                 Result.Cuenta_Contable  := FieldByName('Cuenta_Contable').AsString;
                 Result.Sumado_A_Ftra_SN := FieldByName('Sumado_A_Ftra_SN').AsString;
                 Result.Tanto_Por_Ciento := FieldByName('Tanto_Por_Ciento').AsString;

                 Result.Insert_WHEN      := FieldByName('Insert_WHEN').AsString;
                 Result.Insert_Id_User   := FieldByName('Insert_Id_User').AsString;
                 Result.Del_WHEN         := FieldByName('Del_WHEN').AsString;
                 Result.Del_Id_User      := FieldByName('Del_Id_User').AsString;
                 Result.Del_WHY          := FieldByName('Del_WHY').AsString;
                 Result.Change_WHEN      := FieldByName('Change_WHEN').AsString;
                 Result.Change_Id_User   := FieldByName('Change_Id_User').AsString;
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
            UTI_GEN_Error_Log( 'Ocurrió un error al intentar traer todos los datos del impuesto con' +
                               ' la id ' + Trim(param_id) + '. La tabla ha sido ' + var_SQLQuery.Name +
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

procedure UTI_IMPTOS_Asignar_Impto( param_tabla : TSQLQuery;
                                    param_Campo : String ) ;
var var_Cuantos_Impuestos_Hay : TCuantos_Impuestos_Hay;
    var_Registro_Impuesto     : TImpuestos;
    var_msg                   : TStrings;
begin
    var_msg := TStringList.Create;

    var_Cuantos_Impuestos_Hay := UTI_IMPTOS_Cuantos_impuestos_hay;
    if var_Cuantos_Impuestos_Hay.Error = false then
    begin
        // ***************************************************************************************** //
        // ** No se produjo error al traer la cantidad de empresas                                ** //
        // ***************************************************************************************** //
        if var_Cuantos_Impuestos_Hay.Cuantos = 1 then
        begin
            // ************************************************************************************* //
            // ** Hay un solo impuesto creado por lo que lo ponemos automáticamente               ** //
            // ************************************************************************************* //
            var_Registro_Impuesto := UTI_IMPTOS_Traer_Impuestos_xID( Trim(FloatToStr(var_Cuantos_Impuestos_Hay.id_de_1o)) );
            with param_tabla do
            begin
                FieldByName(param_Campo).AsString               := var_Registro_Impuesto.id;
                FieldByName('OT_descripcion_impuesto').AsString := var_Registro_Impuesto.descripcion;
                FieldByName('OT_Tanto_Por_Ciento').AsString     := var_Registro_Impuesto.Tanto_Por_Ciento;
            end;
        end;
    end;

    var_msg.Free;
end;

function UTI_IMPTOS_Cuantos_impuestos_hay : TCuantos_Impuestos_Hay;
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
        var_SQLQuery.Name     := 'SQLQuery_UTI_IMPTOS_Cuantos_impuestos_hay';
        var_SQLQuery.Database := var_SQLConnector;

        // ***************************************************************************************** //
        // ** Creamos la SQL                                                                      ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add( 'SELECT id' );
        var_SQLQuery.SQL.Add(   'FROM impuestos' );
        var_SQLQuery.SQL.Add(  'WHERE Del_WHEN IS NULL' );

        // ***************************************************************************************** //
        // ** Continuamos con la confección de la SQL                                             ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add(  'ORDER BY id ASC' );

        // ***************************************************************************************** //
        // ** Abrimos la Query                                                                    ** //
        // ***************************************************************************************** //
        if UTI_TB_Query_Open( '',
                              '',
                              '',
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

            UTI_GEN_Error_Log( 'Ocurrió un error al traer la cantidad de impuestos creados y activos',
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

function UTI_IMPTOS_Existe_el_impto_NOcompuesto_como_compuesto( param_id_cabeceras,
                                                                param_id_impuestos,
                                                                param_tabla : String ) : String;
var var_SQLTransaction  : TSQLTransaction;
    var_SQLConnector    : TSQLConnector;
    var_SQLQuery        : TSQLQuery;
    var_msg             : TStrings;
    var_campo_impuesto  : String;
    var_campo_cabeceras : String;
begin
    try
        // ***************************************************************************************** //
        // ** Vemos cual será el valor del nombre del campo para id_impuestos                     ** //
        // ***************************************************************************************** //
        var_campo_impuesto := 'id_impuestos_Ventas';
        if pos('COMPRAS', UpperCase(param_tabla)) > 0 then
        begin
            var_campo_impuesto := 'id_impuestos_Compras';
        end;

        // ***************************************************************************************** //
        // ** Vemos cual será el valor del nombre del campo para id de alb, ftras, pdos o ptos    ** //
        // ***************************************************************************************** //
        var_campo_cabeceras := '';
        if pos('FACTURAS', UpperCase(param_tabla)) > 0 then
        begin
            var_campo_cabeceras := 'id_facturas';
        end;

        if pos('ALBARANES', UpperCase(param_tabla)) > 0 then
        begin
            var_campo_cabeceras := 'id_albaranes';
        end;

        if pos('PEDIDOS', UpperCase(param_tabla)) > 0 then
        begin
            var_campo_cabeceras := 'id_pedidos';
        end;

        if pos('PRESUPUESTOS', UpperCase(param_tabla)) > 0 then
        begin
            var_campo_cabeceras := 'id_presupuestos';
        end;

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
        var_SQLQuery.Name     := 'SQLQuery_UTI_IMPTOS_Existe_el_impto_NOcompuesto_como_compuesto';
        var_SQLQuery.Database := var_SQLConnector;

        // ***************************************************************************************** //
        // ** Creamos la SQL                                                                      ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add( 'SELECT COUNT(*) AS Existe' );
        var_SQLQuery.SQL.Add( 'FROM impuestos_composiciones AS ic' );

     // var_SQLQuery.SQL.Add( 'RIGHT JOIN facturas_compras_detalles AS cd ON' );
        var_SQLQuery.SQL.Add( 'RIGHT JOIN ' + Trim(param_tabla) + ' AS cd ON' );
        var_SQLQuery.SQL.Add(       'cd.' + Trim(var_campo_impuesto) + ' = ic.id_impuestos_al_que_pertenece AND' );
        var_SQLQuery.SQL.Add(       'cd.' + Trim(var_campo_cabeceras) + ' = ' + Trim(param_id_cabeceras) + ' AND' );
        var_SQLQuery.SQL.Add(       'cd.Del_WHEN IS NULL' );

        var_SQLQuery.SQL.Add( 'WHERE ic.id_impuestos = ' + Trim(param_id_impuestos) );
        var_SQLQuery.SQL.Add( 'AND ic.Del_WHEN IS NULL' );

        // ***************************************************************************************** //
        // ** Continuamos con la confección de la SQL                                             ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add(  'ORDER BY ic.id_impuestos_al_que_pertenece ASC, ic.id_impuestos ASC;' );

{ var_msg := TStringList.Create;
  var_msg.Add(  var_SQLQuery.SQL.Text );

  UTI_GEN_Aviso(true, var_msg, 'No se pudo', True, False);
  var_msg.Free; }

        // ***************************************************************************************** //
        // ** Abrimos la Query                                                                    ** //
        // ***************************************************************************************** //
        if UTI_TB_Query_Open( '',
                              '',
                              '',
                              var_SQLConnector,
                              var_SQLQuery,
                              -1, // asi me trae todos los registros de golpe
                              var_SQLQuery.SQL.Text ) = false then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Hacemos las comprobaciones que nos hagan falta de la SQL que hemos hecho            ** //
        // ***************************************************************************************** //
        // ** Result = 0 aclarara que no existe ninguna venta todavia                             ** //
        // ***************************************************************************************** //
        Result := var_SQLQuery.FieldByName('Existe').AsString;

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
            Result := 'ERROR'; // No encontremos este registro

            UTI_GEN_Error_Log( 'Ocurrió un error al intentar comprobar si existe el impuesto no compuesto ' +
                               Trim(param_id_impuestos) +
                               ', en la factura con id: ' + Trim(param_id_cabeceras) +
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

function UTI_IMPTOS_Existe_el_impto_compuesto_como_NOcompuesto( param_id_cabeceras,
                                                                param_id_impuestos,
                                                                param_tabla : String ) : String;
var var_SQLTransaction  : TSQLTransaction;
    var_SQLConnector    : TSQLConnector;
    var_SQLQuery        : TSQLQuery;
    var_msg             : TStrings;
    var_campo_impuesto  : String;
    var_campo_cabeceras : String;
begin
    try
        // ***************************************************************************************** //
        // ** Vemos cual será el valor del nombre del campo para id_impuestos                     ** //
        // ***************************************************************************************** //
        var_campo_impuesto := 'id_impuestos_Ventas';
        if pos('COMPRAS', UpperCase(param_tabla)) > 0 then
        begin
            var_campo_impuesto := 'id_impuestos_Compras';
        end;

        // ***************************************************************************************** //
        // ** Vemos cual será el valor del nombre del campo para id de alb, ftras, pdos o ptos    ** //
        // ***************************************************************************************** //
        var_campo_cabeceras := '';
        if pos('FACTURAS', UpperCase(param_tabla)) > 0 then
        begin
            var_campo_cabeceras := 'id_facturas';
        end;

        if pos('ALBARANES', UpperCase(param_tabla)) > 0 then
        begin
            var_campo_cabeceras := 'id_albaranes';
        end;

        if pos('PEDIDOS', UpperCase(param_tabla)) > 0 then
        begin
            var_campo_cabeceras := 'id_pedidos';
        end;

        if pos('PRESUPUESTOS', UpperCase(param_tabla)) > 0 then
        begin
            var_campo_cabeceras := 'id_presupuestos';
        end;

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
        var_SQLQuery.Name     := 'SQLQuery_UTI_IMPTOS_Existe_el_impto_compuesto_como_NOcompuesto';
        var_SQLQuery.Database := var_SQLConnector;

        // ***************************************************************************************** //
        // ** Creamos la SQL                                                                      ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add( 'SELECT COUNT(*) AS Existe' );
        var_SQLQuery.SQL.Add( 'FROM ' + Trim(param_tabla) + ' AS cd' );

        var_SQLQuery.SQL.Add( 'RIGHT JOIN impuestos_composiciones AS ic ON' );
        var_SQLQuery.SQL.Add(       'ic.id_impuestos_al_que_pertenece = ' + Trim(param_id_impuestos) + ' AND' );
        var_SQLQuery.SQL.Add(       'cd.' + Trim(var_campo_impuesto) + ' = ic.id_impuestos' );

        var_SQLQuery.SQL.Add( 'WHERE cd.' + Trim(var_campo_cabeceras) + ' = ' + Trim(param_id_cabeceras) );
        var_SQLQuery.SQL.Add( 'AND cd.Del_WHEN IS NULL' );

        // ***************************************************************************************** //
        // ** Continuamos con la confección de la SQL                                             ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add(  'ORDER BY cd.' + Trim(var_campo_cabeceras) + ' ASC, cd.id ASC;' );

{ var_msg := TStringList.Create;
  var_msg.Add(  var_SQLQuery.SQL.Text );

  UTI_GEN_Aviso(true, var_msg, 'No se pudo', True, False);
  var_msg.Free; }

        // ***************************************************************************************** //
        // ** Abrimos la Query                                                                    ** //
        // ***************************************************************************************** //
        if UTI_TB_Query_Open( '',
                              '',
                              '',
                              var_SQLConnector,
                              var_SQLQuery,
                              -1, // asi me trae todos los registros de golpe
                              var_SQLQuery.SQL.Text ) = false then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Hacemos las comprobaciones que nos hagan falta de la SQL que hemos hecho            ** //
        // ***************************************************************************************** //
        // ** Result = 0 aclarara que no existe ninguna venta todavia                             ** //
        // ***************************************************************************************** //
        Result := var_SQLQuery.FieldByName('Existe').AsString;

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
            Result := 'ERROR'; // No encontremos este registro

            UTI_GEN_Error_Log( 'Ocurrió un error al intentar comprobar si existe el impuesto no compuesto ' +
                               Trim(param_id_impuestos) +
                               ', en la factura con id: ' + Trim(param_id_cabeceras) +
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

function UTI_IMPTOS_Existe_alguna_parte_del_impto_compuesto_en_otro_compuesto( param_id_cabeceras,
                                                                               param_id_impuestos,
                                                                               param_tabla : String ) : String;
var var_SQLTransaction  : TSQLTransaction;
    var_SQLConnector    : TSQLConnector;
    var_SQLQuery        : TSQLQuery;
    var_msg             : TStrings;
    var_campo_impuesto  : String;
    var_campo_cabeceras : String;
begin
    try
        // ***************************************************************************************** //
        // ** Vemos cual será el valor del nombre del campo para id_impuestos                     ** //
        // ***************************************************************************************** //
        var_campo_impuesto := 'id_impuestos_Ventas';
        if pos('COMPRAS', UpperCase(param_tabla)) > 0 then
        begin
            var_campo_impuesto := 'id_impuestos_Compras';
        end;

        // ***************************************************************************************** //
        // ** Vemos cual será el valor del nombre del campo para id de alb, ftras, pdos o ptos    ** //
        // ***************************************************************************************** //
        var_campo_cabeceras := '';
        if pos('FACTURAS', UpperCase(param_tabla)) > 0 then
        begin
            var_campo_cabeceras := 'id_facturas';
        end;

        if pos('ALBARANES', UpperCase(param_tabla)) > 0 then
        begin
            var_campo_cabeceras := 'id_albaranes';
        end;

        if pos('PEDIDOS', UpperCase(param_tabla)) > 0 then
        begin
            var_campo_cabeceras := 'id_pedidos';
        end;

        if pos('PRESUPUESTOS', UpperCase(param_tabla)) > 0 then
        begin
            var_campo_cabeceras := 'id_presupuestos';
        end;

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
        var_SQLQuery.Name     := 'SQLQuery_UTI_IMPTOS_Existe_alguna_parte_del_impto_compuesto_en_otro_compuesto';
        var_SQLQuery.Database := var_SQLConnector;

        // ***************************************************************************************** //
        // ** Creamos la SQL                                                                      ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add( 'SELECT COUNT(*) AS Existe' );
        var_SQLQuery.SQL.Add( 'FROM (   SELECT ic2.*' );
        var_SQLQuery.SQL.Add(          'FROM impuestos_composiciones AS ic1' );

        var_SQLQuery.SQL.Add(          'RIGHT JOIN impuestos_composiciones AS ic2 ON' );
        var_SQLQuery.SQL.Add(          'ic2.id_impuestos = ic1.id_impuestos AND' );
        var_SQLQuery.SQL.Add(          'ic2.id_impuestos_al_que_pertenece <> ' + Trim(param_id_impuestos) );

        var_SQLQuery.SQL.Add(          'WHERE ic1.id_impuestos_al_que_pertenece = ' + Trim(param_id_impuestos) );
        var_SQLQuery.SQL.Add(      ') as tmp' );

        var_SQLQuery.SQL.Add( 'WHERE EXISTS ( SELECT *' );
        var_SQLQuery.SQL.Add(                'FROM ' + Trim(param_tabla) );
        var_SQLQuery.SQL.Add(                'WHERE ' + Trim(var_campo_cabeceras) + ' = ' + Trim(param_id_cabeceras) );
        var_SQLQuery.SQL.Add(                'AND ' + Trim(var_campo_impuesto) + ' = tmp.id_impuestos_al_que_pertenece' );
        var_SQLQuery.SQL.Add(              ');' );


{ var_msg := TStringList.Create;
  var_msg.Add(  var_SQLQuery.SQL.Text );

  UTI_GEN_Aviso(true, var_msg, 'No se pudo', True, False);
  var_msg.Free; }

        // ***************************************************************************************** //
        // ** Abrimos la Query                                                                    ** //
        // ***************************************************************************************** //
        if UTI_TB_Query_Open( '',
                              '',
                              '',
                              var_SQLConnector,
                              var_SQLQuery,
                              -1, // asi me trae todos los registros de golpe
                              var_SQLQuery.SQL.Text ) = false then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Hacemos las comprobaciones que nos hagan falta de la SQL que hemos hecho            ** //
        // ***************************************************************************************** //
        // ** Result = 0 aclarara que no existe ninguna venta todavia                             ** //
        // ***************************************************************************************** //
        Result := var_SQLQuery.FieldByName('Existe').AsString;

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
            Result := 'ERROR'; // No encontremos este registro

            UTI_GEN_Error_Log( 'Ocurrió un error al intentar comprobar si existe alguna parte del impuesto compuesto ' +
                               Trim(param_id_impuestos) + ' en otro impuesto compuesto que esté en la factura con id: ' + Trim(param_id_cabeceras) +
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

end.


