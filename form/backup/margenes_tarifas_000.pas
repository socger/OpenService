unit margenes_tarifas_000;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons, ComCtrls, DBGrids, DbCtrls, Grids, utilidades_usuarios, utilidades_bd, utilidades_rgtro,
  utilidades_datos_tablas, utilidades_general;

type

  { Tform_margenes_tarifas_000 }

  Tform_margenes_tarifas_000 = class(TForm)
    BitBtn_Filtrar: TBitBtn;
    BitBtn_Imprimir: TBitBtn;
    BitBtn_SALIR: TBitBtn;
    BitBtn_Seleccionar: TBitBtn;
    BitBtn_Ver_Situacion_Registro: TBitBtn;
    ComboBox_Filtros: TComboBox;
    DataSource_Margenes: TDataSource;
    DBGrid_Principal: TDBGrid;
    DBNavigator1: TDBNavigator;
    Edit_mayor_igual_que: TEdit;
    Edit_menor_igual_que: TEdit;
    Label10: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label_Ctdad_Rgtros: TLabel;
    Label_Fecha2: TLabel;
    Label_Fecha3: TLabel;
    Label_Fecha4: TLabel;
    Memo_Filtros: TMemo;
    Memo_OrderBy: TMemo;
    PageControl_Filtros: TPageControl;
    RadioGroup_Bajas: TRadioGroup;
    SQLQuery_Margenes: TSQLQuery;
    SQLQuery_MargenesChange_Id_User: TLargeintField;
    SQLQuery_MargenesChange_WHEN: TDateTimeField;
    SQLQuery_MargenesDel_Id_User: TLargeintField;
    SQLQuery_MargenesDel_WHEN: TDateTimeField;
    SQLQuery_MargenesDel_WHY: TStringField;
    SQLQuery_Margenesid: TLargeintField;
    SQLQuery_MargenesInsert_Id_User: TLargeintField;
    SQLQuery_MargenesInsert_WHEN: TDateTimeField;
    SQLQuery_Margenesmayor_igual_que: TBCDField;
    SQLQuery_Margenesmenor_igual_que: TBCDField;
    TabSheet_Busqueda_Concreta: TTabSheet;
    TabSheet_Filtros_Generales: TTabSheet;

    procedure ComboBox_FiltrosChange(Sender: TObject);
    procedure Filtrar_Principal_Sin_Preguntar;
    procedure Insertar_Registro;
    procedure Editar_Registro;
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure Refrescar_Registros;
    procedure Seleccionado_Rgtro;
    procedure Presentar_Datos;
    procedure para_Empezar;
    procedure no_Tocar;
    procedure Filtrar_tablas_ligadas;
    procedure Cerramos_Tablas;
    procedure Cerramos_Tablas_Ligadas;
    procedure BitBtn_FiltrarClick(Sender: TObject);
    procedure BitBtn_ImprimirClick(Sender: TObject);
    procedure BitBtn_SALIRClick(Sender: TObject);
    procedure BitBtn_SeleccionarClick(Sender: TObject);
    procedure BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
    procedure DBGrid_PrincipalCellClick(Column: TColumn);
    procedure DBGrid_PrincipalDblClick(Sender: TObject);
    procedure DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RadioGroup_BajasClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SQLQuery_MargenesAfterPost(DataSet: TDataSet);
    procedure SQLQuery_MargenesAfterScroll(DataSet: TDataSet);
    procedure SQLQuery_MargenesBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_MargenesBeforePost(DataSet: TDataSet);
    function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
    function  Existe_el_Margen_Ya( param_id, param_mayor_igual_que, param_menor_igual_que : ShortString ) : Trecord_Existe;

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
  form_margenes_tarifas_000: Tform_margenes_tarifas_000;

implementation

{$R *.lfm}

uses dm_margenes_tarifas, menu, margenes_tarifas_001;

{ Tform_margenes_tarifas_000 }

procedure Tform_margenes_tarifas_000.FormActivate(Sender: TObject);
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

procedure Tform_margenes_tarifas_000.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
    if private_Salir_OK = False then
    begin
        // ***************************************************************************************** //
        // ** Intento BitBtn_SALIR de la aplicación de un modo no permitido.                      ** //
        // ***************************************************************************************** //
        // ** Pero si desde el menu principal está a true la variable public_Salir_Ok, significa  ** //
        // ** que hay que salir si o si pues se pulsó cancelar al preguntar otra vez por la       ** //
        // ** password                                                                            ** //
        // ***************************************************************************************** //
        if form_Menu.public_Salir_OK = False then CloseAction := caNone;
    end else begin
        // ***************************************************************************************** //
        // ** Fue correcto el modo como quiere BitBtn_SALIR de la aplicación                      ** //
        // ***************************************************************************************** //
    end;
