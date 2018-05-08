unit utilidades_datos_tablas;

{$mode objfpc}{$H+}

interface

uses
  Classes, Forms, sqldb, SysUtils, utilidades_bd, utilidades_general;

type
    TPersonal = record
        id                               : ShortString;
        id_Empleado_de                   : ShortString;
        nombre                           : ShortString;
        id_personal_familias             : ShortString;
        nif_cif                          : ShortString;
        nif_cif_caducidad                : ShortString;
        Fecha_Nacimiento                 : ShortString;
        Tfno_Fijo_1                      : ShortString;
        Tfno_Fijo_2                      : ShortString;
        FAX                              : ShortString;
        Movil                            : ShortString;
        eMail                            : ShortString;
        Direccion                        : ShortString;
        Direccion_Numero                 : ShortString;
        Direccion_Piso_Letra             : ShortString;
        Codigo_Postal                    : ShortString;
        id_poblaciones                   : ShortString;
        id_provincias                    : ShortString;
        id_paises                        : ShortString;
        Cta_Bco_Entidad                  : ShortString;
        Cta_Bco_Sucursal                 : ShortString;
        Cta_Bco_Digito_Control           : ShortString;
        Cta_Bco_Cuenta                   : ShortString;
        Cta_Bco_IBAN                     : ShortString;
        Cta_Bco_BIC_SWIFT                : ShortString;
        Cta_Bco_Mandato_Fecha_de_Firma   : ShortString;
        Cta_Bco_Mandato_Ref              : ShortString;
        Cta_Bco_Direccion                : ShortString;
        Cta_Bco_Direccion_Numero         : ShortString;
        Cta_Bco_Direccion_Piso_Letra     : ShortString;
        Cta_Bco_Codigo_Postal            : ShortString;
        id_Cta_Bco_poblaciones           : ShortString;
        id_Cta_Bco_provincias            : ShortString;
        id_Cta_Bco_pais                  : ShortString;
        Activar_Proximidad_SN            : ShortString;
        Cuenta_Contable                  : ShortString;
        Observaciones_Comentarios        : ShortString;
        Comision                         : ShortString;
        Controlar_su_Presencia           : ShortString;
        Seguridad_Social                 : ShortString;

        Insert_WHEN                      : ShortString;
        Insert_Id_User                   : ShortString;
        Del_WHEN                         : ShortString;
        Del_Id_User                      : ShortString;
        Del_WHY                          : ShortString;
        Change_WHEN                      : ShortString;
        Change_Id_User                   : ShortString;

        OT_Descripcion_Personal_Familias : ShortString;
        OT_Cuenta_Contable_Personal_tipo : ShortString;
        OT_Descripcion_Empleado_De       : ShortString;
        OT_descripcion_poblacion         : ShortString;
        OT_descripcion_provincia         : ShortString;
        OT_descripcion_pais              : ShortString;
        OT_Cta_Bco_descripcion_poblacion : ShortString;
        OT_Cta_Bco_descripcion_provincia : ShortString;
        OT_Cta_Bco_descripcion_pais      : ShortString;
    end;

