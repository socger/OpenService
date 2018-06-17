unit vehiculos_001;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DBDateTimePicker, DateTimePicker, Forms, Controls, Graphics, Dialogs,
  ButtonPanel, ExtCtrls, Buttons, StdCtrls, DbCtrls, ComCtrls, DBGrids, utilidades_forms_Filtrar, db,
  sqldb, utilidades_rgtro, utilidades_general, utilidades_datos_tablas, Grids, utilidades_usuarios,
  utilidades_bd;

type

  TKm_Ultimos = record
      Fallo_en_Conexion_BD : Boolean;
      km                   : ShortString;
      fecha                : ShortString;
      consumo_medio        : ShortString;
  end;

  { Tform_vehiculos_001 }

  Tform_vehiculos_001 = class(TForm)
    BitBtn_Aseguradora_Contacto_SMS: TBitBtn;
    BitBtn_Aseguradora_SMS: TBitBtn;
    BitBtn_Propietario_Contacto_SMS: TBitBtn;
    BitBtn_Propietario_SMS: TBitBtn;
    BitBtn_Ver_Situacion_Registro_Vehiculos_su_Equipamiento: TBitBtn;
    Boton_Aseguradora_Buscar_en_gooble: TBitBtn;
    Boton_Elegir_Almacen: TBitBtn;
    Boton_Elegir_Aseguradora: TBitBtn;
    Boton_Elegir_Aseguradora_Contacto: TBitBtn;
    Boton_Elegir_Comprado_a: TBitBtn;
    Boton_Elegir_Conductor: TBitBtn;
    Boton_Elegir_Marca: TBitBtn;
    Boton_Elegir_Propietario: TBitBtn;
    Boton_Elegir_Propietario_Contacto: TBitBtn;
    Boton_Elegir_Tarjeta_Transporte: TBitBtn;
    Boton_Elegir_Tipo_Cambio: TBitBtn;
    Boton_Elegir_Tipo_Combustible: TBitBtn;
    Boton_Elegir_Tipo_Neumaticos: TBitBtn;
    Boton_Elegir_Tipo_Vehiculo: TBitBtn;
    Boton_Propietario_Buscar_en_gooble: TBitBtn;
    Boton_ver_imagenes: TBitBtn;
    Boton_ver_documentacion: TBitBtn;
    ButtonPanel1: TButtonPanel;
    DBCheckBox_Beneficiacio_Gasoleo_Profesional: TDBCheckBox;
    DBCheckBox_Con_Tacografo_Digital: TDBCheckBox;
    DBDateTimePicker_Fecha_Compra: TDBDateTimePicker;
    DBDateTimePicker_Fecha_ITV_Ultima: TDBDateTimePicker;
    DBDateTimePicker_Fecha_Matriculacion_Primera: TDBDateTimePicker;
    DBDateTimePicker_Fecha_Matriculacion_Ultima: TDBDateTimePicker;
    DBEdit_Aceite_Motor: TDBEdit;
    DBEdit_Aceite_Valvulina: TDBEdit;
    DBEdit_Aire_Acondicionado_Marca: TDBEdit;
    DBEdit_Aire_Acondicionado_Numero_Compresor_Actual: TDBEdit;
    DBEdit_Aire_Acondicionado_Numero_Compresor_Original: TDBEdit;
    DBEdit_Aire_Acondicionado_Numero_Serie: TDBEdit;
    DBEdit_Aire_Acondicionado_Tipo_Gas: TDBEdit;
    DBEdit_Bastidor: TDBEdit;
    DBEdit_Carroceria: TDBEdit;
    DBEdit_Motor: TDBEdit;
    DBEdit_Cilindrada: TDBEdit;
    DBEdit_Codigo_Color: TDBEdit;
    DBEdit_Codigo_Llave: TDBEdit;
    DBEdit_Codigo_Radio: TDBEdit;
    DBEdit_Codigo_Vehiculo: TDBEdit;
    DBEdit_Codigo_Vehiculo1: TDBEdit;
    DBEdit_Codigo_Vehiculo2: TDBEdit;
    DBEdit_Codigo_Vehiculo3: TDBEdit;
    DBEdit_Codigo_Vehiculo4: TDBEdit;
    DBEdit_Codigo_Vehiculo5: TDBEdit;
    DBEdit_Color: TDBEdit;
    DBEdit_eMail1: TDBEdit;
    DBEdit_Filtro_Habitaculo: TDBEdit;
    DBEdit_Matricula: TDBEdit;
    DBEdit_Modelo: TDBEdit;
    DBEdit_No_Obra: TDBEdit;
    DBEdit_Numero_Puertas: TDBEdit;
    DBEdit_Potencia: TDBEdit;
    DBEdit_Tipo_Frenos_Delanteros: TDBEdit;
    DBEdit_Tipo_Frenos_Delanteros1: TDBEdit;
    DBEdit_Tipo_Frenos_Delanteros2: TDBEdit;
    DBEdit_Tipo_Frenos_Delanteros3: TDBEdit;
    DBEdit_Tipo_Frenos_Traseros: TDBEdit;
    DBEdit_Traccion: TDBEdit;
    DBEdit_Version: TDBEdit;
    DBGrid_Vehiculos_su_Equipamiento: TDBGrid;
    DBMemo_Observaciones_Comentarios: TDBMemo;
    DBMemo_Configuraciones_Especiales: TDBMemo;
    DBNavigator_Vehiculos_su_Equipamiento: TDBNavigator;
    DBRadioGroup_Propietario_Tipo: TDBRadioGroup;
    Edit_Aseguradora_Cargo_Puesto: TEdit;
    Edit_Aseguradora_Contacto_FAX: TEdit;
    Edit_Aseguradora_Contacto_Nombre: TEdit;
    Edit_Aseguradora_Contacto_Tfno_1: TEdit;
    Edit_Aseguradora_Contacto_Tfno_2: TEdit;
    Edit_Aseguradora_Contacto_Tfno_Movil: TEdit;
    Edit_Aseguradora_Direccion: TEdit;
    Edit_Aseguradora_Direccion_Codigo_Postal: TEdit;
    Edit_Aseguradora_Direccion_FAX: TEdit;
    Edit_Aseguradora_Direccion_Numero: TEdit;
    Edit_Aseguradora_Direccion_Pais: TEdit;
    Edit_Aseguradora_Direccion_Piso_Letra: TEdit;
    Edit_Aseguradora_Direccion_Poblacion: TEdit;
    Edit_Aseguradora_Direccion_Provincia: TEdit;
    Edit_Aseguradora_Direccion_Tfno_1: TEdit;
    Edit_Aseguradora_Direccion_Tfno_2: TEdit;
    Edit_Aseguradora_Direccion_Tfno_Movil: TEdit;
    Edit_Aseguradora_NIF: TEdit;
    Edit_Aseguradora_Nombre_Comercial: TEdit;
    Edit_Aseguradora_Razon_Social: TEdit;
    Edit_Descripcion_Almacen: TEdit;
    Edit_Descripcion_Comprado_a: TEdit;
    Edit_Descripcion_Conductor: TEdit;
    Edit_Descripcion_Conductor_NIF: TEdit;
    Edit_Descripcion_Marca: TEdit;
    Edit_Descripcion_Tipo_Cambio: TEdit;
    Edit_Descripcion_Tipo_Combustible: TEdit;
    Edit_Descripcion_Tipo_Neumaticos: TEdit;
    Edit_Descripcion_Tipo_Vehiculo: TEdit;
    Edit_Descripcion_Tjta_Tte: TEdit;
    Edit_Descripcion_Tjta_Tte_Ambito: TEdit;
    Edit_Edad: TEdit;
    Edit_Km_Ultimos_Ctdad: TEdit;
    Edit_Km_Ultimos_Consumo: TEdit;
    Edit_Km_Ultimos_Fecha: TEdit;
    Edit_Propietario_Contacto_Cargo_Puesto: TEdit;
    Edit_Propietario_Contacto_FAX: TEdit;
    Edit_Propietario_Contacto_Nombre: TEdit;
    Edit_Propietario_Contacto_Tfno_1: TEdit;
    Edit_Propietario_Contacto_Tfno_2: TEdit;
    Edit_Propietario_Contacto_Tfno_Movil: TEdit;
    Edit_Propietario_Direccion: TEdit;
    Edit_Propietario_Direccion_Codigo_Postal: TEdit;
    Edit_Propietario_Direccion_FAX: TEdit;
    Edit_Propietario_Direccion_Numero: TEdit;
    Edit_Propietario_Direccion_Pais: TEdit;
    Edit_Propietario_Direccion_Piso_Letra: TEdit;
    Edit_Propietario_Direccion_Poblacion: TEdit;
    Edit_Propietario_Direccion_Provincia: TEdit;
    Edit_Propietario_Direccion_Tfno_1: TEdit;
    Edit_Propietario_Direccion_Tfno_2: TEdit;
    Edit_Propietario_Direccion_Tfno_Movil: TEdit;
    Edit_Propietario_NIF: TEdit;
    Edit_Propietario_Nombre_Comercial: TEdit;
    Edit_Propietario_Razon_Social: TEdit;
    GroupBox1: TGroupBox;
    GroupBox11: TGroupBox;
    GroupBox12: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    GroupBox_Plazas: TGroupBox;
    GroupBox_Aseguradora_Contacto: TGroupBox;
    GroupBox_Propietario_Contacto: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label4: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label5: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label6: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label7: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label8: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label9: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    PageControl_Otros_Datos: TPageControl;
    RadioGroup_Bajas: TRadioGroup;
    TabSheet_Datos_Adicionales: TTabSheet;
    TabSheet_Datos_Tecnicos: TTabSheet;
    TabSheet_Datos_Propietario: TTabSheet;
    TabSheet_Aseguradora: TTabSheet;
    TabSheet_Neumaticos: TTabSheet;
    TabSheet_Avisos: TTabSheet;


    procedure Borrar_Vehiculos_Equipamiento;
    procedure Insertar_Vehiculos_Equipamiento;
    procedure Editar_Vehiculos_Equipamiento;
    function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
    function  Devolver_Vehiculo_Km_Ultimos(param_id_vehiculos : ShortString) : TKm_Ultimos;
    procedure BitBtn_Ver_Situacion_Registro_Vehiculos_su_EquipamientoClick(Sender: TObject);
    procedure DBGrid_Vehiculos_su_EquipamientoDblClick(Sender: TObject);
    procedure DBGrid_Vehiculos_su_EquipamientoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_Vehiculos_su_EquipamientoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBNavigator_Vehiculos_su_EquipamientoBeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure RadioGroup_BajasClick(Sender: TObject);
    procedure Refrescar_Registros;

    procedure Presentar_Datos;
    procedure Presentar_Datos_Propietario_Empresa;
    procedure Presentar_Datos_Propietario_Cliente;
    procedure Presentar_Datos_Propietario_Proveedor;

    procedure BitBtn_Aseguradora_SMSClick(Sender: TObject);
    procedure BitBtn_Propietario_SMSClick(Sender: TObject);
    procedure no_Tocar;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure para_Empezar;
    procedure Elegir_Datos_Propietario_Proveedor;
    procedure Elegir_Datos_Propietario_Empresa;
    procedure Elegir_Datos_Propietario_Cliente;
    procedure Elegir_Datos_Propietario_Cliente_Contacto;
    procedure Elegir_Datos_Propietario_Proveedor_Contacto(param_para_quien : ShortString);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure Vaciar_Cia_Aseguradora_Contacto;
    procedure Vaciar_Propietario_Contactos;
    procedure Vaciar_Propietario_Contactos_2;
    procedure Vaciar_Cia_Aseguradora;
    procedure Vaciar_Tarjeta_Transporte;
    procedure Vaciar_Conductor_Habitual;
    procedure Vaciar_Propietario;
    procedure Vaciar_Propietario_2;

    procedure Boton_Elegir_Aseguradora_ContactoClick(Sender: TObject);
    procedure Boton_Elegir_Propietario_ContactoClick(Sender: TObject);
    procedure Edit_Aseguradora_Contacto_NombreClick(Sender: TObject);
    procedure Edit_Aseguradora_DireccionClick(Sender: TObject);
    procedure Edit_Aseguradora_Direccion_NumeroClick(Sender: TObject);
    function  Elegir_Contacto_del_Proveedor(param_id : ShortString) : TRecord_Rgtro_Comun;
    procedure Edit_Aseguradora_NIFClick(Sender: TObject);
    procedure Edit_Aseguradora_Nombre_ComercialClick(Sender: TObject);
    procedure Edit_Propietario_Contacto_NombreClick(Sender: TObject);
    procedure Edit_Propietario_Razon_SocialClick(Sender: TObject);
    procedure Boton_Elegir_AlmacenClick(Sender: TObject);
    procedure Boton_Elegir_AseguradoraClick(Sender: TObject);
    procedure Edit_Aseguradora_Razon_SocialClick(Sender: TObject);
    procedure Edit_Descripcion_AlmacenClick(Sender: TObject);
    procedure Elegir_Datos_Propietario;
    procedure Boton_Elegir_Comprado_aClick(Sender: TObject);
    procedure Boton_Elegir_ConductorClick(Sender: TObject);
    procedure Boton_Elegir_PropietarioClick(Sender: TObject);
    procedure Edit_Descripcion_Comprado_aClick(Sender: TObject);
    procedure Edit_Descripcion_ConductorClick(Sender: TObject);
    procedure Edit_Descripcion_Conductor_NIFClick(Sender: TObject);
    procedure Boton_Elegir_MarcaClick(Sender: TObject);
    procedure Boton_Elegir_Tipo_CambioClick(Sender: TObject);
    procedure Boton_Elegir_Tipo_CombustibleClick(Sender: TObject);
    procedure Boton_Elegir_Tipo_NeumaticosClick(Sender: TObject);
    procedure Boton_Elegir_Tarjeta_TransporteClick(Sender: TObject);
    procedure Boton_Elegir_Tipo_VehiculoClick(Sender: TObject);
    procedure Edit_Descripcion_MarcaClick(Sender: TObject);
    procedure Edit_Descripcion_Tipo_CambioClick(Sender: TObject);
    procedure Edit_Descripcion_Tipo_CombustibleClick(Sender: TObject);
    procedure Edit_Descripcion_Tipo_NeumaticosClick(Sender: TObject);
    procedure Edit_Descripcion_Tipo_VehiculoClick(Sender: TObject);
    procedure Edit_Descripcion_Tjta_TteClick(Sender: TObject);
    procedure Edit_Descripcion_Tjta_Tte_AmbitoClick(Sender: TObject);

  private
    { private declarations }
    private_Salir_OK  : Boolean;

    function Traer_Empresas_xID( param_id : ShortString ) : TEmpresas;
    function Traer_Proveedores_xID( param_id : ShortString ) : TProveedores;
    function Traer_Clientes_xID( param_id : ShortString ) : TClientes;
    function Traer_Clientes_Contactos_xID( param_id : ShortString ) : TClientes_Contactos;
    function Traer_Proveedores_Contactos_xID( param_id : ShortString ) : TProveedores_Contactos;

  public
    { public declarations }
    public_Solo_Ver      : Boolean;
    public_Menu_Worked   : Integer;
    public_Pulso_Aceptar : Boolean;
    public_Record_Rgtro  : TRecord_Rgtro_Comun;
  end;

