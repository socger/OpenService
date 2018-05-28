unit representantes_000;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, sqldb, db, FileUtil, DateTimePicker, Forms, Controls, Graphics, Dialogs,
    Buttons, StdCtrls, utilidades_rgtro, utilidades_general, utilidades_bd, ExtCtrls, DBGrids,
    DbCtrls, Grids, ComCtrls, utilidades_datos_tablas, utilidades_usuarios, variants,
    utilidades_forms_Filtrar;

type

    { Tform_representantes_000 }

    Tform_representantes_000 = class(TForm)
      BitBtn_Filtrar: TBitBtn;
        BitBtn_Imprimir: TBitBtn;
        BitBtn_SALIR: TBitBtn;
        BitBtn_Seleccionar: TBitBtn;
        BitBtn_Ver_Situacion_Registro: TBitBtn;
        Boton_Elegir_Forma_Pago: TBitBtn;
        Boton_Elegir_Pais: TBitBtn;
        Boton_Elegir_Poblacion: TBitBtn;
        Boton_Elegir_Provincia: TBitBtn;
        ComboBox_Filtros: TComboBox;
        DataSource_Representantes: TDataSource;
        DateTimePicker_Nacido_Desde: TDateTimePicker;
        DateTimePicker_Nacido_Hasta: TDateTimePicker;
        DBGrid_Principal: TDBGrid;
        DBNavigator1: TDBNavigator;
        Edit_Descripcion_Forma_Pago: TEdit;
        Edit_Descripcion_Pais: TEdit;
        Edit_Descripcion_Poblacion: TEdit;
        Edit_Descripcion_Provincia: TEdit;
        Edit_id_Forma_Pago: TEdit;
        Edit_id_paises: TEdit;
        Edit_id_poblaciones: TEdit;
        Edit_id_provincias: TEdit;
        Edit_NIF: TEdit;
        Edit_nombre_propietario: TEdit;
        Label10: TLabel;
        Label15: TLabel;
        Label16: TLabel;
        Label45: TLabel;
        Label46: TLabel;
        Label47: TLabel;
        Label48: TLabel;
        Label6: TLabel;
        Label7: TLabel;
        Label8: TLabel;
        Label_Ctdad_Rgtros: TLabel;
        Label_Fecha2: TLabel;
        Memo_Filtros: TMemo;
        Memo_OrderBy: TMemo;
        PageControl_Filtros: TPageControl;
        RadioGroup_Bajas: TRadioGroup;
        SQLQuery_Representantes: TSQLQuery;
        SQLQuery_RepresentantesActivar_Proximidad_SN: TStringField;
        SQLQuery_RepresentantesChange_Id_User: TLargeintField;
        SQLQuery_RepresentantesChange_WHEN: TDateTimeField;
        SQLQuery_RepresentantesCodigo_Postal: TStringField;
        SQLQuery_RepresentantesComision: TBCDField;
        SQLQuery_RepresentantesCta_Bco_BIC_SWIFT: TStringField;
        SQLQuery_RepresentantesCta_Bco_Codigo_Postal: TStringField;
        SQLQuery_RepresentantesCta_Bco_Cuenta: TStringField;
        SQLQuery_RepresentantesCta_Bco_Digito_Control: TStringField;
        SQLQuery_RepresentantesCta_Bco_Direccion: TStringField;
        SQLQuery_RepresentantesCta_Bco_Direccion_Numero: TStringField;
        SQLQuery_RepresentantesCta_Bco_Direccion_Piso_Letra: TStringField;
        SQLQuery_RepresentantesCta_Bco_Entidad: TStringField;
        SQLQuery_RepresentantesCta_Bco_IBAN: TStringField;
        SQLQuery_RepresentantesCta_Bco_Mandato_Fecha_de_Firma: TDateTimeField;
        SQLQuery_RepresentantesCta_Bco_Mandato_Ref: TStringField;
        SQLQuery_RepresentantesCta_Bco_Sucursal: TStringField;
        SQLQuery_RepresentantesCuenta_Contable: TStringField;
        SQLQuery_RepresentantesDel_Id_User: TLargeintField;
        SQLQuery_RepresentantesDel_WHEN: TDateTimeField;
        SQLQuery_RepresentantesDel_WHY: TStringField;
        SQLQuery_RepresentantesDireccion: TStringField;
        SQLQuery_RepresentantesDireccion_Numero: TStringField;
        SQLQuery_RepresentantesDireccion_Piso_Letra: TStringField;
        SQLQuery_RepresentanteseMail: TStringField;
        SQLQuery_RepresentantesFAX: TStringField;
        SQLQuery_RepresentantesFecha_Nacimiento: TDateTimeField;
        SQLQuery_RepresentantesForma_pago_Dia_1: TSmallintField;
        SQLQuery_RepresentantesForma_pago_Dia_2: TSmallintField;
        SQLQuery_RepresentantesForma_pago_Vacaciones_Dia_Fin: TSmallintField;
        SQLQuery_RepresentantesForma_pago_Vacaciones_Dia_Inicio: TSmallintField;
        SQLQuery_RepresentantesForma_pago_Vacaciones_Mes_Fin: TSmallintField;
        SQLQuery_RepresentantesForma_pago_Vacaciones_Mes_Inicio: TSmallintField;
        SQLQuery_Representantesid: TLargeintField;
        SQLQuery_Representantesid_Cta_Bco_pais: TLargeintField;
        SQLQuery_Representantesid_Cta_Bco_poblaciones: TLargeintField;
        SQLQuery_Representantesid_Cta_Bco_provincias: TLargeintField;
        SQLQuery_Representantesid_formas_pago: TLargeintField;
        SQLQuery_Representantesid_paises: TLargeintField;
        SQLQuery_Representantesid_poblaciones: TLargeintField;
        SQLQuery_Representantesid_provincias: TLargeintField;
        SQLQuery_RepresentantesInsert_Id_User: TLargeintField;
        SQLQuery_RepresentantesInsert_WHEN: TDateTimeField;
        SQLQuery_RepresentantesIVA_con_Recargo_SN: TStringField;
        SQLQuery_RepresentantesIVA_Excluido_SN: TStringField;
        SQLQuery_RepresentantesMovil: TStringField;
        SQLQuery_Representantesnif_cif: TStringField;
        SQLQuery_Representantesnombre_comercial: TStringField;
        SQLQuery_Representantesnombre_propietario: TStringField;
        SQLQuery_RepresentantesObservaciones_Comentarios: TStringField;
        SQLQuery_RepresentantesOT_Cta_Bco_descripcion_pais: TStringField;
        SQLQuery_RepresentantesOT_Cta_Bco_descripcion_poblacion: TStringField;
        SQLQuery_RepresentantesOT_Cta_Bco_descripcion_provincia: TStringField;
        SQLQuery_RepresentantesOT_descripcion_forma_pago: TStringField;
        SQLQuery_RepresentantesOT_descripcion_pais: TStringField;
        SQLQuery_RepresentantesOT_descripcion_poblacion: TStringField;
        SQLQuery_RepresentantesOT_descripcion_provincia: TStringField;
        SQLQuery_RepresentantesOT_todos_los_Tfnos: TStringField;
        SQLQuery_RepresentantesOT_Vencimientos_1_Dias: TSmallintField;
        SQLQuery_RepresentantesOT_Vencimientos_Cantidad: TSmallintField;
        SQLQuery_RepresentantesOT_Vencimientos_Dias_Entre: TSmallintField;
        SQLQuery_Representantespagina_web: TStringField;
        SQLQuery_RepresentantesRetencion: TBCDField;
        SQLQuery_RepresentantesSaldo_Acumulado: TBCDField;
        SQLQuery_RepresentantesTfno_Fijo_1: TStringField;
        SQLQuery_RepresentantesTfno_Fijo_2: TStringField;
        SQLQuery_RepresentantesVencimientos_automaticos_SN: TStringField;
        TabSheet_Busqueda_Concreta: TTabSheet;
        TabSheet_Filtros_Generales: TTabSheet;

        procedure Boton_Elegir_Forma_PagoClick(Sender: TObject);
        procedure Boton_Elegir_PaisClick(Sender: TObject);
        procedure Boton_Elegir_PoblacionClick(Sender: TObject);
        procedure Boton_Elegir_ProvinciaClick(Sender: TObject);
        procedure ComboBox_FiltrosChange(Sender: TObject);
        procedure Edit_Descripcion_Forma_PagoClick(Sender: TObject);
        procedure Edit_Descripcion_PaisClick(Sender: TObject);
        procedure Edit_Descripcion_PoblacionClick(Sender: TObject);
        procedure Edit_Descripcion_ProvinciaClick(Sender: TObject);
        procedure Filtrar_Principal_Sin_Preguntar;
        procedure Filtrar_tablas_ligadas;
        procedure BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
        function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
        procedure BitBtn_FiltrarClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure Presentar_Datos;
        procedure no_Tocar;
        procedure BitBtn_ImprimirClick(Sender: TObject);
        procedure Insertar_Registro;
        procedure Editar_Registro;
        procedure BitBtn_SeleccionarClick(Sender: TObject);
        procedure DBGrid_PrincipalCellClick(Column: TColumn);
        procedure DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
        procedure Seleccionado_Rgtro;
        procedure DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure BitBtn_SALIRClick(Sender: TObject);
        procedure Cerramos_Tablas_Ligadas;
        procedure Cerramos_Tablas;
        procedure DBGrid_PrincipalDblClick(Sender: TObject);
        procedure DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
        procedure Refrescar_Registros;
        procedure FormActivate(Sender: TObject);
        procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
        procedure para_Empezar;
        procedure FormDestroy(Sender: TObject);
        procedure RadioGroup_BajasClick(Sender: TObject);
        procedure SQLQuery_RepresentantesAfterPost(DataSet: TDataSet);
        procedure SQLQuery_RepresentantesAfterScroll(DataSet: TDataSet);
        procedure SQLQuery_RepresentantesBeforeEdit(DataSet: TDataSet);
        procedure SQLQuery_RepresentantesBeforePost(DataSet: TDataSet);
    private
      { private declarations }
      private_Salir_OK : Boolean;
      private_Order_By : array of TOrder_By;
    public
      { public declarations }
      public_Solo_Ver           : Boolean;
      public_Elegimos           : Boolean;
      public_Menu_Worked        : Integer;
      public_Rgtro_Seleccionado : Boolean;
    end;

