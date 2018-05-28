unit personal_contratos_000;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, DateTimePicker, Forms, Controls, Graphics, Dialogs,
  Buttons, StdCtrls, utilidades_usuarios, utilidades_general, variants, utilidades_rgtro,
  utilidades_bd, ExtCtrls, utilidades_datos_tablas, DBGrids, DbCtrls, Grids, ComCtrls,
  utilidades_forms_Filtrar;

type

  { Tform_personal_contratos_000 }

  Tform_personal_contratos_000 = class(TForm)
    BitBtn_Filtrar: TBitBtn;
    BitBtn_Imprimir: TBitBtn;
    BitBtn_SALIR: TBitBtn;
    BitBtn_Seleccionar: TBitBtn;
    BitBtn_Ver_Situacion_Registro: TBitBtn;
    Boton_Elegir_id_personal_contratos_familias: TBitBtn;
    Boton_Elegir_Personal: TBitBtn;
    Boton_Elegir_id_Empresas: TBitBtn;
    ComboBox_Filtros: TComboBox;
    DataSource_PC: TDataSource;
    DBGrid_Principal: TDBGrid;
    DBNavigator1: TDBNavigator;
    Edit_Descripcion_id_personal_contratos_familias: TEdit;
    Edit_Descripcion_Personal: TEdit;
    Edit_Descripcion_id_Empresas: TEdit;
    Edit_id_personal_contratos_familias: TEdit;
    Edit_id_Personal: TEdit;
    Edit_id_Empresas: TEdit;
    GroupBox4: TGroupBox;
    Label18: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label_Ctdad_Rgtros: TLabel;
    Label_Fecha2: TLabel;
    Memo_Filtros: TMemo;
    Memo_OrderBy: TMemo;
    PageControl_Filtros: TPageControl;
    Panel2: TPanel;
    RadioButton_Contrato_Activos: TRadioButton;
    RadioButton_Contrato_Todos: TRadioButton;
    RadioGroup_Bajas: TRadioGroup;
    SQLQuery_Personal_Contratos: TSQLQuery;
    SQLQuery_Personal_ContratosChange_Id_User: TLargeintField;
    SQLQuery_Personal_ContratosChange_WHEN: TDateTimeField;
    SQLQuery_Personal_ContratosDel_Id_User: TLargeintField;
    SQLQuery_Personal_ContratosDel_WHEN: TDateTimeField;
    SQLQuery_Personal_ContratosDel_WHY: TStringField;
    SQLQuery_Personal_ContratosFin: TDateTimeField;
    SQLQuery_Personal_Contratosid: TLargeintField;
    SQLQuery_Personal_Contratosid_empresas: TLargeintField;
    SQLQuery_Personal_Contratosid_personal: TLargeintField;
    SQLQuery_Personal_Contratosid_personal_contratos_familias: TLargeintField;
    SQLQuery_Personal_ContratosInicio: TDateTimeField;
    SQLQuery_Personal_ContratosInsert_Id_User: TLargeintField;
    SQLQuery_Personal_ContratosInsert_WHEN: TDateTimeField;
    SQLQuery_Personal_ContratosObservaciones_Comentarios: TStringField;
    SQLQuery_Personal_ContratosOT_Descripcion_Contrato: TStringField;
    SQLQuery_Personal_ContratosOT_Descripcion_Empresa: TStringField;
    SQLQuery_Personal_ContratosOT_Nombre_Empleado: TStringField;
    TabSheet_Busqueda_Concreta: TTabSheet;
    TabSheet_Filtros_Generales: TTabSheet;

    procedure Boton_Elegir_id_EmpresasClick(Sender: TObject);
    procedure Boton_Elegir_id_personal_contratos_familiasClick(Sender: TObject);
    procedure Boton_Elegir_PersonalClick(Sender: TObject);
    procedure ComboBox_FiltrosChange(Sender: TObject);
    procedure Edit_Descripcion_id_EmpresasClick(Sender: TObject);
    procedure Edit_Descripcion_id_personal_contratos_familiasClick(
      Sender: TObject);
    procedure Edit_Descripcion_PersonalClick(Sender: TObject);
    procedure Filtrar_Principal_Sin_Preguntar;
    function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
    procedure para_Empezar;
    procedure FormCreate(Sender: TObject);
    procedure Insertar_Registro;
    procedure Editar_Registro;
    procedure BitBtn_FiltrarClick(Sender: TObject);
    procedure BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
    procedure Presentar_Datos;
    procedure no_Tocar;
    procedure BitBtn_ImprimirClick(Sender: TObject);
    procedure BitBtn_SeleccionarClick(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure Seleccionado_Rgtro;
    procedure DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn_SALIRClick(Sender: TObject);
    procedure Cerramos_Tablas_Ligadas;
    procedure Cerramos_Tablas;
    procedure DBGrid_PrincipalCellClick(Column: TColumn);
    procedure DBGrid_PrincipalDblClick(Sender: TObject);
    procedure DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Filtrar_tablas_ligadas;
    procedure Refrescar_Registros;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure RadioGroup_BajasClick(Sender: TObject);
    procedure SQLQuery_Personal_ContratosAfterPost(DataSet: TDataSet);
    procedure SQLQuery_Personal_ContratosAfterScroll(DataSet: TDataSet);
    procedure SQLQuery_Personal_ContratosBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_Personal_ContratosBeforePost(DataSet: TDataSet);
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

    public_id_personal        : ShortString;
    public_nombre_personal    : ShortString;
  end;

var
  form_personal_contratos_000: Tform_personal_contratos_000;

implementation

{$R *.lfm}

uses dm_personal_contratos, menu, personal_contratos_001;

{ Tform_personal_contratos_000 }

procedure Tform_personal_contratos_000.FormActivate(Sender: TObject);
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

procedure Tform_personal_contratos_000.FormDestroy(Sender: TObject);
begin
    Cerramos_Tablas;
end;

procedure Tform_personal_contratos_000.FormClose(Sender: TObject; var CloseAction: TCloseAction);
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

procedure Tform_personal_contratos_000.RadioGroup_BajasClick(Sender: TObject);
begin
    Refrescar_Registros;
end;

procedure Tform_personal_contratos_000.SQLQuery_Personal_ContratosAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'personal_contratos',
                       DataModule_Personal_Contratos.SQLTransaction,
                       SQLQuery_Personal_Contratos,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros;
end;

procedure Tform_personal_contratos_000.SQLQuery_Personal_ContratosAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure Tform_personal_contratos_000.SQLQuery_Personal_ContratosBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Personal_Contratos );
end;