var
  form_vehiculos_001: Tform_vehiculos_001;

implementation

{$R *.lfm}

uses menu, vehiculos_000, Proveedores_003, vehiculos_002;

{ Tform_vehiculos_001 }

procedure Tform_vehiculos_001.Edit_Aseguradora_Nombre_ComercialClick(Sender: TObject);
begin
    Vaciar_Cia_Aseguradora;
end;

procedure Tform_vehiculos_001.Edit_Propietario_Contacto_NombreClick(Sender: TObject);
begin
    Vaciar_Propietario_Contactos;
end;

procedure Tform_vehiculos_001.Edit_Propietario_Razon_SocialClick(Sender: TObject);
begin
  Vaciar_Propietario;
end;

procedure Tform_vehiculos_001.Edit_Aseguradora_NIFClick(Sender: TObject);
begin
    Vaciar_Cia_Aseguradora;
end;

procedure Tform_vehiculos_001.Edit_Aseguradora_DireccionClick(Sender: TObject);
begin
    Vaciar_Cia_Aseguradora;
end;

procedure Tform_vehiculos_001.Edit_Aseguradora_Contacto_NombreClick(Sender: TObject);
begin
    Vaciar_Cia_Aseguradora_Contacto;
end;

procedure Tform_vehiculos_001.Edit_Aseguradora_Direccion_NumeroClick(Sender: TObject);
begin
    Vaciar_Cia_Aseguradora;
end;

procedure Tform_vehiculos_001.Edit_Aseguradora_Razon_SocialClick(Sender: TObject);
begin
    Vaciar_Cia_Aseguradora;
end;

