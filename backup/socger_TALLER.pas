program socger_TALLER;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, printer4lazarus, datetimectrls, lazcontrols, runtimetypeinfocontrols, peliculas_000,
  dm_pelis, utilidades_bd, utilidades_usuarios, utilidades_ini, utilidades_general, avisos,
  peliculas_001, menu, estado_registro, dm_medios, filtrar_registros, utilidades_rgtro,
  utilidades_forms_Filtrar, medios_000, informe, medios_001, users_000, dm_users, users_001,
  arrancar, users_002, users_003, users_004, dm_menus, menus_000, menus_001, dm_historico_registros,
  AskByPwd, paises_000, dm_paises, paises_001, formas_pago_000, dm_formas_pago, formas_pago_001,
  dm_tarifas, provincias_000, dm_Provincias, provincias_001, poblaciones_000, dm_poblaciones,
  poblaciones_001, representantes_000, dm_representantes, representantes_001, proveedores_000,
  dm_proveedores, proveedores_001, proveedores_002, proveedores_tipos_000, dm_proveedores_tipos,
  proveedores_tipos_001, articulos_familias_000, dm_articulos_familias, articulos_familias_001,
  articulos_familias_002, articulos_familias_003, articulos_familias_005, articulos_001,
  dm_articulos_no_subfamilias, dm_cliente_elegir_contacto, articulos_000, dm_articulos, dm_empresas,
  opciones_impresion, articulos_003, articulos_002, articulos_004, articulos_005, articulos_006,
  grupos_cocina_000, dm_grupos_cocina, grupos_cocina_001, articulos_007, dm_articulos_elegir,
  personal_familias_000, dm_personal_familias, personal_familias_001, personal_familias_002,
  dm_personal_no_subfamilias, personal_000, dm_personal, personal_001, gastos_tipos_001,
  personal_contratos_familias_001, dm_personal_contratos_familias, personal_contratos_familias_000,
  dm_personal_contratos, personal_contratos_000, personal_contratos_001, empresas_000, empresas_001,
  gastos_tipos_000, dm_gastos_tipos, cuentas_pagos_cobros_000, dm_cuentas_pagos_cobros, users_006,
  cuentas_pagos_cobros_001, conceptos_almacen_traspaso_000, dm_conceptos_almacen_traspaso,
  conceptos_almacen_traspaso_001, articulos_ofertas_000, dm_articulos_ofertas, users_005, dm_vehiculos,
  articulos_ofertas_001, articulos_ofertas_002, articulos_ofertas_003, dm_albaranes_ventas,
  utilidades_datos_tablas, utilidades_impuestos, utilidades_ventas, dm_Users_Elegir, albaranes_ventas_001,
  albaranes_ventas_000, empresas_002, vehiculos_001, vehiculos_000, vehiculos_tipos_000, vehiculos_tipos_001,
  dm_vehiculos_tipos, vehiculos_marcas_000, dm_vehiculos_marcas, vehiculos_marcas_001, combustibles_000,
  combustibles_001, dm_combustibles, dm_vehiculos_tipo_cambios, vehiculos_tipo_cambios_000,
  vehiculos_tipo_cambios_001, dm_vehiculos_tipo_ruedas, vehiculos_tipo_ruedas_000, vehiculos_tipo_ruedas_001,
  dm_tarjetas_transporte, tarjetas_transporte_000, tarjetas_transporte_001, proveedores_003,
  dm_proveedor_elegir_contacto, albaranes_ventas_002, vehiculos_002, dm_vehiculos_equipamientos,
  vehiculos_equipamientos_000, vehiculos_equipamientos_001, dm_cliente_elegir_direccion_envio,
  proveedores_004, dm_proveedores_elegir, articulos_008,
  presupuestos_ventas_000, dm_presupuestos_ventas, presupuestos_ventas_001,
  presupuestos_ventas_002, dm_pedidos_ventas, pedidos_ventas_000,
  pedidos_ventas_001, pedidos_ventas_002, dm_empresas_elegir, configuracion_001,
  configuracion_000, dm_configuracion, dm_visitas_tipos, visitas_tipos_000,
  visitas_tipos_001, dm_visitas_resultados, visitas_resultados_000,
  visitas_resultados_001, visitas_000, dm_visitas, visitas_001, rutas_000,
  rutas_001, dm_rutas, visitas_por_zona_000,
  dm_visitas_por_zona, visitas_por_provincia_000, dm_visitas_por_provincia,
  visitas_por_cliente_000, dm_visitas_por_cliente, visitas_por_tipo_cliente_000,
  dm_visitas_por_tipo_cliente, visitas_por_actividad_000,
  dm_visitas_por_actividad, visitas_por_representante_000,
  dm_visitas_por_representante, visitas_planificacion_por_zona_000,
  dm_visitas_planificacion_por_zona, visitas_planificacion_por_provincia_000,
  dm_visitas_planificacion_por_provincia, dm_facturas_ventas,
  pedidos_ventas_003, albaranes_ventas_003, facturas_ventas_000,
  facturas_ventas_001, facturas_ventas_002, facturas_ventas_003,
  facturas_ventas_004, facturas_ventas_005, Translations, barra_progreso,
  facturas_ventas_006, margenes_tarifas_000, dm_margenes_tarifas,
  margenes_tarifas_001, tarifas_000, tarifas_001, tarifas_002, articulos_009,
  dm_presupuestos_compras, presupuestos_compras_000, presupuestos_compras_001,
  presupuestos_compras_002, pedidos_compras_000, dm_pedidos_compras,
  pedidos_compras_001, pedidos_compras_002, dm_albaranes_compras,
  albaranes_compras_000, albaranes_compras_001, albaranes_compras_002,
  facturas_compras_000, dm_facturas_compras, facturas_compras_006,
  facturas_compras_001, facturas_compras_002, facturas_compras_005,
  utilidades_000, dm_utilidades, utilidades_empresas, utilidades_almacenes,
  articulos_010, dm_articulos_referencias, facturas_cerrar_000,
  dm_facturas_cerrar, facturas_cerrar_001, articulos_ultimas_ventas_000,
  dm_articulos_ultimas_ventas, facturas_compras_004, facturas_ventas_007,

  facturas_compras_007, utilidades_impresoras, utilidades_informes,
  Elija_Ano_Trimestre, plantilla_000, plantilla_detalle_000, reportes_000,
  actividades_000, impuestos_000, elegir_impuestos, almacenes_000,

  almacenes_movimientos_000, almacenes_movimientos_001, impresoras_000,

  terminales_000, servicios_regulares_000, servicios_tipos_000,
  series_servicios_000, elegir_diarios_tipos,
  bancos_ctas_empresas_000, clientes_tipos_000, clientes_000, clientes_001,
  clientes_002, elegir_cliente_contacto, elegir_cliente_direccion_envio,
  servicios_regulares_001, plantilla_001, utilidades_Filtros;

{$R *.res}

begin
  Application.Title:='OpenService';
  TranslateUnitResourceStrings( 'Lr_const',
                                'languages/lr_const.%s.po',
                                'es',
                                '' );

  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(TForm_Arrancar, Form_Arrancar);
  Application.Run;
end.


