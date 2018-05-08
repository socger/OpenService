unit peliculas_000;

{$mode objfpc}{$H+}

interface

uses
  Dialogs, Classes, sqldb, mysql55conn, db, FileUtil, LR_Class, LR_Desgn, Forms, Controls, Graphics,
  DbCtrls, DBGrids, StdCtrls, Buttons, ExtCtrls, utilidades_usuarios, utilidades_bd, utilidades_general,
  SysUtils, Grids, ComCtrls, utilidades_rgtro, variants, utilidades_datos_tablas, utilidades_forms_Filtrar,
  LCLTranslator;

resourcestring
  rs_BitBtn_ImprimirClick_1 = ', con descripción %';
  rs_BitBtn_ImprimirClick_2 = ', con medio = ';

  rs_para_Empezar_1         = 'Por el título';
  rs_para_Empezar_2         = 'Por Número';
  rs_para_Empezar_3         = 'Por la id';

type

  { TForm_peliculas_000 }

  TForm_peliculas_000 = class(TForm)
    BitBtn_Filtrar: TBitBtn;
    BitBtn_Imprimir: TBitBtn;
    BitBtn_SALIR: TBitBtn;
    BitBtn_Seleccionar: TBitBtn;
    BitBtn_Ver_Situacion_Registro: TBitBtn;
    Boton_Elegir_id_medios: TBitBtn;
    ComboBox_Filtros: TComboBox;
    DataSource_Pelis: TDataSource;
    DBGrid_Principal: TDBGrid;
    DBNavigator1: TDBNavigator;
    Edit_Descripcion: TEdit;
    Edit_Descripcion_id_medios: TEdit;
    Edit_id_medios: TEdit;
    Image_Confirmado: TImage;
    Label49: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label_Ctdad_Rgtros: TLabel;
    Label_Fecha2: TLabel;
    Memo_Filtros: TMemo;
    Memo_OrderBy: TMemo;
    PageControl_Filtros: TPageControl;
    RadioGroup_Bajas: TRadioGroup;
    SQLQuery_Pelis: TSQLQuery;
    SQLQuery_PelisChange_Id_User: TLargeintField;
    SQLQuery_PelisChange_WHEN: TDateTimeField;
    SQLQuery_PelisDel_Id_User: TLargeintField;
    SQLQuery_PelisDel_WHEN: TDateTimeField;
    SQLQuery_PelisDel_WHY: TStringField;
    SQLQuery_Pelisid: TLargeintField;
    SQLQuery_Pelisid_medio: TLargeintField;
    SQLQuery_PelisInsert_Id_User: TLargeintField;
    SQLQuery_PelisInsert_WHEN: TDateTimeField;
    SQLQuery_PelisNumero: TLongintField;
    SQLQuery_PelisOT_descripcion_medio: TStringField;
    SQLQuery_Pelistitulo: TStringField;
    TabSheet_Busqueda_Concreta: TTabSheet;
    TabSheet_Filtros_Generales: TTabSheet;

    procedure Boton_Elegir_id_mediosClick(Sender: TObject);
    procedure ComboBox_FiltrosChange(Sender: TObject);
    procedure Edit_Descripcion_id_mediosClick(Sender: TObject);
    procedure Filtrar_Principal_Sin_Preguntar;
    procedure Cerramos_Tablas_Ligadas;
    procedure FormCreate(Sender: TObject);
    procedure Presentar_Datos;
    function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
    procedure Filtrar_tablas_ligadas;
    procedure Cerramos_Tablas;
    procedure DBGrid_PrincipalCellClick(Column: TColumn);
    procedure FormDestroy(Sender: TObject);
    procedure no_Tocar;
    procedure BitBtn_ImprimirClick(Sender: TObject);
    procedure Refrescar_Registros;
    procedure BitBtn_FiltrarClick(Sender: TObject);
    procedure DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RadioGroup_BajasClick(Sender: TObject);
    procedure Seleccionado_Rgtro;
    procedure BitBtn_SeleccionarClick(Sender: TObject);
    procedure BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
    procedure DBGrid_PrincipalDblClick(Sender: TObject);
    procedure DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Editar_Registro;
    procedure FormActivate(Sender: TObject);
    procedure Insertar_Registro;
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure para_Empezar;
    procedure BitBtn_SALIRClick(Sender: TObject);
    procedure SQLQuery_PelisAfterPost(DataSet: TDataSet);
    procedure SQLQuery_PelisAfterScroll(DataSet: TDataSet);
    procedure SQLQuery_PelisBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_PelisBeforePost(DataSet: TDataSet);

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
  Form_peliculas_000: TForm_peliculas_000;