type
    TRepresentantes = record
        id                               : String;
        nombre_propietario               : String;
        nombre_comercial                 : String;
        nif_cif                          : String;
        Fecha_Nacimiento                 : String;
        Tfno_Fijo_1                      : String;
        Tfno_Fijo_2                      : String;
        FAX                              : String;
        Movil                            : String;
        eMail                            : String;
        pagina_web                       : String;
        Direccion                        : String;
        Direccion_Numero                 : String;
        Direccion_Piso_Letra             : String;
        Codigo_Postal                    : String;
        id_poblaciones                   : String;
        id_provincias                    : String;
        id_paises                        : String;
        Cta_Bco_Entidad                  : String;
        Cta_Bco_Sucursal                 : String;
        Cta_Bco_Digito_Control           : String;
        Cta_Bco_Cuenta                   : String;
        Cta_Bco_IBAN                     : String;
        Cta_Bco_BIC_SWIFT                : String;
        Cta_Bco_Mandato_Fecha_de_Firma   : String;
        Cta_Bco_Mandato_Ref              : String;
        Cta_Bco_Direccion                : String;
        Cta_Bco_Direccion_Numero         : String;
        Cta_Bco_Direccion_Piso_Letra     : String;
        Cta_Bco_Codigo_Postal            : String;
        id_Cta_Bco_poblaciones           : String;
        id_Cta_Bco_provincias            : String;
        id_Cta_Bco_pais                  : String;
        id_formas_pago                   : String;
        Forma_pago_Dia_1                 : String;
        Forma_pago_Dia_2                 : String;
        Vencimientos_automaticos_SN      : String;
        Forma_pago_Vacaciones_Dia_Inicio : String;
        Forma_pago_Vacaciones_Mes_Inicio : String;
        Forma_pago_Vacaciones_Dia_Fin    : String;
        Forma_pago_Vacaciones_Mes_Fin    : String;
        IVA_con_Recargo_SN               : String;
        IVA_Excluido_SN                  : String;
        Comision                         : String;
        Retencion                        : String;
        Saldo_Acumulado                  : String;
        Activar_Proximidad_SN            : String;
        Cuenta_Contable                  : String;
        Observaciones_Comentarios        : String;

        Insert_WHEN                      : ShortString;
        Insert_Id_User                   : ShortString;
        Del_WHEN                         : ShortString;
        Del_Id_User                      : ShortString;
        Del_WHY                          : String;
        Change_WHEN                      : ShortString;
        Change_Id_User                   : ShortString;

        OT_descripcion_poblacion         : String;
        OT_descripcion_provincia         : String;
        OT_descripcion_pais              : String;
        OT_Cta_Bco_descripcion_poblacion : String;
        OT_Cta_Bco_descripcion_provincia : String;
        OT_Cta_Bco_descripcion_pais      : String;
        OT_descripcion_forma_pago        : String;
        OT_Vencimientos_Cantidad         : ShortString;
        OT_Vencimientos_1_Dias           : ShortString;
        OT_Vencimientos_Dias_Entre       : ShortString;
    end;

type
    Tarticulos_familias = record
        id                                              : String;
        descripcion                                     : String;
        id_articulos_familias                           : String;
        id_grupos_cocina                                : String;
        id_impresoras                                   : String;
        Cuenta_Contable_Ventas                          : String;
        Cuenta_Contable_Compras                         : String;
        Visualizar_en_terminales_SN                     : String;
        Ventas_por_peso_SN                              : String;
        Comision                                        : String;
        Minimo_Variacion_Actualizar_en_tanto_por_ciento : String;

        Insert_WHEN                                     : ShortString;
        Insert_Id_User                                  : ShortString;
        Del_WHEN                                        : ShortString;
        Del_Id_User                                     : ShortString;
        Del_WHY                                         : String;
        Change_WHEN                                     : ShortString;
        Change_Id_User                                  : ShortString;

        OT_descripcion_grupo_cocina                     : ShortString;
        OT_descripcion_impresora_comandas               : ShortString;
        OT_descripcion_familia_superior                 : ShortString;
    end;

type
    TArticulos_Tarifas = record
        id                          : String;
        id_articulos                : String;
        id_tarifas                  : String;
        Importe_Neto                : String;
        Importe_Impuestos_Incluidos : String;
        Descuento                   : String;

        Insert_WHEN                 : ShortString;
        Insert_Id_User              : ShortString;
        Del_WHEN                    : ShortString;
        Del_Id_User                 : ShortString;
        Del_WHY                     : String;
        Change_WHEN                 : ShortString;
        Change_Id_User              : ShortString;

        OT_descripcion_tarifa       : String;
    end;

type
    TUsers = record
        id                        : String;

        Descripcion_Nick          : String;
        Id_Empleados              : ShortString;
        Permiso_Total_SN          : ShortString;
        Tipo                      : ShortString;

        Insert_WHEN               : ShortString;
        Insert_Id_User            : ShortString;
        Del_WHEN                  : ShortString;
        Del_Id_User               : ShortString;
        Del_WHY                   : String;
        Change_WHEN               : ShortString;
        Change_Id_User            : ShortString;
    end;

