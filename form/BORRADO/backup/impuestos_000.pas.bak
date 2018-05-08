unit impuestos_000;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
    StdCtrls, DBGrids, variants, DbCtrls, Grids, ComCtrls, utilidades_usuarios, utilidades_rgtro,
    utilidades_general, utilidades_bd, utilidades_datos_tablas, utilidades_impuestos;

type

    { Tform_impuestos_000 }

    Tform_impuestos_000 = class(TForm)
      BitBtn_Filtrar: TBitBtn;
        BitBtn_Imprimir: TBitBtn;
        BitBtn_SALIR: TBitBtn;
        BitBtn_Seleccionar: TBitBtn;
        BitBtn_Ver_Situacion_Registro: TBitBtn;
        ComboBox_Filtros: TComboBox;
        DataSource_Impuestos: TDataSource;
        DataSource_Impuestos_Composiciones: TDataSource;
        DBGrid_Principal: TDBGrid;
        DBNavigator1: TDBNavigator;
        Edit_Descripcion: TEdit;
        Image_Confirmado: TImage;
        Label10: TLabel;
        Label6: TLabel;
        Label9: TLabel;
        Label_Ctdad_Rgtros: TLabel;
        Label_Fecha2: TLabel;
        Memo_Filtros: TMemo;
        Memo_OrderBy: TMemo;
        PageControl_Filtros: TPageControl;
        RadioGroup_Bajas: TRadioGroup;
        SQLQuery_Impuestos: TSQLQuery;
        SQLQuery_ImpuestosChange_Id_User: TLargeintField;
        SQLQuery_ImpuestosChange_WHEN: TDateTimeField;
        SQLQuery_ImpuestosCuenta_Contable: TStringField;
        SQLQuery_ImpuestosDel_Id_User: TLargeintField;
        SQLQuery_ImpuestosDel_WHEN: TDateTimeField;
        SQLQuery_ImpuestosDel_WHY: TStringField;
        SQLQuery_Impuestosdescripcion: TStringField;
        SQLQuery_ImpuestosInsert_Id_User: TLargeintField;
        SQLQuery_ImpuestosInsert_WHEN: TDateTimeField;
        SQLQuery_ImpuestosSumado_A_Ftra_SN: TStringField;
        SQLQuery_ImpuestosTanto_Por_Ciento: TBCDField;
        SQLQuery_Impuestos_Composiciones: TSQLQuery;
        SQLQuery_Impuestosid: TLargeintField;
        SQLQuery_Impuestosid1: TLargeintField;
        SQLQuery_Impuestos_ComposicionesChange_Id_User: TLargeintField;
        SQLQuery_Impuestos_ComposicionesChange_WHEN: TDateTimeField;
        SQLQuery_Impuestos_ComposicionesDel_Id_User: TLargeintField;
        SQLQuery_Impuestos_ComposicionesDel_WHEN: TDateTimeField;
        SQLQuery_Impuestos_ComposicionesDel_WHY: TStringField;
        SQLQuery_Impuestos_Composicionesid_impuestos: TLargeintField;
        SQLQuery_Impuestos_Composicionesid_impuestos_al_que_pertenece: TLargeintField;
        SQLQuery_Impuestos_ComposicionesInsert_Id_User: TLargeintField;
        SQLQuery_Impuestos_ComposicionesInsert_WHEN: TDateTimeField;
        SQLQuery_Impuestos_ComposicionesOT_Cuenta_Contable: TStringField;
        SQLQuery_Impuestos_ComposicionesOT_descripcion_impuesto: TStringField;
        SQLQuery_Impuestos_ComposicionesOT_Sumado_A_Ftra_SN: TStringField;
        SQLQuery_Impuestos_ComposicionesOT_Tanto_Por_Ciento: TBCDField;
        TabSheet_Busqueda_Concreta: TTabSheet;
        TabSheet_Filtros_Generales: TTabSheet;

        procedure ComboBox_FiltrosChange(Sender: TObject);
        procedure Filtrar_Principal_Sin_Preguntar;
        procedure Editar_Registro;
        procedure Insertar_Registro;
        function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
        function  Filtrar_impuestos_composiciones( param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
        procedure Filtrar_tablas_ligadas;
        procedure BitBtn_FiltrarClick(Sender: TObject);
        procedure BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
        procedure Presentar_Datos;
        procedure no_Tocar;
        procedure BitBtn_ImprimirClick(Sender: TObject);
        procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
        procedure Seleccionado_Rgtro;
        procedure BitBtn_SeleccionarClick(Sender: TObject);
        procedure BitBtn_SALIRClick(Sender: TObject);
        procedure DBGrid_PrincipalCellClick(Column: TColumn);
        procedure DBGrid_PrincipalDblClick(Sender: TObject);
        procedure DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
        procedure DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure Refrescar_Registros;
        procedure Refrescar_Registros_Composiciones;
        procedure Cerramos_Tablas;
        procedure Cerramos_Tablas_Ligadas;
        procedure FormActivate(Sender: TObject);
        procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
        procedure FormCreate(Sender: TObject);
        procedure FormDestroy(Sender: TObject);
        procedure para_Empezar;
        procedure RadioGroup_BajasClick(Sender: TObject);
        procedure SQLQuery_ImpuestosAfterPost(DataSet: TDataSet);
        procedure SQLQuery_ImpuestosAfterScroll(DataSet: TDataSet);
        procedure SQLQuery_ImpuestosBeforeEdit(DataSet: TDataSet);
        procedure SQLQuery_ImpuestosBeforePost(DataSet: TDataSet);
        procedure SQLQuery_Impuestos_ComposicionesAfterPost(DataSet: TDataSet);
        procedure SQLQuery_Impuestos_ComposicionesBeforeEdit(DataSet: TDataSet);
        procedure SQLQuery_Impuestos_ComposicionesBeforePost(DataSet: TDataSet);

    private
        { private declarations }
        private_Salir_OK               : Boolean;
        private_Order_By               : array of TOrder_By;
        private_Order_By_composiciones : array of TOrder_By;
    public
        { public declarations }
        public_Solo_Ver           : Boolean;
        public_Elegimos           : Boolean;
        public_Menu_Worked        : Integer;
        public_Rgtro_Seleccionado : Boolean;
    end;

var
    form_impuestos_000: Tform_impuestos_000;

implementation

{$R *.lfm}

uses dm_impuestos, menu, impuestos_001;

{ Tform_impuestos_000 }

procedure Tform_impuestos_000.FormCreate(Sender: TObject);
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

procedure Tform_impuestos_000.para_Empezar;
begin
  { ****************************************************************************
    Solo para formularios que traten con datos
    **************************************************************************** }
    if UTI_GEN_Form_Abierto_Ya('DataModule_Impuestos') = False then
    begin
        DataModule_Impuestos := TDataModule_Impuestos.Create(Application);
    end;

  { ****************************************************************************
    Preparamos los diferentes tipos de orden preconfigurados
    **************************************************************************** }
    // IMPUESTOS
    SetLength(private_Order_By, 4);

    private_Order_By[0].Titulo       := 'Por la descripción'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[0].Memo_OrderBy := 'i.descripcion ASC';

    private_Order_By[3].Titulo       := 'Por la id';
    private_Order_By[3].Memo_OrderBy := 'i.id ASC';

    Memo_OrderBy.Lines.Text          := private_Order_By[0].Memo_OrderBy;

    UTI_TB_Rellenar_ComboBox_Orden( true,
                                    ComboBox_Filtros,
                                    private_Order_By,
                                    0 );

    // IMPUESTOS_COMPOSICIONES
    SetLength(private_Order_By_composiciones, 1);

    private_Order_By_composiciones[0].Titulo       := 'Por la id del impuesto'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_composiciones[0].Memo_OrderBy := 'ic.id_impuestos_al_que_pertenece ASC, ic.id_impuestos ASC';

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

procedure Tform_impuestos_000.FormActivate(Sender: TObject);
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

procedure Tform_impuestos_000.RadioGroup_BajasClick(Sender: TObject);
begin
    Refrescar_Registros;
end;

procedure Tform_impuestos_000.FormClose(Sender: TObject; var CloseAction: TCloseAction);
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
            if form_Menu.public_Salir_OK = False then CloseAction := CloseAction.caNone;
        end
    else
        begin
          { ********************************************************************
            Fue correcto el modo como quiere BitBtn_SALIR de la aplicación
            ******************************************************************** }
        end;
end;

procedure Tform_impuestos_000.FormDestroy(Sender: TObject);
begin
    Cerramos_Tablas;
end;

procedure Tform_impuestos_000.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_Impuestos.SQLConnector_Imptos,
                      DataModule_Impuestos.SQLTransaction_Imptos,
                      SQLQuery_Impuestos ) = false then UTI_GEN_Salir;

    DataModule_Impuestos.Free;
