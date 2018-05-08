unit vehiculos_000;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs, Grids, ComCtrls,
  Buttons, StdCtrls, DbCtrls, ExtCtrls, DBGrids, utilidades_bd, utilidades_rgtro, variants,
  utilidades_datos_tablas, utilidades_forms_Filtrar, utilidades_general, utilidades_usuarios;

type

  { Tform_vehiculos_000 }

  Tform_vehiculos_000 = class(TForm)
    BitBtn_Filtrar: TBitBtn;
    BitBtn_Imprimir: TBitBtn;
    BitBtn_SALIR: TBitBtn;
    BitBtn_Seleccionar: TBitBtn;
    BitBtn_Ver_Situacion_Registro: TBitBtn;
    Boton_Elegir_id_proveedores_aseguradora: TBitBtn;
    Boton_Elegir_id_vehiculos_tipo_ruedas: TBitBtn;
    Boton_Elegir_Propietario: TBitBtn;
    Boton_Elegir_id_vehiculos_tipos: TBitBtn;
    Boton_Elegir_id_personal_conductor_habitual: TBitBtn;
    Boton_Elegir_id_combustibles: TBitBtn;
    Boton_Elegir_id_tarjetas_transporte: TBitBtn;
    Boton_Elegir_id_vehiculos_tipo_cambios: TBitBtn;
    Boton_Elegir_id_vehiculos_marcas: TBitBtn;
    ComboBox_Filtros: TComboBox;
    ComboBox_Tipo_Propietario: TComboBox;
    DataSource_Vehiculos: TDataSource;
    DataSource_Vehiculos_su_Equipamiento: TDataSource;
    DBGrid_Principal: TDBGrid;
    DBNavigator1: TDBNavigator;
    Edit_Descripcion_id_proveedores_aseguradora: TEdit;
    Edit_Descripcion_id_vehiculos_tipo_ruedas: TEdit;
    Edit_Descripcion_Propietario: TEdit;
    Edit_Descripcion_id_vehiculos_tipos: TEdit;
    Edit_Descripcion_id_personal_conductor_habitual: TEdit;
    Edit_Descripcion_id_combustibles: TEdit;
    Edit_Descripcion_id_tarjetas_transporte: TEdit;
    Edit_Descripcion_id_vehiculos_tipo_cambios: TEdit;
    Edit_Descripcion_id_vehiculos_marcas: TEdit;
    Edit_id_proveedores_aseguradora: TEdit;
    Edit_id_vehiculos_tipo_ruedas: TEdit;
    Edit_Propietario: TEdit;
    Edit_id_vehiculos_tipos: TEdit;
    Edit_id_personal_conductor_habitual: TEdit;
    Edit_id_combustibles: TEdit;
    Edit_id_tarjetas_transporte: TEdit;
    Edit_id_vehiculos_tipo_cambios: TEdit;
    Edit_id_vehiculos_marcas: TEdit;
    Image_Confirmado: TImage;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label_Ctdad_Rgtros: TLabel;
    Label_Fecha2: TLabel;
    Memo_Filtros: TMemo;
    Memo_OrderBy: TMemo;
    PageControl_Filtros: TPageControl;
    RadioGroup_Bajas: TRadioGroup;
    Shape1: TShape;
    SQLQuery_Vehiculos: TSQLQuery;
    SQLQuery_Vehiculosaceite_motor: TStringField;
    SQLQuery_Vehiculosaceite_valvulina: TStringField;
    SQLQuery_VehiculosAire_Acondicionado_Marca: TStringField;
    SQLQuery_VehiculosAire_Acondicionado_Numero_Compresor_Actual: TStringField;
    SQLQuery_VehiculosAire_Acondicionado_Numero_Compresor_Original: TStringField;
    SQLQuery_VehiculosAire_Acondicionado_Numero_Serie: TStringField;
    SQLQuery_VehiculosAire_Acondicionado_Tipo_Gas: TStringField;
    SQLQuery_Vehiculosbastidor_chasis_VIN: TStringField;
    SQLQuery_Vehiculoscarroceria: TStringField;
    SQLQuery_VehiculosChange_Id_User: TLargeintField;
    SQLQuery_VehiculosChange_WHEN: TDateTimeField;
    SQLQuery_VehiculosCilindrada: TStringField;
    SQLQuery_Vehiculoscodigo_color: TStringField;
    SQLQuery_Vehiculoscodigo_llave: TStringField;
    SQLQuery_Vehiculoscodigo_radio: TStringField;
    SQLQuery_Vehiculoscolor: TStringField;
    SQLQuery_VehiculosConfiguraciones_Especiales: TStringField;
    SQLQuery_VehiculosDel_Id_User: TLargeintField;
    SQLQuery_VehiculosDel_WHEN: TDateTimeField;
    SQLQuery_VehiculosDel_WHY: TStringField;
    SQLQuery_Vehiculosfecha_fabricacion: TDateTimeField;
    SQLQuery_Vehiculosfecha_matriculacion_Primera: TDateTimeField;
    SQLQuery_Vehiculosfecha_matriculacion_Ultima: TDateTimeField;
    SQLQuery_Vehiculosfiltro_aceite: TStringField;
    SQLQuery_Vehiculosfiltro_aire: TStringField;
    SQLQuery_Vehiculosfiltro_antipo_polen: TStringField;
    SQLQuery_Vehiculosfiltro_combustible: TStringField;
    SQLQuery_Vehiculosfiltro_habitaculo: TStringField;
    SQLQuery_VehiculosFrenos_Delanteros: TStringField;
    SQLQuery_VehiculosFrenos_Traseros: TStringField;
    SQLQuery_Vehiculosid: TLargeintField;
    SQLQuery_Vehiculosid_almacenes: TLargeintField;
    SQLQuery_Vehiculosid_clientes_propietario: TLargeintField;
    SQLQuery_Vehiculosid_clientes_propietario_contacto: TLargeintField;
    SQLQuery_Vehiculosid_combustibles: TLargeintField;
    SQLQuery_Vehiculosid_empresas_propietario: TLargeintField;
    SQLQuery_Vehiculosid_personal_conductor_habitual: TLargeintField;
    SQLQuery_Vehiculosid_proveedores_aseguradora: TLargeintField;
    SQLQuery_Vehiculosid_proveedores_aseguradora_contacto: TLargeintField;
    SQLQuery_Vehiculosid_proveedores_comprado_a: TLargeintField;
    SQLQuery_Vehiculosid_proveedores_propietario: TLargeintField;
    SQLQuery_Vehiculosid_proveedores_propietario_contacto: TLargeintField;
    SQLQuery_Vehiculosid_tarjetas_transporte: TLargeintField;
    SQLQuery_Vehiculosid_vehiculos_marcas: TLargeintField;
    SQLQuery_Vehiculosid_vehiculos_tipos: TLargeintField;
    SQLQuery_Vehiculosid_vehiculos_tipo_cambios: TLargeintField;
    SQLQuery_Vehiculosid_vehiculos_tipo_ruedas: TLargeintField;
    SQLQuery_VehiculosInsert_Id_User: TLargeintField;
    SQLQuery_VehiculosInsert_WHEN: TDateTimeField;
    SQLQuery_VehiculosITV_fecha_ultima: TDateTimeField;
    SQLQuery_Vehiculosmatricula: TStringField;
    SQLQuery_Vehiculosmodelo: TStringField;
    SQLQuery_Vehiculosmotor: TStringField;
    SQLQuery_Vehiculosnumero_Obra: TStringField;
    SQLQuery_Vehiculosnumero_puertas: TSmallintField;
    SQLQuery_VehiculosObservaciones_Comentarios: TStringField;
    SQLQuery_VehiculosOT_descripcion_almacenes: TStringField;
    SQLQuery_VehiculosOT_descripcion_combustibles: TStringField;
    SQLQuery_VehiculosOT_descripcion_comprado_a: TStringField;
    SQLQuery_VehiculosOT_descripcion_vehiculos_marcas: TStringField;
    SQLQuery_VehiculosOT_descripcion_vehiculos_tipos: TStringField;
    SQLQuery_VehiculosOT_descripcion_vehiculos_tipo_cambios: TStringField;
    SQLQuery_VehiculosOT_descripcion_vehiculos_tipo_ruedas: TStringField;
    SQLQuery_VehiculosOT_nif_cif_conductor_habitual: TStringField;
    SQLQuery_VehiculosOT_nombre_conductor_habitual: TStringField;
    SQLQuery_VehiculosOT_Porpietario_Tipo: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_ASEGURADORA_Codigo_Postal: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_ASEGURADORA_CONTACTO_Cargo_Puesto: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_ASEGURADORA_CONTACTO_FAX: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_ASEGURADORA_CONTACTO_Movil: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_ASEGURADORA_CONTACTO_nombre: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_ASEGURADORA_CONTACTO_Tfno_Fijo_1: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_ASEGURADORA_CONTACTO_Tfno_Fijo_2: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_ASEGURADORA_Direccion: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_ASEGURADORA_Direccion_Numero: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_ASEGURADORA_Direccion_Piso_Letra: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_ASEGURADORA_id_paises: TLargeintField;
    SQLQuery_VehiculosOT_PROPIETARIO_ASEGURADORA_id_poblaciones: TLargeintField;
    SQLQuery_VehiculosOT_PROPIETARIO_ASEGURADORA_id_provincias: TLargeintField;
    SQLQuery_VehiculosOT_PROPIETARIO_ASEGURADORA_Movil: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_ASEGURADORA_nif_cif: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_ASEGURADORA_nombre_comercial: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_ASEGURADORA_nombre_propietario: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_ASEGURADORA_pais: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_ASEGURADORA_poblacion: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_ASEGURADORA_provincia: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_ASEGURADORA_Tfno_FAX: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_ASEGURADORA_Tfno_Fijo_1: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_ASEGURADORA_Tfno_Fijo_2: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_CLIENTE_Codigo_Postal: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_CLIENTE_CONTACTO_Cargo_Puesto: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_CLIENTE_CONTACTO_FAX: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_CLIENTE_CONTACTO_Movil: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_CLIENTE_CONTACTO_nombre: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_CLIENTE_CONTACTO_Tfno_Fijo_1: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_CLIENTE_CONTACTO_Tfno_Fijo_2: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_CLIENTE_Direccion: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_CLIENTE_Direccion_Numero: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_CLIENTE_Direccion_Piso_Letra: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_CLIENTE_id_paises: TLargeintField;
    SQLQuery_VehiculosOT_PROPIETARIO_CLIENTE_id_poblaciones: TLargeintField;
    SQLQuery_VehiculosOT_PROPIETARIO_CLIENTE_id_provincias: TLargeintField;
    SQLQuery_VehiculosOT_PROPIETARIO_CLIENTE_Movil: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_CLIENTE_nif_cif: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_CLIENTE_nombre_comercial: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_CLIENTE_nombre_propietario: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_CLIENTE_pais: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_CLIENTE_poblacion: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_CLIENTE_provincia: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_CLIENTE_Tfno_FAX: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_CLIENTE_Tfno_Fijo_1: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_CLIENTE_Tfno_Fijo_2: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_COLABORADOR_Codigo_Postal: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_COLABORADOR_CONTACTO_Cargo_Puesto: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_COLABORADOR_CONTACTO_FAX: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_COLABORADOR_CONTACTO_Movil: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_COLABORADOR_CONTACTO_nombre: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_COLABORADOR_CONTACTO_Tfno_Fijo_1: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_COLABORADOR_CONTACTO_Tfno_Fijo_2: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_COLABORADOR_Direccion: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_COLABORADOR_Direccion_Numero: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_COLABORADOR_Direccion_Piso_Letra: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_COLABORADOR_id_paises: TLargeintField;
    SQLQuery_VehiculosOT_PROPIETARIO_COLABORADOR_id_poblaciones: TLargeintField;
    SQLQuery_VehiculosOT_PROPIETARIO_COLABORADOR_id_provincias: TLargeintField;
    SQLQuery_VehiculosOT_PROPIETARIO_COLABORADOR_Movil: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_COLABORADOR_nif_cif: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_COLABORADOR_nombre_comercial: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_COLABORADOR_nombre_propietario: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_COLABORADOR_pais: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_COLABORADOR_poblacion: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_COLABORADOR_provincia: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_COLABORADOR_Tfno_FAX: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_COLABORADOR_Tfno_Fijo_1: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_COLABORADOR_Tfno_Fijo_2: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_EMPRESA_Codigo_Postal: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_EMPRESA_CONTACTO_nombre: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_EMPRESA_Direccion: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_EMPRESA_Direccion_Numero: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_EMPRESA_Direccion_Piso_Letra: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_EMPRESA_id_paises: TLargeintField;
    SQLQuery_VehiculosOT_PROPIETARIO_EMPRESA_id_poblaciones: TLargeintField;
    SQLQuery_VehiculosOT_PROPIETARIO_EMPRESA_id_provincias: TLargeintField;
    SQLQuery_VehiculosOT_PROPIETARIO_EMPRESA_Movil: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_EMPRESA_nif_cif: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_EMPRESA_nombre_comercial: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_EMPRESA_pais: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_EMPRESA_poblacion: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_EMPRESA_provincia: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_EMPRESA_Tfno_FAX: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_EMPRESA_Tfno_Fijo_1: TStringField;
    SQLQuery_VehiculosOT_PROPIETARIO_EMPRESA_Tfno_Fijo_2: TStringField;
    SQLQuery_VehiculosOT_Propietario_su_Nombre: TStringField;
    SQLQuery_VehiculosOT_tarjeta_transporte_ambito: TStringField;
    SQLQuery_VehiculosOT_tarjeta_transporte_numero_tarjeta: TStringField;
    SQLQuery_VehiculosPlazas_Ofertables: TSmallintField;
    SQLQuery_VehiculosPlazas_Segun_Ficha_Tecnica: TSmallintField;
    SQLQuery_VehiculosPlazas_Segun_Permiso: TSmallintField;
    SQLQuery_VehiculosPotencia: TStringField;
    SQLQuery_Vehiculosreferencia: TStringField;
    SQLQuery_Vehiculostipo_propietario: TStringField;
    SQLQuery_VehiculosTraccion: TStringField;
    SQLQuery_Vehiculosversion: TStringField;
















    SQLQuery_Vehiculos_su_Equipamiento: TSQLQuery;
    SQLQuery_Vehiculos_su_EquipamientoChange_Id_User: TLargeintField;
    SQLQuery_Vehiculos_su_EquipamientoChange_WHEN: TDateTimeField;
    SQLQuery_Vehiculos_su_EquipamientoDel_Id_User: TLargeintField;
    SQLQuery_Vehiculos_su_EquipamientoDel_WHEN: TDateTimeField;
    SQLQuery_Vehiculos_su_EquipamientoDel_WHY: TStringField;
    SQLQuery_Vehiculos_su_Equipamientoid: TLargeintField;
    SQLQuery_Vehiculos_su_Equipamientoid_vehiculos: TLargeintField;

      SQLQuery_Vehiculos_su_Equipamientoid_vehiculos_equipamientos: TLargeintField;
      SQLQuery_Vehiculos_su_EquipamientoInsert_Id_User: TLargeintField;
      SQLQuery_Vehiculos_su_EquipamientoInsert_WHEN: TDateTimeField;

        SQLQuery_Vehiculos_su_EquipamientoOT_descripcion_equipamiento: TStringField;
    TabSheet_Busqueda_Concreta: TTabSheet;
    TabSheet_Filtros_Generales: TTabSheet;

    procedure ComboBox_FiltrosChange(Sender: TObject);
    procedure Insertar_Registro;
    procedure Editar_Registro;
    procedure Refrescar_Registros;
    procedure Refrescar_Registros_Equipamiento;
    procedure BitBtn_FiltrarClick(Sender: TObject);
    procedure Elegir_Datos_Propietario;
    procedure Elegir_Datos_Propietario_Cliente;
    procedure Elegir_Datos_Propietario_Empresa;
    procedure Elegir_Datos_Propietario_Proveedor;
    procedure Boton_Elegir_id_combustiblesClick(Sender: TObject);
    procedure Boton_Elegir_id_personal_conductor_habitualClick(Sender: TObject);
    procedure Boton_Elegir_id_proveedores_aseguradoraClick(Sender: TObject);
    procedure Boton_Elegir_id_tarjetas_transporteClick(Sender: TObject);
    procedure Boton_Elegir_id_vehiculos_marcasClick(Sender: TObject);
    procedure Boton_Elegir_id_vehiculos_tiposClick(Sender: TObject);
    procedure Boton_Elegir_id_vehiculos_tipo_cambiosClick(Sender: TObject);
    procedure Boton_Elegir_id_vehiculos_tipo_ruedasClick(Sender: TObject);
    procedure Boton_Elegir_PropietarioClick(Sender: TObject);
    procedure Edit_Descripcion_id_combustiblesClick(Sender: TObject);
    procedure Edit_Descripcion_id_personal_conductor_habitualClick(Sender: TObject);
    procedure Edit_Descripcion_id_proveedores_aseguradoraClick(Sender: TObject);
    procedure Edit_Descripcion_PropietarioClick(Sender: TObject);
    procedure Edit_Descripcion_id_tarjetas_transporteClick(Sender: TObject);
    procedure Edit_Descripcion_id_vehiculos_marcasClick(Sender: TObject);
    procedure Edit_Descripcion_id_vehiculos_tiposClick(Sender: TObject);
    procedure Edit_Descripcion_id_vehiculos_tipo_cambiosClick(Sender: TObject);
    procedure Edit_Descripcion_id_vehiculos_tipo_ruedasClick(Sender: TObject);

    procedure Filtrar_Principal_Sin_Preguntar;
    procedure Filtrar_tablas_ligadas;
    function  Filtrar_vehiculos_equipamiento( param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
    function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
    procedure BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
    procedure Presentar_Datos;
    procedure no_Tocar;
    procedure BitBtn_ImprimirClick(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure RadioGroup_BajasClick(Sender: TObject);
    procedure Seleccionado_Rgtro;
    procedure BitBtn_SALIRClick(Sender: TObject);
    procedure BitBtn_SeleccionarClick(Sender: TObject);
    procedure DBGrid_PrincipalCellClick(Column: TColumn);
    procedure DBGrid_PrincipalDblClick(Sender: TObject);
    procedure DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Cerramos_Tablas;
    procedure Cerramos_Tablas_Ligadas;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure para_Empezar;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SQLQuery_VehiculosAfterPost(DataSet: TDataSet);
    procedure SQLQuery_VehiculosAfterScroll(DataSet: TDataSet);
    procedure SQLQuery_VehiculosBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_VehiculosBeforePost(DataSet: TDataSet);
    procedure SQLQuery_VehiculosCalcFields(DataSet: TDataSet);
    procedure SQLQuery_Vehiculostipo_propietarioChange(Sender: TField);
    procedure SQLQuery_Vehiculos_su_EquipamientoAfterPost(DataSet: TDataSet);
    procedure SQLQuery_Vehiculos_su_EquipamientoBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_Vehiculos_su_EquipamientoBeforePost(DataSet: TDataSet);
    procedure SQLQuery_Vehiculos_su_EquipamientoCalcFields(DataSet: TDataSet);

  private
    { private declarations }
    private_Salir_OK              : Boolean;
    private_Order_By              : array of TOrder_By;
    private_Order_By_Equipamiento : array of TOrder_By;
public
    { public declarations }
    public_Solo_Ver           : Boolean;
    public_Elegimos           : Boolean;
    public_Menu_Worked        : Integer;
    public_Rgtro_Seleccionado : Boolean;
  end;

var
  form_vehiculos_000: Tform_vehiculos_000;

implementation

{$R *.lfm}

uses dm_vehiculos, menu, vehiculos_001;

{ Tform_vehiculos_000 }

procedure Tform_vehiculos_000.FormActivate(Sender: TObject);
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

procedure Tform_vehiculos_000.FormCreate(Sender: TObject);
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
end;

procedure Tform_vehiculos_000.SQLQuery_VehiculosAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'vehiculos',
                       DataModule_Vehiculos.SQLTransaction_Vehiculos,
                       SQLQuery_Vehiculos,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros;
end;

procedure Tform_vehiculos_000.SQLQuery_VehiculosAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure Tform_vehiculos_000.SQLQuery_VehiculosBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Vehiculos );
end;

procedure Tform_vehiculos_000.SQLQuery_VehiculosBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Vehiculos );
end;