type
    TRegistro_CRUD = record
        Delete_SQL   : String;
        Update_SQL   : String;
        Insert_SQL   : String;
        SELECT_SQL   : String;
        name_tabla : ShortString;
    end;

type
    TClientes_Envios = record
        id                       : String;
        id_clientes              : ShortString;
        id_clientes_contactos    : ShortString;
        Direccion                : ShortString;
        Direccion_Numero         : ShortString;
        Direccion_Piso_Letra     : ShortString;
        Codigo_Postal            : ShortString;
        id_poblaciones           : ShortString;
        id_provincias            : ShortString;
        id_paises                : ShortString;
        Tfno_Fijo_1              : ShortString;
        Tfno_Fijo_2              : ShortString;
        FAX                      : ShortString;
        Movil                    : ShortString;
        eMail                    : ShortString;
        Portes_Pagados_SN        : ShortString;

        Insert_WHEN              : ShortString;
        Insert_Id_User           : ShortString;
        Del_WHEN                 : ShortString;
        Del_Id_User              : ShortString;
        Del_WHY                  : ShortString;
        Change_WHEN              : ShortString;
        Change_Id_User           : ShortString;

        OT_descripcion_poblacion : ShortString;
        OT_descripcion_provincia : ShortString;
        OT_descripcion_pais      : ShortString;
        OT_descripcion_Contacto  : ShortString;
    end;

type
    TClientes_Contactos = record
        id               : String;
        id_clientes      : ShortString;
        nombre           : ShortString;
        nif_cif          : ShortString;
        Fecha_Nacimiento : ShortString;
        Tfno_Fijo_1      : ShortString;
        Tfno_Fijo_2      : ShortString;
        FAX              : ShortString;
        Movil            : ShortString;
        eMail            : ShortString;
        pagina_web       : ShortString;
        Cargo_Puesto     : ShortString;

        Insert_WHEN      : ShortString;
        Insert_Id_User   : ShortString;
        Del_WHEN         : ShortString;
        Del_Id_User      : ShortString;
        Del_WHY          : ShortString;
        Change_WHEN      : ShortString;
        Change_Id_User   : ShortString;
    end;

type
    TProveedores_Contactos = record
        id               : String;
        id_proveedores   : ShortString;
        nombre           : ShortString;
        nif_cif          : ShortString;
        Fecha_Nacimiento : ShortString;
        Tfno_Fijo_1      : ShortString;
        Tfno_Fijo_2      : ShortString;
        FAX              : ShortString;
        Movil            : ShortString;
        eMail            : ShortString;
        pagina_web       : ShortString;
        Cargo_Puesto     : ShortString;

        Insert_WHEN      : ShortString;
        Insert_Id_User   : ShortString;
        Del_WHEN         : ShortString;
        Del_Id_User      : ShortString;
        Del_WHY          : ShortString;
        Change_WHEN      : ShortString;
        Change_Id_User   : ShortString;
    end;

