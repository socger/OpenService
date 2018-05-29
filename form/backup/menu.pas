unit menu;

{$mode objfpc}{$H+}

interface

uses
    utilidades_usuarios, Classes, SysUtils, FileUtil, Forms, Controls, Graphics, utilidades_ini,
    Buttons, Menus, utilidades_general, ExtCtrls, ComCtrls, utilidades_forms_Filtrar, ActnList,
    utilidades_bd, utilidades_impresoras, utilidades_datos_tablas, LCLTranslator, sqldb;

resourcestring
  rs_Titulo_1         = 'openSOCGER - Usuario : ';
  rs_Titulo_2         = ' - Empresa : ';

  rs_Texto_Salir      = '¿Desea Realmente Salir ...?';

  rs_Configurar_APP_1 = 'NO SE HA CREADO LA CONFIGURACIÓN DEL PROGRAMA, ASI QUE NO PODEMOS CONTINUAR.';
  rs_Configurar_APP_2 = 'CUANDO VUELVA A LLAMAR AL PROGRAMA, PULSE SOBRE EL BOTON DE ACEPTAR SI LA ';
  rs_Configurar_APP_3 = 'CONFIGURACIÓN ES CORRECTA O CAMBIELA Y ACEPTE SU CONFIGURACIÓN.';
  rs_Configurar_APP_4 = 'SIN COMPLETAR CONFIGURACIÓN';

  rs_Modulo_Abierto   = 'Módulo ya abierto, no puedo abrirlo dos veces.';
  rs_menu_sin_Modulo  = 'Todavía no conozco el módulo a abrir con id = ';

  rs_Solo_Visualizar  = 'Sólo se puede visualizar.';
  rs_No_Se_Puede      = 'NO SE PUEDE';
  rs_No_Se_Pudo       = 'NO SE PUDO ... ';

  rs_no_Hay_Rgtros    = 'No hay registros.';

  rs_Filtros_Otros_1  = 'Ordenado por ';
  rs_Filtros_Otros_2  = ', con filtrado personalizado = ';

  rs_OK               = '¿OK?';
  rs_Falta            = 'FALTA POR COMPLETAR.-';
  rs_Ya_Existe        = 'YA EXISTE.-';
  rs_Rgtro_Borrado    = 'Y el registro fué dado de baja.';

  rs_Filtro_Comprobar = 'No se pudo comprobar si ya existe el filtro.';
  rs_Filtro_Repetido  = 'Filtro ya repetido para este módulo (id: ';