implementation

{$R *.lfm}

uses dm_pelis, peliculas_001, menu;

{ TForm_peliculas_000 }

procedure TForm_peliculas_000.FormActivate(Sender: TObject);
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

    if public_Solo_Ver = true then
    begin
        no_Tocar;
    end;
end;

procedure TForm_peliculas_000.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
    if private_Salir_OK = False then
    begin
        // ***************************************************************************************** //
        // ** Intento BitBtn_SALIR de la aplicación de un modo no permitido.                      ** //
        // ***************************************************************************************** //
        // ** Pero si desde el menu principal está a true la variable public_Salir_Ok, significa  ** //
        // ** que hay que salir si o si pues se pulsó cancelar al preguntar otra vez por la pwd   ** //
        // ***************************************************************************************** //
        if form_Menu.public_Salir_OK = False then
        begin
            CloseAction := caNone;
        end;
    end else begin
        // ***************************************************************************************** //
        // ** Fue correcto el modo como quiere BitBtn_SALIR de la aplicación                      ** //
        // ***************************************************************************************** //
    end;
end;

procedure TForm_peliculas_000.FormDestroy(Sender: TObject);
begin
    Cerramos_Tablas;
end;

procedure TForm_peliculas_000.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_Pelis.SQLConnector,
                      DataModule_Pelis.SQLTransaction,
                      SQLQuery_Pelis ) = false then UTI_GEN_Salir;

    DataModule_Pelis.Free;
end;

procedure TForm_peliculas_000.RadioGroup_BajasClick(Sender: TObject);
begin
    Refrescar_Registros;
end;

procedure TForm_peliculas_000.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure TForm_peliculas_000.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    If public_Elegimos then
         Seleccionado_Rgtro
    else Editar_Registro;
end;

procedure TForm_peliculas_000.DBGrid_PrincipalDrawColumnCell( Sender: TObject;
                                                              const Rect: TRect;
                                                              DataCol: Integer;
                                                              Column: TColumn;
                                                              State: TGridDrawState );
begin
    UTI_GEN_Dibujar_Grid( Sender, SQLQuery_Pelis, Rect, DataCol, Column, State );
end;

procedure TForm_peliculas_000.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then
    begin
        If public_Elegimos then
             Seleccionado_Rgtro
        else Editar_Registro;
    end;
end;

procedure TForm_peliculas_000.Seleccionado_Rgtro;
begin
    private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    public_Rgtro_Seleccionado := true;
    Close;
end;

procedure TForm_peliculas_000.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

procedure TForm_peliculas_000.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure TForm_peliculas_000.SQLQuery_PelisAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure TForm_peliculas_000.SQLQuery_PelisBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Pelis );
end;