type
    TClientes = record
        id                                : String;
        nombre_propietario                : ShortString;
        nombre_comercial                  : ShortString;
        nif_cif                           : ShortString;
        Fecha_Nacimiento                  : ShortString;
        Tfno_Fijo_1                       : ShortString;
        Tfno_Fijo_2                       : ShortString;
        FAX                               : ShortString;
        Movil                             : ShortString;
        eMail                             : ShortString;
        pagina_web                        : ShortString;
        Direccion                         : ShortString;
        Direccion_Numero                  : ShortString;
        Direccion_Piso_Letra              : ShortString;
        Codigo_Postal                     : ShortString;
        id_poblaciones                    : ShortString;
        id_provincias                     : ShortString;
        id_paises                         : ShortString;
        id_clientes_tipos                 : ShortString;
        Cta_Bco_Entidad                   : ShortString;
        Cta_Bco_Sucursal                  : ShortString;
        Cta_Bco_Digito_Control            : ShortString;
        Cta_Bco_Cuenta                    : ShortString;
        Cta_Bco_IBAN                      : ShortString;
        Cta_Bco_BIC_SWIFT                 : ShortString;
        Cta_Bco_Mandato_Fecha_de_Firma    : ShortString;
        Cta_Bco_Mandato_Ref               : ShortString;
        Cta_Bco_Direccion                 : ShortString;
        Cta_Bco_Direccion_Numero          : ShortString;
        Cta_Bco_Direccion_Piso_Letra      : ShortString;
        Cta_Bco_Codigo_Postal             : ShortString;
        id_Cta_Bco_poblaciones            : ShortString;
        id_Cta_Bco_provincias             : ShortString;
        id_Cta_Bco_pais                   : ShortString;
        id_formas_pago                    : ShortString;
        Forma_pago_Dia_1                  : ShortString;
        Forma_pago_Dia_2                  : ShortString;
        Vencimientos_automaticos_SN       : ShortString;
        Forma_pago_Vacaciones_Dia_Inicio  : ShortString;
        Forma_pago_Vacaciones_Mes_Inicio  : ShortString;
        Forma_pago_Vacaciones_Dia_Fin     : ShortString;
        Forma_pago_Vacaciones_Mes_Fin     : ShortString;
        IVA_con_Recargo_SN                : ShortString;
        IVA_Excluido_SN                   : ShortString;
        id_tarifas                        : ShortString;
        Descuento_Comercial_1             : ShortString;
        Descuento_Comercial_2             : ShortString;
        Descuento_Pronto_Pago             : ShortString;
        Descuento_Final                   : ShortString;
        Retencion                         : ShortString;
        Riesgo_Autorizado                 : ShortString;
        Riesgo_Acumulado                  : ShortString;
        Agrupar_Albaranes_SN              : ShortString;
        Activar_Proximidad_SN             : ShortString;
        Cuenta_Contable                   : ShortString;
        id_Agencias_Transporte            : ShortString;
        Portes_Pagados_SN                 : ShortString;
        id_Representantes                 : ShortString;
        Observaciones_Comentarios         : ShortString;
        Estudia_SN                        : ShortString;
        Trabaja_SN                        : ShortString;
        Estudios_Trabajos                 : ShortString;
        Cantidad_Hermanos                 : ShortString;
	id_rutas                          : ShortString;
	id_actividades                    : ShortString;

        Insert_WHEN                       : ShortString;
        Insert_Id_User                    : ShortString;
        Del_WHEN                          : ShortString;
        Del_Id_User                       : ShortString;
        Del_WHY                           : ShortString;
        Change_WHEN                       : ShortString;
        Change_Id_User                    : ShortString;

        OT_descripcion_actividad          : ShortString;
        OT_descripcion_ruta               : ShortString;
        OT_descripcion_poblacion          : ShortString;
        OT_descripcion_provincia          : ShortString;
        OT_descripcion_pais               : ShortString;
        OT_descripcion_cliente_tipo       : ShortString;
        OT_Cuenta_Contable_cliente_tipo   : ShortString;
        OT_Cta_Bco_descripcion_poblacion  : ShortString;
        OT_Cta_Bco_descripcion_provincia  : ShortString;
        OT_Cta_Bco_descripcion_pais       : ShortString;
        OT_descripcion_forma_pago         : ShortString;
        OT_Vencimientos_Cantidad          : ShortString;
        OT_Vencimientos_1_Dias            : ShortString;
        OT_Vencimientos_Dias_Entre        : ShortString;
        OT_descripcion_tarifa             : ShortString;
        OT_descripcion_agencia_transporte : ShortString;
        OT_Tfno_Fijo_1_agencia_transporte : ShortString;
        OT_Movil_agencia_transporte       : ShortString;
        OT_descripcion_representante      : ShortString;
        OT_Tfno_Fijo_1_representante      : ShortString;
        OT_Movil_representante            : ShortString;
    end;

