unit personal_000;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, DateTimePicker, Forms, Controls, Graphics, Dialogs,
  Buttons, StdCtrls, variants, utilidades_rgtro, utilidades_bd, utilidades_general, ExtCtrls,
  DBGrids, DbCtrls, Grids, ComCtrls, utilidades_datos_tablas, utilidades_usuarios,
  utilidades_forms_Filtrar;

type

  { Tform_personal_000 }

  record_Ultimo_contrato = record
      Contrato_Descripcion : ShortString;
      Contrato_Empresa     : ShortString;
      Contrato_Inicio      : ShortString;
      Contrato_Fin         : ShortString;
  end;

  Tform_personal_000 = class(TForm)
    BitBtn_Filtrar: TBitBtn;
    BitBtn_Imprimir: TBitBtn;
    BitBtn_SALIR: TBitBtn;
    BitBtn_Seleccionar: TBitBtn;
    BitBtn_Ver_Situacion_Registro: TBitBtn;
    Boton_Elegir_id_personal_familias: TBitBtn;
    Boton_Elegir_Pais: TBitBtn;
    Boton_Elegir_Poblacion: TBitBtn;
    Boton_Elegir_Provincia: TBitBtn;
    ComboBox_Filtros: TComboBox;
    DataSource_Personal: TDataSource;
    DateTimePicker_Nacido_Desde: TDateTimePicker;
    DateTimePicker_Nacido_Hasta: TDateTimePicker;
    DBGrid_Principal: TDBGrid;
    DBNavigator1: TDBNavigator;
    Edit_Descripcion_id_personal_familias: TEdit;
    Edit_Descripcion_Pais: TEdit;
    Edit_Descripcion_Poblacion: TEdit;
    Edit_Descripcion_Provincia: TEdit;
    Edit_id_personal_familias: TEdit;
    Edit_id_paises: TEdit;
    Edit_id_poblaciones: TEdit;
    Edit_id_provincias: TEdit;
    Edit_NIF: TEdit;
    Edit_Nombre: TEdit;
    Edit_Seguridad_Social: TEdit;
    Label10: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
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
    SQLQuery_Personal: TSQLQuery;
    SQLQuery_PersonalActivar_Proximidad_SN: TStringField;
    SQLQuery_PersonalChange_Id_User: TLargeintField;
    SQLQuery_PersonalChange_WHEN: TDateTimeField;
    SQLQuery_PersonalCodigo_Postal: TStringField;
    SQLQuery_PersonalComision: TBCDField;
    SQLQuery_PersonalControlar_su_Presencia: TStringField;
    SQLQuery_PersonalCta_Bco_BIC_SWIFT: TStringField;
    SQLQuery_PersonalCta_Bco_Codigo_Postal: TStringField;
    SQLQuery_PersonalCta_Bco_Cuenta: TStringField;
    SQLQuery_PersonalCta_Bco_Digito_Control: TStringField;
    SQLQuery_PersonalCta_Bco_Direccion: TStringField;
    SQLQuery_PersonalCta_Bco_Direccion_Numero: TStringField;
    SQLQuery_PersonalCta_Bco_Direccion_Piso_Letra: TStringField;
    SQLQuery_PersonalCta_Bco_Entidad: TStringField;
    SQLQuery_PersonalCta_Bco_IBAN: TStringField;
    SQLQuery_PersonalCta_Bco_Mandato_Fecha_de_Firma: TDateTimeField;
    SQLQuery_PersonalCta_Bco_Mandato_Ref: TStringField;
    SQLQuery_PersonalCta_Bco_Sucursal: TStringField;
    SQLQuery_PersonalCuenta_Contable: TStringField;
    SQLQuery_PersonalDel_Id_User: TLargeintField;
    SQLQuery_PersonalDel_WHEN: TDateTimeField;
    SQLQuery_PersonalDel_WHY: TStringField;
    SQLQuery_PersonalDireccion: TStringField;
    SQLQuery_PersonalDireccion_Numero: TStringField;
    SQLQuery_PersonalDireccion_Piso_Letra: TStringField;
    SQLQuery_PersonaleMail: TStringField;
    SQLQuery_PersonalFAX: TStringField;
    SQLQuery_PersonalFecha_Nacimiento: TDateTimeField;
    SQLQuery_Personalid: TLargeintField;
    SQLQuery_Personalid_Cta_Bco_pais: TLargeintField;
    SQLQuery_Personalid_Cta_Bco_poblaciones: TLargeintField;
    SQLQuery_Personalid_Cta_Bco_provincias: TLargeintField;
    SQLQuery_Personalid_Empleado_de: TLargeintField;
    SQLQuery_Personalid_paises: TLargeintField;
    SQLQuery_Personalid_personal_familias: TLargeintField;
    SQLQuery_Personalid_poblaciones: TLargeintField;
    SQLQuery_Personalid_provincias: TLargeintField;
    SQLQuery_PersonalInsert_Id_User: TLargeintField;
    SQLQuery_PersonalInsert_WHEN: TDateTimeField;
    SQLQuery_PersonalMovil: TStringField;
    SQLQuery_Personalnif_cif: TStringField;
    SQLQuery_Personalnif_cif_caducidad: TDateTimeField;
    SQLQuery_Personalnombre: TStringField;
    SQLQuery_PersonalObservaciones_Comentarios: TStringField;
    SQLQuery_PersonalOT_Cta_Bco_descripcion_pais: TStringField;
    SQLQuery_PersonalOT_Cta_Bco_descripcion_poblacion: TStringField;
    SQLQuery_PersonalOT_Cta_Bco_descripcion_provincia: TStringField;
    SQLQuery_PersonalOT_Cuenta_Contable_Personal_tipo: TStringField;
    SQLQuery_PersonalOT_Descripcion_Empleado_De: TStringField;
    SQLQuery_PersonalOT_descripcion_pais: TStringField;
    SQLQuery_PersonalOT_Descripcion_Personal_Familias: TStringField;
    SQLQuery_PersonalOT_descripcion_poblacion: TStringField;
    SQLQuery_PersonalOT_descripcion_provincia: TStringField;
    SQLQuery_PersonalSeguridad_Social: TStringField;
    SQLQuery_PersonalTfno_Fijo_1: TStringField;
    SQLQuery_PersonalTfno_Fijo_2: TStringField;
    TabSheet_Busqueda_Concreta: TTabSheet;
    TabSheet_Filtros_Generales: TTabSheet;

    procedure Boton_Elegir_id_personal_familiasClick(Sender: TObject);
    procedure Boton_Elegir_PaisClick(Sender: TObject);
    procedure Boton_Elegir_PoblacionClick(Sender: TObject);
    procedure Boton_Elegir_ProvinciaClick(Sender: TObject);
    procedure ComboBox_FiltrosChange(Sender: TObject);
    procedure Edit_Descripcion_id_personal_familiasClick(Sender: TObject);
    procedure Edit_Descripcion_PaisClick(Sender: TObject);
    procedure Edit_Descripcion_PoblacionClick(Sender: TObject);
    procedure Edit_Descripcion_ProvinciaClick(Sender: TObject);
    procedure Filtrar_Principal_Sin_Preguntar;
    function  Traer_Ultimo_Contrato_Personal(param_id_personal : ShortString) : record_Ultimo_contrato;
    procedure Insertar_Registro;
    procedure Editar_Registro;
    procedure para_Empezar;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
    function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
    procedure BitBtn_FiltrarClick(Sender: TObject);
    procedure Presentar_Datos;
    procedure no_Tocar;
    procedure BitBtn_ImprimirClick(Sender: TObject);
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
    procedure Filtrar_tablas_ligadas;
    procedure Refrescar_Registros;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure RadioGroup_BajasClick(Sender: TObject);
    procedure SQLQuery_PersonalAfterPost(DataSet: TDataSet);
    procedure SQLQuery_PersonalAfterScroll(DataSet: TDataSet);
    procedure SQLQuery_PersonalBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_PersonalBeforePost(DataSet: TDataSet);
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
  form_personal_000: Tform_personal_000;

