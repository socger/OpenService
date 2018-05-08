unit utilidades_lineas_detalle;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, Forms, utilidades_impuestos, utilidades_general, utilidades_bd,
  utilidades_datos_tablas;

type

  TCartera_Rcbos_es_diferente_que_Total_Ftra = record
      mensaje              : String;
      Cantidad_ya_remesada : Extended;
  end;

  TCalculo_Totales_por_Linea_Detalle = record
      Total_Linea_sin_Dtos : Extended;
      Total_Dto_1          : Extended;
      Total_Dto_2          : Extended;
      Total_Linea_con_Dtos : Extended;
   // Impuestos   : Extended;
  end;

  TCalculo_Totales_por_Cabecera = record
      se_realizo_poner_totales : Boolean;
      se_realizo_traer_totales : Boolean;

      Total_Lineas             : Extended;
      Total                    : Extended;

      Total_Mano_Obra          : Extended;
      Total_Materiales         : Extended;
      Total_Resto              : Extended;
      Total_Peso               : Extended;
      Total_Volumen            : Extended;
  end;

  function  UTI_LINEAS_Borrar_Rcbos_Cartera_Ftra( param_clientes_o_proveedores, param_id_facturas : ShortString ) : Boolean;
  function  UTI_LINEAS_Traer_Total_Rcbos( param_clientes_o_proveedores, param_id_facturas : ShortString ) : String;
  function  UTI_LINEAS_Cartera_Rcbos_es_diferente_que_Total_Ftra( param_nombre_tabla, param_id_facturas : ShortString; param_avisamos : Boolean ) : TCartera_Rcbos_es_diferente_que_Total_Ftra;

  procedure UTI_LINEAS_Controlar_PVP( param_SQLQuery : TSQLQuery; param_nombre_tabla, param_PVP_Imptos_Incluidos : String; param_msg : TStrings );
  procedure UTI_LINEAS_Poner_Totales_Linea_Detalle( param_SQLQuery : TSQLQuery );
  function  UTI_LINEAS_Traer_Totales_Linea_Detalle( param_SQLQuery: TSQLQuery ) : TCalculo_Totales_por_Linea_Detalle;

  function  UTI_LINEAS_traer_totales( param_tabla, param_id : String ) : TCalculo_Totales_por_Cabecera;
  function  UTI_LINEAS_poner_totales( param_tabla, param_id : String ) : TCalculo_Totales_por_Cabecera;
  function  UTI_LINEAS_Traer_Resto_Datos_Articulo( param_tabla : TSQLQuery; param_id : String; param_Ventas : Boolean; param_CodigoBarras_Referencia : String ) : String;
  function  UTI_LINEAS_Buscar_Articulo_por_Referencia( param_tabla : TSQLQuery; param_referencia : String; param_Ventas : Boolean ) : String;

  function  UTI_LINEAS_Traer_Articulos_xID( param_id : ShortString ) : TArticulos;

implementation

uses menu, articulos_010;

function UTI_LINEAS_Cartera_Rcbos_es_diferente_que_Total_Ftra( param_nombre_tabla,
                                                               param_id_facturas : ShortString;
                                                               param_avisamos : Boolean ) : TCartera_Rcbos_es_diferente_que_Total_Ftra;
var var_msg                      : TStrings;
    var_Calculo_Totales_Cabecera : TCalculo_Totales_por_Cabecera;
    var_Cantidad                 : String;