type
    TProveedores = record
        id                                : String;
        nombre_propietario                : ShortString;
        nombre_comercial                  : ShortString;
        nif_cif                           : ShortString;
        Tfno_Fijo_1                       : ShortString;
        Tfno_Fijo_2                       : ShortString;
        FAX                               : ShortString;
        Movil                             : ShortString;
        eMail                             : ShortString;
        pagina_web                        : ShortString;
        Direccion                         : ShortString;
        Direccion_Numero                  : ShortString;
        Direccion_Piso_Letra              : ShortString;
        Codigo_Postal                     : ShortString;
        id_poblaciones                    : ShortString;
        id_provincias                     : ShortString;
        id_paises                         : ShortString;
        id_proveedores_tipos              : ShortString;
        Cta_Bco_Entidad                   : ShortString;
        Cta_Bco_Sucursal                  : ShortString;
        Cta_Bco_Digito_Control            : ShortString;
        Cta_Bco_Cuenta                    : ShortString;
        Cta_Bco_IBAN                      : ShortString;
        Cta_Bco_BIC_SWIFT                 : ShortString;
        Cta_Bco_Mandato_Fecha_de_Firma    : ShortString;
        Cta_Bco_Mandato_Ref               : ShortString;
        Cta_Bco_Direccion                 : ShortString;
        Cta_Bco_Direccion_Numero          : ShortString;
        Cta_Bco_Direccion_Piso_Letra      : ShortString;
        Cta_Bco_Codigo_Postal             : ShortString;
        id_Cta_Bco_poblaciones            : ShortString;
        id_Cta_Bco_provincias             : ShortString;
        id_Cta_Bco_pais                   : ShortString;
        id_formas_pago                    : ShortString;
        Forma_pago_Dia_1                  : ShortString;
        Forma_pago_Dia_2                  : ShortString;
        Vencimientos_automaticos_SN       : ShortString;
        Forma_pago_Vacaciones_Dia_Inicio  : ShortString;
        Forma_pago_Vacaciones_Mes_Inicio  : ShortString;
        Forma_pago_Vacaciones_Dia_Fin     : ShortString;
        Forma_pago_Vacaciones_Mes_Fin     : ShortString;
        IVA_con_Recargo_SN                : ShortString;
        IVA_Excluido_SN                   : ShortString;
        Descuento_Linea                   : ShortString;
        Descuento_Comercial_1             : ShortString;
        Descuento_Comercial_2             : ShortString;
        Descuento_Pronto_Pago             : ShortString;
        Descuento_Final                   : ShortString;
        Retencion                         : ShortString;
        Cuenta_Contable                   : ShortString;
        id_Agencias_Transporte            : ShortString;
        Observaciones_Comentarios         : ShortString;

        Insert_WHEN                       : ShortString;
        Insert_Id_User                    : ShortString;
        Del_WHEN                          : ShortString;
        Del_Id_User                       : ShortString;
        Del_WHY                           : String;
        Change_WHEN                       : ShortString;
        Change_Id_User                    : ShortString;

        OT_descripcion_poblacion          : ShortString;
        OT_descripcion_provincia          : ShortString;
        OT_descripcion_pais               : ShortString;

        OT_descripcion_proveedor_tipo     : ShortString;
        OT_Cuenta_Contable_proveedor_tipo : ShortString;

        OT_Cta_Bco_descripcion_poblacion  : ShortString;
        OT_Cta_Bco_descripcion_provincia  : ShortString;
        OT_Cta_Bco_descripcion_pais       : ShortString;

        OT_descripcion_forma_pago         : ShortString;
        OT_Vencimientos_Cantidad          : ShortString;
        OT_Vencimientos_1_Dias            : ShortString;
        OT_Vencimientos_Dias_Entre        : ShortString;

        OT_descripcion_agencia_transporte : ShortString;
        OT_Tfno_Fijo_1_agencia_transporte : ShortString;
        OT_Movil_agencia_transporte       : ShortString;
    end;