var
    form_representantes_000: Tform_representantes_000;

implementation

{$R *.lfm}

uses dm_representantes, menu, representantes_001;

{ Tform_representantes_000 }

procedure Tform_representantes_000.FormActivate(Sender: TObject);
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

procedure Tform_representantes_000.FormDestroy(Sender: TObject);
begin
    Cerramos_Tablas;
end;

procedure Tform_representantes_000.RadioGroup_BajasClick(Sender: TObject);
begin
    Refrescar_Registros;
end;

procedure Tform_representantes_000.FormClose(Sender: TObject; var CloseAction: TCloseAction);
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

procedure Tform_representantes_000.SQLQuery_RepresentantesAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'representantes',
                       DataModule_Representantes.SQLTransaction,
                       SQLQuery_Representantes,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros;
end;

procedure Tform_representantes_000.SQLQuery_RepresentantesAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure Tform_representantes_000.SQLQuery_RepresentantesBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Representantes );
end;

procedure Tform_representantes_000.Refrescar_Registros;
var var_nombre_propietario          : String;
    var_Direccion                   : String;
    var_id_poblaciones              : Int64;
    var_id_provincias               : Int64;
    var_id_paises                   : Int64;
    var_id_formas_pago              : Int64;
    var_Vencimientos_automaticos_SN : ShortString;
    var_IVA_con_Recargo_SN          : ShortString;
    var_IVA_Excluido_SN             : ShortString;
    var_Activar_Proximidad_SN       : ShortString;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_nombre_propietario          := '';
    var_Direccion                   := '';
    var_id_poblaciones              := 0;
    var_id_provincias               := 0;
    var_id_paises                   := 0;
    var_id_formas_pago              := 0;
    var_Vencimientos_automaticos_SN := '';
    var_IVA_con_Recargo_SN          := '';
    var_IVA_Excluido_SN             := '';
    var_Activar_Proximidad_SN       := '';

    with SQLQuery_Representantes do
    begin
        if RecordCount > 0 then
        begin
            var_nombre_propietario          := FieldByName('nombre_propietario').asString;
            var_Direccion                   := FieldByName('Direccion').asString;
            var_id_poblaciones              := FieldByName('id_poblaciones').Value;
            var_id_provincias               := FieldByName('id_provincias').Value;
            var_id_paises                   := FieldByName('id_paises').Value;
            var_id_formas_pago              := FieldByName('id_formas_pago').Value;
            var_Vencimientos_automaticos_SN := FieldByName('Vencimientos_automaticos_SN').asString;
            var_IVA_con_Recargo_SN          := FieldByName('IVA_con_Recargo_SN').asString;
            var_IVA_Excluido_SN             := FieldByName('IVA_Excluido_SN').asString;
            var_Activar_Proximidad_SN       := FieldByName('Activar_Proximidad_SN').asString;
        end;

        Filtrar_Principal_Sin_Preguntar;

        if Trim(var_nombre_propietario) <> '' then
        begin
             Locate( 'nombre_propietario;Direccion;id_poblaciones;id_provincias;id_paises;' +
                     'id_formas_pago;Vencimientos_automaticos_SN;IVA_con_Recargo_SN;' +
                     'IVA_Excluido_SN;Activar_Proximidad_SN',

                     VarArrayOf( [ var_nombre_propietario, var_Direccion, var_id_poblaciones,
                                   var_id_provincias, var_id_paises, var_id_formas_pago,
                                   var_Vencimientos_automaticos_SN, var_IVA_con_Recargo_SN,
                                   var_IVA_Excluido_SN,var_Activar_Proximidad_SN ] ),
                     [] );
        end;
    end;