begin
    Result.mensaje := '';

    // ***************************************************************************************** //
    // ** Traemos los totales de la factura                                                   ** //
    // ***************************************************************************************** //
    var_Calculo_Totales_Cabecera := UTI_LINEAS_poner_totales( param_nombre_tabla,
                                                              param_id_facturas );

    Result.Cantidad_ya_remesada := 0;
    if Trim(param_nombre_tabla) = 'facturas_ventas' then
    begin
        var_Cantidad := UTI_LINEAS_Traer_Total_Rcbos( 'C',
                                                      param_id_facturas);
        if Trim(var_Cantidad) <> '' then
        begin
            Result.Cantidad_ya_remesada := StrToFloat(var_Cantidad);
        end;
    end else begin
        var_Cantidad := UTI_LINEAS_Traer_Total_Rcbos( 'P',
                                                      param_id_facturas);
        if Trim(var_Cantidad) <> '' then
        begin
            Result.Cantidad_ya_remesada := StrToFloat(var_Cantidad);
        end;
    end;

    if Trim(FloatToStr(var_Calculo_Totales_Cabecera.Total)) <> Trim(FloatToStr(Result.Cantidad_ya_remesada)) then
    begin
        Result.mensaje := 'La cartera de recibos creada para esta ftra.asciende a la cantidad de ' +
                          Trim(FloatToStr(Result.Cantidad_ya_remesada)) +
                          ' y el total de la factura es de ' +
                          Trim(FloatToStr(var_Calculo_Totales_Cabecera.Total));

        if param_avisamos = true then
        begin
            var_msg := TStringList.Create;
            var_msg.Clear;
            var_msg.Add( Result.mensaje );
            UTI_GEN_Aviso(true, var_msg, 'HAY DIFERENCIA, arréglela ...', True, False);
            var_msg.Free;
        end;
    end;
end;