type
    TConfiguracion = record
        id                                                    : String;
        descripcion                                           : ShortString;
        Guardar_Cambios_de_Registros_SN                       : ShortString;
        Trabajar_Grupos_Cocina_SN                             : ShortString;
        Trabajar_Albaranes_con_Vehiculos_SN                   : ShortString;
        Tipo_Clientes_Obligar_Cuenta_Contable_SN              : ShortString;
        Clientes_Obligar_NIF_SN                               : ShortString;
        Clientes_Obligar_Cuenta_Contable_SN                   : ShortString;
        Representantes_Obligar_NIF_SN                         : ShortString;
        Representantes_Obligar_Cuenta_Contable_SN             : ShortString;
        Tipo_Proveedores_Obligar_Cuenta_Contable_SN           : ShortString;
        Proveedores_Obligar_NIF_SN                            : ShortString;
        Proveedores_Obligar_Cuenta_Contable_SN                : ShortString;
        Articulos_Familias_Ventas_Obligar_Cuenta_Contable_SN  : ShortString;
        Articulos_Familias_Compras_Obligar_Cuenta_Contable_SN : ShortString;
        Articulos_Ventas_Obligar_Cuenta_Contable_SN           : ShortString;
        Articulos_Compras_Obligar_Cuenta_Contable_SN          : ShortString;
        Impuestos_Obligar_Cuenta_Contable_SN                  : ShortString;
        Personal_Familias_Obligar_Cuenta_Contable_SN          : ShortString;
        Personal_Obligar_Cuenta_Contable_SN                   : ShortString;
        Personal_Obligar_NIF_SN                               : ShortString;
        Ctas_pagos_cobros_Obligar_Cuenta_Contable_SN          : ShortString;
        Modulo_Profesorado_Activo_SN                          : ShortString;
        Bancos_Cuenta_Contable_SN                             : ShortString;
        Clientes_Obligar_Tipo_Cliente_SN                      : ShortString;
        Clientes_Obligar_Ruta_SN                              : ShortString;
        Clientes_Obligar_Actividad_SN                         : ShortString;
        Clientes_Obligar_FormaPago_SN                         : ShortString;
        Clientes_Obligar_Tarifa_SN                            : ShortString;
        Albaranes_Obligar_Almacen_SN                          : ShortString;
        Facturas_Permitir_Borrar_SN                           : ShortString;

        Insert_WHEN                                           : ShortString;
        Insert_Id_User                                        : ShortString;
        Del_WHEN                                              : ShortString;
        Del_Id_User                                           : ShortString;
        Del_WHY                                               : String;
        Change_WHEN                                           : ShortString;
        Change_Id_User                                        : ShortString;
    end;

type
    TAlmacenes = record
        id                   : String;

        descripcion          : String;
        Responsable          : String;
        Direccion            : String;
        Direccion_Numero     : String;
        Direccion_Piso_Letra : String;
        Codigo_Postal        : String;
        id_poblaciones       : String;
        id_provincias        : String;
        id_paises            : String;
        Tfno_Fijo_1          : String;
        Tfno_Fijo_2          : String;
        FAX                  : String;
        Movil                : String;
        eMail                : String;
        id_empresas          : String;

        Insert_WHEN          : ShortString;
        Insert_Id_User       : ShortString;
        Del_WHEN             : ShortString;
        Del_Id_User          : ShortString;
        Del_WHY              : String;
        Change_WHEN          : ShortString;
        Change_Id_User       : ShortString;
    end;

type
    TEmpresas = record
        id                         : String;
        nombre_comercial           : ShortString;
        Responsable                : ShortString;
        nif_cif                    : ShortString;
        Tfno_Fijo_1                : ShortString;
        Tfno_Fijo_2                : ShortString;
        FAX                        : ShortString;
        Movil                      : ShortString;
        eMail                      : ShortString;
        pagina_web                 : ShortString;
        Direccion                  : ShortString;
        Direccion_Numero           : ShortString;
        Direccion_Piso_Letra       : ShortString;
        Codigo_Postal              : ShortString;
        id_poblaciones             : ShortString;
        id_provincias              : ShortString;
        id_paises                  : ShortString;
        Observaciones_Comentarios  : String;

        Serie_Presupuesto          : ShortString;
        Numero_Presupuesto         : ShortString;

        Serie_Pedido               : ShortString;
        Numero_Pedido              : ShortString;

        Serie_Albaran              : ShortString;
        Numero_Albaran             : ShortString;

        Serie_Factura              : ShortString;
        Numero_Factura             : ShortString;

        Serie_Abono                : ShortString;
        Numero_Abono               : ShortString;

        Serie_Presupuesto_Compras  : ShortString;
        Numero_Presupuesto_Compras : ShortString;

        Serie_Pedido_Compras       : ShortString;
        Numero_Pedido_Compras      : ShortString;

        Serie_Albaran_Compras      : ShortString;
        Numero_Albaran_Compras     : ShortString;

        Serie_Factura_Compras      : ShortString;
        Numero_Factura_Compras     : ShortString;

        Serie_Abono_Compras        : ShortString;
        Numero_Abono_Compras       : ShortString;

        Insert_WHEN                : ShortString;
        Insert_Id_User             : ShortString;
        Del_WHEN                   : ShortString;
        Del_Id_User                : ShortString;
        Del_WHY                    : String;
        Change_WHEN                : ShortString;
        Change_Id_User             : ShortString;

        OT_descripcion_poblacion   : ShortString;
        OT_descripcion_provincia   : ShortString;
        OT_descripcion_pais        : ShortString;
    end;