end;

procedure Tform_representantes_000.Filtrar_tablas_ligadas;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
begin
    if SQLQuery_Representantes.RecordCount = 0 then Exit;

    if SQLQuery_Representantes.State = dsInsert then
    begin
        Cerramos_Tablas_Ligadas;
        Exit;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;
end;

procedure Tform_representantes_000.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_Representantes.SQLConnector,
                      DataModule_Representantes.SQLTransaction,
                      SQLQuery_Representantes ) = false then UTI_GEN_Salir;

    DataModule_Representantes.Free;
end;

procedure Tform_representantes_000.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    If public_Elegimos then
         Seleccionado_Rgtro
    else Editar_Registro;
end;

procedure Tform_representantes_000.DBGrid_PrincipalDrawColumnCell(Sender: TObject;
    const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    UTI_GEN_Dibujar_Grid( Sender, SQLQuery_Representantes, Rect, DataCol, Column, State );
end;

procedure Tform_representantes_000.Cerramos_Tablas_Ligadas;
begin
{ ESTE form NO TIENE TABLAS LIGADAS

    if UTI_TB_Cerrar( DataModule_del_form_000.SQLConnector_de_la_tabla,
                      DataModule_Users.SQLTransaction_de_la_tabla,
                      SQLQuery_la_tabla ) = false then UTI_GEN_Salir;
}
end;

procedure Tform_representantes_000.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_representantes_000.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then
    begin
        If public_Elegimos then
             Seleccionado_Rgtro
        else Editar_Registro;
    end;
end;

procedure Tform_representantes_000.Seleccionado_Rgtro;
begin
    private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    public_Rgtro_Seleccionado := true;
    Close;
end;

procedure Tform_representantes_000.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

procedure Tform_representantes_000.DBNavigator1BeforeAction(Sender: TObject;
    Button: TDBNavButtonType);
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
                UTI_RGTRO_Borrar( 'representantes',
                                  SQLQuery_Representantes,
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

procedure Tform_representantes_000.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure Tform_representantes_000.BitBtn_SeleccionarClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
end;

procedure Tform_representantes_000.BitBtn_ImprimirClick(Sender: TObject);
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
                            ', con Nombre/Razón social %' +
                            Trim(Edit_nombre_propietario.Text) + '%';
    end;

    if Trim(Edit_NIF.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con N.I.F. %' +
                            Trim(Edit_NIF.Text) + '%';
    end;

    if (not DateTimePicker_Nacido_Hasta.DateIsNull) or
       (not DateTimePicker_Nacido_Desde.DateIsNull) then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', nacidos entre ' +
                            DateToStr(DateTimePicker_Nacido_Desde.Date) +
                            ' y el ' +
                            DateToStr(DateTimePicker_Nacido_Hasta.Date);
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
                      SQLQuery_Representantes,
                      DataSource_Representantes,
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

procedure Tform_representantes_000.no_Tocar;
begin
    BitBtn_Imprimir.Enabled := False;
end;

procedure Tform_representantes_000.Presentar_Datos;
begin
     /// guardar por lo que pueda pasar
end;

procedure Tform_representantes_000.BitBtn_FiltrarClick(Sender: TObject);
begin
    if PageControl_Filtros.ActivePage = TabSheet_Busqueda_Concreta then
    begin
        Filtrar_Principal_Sin_Preguntar;
    end else begin
        RadioGroup_Bajas.ItemIndex := Filtrar_Principal( true );
    end;
end;

function Tform_representantes_000.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
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
    // ** Primero buscaremos en el nombre y apellido el texto a buscar                              ** //
    // ********************************************************************************************* //
    if Trim(Edit_nombre_propietario.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'rp.nombre_propietario LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_nombre_propietario.Text) + '%') );
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
        var_SQL_ADD.Add( 'rp.nif_cif LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_NIF.Text) + '%') );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la fecha de nacimiento                                             ** //
    // ********************************************************************************************* //
    if (not DateTimePicker_Nacido_Hasta.DateIsNull) and
       (not DateTimePicker_Nacido_Desde.DateIsNull) then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'rp.Fecha_Nacimiento <= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Nacido_Hasta.Date, false) + ' 23:59:59' ) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'rp.Fecha_Nacimiento >= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Nacido_Desde.Date, false) + ' 00:00:00' ) );
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
        var_SQL_ADD.Add( 'rp.id_formas_pago = ' + Trim(Edit_id_Forma_Pago.Text) );
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
        var_SQL_ADD.Add( 'rp.id_poblaciones = ' + Trim(Edit_id_poblaciones.Text) );
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
        var_SQL_ADD.Add( 'rp.id_provincias = ' + Trim(Edit_id_provincias.Text) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por el país                                                            ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_paises.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'rp.id_paises = ' + Trim(Edit_id_paises.Text) );
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
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Representantes,
                                                            'representantes',
                                                            'u' ),

                              // Insert_SQL,
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Representantes,
                                                            'representantes',
                                                            'i' ),

                              // var_ctdad_Rgtros,
                              -1,

                              DataModule_Representantes.SQLTransaction,
                              DataModule_Representantes.SQLConnector,
                              SQLQuery_Representantes,

                              // name_tabla,
                              'rp',

                              RadioGroup_Bajas.ItemIndex,

                              // SELECT_SQL,
                              'SELECT rp.*,' + ' ' +

                                     'pb.descripcion AS OT_descripcion_poblacion,' + ' ' +
                                     'pr.descripcion AS OT_descripcion_provincia,' + ' ' +
                                     'ps.descripcion AS OT_descripcion_pais,' + ' ' +

                                     'ct_pb.descripcion AS OT_Cta_Bco_descripcion_poblacion,' + ' ' +
                                     'ct_pr.descripcion AS OT_Cta_Bco_descripcion_provincia,' + ' ' +
                                     'ct_ps.descripcion AS OT_Cta_Bco_descripcion_pais,' + ' ' +

                                     'fp.descripcion AS OT_descripcion_forma_pago,' + ' ' +
                                     'fp.Vencimientos_Cantidad AS OT_Vencimientos_Cantidad,' + ' ' +
                                     'fp.Vencimientos_1_Dias AS OT_Vencimientos_1_Dias,' + ' ' +
                                     'fp.Vencimientos_Dias_Entre AS OT_Vencimientos_Dias_Entre' + ' ' +

                              'FROM representantes AS rp' + ' ' +

                              'LEFT JOIN poblaciones AS pb' + ' ' +
                              'ON rp.id_poblaciones = pb.id' + ' ' +

                              'LEFT JOIN provincias AS pr' + ' ' +
                              'ON rp.id_provincias = pr.id' + ' ' +

                              'LEFT JOIN paises AS ps' + ' ' +
                              'ON rp.id_paises = ps.id' + ' ' +

                              'LEFT JOIN poblaciones AS ct_pb' + ' ' +
                              'ON rp.id_Cta_Bco_poblaciones = ct_pb.id' + ' ' +

                              'LEFT JOIN provincias AS ct_pr' + ' ' +
                              'ON rp.id_Cta_Bco_provincias = ct_pr.id' + ' ' +

                              'LEFT JOIN paises AS ct_ps' + ' ' +
                              'ON rp.id_Cta_Bco_pais = ct_ps.id' + ' ' +

                              'LEFT JOIN formas_pago AS fp' + ' ' +
                              'ON rp.id_formas_pago = fp.id' + ' ',

                              Memo_Filtros.Lines,
                              Memo_OrderBy.Lines,
                              var_a_Filtrar,

                              param_Cambiamos_Filtro,
                              false,   // param_ver_SQL_despues_Abrir : Boolean;
                              true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

    var_a_Filtrar.Free;

    Label_Ctdad_Rgtros.Caption := IntToStr(SQLQuery_Representantes.RecordCount);

    //Filtrar_tablas_ligadas;
    var_SQL_ADD.Free;