procedure Tform_vehiculos_000.SQLQuery_VehiculosCalcFields(DataSet: TDataSet);
begin
    with SQLQuery_Vehiculos do
    begin
        // ***************************************************************************************** //
        // **  VAMOS A PONERLE NOMBRE AL PROPIETARIO DEL VEHICULO                                 ** //
        // ***************************************************************************************** //
            FieldByName('OT_Propietario_su_Nombre').AsString := '';

            // ************************************************************************************* //
            // **  CLIENTES                                                                       ** //
            // ************************************************************************************* //
            if Trim(FieldByName('tipo_propietario').asString) = '1' then
            begin
                FieldByName('OT_Propietario_su_Nombre').AsString := FieldByName('OT_PROPIETARIO_CLIENTE_nombre_propietario').AsString;
                FieldByName('OT_Porpietario_Tipo').AsString := 'Cliente';
            end;

            // ************************************************************************************* //
            // **  EMPRESAS DEL GRUPO                                                             ** //
            // ************************************************************************************* //
            if Trim(FieldByName('tipo_propietario').asString) = '2' then
            begin
                FieldByName('OT_Propietario_su_Nombre').AsString := FieldByName('OT_PROPIETARIO_EMPRESA_nombre_comercial').AsString;
                FieldByName('OT_Porpietario_Tipo').AsString := 'Empresa';
            end;

            // ************************************************************************************* //
            // **  COLABORADORES / PROVEEDORES / ACREEDORES                                       ** //
            // ************************************************************************************* //
            if Trim(FieldByName('tipo_propietario').asString) = '3' then
            begin
                FieldByName('OT_Propietario_su_Nombre').AsString := FieldByName('OT_PROPIETARIO_COLABORADOR_nombre_propietario').AsString;
                FieldByName('OT_Porpietario_Tipo').AsString := 'Colaborador';
            end;
    end;
