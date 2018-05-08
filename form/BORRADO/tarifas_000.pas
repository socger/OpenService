unit tarifas_000;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs, Buttons, StdCtrls,
    utilidades_usuarios, utilidades_rgtro, utilidades_general, utilidades_bd, DBGrids, DbCtrls,
    utilidades_datos_tablas, ExtCtrls, Grids, ComCtrls;

type

    { Tform_tarifas_000 }

    Tform_tarifas_000 = class(TForm)
      BitBtn_Filtrar: TBitBtn;
        BitBtn_Imprimir: TBitBtn;
        BitBtn_SALIR: TBitBtn;
        BitBtn_Seleccionar: TBitBtn;
        BitBtn_Ver_Situacion_Registro: TBitBtn;
        ComboBox_Filtros: TComboBox;
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
        SQLQuery_Tarifas: TSQLQuery;
        SQLQuery_TarifasChange_Id_User: TLargeintField;
        SQLQuery_TarifasChange_WHEN: TDateTimeField;
        SQLQuery_TarifasDel_Id_User: TLargeintField;
        SQLQuery_TarifasDel_WHEN: TDateTimeField;
        SQLQuery_TarifasDel_WHY: TStringField;
        SQLQuery_Tarifasdescripcion: TStringField;
        SQLQuery_Tarifasid: TLargeintField;
        SQLQuery_TarifasInsert_Id_User: TLargeintField;
        SQLQuery_TarifasInsert_WHEN: TDateTimeField;
        TabSheet_Busqueda_Concreta: TTabSheet;
        TabSheet_Filtros_Generales: TTabSheet;

        procedure ComboBox_FiltrosChange(Sender: TObject);
        procedure Filtrar_Principal_Sin_Preguntar;
        function  Borrar_Tarifa_a_articulos_familias( param_dar_de_Baja : Boolean; param_id_tarifas, param_Fecha_Hora, param_usuario : ShortString ) : Boolean;
        function  Borrar_Tarifa_a_articulos( param_dar_de_Baja : Boolean; param_id_tarifas, param_Fecha_Hora, param_usuario : ShortString ) : Boolean;
        function  Borrar_Tarifa_a_articulos_proporciones( param_dar_de_Baja : Boolean; param_id_tarifas, param_Fecha_Hora, param_usuario : ShortString ) : Boolean;
        function  Crear_Tarifa_a_articulos_familias( param_id_tarifas, param_Fecha_Hora, param_usuario : ShortString ) : Boolean;
        function  Crear_Tarifa_a_articulos( param_id_tarifas, param_Fecha_Hora, param_usuario : ShortString ) : Boolean;
        function  Crear_Tarifa_a_articulos_proporciones( param_id_tarifas, param_Fecha_Hora, param_usuario : ShortString ) : Boolean;
        procedure Cauto_articulos_familias_tarifa_Y_Guardo_en_Historico_sus_Cambios( param_id_tarifas : ShortString );
        procedure Cauto_articulos_tarifa_Y_Guardo_en_Historico_sus_Cambios( param_id_tarifas : ShortString );
        procedure Cauto_articulos_proporciones_tarifa_Y_Guardo_en_Historico_sus_Cambios( param_id_tarifas : ShortString );
        procedure Busco_Tarifa_Creada_y_Creo_Tarifa_a_otras_tablas( param_Fecha_Hora, param_descripcion : ShortString );
        function  Existe_la_Tarifa_Ya( param_id, param_descripcion : ShortString ) : Trecord_Existe;
        procedure Cerramos_Tablas_Ligadas;
        procedure FormCreate(Sender: TObject);
        procedure Presentar_Datos;
        procedure Seleccionado_Rgtro;
        procedure Insertar_Registro;
        procedure Editar_Registro;
        procedure no_Tocar;
        procedure Refrescar_Registros;
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
        procedure DBGrid_PrincipalTitleClick(Column: TColumn);
        procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
        function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
        procedure Filtrar_tablas_ligadas;
        procedure Cerramos_Tablas;
        procedure FormActivate(Sender: TObject);
        procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
        procedure para_Empezar;
        procedure FormDestroy(Sender: TObject);
        procedure RadioGroup_BajasClick(Sender: TObject);
        procedure SQLQuery_TarifasAfterPost(DataSet: TDataSet);
        procedure SQLQuery_TarifasAfterScroll(DataSet: TDataSet);
        procedure SQLQuery_TarifasBeforeEdit(DataSet: TDataSet);
        procedure SQLQuery_TarifasBeforePost(DataSet: TDataSet);

    private
        { private declarations }
        private_Salir_OK    : Boolean;
        private_Last_Column : TColumn;
        private_Order_By    : array of TOrder_By;
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
        // ** password                                                                            ** //
        // ***************************************************************************************** //
        if form_Menu.public_Salir_OK = False then CloseAction := caNone;
    end else begin
        // ***************************************************************************************** //
        // ** Fue correcto el modo como quiere BitBtn_SALIR de la aplicación                      ** //
        // ***************************************************************************************** //
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
    DBGrid_Principal.TitleImageList := Form_Menu.ImageList_Grid_Sort;
    public_Solo_Ver                 := false;
    public_Elegimos                 := false;

    public_Rgtro_Seleccionado       := false;
end;

procedure Tform_tarifas_000.FormDestroy(Sender: TObject);
begin
    Cerramos_Tablas;
end;

procedure Tform_tarifas_000.RadioGroup_BajasClick(Sender: TObject);
begin
    Refrescar_Registros;
end;

procedure Tform_tarifas_000.SQLQuery_TarifasAfterPost(DataSet: TDataSet);
begin
    UTI_RGTRO_Grabar( 'tarifas', DataModule_Tarifas.SQLTransaction, SQLQuery_Tarifas );
    Refrescar_Registros;
end;

procedure Tform_tarifas_000.SQLQuery_TarifasAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure Tform_tarifas_000.SQLQuery_TarifasBeforePost(DataSet: TDataSet);
begin
    UTI_RGTRO_param_assign_value( SQLQuery_Tarifas );
end;

function Tform_tarifas_000.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
var var_Registro_CRUD : TRegistro_CRUD;
    var_ctdad_Rgtros  : Integer;
    var_a_Filtrar     : TStrings;