end;

procedure Tform_impuestos_000.Cerramos_Tablas_Ligadas;
begin
    if UTI_TB_Cerrar( DataModule_Impuestos.SQLConnector_ImptosComp,
                      DataModule_Impuestos.SQLTransaction_ImptosComp,
                      SQLQuery_Impuestos_Composiciones ) = false then UTI_GEN_Salir;
end;

procedure Tform_impuestos_000.Refrescar_Registros;
var var_descripcion : String;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_descripcion := '';

    if SQLQuery_Impuestos.RecordCount > 0 then
    begin
        var_descripcion := SQLQuery_Impuestos.FieldByName('descripcion').asString;
    end;

    Filtrar_Principal_Sin_Preguntar;

    if Trim(var_descripcion) <> '' then
    begin
         SQLQuery_Impuestos.Locate( 'descripcion',
                                    var_descripcion,
                                    [] );
    end;
end;

procedure Tform_impuestos_000.SQLQuery_Impuestos_ComposicionesAfterPost(DataSet: TDataSet);
begin
    UTI_RGTRO_Grabar( 'impuestos_composiciones', DataModule_Impuestos.SQLTransaction_ImptosComp, SQLQuery_Impuestos_Composiciones );
    Refrescar_Registros_Composiciones;
end;

procedure Tform_impuestos_000.SQLQuery_ImpuestosAfterPost(DataSet: TDataSet);
begin
    UTI_RGTRO_Grabar( 'impuestos', DataModule_Impuestos.SQLTransaction_Imptos, SQLQuery_Impuestos );
    Refrescar_Registros;
