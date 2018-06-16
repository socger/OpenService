unit articulos_000;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs, Buttons, StdCtrls,
    utilidades_rgtro, utilidades_general, utilidades_bd, utilidades_usuarios, ExtCtrls, DBGrids,
    variants, DbCtrls, Grids, ComCtrls, utilidades_datos_tablas, utilidades_forms_Filtrar, types,
    utilidades_lineas_detalle, LCLTranslator;

resourcestring
  rs_para_Empezar_1 = 'Por descripción';
  rs_para_Empezar_2 = 'Por el código de tarifa';
  rs_para_Empezar_3 = 'Por el código de terminal';
  rs_para_Empezar_4 = 'Por el código de la composición';
  rs_para_Empezar_5 = 'Por el código de la proporción';
  rs_para_Empezar_6 = 'Por el código de la proporción';
  rs_para_Empezar_7 = 'Por el código del artículo';

  rs_BitBtn_ImprimirClick_1 = ', con descripción %';
  rs_BitBtn_ImprimirClick_2 = ', con descripción para la terminal %';
  rs_BitBtn_ImprimirClick_3 = ', con familia/tipo de artículo = ';
  rs_BitBtn_ImprimirClick_4 = ', con proveedor habitual = ';

  rs_Error = 'ERROR ... ';

  rs_Elegir_Familia_1 = 'Elija una familia para asignarla';
  rs_Elegir_Familia_2 = 'al artículo';
  rs_Elegir_Familia_3 = 'AVISAMOS DE ... ';