end;

procedure Tform_representantes_000.BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if SQLQuery_Representantes.RecordCount > 0 then UTI_RGTRO_Ver_Estado_Registro( 'representantes',
                                                                                       SQLQuery_Representantes,
                                                                                       DataSource_Representantes,
                                                                                       DBGrid_Principal );
    end;
end;

procedure Tform_representantes_000.Insertar_Registro;
var var_msg : TStrings;
begin
    with SQLQuery_Representantes do
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

                    FieldByName('IVA_con_Recargo_SN').AsString      := 'N';
                    FieldByName('IVA_Excluido_SN').AsString         := 'N';
                    FieldByName('Activar_Proximidad_SN').AsString   := 'S';

                    FieldByName('Saldo_Acumulado').AsString         := '0';

                    Application.CreateForm(Tform_representantes_001, form_representantes_001);

                    form_representantes_001.para_Empezar;

                    form_representantes_001.ShowModal;
                    if form_representantes_001.public_Pulso_Aceptar = true then
                        begin
                            FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
                            FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                            UTI_RGTRO_Grabar_Antes( 'representantes',
                                                    SQLQuery_Representantes );

                            // RadioGroup_Bajas.ItemIndex := form_representantes_001.RadioGroup_Bajas.ItemIndex;
                        end
                    else Cancel;

                    form_representantes_001.Free;
                end;
        end;

        var_msg.Free;
    end;