function UTI_LINEAS_Traer_Articulos_xID( param_id : ShortString ) : TArticulos;
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
        var_SQLQuery.Name     := 'SQLQuery_UTI_LINEAS_Traer_Articulos_xID';
        var_SQLQuery.Database := var_SQLConnector;

        { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
          y que por lo se debe de permitir modificarlos en ningún módulo }

        var_SQLQuery.SQL.Clear;
        var_SQLQuery.SQL.AddStrings( 'SELECT a.*,' + ' ' +

                                            'iv.descripcion AS OT_descripcion_impto_ventas,' + ' ' +
                                            'ic.descripcion AS OT_descripcion_impto_compras,' + ' ' +

                                            'p.nombre_propietario AS OT_descripcion_proveedor,' + ' ' +

                                            'g.descripcion AS OT_descripcion_grupo_cocina,' + ' ' +
                                            'im.descripcion AS OT_descripcion_impresora_comandas,' + ' ' +

                                            'f.Cuenta_Contable_Ventas AS OT_Cuenta_Contable_articulo_Ventas,' + ' ' +
                                            'f.Cuenta_Contable_Compras AS OT_Cuenta_Contable_articulo_Compras,' + ' ' +
                                            'f.descripcion AS OT_descripcion_familia' + ' ' +

                                     'FROM articulos AS a' + ' ' +

                                     'LEFT JOIN impuestos AS iv' + ' ' +
                                     'ON a.id_impuestos_Ventas = iv.id' + ' ' +

                                     'LEFT JOIN impuestos AS ic' + ' ' +
                                     'ON a.id_impuestos_Compras = ic.id' + ' ' +

                                     'LEFT JOIN proveedores AS p' + ' ' +
                                     'ON a.id_proveedores = p.id' + ' ' +

                                     'LEFT JOIN grupos_cocina AS g' + ' ' +
                                     'ON a.id_grupos_cocina = g.id' + ' ' +

                                     'LEFT JOIN impresoras AS im' + ' ' +
                                     'ON a.id_impresoras = im.id' + ' ' +

                                     'LEFT JOIN articulos_familias AS f' + ' ' +
                                     'ON a.id_articulos_familias = f.id' + ' ' );

        // ***************************************************************************************** //
        // ** Continuamos con la confección de la SQL                                             ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add( 'WHERE a.id = ' + Trim(param_id) );
        var_SQLQuery.SQL.Add( 'ORDER BY a.id ASC' );

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
                 Result.id                                              := FieldByName('id').AsString;
                 Result.descripcion                                     := FieldByName('descripcion').AsString;
                 Result.descripcion_para_TPV                            := FieldByName('descripcion_para_TPV').AsString;
                 Result.id_articulos_familias                           := FieldByName('id_articulos_familias').AsString;
                 Result.Combinado                                       := FieldByName('Combinado').AsString;
                 Result.id_proveedores                                  := FieldByName('id_proveedores').AsString;
                 Result.id_grupos_cocina                                := FieldByName('id_grupos_cocina').AsString;
                 Result.id_impresoras                                   := FieldByName('id_impresoras').AsString;
                 Result.id_impuestos_Ventas                             := FieldByName('id_impuestos_Ventas').AsString;
                 Result.id_impuestos_Compras                            := FieldByName('id_impuestos_Compras').AsString;
                 Result.Visualizar_en_terminales_SN                     := FieldByName('Visualizar_en_terminales_SN').AsString;
                 Result.Articulo_Compuesto_SN                           := FieldByName('Articulo_Compuesto_SN').AsString;
                 Result.Activar_Proporciones_SN                         := FieldByName('Activar_Proporciones_SN').AsString;
                 Result.Agregar_a_Favoritos_SN                          := FieldByName('Agregar_a_Favoritos_SN').AsString;
                 Result.Pedir_precio_venta_SN                           := FieldByName('Pedir_precio_venta_SN').AsString;
                 Result.Venta_por_peso_SN                               := FieldByName('Venta_por_peso_SN').AsString;
                 Result.Tipo_de_articulo                                := FieldByName('Tipo_de_articulo').AsString;
                 Result.Tiempo_asignado                                 := FieldByName('Tiempo_asignado').AsString;
                 Result.PVP                                             := FieldByName('PVP').AsString;
                 Result.PVP_Impuestos_Incluidos                         := FieldByName('PVP_Impuestos_Incluidos').AsString;
                 Result.Comision                                        := FieldByName('Comision').AsString;
                 Result.Minimo_Variacion_Actualizar_en_tanto_por_ciento := FieldByName('Minimo_Variacion_Actualizar_en_tanto_por_ciento').AsString;
                 Result.Cuenta_Contable_Ventas                          := FieldByName('Cuenta_Contable_Ventas').AsString;
                 Result.Cuenta_Contable_Compras                         := FieldByName('Cuenta_Contable_Compras').AsString;
                 Result.Cubicaje_Peso                                   := FieldByName('Cubicaje_Peso').AsString;
                 Result.Cubicaje_Volumen                                := FieldByName('Cubicaje_Volumen').AsString;
                 Result.Repetir_Cada                                    := FieldByName('Repetir_Cada').AsString;
                 Result.Insert_WHEN                                     := FieldByName('Insert_WHEN').AsString;
                 Result.Insert_Id_User                                  := FieldByName('Insert_Id_User').AsString;
                 Result.Del_WHEN                                        := FieldByName('Del_WHEN').AsString;
                 Result.Del_Id_User                                     := FieldByName('Del_Id_User').AsString;
                 Result.Del_WHY                                         := FieldByName('Del_WHY').AsString;
                 Result.Change_WHEN                                     := FieldByName('Change_WHEN').AsString;
                 Result.Change_Id_User                                  := FieldByName('Change_Id_User').AsString;

                 Result.OT_descripcion_impto_ventas                     := FieldByName('OT_descripcion_impto_ventas').AsString;
                 Result.OT_descripcion_impto_compras                    := FieldByName('OT_descripcion_impto_compras').AsString;
                 Result.OT_descripcion_proveedor                        := FieldByName('OT_descripcion_proveedor').AsString;

                 Result.OT_descripcion_grupo_cocina                     := FieldByName('OT_descripcion_grupo_cocina').AsString;
                 Result.OT_descripcion_impresora_comandas               := FieldByName('OT_descripcion_impresora_comandas').AsString;

                 Result.OT_descripcion_familia                          := FieldByName('OT_descripcion_familia').AsString;
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
            UTI_GEN_Error_Log( 'Ocurrió un error al intentar traer todos los datos del artículo con' +
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

function UTI_LINEAS_Traer_Resto_Datos_Articulo( param_tabla : TSQLQuery;
                                                param_id : String;
                                                param_Ventas : Boolean;
                                                param_CodigoBarras_Referencia : String ) : String;
var var_Registro_Articulo : TArticulos;
    var_msg               : TStrings;
begin
    with param_tabla do
    begin
        Result := '';

        if param_id <> '' then
        begin
            var_Registro_Articulo := UTI_LINEAS_Traer_Articulos_xID( Trim(param_id) );

            if var_Registro_Articulo.id <> '0' then
            begin
                form_Menu.Traer_Configuracion_APP;
                if UpperCase(Trim(form_menu.public_User_Configuracion.Albaranes_Obligar_Almacen_SN)) <> 'S' then
                begin
                    if var_Registro_Articulo.Tipo_de_articulo = '0' then
                    begin
                        var_msg := TStringList.Create;
                        var_msg.Add( 'No se pueden elegir artículos con stock.' );
                        var_msg.Add( 'El motivo es que eligió no usar almacenes/garages en la ' +
                                     'configuración del programa para este módulo. Y es un recurso ' +
                                     'necesario para el control del stock de este artículo' );
                        UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
                        var_msg.Free;

                        Exit;
                    end;
                end;

                FieldByName('id_articulos').AsString         := Trim(param_id);


                FieldByName('OT_Tipo_de_articulo').AsString  := var_Registro_Articulo.Tipo_de_articulo;
                FieldByName('Repetir_Cada').AsString         := var_Registro_Articulo.Repetir_Cada;

                FieldByName('descripcion').AsString          := var_Registro_Articulo.descripcion;
                FieldByName('descripcion_para_TPV').AsString := var_Registro_Articulo.descripcion_para_TPV;

                FieldByName('CodigoBarras_Referencia').Value := param_CodigoBarras_Referencia;

                if param_Ventas = false then
                begin
                    FieldByName('id_impuestos_Compras').Value := var_Registro_Articulo.id_impuestos_Compras;
                    Result                                    := var_Registro_Articulo.OT_descripcion_impto_compras;
                end else begin
                    FieldByName('id_impuestos_Ventas').Value := var_Registro_Articulo.id_impuestos_Ventas;
                    Result                                   := var_Registro_Articulo.OT_descripcion_impto_ventas;
                end;
            end;
        end;
    end;
end;

function UTI_LINEAS_Buscar_Articulo_por_Referencia( param_tabla : TSQLQuery;
                                                    param_referencia : String;
                                                    param_Ventas : Boolean ) : String;
var var_msg : TStrings;
begin
    Result := '';

    if UTI_GEN_Form_Abierto_Ya('form_articulos_010') = false then
    begin
        Application.CreateForm(Tform_articulos_010, form_articulos_010);

        form_articulos_010.public_Solo_Ver    := true;
        form_articulos_010.public_Elegimos    := true;
        // form_articulos_010.public_Menu_Worked := public_Menu_Worked;

        form_articulos_010.Edit_Referencia.Text := param_referencia;

        form_articulos_010.para_Empezar;

        with form_articulos_010.SQLQuery_Articulos_Referencia_a_Elegir do
        begin
            if RecordCount > 0 then
            begin
                // ********************************************************************************* //
                // ** No existe la referencia                                                     ** //
                // ********************************************************************************* //
                if RecordCount > 1 then
                begin
                    // ***************************************************************************** //
                    // ** Existe la referencia, pero hay más de un artículo con esa referencia.   ** //
                    // ** Así que vamos a mostrar los artículos encontrados para que elijamos cual** //
                    // ** es el que queremos                                                      ** //
                    // ***************************************************************************** //
                    form_articulos_010.ShowModal;

                    if form_articulos_010.public_Rgtro_Seleccionado = true then
                    begin
                         Result := UTI_LINEAS_Traer_Resto_Datos_Articulo( param_tabla,
                                                                          FieldByName('id_articulos').asString,
                                                                          param_Ventas,
                                                                          FieldByName('CodigoBarras_Referencia').asString );
                    end;
                end else begin
                    // ***************************************************************************** //
                    // ** Existe la referencia, pero solo una por lo que elegimos el artículo     ** //
                    // ***************************************************************************** //
                    Result := UTI_LINEAS_Traer_Resto_Datos_Articulo( param_tabla,
                                                                     FieldByName('id_articulos').asString,
                                                                     param_Ventas,
                                                                     FieldByName('CodigoBarras_Referencia').asString );
                end;
            end else begin
                var_msg := TStringList.Create;
                var_msg.Add('No existe la referencia');
                UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
                var_msg.Free;
            end;
        end;

        form_articulos_010.Free;
    end else begin
        var_msg := TStringList.Create;
        var_msg.Add(rs_Modulo_Abierto);
        UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        var_msg.Free;
        Exit;
    end;
end;

function UTI_LINEAS_poner_totales( param_tabla,
                                   param_id : String ) : TCalculo_Totales_por_Cabecera;

var var_Calculo_Totales_Cabecera : TCalculo_Totales_por_Cabecera;
begin
    Result.se_realizo_poner_totales := false;

    Result.se_realizo_traer_totales := false;

    Result.Total_Lineas             := 0;
    Result.Total                    := 0;

    Result.Total_Mano_Obra          := 0;
    Result.Total_Materiales         := 0;
    Result.Total_Resto              := 0;
    Result.Total_Peso               := 0;
    Result.Total_Volumen            := 0;

    // ***************************************************************************************** //
    // ** Si param_id esta vacio, no llamaremos a la actualizacion de totales porque dara un  ** //
    // ** error                                                                               ** //
    // ***************************************************************************************** //
    if Trim(param_id) <> '' then
    begin
        Result.se_realizo_poner_totales := true;

        var_Calculo_Totales_Cabecera    := UTI_LINEAS_traer_totales( param_tabla, param_id );

        Result.se_realizo_traer_totales := var_Calculo_Totales_Cabecera.se_realizo_traer_totales;

        Result.Total_Lineas             := var_Calculo_Totales_Cabecera.Total_Lineas;
        Result.Total                    := var_Calculo_Totales_Cabecera.Total;

        Result.Total_Mano_Obra          := var_Calculo_Totales_Cabecera.Total_Mano_Obra;
        Result.Total_Materiales         := var_Calculo_Totales_Cabecera.Total_Materiales;
        Result.Total_Resto              := var_Calculo_Totales_Cabecera.Total_Resto;

        Result.Total_Peso               := var_Calculo_Totales_Cabecera.Total_Peso;
        Result.Total_Volumen            := var_Calculo_Totales_Cabecera.Total_Volumen;
    end;
end;

function UTI_LINEAS_traer_totales( param_tabla,
                                   param_id : String ) : TCalculo_Totales_por_Cabecera;

var var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
    Result.se_realizo_traer_totales := false;

    Result.Total_Lineas             := 0;
    Result.Total                    := 0;

    Result.Total_Mano_Obra          := 0;
    Result.Total_Materiales         := 0;
    Result.Total_Resto              := 0;
    Result.Total_Peso               := 0;
    Result.Total_Volumen            := 0;

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
        var_SQLQuery.Name     := 'SQLQuery_UTI_LINEAS_traer_totales';
        var_SQLQuery.Database := var_SQLConnector;

        // ***************************************************************************************** //
        // ** Creamos la SQL                                                                      ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add( 'SELECT *' );
        var_SQLQuery.SQL.Add(   'FROM ' + Trim(param_tabla) );
        var_SQLQuery.SQL.Add(  'WHERE id = ' + param_id );

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
        Result.se_realizo_traer_totales := true;

        Result.Total_Peso               := 0;
        Result.Total_Volumen            := 0;

        with var_SQLQuery do
        begin
            if RecordCount > 0 then
            begin
                if not FieldByName('Total_Mano_Obra').IsNull then
                begin
                    Result.Total_Mano_Obra := FieldByName('Total_Mano_Obra').Value;
                end;

                if not FieldByName('Total_Materiales').IsNull then
                begin
                    Result.Total_Materiales := FieldByName('Total_Materiales').Value;
                end;

                if not FieldByName('Total_Resto').IsNull then
                begin
                    Result.Total_Resto := FieldByName('Total_Resto').Value;
                end;

                if not FieldByName('Total_Lineas').IsNull then
                begin
                    Result.Total_Lineas := FieldByName('Total_Lineas').Value;
                end;

                if not FieldByName('Total_Total').IsNull then
                begin
                    Result.Total := FieldByName('Total_Total').Value;
                end;
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
            Result.se_realizo_traer_totales := false;

            UTI_GEN_Error_Log( 'Ocurrió un error al traer los totales de la tabla ' +
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

procedure UTI_LINEAS_Poner_Totales_Linea_Detalle( param_SQLQuery : TSQLQuery );
var var_Calculo_Totales_por_Linea_Detalle : TCalculo_Totales_por_Linea_Detalle;
begin
    with param_SQLQuery do
    begin
        // ***************************************************************************************** //
        // ** Descripción de la línea de detalle                                                  ** //
        // ***************************************************************************************** //
        if Trim(FieldByName('OT_descripcion_articulo').AsString) <> '' then
        begin
            FieldByName('OT_Descripcion_para_DbGrid').AsString := FieldByName('OT_descripcion_articulo').AsString;
        end else begin
        end;

        // ***************************************************************************************** //
        // ** Calcular la descripción de la línea para el dbGrid que la presenta                  ** //
        // ***************************************************************************************** //
        if Trim(FieldByName('descripcion_para_TPV').AsString) <> '' then
        begin
            FieldByName('OT_Descripcion_para_DbGrid').AsString := FieldByName('descripcion_para_TPV').AsString;
        end;

        if Trim(FieldByName('descripcion').AsString) <> '' then
        begin
            FieldByName('OT_Descripcion_para_DbGrid').AsString := FieldByName('descripcion').AsString;
        end;

        // ***************************************************************************************** //
        // ** Calcular sus totales                                                                ** //
        // ***************************************************************************************** //
        var_Calculo_Totales_por_Linea_Detalle := UTI_LINEAS_Traer_Totales_Linea_Detalle( param_SQLQuery );

        FieldByName('OT_Total_Linea_sin_Dtos').Value := var_Calculo_Totales_por_Linea_Detalle.Total_Linea_sin_Dtos;
        FieldByName('OT_Total_Dto_1').Value          := var_Calculo_Totales_por_Linea_Detalle.Total_Dto_1;
        FieldByName('OT_Total_Dto_2').Value          := var_Calculo_Totales_por_Linea_Detalle.Total_Dto_2;
        FieldByName('OT_Total_Linea_con_Dtos').Value := var_Calculo_Totales_por_Linea_Detalle.Total_Linea_con_Dtos;
    end;
end;

function UTI_LINEAS_Traer_Totales_Linea_Detalle( param_SQLQuery: TSQLQuery ) : TCalculo_Totales_por_Linea_Detalle;
var var_Precio : Extended;
begin
    with param_SQLQuery do
    begin
        // ***************************************************************************************** //
        // ** Ponemos a 0 todas las variables de cálculo de la línea de detalle                   ** //
        // ***************************************************************************************** //
        var_Precio                  := 0;

        Result.Total_Linea_sin_Dtos := 0;
        Result.Total_Dto_1          := 0;
        Result.Total_Dto_2          := 0;
        Result.Total_Linea_con_Dtos := 0;

        if FieldByName('Excluido_su_Cobro_SN').Value <> 'S' then
        begin
            // ************************************************************************************* //
            // ** Primero calculamos var_Precio.                                                  ** //
            // ************************************************************************************* //
            if not FieldByName('PVP').IsNull then
            begin
                var_Precio := FieldByName('PVP').Value;
            end;

            // ************************************************************************************* //
            // ** Ahora calculamos el importe de las unidades por var_Precio.                     ** //
            // ************************************************************************************* //
            if ( FieldByName('Unidades').IsNull )              or
               ( Trim(FieldByName('Unidades').AsString) = '' ) then
            begin
                // ********************************************************************************* //
                // ** Puede ser que no se haya puesto nada en Unidades y sin embargo si que tenga ** //
                // ** un precio. Y si no tiene precio, pues tomara el valor de 0                  ** //
                // ********************************************************************************* //
                Result.Total_Linea_sin_Dtos := var_Precio;
            end else begin
                // ********************************************************************************* //
                // ** Resulta que tiene puesto algo en Unidades, por lo que tiene que hacer el    ** //
                // ** cálculo                                                                     ** //
                // ********************************************************************************* //
                Result.Total_Linea_sin_Dtos := FieldByName('Unidades').Value * var_Precio;
            end;

            // ************************************************************************************* //
            // ** Si el calculo es de 0, para que calcular los descuentos                         ** //
            // ************************************************************************************* //
            if Result.Total_Linea_sin_Dtos <> 0 then
            begin
                // ********************************************************************************* //
                // ** Si el descuento primero no es 0, ni NULL entonces lo calculamos             ** //
                // ********************************************************************************* //
                if not FieldByName('Descuento_Comercial_1').IsNull then
                begin
                    if FieldByName('Descuento_Comercial_1').Value <> 0 then
                    begin
                        Result.Total_Dto_1 := ( Result.Total_Linea_sin_Dtos *
                                                FieldByName('Descuento_Comercial_1').Value ) / 100;
                    end;
                end;

                // ********************************************************************************* //
                // ** Si el descuento segundo no es 0, ni NULL entonces lo calculamos             ** //
                // ** Pero ojito que el cálculo del segundo descuento se hace sobre las unidades  ** //
                // ** por el precio, menos el primer descuento. Es decir a ese resultado se le    ** //
                // ** calcula el segundo descuento                                                ** //
                // ********************************************************************************* //
                if not FieldByName('Descuento_Comercial_2').IsNull then
                begin
                    if FieldByName('Descuento_Comercial_2').Value <> 0 then
                    begin
                        Result.Total_Dto_2 := ( (Result.Total_Linea_sin_Dtos - Result.Total_Dto_1) *
                                                FieldByName('Descuento_Comercial_2').Value ) / 100;
                    end;
                end;
            end;

            Result.Total_Linea_con_Dtos := ( Result.Total_Linea_sin_Dtos - Result.Total_Dto_1 ) -
                                           Result.Total_Dto_2;
        end;
    end;
end;

procedure UTI_LINEAS_Controlar_PVP( param_SQLQuery : TSQLQuery;
                                    param_nombre_tabla,
                                    param_PVP_Imptos_Incluidos : String;
                                    param_msg : TStrings );
var var_nombre_campo_impto : String;
begin
    with param_SQLQuery do
    begin
        // ***************************************************************************************** //
        // ** Dependiendo de que sea una tabla de compras o de ventas (la tabla de detalle), pues ** //
        // ** el campo de la id del impuesto se va a llamar de una manera o de otra               ** //
        // ***************************************************************************************** //
        if pos('COMPRAS', UpperCase(param_nombre_tabla)) > 0 then
        begin
            var_nombre_campo_impto := 'id_impuestos_Compras';
        end else begin
            var_nombre_campo_impto := 'id_impuestos_Ventas';
        end;

        if (not FieldByName('PVP').IsNull)          and
           (Trim(param_PVP_Imptos_Incluidos) <> '') then
        begin
            // ************************************************************************************* //
            // ** Los dos PVP no pueden tener valor                                               ** //
            // ************************************************************************************* //
            param_msg.Add( 'No puede poner un valor a (PVP incluye sus impuestos) y' +
                           ' al mismo tiempo a (PVP). Quite uno de ellos.' );
        end else begin
            // ************************************************************************************* //
            // ** Resulta que el PVP con impuestos incluidos tiene valor                          ** //
            // ************************************************************************************* //
            if (Trim(param_PVP_Imptos_Incluidos) <> '') then
            begin
                if Trim(FieldByName(var_nombre_campo_impto).AsString) <> '' then
                begin
                    // ***************************************************************************** //
                    // ** Resulta que el impuesto se ha introducido, asi que vamos a comprobar si ** //
                    // ** es compuesto o no                                                       ** //
                    // ***************************************************************************** //
                    if (Trim(FieldByName('OT_Tanto_Por_Ciento').AsString) = '') then
                    begin
                        param_msg.Add( 'Se trata de un impuesto compuesto, por lo que no podemos' +
                                       ' dar marcha atrás para su cálculo. Quite (PVP, incluye sus' +
                                       ' impuestos) y ponga el (PVP)' );
                    end;
                end else begin
                    // ***************************************************************************** //
                    // ** No tiene todavía puesto el impuesto y es obligatorio.                   ** //
                    // ** Si no hay impuesto se debe llamar al impuesto llamado exento al 0%      ** //
                    // ***************************************************************************** //
                    param_msg.Add( 'No hay impuesto elegido, por lo que no puedo calcular el PVP sin' +
                                   ' impuestos incluidos.' );
                end;
            end;
        end;
    end;
end;

function UTI_LINEAS_Traer_Total_Rcbos( param_clientes_o_proveedores,
                                       param_id_facturas : ShortString ) : String;
var var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
    if Trim(param_id_facturas) = '' then
    begin
        // ***************************************************************************************** //
        // ** Probablemente nos han mandado una id vacía porque se trata de una insert y todavía  ** //
        // ** no sabemos cual es la id. Pero lo que si que vamos a devolver es '' = no cartera    ** //
        // ** Y no pasamos por la sql de abajo porque daría un error                              ** //
        // ***************************************************************************************** //
        Result := '';
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
        var_SQLQuery.Name     := 'SQLQuery_UTI_LINEAS_Traer_Total_Rcbos';
        var_SQLQuery.Database := var_SQLConnector;

        // ***************************************************************************************** //
        // ** Creamos la SQL                                                                      ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add( 'SELECT SUM(importe) as Total_Recibos' );
        var_SQLQuery.SQL.Add(   'FROM facturas_cobros_pagos' );
        var_SQLQuery.SQL.Add(  'WHERE id_facturas = ' + Trim(param_id_facturas) );
        var_SQLQuery.SQL.Add(    'AND Del_WHEN IS NULL' );

        if Trim(UpperCase(param_clientes_o_proveedores)) = 'C' then
        begin
            // ************************************************************************************* //
            // ** Vamos a ver los recibos de una ftra de ventas                                   ** //
            // ************************************************************************************* //
            var_SQLQuery.SQL.Add(    'AND NOT id_clientes IS NULL' );

            // ************************************************************************************* //
            // ** Continuamos con la confección de la SQL                                         ** //
            // ************************************************************************************* //
            var_SQLQuery.SQL.Add(  'ORDER BY id_clientes ASC, id_facturas ASC, id ASC' );
        end else begin
            // ************************************************************************************* //
            // ** Vamos a ver los recibos de una ftra de compras                                  ** //
            // ************************************************************************************* //
            var_SQLQuery.SQL.Add(    'AND NOT id_proveedores IS NULL' );

            // ************************************************************************************* //
            // ** Continuamos con la confección de la SQL                                         ** //
            // ************************************************************************************* //
            var_SQLQuery.SQL.Add(  'ORDER BY id_proveedores ASC, id_facturas ASC, id ASC' );
        end;

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
        with var_SQLQuery do
        begin
            Result := '';
            if not FieldByName('Total_Recibos').IsNull then
            begin
                Result := FieldByName('Total_Recibos').AsString;
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

            UTI_GEN_Error_Log( 'Ocurrió un error al intentar ver si existen recibos de ventas para ' +
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

function UTI_LINEAS_Borrar_Rcbos_Cartera_Ftra( param_clientes_o_proveedores,
                                               param_id_facturas : ShortString ) : Boolean;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
    Result := true;

    Try
      { ****************************************************************************
        Creamos la Transaccion y la conexión con el motor BD, y la abrimos
        **************************************************************************** }
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Connector_Open( var_SQLTransaction,
                                  var_SQLConnector ) = False then UTI_GEN_Salir;

      { ****************************************************************************
        Creamos la SQL Según el motor de BD
        **************************************************************************** }
        var_SQL := TStringList.Create;

        var_SQL.Add( 'CALL function_Recibos_Borrar_a_Ftra( ' +
                     UTI_GEN_Comillas(Trim(param_clientes_o_proveedores))  + ', ' +
                     UTI_GEN_Comillas(Trim(param_id_facturas)) + ' );' );

      { ****************************************************************************
        Abrimos la tabla
        **************************************************************************** }
        var_SQLQuery          := TSQLQuery.Create(nil);

        var_SQLQuery.Database := var_SQLConnector;
        var_SQLQuery.SQL.Text := var_SQL.Text;

        var_SQLQuery.Name     := 'SQLQuery_UTI_LINEAS_Borrar_Rcbos_Cartera_Ftra';


        var_SQLQuery.ExecSQL;
        var_SQLTransaction.Commit;


      { ****************************************************************************
        Destruimos la tabla y conexiones
        **************************************************************************** }
        var_SQLQuery.Free;
        var_SQL.Free;

      { ****************************************************************************
        Cerramos La transacción y la conexión con la BD
        **************************************************************************** }
        if UTI_CN_Close( var_SQLTransaction,
                         var_SQLConnector ) = False then UTI_GEN_Salir;

        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    Except
         on error : Exception do
         begin
             UTI_GEN_Error_Log( 'Error al BORRAR los recibos de la factura con id ' + Trim(param_id_facturas) +
                                '. La tabla ha sido ' + var_SQLQuery.Name + ' desde el módulo ' +
                                Screen.ActiveForm.Name,
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

end.