type

    { Tform_articulos_000 }

    Tform_articulos_000 = class(TForm)
      BitBtn_Filtrar: TBitBtn;
        BitBtn_Imprimir: TBitBtn;
        BitBtn_SALIR: TBitBtn;
        BitBtn_Seleccionar: TBitBtn;
        BitBtn_Ver_Situacion_Registro: TBitBtn;
        Boton_Elegir_id_articulos_familias: TBitBtn;
        Boton_Elegir_id_proveedores: TBitBtn;
        ComboBox_Filtros: TComboBox;
        DataSource_Alb_Compras_Detalles: TDataSource;
        DataSource_Alb_Ventas_Detalles: TDataSource;
        DataSource_Art: TDataSource;
        DataSource_Art_Proporciones: TDataSource;
        DataSource_Art_Proporciones_Tarifas: TDataSource;
        DataSource_Art_Stock: TDataSource;
        DataSource_Art_Ref: TDataSource;
        DataSource_Art_Terminales: TDataSource;
        DataSource_Art_Tarifas: TDataSource;
        DataSource_Art_Composiciones: TDataSource;
        DataSource_Ftra_Compras_Detalles: TDataSource;
        DataSource_Ftra_Ventas_Detalles: TDataSource;
        DataSource_Tarifas_Margenes: TDataSource;
        DBGrid_Principal: TDBGrid;
        DBNavigator1: TDBNavigator;
        Edit_Descripcion: TEdit;
        Edit_Descripcion_Para_Terminal: TEdit;
        Edit_Descripcion_id_articulos_familias: TEdit;
        Edit_Descripcion_id_proveedores: TEdit;
        Edit_id_articulos_familias: TEdit;
        Edit_id_proveedores: TEdit;
        Image_CodigoBarras: TImage;
        Label45: TLabel;
        Label49: TLabel;
        Label6: TLabel;
        Label7: TLabel;
        Label8: TLabel;
        Label9: TLabel;
        Label_Fecha2: TLabel;
        Memo_Filtros: TMemo;
        Memo_OrderBy: TMemo;
        PageControl_Filtros: TPageControl;
        RadioGroup_Bajas: TRadioGroup;
        SQLQuery_Alb_Compras_Detalles: TSQLQuery;
        SQLQuery_Alb_Compras_DetallesChange_Id_User: TLargeintField;
        SQLQuery_Alb_Compras_DetallesChange_WHEN: TDateTimeField;
        SQLQuery_Alb_Compras_DetallesCodigoBarras_Referencia: TStringField;
        SQLQuery_Alb_Compras_DetallesDel_Id_User: TLargeintField;
        SQLQuery_Alb_Compras_DetallesDel_WHEN: TDateTimeField;
        SQLQuery_Alb_Compras_DetallesDel_WHY: TStringField;
        SQLQuery_Alb_Compras_Detallesdescripcion: TStringField;
        SQLQuery_Alb_Compras_Detallesdescripcion_para_TPV: TStringField;
        SQLQuery_Alb_Compras_DetallesDescuento_Comercial_1: TBCDField;
        SQLQuery_Alb_Compras_DetallesDescuento_Comercial_2: TBCDField;
        SQLQuery_Alb_Compras_DetallesExcluido_su_Cobro_SN: TStringField;
        SQLQuery_Alb_Compras_DetallesFecha_Movimiento: TDateTimeField;
        SQLQuery_Alb_Compras_Detallesid_albaranes: TLargeintField;
        SQLQuery_Alb_Compras_Detallesid_almacenes: TLargeintField;
        SQLQuery_Alb_Compras_Detallesid_articulos: TLargeintField;
        SQLQuery_Alb_Compras_Detallesid_impuestos_Compras: TLargeintField;
        SQLQuery_Alb_Compras_Detallesid_proveedores: TLargeintField;
        SQLQuery_Alb_Compras_DetallesInsert_Id_User: TLargeintField;
        SQLQuery_Alb_Compras_DetallesInsert_WHEN: TDateTimeField;
        SQLQuery_Alb_Compras_DetallesNumero_Factura: TLargeintField;
        SQLQuery_Alb_Compras_DetallesOT_descripcion_almacen: TStringField;
        SQLQuery_Alb_Compras_DetallesOT_descripcion_articulo: TStringField;
        SQLQuery_Alb_Compras_DetallesOT_descripcion_impuesto: TStringField;
        SQLQuery_Alb_Compras_DetallesOT_Descripcion_para_DbGrid1: TStringField;
        SQLQuery_Alb_Compras_DetallesOT_el_Albaran1: TStringField;
        SQLQuery_Alb_Compras_DetallesOT_id_almacenes_Cabecera: TLargeintField;
        SQLQuery_Alb_Compras_DetallesOT_Numero_Albaran: TLargeintField;

          SQLQuery_Alb_Compras_DetallesOT_Proveedor_nombre_comercial: TStringField;

          SQLQuery_Alb_Compras_DetallesOT_Proveedor_nombre_propietario: TStringField;
          SQLQuery_Alb_Compras_DetallesOT_Serie_Albaran: TStringField;
          SQLQuery_Alb_Compras_DetallesOT_Sumado_A_Ftra_SN: TStringField;
          SQLQuery_Alb_Compras_DetallesOT_Tanto_Por_Ciento: TBCDField;
          SQLQuery_Alb_Compras_DetallesOT_Tipo_de_articulo: TStringField;
          SQLQuery_Alb_Compras_DetallesOT_Total_Dto_1_1: TFloatField;
          SQLQuery_Alb_Compras_DetallesOT_Total_Dto_2_1: TFloatField;
          SQLQuery_Alb_Compras_DetallesOT_Total_Linea_con_Dtos1: TFloatField;
          SQLQuery_Alb_Compras_DetallesOT_Total_Linea_sin_Dtos1: TFloatField;
        SQLQuery_Alb_Compras_DetallesPVP: TBCDField;
        SQLQuery_Alb_Compras_DetallesRepetir_Cada: TLongintField;
        SQLQuery_Alb_Compras_DetallesSerie_Factura: TStringField;
        SQLQuery_Alb_Compras_DetallesUnidades: TBCDField;
        SQLQuery_Alb_Ventas_Detalles: TSQLQuery;
        SQLQuery_Alb_Ventas_DetallesChange_Id_User: TLargeintField;
        SQLQuery_Alb_Ventas_DetallesChange_WHEN: TDateTimeField;
        SQLQuery_Alb_Ventas_DetallesCodigoBarras_Referencia: TStringField;
        SQLQuery_Alb_Ventas_DetallesComision_Representante: TBCDField;
        SQLQuery_Alb_Ventas_DetallesDel_Id_User: TLargeintField;
        SQLQuery_Alb_Ventas_DetallesDel_WHEN: TDateTimeField;
        SQLQuery_Alb_Ventas_DetallesDel_WHY: TStringField;
        SQLQuery_Alb_Ventas_Detallesdescripcion: TStringField;
        SQLQuery_Alb_Ventas_Detallesdescripcion_para_TPV: TStringField;
        SQLQuery_Alb_Ventas_DetallesDescuento_Comercial_1: TBCDField;
        SQLQuery_Alb_Ventas_DetallesDescuento_Comercial_2: TBCDField;
        SQLQuery_Alb_Ventas_DetallesExcluido_su_Cobro_SN: TStringField;
        SQLQuery_Alb_Ventas_DetallesFecha_Movimiento: TDateTimeField;
        SQLQuery_Alb_Ventas_Detallesid_albaranes: TLargeintField;
        SQLQuery_Alb_Ventas_Detallesid_almacenes: TLargeintField;
        SQLQuery_Alb_Ventas_Detallesid_articulos: TLargeintField;
        SQLQuery_Alb_Ventas_Detallesid_clientes: TLargeintField;
        SQLQuery_Alb_Ventas_Detallesid_impuestos_Ventas: TLargeintField;
        SQLQuery_Alb_Ventas_DetallesInsert_Id_User: TLargeintField;
        SQLQuery_Alb_Ventas_DetallesInsert_WHEN: TDateTimeField;
        SQLQuery_Alb_Ventas_DetallesNumero_Factura: TLargeintField;
        SQLQuery_Alb_Ventas_DetallesOT_Cliente_nombre_comercial: TStringField;
        SQLQuery_Alb_Ventas_DetallesOT_Cliente_nombre_propietario: TStringField;
        SQLQuery_Alb_Ventas_DetallesOT_descripcion_almacen: TStringField;
        SQLQuery_Alb_Ventas_DetallesOT_descripcion_articulo: TStringField;
        SQLQuery_Alb_Ventas_DetallesOT_descripcion_impuesto: TStringField;
        SQLQuery_Alb_Ventas_DetallesOT_Descripcion_para_DbGrid1: TStringField;
        SQLQuery_Alb_Ventas_DetallesOT_el_Albaran1: TStringField;
        SQLQuery_Alb_Ventas_DetallesOT_id_almacenes_Cabecera: TLargeintField;
        SQLQuery_Alb_Ventas_DetallesOT_id_vehiculos_Cabecera: TLargeintField;
        SQLQuery_Alb_Ventas_DetallesOT_Numero_Albaran: TLargeintField;
        SQLQuery_Alb_Ventas_DetallesOT_Serie_Albaran: TStringField;
        SQLQuery_Alb_Ventas_DetallesOT_Sumado_A_Ftra_SN: TStringField;
        SQLQuery_Alb_Ventas_DetallesOT_Tanto_Por_Ciento: TBCDField;
        SQLQuery_Alb_Ventas_DetallesOT_Tipo_de_articulo: TStringField;
        SQLQuery_Alb_Ventas_DetallesOT_Total_Dto_1_1: TFloatField;
        SQLQuery_Alb_Ventas_DetallesOT_Total_Dto_2_1: TFloatField;
        SQLQuery_Alb_Ventas_DetallesOT_Total_Linea_con_Dtos1: TFloatField;
        SQLQuery_Alb_Ventas_DetallesOT_Total_Linea_sin_Dtos1: TFloatField;
        SQLQuery_Alb_Ventas_DetallesPVP: TBCDField;
        SQLQuery_Alb_Ventas_DetallesRepetir_Cada: TLongintField;
        SQLQuery_Alb_Ventas_DetallesSerie_Factura: TStringField;
        SQLQuery_Alb_Ventas_DetallesUnidades: TBCDField;
        SQLQuery_Articulos: TSQLQuery;
        SQLQuery_ArticulosActivar_Proporciones_SN: TStringField;
        SQLQuery_ArticulosAgregar_a_Favoritos_SN: TStringField;
        SQLQuery_ArticulosAgregar_a_menus_SN: TStringField;
        SQLQuery_ArticulosArticulo_Compuesto_SN: TStringField;
        SQLQuery_ArticulosChange_Id_User: TLargeintField;
        SQLQuery_ArticulosChange_WHEN: TDateTimeField;
        SQLQuery_ArticulosCombinado: TStringField;
        SQLQuery_ArticulosComision: TBCDField;
        SQLQuery_ArticulosCubicaje_Peso: TBCDField;
        SQLQuery_ArticulosCubicaje_Volumen: TBCDField;
        SQLQuery_ArticulosCuenta_Contable_Compras: TStringField;
        SQLQuery_ArticulosCuenta_Contable_Ventas: TStringField;
        SQLQuery_ArticulosDel_Id_User: TLargeintField;
        SQLQuery_ArticulosDel_WHEN: TDateTimeField;
        SQLQuery_ArticulosDel_WHY: TStringField;
        SQLQuery_Articulosdescripcion: TStringField;
        SQLQuery_Articulosdescripcion_para_TPV: TStringField;
        SQLQuery_Articulosid: TLargeintField;
        SQLQuery_Articulosid_articulos_familias: TLargeintField;
        SQLQuery_Articulosid_grupos_cocina: TLargeintField;
        SQLQuery_Articulosid_impresoras: TLargeintField;
        SQLQuery_Articulosid_impuestos_Compras: TLargeintField;
        SQLQuery_Articulosid_impuestos_Ventas: TLargeintField;
        SQLQuery_Articulosid_proveedores: TLargeintField;
        SQLQuery_ArticulosInsert_Id_User: TLargeintField;
        SQLQuery_ArticulosInsert_WHEN: TDateTimeField;
        SQLQuery_ArticulosMinimo_Variacion_Actualizar_en_tanto_por_ciento: TBCDField;
        SQLQuery_ArticulosOT_Cuenta_Contable_articulo_Compras: TStringField;
        SQLQuery_ArticulosOT_Cuenta_Contable_articulo_Ventas: TStringField;
        SQLQuery_ArticulosOT_descripcion_familia: TStringField;
        SQLQuery_ArticulosOT_descripcion_grupo_cocina: TStringField;
        SQLQuery_ArticulosOT_descripcion_impresora_comandas: TStringField;
        SQLQuery_ArticulosOT_descripcion_impto_compras: TStringField;
        SQLQuery_ArticulosOT_descripcion_impto_ventas: TStringField;
        SQLQuery_ArticulosOT_descripcion_proveedor: TStringField;
        SQLQuery_ArticulosPedir_precio_venta_SN: TStringField;
        SQLQuery_ArticulosPVP: TBCDField;
        SQLQuery_ArticulosPVP_Impuestos_Incluidos: TBCDField;
        SQLQuery_ArticulosRepetir_Cada: TLongintField;
        SQLQuery_ArticulosTiempo_asignado: TBCDField;
        SQLQuery_ArticulosTipo_de_articulo: TStringField;
        SQLQuery_ArticulosVenta_por_peso_SN: TStringField;
        SQLQuery_ArticulosVisualizar_en_terminales_SN: TStringField;
        SQLQuery_Articulos_ComposicionesChange_Id_User: TLargeintField;
        SQLQuery_Articulos_ComposicionesChange_WHEN: TDateTimeField;
        SQLQuery_Articulos_ComposicionesDel_Id_User: TLargeintField;
        SQLQuery_Articulos_ComposicionesDel_WHEN: TDateTimeField;
        SQLQuery_Articulos_ComposicionesDel_WHY: TStringField;
        SQLQuery_Articulos_Composicionesid_articulos: TLargeintField;

          SQLQuery_Articulos_Composicionesid_articulos_composiciones: TLargeintField;
          SQLQuery_Articulos_ComposicionesInsert_Id_User: TLargeintField;
          SQLQuery_Articulos_ComposicionesInsert_WHEN: TDateTimeField;

            SQLQuery_Articulos_ComposicionesOT_Alb_Fecha_Movimiento: TDateTimeField;
            SQLQuery_Articulos_ComposicionesOT_Alb_PVP: TBCDField;
        SQLQuery_Articulos_ComposicionesOT_Coste_Unidad1: TFloatField;

          SQLQuery_Articulos_ComposicionesOT_descripcion_articulo_composicion: TStringField;

          SQLQuery_Articulos_ComposicionesOT_Ftra_Fecha_Movimiento: TDateTimeField;
          SQLQuery_Articulos_ComposicionesOT_Ftra_PVP: TBCDField;
        SQLQuery_Articulos_ComposicionesUnidades: TBCDField;
        SQLQuery_Articulos_Proporciones: TSQLQuery;
        SQLQuery_Articulos_ProporcionesCantidad_Descontar: TBCDField;
        SQLQuery_Articulos_ProporcionesChange_Id_User: TLargeintField;
        SQLQuery_Articulos_ProporcionesChange_WHEN: TDateTimeField;
        SQLQuery_Articulos_ProporcionesDel_Id_User: TLargeintField;
        SQLQuery_Articulos_ProporcionesDel_WHEN: TDateTimeField;
        SQLQuery_Articulos_ProporcionesDel_WHY: TStringField;
        SQLQuery_Articulos_Proporcionesdescripcion: TStringField;
        SQLQuery_Articulos_Proporcionesdescripcion_para_TPV: TStringField;
        SQLQuery_Articulos_Proporcionesid_articulos: TLargeintField;
        SQLQuery_Articulos_ProporcionesInsert_Id_User: TLargeintField;
        SQLQuery_Articulos_ProporcionesInsert_WHEN: TDateTimeField;
        SQLQuery_Articulos_Proporciones_Tarifas: TSQLQuery;
        SQLQuery_Articulos_Proporciones_TarifasChange_Id_User: TLargeintField;
        SQLQuery_Articulos_Proporciones_TarifasChange_WHEN: TDateTimeField;
        SQLQuery_Articulos_Proporciones_TarifasDel_Id_User: TLargeintField;
        SQLQuery_Articulos_Proporciones_TarifasDel_WHEN: TDateTimeField;
        SQLQuery_Articulos_Proporciones_TarifasDel_WHY: TStringField;
        SQLQuery_Articulos_Proporciones_TarifasDescuento: TBCDField;
        SQLQuery_Articulos_Proporciones_Tarifasid_articulos: TLargeintField;

          SQLQuery_Articulos_Proporciones_Tarifasid_articulos_proporciones: TLargeintField;
          SQLQuery_Articulos_Proporciones_Tarifasid_tarifas: TLargeintField;

            SQLQuery_Articulos_Proporciones_TarifasImporte_Impuestos_Incluidos: TBCDField;
          SQLQuery_Articulos_Proporciones_TarifasImporte_Neto: TBCDField;
          SQLQuery_Articulos_Proporciones_TarifasInsert_Id_User: TLargeintField;
          SQLQuery_Articulos_Proporciones_TarifasInsert_WHEN: TDateTimeField;
          SQLQuery_Articulos_Proporciones_TarifasOT_Beneficio: TBCDField;

            SQLQuery_Articulos_Proporciones_TarifasOT_Beneficio_en_Tanto_por_Ciento_SN: TStringField;

            SQLQuery_Articulos_Proporciones_TarifasOT_descripcion_tarifa: TStringField;

              SQLQuery_Articulos_Proporciones_TarifasOT_mayor_igual_que: TBCDField;

                SQLQuery_Articulos_Proporciones_TarifasOT_menor_igual_que: TBCDField;
        SQLQuery_Articulos_RefCodigoBarras_o_Referencia: TStringField;
        SQLQuery_Articulos_RefCodigoBarras_Referencia: TStringField;
        SQLQuery_Articulos_RefOT_Descripcion: TStringField;
        SQLQuery_Articulos_RefOT_Descripcion_para_TPV: TStringField;
        SQLQuery_Articulos_Stock: TSQLQuery;
        SQLQuery_Articulos_StockChange_Id_User: TLargeintField;
        SQLQuery_Articulos_StockChange_WHEN: TDateTimeField;
        SQLQuery_Articulos_StockDel_Id_User: TLargeintField;
        SQLQuery_Articulos_StockDel_WHEN: TDateTimeField;
        SQLQuery_Articulos_StockDel_WHY: TStringField;
        SQLQuery_Articulos_Stockid_almacenes: TLargeintField;
        SQLQuery_Articulos_Stockid_articulos: TLargeintField;
        SQLQuery_Articulos_StockInsert_Id_User: TLargeintField;
        SQLQuery_Articulos_StockInsert_WHEN: TDateTimeField;
        SQLQuery_Articulos_StockOT_descripcion_almacen: TStringField;
        SQLQuery_Articulos_StockPendiente_Recibir: TBCDField;
        SQLQuery_Articulos_StockPendiente_Servir: TBCDField;
        SQLQuery_Articulos_StockStock: TBCDField;
        SQLQuery_Articulos_StockStock_Maximo: TBCDField;
        SQLQuery_Articulos_StockStock_Minimo: TBCDField;
        SQLQuery_Articulos_Ref: TSQLQuery;
        SQLQuery_Articulos_TarifasChange_Id_User: TLargeintField;
        SQLQuery_Articulos_TarifasChange_Id_User1: TLargeintField;
        SQLQuery_Articulos_TarifasChange_WHEN: TDateTimeField;
        SQLQuery_Articulos_TarifasChange_WHEN1: TDateTimeField;
        SQLQuery_Articulos_TarifasDel_Id_User: TLargeintField;
        SQLQuery_Articulos_TarifasDel_Id_User1: TLargeintField;
        SQLQuery_Articulos_TarifasDel_WHEN: TDateTimeField;
        SQLQuery_Articulos_TarifasDel_WHEN1: TDateTimeField;
        SQLQuery_Articulos_TarifasDel_WHY: TStringField;
        SQLQuery_Articulos_TarifasDel_WHY1: TStringField;
        SQLQuery_Articulos_TarifasDescuento: TBCDField;
        SQLQuery_Articulos_Tarifasid1: TLargeintField;
        SQLQuery_Articulos_Tarifasid2: TLargeintField;
        SQLQuery_Articulos_Tarifasid3: TLargeintField;
        SQLQuery_Articulos_Tarifasid_articulos: TLargeintField;
        SQLQuery_Articulos_Tarifasid_articulos1: TLargeintField;
        SQLQuery_Articulos_Tarifasid_tarifas: TLargeintField;
        SQLQuery_Articulos_TarifasImporte_Impuestos_Incluidos: TBCDField;
        SQLQuery_Articulos_TarifasImporte_Neto: TBCDField;
        SQLQuery_Articulos_TarifasInsert_Id_User: TLargeintField;
        SQLQuery_Articulos_TarifasInsert_Id_User1: TLargeintField;
        SQLQuery_Articulos_TarifasInsert_WHEN: TDateTimeField;
        SQLQuery_Articulos_TarifasInsert_WHEN1: TDateTimeField;
        SQLQuery_Articulos_TarifasOT_Beneficio: TBCDField;
        SQLQuery_Articulos_TarifasOT_Beneficio_en_Tanto_por_Ciento_SN: TStringField;
        SQLQuery_Articulos_TarifasOT_descripcion_tarifa: TStringField;
        SQLQuery_Articulos_TarifasOT_Importe_Impuestos_Incluidos_Sugerido1: TFloatField;
        SQLQuery_Articulos_TarifasOT_Importe_Neto_Sugerido1: TFloatField;
        SQLQuery_Articulos_TarifasOT_mayor_igual_que: TBCDField;
        SQLQuery_Articulos_TarifasOT_menor_igual_que: TBCDField;
        SQLQuery_Articulos_Terminales: TSQLQuery;
        SQLQuery_Articulos_Composiciones: TSQLQuery;
        SQLQuery_Articulos_TerminalesChange_Id_User: TLargeintField;
        SQLQuery_Articulos_TerminalesChange_WHEN: TDateTimeField;
        SQLQuery_Articulos_TerminalesDel_Id_User: TLargeintField;
        SQLQuery_Articulos_TerminalesDel_WHEN: TDateTimeField;
        SQLQuery_Articulos_TerminalesDel_WHY: TStringField;
        SQLQuery_Articulos_Terminalesid: TLargeintField;
        SQLQuery_Articulos_Tarifas: TSQLQuery;
        SQLQuery_Articulos_Tarifasid: TLargeintField;
        SQLQuery_Articulos_Terminalesid1: TLargeintField;
        SQLQuery_Articulos_Terminalesid2: TLargeintField;
        SQLQuery_Articulos_Terminalesid_articulos: TLargeintField;
        SQLQuery_Articulos_Terminalesid_terminales: TLargeintField;
        SQLQuery_Articulos_TerminalesInsert_Id_User: TLargeintField;
        SQLQuery_Articulos_TerminalesInsert_WHEN: TDateTimeField;
        SQLQuery_Articulos_TerminalesOT_descripcion_terminal: TStringField;
        SQLQuery_Articulos_TerminalesVisualizar_en_terminal_SN: TStringField;
        SQLQuery_Clientesid1: TLargeintField;
        SQLQuery_Clientesid2: TLargeintField;
        SQLQuery_Clientesid3: TLargeintField;
        SQLQuery_Clientesid4: TLargeintField;
        SQLQuery_Ftra_Compras_Detalles: TSQLQuery;
        SQLQuery_Ftra_Compras_DetallesChange_Id_User: TLargeintField;
        SQLQuery_Ftra_Compras_DetallesChange_WHEN: TDateTimeField;
        SQLQuery_Ftra_Compras_DetallesCodigoBarras_Referencia: TStringField;
        SQLQuery_Ftra_Compras_DetallesDel_Id_User: TLargeintField;
        SQLQuery_Ftra_Compras_DetallesDel_WHEN: TDateTimeField;
        SQLQuery_Ftra_Compras_DetallesDel_WHY: TStringField;
        SQLQuery_Ftra_Compras_Detallesdescripcion: TStringField;
        SQLQuery_Ftra_Compras_Detallesdescripcion_para_TPV: TStringField;
        SQLQuery_Ftra_Compras_DetallesDescuento_Comercial_1: TBCDField;
        SQLQuery_Ftra_Compras_DetallesDescuento_Comercial_2: TBCDField;
        SQLQuery_Ftra_Compras_DetallesExcluido_su_Cobro_SN: TStringField;
        SQLQuery_Ftra_Compras_DetallesFecha_Movimiento: TDateTimeField;
        SQLQuery_Ftra_Compras_Detallesid_almacenes: TLargeintField;
        SQLQuery_Ftra_Compras_Detallesid_articulos: TLargeintField;
        SQLQuery_Ftra_Compras_Detallesid_facturas: TLargeintField;
        SQLQuery_Ftra_Compras_Detallesid_impuestos_Compras: TLargeintField;
        SQLQuery_Ftra_Compras_Detallesid_proveedores: TLargeintField;
        SQLQuery_Ftra_Compras_DetallesInsert_Id_User: TLargeintField;
        SQLQuery_Ftra_Compras_DetallesInsert_WHEN: TDateTimeField;
        SQLQuery_Ftra_Compras_DetallesNumero_Albaran: TLargeintField;
        SQLQuery_Ftra_Compras_DetallesOT_descripcion_almacen: TStringField;
        SQLQuery_Ftra_Compras_DetallesOT_descripcion_articulo: TStringField;
        SQLQuery_Ftra_Compras_DetallesOT_descripcion_impuesto: TStringField;
        SQLQuery_Ftra_Compras_DetallesOT_Descripcion_para_DbGrid1: TStringField;
        SQLQuery_Ftra_Compras_DetallesOT_id_almacenes_Cabecera: TLargeintField;
        SQLQuery_Ftra_Compras_DetallesOT_la_Factura1: TStringField;
        SQLQuery_Ftra_Compras_DetallesOT_Numero_Factura: TLargeintField;

          SQLQuery_Ftra_Compras_DetallesOT_Proveedor_nombre_comercial: TStringField;

          SQLQuery_Ftra_Compras_DetallesOT_Proveedor_nombre_propietario: TStringField;
          SQLQuery_Ftra_Compras_DetallesOT_Serie_Factura: TStringField;
          SQLQuery_Ftra_Compras_DetallesOT_Sumado_A_Ftra_SN: TStringField;
          SQLQuery_Ftra_Compras_DetallesOT_Tanto_Por_Ciento: TBCDField;
          SQLQuery_Ftra_Compras_DetallesOT_Tipo_de_articulo: TStringField;
          SQLQuery_Ftra_Compras_DetallesOT_Total_Dto_1_1: TFloatField;
          SQLQuery_Ftra_Compras_DetallesOT_Total_Dto_2_1: TFloatField;
          SQLQuery_Ftra_Compras_DetallesOT_Total_Linea_con_Dtos1: TFloatField;
          SQLQuery_Ftra_Compras_DetallesOT_Total_Linea_sin_Dtos1: TFloatField;
        SQLQuery_Ftra_Compras_DetallesPVP: TBCDField;
        SQLQuery_Ftra_Compras_DetallesRepetir_Cada: TLongintField;
        SQLQuery_Ftra_Compras_DetallesSerie_Albaran: TStringField;
        SQLQuery_Ftra_Compras_DetallesUnidades: TBCDField;
        SQLQuery_Ftra_Ventas_Detalles: TSQLQuery;
        SQLQuery_Ftra_Ventas_DetallesChange_Id_User: TLargeintField;
        SQLQuery_Ftra_Ventas_DetallesChange_WHEN: TDateTimeField;
        SQLQuery_Ftra_Ventas_DetallesCodigoBarras_Referencia: TStringField;
        SQLQuery_Ftra_Ventas_DetallesComision_Representante: TBCDField;
        SQLQuery_Ftra_Ventas_DetallesDel_Id_User: TLargeintField;
        SQLQuery_Ftra_Ventas_DetallesDel_WHEN: TDateTimeField;
        SQLQuery_Ftra_Ventas_DetallesDel_WHY: TStringField;
        SQLQuery_Ftra_Ventas_Detallesdescripcion: TStringField;
        SQLQuery_Ftra_Ventas_Detallesdescripcion_para_TPV: TStringField;
        SQLQuery_Ftra_Ventas_DetallesDescuento_Comercial_1: TBCDField;
        SQLQuery_Ftra_Ventas_DetallesDescuento_Comercial_2: TBCDField;
        SQLQuery_Ftra_Ventas_DetallesExcluido_su_Cobro_SN: TStringField;
        SQLQuery_Ftra_Ventas_DetallesFecha_Movimiento: TDateTimeField;
        SQLQuery_Ftra_Ventas_Detallesid_almacenes: TLargeintField;
        SQLQuery_Ftra_Ventas_Detallesid_articulos: TLargeintField;
        SQLQuery_Ftra_Ventas_Detallesid_clientes: TLargeintField;
        SQLQuery_Ftra_Ventas_Detallesid_facturas: TLargeintField;
        SQLQuery_Ftra_Ventas_Detallesid_impuestos_Ventas: TLargeintField;
        SQLQuery_Ftra_Ventas_DetallesInsert_Id_User: TLargeintField;
        SQLQuery_Ftra_Ventas_DetallesInsert_WHEN: TDateTimeField;
        SQLQuery_Ftra_Ventas_DetallesNumero_Albaran: TLargeintField;
        SQLQuery_Ftra_Ventas_DetallesOT_Cliente_nombre_comercial: TStringField;

          SQLQuery_Ftra_Ventas_DetallesOT_Cliente_nombre_propietario: TStringField;
          SQLQuery_Ftra_Ventas_DetallesOT_descripcion_almacen: TStringField;
          SQLQuery_Ftra_Ventas_DetallesOT_descripcion_articulo: TStringField;
          SQLQuery_Ftra_Ventas_DetallesOT_descripcion_impuesto: TStringField;

            SQLQuery_Ftra_Ventas_DetallesOT_Descripcion_para_DbGrid1: TStringField;

              SQLQuery_Ftra_Ventas_DetallesOT_id_almacenes_Cabecera: TLargeintField;
        SQLQuery_Ftra_Ventas_DetallesOT_la_Factura1: TStringField;
        SQLQuery_Ftra_Ventas_DetallesOT_Numero_Factura: TLargeintField;
        SQLQuery_Ftra_Ventas_DetallesOT_Serie_Factura: TStringField;
        SQLQuery_Ftra_Ventas_DetallesOT_Sumado_A_Ftra_SN: TStringField;
        SQLQuery_Ftra_Ventas_DetallesOT_Tanto_Por_Ciento: TBCDField;
        SQLQuery_Ftra_Ventas_DetallesOT_Tipo_de_articulo: TStringField;
        SQLQuery_Ftra_Ventas_DetallesOT_Total_Dto_1_1: TFloatField;
        SQLQuery_Ftra_Ventas_DetallesOT_Total_Dto_2_1: TFloatField;
        SQLQuery_Ftra_Ventas_DetallesOT_Total_Linea_con_Dtos1: TFloatField;
        SQLQuery_Ftra_Ventas_DetallesOT_Total_Linea_sin_Dtos1: TFloatField;
        SQLQuery_Ftra_Ventas_DetallesPVP: TBCDField;
        SQLQuery_Ftra_Ventas_DetallesRepetir_Cada: TLongintField;
        SQLQuery_Ftra_Ventas_DetallesSerie_Albaran: TStringField;
        SQLQuery_Ftra_Ventas_DetallesUnidades: TBCDField;
        SQLQuery_Tarifas_Margenes: TSQLQuery;
        SQLQuery_Tarifas_MargenesBeneficio: TBCDField;
        SQLQuery_Tarifas_MargenesBeneficio_en_Tanto_por_Ciento_SN: TStringField;
        SQLQuery_Tarifas_MargenesChange_Id_User: TLargeintField;
        SQLQuery_Tarifas_MargenesChange_WHEN: TDateTimeField;
        SQLQuery_Tarifas_MargenesDel_Id_User: TLargeintField;
        SQLQuery_Tarifas_MargenesDel_WHEN: TDateTimeField;
        SQLQuery_Tarifas_MargenesDel_WHY: TStringField;
        SQLQuery_Tarifas_Margenesid: TLargeintField;
        SQLQuery_Tarifas_Margenesid_margenes_tarifas: TLargeintField;
        SQLQuery_Tarifas_Margenesid_tarifas: TLargeintField;
        SQLQuery_Tarifas_MargenesInsert_Id_User: TLargeintField;
        SQLQuery_Tarifas_MargenesInsert_WHEN: TDateTimeField;
        SQLQuery_Tarifas_MargenesOT_mayor_igual_que: TBCDField;
        SQLQuery_Tarifas_MargenesOT_menor_igual_que: TBCDField;
        SQLQuery_Tarifas_MargenesOT_Tarifa_Descripcion: TStringField;
        TabSheet_Busqueda_Concreta: TTabSheet;
        TabSheet_Filtros_Generales: TTabSheet;

        procedure Refrescar_Registros_Margenes;
        function  Filtrar_Tarifas_Margenes( param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
        procedure Vaciar_variables_comprobacion_ultimo_precio_Compra;
        procedure Calcular_Composicion_Total_Coste;
        procedure Actualizar_Ultimas_Compras;
        procedure Refrescar_Registros_Facturas_Ventas_Detalles;
        function  Filtrar_Facturas_Ventas_Detalles( param_Limite_Registros : string; param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
        procedure Refrescar_Registros_Facturas_Compras_Detalles;
        function  Filtrar_Facturas_Compras_Detalles( param_Limite_Registros : string; param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
        procedure Refrescar_Registros_Albaranes_Ventas_Detalles_sin_Facturar;
        procedure Refrescar_Registros_Albaranes_Compras_Detalles_sin_Facturar;
        function  Filtrar_Albaranes_Compras_Detalles_sin_Facturar( param_Limite_Registros : string; param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
        function  Filtrar_Albaranes_Ventas_Detalles_sin_Facturar( param_Limite_Registros : string; param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
        procedure Boton_Elegir_id_articulos_familiasClick(Sender: TObject);
        procedure Boton_Elegir_id_proveedoresClick(Sender: TObject);
        procedure ComboBox_FiltrosChange(Sender: TObject);
        procedure Edit_Descripcion_id_articulos_familiasClick(Sender: TObject);
        function  Elegir_Familia : TRecord_Rgtro_Comun;
        function  Filtrar_Articulos_Referencias( param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
        procedure Edit_Descripcion_id_proveedoresClick(Sender: TObject);
        procedure Filtrar_Principal_Sin_Preguntar;
        function  Filtrar_Articulos_Proporciones_Tarifas( param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
        function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
        procedure Filtrar_tablas_ligadas;
        procedure Filtrar_tablas_ligadas_a_Proporciones;
        function  Filtrar_Articulos_Tarifas( param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
        function  Filtrar_Articulos_Terminales( param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
        function  Filtrar_Articulos_Composiciones( param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
        function  Filtrar_Articulos_Proporciones( param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
        function  Filtrar_Articulos_Stock( param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;

        procedure Refrescar_Registros_Stock;
        procedure Refrescar_Registros_Proporciones_Tarifas;
        procedure Refrescar_Registros_Proporciones;
        procedure Refrescar_Registros_Referencias;
        procedure Refrescar_Registros_Composiciones;
        procedure Insertar_Registro;
        procedure Editar_Registro;
        procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
        procedure BitBtn_FiltrarClick(Sender: TObject);
        procedure BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
        procedure Presentar_Datos;
        procedure no_Tocar;
        procedure BitBtn_ImprimirClick(Sender: TObject);
        procedure BitBtn_SeleccionarClick(Sender: TObject);
        procedure Seleccionado_Rgtro;
        procedure BitBtn_SALIRClick(Sender: TObject);
        procedure DBGrid_PrincipalCellClick(Column: TColumn);
        procedure DBGrid_PrincipalDblClick(Sender: TObject);
        procedure DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
        procedure DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure para_Empezar;
        procedure Refrescar_Registros;
        procedure Refrescar_Registros_Tarifas;
        procedure Refrescar_Registros_Terminales;
        procedure Cerramos_Tablas;
        procedure Cerramos_Tablas_Ligadas;
        procedure Cerramos_Tablas_Ligadas_a_Proporciones;
        procedure Cerramos_Tablas_de_Compras;
        procedure FormActivate(Sender: TObject);
        procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
        procedure FormCreate(Sender: TObject);
        procedure FormDestroy(Sender: TObject);
        procedure RadioGroup_BajasClick(Sender: TObject);
        procedure SQLQuery_Alb_Compras_DetallesCalcFields(DataSet: TDataSet);
        procedure SQLQuery_Alb_Ventas_DetallesCalcFields(DataSet: TDataSet);
        procedure SQLQuery_ArticulosAfterPost(DataSet: TDataSet);
        procedure SQLQuery_ArticulosAfterScroll(DataSet: TDataSet);
        procedure SQLQuery_ArticulosBeforeEdit(DataSet: TDataSet);
        procedure SQLQuery_ArticulosBeforePost(DataSet: TDataSet);
        procedure SQLQuery_ArticulosCalcFields(DataSet: TDataSet);
        procedure SQLQuery_Articulos_ComposicionesAfterPost(DataSet: TDataSet);
        procedure SQLQuery_Articulos_ComposicionesBeforeEdit(DataSet: TDataSet);
        procedure SQLQuery_Articulos_ComposicionesBeforePost(DataSet: TDataSet);
        procedure SQLQuery_Articulos_ComposicionesCalcFields(DataSet: TDataSet);
        procedure SQLQuery_Articulos_ProporcionesAfterPost(DataSet: TDataSet);
        procedure SQLQuery_Articulos_ProporcionesAfterScroll(DataSet: TDataSet);
        procedure SQLQuery_Articulos_ProporcionesBeforeEdit(DataSet: TDataSet);
        procedure SQLQuery_Articulos_ProporcionesBeforePost(DataSet: TDataSet);
        procedure SQLQuery_Articulos_ProporcionesCalcFields(DataSet: TDataSet);
        procedure SQLQuery_Articulos_Proporciones_TarifasAfterPost(DataSet: TDataSet);
        procedure SQLQuery_Articulos_Proporciones_TarifasBeforeEdit(DataSet: TDataSet);
        procedure SQLQuery_Articulos_Proporciones_TarifasBeforePost(DataSet: TDataSet);
        procedure SQLQuery_Articulos_Proporciones_TarifasCalcFields(DataSet: TDataSet);
        procedure SQLQuery_Articulos_RefAfterPost(DataSet: TDataSet);
        procedure SQLQuery_Articulos_RefBeforeEdit(DataSet: TDataSet);
        procedure SQLQuery_Articulos_RefBeforePost(DataSet: TDataSet);
        procedure SQLQuery_Articulos_RefCalcFields(DataSet: TDataSet);
        procedure SQLQuery_Articulos_StockAfterPost(DataSet: TDataSet);
        procedure SQLQuery_Articulos_StockBeforeEdit(DataSet: TDataSet);
        procedure SQLQuery_Articulos_StockBeforePost(DataSet: TDataSet);
        procedure SQLQuery_Articulos_StockCalcFields(DataSet: TDataSet);
        procedure SQLQuery_Articulos_TarifasAfterPost(DataSet: TDataSet);
        procedure SQLQuery_Articulos_TarifasBeforeEdit(DataSet: TDataSet);
        procedure SQLQuery_Articulos_TarifasBeforePost(DataSet: TDataSet);
        procedure SQLQuery_Articulos_TarifasCalcFields(DataSet: TDataSet);
        procedure SQLQuery_Articulos_TerminalesAfterPost(DataSet: TDataSet);
        procedure SQLQuery_Articulos_TerminalesBeforeEdit(DataSet: TDataSet);
        procedure SQLQuery_Articulos_TerminalesBeforePost(DataSet: TDataSet);
        procedure SQLQuery_Articulos_TerminalesCalcFields(DataSet: TDataSet);
        procedure SQLQuery_Ftra_Compras_DetallesCalcFields(DataSet: TDataSet);
        procedure SQLQuery_Ftra_Ventas_DetallesCalcFields(DataSet: TDataSet);
    private
        { private declarations }
        private_Salir_OK                        : Boolean;
        private_Order_By                        : array of TOrder_By;
        private_Order_By_tarifas                : array of TOrder_By;
        private_Order_By_terminales             : array of TOrder_By;
        private_Order_By_composiciones          : array of TOrder_By;
        private_Order_By_proporciones           : array of TOrder_By;
        private_Order_By_proporciones_tarifas   : array of TOrder_By;
        private_Order_By_stock                  : array of TOrder_By;
        private_Order_By_Ref                    : array of TOrder_By;
        private_Order_By_Alb_Compras_Detalle    : array of TOrder_By;
        private_Order_By_Alb_Ventas_Detalle     : array of TOrder_By;
        private_Order_By_Ftra_Compras_Detalle   : array of TOrder_By;
        private_Order_By_Ftra_Ventas_Detalle    : array of TOrder_By;
        private_Order_By_margenes               : array of TOrder_By;
    public
        { public declarations }
        public_Compra_Ultima_Fecha  : String;
        public_Compra_Ultimo_Precio : String;

        public_precio_Costo         : String;

        public_Solo_Ver             : Boolean;
        public_Elegimos             : Boolean;
        public_Menu_Worked          : Integer;
        public_Rgtro_Seleccionado   : Boolean;
        public_Ctdad_Rgistros_a_Ver : String;
    end;

var
    form_articulos_000: Tform_articulos_000;

implementation

{$R *.lfm}

uses dm_articulos, menu, articulos_001, articulos_familias_005;

{ Tform_articulos_000 }

procedure Tform_articulos_000.FormActivate(Sender: TObject);
begin
    If public_Elegimos = true then
    begin
        BitBtn_Seleccionar.Visible := True;
        BitBtn_Imprimir.Visible  := False;

        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    if public_Solo_Ver = true then no_Tocar;
end;

procedure Tform_articulos_000.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
    if private_Salir_OK = False then
        begin
            { ********************************************************************
              Intento BitBtn_SALIR de la aplicación de un modo no permitido.
              ********************************************************************
              Pero si desde el menu principal está a true la variable
              public_Salir_Ok, significa que hay que salir si o si pues se pulsó
              cancelar al preguntar otra vez por la contraseña
              ******************************************************************** }
              if form_Menu.public_Salir_OK = False then CloseAction := caNone;
        end
    else
        begin
           { ********************************************************************
             Fue correcto el modo como quiere BitBtn_SALIR de la aplicación
             ******************************************************************** }
        end;
end;

procedure Tform_articulos_000.FormCreate(Sender: TObject);
begin
    // ********************************************************************************************* //
    // ** Obligado en cada formulario para no olvidarlo                                           ** //
    // ********************************************************************************************* //
    with Self do
    begin
        Color       := $00C2C29E;
        Position    := poScreenCenter;
        BorderIcons := [];
        BorderStyle := bsSingle;
    end;

    private_Salir_OK := false;

    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    public_Solo_Ver                 := false;
    public_Elegimos                 := false;

    public_Rgtro_Seleccionado       := false;

    // ********************************************************************************************* //
    // ** Solo para este módulo                                                                   ** //
    // ********************************************************************************************* //
    public_Ctdad_Rgistros_a_Ver := '15';

    // --------------------------------------------------------------------------------------------- //
    // -- Vaciamos las variables de cálculo de cual fué el último precio de compra del artículo   -- //
    // --------------------------------------------------------------------------------------------- //
    Vaciar_variables_comprobacion_ultimo_precio_Compra;
end;

procedure Tform_articulos_000.Vaciar_variables_comprobacion_ultimo_precio_Compra;
begin
    // ********************************************************************************************* //
    // ** Vaciamos estas variables para calcular cual es el precio último de compra del artículo  ** //
    // ********************************************************************************************* //
    public_Compra_Ultima_Fecha  := '';
    public_Compra_Ultimo_Precio := '';
end;

procedure Tform_articulos_000.FormDestroy(Sender: TObject);
begin
    Cerramos_Tablas;
end;

procedure Tform_articulos_000.RadioGroup_BajasClick(Sender: TObject);
begin
    Refrescar_Registros;
end;

procedure Tform_articulos_000.SQLQuery_Alb_Compras_DetallesCalcFields(
  DataSet: TDataSet);
begin
    with SQLQuery_Alb_Compras_Detalles do
    begin
        if Trim(FieldByName('OT_Serie_Albaran').AsString) <> '' then
        begin
            FieldByName('OT_el_Albaran').AsString := Trim(FieldByName('OT_Serie_Albaran').AsString) +
                                                     '-' +
                                                     Trim(FieldByName('OT_Numero_Albaran').AsString);
        end else begin
            FieldByName('OT_el_Albaran').AsString := Trim(FieldByName('OT_Numero_Albaran').AsString);
        end;
    end;

    UTI_LINEAS_Poner_Totales_Linea_Detalle( SQLQuery_Alb_Compras_Detalles );
end;

procedure Tform_articulos_000.SQLQuery_Alb_Ventas_DetallesCalcFields(DataSet: TDataSet);
begin
    with SQLQuery_Alb_Ventas_Detalles do
    begin
        if Trim(FieldByName('OT_Serie_Albaran').AsString) <> '' then
        begin
            FieldByName('OT_el_Albaran').AsString := Trim(FieldByName('OT_Serie_Albaran').AsString) +
                                                     '-' +
                                                     Trim(FieldByName('OT_Numero_Albaran').AsString);
        end else begin
            FieldByName('OT_el_Albaran').AsString := Trim(FieldByName('OT_Numero_Albaran').AsString);
        end;
    end;

    UTI_LINEAS_Poner_Totales_Linea_Detalle( SQLQuery_Alb_Ventas_Detalles );
end;

procedure Tform_articulos_000.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_Articulos.SQLConnector_Art,
                      DataModule_Articulos.SQLTransaction_Art,
                      SQLQuery_Articulos ) = false then UTI_GEN_Salir;

    DataModule_Articulos.Free;
end;

procedure Tform_articulos_000.Cerramos_Tablas_Ligadas;
begin
    if UTI_TB_Cerrar( DataModule_Articulos.SQLConnector_ArtTarifas,
                      DataModule_Articulos.SQLTransaction_ArtTarifas,
                      SQLQuery_Articulos_Tarifas ) = false then UTI_GEN_Salir;

    if UTI_TB_Cerrar( DataModule_Articulos.SQLConnector_ArtTerminales,
                      DataModule_Articulos.SQLTransaction_ArtTerminales,
                      SQLQuery_Articulos_Terminales ) = false then UTI_GEN_Salir;

    if UTI_TB_Cerrar( DataModule_Articulos.SQLConnector_ArtComp,
                      DataModule_Articulos.SQLTransaction_ArtComp,
                      SQLQuery_Articulos_Composiciones ) = false then UTI_GEN_Salir;

    if UTI_TB_Cerrar( DataModule_Articulos.SQLConnector_ArtProp,
                      DataModule_Articulos.SQLTransaction_ArtProp,
                      SQLQuery_Articulos_Proporciones ) = false then UTI_GEN_Salir;

    Cerramos_Tablas_Ligadas_a_Proporciones;

    if UTI_TB_Cerrar( DataModule_Articulos.SQLConnector_ArtRef,
                      DataModule_Articulos.SQLTransaction_ArtRef,
                      SQLQuery_Articulos_Ref ) = false then UTI_GEN_Salir;

    if UTI_TB_Cerrar( DataModule_Articulos.SQLConnector_ArtStock,
                      DataModule_Articulos.SQLTransaction_ArtStock,
                      SQLQuery_Articulos_Stock ) = false then UTI_GEN_Salir;

    Cerramos_Tablas_de_Compras;

    if UTI_TB_Cerrar( DataModule_Articulos.SQLConnector_Alb_Ventas_Detalles,
                      DataModule_Articulos.SQLTransaction_Alb_Ventas_Detalles,
                      SQLQuery_Alb_Ventas_Detalles ) = false then UTI_GEN_Salir;

    if UTI_TB_Cerrar( DataModule_Articulos.SQLConnector_Ftra_Ventas_Detalles,
                      DataModule_Articulos.SQLTransaction_Ftra_Ventas_Detalles,
                      SQLQuery_Ftra_Ventas_Detalles ) = false then UTI_GEN_Salir;
end;

procedure Tform_articulos_000.Cerramos_Tablas_de_Compras;
begin
    if UTI_TB_Cerrar( DataModule_Articulos.SQLConnector_Alb_Compras_Detalles,
                      DataModule_Articulos.SQLTransaction_Alb_Compras_Detalles,
                      SQLQuery_Alb_Compras_Detalles ) = false then UTI_GEN_Salir;

    if UTI_TB_Cerrar( DataModule_Articulos.SQLConnector_Ftra_Compras_Detalles,
                      DataModule_Articulos.SQLTransaction_Ftra_Compras_Detalles,
                      SQLQuery_Ftra_Compras_Detalles ) = false then UTI_GEN_Salir;
end;

procedure Tform_articulos_000.Cerramos_Tablas_Ligadas_a_Proporciones;
begin
    if UTI_TB_Cerrar( DataModule_Articulos.SQLConnector_ArtPropTa,
                      DataModule_Articulos.SQLTransaction_ArtPropTa,
                      SQLQuery_Articulos_Proporciones_Tarifas ) = false then UTI_GEN_Salir;
end;

procedure Tform_articulos_000.SQLQuery_ArticulosCalcFields(DataSet: TDataSet);
begin
    // ********************************************************************************************* //
    // ** PARA DAR VALOR A CAMPOS CALCULADOS                                                      ** //
    // ********************************************************************************************* //
end;

procedure Tform_articulos_000.SQLQuery_Articulos_ComposicionesAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'articulos_composiciones',
                       DataModule_Articulos.SQLTransaction_ArtComp,
                       SQLQuery_Articulos_Composiciones,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros_Composiciones;
end;

procedure Tform_articulos_000.SQLQuery_Articulos_ComposicionesBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Articulos_Composiciones );
end;

procedure Tform_articulos_000.SQLQuery_Articulos_ComposicionesCalcFields(DataSet: TDataSet);
begin
    // ********************************************************************************************* //
    // ** PARA DAR VALOR A CAMPOS CALCULADOS                                                      ** //
    // ********************************************************************************************* //
    with SQLQuery_Articulos_Composiciones do
    begin
        // ***************************************************************************************** //
        // ** Comprobamos si se han traido datos tanto de albaranes como de facturas              ** //
        // ***************************************************************************************** //
        if (not FieldByName('OT_Alb_Fecha_Movimiento').IsNull)  and
           (not FieldByName('OT_Ftra_Fecha_Movimiento').IsNull) then
        begin
            // ************************************************************************************* //
            // ** Se han traido datos tanto de albaranes como de facturas                         ** //
            // ************************************************************************************* //
            if FieldByName('OT_Alb_Fecha_Movimiento').Value >
               FieldByName('OT_Ftra_Fecha_Movimiento').Value then
            begin
                // ********************************************************************************* //
                // ** Los datos de albaranes son más recientes                                    ** //
                // ********************************************************************************* //
                if not FieldByName('OT_Alb_PVP').IsNull then
                begin
                    FieldByName('OT_Coste_Unidad').Value := FieldByName('OT_Alb_PVP').Value;
                end;
            end else begin
                // ********************************************************************************* //
                // ** Los datos de facutras son más recientes                                     ** //
                // ********************************************************************************* //
                if not FieldByName('OT_Ftra_PVP').IsNull then
                begin
                    FieldByName('OT_Coste_Unidad').Value := FieldByName('OT_Ftra_PVP').Value;
                end;
            end;
        end else begin
            // ************************************************************************************* //
            // ** O hay datos de albaranes ó los hay de facturas                                  ** //
            // ************************************************************************************* //
            if not FieldByName('OT_Alb_Fecha_Movimiento').IsNull then
            begin
                // ********************************************************************************* //
                // ** Solo hay datos de albaranes                                                 ** //
                // ********************************************************************************* //
                if not FieldByName('OT_Alb_PVP').IsNull then
                begin
                    FieldByName('OT_Coste_Unidad').Value := FieldByName('OT_Alb_PVP').Value;
                end;
            end else begin
                // ********************************************************************************* //
                // ** Solo hay datos de facturas                                                  ** //
                // ********************************************************************************* //
                if not FieldByName('OT_Ftra_PVP').IsNull then
                begin
                    FieldByName('OT_Coste_Unidad').Value := FieldByName('OT_Ftra_PVP').Value;
                end;
            end;
        end;
    end;
end;

procedure Tform_articulos_000.SQLQuery_Articulos_ProporcionesAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'articulos_proporciones',
                       DataModule_Articulos.SQLTransaction_ArtProp,
                       SQLQuery_Articulos_Proporciones,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros_Proporciones;
end;

procedure Tform_articulos_000.SQLQuery_Articulos_ProporcionesAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas_a_Proporciones;
end;

procedure Tform_articulos_000.SQLQuery_Articulos_ProporcionesBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Articulos_Proporciones );
end;

procedure Tform_articulos_000.SQLQuery_Articulos_ProporcionesCalcFields(DataSet: TDataSet);
begin
    // ********************************************************************************************* //
    // ** PARA DAR VALOR A CAMPOS CALCULADOS                                                      ** //
    // ********************************************************************************************* //
end;

procedure Tform_articulos_000.SQLQuery_Articulos_Proporciones_TarifasAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'articulos_proporciones_tarifas',
                       DataModule_Articulos.SQLTransaction_ArtPropTa,
                       SQLQuery_Articulos_Proporciones_Tarifas,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros_Proporciones_Tarifas;
end;

procedure Tform_articulos_000.SQLQuery_Articulos_Proporciones_TarifasBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Articulos_Proporciones_Tarifas );
end;

procedure Tform_articulos_000.SQLQuery_Articulos_Proporciones_TarifasCalcFields(DataSet: TDataSet);
begin
    // ********************************************************************************************* //
    // ** PARA DAR VALOR A CAMPOS CALCULADOS                                                      ** //
    // ********************************************************************************************* //
end;

procedure Tform_articulos_000.SQLQuery_Articulos_RefAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'articulos_referencias',
                       DataModule_Articulos.SQLTransaction_ArtRef,
                       SQLQuery_Articulos_Ref,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros_Referencias;
end;

procedure Tform_articulos_000.SQLQuery_Articulos_RefBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Articulos_Ref );
end;

procedure Tform_articulos_000.SQLQuery_Articulos_RefBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Articulos_Ref );
end;

procedure Tform_articulos_000.SQLQuery_Articulos_RefCalcFields(DataSet: TDataSet);
begin
    // ********************************************************************************************* //
    // ** PARA DAR VALOR A CAMPOS CALCULADOS                                                      ** //
    // ********************************************************************************************* //
end;

procedure Tform_articulos_000.SQLQuery_Articulos_StockAfterPost(
  DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'articulos_stock',
                       DataModule_Articulos.SQLTransaction_ArtStock,
                       SQLQuery_Articulos_Stock,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros_Stock;
end;

procedure Tform_articulos_000.SQLQuery_Articulos_StockBeforeEdit(
  DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Articulos_Stock );
end;

procedure Tform_articulos_000.SQLQuery_Articulos_StockBeforePost(
  DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Articulos_Stock );
end;

procedure Tform_articulos_000.SQLQuery_Articulos_StockCalcFields(
  DataSet: TDataSet);
begin
    // ********************************************************************************************* //
    // ** PARA DAR VALOR A CAMPOS CALCULADOS                                                      ** //
    // ********************************************************************************************* //
end;

procedure Tform_articulos_000.SQLQuery_Articulos_TerminalesAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'articulos_terminales',
                       DataModule_Articulos.SQLTransaction_ArtTerminales,
                       SQLQuery_Articulos_Terminales,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros_Terminales;
end;

procedure Tform_articulos_000.SQLQuery_Articulos_TerminalesBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Articulos_Terminales );
end;

procedure Tform_articulos_000.SQLQuery_Articulos_TerminalesCalcFields(DataSet: TDataSet);
begin
    // ********************************************************************************************* //
    // ** PARA DAR VALOR A CAMPOS CALCULADOS                                                      ** //
    // ********************************************************************************************* //
end;

procedure Tform_articulos_000.SQLQuery_Ftra_Compras_DetallesCalcFields(
  DataSet: TDataSet);
begin
    with SQLQuery_Ftra_Compras_Detalles do
    begin
        if Trim(FieldByName('OT_Serie_Factura').AsString) <> '' then
        begin
            FieldByName('OT_la_Factura').AsString := Trim(FieldByName('OT_Serie_Factura').AsString) +
                                                     '-' +
                                                     Trim(FieldByName('OT_Numero_Factura').AsString);
        end else begin
            FieldByName('OT_la_Factura').AsString := Trim(FieldByName('OT_Numero_Factura').AsString);
        end;
    end;

    UTI_LINEAS_Poner_Totales_Linea_Detalle( SQLQuery_Ftra_Compras_Detalles );
end;

procedure Tform_articulos_000.SQLQuery_Ftra_Ventas_DetallesCalcFields(DataSet: TDataSet);
begin
    with SQLQuery_Ftra_Ventas_Detalles do
    begin
        if Trim(FieldByName('OT_Serie_Factura').AsString) <> '' then
        begin
            FieldByName('OT_la_Factura').AsString := Trim(FieldByName('OT_Serie_Factura').AsString) +
                                                     '-' +
                                                     Trim(FieldByName('OT_Numero_Factura').AsString);
        end else begin
            FieldByName('OT_la_Factura').AsString := Trim(FieldByName('OT_Numero_Factura').AsString);
        end;
    end;

    UTI_LINEAS_Poner_Totales_Linea_Detalle( SQLQuery_Ftra_Ventas_Detalles );
end;

procedure Tform_articulos_000.SQLQuery_ArticulosAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'articulos',
                       DataModule_Articulos.SQLTransaction_Art,
                       SQLQuery_Articulos,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros;
end;

procedure Tform_articulos_000.SQLQuery_ArticulosAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure Tform_articulos_000.SQLQuery_ArticulosBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Articulos );
end;

procedure Tform_articulos_000.SQLQuery_Articulos_TarifasAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'articulos_tarifas',
                       DataModule_Articulos.SQLTransaction_ArtTarifas,
                       SQLQuery_Articulos_Tarifas,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros_Tarifas;
end;

procedure Tform_articulos_000.SQLQuery_Articulos_TarifasBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Articulos_Tarifas );
end;

procedure Tform_articulos_000.SQLQuery_Articulos_TarifasCalcFields(DataSet: TDataSet);
var var_Calculo : String;
begin
    with SQLQuery_Articulos_Tarifas do
    begin
        if not FieldByName('OT_Beneficio').IsNull then
        begin
            // ************************************************************************************* //
            // ** Se puso cantidad para incrementar                                               ** //
            // ************************************************************************************* //
            if Trim(FieldByName('OT_Beneficio_en_Tanto_por_Ciento_SN').AsString) = 'S' then
            begin
                // ********************************************************************************* //
                // ** Se calculará incrementando el tanto por ciento                              ** //
                // ********************************************************************************* //
                if Trim(public_Compra_Ultimo_Precio) <> '' then
                begin
                    var_Calculo := FloatToStr( ( StrToFloat(public_Compra_Ultimo_Precio) *
                                                 FieldByName('OT_Beneficio').Value ) / 100 );

                    var_Calculo := UTI_GEN_Round_to_2_Decimal(Trim(var_Calculo));

                    FieldByName('OT_Importe_Neto_Sugerido').Value := StrToFloat(public_Compra_Ultimo_Precio) +
                                                                     StrToFloat(var_Calculo);
                end;
            end else begin
                // ********************************************************************************* //
                // ** Se calculará incrementando la cantidad, no el tanto por ciento              ** //
                // ********************************************************************************* //
                if Trim(public_Compra_Ultimo_Precio) <> '' then
                begin
                    FieldByName('OT_Importe_Neto_Sugerido').Value := StrToFloat(public_Compra_Ultimo_Precio) +
                                                                     FieldByName('OT_Beneficio').Value;
                end;
            end;
        end;
    end;
end;

procedure Tform_articulos_000.para_Empezar;
begin
    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    if UTI_GEN_Form_Abierto_Ya('DataModule_Articulos') = False then
    begin
        DataModule_Articulos := TDataModule_Articulos.Create(Application);
    end;

    // ********************************************************************************************* //
    // ** Preparamos los diferentes tipos de orden preconfigurados                                ** //
    // ********************************************************************************************* //
    // ARTICULOS
    SetLength(private_Order_By, 1);

    private_Order_By[0].Titulo       := rs_para_Empezar_1; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[0].Memo_OrderBy := 'a.descripcion ASC';

    Memo_OrderBy.Lines.Text          := private_Order_By[0].Memo_OrderBy;

    UTI_TB_Rellenar_ComboBox_Orden( true,
                                    ComboBox_Filtros,
                                    private_Order_By,
                                    0 );

    // ARTICULOS TARIFAS
    SetLength(private_Order_By_tarifas, 1);

    private_Order_By_tarifas[0].Titulo       := rs_para_Empezar_2; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_tarifas[0].Memo_OrderBy := 'ta.id_articulos ASC, ta.id_tarifas ASC';

    // ARTICULOS TERMINALES
    SetLength(private_Order_By_terminales, 1);

    private_Order_By_terminales[0].Titulo       := rs_para_Empezar_3; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_terminales[0].Memo_OrderBy := 'te.id_articulos ASC, te.id_terminales ASC';

    // ARTICULOS COMPOSICIONES
    SetLength(private_Order_By_composiciones, 1);

    private_Order_By_composiciones[0].Titulo       := rs_para_Empezar_4; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_composiciones[0].Memo_OrderBy := 'co.id_articulos ASC, co.id_articulos_composiciones ASC';

    // ARTICULOS PROPORCIONES
    SetLength(private_Order_By_proporciones, 1);

    private_Order_By_proporciones[0].Titulo       := rs_para_Empezar_5; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_proporciones[0].Memo_OrderBy := 'po.id_articulos ASC, po.descripcion ASC';

    // ARTICULOS PROPORCIONES TARIFAS
    SetLength(private_Order_By_proporciones_tarifas, 1);

    private_Order_By_proporciones_tarifas[0].Titulo       := rs_para_Empezar_6; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_proporciones_tarifas[0].Memo_OrderBy := 'apta.id_articulos_proporciones ASC, apta.id_tarifas ASC';

    // ARTICULOS STOCK
    SetLength(private_Order_By_stock, 1);

    private_Order_By_stock[0].Titulo       := rs_para_Empezar_7; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_stock[0].Memo_OrderBy := 'st.id_articulos ASC, st.id_almacenes ASC';

    // ARTICULOS REFERENCIAS
    SetLength(private_Order_By_Ref, 1);

    private_Order_By_Ref[0].Titulo       := rs_para_Empezar_7; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_Ref[0].Memo_OrderBy := 'arf.id_articulos ASC, arf.CodigoBarras_o_Referencia ASC, arf.CodigoBarras_Referencia ASC';

    // ALBARANES DE COMPRAS DETALLE SIN FACTURAR
    SetLength(private_Order_By_Alb_Compras_Detalle, 1);

    private_Order_By_Alb_Compras_Detalle[0].Titulo       := rs_para_Empezar_7; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_Alb_Compras_Detalle[0].Memo_OrderBy := 'acd.id_articulos DESC, acd.Fecha_Movimiento DESC, acd.id DESC';

    // ALBARANES DE VENTAS DETALLE SIN FACTURAR
    SetLength(private_Order_By_Alb_Ventas_Detalle, 1);

    private_Order_By_Alb_Ventas_Detalle[0].Titulo       := rs_para_Empezar_7; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_Alb_Ventas_Detalle[0].Memo_OrderBy := 'ad.id_articulos DESC, ad.Fecha_Movimiento DESC, ad.id DESC';

    // FACTURAS DE COMPRAS DETALLE
    SetLength(private_Order_By_Ftra_Compras_Detalle, 1);

    private_Order_By_Ftra_Compras_Detalle[0].Titulo       := rs_para_Empezar_7; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_Ftra_Compras_Detalle[0].Memo_OrderBy := 'fcd.id_articulos DESC, fcd.Fecha_Movimiento DESC, fcd.id DESC';

    // FACTURAS DE VENTAS DETALLE
    SetLength(private_Order_By_Ftra_Ventas_Detalle, 1);

    private_Order_By_Ftra_Ventas_Detalle[0].Titulo       := rs_para_Empezar_7; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_Ftra_Ventas_Detalle[0].Memo_OrderBy := 'fd.id_articulos DESC, fd.Fecha_Movimiento DESC, fd.id DESC';

    // TARIFAS_MARGENES
    SetLength(private_Order_By_margenes, 1);

    private_Order_By_margenes[0].Titulo       := 'Por margen de beneficio'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_margenes[0].Memo_OrderBy := 'tm.id_tarifas ASC, tm.id_margenes_tarifas ASC';

    // ********************************************************************************************* //
    // ** Filtramos los datos                                                                     ** //
    // ********************************************************************************************* //
    Filtrar_Principal_Sin_Preguntar;

    Presentar_Datos;

    // ********************************************************************************************* //
    // ** SOLO PARA ESTE FORM                                                                     ** //
    // ********************************************************************************************* //
    PageControl_Filtros.ActivePage := TabSheet_Busqueda_Concreta;
end;

procedure Tform_articulos_000.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    If public_Elegimos then
         Seleccionado_Rgtro
    else Editar_Registro;
end;

procedure Tform_articulos_000.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure Tform_articulos_000.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_articulos_000.DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    UTI_GEN_Dibujar_Grid( Sender, SQLQuery_Articulos, Rect, DataCol, Column, State );
end;

procedure Tform_articulos_000.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then
    begin
        If public_Elegimos then
             Seleccionado_Rgtro
        else Editar_Registro;
    end;
end;

procedure Tform_articulos_000.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

procedure Tform_articulos_000.Seleccionado_Rgtro;
begin
    private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    public_Rgtro_Seleccionado := true;
    Close;
end;

procedure Tform_articulos_000.BitBtn_SeleccionarClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
end;

procedure Tform_articulos_000.BitBtn_ImprimirClick(Sender: TObject);
var var_Ficheros     : TStrings;
    var_Ordenado_por : String;
begin
    // ********************************************************************************************* //
    // ** Configuramos el título del listado                                                      ** //
    // ********************************************************************************************* //
    var_Ordenado_por := rs_Filtros_Otros_1 +
                        Trim(ComboBox_Filtros.Text);

    if Trim(Memo_Filtros.Lines.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            rs_Filtros_Otros_2 +
                            Trim(Memo_Filtros.Lines.Text);
    end;

    if Trim(Edit_Descripcion.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            rs_BitBtn_ImprimirClick_1 +
                            Trim(Edit_Descripcion.Text) + '%';
    end;

    if Trim(Edit_Descripcion_Para_Terminal.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            rs_BitBtn_ImprimirClick_2 +
                            Trim(Edit_Descripcion_Para_Terminal.Text) + '%';
    end;

    if Trim(Edit_Descripcion_id_articulos_familias.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            rs_BitBtn_ImprimirClick_3 +
                            Trim(Edit_Descripcion_id_articulos_familias.Text);
    end;


    if Trim(Edit_Descripcion_id_proveedores.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            rs_BitBtn_ImprimirClick_4 +
                            Trim(Edit_Descripcion_id_proveedores.Text);
    end;

    // ********************************************************************************************* //
    // ** Configuramos la llamada al generador de informes                                        ** //
    // ********************************************************************************************* //
    var_Ficheros := TStringList.Create;

    UTI_GEN_Informes( var_Ordenado_por,
                      SQLQuery_Articulos,
                      DataSource_Art,
                      Nil,
                      Nil,
                      Nil,
                      public_Menu_Worked,
                      public_Solo_Ver,
                      '',
                      '',
                      var_Ficheros );

    var_Ficheros.Free;
end;

procedure Tform_articulos_000.no_Tocar;
begin
    BitBtn_Imprimir.Enabled := False;
end;

procedure Tform_articulos_000.Presentar_Datos;
begin
     /// guardar por lo que pueda pasar
end;

procedure Tform_articulos_000.BitBtn_FiltrarClick(Sender: TObject);
begin
    if PageControl_Filtros.ActivePage = TabSheet_Busqueda_Concreta then
    begin
        Filtrar_Principal_Sin_Preguntar;
    end else begin
        RadioGroup_Bajas.ItemIndex := Filtrar_Principal( true );
    end;
end;

procedure Tform_articulos_000.BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if SQLQuery_Articulos.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'articulos',
                                           SQLQuery_Articulos,
                                           DataSource_Art,
                                           DBGrid_Principal );
        end;
    end;
end;

procedure Tform_articulos_000.DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
var var_id          : ShortString;
    var_dar_de_Baja : Boolean;
    // var_msg         : TStrings;
begin
    //Filtrar_tablas_ligadas;

    case Button of
        nbInsert : begin
            Insertar_Registro;
            Abort;
        end;

        nbEdit : begin
            Editar_Registro;
            Abort;
        end;

        nbDelete : begin
            if UTI_USR_Permiso_SN(public_Menu_Worked, 'B', True) = True then
            begin
                var_id := SQLQuery_Articulos.FieldByName('id').AsString;

                var_dar_de_Baja := true;
                if not SQLQuery_Articulos.FieldByName('Del_WHEN').isNull then
                begin
                    var_dar_de_Baja := false;
                end;

                UTI_RGTRO_Borrar( 'articulos',
                                  SQLQuery_Articulos,
                                  public_Solo_Ver,
                                  public_Menu_Worked );
            end;

            Abort;
        end;

        nbRefresh : begin
            Refrescar_Registros;
            Abort;
        end;
    end;
end;

procedure Tform_articulos_000.Refrescar_Registros;
var var_descripcion : String;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_descripcion := '';

    if SQLQuery_Articulos.RecordCount > 0 then
    begin
        var_descripcion := SQLQuery_Articulos.FieldByName('descripcion').asString;
    end;

    Filtrar_Principal_Sin_Preguntar;

    if Trim(var_descripcion) <> '' then
    begin
         SQLQuery_Articulos.Locate('descripcion', var_descripcion, []);
    end;
end;

procedure Tform_articulos_000.Refrescar_Registros_Tarifas;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
    var_ver_Bajas      : ShortInt;

    var_id_articulos   : LargeInt;
    var_id_tarifas     : LargeInt;
begin
    // ********************************************************************************************* //
    // ** Solo si la cabecera está en modo EDIT se abren las tablas hijas                         ** //
    // ********************************************************************************************* //
    if SQLQuery_Articulos.State <> dsEdit then Exit;

    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_id_articulos := 0;
    var_id_tarifas   := 0;

    if SQLQuery_Articulos_Tarifas.RecordCount > 0 then
    begin
        if not SQLQuery_Articulos_Tarifas.FieldByName('id_articulos').IsNull then
        begin
             var_id_articulos := SQLQuery_Articulos_Tarifas.FieldByName('id_articulos').Value;
        end;

        if not SQLQuery_Articulos_Tarifas.FieldByName('id_tarifas').IsNull then
        begin
             var_id_tarifas := SQLQuery_Articulos_Tarifas.FieldByName('id_tarifas').Value;
        end;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Clear;
    var_Lineas_OrderBy.Clear;

    if Trim(SQLQuery_Articulos.FieldByName('id').AsString) <> '' then
         var_Lineas_Filtro.Add('ta.id_articulos = ' + Trim(SQLQuery_Articulos.FieldByName('id').AsString))
    else var_Lineas_Filtro.Add('ta.id_articulos = Null');

    var_ver_Bajas := RadioGroup_Bajas.ItemIndex;
    if UTI_GEN_Form_Abierto_Ya('form_articulos_001') = true then
    begin
        var_ver_Bajas := form_articulos_001.RadioGroup_Bajas.ItemIndex;
    end;

    Filtrar_Articulos_Tarifas( var_ver_Bajas,
                               false,
                               var_Lineas_Filtro,
                               var_Lineas_OrderBy );

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;

    if var_id_tarifas <> 0 then
    begin
        SQLQuery_Articulos_Tarifas.Locate( 'id_articulos;id_tarifas',
                                           VarArrayOf( [ var_id_articulos,
                                                         var_id_tarifas ] ),
                                           [] );
    end;
end;

procedure Tform_articulos_000.Refrescar_Registros_Terminales;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
    var_ver_Bajas      : ShortInt;

    var_id_articulos   : LargeInt;
    var_id_terminales  : LargeInt;
begin
    // ********************************************************************************************* //
    // ** Solo si la cabecera está en modo EDIT se abren las tablas hijas                         ** //
    // ********************************************************************************************* //
    if SQLQuery_Articulos.State <> dsEdit then Exit;

    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_id_articulos  := 0;
    var_id_terminales := 0;

    if SQLQuery_Articulos_Terminales.RecordCount > 0 then
    begin
        if not SQLQuery_Articulos_Terminales.FieldByName('id_articulos').IsNull then
        begin
             var_id_articulos := SQLQuery_Articulos_Terminales.FieldByName('id_articulos').Value;
        end;

        if not SQLQuery_Articulos_Terminales.FieldByName('id_terminales').IsNull then
        begin
             var_id_terminales := SQLQuery_Articulos_Terminales.FieldByName('id_terminales').Value;
        end;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Clear;
    var_Lineas_OrderBy.Clear;

    if Trim(SQLQuery_Articulos.FieldByName('id').AsString) <> '' then
         var_Lineas_Filtro.Add('te.id_articulos = ' + Trim(SQLQuery_Articulos.FieldByName('id').AsString))
    else var_Lineas_Filtro.Add('te.id_articulos = Null');

    var_ver_Bajas := RadioGroup_Bajas.ItemIndex;
    if UTI_GEN_Form_Abierto_Ya('form_articulos_001') = true then
    begin
        var_ver_Bajas := form_articulos_001.RadioGroup_Bajas.ItemIndex;
    end;

    Filtrar_Articulos_Terminales( var_ver_Bajas,
                                  false,
                                  var_Lineas_Filtro,
                                  var_Lineas_OrderBy );

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;

    if var_id_terminales <> 0 then
    begin
        SQLQuery_Articulos_Terminales.Locate( 'id_articulos;id_terminales',
                                              VarArrayOf( [ var_id_articulos,
                                                            var_id_terminales ] ),
                                              [] );
    end;
end;

procedure Tform_articulos_000.Refrescar_Registros_Composiciones;
var var_Lineas_Filtro              : TStrings;
    var_Lineas_OrderBy             : TStrings;
    var_ver_Bajas                  : ShortInt;

    var_id_articulos               : LargeInt;
    var_id_articulos_composiciones : LargeInt;
begin
    // ********************************************************************************************* //
    // ** Solo si la cabecera está en modo EDIT se abren las tablas hijas                         ** //
    // ********************************************************************************************* //
    if SQLQuery_Articulos.State <> dsEdit then Exit;

    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_id_articulos               := 0;
    var_id_articulos_composiciones := 0;

    if SQLQuery_Articulos_Composiciones.RecordCount > 0 then
    begin
        if not SQLQuery_Articulos_Composiciones.FieldByName('id_articulos').IsNull then
        begin
             var_id_articulos := SQLQuery_Articulos_Composiciones.FieldByName('id_articulos').Value;
        end;

        if not SQLQuery_Articulos_Composiciones.FieldByName('id_articulos_composiciones').IsNull then
        begin
             var_id_articulos_composiciones := SQLQuery_Articulos_Composiciones.FieldByName('id_articulos_composiciones').Value;
        end;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Clear;
    var_Lineas_OrderBy.Clear;

    if Trim(SQLQuery_Articulos.FieldByName('id').AsString) <> '' then
         var_Lineas_Filtro.Add('co.id_articulos = ' + Trim(SQLQuery_Articulos.FieldByName('id').AsString))
    else var_Lineas_Filtro.Add('co.id_articulos = Null');

    var_ver_Bajas := RadioGroup_Bajas.ItemIndex;
    if UTI_GEN_Form_Abierto_Ya('form_articulos_001') = true then
    begin
        var_ver_Bajas := form_articulos_001.RadioGroup_Bajas.ItemIndex;
    end;

    Filtrar_Articulos_Composiciones( var_ver_Bajas,
                                     false,
                                     var_Lineas_Filtro,
                                     var_Lineas_OrderBy );

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;

    if var_id_articulos_composiciones <> 0 then
    begin
        SQLQuery_Articulos_Composiciones.Locate( 'id_articulos;id_articulos_composiciones',
                                                 VarArrayOf( [ var_id_articulos,
                                                               var_id_articulos_composiciones ] ),
                                                 [] );
    end;
end;

procedure Tform_articulos_000.Refrescar_Registros_Proporciones;
var var_Lineas_Filtro             : TStrings;
    var_Lineas_OrderBy            : TStrings;
    var_ver_Bajas                 : ShortInt;

    var_id_articulos              : LargeInt;
    var_descripcion               : string;
begin
    // ********************************************************************************************* //
    // ** Solo si la cabecera está en modo EDIT se abren las tablas hijas                         ** //
    // ********************************************************************************************* //
    if SQLQuery_Articulos.State <> dsEdit then Exit;

    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_id_articulos := 0;
    var_descripcion  := '';

    if SQLQuery_Articulos_Proporciones.RecordCount > 0 then
    begin
        if not SQLQuery_Articulos_Proporciones.FieldByName('id_articulos').IsNull then
        begin
             var_id_articulos := SQLQuery_Articulos_Proporciones.FieldByName('id_articulos').Value;
        end;

        if not SQLQuery_Articulos_Proporciones.FieldByName('descripcion').IsNull then
        begin
             var_descripcion := SQLQuery_Articulos_Proporciones.FieldByName('descripcion').Value;
        end;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Clear;
    var_Lineas_OrderBy.Clear;

    if Trim(SQLQuery_Articulos.FieldByName('id').AsString) <> '' then
         var_Lineas_Filtro.Add('po.id_articulos = ' + Trim(SQLQuery_Articulos.FieldByName('id').AsString))
    else var_Lineas_Filtro.Add('po.id_articulos = Null');

    var_ver_Bajas := RadioGroup_Bajas.ItemIndex;
    if UTI_GEN_Form_Abierto_Ya('form_articulos_001') = true then
    begin
        var_ver_Bajas := form_articulos_001.RadioGroup_Bajas.ItemIndex;
    end;

    Filtrar_Articulos_proporciones( var_ver_Bajas,
                                    false,
                                    var_Lineas_Filtro,
                                    var_Lineas_OrderBy );

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;

    if Trim(var_descripcion) <> '' then
    begin
        SQLQuery_Articulos_Proporciones.Locate( 'id_articulos;descripcion',
                                                 VarArrayOf( [ var_id_articulos,
                                                               var_descripcion ] ),
                                                 [] );
    end;
end;

function Tform_articulos_000.Filtrar_Articulos_Composiciones( param_ver_bajas : ShortInt;
                                                              param_Cambiamos_Filtro : Boolean;
                                                              param_Lineas_Filtro,
                                                              param_Lineas_OrderBy : TStrings ) : ShortInt;
var
  var_a_Filtrar_Plus : TStrings;
begin
  var_a_Filtrar_Plus := TStringList.Create;
  var_a_Filtrar_Plus.Clear;

  if Trim(param_Lineas_OrderBy.Text) = '' then
  begin
    param_Lineas_OrderBy.Text := private_Order_By_composiciones[0].Memo_OrderBy;
  end;

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  Result := UTI_TB_Filtrar( private_Order_By_composiciones,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Articulos_Composiciones,
                                                          'articulos_composiciones',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Articulos_Composiciones,
                                                          'articulos_composiciones',
                                                          'i' ),

                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_Articulos.SQLTransaction_ArtComp,
                            DataModule_Articulos.SQLConnector_ArtComp,
                            SQLQuery_Articulos_Composiciones,

                            // name_tabla,
                            'co',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT co.*,' + ' ' +

                                   '( SELECT a1.Fecha_Movimiento FROM albaranes_compras_detalles AS a1' + ' ' +
                                      'RIGHT JOIN albaranes_compras AS b2' + ' ' +
                                         'ON a1.id_albaranes = b2.id AND' + ' ' +
                                            'b2.Del_WHEN IS NULL' + ' ' +
                                      'WHERE a1.id_articulos = co.id_articulos_composiciones' + ' ' +
                                        'AND a1.Numero_Factura IS NULL' + ' ' +
                                        'AND a1.Del_WHEN IS NULL' + ' ' +
                                      'ORDER BY a1.id_articulos DESC, a1.Fecha_Movimiento DESC, a1.id DESC' + ' ' +
                                      'LIMIT 1 ) AS OT_Alb_Fecha_Movimiento,' + ' ' +

                                   '( SELECT a1.PVP FROM albaranes_compras_detalles AS a1' + ' ' +
                                      'RIGHT JOIN albaranes_compras AS b2' + ' ' +
                                         'ON a1.id_albaranes = b2.id AND' + ' ' +
                                            'b2.Del_WHEN IS NULL' + ' ' +
                                      'WHERE a1.id_articulos = co.id_articulos_composiciones' + ' ' +
                                        'AND a1.Numero_Factura IS NULL' + ' ' +
                                        'AND a1.Del_WHEN IS NULL' + ' ' +
                                      'ORDER BY a1.id_articulos DESC, a1.Fecha_Movimiento DESC, a1.id DESC' + ' ' +
                                      'LIMIT 1 ) AS OT_Alb_PVP,' + ' ' +

                                   '( SELECT a1.Fecha_Movimiento' + ' ' +
                                       'FROM facturas_compras_detalles AS a1' + ' ' +
                                      'RIGHT JOIN facturas_compras AS b2' + ' ' +
                                         'ON a1.id_facturas = b2.id AND' + ' ' +
                                            'b2.Del_WHEN IS NULL' + ' ' +
                                      'WHERE a1.id_articulos = co.id_articulos_composiciones' + ' ' +
                                        'AND a1.Del_WHEN IS NULL' + ' ' +
                                      'ORDER BY a1.id_articulos DESC, a1.Fecha_Movimiento DESC, a1.id DESC' + ' ' +
                                      'LIMIT 1 ) AS OT_Ftra_Fecha_Movimiento,' + ' ' +

                                   '( SELECT a1.PVP' + ' ' +
                                       'FROM facturas_compras_detalles AS a1' + ' ' +
                                      'RIGHT JOIN facturas_compras AS b2' + ' ' +
                                         'ON a1.id_facturas = b2.id AND' + ' ' +
                                            'b2.Del_WHEN IS NULL' + ' ' +
                                      'WHERE a1.id_articulos = co.id_articulos_composiciones' + ' ' +
                                        'AND a1.Del_WHEN IS NULL' + ' ' +
                                      'ORDER BY a1.id_articulos DESC, a1.Fecha_Movimiento DESC, a1.id DESC' + ' ' +
                                      'LIMIT 1 ) AS OT_Ftra_PVP,' + ' ' +

                                   'a.descripcion AS OT_descripcion_articulo_composicion' + ' ' +

                            'FROM articulos_composiciones AS co' + ' ' +

                            'LEFT JOIN articulos AS a' + ' ' +
                              'ON co.id_articulos_composiciones = a.id' + ' ',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  Calcular_Composicion_Total_Coste;
  var_a_Filtrar_Plus.Free;
end;

function Tform_articulos_000.Filtrar_Articulos_Terminales( param_ver_bajas : ShortInt;
                                                           param_Cambiamos_Filtro : Boolean;
                                                           param_Lineas_Filtro,
                                                           param_Lineas_OrderBy : TStrings ) : ShortInt;
var
  var_a_Filtrar_Plus : TStrings;
begin
  var_a_Filtrar_Plus := TStringList.Create;
  var_a_Filtrar_Plus.Clear;

  if Trim(param_Lineas_OrderBy.Text) = '' then
  begin
    param_Lineas_OrderBy.Text := private_Order_By_terminales[0].Memo_OrderBy;
  end;

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  Result := UTI_TB_Filtrar( private_Order_By_terminales,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Articulos_Terminales,
                                                          'articulos_terminales',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Articulos_Terminales,
                                                          'articulos_terminales',
                                                          'i' ),

                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_Articulos.SQLTransaction_ArtTerminales,
                            DataModule_Articulos.SQLConnector_ArtTerminales,
                            SQLQuery_Articulos_Terminales,

                            // name_tabla,
                            'te',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT te.*,' + ' ' +
                                   't.descripcion AS OT_descripcion_terminal' + ' ' +
                            'FROM articulos_terminales AS te' + ' ' +

                            'LEFT JOIN terminales AS t' + ' ' +
                            'ON te.id_terminales = t.id' + ' ',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_a_Filtrar_Plus.Free;
end;

function Tform_articulos_000.Filtrar_Articulos_Proporciones( param_ver_bajas : ShortInt;
                                                             param_Cambiamos_Filtro : Boolean;
                                                             param_Lineas_Filtro,
                                                             param_Lineas_OrderBy : TStrings ) : ShortInt;
var
  var_a_Filtrar_Plus : TStrings;
begin
  var_a_Filtrar_Plus := TStringList.Create;
  var_a_Filtrar_Plus.Clear;

  if Trim(param_Lineas_OrderBy.Text) = '' then
  begin
    param_Lineas_OrderBy.Text := private_Order_By_proporciones[0].Memo_OrderBy;
  end;

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  Result := UTI_TB_Filtrar( private_Order_By_proporciones,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Articulos_Proporciones,
                                                          'articulos_proporciones',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Articulos_Proporciones,
                                                          'articulos_proporciones',
                                                          'i' ),

                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_Articulos.SQLTransaction_ArtProp,
                            DataModule_Articulos.SQLConnector_ArtProp,
                            SQLQuery_Articulos_Proporciones,

                            // name_tabla,
                            'po',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT po.*' + ' ' +
                            'FROM articulos_proporciones AS po' + ' ',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_a_Filtrar_Plus.Free;
end;

procedure Tform_articulos_000.Filtrar_tablas_ligadas;
var
  var_Lineas_Filtro  : TStrings;
  var_Lineas_OrderBy : TStrings;
  var_SQL_ADD        : TStrings;
begin
    var_SQL_ADD := TStringList.Create;

    if SQLQuery_Articulos.RecordCount = 0 then Exit;

    if SQLQuery_Articulos.State = dsInsert then
    begin
        Cerramos_Tablas_Ligadas;
        Exit;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    // ********************************************************************************************* //
    // ** TERMINALES                                                                              ** //
    // ********************************************************************************************* //
    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'te.id_articulos = ' + SQLQuery_Articulos.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_Lineas_OrderBy.Clear;
    Filtrar_Articulos_Terminales( RadioGroup_Bajas.ItemIndex,
                                  false,
                                  var_Lineas_Filtro,
                                  var_Lineas_OrderBy );

    // ********************************************************************************************* //
    // ** COMPOSICIONES                                                                           ** //
    // ********************************************************************************************* //
    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'co.id_articulos = ' + SQLQuery_Articulos.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_Lineas_OrderBy.Clear;
    Filtrar_Articulos_Composiciones( RadioGroup_Bajas.ItemIndex,
                                     false,
                                     var_Lineas_Filtro,
                                     var_Lineas_OrderBy );

    // ********************************************************************************************* //
    // ** REFERENCIAS                                                                             ** //
    // ********************************************************************************************* //
    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'arf.id_articulos = ' + SQLQuery_Articulos.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_Lineas_OrderBy.Clear;
    Filtrar_Articulos_Referencias( RadioGroup_Bajas.ItemIndex,
                                   false,
                                   var_Lineas_Filtro,
                                   var_Lineas_OrderBy );

    // ********************************************************************************************* //
    // ** PROPORCIONES                                                                            ** //
    // ********************************************************************************************* //
    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'po.id_articulos = ' + SQLQuery_Articulos.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_Lineas_OrderBy.Clear;
    Filtrar_Articulos_Proporciones( RadioGroup_Bajas.ItemIndex,
                                    false,
                                    var_Lineas_Filtro,
                                    var_Lineas_OrderBy );

    // ********************************************************************************************* //
    // ** STOCK                                                                                   ** //
    // ********************************************************************************************* //
    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'st.id_articulos = ' + SQLQuery_Articulos.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_Lineas_OrderBy.Clear;
    Filtrar_Articulos_Stock( RadioGroup_Bajas.ItemIndex,
                             false,
                             var_Lineas_Filtro,
                             var_Lineas_OrderBy );

    // ********************************************************************************************* //
    // ** Vaciamos las variables de cálculo de cual fué el último precio de compra del artículo   ** //
    // ********************************************************************************************* //
    Vaciar_variables_comprobacion_ultimo_precio_Compra;

    // ********************************************************************************************* //
    // ** Albaranes de compras ... líneas de detalle sin facturar                                 ** //
    // ********************************************************************************************* //
    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'acd.id_articulos = ' + SQLQuery_Articulos.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'acd.Numero_Factura IS NULL ' );
    UTI_TB_SQL_ADD( false,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_Lineas_OrderBy.Clear;
    Filtrar_Albaranes_Compras_Detalles_sin_Facturar( public_Ctdad_Rgistros_a_Ver, //var_Ctdad_Albaranes_sin_Facturar_a_Ver,
                                                     RadioGroup_Bajas.ItemIndex,
                                                     false,
                                                     var_Lineas_Filtro,
                                                     var_Lineas_OrderBy );

    // ********************************************************************************************* //
    // ** Albaranes de vemtas ... líneas de detalle sin facturar                                  ** //
    // ********************************************************************************************* //
    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'ad.id_articulos = ' + SQLQuery_Articulos.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'ad.Numero_Factura IS NULL ' );
    UTI_TB_SQL_ADD( false,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_Lineas_OrderBy.Clear;
    Filtrar_Albaranes_Ventas_Detalles_sin_Facturar( public_Ctdad_Rgistros_a_Ver, //var_Ctdad_Albaranes_sin_Facturar_a_Ver,
                                                    RadioGroup_Bajas.ItemIndex,
                                                    false,
                                                    var_Lineas_Filtro,
                                                    var_Lineas_OrderBy );

    // ********************************************************************************************* //
    // ** facturas de compras ... líneas de detalle                                               ** //
    // ********************************************************************************************* //
    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'fcd.id_articulos = ' + SQLQuery_Articulos.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_Lineas_OrderBy.Clear;
    Filtrar_Facturas_Compras_Detalles( public_Ctdad_Rgistros_a_Ver, //var_Ctdad_Albaranes_sin_Facturar_a_Ver,
                                       RadioGroup_Bajas.ItemIndex,
                                       false,
                                       var_Lineas_Filtro,
                                       var_Lineas_OrderBy );

    // ********************************************************************************************* //
    // ** facturas de compras ... líneas de detalle                                               ** //
    // ********************************************************************************************* //
    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'fd.id_articulos = ' + SQLQuery_Articulos.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_Lineas_OrderBy.Clear;
    Filtrar_Facturas_Ventas_Detalles( public_Ctdad_Rgistros_a_Ver, //var_Ctdad_Albaranes_sin_Facturar_a_Ver,
                                      RadioGroup_Bajas.ItemIndex,
                                      false,
                                      var_Lineas_Filtro,
                                      var_Lineas_OrderBy );

    // ********************************************************************************************* //
    // ** TARIFAS.-   Tengo que ponerlo después del filtro de todas las compras, pues le hace     ** //
    // **             falta el precio último de compra del artículo                               ** //
    // ********************************************************************************************* //
    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'ta.id_articulos = ' + SQLQuery_Articulos.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_Lineas_OrderBy.Clear;
    Filtrar_Articulos_Tarifas( RadioGroup_Bajas.ItemIndex,
                               false,
                               var_Lineas_Filtro,
                               var_Lineas_OrderBy );

    // ********************************************************************************************* //
    // ** se terminan de filtrar las tablas ligadas                                               ** //
    // ********************************************************************************************* //
    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;
    var_SQL_ADD.Free;
end;

procedure Tform_articulos_000.Filtrar_tablas_ligadas_a_Proporciones;
var
  var_Lineas_Filtro  : TStrings;
  var_Lineas_OrderBy : TStrings;
  var_SQL_ADD        : TStrings;
begin
    var_SQL_ADD := TStringList.Create;

    if SQLQuery_Articulos_Proporciones.RecordCount = 0 then Exit;

    if SQLQuery_Articulos_Proporciones.State = dsInsert then
    begin
        Cerramos_Tablas_Ligadas_a_Proporciones;
        Exit;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    // ********************************************************************************************* //
    // ** PROPORCIONES TARIFAS                                                                    ** //
    // ********************************************************************************************* //
    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'apta.id_articulos_proporciones = ' + SQLQuery_Articulos_Proporciones.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_Lineas_OrderBy.Clear;
    Filtrar_Articulos_Proporciones_Tarifas( RadioGroup_Bajas.ItemIndex,
                                            false,
                                            var_Lineas_Filtro,
                                            var_Lineas_OrderBy );

    // ********************************************************************************************* //
    // ** se terminan de filtrar las tablas ligadas                                               ** //
    // ********************************************************************************************* //
    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;
    var_SQL_ADD.Free;
end;

procedure Tform_articulos_000.Insertar_Registro;
var
  var_Campos_para_Existe_ya : Array of TCampos_para_Existe_ya;
  var_msg                   : TStrings;
  var_record_Existe         : Trecord_Existe;
  var_descripcion           : ShortString;
  var_Fecha_Hora            : ShortString;

begin
    with SQLQuery_Articulos do
    begin
        var_msg := TStringList.Create;

        if UTI_USR_Permiso_SN(public_Menu_Worked, 'A', True) = True then
        begin
            if public_Solo_Ver = True then
            begin
                var_msg.Add(rs_Solo_Visualizar);
                UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            end else begin
                Insert;

                //Filtrar_tablas_ligadas;

                FieldByName('Combinado').AsString                                     := '0';
                FieldByName('Visualizar_en_terminales_SN').AsString                   := 'N';
                FieldByName('Articulo_Compuesto_SN').AsString                         := 'N';
                FieldByName('Activar_Proporciones_SN').AsString                       := 'N';
                FieldByName('Agregar_a_Favoritos_SN').AsString                        := 'N';
                FieldByName('Pedir_precio_venta_SN').AsString                         := 'S';
                FieldByName('Venta_por_peso_SN').AsString                             := 'N';
                // FieldByName('Tipo_de_articulo').AsString                              := '0';
                FieldByName('Agregar_a_menus_SN').AsString                            := 'N';

                Application.CreateForm(Tform_articulos_001, form_articulos_001);

                form_articulos_001.DBGrid_Referencias.Color                    := clSilver;
                form_articulos_001.DBGrid_Terminales.Color                     := clSilver;
                form_articulos_001.DBGrid_Facturas_Compras.Color               := clSilver;
                form_articulos_001.DBGrid_Albaranes_Compras_sin_Facturar.Color := clSilver;
                form_articulos_001.DBGrid_Stock.Color                          := clSilver;
                form_articulos_001.DBGrid_Tarifas.Color                        := clSilver;
                form_articulos_001.DBGrid_Facturas_Ventas.Color                := clSilver;
                form_articulos_001.DBGrid_Albaranes_Ventas_sin_Facturar.Color  := clSilver;
                form_articulos_001.DBGrid_Composiciones.Color                  := clSilver;
                form_articulos_001.DBGrid_Proporciones.Color                   := clSilver;
                form_articulos_001.DBGrid_Tarifas_Proporciones.Color           := clSilver;

                form_articulos_001.RadioGroup_Bajas.ItemIndex                  := RadioGroup_Bajas.ItemIndex;

                form_articulos_001.para_Empezar;

                form_articulos_001.ShowModal;

                if form_articulos_001.public_Pulso_Aceptar = true then
                begin
                    SetLength(var_Campos_para_Existe_ya, 1);

                    var_Campos_para_Existe_ya[0].Campo_Valor  := FieldByName('descripcion').AsString;
                    var_Campos_para_Existe_ya[0].Campo_Nombre := 'descripcion';
                    var_Campos_para_Existe_ya[0].Campo_Tipo   := 1; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                    var_record_Existe := UTI_RGTRO_Existe_Ya( 'articulos',                          // param_nombre_tabla
                                                              'ORDER BY articulos.descripcion ASC', // param_order_by
                                                              '',                                   // param_id_a_no_traer ... Estoy insertando
                                                              var_Campos_para_Existe_ya );                              // param_Campos_para_Existe_ya

                    if var_record_Existe.Fallo_en_Conexion_BD = true then
                    begin
                        form_articulos_001.Free;
                        Cancel;
                    end else begin
                        if var_record_Existe.Existe = false then
                        begin
                            form_articulos_001.Free;

                            var_descripcion                     := FieldByName('descripcion').AsString;

                            var_Fecha_Hora                      := DateTimeToStr(UTI_CN_Fecha_Hora);
                            FieldByName('Insert_WHEN').AsString := var_Fecha_Hora;
                            FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                            UTI_RGTRO_Grabar_Antes( 'articulos', SQLQuery_Articulos );

                            // ***************************************************** //
                            // ** Refresco el resto de tablas ligadas porque han  ** //
                            // ** sido creadas automáticamente                    ** //
                            // ***************************************************** //
                            Filtrar_tablas_ligadas;

                            Editar_Registro;
                        end else begin
                            form_articulos_001.Free;
                            Cancel;
                            var_msg.Clear;
                            var_msg.Add( 'Artículo repetido.');

                            if UpperCase(var_record_Existe.deBaja) = 'S' then
                            begin
                                var_msg.Add(rs_Rgtro_Borrado);
                            end;

                            UTI_GEN_Aviso(true, var_msg, rs_Ya_Existe, True, False);
                        end;
                    end;
                end else begin
                    form_articulos_001.Free;
                    Cancel;
                end;
            end;
        end;

        var_msg.Free;
    end;
end;

procedure Tform_articulos_000.Refrescar_Registros_Proporciones_Tarifas;
var var_Lineas_Filtro               : TStrings;
    var_Lineas_OrderBy              : TStrings;
    var_ver_Bajas                   : ShortInt;

    var_id_articulos_proporciones   : LargeInt;
    var_id_tarifas                  : LargeInt;
begin
    // ********************************************************************************************* //
    // ** Solo si la cabecera está en modo EDIT se abren las tablas hijas                         ** //
    // ********************************************************************************************* //
    if SQLQuery_Articulos.State <> dsEdit then Exit;

    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_id_articulos_proporciones := 0;
    var_id_tarifas                := 0;

    if SQLQuery_Articulos_Proporciones_Tarifas.RecordCount > 0 then
    begin
        if not SQLQuery_Articulos_Proporciones_Tarifas.FieldByName('id_articulos_proporciones').IsNull then
        begin
             var_id_articulos_proporciones := SQLQuery_Articulos_Proporciones_Tarifas.FieldByName('id_articulos_proporciones').Value;
        end;

        if not SQLQuery_Articulos_Proporciones_Tarifas.FieldByName('id_tarifas').IsNull then
        begin
             var_id_tarifas := SQLQuery_Articulos_Proporciones_Tarifas.FieldByName('id_tarifas').Value;
        end;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Clear;
    var_Lineas_OrderBy.Clear;

    if Trim(SQLQuery_Articulos.FieldByName('id').AsString) <> '' then
         var_Lineas_Filtro.Add('apta.id_articulos_proporciones = ' + Trim(SQLQuery_Articulos_Proporciones.FieldByName('id').AsString))
    else var_Lineas_Filtro.Add('apta.id_articulos_proporciones = Null');

    var_ver_Bajas := RadioGroup_Bajas.ItemIndex;
    if UTI_GEN_Form_Abierto_Ya('form_articulos_001') = true then
    begin
        var_ver_Bajas := form_articulos_001.RadioGroup_Bajas.ItemIndex;
    end;

    Filtrar_Articulos_Proporciones_Tarifas( var_ver_Bajas,
                                            false,
                                            var_Lineas_Filtro,
                                            var_Lineas_OrderBy );

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;

    if var_id_tarifas <> 0 then
    begin
        SQLQuery_Articulos_Proporciones_Tarifas.Locate( 'id_articulos_proporciones;id_tarifas',
                                                        VarArrayOf( [ var_id_articulos_proporciones,
                                                                      var_id_tarifas ] ),
                                                        [] );
    end;
end;

function Tform_articulos_000.Filtrar_Articulos_Proporciones_Tarifas( param_ver_bajas : ShortInt;
                                                                     param_Cambiamos_Filtro : Boolean;
                                                                     param_Lineas_Filtro,
                                                                     param_Lineas_OrderBy : TStrings ) : ShortInt;
var
  var_precio_coste   : String;
  var_SQL_Anadir     : String;
  var_a_Filtrar_Plus : TStrings;
begin
  var_a_Filtrar_Plus := TStringList.Create;
  var_a_Filtrar_Plus.Clear;

  var_precio_coste := '0';

  if Trim(param_Lineas_OrderBy.Text) = '' then
  begin
    param_Lineas_OrderBy.Text := private_Order_By_proporciones_tarifas[0].Memo_OrderBy;
  end;

  if Trim(var_precio_coste) = '' then
  begin
    var_SQL_Anadir := '( SELECT 0 ) AS OT_mayor_igual_que,' + ' ' +
                      '( SELECT 0 ) AS OT_menor_igual_que,' + ' ' +
                      '( SELECT 0 ) AS OT_Beneficio,' + ' ' +
                      '( SELECT "S" ) AS OT_Beneficio_en_Tanto_por_Ciento_SN' + ' ';
  end

  else
  begin
    var_SQL_Anadir := '( SELECT mt.mayor_igual_que' + ' ' +
                          'FROM tarifas_margenes AS tm' + ' ' +
                         'RIGHT JOIN margenes_tarifas AS mt' + ' ' +
                            'ON tm.id_margenes_tarifas = mt.id' + ' ' +
                           'AND ( ' + Trim(var_precio_coste) + ' >= mt.mayor_igual_que AND' + ' ' +
                                      Trim(var_precio_coste) + ' <= mt.menor_igual_que )' + ' ' +
                         'WHERE tm.id_tarifas = apta.id_tarifas' + ' ' +
                         'ORDER BY tm.id_tarifas ASC, tm.id_margenes_tarifas ASC ) AS OT_mayor_igual_que,' + ' ' +

                      '( SELECT mt.menor_igual_que' + ' ' +
                          'FROM tarifas_margenes AS tm' + ' ' +
                         'RIGHT JOIN margenes_tarifas AS mt' + ' ' +
                            'ON tm.id_margenes_tarifas = mt.id' + ' ' +
                           'AND ( ' + Trim(var_precio_coste) + ' >= mt.mayor_igual_que AND' + ' ' +
                                      Trim(var_precio_coste) + ' <= mt.menor_igual_que )' + ' ' +
                         'WHERE tm.id_tarifas = apta.id_tarifas' + ' ' +
                         'ORDER BY tm.id_tarifas ASC, tm.id_margenes_tarifas ASC ) AS OT_menor_igual_que,' + ' ' +

                      '( SELECT tm.Beneficio' + ' ' +
                          'FROM tarifas_margenes AS tm' + ' ' +
                         'RIGHT JOIN margenes_tarifas AS mt' + ' ' +
                            'ON tm.id_margenes_tarifas = mt.id' + ' ' +
                           'AND ( ' + Trim(var_precio_coste) + ' >= mt.mayor_igual_que AND' + ' ' +
                                      Trim(var_precio_coste) + ' <= mt.menor_igual_que )' + ' ' +
                         'WHERE tm.id_tarifas = apta.id_tarifas' + ' ' +
                         'ORDER BY tm.id_tarifas ASC, tm.id_margenes_tarifas ASC ) AS OT_Beneficio,' + ' ' +

                      '( SELECT tm.Beneficio_en_Tanto_por_Ciento_SN' + ' ' +
                          'FROM tarifas_margenes AS tm' + ' ' +
                         'RIGHT JOIN margenes_tarifas AS mt' + ' ' +
                            'ON tm.id_margenes_tarifas = mt.id' + ' ' +
                           'AND ( ' + Trim(var_precio_coste) + ' >= mt.mayor_igual_que AND' + ' ' +
                                      Trim(var_precio_coste) + ' <= mt.menor_igual_que )' + ' ' +
                         'WHERE tm.id_tarifas = apta.id_tarifas' + ' ' +
                         'ORDER BY tm.id_tarifas ASC, tm.id_margenes_tarifas ASC ) AS OT_Beneficio_en_Tanto_por_Ciento_SN' + ' ';
  end;

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  Result := UTI_TB_Filtrar( private_Order_By_proporciones_tarifas,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Articulos_Proporciones_Tarifas,
                                                          'articulos_proporciones_tarifas',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Articulos_Proporciones_Tarifas,
                                                          'articulos_proporciones_tarifas',
                                                          'i' ),

                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_Articulos.SQLTransaction_ArtPropTa,
                            DataModule_Articulos.SQLConnector_ArtPropTa,
                            SQLQuery_Articulos_Proporciones_Tarifas,

                            // name_tabla,
                            'apta',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT apta.*,' + ' ' +
                                   't.descripcion AS OT_descripcion_tarifa,' + ' ' +
                                   var_SQL_Anadir + ' ' +

                            'FROM articulos_proporciones_tarifas AS apta' + ' ' +

                            'LEFT JOIN tarifas AS t' + ' ' +
                            'ON apta.id_tarifas = t.id' + ' ',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_a_Filtrar_Plus.Free;
end;

procedure Tform_articulos_000.SQLQuery_ArticulosBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Articulos );
end;

procedure Tform_articulos_000.SQLQuery_Articulos_TarifasBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Articulos_Tarifas );
end;

procedure Tform_articulos_000.SQLQuery_Articulos_TerminalesBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Articulos_Terminales );
end;

procedure Tform_articulos_000.SQLQuery_Articulos_ComposicionesBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Articulos_Composiciones );
end;

procedure Tform_articulos_000.SQLQuery_Articulos_ProporcionesBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Articulos_Proporciones );
end;

procedure Tform_articulos_000.SQLQuery_Articulos_Proporciones_TarifasBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Articulos_Proporciones_Tarifas );
end;

procedure Tform_articulos_000.Editar_Registro;
var var_msg           : TStrings;
    var_record_Existe : Trecord_Existe;
    var_id            : ShortString;
begin
    with SQLQuery_Articulos do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
            begin
                var_id := FieldByName('id').AsString;

                if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
                begin
                    if UTI_RGTRO_isLock( 'articulos',
                                         FieldByName('id').AsString,
                                         true ) = true then
                    begin
                        Exit;
                    end else begin
                        if UTI_RGTRO_Lock( 'articulos',
                                           FieldByName('id').AsString ) = true then
                             Edit
                        else Exit;
                    end;

                    Application.CreateForm(Tform_articulos_001, form_articulos_001);

                    form_articulos_001.RadioGroup_Bajas.ItemIndex := RadioGroup_Bajas.ItemIndex;
                    form_articulos_001.public_Menu_Worked         := public_Menu_Worked;

                    if public_Solo_Ver = true then
                    begin
                        form_articulos_001.public_Solo_Ver := true;
                    end;

                    form_articulos_001.para_Empezar;

                    form_articulos_001.ShowModal;

                    if form_articulos_001.public_Pulso_Aceptar = true then
                        begin
                            SetLength(var_Campos_para_Existe_ya, 1);

                            var_Campos_para_Existe_ya[0].Campo_Valor  := FieldByName('descripcion').AsString;
                            var_Campos_para_Existe_ya[0].Campo_Nombre := 'descripcion';
                            var_Campos_para_Existe_ya[0].Campo_Tipo   := 1; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                            var_record_Existe := UTI_RGTRO_Existe_Ya( 'articulos',                          // param_nombre_tabla
                                                                      'ORDER BY articulos.descripcion ASC', // param_order_by
                                                                      FieldByName('id').AsString,                                   // param_id_a_no_traer ... Estoy insertando
                                                                      var_Campos_para_Existe_ya );                              // param_Campos_para_Existe_ya

                            if var_record_Existe.Fallo_en_Conexion_BD = true then
                                begin
                                    form_articulos_001.Free;
                                    Cancel;
                                end
                            else
                                begin
                                    if var_record_Existe.Existe = false then
                                        begin
                                            if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( SQLQuery_Articulos ) = true then
                                               begin
                                                    FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                                                    FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                                                    UTI_RGTRO_Grabar_Antes( 'articulos',
                                                                            SQLQuery_Articulos );
                                               end
                                            else Cancel;
                                            form_articulos_001.Free;
                                        end
                                    else
                                        begin
                                            form_articulos_001.Free;

                                            Cancel;
                                            var_msg.Clear;
                                            var_msg.Add( 'Artículo repetido.');

                                            if UpperCase(var_record_Existe.deBaja) = 'S' then
                                            begin
                                                var_msg.Add(rs_Rgtro_Borrado);
                                            end;

                                            UTI_GEN_Aviso(true, var_msg, rs_Ya_Existe, True, False);
                                        end;
                                end;
                        end
                    else
                        begin
                            form_articulos_001.Free;
                            Cancel;
                        end;

                    UTI_RGTRO_UnLock( 'articulos',
                                      var_id );
                end;
            end
        else
            begin
                var_msg.Add(rs_no_Hay_Rgtros);
                UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            end;
    end;

    var_msg.Free;
end;

procedure Tform_articulos_000.Filtrar_Principal_Sin_Preguntar;
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

procedure Tform_articulos_000.Boton_Elegir_id_articulos_familiasClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with SQLQuery_Articulos do
    begin
        if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = true then
        begin
            var_Registro := Elegir_Familia;
        end;

        if var_Registro.id_1 <> '' then
        begin
            Edit_id_articulos_familias.Text             := Trim(var_Registro.id_1);
            Edit_Descripcion_id_articulos_familias.Text := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_articulos_000.Boton_Elegir_id_proveedoresClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Proveedores( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_proveedores.Text             := Trim(var_Registro.id_1);
        Edit_Descripcion_id_proveedores.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_articulos_000.ComboBox_FiltrosChange(Sender: TObject);
begin
    Memo_OrderBy.Lines.Clear;
    Memo_OrderBy.Lines.Add( private_Order_By[ComboBox_Filtros.ItemIndex].Memo_OrderBy );
    BitBtn_FiltrarClick(Nil);
end;

procedure Tform_articulos_000.Edit_Descripcion_id_articulos_familiasClick(Sender: TObject);
begin
    Edit_id_articulos_familias.Text             := '';
    Edit_Descripcion_id_articulos_familias.Text := '';
end;

procedure Tform_articulos_000.Edit_Descripcion_id_proveedoresClick(Sender: TObject);
begin
    Edit_id_proveedores.Text             := '';
    Edit_Descripcion_id_proveedores.Text := '';
end;

function Tform_articulos_000.Elegir_Familia : TRecord_Rgtro_Comun;
var var_msg : TStrings;
begin
    Result.id_1 := '';

    if UTI_GEN_Form_Abierto_Ya('form_articulos_familias_005') = false then
    begin
        Application.CreateForm(Tform_articulos_familias_005, form_articulos_familias_005);
        form_articulos_familias_005.Label_Cambiable_1.Caption := rs_Elegir_Familia_1;
        form_articulos_familias_005.Label_Cambiable_2.Caption := rs_Elegir_Familia_2;

        form_articulos_familias_005.public_Solo_Ver    := true;
        form_articulos_familias_005.public_Elegimos    := true;
        form_articulos_familias_005.public_Menu_Worked := public_Menu_Worked;

        form_articulos_familias_005.para_Empezar;

        form_articulos_familias_005.ShowModal;

        if form_articulos_familias_005.public_Rgtro_Seleccionado = true then
        begin
            with form_articulos_familias_005.SQLQuery_Articulos_NO_SubFamilias do
            begin
                Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                      '',
                                                      '',

                                                      FieldByName('descripcion').AsString,
                                                      FieldByName('Cuenta_Contable_Compras').AsString,
                                                      FieldByName('Cuenta_Contable_Ventas').AsString );
            end;
        end;

        form_articulos_familias_005.Free;
    end else begin
        var_msg := TStringList.Create;
        var_msg.Add(rs_Modulo_Abierto);
        UTI_GEN_Aviso(true, var_msg, rs_Elegir_Familia_3, True, False);
        var_msg.Free;
        Exit;
    end;
end;

function Tform_articulos_000.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
var
  var_a_Filtrar : TStrings;
  var_SQL_ADD   : TStrings;
begin
    var_SQL_ADD   := TStringList.Create;
    var_a_Filtrar := TStringList.Create;
    var_a_Filtrar.Clear;

    // ********************************************************************************************* //
    // ** AHORA PONDREMOS EL RESTO DE LOS FILTROS QUE NO SON GENERALES                            ** //
    // ********************************************************************************************* //
    // ** Primero buscaremos en la descripción del artículo                                       ** //
    // ********************************************************************************************* //
    if Trim(Edit_Descripcion.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'a.descripcion LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Descripcion.Text) + '%') );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Primero buscaremos en la descripción del artículo para el TPV                           ** //
    // ********************************************************************************************* //
    if Trim(Edit_Descripcion_Para_Terminal.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'a.descripcion_para_TPV LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Descripcion_Para_Terminal.Text) + '%') );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la familia del artículo                                            ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_articulos_familias.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'a.id_articulos_familias = ' + Trim(Edit_id_articulos_familias.Text) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por el proveedor habitual                                              ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_proveedores.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'a.id_proveedores = ' + Trim(Edit_id_proveedores.Text) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
      y que por lo se debe de permitir modificarlos en ningún módulo }

    Result := UTI_TB_Filtrar( private_Order_By,

                              // Delete_SQL,
                              '',

                              // Update_SQL,
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Articulos,
                                                            'articulos',
                                                            'u' ),

                              // Insert_SQL,
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Articulos,
                                                            'articulos',
                                                            'i' ),

                              // var_ctdad_Rgtros,
                              -1,

                              DataModule_Articulos.SQLTransaction_Art,
                              DataModule_Articulos.SQLConnector_Art,
                              SQLQuery_Articulos,

                              // name_tabla,
                              'a',

                              RadioGroup_Bajas.ItemIndex,

                              // SELECT_SQL,
                              'SELECT a.*,' + ' ' +

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
                              'ON a.id_articulos_familias = f.id' + ' ',

                              Memo_Filtros.Lines,
                              Memo_OrderBy.Lines,
                              var_a_Filtrar,

                              param_Cambiamos_Filtro,
                              false,   // param_ver_SQL_despues_Abrir : Boolean;
                              true ); // no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

    var_a_Filtrar.Free;

    if SQLQuery_Articulos.RecordCount = 0 then
    begin
        Cerramos_Tablas_Ligadas;
    end;

    //Filtrar_tablas_ligadas;
    var_SQL_ADD.Free;
end;

function Tform_articulos_000.Filtrar_Articulos_Stock( param_ver_bajas : ShortInt;
                                                      param_Cambiamos_Filtro : Boolean;
                                                      param_Lineas_Filtro,
                                                      param_Lineas_OrderBy : TStrings ) : ShortInt;
var
  var_a_Filtrar_Plus : TStrings;
begin
  var_a_Filtrar_Plus := TStringList.Create;
  var_a_Filtrar_Plus.Clear;

  if Trim(param_Lineas_OrderBy.Text) = '' then
  begin
    param_Lineas_OrderBy.Text := private_Order_By_stock[0].Memo_OrderBy;
  end;

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  Result := UTI_TB_Filtrar( private_Order_By_proporciones,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Articulos_Stock,
                                                          'articulos_stock',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Articulos_Stock,
                                                          'articulos_stock',
                                                          'i' ),
                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_Articulos.SQLTransaction_ArtStock,
                            DataModule_Articulos.SQLConnector_ArtStock,
                            SQLQuery_Articulos_Stock,

                            // name_tabla,
                            'st',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT st.*,' + ' ' +
                                   'al.descripcion AS OT_descripcion_almacen' + ' ' +

                            'FROM articulos_stock AS st' + ' ' +

                            'LEFT JOIN almacenes AS al' + ' ' +
                            'ON st.id_almacenes = al.id' + ' ',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_a_Filtrar_Plus.Free;
end;

procedure Tform_articulos_000.Refrescar_Registros_Stock;
var var_Lineas_Filtro             : TStrings;
    var_Lineas_OrderBy            : TStrings;
    var_ver_Bajas                 : ShortInt;

    var_id_articulos              : LargeInt;
    var_id                        : LargeInt;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_id_articulos := 0;
    var_id           := 0;

    if SQLQuery_Articulos_Stock.RecordCount > 0 then
    begin
        if not SQLQuery_Articulos_Stock.FieldByName('id_articulos').IsNull then
        begin
             var_id_articulos := SQLQuery_Articulos_Stock.FieldByName('id_articulos').Value;
        end;

        if not SQLQuery_Articulos_Stock.FieldByName('id').IsNull then
        begin
             var_id := SQLQuery_Articulos_Stock.FieldByName('id').Value;
        end;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Clear;
    var_Lineas_OrderBy.Clear;

    if Trim(SQLQuery_Articulos.FieldByName('id').AsString) <> '' then
         var_Lineas_Filtro.Add('st.id_articulos = ' + Trim(SQLQuery_Articulos.FieldByName('id').AsString))
    else var_Lineas_Filtro.Add('st.id_articulos = Null');

    var_ver_Bajas := RadioGroup_Bajas.ItemIndex;
    if UTI_GEN_Form_Abierto_Ya('form_articulos_001') = true then
    begin
        var_ver_Bajas := form_articulos_001.RadioGroup_Bajas.ItemIndex;
    end;

    Filtrar_Articulos_Stock( var_ver_Bajas,
                             false,
                             var_Lineas_Filtro,
                             var_Lineas_OrderBy );

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;

    if var_id <> 0 then
    begin
        SQLQuery_Articulos_Proporciones.Locate( 'id;id_articulos',
                                                 VarArrayOf( [ var_id,
                                                               var_id_articulos ] ),
                                                 [] );
    end;
end;

procedure Tform_articulos_000.Refrescar_Registros_Referencias;
var var_Lineas_Filtro           : TStrings;
    var_Lineas_OrderBy          : TStrings;
    var_ver_Bajas               : ShortInt;

    var_id_articulos            : Int64;
    var_CodigoBarras_Referencia : string;
begin
    with SQLQuery_Articulos_Ref do
    begin
        // ********************************************************************************************* //
        // ** Solo si la cabecera está en modo EDIT se abren las tablas hijas                         ** //
        // ********************************************************************************************* //
        if SQLQuery_Articulos.State <> dsEdit then Exit;

        // ********************************************************************************************* //
        // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
        // ********************************************************************************************* //
        var_id_articulos            := 0;
        var_CodigoBarras_Referencia := '';

        if RecordCount > 0 then
        begin
            if not FieldByName('id_articulos').IsNull then
            begin
                 var_id_articulos := FieldByName('id_articulos').Value;
            end;

            if not FieldByName('CodigoBarras_Referencia').IsNull then
            begin
                 var_CodigoBarras_Referencia := FieldByName('CodigoBarras_Referencia').Value;
            end;
        end;

        var_Lineas_Filtro  := TStringList.Create;
        var_Lineas_OrderBy := TStringList.Create;

        var_Lineas_Filtro.Clear;
        var_Lineas_OrderBy.Clear;

        if Trim(SQLQuery_Articulos.FieldByName('id').AsString) <> '' then
             var_Lineas_Filtro.Add('arf.id_articulos = ' + Trim(SQLQuery_Articulos.FieldByName('id').AsString))
        else var_Lineas_Filtro.Add('arf.id_articulos = Null');

        var_ver_Bajas := RadioGroup_Bajas.ItemIndex;
        if UTI_GEN_Form_Abierto_Ya('form_articulos_001') = true then
        begin
            var_ver_Bajas := form_articulos_001.RadioGroup_Bajas.ItemIndex;
        end;

        Filtrar_Articulos_Referencias( var_ver_Bajas,
                                       false,
                                       var_Lineas_Filtro,
                                       var_Lineas_OrderBy );

        var_Lineas_Filtro.Free;
        var_Lineas_OrderBy.Free;

        if Trim(var_CodigoBarras_Referencia) <> '' then
        begin
            Locate( 'id_articulos;CodigoBarras_Referencia',
                    VarArrayOf( [ var_id_articulos,
                                  var_CodigoBarras_Referencia ] ),
                    [] );
        end;
    end;
end;

function Tform_articulos_000.Filtrar_Articulos_Referencias( param_ver_bajas : ShortInt;
                                                            param_Cambiamos_Filtro : Boolean;
                                                            param_Lineas_Filtro,
                                                            param_Lineas_OrderBy : TStrings ) : ShortInt;
var
  var_a_Filtrar_Plus : TStrings;
begin
  var_a_Filtrar_Plus := TStringList.Create;
  var_a_Filtrar_Plus.Clear;

  if Trim(param_Lineas_OrderBy.Text) = '' then
  begin
    param_Lineas_OrderBy.Text := private_Order_By_Ref[0].Memo_OrderBy;
  end;

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  Result := UTI_TB_Filtrar( private_Order_By_Ref,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Articulos_Ref,
                                                          'articulos_referencias',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Articulos_Ref,
                                                          'articulos_referencias',
                                                          'i' ),

                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_Articulos.SQLTransaction_ArtRef,
                            DataModule_Articulos.SQLConnector_ArtRef,
                            SQLQuery_Articulos_Ref,

                            // name_tabla,
                            'arf',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT arf.*,' + ' ' +

                                   'a.descripcion AS OT_Descripcion,' + ' ' +
                                   'a.descripcion_para_TPV AS OT_Descripcion_para_TPV' + ' ' +

                            'FROM articulos_referencias AS arf' + ' ' +

                            'LEFT JOIN articulos AS a' + ' ' +
                            'ON a.id = arf.id_articulos' + ' ',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_a_Filtrar_Plus.Free;
end;

procedure Tform_articulos_000.Refrescar_Registros_Albaranes_Compras_Detalles_sin_Facturar;
var
  var_Ctdad_Albaranes_sin_Facturar_a_Ver : String;
  var_Lineas_Filtro                      : TStrings;
  var_Lineas_OrderBy                     : TStrings;
  var_id                                 : ShortString;
  var_ver_Bajas                          : ShortInt;
  var_SQL_ADD                            : TStrings;
begin
    var_SQL_ADD := TStringList.Create;

    // ********************************************************************************************* //
    // ** Solo si la cabecera está en modo EDIT se abren las tablas hijas                         ** //
    // ********************************************************************************************* //
    if SQLQuery_Articulos.State <> dsEdit then Exit;

    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_id := '';

    with SQLQuery_Alb_Compras_Detalles do
    begin
        if RecordCount > 0 then
        begin
            if FieldByName('id').IsNull then
            begin
                var_id := '0';
            end else begin
                var_id := FieldByName('id').AsString;
            end;
        end;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Clear;
    var_Lineas_OrderBy.Clear;

    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'acd.id_articulos = ' + SQLQuery_Articulos.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'acd.Numero_Factura IS NULL ' );
    UTI_TB_SQL_ADD( false,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_ver_Bajas                          := 1; // asi no se ven las bajas hasta que no lo pida el form de altas/modif de líneas
    var_Ctdad_Albaranes_sin_Facturar_a_Ver := public_Ctdad_Rgistros_a_Ver;
    if UTI_GEN_Form_Abierto_Ya('form_articulos_001') = true then
    begin
        var_ver_Bajas                          := form_articulos_001.RadioGroup_Bajas.ItemIndex;
        var_Ctdad_Albaranes_sin_Facturar_a_Ver := form_articulos_001.Edit_Ctdad_Albaranes_Compras_sin_Facturar_a_Ver.Text;
    end;

    Filtrar_Albaranes_Compras_Detalles_sin_Facturar( var_Ctdad_Albaranes_sin_Facturar_a_Ver,
                                                     var_ver_Bajas,
                                                     false,
                                                     var_Lineas_Filtro,
                                                     var_Lineas_OrderBy );

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;

    if var_id <> '' then
    begin
        if var_id = '0' then
        begin
            // ************************************************************************************* //
            // ** Estabamos en una insercción, así que me voy al último registro, pues el order by** //
            // ** es id_proveedor + id del registro                                               ** //
            // ************************************************************************************* //
            SQLQuery_Alb_Compras_Detalles.Last;
        end else begin
            // ************************************************************************************* //
            // ** Estabamos en una edición, así que ya conocíamos la id del registro. Por lo que  ** //
            // ** hago el locate por esta id                                                      ** //
            // ************************************************************************************* //
            SQLQuery_Alb_Compras_Detalles.Locate('id', StrToInt64(var_id), []);
        end;

    end;
    var_SQL_ADD.Free;
end;

function Tform_articulos_000.Filtrar_Albaranes_Compras_Detalles_sin_Facturar( param_Limite_Registros : string;
                                                                              param_ver_bajas : ShortInt;
                                                                              param_Cambiamos_Filtro : Boolean;
                                                                              param_Lineas_Filtro,
                                                                              param_Lineas_OrderBy : TStrings ) : ShortInt;
var
  var_a_Filtrar_Plus : TStrings;
begin
  var_a_Filtrar_Plus := TStringList.Create;
  var_a_Filtrar_Plus.Clear;

  if Trim(param_Lineas_OrderBy.Text) = '' then
  begin
    param_Lineas_OrderBy.Text := private_Order_By_Alb_Compras_Detalle[0].Memo_OrderBy +
                                 ' LIMIT ' + Trim(param_Limite_Registros);
  end;

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  Result := UTI_TB_Filtrar( private_Order_By_Alb_Compras_Detalle,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Alb_Compras_Detalles,
                                                          'albaranes_compras_detalles',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Alb_Compras_Detalles,
                                                          'albaranes_compras_detalles',
                                                          'i' ),

                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_Articulos.SQLTransaction_Alb_Compras_Detalles,
                            DataModule_Articulos.SQLConnector_Alb_Compras_Detalles,
                            SQLQuery_Alb_Compras_Detalles,

                            // name_tabla,
                            'acd',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT acd.*,' + ' ' +

                                   'pr.nombre_propietario AS OT_Proveedor_nombre_propietario,' + ' ' +
                                   'pr.nombre_comercial AS OT_Proveedor_nombre_comercial,' + ' ' +

                                   'ac.id_almacenes AS OT_id_almacenes_Cabecera,' + ' ' +
                                   'ac.Serie_Albaran AS OT_Serie_Albaran,' + ' ' +
                                   'ac.Numero_Albaran AS OT_Numero_Albaran,' + ' ' +

                                   'al.descripcion AS OT_descripcion_almacen,' + ' ' +

                                   'a.descripcion_para_TPV AS OT_descripcion_articulo,' + ' ' +
                                   'a.Tipo_de_articulo AS OT_Tipo_de_articulo,' + ' ' +

                                   'i.descripcion AS OT_descripcion_impuesto,' + ' ' +
                                   'i.Tanto_Por_Ciento AS OT_Tanto_Por_Ciento,' + ' ' +
                                   'i.Sumado_A_Ftra_SN AS OT_Sumado_A_Ftra_SN' + ' ' +

                            'FROM albaranes_compras_detalles AS acd' + ' ' +

                            'LEFT JOIN almacenes AS al' + ' ' +
                            'ON acd.id_almacenes = al.id' + ' ' +

                            'LEFT JOIN articulos AS a' + ' ' +
                            'ON acd.id_articulos = a.id' + ' ' +

                            'LEFT JOIN impuestos AS i' + ' ' +
                            'ON acd.id_impuestos_Compras = i.id' + ' ' +

                            'LEFT JOIN proveedores AS pr' + ' ' +
                            'ON acd.id_proveedores = pr.id' + ' ' +

                            'RIGHT JOIN albaranes_compras AS ac' + ' ' +
                            'ON acd.id_albaranes = ac.id AND' + ' ' +
                               'ac.Del_WHEN IS NULL ',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  Actualizar_Ultimas_Compras;
  var_a_Filtrar_Plus.Free;
end;

function Tform_articulos_000.Filtrar_Albaranes_Ventas_Detalles_sin_Facturar( param_Limite_Registros : string;
                                                                             param_ver_bajas : ShortInt;
                                                                             param_Cambiamos_Filtro : Boolean;
                                                                             param_Lineas_Filtro,
                                                                             param_Lineas_OrderBy : TStrings ) : ShortInt;
var
  var_a_Filtrar_Plus : TStrings;
begin
  var_a_Filtrar_Plus := TStringList.Create;
  var_a_Filtrar_Plus.Clear;

  if Trim(param_Lineas_OrderBy.Text) = '' then
  begin
    param_Lineas_OrderBy.Text := private_Order_By_Alb_Ventas_Detalle[0].Memo_OrderBy +
                                 ' LIMIT ' + Trim(param_Limite_Registros);
  end;

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  Result := UTI_TB_Filtrar( private_Order_By_Alb_Ventas_Detalle,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Alb_Ventas_Detalles,
                                                          'albaranes_ventas_detalles',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Alb_Ventas_Detalles,
                                                          'albaranes_ventas_detalles',
                                                          'i' ),
                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_Articulos.SQLTransaction_Alb_Ventas_Detalles,
                            DataModule_Articulos.SQLConnector_Alb_Ventas_Detalles,
                            SQLQuery_Alb_Ventas_Detalles,

                            // name_tabla,
                            'ad',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT ad.*,' + ' ' +

                                   'cl.nombre_propietario AS OT_Cliente_nombre_propietario,' + ' ' +
                                   'cl.nombre_comercial AS OT_Cliente_nombre_comercial,' + ' ' +

                                   'albv.id_almacenes AS OT_id_almacenes_Cabecera,' + ' ' +
                                   'albv.id_vehiculos AS OT_id_vehiculos_Cabecera,' + ' ' +
                                   'albv.Serie_Albaran AS OT_Serie_Albaran,' + ' ' +
                                   'albv.Numero_Albaran AS OT_Numero_Albaran,' + ' ' +

                                   'al.descripcion AS OT_descripcion_almacen,' + ' ' +

                                   'a.descripcion_para_TPV AS OT_descripcion_articulo,' + ' ' +
                                   'a.Tipo_de_articulo AS OT_Tipo_de_articulo,' + ' ' +

                                   'i.descripcion AS OT_descripcion_impuesto,' + ' ' +
                                   'i.Tanto_Por_Ciento AS OT_Tanto_Por_Ciento,' + ' ' +
                                   'i.Sumado_A_Ftra_SN AS OT_Sumado_A_Ftra_SN' + ' ' +

                            'FROM albaranes_ventas_detalles AS ad' + ' ' +

                            'LEFT JOIN albaranes_ventas AS av' + ' ' +
                            'ON ad.id_albaranes = av.id' + ' ' +

                            'LEFT JOIN almacenes AS al' + ' ' +
                            'ON ad.id_almacenes = al.id' + ' ' +

                            'LEFT JOIN articulos AS a' + ' ' +
                            'ON ad.id_articulos = a.id' + ' ' +

                            'LEFT JOIN impuestos AS i' + ' ' +
                            'ON ad.id_impuestos_Ventas = i.id' + ' ' +

                            'LEFT JOIN clientes AS cl' + ' ' +
                            'ON ad.id_clientes = cl.id' + ' ' +

                            'RIGHT JOIN albaranes_ventas AS albv' + ' ' +
                            'ON ad.id_albaranes = albv.id AND' + ' ' +
                               'ad.Del_WHEN IS NULL ',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_a_Filtrar_Plus.Free;
end;

procedure Tform_articulos_000.Refrescar_Registros_Albaranes_Ventas_Detalles_sin_Facturar;
var
  var_Ctdad_Albaranes_sin_Facturar_a_Ver : String;
  var_Lineas_Filtro                      : TStrings;
  var_Lineas_OrderBy                     : TStrings;
  var_id                                 : ShortString;
  var_ver_Bajas                          : ShortInt;
  var_SQL_ADD                            : TStrings;
begin
    var_SQL_ADD := TStringList.Create;

    // ********************************************************************************************* //
    // ** Solo si la cabecera está en modo EDIT se abren las tablas hijas                         ** //
    // ********************************************************************************************* //
    if SQLQuery_Articulos.State <> dsEdit then Exit;

    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_id := '';

    with SQLQuery_Alb_Ventas_Detalles do
    begin
        if RecordCount > 0 then
        begin
            if FieldByName('id').IsNull then
            begin
                var_id := '0';
            end else begin
                var_id := FieldByName('id').AsString;
            end;
        end;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Clear;
    var_Lineas_OrderBy.Clear;

    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'ad.id_articulos = ' + SQLQuery_Articulos.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'ad.Numero_Factura IS NULL ' );
    UTI_TB_SQL_ADD( false,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_ver_Bajas                          := 1; // asi no se ven las bajas hasta que no lo pida el form de altas/modif de líneas
    var_Ctdad_Albaranes_sin_Facturar_a_Ver := public_Ctdad_Rgistros_a_Ver;
    if UTI_GEN_Form_Abierto_Ya('form_articulos_001') = true then
    begin
        var_ver_Bajas                          := form_articulos_001.RadioGroup_Bajas.ItemIndex;
        var_Ctdad_Albaranes_sin_Facturar_a_Ver := form_articulos_001.Edit_Ctdad_Albaranes_Ventas_sin_Facturar_a_Ver.Text;
    end;

    Filtrar_Albaranes_Ventas_Detalles_sin_Facturar( var_Ctdad_Albaranes_sin_Facturar_a_Ver,
                                                    var_ver_Bajas,
                                                    false,
                                                    var_Lineas_Filtro,
                                                    var_Lineas_OrderBy );

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;

    if var_id <> '' then
    begin
        if var_id = '0' then
        begin
            // ************************************************************************************* //
            // ** Estabamos en una insercción, así que me voy al último registro, pues el order by** //
            // ** es id_proveedor + id del registro                                               ** //
            // ************************************************************************************* //
            SQLQuery_Alb_Ventas_Detalles.Last;
        end else begin
            // ************************************************************************************* //
            // ** Estabamos en una edición, así que ya conocíamos la id del registro. Por lo que  ** //
            // ** hago el locate por esta id                                                      ** //
            // ************************************************************************************* //
            SQLQuery_Alb_Ventas_Detalles.Locate('id', StrToInt64(var_id), []);
        end;

    end;
    var_SQL_ADD.Free;
end;

function Tform_articulos_000.Filtrar_Facturas_Compras_Detalles( param_Limite_Registros : string;
                                                                param_ver_bajas : ShortInt;
                                                                param_Cambiamos_Filtro : Boolean;
                                                                param_Lineas_Filtro,
                                                                param_Lineas_OrderBy : TStrings ) : ShortInt;
var
  var_a_Filtrar_Plus : TStrings;
begin
  var_a_Filtrar_Plus := TStringList.Create;
  var_a_Filtrar_Plus.Clear;

  if Trim(param_Lineas_OrderBy.Text) = '' then
  begin
    param_Lineas_OrderBy.Text := private_Order_By_Ftra_Compras_Detalle[0].Memo_OrderBy +
                                 ' LIMIT ' + Trim(param_Limite_Registros);
  end;

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  Result := UTI_TB_Filtrar( private_Order_By_Ftra_Compras_Detalle,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Ftra_Compras_Detalles,
                                                          'facturas_compras_detalles',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Ftra_Compras_Detalles,
                                                          'facturas_compras_detalles',
                                                          'i' ),
                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_Articulos.SQLTransaction_Ftra_Compras_Detalles,
                            DataModule_Articulos.SQLConnector_Ftra_Compras_Detalles,
                            SQLQuery_Ftra_Compras_Detalles,

                            // name_tabla,
                            'fcd',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT fcd.*,' + ' ' +

                                   'pr.nombre_propietario AS OT_Proveedor_nombre_propietario,' + ' ' +
                                   'pr.nombre_comercial AS OT_Proveedor_nombre_comercial,' + ' ' +

                                   'fc.id_almacenes AS OT_id_almacenes_Cabecera,' + ' ' +
                                   'fc.Serie_Factura AS OT_Serie_Factura,' + ' ' +
                                   'fc.Numero_Factura AS OT_Numero_Factura,' + ' ' +

                                   'al.descripcion AS OT_descripcion_almacen,' + ' ' +

                                   'a.descripcion_para_TPV AS OT_descripcion_articulo,' + ' ' +
                                   'a.Tipo_de_articulo AS OT_Tipo_de_articulo,' + ' ' +

                                   'i.descripcion AS OT_descripcion_impuesto,' + ' ' +
                                   'i.Tanto_Por_Ciento AS OT_Tanto_Por_Ciento,' + ' ' +
                                   'i.Sumado_A_Ftra_SN AS OT_Sumado_A_Ftra_SN' + ' ' +

                            'FROM facturas_compras_detalles AS fcd' + ' ' +

                            'LEFT JOIN almacenes AS al' + ' ' +
                            'ON fcd.id_almacenes = al.id' + ' ' +

                            'LEFT JOIN articulos AS a' + ' ' +
                            'ON fcd.id_articulos = a.id' + ' ' +

                            'LEFT JOIN impuestos AS i' + ' ' +
                            'ON fcd.id_impuestos_Compras = i.id' + ' ' +

                            'LEFT JOIN proveedores AS pr' + ' ' +
                            'ON fcd.id_proveedores = pr.id' + ' ' +

                            'RIGHT JOIN facturas_compras AS fc' + ' ' +
                            'ON fcd.id_facturas = fc.id AND' + ' ' +
                               'fc.Del_WHEN IS NULL ',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_a_Filtrar_Plus.Free;

  Actualizar_Ultimas_Compras;
end;

procedure Tform_articulos_000.Actualizar_Ultimas_Compras;
var var_Se_Pone : Boolean;
begin
    with SQLQuery_Ftra_Compras_Detalles do
    begin
        if Active = True then
        begin
            if RecordCount > 0 then
            begin
                First;

                if FieldByName('id_articulos').AsString = SQLQuery_Articulos.FieldByName('id').AsString then
                begin
                    var_Se_Pone := false;
                    if Trim(public_Compra_Ultima_Fecha) = '' then
                    begin
                        var_Se_Pone := true;
                    end else begin
                        if StrToDateTime(Trim(public_Compra_Ultima_Fecha)) <
                           FieldByName('Fecha_Movimiento').Value then
                        begin
                            var_Se_Pone := true;
                        end;
                    end;

                    if var_Se_Pone = true then
                    begin
                        public_Compra_Ultima_Fecha                := FieldByName('Fecha_Movimiento').AsString;
                        public_Compra_Ultimo_Precio               := FieldByName('PVP').AsString;

                        if UTI_GEN_Form_Abierto_Ya('form_articulos_001') = true then
                        begin
                            form_articulos_001.Poner_Ultima_Compra;
                        end;
                    end;
                end;
            end;
        end;
    end;

    with SQLQuery_Alb_Compras_Detalles do
    begin
        if Active = True then
        begin
            if RecordCount > 0 then
            begin
                First;

                if FieldByName('id_articulos').AsString = SQLQuery_Articulos.FieldByName('id').AsString then
                begin
                    var_Se_Pone := false;
                    if Trim(public_Compra_Ultima_Fecha) = '' then
                    begin
                        var_Se_Pone := true;
                    end else begin
                        if StrToDateTime(Trim(public_Compra_Ultima_Fecha)) <
                           FieldByName('Fecha_Movimiento').Value then
                        begin
                            var_Se_Pone := true;
                        end;
                    end;

                    if var_Se_Pone = true then
                    begin
                        public_Compra_Ultima_Fecha                := FieldByName('Fecha_Movimiento').AsString;
                        public_Compra_Ultimo_Precio               := FieldByName('PVP').AsString;

                        if UTI_GEN_Form_Abierto_Ya('form_articulos_001') = true then
                        begin
                            form_articulos_001.Poner_Ultima_Compra;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;

procedure Tform_articulos_000.Refrescar_Registros_Facturas_Compras_Detalles;
var
  var_Ctdad_Ftras_a_Ver : String;
  var_Lineas_Filtro     : TStrings;
  var_Lineas_OrderBy    : TStrings;
  var_id                : ShortString;
  var_ver_Bajas         : ShortInt;
  var_SQL_ADD           : TStrings;
begin
    var_SQL_ADD := TStringList.Create;

    // ********************************************************************************************* //
    // ** Solo si la cabecera está en modo EDIT se abren las tablas hijas                         ** //
    // ********************************************************************************************* //
    if SQLQuery_Articulos.State <> dsEdit then Exit;

    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_id := '';

    with SQLQuery_Ftra_Compras_Detalles do
    begin
        if RecordCount > 0 then
        begin
            if FieldByName('id').IsNull then
            begin
                var_id := '0';
            end else begin
                var_id := FieldByName('id').AsString;
            end;
        end;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Clear;
    var_Lineas_OrderBy.Clear;

    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'fcd.id_articulos = ' + SQLQuery_Articulos.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_ver_Bajas         := 1; // asi no se ven las bajas hasta que no lo pida el form de altas/modif de líneas
    var_Ctdad_Ftras_a_Ver := public_Ctdad_Rgistros_a_Ver;
    if UTI_GEN_Form_Abierto_Ya('form_articulos_001') = true then
    begin
        var_ver_Bajas         := form_articulos_001.RadioGroup_Bajas.ItemIndex;
        var_Ctdad_Ftras_a_Ver := form_articulos_001.Edit_Ctdad_Facturas_Compras_a_Ver.Text;
    end;

    Filtrar_Facturas_Compras_Detalles( var_Ctdad_Ftras_a_Ver,
                                       var_ver_Bajas,
                                       false,
                                       var_Lineas_Filtro,
                                       var_Lineas_OrderBy );

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;

    if var_id <> '' then
    begin
        if var_id = '0' then
        begin
            // ************************************************************************************* //
            // ** Estabamos en una insercción, así que me voy al último registro, pues el order by** //
            // ** es id_proveedor + id del registro                                               ** //
            // ************************************************************************************* //
            SQLQuery_Ftra_Compras_Detalles.Last;
        end else begin
            // ************************************************************************************* //
            // ** Estabamos en una edición, así que ya conocíamos la id del registro. Por lo que  ** //
            // ** hago el locate por esta id                                                      ** //
            // ************************************************************************************* //
            SQLQuery_Ftra_Compras_Detalles.Locate('id', StrToInt64(var_id), []);
        end;

    end;
    var_SQL_ADD.Free;
end;

function Tform_articulos_000.Filtrar_Facturas_Ventas_Detalles( param_Limite_Registros : string;
                                                               param_ver_bajas : ShortInt;
                                                               param_Cambiamos_Filtro : Boolean;
                                                               param_Lineas_Filtro,
                                                               param_Lineas_OrderBy : TStrings ) : ShortInt;
var
  var_a_Filtrar_Plus : TStrings;
begin
  var_a_Filtrar_Plus := TStringList.Create;
  var_a_Filtrar_Plus.Clear;

  if Trim(param_Lineas_OrderBy.Text) = '' then
  begin
    param_Lineas_OrderBy.Text := private_Order_By_Ftra_Ventas_Detalle[0].Memo_OrderBy +
                                 ' LIMIT ' + Trim(param_Limite_Registros);
  end;

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  Result := UTI_TB_Filtrar( private_Order_By_Ftra_Ventas_Detalle,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Ftra_Ventas_Detalles,
                                                          'facturas_ventas_detalles',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Ftra_Ventas_Detalles,
                                                          'facturas_ventas_detalles',
                                                          'i' ),

                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_Articulos.SQLTransaction_Ftra_Ventas_Detalles,
                            DataModule_Articulos.SQLConnector_Ftra_Ventas_Detalles,
                            SQLQuery_Ftra_Ventas_Detalles,

                            // name_tabla,
                            'fd',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT fd.*,' + ' ' +

                                   'cl.nombre_propietario AS OT_Cliente_nombre_propietario,' + ' ' +
                                   'cl.nombre_comercial AS OT_Cliente_nombre_comercial,' + ' ' +

                                   'fv.id_almacenes AS OT_id_almacenes_Cabecera,' + ' ' +
                                   'fv.Serie_Factura AS OT_Serie_Factura,' + ' ' +
                                   'fv.Numero_Factura AS OT_Numero_Factura,' + ' ' +

                                   'al.descripcion AS OT_descripcion_almacen,' + ' ' +

                                   'a.descripcion_para_TPV AS OT_descripcion_articulo,' + ' ' +
                                   'a.Tipo_de_articulo AS OT_Tipo_de_articulo,' + ' ' +

                                   'i.descripcion AS OT_descripcion_impuesto,' + ' ' +
                                   'i.Tanto_Por_Ciento AS OT_Tanto_Por_Ciento,' + ' ' +
                                   'i.Sumado_A_Ftra_SN AS OT_Sumado_A_Ftra_SN' + ' ' +

                            'FROM facturas_ventas_detalles AS fd' + ' ' +

                            'LEFT JOIN almacenes AS al' + ' ' +
                            'ON fd.id_almacenes = al.id' + ' ' +

                            'LEFT JOIN articulos AS a' + ' ' +
                            'ON fd.id_articulos = a.id' + ' ' +

                            'LEFT JOIN impuestos AS i' + ' ' +
                            'ON fd.id_impuestos_Ventas = i.id' + ' ' +

                            'LEFT JOIN clientes AS cl' + ' ' +
                            'ON fd.id_clientes = cl.id' + ' ' +

                            'RIGHT JOIN facturas_ventas AS fv' + ' ' +
                            'ON fd.id_facturas = fv.id AND' + ' ' +
                               'fv.Del_WHEN IS NULL ',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_a_Filtrar_Plus.Free;
end;

procedure Tform_articulos_000.Refrescar_Registros_Facturas_Ventas_Detalles;
var
  var_Ctdad_Ftras_a_Ver : String;
  var_Lineas_Filtro     : TStrings;
  var_Lineas_OrderBy    : TStrings;
  var_id                : ShortString;
  var_ver_Bajas         : ShortInt;
  var_SQL_ADD           : TStrings;
begin
    var_SQL_ADD := TStringList.Create;

    // ********************************************************************************************* //
    // ** Solo si la cabecera está en modo EDIT se abren las tablas hijas                         ** //
    // ********************************************************************************************* //
    if SQLQuery_Articulos.State <> dsEdit then Exit;

    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_id := '';

    with SQLQuery_Ftra_Ventas_Detalles do
    begin
        if RecordCount > 0 then
        begin
            if FieldByName('id').IsNull then
            begin
                var_id := '0';
            end else begin
                var_id := FieldByName('id').AsString;
            end;
        end;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Clear;
    var_Lineas_OrderBy.Clear;

    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'fd.id_articulos = ' + SQLQuery_Articulos.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_ver_Bajas         := 1; // asi no se ven las bajas hasta que no lo pida el form de altas/modif de líneas
    var_Ctdad_Ftras_a_Ver := public_Ctdad_Rgistros_a_Ver;
    if UTI_GEN_Form_Abierto_Ya('form_articulos_001') = true then
    begin
        var_ver_Bajas         := form_articulos_001.RadioGroup_Bajas.ItemIndex;
        var_Ctdad_Ftras_a_Ver := form_articulos_001.Edit_Ctdad_Facturas_Ventas_a_Ver.Text;
    end;

    Filtrar_Facturas_Ventas_Detalles( var_Ctdad_Ftras_a_Ver,
                                      var_ver_Bajas,
                                      false,
                                      var_Lineas_Filtro,
                                      var_Lineas_OrderBy );

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;

    if var_id <> '' then
    begin
        if var_id = '0' then
        begin
            // ************************************************************************************* //
            // ** Estabamos en una insercción, así que me voy al último registro, pues el order by** //
            // ** es id_proveedor + id del registro                                               ** //
            // ************************************************************************************* //
            SQLQuery_Ftra_Ventas_Detalles.Last;
        end else begin
            // ************************************************************************************* //
            // ** Estabamos en una edición, así que ya conocíamos la id del registro. Por lo que  ** //
            // ** hago el locate por esta id                                                      ** //
            // ************************************************************************************* //
            SQLQuery_Ftra_Ventas_Detalles.Locate('id', StrToInt64(var_id), []);
        end;

    end;
    var_SQL_ADD.Free;
end;

function Tform_articulos_000.Filtrar_Articulos_Tarifas( param_ver_bajas : ShortInt;
                                                        param_Cambiamos_Filtro : Boolean;
                                                        param_Lineas_Filtro,
                                                        param_Lineas_OrderBy : TStrings ) : ShortInt;
var
  var_SQL_Parte      : String;
  var_a_Filtrar_Plus : TStrings;
begin
  var_a_Filtrar_Plus := TStringList.Create;
  var_a_Filtrar_Plus.Clear;

  if Trim(param_Lineas_OrderBy.Text) = '' then
  begin
    param_Lineas_OrderBy.Text := private_Order_By_tarifas[0].Memo_OrderBy;
  end;

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  if Trim(public_Compra_Ultimo_Precio) = '' then
  begin
    var_SQL_Parte := '( SELECT 0 ) AS OT_mayor_igual_que,' + ' ' +
                     '( SELECT 0 ) AS OT_menor_igual_que,' + ' ' +
                     '( SELECT 0 ) AS OT_Beneficio,' + ' ' +
                     '( SELECT "S" ) AS OT_Beneficio_en_Tanto_por_Ciento_SN' + ' ';
  end

  else
  begin
    var_SQL_Parte := '( SELECT mt.mayor_igual_que' + ' ' +
                         'FROM tarifas_margenes AS tm' + ' ' +
                        'RIGHT JOIN margenes_tarifas AS mt' + ' ' +
                           'ON tm.id_margenes_tarifas = mt.id' + ' ' +
                          'AND ( ' + Trim(public_Compra_Ultimo_Precio) + ' >= mt.mayor_igual_que AND' + ' ' +
                                     Trim(public_Compra_Ultimo_Precio) + ' <= mt.menor_igual_que )' + ' ' +
                        'WHERE tm.id_tarifas = ta.id_tarifas' + ' ' +
                        'ORDER BY tm.id_tarifas ASC, tm.id_margenes_tarifas ASC ) AS OT_mayor_igual_que,' + ' ' +

                     '( SELECT mt.menor_igual_que' + ' ' +
                         'FROM tarifas_margenes AS tm' + ' ' +
                        'RIGHT JOIN margenes_tarifas AS mt' + ' ' +
                           'ON tm.id_margenes_tarifas = mt.id' + ' ' +
                          'AND ( ' + Trim(public_Compra_Ultimo_Precio) + ' >= mt.mayor_igual_que AND' + ' ' +
                                     Trim(public_Compra_Ultimo_Precio) + ' <= mt.menor_igual_que )' + ' ' +
                        'WHERE tm.id_tarifas = ta.id_tarifas' + ' ' +
                        'ORDER BY tm.id_tarifas ASC, tm.id_margenes_tarifas ASC ) AS OT_menor_igual_que,' + ' ' +

                     '( SELECT tm.Beneficio' + ' ' +
                         'FROM tarifas_margenes AS tm' + ' ' +
                        'RIGHT JOIN margenes_tarifas AS mt' + ' ' +
                           'ON tm.id_margenes_tarifas = mt.id' + ' ' +
                          'AND ( ' + Trim(public_Compra_Ultimo_Precio) + ' >= mt.mayor_igual_que AND' + ' ' +
                                     Trim(public_Compra_Ultimo_Precio) + ' <= mt.menor_igual_que )' + ' ' +
                        'WHERE tm.id_tarifas = ta.id_tarifas' + ' ' +
                        'ORDER BY tm.id_tarifas ASC, tm.id_margenes_tarifas ASC ) AS OT_Beneficio,' + ' ' +

                     '( SELECT tm.Beneficio_en_Tanto_por_Ciento_SN' + ' ' +
                         'FROM tarifas_margenes AS tm' + ' ' +
                        'RIGHT JOIN margenes_tarifas AS mt' + ' ' +
                           'ON tm.id_margenes_tarifas = mt.id' + ' ' +
                          'AND ( ' + Trim(public_Compra_Ultimo_Precio) + ' >= mt.mayor_igual_que AND' + ' ' +
                                     Trim(public_Compra_Ultimo_Precio) + ' <= mt.menor_igual_que )' + ' ' +
                        'WHERE tm.id_tarifas = ta.id_tarifas' + ' ' +
                        'ORDER BY tm.id_tarifas ASC, tm.id_margenes_tarifas ASC ) AS OT_Beneficio_en_Tanto_por_Ciento_SN' + ' ';
  end;

  Result := UTI_TB_Filtrar( private_Order_By_tarifas,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Articulos_Tarifas,
                                                          'articulos_tarifas',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Articulos_Tarifas,
                                                          'articulos_tarifas',
                                                          'i' ),

                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_Articulos.SQLTransaction_ArtTarifas,
                            DataModule_Articulos.SQLConnector_ArtTarifas,
                            SQLQuery_Articulos_Tarifas,

                            // name_tabla,
                            'ta',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT ta.*,' + ' ' +
                                   't.descripcion AS OT_descripcion_tarifa,' + ' ' +
                                   var_SQL_Parte +

                            'FROM articulos_tarifas AS ta' + ' ' +

                            'LEFT JOIN tarifas AS t' + ' ' +
                            'ON ta.id_tarifas = t.id' + ' ',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_a_Filtrar_Plus.Free;
end;

procedure Tform_articulos_000.Refrescar_Registros_Margenes;
var var_Lineas_Filtro       : TStrings;
    var_Lineas_OrderBy      : TStrings;
    var_id_margenes_tarifas : Int64;
    var_ver_Bajas           : ShortInt;
begin
    // ********************************************************************************************* //
    // ** Solo si la cabecera está en modo EDIT se abren las tablas hijas                         ** //
    // ********************************************************************************************* //
    if SQLQuery_Articulos_Tarifas.State <> dsEdit then Exit;

    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_id_margenes_tarifas := 0;

    if SQLQuery_Tarifas_Margenes.RecordCount > 0 then
    begin
        var_id_margenes_tarifas := SQLQuery_Tarifas_Margenes.FieldByName('id_margenes_tarifas').Value;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Clear;
    var_Lineas_OrderBy.Clear;

    if Trim(SQLQuery_Articulos_Tarifas.FieldByName('id_tarifas').AsString) <> '' then
         var_Lineas_Filtro.Add('tm.id_tarifas = ' + Trim(SQLQuery_Articulos_Tarifas.FieldByName('id_tarifas').AsString))
    else var_Lineas_Filtro.Add('tm.id_tarifas = Null');

    var_ver_Bajas := 1;

    Filtrar_Tarifas_Margenes( var_ver_Bajas,
                              false,
                              var_Lineas_Filtro,
                              var_Lineas_OrderBy );

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;

    if var_id_margenes_tarifas <> 0 then
    begin
         SQLQuery_Tarifas_Margenes.Locate( 'id_margenes_tarifas',
                                           var_id_margenes_tarifas,
                                           [] );
    end;
end;

function Tform_articulos_000.Filtrar_Tarifas_Margenes( param_ver_bajas : ShortInt;
                                                       param_Cambiamos_Filtro : Boolean;
                                                       param_Lineas_Filtro,
                                                       param_Lineas_OrderBy : TStrings ) : ShortInt;
var
  var_a_Filtrar_Plus : TStrings;
begin
  var_a_Filtrar_Plus := TStringList.Create;
  var_a_Filtrar_Plus.Clear;

  if Trim(param_Lineas_OrderBy.Text) = '' then
  begin
    param_Lineas_OrderBy.Text := private_Order_By_margenes[0].Memo_OrderBy;
  end;

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  Result := UTI_TB_Filtrar( private_Order_By_margenes,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Tarifas_Margenes,
                                                         'tarifas_margenes',
                                                         'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Tarifas_Margenes,
                                                          'tarifas_margenes',
                                                          'i' ),

                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_Articulos.SQLTransaction_Tarifas_Margenes,
                            DataModule_Articulos.SQLConnector_Tarifas_Margenes,
                            SQLQuery_Tarifas_Margenes,

                            // name_tabla,
                            'tm',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT tm.*, ' +

                                  ' t.descripcion AS OT_Tarifa_Descripcion, ' +

                                  ' mt.mayor_igual_que AS OT_mayor_igual_que, ' +
                                  ' mt.menor_igual_que AS OT_menor_igual_que ' +

                            'FROM tarifas_margenes AS tm ' +

                            'LEFT JOIN tarifas AS t ' +
                            'ON tm.id_tarifas = t.id ' +

                            'LEFT JOIN margenes_tarifas AS mt ' +
                            'ON tm.id_margenes_tarifas = mt.id',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_a_Filtrar_Plus.Free;
end;

procedure Tform_articulos_000.Calcular_Composicion_Total_Coste;
var var_total : Extended;
begin
        var_total := 0;

        with SQLQuery_Articulos_Composiciones do
        begin
            if Active = True then
            begin
                if RecordCount > 0 then
                begin
                    First;

                    While not Eof do
                    begin
                        if (not FieldByName('Unidades').IsNull)        and
                           (not FieldByName('OT_Coste_Unidad').IsNull) then
                        begin
                             var_total := var_total +
                                          ( FieldByName('Unidades').Value *
                                            FieldByName('OT_Coste_Unidad').Value );
                        end;

                        Next;
                    end;
                end;
            end;
        end;

        if UTI_GEN_Form_Abierto_Ya('form_articulos_001') = true then
        begin
             form_articulos_001.Edit_Composicion_Total.Text := FloatToStr(var_total);
        end;
end;

end.

Probablemente el calculo de lo sugerido para las tarifas de ventas tendrá que elegir
entre el precio de costo y el precio de ultima compra.

a Filtrar_Articulos_Proporciones_Tarifas tengo que pasarle el precio de costo para que calcule bien

Siempre ganará el precio de costo por ser un producto manufacturado

Este mismo criterio hacerlo con las tarifas de proporciones

Desde albaranes y facturas si un artículo está compuesto por varios artículos entonces
a la hora de vender, el sistema considera como tal el artículo “bocadillo de jamón”,
pero descontando del almacén la cantidad estipulada para cada ingrediente.

Proporciones: Botón usado para definir un artículo en diferentes proporciones.
Por ejemplo, para el artículo ABSOLUT, una unidad corresponde a una botella de un litro,
y el usuario puede asignarle las siguientes proporciones: chupito (0.04l), copa (0.15l) y
tubo (0.3l).
Cada vez que una de estas unidades se venda, el sistema descontará la cantidad seleccionada para el
artículo hasta que llegue a 0, que restará una unidad de ABSOLUT del stock del almacén.

resulta que en articulos_005 se modifican las tarifas de las proporciones y desde articulos_001 también
pues tengo que ver de dejarlo en un solo sitio pero usar la plantilla de tarifas/edicion

ver si en editar_registro_tarifa de articulos_001 hay que poner más campos a controlar

********************************************************
jeromillo todo esto de abajo viene de articulos_001
********************************************************

En la tabla 'articulos_tarifas':
* Añadir el campo 'Aplicar_beneficio_en_tantoporciento_o_Importe' porque ahora ira implicito sobre
  cada tarifa del artículo

Crear tabla nueva para recoger las referencias y los códigos de barra por id de artículo


Una vez termine con el mantenimiento de artículos tengo que pasar al mantenimiento de tipos de artículos
(familias) y ver como atañe este al de artículos a la hora de asignarlos a una de estas familias