end;

procedure Tform_impuestos_000.SQLQuery_Impuestos_ComposicionesBeforePost(DataSet: TDataSet);
begin
    UTI_RGTRO_param_assign_value( SQLQuery_Impuestos_Composiciones );
end;

procedure Tform_impuestos_000.SQLQuery_ImpuestosBeforePost(DataSet: TDataSet);
begin
    UTI_RGTRO_param_assign_value( SQLQuery_Impuestos );
end;

procedure Tform_impuestos_000.SQLQuery_ImpuestosAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure Tform_impuestos_000.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    If public_Elegimos then
         Seleccionado_Rgtro
    else Editar_Registro;
end;

procedure Tform_impuestos_000.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then
    begin
        If public_Elegimos then
             Seleccionado_Rgtro
        else Editar_Registro;
    end;
end;

procedure Tform_impuestos_000.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

procedure Tform_impuestos_000.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure Tform_impuestos_000.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_impuestos_000.BitBtn_SeleccionarClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
end;

procedure Tform_impuestos_000.Seleccionado_Rgtro;
begin
    private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    public_Rgtro_Seleccionado := true;
    Close;
end;

procedure Tform_impuestos_000.DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
var var_msg           : TStrings;
    var_Fue_Utilizado : ShortInt;
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
                with SQLQuery_Impuestos do
                begin
                    var_Fue_Utilizado := UTI_IMPTOS_Fue_Utilizado( FieldByName('id').AsString );
                    if var_Fue_Utilizado = 0 then
                    begin
                        UTI_RGTRO_Borrar( 'impuestos',
                                          SQLQuery_Impuestos,
                                          public_Solo_Ver,
                                          public_Menu_Worked );
                    end else begin
                        var_msg := TStringList.Create;
                        var_msg.Add('No se puede borrar');
                        var_msg.Add(' ');

                        if var_Fue_Utilizado = 1 then
                        begin
                            var_msg.Add('Este impuesto fue usado ya.');
                        end else begin
                            var_msg.Add('No se pudo comprobar si está usado el impuesto.');
                        end;

                        UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
                        var_msg.Free;
                    end;
                end;
            end;
            Abort;
        end;

        nbRefresh : begin
            Refrescar_Registros;
            Abort;
        end;
    end;