end;

procedure Tform_vehiculos_000.SQLQuery_Vehiculostipo_propietarioChange(Sender: TField);
begin
    with form_vehiculos_000.SQLQuery_Vehiculos do
    begin
        form_vehiculos_001.Vaciar_Propietario;
        form_vehiculos_001.Vaciar_Propietario_Contactos_2;
    end;
end;

procedure Tform_vehiculos_000.para_Empezar;
begin
    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    if UTI_GEN_Form_Abierto_Ya('DataModule_Vehiculos') = False then
    begin
        DataModule_Vehiculos := TDataModule_Vehiculos.Create(Application);
    end;

  { ****************************************************************************
    Preparamos los diferentes tipos de orden preconfigurados
    **************************************************************************** }
    // CLIENTES
    SetLength(private_Order_By, 4);

    private_Order_By[0].Titulo       := 'Por matrícula';
    private_Order_By[0].Memo_OrderBy := 'v.matricula ASC';

    private_Order_By[1].Titulo       := 'Por marca / modelo';
    private_Order_By[1].Memo_OrderBy := 'v.id_vehiculos_marcas ASC, v.modelo ASC';

    private_Order_By[2].Titulo       := 'Por referencia'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[2].Memo_OrderBy := 'v.referencia ASC';

    private_Order_By[3].Titulo       := 'Por el tipo de vehículo';
    private_Order_By[3].Memo_OrderBy := 'v.id_vehiculos_tipos ASC';

    Memo_OrderBy.Lines.Text          := private_Order_By[0].Memo_OrderBy;

    UTI_TB_Rellenar_ComboBox_Orden( true,
                                    ComboBox_Filtros,
                                    private_Order_By,
                                    0 );

    // VEHICULOS EQUIPAMIENTO
    SetLength(private_Order_By_Equipamiento, 1);

    private_Order_By_Equipamiento[0].Titulo       := 'Por nombre'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_Equipamiento[0].Memo_OrderBy := 'vse.id_vehiculos ASC, vse.id_vehiculos_equipamientos ASC';

  { ****************************************************************************
    Filtramos los datos
    **************************************************************************** }
    Filtrar_Principal_Sin_Preguntar;

    Presentar_Datos;

    // ********************************************************************************************* //
    // ** SOLO PARA ESTE FORM                                                                     ** //
    // ********************************************************************************************* //
    PageControl_Filtros.ActivePage := TabSheet_Busqueda_Concreta;
end;

procedure Tform_vehiculos_000.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
    if private_Salir_OK = False then
    begin
            // ************************************************************************************* //
            // ** Intento BitBtn_SALIR de la aplicación de un modo no permitido.                  ** //
            // ************************************************************************************* //
            // Pero si desde el menu principal está a true la variable                            ** //
            // public_Salir_Ok, significa que hay que salir si o si pues se pulsó                 ** //
            // cancelar al preguntar otra vez por la contraseña                                   ** //
            // ************************************************************************************* //
            if form_Menu.public_Salir_OK = False then CloseAction := caNone;
    end else begin
        // ************************************************************************************* //
        // ** Fue correcto el modo como quiere BitBtn_SALIR de la aplicación                  ** //
        // ************************************************************************************* //
    end;
end;

procedure Tform_vehiculos_000.FormDestroy(Sender: TObject);
begin
    Cerramos_Tablas;
end;

procedure Tform_vehiculos_000.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_Vehiculos.SQLConnector_Vehiculos,
                      DataModule_Vehiculos.SQLTransaction_Vehiculos,
                      SQLQuery_Vehiculos ) = false then UTI_GEN_Salir;

    DataModule_Vehiculos.Free;
end;