end;

procedure Tform_representantes_000.FormCreate(Sender: TObject);
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

procedure Tform_representantes_000.para_Empezar;
begin
    { ****************************************************************************
      Solo para formularios que traten con datos
      **************************************************************************** }
      if UTI_GEN_Form_Abierto_Ya('DataModule_Representantes') = False then
      begin
          DataModule_Representantes := TDataModule_Representantes.Create(Application);
      end;

    { ****************************************************************************
      Preparamos los diferentes tipos de orden preconfigurados
      **************************************************************************** }
      SetLength(private_Order_By, 4);

      private_Order_By[0].Titulo       := 'Por nombre / razón social'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
      private_Order_By[0].Memo_OrderBy := 'rp.nombre_propietario ASC';

      private_Order_By[1].Titulo       := 'Por nombre comercial';
      private_Order_By[1].Memo_OrderBy := 'rp.nombre_comercial ASC';

      private_Order_By[2].Titulo       := 'Por NIF / CIF';
      private_Order_By[2].Memo_OrderBy := 'rp.nif_cif ASC';

      private_Order_By[3].Titulo       := 'Por la id';
      private_Order_By[3].Memo_OrderBy := 'rp.id ASC';

      Memo_OrderBy.Lines.Text          := private_Order_By[0].Memo_OrderBy;

      UTI_TB_Rellenar_ComboBox_Orden( true,
                                      ComboBox_Filtros,
                                      private_Order_By,
                                      0 );

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