implementation

{$R *.lfm}

uses dm_personal, menu, personal_001;

{ Tform_personal_000 }

procedure Tform_personal_000.FormActivate(Sender: TObject);
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

procedure Tform_personal_000.FormDestroy(Sender: TObject);
begin
    Cerramos_Tablas;
end;

procedure Tform_personal_000.FormClose(Sender: TObject; var CloseAction: TCloseAction);
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

procedure Tform_personal_000.RadioGroup_BajasClick(Sender: TObject);
begin
    Refrescar_Registros;
end;

procedure Tform_personal_000.SQLQuery_PersonalAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'personal',
                       DataModule_Personal.SQLTransaction,
                       SQLQuery_Personal,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros;
end;

procedure Tform_personal_000.SQLQuery_PersonalAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure Tform_personal_000.SQLQuery_PersonalBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Personal );
end;

procedure Tform_personal_000.Refrescar_Registros;
var var_nombre  : String;
    var_nif_cif : String;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_nombre  := '';
    var_nif_cif := '';

    if SQLQuery_Personal.RecordCount > 0 then
    begin
        var_nombre  := SQLQuery_Personal.FieldByName('nombre').asString;
        var_nif_cif := SQLQuery_Personal.FieldByName('nif_cif').asString;
    end;

    Filtrar_Principal_Sin_Preguntar;

    if Trim(var_nombre) <> '' then
    begin
         SQLQuery_Personal.Locate( 'nombre;nif_cif',
                                   VarArrayOf( [ var_nombre, var_nif_cif ] ),
                                   [] );
    end;
