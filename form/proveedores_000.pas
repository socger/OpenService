unit proveedores_000;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs, Buttons, StdCtrls,
    utilidades_rgtro, utilidades_general, utilidades_bd, ExtCtrls, DBGrids, DbCtrls, Grids, ComCtrls,
    utilidades_datos_tablas, utilidades_usuarios, variants, utilidades_forms_Filtrar;

type

    { Tform_proveedores_000 }

    Tform_proveedores_000 = class(TForm)
      BitBtn_Filtrar: TBitBtn;
      BitBtn_Imprimir: TBitBtn;
      BitBtn_SALIR: TBitBtn;
      BitBtn_Seleccionar: TBitBtn;
        BitBtn_Ver_Situacion_Registro: TBitBtn;
        Boton_Elegir_Forma_Pago: TBitBtn;
        Boton_Elegir_Pais: TBitBtn;
        Boton_Elegir_Poblacion: TBitBtn;
        Boton_Elegir_Actividad: TBitBtn;
        Boton_Elegir_proveedores_tipos: TBitBtn;
        Boton_Elegir_Provincia: TBitBtn;
        ComboBox_Filtros: TComboBox;
        DataSource_Proveedores: TDataSource;
        DataSource_Proveedores_Contactos: TDataSource;
        DBGrid_Principal: TDBGrid;
        DBNavigator1: TDBNavigator;
        Edit_Descripcion_Forma_Pago: TEdit;
        Edit_Descripcion_Pais: TEdit;
        Edit_Descripcion_Poblacion: TEdit;
        Edit_Descripcion_Actividad: TEdit;
        Edit_Descripcion_proveedores_tipos: TEdit;
        Edit_Descripcion_Provincia: TEdit;
        Edit_id_Forma_Pago: TEdit;
        Edit_id_paises: TEdit;
        Edit_id_poblaciones: TEdit;
        Edit_id_Actividad: TEdit;
        Edit_id_proveedores_tipos: TEdit;
        Edit_id_provincias: TEdit;
        Edit_NIF: TEdit;
        Edit_Nombre_Comercial: TEdit;
        Edit_nombre_propietario: TEdit;
        Image_Confirmado: TImage;
        Label10: TLabel;
        Label45: TLabel;
        Label46: TLabel;
        Label47: TLabel;
        Label48: TLabel;
        Label49: TLabel;
        Label50: TLabel;
        Label6: TLabel;
        Label7: TLabel;
        Label8: TLabel;
        Label9: TLabel;
        Label_Ctdad_Rgtros: TLabel;
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
        SQLQuery_ProveedoresOT_descripcion_actividad: TStringField;
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
        SQLQuery_Proveedores_Contactos: TSQLQuery;
        SQLQuery_Proveedores_ContactosCargo_Puesto: TStringField;
        SQLQuery_Proveedores_ContactosChange_Id_User: TLargeintField;
        SQLQuery_Proveedores_ContactosChange_WHEN: TDateTimeField;
        SQLQuery_Proveedores_ContactosDel_Id_User: TLargeintField;
        SQLQuery_Proveedores_ContactosDel_WHEN: TDateTimeField;
        SQLQuery_Proveedores_ContactosDel_WHY: TStringField;
        SQLQuery_Proveedores_ContactoseMail: TStringField;
        SQLQuery_Proveedores_ContactosFAX: TStringField;
        SQLQuery_Proveedores_ContactosFecha_Nacimiento: TDateTimeField;
        SQLQuery_Proveedores_Contactosid: TLargeintField;
        SQLQuery_Proveedores_Contactosid_proveedores: TLargeintField;
        SQLQuery_Proveedores_ContactosInsert_Id_User: TLargeintField;
        SQLQuery_Proveedores_ContactosInsert_WHEN: TDateTimeField;
        SQLQuery_Proveedores_ContactosMovil: TStringField;
        SQLQuery_Proveedores_Contactosnif_cif: TStringField;
        SQLQuery_Proveedores_Contactosnombre: TStringField;
        SQLQuery_Proveedores_ContactosOT_todos_los_Tfnos: TStringField;
        SQLQuery_Proveedores_Contactospagina_web: TStringField;
        SQLQuery_Proveedores_ContactosTfno_Fijo_1: TStringField;
        SQLQuery_Proveedores_ContactosTfno_Fijo_2: TStringField;
        TabSheet_Busqueda_Concreta: TTabSheet;
        TabSheet_Filtros_Generales: TTabSheet;

        procedure Boton_Elegir_ActividadClick(Sender: TObject);
        procedure Boton_Elegir_Forma_PagoClick(Sender: TObject);
        procedure Boton_Elegir_PaisClick(Sender: TObject);
        procedure Boton_Elegir_PoblacionClick(Sender: TObject);
        procedure Boton_Elegir_proveedores_tiposClick(Sender: TObject);
        procedure Boton_Elegir_ProvinciaClick(Sender: TObject);
        procedure ComboBox_FiltrosChange(Sender: TObject);
        procedure Edit_Descripcion_ActividadClick(Sender: TObject);
        procedure Edit_Descripcion_Forma_PagoClick(Sender: TObject);
        procedure Edit_Descripcion_PaisClick(Sender: TObject);
        procedure Edit_Descripcion_PoblacionClick(Sender: TObject);
        procedure Edit_Descripcion_proveedores_tiposClick(Sender: TObject);
        procedure Edit_Descripcion_ProvinciaClick(Sender: TObject);
        procedure Filtrar_Principal_Sin_Preguntar;
        procedure FormCreate(Sender: TObject);
        procedure Refrescar_Registros;
        procedure BitBtn_FiltrarClick(Sender: TObject);
        procedure BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
        procedure Presentar_Datos;
        procedure no_Tocar;
        procedure BitBtn_ImprimirClick(Sender: TObject);
        procedure Editar_Registro;
        procedure Insertar_Registro;
        procedure BitBtn_SeleccionarClick(Sender: TObject);
        procedure DBGrid_PrincipalCellClick(Column: TColumn);
        procedure DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
        procedure Seleccionado_Rgtro;
        procedure DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure BitBtn_SALIRClick(Sender: TObject);
        procedure DBGrid_PrincipalDblClick(Sender: TObject);
        procedure DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
        function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
        function  Filtrar_proveedores_contactos( param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
        procedure Filtrar_tablas_ligadas;
        procedure RadioGroup_BajasClick(Sender: TObject);
        procedure Refrescar_Registros_Contactos;
        procedure Cerramos_Tablas;
        procedure Cerramos_Tablas_Ligadas;
        procedure FormActivate(Sender: TObject);
        procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
        procedure para_Empezar;
        procedure FormDestroy(Sender: TObject);
        procedure SQLQuery_ProveedoresAfterPost(DataSet: TDataSet);
        procedure SQLQuery_ProveedoresAfterScroll(DataSet: TDataSet);
        procedure SQLQuery_ProveedoresBeforeEdit(DataSet: TDataSet);
        procedure SQLQuery_ProveedoresBeforePost(DataSet: TDataSet);
        procedure SQLQuery_ProveedoresCalcFields(DataSet: TDataSet);
        procedure SQLQuery_Proveedores_ContactosAfterPost(DataSet: TDataSet);
        procedure SQLQuery_Proveedores_ContactosBeforeEdit(DataSet: TDataSet);
        procedure SQLQuery_Proveedores_ContactosBeforePost(DataSet: TDataSet);
        procedure SQLQuery_Proveedores_ContactosCalcFields(DataSet: TDataSet);

    private
        { private declarations }
        private_Salir_OK           : Boolean;
        private_Order_By           : array of TOrder_By;
        private_Order_By_contactos : array of TOrder_By;
    public
        { public declarations }
        public_Solo_Ver           : Boolean;
        public_Elegimos           : Boolean;
        public_Menu_Worked        : Integer;
        public_Rgtro_Seleccionado : Boolean;
    end;

var
    form_proveedores_000: Tform_proveedores_000;

implementation

{$R *.lfm}

uses dm_proveedores, menu, proveedores_001;

{ Tform_proveedores_000 }

procedure Tform_proveedores_000.FormActivate(Sender: TObject);
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

procedure Tform_proveedores_000.FormClose(Sender: TObject; var CloseAction: TCloseAction);
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

procedure Tform_proveedores_000.FormDestroy(Sender: TObject);
begin
    Cerramos_Tablas;
end;

procedure Tform_proveedores_000.SQLQuery_ProveedoresAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'proveedores',
                       DataModule_Proveedores.SQLTransaction_Proveedores,
                       SQLQuery_Proveedores,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros;
end;

procedure Tform_proveedores_000.SQLQuery_ProveedoresAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure Tform_proveedores_000.SQLQuery_ProveedoresBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Proveedores );
end;