procedure TForm_peliculas_000.DBNavigator1BeforeAction(Sender: TObject;
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
                UTI_RGTRO_Borrar( 'peliculas',
                                  SQLQuery_Pelis,
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

procedure TForm_peliculas_000.BitBtn_SeleccionarClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
end;

procedure TForm_peliculas_000.BitBtn_ImprimirClick(Sender: TObject);
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
                            rs_BitBtn_ImprimirClick_1 +
                            Trim(Edit_Descripcion.Text) + '%';
    end;

    if Trim(Edit_Descripcion_id_medios.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            rs_BitBtn_ImprimirClick_2 +
                            Trim(Edit_Descripcion_id_medios.Text);
    end;

    // ********************************************************************************************* //
    // ** Configuramos la llamada al generador de informes                                        ** //
    // ********************************************************************************************* //
    var_Ficheros := TStringList.Create;

    UTI_GEN_Informes( var_Ordenado_por,
                      SQLQuery_Pelis,
                      DataSource_Pelis,
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

procedure TForm_peliculas_000.no_Tocar;
begin
    BitBtn_Imprimir.Enabled := False;
end;

procedure TForm_peliculas_000.Insertar_Registro;
var var_msg        : TStrings;
    var_formulario : TForm_peliculas_001;
begin
    with SQLQuery_Pelis do
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
                    Insert ;

                    var_formulario := TForm_peliculas_001.Create(nil);

                    var_formulario.para_Empezar;

                    var_formulario.ShowModal;
                    if var_formulario.public_Pulso_Aceptar = true then
                        begin
                            FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
                            FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                            UTI_RGTRO_Grabar_Antes( 'peliculas',
                                                    SQLQuery_Pelis );
                        end
                    else Cancel;

                    var_formulario.Free;
                end;
        end;

        var_msg.Free;
    end;
end;

procedure TForm_peliculas_000.Filtrar_tablas_ligadas;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
begin
    if SQLQuery_Pelis.RecordCount = 0 then
    begin
        Exit;
    end;

    if SQLQuery_Pelis.State = dsInsert then
    begin
        Cerramos_Tablas_Ligadas;
        Exit;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    // ********************************************************************************************* //
    // ** No hay tablas ligadas para filtrar                                                      ** //
    // ********************************************************************************************* //

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;
end;

procedure TForm_peliculas_000.Presentar_Datos;
begin
     /// guardar por lo que pueda pasar
end;

procedure TForm_peliculas_000.BitBtn_FiltrarClick(Sender: TObject);
begin
    if PageControl_Filtros.ActivePage = TabSheet_Busqueda_Concreta then
    begin
        Filtrar_Principal_Sin_Preguntar;
    end else begin
        RadioGroup_Bajas.ItemIndex := Filtrar_Principal( true );
    end;
end;

procedure TForm_peliculas_000.Refrescar_Registros;
var var_titulo   : String;
    var_id_medio : Integer;
    var_Numero   : Integer;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_titulo   := '';
    var_id_medio := 0;
    var_Numero   := 0;

    if SQLQuery_Pelis.RecordCount > 0 then
    begin
        var_titulo   := SQLQuery_Pelis.FieldByName('titulo').Value;
        var_id_medio := SQLQuery_Pelis.FieldByName('id_medio').Value;
        var_Numero   := SQLQuery_Pelis.FieldByName('Numero').Value;
    end;

    Filtrar_Principal_Sin_Preguntar;

    if Trim(var_titulo) <> '' then
    begin
         SQLQuery_Pelis.Locate( 'titulo;id_medio;Numero',
                                VarArrayOf( [ var_titulo, var_id_medio, var_Numero ] ),
                                [] );
    end;
end;

procedure TForm_peliculas_000.BitBtn_Ver_Situacion_RegistroClick( Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if SQLQuery_Pelis.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'peliculas', SQLQuery_Pelis, DataSource_Pelis, DBGrid_Principal );
        end;
    end;
end;

procedure TForm_peliculas_000.SQLQuery_PelisAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'peliculas',
                       DataModule_Pelis.SQLTransaction,
                       SQLQuery_Pelis,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros;
end;

procedure TForm_peliculas_000.Cerramos_Tablas_Ligadas;
begin
    // ********************************************************************************************* //
    // ** ESTE form NO TIENE TABLAS LIGADAS                                                       ** //
    // ********************************************************************************************* //
end;

procedure TForm_peliculas_000.FormCreate(Sender: TObject);
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
    public_Solo_Ver           := false;
    public_Elegimos           := false;

    public_Rgtro_Seleccionado := false;
end;

procedure TForm_peliculas_000.para_Empezar;
begin
    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    if UTI_GEN_Form_Abierto_Ya('DataModule_Pelis') = False then
    begin
        DataModule_Pelis := TDataModule_Pelis.Create(Application);
    end;

    // ********************************************************************************************* //
    // ** Preparamos los diferentes tipos de orden preconfigurados                                ** //
    // ********************************************************************************************* //
    SetLength(private_Order_By, 3);

    private_Order_By[0].Titulo       := rs_para_Empezar_1; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[0].Memo_OrderBy := 'p.titulo ASC';

    private_Order_By[1].Titulo       := rs_para_Empezar_2;
    private_Order_By[1].Memo_OrderBy := 'p.Numero ASC';

    private_Order_By[2].Titulo       := rs_para_Empezar_3;
    private_Order_By[2].Memo_OrderBy := 'p.id ASC';

    Memo_OrderBy.Lines.Text          := private_Order_By[0].Memo_OrderBy;

    UTI_TB_Rellenar_ComboBox_Orden( true,
                                    ComboBox_Filtros,
                                    private_Order_By,
                                    0 );

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

procedure TForm_peliculas_000.SQLQuery_PelisBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Pelis );
end;

procedure TForm_peliculas_000.Editar_Registro;
var var_msg        : TStrings;
    var_formulario : TForm_peliculas_001;
    var_id         : ShortString;
begin
    with SQLQuery_Pelis do
    begin
        if RecordCount > 0 then
        begin
            if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
            begin
                var_id := FieldByName('id').AsString;

                if UTI_RGTRO_isLock( 'peliculas',
                                     var_id,
                                     true ) = true then
                begin
                    Exit;
                end else begin
                    if UTI_RGTRO_Lock( 'peliculas',
                                       var_id ) = true then
                         Edit
                    else Exit;
                end;

                var_formulario := TForm_peliculas_001.Create(nil);
                // Application.CreateForm(tForm_peliculas_001, Form_peliculas_001);

                var_formulario.public_Menu_Worked := public_Menu_Worked;

                if public_Solo_Ver = true then
                begin
                    var_formulario.public_Solo_Ver := true;
                end;

                var_formulario.para_Empezar;
                var_formulario.ShowModal;
                if var_formulario.public_Pulso_Aceptar = true then
                begin
                     if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( SQLQuery_Pelis ) = true then
                     begin
                         FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                         FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                         UTI_RGTRO_Grabar_Antes( 'peliculas',
                                                 SQLQuery_Pelis );
                     end else begin
                         Cancel;
                     end;
                end else begin
                    Cancel;
                end;

                var_formulario.Free;

                UTI_RGTRO_UnLock( 'peliculas',
                                  var_id );
            end;
        end else begin
            var_msg := TStringList.Create;
            var_msg.Add(rs_no_Hay_Rgtros);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;
        end;
    end;
end;

function TForm_peliculas_000.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
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
        var_SQL_ADD.Add( 'p.titulo LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Descripcion.Text) + '%') );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por el medio                                                           ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_medios.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'p.id_medio = ' + Trim(Edit_id_medios.Text) );
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
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Pelis,
                                                            'peliculas',
                                                            'u' ),

                              // Insert_SQL,
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Pelis,
                                                            'peliculas',
                                                            'i' ),

                              // var_ctdad_Rgtros,
                              -1,

                              DataModule_Pelis.SQLTransaction,
                              DataModule_Pelis.SQLConnector,
                              SQLQuery_Pelis,

                              // name_tabla,
                              'p',

                              RadioGroup_Bajas.ItemIndex,

                              // SELECT_SQL,
                              'SELECT p.*,' + ' ' +
                                     'm.descripcion AS OT_descripcion_medio' + ' ' +
                              'FROM peliculas AS p' + ' ' +

                              'LEFT JOIN medio AS m' + ' ' +
                              'ON p.id_medio = m.id' + ' ',

                              // var_SQL_ORDER_BY,

                              Memo_Filtros.Lines,
                              Memo_OrderBy.Lines,
                              var_a_Filtrar,

                              param_Cambiamos_Filtro,
                              false,   // param_ver_SQL_despues_Abrir : Boolean;
                              true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}
    var_a_Filtrar.Free;

    Label_Ctdad_Rgtros.Caption := IntToStr(SQLQuery_Pelis.RecordCount);

    //Filtrar_tablas_ligadas;
    var_SQL_ADD.Free;
end;

procedure TForm_peliculas_000.Filtrar_Principal_Sin_Preguntar;
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

procedure TForm_peliculas_000.Boton_Elegir_id_mediosClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Medios( true, false, 10, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_medios.Text             := Trim(var_Registro.id_1);
        Edit_Descripcion_id_medios.Text := var_Registro.descripcion_1;
    end;
end;

procedure TForm_peliculas_000.ComboBox_FiltrosChange(Sender: TObject);
begin
    Memo_OrderBy.Lines.Clear;
    Memo_OrderBy.Lines.Add( private_Order_By[ComboBox_Filtros.ItemIndex].Memo_OrderBy );
    BitBtn_FiltrarClick(Nil);
end;

procedure TForm_peliculas_000.Edit_Descripcion_id_mediosClick(Sender: TObject);
begin
    Edit_id_medios.Text             := '';
    Edit_Descripcion_id_medios.Text := '';
end;

end.