type

    { Tform_Menu }

    Tform_Menu = class(TForm)
      BitBtn_ver_www: TAction;
      BitBtn_Enviar_Correo: TAction;
      BitBtn_Borrar_Dato: TAction;
      BitBtn_Imprimir: TAction;
      BitBtn_Seleccionar: TAction;
      BitBtn_SALIR: TAction;
      BitBtn_Filtrar: TAction;
      BitBtn_Filtros_Cerrar: TAction;
      BitBtn_Filtros_Abrir: TAction;
      BitBtn_ver_direccion_en_Maps: TAction;
      BitBtn_Encontrar_Registro_Binoculares: TAction;
      BitBtn_Ver_Situacion_Registro: TAction;
      ActionList_Botones: TActionList;
        Image1: TImage;
        ImageList_Botones: TImageList;
        MainMenu1: TMainMenu;
        MenuItem1: TMenuItem;
        MenuItem10: TMenuItem;
        MenuItem13: TMenuItem;
        MenuItem19: TMenuItem;
        MenuItem20: TMenuItem;
        MenuItem21: TMenuItem;
        MenuItem22: TMenuItem;
        MenuItem23: TMenuItem;
        MenuItem24: TMenuItem;
        MenuItem25: TMenuItem;
        MenuItem27: TMenuItem;
        MenuItem_Servicios_Tipos: TMenuItem;
        MenuItem_Maestros_Servicios_Regulares: TMenuItem;
        MenuItem26: TMenuItem;
        MenuItem_Informes: TMenuItem;
        MenuItem_Ver_Ultimas_Compras: TMenuItem;
        MenuItem_Ver_Ultimas_Ventas: TMenuItem;
        MenuItem_Facturas_Compras_Cerrar: TMenuItem;
        MenuItem_Facturas_Ventas_Cerrar: TMenuItem;
        MenuItem_Facturas_Ventas: TMenuItem;
        MenuItem_Facturas_Compras: TMenuItem;
        MenuItem_Utilidades: TMenuItem;
        MenuItem_Presupuestos_Compras: TMenuItem;
        MenuItem_Pedidos_Compras: TMenuItem;
        MenuItem_Albaranes_Compras: TMenuItem;
        MenuItem_Facturas_Compras_con_Submenu: TMenuItem;
        MenuItem_Compras_con_Submenu: TMenuItem;
        MenuItem_Margenes_Tarifas: TMenuItem;
        MenuItem_Tarifas: TMenuItem;
        MenuItem_Cambiar_Idioma_Spanish: TMenuItem;
        MenuItem_Cambiar_Idioma_French: TMenuItem;
        MenuItem_Cambiar_Idioma_Engish: TMenuItem;
        MenuItem_Cambiar_Idioma_Romanian: TMenuItem;
        MenuItem8: TMenuItem;
        MenuItem_Facturas_Ventas_con_Submenu: TMenuItem;
        MenuItem_Visitas_Planificacion_Provincias: TMenuItem;
        MenuItem_Visitas_Planificacion_Rutas: TMenuItem;
        MenuItem_Visitas_Planificacion_con_Submenu: TMenuItem;
        MenuItem_Visitas_Explotacion_Representantes: TMenuItem;
        MenuItem_Visitas_Explotacion_Actividades: TMenuItem;
        MenuItem_Visitas_Explotacion_Tipo_Clientes: TMenuItem;
        MenuItem_Visitas_Explotacion_Clientes: TMenuItem;
        MenuItem_Visitas_Explotacion_Provincias: TMenuItem;
        MenuItem_Visitas_Explotacion_Rutas: TMenuItem;
        MenuItem_Visitas_Explotacion_con_Submenu: TMenuItem;
        MenuItem_Rutas: TMenuItem;
        MenuItem_Actividades: TMenuItem;
        MenuItem_Visitas: TMenuItem;
        MenuItem_Visitas_con_Submenu: TMenuItem;
        MenuItem_Visitas_Resultados: TMenuItem;
        MenuItem_Visitas_Tipos: TMenuItem;
        MenuItem_Configuracion_con_Submenu: TMenuItem;
        MenuItem_Pedidos_Ventas: TMenuItem;
        MenuItem_Presupuestos_Ventas: TMenuItem;
        MenuItem_Fin: TMenuItem;
        MenuItem_Elegir_Empresa: TMenuItem;
        MenuItem11: TMenuItem;
        MenuItem12: TMenuItem;
        MenuItem_Albaranes_Ventas: TMenuItem;
        MenuItem_Tarjetas_con_Submenu: TMenuItem;
        MenuItem17: TMenuItem;
        MenuItem_Ventas_con_Submenu: TMenuItem;
        MenuItem_Vehiculos_Equipamientos: TMenuItem;
        MenuItem_Tarjetas_Transporte: TMenuItem;
        MenuItem_Personal_Contratos: TMenuItem;
        MenuItem14: TMenuItem;
        MenuItem15: TMenuItem;
        MenuItem16: TMenuItem;
        MenuItem_Vehiculos_Tipo_Ruedas: TMenuItem;
        MenuItem_Vehiculos_Tipo_Cambios: TMenuItem;
        MenuItem_Combustibles: TMenuItem;
        MenuItem_Vehiculos_Marcas: TMenuItem;
        MenuItem_Almacenes: TMenuItem;
        MenuItem18: TMenuItem;
        MenuItem_Almacenes_Movimientos: TMenuItem;
        MenuItem3: TMenuItem;
        MenuItem5: TMenuItem;
        MenuItem_Peliculas: TMenuItem;
        MenuItem_Medios: TMenuItem;
        MenuItem_Personal_Contratos_Tipos: TMenuItem;
        MenuItem_Personal: TMenuItem;
        MenuItem_Familias_Personal: TMenuItem;
        MenuItem_Gastos_Tipos: TMenuItem;
        MenuItem_Articulos_Ofertas: TMenuItem;
        MenuItem_Familias_Articulos: TMenuItem;
        MenuItem_Articulos: TMenuItem;
        MenuItem_Proveedores_Tipos: TMenuItem;
        MenuItem_Proveedores: TMenuItem;
        MenuItem_Clientes_Tipos: TMenuItem;
        MenuItem_Clientes: TMenuItem;
        MenuItem_Vehiculos_Tipos: TMenuItem;
        MenuItem_Vehiculos: TMenuItem;
        MenuItem_Vehiculos_con_Submenu: TMenuItem;
        MenuItem2: TMenuItem;
        MenuItem4: TMenuItem;
        MenuItem7: TMenuItem;
        MenuItem_Bancos_Empresas: TMenuItem;
        MenuItem9: TMenuItem;
        MenuItem_Conceptos_Almacen_Traspaso: TMenuItem;
        MenuItem_Cuentas_Pagos_Cobros: TMenuItem;
        MenuItem_Almacenes_con_Submenu: TMenuItem;
        MenuItem_Empresas: TMenuItem;
        MenuItem6: TMenuItem;
        MenuItem_Personal_con_Submenu: TMenuItem;
        MenuItem_Impuestos: TMenuItem;
        MenuItem_Impresoras: TMenuItem;
        MenuItem_Grupos_Cocina: TMenuItem;
        MenuItem_Articulos_con_Submenu: TMenuItem;
        MenuItem_Terminales: TMenuItem;
        MenuItem_Tarifas_con_Submenu: TMenuItem;
        MenuItem_Proveedores_con_Submenu: TMenuItem;
        MenuItem_Clientes_con_Submenu: TMenuItem;
        MenuItem_Representantes: TMenuItem;
        MenuItem_Formas_Pago: TMenuItem;
        MenuItem_Paises: TMenuItem;
        MenuItem_Provincias: TMenuItem;
        MenuItem_Maestros_con_Submenu: TMenuItem;
        MenuItem_Poblaciones: TMenuItem;
        MenuItem_Peliculas_con_Submenu: TMenuItem;
        MenuItem_Usuarios: TMenuItem;
        MenuItem_Menus: TMenuItem;
        MenuItem_Inicio_con_Submenu: TMenuItem;
        MenuItem_Auxiliares_con_Submenu: TMenuItem;
        Panel_Permisos_Menus: TPanel;
        ProgressBar_Permisos_Menus: TProgressBar;
        Timer_Sin_Usar: TTimer;

        procedure para_sustituir_actionListOnExecute(Sender: TObject);
        procedure MenuItem27Click(Sender: TObject);
        procedure MenuItem_Servicios_TiposClick(Sender: TObject);
        procedure MenuItem_Maestros_Servicios_RegularesClick(Sender: TObject);
        procedure MenuItem_InformesClick(Sender: TObject);
        procedure Traer_Impresora_Predeterminada;
        procedure Configurar_APP;
        procedure MenuItem10Click(Sender: TObject);
        procedure MenuItem_Facturas_ComprasClick(Sender: TObject);
        procedure MenuItem_Facturas_Compras_CerrarClick(Sender: TObject);
        procedure MenuItem_Facturas_VentasClick(Sender: TObject);
        procedure MenuItem_Albaranes_ComprasClick(Sender: TObject);
        procedure MenuItem_Cambiar_Idioma_EngishClick(Sender: TObject);
        procedure MenuItem_Cambiar_Idioma_FrenchClick(Sender: TObject);
        procedure MenuItem_Cambiar_Idioma_RomanianClick(Sender: TObject);
        procedure MenuItem_Cambiar_Idioma_SpanishClick(Sender: TObject);
        procedure MenuItem_Facturas_Ventas_CerrarClick(Sender: TObject);
        procedure MenuItem_Margenes_TarifasClick(Sender: TObject);
        procedure MenuItem_Pedidos_ComprasClick(Sender: TObject);
        procedure MenuItem_Presupuestos_ComprasClick(Sender: TObject);
        procedure MenuItem_TarifasClick(Sender: TObject);
        procedure MenuItem_UtilidadesClick(Sender: TObject);
        procedure MenuItem_Ver_Ultimas_ComprasClick(Sender: TObject);
        procedure MenuItem_Ver_Ultimas_VentasClick(Sender: TObject);
        procedure MenuItem_Visitas_Explotacion_RepresentantesClick(Sender: TObject);
        procedure MenuItem_Visitas_Explotacion_ActividadesClick(Sender: TObject);
        procedure MenuItem_Visitas_Explotacion_Tipo_ClientesClick(Sender: TObject);
        procedure MenuItem_Visitas_Explotacion_ClientesClick(Sender: TObject);
        procedure MenuItem_Visitas_Explotacion_ProvinciasClick(Sender: TObject);
        procedure MenuItem_Visitas_Explotacion_RutasClick(Sender: TObject);
        procedure MenuItem_ActividadesClick(Sender: TObject);
        procedure MenuItem_RutasClick(Sender: TObject);
        procedure MenuItem_VisitasClick(Sender: TObject);
        procedure MenuItem_Visitas_Planificacion_ProvinciasClick(Sender: TObject);
        procedure MenuItem_Visitas_Planificacion_RutasClick(Sender: TObject);
        procedure MenuItem_Visitas_ResultadosClick(Sender: TObject);
        procedure MenuItem_Pedidos_VentasClick(Sender: TObject);
        procedure MenuItem_Presupuestos_VentasClick(Sender: TObject);
        procedure MenuItem_Elegir_EmpresaClick(Sender: TObject);
        procedure MenuItem_Visitas_TiposClick(Sender: TObject);
        function  Traer_Configuracion_APP : Boolean;
        procedure MenuItem_Albaranes_VentasClick(Sender: TObject);
        procedure MenuItem_Vehiculos_EquipamientosClick(Sender: TObject);
        procedure MenuItem_AlmacenesClick(Sender: TObject);
        procedure MenuItem_ArticulosClick(Sender: TObject);
        procedure MenuItem_CombustiblesClick(Sender: TObject);
        procedure MenuItem_PeliculasClick(Sender: TObject);
        procedure MenuItem_PersonalClick(Sender: TObject);
        procedure MenuItem_ProveedoresClick(Sender: TObject);
        procedure MenuItem_ClientesClick(Sender: TObject);
        procedure MenuItem_Tarjetas_TransporteClick(Sender: TObject);
        procedure MenuItem_Vehiculos_MarcasClick(Sender: TObject);
        procedure MenuItem_Vehiculos_TiposClick(Sender: TObject);
        procedure MenuItem_VehiculosClick(Sender: TObject);
        procedure MenuItem_Vehiculos_Tipo_CambiosClick(Sender: TObject);
        procedure MenuItem_Vehiculos_Tipo_RuedasClick(Sender: TObject);
        procedure Presentar_Titulo_form_Menu_Principal;
        procedure Elegir_Empresa;
        procedure MenuItem_Almacenes_MovimientosClick(Sender: TObject);
        procedure MenuItem_Bancos_EmpresasClick(Sender: TObject);
        procedure MenuItem_Articulos_OfertasClick(Sender: TObject);
        procedure MenuItem_Conceptos_Almacen_TraspasoClick(Sender: TObject);
        procedure MenuItem_Cuentas_Pagos_CobrosClick(Sender: TObject);
        procedure MenuItem_EmpresasClick(Sender: TObject);
        procedure MenuItem_Gastos_TiposClick(Sender: TObject);
        procedure MenuItem_Personal_ContratosClick(Sender: TObject);
        procedure MenuItem_Personal_Contratos_TiposClick(Sender: TObject);
        procedure MenuItem_Clientes_TiposClick(Sender: TObject);
        procedure MenuItem_Familias_ArticulosClick(Sender: TObject);
        procedure MenuItem_Familias_PersonalClick(Sender: TObject);
        procedure MenuItem_Formas_PagoClick(Sender: TObject);
        procedure MenuItem_Grupos_CocinaClick(Sender: TObject);
        procedure MenuItem_ImpresorasClick(Sender: TObject);
        procedure MenuItem_ImpuestosClick(Sender: TObject);
        procedure MenuItem_PaisesClick(Sender: TObject);
        procedure MenuItem_MediosClick(Sender: TObject);
        procedure MenuItem_PoblacionesClick(Sender: TObject);
        procedure MenuItem_Proveedores_TiposClick(Sender: TObject);
        procedure MenuItem_ProvinciasClick(Sender: TObject);
        procedure MenuItem_RepresentantesClick(Sender: TObject);
        procedure MenuItem_TerminalesClick(Sender: TObject);
        procedure Que_Menus_Tiene_Permisos;
        procedure Preguntar_pwd;
        procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
        procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
        procedure FormCreate(Sender: TObject);
        procedure MenuItem_FinClick(Sender: TObject);
        procedure MenuItem_MenusClick(Sender: TObject);
        procedure MenuItem_UsuariosClick(Sender: TObject);
        procedure Timer_Sin_UsarTimer(Sender: TObject);

    private
      { private declarations }
      function  Traer_Empresas_xID( param_id : ShortString ) : TEmpresas;
      function  Traer_Configuracion_APP_xID( param_id : ShortString ) : TConfiguracion;

    public
      { public declarations }

      // ******************************************************************************************* //
      // ** En cada modulo esta la variable private_Salir_OK que sirve para con trolar si han     ** //
      // ** intentado SALIR de la aplicación de un modo no permi tido.                            ** //
      // ******************************************************************************************* //
      // ** Pero si desde el menu principal está a true la variable public_Salir_Ok, significa que** //
      // ** hay que salir si o si pues se pulsó cancelar al preguntar otra vez por la contraseña  ** //
      // ******************************************************************************************* //
      public_Salir_OK : Boolean;

      // ******************************************************************************************* //
      // ** Variables para la elección de impresora y cantidad de copias a imprimir               ** //
      // ******************************************************************************************* //
      public_Impresora_descripcion_Elegida : String;
      public_Impresora_Ctdad_Copias        : String;

      // ******************************************************************************************* //
      // ** Variables para la comprobación de la contraseña del usuario                           ** //
      // ******************************************************************************************* //
      public_User_Super                    : ShortString;
      public_User                          : Int64;
      public_User_Descripcion_Nick         : ShortString;

      public_pwd                           : ShortString;
      public_Password_Expira_SN            : Boolean;
      public_Password_Expira_Inicio        : ShortString;
      public_Password_Expira_Fin           : ShortString;

      public_User_Id_Empleados             : ShortString;
      public_User_Nombre_Empleado          : ShortString;

      public_User_Registro_Empresa_Elegida : TEmpresas;
      public_User_Configuracion            : TConfiguracion;

      // ******************************************************************************************* //
      // ** Variables que controlará cuando fué el último momento en el que se comprobaron los    ** //
      // ** permisos y no se uso la aplicación.                                                   ** //
      // ******************************************************************************************* //
      // ** Nos sirve para vigilar que el usuario no se olvide la pantalla abierta durante mucho  ** //
      // ** tiempo y otro usuario pueda entrar en módulos que no tenga privilegios.               ** //
      // ******************************************************************************************* //
      public_When_Last_Permission : TDateTime;

      // ******************************************************************************************* //
      // ** Variable que recogera que terminal es en la que esta trabajando la aplicacion         ** //
      // ******************************************************************************************* //
      public_Terminal : ShortString;

      // ******************************************************************************************* //
      // ** Variable que recogerá el path de donde están los logos de las diferentes empresas     ** //
      // ******************************************************************************************* //
      public_path_empresas_logos : String;

      // ******************************************************************************************* //
      // ** Variable que recogerá el path de donde están los informes/plantillas de los listados  ** //
      // ******************************************************************************************* //
      public_path_listados : String;

      // ******************************************************************************************* //
      // ** Variable que recogerá el path de donde están las imágenes de socger                   ** //
      // ******************************************************************************************* //
      public_path_imgs_socger : String;
    end;