procedure Tform_proveedores_000.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_Proveedores.SQLConnector_Proveedores,
                      DataModule_Proveedores.SQLTransaction_Proveedores,
                      SQLQuery_Proveedores ) = false then UTI_GEN_Salir;

    DataModule_Proveedores.Free;
end;

procedure Tform_proveedores_000.Cerramos_Tablas_Ligadas;
begin
    if UTI_TB_Cerrar( DataModule_Proveedores.SQLConnector_Proveedores_Contactos,
                      DataModule_Proveedores.SQLTransaction_Proveedores_Contactos,
                      SQLQuery_Proveedores_Contactos ) = false then UTI_GEN_Salir;
end;

procedure Tform_proveedores_000.SQLQuery_ProveedoresCalcFields(DataSet: TDataSet);
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

procedure Tform_proveedores_000.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    If public_Elegimos then
         Seleccionado_Rgtro
    else Editar_Registro;
end;

procedure Tform_proveedores_000.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_proveedores_000.RadioGroup_BajasClick(Sender: TObject);
begin
    Refrescar_Registros;
end;

procedure Tform_proveedores_000.SQLQuery_Proveedores_ContactosAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'proveedores_contactos',
                       DataModule_Proveedores.SQLTransaction_Proveedores_Contactos,
                       SQLQuery_Proveedores_Contactos,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros_Contactos;