end;

procedure Tform_margenes_tarifas_000.FormCreate(Sender: TObject);
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

procedure Tform_margenes_tarifas_000.FormDestroy(Sender: TObject);
begin
    Cerramos_Tablas;
end;

procedure Tform_margenes_tarifas_000.SQLQuery_MargenesBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Margenes );
end;

procedure Tform_margenes_tarifas_000.SQLQuery_MargenesAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'margenes_tarifas',
                       DataModule_Margenes_Tarifas.SQLTransaction,
                       SQLQuery_Margenes,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros;
end;

procedure Tform_margenes_tarifas_000.SQLQuery_MargenesAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure Tform_margenes_tarifas_000.SQLQuery_MargenesBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Margenes );
end;

procedure Tform_margenes_tarifas_000.RadioGroup_BajasClick(Sender: TObject);
begin
    Refrescar_Registros;
end;

function Tform_margenes_tarifas_000.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
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
    // ** Primero buscaremos por >=                                                               ** //
    // ********************************************************************************************* //
    if Trim(Edit_mayor_igual_que.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'mt.mayor_igual_que >= ' + Trim(Edit_mayor_igual_que.Text) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por <=                                                                 ** //
    // ********************************************************************************************* //
    if Trim(Edit_menor_igual_que.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'mt.menor_igual_que <= ' + Trim(Edit_menor_igual_que.Text) );
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
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Margenes,
                                                            'margenes_tarifas',
                                                            'u' ),

                              // Insert_SQL,
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Margenes,
                                                            'margenes_tarifas',
                                                            'i' ),

                              // var_ctdad_Rgtros,
                              -1,

                              DataModule_Margenes_Tarifas.SQLTransaction,
                              DataModule_Margenes_Tarifas.SQLConnector,
                              SQLQuery_Margenes,

                              // name_tabla,
                              'mt',

                              RadioGroup_Bajas.ItemIndex,

                              // SELECT_SQL,
                              'SELECT mt.*' + ' ' + ' ' +
                              'FROM margenes_tarifas AS mt' + ' ',

                              Memo_Filtros.Lines,
                              Memo_OrderBy.Lines,
                              var_a_Filtrar,

                              param_Cambiamos_Filtro,
                              false,   // param_ver_SQL_despues_Abrir : Boolean;
                              true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

    var_a_Filtrar.Free;

    Label_Ctdad_Rgtros.Caption := IntToStr(SQLQuery_Margenes.RecordCount);

    //Filtrar_tablas_ligadas;
    var_SQL_ADD.Free;
end;

procedure Tform_margenes_tarifas_000.BitBtn_FiltrarClick(Sender: TObject);
begin
    if PageControl_Filtros.ActivePage = TabSheet_Busqueda_Concreta then
    begin
        Filtrar_Principal_Sin_Preguntar;
    end else begin
        RadioGroup_Bajas.ItemIndex := Filtrar_Principal( true );
    end;
end;

procedure Tform_margenes_tarifas_000.BitBtn_ImprimirClick(Sender: TObject);
var var_Ficheros     : TStrings;
    var_Ordenado_por : String;