end;

procedure Tform_personal_000.Filtrar_tablas_ligadas;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
begin
    if SQLQuery_Personal.RecordCount = 0 then Exit;

    if SQLQuery_Personal.State = dsInsert then
    begin
        Cerramos_Tablas_Ligadas;
        Exit;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;
end;

procedure Tform_personal_000.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_Personal.SQLConnector,
                      DataModule_Personal.SQLTransaction,
                      SQLQuery_Personal ) = false then UTI_GEN_Salir;

    DataModule_Personal.Free;
end;

procedure Tform_personal_000.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    If public_Elegimos then
         Seleccionado_Rgtro
    else Editar_Registro;
end;

procedure Tform_personal_000.DBGrid_PrincipalDrawColumnCell(Sender: TObject;
    const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    UTI_GEN_Dibujar_Grid( Sender, SQLQuery_Personal, Rect, DataCol, Column, State );
end;

procedure Tform_personal_000.Cerramos_Tablas_Ligadas;
begin
{ ESTE form NO TIENE TABLAS LIGADAS

    if UTI_TB_Cerrar( DataModule_del_form_000.SQLConnector_de_la_tabla,
                      DataModule_Users.SQLTransaction_de_la_tabla,
                      SQLQuery_la_tabla ) = false then UTI_GEN_Salir;
}
end;

procedure Tform_personal_000.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_personal_000.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

procedure Tform_personal_000.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then
    begin
        If public_Elegimos then
             Seleccionado_Rgtro
        else Editar_Registro;
    end;
end;

procedure Tform_personal_000.Seleccionado_Rgtro;
begin
    private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    public_Rgtro_Seleccionado := true;
    Close;
end;

procedure Tform_personal_000.DBNavigator1BeforeAction(Sender: TObject;
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
                UTI_RGTRO_Borrar( 'personal',
                                  SQLQuery_Personal,
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

procedure Tform_personal_000.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure Tform_personal_000.BitBtn_SeleccionarClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
end;

procedure Tform_personal_000.BitBtn_ImprimirClick(Sender: TObject);
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

    if Trim(Edit_Nombre.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con nombre/razón social %' +
                            Trim(Edit_Nombre.Text) + '%';
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

    if Trim(Edit_Descripcion_id_personal_familias.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con tipo de personal = ' +
                            Trim(Edit_Descripcion_id_personal_familias.Text);
    end;

    if Trim(Edit_Seguridad_Social.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con Seguridad Social %' +
                            Trim(Edit_Seguridad_Social.Text) + '%';
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
                      SQLQuery_Personal,
                      DataSource_Personal,
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

procedure Tform_personal_000.no_Tocar;
begin
    BitBtn_Imprimir.Enabled := False;
end;

procedure Tform_personal_000.Presentar_Datos;
begin
     /// guardar por lo que pueda pasar
end;

procedure Tform_personal_000.BitBtn_FiltrarClick(Sender: TObject);
begin
    if PageControl_Filtros.ActivePage = TabSheet_Busqueda_Concreta then
    begin
        Filtrar_Principal_Sin_Preguntar;
    end else begin
        RadioGroup_Bajas.ItemIndex := Filtrar_Principal( true );
    end;
end;

procedure Tform_personal_000.BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if SQLQuery_Personal.RecordCount > 0 then UTI_RGTRO_Ver_Estado_Registro( 'personal',
                                                                                 SQLQuery_Personal,
                                                                                 DataSource_Personal,
                                                                                 DBGrid_Principal );
    end;
end;

procedure Tform_personal_000.Insertar_Registro;
var var_msg : TStrings;
begin
    with SQLQuery_Personal do
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

                    FieldByName('Activar_Proximidad_SN').AsString  := 'S';
                    FieldByName('Controlar_su_Presencia').AsString := 'S';

                    Application.CreateForm(Tform_personal_001, form_personal_001);

                    form_personal_001.para_Empezar;

                    form_personal_001.ShowModal;
                    if form_personal_001.public_Pulso_Aceptar = true then
                        begin
                            FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
                            FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                            UTI_RGTRO_Grabar_Antes( 'personal',
                                                    SQLQuery_Personal );

                            // RadioGroup_Bajas.ItemIndex := form_personal_001.RadioGroup_Bajas.ItemIndex;
                        end
                    else Cancel;

                    form_personal_001.Free;
                end;
        end;

        var_msg.Free;
    end;
end;

procedure Tform_personal_000.FormCreate(Sender: TObject);
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

procedure Tform_personal_000.para_Empezar;
begin
    { ****************************************************************************
      Solo para formularios que traten con datos
      **************************************************************************** }
      if UTI_GEN_Form_Abierto_Ya('DataModule_Personal') = False then
      begin
          DataModule_Personal := TDataModule_Personal.Create(Application);
      end;

    { ****************************************************************************
      Preparamos los diferentes tipos de orden preconfigurados
      **************************************************************************** }
      SetLength(private_Order_By, 4);

      private_Order_By[0].Titulo       := 'Por nombre / razón social'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
      private_Order_By[0].Memo_OrderBy := 'p.nombre ASC';

      private_Order_By[2].Titulo       := 'Por NIF / CIF';
      private_Order_By[2].Memo_OrderBy := 'p.nif_cif ASC';

      private_Order_By[3].Titulo       := 'Por la id';
      private_Order_By[3].Memo_OrderBy := 'p.id ASC';

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

procedure Tform_personal_000.SQLQuery_PersonalBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Personal );
end;

procedure Tform_personal_000.Editar_Registro;
var var_msg : TStrings;
    var_id  : ShortString;
begin
    with SQLQuery_Personal do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
            begin
                var_id := FieldByName('id').AsString;

                if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
                begin
                    if UTI_RGTRO_isLock( 'personal',
                                         FieldByName('id').AsString,
                                         true ) = true then
                        begin
                            Exit;
                        end
                    else
                        begin
                            if UTI_RGTRO_Lock( 'personal',
                                               FieldByName('id').AsString ) = true then
                                 Edit
                            else Exit;
                        end;

                    Application.CreateForm(Tform_personal_001, form_personal_001);

                    form_personal_001.public_Menu_Worked := public_Menu_Worked;

                    if public_Solo_Ver = true then
                    begin
                        form_personal_001.public_Solo_Ver := true;
                    end;

                    form_personal_001.para_Empezar;

                    form_personal_001.ShowModal;
                    if form_personal_001.public_Pulso_Aceptar = true then
                        begin
                            if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( SQLQuery_Personal ) = true then
                               begin
                                    FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                                    FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                                    UTI_RGTRO_Grabar_Antes( 'personal',
                                                            SQLQuery_Personal );
                               end
                            else Cancel;
                        end
                    else Cancel;

                    form_personal_001.Free;

                    UTI_RGTRO_UnLock( 'personal',
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

function Tform_personal_000.Traer_Ultimo_Contrato_Personal(param_id_personal : ShortString) : record_Ultimo_contrato;
var var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
    try
        // ********************************************************************************************* //
        // ** Creamos la Transaccion y la conexión con el motor BD, y la abrimos                      ** //
        // ********************************************************************************************* //
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Connector_Open( var_SQLTransaction,
                                  var_SQLConnector ) = False then UTI_GEN_Salir;

        // var_SQL := TStringList.Create;

        var_SQLQuery          := TSQLQuery.Create(nil);

        var_SQLQuery.Name     := 'SQLQuery_Traer_Ultimo_Contrato_Personal';

        var_SQLQuery.Database := var_SQLConnector;

        // ********************************************************************************************* //
        // ** Creamos la SQL ** //
        // ********************************************************************************************* //
        with var_SQLQuery.SQL DO
        begin
             Add( 'SELECT pc.*,' );
             Add(        'pcf.descripcion AS Descripcion_Contrato,' );
             Add(        'e.nombre_comercial AS Descripcion_Empresa' );

             Add(   'FROM personal_contratos AS pc' );

             Add( 'LEFT JOIN personal_contratos_familias AS pcf' );
             Add(   'ON pc.id_personal_contratos_familias = pcf.id' );

             Add( 'LEFT JOIN empresas AS e' );
             Add(   'ON pc.id_empresas = e.id' );

             Add(  'WHERE pc.id_personal = ' + param_id_personal );
             Add(    'AND pc.Del_WHEN IS NULL' );

             Add(  'ORDER BY pc.id_personal ASC, pc.Inicio DESC' );

             Add(  'LIMIT 1' );
        end;

        // ********************************************************************************************* //
        // ** Ejecutamos la SQL que nos traerá la id                                                  ** //
        // ********************************************************************************************* //
        if UTI_TB_Query_Open( '', '', '',
                              var_SQLConnector,
                              var_SQLQuery,
                              -1, // asi me trae todos los registros de golpe
                              var_SQLQuery.SQL.Text ) = False then UTI_GEN_Salir;

        // ********************************************************************************************* //
        // ** Devolvemos el valor de la id                                                            ** //
        // ********************************************************************************************* //
        with var_SQLQuery DO
        begin
            Result.Contrato_Descripcion := '';
            Result.Contrato_Empresa     := '';
            Result.Contrato_Inicio      := '';
            Result.Contrato_Fin         := '';

            if RecordCount > 0 then
            begin
                Result.Contrato_Descripcion := FieldByName('Descripcion_Contrato').AsString;
                Result.Contrato_Empresa     := FieldByName('Descripcion_Empresa').AsString;
                Result.Contrato_Inicio      := FieldByName('Inicio').AsString;
                Result.Contrato_Fin         := FieldByName('Fin').AsString;
            end;
        end;

        // ********************************************************************************************* //
        // ** Cerramos la tabla y asi se cierra automaticamente La transacción y la conexión con BD   ** //
        // ********************************************************************************************* //
        if UTI_TB_Cerrar( var_SQLConnector,
                          var_SQLTransaction,
                          var_SQLQuery ) = false then UTI_GEN_Salir;

        // ********************************************************************************************* //
        // ** Destruimos la tabla y conexiones                                                        ** //
        // ********************************************************************************************* //
        var_SQLQuery.Free;
        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( 'Ocurrió un error al intentar traer el último contrato del empleado ' +
                               param_id_personal,
                               error );
            try
               var_SQLTransaction.Free;
               var_SQLConnector.Free;
               var_SQLQuery.Free;
            Except
            end;
        end;
    end;
end;

function Tform_personal_000.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
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
    if Trim(Edit_Nombre.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'p.nombre LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Nombre.Text) + '%') );
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
        var_SQL_ADD.Add( 'p.nif_cif LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_NIF.Text) + '%') );
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
        var_SQL_ADD.Add( 'p.Fecha_Nacimiento <= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Nacido_Hasta.Date, false) + ' 23:59:59' ) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'p.Fecha_Nacimiento >= ' + UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Nacido_Desde.Date, false) + ' 00:00:00' ) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por EL TIPO DE PERSONAL                                                ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_personal_familias.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'p.id_personal_familias = ' + Trim(Edit_id_personal_familias.Text) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos en el numero de la seg.social                                          ** //
    // ********************************************************************************************* //
    if Trim(Edit_Seguridad_Social.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'p.Seguridad_Social LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Seguridad_Social.Text) + '%') );
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
        var_SQL_ADD.Add( 'p.id_poblaciones = ' + Trim(Edit_id_poblaciones.Text) );
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
        var_SQL_ADD.Add( 'p.id_provincias = ' + Trim(Edit_id_provincias.Text) );
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
        var_SQL_ADD.Add( 'p.id_paises = ' + Trim(Edit_id_paises.Text) );
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
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Personal,
                                                            'personal',
                                                            'u' ),

                              // Insert_SQL,
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Personal,
                                                            'personal',
                                                            'i' ),

                              // var_ctdad_Rgtros,
                              -1,

                              DataModule_Personal.SQLTransaction,
                              DataModule_Personal.SQLConnector,
                              SQLQuery_Personal,

                              // name_tabla,
                              'p',

                              RadioGroup_Bajas.ItemIndex,

                              // SELECT_SQL,
                              'SELECT p.*,' + ' ' +

                                     'pf.descripcion AS OT_Descripcion_Personal_Familias,' + ' ' +
                                     'pf.Cuenta_Contable AS OT_Cuenta_Contable_Personal_tipo,' + ' ' +

                                     'prv.nombre_propietario AS OT_Descripcion_Empleado_De,' + ' ' +

                                     'pb.descripcion AS OT_descripcion_poblacion,' + ' ' +
                                     'pr.descripcion AS OT_descripcion_provincia,' + ' ' +
                                     'ps.descripcion AS OT_descripcion_pais,' + ' ' +

                                     'ct_pb.descripcion AS OT_Cta_Bco_descripcion_poblacion,' + ' ' +
                                     'ct_pr.descripcion AS OT_Cta_Bco_descripcion_provincia,' + ' ' +
                                     'ct_ps.descripcion AS OT_Cta_Bco_descripcion_pais' + ' ' +

                              'FROM personal AS p' + ' ' +

                              'LEFT JOIN personal_familias AS pf' + ' ' +
                              'ON p.id_personal_familias = pf.id' + ' ' +

                              'LEFT JOIN proveedores AS prv' + ' ' +
                              'ON p.id_Empleado_de = prv.id' + ' ' +

                              'LEFT JOIN poblaciones AS pb' + ' ' +
                              'ON p.id_poblaciones = pb.id' + ' ' +

                              'LEFT JOIN provincias AS pr' + ' ' +
                              'ON p.id_provincias = pr.id' + ' ' +

                              'LEFT JOIN paises AS ps' + ' ' +
                              'ON p.id_paises = ps.id' + ' ' +

                              'LEFT JOIN poblaciones AS ct_pb' + ' ' +
                              'ON p.id_Cta_Bco_poblaciones = ct_pb.id' + ' ' +

                              'LEFT JOIN provincias AS ct_pr' + ' ' +
                              'ON p.id_Cta_Bco_provincias = ct_pr.id' + ' ' +

                              'LEFT JOIN paises AS ct_ps' + ' ' +
                              'ON p.id_Cta_Bco_pais = ct_ps.id' + ' ',

                              Memo_Filtros.Lines,
                              Memo_OrderBy.Lines,
                              var_a_Filtrar,

                              param_Cambiamos_Filtro,
                              false,   // param_ver_SQL_despues_Abrir : Boolean;
                              true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

    var_a_Filtrar.Free;

    Label_Ctdad_Rgtros.Caption := IntToStr(SQLQuery_Personal.RecordCount);

    //Filtrar_tablas_ligadas;
    var_SQL_ADD.Free;
end;

procedure Tform_personal_000.Filtrar_Principal_Sin_Preguntar;
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

procedure Tform_personal_000.Boton_Elegir_PoblacionClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Poblaciones( true, false, 110, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_poblaciones.Text        := Trim(var_Registro.id_1);
        Edit_Descripcion_Poblacion.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_personal_000.Boton_Elegir_PaisClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Paises( true, false, 60, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_paises.Text        := Trim(var_Registro.id_1);
        Edit_Descripcion_Pais.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_personal_000.Boton_Elegir_id_personal_familiasClick(
  Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_FamiliasPersonal( true, false, 210, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_personal_familias.Text             := Trim(var_Registro.id_1);
        Edit_Descripcion_id_personal_familias.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_personal_000.Boton_Elegir_ProvinciaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Provincias( true, false, 100, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_provincias.Text         := Trim(var_Registro.id_1);
        Edit_Descripcion_Provincia.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_personal_000.ComboBox_FiltrosChange(Sender: TObject);
begin
    Memo_OrderBy.Lines.Clear;
    Memo_OrderBy.Lines.Add( private_Order_By[ComboBox_Filtros.ItemIndex].Memo_OrderBy );
    BitBtn_FiltrarClick(Nil);
end;

procedure Tform_personal_000.Edit_Descripcion_id_personal_familiasClick(
  Sender: TObject);
begin
    Edit_id_personal_familias.Text             := '';
    Edit_Descripcion_id_personal_familias.Text := '';
end;

procedure Tform_personal_000.Edit_Descripcion_PaisClick(Sender: TObject);
begin
    Edit_id_paises.Text        := '';
    Edit_Descripcion_Pais.Text := '';
end;

procedure Tform_personal_000.Edit_Descripcion_PoblacionClick(Sender: TObject);
begin
    Edit_id_poblaciones.Text        := '';
    Edit_Descripcion_Poblacion.Text := '';
end;

procedure Tform_personal_000.Edit_Descripcion_ProvinciaClick(Sender: TObject);
begin
    Edit_id_provincias.Text         := '';
    Edit_Descripcion_Provincia.Text := '';
end;

end.