begin
    var_a_Filtrar := TStringList.Create;
    var_a_Filtrar.Clear;

    var_Registro_CRUD := UTI_DATOS_TABLA_tarifas_CRUD;
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
                                't.descripcion LIKE ' +
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
                              DataModule_Tarifas.SQLTransaction,
                              DataModule_Tarifas.SQLConnector,
                              SQLQuery_Tarifas,

                              var_Registro_CRUD.name_tabla,
                              RadioGroup_Bajas.ItemIndex,

                              var_Registro_CRUD.SELECT_SQL,

                              Memo_Filtros.Lines,
                              Memo_OrderBy.Lines,
                              var_a_Filtrar.Text,

                              param_Cambiamos_Filtro );

    UTI_GEN_Borrar_Imagen_Orden_Grid(private_Last_Column);

    var_a_Filtrar.Free;

    Label_Ctdad_Rgtros.Caption := IntToStr(SQLQuery_Tarifas.RecordCount);

    //Filtrar_tablas_ligadas;
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

    var_Ficheros.Add( 'listado_tarifas.lrf' );

    UTI_GEN_Informes( var_Ordenado_por,
                      SQLQuery_Tarifas,
                      DataSource_Tarifas,
                      Nil,
                      Nil,
                      public_Menu_Worked,
                      public_Solo_Ver,
                      '',
                      '',
                      var_Ficheros );

    var_Ficheros.Free;
end;

procedure Tform_tarifas_000.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_tarifas_000.BitBtn_SeleccionarClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
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

procedure Tform_tarifas_000.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure Tform_tarifas_000.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    If public_Elegimos then
         Seleccionado_Rgtro
    else Editar_Registro;
end;

procedure Tform_tarifas_000.DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect;
                                                           DataCol: Integer; Column: TColumn;
                                                           State: TGridDrawState);
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

procedure Tform_tarifas_000.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

procedure Tform_tarifas_000.DBGrid_PrincipalTitleClick(Column: TColumn);
begin
    private_Last_Column := UTI_GEN_Ordenar_dbGrid(private_Last_Column, Column, SQLQuery_Tarifas);
end;

procedure Tform_tarifas_000.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_Tarifas.SQLConnector,
                      DataModule_Tarifas.SQLTransaction,
                      SQLQuery_Tarifas ) = false then UTI_GEN_Salir;

    DataModule_Tarifas.Free;
end;

procedure Tform_tarifas_000.Cerramos_Tablas_Ligadas;
begin
{ ESTE form NO TIENE TABLAS LIGADAS

    if UTI_TB_Cerrar( DataModule_del_form_000.SQLConnector_de_la_tabla,
                      DataModule_Users.SQLTransaction_de_la_tabla,
                      SQLQuery_la_tabla ) = false then UTI_GEN_Salir;
}
end;

procedure Tform_tarifas_000.Filtrar_tablas_ligadas;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
begin
    if SQLQuery_Tarifas.RecordCount = 0 then Exit;

    if SQLQuery_Tarifas.State = dsInsert then
    begin
        Cerramos_Tablas_Ligadas;
        Exit;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;
end;

procedure Tform_tarifas_000.no_Tocar;
begin
    BitBtn_Imprimir.Enabled := False;
end;

procedure Tform_tarifas_000.Seleccionado_Rgtro;
begin
    private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    public_Rgtro_Seleccionado := true;
    Close;
end;

procedure Tform_tarifas_000.Presentar_Datos;
begin
     /// guardar por lo que pueda pasar
end;

procedure Tform_tarifas_000.para_Empezar;
begin
  { ****************************************************************************
    Solo para formularios que traten con datos
    **************************************************************************** }
    if UTI_GEN_Form_Abierto_Ya('DataModule_Tarifas') = False then
    begin
        DataModule_Tarifas := TDataModule_Tarifas.Create(Application);
    end;

  { ****************************************************************************
    Preparamos los diferentes tipos de orden preconfigurados
    **************************************************************************** }
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