end;

procedure Tform_impuestos_000.BitBtn_ImprimirClick(Sender: TObject);
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
                            ', con descripción %' +
                            Trim(Edit_Descripcion.Text) + '%';
    end;

    // ********************************************************************************************* //
    // ** Configuramos la llamada al generador de informes                                        ** //
    // ********************************************************************************************* //
    var_Ficheros := TStringList.Create;

    UTI_GEN_Informes( var_Ordenado_por,
                      SQLQuery_Impuestos,
                      DataSource_Impuestos,
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

procedure Tform_impuestos_000.no_Tocar;
begin
    BitBtn_Imprimir.Enabled := False;
end;

procedure Tform_impuestos_000.Presentar_Datos;
begin
     /// guardar por lo que pueda pasar
end;

procedure Tform_impuestos_000.BitBtn_FiltrarClick(Sender: TObject);
begin
    if PageControl_Filtros.ActivePage = TabSheet_Busqueda_Concreta then
    begin
        Filtrar_Principal_Sin_Preguntar;
    end else begin
        RadioGroup_Bajas.ItemIndex := Filtrar_Principal( true );
    end;
end;

procedure Tform_impuestos_000.BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if SQLQuery_Impuestos.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'impuestos',
                                           SQLQuery_Impuestos,
                                           DataSource_Impuestos,
                                           DBGrid_Principal );
        end;
    end;
end;

procedure Tform_impuestos_000.Filtrar_tablas_ligadas;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
begin
    if SQLQuery_Impuestos.RecordCount = 0 then Exit;

    if SQLQuery_Impuestos.State = dsInsert then
    begin
        Cerramos_Tablas_Ligadas;
        Exit;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    // ********************************************************************************************* //
    // ** IMPUESTOS_COMBINACIONES                                                                 ** //
    // ********************************************************************************************* //
    UTI_RGTRO_Add_to_Where( true,
                            var_Lineas_Filtro,
                            'ic.id_impuestos_al_que_pertenece = ' + SQLQuery_Impuestos.FieldByName('id').AsString );

    var_Lineas_OrderBy.Clear;
    Filtrar_impuestos_composiciones( RadioGroup_Bajas.ItemIndex,
                                     false,
                                     var_Lineas_Filtro,
                                     var_Lineas_OrderBy );

    // ********************************************************************************************* //
    // ** Continuamos vaciando los TStrings                                                       ** //
    // ********************************************************************************************* //
    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;
end;

procedure Tform_impuestos_000.Insertar_Registro;
var var_msg         : TStrings;
    var_descripcion : String;