var
    form_Menu: Tform_Menu;

implementation

{$R *.lfm}

{ Tform_Menu }

Uses empresas_002;

procedure Tform_Menu.Traer_Impresora_Predeterminada;
var var_msg                      : TStrings;
    var_Impresora_Predeterminada : TImpresora_Predeterminada;
begin
  // ********************************************************************************************* //
  // ** Preparamos cual será la impresora predeterminada del programa                           ** //
  // ********************************************************************************************* //
  var_Impresora_Predeterminada := UTI_IMPRESORAS_Traer_Predeterminada;
  if UpperCase(var_Impresora_Predeterminada.Error) = 'N' then
  begin
    public_Impresora_descripcion_Elegida := var_Impresora_Predeterminada.Impresora_descripcion_Elegida;
    public_Impresora_Ctdad_Copias        := var_Impresora_Predeterminada.Impresora_Ctdad_Copias;
  end else begin
    var_msg := TStringList.Create;
    var_msg.Clear;
    var_msg.Add('Todavia no existe ninguna impresora predeterminada.');
    var_msg.Add(' ');
    var_msg.Add('Vaya al menu << AUXILIARES/Impresoras >> y allí podrá crearla.');
    UTI_GEN_Aviso(true, var_msg, rs_Falta, True, False);
    var_msg.Free;
  end;
end;

procedure Tform_Menu.FormCreate(Sender: TObject);
var var_Valor_Minuto         : TDateTime;
    var_CN_Conexion          : Trecord_CN_Conexion;
    var_Now                  : TDateTime;
    var_When_Last_Permission : TDateTime;
begin
    // ********************************************************************************************* //
    // ** Preparamos el path donde se guardaran los logos de las diferentes empresas que se creen ** //
    // ********************************************************************************************* //
    public_path_imgs_socger    := 'document/imagenes/socger/';
    public_path_empresas_logos := 'document/imagenes/empresas/logos/';
    public_path_listados       := 'document/informes/';

    // ********************************************************************************************* //
    // ** Preparamos como se va a ver la fecha y como se van a ver los decimales y los millares   ** //
    // ********************************************************************************************* //
    UTI_GEN_AclararFormatoHora;
    UTI_GEN_AclararFormatoFecha;
    UTI_GEN_AclararSeparadoresDecimales;

    // ********************************************************************************************* //
    // ** Le decimos a la aplicación que todavía no se ha elegido ninguna empresa                 ** //
    // ********************************************************************************************* //
    public_User_Registro_Empresa_Elegida.id := '';

    // ********************************************************************************************* //
    // ** Obligado en cada formulario para no olvidarlo                                           ** //
    // ********************************************************************************************* //
    with Self do
    begin
        Position    := poScreenCenter;
        BorderIcons := [biSystemMenu,biMinimize,biMaximize];
        BorderStyle := bsSingle;

        WindowState := wsMaximized;
    end;

    public_Salir_OK := false;

    // ********************************************************************************************* //
    // ** Pasamos a activar el contador de tiempo para preguntar por la contraseña.               ** //
    // ** Y para que la pregunte nada mas empezar, le quitamos a ahora los minutos de             ** //
    // ** pausa para que obligue a preguntar por ella                                             ** //
    // ********************************************************************************************* //
    // ** Esta es la pwd para el SUPERUSUARIO }                                                   ** //
    // ********************************************************************************************* //
    public_User_Super := '1a2b3c4d';

    // ********************************************************************************************* //
    // ** Así todavía no se eligió ningun usuario                                                 ** //
    // ********************************************************************************************* //
    public_User                  := 0;
    public_User_Descripcion_Nick := '';

    // ********************************************************************************************* //
    // ** Traemos el tiempo que se necesita para volver a preguntar por la contraseña             ** //
    // ********************************************************************************************* //
    var_CN_Conexion := UTI_INI_Configuracion_Traerla;
    if var_CN_Conexion.con_Exito = False then UTI_GEN_Salir;

    var_Valor_Minuto         := StrToTime('00:02:00') - StrToTime('00:01:00');
    var_Now                  := Now;
    var_When_Last_Permission := var_Now - ( var_Valor_Minuto *
                                               StrToFloat(var_CN_Conexion.min_no_Work ));

  { var_When_Last_Permission := Date - 1;

    var_Tiempo_Donde_Preguntar := var_When_Last_Permission + (var_Valor_Minuto * StrToFloat(var_CN_Conexion.min_no_Work));

    ShowMessage( 'Ayer: ' + DateTimeToStr(var_When_Last_Permission) +
                 ', Ahora: ' + DateTimeToStr(var_Now) +
                 ', Donde preguntar : ' + DateTimeToStr(var_Tiempo_Donde_Preguntar) );

    if var_Now >= var_Tiempo_Donde_Preguntar then // Tiempo de espera ... 9 minutos
    begin
    ShowMessage( 'Tomt' );
    end;}

    // ********************************************************************************************* //
    // ** Traemos cual es impresora predeterminada para esta terminal/ordenador. Si no tuviera    ** //
    // ** configurada la impresora pues intentamos traernos la el mantenimiento de impresoras del ** //
    // ** menu auxiliar                                                                           ** //
    // ********************************************************************************************* //
    public_Impresora_descripcion_Elegida := var_CN_Conexion.Impresora_descripcion_Elegida;
    public_Impresora_Ctdad_Copias        := var_CN_Conexion.Impresora_Ctdad_Copias;

    if Trim(public_Impresora_descripcion_Elegida) = '' then
    begin
      Traer_Impresora_Predeterminada;
    end;

    // ********************************************************************************************* //
    // ** Traemos cual es la terninal con la que curramos. Su valor será numérico aunque sea un   ** //
    // ** string, pues ha de coincidir con la id del registro de la tabla de terminales.          ** //
    // ********************************************************************************************* //
    public_Terminal := var_CN_Conexion.NumTerminal;

    // ********************************************************************************************* //
    // ** Desgraciadamente UTI_GEN_Cambiar_Idioma tiene una llamada a Que_Menus_Tiene_Permisos que** //
    // ** a su vez llama a UTI_USR_Permiso_SN y nos cambia el valor a public_When_Last_Permission.** //
    // ** Asi que vuelvo a darle el valor verdadero que tiene que tener al principio              ** //
    // ********************************************************************************************* //
    public_When_Last_Permission := var_When_Last_Permission;

    // ********************************************************************************************* //
    // ** Nos cargamos lo necesario para el idioma de la aplicación                               ** //
    // ********************************************************************************************* //
    if ( Trim(var_CN_Conexion.Language) = '' )              or
       ( UpperCase(Trim(var_CN_Conexion.Language)) = 'ES' ) then
    begin
        UTI_GEN_Cambiar_Idioma('es');
    end;

    if UpperCase(Trim(var_CN_Conexion.Language)) = 'EN' then
    begin
        UTI_GEN_Cambiar_Idioma('en');
    end;

    if UpperCase(Trim(var_CN_Conexion.Language)) = 'RO' then
    begin
        UTI_GEN_Cambiar_Idioma('ro');
    end;

    if UpperCase(Trim(var_CN_Conexion.Language)) = 'FR' then
    begin
        UTI_GEN_Cambiar_Idioma('fr');
    end;

    // ********************************************************************************************* //
    // ** Desgraciadamente UTI_GEN_Cambiar_Idioma tiene una llamada a Que_Menus_Tiene_Permisos que** //
    // ** a su vez llama a UTI_USR_Permiso_SN y nos cambia el valor a public_When_Last_Permission.** //
    // ** Asi que vuelvo a darle el valor verdadero que tiene que tener al principio              ** //
    // ********************************************************************************************* //
    public_When_Last_Permission := var_When_Last_Permission;

    // ********************************************************************************************* //
    // ** Ponemos el temporizador a una milesima de segundo para que pregunte nada mas empezar por** //
    // ** la contraseña. Despues activamos el temporizador                                        ** //
    // ********************************************************************************************* //
    Timer_Sin_Usar.Interval := 100;
    Timer_Sin_Usar.Enabled  := true;
end;

procedure Tform_Menu.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
{
    if MessageDlg(rs_Texto_Salir, mtConfirmation, [mbOK, mbCancel],0) =mrCancel then
       begin
            CanClose := False;
       end
    else Salir;
}
end;

procedure Tform_Menu.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
    if public_Salir_OK = true then
    begin
        CloseAction := caFree;
        Timer_Sin_Usar.Enabled := false;
    end
    else CloseAction := TCloseAction.caNone;
end;

procedure Tform_Menu.MenuItem_FinClick(Sender: TObject);
begin
    UTI_GEN_Salir;
end;

procedure Tform_Menu.Timer_Sin_UsarTimer(Sender: TObject);
var var_Tiempo_Transcurrido    : TDateTime;
    var_Tiempo_Donde_Preguntar : TDateTime;
    var_Valor_Minuto           : TDateTime;
    var_CN_Conexion            : Trecord_CN_Conexion;
    var_Se_Sale                : Boolean;
    var_Now                    : TDateTime;
