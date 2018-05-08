unit proveedores_004;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons, ComCtrls, DBGrids, DbCtrls, Grids, utilidades_forms_Filtrar, variants, utilidades_bd,
  utilidades_datos_tablas, utilidades_rgtro, utilidades_general;

type

  { Tform_proveedores_004 }

  Tform_proveedores_004 = class(TForm)
    BitBtn_Filtrar: TBitBtn;
    BitBtn_SALIR: TBitBtn;
    BitBtn_Seleccionar: TBitBtn;
    Boton_Elegir_Forma_Pago: TBitBtn;
    Boton_Elegir_Pais: TBitBtn;
    Boton_Elegir_Poblacion: TBitBtn;
    Boton_Elegir_proveedores_tipos: TBitBtn;
    Boton_Elegir_Provincia: TBitBtn;
    ComboBox_Filtros: TComboBox;
    DataSource_Proveedores: TDataSource;
    DBGrid_Principal: TDBGrid;
    DBNavigator1: TDBNavigator;
    Edit_Descripcion_Forma_Pago: TEdit;
    Edit_Descripcion_Pais: TEdit;
    Edit_Descripcion_Poblacion: TEdit;
    Edit_Descripcion_proveedores_tipos: TEdit;
    Edit_Descripcion_Provincia: TEdit;
    Edit_id_Forma_Pago: TEdit;
    Edit_id_paises: TEdit;
    Edit_id_poblaciones: TEdit;
    Edit_id_proveedores_tipos: TEdit;
    Edit_id_provincias: TEdit;
    Edit_NIF: TEdit;
    Edit_Nombre_Comercial: TEdit;
    Edit_nombre_propietario: TEdit;
    Label10: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label_Cambiable_1: TLabel;
    Label_Fecha2: TLabel;
    Memo_Filtros: TMemo;
    Memo_OrderBy: TMemo;
    PageControl_Filtros: TPageControl;
    RadioGroup_Bajas: TRadioGroup;
    SQLQuery_Proveedores: TSQLQuery;
    SQLQuery_ProveedoresChange_Id_User: TLargeintField;
    SQLQuery_ProveedoresChange_WHEN: TDateTimeField;
    SQLQuery_ProveedoresCodigo_Postal: TStringField;
    SQLQuery_ProveedoresCta_Bco_BIC_SWIFT: TStringField;
    SQLQuery_ProveedoresCta_Bco_Codigo_Postal: TStringField;
    SQLQuery_ProveedoresCta_Bco_Cuenta: TStringField;
    SQLQuery_ProveedoresCta_Bco_Digito_Control: TStringField;
    SQLQuery_ProveedoresCta_Bco_Direccion: TStringField;
    SQLQuery_ProveedoresCta_Bco_Direccion_Numero: TStringField;
    SQLQuery_ProveedoresCta_Bco_Direccion_Piso_Letra: TStringField;
    SQLQuery_ProveedoresCta_Bco_Entidad: TStringField;
    SQLQuery_ProveedoresCta_Bco_IBAN: TStringField;
    SQLQuery_ProveedoresCta_Bco_Mandato_Fecha_de_Firma: TDateTimeField;
    SQLQuery_ProveedoresCta_Bco_Mandato_Ref: TStringField;
    SQLQuery_ProveedoresCta_Bco_Sucursal: TStringField;
    SQLQuery_ProveedoresCuenta_Contable: TStringField;
    SQLQuery_ProveedoresDel_Id_User: TLargeintField;
    SQLQuery_ProveedoresDel_WHEN: TDateTimeField;
    SQLQuery_ProveedoresDel_WHY: TStringField;
    SQLQuery_ProveedoresDescuento_Comercial_1: TBCDField;
    SQLQuery_ProveedoresDescuento_Comercial_2: TBCDField;
    SQLQuery_ProveedoresDescuento_Final: TBCDField;
    SQLQuery_ProveedoresDescuento_Linea: TBCDField;
    SQLQuery_ProveedoresDescuento_Pronto_Pago: TBCDField;
    SQLQuery_ProveedoresDireccion: TStringField;
    SQLQuery_ProveedoresDireccion_Numero: TStringField;
    SQLQuery_ProveedoresDireccion_Piso_Letra: TStringField;
    SQLQuery_ProveedoreseMail: TStringField;
    SQLQuery_ProveedoresFAX: TStringField;
    SQLQuery_ProveedoresForma_pago_Dia_1: TSmallintField;
    SQLQuery_ProveedoresForma_pago_Dia_2: TSmallintField;
    SQLQuery_ProveedoresForma_pago_Vacaciones_Dia_Fin: TSmallintField;
    SQLQuery_ProveedoresForma_pago_Vacaciones_Dia_Inicio: TSmallintField;
    SQLQuery_ProveedoresForma_pago_Vacaciones_Mes_Fin: TSmallintField;
    SQLQuery_ProveedoresForma_pago_Vacaciones_Mes_Inicio: TSmallintField;
    SQLQuery_Proveedoresid: TLargeintField;
    SQLQuery_Proveedoresid_actividades: TLargeintField;
    SQLQuery_Proveedoresid_Agencias_Transporte: TLargeintField;
    SQLQuery_Proveedoresid_Cta_Bco_pais: TLargeintField;
    SQLQuery_Proveedoresid_Cta_Bco_poblaciones: TLargeintField;
    SQLQuery_Proveedoresid_Cta_Bco_provincias: TLargeintField;
    SQLQuery_Proveedoresid_formas_pago: TLargeintField;
    SQLQuery_Proveedoresid_paises: TLargeintField;
    SQLQuery_Proveedoresid_poblaciones: TLargeintField;
    SQLQuery_Proveedoresid_proveedores_tipos: TLargeintField;
    SQLQuery_Proveedoresid_provincias: TLargeintField;
    SQLQuery_ProveedoresInsert_Id_User: TLargeintField;
    SQLQuery_ProveedoresInsert_WHEN: TDateTimeField;
    SQLQuery_ProveedoresIVA_con_Recargo_SN: TStringField;
    SQLQuery_ProveedoresIVA_Excluido_SN: TStringField;
    SQLQuery_ProveedoresMovil: TStringField;
    SQLQuery_Proveedoresnif_cif: TStringField;
    SQLQuery_Proveedoresnombre_comercial: TStringField;
    SQLQuery_Proveedoresnombre_propietario: TStringField;
    SQLQuery_ProveedoresObservaciones_Comentarios: TStringField;
    SQLQuery_ProveedoresOT_Cta_Bco_descripcion_pais: TStringField;
    SQLQuery_ProveedoresOT_Cta_Bco_descripcion_poblacion: TStringField;
    SQLQuery_ProveedoresOT_Cta_Bco_descripcion_provincia: TStringField;
    SQLQuery_ProveedoresOT_Cuenta_Contable_proveedor_tipo: TStringField;
    SQLQuery_ProveedoresOT_descripcion_agencia_transporte: TStringField;
    SQLQuery_ProveedoresOT_descripcion_forma_pago: TStringField;
    SQLQuery_ProveedoresOT_descripcion_pais: TStringField;
    SQLQuery_ProveedoresOT_descripcion_poblacion: TStringField;
    SQLQuery_ProveedoresOT_descripcion_proveedor_tipo: TStringField;
    SQLQuery_ProveedoresOT_descripcion_provincia: TStringField;
    SQLQuery_ProveedoresOT_Movil_agencia_transporte: TStringField;
    SQLQuery_ProveedoresOT_Tfno_Fijo_1_agencia_transporte: TStringField;
    SQLQuery_ProveedoresOT_todos_los_Tfnos: TStringField;
    SQLQuery_ProveedoresOT_Vencimientos_1_Dias: TSmallintField;
    SQLQuery_ProveedoresOT_Vencimientos_Cantidad: TSmallintField;
    SQLQuery_ProveedoresOT_Vencimientos_Dias_Entre: TSmallintField;
    SQLQuery_Proveedorespagina_web: TStringField;
    SQLQuery_ProveedoresRetencion: TBCDField;
    SQLQuery_ProveedoresTfno_Fijo_1: TStringField;
    SQLQuery_ProveedoresTfno_Fijo_2: TStringField;
    SQLQuery_ProveedoresVencimientos_automaticos_SN: TStringField;
    TabSheet_Busqueda_Concreta: TTabSheet;
    TabSheet_Filtros_Generales: TTabSheet;

    procedure ComboBox_FiltrosChange(Sender: TObject);
    procedure Filtrar_Principal_Sin_Preguntar;
    procedure Presentar_Datos;
    procedure BitBtn_FiltrarClick(Sender: TObject);
    procedure no_Tocar;
    procedure BitBtn_SeleccionarClick(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure Seleccionado_Rgtro;
    procedure BitBtn_SALIRClick(Sender: TObject);
    procedure DBGrid_PrincipalCellClick(Column: TColumn);
    procedure DBGrid_PrincipalDblClick(Sender: TObject);
    procedure DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Refrescar_Registros;
    procedure Filtrar_tablas_ligadas;
    function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
    procedure Cerramos_Tablas;
    procedure Cerramos_Tablas_Ligadas;
    procedure para_Empezar;
    procedure Obligar_como_Filtrado_Principal;
    procedure Boton_Elegir_Forma_PagoClick(Sender: TObject);
    procedure Boton_Elegir_PaisClick(Sender: TObject);
    procedure Boton_Elegir_PoblacionClick(Sender: TObject);
    procedure Boton_Elegir_proveedores_tiposClick(Sender: TObject);
    procedure Boton_Elegir_ProvinciaClick(Sender: TObject);
    procedure Edit_Descripcion_Forma_PagoClick(Sender: TObject);
    procedure Edit_Descripcion_PaisClick(Sender: TObject);
    procedure Edit_Descripcion_PoblacionClick(Sender: TObject);
    procedure Edit_Descripcion_proveedores_tiposClick(Sender: TObject);
    procedure Edit_Descripcion_ProvinciaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SQLQuery_ProveedoresAfterPost(DataSet: TDataSet);
    procedure SQLQuery_ProveedoresAfterScroll(DataSet: TDataSet);
    procedure SQLQuery_ProveedoresBeforePost(DataSet: TDataSet);
    procedure SQLQuery_ProveedoresCalcFields(DataSet: TDataSet);

  private
    { private declarations }
    private_Salir_OK : Boolean;
    private_Order_By : array of TOrder_By;
  public
    { public declarations }
    public_Solo_Ver                     : Boolean;
    public_Elegimos                     : Boolean;
    public_Menu_Worked                  : Integer;
    public_Rgtro_Seleccionado           : Boolean;
    public_id_que_no_tiene_que_aparecer : ShortString;
  end;

var
  form_proveedores_004: Tform_proveedores_004;

implementation

{$R *.lfm}

uses menu, dm_proveedores_elegir;

{ Tform_proveedores_004 }

procedure Tform_proveedores_004.Boton_Elegir_proveedores_tiposClick(
  Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_TiposProveedores( true, false, 140, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_proveedores_tipos.Text          := Trim(var_Registro.id_1);
        Edit_Descripcion_proveedores_tipos.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_proveedores_004.Boton_Elegir_ProvinciaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Provincias( true, false, 100, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_provincias.Text         := Trim(var_Registro.id_1);
        Edit_Descripcion_Provincia.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_proveedores_004.Edit_Descripcion_Forma_PagoClick(Sender: TObject
  );
begin
    Edit_id_Forma_Pago.Text          := '';
    Edit_Descripcion_Forma_Pago.Text := '';
end;

procedure Tform_proveedores_004.Edit_Descripcion_PaisClick(Sender: TObject);
begin
    Edit_id_paises.Text        := '';
    Edit_Descripcion_Pais.Text := '';
end;

procedure Tform_proveedores_004.Edit_Descripcion_PoblacionClick(Sender: TObject
  );
begin
    Edit_id_poblaciones.Text        := '';
    Edit_Descripcion_Poblacion.Text := '';
end;

procedure Tform_proveedores_004.Edit_Descripcion_proveedores_tiposClick(
  Sender: TObject);
begin
    Edit_id_proveedores_tipos.Text          := '';
    Edit_Descripcion_proveedores_tipos.Text := '';
end;

procedure Tform_proveedores_004.Edit_Descripcion_ProvinciaClick(Sender: TObject
  );
begin
    Edit_id_provincias.Text         := '';
    Edit_Descripcion_Provincia.Text := '';
end;

procedure Tform_proveedores_004.FormActivate(Sender: TObject);
begin
    If public_Elegimos = true then
    begin
        BitBtn_Seleccionar.Visible := True;

        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    if public_Solo_Ver = true then no_Tocar;
end;

procedure Tform_proveedores_004.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
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
    end else begin
      { ********************************************************************
        Fue correcto el modo como quiere BitBtn_SALIR de la aplicación
        ******************************************************************** }
    end;
end;

procedure Tform_proveedores_004.FormCreate(Sender: TObject);
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
      public_Solo_Ver                 := false;
      public_Elegimos                 := false;

      public_Rgtro_Seleccionado       := false;
end;

procedure Tform_proveedores_004.FormDestroy(Sender: TObject);
begin
    Cerramos_Tablas;
end;

procedure Tform_proveedores_004.Boton_Elegir_Forma_PagoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_FormasPago( true, false, 80, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Forma_Pago.Text          := Trim(var_Registro.id_1);
        Edit_Descripcion_Forma_Pago.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_proveedores_004.Boton_Elegir_PaisClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Paises( true, false, 60, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_paises.Text        := Trim(var_Registro.id_1);
        Edit_Descripcion_Pais.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_proveedores_004.Boton_Elegir_PoblacionClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Poblaciones( true, false, 110, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_poblaciones.Text        := Trim(var_Registro.id_1);
        Edit_Descripcion_Poblacion.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_proveedores_004.para_Empezar;
begin
  { ****************************************************************************
    Solo para formularios que traten con datos
    **************************************************************************** }
    if UTI_GEN_Form_Abierto_Ya('DataModule_Proveedores_Elegir') = False then
    begin
        DataModule_Proveedores_Elegir := TDataModule_Proveedores_Elegir.Create(Application);
    end;

  { ****************************************************************************
    Preparamos los diferentes tipos de orden preconfigurados
    **************************************************************************** }
    // PROVEEDORES
    SetLength(private_Order_By, 4);

    private_Order_By[0].Titulo       := 'Por nombre / razón social'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[0].Memo_OrderBy := 'pr.nombre_propietario ASC';

    private_Order_By[1].Titulo       := 'Por nombre comercial';
    private_Order_By[1].Memo_OrderBy := 'pr.nombre_comercial ASC';

    private_Order_By[2].Titulo       := 'Por NIF / CIF';
    private_Order_By[2].Memo_OrderBy := 'pr.nif_cif ASC';

    private_Order_By[3].Titulo       := 'Por la id';
    private_Order_By[3].Memo_OrderBy := 'pr.id ASC';

    Memo_OrderBy.Lines.Text          := private_Order_By[0].Memo_OrderBy;

    UTI_TB_Rellenar_ComboBox_Orden( true,
                                    ComboBox_Filtros,
                                    private_Order_By,
                                    0 );

    Obligar_como_Filtrado_Principal;

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

procedure Tform_proveedores_004.Obligar_como_Filtrado_Principal;
var
  var_SQL_ADD : TStrings;
begin
    var_SQL_ADD := TStringList.Create;

    if Trim(public_id_que_no_tiene_que_aparecer) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pr.id <> ' + Trim(public_id_que_no_tiene_que_aparecer) );
        UTI_TB_SQL_ADD( true,
                        Memo_Filtros.Lines,
                        var_SQL_ADD );
    end;

    var_SQL_ADD.Free;
end;

procedure Tform_proveedores_004.SQLQuery_ProveedoresAfterPost(DataSet: TDataSet
  );
begin
    UTI_RGTROS_Grabar( 'proveedores',
                       DataModule_Proveedores_Elegir.SQLTransaction_Pr_Elegir,
                       SQLQuery_Proveedores,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros;
end;

procedure Tform_proveedores_004.SQLQuery_ProveedoresAfterScroll(
  DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure Tform_proveedores_004.SQLQuery_ProveedoresBeforePost(DataSet: TDataSet
  );
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Proveedores );
end;

procedure Tform_proveedores_004.SQLQuery_ProveedoresCalcFields(DataSet: TDataSet
  );
begin
    with SQLQuery_Proveedores do
    begin
        // TELEFONOS
        FieldByName('OT_todos_los_Tfnos').AsString := '';

        if Trim(FieldByName('Tfno_Fijo_1').AsString) <> '' then
        begin
            if Trim(FieldByName('OT_todos_los_Tfnos').AsString) <> '' then
            begin
                FieldByName('OT_todos_los_Tfnos').AsString :=
                      Trim(FieldByName('OT_todos_los_Tfnos').AsString) + ', ';
            end;

            FieldByName('OT_todos_los_Tfnos').AsString :=
                  Trim(FieldByName('OT_todos_los_Tfnos').AsString) + ' ' +
                  Trim(FieldByName('Tfno_Fijo_1').AsString);
        end;

        if Trim(FieldByName('Tfno_Fijo_2').AsString) <> '' then
        begin
            if Trim(FieldByName('OT_todos_los_Tfnos').AsString) <> '' then
            begin
                FieldByName('OT_todos_los_Tfnos').AsString :=
                      Trim(FieldByName('OT_todos_los_Tfnos').AsString) + ', ';
            end;

            FieldByName('OT_todos_los_Tfnos').AsString :=
                  Trim(FieldByName('OT_todos_los_Tfnos').AsString) + ' ' +
                  Trim(FieldByName('Tfno_Fijo_2').AsString);
        end;

        if Trim(FieldByName('Movil').AsString) <> '' then
        begin
            if Trim(FieldByName('OT_todos_los_Tfnos').AsString) <> '' then
            begin
                FieldByName('OT_todos_los_Tfnos').AsString :=
                      Trim(FieldByName('OT_todos_los_Tfnos').AsString) + ', ';
            end;

            FieldByName('OT_todos_los_Tfnos').AsString :=
                  Trim(FieldByName('OT_todos_los_Tfnos').AsString) + ' ' +
                  Trim(FieldByName('Movil').AsString);
        end;
    end;
end;

procedure Tform_proveedores_004.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_Proveedores_Elegir.SQLConnector_Pr_Elegir,
                      DataModule_Proveedores_Elegir.SQLTransaction_Pr_Elegir,
                      SQLQuery_Proveedores ) = false then UTI_GEN_Salir;

    DataModule_Proveedores_Elegir.Free;
end;

procedure Tform_proveedores_004.Cerramos_Tablas_Ligadas;
begin
{ ESTE form NO TIENE TABLAS LIGADAS

    if UTI_TB_Cerrar( DataModule_del_form_000.SQLConnector_de_la_tabla,
                      DataModule_Users.SQLTransaction_de_la_tabla,
                      SQLQuery_la_tabla ) = false then UTI_GEN_Salir;
}
end;

procedure Tform_proveedores_004.Refrescar_Registros;
var var_nombre_propietario : String;
    var_nif_cif            : String;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_nombre_propietario := '';
    var_nif_cif            := '';

    if SQLQuery_Proveedores.RecordCount > 0 then
    begin
        var_nombre_propietario := SQLQuery_Proveedores.FieldByName('nombre_propietario').asString;
        var_nif_cif            := SQLQuery_Proveedores.FieldByName('nif_cif').asString;
    end;

    Filtrar_Principal_Sin_Preguntar;

    if Trim(var_nombre_propietario) <> '' then
    begin
         SQLQuery_Proveedores.Locate( 'nombre_propietario;nif_cif',
                                   VarArrayOf( [ var_nombre_propietario, var_nif_cif ] ),
                                   [] );
    end;
end;

procedure Tform_proveedores_004.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    If public_Elegimos then Seleccionado_Rgtro;
end;

procedure Tform_proveedores_004.DBGrid_PrincipalDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    UTI_GEN_Dibujar_Grid( Sender, SQLQuery_Proveedores, Rect, DataCol, Column, State );
end;

procedure Tform_proveedores_004.DBGrid_PrincipalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if Key = 13 then
    begin
        If public_Elegimos then Seleccionado_Rgtro;
    end;
end;

procedure Tform_proveedores_004.DBGrid_PrincipalKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

procedure Tform_proveedores_004.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure Tform_proveedores_004.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_proveedores_004.Filtrar_tablas_ligadas;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
begin
    if SQLQuery_Proveedores.RecordCount = 0 then Exit;

    if SQLQuery_Proveedores.State = dsInsert then
    begin
        Cerramos_Tablas_Ligadas;
        Exit;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    // ********************************************************************************************* //
    // ** NO TIENE TABLAS LIGADAS                                                                 ** //
    // ********************************************************************************************* //

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;
end;

function Tform_proveedores_004.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
var
  var_a_Filtrar : TStrings;
  var_SQL_ADD   : TStrings;
begin
    var_SQL_ADD := TStringList.Create;

    var_a_Filtrar := TStringList.Create;
    var_a_Filtrar.Clear;

    Obligar_como_Filtrado_Principal;

    // ********************************************************************************************* //
    // ** AHORA PONDREMOS EL RESTO DE LOS FILTROS QUE NO SON GENERALES                            ** //
    // ********************************************************************************************* //
    // ** Primero buscaremos en a quien facturamos ... nombre_propietario                         ** //
    // ********************************************************************************************* //
    if Trim(Edit_nombre_propietario.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pr.nombre_propietario LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_nombre_propietario.Text) + '%') );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos en el nombre comercial                                                 ** //
    // ********************************************************************************************* //
    if Trim(Edit_Nombre_Comercial.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pr.nombre_comercial LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Nombre_Comercial.Text) + '%') );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos en el NIF                                                              ** //
    // ********************************************************************************************* //
    if Trim(Edit_NIF.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pr.nif_cif LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_NIF.Text) + '%') );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por EL TIPO DE CLIENTE                                                 ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_proveedores_tipos.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pr.id_proveedores_tipos = ' + Trim(Edit_id_proveedores_tipos.Text) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la forma de pago                                                   ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Forma_Pago.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pr.id_formas_pago = ' + Trim(Edit_id_Forma_Pago.Text) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la población                                                       ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_poblaciones.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pr.id_poblaciones = ' + Trim(Edit_id_poblaciones.Text) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la provincia                                                       ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_provincias.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pr.id_provincias = ' + Trim(Edit_id_provincias.Text) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por el pais                                                            ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_paises.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pr.id_paises = ' + Trim(Edit_id_paises.Text) );
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
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Proveedores,
                                                            'proveedores',
                                                            'u' ),

                              // Insert_SQL,
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Proveedores,
                                                            'proveedores',
                                                            'i' ),

                              // var_ctdad_Rgtros,
                              -1,

                              DataModule_Proveedores_Elegir.SQLTransaction_Pr_Elegir,
                              DataModule_Proveedores_Elegir.SQLConnector_Pr_Elegir,
                              SQLQuery_Proveedores,

                              // name_tabla,
                              'pr',

                              RadioGroup_Bajas.ItemIndex,

                              // SELECT_SQL,
                              'SELECT pr.*,' + ' ' +

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
                              'ON pr.id_Agencias_Transporte = agprv.id' + ' ',

                              Memo_Filtros.Lines,
                              Memo_OrderBy.Lines,
                              var_a_Filtrar,

                              param_Cambiamos_Filtro,
                              false,   // param_ver_SQL_despues_Abrir : Boolean;
                              true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

    var_a_Filtrar.Free;

    //Filtrar_tablas_ligadas;
    var_SQL_ADD.Free;