type
    Timpuestos = record
        id                       : String;
    	descripcion              : ShortString;
    	Cuenta_Contable          : ShortString;
    	Sumado_A_Ftra_SN         : ShortString;
    	Tanto_Por_Ciento         : ShortString;

        Insert_WHEN              : ShortString;
        Insert_Id_User           : ShortString;
        Del_WHEN                 : ShortString;
        Del_Id_User              : ShortString;
        Del_WHY                  : String;
        Change_WHEN              : ShortString;
        Change_Id_User           : ShortString;
    end;

type
    TArticulos = record
        id                                              : String;
        descripcion                                     : String;
        descripcion_para_TPV                            : String;
        id_articulos_familias                           : ShortString;
        Combinado                                       : ShortString;
        id_proveedores                                  : ShortString;
        id_grupos_cocina                                : ShortString;
        id_impresoras                                   : ShortString;
        id_impuestos_Ventas                             : ShortString;
        id_impuestos_Compras                            : ShortString;
        Visualizar_en_terminales_SN                     : ShortString;
        Articulo_Compuesto_SN                           : ShortString;
        Activar_Proporciones_SN                         : ShortString;
        Agregar_a_Favoritos_SN                          : ShortString;
        Pedir_precio_venta_SN                           : ShortString;
        Venta_por_peso_SN                               : ShortString;
        Tipo_de_articulo                                : ShortString;
        Tiempo_asignado                                 : ShortString;
        PVP                                             : ShortString;
        PVP_Impuestos_Incluidos                         : ShortString;
        Comision                                        : ShortString;
        Minimo_Variacion_Actualizar_en_tanto_por_ciento : ShortString;
        Cuenta_Contable_Ventas                          : ShortString;
        Cuenta_Contable_Compras                         : ShortString;
        Cubicaje_Peso                                   : ShortString;
        Cubicaje_Volumen                                : ShortString;
        Repetir_Cada                                    : ShortString;

        Insert_WHEN                                     : ShortString;
        Insert_Id_User                                  : ShortString;
        Del_WHEN                                        : ShortString;
        Del_Id_User                                     : ShortString;
        Del_WHY                                         : String;
        Change_WHEN                                     : ShortString;
        Change_Id_User                                  : ShortString;

        OT_descripcion_impto_ventas                     : String;
        OT_descripcion_impto_compras                    : String;
        OT_descripcion_proveedor                        : String;

        OT_descripcion_grupo_cocina                     : String;
        OT_descripcion_impresora_comandas               : String;

        OT_descripcion_familia                          : String;
    end;

type
    Talbaranes_ventas_detalles = record
        id                      : String;
        id_albaranes            : ShortString;
        Fecha_Movimiento        : ShortString;
        id_clientes             : ShortString;
        Unidades                : ShortString;
        id_almacenes            : ShortString;
        id_articulos            : ShortString;
        Repetir_Cada            : ShortString;
        descripcion             : String;
        descripcion_para_TPV    : ShortString;
        PVP                     : ShortString;
        id_impuestos_Ventas     : ShortString;
        Descuento_Comercial_1   : ShortString;
        Descuento_Comercial_2   : ShortString;
        Excluido_su_Cobro_SN    : ShortString;

        Insert_WHEN             : ShortString;
        Insert_Id_User          : ShortString;
        Del_WHEN                : ShortString;
        Del_Id_User             : ShortString;
        Del_WHY                 : String;
        Change_WHEN             : ShortString;
        Change_Id_User          : ShortString;

        OT_descripcion_almacen  : ShortString;
        OT_descripcion_articulo : ShortString;
        OT_descripcion_impuesto : ShortString;
    end;

    function  UTI_DATOS_TABLA_Rellenar_SQL( p_SQLQuery : TSQLQuery; p_nombre_tabla, p_opcion : String ) : String;
    function  UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( p_SQLQuery : TSQLQuery ) : Boolean;