begin
    if UTI_GEN_Form_Abierto_Ya('form_AskByPwd') = true then
    begin
       // ****************************************************************************************** //
       // ** Si form_AskByPwd está abierto ya, pues no vuelve a abrirlo                           ** //
       // ****************************************************************************************** //
        Exit;
    end;

    // ********************************************************************************************* //
    // ** Traemos la configuración con el servidor, si no se puede pues no continuamos con la APP ** //
    // ********************************************************************************************* //
    var_CN_Conexion := UTI_INI_Configuracion_Traerla;
    if var_CN_Conexion.con_Exito = False then UTI_GEN_Salir;

    var_Valor_Minuto := StrToTime('00:02:00') - StrToTime('00:01:00');

    // ********************************************************************************************* //
    // ** Algún proceso ya empezó a controlar el tiempo                                           ** //
    // ********************************************************************************************* //
    var_Tiempo_Transcurrido := Now - public_When_Last_Permission;

  { var_Tiempo_Donde_Preguntar := (var_Valor_Minuto * StrToFloat(var_CN_Conexion.min_no_Work));
    if var_Tiempo_Transcurrido >= var_Tiempo_Donde_Preguntar then // Tiempo de espera ... 9 minutos }

    var_Now := Now;
    var_Tiempo_Donde_Preguntar := public_When_Last_Permission + (var_Valor_Minuto * StrToFloat(var_CN_Conexion.min_no_Work));
    if var_Now >= var_Tiempo_Donde_Preguntar then
    begin
        // ************************************************************************************* //
        // ** Si el programa lleva mucho tiempo sin usarse, controlará que es el momento de   ** //
        // ** volver a preguntar por la contraseña, pero sólo si es un superusuario o el      ** //
        // ** usuario tiene permisos totales. Porque si no el programa se cerrará.            ** //
        // ** Así evitaremos que usuarios mal intencionados usen el programa con la contraseña** //
        // ** de usuario de otros.                                                            ** //
        // ** Es necesario ver el tiempo de margen para volver a preguntar otra vez por la    ** //
        // ** contraseña.                                                                     ** //
        // ** Esto se configura en el fichero INI de la aplicación                            ** //
        // ************************************************************************************* //
        var_Se_Sale := True;
        if (public_User = 0) { Usuario = 0 es el superusuario }        or
           (UTI_USR_Permiso_SN_conPermisoTotal_SN(public_User) = True) then
        begin
            var_Se_Sale := False;
        end;

        if var_Se_Sale = True then
             UTI_GEN_Salir { Mucho tiempo sin usar el programa }
        else Preguntar_pwd;
    end;
end;

procedure Tform_Menu.Preguntar_pwd;
var var_ctdad_veces           : Integer;
    var_User                  : Integer;
    var_User_Descripcion_Nick : ShortString;
    var_User_Last_Empresa     : String;
    var_Se_Sale               : Boolean;
    var_la_pwd                : ShortInt;
    var_Ctdad_Intentos_Tope   : ShortInt;
begin
    // ********************************************************************************************* //
    // ** O es el superusuario o es un usuario con todos los permisos,  asi que pregunto por su   ** //
    // ** contraseña                                                                              ** //
    // ********************************************************************************************* //
    Timer_Sin_Usar.Enabled    := False;
    var_ctdad_veces           := 0;

    var_User                  := public_User;
    var_User_Descripcion_Nick := public_User_Descripcion_Nick;
    var_User_Last_Empresa     := public_User_Registro_Empresa_Elegida.id;

    var_Se_Sale               := True;
    var_Ctdad_Intentos_Tope   := 3;

    While var_ctdad_veces < var_Ctdad_Intentos_Tope do
    begin
        var_la_pwd := UTI_USR_AskByPwd( var_Ctdad_Intentos_Tope, var_ctdad_veces );

        // ***************************************************************************************** //
        // ** 0 = Pulsó salir de la aplicación,                                                   ** //
        // ** 1 = Contraseña correcta,                                                            ** //
        // ** 2 = Contraseña incorrecta                                                           ** //
        // ***************************************************************************************** //
        if var_la_pwd = 0 then
        begin
            // ************************************************************************************* //
            // ** Quiso salir de la aplicación                                                    ** //
            // ************************************************************************************* //
            Break;
        end;

        if var_la_pwd = 2 then
        begin
            // ************************************************************************************* //
            // ** Un intento de introducir la contraseña erroneo                                  ** //
            // ************************************************************************************* //
            var_ctdad_veces := var_ctdad_veces + 1;

            // ************************************************************************************* //
            // ** vuelvo a dejar el usuario que era                                               ** //
            // ************************************************************************************* //
            public_User                             := var_User;
            public_User_Descripcion_Nick            := var_User_Descripcion_Nick ;
            public_User_Registro_Empresa_Elegida.id := var_User_Last_Empresa;
        end;

        if var_la_pwd = 1 then
        begin
            // ************************************************************************************* //
            // ** La contraseña introducida corresponde a la de un usuario                        ** //
            // ************************************************************************************* //
            if Trim(var_User_Descripcion_Nick) <> '' then
            begin
                // ********************************************************************************* //
                // ** LA PRIMERA VEZ SE IDENTIFICO UN USUARIO, ASI QUE VAMOS A COMPROBAR QUE EL   ** //
                // ** QUE INTRODUJO LA CONTRASEÑA ES EL MISMO                                     ** //
                // ********************************************************************************* //
                if public_User = var_User then
                begin
                    // ***************************************************************************** //
                    // ** La contraseña introducida corresponde a la del user que inició la sesión** //
                    // ***************************************************************************** //
                    var_Se_Sale := False;
                    Break;
                end else begin
                    // ***************************************************************************** //
                    // ** No es el usuario que inició la sesión                                   ** //
                    // ***************************************************************************** //
                    var_ctdad_veces := var_ctdad_veces + 1;

                    // ***************************************************************************** //
                    // ** vuelvo a dejar el usuario que era                                       ** //
                    // ***************************************************************************** //
                    public_User                             := var_User;
                    public_User_Descripcion_Nick            := var_User_Descripcion_Nick ;
                    public_User_Registro_Empresa_Elegida.id := var_User_Last_Empresa;
                end;
            end else begin
                // ********************************************************************************* //
                // ** TODAVIA NO SE HABIA IDENTIFICADO NINGUN USUARIO ANTERIORMENTE               ** //
                // ********************************************************************************* //
                var_Se_Sale := False;
                Break;
            end;
        end;
    end;

    if var_Se_Sale = True then UTI_GEN_Salir;

    Configurar_APP;

    // ********************************************************************************************* //
    // ** PASAMOS A CONFIGURAR EL TEMPORIZADOR                                                    ** //
    // ********************************************************************************************* //
    Timer_Sin_Usar.Enabled  := false;
    Timer_Sin_Usar.Interval := 5000;
    Timer_Sin_Usar.Enabled  := true;

    public_When_Last_Permission := Now;
end;

procedure Tform_Menu.Configurar_APP;
var var_msg : TStrings;
begin
    if Traer_Configuracion_APP = false then
    begin
        var_msg := TStringList.Create;
        var_msg.Clear;
        var_msg.Add(rs_Configurar_APP_1);
        var_msg.Add(' ');
        var_msg.Add(rs_Configurar_APP_2 +
                    rs_Configurar_APP_3);
        UTI_GEN_Aviso(true, var_msg, rs_Configurar_APP_4, True, False);
        var_msg.Free;

        UTI_GEN_Salir;
    end;

    Que_Menus_Tiene_Permisos;

    Presentar_Titulo_form_Menu_Principal;
end;

procedure Tform_Menu.MenuItem_Cambiar_Idioma_EngishClick(Sender: TObject);
begin
    UTI_GEN_Cambiar_Idioma('en');
    UTI_INI_Grabar_Idioma( 'en' );
end;

procedure Tform_Menu.MenuItem_Cambiar_Idioma_FrenchClick(Sender: TObject);
begin
    UTI_GEN_Cambiar_Idioma('fr');
    UTI_INI_Grabar_Idioma( 'fr' );
end;

procedure Tform_Menu.MenuItem_Cambiar_Idioma_RomanianClick(Sender: TObject);
begin
    UTI_GEN_Cambiar_Idioma('ro');
    UTI_INI_Grabar_Idioma( 'ro' );
end;

procedure Tform_Menu.MenuItem_Cambiar_Idioma_SpanishClick(Sender: TObject);
begin
    UTI_GEN_Cambiar_Idioma('es');
    UTI_INI_Grabar_Idioma( 'es' );
end;

procedure Tform_Menu.Presentar_Titulo_form_Menu_Principal;
begin
    form_Menu.Caption := rs_Titulo_1 +
                         Trim(public_User_Descripcion_Nick);

    if Trim(public_User_Registro_Empresa_Elegida.id) <> '' then
    begin
        form_Menu.Caption := Trim(form_Menu.Caption) +
                             rs_Titulo_2 +
                             Trim(public_User_Registro_Empresa_Elegida.nombre_comercial);
    end;
end;

procedure Tform_Menu.MenuItem_Elegir_EmpresaClick(Sender: TObject);
begin
  Elegir_Empresa;
end;

function Tform_Menu.Traer_Empresas_xID( param_id : ShortString ) : TEmpresas;
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
        var_SQLQuery.Name     := 'SQLQuery_Traer_Empresas_xID';
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

procedure Tform_Menu.Elegir_Empresa;
var var_msg : TStrings;
begin
  if UTI_GEN_Form_Abierto_Ya('form_empresas_002') = false then
  begin
    Application.CreateForm(Tform_empresas_002, form_empresas_002);

    form_empresas_002.public_Solo_Ver    := true;
    form_empresas_002.public_Elegimos    := true;

    form_empresas_002.public_Menu_Worked := 250;

    form_empresas_002.para_Empezar;

    form_empresas_002.ShowModal;

    if form_empresas_002.public_Rgtro_Seleccionado = true then
    begin
      public_User_Registro_Empresa_Elegida := Traer_Empresas_xID( form_empresas_002.SQLQuery_Empresas.FieldByName('id').AsString );
      Presentar_Titulo_form_Menu_Principal;
    end;

    form_empresas_002.Free;
  end else begin
    var_msg := TStringList.Create;
    var_msg.Add(rs_Modulo_Abierto );
    UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
    var_msg.Free;
    Exit;
  end;
end;

procedure Tform_Menu.Que_Menus_Tiene_Permisos;
begin
    // ********************************************************************************************* //
    // ** Ahora dejaremos visibles aquellos menus a los que el usuario tenga permiso              ** //
    // ********************************************************************************************* //
    ProgressBar_Permisos_Menus.Max      := 47;
    ProgressBar_Permisos_Menus.Position := 0;
    Panel_Permisos_Menus.Visible        := true;

    // ********************************************************************************************* //
    // ** DEL MENU PRINCIPAL ... INICIO                                                           ** //
    // ********************************************************************************************* //
    MenuItem_Configuracion_con_Submenu.Visible := UTI_USR_Permiso_SN( 460, '', false);
    ProgressBar_Permisos_Menus.Position        := ProgressBar_Permisos_Menus.Position + 1;

    MenuItem_Usuarios.Visible                  := UTI_USR_Permiso_SN( 30, '', false);
    ProgressBar_Permisos_Menus.Position        := ProgressBar_Permisos_Menus.Position + 1;

    MenuItem_Usuarios.Visible                  := UTI_USR_Permiso_SN( 30, '', false);
    ProgressBar_Permisos_Menus.Position        := ProgressBar_Permisos_Menus.Position + 1;

    if Form_Menu.public_User = 0 then
    begin
        MenuItem_Menus.Visible      := true;
        MenuItem_Utilidades.Visible := true;
        MenuItem_Informes.Visible   := true;
    end else begin
        MenuItem_Menus.Visible      := false;
        MenuItem_Utilidades.Visible := false;
        MenuItem_Informes.Visible   := false;
    end;

    ProgressBar_Permisos_Menus.Position := ProgressBar_Permisos_Menus.Position + 1;

    if (MenuItem_Menus.Visible = true)                      or
       (MenuItem_Usuarios.Visible = true)                   or
       (MenuItem_Configuracion_con_Submenu.Visible = true)  or
       (MenuItem_Elegir_Empresa.Visible = true)             or
       (MenuItem_Utilidades.Visible = true)                 or
       (MenuItem_Fin.Visible = true)                        then
    begin
       MenuItem_Inicio_con_Submenu.Visible := true;
    end else begin
       MenuItem_Inicio_con_Submenu.Visible := false;
    end;

    // ********************************************************************************************* //
    // ** DEL MENU PRINCIPAL ... MAESTROS                                                         ** //
    // ********************************************************************************************* //
    MenuItem_Empresas.Visible           := UTI_USR_Permiso_SN(250, '', false);
    ProgressBar_Permisos_Menus.Position := ProgressBar_Permisos_Menus.Position + 1;

    MenuItem_Bancos_Empresas.Visible    := UTI_USR_Permiso_SN(310, '', false);
    ProgressBar_Permisos_Menus.Position := ProgressBar_Permisos_Menus.Position + 1;

    MenuItem_Representantes.Visible     := UTI_USR_Permiso_SN(130, '', false);
    ProgressBar_Permisos_Menus.Position := ProgressBar_Permisos_Menus.Position + 1;

    // ********************************************************************************************* //
    // ** DEL MENU PRINCIPAL ... MAESTROS/Almacenes-cocheras-garajes                              ** //
    // ********************************************************************************************* //
    MenuItem_Almacenes.Visible             := UTI_USR_Permiso_SN(260, '', false);
    ProgressBar_Permisos_Menus.Position    := ProgressBar_Permisos_Menus.Position + 1;

    MenuItem_Almacenes_Movimientos.Visible := UTI_USR_Permiso_SN(320, '', false);
    ProgressBar_Permisos_Menus.Position    := ProgressBar_Permisos_Menus.Position + 1;

    if (MenuItem_Almacenes.Visible = true)             or
       (MenuItem_Almacenes_Movimientos.Visible = true) then
    begin
        MenuItem_Almacenes_con_Submenu.Visible := true;
    end else begin
        MenuItem_Almacenes_con_Submenu.Visible := false;
    end;

    // ********************************************************************************************* //
    // ** DEL MENU PRINCIPAL ... MAESTROS/Películas                                               ** //
    // ********************************************************************************************* //
    if Form_Menu.public_User = 0 then
    begin
        MenuItem_Medios.Visible    := true;
        MenuItem_Peliculas.Visible := true;
    end else begin
        MenuItem_Medios.Visible    := false;
        MenuItem_Peliculas.Visible := false;
    end;

    if (MenuItem_Medios.Visible = true)    or
       (MenuItem_Peliculas.Visible = true) then
    begin
        MenuItem_Peliculas_con_Submenu.Visible := true;
    end else begin
        MenuItem_Peliculas_con_Submenu.Visible := false;
    end;

    // ********************************************************************************************* //
    // ** DEL MENU PRINCIPAL ... MAESTROS/Clientes                                                ** //
    // ********************************************************************************************* //
    MenuItem_Clientes_Tipos.Visible     := UTI_USR_Permiso_SN( 70, '', false);
    ProgressBar_Permisos_Menus.Position := ProgressBar_Permisos_Menus.Position + 1;

    MenuItem_Clientes.Visible           := UTI_USR_Permiso_SN( 50, '', false);
    ProgressBar_Permisos_Menus.Position := ProgressBar_Permisos_Menus.Position + 1;

    if (MenuItem_Clientes_Tipos.Visible = true) or
       (MenuItem_Clientes.Visible = true)       then
    begin
        MenuItem_Clientes_con_Submenu.Visible := true;
    end else begin
        MenuItem_Clientes_con_Submenu.Visible := false;
    end;

    // ********************************************************************************************* //
    // ** DEL MENU PRINCIPAL ... MAESTROS/Proveedores, acreedores                                 ** //
    // ********************************************************************************************* //
    MenuItem_Proveedores_Tipos.Visible  := UTI_USR_Permiso_SN(140, '', false);
    ProgressBar_Permisos_Menus.Position := ProgressBar_Permisos_Menus.Position + 1;

    MenuItem_Proveedores.Visible        := UTI_USR_Permiso_SN(120, '', false);
    ProgressBar_Permisos_Menus.Position := ProgressBar_Permisos_Menus.Position + 1;

    if (MenuItem_Proveedores_Tipos.Visible = true) or
       (MenuItem_Proveedores.Visible = true)       then
    begin
        MenuItem_Proveedores_con_Submenu.Visible := true;
    end else begin
        MenuItem_Proveedores_con_Submenu.Visible := false;
    end;

    // ********************************************************************************************* //
    // ** DEL MENU PRINCIPAL ... MAESTROS/Artículos, servicios o cuotas                           ** //
    // ********************************************************************************************* //
    MenuItem_Familias_Articulos.Visible := UTI_USR_Permiso_SN(150, '', false);
    ProgressBar_Permisos_Menus.Position := ProgressBar_Permisos_Menus.Position + 1;

    MenuItem_Articulos_Ofertas.Visible  := UTI_USR_Permiso_SN(300, '', false);
    ProgressBar_Permisos_Menus.Position := ProgressBar_Permisos_Menus.Position + 1;

    MenuItem_Articulos.Visible          := UTI_USR_Permiso_SN(170, '', false);
    ProgressBar_Permisos_Menus.Position := ProgressBar_Permisos_Menus.Position + 1;

    if (MenuItem_Familias_Articulos.Visible = true) or
       (MenuItem_Articulos_Ofertas.Visible = true)  or
       (MenuItem_Articulos.Visible = true)          then
    begin
        MenuItem_Articulos_con_Submenu.Visible := true;
    end else begin
        MenuItem_Articulos_con_Submenu.Visible := false;
    end;

    // ********************************************************************************************* //
    // ** DEL MENU PRINCIPAL ... MAESTROS/Personal                                                ** //
    // ********************************************************************************************* //
    MenuItem_Familias_Personal.Visible        := UTI_USR_Permiso_SN(210, '', false);
    ProgressBar_Permisos_Menus.Position       := ProgressBar_Permisos_Menus.Position + 1;

    MenuItem_Personal.Visible                 := UTI_USR_Permiso_SN(220, '', false);
    ProgressBar_Permisos_Menus.Position       := ProgressBar_Permisos_Menus.Position + 1;

    MenuItem_Personal_Contratos_Tipos.Visible := UTI_USR_Permiso_SN(230, '', false);
    ProgressBar_Permisos_Menus.Position       := ProgressBar_Permisos_Menus.Position + 1;

    MenuItem_Personal_Contratos.Visible       := UTI_USR_Permiso_SN(240, '', false);
    ProgressBar_Permisos_Menus.Position       := ProgressBar_Permisos_Menus.Position + 1;

    if (MenuItem_Familias_Personal.Visible = true)        or
       (MenuItem_Personal.Visible = true)                 or
       (MenuItem_Personal_Contratos_Tipos.Visible = true) or
       (MenuItem_Personal_Contratos.Visible = true)       then
    begin
        MenuItem_Personal_con_Submenu.Visible := true;
    end else begin
        MenuItem_Personal_con_Submenu.Visible := false;
    end;

    // ********************************************************************************************* //
    // ** DEL MENU PRINCIPAL ... MAESTROS/Vehículos                                               ** //
    // ********************************************************************************************* //
    MenuItem_Vehiculos_Tipos.Visible         := UTI_USR_Permiso_SN(360, '', false);
    ProgressBar_Permisos_Menus.Position      := ProgressBar_Permisos_Menus.Position + 1;

    MenuItem_Vehiculos_Marcas.Visible        := UTI_USR_Permiso_SN(370, '', false);
    ProgressBar_Permisos_Menus.Position      := ProgressBar_Permisos_Menus.Position + 1;

    MenuItem_Vehiculos_Tipo_Cambios.Visible  := UTI_USR_Permiso_SN(390, '', false);
    ProgressBar_Permisos_Menus.Position      := ProgressBar_Permisos_Menus.Position + 1;

    MenuItem_Vehiculos_Tipo_Ruedas.Visible   := UTI_USR_Permiso_SN(400, '', false);
    ProgressBar_Permisos_Menus.Position      := ProgressBar_Permisos_Menus.Position + 1;

    MenuItem_Vehiculos_Equipamientos.Visible := UTI_USR_Permiso_SN(420, '', false);
    ProgressBar_Permisos_Menus.Position      := ProgressBar_Permisos_Menus.Position + 1;

    MenuItem_Vehiculos.Visible               := UTI_USR_Permiso_SN(350, '', false);
    ProgressBar_Permisos_Menus.Position      := ProgressBar_Permisos_Menus.Position + 1;

    if (MenuItem_Vehiculos_Tipos.Visible = true)         or
       (MenuItem_Vehiculos_Marcas.Visible = true)        or
       (MenuItem_Vehiculos_Tipo_Cambios.Visible = true)  or
       (MenuItem_Vehiculos_Tipo_Ruedas.Visible = true)   or
       (MenuItem_Vehiculos_Equipamientos.Visible = true) or
       (MenuItem_Vehiculos.Visible = true)               then
    begin
        MenuItem_Vehiculos_con_Submenu.Visible := true;
    end else begin
        MenuItem_Vehiculos_con_Submenu.Visible := false;
    end;



    // ********************************************************************************************* //
    // ** DEL MENU PRINCIPAL ... MAESTROS/Visitas                                               ** //
    // ********************************************************************************************* //
    MenuItem_Visitas_Tipos.Visible      := UTI_USR_Permiso_SN(470, '', false);
    ProgressBar_Permisos_Menus.Position := ProgressBar_Permisos_Menus.Position + 1;

    MenuItem_Visitas_Resultados.Visible := UTI_USR_Permiso_SN(480, '', false);
    ProgressBar_Permisos_Menus.Position := ProgressBar_Permisos_Menus.Position + 1;

    MenuItem_Visitas.Visible            := UTI_USR_Permiso_SN(490, '', false);
    ProgressBar_Permisos_Menus.Position := ProgressBar_Permisos_Menus.Position + 1;

        // ***************************************************************************************** //
        // ** DEL MENU PRINCIPAL ... MAESTROS/Visitas/Explotacion                                 ** //
        // ***************************************************************************************** //
        MenuItem_Visitas_Explotacion_Rutas.Visible          := UTI_USR_Permiso_SN(520, '', false);
        ProgressBar_Permisos_Menus.Position                 := ProgressBar_Permisos_Menus.Position + 1;

        MenuItem_Visitas_Explotacion_Provincias.Visible     := UTI_USR_Permiso_SN(530, '', false);
        ProgressBar_Permisos_Menus.Position                 := ProgressBar_Permisos_Menus.Position + 1;

        MenuItem_Visitas_Explotacion_Clientes.Visible       := UTI_USR_Permiso_SN(540, '', false);
        ProgressBar_Permisos_Menus.Position                 := ProgressBar_Permisos_Menus.Position + 1;

        MenuItem_Visitas_Explotacion_Tipo_Clientes.Visible  := UTI_USR_Permiso_SN(550, '', false);
        ProgressBar_Permisos_Menus.Position                 := ProgressBar_Permisos_Menus.Position + 1;

        MenuItem_Visitas_Explotacion_Actividades.Visible    := UTI_USR_Permiso_SN(560, '', false);
        ProgressBar_Permisos_Menus.Position                 := ProgressBar_Permisos_Menus.Position + 1;

        MenuItem_Visitas_Explotacion_Representantes.Visible := UTI_USR_Permiso_SN(570, '', false);
        ProgressBar_Permisos_Menus.Position                 := ProgressBar_Permisos_Menus.Position + 1;

        if (MenuItem_Visitas_Explotacion_Rutas.Visible = true)          or
           (MenuItem_Visitas_Explotacion_Tipo_Clientes.Visible = true)  or
           (MenuItem_Visitas_Explotacion_Clientes.Visible = true)       or
           (MenuItem_Visitas_Explotacion_Actividades.Visible = true)    or
           (MenuItem_Visitas_Explotacion_Representantes.Visible = true) or
           (MenuItem_Visitas_Explotacion_Provincias.Visible = true)     then
        begin
            MenuItem_Visitas_Explotacion_con_Submenu.Visible := true;
        end else begin
            MenuItem_Visitas_Explotacion_con_Submenu.Visible := false;
        end;

        // ***************************************************************************************** //
        // ** DEL MENU PRINCIPAL ... MAESTROS/Visitas/Planificacion                               ** //
        // ***************************************************************************************** //
        MenuItem_Visitas_Planificacion_Rutas.Visible      := UTI_USR_Permiso_SN(580, '', false);
        ProgressBar_Permisos_Menus.Position               := ProgressBar_Permisos_Menus.Position + 1;

        MenuItem_Visitas_Planificacion_Provincias.Visible := UTI_USR_Permiso_SN(590, '', false);
        ProgressBar_Permisos_Menus.Position               := ProgressBar_Permisos_Menus.Position + 1;

        if (MenuItem_Visitas_Planificacion_Rutas.Visible = true)      or
           (MenuItem_Visitas_Planificacion_Provincias.Visible = true) then
        begin
            MenuItem_Visitas_Planificacion_con_Submenu.Visible := true;
        end else begin
            MenuItem_Visitas_Planificacion_con_Submenu.Visible := false;
        end;

    // ********************************************************************************************* //
    // ** DEL MENU PRINCIPAL ... continuamos con MAESTROS/Visitas                                 ** //
    // ********************************************************************************************* //
    if (MenuItem_Visitas_Tipos.Visible = true)                     or
       (MenuItem_Visitas.Visible = true)                           or
       (MenuItem_Visitas_Explotacion_con_Submenu.Visible = true)   or
       (MenuItem_Visitas_Planificacion_con_Submenu.Visible = true) or
       (MenuItem_Visitas_Resultados.Visible = true)                then
    begin
        MenuItem_Visitas_con_Submenu.Visible := true;
    end else begin
        MenuItem_Visitas_con_Submenu.Visible := false;
    end;

    // ********************************************************************************************* //
    // ** DEL MENU PRINCIPAL ... MAESTROS                                                         ** //
    // ********************************************************************************************* //
    if (MenuItem_Empresas.Visible = true)                or
       (MenuItem_Bancos_Empresas.Visible = true)         or
       (MenuItem_Representantes.Visible = true)          or
       (MenuItem_Almacenes_con_Submenu.Visible = true)   or
       (MenuItem_Peliculas_con_Submenu.Visible = true)   or
       (MenuItem_Clientes_con_Submenu.Visible = true)    or
       (MenuItem_Proveedores_con_Submenu.Visible = true) or
       (MenuItem_Articulos_con_Submenu.Visible = true)   or
       (MenuItem_Personal_con_Submenu.Visible = true)    or
       (MenuItem_Visitas_con_Submenu.Visible = true)     or
       (MenuItem_Vehiculos_con_Submenu.Visible = true)   then
    begin
        MenuItem_Maestros_con_Submenu.Visible := true;
    end else begin
        MenuItem_Maestros_con_Submenu.Visible := false;
    end;

    // ********************************************************************************************* //
    // ** DEL MENU PRINCIPAL ... AUXILIARES                                                       ** //
    // ********************************************************************************************* //
    MenuItem_Poblaciones.Visible                := UTI_USR_Permiso_SN(110, '', false);
    ProgressBar_Permisos_Menus.Position         := ProgressBar_Permisos_Menus.Position + 1;

    MenuItem_Actividades.Visible                := UTI_USR_Permiso_SN(500, '', false);
    ProgressBar_Permisos_Menus.Position         := ProgressBar_Permisos_Menus.Position + 1;

    MenuItem_Rutas.Visible                      := UTI_USR_Permiso_SN(510, '', false);
    ProgressBar_Permisos_Menus.Position         := ProgressBar_Permisos_Menus.Position + 1;

    MenuItem_Provincias.Visible                 := UTI_USR_Permiso_SN(100, '', false);
    ProgressBar_Permisos_Menus.Position         := ProgressBar_Permisos_Menus.Position + 1;

    MenuItem_Paises.Visible                     := UTI_USR_Permiso_SN( 60, '', false);
    ProgressBar_Permisos_Menus.Position         := ProgressBar_Permisos_Menus.Position + 1;

    // ********************************************************************************************* //
    MenuItem_Tarifas_con_Submenu.Visible        := UTI_USR_Permiso_SN( 90, '', false);
    ProgressBar_Permisos_Menus.Position         := ProgressBar_Permisos_Menus.Position + 1;
    // ********************************************************************************************* //
    // ** DEL MENU PRINCIPAL ... AUXILIARES/Tarjetas                                              ** //
    // ********************************************************************************************* //
    MenuItem_Tarifas.Visible                    := UTI_USR_Permiso_SN( 90, '', false);
    ProgressBar_Permisos_Menus.Position         := ProgressBar_Permisos_Menus.Position + 1;

    MenuItem_Margenes_Tarifas.Visible           := UTI_USR_Permiso_SN( 610, '', false);
    ProgressBar_Permisos_Menus.Position         := ProgressBar_Permisos_Menus.Position + 1;

    if (MenuItem_Tarifas.Visible = true)          or
       (MenuItem_Margenes_Tarifas.Visible = true) then
    begin
        MenuItem_Tarifas_con_Submenu.Visible := true;
    end else begin
        MenuItem_Tarifas_con_Submenu.Visible := false;
    end;

    MenuItem_Terminales.Visible                 := UTI_USR_Permiso_SN(160, '', false);
    ProgressBar_Permisos_Menus.Position         := ProgressBar_Permisos_Menus.Position + 1;

    MenuItem_Combustibles.Visible               := UTI_USR_Permiso_SN(380, '', false);
    ProgressBar_Permisos_Menus.Position         := ProgressBar_Permisos_Menus.Position + 1;

    if UpperCase(Trim(form_menu.public_User_Configuracion.Trabajar_Grupos_Cocina_SN)) = 'S' then
    begin
        MenuItem_Grupos_Cocina.Visible := UTI_USR_Permiso_SN(180, '', false);
    end else begin
        MenuItem_Grupos_Cocina.Visible := false;
    end;
    ProgressBar_Permisos_Menus.Position         := ProgressBar_Permisos_Menus.Position + 1;

    MenuItem_Impresoras.Visible                 := UTI_USR_Permiso_SN(190, '', false);
    ProgressBar_Permisos_Menus.Position         := ProgressBar_Permisos_Menus.Position + 1;

    MenuItem_Gastos_Tipos.Visible               := UTI_USR_Permiso_SN(270, '', false);
    ProgressBar_Permisos_Menus.Position         := ProgressBar_Permisos_Menus.Position + 1;

    MenuItem_Impuestos.Visible                  := UTI_USR_Permiso_SN(200, '', false);
    ProgressBar_Permisos_Menus.Position         := ProgressBar_Permisos_Menus.Position + 1;

    MenuItem_Formas_Pago.Visible                := UTI_USR_Permiso_SN( 80, '', false);
    ProgressBar_Permisos_Menus.Position         := ProgressBar_Permisos_Menus.Position + 1;

    MenuItem_Cuentas_Pagos_Cobros.Visible       := UTI_USR_Permiso_SN(280, '', false);
    ProgressBar_Permisos_Menus.Position         := ProgressBar_Permisos_Menus.Position + 1;

    MenuItem_Conceptos_Almacen_Traspaso.Visible := UTI_USR_Permiso_SN(290, '', false);
    ProgressBar_Permisos_Menus.Position         := ProgressBar_Permisos_Menus.Position + 1;

    // ********************************************************************************************* //
    // ** DEL MENU PRINCIPAL ... AUXILIARES/Tarjetas                                              ** //
    // ********************************************************************************************* //
    MenuItem_Tarjetas_Transporte.Visible := UTI_USR_Permiso_SN(410, '', false);
    ProgressBar_Permisos_Menus.Position  := ProgressBar_Permisos_Menus.Position + 1;

    if MenuItem_Tarjetas_Transporte.Visible = true then
    begin
        MenuItem_Tarjetas_con_Submenu.Visible := true;
    end else begin
        MenuItem_Tarjetas_con_Submenu.Visible := false;
    end;

    // ********************************************************************************************* //
    // ** DEL MENU PRINCIPAL ... AUXILIARES                                                       ** //
    // ********************************************************************************************* //
    if (MenuItem_Poblaciones.Visible = true)                or
       (MenuItem_Provincias.Visible = true)                 or
       (MenuItem_Actividades.Visible = true)                or
       (MenuItem_Rutas.Visible = true)                      or
       (MenuItem_Paises.Visible = true)                     or
       (MenuItem_Tarifas_con_Submenu.Visible = true)        or
       (MenuItem_Terminales.Visible = true)                 or
       (MenuItem_Combustibles.Visible = true)               or
       (MenuItem_Grupos_Cocina.Visible = true)              or
       (MenuItem_Impresoras.Visible = true)                 or
       (MenuItem_Gastos_Tipos.Visible = true)               or
       (MenuItem_Impuestos.Visible = true)                  or
       (MenuItem_Formas_Pago.Visible = true)                or
       (MenuItem_Cuentas_Pagos_Cobros.Visible = true)       or
       (MenuItem_Conceptos_Almacen_Traspaso.Visible = true) or
       (MenuItem_Tarjetas_con_Submenu.Visible = true)       then
    begin
        MenuItem_Auxiliares_con_Submenu.Visible := true;
    end else begin
        MenuItem_Auxiliares_con_Submenu.Visible := false;
    end;

    // ********************************************************************************************* //
    // ** DEL MENU PRINCIPAL ... VENTAS                                                           ** //
    // ********************************************************************************************* //
    MenuItem_Albaranes_Ventas.Visible := UTI_USR_Permiso_SN( 430, '', false);
    ProgressBar_Permisos_Menus.Position := ProgressBar_Permisos_Menus.Position + 1;

    MenuItem_Presupuestos_Ventas.Visible := UTI_USR_Permiso_SN( 440, '', false);
    ProgressBar_Permisos_Menus.Position := ProgressBar_Permisos_Menus.Position + 1;

    MenuItem_Pedidos_Ventas.Visible := UTI_USR_Permiso_SN( 450, '', false);
    ProgressBar_Permisos_Menus.Position := ProgressBar_Permisos_Menus.Position + 1;

        // ***************************************************************************************** //
        // ** DEL MENU PRINCIPAL ... VENTAS/Facturas                                              ** //
        // ***************************************************************************************** //
        MenuItem_Facturas_Ventas.Visible        := UTI_USR_Permiso_SN(600, '', false);
        ProgressBar_Permisos_Menus.Position     := ProgressBar_Permisos_Menus.Position + 1;

        MenuItem_Facturas_Ventas_Cerrar.Visible := UTI_USR_Permiso_SN(670, '', false);
        ProgressBar_Permisos_Menus.Position     := ProgressBar_Permisos_Menus.Position + 1;

        if (MenuItem_Facturas_Ventas.Visible = true)        or
           (MenuItem_Facturas_Ventas_Cerrar.Visible = true) then
        begin
            MenuItem_Facturas_Ventas_con_Submenu.Visible := true;
        end else begin
            MenuItem_Facturas_Ventas_con_Submenu.Visible := false;
        end;

        MenuItem_Ver_Ultimas_Ventas.Visible := UTI_USR_Permiso_SN(690, '', false);
        ProgressBar_Permisos_Menus.Position := ProgressBar_Permisos_Menus.Position + 1;


    if (MenuItem_Albaranes_Ventas.Visible = true)            or
       (MenuItem_Pedidos_Ventas.Visible = true)              or
       (MenuItem_Facturas_Ventas_con_Submenu.Visible = true) or
       (MenuItem_Presupuestos_Ventas.Visible = true)         or
       (MenuItem_Ver_Ultimas_Ventas.Visible = true)          then
    begin
        MenuItem_Ventas_con_Submenu.Visible := true;
    end else begin
        MenuItem_Ventas_con_Submenu.Visible := false;
    end;

    // ********************************************************************************************* //
    // ** DEL MENU PRINCIPAL ... COMPRAS                                                          ** //
    // ********************************************************************************************* //
    MenuItem_Presupuestos_Compras.Visible := UTI_USR_Permiso_SN( 620, '', false);
    ProgressBar_Permisos_Menus.Position := ProgressBar_Permisos_Menus.Position + 1;

    MenuItem_Pedidos_Compras.Visible := UTI_USR_Permiso_SN( 630, '', false);
    ProgressBar_Permisos_Menus.Position := ProgressBar_Permisos_Menus.Position + 1;

    MenuItem_Albaranes_Compras.Visible := UTI_USR_Permiso_SN( 640, '', false);
    ProgressBar_Permisos_Menus.Position := ProgressBar_Permisos_Menus.Position + 1;

        // ***************************************************************************************** //
        // ** DEL MENU PRINCIPAL ... COMPRAS/Facturas                                             ** //
        // ***************************************************************************************** //
        MenuItem_Facturas_Compras.Visible        := UTI_USR_Permiso_SN(650, '', false);
        ProgressBar_Permisos_Menus.Position      := ProgressBar_Permisos_Menus.Position + 1;

        MenuItem_Facturas_Compras_Cerrar.Visible := UTI_USR_Permiso_SN(680, '', false);
        ProgressBar_Permisos_Menus.Position      := ProgressBar_Permisos_Menus.Position + 1;

        if (MenuItem_Facturas_Compras.Visible = true)        or
           (MenuItem_Facturas_Compras_Cerrar.Visible = true) then
        begin
            MenuItem_Facturas_Compras_con_Submenu.Visible := true;
        end else begin
            MenuItem_Facturas_Compras_con_Submenu.Visible := false;
        end;

        MenuItem_Ver_Ultimas_Compras.Visible := UTI_USR_Permiso_SN(690, '', false);
        ProgressBar_Permisos_Menus.Position  := ProgressBar_Permisos_Menus.Position + 1;

    if (MenuItem_Presupuestos_Compras.Visible = true)         or
       (MenuItem_Pedidos_Compras.Visible = true)              or
       (MenuItem_Albaranes_Compras.Visible = true)            or
       (MenuItem_Facturas_Compras_con_Submenu.Visible = true) or
       (MenuItem_Ver_Ultimas_Compras.Visible = true)          then
    begin
        MenuItem_Compras_con_Submenu.Visible := true;
    end else begin
        MenuItem_Compras_con_Submenu.Visible := false;
    end;

    // ********************************************************************************************* //
    // ** DEL MENU PRINCIPAL ... PROFESORADO                                                      ** //
    // ********************************************************************************************* //
  { if UpperCase(Trim(form_menu.public_User_Configuracion.Modulo_Profesorado_Activo_SN)) = 'S' then
    begin
        if (MenuItem_Alumnos.Visible = true) or
           (MenuItem_Recibos.Visible = true) then
        begin
            MenuItem_Profesorado_con_Submenu.Visible := true;
        end else begin
            MenuItem_Profesorado_con_Submenu.Visible := false;
        end;
    end else begin
        MenuItem_Profesorado_con_Submenu.Visible := false;
        ProgressBar_Permisos_Menus.Position := ProgressBar_Permisos_Menus.Position + 2;
    end; }

    // ********************************************************************************************* //
    // ** Ahora dejaremos invisibles el panel de progreso                                         ** //
    // ********************************************************************************************* //
    Panel_Permisos_Menus.Visible := false;
end;

function Tform_Menu.Traer_Configuracion_APP_xID( param_id : ShortString ) : TConfiguracion;
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
        var_SQLQuery.Name     := 'SQLQuery_Traer_Configuracion_APP_xID';
        var_SQLQuery.Database := var_SQLConnector;

        { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
          y que por lo se debe de permitir modificarlos en ningún módulo }

        var_SQLQuery.SQL.Clear;
        var_SQLQuery.SQL.AddStrings( 'SELECT conf.*' + ' ' +
                                     'FROM configuracion AS conf' + ' ' );

        // ***************************************************************************************** //
        // ** Continuamos con la confección de la SQL                                             ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add( 'WHERE conf.id = ' + Trim(param_id) );
        var_SQLQuery.SQL.Add( 'ORDER BY conf.id ASC' );

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
                 Result.id                                                    := FieldByName('id').AsString;
                 Result.descripcion                                           := FieldByName('descripcion').AsString;
                 Result.Guardar_Cambios_de_Registros_SN                       := FieldByName('Guardar_Cambios_de_Registros_SN').AsString;
                 Result.Trabajar_Grupos_Cocina_SN                             := FieldByName('Trabajar_Grupos_Cocina_SN').AsString;
                 Result.Trabajar_Albaranes_con_Vehiculos_SN                   := FieldByName('Trabajar_Albaranes_con_Vehiculos_SN').AsString;
                 Result.Tipo_Clientes_Obligar_Cuenta_Contable_SN              := FieldByName('Tipo_Clientes_Obligar_Cuenta_Contable_SN').AsString;
                 Result.Clientes_Obligar_NIF_SN                               := FieldByName('Clientes_Obligar_NIF_SN').AsString;
                 Result.Clientes_Obligar_Cuenta_Contable_SN                   := FieldByName('Clientes_Obligar_Cuenta_Contable_SN').AsString;
                 Result.Representantes_Obligar_NIF_SN                         := FieldByName('Representantes_Obligar_NIF_SN').AsString;
                 Result.Representantes_Obligar_Cuenta_Contable_SN             := FieldByName('Representantes_Obligar_Cuenta_Contable_SN').AsString;
                 Result.Tipo_Proveedores_Obligar_Cuenta_Contable_SN           := FieldByName('Tipo_Proveedores_Obligar_Cuenta_Contable_SN').AsString;
                 Result.Proveedores_Obligar_NIF_SN                            := FieldByName('Proveedores_Obligar_NIF_SN').AsString;
                 Result.Proveedores_Obligar_Cuenta_Contable_SN                := FieldByName('Proveedores_Obligar_Cuenta_Contable_SN').AsString;
                 Result.Articulos_Familias_Ventas_Obligar_Cuenta_Contable_SN  := FieldByName('Articulos_Familias_Ventas_Obligar_Cuenta_Contable_SN').AsString;
                 Result.Articulos_Familias_Compras_Obligar_Cuenta_Contable_SN := FieldByName('Articulos_Familias_Compras_Obligar_Cuenta_Contable_SN').AsString;
                 Result.Articulos_Ventas_Obligar_Cuenta_Contable_SN           := FieldByName('Articulos_Ventas_Obligar_Cuenta_Contable_SN').AsString;
                 Result.Articulos_Compras_Obligar_Cuenta_Contable_SN          := FieldByName('Articulos_Compras_Obligar_Cuenta_Contable_SN').AsString;
                 Result.Impuestos_Obligar_Cuenta_Contable_SN                  := FieldByName('Impuestos_Obligar_Cuenta_Contable_SN').AsString;
                 Result.Personal_Familias_Obligar_Cuenta_Contable_SN          := FieldByName('Personal_Familias_Obligar_Cuenta_Contable_SN').AsString;
                 Result.Personal_Obligar_Cuenta_Contable_SN                   := FieldByName('Personal_Obligar_Cuenta_Contable_SN').AsString;
                 Result.Personal_Obligar_NIF_SN                               := FieldByName('Personal_Obligar_NIF_SN').AsString;
                 Result.Ctas_pagos_cobros_Obligar_Cuenta_Contable_SN          := FieldByName('Ctas_pagos_cobros_Obligar_Cuenta_Contable_SN').AsString;
                 Result.Modulo_Profesorado_Activo_SN                          := FieldByName('Modulo_Profesorado_Activo_SN').AsString;
                 Result.Bancos_Cuenta_Contable_SN                             := FieldByName('Bancos_Cuenta_Contable_SN').AsString;
                 Result.Clientes_Obligar_Tipo_Cliente_SN                      := FieldByName('Clientes_Obligar_Tipo_Cliente_SN').AsString;
                 Result.Clientes_Obligar_Ruta_SN                              := FieldByName('Clientes_Obligar_Ruta_SN').AsString;
                 Result.Clientes_Obligar_Actividad_SN                         := FieldByName('Clientes_Obligar_Actividad_SN').AsString;
                 Result.Clientes_Obligar_FormaPago_SN                         := FieldByName('Clientes_Obligar_FormaPago_SN').AsString;
                 Result.Clientes_Obligar_Tarifa_SN                            := FieldByName('Clientes_Obligar_Tarifa_SN').AsString;
                 Result.Albaranes_Obligar_Almacen_SN                          := FieldByName('Albaranes_Obligar_Almacen_SN').AsString;
                 Result.Facturas_Permitir_Borrar_SN                           := FieldByName('Facturas_Permitir_Borrar_SN').AsString;

                 Result.Insert_WHEN                                           := FieldByName('Insert_WHEN').AsString;
                 Result.Insert_Id_User                                        := FieldByName('Insert_Id_User').AsString;
                 Result.Del_WHEN                                              := FieldByName('Del_WHEN').AsString;
                 Result.Del_Id_User                                           := FieldByName('Del_Id_User').AsString;
                 Result.Del_WHY                                               := FieldByName('Del_WHY').AsString;
                 Result.Change_WHEN                                           := FieldByName('Change_WHEN').AsString;
                 Result.Change_Id_User                                        := FieldByName('Change_Id_User').AsString;
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
            UTI_GEN_Error_Log( 'Ocurrió un error al intentar traer todos los datos de configuración de esta aplicación. La tabla ha sido ' +
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

procedure Tform_Menu.para_sustituir_actionListOnExecute(Sender: TObject);
begin
  // no hace nada, solo es para poder poder activar los actionList
end;

procedure Tform_Menu.MenuItem_ClientesClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_Clientes( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Clientes_TiposClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_Clientes_tipos( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_ActividadesClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_Actividades( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_InformesClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_Reportes( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Maestros_Servicios_RegularesClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_ServiciosRegulares( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Servicios_TiposClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_ServiciosTipos( false, false, '1' );
end;

procedure Tform_Menu.MenuItem27Click(Sender: TObject);
begin
  UTI_Abrir_Modulo_ServiciosSeries( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Facturas_ComprasClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_FacturasCompras( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Facturas_VentasClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_FacturasVentas( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Albaranes_ComprasClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_AlbaranesCompras( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Facturas_Ventas_CerrarClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_FacturasVentas_Cerrar( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Facturas_Compras_CerrarClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_FacturasCompras_Cerrar( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Ver_Ultimas_ComprasClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_UltimasVentas( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Margenes_TarifasClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_MargenesIncrementoTarifas( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Pedidos_ComprasClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_PedidosCompras( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Presupuestos_ComprasClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_PresupuestosCompras( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_TarifasClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_Tarifas( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_UtilidadesClick(Sender: TObject);
begin
  { UTILIDADES PARA EL SUPER USUARIO }
  UTI_Abrir_Modulo_Tablas( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Ver_Ultimas_VentasClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_UltimasVentas( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Visitas_Explotacion_RepresentantesClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_VisitasPorRepresentante( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Visitas_Explotacion_ActividadesClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_VisitasPorActividad( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Visitas_Explotacion_Tipo_ClientesClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_VisitasPorTipoCliente( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Visitas_Explotacion_ClientesClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_VisitasPorCliente( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Visitas_Explotacion_ProvinciasClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_VisitasPorProvincia( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Visitas_Explotacion_RutasClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_VisitasPorZona( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Visitas_Planificacion_RutasClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_PlanificacionPorZona( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Visitas_Planificacion_ProvinciasClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_PlanificacionPorProvincia( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Visitas_TiposClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_VisitasTipos( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Presupuestos_VentasClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_PresupuestosVentas( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Pedidos_VentasClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_PedidosVentas( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Visitas_ResultadosClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_VisitasResultados( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_VisitasClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_Visitas( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_RutasClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_Rutas( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Albaranes_VentasClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_AlbaranesVentas( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Vehiculos_EquipamientosClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_VehiculosEquipamientos( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_AlmacenesClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_Almacenes( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_ArticulosClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_Articulos( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_CombustiblesClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_Combustibles( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_PeliculasClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_Peliculas( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_PersonalClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_Personal( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_ProveedoresClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_Proveedores( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Tarjetas_TransporteClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_Tarjetas_Transporte( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Vehiculos_MarcasClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_MarcasVehiculos( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Vehiculos_TiposClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_TiposVehiculos( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_VehiculosClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_Vehiculos( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Vehiculos_Tipo_CambiosClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_TipoCambiosVehiculos( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Vehiculos_Tipo_RuedasClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_TipoRuedasVehiculos( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_UsuariosClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_Usuarios( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_MenusClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_Menus( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Familias_ArticulosClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_FamiliasArticulos( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Familias_PersonalClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_FamiliasPersonal( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Personal_Contratos_TiposClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_FamiliasContratosPersonal( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Personal_ContratosClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_ContratosPersonal( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_EmpresasClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_Empresas( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Gastos_TiposClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_FamiliasGastos( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Bancos_EmpresasClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_CuentasBancos( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Almacenes_MovimientosClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_MovimientosAlmacen( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Articulos_OfertasClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_OfertasArticulos( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Conceptos_Almacen_TraspasoClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_ConceptosPorTraspasoAlmacen( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Cuentas_Pagos_CobrosClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_CtasPagosCobros( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_MediosClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_Medios( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_PoblacionesClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_Poblaciones( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Formas_PagoClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_FormasPago( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Grupos_CocinaClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_GruposDeCocina( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_ImpresorasClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_Impresoras( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_ImpuestosClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_Impuestos( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_PaisesClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_Paises( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_ProvinciasClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_Provincias( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_RepresentantesClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_Representantes( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_TerminalesClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_Terminales( false, false, '1' );
end;

procedure Tform_Menu.MenuItem_Proveedores_TiposClick(Sender: TObject);
begin
  UTI_Abrir_Modulo_TiposProveedores( false, false, '1' );
end;

procedure Tform_Menu.MenuItem10Click(Sender: TObject);
begin
  UTI_Abrir_Modulo_ConfigurarAPP( false, false, '1' );

  Configurar_APP;
end;

function Tform_Menu.Traer_Configuracion_APP : Boolean;
begin
    Result := true;
    Form_Menu.public_User_Configuracion := Traer_Configuracion_APP_xID('1');
    if Form_Menu.public_User_Configuracion.id = '0' then
    begin
        UTI_Abrir_Modulo_ConfigurarAPP( false, false, '1' );

        Form_Menu.public_User_Configuracion := Traer_Configuracion_APP_xID('1');
        if Form_Menu.public_User_Configuracion.id = '0' then
        begin
            Result := false;
        end;
    end;
end;

end.