end;

procedure Tform_proveedores_000.SQLQuery_Proveedores_ContactosBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Proveedores_Contactos );
end;

procedure Tform_proveedores_000.SQLQuery_Proveedores_ContactosCalcFields(DataSet: TDataSet);
begin
    with SQLQuery_Proveedores_Contactos do
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

procedure Tform_proveedores_000.Refrescar_Registros;
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

procedure Tform_proveedores_000.Filtrar_tablas_ligadas;
var
  var_Lineas_Filtro  : TStrings;
  var_Lineas_OrderBy : TStrings;
  var_SQL_ADD        : TStrings;
begin
    var_SQL_ADD := TStringList.Create;

    if SQLQuery_Proveedores.RecordCount = 0 then Exit;

    if SQLQuery_Proveedores.State = dsInsert then
    begin
        Cerramos_Tablas_Ligadas;
        Exit;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    // ********************************************************************************************* //
    // ** PROVEEDORES_CONTACTOS                                                                   ** //
    // ********************************************************************************************* //
    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'prc.id_proveedores = ' + SQLQuery_Proveedores.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_Lineas_OrderBy.Clear;
    Filtrar_proveedores_contactos( RadioGroup_Bajas.ItemIndex,
                                   false,
                                   var_Lineas_Filtro,
                                   var_Lineas_OrderBy );

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;
    var_SQL_ADD.Free;
end;

procedure Tform_proveedores_000.DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    UTI_GEN_Dibujar_Grid( Sender, SQLQuery_Proveedores, Rect, DataCol, Column, State );
end;

procedure Tform_proveedores_000.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then
    begin
        If public_Elegimos then
             Seleccionado_Rgtro
        else Editar_Registro;
    end;
end;

procedure Tform_proveedores_000.Seleccionado_Rgtro;
begin
    private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    public_Rgtro_Seleccionado := true;
    Close;
end;

procedure Tform_proveedores_000.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