procedure Tform_vehiculos_001.Boton_Elegir_AlmacenClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_Vehiculos_000.SQLQuery_Vehiculos do
    begin
        var_Registro := UTI_Abrir_Modulo_Almacenes( '', '', true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_almacenes').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Almacen.Text        := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_vehiculos_001.Edit_Descripcion_AlmacenClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS el ALMACEN?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_Vehiculos_000.SQLQuery_Vehiculos.FieldByName('id_almacenes').Clear;
         Edit_Descripcion_Almacen.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_vehiculos_001.Boton_Elegir_Tipo_VehiculoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_Vehiculos_000.SQLQuery_Vehiculos do
    begin
        var_Registro := UTI_Abrir_Modulo_TiposVehiculos( true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_vehiculos_tipos').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Tipo_Vehiculo.Text        := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_vehiculos_001.Edit_Descripcion_Tipo_VehiculoClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS el TIPO DE VEHICULO?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_Vehiculos_000.SQLQuery_Vehiculos.FieldByName('id_vehiculos_tipos').Clear;
         Edit_Descripcion_Tipo_Vehiculo.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_vehiculos_001.Boton_Elegir_MarcaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_Vehiculos_000.SQLQuery_Vehiculos do
    begin
        var_Registro := UTI_Abrir_Modulo_MarcasVehiculos( true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_vehiculos_marcas').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Marca.Text                 := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_vehiculos_001.Edit_Descripcion_MarcaClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS la MARCA del vehículo?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_Vehiculos_000.SQLQuery_Vehiculos.FieldByName('id_vehiculos_marcas').Clear;
         Edit_Descripcion_Marca.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_vehiculos_001.Boton_Elegir_Tipo_CombustibleClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_Vehiculos_000.SQLQuery_Vehiculos do
    begin
        var_Registro := UTI_Abrir_Modulo_Combustibles( true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_combustibles').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Tipo_Combustible.Text  := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_vehiculos_001.Edit_Descripcion_Tipo_CombustibleClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS el TIPO DE COMBUSTIBLE del vehículo?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_Vehiculos_000.SQLQuery_Vehiculos.FieldByName('id_combustibles').Clear;
         Edit_Descripcion_Tipo_Combustible.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_vehiculos_001.Boton_Elegir_Tipo_CambioClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_Vehiculos_000.SQLQuery_Vehiculos do
    begin
        var_Registro := UTI_Abrir_Modulo_TipoCambiosVehiculos( true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_vehiculos_tipo_cambios').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Tipo_Cambio.Text                 := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_vehiculos_001.Edit_Descripcion_Tipo_CambioClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS el TIPO DE CAMBIO del vehículo?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_Vehiculos_000.SQLQuery_Vehiculos.FieldByName('id_vehiculos_tipo_cambios').Clear;
         Edit_Descripcion_Tipo_Cambio.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_vehiculos_001.Boton_Elegir_Tipo_NeumaticosClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_Vehiculos_000.SQLQuery_Vehiculos do
    begin
        var_Registro := UTI_Abrir_Modulo_TipoRuedasVehiculos( true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_vehiculos_tipo_ruedas').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Tipo_Neumaticos.Text       := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_vehiculos_001.Edit_Descripcion_Tipo_NeumaticosClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS el TIPO DE NEUMATICOS del vehículo?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_Vehiculos_000.SQLQuery_Vehiculos.FieldByName('id_vehiculos_tipo_ruedas').Clear;
         Edit_Descripcion_Tipo_Neumaticos.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_vehiculos_001.Boton_Elegir_Tarjeta_TransporteClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_Vehiculos_000.SQLQuery_Vehiculos do
    begin
        var_Registro := UTI_Abrir_Modulo_Tarjetas_Transporte( true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_tarjetas_transporte').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Tjta_Tte.Text                 := var_Registro.descripcion_1;
             Edit_Descripcion_Tjta_Tte_Ambito.Text          := var_Registro.descripcion_2;
        end;
    end;
end;

procedure Tform_vehiculos_001.Edit_Descripcion_Tjta_TteClick(Sender: TObject);
begin
    Vaciar_Tarjeta_Transporte;
end;

procedure Tform_vehiculos_001.Edit_Descripcion_Tjta_Tte_AmbitoClick(Sender: TObject);
begin
    Vaciar_Tarjeta_Transporte;
end;

procedure Tform_vehiculos_001.Boton_Elegir_ConductorClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_Vehiculos_000.SQLQuery_Vehiculos do
    begin
        var_Registro := UTI_Abrir_Modulo_Personal( true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_personal_conductor_habitual').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Conductor.Text                        := var_Registro.descripcion_1;
             Edit_Descripcion_Conductor_NIF.Text                    := var_Registro.descripcion_2;
        end;
    end;
end;

procedure Tform_vehiculos_001.Edit_Descripcion_ConductorClick(Sender: TObject);
begin
    Vaciar_Conductor_Habitual;
end;

procedure Tform_vehiculos_001.Edit_Descripcion_Conductor_NIFClick(Sender: TObject);
begin
    Vaciar_Conductor_Habitual;
end;

procedure Tform_vehiculos_001.Boton_Elegir_Comprado_aClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_Vehiculos_000.SQLQuery_Vehiculos do
    begin
        var_Registro := UTI_Abrir_Modulo_Proveedores( true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_proveedores_comprado_a').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Comprado_a.Text                  := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_vehiculos_001.Edit_Descripcion_Comprado_aClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS A QUIEN SE COMPRO el vehículo?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_Vehiculos_000.SQLQuery_Vehiculos.FieldByName('id_proveedores_comprado_a').Clear;
         Edit_Descripcion_Comprado_a.Text     := '';;
    end;
    var_msg.Free;
end;

procedure Tform_vehiculos_001.Vaciar_Cia_Aseguradora_Contacto;
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS el CONTACTO de la COMPAÑÍA ASEGURADORA?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_Vehiculos_000.SQLQuery_Vehiculos.FieldByName('id_proveedores_aseguradora_contacto').Clear;

         Edit_Aseguradora_Contacto_Nombre.Text     := '';
         Edit_Aseguradora_Cargo_Puesto.Text        := '';
         Edit_Aseguradora_Contacto_Tfno_1.Text     := '';
         Edit_Aseguradora_Contacto_Tfno_2.Text     := '';
         Edit_Aseguradora_Contacto_FAX.Text        := '';
         Edit_Aseguradora_Contacto_Tfno_Movil.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_vehiculos_001.Vaciar_Propietario_Contactos_2;
begin
    Edit_Propietario_Contacto_Nombre.Text       := '';
    Edit_Propietario_Contacto_Cargo_Puesto.Text := '';
    Edit_Propietario_Contacto_Tfno_1.Text       := '';
    Edit_Propietario_Contacto_Tfno_2.Text       := '';
    Edit_Propietario_Contacto_FAX.Text          := '';
    Edit_Propietario_Contacto_Tfno_Movil.Text   := '';
end;

procedure Tform_vehiculos_001.Vaciar_Propietario_Contactos;
var var_msg : TStrings;
begin
    with form_Vehiculos_000.SQLQuery_Vehiculos do
    begin
        if FieldByName('id_empresas_propietario').isNull then
        begin
            var_msg := TStringList.Create;
            var_msg.Add('¿QUITAMOS el CONTACTO de la COMPAÑÍA ASEGURADORA?');
            if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
            begin
                 FieldByName('id_proveedores_propietario_contacto').Clear;
                 FieldByName('id_clientes_propietario_contacto').Clear;

                 Vaciar_Propietario_Contactos_2;
            end;
            var_msg.Free;
        end else begin
            var_msg := TStringList.Create;
            var_msg.Add( 'El contacto está implícito ya al elegir como propietario a una empresa.');
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;
        end;
    end;
end;

procedure Tform_vehiculos_001.Vaciar_Cia_Aseguradora;
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS la COMPAÑÍA ASEGURADORA?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_Vehiculos_000.SQLQuery_Vehiculos.FieldByName('id_proveedores_aseguradora').Clear;

         Edit_Aseguradora_Razon_Social.Text            := '';
         Edit_Aseguradora_Nombre_Comercial.Text        := '';
         Edit_Aseguradora_NIF.Text                     := '';
         Edit_Aseguradora_Direccion.Text               := '';
         Edit_Aseguradora_Direccion_Numero.Text        := '';
         Edit_Aseguradora_Direccion_Piso_Letra.Text    := '';
         Edit_Aseguradora_Direccion_Codigo_Postal.Text := '';
         Edit_Aseguradora_Direccion_Tfno_1.Text        := '';
         Edit_Aseguradora_Direccion_Tfno_2.Text        := '';
         Edit_Aseguradora_Direccion_FAX.Text           := '';
         Edit_Aseguradora_Direccion_Tfno_Movil.Text    := '';
         Edit_Aseguradora_Direccion_Poblacion.Text     := '';
         Edit_Aseguradora_Direccion_Provincia.Text     := '';
         Edit_Aseguradora_Direccion_Pais.Text          := '';
    end;
    var_msg.Free;
end;

procedure Tform_vehiculos_001.Vaciar_Tarjeta_Transporte;
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS el TARJETA DE TRANSPORTE del vehículo?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_Vehiculos_000.SQLQuery_Vehiculos.FieldByName('id_tarjetas_transporte').Clear;
         Edit_Descripcion_Tjta_Tte.Text        := '';;
         Edit_Descripcion_Tjta_Tte_Ambito.Text := '';;
    end;
    var_msg.Free;
end;

procedure Tform_vehiculos_001.Vaciar_Conductor_Habitual;
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS el CONDUCTOR HABITUAL del vehículo?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_Vehiculos_000.SQLQuery_Vehiculos.FieldByName('id_personal_conductor_habitual').Clear;
         Edit_Descripcion_Conductor.Text     := '';;
         Edit_Descripcion_Conductor_NIF.Text := '';;
    end;
    var_msg.Free;
end;

procedure Tform_vehiculos_001.Vaciar_Propietario;
var var_msg : TStrings;
begin
    if (form_Vehiculos_000.SQLQuery_Vehiculos.FieldByName('id_clientes_propietario').IsNull)    and
       (form_Vehiculos_000.SQLQuery_Vehiculos.FieldByName('id_empresas_propietario').IsNull)    and
       (form_Vehiculos_000.SQLQuery_Vehiculos.FieldByName('id_proveedores_propietario').IsNull) then
    begin
        Vaciar_Propietario_2;
        Exit;
    end;

    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS al PROPIETARIO?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
        Vaciar_Propietario_2;
    end;
    var_msg.Free;
end;

procedure Tform_vehiculos_001.Vaciar_Propietario_2;
begin
    form_Vehiculos_000.SQLQuery_Vehiculos.FieldByName('id_clientes_propietario').Clear;
    form_Vehiculos_000.SQLQuery_Vehiculos.FieldByName('id_empresas_propietario').Clear;
    form_Vehiculos_000.SQLQuery_Vehiculos.FieldByName('id_proveedores_propietario').Clear;

    Edit_Propietario_Razon_Social.Text            := '';
    Edit_Propietario_Nombre_Comercial.Text        := '';
    Edit_Propietario_NIF.Text                     := '';
    Edit_Propietario_Direccion.Text               := '';
    Edit_Propietario_Direccion_Numero.Text        := '';
    Edit_Propietario_Direccion_Piso_Letra.Text    := '';
    Edit_Propietario_Direccion_Codigo_Postal.Text := '';
    Edit_Propietario_Direccion_Tfno_1.Text        := '';
    Edit_Propietario_Direccion_Tfno_2.Text        := '';
    Edit_Propietario_Direccion_FAX.Text           := '';
    Edit_Propietario_Direccion_Tfno_Movil.Text    := '';
    Edit_Propietario_Direccion_Poblacion.Text     := '';
    Edit_Propietario_Direccion_Provincia.Text     := '';
    Edit_Propietario_Direccion_Pais.Text          := '';
end;

procedure Tform_vehiculos_001.Boton_Elegir_AseguradoraClick(Sender: TObject);
var var_Registro             : TRecord_Rgtro_Comun;
    var_Registro_Proveedores : TProveedores;
begin
    with form_Vehiculos_000.SQLQuery_Vehiculos do
    begin
        var_Registro := UTI_Abrir_Modulo_Proveedores( true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_proveedores_aseguradora').AsString := Trim(var_Registro.id_1);
             Edit_Aseguradora_Razon_Social.Text                 := var_Registro.descripcion_1;

             var_Registro_Proveedores := Traer_Proveedores_xID( Trim(var_Registro.id_1) );

             if var_Registro_Proveedores.id <> '0' then
             begin
                  Edit_Aseguradora_Razon_Social.Text            := var_Registro_Proveedores.nombre_propietario;
                  Edit_Aseguradora_Nombre_Comercial.Text        := var_Registro_Proveedores.nombre_comercial;
                  Edit_Aseguradora_NIF.Text                     := var_Registro_Proveedores.nif_cif;
                  Edit_Aseguradora_Direccion.Text               := var_Registro_Proveedores.Direccion;
                  Edit_Aseguradora_Direccion_Numero.Text        := var_Registro_Proveedores.Direccion_Numero;
                  Edit_Aseguradora_Direccion_Piso_Letra.Text    := var_Registro_Proveedores.Direccion_Piso_Letra;
                  Edit_Aseguradora_Direccion_Codigo_Postal.Text := var_Registro_Proveedores.Codigo_Postal;
                  Edit_Aseguradora_Direccion_Tfno_1.Text        := var_Registro_Proveedores.Tfno_Fijo_1;
                  Edit_Aseguradora_Direccion_Tfno_2.Text        := var_Registro_Proveedores.Tfno_Fijo_2;
                  Edit_Aseguradora_Direccion_FAX.Text           := var_Registro_Proveedores.FAX;
                  Edit_Aseguradora_Direccion_Tfno_Movil.Text    := var_Registro_Proveedores.Movil;
                  Edit_Aseguradora_Direccion_Poblacion.Text     := var_Registro_Proveedores.OT_descripcion_poblacion;
                  Edit_Aseguradora_Direccion_Provincia.Text     := var_Registro_Proveedores.OT_descripcion_provincia;
                  Edit_Aseguradora_Direccion_Pais.Text          := var_Registro_Proveedores.OT_descripcion_pais;
             end;
        end;
    end;
end;

procedure Tform_vehiculos_001.Boton_Elegir_PropietarioClick(Sender: TObject);
var var_msg : TStrings;
begin
    with form_Vehiculos_000.SQLQuery_Vehiculos do
    begin
        if FieldByName('tipo_propietario').isNull then
        begin
            var_msg := TStringList.Create;
            var_msg.Add( 'El tipo de propietario, se necesita antes.');
            UTI_GEN_Aviso(true, var_msg, rs_Falta, True, False);
            var_msg.Free;
        end else begin
            Elegir_Datos_Propietario;
        end;
    end;
end;

procedure Tform_vehiculos_001.Elegir_Datos_Propietario;
begin
    with form_Vehiculos_000.SQLQuery_Vehiculos do
    begin
        if Trim(FieldByName('tipo_propietario').asString) = '1' then
        begin
            Elegir_Datos_Propietario_Cliente;
        end;

        if Trim(FieldByName('tipo_propietario').asString) = '2' then
        begin
            Elegir_Datos_Propietario_Empresa;
        end;

        if Trim(FieldByName('tipo_propietario').asString) = '3' then
        begin
            Elegir_Datos_Propietario_Proveedor;
        end;
    end;
end;

procedure Tform_vehiculos_001.Elegir_Datos_Propietario_Proveedor;
var var_Registro             : TRecord_Rgtro_Comun;
    var_Registro_Proveedores : TProveedores;
begin
    with form_Vehiculos_000.SQLQuery_Vehiculos do
    begin
        var_Registro := UTI_Abrir_Modulo_Proveedores( true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_proveedores_propietario').AsString := Trim(var_Registro.id_1);
             Edit_Propietario_Razon_Social.Text                 := var_Registro.descripcion_1;

             var_Registro_Proveedores := Traer_Proveedores_xID( Trim(var_Registro.id_1) );

             if var_Registro_Proveedores.id <> '0' then
             begin
                  Edit_Propietario_Razon_Social.Text            := var_Registro_Proveedores.nombre_propietario;
                  Edit_Propietario_Nombre_Comercial.Text        := var_Registro_Proveedores.nombre_comercial;
                  Edit_Propietario_NIF.Text                     := var_Registro_Proveedores.nif_cif;
                  Edit_Propietario_Direccion.Text               := var_Registro_Proveedores.Direccion;
                  Edit_Propietario_Direccion_Numero.Text        := var_Registro_Proveedores.Direccion_Numero;
                  Edit_Propietario_Direccion_Piso_Letra.Text    := var_Registro_Proveedores.Direccion_Piso_Letra;
                  Edit_Propietario_Direccion_Codigo_Postal.Text := var_Registro_Proveedores.Codigo_Postal;
                  Edit_Propietario_Direccion_Tfno_1.Text        := var_Registro_Proveedores.Tfno_Fijo_1;
                  Edit_Propietario_Direccion_Tfno_2.Text        := var_Registro_Proveedores.Tfno_Fijo_2;
                  Edit_Propietario_Direccion_FAX.Text           := var_Registro_Proveedores.FAX;
                  Edit_Propietario_Direccion_Tfno_Movil.Text    := var_Registro_Proveedores.Movil;
                  Edit_Propietario_Direccion_Poblacion.Text     := var_Registro_Proveedores.OT_descripcion_poblacion;
                  Edit_Propietario_Direccion_Provincia.Text     := var_Registro_Proveedores.OT_descripcion_provincia;
                  Edit_Propietario_Direccion_Pais.Text          := var_Registro_Proveedores.OT_descripcion_pais;
             end;
        end;
    end;
end;

procedure Tform_vehiculos_001.Elegir_Datos_Propietario_Cliente;
var var_Registro          : TRecord_Rgtro_Comun;
    var_Registro_Clientes : TClientes;
begin
    with form_Vehiculos_000.SQLQuery_Vehiculos do
    begin
        var_Registro := UTI_Abrir_Modulo_Clientes( '', '', true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_clientes_propietario').AsString := Trim(var_Registro.id_1);
             Edit_Propietario_Razon_Social.Text                 := var_Registro.descripcion_1;

             var_Registro_Clientes := Traer_Clientes_xID( Trim(var_Registro.id_1) );

             if var_Registro_Clientes.id <> '0' then
             begin
                  Edit_Propietario_Razon_Social.Text            := var_Registro_Clientes.nombre_propietario;
                  Edit_Propietario_Nombre_Comercial.Text        := var_Registro_Clientes.nombre_comercial;
                  Edit_Propietario_NIF.Text                     := var_Registro_Clientes.nif_cif;
                  Edit_Propietario_Direccion.Text               := var_Registro_Clientes.Direccion;
                  Edit_Propietario_Direccion_Numero.Text        := var_Registro_Clientes.Direccion_Numero;
                  Edit_Propietario_Direccion_Piso_Letra.Text    := var_Registro_Clientes.Direccion_Piso_Letra;
                  Edit_Propietario_Direccion_Codigo_Postal.Text := var_Registro_Clientes.Codigo_Postal;
                  Edit_Propietario_Direccion_Tfno_1.Text        := var_Registro_Clientes.Tfno_Fijo_1;
                  Edit_Propietario_Direccion_Tfno_2.Text        := var_Registro_Clientes.Tfno_Fijo_2;
                  Edit_Propietario_Direccion_FAX.Text           := var_Registro_Clientes.FAX;
                  Edit_Propietario_Direccion_Tfno_Movil.Text    := var_Registro_Clientes.Movil;
                  Edit_Propietario_Direccion_Poblacion.Text     := var_Registro_Clientes.OT_descripcion_poblacion;
                  Edit_Propietario_Direccion_Provincia.Text     := var_Registro_Clientes.OT_descripcion_provincia;
                  Edit_Propietario_Direccion_Pais.Text          := var_Registro_Clientes.OT_descripcion_pais;
             end;
        end;
    end;
end;

function Tform_vehiculos_001.Traer_Empresas_xID( param_id : ShortString ) : TEmpresas;
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

procedure Tform_vehiculos_001.Elegir_Datos_Propietario_Empresa;
var var_Registro          : TRecord_Rgtro_Comun;
    var_Registro_Empresas : TEmpresas;
begin
    with form_Vehiculos_000.SQLQuery_Vehiculos do
    begin
        var_Registro := UTI_Abrir_Modulo_Empresas( true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_empresas_propietario').AsString := Trim(var_Registro.id_1);
             Edit_Propietario_Razon_Social.Text                 := var_Registro.descripcion_1;

             var_Registro_Empresas := Traer_Empresas_xID( Trim(var_Registro.id_1) );

             if var_Registro_Empresas.id <> '0' then
             begin
                  // Edit_Propietario_Razon_Social.Text            := var_Registro_Empresas.nombr
                  Edit_Propietario_Nombre_Comercial.Text        := var_Registro_Empresas.nombre_comercial;
                  Edit_Propietario_NIF.Text                     := var_Registro_Empresas.nif_cif;
                  Edit_Propietario_Direccion.Text               := var_Registro_Empresas.Direccion;
                  Edit_Propietario_Direccion_Numero.Text        := var_Registro_Empresas.Direccion_Numero;
                  Edit_Propietario_Direccion_Piso_Letra.Text    := var_Registro_Empresas.Direccion_Piso_Letra;
                  Edit_Propietario_Direccion_Codigo_Postal.Text := var_Registro_Empresas.Codigo_Postal;
                  Edit_Propietario_Direccion_Tfno_1.Text        := var_Registro_Empresas.Tfno_Fijo_1;
                  Edit_Propietario_Direccion_Tfno_2.Text        := var_Registro_Empresas.Tfno_Fijo_2;
                  Edit_Propietario_Direccion_FAX.Text           := var_Registro_Empresas.FAX;
                  Edit_Propietario_Direccion_Tfno_Movil.Text    := var_Registro_Empresas.Movil;
                  Edit_Propietario_Direccion_Poblacion.Text     := var_Registro_Empresas.OT_descripcion_poblacion;
                  Edit_Propietario_Direccion_Provincia.Text     := var_Registro_Empresas.OT_descripcion_provincia;
                  Edit_Propietario_Direccion_Pais.Text          := var_Registro_Empresas.OT_descripcion_pais;

                  Vaciar_Propietario_Contactos_2;

                  Edit_Propietario_Contacto_Nombre.Text         := var_Registro_Empresas.Responsable;
             end;
        end;
    end;
end;

procedure Tform_vehiculos_001.Boton_Elegir_Propietario_ContactoClick(Sender: TObject);
var var_msg : TStrings;
begin
    with form_Vehiculos_000.SQLQuery_Vehiculos do
    begin
        if not FieldByName('id_clientes_propietario').isNull then
        begin
            Elegir_Datos_Propietario_Cliente_Contacto;
        end;

        if not FieldByName('id_empresas_propietario').isNull then
        begin
            var_msg := TStringList.Create;
            var_msg.Add( 'El contacto está implícito ya al elegir como propietario a una empresa.');
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;
        end;

        if not FieldByName('id_proveedores_propietario').isNull then
        begin
            Elegir_Datos_Propietario_Proveedor_Contacto('P');
        end;
    end;
end;

procedure Tform_vehiculos_001.Elegir_Datos_Propietario_Cliente_Contacto;
var var_Registro                    : TRecord_Rgtro_Comun;
    var_Registro_Clientes_Contactos : TClientes_Contactos;
begin
    with form_Vehiculos_000.SQLQuery_Vehiculos do
    begin
        var_Registro := UTI_Abrir_Modulo_Elegir_cliente_contacto( '', '', true, true, '1' );

        if var_Registro.id_1 <> '' then
        begin
            FieldByName('id_clientes_propietario_contacto').AsString := Trim(var_Registro.id_1);

            var_Registro_Clientes_Contactos := Traer_Clientes_Contactos_xID( Trim(var_Registro.id_1) );

            if var_Registro_Clientes_Contactos.id <> '0' then
            begin
                Edit_Propietario_Contacto_Nombre.Text       := var_Registro_Clientes_Contactos.nombre;
                Edit_Propietario_Contacto_Cargo_Puesto.Text := var_Registro_Clientes_Contactos.Cargo_Puesto;
                Edit_Propietario_Contacto_Tfno_1.Text       := var_Registro_Clientes_Contactos.Tfno_Fijo_1;
                Edit_Propietario_Contacto_Tfno_2.Text       := var_Registro_Clientes_Contactos.Tfno_Fijo_2;
                Edit_Propietario_Contacto_FAX.Text          := var_Registro_Clientes_Contactos.FAX;
                Edit_Propietario_Contacto_Tfno_Movil.Text   := var_Registro_Clientes_Contactos.Movil;
            end;
        end;
    end;
end;

procedure Tform_vehiculos_001.Elegir_Datos_Propietario_Proveedor_Contacto(param_para_quien : ShortString);
var var_Registro                       : TRecord_Rgtro_Comun;
    var_Registro_Proveedores_Contactos : TProveedores_Contactos;
begin
    with form_Vehiculos_000.SQLQuery_Vehiculos do
    begin
        if UpperCase(Trim(param_para_quien)) = 'P' then
        begin
            var_Registro := Elegir_Contacto_del_Proveedor(FieldByName('id_proveedores_propietario').AsString);
        end else begin
            var_Registro := Elegir_Contacto_del_Proveedor(FieldByName('id_proveedores_aseguradora').AsString);
        end;

        if var_Registro.id_1 <> '' then
        begin
            if UpperCase(Trim(param_para_quien)) = 'P' then
            begin
                FieldByName('id_proveedores_propietario_contacto').AsString := Trim(var_Registro.id_1);
            end else begin
                FieldByName('id_proveedores_aseguradora_contacto').AsString := Trim(var_Registro.id_1);
            end;

            var_Registro_Proveedores_Contactos := Traer_Proveedores_Contactos_xID( Trim(var_Registro.id_1) );

            if var_Registro_Proveedores_Contactos.id <> '0' then
            begin
                if UpperCase(Trim(param_para_quien)) = 'P' then
                begin
                    Edit_Propietario_Contacto_Nombre.Text       := var_Registro_Proveedores_Contactos.nombre;
                    Edit_Propietario_Contacto_Cargo_Puesto.Text := var_Registro_Proveedores_Contactos.Cargo_Puesto;
                    Edit_Propietario_Contacto_Tfno_1.Text       := var_Registro_Proveedores_Contactos.Tfno_Fijo_1;
                    Edit_Propietario_Contacto_Tfno_2.Text       := var_Registro_Proveedores_Contactos.Tfno_Fijo_2;
                    Edit_Propietario_Contacto_FAX.Text          := var_Registro_Proveedores_Contactos.FAX;
                    Edit_Propietario_Contacto_Tfno_Movil.Text   := var_Registro_Proveedores_Contactos.Movil;
                end else begin
                    Edit_Aseguradora_Contacto_Nombre.Text       := var_Registro_Proveedores_Contactos.nombre;
                    Edit_Aseguradora_Cargo_Puesto.Text          := var_Registro_Proveedores_Contactos.Cargo_Puesto;
                    Edit_Aseguradora_Contacto_Tfno_1.Text       := var_Registro_Proveedores_Contactos.Tfno_Fijo_1;
                    Edit_Aseguradora_Contacto_Tfno_2.Text       := var_Registro_Proveedores_Contactos.Tfno_Fijo_2;

                    Edit_Aseguradora_Contacto_FAX.Text          := var_Registro_Proveedores_Contactos.FAX;
                    Edit_Aseguradora_Contacto_Tfno_Movil.Text   := var_Registro_Proveedores_Contactos.Movil;
                end;
            end;
        end;
    end;
end;

function Tform_vehiculos_001.Elegir_Contacto_del_Proveedor(param_id : ShortString) : TRecord_Rgtro_Comun;
var var_msg : TStrings;
begin
    Result.id_1 := '';

    if UTI_GEN_Form_Abierto_Ya('form_Proveedores_003') = false then
    begin
        Application.CreateForm(Tform_Proveedores_003, form_Proveedores_003);

        form_Proveedores_003.public_Solo_Ver    := true;
        form_Proveedores_003.public_Elegimos    := true;
        form_Proveedores_003.public_Menu_Worked := public_Menu_Worked;

        form_Proveedores_003.Edit_id.Text       := param_id;

        form_Proveedores_003.para_Empezar;

        form_Proveedores_003.ShowModal;

        if form_Proveedores_003.public_Rgtro_Seleccionado = true then
        begin
            with form_Proveedores_003.SQLQuery_Proveedores_Contactos do
            begin
                Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                      '',
                                                      '',
                                                      FieldByName('nombre').AsString,
                                                      '',
                                                      '' );
            end;
        end;

        form_Proveedores_003.Free;
    end else begin
        var_msg := TStringList.Create;
        var_msg.Add(rs_Modulo_Abierto);
        UTI_GEN_Aviso(true, var_msg, 'AVISAMOS DE ... ', True, False);
        var_msg.Free;
        Exit;
    end;
end;

procedure Tform_vehiculos_001.Boton_Elegir_Aseguradora_ContactoClick(Sender: TObject);
begin
    Elegir_Datos_Propietario_Proveedor_Contacto('A');
end;

procedure Tform_vehiculos_001.FormCreate(Sender: TObject);
begin
    { ****************************************************************************
      Obligado en cada formulario para no olvidarlo
      **************************************************************************** }
      with Self do
      begin
          Color       := $00C2C29E;
          Position    := poScreenCenter;
          BorderIcons := [];
          BorderStyle := bsSingle;
      end;

      private_Salir_OK := false;

    { ****************************************************************************
      Solo para formularios que traten con datos
      **************************************************************************** }
      public_Solo_Ver := false;
end;

procedure Tform_vehiculos_001.para_Empezar;
begin
  { ****************************************************************************
    Solo para formularios que traten con datos
    **************************************************************************** }
    with form_vehiculos_000.SQLQuery_Vehiculos do
    begin
        public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                           '',
                                                           '',
                                                           FieldByName('matricula').AsString,
                                                           '',
                                                           '' );
    end;

    Presentar_Datos;

  { ****************************************************************************
    SOLO PARA ESTE FORM
    **************************************************************************** }
    PageControl_Otros_Datos.ActivePage := TabSheet_Datos_Tecnicos;
end;

procedure Tform_vehiculos_001.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg : TStrings;
begin
    ButtonPanel1.SetFocus; // Con esto consigo que salga del campo que este y pueda actualizarlo

    var_msg := TStringList.Create;

    if public_Pulso_Aceptar = true then
    begin
        with form_vehiculos_000.SQLQuery_Vehiculos do
        begin
            if Trim(FieldByName('matricula').AsString) = '' then
            begin
                var_msg.Add( '* La matrícula.');
            end;

            if Trim(FieldByName('id_combustibles').AsString) = '' then
            begin
                var_msg.Add( '* El tipo de combustible.');
            end;

            if Trim(FieldByName('id_vehiculos_marcas').AsString) = '' then
            begin
                var_msg.Add( '* La marca del vehículo.');
            end;

            if Trim(FieldByName('modelo').AsString) = '' then
            begin
                var_msg.Add( '* El modelo del vehículo.');
            end;

            if Trim(FieldByName('id_vehiculos_tipos').AsString) = '' then
            begin
                var_msg.Add( '* El tipo de vehículo.');
            end;

            if Trim(FieldByName('bastidor_chasis_VIN').AsString) = '' then
            begin
                var_msg.Add( '* El Nº.bastidor / chasis / VIN.');
            end;

            if Trim(FieldByName('tipo_propietario').AsString) = '' then
            begin
                var_msg.Add( '* El tipo de propietario.');
            end else begin
                if Trim(FieldByName('id_empresas_propietario').AsString) <> '' then
                begin
                    if Trim(FieldByName('referencia').AsString) = '' then
                    begin
                        var_msg.Add( '* Has elegido como tipo de propietario EMPRESA, así que el vehículo necesita una código/referencia.');
                    end;

                    if Trim(FieldByName('id_almacenes').AsString) = '' then
                    begin
                        var_msg.Add( '* Has elegido como tipo de propietario EMPRESA, así que el vehículo necesita una cochera o almacén donde ser guardado.');
                    end;
                end;
            end;

            if ( Trim(FieldByName('id_empresas_propietario').AsString) = '' )    and
               ( Trim(FieldByName('id_clientes_propietario').AsString) = '' )    and
               ( Trim(FieldByName('id_proveedores_propietario').AsString) = '' ) then
            begin
                var_msg.Add( '* El propietario.');
            end;
        end;
    end;

    if private_Salir_OK = False then
    begin
      { ********************************************************************
        Intento BitBtn_SALIR de la aplicación de un modo no permitido.
        ********************************************************************
        Pero si desde el menu principal está a true la variable
        public_Salir_Ok, significa que hay que salir si o si pues se pulsó
        cancelar al preguntar otra vez por la contraseña
        ******************************************************************** }
        if form_Menu.public_Salir_OK = False then
        begin
            CloseAction := TCloseAction.caNone;
        end;
    end else begin
      { ********************************************************************
        Fue correcto el modo como quiere salir de la aplicación
        ********************************************************************
        Comprobaremos si no se generó algún error por falta de completar
        algun campo y si se salió con el botón Ok o Cancel
        ******************************************************************** }
        if (Trim(var_msg.Text) <> '') and (public_Pulso_Aceptar = true) then
        begin
            UTI_GEN_Aviso(true, var_msg, rs_Falta, True, False);
            // var_msg.Free;
            CloseAction := TCloseAction.caNone;
        end else begin
            // var_msg.Free;
            CloseAction := caFree;
        end;
    end;

    var_msg.Free;
end;

procedure Tform_vehiculos_001.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := true;
end;

procedure Tform_vehiculos_001.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := false;
end;

procedure Tform_vehiculos_001.BitBtn_Propietario_SMSClick(Sender: TObject);
begin
    UTI_GEN_Enviar_SMS;
end;

procedure Tform_vehiculos_001.BitBtn_Aseguradora_SMSClick(Sender: TObject);
begin
    UTI_GEN_Enviar_SMS;
end;

procedure Tform_vehiculos_001.Presentar_Datos;
var var_Hora         : tTime;
    var_Dia          : tDate;
    var_Km_Ultimos   : TKm_Ultimos;
    var_valor_un_dia : Double;
    var_Ctdad_Dias   : Double;
    var_anos         : Double;
    var_resto_dias   : Double;
begin
    with form_vehiculos_000.SQLQuery_Vehiculos do
    begin
        // ***************************************************************************************** //
        // ** Primero traemos los ultimos km del vehiculo                                         ** //
        // ***************************************************************************************** //
        var_Km_Ultimos := Devolver_Vehiculo_Km_Ultimos(FieldByName('id').AsString);

        if var_Km_Ultimos.Fallo_en_Conexion_BD = false then
        begin
            Edit_Km_Ultimos_Ctdad.Text   := var_Km_Ultimos.km;
            Edit_Km_Ultimos_Fecha.Text   := var_Km_Ultimos.fecha;
            Edit_Km_Ultimos_Consumo.Text := var_Km_Ultimos.consumo_medio;
        end;

        // ***************************************************************************************** //
        // ** Ahora continuamos con los datos siguientes del vehículo                             ** //
        // ***************************************************************************************** //
        Edit_Descripcion_Tipo_Vehiculo.Text := FieldByName('OT_descripcion_vehiculos_tipos').AsString;
        Edit_Descripcion_Marca.Text         := FieldByName('OT_descripcion_vehiculos_marcas').AsString;

        var_valor_un_dia := (Date + 1) - Date;
        Edit_Edad.Text   := '';
        if not FieldByName('fecha_matriculacion_Primera').IsNull then
        begin
            var_Ctdad_Dias := Now - FieldByName('fecha_matriculacion_Primera').Value;
            var_Ctdad_Dias := Int(var_Ctdad_Dias / var_valor_un_dia);
            var_resto_dias := var_Ctdad_Dias;

            var_anos       := 0;
            if var_Ctdad_Dias >= 365 then
            begin
                var_anos := Int(var_Ctdad_Dias / 365);
                var_resto_dias := var_Ctdad_Dias - (var_anos * 365);
            end;

            Edit_Edad.Text := FloatToStr(var_anos) + ' a, ' +
                              FloatToStr(var_resto_dias) + ' d';
        end;

        Edit_Descripcion_Tipo_Combustible.Text        := FieldByName('OT_descripcion_combustibles').AsString;
        Edit_Descripcion_Tipo_Cambio.Text             := FieldByName('OT_descripcion_vehiculos_tipo_cambios').AsString;

        Edit_Descripcion_Conductor.Text               := FieldByName('OT_nombre_conductor_habitual').AsString;
        Edit_Descripcion_Conductor_NIF.Text           := FieldByName('OT_nif_cif_conductor_habitual').AsString;

        Edit_Descripcion_Tjta_Tte.Text                := FieldByName('OT_tarjeta_transporte_numero_tarjeta').AsString;
        Edit_Descripcion_Tjta_Tte_Ambito.Text         := FieldByName('OT_tarjeta_transporte_ambito').AsString;

        Edit_Descripcion_Comprado_a.Text              := FieldByName('OT_descripcion_comprado_a').AsString;

        Edit_Descripcion_Tipo_Neumaticos.Text         := FieldByName('OT_descripcion_vehiculos_tipo_ruedas').AsString;

        Edit_Descripcion_Almacen.Text                 := FieldByName('OT_descripcion_almacenes').AsString;

        Edit_Aseguradora_Razon_Social.Text            := FieldByName('OT_PROPIETARIO_ASEGURADORA_nombre_propietario').AsString;
        Edit_Aseguradora_Nombre_Comercial.Text        := FieldByName('OT_PROPIETARIO_ASEGURADORA_nombre_comercial').AsString;
        Edit_Aseguradora_NIF.Text                     := FieldByName('OT_PROPIETARIO_ASEGURADORA_nif_cif').AsString;
        Edit_Aseguradora_Direccion.Text               := FieldByName('OT_PROPIETARIO_ASEGURADORA_Direccion').AsString;
        Edit_Aseguradora_Direccion_Numero.Text        := FieldByName('OT_PROPIETARIO_ASEGURADORA_Direccion_Numero').AsString;
        Edit_Aseguradora_Direccion_Piso_Letra.Text    := FieldByName('OT_PROPIETARIO_ASEGURADORA_Direccion_Piso_Letra').AsString;
        Edit_Aseguradora_Direccion_Codigo_Postal.Text := FieldByName('OT_PROPIETARIO_ASEGURADORA_Codigo_Postal').AsString;
        Edit_Aseguradora_Direccion_Poblacion.Text     := FieldByName('OT_PROPIETARIO_ASEGURADORA_poblacion').AsString;
        Edit_Aseguradora_Direccion_Provincia.Text     := FieldByName('OT_PROPIETARIO_ASEGURADORA_provincia').AsString;
        Edit_Aseguradora_Direccion_Pais.Text          := FieldByName('OT_PROPIETARIO_ASEGURADORA_pais').AsString;
        Edit_Aseguradora_Direccion_Tfno_1.Text        := FieldByName('OT_PROPIETARIO_ASEGURADORA_Tfno_Fijo_1').AsString;
        Edit_Aseguradora_Direccion_Tfno_2.Text        := FieldByName('OT_PROPIETARIO_ASEGURADORA_Tfno_Fijo_2').AsString;
        Edit_Aseguradora_Direccion_FAX.Text           := FieldByName('OT_PROPIETARIO_ASEGURADORA_Tfno_FAX').AsString;
        Edit_Aseguradora_Direccion_Tfno_Movil.Text    := FieldByName('OT_PROPIETARIO_ASEGURADORA_Movil').AsString;

        Edit_Aseguradora_Contacto_Nombre.Text         := FieldByName('OT_PROPIETARIO_ASEGURADORA_CONTACTO_nombre').AsString;
        Edit_Aseguradora_Cargo_Puesto.Text            := FieldByName('OT_PROPIETARIO_ASEGURADORA_CONTACTO_Cargo_Puesto').AsString;
        Edit_Aseguradora_Contacto_Tfno_1.Text         := FieldByName('OT_PROPIETARIO_ASEGURADORA_CONTACTO_Tfno_Fijo_1').AsString;
        Edit_Aseguradora_Contacto_Tfno_2.Text         := FieldByName('OT_PROPIETARIO_ASEGURADORA_CONTACTO_Tfno_Fijo_2').AsString;
        Edit_Aseguradora_Contacto_FAX.Text            := FieldByName('OT_PROPIETARIO_ASEGURADORA_CONTACTO_FAX').AsString;
        Edit_Aseguradora_Contacto_Tfno_Movil.Text     := FieldByName('OT_PROPIETARIO_ASEGURADORA_CONTACTO_Movil').AsString;

        if Trim(FieldByName('tipo_propietario').asString) = '1' then
        begin
            Presentar_Datos_Propietario_Cliente;
        end;

        if Trim(FieldByName('tipo_propietario').asString) = '2' then
        begin
            Presentar_Datos_Propietario_Empresa;
        end;

        if Trim(FieldByName('tipo_propietario').asString) = '3' then
        begin
            Presentar_Datos_Propietario_Proveedor;
        end;
    end;
end;

procedure Tform_vehiculos_001.Presentar_Datos_Propietario_Empresa;
begin
    with form_vehiculos_000.SQLQuery_Vehiculos do
    begin
        Edit_Propietario_Razon_Social.Text            := FieldByName('OT_PROPIETARIO_EMPRESA_nombre_comercial').AsString;
        Edit_Propietario_Nombre_Comercial.Text        := '';
        Edit_Propietario_NIF.Text                     := FieldByName('OT_PROPIETARIO_EMPRESA_nif_cif').AsString;
        Edit_Propietario_Direccion.Text               := FieldByName('OT_PROPIETARIO_EMPRESA_Direccion').AsString;
        Edit_Propietario_Direccion_Numero.Text        := FieldByName('OT_PROPIETARIO_EMPRESA_Direccion_Numero').AsString;
        Edit_Propietario_Direccion_Piso_Letra.Text    := FieldByName('OT_PROPIETARIO_EMPRESA_Direccion_Piso_Letra').AsString;
        Edit_Propietario_Direccion_Codigo_Postal.Text := FieldByName('OT_PROPIETARIO_EMPRESA_Codigo_Postal').AsString;
        Edit_Propietario_Direccion_Poblacion.Text     := FieldByName('OT_PROPIETARIO_EMPRESA_poblacion').AsString;
        Edit_Propietario_Direccion_Provincia.Text     := FieldByName('OT_PROPIETARIO_EMPRESA_provincia').AsString;
        Edit_Propietario_Direccion_Pais.Text          := FieldByName('OT_PROPIETARIO_EMPRESA_pais').AsString;
        Edit_Propietario_Direccion_Tfno_1.Text        := FieldByName('OT_PROPIETARIO_EMPRESA_Tfno_Fijo_1').AsString;
        Edit_Propietario_Direccion_Tfno_2.Text        := FieldByName('OT_PROPIETARIO_EMPRESA_Tfno_Fijo_2').AsString;
        Edit_Propietario_Direccion_FAX.Text           := FieldByName('OT_PROPIETARIO_EMPRESA_Tfno_FAX').AsString;
        Edit_Propietario_Direccion_Tfno_Movil.Text    := FieldByName('OT_PROPIETARIO_EMPRESA_Movil').AsString;

        Edit_Propietario_Contacto_Nombre.Text         := FieldByName('OT_PROPIETARIO_EMPRESA_CONTACTO_nombre').AsString;
        Edit_Propietario_Contacto_Cargo_Puesto.Text   := '';
        Edit_Propietario_Contacto_Tfno_1.Text         := '';
        Edit_Propietario_Contacto_Tfno_2.Text         := '';
        Edit_Propietario_Contacto_FAX.Text            := '';
        Edit_Propietario_Contacto_Tfno_Movil.Text     := '';
    end;
end;

procedure Tform_vehiculos_001.Presentar_Datos_Propietario_Cliente;
begin
    with form_vehiculos_000.SQLQuery_Vehiculos do
    begin
        Edit_Propietario_Razon_Social.Text            := FieldByName('OT_PROPIETARIO_CLIENTE_nombre_propietario').AsString;
        Edit_Propietario_Nombre_Comercial.Text        := FieldByName('OT_PROPIETARIO_CLIENTE_nombre_comercial').AsString;
        Edit_Propietario_NIF.Text                     := FieldByName('OT_PROPIETARIO_CLIENTE_nif_cif').AsString;
        Edit_Propietario_Direccion.Text               := FieldByName('OT_PROPIETARIO_CLIENTE_Direccion').AsString;
        Edit_Propietario_Direccion_Numero.Text        := FieldByName('OT_PROPIETARIO_CLIENTE_Direccion_Numero').AsString;
        Edit_Propietario_Direccion_Piso_Letra.Text    := FieldByName('OT_PROPIETARIO_CLIENTE_Direccion_Piso_Letra').AsString;
        Edit_Propietario_Direccion_Codigo_Postal.Text := FieldByName('OT_PROPIETARIO_CLIENTE_Codigo_Postal').AsString;
        Edit_Propietario_Direccion_Poblacion.Text     := FieldByName('OT_PROPIETARIO_CLIENTE_poblacion').AsString;
        Edit_Propietario_Direccion_Provincia.Text     := FieldByName('OT_PROPIETARIO_CLIENTE_provincia').AsString;
        Edit_Propietario_Direccion_Pais.Text          := FieldByName('OT_PROPIETARIO_CLIENTE_pais').AsString;
        Edit_Propietario_Direccion_Tfno_1.Text        := FieldByName('OT_PROPIETARIO_CLIENTE_Tfno_Fijo_1').AsString;
        Edit_Propietario_Direccion_Tfno_2.Text        := FieldByName('OT_PROPIETARIO_CLIENTE_Tfno_Fijo_2').AsString;
        Edit_Propietario_Direccion_FAX.Text           := FieldByName('OT_PROPIETARIO_CLIENTE_Tfno_FAX').AsString;
        Edit_Propietario_Direccion_Tfno_Movil.Text    := FieldByName('OT_PROPIETARIO_CLIENTE_Movil').AsString;

        Edit_Propietario_Contacto_Nombre.Text         := FieldByName('OT_PROPIETARIO_CLIENTE_CONTACTO_nombre').AsString;
        Edit_Propietario_Contacto_Cargo_Puesto.Text   := FieldByName('OT_PROPIETARIO_CLIENTE_CONTACTO_Cargo_Puesto').AsString;
        Edit_Propietario_Contacto_Tfno_1.Text         := FieldByName('OT_PROPIETARIO_CLIENTE_CONTACTO_Tfno_Fijo_1').AsString;
        Edit_Propietario_Contacto_Tfno_2.Text         := FieldByName('OT_PROPIETARIO_CLIENTE_CONTACTO_Tfno_Fijo_2').AsString;
        Edit_Propietario_Contacto_FAX.Text            := FieldByName('OT_PROPIETARIO_CLIENTE_CONTACTO_FAX').AsString;
        Edit_Propietario_Contacto_Tfno_Movil.Text     := FieldByName('OT_PROPIETARIO_CLIENTE_CONTACTO_Movil').AsString;
    end;
end;

procedure Tform_vehiculos_001.Presentar_Datos_Propietario_Proveedor;
begin
    with form_vehiculos_000.SQLQuery_Vehiculos do
    begin
        Edit_Propietario_Razon_Social.Text            := FieldByName('OT_PROPIETARIO_COLABORADOR_nombre_propietario').AsString;
        Edit_Propietario_Nombre_Comercial.Text        := FieldByName('OT_PROPIETARIO_COLABORADOR_nombre_comercial').AsString;
        Edit_Propietario_NIF.Text                     := FieldByName('OT_PROPIETARIO_COLABORADOR_nif_cif').AsString;
        Edit_Propietario_Direccion.Text               := FieldByName('OT_PROPIETARIO_COLABORADOR_Direccion').AsString;
        Edit_Propietario_Direccion_Numero.Text        := FieldByName('OT_PROPIETARIO_COLABORADOR_Direccion_Numero').AsString;
        Edit_Propietario_Direccion_Piso_Letra.Text    := FieldByName('OT_PROPIETARIO_COLABORADOR_Direccion_Piso_Letra').AsString;
        Edit_Propietario_Direccion_Codigo_Postal.Text := FieldByName('OT_PROPIETARIO_COLABORADOR_Codigo_Postal').AsString;
        Edit_Propietario_Direccion_Poblacion.Text     := FieldByName('OT_PROPIETARIO_COLABORADOR_poblacion').AsString;
        Edit_Propietario_Direccion_Provincia.Text     := FieldByName('OT_PROPIETARIO_COLABORADOR_provincia').AsString;
        Edit_Propietario_Direccion_Pais.Text          := FieldByName('OT_PROPIETARIO_COLABORADOR_pais').AsString;
        Edit_Propietario_Direccion_Tfno_1.Text        := FieldByName('OT_PROPIETARIO_COLABORADOR_Tfno_Fijo_1').AsString;
        Edit_Propietario_Direccion_Tfno_2.Text        := FieldByName('OT_PROPIETARIO_COLABORADOR_Tfno_Fijo_2').AsString;
        Edit_Propietario_Direccion_FAX.Text           := FieldByName('OT_PROPIETARIO_COLABORADOR_Tfno_FAX').AsString;
        Edit_Propietario_Direccion_Tfno_Movil.Text    := FieldByName('OT_PROPIETARIO_COLABORADOR_Movil').AsString;

        Edit_Propietario_Contacto_Nombre.Text         := FieldByName('OT_PROPIETARIO_COLABORADOR_CONTACTO_nombre').AsString;
        Edit_Propietario_Contacto_Cargo_Puesto.Text   := FieldByName('OT_PROPIETARIO_COLABORADOR_CONTACTO_Cargo_Puesto').AsString;
        Edit_Propietario_Contacto_Tfno_1.Text         := FieldByName('OT_PROPIETARIO_COLABORADOR_CONTACTO_Tfno_Fijo_1').AsString;
        Edit_Propietario_Contacto_Tfno_2.Text         := FieldByName('OT_PROPIETARIO_COLABORADOR_CONTACTO_Tfno_Fijo_2').AsString;
        Edit_Propietario_Contacto_FAX.Text            := FieldByName('OT_PROPIETARIO_COLABORADOR_CONTACTO_FAX').AsString;
        Edit_Propietario_Contacto_Tfno_Movil.Text     := FieldByName('OT_PROPIETARIO_COLABORADOR_CONTACTO_Movil').AsString;
    end;
end;

procedure Tform_vehiculos_001.Refrescar_Registros;
begin
    form_vehiculos_000.Refrescar_Registros_Equipamiento;
end;

procedure Tform_vehiculos_001.RadioGroup_BajasClick(Sender: TObject);
begin
    //UTI_TB_Ver_Bajas_SN('um', Memo_Filtros.Lines, RadioGroup_Bajas.ItemIndex);
    Refrescar_Registros;
end;

procedure Tform_vehiculos_001.BitBtn_Ver_Situacion_Registro_Vehiculos_su_EquipamientoClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if form_vehiculos_000.SQLQuery_Vehiculos_su_Equipamiento.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'vehiculos_su_equipamiento',
                                           form_vehiculos_000.SQLQuery_Vehiculos_su_Equipamiento,
                                           form_vehiculos_000.DataSource_Vehiculos_su_Equipamiento,
                                           DBGrid_Vehiculos_su_Equipamiento );
        end;
    end;
end;

procedure Tform_vehiculos_001.DBGrid_Vehiculos_su_EquipamientoDblClick(Sender: TObject);
begin
    Editar_Vehiculos_Equipamiento;
end;

procedure Tform_vehiculos_001.DBGrid_Vehiculos_su_EquipamientoDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
var var_Color_Normal : TColor;
begin
    with Sender as TDBGrid do
    begin
        if form_vehiculos_000.SQLQuery_Vehiculos_su_Equipamiento.RecordCount = 0 then Exit;

        var_Color_Normal := Canvas.Brush.Color;

      { ************************************************************************
        Primero comprobamos si es un registro dado de baja o no
        ************************************************************************ }
        if not form_vehiculos_000.SQLQuery_Vehiculos_su_Equipamiento.FieldByName('Del_WHEN').IsNull then
        begin
          { ****************************************************************
            Registro DADO de BAJA
            **************************************************************** }
            Canvas.Font.Color := clSilver;
        end else begin
          { ****************************************************************
            Registro DADO de ALTA, NO BAJA
            ****************************************************************
            Así que las pinto, pero sólo si no son las columnas que van a
            ser dibujadas
            **************************************************************** }
            if State <> [gdSelected] then
            begin
                if (Column.FieldName <> 'COLUMNA_CON_IMAGEN') then
                begin
                    Canvas.font.Color := clBlack;
                end;
            end;
        end;

      { ************************************************************************
        Ahora paso a dibujar una celda normal con los colores elegidos o una
        dibujada
        ************************************************************************ }
        if (Column.FieldName <> 'COLUMNA_CON_IMAGEN') then
        begin
          { ****************************************************************
            No es una de las columnas a dibujar por lo que la pinto con los
            colores elegidos
            **************************************************************** }
            DefaultDrawColumnCell(Rect, DataCol, Column, State)
        end else begin
          { ****************************************************************
            Es una de las columnas a dibujar
            **************************************************************** }
            // COLUMNA CONFIRMADA
            if Column.FieldName = 'COLUMNA_CON_IMAGEN'  then
            begin
                {
                if Trim(form_vehiculos_000.SQLQuery_Vehiculos_su_Equipamiento.FieldByName('id_medio').asString) = '1' then
                begin
                    Canvas.StretchDraw(param_Rect, Image_Confirmado.Picture.Graphic);
                end;
                }
            end;
        end;

        Canvas.Font.Color := var_Color_Normal;
    end;
end;

procedure Tform_vehiculos_001.DBGrid_Vehiculos_su_EquipamientoKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then Editar_Vehiculos_Equipamiento;
end;

procedure Tform_vehiculos_001.DBNavigator_Vehiculos_su_EquipamientoBeforeAction(Sender: TObject;
    Button: TDBNavButtonType);
begin
    case Button of
        nbInsert : begin
            Insertar_Vehiculos_Equipamiento;
            Abort;
        end;

        nbEdit : begin
            Editar_Vehiculos_Equipamiento;
            Abort;
        end;

        nbDelete : begin
            Borrar_Vehiculos_Equipamiento;
            Abort;
        end;

        nbRefresh : begin
            form_vehiculos_000.Refrescar_Registros_Equipamiento;
            Abort;
        end;
    end;
end;

function Tform_vehiculos_001.Devolver_Vehiculo_Km_Ultimos(param_id_vehiculos : ShortString) : TKm_Ultimos;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
    try
        Result.Fallo_en_Conexion_BD := false;
        Result.km                   := '';
        Result.fecha                := '';
        Result.consumo_medio        := '';

        if Trim(param_id_vehiculos) <> '' then
        begin
            // ************************************************************************************* //
            // ** Creamos la Transaccion y la conexión con el motor BD, y la abrimos              ** //
            // ************************************************************************************* //
            var_SQLTransaction := TSQLTransaction.Create(nil);
            var_SQLConnector   := TSQLConnector.Create(nil);

            if UTI_CN_Connector_Open( var_SQLTransaction,
                                      var_SQLConnector ) = False then UTI_GEN_Salir;

            // ************************************************************************************* //
            // ** Creamos la SQL Según el motor de BD                                             ** //
            // ************************************************************************************* //
            var_SQL := TStringList.Create;

            var_SQL.Add('SELECT vkm.*' );
            var_SQL.Add(  'FROM vehiculos_km AS vkm' );
            var_SQL.Add(' WHERE vkm.id_vehiculos = ' + Trim(param_id_vehiculos) );
            var_SQL.Add(' ORDER BY vkm.id_vehiculos ASC, vkm.fecha DESC' );
            var_SQL.Add( 'LIMIT 1' );

            // UTI_GEN_Aviso(true, var_SQL, rs_No_Se_Puede, True, False);

            // ************************************************************************************* //
            // ** Abrimos la tabla                                                                ** //
            // ************************************************************************************* //
            var_SQLQuery      := TSQLQuery.Create(nil);
            var_SQLQuery.Name := 'SQLQuery_Devolver_Vehiculo_Km_Ultimos';

            if UTI_TB_Query_Open( '', '', '',
                                  var_SQLConnector,
                                  var_SQLQuery,
                                  -1, // asi me trae todos los registros de golpe
                                  var_SQL.Text ) = False then UTI_GEN_Salir;

            // ************************************************************************************* //
            // ** TRABAJAMOS CON LOS REGISTROS DEVUELTOS                                          ** //
            // ************************************************************************************* //
            // ** Si el módulo no se creó, no se permite entrar en él ... Result := False         ** //
            // ************************************************************************************* //
            if var_SQLQuery.RecordCount > 0 then
            begin
                Result.km            := var_SQLQuery.FieldByName('km').AsString;
                Result.fecha         := var_SQLQuery.FieldByName('fecha').AsString;
                Result.consumo_medio := var_SQLQuery.FieldByName('consumo_medio').AsString;
            end;

            // ************************************************************************************* //
            // ** Cerramos la tabla                                                               ** //
            // ************************************************************************************* //
            if UTI_TB_Cerrar( var_SQLConnector,
                              var_SQLTransaction,
                              var_SQLQuery ) = false then UTI_GEN_Salir;

            var_SQLQuery.Free;

            var_SQL.Free;

            var_SQLTransaction.Free;
            var_SQLConnector.Free;
        end;
    except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( 'Error al traer los km ultimos del vehículo con id (' + Trim(param_id_vehiculos) + ').' +
                               'La tabla ha sido ' + var_SQLQuery.Name + ' desde el módulo ' +
                               Screen.ActiveForm.Name,
                               error );
            try
                var_SQL.Free;
                var_SQLTransaction.Free;
                var_SQLConnector.Free;
                var_SQLQuery.Free;
            except
            end;

            Result.Fallo_en_Conexion_BD := true;
        end;
    end;
end;

procedure Tform_vehiculos_001.no_Tocar;
begin
    DBEdit_Codigo_Vehiculo.Enabled                       := False;
    DBEdit_Matricula.Enabled                             := False;
    Boton_Elegir_Tipo_Vehiculo.Enabled                   := False;
    Edit_Descripcion_Tipo_Vehiculo.Enabled               := False;
    Boton_Elegir_Marca.Enabled                           := False;
    Edit_Descripcion_Marca.Enabled                       := False;
    DBEdit_Modelo.Enabled                                := False;
    DBEdit_Version.Enabled                               := False;
    DBEdit_Color.Enabled                                 := False;
    DBEdit_Codigo_Color.Enabled                          := False;
    DBEdit_Bastidor.Enabled                              := False;
    DBEdit_No_Obra.Enabled                               := False;
    DBEdit_Carroceria.Enabled                            := False;
    DBEdit_Motor.Enabled                                 := False;
    DBDateTimePicker_Fecha_Matriculacion_Primera.Enabled := False;
    DBDateTimePicker_Fecha_Matriculacion_Ultima.Enabled  := False;
    Edit_Edad.Enabled                                    := False;
    DBEdit_Traccion.Enabled                              := False;
    DBEdit_Cilindrada.Enabled                            := False;
    DBEdit_Potencia.Enabled                              := False;
    DBEdit_Numero_Puertas.Enabled                        := False;
    DBDateTimePicker_Fecha_ITV_Ultima.Enabled            := False;

    TabSheet_Datos_Tecnicos.Enabled                      := False;
    TabSheet_Neumaticos.Enabled                          := False;
    TabSheet_Datos_Propietario.Enabled                   := False;
    TabSheet_Aseguradora.Enabled                         := False;
    TabSheet_Avisos.Enabled                              := False;

    DBMemo_Observaciones_Comentarios.Enabled             := False;

    Boton_Elegir_Conductor.Enabled                       := False;
    Edit_Descripcion_Conductor.Enabled                   := False;
    Boton_Elegir_Tarjeta_Transporte.Enabled              := False;
    Edit_Descripcion_Tjta_Tte.Enabled                    := False;
    Edit_Descripcion_Tjta_Tte_Ambito.Enabled             := False;
    GroupBox_Plazas.Enabled                              := False;
    Boton_Elegir_Comprado_a.Enabled                      := False;
    Edit_Descripcion_Comprado_a.Enabled                  := False;
    DBDateTimePicker_Fecha_Compra.Enabled                := False;
    DBMemo_Configuraciones_Especiales.Enabled            := False;
    DBCheckBox_Beneficiacio_Gasoleo_Profesional.Enabled  := False;
    DBCheckBox_Con_Tacografo_Digital.Enabled             := False;
end;

procedure Tform_vehiculos_001.FormActivate(Sender: TObject);
begin
    If form_vehiculos_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    Comprobar_No_Tocar(true, true);
end;

function Tform_vehiculos_001.Comprobar_No_Tocar( param_Reproducir_Mensajes,
                                                 param_Ejecutar_No_Tocar : Boolean ) : Boolean;
begin
    Result := false;

    // ********************************************************************************************* //
    // ** Si se llamó para solo verlo, pues no se puede tocar                                     ** //
    // ********************************************************************************************* //
    if public_Solo_Ver = true then
    begin
        Result := true;
        if param_Ejecutar_No_Tocar = true then no_Tocar;
    end;
end;

procedure Tform_vehiculos_001.Insertar_Vehiculos_Equipamiento;
var
  var_Campos_para_Existe_ya : Array of TCampos_para_Existe_ya;
  var_msg                   : TStrings;
  var_Form                  : Tform_vehiculos_002;
  var_record_Existe         : Trecord_Existe;

begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    with form_vehiculos_000.SQLQuery_Vehiculos_su_Equipamiento do
    begin
        var_msg := TStringList.Create;

        if UTI_USR_Permiso_SN(public_Menu_Worked, 'A', True) = True then
        begin
            if public_Solo_Ver = True then
            begin
                var_msg.Clear;
                var_msg.Add(rs_Solo_Visualizar);
                UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            end else begin
                Insert;

                FieldByName('id_vehiculos').AsString := form_vehiculos_000.SQLQuery_Vehiculos.FieldByName('id').AsString;

                var_Form := Tform_vehiculos_002.Create(nil);

                var_Form.para_Empezar;

                var_Form.ShowModal;
                if var_Form.public_Pulso_Aceptar = true then
                begin
                    var_Form.Free;

                    SetLength(var_Campos_para_Existe_ya, 2);

                    var_Campos_para_Existe_ya[0].Campo_Valor  := FieldByName('id_vehiculos').AsString;
                    var_Campos_para_Existe_ya[0].Campo_Nombre := 'id_vehiculos';
                    var_Campos_para_Existe_ya[0].Campo_Tipo   := 0; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                    var_Campos_para_Existe_ya[1].Campo_Valor  := FieldByName('id_vehiculos_equipamientos').AsString;
                    var_Campos_para_Existe_ya[1].Campo_Nombre := 'id_vehiculos_equipamientos';
                    var_Campos_para_Existe_ya[1].Campo_Tipo   := 0; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                    var_record_Existe := UTI_RGTRO_Existe_Ya( 'vehiculos_su_equipamiento',                                         // param_nombre_tabla
                                                              'ORDER BY vehiculos_su_equipamiento.id_vehiculos ASC, ' +
                                                                       'vehiculos_su_equipamiento.id_vehiculos_equipamientos ASC', // param_order_by
                                                              '',                                                                  // param_id_a_no_traer ... Estoy insertando
                                                              var_Campos_para_Existe_ya );                                         // param_Campos_para_Existe_ya

                    if var_record_Existe.Fallo_en_Conexion_BD = true then
                    begin
                        // var_Form.Free;
                        Cancel;
                    end else begin
                        if var_record_Existe.Existe = false then
                        begin
                            FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
                            FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                            UTI_RGTRO_Grabar_Antes( 'vehiculos_su_equipamiento',
                                                    form_vehiculos_000.SQLQuery_Vehiculos_su_Equipamiento );
                        end else begin
                            Cancel;
                            var_msg.Clear;

                            var_msg.Add( 'Equipamiento repetido para este vehículo.');

                            if UpperCase(var_record_Existe.deBaja) = 'S' then
                            begin
                                var_msg.Add(rs_Rgtro_Borrado);
                            end;

                            UTI_GEN_Aviso(true, var_msg, rs_Ya_Existe, True, False);
                        end;
                    end;
                end else begin
                    var_Form.Free;
                    Cancel;
                end;
            end;
        end;

        var_msg.Free;
    end;
end;

procedure Tform_vehiculos_001.Editar_Vehiculos_Equipamiento;
var
  var_Campos_para_Existe_ya : Array of TCampos_para_Existe_ya;
  var_msg                   : TStrings;
  var_Form                  : Tform_vehiculos_002;
  var_record_Existe         : Trecord_Existe;
  var_id                    : ShortString;

begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    with form_vehiculos_000.SQLQuery_Vehiculos_su_Equipamiento do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
        begin
            var_id := FieldByName('id').AsString;

            if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
            begin
                if UTI_RGTRO_isLock( 'vehiculos_su_equipamiento',
                                     FieldByName('id').AsString,
                                     true ) = true then
                begin
                    Exit;
                end else begin
                    if UTI_RGTRO_Lock( 'vehiculos_su_equipamiento',
                                       FieldByName('id').AsString ) = true then
                         Edit
                    else Exit;
                end;

                var_Form := Tform_vehiculos_002.Create(nil);

                var_Form.public_Menu_Worked := public_Menu_Worked;

                if public_Solo_Ver = true then
                begin
                    var_Form.public_Solo_Ver := true;
                end;

                var_Form.para_Empezar;

                var_Form.ShowModal;
                if var_Form.public_Pulso_Aceptar = true then
                begin
                    SetLength(var_Campos_para_Existe_ya, 2);

                    var_Campos_para_Existe_ya[0].Campo_Valor  := FieldByName('id_vehiculos').AsString;
                    var_Campos_para_Existe_ya[0].Campo_Nombre := 'id_vehiculos';
                    var_Campos_para_Existe_ya[0].Campo_Tipo   := 0; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                    var_Campos_para_Existe_ya[1].Campo_Valor  := FieldByName('id_vehiculos_equipamientos').AsString;
                    var_Campos_para_Existe_ya[1].Campo_Nombre := 'id_vehiculos_equipamientos';
                    var_Campos_para_Existe_ya[1].Campo_Tipo   := 0; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                    var_record_Existe := UTI_RGTRO_Existe_Ya( 'vehiculos_su_equipamiento',                                         // param_nombre_tabla
                                                              'ORDER BY vehiculos_su_equipamiento.id_vehiculos ASC, ' +
                                                                       'vehiculos_su_equipamiento.id_vehiculos_equipamientos ASC', // param_order_by
                                                              FieldByName('id').AsString,                                          // param_id_a_no_traer ... Estoy insertando
                                                              var_Campos_para_Existe_ya );                                         // param_Campos_para_Existe_ya

                    if var_record_Existe.Fallo_en_Conexion_BD = true then
                    begin
                        var_Form.Free;
                        Cancel;
                    end else begin
                        if var_record_Existe.Existe = false then
                        begin
                            if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( form_vehiculos_000.SQLQuery_Vehiculos_su_Equipamiento ) = true then
                            begin
                                FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                                FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                                UTI_RGTRO_Grabar_Antes( 'vehiculos_su_equipamiento',
                                                        form_vehiculos_000.SQLQuery_Vehiculos_su_Equipamiento );
                            end else begin
                                Cancel;
                            end;
                            var_Form.Free;
                        end else begin
                            var_Form.Free;
                            Cancel;
                            var_msg.Clear;
                            var_msg.Add( 'Equipamiento repetido para este vehículo.');

                            if UpperCase(var_record_Existe.deBaja) = 'S' then
                            begin
                                var_msg.Add(rs_Rgtro_Borrado);
                            end;

                            UTI_GEN_Aviso(true, var_msg, rs_Ya_Existe, True, False);
                        end;
                    end;
                end else begin
                    var_Form.Free;
                    Cancel;
                end;

                UTI_RGTRO_UnLock( 'vehiculos_su_equipamiento',
                                  var_id );
            end;
        end else begin
            var_msg.Add(rs_no_Hay_Rgtros);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        end;
    end;

    var_msg.Free;
end;

procedure Tform_vehiculos_001.Borrar_Vehiculos_Equipamiento;
begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    if UTI_USR_Permiso_SN(public_Menu_Worked, 'B', True) = True then
    begin
        UTI_RGTRO_Borrar( 'vehiculos_su_equipamiento',
                          form_vehiculos_000.SQLQuery_Vehiculos_su_Equipamiento,
                          public_Solo_Ver,
                          public_Menu_Worked );
    end;
end;

function Tform_vehiculos_001.Traer_Proveedores_xID( param_id : ShortString ) : TProveedores;
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
        var_SQLQuery.Name     := 'SQLQuery_Traer_Proveedores_xID';
        var_SQLQuery.Database := var_SQLConnector;

        { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
          y que por lo se debe de permitir modificarlos en ningún módulo }

        var_SQLQuery.SQL.Clear;
        var_SQLQuery.SQL.AddStrings( 'SELECT pr.*,' + ' ' +

                                            'act.descripcion AS OT_descripcion_actividad,' + ' ' +

                                            'pb.descripcion AS OT_descripcion_poblacion,' + ' ' +
                                            'prv.descripcion AS OT_descripcion_provincia,' + ' ' +
                                            'ps.descripcion AS OT_descripcion_pais,' + ' ' +

                                            'pt.descripcion AS OT_descripcion_proveedor_tipo,' + ' ' +
                                            'pt.Cuenta_Contable AS OT_Cuenta_Contable_proveedor_tipo,' + ' ' +


                                            'ct_pb.descripcion AS OT_Cta_Bco_descripcion_poblacion,' + ' ' +
                                            'ct_prv.descripcion AS OT_Cta_Bco_descripcion_provincia,' + ' ' +
                                            'ct_ps.descripcion AS OT_Cta_Bco_descripcion_pais,' + ' ' +

                                            'fp.descripcion AS OT_descripcion_forma_pago,' + ' ' +
                                            'fp.Vencimientos_Cantidad AS OT_Vencimientos_Cantidad,' + ' ' +
                                            'fp.Vencimientos_1_Dias AS OT_Vencimientos_1_Dias,' + ' ' +
                                            'fp.Vencimientos_Dias_Entre AS OT_Vencimientos_Dias_Entre,' + ' ' +

                                            'agprv.nombre_propietario AS OT_descripcion_agencia_transporte,' + ' ' +
                                            'agprv.Tfno_Fijo_1 AS OT_Tfno_Fijo_1_agencia_transporte,' + ' ' +
                                            'agprv.Movil AS OT_Movil_agencia_transporte' + ' ' +

                                     'FROM proveedores AS pr' + ' ' +

                                     'LEFT JOIN poblaciones AS pb' + ' ' +
                                     'ON pr.id_poblaciones = pb.id' + ' ' +

                                     'LEFT JOIN provincias AS prv' + ' ' +
                                     'ON pr.id_provincias = prv.id' + ' ' +

                                     'LEFT JOIN paises AS ps' + ' ' +
                                     'ON pr.id_paises = ps.id' + ' ' +

                                     'LEFT JOIN proveedores_tipos AS pt' + ' ' +
                                     'ON pr.id_proveedores_tipos = pt.id' + ' ' +

                                     'LEFT JOIN poblaciones AS ct_pb' + ' ' +
                                     'ON pr.id_Cta_Bco_poblaciones = ct_pb.id' + ' ' +

                                     'LEFT JOIN provincias AS ct_prv' + ' ' +
                                     'ON pr.id_Cta_Bco_provincias = ct_prv.id' + ' ' +

                                     'LEFT JOIN paises AS ct_ps' + ' ' +
                                     'ON pr.id_Cta_Bco_pais = ct_ps.id' + ' ' +

                                     'LEFT JOIN formas_pago AS fp' + ' ' +
                                     'ON pr.id_formas_pago = fp.id' + ' ' +

                                     'LEFT JOIN actividades AS act' + ' ' +
                                     'ON pr.id_actividades = act.id' + ' ' +

                                     'LEFT JOIN proveedores AS agprv' + ' ' +
                                     'ON pr.id_Agencias_Transporte = agprv.id' + ' ' );

        // ***************************************************************************************** //
        // ** Continuamos con la confección de la SQL                                             ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add( 'WHERE pr.id = ' + Trim(param_id) );
        var_SQLQuery.SQL.Add( 'ORDER BY pr.id ASC' );

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
                 Result.id                                := FieldByName('id').AsString;
                 Result.nombre_propietario                := FieldByName('nombre_propietario').AsString;
                 Result.nombre_comercial                  := FieldByName('nombre_comercial').AsString;
                 Result.nif_cif                           := FieldByName('nif_cif').AsString;
                 Result.Tfno_Fijo_1                       := FieldByName('Tfno_Fijo_1').AsString;
                 Result.Tfno_Fijo_2                       := FieldByName('Tfno_Fijo_2').AsString;
                 Result.FAX                               := FieldByName('FAX').AsString;
                 Result.Movil                             := FieldByName('Movil').AsString;
                 Result.eMail                             := FieldByName('eMail').AsString;
                 Result.pagina_web                        := FieldByName('pagina_web').AsString;
                 Result.Direccion                         := FieldByName('Direccion').AsString;
                 Result.Direccion_Numero                  := FieldByName('Direccion_Numero').AsString;
                 Result.Direccion_Piso_Letra              := FieldByName('Direccion_Piso_Letra').AsString;
                 Result.Codigo_Postal                     := FieldByName('Codigo_Postal').AsString;
                 Result.id_poblaciones                    := FieldByName('id_poblaciones').AsString;
                 Result.id_provincias                     := FieldByName('id_provincias').AsString;
                 Result.id_paises                         := FieldByName('id_paises').AsString;
                 Result.id_proveedores_tipos              := FieldByName('id_proveedores_tipos').AsString;
                 Result.Cta_Bco_Entidad                   := FieldByName('Cta_Bco_Entidad').AsString;
                 Result.Cta_Bco_Sucursal                  := FieldByName('Cta_Bco_Sucursal').AsString;
                 Result.Cta_Bco_Digito_Control            := FieldByName('Cta_Bco_Digito_Control').AsString;
                 Result.Cta_Bco_Cuenta                    := FieldByName('Cta_Bco_Cuenta').AsString;
                 Result.Cta_Bco_IBAN                      := FieldByName('Cta_Bco_IBAN').AsString;
                 Result.Cta_Bco_BIC_SWIFT                 := FieldByName('Cta_Bco_BIC_SWIFT').AsString;
                 Result.Cta_Bco_Mandato_Fecha_de_Firma    := FieldByName('Cta_Bco_Mandato_Fecha_de_Firma').AsString;
                 Result.Cta_Bco_Mandato_Ref               := FieldByName('Cta_Bco_Mandato_Ref').AsString;
                 Result.Cta_Bco_Direccion                 := FieldByName('Cta_Bco_Direccion').AsString;
                 Result.Cta_Bco_Direccion_Numero          := FieldByName('Cta_Bco_Direccion_Numero').AsString;
                 Result.Cta_Bco_Direccion_Piso_Letra      := FieldByName('Cta_Bco_Direccion_Piso_Letra').AsString;
                 Result.Cta_Bco_Codigo_Postal             := FieldByName('Cta_Bco_Codigo_Postal').AsString;
                 Result.id_Cta_Bco_poblaciones            := FieldByName('id_Cta_Bco_poblaciones').AsString;
                 Result.id_Cta_Bco_provincias             := FieldByName('id_Cta_Bco_provincias').AsString;
                 Result.id_Cta_Bco_pais                   := FieldByName('id_Cta_Bco_pais').AsString;
                 Result.id_formas_pago                    := FieldByName('id_formas_pago').AsString;
                 Result.Forma_pago_Dia_1                  := FieldByName('Forma_pago_Dia_1').AsString;
                 Result.Forma_pago_Dia_2                  := FieldByName('Forma_pago_Dia_2').AsString;
                 Result.Vencimientos_automaticos_SN       := FieldByName('Vencimientos_automaticos_SN').AsString;
                 Result.Forma_pago_Vacaciones_Dia_Inicio  := FieldByName('Forma_pago_Vacaciones_Dia_Inicio').AsString;
                 Result.Forma_pago_Vacaciones_Mes_Inicio  := FieldByName('Forma_pago_Vacaciones_Mes_Inicio').AsString;
                 Result.Forma_pago_Vacaciones_Dia_Fin     := FieldByName('Forma_pago_Vacaciones_Dia_Fin').AsString;
                 Result.Forma_pago_Vacaciones_Mes_Fin     := FieldByName('Forma_pago_Vacaciones_Mes_Fin').AsString;
                 Result.IVA_con_Recargo_SN                := FieldByName('IVA_con_Recargo_SN').AsString;
                 Result.IVA_Excluido_SN                   := FieldByName('IVA_Excluido_SN').AsString;
                 Result.Descuento_Linea                   := FieldByName('Descuento_Linea').AsString;
                 Result.Descuento_Comercial_1             := FieldByName('Descuento_Comercial_1').AsString;
                 Result.Descuento_Comercial_2             := FieldByName('Descuento_Comercial_2').AsString;
                 Result.Descuento_Pronto_Pago             := FieldByName('Descuento_Pronto_Pago').AsString;
                 Result.Descuento_Final                   := FieldByName('Descuento_Final').AsString;
                 Result.Retencion                         := FieldByName('Retencion').AsString;
                 Result.Cuenta_Contable                   := FieldByName('Cuenta_Contable').AsString;
                 Result.id_Agencias_Transporte            := FieldByName('id_Agencias_Transporte').AsString;
                 Result.Observaciones_Comentarios         := FieldByName('Observaciones_Comentarios').AsString;

                 Result.Insert_WHEN                       := FieldByName('Insert_WHEN').AsString;
                 Result.Insert_Id_User                    := FieldByName('Insert_Id_User').AsString;
                 Result.Del_WHEN                          := FieldByName('Del_WHEN').AsString;
                 Result.Del_Id_User                       := FieldByName('Del_Id_User').AsString;
                 Result.Del_WHY                           := FieldByName('Del_WHY').AsString;
                 Result.Change_WHEN                       := FieldByName('Change_WHEN').AsString;
                 Result.Change_Id_User                    := FieldByName('Change_Id_User').AsString;

                 Result.OT_descripcion_poblacion          := FieldByName('OT_descripcion_poblacion').AsString;
                 Result.OT_descripcion_provincia          := FieldByName('OT_descripcion_provincia').AsString;
                 Result.OT_descripcion_pais               := FieldByName('OT_descripcion_pais').AsString;

                 Result.OT_descripcion_proveedor_tipo     := FieldByName('OT_descripcion_proveedor_tipo').AsString;
                 Result.OT_Cuenta_Contable_proveedor_tipo := FieldByName('OT_Cuenta_Contable_proveedor_tipo').AsString;

                 Result.OT_Cta_Bco_descripcion_poblacion  := FieldByName('OT_Cta_Bco_descripcion_poblacion').AsString;
                 Result.OT_Cta_Bco_descripcion_provincia  := FieldByName('OT_Cta_Bco_descripcion_provincia').AsString;
                 Result.OT_Cta_Bco_descripcion_pais       := FieldByName('OT_Cta_Bco_descripcion_pais').AsString;

                 Result.OT_descripcion_forma_pago         := FieldByName('OT_descripcion_forma_pago').AsString;
                 Result.OT_Vencimientos_Cantidad          := FieldByName('OT_Vencimientos_Cantidad').AsString;
                 Result.OT_Vencimientos_1_Dias            := FieldByName('OT_Vencimientos_1_Dias').AsString;
                 Result.OT_Vencimientos_Dias_Entre        := FieldByName('OT_Vencimientos_Dias_Entre').AsString;

                 Result.OT_descripcion_agencia_transporte := FieldByName('OT_descripcion_agencia_transporte').AsString;
                 Result.OT_Tfno_Fijo_1_agencia_transporte := FieldByName('OT_Tfno_Fijo_1_agencia_transporte').AsString;
                 Result.OT_Movil_agencia_transporte       := FieldByName('OT_Movil_agencia_transporte').AsString;
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
            UTI_GEN_Error_Log( 'Ocurrió un error al intentar traer todos los datos del proveedor con' +
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

function Tform_vehiculos_001.Traer_Clientes_xID( param_id : ShortString ) : TClientes;
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
        var_SQLQuery.Name     := 'SQLQuery_Traer_Clientes_xID';
        var_SQLQuery.Database := var_SQLConnector;

        // ***************************************************************************************** //
        // ** Creamos la SQL                                                                      ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Clear;
        var_SQLQuery.SQL.AddStrings( 'SELECT cl.*,' + ' ' +

                                            'act.descripcion AS OT_descripcion_actividad,' + ' ' +
                                            'rt.descripcion AS OT_descripcion_ruta,' + ' ' +

                                            'pb.descripcion AS OT_descripcion_poblacion,' + ' ' +
                                            'pr.descripcion AS OT_descripcion_provincia,' + ' ' +
                                            'ps.descripcion AS OT_descripcion_pais,' + ' ' +

                                            'ct.descripcion AS OT_descripcion_cliente_tipo,' + ' ' +
                                            'ct.Cuenta_Contable AS OT_Cuenta_Contable_cliente_tipo,' + ' ' +

                                            'ct_pb.descripcion AS OT_Cta_Bco_descripcion_poblacion,' + ' ' +
                                            'ct_pr.descripcion AS OT_Cta_Bco_descripcion_provincia,' + ' ' +
                                            'ct_ps.descripcion AS OT_Cta_Bco_descripcion_pais,' + ' ' +

                                            'fp.descripcion AS OT_descripcion_forma_pago,' + ' ' +
                                            'fp.Vencimientos_Cantidad AS OT_Vencimientos_Cantidad,' + ' ' +
                                            'fp.Vencimientos_1_Dias AS OT_Vencimientos_1_Dias,' + ' ' +
                                            'fp.Vencimientos_Dias_Entre AS OT_Vencimientos_Dias_Entre,' + ' ' +

                                            'tf.descripcion AS OT_descripcion_tarifa,' + ' ' +

                                            'prv.nombre_propietario AS OT_descripcion_agencia_transporte,' + ' ' +
                                            'prv.Tfno_Fijo_1 AS OT_Tfno_Fijo_1_agencia_transporte,' + ' ' +
                                            'prv.Movil AS OT_Movil_agencia_transporte,' + ' ' +

                                            'rp.nombre_propietario AS OT_descripcion_representante,' + ' ' +
                                            'rp.Tfno_Fijo_1 AS OT_Tfno_Fijo_1_representante,' + ' ' +
                                            'rp.Movil AS OT_Movil_representante' + ' ' +

                                     'FROM clientes AS cl' + ' ' +

                                     'LEFT JOIN poblaciones AS pb' + ' ' +
                                     'ON cl.id_poblaciones = pb.id' + ' ' +

                                     'LEFT JOIN provincias AS pr' + ' ' +
                                     'ON cl.id_provincias = pr.id' + ' ' +

                                     'LEFT JOIN paises AS ps' + ' ' +
                                     'ON cl.id_paises = ps.id' + ' ' +

                                     'LEFT JOIN clientes_tipos AS ct' + ' ' +
                                     'ON cl.id_clientes_tipos = ct.id' + ' ' +

                                     'LEFT JOIN poblaciones AS ct_pb' + ' ' +
                                     'ON cl.id_Cta_Bco_poblaciones = ct_pb.id' + ' ' +

                                     'LEFT JOIN provincias AS ct_pr' + ' ' +
                                     'ON cl.id_Cta_Bco_provincias = ct_pr.id' + ' ' +

                                     'LEFT JOIN paises AS ct_ps' + ' ' +
                                     'ON cl.id_Cta_Bco_pais = ct_ps.id' + ' ' +

                                     'LEFT JOIN formas_pago AS fp' + ' ' +
                                     'ON cl.id_formas_pago = fp.id' + ' ' +

                                     'LEFT JOIN tarifas AS tf' + ' ' +
                                     'ON cl.id_tarifas = tf.id' + ' ' +

                                     'LEFT JOIN proveedores AS prv' + ' ' +
                                     'ON cl.id_Agencias_Transporte = prv.id' + ' ' +

                                     'LEFT JOIN actividades AS act' + ' ' +
                                     'ON cl.id_actividades = act.id' + ' ' +

                                     'LEFT JOIN rutas AS rt' + ' ' +
                                     'ON cl.id_rutas = rt.id' + ' ' +

                                     'LEFT JOIN representantes AS rp' + ' ' +
                                     'ON cl.id_Representantes = rp.id' + ' ' );

        // ***************************************************************************************** //
        // ** Continuamos con la confección de la SQL                                             ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add( 'WHERE cl.id = ' + Trim(param_id) );
        var_SQLQuery.SQL.Add( 'ORDER BY cl.id ASC' );

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
                 Result.id                                := FieldByName('id').AsString;
                 Result.nombre_propietario                := FieldByName('nombre_propietario').AsString;
                 Result.nombre_comercial                  := FieldByName('nombre_comercial').AsString;
                 Result.nif_cif                           := FieldByName('nif_cif').AsString;
          	 Result.Fecha_Nacimiento                  := FieldByName('Fecha_Nacimiento').AsString;
                 Result.Tfno_Fijo_1                       := FieldByName('Tfno_Fijo_1').AsString;
                 Result.Tfno_Fijo_2                       := FieldByName('Tfno_Fijo_2').AsString;
                 Result.FAX                               := FieldByName('FAX').AsString;
                 Result.Movil                             := FieldByName('Movil').AsString;
                 Result.eMail                             := FieldByName('eMail').AsString;
                 Result.pagina_web                        := FieldByName('pagina_web').AsString;
                 Result.Direccion                         := FieldByName('Direccion').AsString;
                 Result.Direccion_Numero                  := FieldByName('Direccion_Numero').AsString;
                 Result.Direccion_Piso_Letra              := FieldByName('Direccion_Piso_Letra').AsString;
                 Result.Codigo_Postal                     := FieldByName('Codigo_Postal').AsString;
                 Result.id_poblaciones                    := FieldByName('id_poblaciones').AsString;
                 Result.id_provincias                     := FieldByName('id_provincias').AsString;
                 Result.id_paises                         := FieldByName('id_paises').AsString;
                 Result.id_clientes_tipos                 := FieldByName('id_clientes_tipos').AsString;
                 Result.Cta_Bco_Entidad                   := FieldByName('Cta_Bco_Entidad').AsString;
                 Result.Cta_Bco_Sucursal                  := FieldByName('Cta_Bco_Sucursal').AsString;
                 Result.Cta_Bco_Digito_Control            := FieldByName('Cta_Bco_Digito_Control').AsString;
                 Result.Cta_Bco_Cuenta                    := FieldByName('Cta_Bco_Cuenta').AsString;
                 Result.Cta_Bco_IBAN                      := FieldByName('Cta_Bco_IBAN').AsString;
                 Result.Cta_Bco_BIC_SWIFT                 := FieldByName('Cta_Bco_BIC_SWIFT').AsString;
                 Result.Cta_Bco_Mandato_Fecha_de_Firma    := FieldByName('Cta_Bco_Mandato_Fecha_de_Firma').AsString;
                 Result.Cta_Bco_Mandato_Ref               := FieldByName('Cta_Bco_Mandato_Ref').AsString;
                 Result.Cta_Bco_Direccion                 := FieldByName('Cta_Bco_Direccion').AsString;
                 Result.Cta_Bco_Direccion_Numero          := FieldByName('Cta_Bco_Direccion_Numero').AsString;
                 Result.Cta_Bco_Direccion_Piso_Letra      := FieldByName('Cta_Bco_Direccion_Piso_Letra').AsString;
                 Result.Cta_Bco_Codigo_Postal             := FieldByName('Cta_Bco_Codigo_Postal').AsString;
                 Result.id_Cta_Bco_poblaciones            := FieldByName('id_Cta_Bco_poblaciones').AsString;
                 Result.id_Cta_Bco_provincias             := FieldByName('id_Cta_Bco_provincias').AsString;
                 Result.id_Cta_Bco_pais                   := FieldByName('id_Cta_Bco_pais').AsString;
                 Result.id_formas_pago                    := FieldByName('id_formas_pago').AsString;
                 Result.Forma_pago_Dia_1                  := FieldByName('Forma_pago_Dia_1').AsString;
                 Result.Forma_pago_Dia_2                  := FieldByName('Forma_pago_Dia_2').AsString;
                 Result.Vencimientos_automaticos_SN       := FieldByName('Vencimientos_automaticos_SN').AsString;
                 Result.Forma_pago_Vacaciones_Dia_Inicio  := FieldByName('Forma_pago_Vacaciones_Dia_Inicio').AsString;
                 Result.Forma_pago_Vacaciones_Mes_Inicio  := FieldByName('Forma_pago_Vacaciones_Mes_Inicio').AsString;
                 Result.Forma_pago_Vacaciones_Dia_Fin     := FieldByName('Forma_pago_Vacaciones_Dia_Fin').AsString;
                 Result.Forma_pago_Vacaciones_Mes_Fin     := FieldByName('Forma_pago_Vacaciones_Mes_Fin').AsString;
                 Result.IVA_con_Recargo_SN                := FieldByName('IVA_con_Recargo_SN').AsString;
                 Result.IVA_Excluido_SN                   := FieldByName('IVA_Excluido_SN').AsString;
                 Result.id_tarifas                        := FieldByName('id_tarifas').AsString;
                 Result.Descuento_Comercial_1             := FieldByName('Descuento_Comercial_1').AsString;
                 Result.Descuento_Comercial_2             := FieldByName('Descuento_Comercial_2').AsString;
                 Result.Descuento_Pronto_Pago             := FieldByName('Descuento_Pronto_Pago').AsString;
                 Result.Descuento_Final                   := FieldByName('Descuento_Final').AsString;
                 Result.Retencion                         := FieldByName('Retencion').AsString;
                 Result.Riesgo_Autorizado                 := FieldByName('Riesgo_Autorizado').AsString;
                 Result.Riesgo_Acumulado                  := FieldByName('Riesgo_Acumulado').AsString;
                 Result.Agrupar_Albaranes_SN              := FieldByName('Agrupar_Albaranes_SN').AsString;
                 Result.Activar_Proximidad_SN             := FieldByName('Activar_Proximidad_SN').AsString;
                 Result.Cuenta_Contable                   := FieldByName('Cuenta_Contable').AsString;
                 Result.id_Agencias_Transporte            := FieldByName('id_Agencias_Transporte').AsString;
                 Result.Portes_Pagados_SN                 := FieldByName('Portes_Pagados_SN').AsString;
                 Result.id_Representantes                 := FieldByName('id_Representantes').AsString;
                 Result.Observaciones_Comentarios         := FieldByName('Observaciones_Comentarios').AsString;
                 Result.Estudia_SN                        := FieldByName('Estudia_SN').AsString;
                 Result.Trabaja_SN                        := FieldByName('Trabaja_SN').AsString;
                 Result.Estudios_Trabajos                 := FieldByName('Estudios_Trabajos').AsString;
                 Result.Cantidad_Hermanos                 := FieldByName('Cantidad_Hermanos').AsString;
                 Result.id_rutas                          := FieldByName('id_rutas').AsString;
                 Result.id_actividades                    := FieldByName('id_actividades').AsString;

                 Result.Insert_WHEN                       := FieldByName('Insert_WHEN').AsString;
                 Result.Insert_Id_User                    := FieldByName('Insert_Id_User').AsString;
                 Result.Del_WHEN                          := FieldByName('Del_WHEN').AsString;
                 Result.Del_Id_User                       := FieldByName('Del_Id_User').AsString;
                 Result.Del_WHY                           := FieldByName('Del_WHY').AsString;
                 Result.Change_WHEN                       := FieldByName('Change_WHEN').AsString;
                 Result.Change_Id_User                    := FieldByName('Change_Id_User').AsString;

                 Result.OT_descripcion_actividad          := FieldByName('OT_descripcion_actividad').AsString;
                 Result.OT_descripcion_ruta               := FieldByName('OT_descripcion_ruta').AsString;
                 Result.OT_descripcion_poblacion          := FieldByName('OT_descripcion_poblacion').AsString;
                 Result.OT_descripcion_provincia          := FieldByName('OT_descripcion_provincia').AsString;
                 Result.OT_descripcion_pais               := FieldByName('OT_descripcion_pais').AsString;
                 Result.OT_descripcion_cliente_tipo       := FieldByName('OT_descripcion_cliente_tipo').AsString;
                 Result.OT_Cuenta_Contable_cliente_tipo   := FieldByName('OT_Cuenta_Contable_cliente_tipo').AsString;
                 Result.OT_Cta_Bco_descripcion_poblacion  := FieldByName('OT_Cta_Bco_descripcion_poblacion').AsString;
                 Result.OT_Cta_Bco_descripcion_provincia  := FieldByName('OT_Cta_Bco_descripcion_provincia').AsString;
                 Result.OT_Cta_Bco_descripcion_pais       := FieldByName('OT_Cta_Bco_descripcion_pais').AsString;
                 Result.OT_descripcion_forma_pago         := FieldByName('OT_descripcion_forma_pago').AsString;
                 Result.OT_Vencimientos_Cantidad          := FieldByName('OT_Vencimientos_Cantidad').AsString;
                 Result.OT_Vencimientos_1_Dias            := FieldByName('OT_Vencimientos_1_Dias').AsString;
                 Result.OT_Vencimientos_Dias_Entre        := FieldByName('OT_Vencimientos_Dias_Entre').AsString;

                 Result.OT_descripcion_tarifa             := FieldByName('OT_descripcion_tarifa').AsString;
                 Result.OT_descripcion_agencia_transporte := FieldByName('OT_descripcion_agencia_transporte').AsString;
                 Result.OT_Tfno_Fijo_1_agencia_transporte := FieldByName('OT_Tfno_Fijo_1_agencia_transporte').AsString;
                 Result.OT_Movil_agencia_transporte       := FieldByName('OT_Movil_agencia_transporte').AsString;
                 Result.OT_descripcion_representante      := FieldByName('OT_descripcion_representante').AsString;
                 Result.OT_Tfno_Fijo_1_representante      := FieldByName('OT_Tfno_Fijo_1_representante').AsString;
                 Result.OT_Movil_representante            := FieldByName('OT_Movil_representante').AsString;
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
            UTI_GEN_Error_Log( 'Ocurrió un error al intentar traer todos los datos del cliente con' +
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

function Tform_vehiculos_001.Traer_Clientes_Contactos_xID( param_id : ShortString ) : TClientes_Contactos;
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
        var_SQLQuery.Name     := 'SQLQuery_Traer_Clientes_Contactos_xID';
        var_SQLQuery.Database := var_SQLConnector;

        // ***************************************************************************************** //
        // ** Creamos la SQL                                                                      ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Clear;
        var_SQLQuery.SQL.AddStrings( 'SELECT cc.*' + ' ' +
                                     'FROM clientes_contactos AS cc' + ' ' );

        // ***************************************************************************************** //
        // ** Continuamos con la confección de la SQL                                             ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add( 'WHERE cc.id = ' + Trim(param_id) );
        var_SQLQuery.SQL.Add( 'ORDER BY cc.id ASC' );

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
                 Result.id               := FieldByName('id').AsString;
                 Result.id_clientes      := FieldByName('id_clientes').AsString;
                 Result.nombre           := FieldByName('nombre').AsString;
                 Result.nif_cif          := FieldByName('nif_cif').AsString;
                 Result.Fecha_Nacimiento := FieldByName('Fecha_Nacimiento').AsString;
                 Result.Tfno_Fijo_1      := FieldByName('Tfno_Fijo_1').AsString;
                 Result.Tfno_Fijo_2      := FieldByName('Tfno_Fijo_2').AsString;
                 Result.FAX              := FieldByName('FAX').AsString;
                 Result.Movil            := FieldByName('Movil').AsString;
                 Result.eMail            := FieldByName('eMail').AsString;
                 Result.pagina_web       := FieldByName('pagina_web').AsString;
                 Result.Cargo_Puesto     := FieldByName('Cargo_Puesto').AsString;

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
            UTI_GEN_Error_Log( 'Ocurrió un error al intentar traer todos los datos del contacto' +
                               ' de clientes con la id ' + Trim(param_id) + '. La tabla ha sido ' +
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

function Tform_vehiculos_001.Traer_Proveedores_Contactos_xID( param_id : ShortString ) : TProveedores_Contactos;
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
        var_SQLQuery.Name     := 'SQLQuery_Traer_Proveedores_Contactos_xID';
        var_SQLQuery.Database := var_SQLConnector;

        // ***************************************************************************************** //
        // ** Creamos la SQL                                                                      ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Clear;
        var_SQLQuery.SQL.AddStrings( 'SELECT prc.*' + ' ' +
                                     'FROM proveedores_contactos AS prc' + ' ' );

        // ***************************************************************************************** //
        // ** Continuamos con la confección de la SQL                                             ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add( 'WHERE prc.id = ' + Trim(param_id) );
        var_SQLQuery.SQL.Add( 'ORDER BY prc.id ASC' );

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
                 Result.id               := FieldByName('id').AsString;
                 Result.id_proveedores   := FieldByName('id_proveedores').AsString;
                 Result.nombre           := FieldByName('nombre').AsString;
                 Result.nif_cif          := FieldByName('nif_cif').AsString;
                 Result.Fecha_Nacimiento := FieldByName('Fecha_Nacimiento').AsString;
                 Result.Tfno_Fijo_1      := FieldByName('Tfno_Fijo_1').AsString;
                 Result.Tfno_Fijo_2      := FieldByName('Tfno_Fijo_2').AsString;
                 Result.FAX              := FieldByName('FAX').AsString;
                 Result.Movil            := FieldByName('Movil').AsString;
                 Result.eMail            := FieldByName('eMail').AsString;
                 Result.pagina_web       := FieldByName('pagina_web').AsString;
                 Result.Cargo_Puesto     := FieldByName('Cargo_Puesto').AsString;

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
            UTI_GEN_Error_Log( 'Ocurrió un error al intentar traer todos los datos del contacto' +
                               ' de proveedores con la id ' + Trim(param_id) + '. La tabla ha sido ' +
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