procedure Tform_representantes_000.SQLQuery_RepresentantesBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Representantes );
end;

procedure Tform_representantes_000.Filtrar_Principal_Sin_Preguntar;
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

procedure Tform_representantes_000.Boton_Elegir_Forma_PagoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_FormasPago( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Forma_Pago.Text          := Trim(var_Registro.id_1);
        Edit_Descripcion_Forma_Pago.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_representantes_000.Boton_Elegir_PaisClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Paises( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_paises.Text        := Trim(var_Registro.id_1);
        Edit_Descripcion_Pais.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_representantes_000.Boton_Elegir_PoblacionClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Poblaciones( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_poblaciones.Text        := Trim(var_Registro.id_1);
        Edit_Descripcion_Poblacion.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_representantes_000.Boton_Elegir_ProvinciaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Provincias( true, false, 100, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_provincias.Text         := Trim(var_Registro.id_1);
        Edit_Descripcion_Provincia.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_representantes_000.ComboBox_FiltrosChange(Sender: TObject);
begin
    Memo_OrderBy.Lines.Clear;
    Memo_OrderBy.Lines.Add( private_Order_By[ComboBox_Filtros.ItemIndex].Memo_OrderBy );
    BitBtn_FiltrarClick(Nil);
end;

procedure Tform_representantes_000.Edit_Descripcion_Forma_PagoClick(Sender: TObject);
begin
    Edit_id_Forma_Pago.Text          := '';
    Edit_Descripcion_Forma_Pago.Text := '';
end;

procedure Tform_representantes_000.Edit_Descripcion_PaisClick(Sender: TObject);
begin
    Edit_id_paises.Text        := '';
    Edit_Descripcion_Pais.Text := '';
end;

procedure Tform_representantes_000.Edit_Descripcion_PoblacionClick(
  Sender: TObject);
begin
    Edit_id_poblaciones.Text        := '';
    Edit_Descripcion_Poblacion.Text := '';
end;

procedure Tform_representantes_000.Edit_Descripcion_ProvinciaClick(
  Sender: TObject);
begin
    Edit_id_provincias.Text         := '';
    Edit_Descripcion_Provincia.Text := '';
end;

procedure Tform_representantes_000.Editar_Registro;
var var_msg : TStrings;
    var_id  : ShortString;
begin
    with SQLQuery_Representantes do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
        begin
            var_id := FieldByName('id').AsString;

            if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
            begin
                if UTI_RGTRO_isLock( 'representantes',
                                     FieldByName('id').AsString,
                                     true ) = true then
                begin
                    Exit;
                end else begin
                    if UTI_RGTRO_Lock( 'representantes',
                                       FieldByName('id').AsString ) = true then
                         Edit
                    else Exit;
                end;

                Application.CreateForm(Tform_representantes_001, form_representantes_001);

                form_representantes_001.public_Menu_Worked := public_Menu_Worked;

                if public_Solo_Ver = true then
                begin
                    form_representantes_001.public_Solo_Ver := true;
                end;

                form_representantes_001.para_Empezar;

                form_representantes_001.ShowModal;
                if form_representantes_001.public_Pulso_Aceptar = true then
                begin
                    if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( SQLQuery_Representantes ) = true then
                    begin
                        FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                        FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                        UTI_RGTRO_Grabar_Antes( 'representantes',
                                                SQLQuery_Representantes );
                    end else begin
                        Cancel;
                    end;
                end else begin
                    Cancel;
                end;

                form_representantes_001.Free;

                UTI_RGTRO_UnLock( 'representantes',
                                  var_id );
            end;
        end else begin
            var_msg.Add(rs_no_Hay_Rgtros);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        end;
    end;

    var_msg.Free;
end;

end.