implementation

function UTI_DATOS_TABLA_Rellenar_SQL( p_SQLQuery : TSQLQuery;
                                       p_nombre_tabla,
                                       p_opcion : String ) : String;
var v_Contador     : Integer;
    v_Nombre_Campo : ShortString;
    v_Linea        : String;
 // var_msg        : TStrings;
begin
  // *********************************************************************************************** //
  // ** UPDATE                                                                                    ** //
  // *********************************************************************************************** //
  if Trim(UpperCase(p_opcion)) = 'U' then
  begin
    Result := 'UPDATE ' + Trim(p_nombre_tabla) + ' ' +
              'SET ';

    with p_SQLQuery do
    begin
      v_Linea := '';

      for v_Contador := 0 to (FieldDefs.Count - 1) do
      begin
        v_Nombre_Campo  := FieldDefs.Items[v_Contador].Name;

        if UpperCase(Copy(v_Nombre_Campo, 1, 3)) <> 'OT_' then
        begin
          if Trim(v_Linea) <> '' then
          begin
            v_Linea := v_Linea + ', ';
          end;

          v_Linea := v_Linea + v_Nombre_Campo + ' = :' + v_Nombre_Campo;
        end;

      end;
    end;

    Result := Result + v_Linea + ' WHERE id = :id ';

  end;


  // *********************************************************************************************** //
  // ** INSERT                                                                                    ** //
  // *********************************************************************************************** //
  if Trim(UpperCase(p_opcion)) = 'I' then
  begin
    Result := 'INSERT INTO ' + Trim(p_nombre_tabla) + ' ( ';

    with p_SQLQuery do
    begin
      v_Linea := '';

      for v_Contador := 0 to (FieldDefs.Count - 1) do
      begin
        v_Nombre_Campo  := FieldDefs.Items[v_Contador].Name;

        if UpperCase(Copy(v_Nombre_Campo, 1, 3)) <> 'OT_' then
        begin
          if Trim(v_Linea) <> '' then
          begin
            v_Linea := v_Linea + ', ';
          end;

          v_Linea := v_Linea + v_Nombre_Campo;
        end;

      end;
    end;

    Result := Result + v_Linea + ' ) VALUES ( ';

    with p_SQLQuery do
    begin
      v_Linea := '';

      for v_Contador := 0 to (FieldDefs.Count - 1) do
      begin
        v_Nombre_Campo  := FieldDefs.Items[v_Contador].Name;

        if UpperCase(Copy(v_Nombre_Campo, 1, 3)) <> 'OT_' then
        begin
          if Trim(v_Linea) <> '' then
          begin
            v_Linea := v_Linea + ', ';
          end;

          v_Linea := v_Linea + ':' + v_Nombre_Campo;
        end;

      end;
    end;

    Result := Result + v_Linea + ' ) ';

  end;

  {
    var_msg := TStringList.Create;
    var_msg.Add(Result);
    UTI_GEN_Aviso( true, var_msg, 'a ver ... ', True, False );
    var_msg.Free;
  }

end;

function UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( p_SQLQuery : TSQLQuery ) : Boolean;
var v_Contador     : Integer;
    v_Nombre_Campo : ShortString;
begin
  // *********************************************************************************************** //
  // ** UPDATE                                                                                    ** //
  // *********************************************************************************************** //
  Result := false;

  with p_SQLQuery do
  begin
    for v_Contador := 0 to (FieldDefs.Count - 1) do
    begin
      v_Nombre_Campo  := FieldDefs.Items[v_Contador].Name;

      if Trim(Params.ParamByName('COPY_' + v_Nombre_Campo).AsString) <> Trim(FieldByName(v_Nombre_Campo).AsString) then
      begin
        Result := true;
      end;
    end;
  end;

end;

end.

(*


*)