begin
    // ********************************************************************************************* //
    // ** Configuramos el título del listado                                                      ** //
    // ********************************************************************************************* //
    var_Ordenado_por := rs_Filtros_Otros_1 + Trim(ComboBox_Filtros.Text);

    if Trim(Memo_Filtros.Lines.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +  rs_Filtros_Otros_2 + Trim(Memo_Filtros.Lines.Text);
    end;

    if (Trim(Edit_mayor_igual_que.Text) <> '') or
       (Trim(Edit_menor_igual_que.Text) <> '') then
    begin
        var_Ordenado_por := var_Ordenado_por + ', con precio dosto >= ';

        if Trim(Edit_mayor_igual_que.Text) <> '' then
        begin
            var_Ordenado_por := var_Ordenado_por +
                                Trim(Edit_mayor_igual_que.Text);
        end else begin
            var_Ordenado_por := var_Ordenado_por +
                                'Null';
        end;

        var_Ordenado_por := var_Ordenado_por + ' y <= ';

        if Trim(Edit_menor_igual_que.Text) <> '' then
        begin
            var_Ordenado_por := var_Ordenado_por +
                                Trim(Edit_menor_igual_que.Text);
        end else begin
            var_Ordenado_por := var_Ordenado_por +
                                'Null';
        end;
    end;

    // ********************************************************************************************* //
    // ** Configuramos la llamada al generador de informes                                        ** //
    // ********************************************************************************************* //
    var_Ficheros := TStringList.Create;

    UTI_GEN_Informes( var_Ordenado_por,
                      SQLQuery_Margenes,
                      DataSource_Margenes,
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

procedure Tform_margenes_tarifas_000.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_margenes_tarifas_000.BitBtn_SeleccionarClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
end;

procedure Tform_margenes_tarifas_000.BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if SQLQuery_Margenes.RecordCount > 0 then UTI_RGTRO_Ver_Estado_Registro( 'margenes_tarifas',
                                                                                SQLQuery_Margenes,
                                                                                DataSource_Margenes,
                                                                                DBGrid_Principal );
    end;
end;

procedure Tform_margenes_tarifas_000.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure Tform_margenes_tarifas_000.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    If public_Elegimos then
         Seleccionado_Rgtro
    else Editar_Registro;
end;

procedure Tform_margenes_tarifas_000.DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect;
                                                           DataCol: Integer; Column: TColumn;
                                                           State: TGridDrawState);
begin
    UTI_GEN_Dibujar_Grid( Sender, SQLQuery_Margenes, Rect, DataCol, Column, State );
end;

procedure Tform_margenes_tarifas_000.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then
    begin
        If public_Elegimos then
             Seleccionado_Rgtro
        else Editar_Registro;
    end;
end;

procedure Tform_margenes_tarifas_000.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

procedure Tform_margenes_tarifas_000.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_Margenes_Tarifas.SQLConnector,
                      DataModule_Margenes_Tarifas.SQLTransaction,
                      SQLQuery_Margenes ) = false then UTI_GEN_Salir;

    DataModule_Margenes_Tarifas.Free;
end;

procedure Tform_margenes_tarifas_000.Cerramos_Tablas_Ligadas;
begin
    { ESTE form NO TIENE TABLAS LIGADAS

        if UTI_TB_Cerrar( DataModule_del_form_000.SQLConnector_de_la_tabla,
                          DataModule_Users.SQLTransaction_de_la_tabla,
                          SQLQuery_la_tabla ) = false then UTI_GEN_Salir;
    }
end;

procedure Tform_margenes_tarifas_000.Filtrar_tablas_ligadas;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
begin
    if SQLQuery_Margenes.RecordCount = 0 then Exit;

    if SQLQuery_Margenes.State = dsInsert then
    begin
        Cerramos_Tablas_Ligadas;
        Exit;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    // ********************************************************************************************* //
    // ** No hay tablas ligadas                                                                   ** //
    // ********************************************************************************************* //

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;
end;

procedure Tform_margenes_tarifas_000.no_Tocar;
begin
    BitBtn_Imprimir.Enabled := False;
end;

procedure Tform_margenes_tarifas_000.Seleccionado_Rgtro;
begin
    private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    public_Rgtro_Seleccionado := true;
    Close;
end;

procedure Tform_margenes_tarifas_000.Presentar_Datos;
begin
    // ********************************************************************************************* //
    // ** No tenemos nada que presentar                                                           ** //
    // ********************************************************************************************* //
end;

procedure Tform_margenes_tarifas_000.para_Empezar;
begin
    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    if UTI_GEN_Form_Abierto_Ya('DataModule_Margenes_Tarifas') = False then
    begin
        DataModule_Margenes_Tarifas := TDataModule_Margenes_Tarifas.Create(Application);
    end;

    // ********************************************************************************************* //
    // ** Preparamos los diferentes tipos de orden preconfigurados                                ** //
    // ********************************************************************************************* //
    SetLength(private_Order_By, 2);

    private_Order_By[0].Titulo       := 'Por los márgenes'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[0].Memo_OrderBy := 'mt.mayor_igual_que ASC, mt.menor_igual_que ASC';

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

procedure Tform_margenes_tarifas_000.Refrescar_Registros;
var var_mayor_igual_que : Extended;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_mayor_igual_que := 0;
    if SQLQuery_Margenes.RecordCount > 0 then
    begin
        var_mayor_igual_que := SQLQuery_Margenes.FieldByName('mayor_igual_que').Value;
    end;

    Filtrar_Principal_Sin_Preguntar;

    SQLQuery_Margenes.Locate('mayor_igual_que', var_mayor_igual_que, []);