function Tform_tarifas_000.Existe_la_Tarifa_Ya( param_id,
                                                param_descripcion : ShortString ) : Trecord_Existe;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
    try
      { ****************************************************************************
        Creamos la Transaccion y la conexión con el motor BD, y la abrimos
        **************************************************************************** }
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Abrir( var_SQLTransaction,
                         var_SQLConnector ) = False then UTI_GEN_Salir;

      { ****************************************************************************
        Creamos la SQL Según el motor de BD
        **************************************************************************** }
        var_SQL := TStringList.Create;

        var_SQL.Add('SELECT a.*' );
        var_SQL.Add(  'FROM tarifas AS a' );
        var_SQL.Add(' WHERE a.descripcion LIKE ' + UTI_GEN_Comillas('%' + Trim(param_descripcion) + '%') );

        if Trim(param_id) <> '' then
        begin
             var_SQL.Add(  ' AND NOT a.id = ' + Trim(param_id) );
        end;

        var_SQL.Add(' ORDER BY a.descripcion ASC' );

      { ****************************************************************************
        Abrimos la tabla
        **************************************************************************** }
        var_SQLQuery      := TSQLQuery.Create(nil);
        var_SQLQuery.Name := 'SQLQuery_Existe_la_Tarifa_Ya';

        if UTI_TB_Abrir( '', '', '',
                         var_SQLConnector,
                         var_SQLTransaction,
                         var_SQLQuery,
                         -1, // asi me trae todos los registros de golpe
                         var_SQL.Text ) = False then UTI_GEN_Salir;

      { ****************************************************************************
        TRABAJAMOS CON LOS REGISTROS DEVUELTOS
        ****************************************************************************
        Si el módulo no se creó, no se permite entrar en él ... Result := False
        **************************************************************************** }
        Result.Fallo_en_Conexion_BD := false;
        Result.Existe               := false;
        Result.deBaja               := 'N';

        if var_SQLQuery.RecordCount > 0 then
        begin
            Result.Existe := true;
            if not var_SQLQuery.FieldByName('Del_WHEN').IsNull then Result.deBaja := 'S';
        end;

      { ****************************************************************************
        Cerramos la tabla
        **************************************************************************** }
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
             UTI_GEN_Error_Log( 'Error al comprobar si la tarifa existe ya.' +
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

function Tform_tarifas_000.Crear_Tarifa_a_articulos_familias( param_id_tarifas,
                                                              param_Fecha_Hora,
                                                              param_usuario : ShortString ) : Boolean;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
    Result := true;

    Try
      { ****************************************************************************
        Creamos la Transaccion y la conexión con el motor BD, y la abrimos
        **************************************************************************** }
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Abrir( var_SQLTransaction,
                         var_SQLConnector ) = False then UTI_GEN_Salir;

      { ****************************************************************************
        Creamos la SQL Según el motor de BD
        **************************************************************************** }
        var_SQL := TStringList.Create;

        // ***************************************************************************************** //
        // ** PRIMERO INSERTAMOS LAS TARIFAS                                                      ** //
        // ***************************************************************************************** //
        var_SQL.Add( 'INSERT INTO articulos_familias_tarifas' );
        var_SQL.Add(        '( id_articulos_familias,' );
        var_SQL.Add(         ' id_tarifas,' );
        var_SQL.Add(         ' Descuento,' );
        var_SQL.Add(         ' Beneficio,' );

        var_SQL.Add(         ' Insert_WHEN,' );
        var_SQL.Add(         ' Insert_Id_User )' );

        var_SQL.Add( 'SELECT id,' );
        var_SQL.Add(         Trim(param_id_tarifas) + ',' );
        var_SQL.Add(         '0,' );
        var_SQL.Add(         '0,' );

        var_SQL.Add(         UTI_GEN_Comillas(param_Fecha_Hora) + ',' );
        var_SQL.Add(         Trim(param_usuario) );

        var_SQL.Add(   'FROM articulos_familias' );

        // esta linea siguiente la quito para que se inserte también en las dadas de baja
        // var_SQL.Add(  'WHERE Del_WHEN IS NULL' );

      { ****************************************************************************
        Abrimos la tabla
        **************************************************************************** }
        var_SQLQuery          := TSQLQuery.Create(nil);

        var_SQLQuery.Database := var_SQLConnector;
        var_SQLQuery.SQL.Text := var_SQL.Text;

        var_SQLQuery.Name     := 'SQLQuery_Crear_Tarifas_a_articulos_familias';

        var_SQLQuery.ExecSQL;
        var_SQLTransaction.Commit;


      { ****************************************************************************
        Destruimos la tabla y conexiones
        **************************************************************************** }
        var_SQLQuery.Free;
        var_SQL.Free;

      { ****************************************************************************
        Cerramos La transacción y la conexión con la BD
        **************************************************************************** }
        if UTI_CN_Cerrar( var_SQLTransaction,
                          var_SQLConnector ) = False then UTI_GEN_Salir;

        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    Except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( 'Error al CREAR en cada familia de artículos la tarifa ' +
                               Trim(param_id_tarifas) + '. La tabla ha sido ' + var_SQLQuery.Name +
                               ' desde el módulo ' + Screen.ActiveForm.Name,
                               error );
            try
                var_SQL.Free;
                var_SQLTransaction.Free;
                var_SQLConnector.Free;
                var_SQLQuery.Free;
            except
            end;

            Result := false
        end;
    end;
end;

procedure Tform_tarifas_000.Insertar_Registro;
var var_msg           : TStrings;
    var_Form          : Tform_tarifas_001;
    var_Fecha_Hora    : ShortString;
    var_descripcion   : ShortString;
    var_record_Existe : Trecord_Existe;
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
                end
            else
                begin
                    Insert ;

                    var_Form := Tform_tarifas_001.Create(nil);

                    var_Form.para_Empezar;

                    var_Form.ShowModal;

                    if var_Form.public_Pulso_Aceptar = true then
                        begin
                            var_record_Existe := Existe_la_Tarifa_Ya( '',
                                                                      FieldByName('descripcion').AsString );

                            if var_record_Existe.Fallo_en_Conexion_BD = true then
                                begin
                                    var_Form.Free;
                                    Cancel;
                                end
                            else
                                begin
                                    if var_record_Existe.Existe = false then
                                        begin
                                            var_Form.Free;

                                            var_descripcion                     := FieldByName('descripcion').AsString;

                                            var_Fecha_Hora                      := DateTimeToStr(UTI_CN_Fecha_Hora);
                                            FieldByName('Insert_WHEN').AsString := var_Fecha_Hora;
                                            FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                                            UTI_RGTRO_Grabar_Antes( 'tarifas',
                                                                    SQLQuery_Tarifas );

                                            // ***************************************************** //
                                            // ** El after post de la tabla ya me hace un .locate,** //
                                            // ** pero puede que no lo encuentre por culpa de los ** //
                                            // ** filtros, así paso a buscar el registro creado y ** //
                                            // ** creo esta tarifa nueva a todas las familias de  ** //
                                            // ** artículos ya creadas                            ** //
                                            // ***************************************************** //
                                            Busco_Tarifa_Creada_y_Creo_Tarifa_a_otras_tablas( var_Fecha_Hora,
                                                                                              var_descripcion );
                                        end
                                    else
                                        begin
                                            var_Form.Free;
                                            Cancel;
                                            var_msg.Clear;
                                            var_msg.Add( 'Tarifa repetida.');

                                            if UpperCase(var_record_Existe.deBaja) = 'S' then
                                            begin
                                                var_msg.Add(rs_Rgtro_Borrado);
                                            end;

                                            UTI_GEN_Aviso(true, var_msg, rs_Ya_Existe, True, False);
                                        end;
                                end;
                        end
                    else
                        begin
                            var_Form.Free;
                            Cancel;
                        end;
                end;
        end;

        var_msg.Free;
    end;
end;

procedure Tform_tarifas_000.Busco_Tarifa_Creada_y_Creo_Tarifa_a_otras_tablas( param_Fecha_Hora,
                                                                              param_descripcion : ShortString );
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
    var_msg            : TStrings;
begin
    try
      { ****************************************************************************
        Creamos la Transaccion y la conexión con el motor BD, y la abrimos
        **************************************************************************** }
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Abrir( var_SQLTransaction,
                         var_SQLConnector ) = False then UTI_GEN_Salir;

      { ****************************************************************************
        Creamos la SQL Según el motor de BD
        **************************************************************************** }
        var_SQL := TStringList.Create;

        var_SQL.Add('SELECT a.*' );
        var_SQL.Add(  'FROM tarifas AS a' );
        var_SQL.Add(' WHERE a.descripcion LIKE ' + UTI_GEN_Comillas('%' + Trim(param_descripcion) + '%') );

        var_SQL.Add(' ORDER BY a.descripcion ASC' );

      { ****************************************************************************
        Abrimos la tabla
        **************************************************************************** }
        var_SQLQuery      := TSQLQuery.Create(nil);
        var_SQLQuery.Name := 'SQLQuery_Busco_Tarifa_Creada_y_Creo_Tarifa_a_otras_tablas';

        if UTI_TB_Abrir( '', '', '',
                         var_SQLConnector,
                         var_SQLTransaction,
                         var_SQLQuery,
                         -1, // asi me trae todos los registros de golpe
                         var_SQL.Text ) = False then UTI_GEN_Salir;

      { ****************************************************************************
        TRABAJAMOS CON LOS REGISTROS DEVUELTOS
        **************************************************************************** }
        if var_SQLQuery.RecordCount > 0 then
            begin
                 if Crear_Tarifa_a_articulos_familias( var_SQLQuery.FieldByName('id').AsString,
                                                       UTI_GEN_Format_Fecha_Hora(StrToDateTime(param_Fecha_Hora), True),
                                                       InttoStr(Form_Menu.public_User) ) then
                 begin
                     // **************************************************************************** //
                     // ** TENGO QUE CREAR LOS INSERT EN EL HISTORICO DE CADA REGISTRO            ** //
                     // **************************************************************************** //
                     Cauto_articulos_familias_tarifa_Y_Guardo_en_Historico_sus_Cambios( var_SQLQuery.FieldByName('id').AsString );
                 end;

                 if Crear_Tarifa_a_articulos( var_SQLQuery.FieldByName('id').AsString,
                                              UTI_GEN_Format_Fecha_Hora(StrToDateTime(param_Fecha_Hora), True),
                                              InttoStr(Form_Menu.public_User) ) then
                 begin
                     // **************************************************************************** //
                     // ** TENGO QUE CREAR LOS INSERT EN EL HISTORICO DE CADA REGISTRO            ** //
                     // **************************************************************************** //
                     Cauto_articulos_tarifa_Y_Guardo_en_Historico_sus_Cambios( var_SQLQuery.FieldByName('id').AsString );
                 end;

                 if Crear_Tarifa_a_articulos_proporciones( var_SQLQuery.FieldByName('id').AsString,
                                                           UTI_GEN_Format_Fecha_Hora(StrToDateTime(param_Fecha_Hora), true),
                                                           InttoStr(Form_Menu.public_User) ) then
                 begin
                     // **************************************************************************** //
                     // ** TENGO QUE CREAR LOS INSERT EN EL HISTORICO DE CADA REGISTRO            ** //
                     // **************************************************************************** //
                     Cauto_articulos_proporciones_tarifa_Y_Guardo_en_Historico_sus_Cambios( var_SQLQuery.FieldByName('id').AsString );
                 end;
            end
        else
            begin
                var_msg := TStringList.Create;
                var_msg.Add( 'No encontré la tarifa recien creada, por lo que no se creó esta' +
                             ' tarifa a todas las familias de artículos ya creadas.' );
                UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
                var_msg.Free;
            end;

      { ****************************************************************************
        Cerramos la tabla
        **************************************************************************** }
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
             UTI_GEN_Error_Log( 'Error al comprobar si la tarifa existe ya.' +
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
         end;
    end;
end;

function Tform_tarifas_000.Crear_Tarifa_a_articulos( param_id_tarifas,
                                                     param_Fecha_Hora,
                                                     param_usuario : ShortString ) : Boolean;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
    Result := true;

    Try
      { ****************************************************************************
        Creamos la Transaccion y la conexión con el motor BD, y la abrimos
        **************************************************************************** }
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Abrir( var_SQLTransaction,
                         var_SQLConnector ) = False then UTI_GEN_Salir;

      { ****************************************************************************
        Creamos la SQL Según el motor de BD
        **************************************************************************** }
        var_SQL := TStringList.Create;

        // ***************************************************************************************** //
        // ** PRIMERO INSERTAMOS LAS TARIFAS                                                      ** //
        // ***************************************************************************************** //
        var_SQL.Add( 'INSERT INTO articulos_tarifas' );
        var_SQL.Add(        '( id_articulos,' );
        var_SQL.Add(         ' id_tarifas,' );

        var_SQL.Add(         ' Importe_Neto,' );
        var_SQL.Add(         ' Importe_Impuestos_Incluidos,' );
        var_SQL.Add(         ' Descuento,' );
        var_SQL.Add(         ' Beneficio,' );

        var_SQL.Add(         ' Insert_WHEN,' );
        var_SQL.Add(         ' Insert_Id_User )' );

        var_SQL.Add( 'SELECT id,' );
        var_SQL.Add(         Trim(param_id_tarifas) + ',' );

        var_SQL.Add(         '0,' );
        var_SQL.Add(         '0,' );
        var_SQL.Add(         '0,' );
        var_SQL.Add(         '0,' );

        var_SQL.Add(         UTI_GEN_Comillas(param_Fecha_Hora) + ',' );
        var_SQL.Add(         Trim(param_usuario) );

        var_SQL.Add(   'FROM articulos' );

        // esta linea siguiente la quito para que se inserte también en las dadas de baja
        // var_SQL.Add(  'WHERE Del_WHEN IS NULL' );

      { ****************************************************************************
        Abrimos la tabla
        **************************************************************************** }
        var_SQLQuery          := TSQLQuery.Create(nil);

        var_SQLQuery.Database := var_SQLConnector;
        var_SQLQuery.SQL.Text := var_SQL.Text;

        var_SQLQuery.Name     := 'SQLQuery_Crear_Tarifa_a_articulos';

        var_SQLQuery.ExecSQL;
        var_SQLTransaction.Commit;


      { ****************************************************************************
        Destruimos la tabla y conexiones
        **************************************************************************** }
        var_SQLQuery.Free;
        var_SQL.Free;

      { ****************************************************************************
        Cerramos La transacción y la conexión con la BD
        **************************************************************************** }
        if UTI_CN_Cerrar( var_SQLTransaction,
                          var_SQLConnector ) = False then UTI_GEN_Salir;

        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    Except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( 'Error al CREAR en cada artículo la tarifa ' + Trim(param_id_tarifas) +
                               '. La tabla ha sido ' + var_SQLQuery.Name + ' desde el módulo ' +
                               Screen.ActiveForm.Name,
                               error );
            try
                var_SQL.Free;
                var_SQLTransaction.Free;
                var_SQLConnector.Free;
                var_SQLQuery.Free;
            except
            end;

            Result := false
        end;
    end;
end;

function Tform_tarifas_000.Crear_Tarifa_a_articulos_proporciones( param_id_tarifas,
                                                                  param_Fecha_Hora,
                                                                  param_usuario : ShortString ) : Boolean;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
    Result := true;

    Try
      { ****************************************************************************
        Creamos la Transaccion y la conexión con el motor BD, y la abrimos
        **************************************************************************** }
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Abrir( var_SQLTransaction,
                         var_SQLConnector ) = False then UTI_GEN_Salir;

      { ****************************************************************************
        Creamos la SQL Según el motor de BD
        **************************************************************************** }
        var_SQL := TStringList.Create;

        // ***************************************************************************************** //
        // ** PRIMERO INSERTAMOS LAS TARIFAS                                                      ** //
        // ***************************************************************************************** //
        var_SQL.Add( 'INSERT INTO articulos_proporciones_tarifas' );
        var_SQL.Add(        '( id_articulos_proporciones,' );
        var_SQL.Add(         ' id_articulos,' );
        var_SQL.Add(         ' id_tarifas,' );

        var_SQL.Add(         ' PVP,' );
        var_SQL.Add(         ' PVP_Impuestos_Incluidos,' );

        var_SQL.Add(         ' Insert_WHEN,' );
        var_SQL.Add(         ' Insert_Id_User )' );

        var_SQL.Add( 'SELECT id,' );
        var_SQL.Add(         'id_articulos,' );
        var_SQL.Add(         Trim(param_id_tarifas) + ',' );

        var_SQL.Add(         '0,' );
        var_SQL.Add(         '0,' );

        var_SQL.Add(         UTI_GEN_Comillas(param_Fecha_Hora) + ',' );
        var_SQL.Add(         Trim(param_usuario) );

        var_SQL.Add(   'FROM articulos_proporciones' );

        // esta linea siguiente la quito para que se inserte también en las dadas de baja
        // var_SQL.Add(  'WHERE Del_WHEN IS NULL' );

      { ****************************************************************************
        Abrimos la tabla
        **************************************************************************** }
        var_SQLQuery          := TSQLQuery.Create(nil);

        var_SQLQuery.Database := var_SQLConnector;
        var_SQLQuery.SQL.Text := var_SQL.Text;

        var_SQLQuery.Name     := 'SQLQuery_Crear_Tarifa_a_articulos_proporciones';

        var_SQLQuery.ExecSQL;
        var_SQLTransaction.Commit;


      { ****************************************************************************
        Destruimos la tabla y conexiones
        **************************************************************************** }
        var_SQLQuery.Free;
        var_SQL.Free;

      { ****************************************************************************
        Cerramos La transacción y la conexión con la BD
        **************************************************************************** }
        if UTI_CN_Cerrar( var_SQLTransaction,
                          var_SQLConnector ) = False then UTI_GEN_Salir;

        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    Except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( 'Error al CREAR en cada proporción de artículo la tarifa ' +
                               Trim(param_id_tarifas) + '. La tabla ha sido ' + var_SQLQuery.Name +
                               ' desde el módulo ' + Screen.ActiveForm.Name,
                               error );
            try
                var_SQL.Free;
                var_SQLTransaction.Free;
                var_SQLConnector.Free;
                var_SQLQuery.Free;
            except
            end;

            Result := false
        end;
    end;
end;

procedure Tform_tarifas_000.Cauto_articulos_familias_tarifa_Y_Guardo_en_Historico_sus_Cambios( param_id_tarifas : ShortString );
var var_SQL : TStrings;
begin
    // ********************************************************************************************* //
    // ** Esto lo hago porque puede ser que los criterios de filtrado me eviten filtrar el rgitro.** //
    // ** recien creado                                                                           ** //
    // ********************************************************************************************* //
    var_SQL := TStringList.Create;

    var_SQL.Add( 'SELECT aft.*' );
    var_SQL.Add(   'FROM articulos_familias_tarifas AS aft' );
    var_SQL.Add(  'WHERE aft.id_tarifas = ' + Trim(param_id_tarifas)  );
    var_SQL.Add(  'ORDER BY aft.id_articulos_familias ASC, aft.id_tarifas ASC' );

    if UTI_RGTRO_Buscar_Rgtro_y_Grabar_Cambios_en_Historico( 'SQLQuery_Articulos_Familias_Tarifas',
                                                             var_SQL ) = false then
    begin
        var_SQL.Clear;

        var_SQL.Add( 'No se pudo grabar el histórico de los cambios' +
                     ' realizados por la tarifa ' + Trim(param_id_tarifas) +
                     ' a todas las familias de artículos. ' +
                     'Pero si que se grabó la tarifa a todas las diferentes familias de artículos' );

        UTI_GEN_Aviso(true, var_SQL, 'ERROR ... ', True, False);
    end;

    var_SQL.Free;
end;

procedure Tform_tarifas_000.Cauto_articulos_tarifa_Y_Guardo_en_Historico_sus_Cambios( param_id_tarifas : ShortString );
var var_SQL : TStrings;
begin
    // ********************************************************************************************* //
    // ** Esto lo hago porque puede ser que los criterios de filtrado me eviten filtrar el rgitro.** //
    // ** recien creado                                                                           ** //
    // ********************************************************************************************* //
    var_SQL := TStringList.Create;

    var_SQL.Add( 'SELECT at.*' );
    var_SQL.Add(   'FROM articulos_tarifas AS at' );
    var_SQL.Add(  'WHERE at.id_tarifas = ' + Trim(param_id_tarifas)  );
    var_SQL.Add(  'ORDER BY at.id_articulos ASC, at.id_tarifas ASC' );

    if UTI_RGTRO_Buscar_Rgtro_y_Grabar_Cambios_en_Historico( 'SQLQuery_Articulos_Tarifas',
                                                             var_SQL ) = false then
    begin
        var_SQL.Clear;

        var_SQL.Add( 'No se pudo grabar el histórico de los cambios' +
                     ' realizados por la tarifa ' + Trim(param_id_tarifas) +
                     ' a todos los artículos. ' +
                     'Pero si que se grabó la tarifa a todo artículo' );

        UTI_GEN_Aviso(true, var_SQL, 'ERROR ... ', True, False);
    end;

    var_SQL.Free;
end;

procedure Tform_tarifas_000.Cauto_articulos_proporciones_tarifa_Y_Guardo_en_Historico_sus_Cambios( param_id_tarifas : ShortString );
var var_SQL : TStrings;
begin
    // ********************************************************************************************* //
    // ** Esto lo hago porque puede ser que los criterios de filtrado me eviten filtrar el rgitro.** //
    // ** recien creado                                                                           ** //
    // ********************************************************************************************* //
    var_SQL := TStringList.Create;

    var_SQL.Add( 'SELECT apt.*' );
    var_SQL.Add(   'FROM articulos_proporciones_tarifas AS apt' );
    var_SQL.Add(  'WHERE apt.id_tarifas = ' + Trim(param_id_tarifas)  );
    var_SQL.Add(  'ORDER BY apt.id_articulos_proporciones ASC, apt.id_tarifas ASC' );

    if UTI_RGTRO_Buscar_Rgtro_y_Grabar_Cambios_en_Historico( 'SQLQuery_Articulos_Proporciones_Tarifas',
                                                             var_SQL ) = false then
    begin
        var_SQL.Clear;

        var_SQL.Add( 'No se pudo grabar el histórico de los cambios' +
                     ' realizados por la tarifa ' + Trim(param_id_tarifas) +
                     ' a todas las proprociones de artículos. ' +
                     'Pero si que se grabó la tarifa a todas las diferentes proporciones de artículos' );

        UTI_GEN_Aviso(true, var_SQL, 'ERROR ... ', True, False);
    end;

    var_SQL.Free;
end;

procedure Tform_tarifas_000.DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
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
                var_id := SQLQuery_Tarifas.FieldByName('id').AsString;

                var_dar_de_Baja := true;
                if not SQLQuery_Tarifas.FieldByName('Del_WHEN').isNull then
                begin
                    var_dar_de_Baja := false;
                end;

                if UTI_RGTRO_Borrar( 'tarifas',
                                     SQLQuery_Tarifas,
                                     public_Solo_Ver,
                                     public_Menu_Worked ) = true then
                begin
                     if Borrar_Tarifa_a_articulos_familias( var_dar_de_Baja,
                                                            var_id,
                                                            UTI_GEN_Format_Fecha_Hora(UTI_CN_Fecha_Hora, true),
                                                            InttoStr(Form_Menu.public_User) ) = true then
                     begin
                         // ************************************************************************ //
                         // ** TENGO QUE CREAR LOS cambios por borrado o por dar de alta otra vez ** //
                         // en su historico                                                       ** //
                         // **************************************************************************** //
                         Cauto_articulos_familias_tarifa_Y_Guardo_en_Historico_sus_Cambios(var_id);
                     end;

                     if Borrar_Tarifa_a_articulos( var_dar_de_Baja,
                                                   var_id,
                                                   UTI_GEN_Format_Fecha_Hora(UTI_CN_Fecha_Hora, true),
                                                   InttoStr(Form_Menu.public_User) ) = true then
                     begin
                         // ************************************************************************ //
                         // ** TENGO QUE CREAR LOS cambios por borrado o por dar de alta otra vez ** //
                         // en su historico                                                       ** //
                         // **************************************************************************** //
                         Cauto_articulos_tarifa_Y_Guardo_en_Historico_sus_Cambios(var_id);
                     end;

                     if Borrar_Tarifa_a_articulos_proporciones( var_dar_de_Baja,
                                                                var_id,
                                                                UTI_GEN_Format_Fecha_Hora(UTI_CN_Fecha_Hora, true),
                                                                InttoStr(Form_Menu.public_User) ) = true then
                     begin
                         // ************************************************************************ //
                         // ** TENGO QUE CREAR LOS cambios por borrado o por dar de alta otra vez ** //
                         // en su historico                                                       ** //
                         // **************************************************************************** //
                         Cauto_articulos_proporciones_tarifa_Y_Guardo_en_Historico_sus_Cambios(var_id);
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

function Tform_tarifas_000.Borrar_Tarifa_a_articulos_familias( param_dar_de_Baja : Boolean;
                                                               param_id_tarifas,
                                                               param_Fecha_Hora,
                                                               param_usuario : ShortString ) : Boolean;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
    var_msg            : String;
begin
    Result := true;

    Try
      { ****************************************************************************
        Creamos la Transaccion y la conexión con el motor BD, y la abrimos
        **************************************************************************** }
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Abrir( var_SQLTransaction,
                         var_SQLConnector ) = False then UTI_GEN_Salir;

      { ****************************************************************************
        Creamos la SQL Según el motor de BD
        **************************************************************************** }
        var_SQL := TStringList.Create;

        // ***************************************************************************************** //
        // ** PRIMERO INSERTAMOS LAS TARIFAS                                                      ** //
        // ***************************************************************************************** //
        var_SQL.Add( 'UPDATE articulos_familias_tarifas' );

        if param_dar_de_Baja = true then
            begin
                var_SQL.Add(    'SET Del_WHEN = ' + UTI_GEN_Comillas(Trim(param_Fecha_Hora)) + ',' );
                var_SQL.Add(        'Del_Id_User = ' + Trim(param_usuario) + ',' );
                var_SQL.Add(        'Del_WHY = ' + UTI_GEN_Comillas('Rgtro.borrado al borrar la tarifa desde mantenimiento de tarifas') );
            end
        else
            begin
                var_SQL.Add(    'SET Del_WHEN = NULL,' );
                var_SQL.Add(        'Del_Id_User = NULL,' );
                var_SQL.Add(        'Del_WHY = NULL' );
            end;

        var_SQL.Add(  'WHERE id_tarifas = ' + Trim(param_id_tarifas) );

        if param_dar_de_Baja = true then
             var_SQL.Add(    'AND Del_WHEN IS NULL' )
        else var_SQL.Add(    'AND NOT Del_WHEN IS NULL' );

      { ****************************************************************************
        Abrimos la tabla
        **************************************************************************** }
        var_SQLQuery          := TSQLQuery.Create(nil);

        var_SQLQuery.Database := var_SQLConnector;
        var_SQLQuery.SQL.Text := var_SQL.Text;

        var_SQLQuery.Name     := 'SQLQuery_Borrar_Tarifa_a_articulos_familias';

        var_SQLQuery.ExecSQL;
        var_SQLTransaction.Commit;


      { ****************************************************************************
        Destruimos la tabla y conexiones
        **************************************************************************** }
        var_SQLQuery.Free;
        var_SQL.Free;

      { ****************************************************************************
        Cerramos La transacción y la conexión con la BD
        **************************************************************************** }
        if UTI_CN_Cerrar( var_SQLTransaction,
                          var_SQLConnector ) = False then UTI_GEN_Salir;

        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    Except
        on error : Exception do
        begin
            if param_dar_de_Baja = true then
            begin
                var_msg := 'Error al BORRAR toda tarifa ' + Trim(param_id_tarifas) +
                           ' de las familias de artículos . La tabla ha sido ' +
                           var_SQLQuery.Name + ' desde el módulo ' + Screen.ActiveForm.Name;
            end else begin
                var_msg := 'Error al DAR DE ALTA ( por haber sido borrada anteriormente )' +
                           ' toda tarifa ' + Trim(param_id_tarifas) +
                           ' de las familias de artículos . La tabla ha sido ' +
                           var_SQLQuery.Name + ' desde el módulo ' + Screen.ActiveForm.Name;
            end;

            UTI_GEN_Error_Log( var_msg, error );

            try
                var_SQL.Free;
                var_SQLTransaction.Free;
                var_SQLConnector.Free;
                var_SQLQuery.Free;
            except
            end;

            Result := false;
        end;
    end;
end;

function Tform_tarifas_000.Borrar_Tarifa_a_articulos( param_dar_de_Baja : Boolean;
                                                      param_id_tarifas,
                                                      param_Fecha_Hora,
                                                      param_usuario : ShortString ) : Boolean;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
    var_msg            : String;
begin
    Result := true;

    Try
      { ****************************************************************************
        Creamos la Transaccion y la conexión con el motor BD, y la abrimos
        **************************************************************************** }
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Abrir( var_SQLTransaction,
                         var_SQLConnector ) = False then UTI_GEN_Salir;

      { ****************************************************************************
        Creamos la SQL Según el motor de BD
        **************************************************************************** }
        var_SQL := TStringList.Create;

        // ***************************************************************************************** //
        // ** PRIMERO INSERTAMOS LAS TARIFAS                                                      ** //
        // ***************************************************************************************** //
        var_SQL.Add( 'UPDATE articulos_tarifas' );

        if param_dar_de_Baja = true then
            begin
                var_SQL.Add(    'SET Del_WHEN = ' + UTI_GEN_Comillas(Trim(param_Fecha_Hora)) + ',' );
                var_SQL.Add(        'Del_Id_User = ' + Trim(param_usuario) + ',' );
                var_SQL.Add(        'Del_WHY = ' + UTI_GEN_Comillas('Rgtro.borrado al borrar la tarifa desde mantenimiento de tarifas') );
            end
        else
            begin
                var_SQL.Add(    'SET Del_WHEN = NULL,' );
                var_SQL.Add(        'Del_Id_User = NULL,' );
                var_SQL.Add(        'Del_WHY = NULL' );
            end;

        var_SQL.Add(  'WHERE id_tarifas = ' + Trim(param_id_tarifas) );

        if param_dar_de_Baja = true then
             var_SQL.Add(    'AND Del_WHEN IS NULL' )
        else var_SQL.Add(    'AND NOT Del_WHEN IS NULL' );

      { ****************************************************************************
        Abrimos la tabla
        **************************************************************************** }
        var_SQLQuery          := TSQLQuery.Create(nil);

        var_SQLQuery.Database := var_SQLConnector;
        var_SQLQuery.SQL.Text := var_SQL.Text;

        var_SQLQuery.Name     := 'SQLQuery_Borrar_Tarifa_a_articulos';

        var_SQLQuery.ExecSQL;
        var_SQLTransaction.Commit;


      { ****************************************************************************
        Destruimos la tabla y conexiones
        **************************************************************************** }
        var_SQLQuery.Free;
        var_SQL.Free;

      { ****************************************************************************
        Cerramos La transacción y la conexión con la BD
        **************************************************************************** }
        if UTI_CN_Cerrar( var_SQLTransaction,
                          var_SQLConnector ) = False then UTI_GEN_Salir;

        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    Except
        on error : Exception do
        begin
            if param_dar_de_Baja = true then
            begin
                 var_msg := 'Error al BORRAR toda tarifa ' + Trim(param_id_tarifas) +
                            ' de los artículos . La tabla ha sido ' +
                            var_SQLQuery.Name + ' desde el módulo ' + Screen.ActiveForm.Name;
            end else begin
                var_msg := 'Error al DAR DE ALTA ( por haber sido borrada anteriormente )' +
                           ' toda tarifa ' + Trim(param_id_tarifas) +
                           ' de los artículos . La tabla ha sido ' +
                           var_SQLQuery.Name + ' desde el módulo ' + Screen.ActiveForm.Name;
            end;

            UTI_GEN_Error_Log( var_msg, error );

            try
                var_SQL.Free;
                var_SQLTransaction.Free;
                var_SQLConnector.Free;
                var_SQLQuery.Free;
            except
            end;

            Result := false;
        end;
    end;
end;

function Tform_tarifas_000.Borrar_Tarifa_a_articulos_proporciones( param_dar_de_Baja : Boolean;
                                                                   param_id_tarifas,
                                                                   param_Fecha_Hora,
                                                                   param_usuario : ShortString ) : Boolean;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
    var_msg            : String;
begin
    Result := true;

    Try
      { ****************************************************************************
        Creamos la Transaccion y la conexión con el motor BD, y la abrimos
        **************************************************************************** }
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Abrir( var_SQLTransaction,
                         var_SQLConnector ) = False then UTI_GEN_Salir;

      { ****************************************************************************
        Creamos la SQL Según el motor de BD
        **************************************************************************** }
        var_SQL := TStringList.Create;

        // ***************************************************************************************** //
        // ** PRIMERO INSERTAMOS LAS TARIFAS                                                      ** //
        // ***************************************************************************************** //
        var_SQL.Add( 'UPDATE articulos_proporciones_tarifas' );

        if param_dar_de_Baja = true then
            begin
                var_SQL.Add(    'SET Del_WHEN = ' + UTI_GEN_Comillas(Trim(param_Fecha_Hora)) + ',' );
                var_SQL.Add(        'Del_Id_User = ' + Trim(param_usuario) + ',' );
                var_SQL.Add(        'Del_WHY = ' + UTI_GEN_Comillas('Rgtro.borrado al borrar la tarifa desde mantenimiento de tarifas') );
            end
        else
            begin
                var_SQL.Add(    'SET Del_WHEN = NULL,' );
                var_SQL.Add(        'Del_Id_User = NULL,' );
                var_SQL.Add(        'Del_WHY = NULL' );
            end;

        var_SQL.Add(  'WHERE id_tarifas = ' + Trim(param_id_tarifas) );

        if param_dar_de_Baja = true then
             var_SQL.Add(    'AND Del_WHEN IS NULL' )
        else var_SQL.Add(    'AND NOT Del_WHEN IS NULL' );

      { ****************************************************************************
        Abrimos la tabla
        **************************************************************************** }
        var_SQLQuery          := TSQLQuery.Create(nil);

        var_SQLQuery.Database := var_SQLConnector;
        var_SQLQuery.SQL.Text := var_SQL.Text;

        var_SQLQuery.Name     := 'SQLQuery_Borrar_Tarifa_a_articulos_proporciones';

        var_SQLQuery.ExecSQL;
        var_SQLTransaction.Commit;


      { ****************************************************************************
        Destruimos la tabla y conexiones
        **************************************************************************** }
        var_SQLQuery.Free;
        var_SQL.Free;

      { ****************************************************************************
        Cerramos La transacción y la conexión con la BD
        **************************************************************************** }
        if UTI_CN_Cerrar( var_SQLTransaction,
                          var_SQLConnector ) = False then UTI_GEN_Salir;

        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    Except
        on error : Exception do
        begin
            if param_dar_de_Baja = true then
            begin
                var_msg := 'Error al BORRAR toda tarifa ' + Trim(param_id_tarifas) +
                           ' de las proporciones de artículos . La tabla ha sido ' +
                           var_SQLQuery.Name + ' desde el módulo ' + Screen.ActiveForm.Name;
            end else begin
                var_msg := 'Error al DAR DE ALTA ( por haber sido borrada anteriormente )' +
                           ' toda tarifa ' + Trim(param_id_tarifas) +
                           ' de las proporciones de artículos . La tabla ha sido ' +
                           var_SQLQuery.Name + ' desde el módulo ' + Screen.ActiveForm.Name;
            end;

            UTI_GEN_Error_Log( var_msg, error );
            try
                var_SQL.Free;
                var_SQLTransaction.Free;
                var_SQLConnector.Free;
                var_SQLQuery.Free;
            except
            end;

            Result := false;
        end;
    end;
end;

procedure Tform_tarifas_000.SQLQuery_TarifasBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTRO_param_assign_value_Edit( SQLQuery_Tarifas );
end;

procedure Tform_tarifas_000.Editar_Registro;
var var_msg           : TStrings;
    var_Form          : Tform_tarifas_001;
    var_record_Existe : Trecord_Existe;
    var_id            : ShortString;
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
                        end
                    else
                        begin
                            if UTI_RGTRO_Lock( 'tarifas',
                                               FieldByName('id').AsString ) = true then
                                 Edit
                            else Exit;
                        end;

                    var_Form := Tform_tarifas_001.Create(nil);

                    var_Form.public_Menu_Worked := public_Menu_Worked;

                    if public_Solo_Ver = true then
                    begin
                        var_Form.public_Solo_Ver := true;
                    end;

                    var_Form.para_Empezar;

                    var_Form.ShowModal;

                    if var_Form.public_Pulso_Aceptar = true then
                        begin
                            var_record_Existe := Existe_la_Tarifa_Ya( FieldByName('id').AsString,
                                                                      FieldByName('descripcion').AsString );

                            if var_record_Existe.Fallo_en_Conexion_BD = true then
                                begin
                                    var_Form.Free;
                                    Cancel;
                                end
                            else
                                begin
                                    if var_record_Existe.Existe = false then
                                        begin
                                            if Trim(Params.ParamByName('COPY_' + 'descripcion').AsString) <> Trim(FieldByName('descripcion').AsString) then
                                               begin
                                                    FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                                                    FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                                                    UTI_RGTRO_Grabar_Antes( 'tarifas',
                                                                            SQLQuery_Tarifas );
                                               end
                                            else Cancel;
                                            var_Form.Free;
                                        end
                                    else
                                        begin
                                            var_Form.Free;
                                            Cancel;
                                            var_msg.Clear;
                                            var_msg.Add( 'Tarifa repetida.');

                                            if UpperCase(var_record_Existe.deBaja) = 'S' then
                                            begin
                                                var_msg.Add(rs_Rgtro_Borrado);
                                            end;

                                            UTI_GEN_Aviso(true, var_msg, rs_Ya_Existe, True, False);
                                        end;
                                end;
                        end
                    else
                        begin
                            var_Form.Free;
                            Cancel;
                        end;

                    UTI_RGTRO_UnLock( 'tarifas',
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