end;

procedure Tform_proveedores_004.Seleccionado_Rgtro;
begin
    private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    public_Rgtro_Seleccionado := true;
    Close;
end;

procedure Tform_proveedores_004.BitBtn_SeleccionarClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
end;

procedure Tform_proveedores_004.DBNavigator1BeforeAction(Sender: TObject;
  Button: TDBNavButtonType);
begin
    //Filtrar_tablas_ligadas;

    case Button of
        nbRefresh : begin
            Refrescar_Registros;
            Abort;
        end;
    end;
end;

procedure Tform_proveedores_004.no_Tocar;
begin
    // No hay nada para no tocar
end;

procedure Tform_proveedores_004.BitBtn_FiltrarClick(Sender: TObject);
begin
    if PageControl_Filtros.ActivePage = TabSheet_Busqueda_Concreta then
    begin
        Filtrar_Principal_Sin_Preguntar;
    end else begin
        RadioGroup_Bajas.ItemIndex := Filtrar_Principal( true );
    end;
end;

procedure Tform_proveedores_004.Presentar_Datos;
begin
    // No hay nada para presentar
end;

procedure Tform_proveedores_004.Filtrar_Principal_Sin_Preguntar;
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

procedure Tform_proveedores_004.ComboBox_FiltrosChange(Sender: TObject);
begin
    Memo_OrderBy.Lines.Clear;
    Memo_OrderBy.Lines.Add( private_Order_By[ComboBox_Filtros.ItemIndex].Memo_OrderBy );
    BitBtn_FiltrarClick(Nil);
end;

end.