begin
    with SQLQuery_Impuestos do
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

                    Application.CreateForm(Tform_impuestos_001, form_impuestos_001);

                    FieldByName('Sumado_A_Ftra_SN').AsString := 'S';

                    form_impuestos_001.RadioGroup_Bajas.ItemIndex := RadioGroup_Bajas.ItemIndex;

                    form_impuestos_001.DBGrid_Impuestos_Composiciones.Color := clSilver;

                    form_impuestos_001.para_Empezar;

                    form_impuestos_001.ShowModal;
                    if form_impuestos_001.public_Pulso_Aceptar = true then
                        begin
                            FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
                            FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                            var_descripcion                     := FieldByName('descripcion').AsString;

                            UTI_RGTRO_Grabar_Antes( 'impuestos', SQLQuery_Impuestos );

                            form_impuestos_001.Free;

                            if FieldByName('descripcion').AsString = var_descripcion then
                            begin
                                Editar_Registro;
                            end;
                        end
                    else begin
                        Cancel;
                        form_impuestos_001.Free;
                    end;
                end;
        end;

        var_msg.Free;
    end;
end;

function Tform_impuestos_000.Filtrar_impuestos_composiciones( param_ver_bajas : ShortInt;
                                                              param_Cambiamos_Filtro : Boolean;
                                                              param_Lineas_Filtro,
                                                              param_Lineas_OrderBy : TStrings ) : ShortInt;
var var_Registro_CRUD : TRegistro_CRUD;
    var_ctdad_Rgtros  : Integer;
begin
    var_Registro_CRUD := UTI_DATOS_TABLA_impuestos_composiciones_CRUD;
    var_ctdad_Rgtros  := -1;

    if Trim(param_Lineas_OrderBy.Text) = '' then
    begin
         param_Lineas_OrderBy.Text := private_Order_By_composiciones[0].Memo_OrderBy;
    end;

    Result := UTI_TB_Filtrar( private_Order_By_composiciones,

                              var_Registro_CRUD.Delete_SQL,
                              var_Registro_CRUD.Update_SQL,
                              var_Registro_CRUD.Insert_SQL,

                              var_ctdad_Rgtros,
                              DataModule_Impuestos.SQLTransaction_ImptosComp,
                              DataModule_Impuestos.SQLConnector_ImptosComp,
                              SQLQuery_Impuestos_Composiciones,

                              var_Registro_CRUD.name_tabla,
                              param_ver_bajas,

                              var_Registro_CRUD.SELECT_SQL,

                              param_Lineas_Filtro,
                              param_Lineas_OrderBy,
                              '',

                              param_Cambiamos_Filtro );
end;

function Tform_impuestos_000.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
var var_Registro_CRUD : TRegistro_CRUD;
    var_ctdad_Rgtros  : Integer;
    var_a_Filtrar     : TStrings;
begin
    var_a_Filtrar := TStringList.Create;
    var_a_Filtrar.Clear;

    var_Registro_CRUD := UTI_DATOS_TABLA_impuestos_CRUD;
    var_ctdad_Rgtros  := -1;

    // ********************************************************************************************* //
    // ** AHORA PONDREMOS EL RESTO DE LOS FILTROS QUE NO SON GENERALES                            ** //
    // ********************************************************************************************* //
    // ** Primero buscaremos en el nombre y apellido el texto a buscar                              ** //
    // ********************************************************************************************* //
    if Trim(Edit_Descripcion.Text) <> '' then
    begin
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'i.descripcion LIKE ' +
                                UTI_GEN_Comillas('%' + Trim(Edit_Descripcion.Text) + '%') );
    end;

    // ********************************************************************************************* //
    // ** Pasamos a filtrar los registros                                                         ** //
    // ********************************************************************************************* //
    Result := UTI_TB_Filtrar( private_Order_By,

                              var_Registro_CRUD.Delete_SQL,
                              var_Registro_CRUD.Update_SQL,
                              var_Registro_CRUD.Insert_SQL,

                              var_ctdad_Rgtros,
                              DataModule_Impuestos.SQLTransaction_Imptos,
                              DataModule_Impuestos.SQLConnector_Imptos,
                              SQLQuery_Impuestos,

                              var_Registro_CRUD.name_tabla,
                              RadioGroup_Bajas.ItemIndex,

                              var_Registro_CRUD.SELECT_SQL,

                              Memo_Filtros.Lines,
                              Memo_OrderBy.Lines,
                              var_a_Filtrar.Text,

                              param_Cambiamos_Filtro );

    var_a_Filtrar.Free;

    Label_Ctdad_Rgtros.Caption := IntToStr(SQLQuery_Impuestos.RecordCount);

    if SQLQuery_Impuestos.RecordCount = 0 then
    begin
        Cerramos_Tablas_Ligadas;
    end;

    //Filtrar_tablas_ligadas;