end;

function Tform_margenes_tarifas_000.Existe_el_Margen_Ya( param_id,
                                                         param_mayor_igual_que,
                                                         param_menor_igual_que : ShortString ) : Trecord_Existe;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
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
                                  var_SQLConnector ) = False then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Creamos la SQL Según el motor de BD                                                 ** //
        // ***************************************************************************************** //
        var_SQL := TStringList.Create;

        var_SQL.Add('SELECT mt.*' );
        var_SQL.Add(  'FROM margenes_tarifas AS mt' );
        var_SQL.Add(' WHERE mt.mayor_igual_que = ' + Trim(param_mayor_igual_que) );
        var_SQL.Add(' AND mt.menor_igual_que = ' + Trim(param_menor_igual_que) );

        if Trim(param_id) <> '' then
        begin
             var_SQL.Add(  ' AND NOT mt.id = ' + Trim(param_id) );
        end;

        var_SQL.Add(' ORDER BY mt.mayor_igual_que ASC, mt.menor_igual_que ASC' );

        // ***************************************************************************************** //
        // ** Abrimos la tabla                                                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery      := TSQLQuery.Create(nil);
        var_SQLQuery.Name := 'SQLQuery_Existe_el_Margen_Ya';

        if UTI_TB_Query_Open( '', '', '',
                              var_SQLConnector,
                              var_SQLQuery,
                              -1, // asi me trae todos los registros de golpe
                              var_SQL.Text ) = False then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** TRABAJAMOS CON LOS REGISTROS DEVUELTOS                                              ** //
        // ***************************************************************************************** //
        // ** Si el módulo no se creó, no se permite entrar en él ... Result := False             ** //
        // ***************************************************************************************** //
        Result.Fallo_en_Conexion_BD := false;
        Result.Existe               := false;
        Result.deBaja               := 'N';

        if var_SQLQuery.RecordCount > 0 then
        begin
            Result.Existe := true;
            if not var_SQLQuery.FieldByName('Del_WHEN').IsNull then Result.deBaja := 'S';
        end;

        // ***************************************************************************************** //
        // ** Cerramos la tabla                                                                   ** //
        // ***************************************************************************************** //
        if UTI_TB_Cerrar( var_SQLConnector,
                          var_SQLTransaction,
                          var_SQLQuery ) = false then UTI_GEN_Salir;

        var_SQLQuery.Free;

        var_SQL.Free;

        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    except
         on error : Exception do
         begin
             UTI_GEN_Error_Log( 'Error al comprobar si el margen de tarifa existe ya.' +
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

procedure Tform_margenes_tarifas_000.Insertar_Registro;
var var_msg             : TStrings;
    var_Form            : Tform_margenes_tarifas_001;
    var_Fecha_Hora      : ShortString;
    var_record_Existe   : Trecord_Existe;
    var_mayor_igual_que : String;
    var_menor_igual_que : String;
begin
    with SQLQuery_Margenes do
    begin
        var_msg := TStringList.Create;

        if UTI_USR_Permiso_SN(public_Menu_Worked, 'A', True) = True then
        begin
            if public_Solo_Ver = True then
            begin
                var_msg.Add(rs_Solo_Visualizar);
                UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            end else begin
                Insert ;

                var_Form := Tform_margenes_tarifas_001.Create(nil);

                var_Form.para_Empezar;

                var_Form.ShowModal;

                if var_Form.public_Pulso_Aceptar = true then
                begin
                    // ***************************************************************************** //
                    // ** Comprobamos si existe ya                                                ** //
                    // ***************************************************************************** //
                    var_mayor_igual_que := 'NULL';
                    if not FieldByName('mayor_igual_que').isNull then
                    begin
                        var_mayor_igual_que := FieldByName('mayor_igual_que').asString;
                    end;

                    var_menor_igual_que := 'NULL';
                    if not FieldByName('menor_igual_que').isNull then
                    begin
                        var_menor_igual_que := FieldByName('mayor_igual_que').asString;
                    end;

                    var_record_Existe := Existe_el_Margen_Ya( '',
                                                              var_mayor_igual_que,
                                                              var_menor_igual_que );

                    if var_record_Existe.Fallo_en_Conexion_BD = true then
                    begin
                        var_Form.Free;
                        Cancel;
                    end else begin
                        if var_record_Existe.Existe = false then
                        begin
                            // ********************************************************************* //
                            // ** No existe                                                       ** //
                            // ********************************************************************* //
                            var_Form.Free;

                            var_Fecha_Hora                      := DateTimeToStr(UTI_CN_Fecha_Hora);
                            FieldByName('Insert_WHEN').AsString := var_Fecha_Hora;
                            FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                            UTI_RGTRO_Grabar_Antes( 'margenes_tarifas', SQLQuery_Margenes );
                        end else begin
                            // ********************************************************************* //
                            // ** Ya existe                                                       ** //
                            // ********************************************************************* //
                            var_Form.Free;
                            Cancel;
                            var_msg.Clear;
                            var_msg.Add( 'Margen de tarifa repetido.');

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

procedure Tform_margenes_tarifas_000.DBNavigator1BeforeAction( Sender: TObject;
                                                               Button: TDBNavButtonType );
var var_id          : ShortString;
    var_dar_de_Baja : Boolean;
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
                UTI_RGTRO_Borrar( 'margenes_tarifas',
                                  SQLQuery_Margenes,
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

procedure Tform_margenes_tarifas_000.Editar_Registro;
var var_msg             : TStrings;
    var_Form            : Tform_margenes_tarifas_001;
    var_record_Existe   : Trecord_Existe;
    var_id              : ShortString;
    var_mayor_igual_que : String;
    var_menor_igual_que : String;
begin
    with SQLQuery_Margenes do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
        begin
            var_id := FieldByName('id').AsString;

            if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
            begin
                if UTI_RGTRO_isLock( 'margenes_tarifas',
                                     FieldByName('id').AsString,
                                     true ) = true then
                begin
                    Exit;
                end else begin
                    if UTI_RGTRO_Lock( 'margenes_tarifas',
                                       FieldByName('id').AsString ) = true then
                         Edit
                    else Exit;
                end;

                var_Form := Tform_margenes_tarifas_001.Create(nil);

                var_Form.public_Menu_Worked := public_Menu_Worked;

                if public_Solo_Ver = true then
                begin
                    var_Form.public_Solo_Ver := true;
                end;

                var_Form.para_Empezar;

                var_Form.ShowModal;

                if var_Form.public_Pulso_Aceptar = true then
                begin
                    // ***************************************************************************** //
                    // ** Comprobamos si existe ya                                                ** //
                    // ***************************************************************************** //
                    var_mayor_igual_que := 'NULL';
                    if not FieldByName('mayor_igual_que').isNull then
                    begin
                        var_mayor_igual_que := FieldByName('mayor_igual_que').asString;
                    end;

                    var_menor_igual_que := 'NULL';
                    if not FieldByName('menor_igual_que').isNull then
                    begin
                        var_menor_igual_que := FieldByName('mayor_igual_que').asString;
                    end;

                    var_record_Existe := Existe_el_Margen_Ya( FieldByName('id').AsString,
                                                              var_mayor_igual_que,
                                                              var_menor_igual_que );

                    if var_record_Existe.Fallo_en_Conexion_BD = true then
                    begin
                        var_Form.Free;
                        Cancel;
                    end else begin
                        if var_record_Existe.Existe = false then
                        begin
                            if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( SQLQuery_Margenes ) = true then
                            begin
                                FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                                FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                                UTI_RGTRO_Grabar_Antes( 'margenes_tarifas', SQLQuery_Margenes );
                            end else begin
                                Cancel;
                            end;

                            var_Form.Free;
                        end else begin
                            var_Form.Free;
                            Cancel;
                            var_msg.Clear;
                            var_msg.Add( 'Margen de tarifa repetido.');

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

                UTI_RGTRO_UnLock( 'margenes_tarifas', var_id );
            end;
        end else begin
            var_msg.Add(rs_no_Hay_Rgtros);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        end;
    end;
    var_msg.Free;
end;

procedure Tform_margenes_tarifas_000.Filtrar_Principal_Sin_Preguntar;
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

procedure Tform_margenes_tarifas_000.ComboBox_FiltrosChange(Sender: TObject);
begin
    Memo_OrderBy.Lines.Clear;
    Memo_OrderBy.Lines.Add( private_Order_By[ComboBox_Filtros.ItemIndex].Memo_OrderBy );
    BitBtn_FiltrarClick(Nil);
end;

end.