procedure Tform_personal_contratos_000.SQLQuery_Personal_ContratosBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Personal_Contratos );
end;

procedure Tform_personal_contratos_000.Refrescar_Registros;
var var_id_personal                    : String;
    var_id_personal_contratos_familias : String;
    var_id_empresas                    : String;
    var_Inicio                         : String;
    var_Fin                            : String;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_id_personal                    := '';
    var_id_personal_contratos_familias := '';
    var_id_empresas                    := '';
    var_Inicio                         := '';
    var_Fin                            := '';

    with SQLQuery_Personal_Contratos do
    begin
        if RecordCount > 0 then
        begin
            var_id_personal                    := FieldByName('id_personal').asString;
            var_id_personal_contratos_familias := FieldByName('id_personal_contratos_familias').asString;
            var_id_empresas                    := FieldByName('id_empresas').asString;
            var_Inicio                         := FieldByName('Inicio').asString;
            var_Fin                            := FieldByName('Fin').asString;
        end;
    end;

    Filtrar_Principal_Sin_Preguntar;

    if Trim(var_id_personal) <> '' then
    begin
         SQLQuery_Personal_Contratos.Locate( 'id_personal;id_personal_contratos_familias;id_empresas;Inicio;Fin',
                                             VarArrayOf( [ var_id_personal, var_id_personal_contratos_familias, var_id_empresas, var_Inicio, var_Fin ] ),
                                             [] );
    end;
end;

procedure Tform_personal_contratos_000.Filtrar_tablas_ligadas;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
begin
    if SQLQuery_Personal_Contratos.RecordCount = 0 then Exit;

    if SQLQuery_Personal_Contratos.State = dsInsert then
    begin
        Cerramos_Tablas_Ligadas;
        Exit;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;
end;

