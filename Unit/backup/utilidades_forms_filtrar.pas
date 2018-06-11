unit utilidades_forms_Filtrar;

{$mode objfpc}{$H+}

interface

uses
    Dialogs, sqldb, db, Forms, Classes, SysUtils, utilidades_usuarios, utilidades_general;

type
    TRecord_Rgtro_Comun = record
        { COMUN A TODAS LAS TABLAS }
        id_1          : String;
        id_2          : String;
        id_3          : String;
        descripcion_1 : String;
        descripcion_2 : String;
        descripcion_3 : String;
    end;

    function UTI_Guardar_Datos_Registro( param_id_1, param_id_2, param_id_3, param_descripcion_1, param_descripcion_2, param_descripcion_3 : String ) : TRecord_Rgtro_Comun;

    function UTI_Abrir_Form( p_Filtros : AnsiString; p_OrderBy : AnsiString; param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_Campo : ShortString ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_SN( p_id_menus : Integer ) : Boolean;

    function UTI_Abrir_Modulo_Reportes( p_Filtros : AnsiString; p_OrderBy : AnsiString; param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_Clientes( p_Filtros : AnsiString; p_OrderBy : AnsiString; param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_Clientes_Tipos( p_Filtros : AnsiString; p_OrderBy : AnsiString; param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_Actividades( p_Filtros : AnsiString; p_OrderBy : AnsiString; param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_ServiciosRegulares( p_Filtros : AnsiString; p_OrderBy : AnsiString; param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_ServiciosTipos( p_Filtros : AnsiString; p_OrderBy : AnsiString; param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_ServiciosSeries( p_Filtros : AnsiString; p_OrderBy : AnsiString; param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_Almacenes( p_Filtros : AnsiString; p_OrderBy : AnsiString; param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_CuentasBancos( p_Filtros : AnsiString; p_OrderBy : AnsiString; param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_MovimientosAlmacen( p_Filtros : AnsiString; p_OrderBy : AnsiString; param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_Impresoras( p_Filtros : AnsiString; p_OrderBy : AnsiString; param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_Impuestos( p_Filtros : AnsiString; p_OrderBy : AnsiString; param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_Terminales( p_Filtros : AnsiString; p_OrderBy : AnsiString; param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_Elegir_Impuestos( p_Filtros : AnsiString; p_OrderBy : AnsiString; param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_id_impuesto_que_no_tiene_que_aparecer : String; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_Elegir_cliente_contacto( p_Filtros : AnsiString; p_OrderBy : AnsiString; param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_Elegir_cliente_Direccion_Envio( p_Filtros : AnsiString; p_OrderBy : AnsiString; param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;



    function UTI_Abrir_Modulo_ConfigurarAPP( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_FacturasVentas( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_FacturasCompras( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_AlbaranesCompras( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_FacturasCompras_Cerrar( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_FacturasVentas_Cerrar( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_UltimasVentas( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_MargenesIncrementoTarifas( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_PedidosCompras( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_PresupuestosCompras( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_Tarifas( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_Tablas( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_VisitasPorRepresentante( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_VisitasPorActividad( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_VisitasPorTipoCliente( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_VisitasPorCliente( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_VisitasPorProvincia( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_VisitasPorZona( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_PlanificacionPorZona( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_PlanificacionPorProvincia( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_VisitasTipos( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_PresupuestosVentas( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_PedidosVentas( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_VisitasResultados( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_Visitas( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_Rutas( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_AlbaranesVentas( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_VehiculosEquipamientos( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_Articulos( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_Combustibles( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_Peliculas( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_Personal( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_Proveedores( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_Tarjetas_Transporte( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_MarcasVehiculos( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_TiposVehiculos( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_Vehiculos( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_TipoCambiosVehiculos( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_TipoRuedasVehiculos( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_Usuarios( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_Menus( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_FamiliasArticulos( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_FamiliasPersonal( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_FamiliasContratosPersonal( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_ContratosPersonal( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_Empresas( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_FamiliasGastos( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_OfertasArticulos( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_ConceptosPorTraspasoAlmacen( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_CtasPagosCobros( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_Medios( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_Poblaciones( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_FormasPago( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_GruposDeCocina( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_Paises( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_Provincias( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_Representantes( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_TiposProveedores( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
    function UTI_Abrir_Modulo_Elegir_Diario_Tipo( param_Elegimos : Boolean; param_Solo_Ver : Boolean; param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;

implementation

uses menu, formas_pago_000, users_000, menus_000, medios_000, peliculas_000, clientes_000, elegir_cliente_contacto,
     elegir_cliente_direccion_envio, tarifas_000, clientes_tipos_000, provincias_000, poblaciones_000, representantes_000,
     proveedores_000, proveedores_tipos_000, articulos_familias_000, terminales_000, impresoras_000, articulos_000, paises_000,
     grupos_cocina_000, impuestos_000, elegir_impuestos, personal_familias_000, personal_000,
     personal_contratos_000, empresas_000, almacenes_000, gastos_tipos_000, cuentas_pagos_cobros_000,
     conceptos_almacen_traspaso_000, series_servicios_000, articulos_ofertas_000, bancos_ctas_empresas_000,
     almacenes_movimientos_000, vehiculos_tipos_000, vehiculos_marcas_000, combustibles_000,
     vehiculos_tipo_cambios_000, tarjetas_transporte_000, vehiculos_000, vehiculos_tipo_ruedas_000,
     vehiculos_equipamientos_000, albaranes_ventas_000, presupuestos_ventas_000, pedidos_ventas_000,
     configuracion_000, visitas_tipos_000, visitas_resultados_000, visitas_000, actividades_000,
     rutas_000, visitas_por_zona_000, visitas_por_provincia_000, visitas_por_cliente_000,
     visitas_por_tipo_cliente_000, visitas_por_actividad_000, visitas_por_representante_000,
     visitas_planificacion_por_zona_000, visitas_planificacion_por_provincia_000, facturas_ventas_000,
     margenes_tarifas_000, presupuestos_compras_000, pedidos_compras_000, albaranes_compras_000,
     facturas_compras_000, utilidades_000, facturas_cerrar_000, articulos_ultimas_ventas_000,
     reportes_000, servicios_regulares_000, servicios_tipos_000, personal_contratos_familias_000, elegir_diarios_tipos;

function UTI_Guardar_Datos_Registro( param_id_1,
                                     param_id_2,
                                     param_id_3,
                                     param_descripcion_1,
                                     param_descripcion_2,
                                     param_descripcion_3 : String ) : TRecord_Rgtro_Comun;
begin
    Result.id_1          := param_id_1;
    Result.id_2          := param_id_2;
    Result.id_3          := param_id_3;

    Result.descripcion_1 := param_descripcion_1;
    Result.descripcion_2 := param_descripcion_2;
    Result.descripcion_3 := param_descripcion_3;
end;

function UTI_Abrir_Form( p_Filtros      : AnsiString;
                         p_OrderBy      : AnsiString;
                         param_Elegimos : Boolean;
                         param_Solo_Ver : Boolean;
                         param_Campo    : ShortString ) : TRecord_Rgtro_Comun;
begin
     Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

   { ***********************************************************************************************
     EMPEZAMOS A VER A QUE MODULO LLAMAREMOS
     *********************************************************************************************** }
     { REPORTES / INFORMES }
     If UpperCase('id_informes') = UpperCase(Trim(param_Campo)) then
       Result := UTI_Abrir_Modulo_Reportes( p_Filtros, p_OrderBy, param_Elegimos, param_Solo_Ver, '1' );

     { CLIENTES }
     If UpperCase('id_clientes') = UpperCase(Trim(param_Campo)) then
       Result := UTI_Abrir_Modulo_Clientes( p_Filtros, p_OrderBy, param_Elegimos, param_Solo_Ver, '1' );

     { CLIENTES TIPOS }
     If UpperCase('id_clientes_tipos') = UpperCase(Trim(param_Campo)) then
       Result := UTI_Abrir_Modulo_Clientes_tipos( p_Filtros, p_OrderBy, param_Elegimos, param_Solo_Ver, '1' );

     { ACTIVIDADES }
     If UpperCase('id_actividades') = UpperCase(Trim(param_Campo)) then
       Result := UTI_Abrir_Modulo_Actividades( p_Filtros, p_OrderBy, param_Elegimos, param_Solo_Ver, '1' );

     { SERVICIOS REGULARES }
     If UpperCase('id_servicios_regulares') = UpperCase(Trim(param_Campo)) then
       Result := UTI_Abrir_Modulo_ServiciosRegulares( p_Filtros, p_OrderBy, param_Elegimos, param_Solo_Ver, '1' );

     { SERVICIOS TIPOS }
     If UpperCase('id_servicios_tipos') = UpperCase(Trim(param_Campo)) then
       Result := UTI_Abrir_Modulo_ServiciosTipos( p_Filtros, p_OrderBy, param_Elegimos, param_Solo_Ver, '1' );

     { SERIES DE SERVICIOS }
     If UpperCase('id_series_servicios') = UpperCase(Trim(param_Campo)) then
       Result := UTI_Abrir_Modulo_ServiciosSeries( p_Filtros, p_OrderBy, param_Elegimos, param_Solo_Ver, '1' );

     { ALMACENES }
     If (UpperCase('id_almacenes') = UpperCase(Trim(param_Campo)))         or
        (UpperCase('id_almacenes_origen') = UpperCase(Trim(param_Campo)))  or
        (UpperCase('id_almacenes_destino') = UpperCase(Trim(param_Campo))) then
     begin
       Result := UTI_Abrir_Modulo_Almacenes( p_Filtros, p_OrderBy, param_Elegimos, param_Solo_Ver, '1' );
     end;

     { bancos empresas }
     If UpperCase('id_bancos_empresas') = UpperCase(Trim(param_Campo)) then
       Result := UTI_Abrir_Modulo_CuentasBancos( p_Filtros, p_OrderBy, param_Elegimos, param_Solo_Ver, '1' );

     { ALMACENES MOVIMIENTOS }
     If UpperCase('id_almacenes_movimientos') = UpperCase(Trim(param_Campo)) then
       Result := UTI_Abrir_Modulo_MovimientosAlmacen( p_Filtros, p_OrderBy, param_Elegimos, param_Solo_Ver, '1' );

     { IMPRESORAS }
     If UpperCase('id_impresoras') = UpperCase(Trim(param_Campo)) then
       Result := UTI_Abrir_Modulo_Impresoras( p_Filtros, p_OrderBy, param_Elegimos, param_Solo_Ver, '1' );

     { IMPUESTOS }
     If UpperCase('id_impuestos') = UpperCase(Trim(param_Campo)) then
       Result := UTI_Abrir_Modulo_Impuestos( p_Filtros, p_OrderBy, param_Elegimos, param_Solo_Ver, '1' );

     { TERMINALES }
     If UpperCase('id_terminales') = UpperCase(Trim(param_Campo)) then
       Result := UTI_Abrir_Modulo_Terminales( p_Filtros, p_OrderBy, param_Elegimos, param_Solo_Ver, '1' );

     { MEDIOS }
     If UpperCase('id_medio') = UpperCase(Trim(param_Campo)) then
       Result := UTI_Abrir_Modulo_Medios( param_Elegimos, param_Solo_Ver, '1' );

     { PELICULAS }
     If UpperCase('id_pelicula') = UpperCase(Trim(param_Campo)) then
       Result := UTI_Abrir_Modulo_Peliculas( param_Elegimos, param_Solo_Ver, '1' );

     { USUARIOS }
     If UpperCase('Id_Users') = UpperCase(Trim(param_Campo)) then
       Result := UTI_Abrir_Modulo_Usuarios( param_Elegimos, param_Solo_Ver, '1' );

     { MENUS }
     If UpperCase('Id_Menus') = UpperCase(Trim(param_Campo)) then
       Result := UTI_Abrir_Modulo_Menus( param_Elegimos, param_Solo_Ver, '1' );

     { PAISES }
     If UpperCase('id_paises') = UpperCase(Trim(param_Campo)) then
       Result := UTI_Abrir_Modulo_Paises( param_Elegimos, param_Solo_Ver, '1' );

     { FORMAS PAGO }
     If UpperCase('id_formas_pago') = UpperCase(Trim(param_Campo)) then
       Result := UTI_Abrir_Modulo_FormasPago( param_Elegimos, param_Solo_Ver, '1' );

     { TARIFAS }
     If UpperCase('id_tarifas') = UpperCase(Trim(param_Campo)) then
       Result := UTI_Abrir_Modulo_Tarifas( param_Elegimos, param_Solo_Ver, '1' );

    { PROVINCIAS }
    If UpperCase('id_provincias') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_Provincias( param_Elegimos, param_Solo_Ver, '1' );

    { POBLACIONES }
    If UpperCase('id_poblaciones') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_Poblaciones( param_Elegimos, param_Solo_Ver, '1' );

    { PROVEEDORES }
    If ( UpperCase('id_proveedores') = UpperCase(Trim(param_Campo)) )         or
       ( UpperCase('id_Empleado_de') = UpperCase(Trim(param_Campo)) )         or
       ( UpperCase('id_Agencias_Transporte') = UpperCase(Trim(param_Campo)) ) then
    begin
      Result := UTI_Abrir_Modulo_Proveedores( param_Elegimos, param_Solo_Ver, '1' );
    end;

    { REPRESENTANTES }
    If UpperCase('id_representantes') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_Representantes( param_Elegimos, param_Solo_Ver, '1' );

    { PROVEEDORES TIPOS }
    If UpperCase('id_proveedores_tipos') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_TiposProveedores( param_Elegimos, param_Solo_Ver, '1' );

    { ARTICULOS FAMILIAS }
    If UpperCase('id_articulos_familias') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_FamiliasArticulos( param_Elegimos, param_Solo_Ver, '1' );

    { ARTICULOS }
    If UpperCase('id_articulos') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_Articulos( param_Elegimos, param_Solo_Ver, '1' );

    { GRUPOS COCINA }
    If UpperCase('id_grupos_cocina') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_GruposDeCocina( param_Elegimos, param_Solo_Ver, '1' );

    { PERSONAL FAMILIAS }
    If UpperCase('id_personal_familias') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_FamiliasPersonal( param_Elegimos, param_Solo_Ver, '1' );

    { PERSONAL }
    If UpperCase('id_personal') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_Personal( param_Elegimos, param_Solo_Ver, '1' );

    { PERSONAL CONTRATOS FAMILIAS }
    If UpperCase('id_personal_contratos_familias') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_FamiliasContratosPersonal( param_Elegimos, param_Solo_Ver, '1' );

    { PERSONAL CONTRATOS }
    If UpperCase('id_personal_contratos') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_ContratosPersonal( param_Elegimos, param_Solo_Ver, '1' );

    { EMPRESAS }
    If UpperCase('id_empresas') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_Empresas( param_Elegimos, param_Solo_Ver, '1' );

    { GASTOS TIPOS }
    If UpperCase('id_gastos_tipos') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_FamiliasGastos( param_Elegimos, param_Solo_Ver, '1' );

    { CUENTAS PAGOS COBROS }
    If UpperCase('id_cuentas_pagos_cobros') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_CtasPagosCobros( param_Elegimos, param_Solo_Ver, '1' );

    { CONCEPTOS ALMACEN TRASPASO }
    If UpperCase('id_conceptos_almacen_traspaso') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_ConceptosPorTraspasoAlmacen( param_Elegimos, param_Solo_Ver, '1' );

    { ARTICULOS OFERTAS }
    If UpperCase('id_articulos_ofertas') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_OfertasArticulos( param_Elegimos, param_Solo_Ver, '1' );

    { VEHICULOS }
    If UpperCase('id_vehiculos') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_Vehiculos( param_Elegimos, param_Solo_Ver, '1' );

    { VEHICULOS TIPOS }
    If UpperCase('id_vehiculos_tipos') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_TiposVehiculos( param_Elegimos, param_Solo_Ver, '1' );

    { VEHICULOS MARCAS }
    If UpperCase('id_vehiculos_marcas') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_MarcasVehiculos( param_Elegimos, param_Solo_Ver, '1' );

    { COMBUSTIBLES }
    If UpperCase('id_combustibles') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_Combustibles( param_Elegimos, param_Solo_Ver, '1' );

    { VEHICULOS TIPO CAMBIOS }
    If UpperCase('id_vehiculos_tipo_cambios') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_TipoCambiosVehiculos( param_Elegimos, param_Solo_Ver, '1' );

    { VEHICULOS TIPO RUEDAS }
    If UpperCase('id_vehiculos_tipo_ruedas') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_TipoRuedasVehiculos( param_Elegimos, param_Solo_Ver, '1' );

    { TARJETAS TRANSPORTE }
    If UpperCase('id_tarjetas_transporte') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_Tarjetas_Transporte( param_Elegimos, param_Solo_Ver, '1' );

    { VEHICULOS EQUIPAMIENTOS }
    If UpperCase('id_vehiculos_equipamientos') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_VehiculosEquipamientos( param_Elegimos, param_Solo_Ver, '1' );

    { ALBARANES VENTAS }
    If UpperCase('id_albaranes_ventas') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_AlbaranesVentas( param_Elegimos, param_Solo_Ver, '1' );

    { PRESUPUESTOS VENTAS }
    If UpperCase('id_presupuestos_ventas') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_PresupuestosVentas( param_Elegimos, param_Solo_Ver, '1' );

    { PEDIDOS VENTAS }
    If UpperCase('id_pedidos_ventas') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_PedidosVentas( param_Elegimos, param_Solo_Ver, '1' );

    { CONFIGURACION }
    If UpperCase('id_configuracion') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_ConfigurarAPP( param_Elegimos, param_Solo_Ver, '1' );

    { VISITAS TIPOS }
    If UpperCase('id_visitas_tipos') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_VisitasTipos( param_Elegimos, param_Solo_Ver, '1' );

    { VISITAS RESULTADOS }
    If UpperCase('id_visitas_resultados') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_VisitasResultados( param_Elegimos, param_Solo_Ver, '1' );

    { VISITAS }
    If UpperCase('id_visitas') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_Visitas( param_Elegimos, param_Solo_Ver, '1' );

    { RUTAS / ZONAS }
    If UpperCase('id_rutas') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_Rutas( param_Elegimos, param_Solo_Ver, '1' );

    { FACTURAS VENTAS }
    If UpperCase('id_facturas_ventas') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_FacturasVentas( param_Elegimos, param_Solo_Ver, '1' );

    { MARGENES PARA INCREMENTO DE TARIFAS }
    If UpperCase('id_margenes_tarifas') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_MargenesIncrementoTarifas( param_Elegimos, param_Solo_Ver, '1' );

    { PRESUPUESTOS COMPRAS }
    If UpperCase('id_presupuestos_compras') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_PresupuestosCompras( param_Elegimos, param_Solo_Ver, '1' );

    { PEDIDOS COMPRAS }
    If UpperCase('id_pedidos_compras') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_PedidosCompras( param_Elegimos, param_Solo_Ver, '1' );

    { ALBARANES COMPRAS }
    If UpperCase('id_albaranes_compras') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_AlbaranesCompras( param_Elegimos, param_Solo_Ver, '1' );

    { FACTURAS COMPRAS }
    If UpperCase('id_facturas_compras') = UpperCase(Trim(param_Campo)) then
      Result := UTI_Abrir_Modulo_FacturasCompras( param_Elegimos, param_Solo_Ver, '1' );

end;

function UTI_Abrir_Modulo_SN( p_id_menus : Integer ) : Boolean;
var
  var_nombre_Modulo : String;
  var_msg           : TStrings;
begin
  // **************************************************************************************** //
  // ** p_id_menus ... es el id de la tabla menus                                          ** //
  // **************************************************************************************** //
  Result := false;

  if UTI_USR_Permiso_SN( p_id_menus,
                         '',
                         true ) = false then
  begin
    Exit;
  end;

  var_nombre_Modulo := UTI_USR_Permiso_SN_TraerNombreModulo(p_id_menus);

  if Trim(var_nombre_Modulo) = '' then
  begin
    // ********************************************************************************************* //
    // ** El nombre del módulo está vacío                                                         ** //
    // ********************************************************************************************* //
    var_msg := TStringList.Create;
    var_msg.Clear;

    var_msg.Add( rs_menu_sin_Modulo + IntToStr(p_id_menus) );

    UTI_GEN_Aviso( true, var_msg, rs_No_Se_Puede, true, false );
    var_msg.Free;

    Exit;
  end;

  if UTI_GEN_Form_Abierto_Ya( Trim(var_nombre_Modulo) ) = true then
  begin
    // ********************************************************************************************* //
    // ** EL MODULO QUE QUERIAMOS LLAMAR YA ESTABA ABIERTO, NO PERMITIMOS ABRIRLO DOS VECES       ** //
    // ********************************************************************************************* //
    var_msg := TStringList.Create;
    var_msg.Clear;

    var_msg.Add(rs_Modulo_Abierto);

    UTI_GEN_Aviso( true, var_msg, rs_No_Se_Puede, true, false );
    var_msg.Free;

    Exit;
  end;

  // *********************************************************************************************** //
  // ** Abrimos el módulo                                                                         ** //
  // *********************************************************************************************** //
  Result := true;

end;

function UTI_Abrir_Modulo_ConfigurarAPP( param_Elegimos : Boolean;
                                         param_Solo_Ver : Boolean;
                                         param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 460 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_configuracion_000, form_configuracion_000 );

//    form_configuracion_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_configuracion_000.public_Solo_Ver                     := param_Solo_Ver;
    form_configuracion_000.public_Elegimos                     := param_Elegimos;
    form_configuracion_000.public_Menu_Worked                  := 460;

    form_configuracion_000.para_Empezar;

    form_configuracion_000.ShowModal;

    if form_configuracion_000.public_Rgtro_Seleccionado = true then
    begin
      with form_configuracion_000.SQLQuery_Configuracion do
      begin
        Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                              FieldByName('descripcion').AsString,
                                              '',
                                              '',
                                              '',
                                              '' );
      end;
    end;

    form_configuracion_000.Free;
  end;
end;

function UTI_Abrir_Modulo_FacturasCompras( param_Elegimos : Boolean;
                                           param_Solo_Ver : Boolean;
                                           param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 650 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_facturas_compras_000, form_facturas_compras_000 );

//    form_facturas_compras_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_facturas_compras_000.public_Solo_Ver                   := param_Solo_Ver;
    form_facturas_compras_000.public_Elegimos                   := param_Elegimos;
    form_facturas_compras_000.public_Menu_Worked                := 650;

    form_facturas_compras_000.para_Empezar;

    form_facturas_compras_000.ShowModal;

    if form_facturas_compras_000.public_Rgtro_Seleccionado = true then
    begin
      with form_facturas_compras_000.SQLQuery_Ftra do
      begin
        Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                              FieldByName('id_proveedores').AsString,
                                              FieldByName('Fecha').AsString,
                                              '',
                                              FieldByName('Serie_Factura').AsString,
                                              FieldByName('Numero_Factura').AsString );
      end;
    end;

    form_facturas_compras_000.Free;
  end;
end;

function UTI_Abrir_Modulo_FacturasVentas( param_Elegimos : Boolean;
                                          param_Solo_Ver : Boolean;
                                          param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 600 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_facturas_ventas_000, form_facturas_ventas_000 );

//    form_facturas_ventas_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_facturas_ventas_000.public_Solo_Ver                   := param_Solo_Ver;
    form_facturas_ventas_000.public_Elegimos                   := param_Elegimos;
    form_facturas_ventas_000.public_Menu_Worked                := 600;

    form_facturas_ventas_000.para_Empezar;

    form_facturas_ventas_000.ShowModal;

    if form_facturas_ventas_000.public_Rgtro_Seleccionado = true then
    begin
      with form_facturas_ventas_000.SQLQuery_Ftra do
      begin
        Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                              FieldByName('id_clientes').AsString,
                                              FieldByName('Fecha').AsString,
                                              '',
                                              FieldByName('Serie_Factura').AsString,
                                              FieldByName('Numero_Factura').AsString );
      end;
    end;

    form_facturas_ventas_000.Free;
  end;
end;

function UTI_Abrir_Modulo_AlbaranesCompras( param_Elegimos : Boolean;
                                            param_Solo_Ver : Boolean;
                                            param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 640 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_albaranes_compras_000, form_albaranes_compras_000 );

//    form_albaranes_compras_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_albaranes_compras_000.public_Solo_Ver                     := param_Solo_Ver;
    form_albaranes_compras_000.public_Elegimos                     := param_Elegimos;
    form_albaranes_compras_000.public_Menu_Worked                  := 640;

    form_albaranes_compras_000.para_Empezar;

    form_albaranes_compras_000.ShowModal;

    if form_albaranes_compras_000.public_Rgtro_Seleccionado = true then
    begin
      with form_albaranes_compras_000.SQLQuery_Alb do
      begin
        Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                              FieldByName('id_proveedores').AsString,
                                              FieldByName('Fecha').AsString,
                                              '',
                                              FieldByName('Serie_Albaran').AsString,
                                              FieldByName('Numero_Albaran').AsString );
      end;
    end;

    form_albaranes_compras_000.Free;
  end;
end;

function UTI_Abrir_Modulo_FacturasCompras_Cerrar( param_Elegimos : Boolean;
                                                  param_Solo_Ver : Boolean;
                                                  param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 680 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_facturas_cerrar_000, form_facturas_cerrar_000 );

    form_facturas_cerrar_000.public_ventas_o_compras := 'C';
    form_facturas_cerrar_000.para_Empezar;

    form_facturas_cerrar_000.ShowModal;

    form_facturas_cerrar_000.Free;
  end;
end;

function UTI_Abrir_Modulo_FacturasVentas_Cerrar( param_Elegimos : Boolean;
                                                 param_Solo_Ver : Boolean;
                                                 param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 670 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_facturas_cerrar_000, form_facturas_cerrar_000 );

    form_facturas_cerrar_000.public_ventas_o_compras := 'V';
    form_facturas_cerrar_000.para_Empezar;

    form_facturas_cerrar_000.ShowModal;

    form_facturas_cerrar_000.Free;
  end;
end;

function UTI_Abrir_Modulo_UltimasVentas( param_Elegimos : Boolean;
                                         param_Solo_Ver : Boolean;
                                         param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 690 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_articulos_ultimas_ventas_000, form_articulos_ultimas_ventas_000 );

    form_articulos_ultimas_ventas_000.para_Empezar;

    form_articulos_ultimas_ventas_000.ShowModal;

    form_articulos_ultimas_ventas_000.Free;
  end;
end;

function UTI_Abrir_Modulo_MargenesIncrementoTarifas( param_Elegimos : Boolean;
                                                     param_Solo_Ver : Boolean;
                                                     param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 610 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_margenes_tarifas_000, form_margenes_tarifas_000 );

//    form_margenes_tarifas_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_margenes_tarifas_000.public_Solo_Ver                     := param_Solo_Ver;
    form_margenes_tarifas_000.public_Elegimos                     := param_Elegimos;
    form_margenes_tarifas_000.public_Menu_Worked                  := 610;

    form_margenes_tarifas_000.para_Empezar;

    form_margenes_tarifas_000.ShowModal;

    if form_margenes_tarifas_000.public_Rgtro_Seleccionado = true then
    begin
      with form_margenes_tarifas_000.SQLQuery_Margenes do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                FieldByName('mayor_igual_que').AsString,
                                                FieldByName('menor_igual_que').AsString,
                                                '',
                                                '',
                                                '' );
      end;
    end;

    form_margenes_tarifas_000.Free;
  end;
end;

function UTI_Abrir_Modulo_PedidosCompras( param_Elegimos : Boolean;
                                          param_Solo_Ver : Boolean;
                                          param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 630 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_pedidos_compras_000, form_pedidos_compras_000 );

//    form_pedidos_compras_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_pedidos_compras_000.public_Solo_Ver                   := param_Solo_Ver;
    form_pedidos_compras_000.public_Elegimos                   := param_Elegimos;
    form_pedidos_compras_000.public_Menu_Worked                := 630;

    form_pedidos_compras_000.para_Empezar;

    form_pedidos_compras_000.ShowModal;

    if form_pedidos_compras_000.public_Rgtro_Seleccionado = true then
    begin
      with form_pedidos_compras_000.SQLQuery_Pdo do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                FieldByName('id_proveedores').AsString,
                                                FieldByName('Fecha').AsString,
                                                '',
                                                FieldByName('Serie_Pedidos').AsString,
                                                FieldByName('Numero_Pedidos').AsString );
      end;
    end;

    form_pedidos_compras_000.Free;
  end;
end;

function UTI_Abrir_Modulo_PresupuestosCompras( param_Elegimos : Boolean;
                                               param_Solo_Ver : Boolean;
                                               param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 620 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_presupuestos_compras_000, form_presupuestos_compras_000 );

//    form_presupuestos_compras_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_presupuestos_compras_000.public_Solo_Ver                   := param_Solo_Ver;
    form_presupuestos_compras_000.public_Elegimos                   := param_Elegimos;
    form_presupuestos_compras_000.public_Menu_Worked                := 620;

    form_presupuestos_compras_000.para_Empezar;

    form_presupuestos_compras_000.ShowModal;

    if form_presupuestos_compras_000.public_Rgtro_Seleccionado = true then
    begin
      with form_presupuestos_compras_000.SQLQuery_Presup do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                FieldByName('id_proveedores').AsString,
                                                FieldByName('Fecha').AsString,
                                                '',
                                                FieldByName('Serie_Presupuesto').AsString,
                                                FieldByName('Numero_Presupuesto').AsString );
      end;
    end;

    form_presupuestos_compras_000.Free;
  end;
end;

function UTI_Abrir_Modulo_Tarifas( param_Elegimos : Boolean;
                                   param_Solo_Ver : Boolean;
                                   param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 90 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_tarifas_000, form_tarifas_000 );

//    form_tarifas_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_tarifas_000.public_Solo_Ver                   := param_Solo_Ver;
    form_tarifas_000.public_Elegimos                   := param_Elegimos;
    form_tarifas_000.public_Menu_Worked                := 90;

    form_tarifas_000.para_Empezar;

    form_tarifas_000.ShowModal;

    if form_tarifas_000.public_Rgtro_Seleccionado = true then
    begin
      with form_tarifas_000.SQLQuery_Tarifas do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',
                                                FieldByName('descripcion').AsString,
                                                '',
                                                '' );
      end;
    end;

    form_tarifas_000.Free;
  end;
end;

function UTI_Abrir_Modulo_Tablas( param_Elegimos : Boolean;
                                  param_Solo_Ver : Boolean;
                                  param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 660 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_utilidades_000, form_utilidades_000 );

    form_utilidades_000.para_Empezar;

    form_utilidades_000.ShowModal;

    form_utilidades_000.Free;
  end;
end;

function UTI_Abrir_Modulo_VisitasPorRepresentante( param_Elegimos : Boolean;
                                                   param_Solo_Ver : Boolean;
                                                   param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 570 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_visitas_por_representante_000, form_visitas_por_representante_000 );

    form_visitas_por_representante_000.public_Menu_Worked := 570;
    form_visitas_por_representante_000.para_Empezar;

    form_visitas_por_representante_000.ShowModal;

    form_visitas_por_representante_000.Free;
  end;
end;

function UTI_Abrir_Modulo_VisitasPorActividad( param_Elegimos : Boolean;
                                               param_Solo_Ver : Boolean;
                                               param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 560 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_visitas_por_actividad_000, form_visitas_por_actividad_000 );

    form_visitas_por_actividad_000.public_Menu_Worked := 560;
    form_visitas_por_actividad_000.para_Empezar;

    form_visitas_por_actividad_000.ShowModal;

    form_visitas_por_actividad_000.Free;
  end;
end;

function UTI_Abrir_Modulo_VisitasPorTipoCliente( param_Elegimos : Boolean;
                                                 param_Solo_Ver : Boolean;
                                                 param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 550 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_visitas_por_tipo_cliente_000, form_visitas_por_tipo_cliente_000 );

    form_visitas_por_tipo_cliente_000.public_Menu_Worked := 550;
    form_visitas_por_tipo_cliente_000.para_Empezar;

    form_visitas_por_tipo_cliente_000.ShowModal;

    form_visitas_por_tipo_cliente_000.Free;
  end;
end;

function UTI_Abrir_Modulo_VisitasPorCliente( param_Elegimos : Boolean;
                                             param_Solo_Ver : Boolean;
                                             param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 540 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_visitas_por_cliente_000, form_visitas_por_cliente_000 );

    form_visitas_por_cliente_000.public_Menu_Worked := 540;
    form_visitas_por_cliente_000.para_Empezar;

    form_visitas_por_cliente_000.ShowModal;

    form_visitas_por_cliente_000.Free;
  end;
end;

function UTI_Abrir_Modulo_VisitasPorProvincia( param_Elegimos : Boolean;
                                               param_Solo_Ver : Boolean;
                                               param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 530 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_visitas_por_provincia_000, form_visitas_por_provincia_000 );

    form_visitas_por_provincia_000.public_Menu_Worked := 530;
    form_visitas_por_provincia_000.para_Empezar;

    form_visitas_por_provincia_000.ShowModal;

    form_visitas_por_provincia_000.Free;
  end;
end;

function UTI_Abrir_Modulo_VisitasPorZona( param_Elegimos : Boolean;
                                          param_Solo_Ver : Boolean;
                                          param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 520 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_visitas_por_zona_000, form_visitas_por_zona_000 );

    form_visitas_por_zona_000.public_Menu_Worked := 520;
    form_visitas_por_zona_000.para_Empezar;

    form_visitas_por_zona_000.ShowModal;

    form_visitas_por_zona_000.Free;
  end;
end;

function UTI_Abrir_Modulo_PlanificacionPorZona( param_Elegimos : Boolean;
                                                param_Solo_Ver : Boolean;
                                                param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 580 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_visitas_planificacion_por_zona_000, form_visitas_planificacion_por_zona_000 );

    form_visitas_planificacion_por_zona_000.public_Menu_Worked := 580;
    form_visitas_planificacion_por_zona_000.para_Empezar;

    form_visitas_planificacion_por_zona_000.ShowModal;

    form_visitas_planificacion_por_zona_000.Free;
  end;
end;

function UTI_Abrir_Modulo_PlanificacionPorProvincia( param_Elegimos : Boolean;
                                                     param_Solo_Ver : Boolean;
                                                     param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 590 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_visitas_planificacion_por_provincia_000, form_visitas_planificacion_por_provincia_000 );

    form_visitas_planificacion_por_provincia_000.public_Menu_Worked := 590;
    form_visitas_planificacion_por_provincia_000.para_Empezar;

    form_visitas_planificacion_por_provincia_000.ShowModal;

    form_visitas_planificacion_por_provincia_000.Free;
  end;
end;

function UTI_Abrir_Modulo_VisitasTipos( param_Elegimos : Boolean;
                                        param_Solo_Ver : Boolean;
                                        param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 470 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_visitas_tipos_000, form_visitas_tipos_000 );

//    form_visitas_tipos_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_visitas_tipos_000.public_Solo_Ver                   := param_Solo_Ver;
    form_visitas_tipos_000.public_Elegimos                   := param_Elegimos;
    form_visitas_tipos_000.public_Menu_Worked                := 470;

    form_visitas_tipos_000.para_Empezar;

    form_visitas_tipos_000.ShowModal;

    if form_visitas_tipos_000.public_Rgtro_Seleccionado = true then
    begin
      with form_visitas_tipos_000.SQLQuery_Visitas_Tipos do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',
                                                FieldByName('descripcion').AsString,
                                                '',
                                                '' );
      end;
    end;

    form_visitas_tipos_000.Free;
  end;
end;

function UTI_Abrir_Modulo_PresupuestosVentas( param_Elegimos : Boolean;
                                              param_Solo_Ver : Boolean;
                                              param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 440 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_presupuestos_ventas_000, form_presupuestos_ventas_000 );

//    form_presupuestos_ventas_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_presupuestos_ventas_000.public_Solo_Ver                   := param_Solo_Ver;
    form_presupuestos_ventas_000.public_Elegimos                   := param_Elegimos;
    form_presupuestos_ventas_000.public_Menu_Worked                := 440;

    form_presupuestos_ventas_000.para_Empezar;

    form_presupuestos_ventas_000.ShowModal;

    if form_presupuestos_ventas_000.public_Rgtro_Seleccionado = true then
    begin
      with form_presupuestos_ventas_000.SQLQuery_Presup do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                FieldByName('id_clientes').AsString,
                                                FieldByName('Fecha').AsString,
                                                '',
                                                FieldByName('Serie_Presupuesto').AsString,
                                                FieldByName('Numero_Presupuesto').AsString );
      end;
    end;

    form_presupuestos_ventas_000.Free;
  end;
end;

function UTI_Abrir_Modulo_PedidosVentas( param_Elegimos : Boolean;
                                         param_Solo_Ver : Boolean;
                                         param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 450 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_pedidos_ventas_000, form_pedidos_ventas_000 );

//    form_pedidos_ventas_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_pedidos_ventas_000.public_Solo_Ver                   := param_Solo_Ver;
    form_pedidos_ventas_000.public_Elegimos                   := param_Elegimos;
    form_pedidos_ventas_000.public_Menu_Worked                := 450;

    form_pedidos_ventas_000.para_Empezar;

    form_pedidos_ventas_000.ShowModal;

    if form_pedidos_ventas_000.public_Rgtro_Seleccionado = true then
    begin
      with form_pedidos_ventas_000.SQLQuery_Pdo do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                FieldByName('id_clientes').AsString,
                                                FieldByName('Fecha').AsString,
                                                '',
                                                FieldByName('Serie_Pedidos').AsString,
                                                FieldByName('Numero_Pedidos').AsString );
      end;
    end;

    form_pedidos_ventas_000.Free;
  end;
end;

function UTI_Abrir_Modulo_VisitasResultados( param_Elegimos : Boolean;
                                             param_Solo_Ver : Boolean;
                                             param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 480 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_visitas_resultados_000, form_visitas_resultados_000 );

//    form_visitas_resultados_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_visitas_resultados_000.public_Solo_Ver                   := param_Solo_Ver;
    form_visitas_resultados_000.public_Elegimos                   := param_Elegimos;
    form_visitas_resultados_000.public_Menu_Worked                := 480;

    form_visitas_resultados_000.para_Empezar;

    form_visitas_resultados_000.ShowModal;

    if form_visitas_resultados_000.public_Rgtro_Seleccionado = true then
    begin
      with form_visitas_resultados_000.SQLQuery_Visitas_Resultados do
      begin
        Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                              '',
                                              '',
                                              FieldByName('descripcion').AsString,
                                              '',
                                              '' );
      end;
    end;

    form_visitas_resultados_000.Free;
  end;
end;

function UTI_Abrir_Modulo_Visitas( param_Elegimos : Boolean;
                                   param_Solo_Ver : Boolean;
                                   param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 490 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_visitas_000, form_visitas_000 );

//    form_visitas_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_visitas_000.public_Solo_Ver                   := param_Solo_Ver;
    form_visitas_000.public_Elegimos                   := param_Elegimos;
    form_visitas_000.public_Menu_Worked                := 490;

    form_visitas_000.para_Empezar;

    form_visitas_000.ShowModal;

    if form_visitas_000.public_Rgtro_Seleccionado = true then
    begin
      with form_visitas_000.SQLQuery_Visitas do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                FieldByName('Fecha_Visita').AsString,
                                                FieldByName('id_clientes').AsString,
                                                FieldByName('id_visitas_tipos').AsString,
                                                FieldByName('id_visitas_resultados').AsString,
                                                FieldByName('id_representantes').AsString );
      end;
    end;

    form_visitas_000.Free;
  end;
end;

function UTI_Abrir_Modulo_Rutas( param_Elegimos : Boolean;
                                 param_Solo_Ver : Boolean;
                                 param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 510 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_rutas_000, form_rutas_000 );

//    form_rutas_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_rutas_000.public_Solo_Ver                   := param_Solo_Ver;
    form_rutas_000.public_Elegimos                   := param_Elegimos;
    form_rutas_000.public_Menu_Worked                := 510;

    form_rutas_000.para_Empezar;

    form_rutas_000.ShowModal;

    if form_rutas_000.public_Rgtro_Seleccionado = true then
    begin
      with form_rutas_000.SQLQuery_Rutas do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',
                                                FieldByName('descripcion').AsString,
                                                '',
                                                '' );
      end;
    end;

    form_rutas_000.Free;
  end;
end;

function UTI_Abrir_Modulo_AlbaranesVentas( param_Elegimos : Boolean;
                                           param_Solo_Ver : Boolean;
                                           param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 430 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_albaranes_ventas_000, form_albaranes_ventas_000 );

//    form_albaranes_ventas_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_albaranes_ventas_000.public_Solo_Ver                   := param_Solo_Ver;
    form_albaranes_ventas_000.public_Elegimos                   := param_Elegimos;
    form_albaranes_ventas_000.public_Menu_Worked                := 430;

    form_albaranes_ventas_000.para_Empezar;

    form_albaranes_ventas_000.ShowModal;

    if form_albaranes_ventas_000.public_Rgtro_Seleccionado = true then
    begin
      with form_albaranes_ventas_000.SQLQuery_Alb do
      begin
        Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                              FieldByName('id_clientes').AsString,
                                              FieldByName('Fecha').AsString,
                                              '',
                                              FieldByName('Serie_Albaran').AsString,
                                              FieldByName('Numero_Albaran').AsString );
      end;
    end;

    form_albaranes_ventas_000.Free;
  end;
end;

function UTI_Abrir_Modulo_VehiculosEquipamientos( param_Elegimos : Boolean;
                                                  param_Solo_Ver : Boolean;
                                                  param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 420 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_vehiculos_equipamientos_000, form_vehiculos_equipamientos_000 );

//    form_vehiculos_equipamientos_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_vehiculos_equipamientos_000.public_Solo_Ver                   := param_Solo_Ver;
    form_vehiculos_equipamientos_000.public_Elegimos                   := param_Elegimos;
    form_vehiculos_equipamientos_000.public_Menu_Worked                := 420;

    form_vehiculos_equipamientos_000.para_Empezar;

    form_vehiculos_equipamientos_000.ShowModal;

    if form_vehiculos_equipamientos_000.public_Rgtro_Seleccionado = true then
    begin
      with form_vehiculos_equipamientos_000.SQLQuery_Vehiculos_Equip do
      begin
        Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                              '',
                                              '',
                                              FieldByName('descripcion').AsString,
                                              '',
                                              '' );
      end;
    end;

    form_vehiculos_equipamientos_000.Free;
  end;
end;

function UTI_Abrir_Modulo_Articulos( param_Elegimos : Boolean;
                                     param_Solo_Ver : Boolean;
                                     param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 170 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_articulos_000, form_articulos_000 );

    // form_articulos_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_articulos_000.public_Solo_Ver                   := param_Solo_Ver;
    form_articulos_000.public_Elegimos                   := param_Elegimos;
    form_articulos_000.public_Menu_Worked                := 170;

    form_articulos_000.para_Empezar;

    form_articulos_000.ShowModal;

    if form_articulos_000.public_Rgtro_Seleccionado = true then
    begin
      with form_articulos_000.SQLQuery_Articulos do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',

                                                FieldByName('descripcion').AsString,
                                                FieldByName('descripcion_para_TPV').AsString,
                                                '' );
      end;
    end;

    form_articulos_000.Free;
  end;
end;

function UTI_Abrir_Modulo_Combustibles( param_Elegimos : Boolean;
                                        param_Solo_Ver : Boolean;
                                        param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 380 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_combustibles_000, form_combustibles_000 );

    // form_combustibles_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_combustibles_000.public_Solo_Ver                   := param_Solo_Ver;
    form_combustibles_000.public_Elegimos                   := param_Elegimos;
    form_combustibles_000.public_Menu_Worked                := 380;

    form_combustibles_000.para_Empezar;

    form_combustibles_000.ShowModal;

    if form_combustibles_000.public_Rgtro_Seleccionado = true then
    begin
      with form_combustibles_000.SQLQuery_Combustibles do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',
                                                FieldByName('descripcion').AsString,
                                                '',
                                                '' );
      end;
    end;

    form_combustibles_000.Free;
  end;
end;

function UTI_Abrir_Modulo_Peliculas( param_Elegimos : Boolean;
                                     param_Solo_Ver : Boolean;
                                     param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 20 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( TForm_peliculas_000, Form_peliculas_000 );

 // Form_peliculas_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    Form_peliculas_000.public_Solo_Ver                   := param_Solo_Ver;
    Form_peliculas_000.public_Elegimos                   := param_Elegimos;
    Form_peliculas_000.public_Menu_Worked                := 20;

    Form_peliculas_000.para_Empezar;

    Form_peliculas_000.ShowModal;

    if Form_peliculas_000.public_Rgtro_Seleccionado = true then
    begin
      with Form_peliculas_000.SQLQuery_Pelis do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',
                                                FieldByName('Descripcion').AsString,
                                                '',
                                                '' );
      end;
    end;

    Form_peliculas_000.Free;
  end;
end;

function UTI_Abrir_Modulo_Personal( param_Elegimos : Boolean;
                                    param_Solo_Ver : Boolean;
                                    param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 220 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_personal_000, form_personal_000 );

    // form_personal_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_personal_000.public_Solo_Ver                   := param_Solo_Ver;
    form_personal_000.public_Elegimos                   := param_Elegimos;
    form_personal_000.public_Menu_Worked                := 220;

    form_personal_000.para_Empezar;

    form_personal_000.ShowModal;

    if form_personal_000.public_Rgtro_Seleccionado = true then
    begin
      with form_personal_000.SQLQuery_Personal do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',
                                                FieldByName('nombre').AsString,
                                                FieldByName('nif_cif').AsString,
                                                '' );
      end;
    end;

    form_personal_000.Free;
  end;
end;

function UTI_Abrir_Modulo_Proveedores( param_Elegimos : Boolean;
                                       param_Solo_Ver : Boolean;
                                       param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 120 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_proveedores_000, form_proveedores_000 );

    // form_proveedores_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_proveedores_000.public_Solo_Ver                   := param_Solo_Ver;
    form_proveedores_000.public_Elegimos                   := param_Elegimos;
    form_proveedores_000.public_Menu_Worked                := 120;

    form_proveedores_000.para_Empezar;

    form_proveedores_000.ShowModal;

    if form_proveedores_000.public_Rgtro_Seleccionado = true then
    begin
      with form_proveedores_000.SQLQuery_Proveedores do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',
                                                FieldByName('nombre_propietario').AsString,
                                                FieldByName('Tfno_Fijo_1').AsString,
                                                FieldByName('Movil').AsString );
      end;
    end;

    form_proveedores_000.Free;
  end;
end;

function UTI_Abrir_Modulo_Tarjetas_Transporte( param_Elegimos : Boolean;
                                               param_Solo_Ver : Boolean;
                                               param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 410 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_tarjetas_transporte_000, form_tarjetas_transporte_000 );

    // form_tarjetas_transporte_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_tarjetas_transporte_000.public_Solo_Ver                   := param_Solo_Ver;
    form_tarjetas_transporte_000.public_Elegimos                   := param_Elegimos;
    form_tarjetas_transporte_000.public_Menu_Worked                := 410;

    form_tarjetas_transporte_000.para_Empezar;

    form_tarjetas_transporte_000.ShowModal;

    if form_tarjetas_transporte_000.public_Rgtro_Seleccionado = true then
    begin
      with form_tarjetas_transporte_000.SQLQuery_TjtaTte do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',
                                                FieldByName('numero_tarjeta').AsString,
                                                FieldByName('ambito').AsString,
                                                '' );
      end;
    end;

    form_tarjetas_transporte_000.Free;
  end;
end;

function UTI_Abrir_Modulo_MarcasVehiculos( param_Elegimos : Boolean;
                                           param_Solo_Ver : Boolean;
                                           param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 370 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_vehiculos_marcas_000, form_vehiculos_marcas_000 );

    // form_vehiculos_marcas_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_vehiculos_marcas_000.public_Solo_Ver                   := param_Solo_Ver;
    form_vehiculos_marcas_000.public_Elegimos                   := param_Elegimos;
    form_vehiculos_marcas_000.public_Menu_Worked                := 370;

    form_vehiculos_marcas_000.para_Empezar;

    form_vehiculos_marcas_000.ShowModal;

    if form_vehiculos_marcas_000.public_Rgtro_Seleccionado = true then
    begin
      with form_vehiculos_marcas_000.SQLQuery_Vehiculos_Marcas do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',
                                                FieldByName('descripcion').AsString,
                                                '',
                                                '' );
      end;
    end;

    form_vehiculos_marcas_000.Free;
  end;
end;

function UTI_Abrir_Modulo_TiposVehiculos( param_Elegimos : Boolean;
                                          param_Solo_Ver : Boolean;
                                          param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 360 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_vehiculos_tipos_000, form_vehiculos_tipos_000 );

    // form_vehiculos_tipos_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_vehiculos_tipos_000.public_Solo_Ver                   := param_Solo_Ver;
    form_vehiculos_tipos_000.public_Elegimos                   := param_Elegimos;
    form_vehiculos_tipos_000.public_Menu_Worked                := 360;

    form_vehiculos_tipos_000.para_Empezar;

    form_vehiculos_tipos_000.ShowModal;

    if form_vehiculos_tipos_000.public_Rgtro_Seleccionado = true then
    begin
      with form_vehiculos_tipos_000.SQLQuery_Vehiculos_Tipos do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',
                                                FieldByName('descripcion').AsString,
                                                '',
                                                '' );
      end;
    end;

    form_vehiculos_tipos_000.Free;
  end;
end;

function UTI_Abrir_Modulo_Vehiculos( param_Elegimos : Boolean;
                                     param_Solo_Ver : Boolean;
                                     param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 350 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_vehiculos_000, form_vehiculos_000 );

    // form_vehiculos_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_vehiculos_000.public_Solo_Ver                   := param_Solo_Ver;
    form_vehiculos_000.public_Elegimos                   := param_Elegimos;
    form_vehiculos_000.public_Menu_Worked                := 350;

    form_vehiculos_000.para_Empezar;

    form_vehiculos_000.ShowModal;

    if form_vehiculos_000.public_Rgtro_Seleccionado = true then
    begin
      with form_vehiculos_000.SQLQuery_Vehiculos do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',
                                                FieldByName('matricula').AsString,
                                                '',
                                                '' );
      end;
    end;

    form_vehiculos_000.Free;
  end;
end;

function UTI_Abrir_Modulo_TipoCambiosVehiculos( param_Elegimos : Boolean;
                                                param_Solo_Ver : Boolean;
                                                param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 390 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_vehiculos_tipo_cambios_000, form_vehiculos_tipo_cambios_000 );

    // form_vehiculos_tipo_cambios_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_vehiculos_tipo_cambios_000.public_Solo_Ver                   := param_Solo_Ver;
    form_vehiculos_tipo_cambios_000.public_Elegimos                   := param_Elegimos;
    form_vehiculos_tipo_cambios_000.public_Menu_Worked                := 390;

    form_vehiculos_tipo_cambios_000.para_Empezar;

    form_vehiculos_tipo_cambios_000.ShowModal;

    if form_vehiculos_tipo_cambios_000.public_Rgtro_Seleccionado = true then
    begin
      with form_vehiculos_tipo_cambios_000.SQLQuery_VTCambios do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',
                                                FieldByName('descripcion').AsString,
                                                '',
                                                '' );
      end;
    end;

    form_vehiculos_tipo_cambios_000.Free;
  end;
end;

function UTI_Abrir_Modulo_TipoRuedasVehiculos( param_Elegimos : Boolean;
                                               param_Solo_Ver : Boolean;
                                               param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 400 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_vehiculos_tipo_ruedas_000, form_vehiculos_tipo_ruedas_000 );

    // form_vehiculos_tipo_ruedas_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_vehiculos_tipo_ruedas_000.public_Solo_Ver                   := param_Solo_Ver;
    form_vehiculos_tipo_ruedas_000.public_Elegimos                   := param_Elegimos;
    form_vehiculos_tipo_ruedas_000.public_Menu_Worked                := 400;

    form_vehiculos_tipo_ruedas_000.para_Empezar;

    form_vehiculos_tipo_ruedas_000.ShowModal;

    if form_vehiculos_tipo_ruedas_000.public_Rgtro_Seleccionado = true then
    begin
      with form_vehiculos_tipo_ruedas_000.SQLQuery_VTRuedas do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',
                                                FieldByName('descripcion').AsString,
                                                '',
                                                '' );
      end;
    end;

    form_vehiculos_tipo_ruedas_000.Free;
  end;
end;

function UTI_Abrir_Modulo_Usuarios( param_Elegimos : Boolean;
                                    param_Solo_Ver : Boolean;
                                    param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 30 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( TForm_users_000, Form_users_000 );

    // Form_users_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    Form_users_000.public_Solo_Ver                   := param_Solo_Ver;
    Form_users_000.public_Elegimos                   := param_Elegimos;
    Form_users_000.public_Menu_Worked                := 30;

    Form_users_000.para_Empezar;

    Form_users_000.ShowModal;

    if Form_users_000.public_Rgtro_Seleccionado = true then
    begin
      with Form_users_000.SQLQuery_Users do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',
                                                FieldByName('Descripcion_Nick').AsString,
                                                '',
                                                '' );
      end;
    end;

    Form_users_000.Free;
  end;
end;

function UTI_Abrir_Modulo_Menus( param_Elegimos : Boolean;
                                 param_Solo_Ver : Boolean;
                                 param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 40 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( TForm_menus_000, Form_menus_000 );

    // Form_menus_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    Form_menus_000.public_Solo_Ver                   := param_Solo_Ver;
    Form_menus_000.public_Elegimos                   := param_Elegimos;
    Form_menus_000.public_Menu_Worked                := 40;

    Form_menus_000.para_Empezar;

    Form_menus_000.ShowModal;

    if Form_menus_000.public_Rgtro_Seleccionado = true then
    begin
      with Form_menus_000.SQLQuery_Menus do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',
                                                FieldByName('Descripcion').AsString,
                                                '',
                                                '' );
      end;
    end;

    Form_menus_000.Free;
  end;
end;

function UTI_Abrir_Modulo_FamiliasArticulos( param_Elegimos : Boolean;
                                             param_Solo_Ver : Boolean;
                                             param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 150 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_articulos_familias_000, form_articulos_familias_000 );

    // form_articulos_familias_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_articulos_familias_000.public_Solo_Ver                   := param_Solo_Ver;
    form_articulos_familias_000.public_Elegimos                   := param_Elegimos;
    form_articulos_familias_000.public_Menu_Worked                := 150;

    form_articulos_familias_000.para_Empezar;

    form_articulos_familias_000.ShowModal;

    if form_articulos_familias_000.public_Rgtro_Seleccionado = true then
    begin
      with form_articulos_familias_000.SQLQuery_Articulos_Familias do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',
                                                FieldByName('descripcion').AsString,
                                                '',
                                                '' );
      end;
    end;

    form_articulos_familias_000.Free;
  end;
end;

function UTI_Abrir_Modulo_FamiliasPersonal( param_Elegimos : Boolean;
                                            param_Solo_Ver : Boolean;
                                            param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 210 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_personal_familias_000, form_personal_familias_000 );

    // form_personal_familias_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_personal_familias_000.public_Solo_Ver                   := param_Solo_Ver;
    form_personal_familias_000.public_Elegimos                   := param_Elegimos;
    form_personal_familias_000.public_Menu_Worked                := 210;

    form_personal_familias_000.para_Empezar;

    form_personal_familias_000.ShowModal;

    if form_personal_familias_000.public_Rgtro_Seleccionado = true then
    begin
      with form_personal_familias_000.SQLQuery_Personal_Familias do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',
                                                FieldByName('descripcion').AsString,
                                                FieldByName('Cuenta_Contable').AsString,
                                                FieldByName('Cuenta_Contable').AsString );
      end;
    end;

    form_personal_familias_000.Free;
  end;
end;

function UTI_Abrir_Modulo_FamiliasContratosPersonal( param_Elegimos : Boolean;
                                                     param_Solo_Ver : Boolean;
                                                     param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 230 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_personal_contratos_familias_000, form_personal_contratos_familias_000 );

    // form_personal_contratos_familias_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_personal_contratos_familias_000.public_Solo_Ver                   := param_Solo_Ver;
    form_personal_contratos_familias_000.public_Elegimos                   := param_Elegimos;
    form_personal_contratos_familias_000.public_Menu_Worked                := 230;

    form_personal_contratos_familias_000.para_Empezar;

    form_personal_contratos_familias_000.ShowModal;

    if form_personal_contratos_familias_000.public_Rgtro_Seleccionado = true then
    begin
      with form_personal_contratos_familias_000.SQLQuery_Personal_Contratos_Familias do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',
                                                FieldByName('descripcion').AsString,
                                                '',
                                                '' );
      end;
    end;

    form_personal_contratos_familias_000.Free;
  end;
end;

function UTI_Abrir_Modulo_ContratosPersonal( param_Elegimos : Boolean;
                                             param_Solo_Ver : Boolean;
                                             param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 240 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_personal_contratos_000, form_personal_contratos_000 );

    // form_personal_contratos_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_personal_contratos_000.public_Solo_Ver                   := param_Solo_Ver;
    form_personal_contratos_000.public_Elegimos                   := param_Elegimos;
    form_personal_contratos_000.public_Menu_Worked                := 240;

    form_personal_contratos_000.para_Empezar;

    form_personal_contratos_000.ShowModal;

    if form_personal_contratos_000.public_Rgtro_Seleccionado = true then
    begin
      with form_personal_contratos_000.SQLQuery_Personal_Contratos do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',
                                                FieldByName('OT_Descripcion_Contrato').AsString,
                                                '',
                                                '' );
      end;
    end;

    form_personal_contratos_000.Free;
  end;
end;

function UTI_Abrir_Modulo_Empresas( param_Elegimos : Boolean;
                                    param_Solo_Ver : Boolean;
                                    param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 250 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_empresas_000, form_empresas_000 );

    // form_empresas_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_empresas_000.public_Solo_Ver                   := param_Solo_Ver;
    form_empresas_000.public_Elegimos                   := param_Elegimos;
    form_empresas_000.public_Menu_Worked                := 250;

    form_empresas_000.para_Empezar;

    form_empresas_000.ShowModal;

    if form_empresas_000.public_Rgtro_Seleccionado = true then
    begin
      with form_empresas_000.SQLQuery_Empresas do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',
                                                FieldByName('nombre_comercial').AsString,
                                                '',
                                                '' );
      end;
    end;

    form_empresas_000.Free;
  end;
end;

function UTI_Abrir_Modulo_FamiliasGastos( param_Elegimos : Boolean;
                                          param_Solo_Ver : Boolean;
                                          param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 270 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_gastos_tipos_000, form_gastos_tipos_000 );

    // form_gastos_tipos_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_gastos_tipos_000.public_Solo_Ver                   := param_Solo_Ver;
    form_gastos_tipos_000.public_Elegimos                   := param_Elegimos;
    form_gastos_tipos_000.public_Menu_Worked                := 270;

    form_gastos_tipos_000.para_Empezar;

    form_gastos_tipos_000.ShowModal;

    if form_gastos_tipos_000.public_Rgtro_Seleccionado = true then
    begin
      with form_gastos_tipos_000.SQLQuery_Gastos_Tipos do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',
                                                FieldByName('descripcion').AsString,
                                                '',
                                                '' );
      end;
    end;

    form_gastos_tipos_000.Free;
  end;
end;

function UTI_Abrir_Modulo_OfertasArticulos( param_Elegimos : Boolean;
                                            param_Solo_Ver : Boolean;
                                            param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 300 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_articulos_ofertas_000, form_articulos_ofertas_000 );

    // form_articulos_ofertas_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_articulos_ofertas_000.public_Solo_Ver                   := param_Solo_Ver;
    form_articulos_ofertas_000.public_Elegimos                   := param_Elegimos;
    form_articulos_ofertas_000.public_Menu_Worked                := 300;

    form_articulos_ofertas_000.para_Empezar;

    form_articulos_ofertas_000.ShowModal;

    if form_articulos_ofertas_000.public_Rgtro_Seleccionado = true then
    begin
      with form_articulos_ofertas_000.SQLQuery_AO do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',
                                                FieldByName('descripcion').AsString,
                                                '',
                                                '' );
      end;
    end;

    form_articulos_ofertas_000.Free;
  end;
end;

function UTI_Abrir_Modulo_ConceptosPorTraspasoAlmacen( param_Elegimos : Boolean;
                                                       param_Solo_Ver : Boolean;
                                                       param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 290 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_conceptos_almacen_traspaso_000, form_conceptos_almacen_traspaso_000 );

    // form_conceptos_almacen_traspaso_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_conceptos_almacen_traspaso_000.public_Solo_Ver                   := param_Solo_Ver;
    form_conceptos_almacen_traspaso_000.public_Elegimos                   := param_Elegimos;
    form_conceptos_almacen_traspaso_000.public_Menu_Worked                := 290;

    form_conceptos_almacen_traspaso_000.para_Empezar;

    form_conceptos_almacen_traspaso_000.ShowModal;

    if form_conceptos_almacen_traspaso_000.public_Rgtro_Seleccionado = true then
    begin
      with form_conceptos_almacen_traspaso_000.SQLQuery_Conceptos_Almacen_Traspaso do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',
                                                FieldByName('descripcion').AsString,
                                                '',
                                                '' );
      end;
    end;

    form_conceptos_almacen_traspaso_000.Free;
  end;
end;

function UTI_Abrir_Modulo_CtasPagosCobros( param_Elegimos : Boolean;
                                           param_Solo_Ver : Boolean;
                                           param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 280 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_cuentas_pagos_cobros_000, form_cuentas_pagos_cobros_000 );

    // form_cuentas_pagos_cobros_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_cuentas_pagos_cobros_000.public_Solo_Ver                   := param_Solo_Ver;
    form_cuentas_pagos_cobros_000.public_Elegimos                   := param_Elegimos;
    form_cuentas_pagos_cobros_000.public_Menu_Worked                := 280;

    form_cuentas_pagos_cobros_000.para_Empezar;

    form_cuentas_pagos_cobros_000.ShowModal;

    if form_cuentas_pagos_cobros_000.public_Rgtro_Seleccionado = true then
    begin
      with form_cuentas_pagos_cobros_000.SQLQuery_Cuentas_Pagos_Cobros do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',
                                                FieldByName('descripcion').AsString,
                                                '',
                                                '' );
      end;
    end;

    form_cuentas_pagos_cobros_000.Free;
  end;
end;

function UTI_Abrir_Modulo_Medios( param_Elegimos : Boolean;
                                  param_Solo_Ver : Boolean;
                                  param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 10 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( TForm_medios_000, Form_medios_000 );

    // Form_medios_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    Form_medios_000.public_Solo_Ver                   := param_Solo_Ver;
    Form_medios_000.public_Elegimos                   := param_Elegimos;
    Form_medios_000.public_Menu_Worked                := 10;

    Form_medios_000.para_Empezar;

    Form_medios_000.ShowModal;

    if Form_medios_000.public_Rgtro_Seleccionado = true then
    begin
      with Form_medios_000.SQLQuery_Medios do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',
                                                FieldByName('Descripcion').AsString,
                                                '',
                                                '' );
      end;
    end;

    Form_medios_000.Free;
  end;
end;

function UTI_Abrir_Modulo_Poblaciones( param_Elegimos : Boolean;
                                       param_Solo_Ver : Boolean;
                                       param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 110 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_poblaciones_000, form_poblaciones_000 );

    // form_poblaciones_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_poblaciones_000.public_Solo_Ver                   := param_Solo_Ver;
    form_poblaciones_000.public_Elegimos                   := param_Elegimos;
    form_poblaciones_000.public_Menu_Worked                := 110;

    form_poblaciones_000.para_Empezar;

    form_poblaciones_000.ShowModal;

    if form_poblaciones_000.public_Rgtro_Seleccionado = true then
    begin
      with form_poblaciones_000.SQLQuery_Poblaciones do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                FieldByName('id_provincias').AsString,
                                                FieldByName('id_paises').AsString,
                                                FieldByName('descripcion').AsString,
                                                FieldByName('OT_descripcion_provincia').AsString,
                                                FieldByName('OT_descripcion_pais').AsString );
      end;
    end;

    form_poblaciones_000.Free;
  end;
end;

function UTI_Abrir_Modulo_FormasPago( param_Elegimos : Boolean;
                                      param_Solo_Ver : Boolean;
                                      param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 80 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_formas_pago_000, form_formas_pago_000 );

    // form_formas_pago_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_formas_pago_000.public_Solo_Ver                   := param_Solo_Ver;
    form_formas_pago_000.public_Elegimos                   := param_Elegimos;
    form_formas_pago_000.public_Menu_Worked                := 80;

    form_formas_pago_000.para_Empezar;

    form_formas_pago_000.ShowModal;

    if form_formas_pago_000.public_Rgtro_Seleccionado = true then
    begin
      with form_formas_pago_000.SQLQuery_Formas_Pago do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                FieldByName('Vencimientos_Cantidad').AsString,
                                                FieldByName('Vencimientos_1_Dias').AsString,
                                                FieldByName('descripcion').AsString,
                                                FieldByName('Vencimientos_Dias_Entre').AsString,
                                                '' );
      end;
    end;

    form_formas_pago_000.Free;
  end;
end;

function UTI_Abrir_Modulo_GruposDeCocina( param_Elegimos : Boolean;
                                          param_Solo_Ver : Boolean;
                                          param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 180 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_grupos_cocina_000, form_grupos_cocina_000 );

    // form_grupos_cocina_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_grupos_cocina_000.public_Solo_Ver                   := param_Solo_Ver;
    form_grupos_cocina_000.public_Elegimos                   := param_Elegimos;
    form_grupos_cocina_000.public_Menu_Worked                := 180;

    form_grupos_cocina_000.para_Empezar;

    form_grupos_cocina_000.ShowModal;

    if form_grupos_cocina_000.public_Rgtro_Seleccionado = true then
    begin
      with form_grupos_cocina_000.SQLQuery_Grupos_Cocina do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',
                                                FieldByName('descripcion').AsString,
                                                '',
                                                '' );
      end;
    end;

    form_grupos_cocina_000.Free;
  end;
end;

function UTI_Abrir_Modulo_Paises( param_Elegimos : Boolean;
                                  param_Solo_Ver : Boolean;
                                  param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 60 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_paises_000, form_paises_000 );

    // form_paises_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_paises_000.public_Solo_Ver                   := param_Solo_Ver;
    form_paises_000.public_Elegimos                   := param_Elegimos;
    form_paises_000.public_Menu_Worked                := 60;

    form_paises_000.para_Empezar;

    form_paises_000.ShowModal;

    if form_paises_000.public_Rgtro_Seleccionado = true then
    begin
      with form_paises_000.SQLQuery_Paises do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',
                                                FieldByName('descripcion').AsString,
                                                '',
                                                '' );
      end;
    end;

    form_paises_000.Free;
  end;
end;

function UTI_Abrir_Modulo_Provincias( param_Elegimos : Boolean;
                                      param_Solo_Ver : Boolean;
                                      param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 100 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_provincias_000, form_provincias_000 );

    // form_provincias_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_provincias_000.public_Solo_Ver                   := param_Solo_Ver;
    form_provincias_000.public_Elegimos                   := param_Elegimos;
    form_provincias_000.public_Menu_Worked                := 100;

    form_provincias_000.para_Empezar;

    form_provincias_000.ShowModal;

    if form_provincias_000.public_Rgtro_Seleccionado = true then
    begin
      with form_provincias_000.SQLQuery_Provincias do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                FieldByName('id_paises').AsString,
                                                '',
                                                FieldByName('descripcion').AsString,
                                                FieldByName('OT_descripcion_pais').AsString,
                                                '' );
      end;
    end;

    form_provincias_000.Free;
  end;
end;

function UTI_Abrir_Modulo_Representantes( param_Elegimos : Boolean;
                                          param_Solo_Ver : Boolean;
                                          param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 130 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_representantes_000, form_representantes_000 );

    // form_representantes_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_representantes_000.public_Solo_Ver                   := param_Solo_Ver;
    form_representantes_000.public_Elegimos                   := param_Elegimos;
    form_representantes_000.public_Menu_Worked                := 130;

    form_representantes_000.para_Empezar;

    form_representantes_000.ShowModal;

    if form_representantes_000.public_Rgtro_Seleccionado = true then
    begin
      with form_representantes_000.SQLQuery_Representantes do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                FieldByName('Comision').AsString,
                                                FieldByName('Retencion').AsString,

                                                FieldByName('nombre_propietario').AsString,
                                                FieldByName('Tfno_Fijo_1').AsString,
                                                FieldByName('Movil').AsString );
      end;
    end;

    form_representantes_000.Free;
  end;
end;

function UTI_Abrir_Modulo_TiposProveedores( param_Elegimos : Boolean;
                                            param_Solo_Ver : Boolean;
                                            param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 140 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tform_proveedores_tipos_000, form_proveedores_tipos_000 );

    // form_proveedores_tipos_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    form_proveedores_tipos_000.public_Solo_Ver                   := param_Solo_Ver;
    form_proveedores_tipos_000.public_Elegimos                   := param_Elegimos;
    form_proveedores_tipos_000.public_Menu_Worked                := 140;

    form_proveedores_tipos_000.para_Empezar;

    form_proveedores_tipos_000.ShowModal;

    if form_proveedores_tipos_000.public_Rgtro_Seleccionado = true then
    begin
      with form_proveedores_tipos_000.SQLQuery_Proveedores_Tipos do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',
                                                FieldByName('descripcion').AsString,
                                                FieldByName('Cuenta_Contable').AsString,
                                                FieldByName('Cuenta_Contable').AsString );
      end;
    end;

    form_proveedores_tipos_000.Free;
  end;
end;

function UTI_Abrir_Modulo_Reportes( p_Filtros                        : AnsiString;
                                    p_OrderBy                        : AnsiString;
                                    param_Elegimos                   : Boolean;
                                    param_Solo_Ver                   : Boolean;
                                    param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 700 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tf_reportes_000, f_reportes_000 );

    f_reportes_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    f_reportes_000.public_Solo_Ver                   := param_Solo_Ver;
    f_reportes_000.public_Elegimos                   := param_Elegimos;
    f_reportes_000.public_Menu_Worked                := 700;

    f_reportes_000.para_Empezar( p_Filtros, p_OrderBy );
    f_reportes_000.ShowModal;

    if f_reportes_000.public_Rgtro_Seleccionado = true then
    begin
      with f_reportes_000.SQLQuery_Principal do
      begin
        Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                              FieldByName('id_menus').AsString,
                                              '',
                                              FieldByName('nombre_fichero').AsString,
                                              FieldByName('descripcion').AsString,
                                              '' );
      end;
    end;

    f_reportes_000.Free;
  end;
end;

function UTI_Abrir_Modulo_Clientes( p_Filtros                        : AnsiString;
                                    p_OrderBy                        : AnsiString;
                                    param_Elegimos                   : Boolean;
                                    param_Solo_Ver                   : Boolean;
                                    param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 50 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tf_clientes_000, f_clientes_000 );

    f_clientes_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    f_clientes_000.public_Solo_Ver                   := param_Solo_Ver;
    f_clientes_000.public_Elegimos                   := param_Elegimos;
    f_clientes_000.public_Menu_Worked                := 50;

    f_clientes_000.para_Empezar( p_Filtros, p_OrderBy );
    f_clientes_000.ShowModal;

    if f_clientes_000.public_Rgtro_Seleccionado = true then
    begin
      with f_clientes_000.SQLQuery_Principal do
      begin
        Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                              FieldByName('id_Agencias_Transporte').AsString,
                                              '',
                                              FieldByName('nombre_propietario').AsString,
                                              FieldByName('nombre_comercial').AsString,
                                              FieldByName('Cuenta_Contable').AsString );
      end;
    end;

    f_clientes_000.Free;
  end;
end;

function UTI_Abrir_Modulo_Clientes_Tipos( p_Filtros                        : AnsiString;
                                          p_OrderBy                        : AnsiString;
                                          param_Elegimos                   : Boolean;
                                          param_Solo_Ver                   : Boolean;
                                          param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 70 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tf_clientes_tipos_000, f_clientes_tipos_000 );

    f_clientes_tipos_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    f_clientes_tipos_000.public_Solo_Ver                   := param_Solo_Ver;
    f_clientes_tipos_000.public_Elegimos                   := param_Elegimos;
    f_clientes_tipos_000.public_Menu_Worked                := 70;

    f_clientes_tipos_000.para_Empezar( p_Filtros, p_OrderBy );
    f_clientes_tipos_000.ShowModal;

    if f_clientes_tipos_000.public_Rgtro_Seleccionado = true then
    begin
      with f_clientes_tipos_000.SQLQuery_Principal do
      begin
        Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                              '',
                                              '',
                                              FieldByName('descripcion').AsString,
                                              FieldByName('Cuenta_Contable').AsString,
                                              FieldByName('Cuenta_Contable').AsString );
      end;
    end;

    f_clientes_tipos_000.Free;
  end;
end;

function UTI_Abrir_Modulo_Actividades( p_Filtros                        : AnsiString;
                                       p_OrderBy                        : AnsiString;
                                       param_Elegimos                   : Boolean;
                                       param_Solo_Ver                   : Boolean;
                                       param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 500 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tf_actividades_000, f_actividades_000 );

    f_actividades_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    f_actividades_000.public_Solo_Ver                   := param_Solo_Ver;
    f_actividades_000.public_Elegimos                   := param_Elegimos;
    f_actividades_000.public_Menu_Worked                := 500;

    f_actividades_000.para_Empezar( p_Filtros, p_OrderBy );
    f_actividades_000.ShowModal;

    if f_actividades_000.public_Rgtro_Seleccionado = true then
    begin
      with f_actividades_000.SQLQuery_Principal do
      begin
        Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                              '',
                                              '',
                                              FieldByName('descripcion').AsString,
                                              '',
                                              '' );
      end;
    end;

    f_actividades_000.Free;
  end;
end;

function UTI_Abrir_Modulo_ServiciosRegulares( p_Filtros                        : AnsiString;
                                              p_OrderBy                        : AnsiString;
                                              param_Elegimos                   : Boolean;
                                              param_Solo_Ver                   : Boolean;
                                              param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 720 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tf_servicios_regulares_000, f_servicios_regulares_000 );

    f_servicios_regulares_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    f_servicios_regulares_000.public_Solo_Ver                   := param_Solo_Ver;
    f_servicios_regulares_000.public_Elegimos                   := param_Elegimos;
    f_servicios_regulares_000.public_Menu_Worked                := 720;

    f_servicios_regulares_000.para_Empezar( p_Filtros, p_OrderBy );
    f_servicios_regulares_000.ShowModal;

    if f_servicios_regulares_000.public_Rgtro_Seleccionado = true then
    begin
      with f_servicios_regulares_000.SQLQuery_Principal do
      begin
        Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                              '',
                                              '',
                                              FieldByName('descripcion').AsString,
                                              '',
                                              '' );
      end;
    end;

    f_servicios_regulares_000.Free;
  end;
end;

function UTI_Abrir_Modulo_ServiciosTipos( p_Filtros                        : AnsiString;
                                          p_OrderBy                        : AnsiString;
                                          param_Elegimos                   : Boolean;
                                          param_Solo_Ver                   : Boolean;
                                          param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 710 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tf_servicios_tipos_000, f_servicios_tipos_000 );

    f_servicios_tipos_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    f_servicios_tipos_000.public_Solo_Ver                   := param_Solo_Ver;
    f_servicios_tipos_000.public_Elegimos                   := param_Elegimos;
    f_servicios_tipos_000.public_Menu_Worked                := 710;

    f_servicios_tipos_000.para_Empezar( p_Filtros, p_OrderBy );
    f_servicios_tipos_000.ShowModal;

    if f_servicios_tipos_000.public_Rgtro_Seleccionado = true then
    begin
      with f_servicios_tipos_000.SQLQuery_Principal do
      begin
        Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                              '',
                                              '',
                                              FieldByName('descripcion').AsString,
                                              '',
                                              '' );
      end;
    end;

    f_servicios_tipos_000.Free;
  end;
end;

function UTI_Abrir_Modulo_ServiciosSeries( p_Filtros                        : AnsiString;
                                           p_OrderBy                        : AnsiString;
                                           param_Elegimos                   : Boolean;
                                           param_Solo_Ver                   : Boolean;
                                           param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 730 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tf_series_servicios_000, f_series_servicios_000 );

    f_series_servicios_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    f_series_servicios_000.public_Solo_Ver                   := param_Solo_Ver;
    f_series_servicios_000.public_Elegimos                   := param_Elegimos;
    f_series_servicios_000.public_Menu_Worked                := 730;

    f_series_servicios_000.para_Empezar( p_Filtros, p_OrderBy );
    f_series_servicios_000.ShowModal;

    if f_series_servicios_000.public_Rgtro_Seleccionado = true then
    begin
      with f_series_servicios_000 do
      begin
        Result := UTI_Guardar_Datos_Registro( SQLQuery_Principalid.AsString,
                                              SQLQuery_Principalid_empresas.AsString,
                                              SQLQuery_Principalsubcuenta_ventas.AsString,
                                              SQLQuery_Principaldescripcion.AsString,
                                              SQLQuery_Principalserie_codigo.AsString,
                                              SQLQuery_Principalnumero_siguiente.AsString );
      end;
    end;

    f_series_servicios_000.Free;
  end;
end;

function UTI_Abrir_Modulo_Almacenes( p_Filtros                        : AnsiString;
                                     p_OrderBy                        : AnsiString;
                                     param_Elegimos                   : Boolean;
                                     param_Solo_Ver                   : Boolean;
                                     param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 260 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tf_almacenes_000, f_almacenes_000 );

    f_almacenes_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    f_almacenes_000.public_Solo_Ver                   := param_Solo_Ver;
    f_almacenes_000.public_Elegimos                   := param_Elegimos;
    f_almacenes_000.public_Menu_Worked                := 260;

    f_almacenes_000.para_Empezar( p_Filtros, p_OrderBy );
    f_almacenes_000.ShowModal;

    if f_almacenes_000.public_Rgtro_Seleccionado = true then
    begin
      with f_almacenes_000.SQLQuery_Principal do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',
                                                FieldByName('descripcion').AsString,
                                                '',
                                                '' );
      end;
    end;

    f_almacenes_000.Free;
  end;
end;

function UTI_Abrir_Modulo_CuentasBancos( p_Filtros                        : AnsiString;
                                         p_OrderBy                        : AnsiString;
                                         param_Elegimos                   : Boolean;
                                         param_Solo_Ver                   : Boolean;
                                         param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 310 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tf_bancos_ctas_empresas_000, f_bancos_ctas_empresas_000 );

    f_bancos_ctas_empresas_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    f_bancos_ctas_empresas_000.public_Solo_Ver                   := param_Solo_Ver;
    f_bancos_ctas_empresas_000.public_Elegimos                   := param_Elegimos;
    f_bancos_ctas_empresas_000.public_Menu_Worked                := 310;

    f_bancos_ctas_empresas_000.para_Empezar( p_Filtros, p_OrderBy );
    f_bancos_ctas_empresas_000.ShowModal;

    if f_bancos_ctas_empresas_000.public_Rgtro_Seleccionado = true then
    begin
      with f_bancos_ctas_empresas_000.SQLQuery_Principal do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',
                                                FieldByName('descripcion').AsString,
                                                '',
                                                '' );
      end;
    end;

    f_bancos_ctas_empresas_000.Free;
  end;
end;

function UTI_Abrir_Modulo_MovimientosAlmacen( p_Filtros                        : AnsiString;
                                              p_OrderBy                        : AnsiString;
                                              param_Elegimos                   : Boolean;
                                              param_Solo_Ver                   : Boolean;
                                              param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 320 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tf_almacenes_movimientos_000, f_almacenes_movimientos_000 );

    f_almacenes_movimientos_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    f_almacenes_movimientos_000.public_Solo_Ver                   := param_Solo_Ver;
    f_almacenes_movimientos_000.public_Elegimos                   := param_Elegimos;
    f_almacenes_movimientos_000.public_Menu_Worked                := 320;

    f_almacenes_movimientos_000.para_Empezar( p_Filtros, p_OrderBy );
    f_almacenes_movimientos_000.ShowModal;

    if f_almacenes_movimientos_000.public_Rgtro_Seleccionado = true then
    begin
      with f_almacenes_movimientos_000.SQLQuery_Principal do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',
                                                '',
                                                '',
                                                '' );
      end;
    end;

    f_almacenes_movimientos_000.Free;
  end;
end;

function UTI_Abrir_Modulo_Impresoras( p_Filtros                        : AnsiString;
                                      p_OrderBy                        : AnsiString;
                                      param_Elegimos                   : Boolean;
                                      param_Solo_Ver                   : Boolean;
                                      param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 190 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tf_impresoras_000, f_impresoras_000 );

    f_impresoras_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    f_impresoras_000.public_Solo_Ver                   := param_Solo_Ver;
    f_impresoras_000.public_Elegimos                   := param_Elegimos;
    f_impresoras_000.public_Menu_Worked                := 190;

    f_impresoras_000.para_Empezar( p_Filtros, p_OrderBy );
    f_impresoras_000.ShowModal;

    if f_impresoras_000.public_Rgtro_Seleccionado = true then
    begin
      with f_impresoras_000.SQLQuery_Principal do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',
                                                FieldByName('descripcion').AsString,
                                                '',
                                                '' );
      end;
    end;

    f_impresoras_000.Free;
  end;
end;

function UTI_Abrir_Modulo_Impuestos( p_Filtros                        : AnsiString;
                                     p_OrderBy                        : AnsiString;
                                     param_Elegimos                   : Boolean;
                                     param_Solo_Ver                   : Boolean;
                                     param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 200 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tf_impuestos_000, f_impuestos_000 );

    f_impuestos_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    f_impuestos_000.public_Solo_Ver                   := param_Solo_Ver;
    f_impuestos_000.public_Elegimos                   := param_Elegimos;
    f_impuestos_000.public_Menu_Worked                := 200;

    f_impuestos_000.para_Empezar( p_Filtros, p_OrderBy );
    f_impuestos_000.ShowModal;

    if f_impuestos_000.public_Rgtro_Seleccionado = true then
    begin
      with f_impuestos_000.SQLQuery_Principal do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',
                                                FieldByName('descripcion').AsString,
                                                '',
                                                '' );
      end;
    end;

    f_impuestos_000.Free;
  end;
end;

function UTI_Abrir_Modulo_Terminales( p_Filtros                        : AnsiString;
                                      p_OrderBy                        : AnsiString;
                                      param_Elegimos                   : Boolean;
                                      param_Solo_Ver                   : Boolean;
                                      param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 160 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tf_terminales_000, f_terminales_000 );

    f_terminales_000.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    f_terminales_000.public_Solo_Ver                   := param_Solo_Ver;
    f_terminales_000.public_Elegimos                   := param_Elegimos;
    f_terminales_000.public_Menu_Worked                := 160;

    f_terminales_000.para_Empezar( p_Filtros, p_OrderBy );
    f_terminales_000.ShowModal;

    if f_terminales_000.public_Rgtro_Seleccionado = true then
    begin
      with f_terminales_000.SQLQuery_Principal do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',
                                                FieldByName('descripcion').AsString,
                                                '',
                                                '' );
      end;
    end;

    f_terminales_000.Free;
  end;
end;

function UTI_Abrir_Modulo_Elegir_Impuestos( p_Filtros                                   : AnsiString;
                                            p_OrderBy                                   : AnsiString;
                                            param_Elegimos                              : Boolean;
                                            param_Solo_Ver                              : Boolean;
                                            param_id_impuesto_que_no_tiene_que_aparecer : String;
                                            param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 201 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tf_elegir_impuestos, f_elegir_impuestos );


    f_elegir_impuestos.public_id_impuesto_que_no_tiene_que_aparecer := param_id_impuesto_que_no_tiene_que_aparecer;

    f_elegir_impuestos.public_hacemos_commit_alFinalizar            := param_hacemos_commit_alFinalizar;
    f_elegir_impuestos.public_Solo_Ver                              := param_Solo_Ver;
    f_elegir_impuestos.public_Elegimos                              := param_Elegimos;
    f_elegir_impuestos.public_Menu_Worked                           := 201;

    f_elegir_impuestos.para_Empezar( p_Filtros, p_OrderBy );
    f_elegir_impuestos.ShowModal;

    if f_elegir_impuestos.public_Rgtro_Seleccionado = true then
    begin
      with f_elegir_impuestos.SQLQuery_Principal do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',

                                                FieldByName('descripcion').AsString,
                                                FieldByName('Tanto_Por_Ciento').AsString,
                                                FieldByName('Sumado_A_Ftra_SN').AsString );
      end;
    end;

    f_elegir_impuestos.Free;
  end;
end;

function UTI_Abrir_Modulo_Elegir_cliente_contacto( p_Filtros                        : AnsiString;
                                                   p_OrderBy                        : AnsiString;
                                                   param_Elegimos                   : Boolean;
                                                   param_Solo_Ver                   : Boolean;
                                                   param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 51 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tf_elegir_cliente_contacto, f_elegir_cliente_contacto );

    f_elegir_cliente_contacto.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    f_elegir_cliente_contacto.public_Solo_Ver                   := param_Solo_Ver;
    f_elegir_cliente_contacto.public_Elegimos                   := param_Elegimos;
    f_elegir_cliente_contacto.public_Menu_Worked                := 51;

    f_elegir_cliente_contacto.para_Empezar( p_Filtros, p_OrderBy );
    f_elegir_cliente_contacto.ShowModal;

    if f_elegir_cliente_contacto.public_Rgtro_Seleccionado = true then
    begin
      with f_elegir_cliente_contacto.SQLQuery_Principal do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',
                                                FieldByName('nombre').AsString,
                                                '',
                                                '' );
      end;
    end;

    f_elegir_cliente_contacto.Free;
  end;
end;

function UTI_Abrir_Modulo_Elegir_cliente_Direccion_Envio( p_Filtros                        : AnsiString;
                                                          p_OrderBy                        : AnsiString;
                                                          param_Elegimos                   : Boolean;
                                                          param_Solo_Ver                   : Boolean;
                                                          param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 52 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tf_elegir_cliente_direccion_envio, f_elegir_cliente_direccion_envio );

    f_elegir_cliente_direccion_envio.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    f_elegir_cliente_direccion_envio.public_Solo_Ver                   := param_Solo_Ver;
    f_elegir_cliente_direccion_envio.public_Elegimos                   := param_Elegimos;
    f_elegir_cliente_direccion_envio.public_Menu_Worked                := 52;

    f_elegir_cliente_direccion_envio.para_Empezar( p_Filtros, p_OrderBy );
    f_elegir_cliente_direccion_envio.ShowModal;

    if f_elegir_cliente_direccion_envio.public_Rgtro_Seleccionado = true then
    begin
      with f_elegir_cliente_direccion_envio.SQLQuery_Principal do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',

                                                FieldByName('descripcion').AsString,
                                                '',
                                                '' );
      end;
    end;

    f_elegir_cliente_direccion_envio.Free;
  end;
end;

function UTI_Abrir_Modulo_Elegir_Diario_Tipo( p_Filtros                        : AnsiString;
                                              p_OrderBy                        : AnsiString;
                                              param_Elegimos                   : Boolean;
                                              param_Solo_Ver                   : Boolean;
                                              param_hacemos_commit_alFinalizar : String ) : TRecord_Rgtro_Comun;
begin
  if UTI_Abrir_Modulo_SN( 740 ) = true then
  begin
    Result.id_1 := ''; // Para confirmar que no hemos elegido ningún registro

    Application.CreateForm( Tf_elegir_diarios_tipos, f_elegir_diarios_tipos );

    f_elegir_diarios_tipos.public_hacemos_commit_alFinalizar := param_hacemos_commit_alFinalizar;
    f_elegir_diarios_tipos.public_Solo_Ver                   := param_Solo_Ver;
    f_elegir_diarios_tipos.public_Elegimos                   := param_Elegimos;
    f_elegir_diarios_tipos.public_Menu_Worked                := 740;

    f_elegir_diarios_tipos.para_Empezar( p_Filtros, p_OrderBy );
    f_elegir_diarios_tipos.ShowModal;

    if f_elegir_diarios_tipos.public_Rgtro_Seleccionado = true then
    begin
      with f_elegir_diarios_tipos.SQLQuery_Principal do
      begin
          Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                '',
                                                '',
                                                FieldByName('OT_Direccion_Entera').AsString,
                                                '',
                                                '' );
      end;
    end;

    f_elegir_diarios_tipos.Free;
  end;
end;

end.