end;

procedure Tform_impuestos_000.Refrescar_Registros_Composiciones;
var var_Lineas_Filtro                 : TStrings;
    var_Lineas_OrderBy                : TStrings;
    var_id_impuestos_al_que_pertenece : Int64;
    var_id_impuestos                  : Int64;
    var_ver_Bajas                     : ShortInt;
begin
    // ********************************************************************************************* //
    // ** Solo si la cabecera está en modo EDIT se abren las tablas hijas                         ** //
    // ********************************************************************************************* //
    if SQLQuery_Impuestos.State <> dsEdit then Exit;

    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_id_impuestos_al_que_pertenece := 0;
    var_id_impuestos                  := 0;

    if SQLQuery_Impuestos_Composiciones.RecordCount > 0 then
    begin
        var_id_impuestos_al_que_pertenece := SQLQuery_Impuestos_Composiciones.FieldByName('id_impuestos_al_que_pertenece').Value;
        var_id_impuestos                  := SQLQuery_Impuestos_Composiciones.FieldByName('id_impuestos').Value;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Clear;
    var_Lineas_OrderBy.Clear;

    if Trim(SQLQuery_Impuestos.FieldByName('id').AsString) <> '' then
         var_Lineas_Filtro.Add('ic.id_impuestos_al_que_pertenece = ' + Trim(SQLQuery_Impuestos.FieldByName('id').AsString))
    else var_Lineas_Filtro.Add('ic.id_impuestos_al_que_pertenece = Null');

    var_ver_Bajas := RadioGroup_Bajas.ItemIndex;
    if UTI_GEN_Form_Abierto_Ya('form_impuestos_001') = true then
    begin
        var_ver_Bajas := form_impuestos_001.RadioGroup_Bajas.ItemIndex;
    end;

    Filtrar_impuestos_composiciones( var_ver_Bajas,
                                     false,
                                     var_Lineas_Filtro,
                                     var_Lineas_OrderBy );

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;

    if var_id_impuestos_al_que_pertenece <> 0 then
    begin
        SQLQuery_Impuestos_Composiciones.Locate( 'id_impuestos_al_que_pertenece;id_impuestos',
                                                 VarArrayOf( [ var_id_impuestos_al_que_pertenece,
                                                               var_id_impuestos ] ),
                                         [] );
    end;
end;

procedure Tform_impuestos_000.Editar_Registro;
var var_msg : TStrings;
    var_id  : ShortString;