procedure Tform_vehiculos_000.Cerramos_Tablas_Ligadas;
begin
    if UTI_TB_Cerrar( DataModule_Vehiculos.SQLConnector_Vehiculos_su_Equipamiento,
                      DataModule_Vehiculos.SQLTransaction_Vehiculos_su_Equipamiento,
                      SQLQuery_Vehiculos_su_Equipamiento ) = false then UTI_GEN_Salir;
end;

procedure Tform_vehiculos_000.SQLQuery_Vehiculos_su_EquipamientoCalcFields(DataSet: TDataSet);
begin
    with SQLQuery_Vehiculos_su_Equipamiento do
    begin
        // ***************************************************************************************** //
        // ** No tiene nada para calcular                                                         ** //
        // ***************************************************************************************** //
    end;
end;

procedure Tform_vehiculos_000.SQLQuery_Vehiculos_su_EquipamientoAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'vehiculos_su_equipamiento',
                       DataModule_Vehiculos.SQLTransaction_Vehiculos_su_equipamiento,
                       SQLQuery_Vehiculos_su_Equipamiento,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros_Equipamiento;
end;

procedure Tform_vehiculos_000.SQLQuery_Vehiculos_su_EquipamientoBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Vehiculos_su_Equipamiento );
end;

procedure Tform_vehiculos_000.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    If public_Elegimos then
         Seleccionado_Rgtro
    else Editar_Registro;
end;

procedure Tform_vehiculos_000.DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    UTI_GEN_Dibujar_Grid( Sender, SQLQuery_Vehiculos, Rect, DataCol, Column, State );
end;

procedure Tform_vehiculos_000.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then
    begin
        If public_Elegimos then
             Seleccionado_Rgtro
        else Editar_Registro;
    end;
end;

procedure Tform_vehiculos_000.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

procedure Tform_vehiculos_000.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure Tform_vehiculos_000.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_vehiculos_000.BitBtn_SeleccionarClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
end;

procedure Tform_vehiculos_000.Seleccionado_Rgtro;
begin
    private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    public_Rgtro_Seleccionado := true;
    Close;
end;