procedure Tform_proveedores_000.DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
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
                UTI_RGTRO_Borrar( 'proveedores',
                                  SQLQuery_Proveedores,
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

procedure Tform_proveedores_000.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure Tform_proveedores_000.BitBtn_SeleccionarClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
end;

procedure Tform_proveedores_000.BitBtn_ImprimirClick(Sender: TObject);
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

    if Trim(Edit_nombre_propietario.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con quien factura %' +
                            Trim(Edit_nombre_propietario.Text) + '%';
    end;

    if Trim(Edit_Nombre_Comercial.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con nombre comercial %' +
                            Trim(Edit_Nombre_Comercial.Text) + '%';
    end;

    if Trim(Edit_NIF.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con N.I.F. %' +
                            Trim(Edit_NIF.Text) + '%';
    end;

    if Trim(Edit_Descripcion_Actividad.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con actividad = ' +
                            Trim(Edit_Descripcion_Actividad.Text);
    end;

    if Trim(Edit_Descripcion_proveedores_tipos.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con tipo de proveedor = ' +
                            Trim(Edit_Descripcion_proveedores_tipos.Text);
    end;

    if Trim(Edit_Descripcion_Forma_Pago.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con forma de pago = ' +
                            Trim(Edit_Descripcion_Forma_Pago.Text);
    end;

    if Trim(Edit_Descripcion_Poblacion.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con población = ' +
                            Trim(Edit_Descripcion_Poblacion.Text);
    end;

    if Trim(Edit_Descripcion_Provincia.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con provincia = ' +
                            Trim(Edit_Descripcion_Provincia.Text);
    end;

    if Trim(Edit_Descripcion_Pais.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con país = ' +
                            Trim(Edit_Descripcion_Pais.Text);
    end;

    // ********************************************************************************************* //
    // ** Configuramos la llamada al generador de informes                                        ** //
    // ********************************************************************************************* //
    var_Ficheros := TStringList.Create;

    UTI_GEN_Informes( var_Ordenado_por,
                      SQLQuery_Proveedores,
                      DataSource_Proveedores,
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

procedure Tform_proveedores_000.no_Tocar;
begin
    BitBtn_Imprimir.Enabled := False;
end;

procedure Tform_proveedores_000.Presentar_Datos;
begin
     /// guardar por lo que pueda pasar
end;

procedure Tform_proveedores_000.BitBtn_FiltrarClick(Sender: TObject);
begin
    if PageControl_Filtros.ActivePage = TabSheet_Busqueda_Concreta then
    begin
        Filtrar_Principal_Sin_Preguntar;
    end else begin
        RadioGroup_Bajas.ItemIndex := Filtrar_Principal( true );
    end;
end;

procedure Tform_proveedores_000.BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if SQLQuery_Proveedores.RecordCount > 0 then UTI_RGTRO_Ver_Estado_Registro( 'proveedores',
                                                                                    SQLQuery_Proveedores,
                                                                                    DataSource_Proveedores,
                                                                                    DBGrid_Principal );
    end;
end;

function Tform_proveedores_000.Filtrar_proveedores_contactos( param_ver_bajas : ShortInt;
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
    param_Lineas_OrderBy.Text := private_Order_By_contactos[0].Memo_OrderBy;
  end;

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  Result := UTI_TB_Filtrar( private_Order_By_contactos,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Proveedores_Contactos,
                                                          'proveedores_contactos',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Proveedores_Contactos,
                                                          'proveedores_contactos',
                                                          'i' ),
                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_Proveedores.SQLTransaction_Proveedores_Contactos,
                            DataModule_Proveedores.SQLConnector_Proveedores_Contactos,
                            SQLQuery_Proveedores_Contactos,

                            // name_tabla,
                            'prc',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT prc.*' + ' ' +
                            'FROM proveedores_contactos AS prc' + ' ',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_a_Filtrar_Plus.Free;
end;

function Tform_proveedores_000.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
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

                              DataModule_Proveedores.SQLTransaction_Proveedores,
                              DataModule_Proveedores.SQLConnector_Proveedores,
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

    Label_Ctdad_Rgtros.Caption := IntToStr(SQLQuery_Proveedores.RecordCount);

    if SQLQuery_Proveedores.RecordCount = 0 then
    begin
        Cerramos_Tablas_Ligadas;
    end;

    //Filtrar_tablas_ligadas;
    var_SQL_ADD.Free;
end;

procedure Tform_proveedores_000.Refrescar_Registros_Contactos;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
    var_nombre         : String;
    var_ver_Bajas      : ShortInt;
begin
    // ********************************************************************************************* //
    // ** Solo si la cabecera está en modo EDIT se abren las tablas hijas                         ** //
    // ********************************************************************************************* //
    if SQLQuery_Proveedores.State <> dsEdit then Exit;

    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_nombre := '';

    if SQLQuery_Proveedores_Contactos.RecordCount > 0 then
    begin
        var_nombre := SQLQuery_Proveedores_Contactos.FieldByName('nombre').Value;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Clear;
    var_Lineas_OrderBy.Clear;

    if Trim(SQLQuery_Proveedores.FieldByName('id').AsString) <> '' then
         var_Lineas_Filtro.Add('id_proveedores = ' + Trim(SQLQuery_Proveedores.FieldByName('id').AsString))
    else var_Lineas_Filtro.Add('id_proveedores = Null');

    var_ver_Bajas := RadioGroup_Bajas.ItemIndex;
    if UTI_GEN_Form_Abierto_Ya('form_proveedores_001') = true then
    begin
        var_ver_Bajas := form_proveedores_001.RadioGroup_Bajas.ItemIndex;
    end;

    Filtrar_proveedores_contactos( var_ver_Bajas,
                                   false,
                                   var_Lineas_Filtro,
                                   var_Lineas_OrderBy );

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;

    if Trim(var_nombre) <> '' then
    begin
         SQLQuery_Proveedores_Contactos.Locate( 'nombre',
                                                var_nombre,
                                                [] );
    end;
end;

procedure Tform_proveedores_000.Insertar_Registro;
var var_msg                : TStrings;
    var_nombre_propietario : String;
begin
    with SQLQuery_Proveedores do
    begin
        var_msg := TStringList.Create;

        if UTI_USR_Permiso_SN(public_Menu_Worked, 'A', True) = True then
        begin
            if public_Solo_Ver = True then
                begin
                    var_msg.Add(rs_Solo_Visualizar);
                    UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
                end
            else
                begin
                    Insert;

                    //Filtrar_tablas_ligadas;

                    FieldByName('Vencimientos_automaticos_SN').AsString := 'N';

                    FieldByName('IVA_con_Recargo_SN').AsString          := 'N';
                    FieldByName('IVA_Excluido_SN').AsString             := 'N';

                    Application.CreateForm(Tform_proveedores_001, form_proveedores_001);

                    form_proveedores_001.DBGrid_Contactos.Color := clSilver;

                    form_proveedores_001.RadioGroup_Bajas.ItemIndex := RadioGroup_Bajas.ItemIndex;

                    form_proveedores_001.para_Empezar;

                    form_proveedores_001.ShowModal;
                    if form_proveedores_001.public_Pulso_Aceptar = true then
                    begin
                        FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
                        FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                        var_nombre_propietario              := FieldByName('nombre_propietario').AsString;

                        UTI_RGTRO_Grabar_Antes( 'proveedores', SQLQuery_Proveedores );

                        form_proveedores_001.Free;

                        if var_nombre_propietario = FieldByName('nombre_propietario').AsString then
                        begin
                            Editar_Registro;
                        end;
                    end else begin
                        Cancel;
                        form_proveedores_001.Free;
                    end;
                end;
        end;

        var_msg.Free;
    end;
end;

procedure Tform_proveedores_000.FormCreate(Sender: TObject);
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

procedure Tform_proveedores_000.para_Empezar;
begin
  { ****************************************************************************
    Solo para formularios que traten con datos
    **************************************************************************** }
    if UTI_GEN_Form_Abierto_Ya('DataModule_Proveedores') = False then
    begin
        DataModule_Proveedores := TDataModule_Proveedores.Create(Application);
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

    // PROVEEDORES_CONTACTOS
    SetLength(private_Order_By_contactos, 1);

    private_Order_By_contactos[0].Titulo       := 'Por nombre'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_contactos[0].Memo_OrderBy := 'prc.id_proveedores ASC, prc.nombre ASC';

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

procedure Tform_proveedores_000.SQLQuery_ProveedoresBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Proveedores );
end;

procedure Tform_proveedores_000.SQLQuery_Proveedores_ContactosBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Proveedores_Contactos );
end;

procedure Tform_proveedores_000.Editar_Registro;
var var_msg : TStrings;
    var_id  : ShortString;
begin
    with SQLQuery_Proveedores do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
            begin
                var_id := FieldByName('id').AsString;

                if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
                begin
                    if UTI_RGTRO_isLock( 'proveedores',
                                         FieldByName('id').AsString,
                                         true ) = true then
                        begin
                            Exit;
                        end
                    else
                        begin
                            if UTI_RGTRO_Lock( 'proveedores',
                                               FieldByName('id').AsString ) = true then
                                 Edit
                            else Exit;
                        end;

                    Application.CreateForm(Tform_proveedores_001, form_proveedores_001);

                    form_proveedores_001.RadioGroup_Bajas.ItemIndex := RadioGroup_Bajas.ItemIndex;
                    form_proveedores_001.public_Menu_Worked         := public_Menu_Worked;

                    if public_Solo_Ver = true then
                    begin
                        form_proveedores_001.public_Solo_Ver := true;
                    end;

                    form_proveedores_001.para_Empezar;

                    form_proveedores_001.ShowModal;
                    if form_proveedores_001.public_Pulso_Aceptar = true then
                        begin
                            if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( SQLQuery_Proveedores ) = true then
                            begin
                                FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                                FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                                UTI_RGTRO_Grabar_Antes( 'proveedores', SQLQuery_Proveedores );
                            end else begin
                                Cancel;
                            end;
                        end
                    else Cancel;

                    form_proveedores_001.Free;

                    UTI_RGTRO_UnLock( 'proveedores',
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

procedure Tform_proveedores_000.Filtrar_Principal_Sin_Preguntar;
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

procedure Tform_proveedores_000.Boton_Elegir_Forma_PagoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_FormasPago( true, false, 80, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Forma_Pago.Text          := Trim(var_Registro.id_1);
        Edit_Descripcion_Forma_Pago.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_proveedores_000.Boton_Elegir_ActividadClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Actividades( true, false, 500, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Actividad.Text          := Trim(var_Registro.id_1);
        Edit_Descripcion_Actividad.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_proveedores_000.Boton_Elegir_PaisClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Paises( true, false, 60, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_paises.Text        := Trim(var_Registro.id_1);
        Edit_Descripcion_Pais.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_proveedores_000.Boton_Elegir_PoblacionClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Poblaciones( true, false, 110, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_poblaciones.Text        := Trim(var_Registro.id_1);
        Edit_Descripcion_Poblacion.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_proveedores_000.Boton_Elegir_proveedores_tiposClick(
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

procedure Tform_proveedores_000.Boton_Elegir_ProvinciaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Provincias( true, false, 100, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_provincias.Text         := Trim(var_Registro.id_1);
        Edit_Descripcion_Provincia.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_proveedores_000.ComboBox_FiltrosChange(Sender: TObject);
begin
    Memo_OrderBy.Lines.Clear;
    Memo_OrderBy.Lines.Add( private_Order_By[ComboBox_Filtros.ItemIndex].Memo_OrderBy );
    BitBtn_FiltrarClick(Nil);
end;

procedure Tform_proveedores_000.Edit_Descripcion_ActividadClick(Sender: TObject);
begin
    Edit_id_Actividad.Text          := '';
    Edit_Descripcion_Actividad.Text := '';
end;

procedure Tform_proveedores_000.Edit_Descripcion_Forma_PagoClick(Sender: TObject);
begin
    Edit_id_Forma_Pago.Text          := '';
    Edit_Descripcion_Forma_Pago.Text := '';
end;

procedure Tform_proveedores_000.Edit_Descripcion_PaisClick(Sender: TObject);
begin
    Edit_id_paises.Text        := '';
    Edit_Descripcion_Pais.Text := '';
end;

procedure Tform_proveedores_000.Edit_Descripcion_PoblacionClick(Sender: TObject);
begin
    Edit_id_poblaciones.Text        := '';
    Edit_Descripcion_Poblacion.Text := '';
end;

procedure Tform_proveedores_000.Edit_Descripcion_proveedores_tiposClick(
  Sender: TObject);
begin
    Edit_id_proveedores_tipos.Text          := '';
    Edit_Descripcion_proveedores_tipos.Text := '';
end;

procedure Tform_proveedores_000.Edit_Descripcion_ProvinciaClick(Sender: TObject);
begin
    Edit_id_provincias.Text         := '';
    Edit_Descripcion_Provincia.Text := '';
end;

end.


