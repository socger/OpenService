unit tarifas_000;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons, ComCtrls, DBGrids, DbCtrls, Grids, utilidades_bd, utilidades_rgtro, utilidades_general,
  utilidades_usuarios, utilidades_datos_tablas;

type

  { Tform_tarifas_000 }

  Tform_tarifas_000 = class(TForm)
    BitBtn_Filtrar: TBitBtn;
    BitBtn_Imprimir: TBitBtn;
    BitBtn_SALIR: TBitBtn;
    BitBtn_Seleccionar: TBitBtn;
    BitBtn_Ver_Situacion_Registro: TBitBtn;
    ComboBox_Filtros: TComboBox;
    DataSource_Tarifas_Margenes: TDataSource;
    DataSource_Tarifas: TDataSource;
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
    SQLQuery_Tarifasdescripcion: TStringField;
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
    SQLQuery_Tarifas: TSQLQuery;
    SQLQuery_TarifasChange_Id_User: TLargeintField;
    SQLQuery_TarifasChange_WHEN: TDateTimeField;
    SQLQuery_TarifasDel_Id_User: TLargeintField;
    SQLQuery_TarifasDel_WHEN: TDateTimeField;
    SQLQuery_TarifasDel_WHY: TStringField;
    SQLQuery_Tarifasid: TLargeintField;
    SQLQuery_TarifasInsert_Id_User: TLargeintField;
    SQLQuery_TarifasInsert_WHEN: TDateTimeField;
    SQLQuery_Tarifas_MargenesOT_mayor_igual_que: TBCDField;
    SQLQuery_Tarifas_MargenesOT_menor_igual_que: TBCDField;
    SQLQuery_Tarifas_MargenesOT_Tarifa_Descripcion: TStringField;
    TabSheet_Busqueda_Concreta: TTabSheet;
    TabSheet_Filtros_Generales: TTabSheet;

    procedure ComboBox_FiltrosChange(Sender: TObject);
    procedure para_Empezar;
    procedure FormCreate(Sender: TObject);
    procedure Insertar_Registro;
    procedure Editar_Registro;
    procedure Refrescar_Registros_Margenes;
    procedure BitBtn_FiltrarClick(Sender: TObject);
    procedure BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
    procedure Presentar_Datos;
    procedure no_Tocar;
    procedure BitBtn_ImprimirClick(Sender: TObject);
    procedure BitBtn_SeleccionarClick(Sender: TObject);
    procedure DBGrid_PrincipalCellClick(Column: TColumn);
    procedure DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure Seleccionado_Rgtro;
    procedure DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Refrescar_Registros;
    procedure Filtrar_tablas_ligadas;
    procedure Filtrar_Principal_Sin_Preguntar;
    procedure BitBtn_SALIRClick(Sender: TObject);
    procedure Cerramos_Tablas_Ligadas;
    procedure Cerramos_Tablas;
    procedure DBGrid_PrincipalDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure RadioGroup_BajasClick(Sender: TObject);
    procedure SQLQuery_TarifasAfterPost(DataSet: TDataSet);
    procedure SQLQuery_TarifasAfterScroll(DataSet: TDataSet);
    procedure SQLQuery_TarifasBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_TarifasBeforePost(DataSet: TDataSet);
    procedure SQLQuery_TarifasCalcFields(DataSet: TDataSet);
    procedure SQLQuery_Tarifas_MargenesAfterPost(DataSet: TDataSet);
    procedure SQLQuery_Tarifas_MargenesBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_Tarifas_MargenesBeforePost(DataSet: TDataSet);
    procedure SQLQuery_Tarifas_MargenesCalcFields(DataSet: TDataSet);
    function  Filtrar_Tarifas_Margenes( param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
    function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;

  private
      { private declarations }
      private_Salir_OK          : Boolean;
      private_Order_By          : array of TOrder_By;
      private_Order_By_margenes : array of TOrder_By;
  public
      { public declarations }
      public_Solo_Ver           : Boolean;
      public_Elegimos           : Boolean;
      public_Menu_Worked        : Integer;
      public_Rgtro_Seleccionado : Boolean;
  end;

var
  form_tarifas_000: Tform_tarifas_000;

implementation

{$R *.lfm}

uses dm_tarifas, menu, tarifas_001;

{ Tform_tarifas_000 }

procedure Tform_tarifas_000.FormActivate(Sender: TObject);
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

procedure Tform_tarifas_000.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
    if private_Salir_OK = False then
    begin
        // ***************************************************************************************** //
        // ** Intento BitBtn_SALIR de la aplicación de un modo no permitido.                      ** //
        // ***************************************************************************************** //
        // ** Pero si desde el menu principal está a true la variable public_Salir_Ok, significa  ** //
        // ** que hay que salir si o si pues se pulsó cancelar al preguntar otra vez por la       ** //
        // ** contraseña                                                                          ** //
        // ***************************************************************************************** //
        if form_Menu.public_Salir_OK = False then CloseAction := TCloseAction.caNone;
    end else begin
        // ***************************************************************************************** //
        // ** Fue correcto el modo como quiere BitBtn_SALIR de la aplicación                      ** //
        // ***************************************************************************************** //
    end;
end;

procedure Tform_tarifas_000.FormDestroy(Sender: TObject);
begin
    Cerramos_Tablas;
end;

procedure Tform_tarifas_000.SQLQuery_TarifasAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'tarifas',
                       DataModule_Tarifas.SQLTransaction_Tarifas,
                       SQLQuery_Tarifas,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros;
end;

procedure Tform_tarifas_000.SQLQuery_TarifasAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure Tform_tarifas_000.SQLQuery_TarifasBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Tarifas );
end;