procedure Tform_vehiculos_000.DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
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
                UTI_RGTRO_Borrar( 'vehiculos',
                                  SQLQuery_Vehiculos,
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

procedure Tform_vehiculos_000.BitBtn_ImprimirClick(Sender: TObject);
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

    if Trim(Edit_Descripcion_id_vehiculos_tipos.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con tipo de vehículo = ' +
                            Trim(Edit_Descripcion_id_vehiculos_tipos.Text);
    end;

    if Trim(Edit_Descripcion_id_vehiculos_marcas.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con marca = ' +
                            Trim(Edit_Descripcion_id_vehiculos_marcas.Text);
    end;

    if Trim(Edit_Descripcion_id_combustibles.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con tipo de combustible = ' +
                            Trim(Edit_Descripcion_id_combustibles.Text);
    end;

    if Trim(Edit_Descripcion_id_vehiculos_tipo_cambios.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con tipo de cambio = ' +
                            Trim(Edit_Descripcion_id_vehiculos_tipo_cambios.Text);
    end;

    if Trim(Edit_Descripcion_id_personal_conductor_habitual.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con conductor habitual = ' +
                            Trim(Edit_Descripcion_id_personal_conductor_habitual.Text);
    end;

    if Trim(Edit_Descripcion_id_tarjetas_transporte.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con tarjeta transporte = ' +
                            Trim(Edit_Descripcion_id_tarjetas_transporte.Text);
    end;

    if Trim(Edit_Descripcion_id_vehiculos_tipo_ruedas.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con tipo neumáticos = ' +
                            Trim(Edit_Descripcion_id_vehiculos_tipo_ruedas.Text);
    end;

    if Trim(Edit_Descripcion_id_proveedores_aseguradora.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con aseguradora = ' +
                            Trim(Edit_Descripcion_id_proveedores_aseguradora.Text);
    end;

    var_Ordenado_por := var_Ordenado_por +
                        ', con tipo propietario = ' +
                        Trim(ComboBox_Tipo_Propietario.Text);

    if Trim(Edit_Descripcion_Propietario.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con propietario = ' +
                            Trim(Edit_Descripcion_Propietario.Text);
    end;

    // ********************************************************************************************* //
    // ** Configuramos la llamada al generador de informes                                        ** //
    // ********************************************************************************************* //
    var_Ficheros := TStringList.Create;

    UTI_GEN_Informes( var_Ordenado_por,
                      SQLQuery_Vehiculos,
                      DataSource_Vehiculos,
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

procedure Tform_vehiculos_000.no_Tocar;
begin
    BitBtn_Imprimir.Enabled := False;
end;

procedure Tform_vehiculos_000.Presentar_Datos;
begin
     /// guardar por lo que pueda pasar
end;

procedure Tform_vehiculos_000.BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if SQLQuery_Vehiculos.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'vehiculos',
                                           SQLQuery_Vehiculos,
                                           DataSource_Vehiculos,
                                           DBGrid_Principal );
        end;
    end;
end;

procedure Tform_vehiculos_000.SQLQuery_Vehiculos_su_EquipamientoBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Vehiculos_su_Equipamiento );
end;

procedure Tform_vehiculos_000.Boton_Elegir_id_vehiculos_tiposClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_TiposVehiculos( true, false, 360, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_vehiculos_tipos.Text             := Trim(var_Registro.id_1);
        Edit_Descripcion_id_vehiculos_tipos.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_vehiculos_000.Edit_Descripcion_id_vehiculos_tiposClick(Sender: TObject);
begin
    Edit_id_vehiculos_tipos.Text             := '';
    Edit_Descripcion_id_vehiculos_tipos.Text := '';
end;

procedure Tform_vehiculos_000.Boton_Elegir_id_vehiculos_marcasClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_MarcasVehiculos( true, false, 370, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_vehiculos_marcas.Text             := Trim(var_Registro.id_1);
        Edit_Descripcion_id_vehiculos_marcas.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_vehiculos_000.Edit_Descripcion_id_vehiculos_marcasClick(Sender: TObject);
begin
    Edit_id_vehiculos_marcas.Text             := '';
    Edit_Descripcion_id_vehiculos_marcas.Text := '';
end;

procedure Tform_vehiculos_000.Boton_Elegir_id_combustiblesClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Combustibles( true, false, 380, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_combustibles.Text             := Trim(var_Registro.id_1);
        Edit_Descripcion_id_combustibles.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_vehiculos_000.Edit_Descripcion_id_combustiblesClick(Sender: TObject);
begin
    Edit_id_combustibles.Text             := '';
    Edit_Descripcion_id_combustibles.Text := '';
end;

procedure Tform_vehiculos_000.Boton_Elegir_id_vehiculos_tipo_cambiosClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_TipoCambiosVehiculos( true, false, 390, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_vehiculos_tipo_cambios.Text             := Trim(var_Registro.id_1);
        Edit_Descripcion_id_vehiculos_tipo_cambios.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_vehiculos_000.Edit_Descripcion_id_vehiculos_tipo_cambiosClick(Sender: TObject);
begin
    Edit_id_vehiculos_tipo_cambios.Text             := '';
    Edit_Descripcion_id_vehiculos_tipo_cambios.Text := '';
end;

procedure Tform_vehiculos_000.Boton_Elegir_id_personal_conductor_habitualClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Personal( true, false, 220, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_personal_conductor_habitual.Text             := Trim(var_Registro.id_1);
        Edit_Descripcion_id_personal_conductor_habitual.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_vehiculos_000.Edit_Descripcion_id_personal_conductor_habitualClick(Sender: TObject);
begin
    Edit_id_personal_conductor_habitual.Text             := '';
    Edit_Descripcion_id_personal_conductor_habitual.Text := '';
end;

procedure Tform_vehiculos_000.Boton_Elegir_id_tarjetas_transporteClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Tarjetas_Transporte( true, false, 410, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_tarjetas_transporte.Text             := Trim(var_Registro.id_1);
        Edit_Descripcion_id_tarjetas_transporte.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_vehiculos_000.Edit_Descripcion_id_tarjetas_transporteClick(Sender: TObject);
begin
    Edit_id_tarjetas_transporte.Text             := '';
    Edit_Descripcion_id_tarjetas_transporte.Text := '';
end;

procedure Tform_vehiculos_000.Edit_Descripcion_PropietarioClick(Sender: TObject);
begin
    Edit_Propietario.Text             := '';
    Edit_Descripcion_Propietario.Text := '';
end;

procedure Tform_vehiculos_000.Boton_Elegir_id_vehiculos_tipo_ruedasClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_TipoRuedasVehiculos( true, false, 400, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_vehiculos_tipo_ruedas.Text             := Trim(var_Registro.id_1);
        Edit_Descripcion_id_vehiculos_tipo_ruedas.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_vehiculos_000.Boton_Elegir_PropietarioClick(Sender: TObject);
var var_msg : TStrings;
begin
    if ComboBox_Tipo_Propietario.ItemIndex = 0 then
    begin
        var_msg := TStringList.Create;
        var_msg.Add( 'El tipo de propietario, se necesita antes. Tiene elegido todos');
        UTI_GEN_Aviso(true, var_msg, rs_Falta, True, False);
        var_msg.Free;
    end else begin
        Elegir_Datos_Propietario;
    end;
end;

procedure Tform_vehiculos_000.Elegir_Datos_Propietario;
begin
    if ComboBox_Tipo_Propietario.ItemIndex = 1 then
    begin
        Elegir_Datos_Propietario_Cliente;
    end;

    if ComboBox_Tipo_Propietario.ItemIndex = 2 then
    begin
        Elegir_Datos_Propietario_Empresa;
    end;

    if ComboBox_Tipo_Propietario.ItemIndex = 3 then
    begin
        Elegir_Datos_Propietario_Proveedor;
    end;
end;

procedure Tform_vehiculos_000.Elegir_Datos_Propietario_Cliente;
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Clientes( true, false, 50, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_Propietario.Text             := Trim(var_Registro.id_1);
        Edit_Descripcion_Propietario.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_vehiculos_000.Elegir_Datos_Propietario_Empresa;
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Empresas( true, false, 250, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_Propietario.Text             := Trim(var_Registro.id_1);
        Edit_Descripcion_Propietario.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_vehiculos_000.Elegir_Datos_Propietario_Proveedor;
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_Vehiculos_000.SQLQuery_Vehiculos do
    begin
        var_Registro := UTI_Abrir_Modulo_Proveedores( true, false, 120, '1' );
        if var_Registro.id_1 <> '' then
        begin
            Edit_Propietario.Text             := Trim(var_Registro.id_1);
            Edit_Descripcion_Propietario.Text := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_vehiculos_000.Edit_Descripcion_id_vehiculos_tipo_ruedasClick(Sender: TObject);
begin
    Edit_id_vehiculos_tipo_ruedas.Text             := '';
    Edit_Descripcion_id_vehiculos_tipo_ruedas.Text := '';
end;

procedure Tform_vehiculos_000.Boton_Elegir_id_proveedores_aseguradoraClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Proveedores( true, false, 120, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_proveedores_aseguradora.Text             := Trim(var_Registro.id_1);
        Edit_Descripcion_id_proveedores_aseguradora.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_vehiculos_000.Edit_Descripcion_id_proveedores_aseguradoraClick(Sender: TObject);
begin
    Edit_id_proveedores_aseguradora.Text             := '';
    Edit_Descripcion_id_proveedores_aseguradora.Text := '';
end;

procedure Tform_vehiculos_000.Filtrar_tablas_ligadas;
var
  var_Lineas_Filtro  : TStrings;
  var_Lineas_OrderBy : TStrings;
  var_SQL_ADD        : TStrings;
begin
     var_SQL_ADD := TStringList.Create;

    if SQLQuery_Vehiculos.RecordCount = 0 then Exit;

    if SQLQuery_Vehiculos.State = dsInsert then
    begin
        Cerramos_Tablas_Ligadas;
        Exit;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    // ********************************************************************************************* //
    // ** VEHICULOS SU EQUIPAMIENTO                                                               ** //
    // ********************************************************************************************* //
    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'vse.id_vehiculos = ' + SQLQuery_Vehiculos.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_Lineas_OrderBy.Clear;
    Filtrar_vehiculos_equipamiento( RadioGroup_Bajas.ItemIndex,
                                    false,
                                    var_Lineas_Filtro,
                                    var_Lineas_OrderBy );

    // ********************************************************************************************* //
    // ** BORRAMOS DE MEMORIA EL RESTO DE COSAS A NO UTILIZAR YA                                  ** //
    // ********************************************************************************************* //
    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;
    var_SQL_ADD.Free;
end;

procedure Tform_vehiculos_000.Filtrar_Principal_Sin_Preguntar;
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

function Tform_vehiculos_000.Filtrar_vehiculos_equipamiento( param_ver_bajas : ShortInt;
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
    param_Lineas_OrderBy.Text := private_Order_By_Equipamiento[0].Memo_OrderBy;
  end;

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  Result := UTI_TB_Filtrar( private_Order_By_Equipamiento,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Vehiculos_su_Equipamiento,
                                                          'vehiculos_su_equipamiento',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Vehiculos_su_Equipamiento,
                                                          'vehiculos_su_equipamiento',
                                                          'i' ),
                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_Vehiculos.SQLTransaction_Vehiculos_su_Equipamiento,
                            DataModule_Vehiculos.SQLConnector_Vehiculos_su_Equipamiento,
                            SQLQuery_Vehiculos_su_Equipamiento,

                            // name_tabla,
                            'vse',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT vse.*,' + ' ' +
                                   've.descripcion AS OT_descripcion_equipamiento' + ' ' +

                            'FROM vehiculos_su_equipamiento AS vse' + ' ' +

                            'LEFT JOIN vehiculos_equipamientos AS ve' + ' ' +
                            'ON vse.id_vehiculos_equipamientos = ve.id',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_a_Filtrar_Plus.Free;
end;

function Tform_vehiculos_000.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
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
    // ** Ahora buscaremos por EL TIPO DE VEHICULO                                                ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_vehiculos_tipos.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'v.id_vehiculos_tipos = ' + Trim(Edit_id_vehiculos_tipos.Text) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por LA MARCA DEL VEHICULO                                              ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_vehiculos_marcas.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'v.id_vehiculos_marcas = ' + Trim(Edit_id_vehiculos_marcas.Text) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por EL TIPO DE COMBUSTIBLE                                             ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_combustibles.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'v.id_combustibles = ' + Trim(Edit_id_combustibles.Text) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por EL TIPO DE CAMBIO DEL VEHICULO                                     ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_vehiculos_tipo_cambios.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'v.id_vehiculos_tipo_cambios = ' + Trim(Edit_id_vehiculos_tipo_cambios.Text) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por EL CONDUCTOR HABITUAL DEL VEHICULO                                 ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_personal_conductor_habitual.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'v.id_personal_conductor_habitual = ' + Trim(Edit_id_personal_conductor_habitual.Text) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por LA TARJETA DE TRANSPORTE DEL VEHICULO                              ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_tarjetas_transporte.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'v.id_tarjetas_transporte = ' + Trim(Edit_id_tarjetas_transporte.Text) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por EL TIPO DE NEUMATICOS DEL VEHICULO                                 ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_vehiculos_tipo_ruedas.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'v.id_vehiculos_tipo_ruedas = ' + Trim(Edit_id_vehiculos_tipo_ruedas.Text) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por LA ASEGURADORA DEL VEHICULO                                        ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_proveedores_aseguradora.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'v.id_proveedores_aseguradora = ' + Trim(Edit_id_proveedores_aseguradora.Text) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por EL PROPIETARIO DEL VEHICULO                                        ** //
    // ********************************************************************************************* //
    if ComboBox_Tipo_Propietario.ItemIndex <> 0 then
    begin
        if Trim(Edit_Propietario.Text) <> '' then
        begin
            if ComboBox_Tipo_Propietario.ItemIndex = 1 then
            begin
                var_SQL_ADD.Clear;
                var_SQL_ADD.Add( 'v.id_clientes_propietario = ' + Trim(Edit_Propietario.Text) );
                UTI_TB_SQL_ADD( false,
                                var_a_Filtrar,
                                var_SQL_ADD );
            end;

            if ComboBox_Tipo_Propietario.ItemIndex = 2 then
            begin
                var_SQL_ADD.Clear;
                var_SQL_ADD.Add( 'v.id_empresas_propietario = ' + Trim(Edit_Propietario.Text) );
                UTI_TB_SQL_ADD( false,
                                var_a_Filtrar,
                                var_SQL_ADD );
            end;

            if ComboBox_Tipo_Propietario.ItemIndex = 3 then
            begin
                var_SQL_ADD.Clear;
                var_SQL_ADD.Add( 'v.id_proveedores_propietario = ' + Trim(Edit_Propietario.Text) );
                UTI_TB_SQL_ADD( false,
                                var_a_Filtrar,
                                var_SQL_ADD );
            end;
        end;
    end;

    { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
      y que por lo se debe de permitir modificarlos en ningún módulo }

    Result := UTI_TB_Filtrar( private_Order_By,

                              // Delete_SQL,
                              '',

                              // Update_SQL,
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Vehiculos,
                                                            'vehiculos',
                                                            'u' ),

                              // Insert_SQL,
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Vehiculos,
                                                            'vehiculos',
                                                            'i' ),
                              // var_ctdad_Rgtros,
                              -1,

                              DataModule_Vehiculos.SQLTransaction_Vehiculos,
                              DataModule_Vehiculos.SQLConnector_Vehiculos,
                              SQLQuery_Vehiculos,

                              // name_tabla,
                              'v',

                              RadioGroup_Bajas.ItemIndex,

                              // SELECT_SQL,
                              'SELECT v.*,' + ' ' +

                                     'alm.descripcion AS OT_descripcion_almacenes,' + ' ' +
                                     'vt.descripcion AS OT_descripcion_vehiculos_tipos,' + ' ' +
                                     'vm.descripcion AS OT_descripcion_vehiculos_marcas,' + ' ' +
                                     'com.descripcion AS OT_descripcion_combustibles,' + ' ' +
                                     'vtc.descripcion AS OT_descripcion_vehiculos_tipo_cambios,' + ' ' +
                                     'vtr.descripcion AS OT_descripcion_vehiculos_tipo_ruedas,' + ' ' +

                                     'p.nombre AS OT_nombre_conductor_habitual,' + ' ' +
                                     'p.nif_cif AS OT_nif_cif_conductor_habitual,' + ' ' +

                                     'ttte.numero_tarjeta AS OT_tarjeta_transporte_numero_tarjeta,' + ' ' +
                                     'ttte.ambito AS OT_tarjeta_transporte_ambito,' + ' ' +

                                     'prca.nombre_propietario AS OT_descripcion_comprado_a,' + ' ' +

                                     // ***************************************************************** //
                                     // ** propietario empresa                                         ** //
                                     // ***************************************************************** //
                                     'prem.nombre_comercial AS OT_PROPIETARIO_EMPRESA_nombre_comercial,' + ' ' +
                                     'prem.nif_cif AS OT_PROPIETARIO_EMPRESA_nif_cif,' + ' ' +
                                     'prem.Tfno_Fijo_1 AS OT_PROPIETARIO_EMPRESA_Tfno_Fijo_1,' + ' ' +
                                     'prem.Tfno_Fijo_2 AS OT_PROPIETARIO_EMPRESA_Tfno_Fijo_2,' + ' ' +
                                     'prem.FAX AS OT_PROPIETARIO_EMPRESA_Tfno_FAX,' + ' ' +
                                     'prem.Movil AS OT_PROPIETARIO_EMPRESA_Movil,' + ' ' +
                                     'prem.Direccion AS OT_PROPIETARIO_EMPRESA_Direccion,' + ' ' +
                                     'prem.Direccion_Numero AS OT_PROPIETARIO_EMPRESA_Direccion_Numero,' + ' ' +
                                     'prem.Direccion_Piso_Letra AS OT_PROPIETARIO_EMPRESA_Direccion_Piso_Letra,' + ' ' +
                                     'prem.Codigo_Postal AS OT_PROPIETARIO_EMPRESA_Codigo_Postal,' + ' ' +

                                     'prem.id_poblaciones AS OT_PROPIETARIO_EMPRESA_id_poblaciones,' + ' ' +
                                     'prem.id_provincias AS OT_PROPIETARIO_EMPRESA_id_provincias,' + ' ' +
                                     'prem.id_paises AS OT_PROPIETARIO_EMPRESA_id_paises,' + ' ' +

                                     'prempb.descripcion AS OT_PROPIETARIO_EMPRESA_poblacion,' + ' ' +
                                     'prempr.descripcion AS OT_PROPIETARIO_EMPRESA_provincia,' + ' ' +
                                     'premps.descripcion AS OT_PROPIETARIO_EMPRESA_pais,' + ' ' +

                                     'prem.Responsable AS OT_PROPIETARIO_EMPRESA_CONTACTO_nombre,' + ' ' +

                                     // ***************************************************************** //
                                     // ** propietario cliente                                         ** //
                                     // ***************************************************************** //
                                     'prcl.nombre_propietario AS OT_PROPIETARIO_CLIENTE_nombre_propietario,' + ' ' +
                                     'prcl.nombre_comercial AS OT_PROPIETARIO_CLIENTE_nombre_comercial,' + ' ' +
                                     'prcl.nif_cif AS OT_PROPIETARIO_CLIENTE_nif_cif,' + ' ' +
                                     'prcl.Tfno_Fijo_1 AS OT_PROPIETARIO_CLIENTE_Tfno_Fijo_1,' + ' ' +
                                     'prcl.Tfno_Fijo_2 AS OT_PROPIETARIO_CLIENTE_Tfno_Fijo_2,' + ' ' +
                                     'prcl.FAX AS OT_PROPIETARIO_CLIENTE_Tfno_FAX,' + ' ' +
                                     'prcl.Movil AS OT_PROPIETARIO_CLIENTE_Movil,' + ' ' +
                                     'prcl.Direccion AS OT_PROPIETARIO_CLIENTE_Direccion,' + ' ' +
                                     'prcl.Direccion_Numero AS OT_PROPIETARIO_CLIENTE_Direccion_Numero,' + ' ' +
                                     'prcl.Direccion_Piso_Letra AS OT_PROPIETARIO_CLIENTE_Direccion_Piso_Letra,' + ' ' +
                                     'prcl.Codigo_Postal AS OT_PROPIETARIO_CLIENTE_Codigo_Postal,' + ' ' +

                                     'prcl.id_poblaciones AS OT_PROPIETARIO_CLIENTE_id_poblaciones,' + ' ' +
                                     'prcl.id_provincias AS OT_PROPIETARIO_CLIENTE_id_provincias,' + ' ' +
                                     'prcl.id_paises AS OT_PROPIETARIO_CLIENTE_id_paises,' + ' ' +

                                     'prclpb.descripcion AS OT_PROPIETARIO_CLIENTE_poblacion,' + ' ' +
                                     'prclpr.descripcion AS OT_PROPIETARIO_CLIENTE_provincia,' + ' ' +
                                     'prclps.descripcion AS OT_PROPIETARIO_CLIENTE_pais,' + ' ' +

                                     'prclcon.nombre AS OT_PROPIETARIO_CLIENTE_CONTACTO_nombre,' + ' ' +
                                     'prclcon.Cargo_Puesto AS OT_PROPIETARIO_CLIENTE_CONTACTO_Cargo_Puesto,' + ' ' +
                                     'prclcon.Tfno_Fijo_1 AS OT_PROPIETARIO_CLIENTE_CONTACTO_Tfno_Fijo_1,' + ' ' +
                                     'prclcon.Tfno_Fijo_2 AS OT_PROPIETARIO_CLIENTE_CONTACTO_Tfno_Fijo_2,' + ' ' +
                                     'prclcon.FAX AS OT_PROPIETARIO_CLIENTE_CONTACTO_FAX,' + ' ' +
                                     'prclcon.Movil AS OT_PROPIETARIO_CLIENTE_CONTACTO_Movil,' + ' ' +

                                     // ***************************************************************** //
                                     // ** propietario COLABORADOR / PROVEEDOR                         ** //
                                     // ***************************************************************** //
                                     'prpv.nombre_propietario AS OT_PROPIETARIO_COLABORADOR_nombre_propietario,' + ' ' +
                                     'prpv.nombre_comercial AS OT_PROPIETARIO_COLABORADOR_nombre_comercial,' + ' ' +
                                     'prpv.nif_cif AS OT_PROPIETARIO_COLABORADOR_nif_cif,' + ' ' +
                                     'prpv.Tfno_Fijo_1 AS OT_PROPIETARIO_COLABORADOR_Tfno_Fijo_1,' + ' ' +
                                     'prpv.Tfno_Fijo_2 AS OT_PROPIETARIO_COLABORADOR_Tfno_Fijo_2,' + ' ' +
                                     'prpv.FAX AS OT_PROPIETARIO_COLABORADOR_Tfno_FAX,' + ' ' +
                                     'prpv.Movil AS OT_PROPIETARIO_COLABORADOR_Movil,' + ' ' +
                                     'prpv.Direccion AS OT_PROPIETARIO_COLABORADOR_Direccion,' + ' ' +
                                     'prpv.Direccion_Numero AS OT_PROPIETARIO_COLABORADOR_Direccion_Numero,' + ' ' +
                                     'prpv.Direccion_Piso_Letra AS OT_PROPIETARIO_COLABORADOR_Direccion_Piso_Letra,' + ' ' +
                                     'prpv.Codigo_Postal AS OT_PROPIETARIO_COLABORADOR_Codigo_Postal,' + ' ' +

                                     'prpv.id_poblaciones AS OT_PROPIETARIO_COLABORADOR_id_poblaciones,' + ' ' +
                                     'prpv.id_provincias AS OT_PROPIETARIO_COLABORADOR_id_provincias,' + ' ' +
                                     'prpv.id_paises AS OT_PROPIETARIO_COLABORADOR_id_paises,' + ' ' +

                                     'prpvpb.descripcion AS OT_PROPIETARIO_COLABORADOR_poblacion,' + ' ' +
                                     'prpvpr.descripcion AS OT_PROPIETARIO_COLABORADOR_provincia,' + ' ' +
                                     'prpvps.descripcion AS OT_PROPIETARIO_COLABORADOR_pais,' + ' ' +

                                     'prpvcon.nombre AS OT_PROPIETARIO_COLABORADOR_CONTACTO_nombre,' + ' ' +
                                     'prpvcon.Cargo_Puesto AS OT_PROPIETARIO_COLABORADOR_CONTACTO_Cargo_Puesto,' + ' ' +
                                     'prpvcon.Tfno_Fijo_1 AS OT_PROPIETARIO_COLABORADOR_CONTACTO_Tfno_Fijo_1,' + ' ' +
                                     'prpvcon.Tfno_Fijo_2 AS OT_PROPIETARIO_COLABORADOR_CONTACTO_Tfno_Fijo_2,' + ' ' +
                                     'prpvcon.FAX AS OT_PROPIETARIO_COLABORADOR_CONTACTO_FAX,' + ' ' +
                                     'prpvcon.Movil AS OT_PROPIETARIO_COLABORADOR_CONTACTO_Movil,' + ' ' +

                                     // ***************************************************************** //
                                     // ** CIA.ASEGURADORA / PROVEEDOR                                 ** //
                                     // ***************************************************************** //
                                     'asg.nombre_propietario AS OT_PROPIETARIO_ASEGURADORA_nombre_propietario,' + ' ' +
                                     'asg.nombre_comercial AS OT_PROPIETARIO_ASEGURADORA_nombre_comercial,' + ' ' +
                                     'asg.nif_cif AS OT_PROPIETARIO_ASEGURADORA_nif_cif,' + ' ' +
                                     'asg.Tfno_Fijo_1 AS OT_PROPIETARIO_ASEGURADORA_Tfno_Fijo_1,' + ' ' +
                                     'asg.Tfno_Fijo_2 AS OT_PROPIETARIO_ASEGURADORA_Tfno_Fijo_2,' + ' ' +
                                     'asg.FAX AS OT_PROPIETARIO_ASEGURADORA_Tfno_FAX,' + ' ' +
                                     'asg.Movil AS OT_PROPIETARIO_ASEGURADORA_Movil,' + ' ' +
                                     'asg.Direccion AS OT_PROPIETARIO_ASEGURADORA_Direccion,' + ' ' +
                                     'asg.Direccion_Numero AS OT_PROPIETARIO_ASEGURADORA_Direccion_Numero,' + ' ' +
                                     'asg.Direccion_Piso_Letra AS OT_PROPIETARIO_ASEGURADORA_Direccion_Piso_Letra,' + ' ' +
                                     'asg.Codigo_Postal AS OT_PROPIETARIO_ASEGURADORA_Codigo_Postal,' + ' ' +

                                     'asg.id_poblaciones AS OT_PROPIETARIO_ASEGURADORA_id_poblaciones,' + ' ' +
                                     'asg.id_provincias AS OT_PROPIETARIO_ASEGURADORA_id_provincias,' + ' ' +
                                     'asg.id_paises AS OT_PROPIETARIO_ASEGURADORA_id_paises,' + ' ' +

                                     'asgpb.descripcion AS OT_PROPIETARIO_ASEGURADORA_poblacion,' + ' ' +
                                     'asgpr.descripcion AS OT_PROPIETARIO_ASEGURADORA_provincia,' + ' ' +
                                     'asgps.descripcion AS OT_PROPIETARIO_ASEGURADORA_pais,' + ' ' +

                                     'asgcon.nombre AS OT_PROPIETARIO_ASEGURADORA_CONTACTO_nombre,' + ' ' +
                                     'asgcon.Cargo_Puesto AS OT_PROPIETARIO_ASEGURADORA_CONTACTO_Cargo_Puesto,' + ' ' +
                                     'asgcon.Tfno_Fijo_1 AS OT_PROPIETARIO_ASEGURADORA_CONTACTO_Tfno_Fijo_1,' + ' ' +
                                     'asgcon.Tfno_Fijo_2 AS OT_PROPIETARIO_ASEGURADORA_CONTACTO_Tfno_Fijo_2,' + ' ' +
                                     'asgcon.FAX AS OT_PROPIETARIO_ASEGURADORA_CONTACTO_FAX,' + ' ' +
                                     'asgcon.Movil AS OT_PROPIETARIO_ASEGURADORA_CONTACTO_Movil' + ' ' +

                              'FROM vehiculos AS v' + ' ' +

                              'LEFT JOIN almacenes AS alm' + ' ' +
                              'ON v.id_almacenes = alm.id' + ' ' +

                              'LEFT JOIN vehiculos_tipos AS vt' + ' ' +
                              'ON v.id_vehiculos_tipos = vt.id' + ' ' +

                              'LEFT JOIN vehiculos_marcas AS vm' + ' ' +
                              'ON v.id_vehiculos_marcas = vm.id' + ' ' +

                              'LEFT JOIN combustibles AS com' + ' ' +
                              'ON v.id_combustibles = com.id' + ' ' +

                              'LEFT JOIN vehiculos_tipo_cambios AS vtc' + ' ' +
                              'ON v.id_vehiculos_tipo_cambios = vtc.id' + ' ' +

                              'LEFT JOIN vehiculos_tipo_ruedas AS vtr' + ' ' +
                              'ON v.id_vehiculos_tipo_ruedas = vtr.id' + ' ' +

                              'LEFT JOIN personal AS p' + ' ' +
                              'ON v.id_personal_conductor_habitual = p.id' + ' ' +

                              'LEFT JOIN tarjetas_transporte AS ttte' + ' ' +
                              'ON v.id_tarjetas_transporte = ttte.id' + ' ' +

                              'LEFT JOIN proveedores AS prca' + ' ' +
                              'ON v.id_proveedores_comprado_a = prca.id' + ' ' +

                              // ************************************************************************ //
                              // ** PROPIETARIOS POR EMPRESA DEL GRUPO                                 ** //
                              // ************************************************************************ //
                              'LEFT JOIN empresas AS prem' + ' ' +
                              'ON v.id_empresas_propietario = prem.id' + ' ' +

                              'LEFT JOIN poblaciones AS prempb' + ' ' +
                              'ON prem.id_poblaciones = prempb.id' + ' ' +

                              'LEFT JOIN provincias AS prempr' + ' ' +
                              'ON prem.id_provincias = prempr.id' + ' ' +

                              'LEFT JOIN paises AS premps' + ' ' +
                              'ON prem.id_paises = premps.id' + ' ' +

                              // ************************************************************************ //
                              // ** PROPIETARIOS POR CLIENTE                                           ** //
                              // ************************************************************************ //
                              'LEFT JOIN clientes AS prcl' + ' ' +
                              'ON v.id_clientes_propietario = prcl.id' + ' ' +

                              'LEFT JOIN poblaciones AS prclpb' + ' ' +
                              'ON prcl.id_poblaciones = prclpb.id' + ' ' +

                              'LEFT JOIN provincias AS prclpr' + ' ' +
                              'ON prcl.id_provincias = prclpr.id' + ' ' +

                              'LEFT JOIN paises AS prclps' + ' ' +
                              'ON prcl.id_paises = prclps.id' + ' ' +

                              'LEFT JOIN clientes_contactos AS prclcon' + ' ' +
                              'ON v.id_clientes_propietario_contacto = prclcon.id' + ' ' +
                              'AND prclcon.id_clientes = v.id_clientes_propietario' + ' ' +

                              // ************************************************************************ //
                              // ** PROPIETARIOS POR COLABORADOR / PROVEEDOR                           ** //
                              // ************************************************************************ //
                              'LEFT JOIN proveedores AS prpv' + ' ' +
                              'ON v.id_proveedores_propietario = prpv.id' + ' ' +

                              'LEFT JOIN poblaciones AS prpvpb' + ' ' +
                              'ON prpv.id_poblaciones = prpvpb.id' + ' ' +

                              'LEFT JOIN provincias AS prpvpr' + ' ' +
                              'ON prpv.id_provincias = prpvpr.id' + ' ' +

                              'LEFT JOIN paises AS prpvps' + ' ' +
                              'ON prpv.id_paises = prpvps.id' + ' ' +

                              'LEFT JOIN proveedores_contactos AS prpvcon' + ' ' +
                              'ON v.id_proveedores_propietario_contacto = prpvcon.id' + ' ' +
                              'AND prpvcon.id_proveedores = v.id_proveedores_propietario' + ' ' +

                              // ************************************************************************ //
                              // ** CIA.ASEGURADORA / PROVEEDOR                                        ** //
                              // ************************************************************************ //
                              'LEFT JOIN proveedores AS asg' + ' ' +
                              'ON v.id_proveedores_aseguradora = asg.id' + ' ' +

                              'LEFT JOIN poblaciones AS asgpb' + ' ' +
                              'ON asg.id_poblaciones = asgpb.id' + ' ' +

                              'LEFT JOIN provincias AS asgpr' + ' ' +
                              'ON asg.id_provincias = asgpr.id' + ' ' +

                              'LEFT JOIN paises AS asgps' + ' ' +
                              'ON asg.id_paises = asgps.id' + ' ' +

                              'LEFT JOIN proveedores_contactos AS asgcon' + ' ' +
                              'ON v.id_proveedores_aseguradora_contacto = asgcon.id' + ' ' +
                                  'AND asgcon.id_proveedores = v.id_proveedores_aseguradora' + ' ',

                               Memo_Filtros.Lines,
                               Memo_OrderBy.Lines,
                               var_a_Filtrar,

                               param_Cambiamos_Filtro,
                               false,   // param_ver_SQL_despues_Abrir : Boolean;
                               true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

    var_a_Filtrar.Free;

    Label_Ctdad_Rgtros.Caption := IntToStr(SQLQuery_Vehiculos.RecordCount);

    if SQLQuery_Vehiculos.RecordCount = 0 then
    begin
        Cerramos_Tablas_Ligadas;
    end;

    //Filtrar_tablas_ligadas;
    var_SQL_ADD.Free;
end;

procedure Tform_vehiculos_000.BitBtn_FiltrarClick(Sender: TObject);
begin
    if PageControl_Filtros.ActivePage = TabSheet_Busqueda_Concreta then
    begin
        Filtrar_Principal_Sin_Preguntar;
    end else begin
        RadioGroup_Bajas.ItemIndex := Filtrar_Principal( true );
    end;
end;

procedure Tform_vehiculos_000.RadioGroup_BajasClick(Sender: TObject);
begin
    Refrescar_Registros;
end;

procedure Tform_vehiculos_000.Refrescar_Registros_Equipamiento;
var var_Lineas_Filtro              : TStrings;
    var_Lineas_OrderBy             : TStrings;

    var_id_vehiculos               : Integer;
    var_id_vehiculos_equipamientos : Integer;

    var_ver_Bajas                  : ShortInt;
begin
    // ********************************************************************************************* //
    // ** Solo si la cabecera está en modo EDIT se abren las tablas hijas                         ** //
    // ********************************************************************************************* //
    if SQLQuery_Vehiculos.State <> dsEdit then Exit;

    with SQLQuery_Vehiculos_su_Equipamiento do
    begin
        // ***************************************************************************************** //
        // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                         ** //
        // ***************************************************************************************** //
        var_id_vehiculos               := 0;
        var_id_vehiculos_equipamientos := 0;

        if SQLQuery_Vehiculos_su_Equipamiento.RecordCount > 0 then
        begin
            if not SQLQuery_Vehiculos_su_Equipamiento.FieldByName('id_vehiculos').IsNull then
            begin
                 var_id_vehiculos := SQLQuery_Vehiculos_su_Equipamiento.FieldByName('id_vehiculos').Value;
            end;

            if not SQLQuery_Vehiculos_su_Equipamiento.FieldByName('id_vehiculos_equipamientos').IsNull then
            begin
                 var_id_vehiculos_equipamientos := SQLQuery_Vehiculos_su_Equipamiento.FieldByName('id_vehiculos_equipamientos').Value;
            end;
        end;

        var_Lineas_Filtro  := TStringList.Create;
        var_Lineas_OrderBy := TStringList.Create;

        var_Lineas_Filtro.Clear;
        var_Lineas_OrderBy.Clear;

        if Trim(SQLQuery_Vehiculos.FieldByName('id').AsString) <> '' then
             var_Lineas_Filtro.Add('vse.id_vehiculos = ' + Trim(SQLQuery_Vehiculos.FieldByName('id').AsString))
        else var_Lineas_Filtro.Add('vse.id_vehiculos = Null');

        var_ver_Bajas := RadioGroup_Bajas.ItemIndex;
        if UTI_GEN_Form_Abierto_Ya('form_vehiculos_001') = true then
        begin
            var_ver_Bajas := form_vehiculos_001.RadioGroup_Bajas.ItemIndex;
        end;

        Filtrar_vehiculos_equipamiento( var_ver_Bajas,
                                        false,
                                        var_Lineas_Filtro,
                                        var_Lineas_OrderBy );

        var_Lineas_Filtro.Free;
        var_Lineas_OrderBy.Free;

        if var_id_vehiculos <> 0 then
        begin
            SQLQuery_Vehiculos_su_Equipamiento.Locate( 'id_vehiculos;id_vehiculos_equipamientos',
                                                       VarArrayOf( [ var_id_vehiculos,
                                                                     var_id_vehiculos_equipamientos ] ),
                                                       [] );
        end;
    end;
end;

procedure Tform_vehiculos_000.Refrescar_Registros;
var var_matricula : String;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_matricula := '';

    if SQLQuery_Vehiculos.RecordCount > 0 then
    begin
        var_matricula := SQLQuery_Vehiculos.FieldByName('matricula').asString;
    end;

    Filtrar_Principal_Sin_Preguntar;

    if Trim(var_matricula) <> '' then
    begin
         SQLQuery_Vehiculos.Locate( 'matricula', var_matricula, [] );
    end;
end;

procedure Tform_vehiculos_000.Insertar_Registro;
var var_msg       : TStrings;
    var_matricula : String;
begin
    with SQLQuery_Vehiculos do
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

                // ********************************************************************************* //
                // ** Esta parte es por si hay que inicializar algun campo antes de la insercción ** //
                // ********************************************************************************* //
                // ** FieldByName('Vencimientos_automaticos_SN').AsString := 'N';                 ** //
                // ********************************************************************************* //

                Application.CreateForm(Tform_vehiculos_001, form_vehiculos_001);

                form_vehiculos_001.DBGrid_Vehiculos_su_Equipamiento.Color := clSilver;

                form_vehiculos_001.RadioGroup_Bajas.ItemIndex := RadioGroup_Bajas.ItemIndex;

                form_vehiculos_001.para_Empezar;

                form_vehiculos_001.ShowModal;
                if form_vehiculos_001.public_Pulso_Aceptar = true then
                begin
                    FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
                    FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                    var_matricula                       := FieldByName('matricula').AsString;

                    UTI_RGTRO_Grabar_Antes( 'vehiculos', SQLQuery_Vehiculos );

                    form_vehiculos_001.Free;

                    if var_matricula = FieldByName('matricula').AsString then
                    begin
                        Editar_Registro;
                    end;
                end else begin
                    Cancel;
                    form_vehiculos_001.Free;
                end;
            end;
        end;

        var_msg.Free;
    end;
end;

procedure Tform_vehiculos_000.ComboBox_FiltrosChange(Sender: TObject);
begin
    Memo_OrderBy.Lines.Clear;
    Memo_OrderBy.Lines.Add( private_Order_By[ComboBox_Filtros.ItemIndex].Memo_OrderBy );
    BitBtn_FiltrarClick(Nil);
end;

procedure Tform_vehiculos_000.Editar_Registro;
var var_msg : TStrings;
    var_id  : ShortString;
begin
    with SQLQuery_Vehiculos do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
        begin
            var_id := FieldByName('id').AsString;

            if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
            begin
                if UTI_RGTRO_isLock( 'vehiculos',
                                     FieldByName('id').AsString,
                                     true ) = true then
                begin
                    Exit;
                end else begin
                    if UTI_RGTRO_Lock( 'vehiculos',
                                       FieldByName('id').AsString ) = true then
                         Edit
                    else Exit;
                end;

                Application.CreateForm(Tform_vehiculos_001, form_vehiculos_001);

                form_vehiculos_001.RadioGroup_Bajas.ItemIndex := RadioGroup_Bajas.ItemIndex;
                form_vehiculos_001.public_Menu_Worked         := public_Menu_Worked;

                if public_Solo_Ver = true then
                begin
                    form_vehiculos_001.public_Solo_Ver := true;
                end;

                form_vehiculos_001.para_Empezar;

                form_vehiculos_001.ShowModal;
                if form_vehiculos_001.public_Pulso_Aceptar = true then
                begin
                    if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( SQLQuery_Vehiculos ) = true then
                    begin
                        FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                        FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                        UTI_RGTRO_Grabar_Antes( 'vehiculos', SQLQuery_Vehiculos );
                    end else begin
                        Cancel;
                    end;
                end else begin
                    Cancel;
                end;

                form_vehiculos_001.Free;

                UTI_RGTRO_UnLock( 'vehiculos', var_id );
            end;
        end else begin
            var_msg.Add(rs_no_Hay_Rgtros);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        end;
    end;

    var_msg.Free;
end;

end.