procedure Tform_personal_contratos_000.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_Personal_Contratos.SQLConnector,
                      DataModule_Personal_Contratos.SQLTransaction,
                      SQLQuery_Personal_Contratos ) = false then UTI_GEN_Salir;

    DataModule_Personal_Contratos.Free;
end;

procedure Tform_personal_contratos_000.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure Tform_personal_contratos_000.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    If public_Elegimos then
         Seleccionado_Rgtro
    else Editar_Registro;
end;

procedure Tform_personal_contratos_000.DBGrid_PrincipalDrawColumnCell(Sender: TObject;
    const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    UTI_GEN_Dibujar_Grid( Sender, SQLQuery_Personal_Contratos, Rect, DataCol, Column, State );
end;

procedure Tform_personal_contratos_000.Cerramos_Tablas_Ligadas;
begin
{ ESTE form NO TIENE TABLAS LIGADAS

    if UTI_TB_Cerrar( DataModule_del_form_000.SQLConnector_de_la_tabla,
                      DataModule_Users.SQLTransaction_de_la_tabla,
                      SQLQuery_la_tabla ) = false then UTI_GEN_Salir;
}
end;

procedure Tform_personal_contratos_000.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_personal_contratos_000.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

procedure Tform_personal_contratos_000.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then
    begin
        If public_Elegimos then
             Seleccionado_Rgtro
        else Editar_Registro;
    end;
end;

procedure Tform_personal_contratos_000.Seleccionado_Rgtro;
begin
    private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    public_Rgtro_Seleccionado := true;
    Close;
end;

procedure Tform_personal_contratos_000.DBNavigator1BeforeAction(Sender: TObject;
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
                UTI_RGTRO_Borrar( 'personal_contratos',
                                  SQLQuery_Personal_Contratos,
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

procedure Tform_personal_contratos_000.BitBtn_SeleccionarClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
end;

procedure Tform_personal_contratos_000.BitBtn_ImprimirClick(Sender: TObject);
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

    if Trim(Edit_Descripcion_Personal.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con personal/empleado = ' +
                            Trim(Edit_Descripcion_Personal.Text);
    end;

    if Trim(Edit_Descripcion_id_Empresas.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con empresa = ' +
                            Trim(Edit_Descripcion_id_Empresas.Text);
    end;

    if Trim(Edit_Descripcion_id_personal_contratos_familias.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con tipo de contrato = ' +
                            Trim(Edit_Descripcion_id_personal_contratos_familias.Text);
    end;

    // ********************************************************************************************* //
    // ** Configuramos la llamada al generador de informes                                        ** //
    // ********************************************************************************************* //
    var_Ficheros := TStringList.Create;

    UTI_GEN_Informes( var_Ordenado_por,
                      SQLQuery_Personal_Contratos,
                      DataSource_PC,
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

procedure Tform_personal_contratos_000.no_Tocar;
begin
    BitBtn_Imprimir.Enabled := False;
end;

procedure Tform_personal_contratos_000.Presentar_Datos;
begin
     /// guardar por lo que pueda pasar
end;

procedure Tform_personal_contratos_000.BitBtn_FiltrarClick(Sender: TObject);
begin
    if PageControl_Filtros.ActivePage = TabSheet_Busqueda_Concreta then
    begin
        Filtrar_Principal_Sin_Preguntar;
    end else begin
        RadioGroup_Bajas.ItemIndex := Filtrar_Principal( true );
    end;
end;

procedure Tform_personal_contratos_000.BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if SQLQuery_Personal_Contratos.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'personal_contratos',
                                           SQLQuery_Personal_Contratos,
                                           DataSource_PC,
                                           DBGrid_Principal );
        end;
    end;
end;

procedure Tform_personal_contratos_000.Editar_Registro;
var var_msg : TStrings;
    var_id  : ShortString;
begin
    with SQLQuery_Personal_Contratos do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
            begin
                var_id := FieldByName('id').AsString;

                if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
                begin
                    if UTI_RGTRO_isLock( 'personal_contratos',
                                         FieldByName('id').AsString,
                                         true ) = true then
                        begin
                            Exit;
                        end
                    else
                        begin
                            if UTI_RGTRO_Lock( 'personal_contratos',
                                               FieldByName('id').AsString ) = true then
                                 Edit
                            else Exit;
                        end;

                    Application.CreateForm(Tform_personal_contratos_001, form_personal_contratos_001);

                    form_personal_contratos_001.public_Menu_Worked := public_Menu_Worked;

                    if public_Solo_Ver = true then
                    begin
                        form_personal_contratos_001.public_Solo_Ver := true;
                    end;

                    form_personal_contratos_001.para_Empezar;

                    form_personal_contratos_001.ShowModal;
                    if form_personal_contratos_001.public_Pulso_Aceptar = true then
                        begin
                            if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( SQLQuery_Personal_Contratos ) = true then
                               begin
                                    FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                                    FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                                    UTI_RGTRO_Grabar_Antes( 'personal_contratos',
                                                            SQLQuery_Personal_Contratos );
                               end
                            else Cancel;
                        end
                    else Cancel;

                    form_personal_contratos_001.Free;

                    UTI_RGTRO_UnLock( 'personal_contratos',
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

procedure Tform_personal_contratos_000.Insertar_Registro;
var var_msg : TStrings;
begin
    with SQLQuery_Personal_Contratos do
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

                    Application.CreateForm(Tform_personal_contratos_001, form_personal_contratos_001);

                    form_personal_contratos_001.para_Empezar;

                    // ***************************************************************************** //
                    // ** Es el momento de darle valores a algunos campos                         ** //
                    // ***************************************************************************** //
                    if Trim(public_id_personal) <> '' then
                    begin
                         FieldByName('id_personal').AsString                        := public_id_personal;
                         form_personal_contratos_001.Edit_Descripcion_Empleado.Text := public_nombre_personal;
                    end;
                    // ***************************************************************************** //

                    form_personal_contratos_001.ShowModal;
                    if form_personal_contratos_001.public_Pulso_Aceptar = true then
                        begin
                            FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
                            FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                            UTI_RGTRO_Grabar_Antes( 'personal_contratos',
                                                    SQLQuery_Personal_Contratos );

                            // RadioGroup_Bajas.ItemIndex := form_personal_contratos_001.RadioGroup_Bajas.ItemIndex;
                        end
                    else Cancel;

                    form_personal_contratos_001.Free;
                end;
        end;

        var_msg.Free;
    end;
end;

procedure Tform_personal_contratos_000.FormCreate(Sender: TObject);
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

    { ****************************************************************************
      Solo para este módulo
      **************************************************************************** }
      public_id_personal     := '';
      public_nombre_personal := '';
end;

procedure Tform_personal_contratos_000.para_Empezar;
begin
    { ****************************************************************************
      Solo para formularios que traten con datos
      **************************************************************************** }
      if UTI_GEN_Form_Abierto_Ya('DataModule_Personal_Contratos') = False then
      begin
          DataModule_Personal_Contratos := TDataModule_Personal_Contratos.Create(Application);
      end;

    { ****************************************************************************
      Preparamos los diferentes tipos de orden preconfigurados
      **************************************************************************** }
      SetLength(private_Order_By, 4);

      private_Order_By[0].Titulo       := 'Por empleado'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
      private_Order_By[0].Memo_OrderBy := 'pc.id_personal ASC, pc.Inicio ASC, pc.Fin ASC';

      private_Order_By[2].Titulo       := 'Por fecha inicioNIF / CIF';
      private_Order_By[2].Memo_OrderBy := 'pc.Inicio ASC, pc.Fin ASC';

      private_Order_By[3].Titulo       := 'Por la id';
      private_Order_By[3].Memo_OrderBy := 'pc.id ASC';

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

function Tform_personal_contratos_000.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
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
    // ** Ahora buscaremos por el empleado                                                        ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Personal.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pc.id_personal = ' + Trim(Edit_id_Personal.Text) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la empresa                                                         ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Empresas.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pc.id_empresas = ' + Trim(Edit_id_Empresas.Text) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por el tipo de contrato                                                ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_personal_contratos_familias.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pc.id_personal_contratos_familias = ' + Trim(Edit_id_personal_contratos_familias.Text) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora aquellos contratos que estén activos o todos                                      ** //
    // ********************************************************************************************* //
    if RadioButton_Contrato_Todos.Checked = false then
    begin
        // ***************************************************************************************** //
        // ** Aqui le añadimos el filtro para que devuelva sólo aquellos contratos que su periodo ** //
        // ** esté activo todavía                                                                 ** //
        // ***************************************************************************************** //
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pc.Inicio <= ' + UTI_GEN_Comillas(UTI_GEN_Format_Fecha_Hora(Date, false) + ' 00:00:00') );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );

        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pc.Fin >= ' + UTI_GEN_Comillas(UTI_GEN_Format_Fecha_Hora(Date, false) + ' 23:59:59') );
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
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Personal_Contratos,
                                                            'personal_contratos',
                                                            'u' ),

                              // Insert_SQL,
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Personal_Contratos,
                                                            'personal_contratos',
                                                            'i' ),

                              // var_ctdad_Rgtros,
                              -1,

                              DataModule_Personal_Contratos.SQLTransaction,
                              DataModule_Personal_Contratos.SQLConnector,
                              SQLQuery_Personal_Contratos,

                              // name_tabla,
                              'pc',

                              RadioGroup_Bajas.ItemIndex,

                              // SELECT_SQL,
                              'SELECT pc.*,' + ' ' +

                                     'p.nombre AS OT_Nombre_Empleado,' + ' ' +
                                     'pcf.descripcion AS OT_Descripcion_Contrato,' + ' ' +
                                     'e.nombre_comercial AS OT_Descripcion_Empresa' + ' ' +

                              'FROM personal_contratos AS pc' + ' ' +

                              'LEFT JOIN personal AS p' + ' ' +
                              'ON pc.id_personal = p.id' + ' ' +

                              'LEFT JOIN personal_contratos_familias AS pcf' + ' ' +
                              'ON pc.id_personal_contratos_familias = pcf.id' + ' ' +

                              'LEFT JOIN empresas AS e' + ' ' +
                              'ON pc.id_empresas = e.id' + ' ',

                              Memo_Filtros.Lines,
                              Memo_OrderBy.Lines,
                              var_a_Filtrar,

                              param_Cambiamos_Filtro,
                              false,   // param_ver_SQL_despues_Abrir : Boolean;
                              true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

    var_a_Filtrar.Free;

    Label_Ctdad_Rgtros.Caption := IntToStr(SQLQuery_Personal_Contratos.RecordCount);

    //Filtrar_tablas_ligadas;
    var_SQL_ADD.Free;
end;

procedure Tform_personal_contratos_000.Filtrar_Principal_Sin_Preguntar;
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

procedure Tform_personal_contratos_000.Boton_Elegir_id_EmpresasClick(
  Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Empresas( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Empresas.Text             := Trim(var_Registro.id_1);
        Edit_Descripcion_id_Empresas.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_personal_contratos_000.Boton_Elegir_id_personal_contratos_familiasClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_FamiliasContratosPersonal( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_personal_contratos_familias.Text             := Trim(var_Registro.id_1);
        Edit_Descripcion_id_personal_contratos_familias.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_personal_contratos_000.Boton_Elegir_PersonalClick(
  Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Personal( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Personal.Text          := Trim(var_Registro.id_1);
        Edit_Descripcion_Personal.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_personal_contratos_000.ComboBox_FiltrosChange(Sender: TObject);
begin
    Memo_OrderBy.Lines.Clear;
    Memo_OrderBy.Lines.Add( private_Order_By[ComboBox_Filtros.ItemIndex].Memo_OrderBy );
    BitBtn_FiltrarClick(Nil);
end;

procedure Tform_personal_contratos_000.Edit_Descripcion_id_EmpresasClick(
  Sender: TObject);
begin
    Edit_id_Empresas.Text             := '';
    Edit_Descripcion_id_Empresas.Text := '';
end;

procedure Tform_personal_contratos_000.Edit_Descripcion_id_personal_contratos_familiasClick
  (Sender: TObject);
begin
    Edit_id_personal_contratos_familias.Text             := '';
    Edit_Descripcion_id_personal_contratos_familias.Text := '';
end;

procedure Tform_personal_contratos_000.Edit_Descripcion_PersonalClick(
  Sender: TObject);
begin
    Edit_id_Personal.Text          := '';
    Edit_Descripcion_Personal.Text := '';
end;

end.