procedure Tform_tarifas_000.SQLQuery_TarifasBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Tarifas );
end;

procedure Tform_tarifas_000.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_Tarifas.SQLConnector_Tarifas,
                      DataModule_Tarifas.SQLTransaction_Tarifas,
                      SQLQuery_Tarifas ) = false then UTI_GEN_Salir;

    DataModule_Tarifas.Free;
end;

procedure Tform_tarifas_000.Cerramos_Tablas_Ligadas;
begin
    if UTI_TB_Cerrar( DataModule_Tarifas.SQLConnector_Tarifas_Margenes,
                      DataModule_Tarifas.SQLTransaction_Tarifas_Margenes,
                      SQLQuery_Tarifas_Margenes ) = false then UTI_GEN_Salir;
end;

procedure Tform_tarifas_000.SQLQuery_TarifasCalcFields(DataSet: TDataSet);
begin
    with SQLQuery_Tarifas do
    begin
    end;
end;

procedure Tform_tarifas_000.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    If public_Elegimos then
         Seleccionado_Rgtro
    else Editar_Registro;
end;

procedure Tform_tarifas_000.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_tarifas_000.RadioGroup_BajasClick(Sender: TObject);
begin
    Refrescar_Registros;
end;

procedure Tform_tarifas_000.SQLQuery_Tarifas_MargenesAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'tarifas_margenes',
                       DataModule_Tarifas.SQLTransaction_Tarifas_Margenes,
                       SQLQuery_Tarifas_Margenes,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros_Margenes;
end;

procedure Tform_tarifas_000.SQLQuery_Tarifas_MargenesBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Tarifas_Margenes );
end;

procedure Tform_tarifas_000.SQLQuery_Tarifas_MargenesBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Tarifas_Margenes );
end;

procedure Tform_tarifas_000.SQLQuery_Tarifas_MargenesCalcFields(DataSet: TDataSet);
begin
    with SQLQuery_Tarifas_Margenes do
    begin
    end;
end;

procedure Tform_tarifas_000.Refrescar_Registros;
var var_descripcion : String;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_descripcion := '';

    if SQLQuery_Tarifas.RecordCount > 0 then
    begin
        var_descripcion := SQLQuery_Tarifas.FieldByName('descripcion').Value;
    end;

    Filtrar_Principal_Sin_Preguntar;

    if Trim(var_descripcion) <> '' then SQLQuery_Tarifas.Locate('descripcion', var_descripcion, []);
end;

procedure Tform_tarifas_000.Filtrar_tablas_ligadas;
var
  var_Lineas_Filtro  : TStrings;
  var_Lineas_OrderBy : TStrings;
  var_SQL_ADD        : TStrings;
begin
    var_SQL_ADD   := TStringList.Create;

    if SQLQuery_Tarifas.RecordCount = 0 then Exit;

    if SQLQuery_Tarifas.State = dsInsert then
    begin
        Cerramos_Tablas_Ligadas;
        Exit;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    // ********************************************************************************************* //
    // ** TARIFAS MARGENES                                                                        ** //
    // ********************************************************************************************* //
    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'tm.id_tarifas = ' + SQLQuery_Tarifas.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_Lineas_OrderBy.Clear;
    Filtrar_Tarifas_Margenes( RadioGroup_Bajas.ItemIndex,
                              false,
                              var_Lineas_Filtro,
                              var_Lineas_OrderBy );

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;
    var_SQL_ADD.Free;
end;

procedure Tform_tarifas_000.DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    UTI_GEN_Dibujar_Grid( Sender, SQLQuery_Tarifas, Rect, DataCol, Column, State );
end;