begin
    with SQLQuery_Impuestos do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
            begin
                var_id := FieldByName('id').AsString;

                if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
                begin
                    if UTI_RGTRO_isLock( 'impuestos',
                                         FieldByName('id').AsString,
                                         true ) = true then
                        begin
                            Exit;
                        end
                    else
                        begin
                            if UTI_RGTRO_Lock( 'impuestos',
                                               FieldByName('id').AsString ) = true then
                                 Edit
                            else Exit;
                        end;

                    Application.CreateForm(Tform_impuestos_001, form_impuestos_001);

                    form_impuestos_001.RadioGroup_Bajas.ItemIndex := RadioGroup_Bajas.ItemIndex;
                    form_impuestos_001.public_Menu_Worked         := public_Menu_Worked;

                    if public_Solo_Ver = true then
                    begin
                        form_impuestos_001.public_Solo_Ver := true;
                    end;

                    form_impuestos_001.para_Empezar;

                    form_impuestos_001.ShowModal;
                    if form_impuestos_001.public_Pulso_Aceptar = true then
                        begin
                            if ( Trim(Params.ParamByName('COPY_' + 'descripcion').AsString)      <> Trim(FieldByName('descripcion').AsString) )      or
                               ( Trim(Params.ParamByName('COPY_' + 'Cuenta_Contable').AsString)  <> Trim(FieldByName('Cuenta_Contable').AsString) )  or
                               ( Trim(Params.ParamByName('COPY_' + 'Sumado_A_Ftra_SN').AsString) <> Trim(FieldByName('Sumado_A_Ftra_SN').AsString) ) or
                               ( Trim(Params.ParamByName('COPY_' + 'Tanto_Por_Ciento').AsString) <> Trim(FieldByName('Tanto_Por_Ciento').AsString) ) then
                               begin
                                    FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                                    FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                                    UTI_RGTRO_Grabar_Antes( 'impuestos',
                                                            SQLQuery_Impuestos );
                               end
                            else Cancel;
                        end
                    else Cancel;

                    form_impuestos_001.Free;

                    UTI_RGTRO_UnLock( 'impuestos',
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

procedure Tform_impuestos_000.SQLQuery_ImpuestosBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTRO_param_assign_value_Edit( SQLQuery_Impuestos );
end;

procedure Tform_impuestos_000.SQLQuery_Impuestos_ComposicionesBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTRO_param_assign_value_Edit( SQLQuery_Impuestos_Composiciones );
end;

procedure Tform_impuestos_000.Filtrar_Principal_Sin_Preguntar;
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

procedure Tform_impuestos_000.ComboBox_FiltrosChange(Sender: TObject);
begin
    Memo_OrderBy.Lines.Clear;
    Memo_OrderBy.Lines.Add( private_Order_By[ComboBox_Filtros.ItemIndex].Memo_OrderBy );
    BitBtn_FiltrarClick(Nil);
end;

procedure Tform_impuestos_000.DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
var var_Color_Normal : TColor;
begin
    with Sender as TDBGrid do
    begin
        if SQLQuery_Impuestos.RecordCount = 0 then Exit;

        var_Color_Normal := Canvas.Brush.Color;

        // ***************************************************************************************** //
        // ** Primero comprobamos si es un registro dado de baja o no                             ** //
        // ***************************************************************************************** //
        if not SQLQuery_Impuestos.FieldByName('Del_WHEN').IsNull then
        begin
            // ************************************************************************************* //
            // ** Registro DADO de BAJA                                                           ** //
            // ************************************************************************************* //
            Canvas.Font.Color := clSilver;
        end else begin
            // ************************************************************************************* //
            // ** Registro DADO de ALTA, NO BAJA                                                  ** //
            // ************************************************************************************* //
            // ** Así que las pinto, pero sólo si no son las columnas que van a ser dibujadas     ** //
            // ************************************************************************************* //
            if State <> [gdSelected] then
            begin
                if (Column.FieldName <> 'COLUMNA_CON_IMAGEN') then
                begin
                    Canvas.font.Color := clBlack;
                end;
            end;
        end;

        // ***************************************************************************************** //
        // ** Ahora paso a dibujar una celda normal con los colores elegidos o una dibujada       ** //
        // ***************************************************************************************** //
        if (Column.FieldName <> 'COLUMNA_CON_IMAGEN') then
        begin
            // ************************************************************************************* //
            // ** No es una de las columnas a dibujar por lo que la pinto con los colores elegidos** //
            // ************************************************************************************* //
            DefaultDrawColumnCell(Rect, DataCol, Column, State)
        end else begin
            // ************************************************************************************* //
            // ** Es una de las columnas a dibujar                                                ** //
            // ************************************************************************************* //
            if Column.FieldName = 'COLUMNA_CON_IMAGEN'  then
            begin
                if SQLQuery_Impuestos.FieldByName('Tanto_Por_Ciento').AsString = '' then
                begin
                    Canvas.StretchDraw(Rect, Image_Confirmado.Picture.Graphic);
                end;
            end;
        end;

        Canvas.Font.Color := var_Color_Normal;
    end;
end;

end.