procedure Tform_tarifas_000.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then
    begin
        If public_Elegimos then
             Seleccionado_Rgtro
        else Editar_Registro;
    end;
end;

procedure Tform_tarifas_000.Seleccionado_Rgtro;
begin
    private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    public_Rgtro_Seleccionado := true;
    Close;
end;

procedure Tform_tarifas_000.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

procedure Tform_tarifas_000.DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
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
                UTI_RGTRO_Borrar( 'tarifas',
                                  SQLQuery_Tarifas,
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

procedure Tform_tarifas_000.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure Tform_tarifas_000.BitBtn_SeleccionarClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
end;

procedure Tform_tarifas_000.BitBtn_ImprimirClick(Sender: TObject);
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
                      SQLQuery_Tarifas,
                      DataSource_Tarifas,
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

procedure Tform_tarifas_000.no_Tocar;
begin
    BitBtn_Imprimir.Enabled := False;
end;

procedure Tform_tarifas_000.Presentar_Datos;
begin
     /// guardar por lo que pueda pasar
end;

procedure Tform_tarifas_000.BitBtn_FiltrarClick(Sender: TObject);
begin
    if PageControl_Filtros.ActivePage = TabSheet_Busqueda_Concreta then
    begin
        Filtrar_Principal_Sin_Preguntar;
    end else begin
        RadioGroup_Bajas.ItemIndex := Filtrar_Principal( true );
    end;
end;

procedure Tform_tarifas_000.BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if SQLQuery_Tarifas.RecordCount > 0 then UTI_RGTRO_Ver_Estado_Registro( 'tarifas',
                                                                                SQLQuery_Tarifas,
                                                                                DataSource_Tarifas,
                                                                                DBGrid_Principal );
    end;
end;

function Tform_tarifas_000.Filtrar_Tarifas_Margenes( param_ver_bajas : ShortInt;
                                                     param_Cambiamos_Filtro : Boolean;
                                                     param_Lineas_Filtro,
                                                     param_Lineas_OrderBy : TStrings ) : ShortInt;
var
  var_a_Filtrar : TStrings;
begin
  var_a_Filtrar := TStringList.Create;
  var_a_Filtrar.Clear;

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

                            DataModule_Tarifas.SQLTransaction_Tarifas_Margenes,
                            DataModule_Tarifas.SQLConnector_Tarifas_Margenes,
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
                            var_a_Filtrar,

                            param_Cambiamos_Filtro );
  var_a_Filtrar.Free;
end;

function Tform_tarifas_000.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
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
    if Trim(Edit_Descripcion.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 't.descripcion LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Descripcion.Text) + '%') );
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
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Tarifas,
                                                            'tarifas',
                                                            'u' ),

                              // Insert_SQL,
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Tarifas,
                                                            'tarifas',
                                                            'i' ),

                              // var_ctdad_Rgtros,
                              -1,

                              DataModule_Tarifas.SQLTransaction_Tarifas,
                              DataModule_Tarifas.SQLConnector_Tarifas,
                              SQLQuery_Tarifas,

                              // name_tabla,
                              't',

                              RadioGroup_Bajas.ItemIndex,

                              // SELECT_SQL,
                              'SELECT t.*' + ' ' + ' ' +
                              'FROM tarifas AS t' + ' ',

                              Memo_Filtros.Lines,
                              Memo_OrderBy.Lines,
                              var_a_Filtrar,

                              param_Cambiamos_Filtro );

    var_a_Filtrar.Free;

    Label_Ctdad_Rgtros.Caption := IntToStr(SQLQuery_Tarifas.RecordCount);

    if SQLQuery_Tarifas.RecordCount = 0 then
    begin
        Cerramos_Tablas_Ligadas;
    end;

    //Filtrar_tablas_ligadas;
    var_SQL_ADD.Free;
end;

procedure Tform_tarifas_000.Refrescar_Registros_Margenes;
var var_Lineas_Filtro       : TStrings;
    var_Lineas_OrderBy      : TStrings;
    var_id_margenes_tarifas : Int64;
    var_ver_Bajas           : ShortInt;
begin
    // ********************************************************************************************* //
    // ** Solo si la cabecera está en modo EDIT se abren las tablas hijas                         ** //
    // ********************************************************************************************* //
    if SQLQuery_Tarifas.State <> dsEdit then Exit;

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

    if Trim(SQLQuery_Tarifas.FieldByName('id').AsString) <> '' then
         var_Lineas_Filtro.Add('tm.id_tarifas = ' + Trim(SQLQuery_Tarifas.FieldByName('id').AsString))
    else var_Lineas_Filtro.Add('tm.id_tarifas = Null');

    var_ver_Bajas := RadioGroup_Bajas.ItemIndex;
    if UTI_GEN_Form_Abierto_Ya('form_tarifas_001') = true then
    begin
        var_ver_Bajas := form_tarifas_001.RadioGroup_Bajas.ItemIndex;
    end;

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

procedure Tform_tarifas_000.Insertar_Registro;
var var_msg         : TStrings;
    var_descripcion : String;
begin
    with SQLQuery_Tarifas do
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

                Application.CreateForm(Tform_tarifas_001, form_tarifas_001);

                form_tarifas_001.DBGrid_Margenes.Color := clSilver;

                form_tarifas_001.RadioGroup_Bajas.ItemIndex := RadioGroup_Bajas.ItemIndex;

                form_tarifas_001.para_Empezar;

                form_tarifas_001.ShowModal;
                if form_tarifas_001.public_Pulso_Aceptar = true then
                begin
                    FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
                    FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                    var_descripcion                     := FieldByName('descripcion').AsString;

                    UTI_RGTRO_Grabar_Antes( 'tarifas', SQLQuery_Tarifas );

                    form_tarifas_001.Free;

                    if var_descripcion = FieldByName('descripcion').AsString then
                    begin
                        Editar_Registro;
                    end;
                end else begin
                    Cancel;
                    form_tarifas_001.Free;
                end;
            end;
        end;

        var_msg.Free;
    end;
end;

procedure Tform_tarifas_000.FormCreate(Sender: TObject);
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

procedure Tform_tarifas_000.para_Empezar;
begin
    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    if UTI_GEN_Form_Abierto_Ya('DataModule_Tarifas') = False then
    begin
        DataModule_Tarifas := TDataModule_Tarifas.Create(Application);
    end;

    // ********************************************************************************************* //
    // ** Preparamos los diferentes tipos de orden preconfigurados                                ** //
    // ********************************************************************************************* //
    // TARIFAS
    SetLength(private_Order_By, 2);

    private_Order_By[0].Titulo       := 'Por la descripción'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[0].Memo_OrderBy := 't.descripcion ASC';

    private_Order_By[1].Titulo       := 'Por la id';
    private_Order_By[1].Memo_OrderBy := 't.id ASC';

    Memo_OrderBy.Lines.Text          := private_Order_By[0].Memo_OrderBy;

    UTI_TB_Rellenar_ComboBox_Orden( true,
                                    ComboBox_Filtros,
                                    private_Order_By,
                                    0 );

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

procedure Tform_tarifas_000.Editar_Registro;
var var_msg : TStrings;
    var_id  : ShortString;
begin
    with SQLQuery_Tarifas do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
        begin
            var_id := FieldByName('id').AsString;

            if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
            begin
                if UTI_RGTRO_isLock( 'tarifas',
                                     FieldByName('id').AsString,
                                     true ) = true then
                begin
                    Exit;
                end else begin
                    if UTI_RGTRO_Lock( 'tarifas',
                                       FieldByName('id').AsString ) = true then
                         Edit
                    else Exit;
                end;

                Application.CreateForm(Tform_tarifas_001, form_tarifas_001);

                form_tarifas_001.RadioGroup_Bajas.ItemIndex := RadioGroup_Bajas.ItemIndex;
                form_tarifas_001.public_Menu_Worked         := public_Menu_Worked;

                if public_Solo_Ver = true then
                begin
                    form_tarifas_001.public_Solo_Ver := true;
                end;

                form_tarifas_001.para_Empezar;

                form_tarifas_001.ShowModal;
                if form_tarifas_001.public_Pulso_Aceptar = true then
                begin
                    if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( SQLQuery_Tarifas ) = true then
                    begin
                        FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                        FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                        UTI_RGTRO_Grabar_Antes( 'tarifas', SQLQuery_Tarifas );
                    end else begin
                        Cancel;
                    end;
                end else begin
                    Cancel;
                end;

                form_tarifas_001.Free;

                UTI_RGTRO_UnLock( 'tarifas', var_id );
            end;
        end else begin
            var_msg.Add(rs_no_Hay_Rgtros);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        end;
    end;

    var_msg.Free;
end;

procedure Tform_tarifas_000.Filtrar_Principal_Sin_Preguntar;
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

procedure Tform_tarifas_000.ComboBox_FiltrosChange(Sender: TObject);
begin
    Memo_OrderBy.Lines.Clear;
    Memo_OrderBy.Lines.Add( private_Order_By[ComboBox_Filtros.ItemIndex].Memo_OrderBy );
    BitBtn_FiltrarClick(Nil);
end;

end.

