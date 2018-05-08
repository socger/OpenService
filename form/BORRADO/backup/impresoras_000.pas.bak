unit impresoras_000;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs, Buttons, StdCtrls,
    utilidades_general, utilidades_rgtro, utilidades_bd, utilidades_usuarios, DBGrids, DbCtrls,
    utilidades_datos_tablas, utilidades_impresoras, ExtCtrls, Grids, ComCtrls;

type

    { Tform_impresoras_000 }

    Tform_impresoras_000 = class(TForm)
      BitBtn_Considerar_como_cerrado: TBitBtn;
      BitBtn_Filtrar: TBitBtn;
        BitBtn_Imprimir: TBitBtn;
        BitBtn_SALIR: TBitBtn;
        BitBtn_Seleccionar: TBitBtn;
        BitBtn_Ver_Situacion_Registro: TBitBtn;
        ComboBox_Filtros: TComboBox;
        DataSource_Impresoras: TDataSource;
        DBGrid_Principal: TDBGrid;
        DBNavigator1: TDBNavigator;
        Edit_Descripcion: TEdit;
        Image_Predeterminada: TImage;
        Label10: TLabel;
        Label6: TLabel;
        Label9: TLabel;
        Label_Ctdad_Rgtros: TLabel;
        Label_Fecha2: TLabel;
        Memo_Filtros: TMemo;
        Memo_OrderBy: TMemo;
        PageControl_Filtros: TPageControl;
        RadioGroup_Bajas: TRadioGroup;
        SQLQuery_Impresoras: TSQLQuery;
        SQLQuery_ImpresorasChange_Id_User: TLargeintField;
        SQLQuery_ImpresorasChange_WHEN: TDateTimeField;
        SQLQuery_ImpresorasCopias_a_Imprimir: TLongintField;
        SQLQuery_ImpresorasDel_Id_User: TLargeintField;
        SQLQuery_ImpresorasDel_WHEN: TDateTimeField;
        SQLQuery_ImpresorasDel_WHY: TStringField;
        SQLQuery_Impresorasdescripcion: TStringField;
        SQLQuery_Impresorasid: TLargeintField;
        SQLQuery_ImpresorasInsert_Id_User: TLargeintField;
        SQLQuery_ImpresorasInsert_WHEN: TDateTimeField;
        SQLQuery_Impresoraspredeterminada_SN: TStringField;
        TabSheet_Busqueda_Concreta: TTabSheet;
        TabSheet_Filtros_Generales: TTabSheet;

        procedure BitBtn_Considerar_como_cerradoClick(Sender: TObject);
        procedure ComboBox_FiltrosChange(Sender: TObject);
        procedure Filtrar_Principal_Sin_Preguntar;
        procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
        function  Existe_la_Impresora_Ya( param_id, param_descripcion : ShortString ) : Trecord_Existe;
        procedure Editar_Registro;
        procedure Insertar_Registro;
        procedure Refrescar_Registros;
        procedure para_Empezar;
        procedure Presentar_Datos;
        procedure Seleccionado_Rgtro;
        procedure no_Tocar;
        procedure Filtrar_tablas_ligadas;
        procedure Cerramos_Tablas;
        procedure Cerramos_Tablas_Ligadas;
        procedure BitBtn_ImprimirClick(Sender: TObject);
        procedure BitBtn_SALIRClick(Sender: TObject);
        procedure BitBtn_SeleccionarClick(Sender: TObject);
        procedure BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
        procedure DBGrid_PrincipalCellClick(Column: TColumn);
        procedure DBGrid_PrincipalDblClick(Sender: TObject);
        procedure DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
        procedure DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
        function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
        procedure BitBtn_FiltrarClick(Sender: TObject);
        procedure FormActivate(Sender: TObject);
        procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
        procedure FormCreate(Sender: TObject);
        procedure FormDestroy(Sender: TObject);
        procedure RadioGroup_BajasClick(Sender: TObject);
        procedure SQLQuery_ImpresorasAfterPost(DataSet: TDataSet);
        procedure SQLQuery_ImpresorasAfterScroll(DataSet: TDataSet);
        procedure SQLQuery_ImpresorasBeforeEdit(DataSet: TDataSet);
        procedure SQLQuery_ImpresorasBeforePost(DataSet: TDataSet);
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
    form_impresoras_000: Tform_impresoras_000;

implementation

{$R *.lfm}

uses dm_impresoras, menu, impresoras_001;

{ Tform_impresoras_000 }

procedure Tform_impresoras_000.BitBtn_FiltrarClick(Sender: TObject);
begin
    if PageControl_Filtros.ActivePage = TabSheet_Busqueda_Concreta then
    begin
        Filtrar_Principal_Sin_Preguntar;
    end else begin
        RadioGroup_Bajas.ItemIndex := Filtrar_Principal( true );
    end;
end;

procedure Tform_impresoras_000.FormActivate(Sender: TObject);
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

procedure Tform_impresoras_000.FormClose(Sender: TObject; var CloseAction: TCloseAction);
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

procedure Tform_impresoras_000.FormCreate(Sender: TObject);
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

procedure Tform_impresoras_000.FormDestroy(Sender: TObject);
begin
    Cerramos_Tablas;
end;

procedure Tform_impresoras_000.RadioGroup_BajasClick(Sender: TObject);
begin
    Refrescar_Registros;
end;

procedure Tform_impresoras_000.SQLQuery_ImpresorasAfterPost(DataSet: TDataSet);
begin
    UTI_RGTRO_Grabar( 'impresoras', DataModule_Impresoras.SQLTransaction_Impresoras, SQLQuery_Impresoras );
    Refrescar_Registros;
end;

procedure Tform_impresoras_000.SQLQuery_ImpresorasAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure Tform_impresoras_000.SQLQuery_ImpresorasBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTRO_param_assign_value_Edit( SQLQuery_Impresoras );
end;

function Tform_impresoras_000.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
var var_Registro_CRUD : TRegistro_CRUD;
    var_ctdad_Rgtros  : Integer;
    var_a_Filtrar     : TStrings;
begin
    var_a_Filtrar := TStringList.Create;
    var_a_Filtrar.Clear;

    var_Registro_CRUD := UTI_DATOS_TABLA_impresoras_CRUD;
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
                              DataModule_Impresoras.SQLTransaction_Impresoras,
                              DataModule_Impresoras.SQLConnector_Impresoras,
                              SQLQuery_Impresoras,

                              var_Registro_CRUD.name_tabla,
                              RadioGroup_Bajas.ItemIndex,

                              var_Registro_CRUD.SELECT_SQL,

                              Memo_Filtros.Lines,
                              Memo_OrderBy.Lines,
                              var_a_Filtrar.Text,

                              param_Cambiamos_Filtro );

    var_a_Filtrar.Free;

    Label_Ctdad_Rgtros.Caption := IntToStr(SQLQuery_Impresoras.RecordCount);

    //Filtrar_tablas_ligadas;
end;

procedure Tform_impresoras_000.BitBtn_ImprimirClick(Sender: TObject);
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
                      SQLQuery_Impresoras,
                      DataSource_Impresoras,
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

procedure Tform_impresoras_000.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_impresoras_000.BitBtn_SeleccionarClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
end;

procedure Tform_impresoras_000.BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if SQLQuery_Impresoras.RecordCount > 0 then UTI_RGTRO_Ver_Estado_Registro( 'impresoras',
                                                                                   SQLQuery_Impresoras,
                                                                                   DataSource_Impresoras,
                                                                                   DBGrid_Principal );
    end;
end;

procedure Tform_impresoras_000.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure Tform_impresoras_000.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    If public_Elegimos then
         Seleccionado_Rgtro
    else Editar_Registro;
end;

procedure Tform_impresoras_000.DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect;
                                                              DataCol: Integer; Column: TColumn;
                                                              State: TGridDrawState);
var var_Color_Normal : TColor;
begin
    with Sender as TDBGrid do
    begin
        if SQLQuery_Impresoras.RecordCount = 0 then Exit;

        var_Color_Normal := Canvas.Brush.Color;

        // ***************************************************************************************** //
        // ** Primero comprobamos si es un registro dado de baja o no                             ** //
        // ***************************************************************************************** //
        if not SQLQuery_Impresoras.FieldByName('Del_WHEN').IsNull then
        begin
            // ********************************************************************************* //
            // ** Registro DADO de BAJA                                                       ** //
            // ********************************************************************************* //
            Canvas.Font.Color := clSilver;
        end else begin
            // ********************************************************************************* //
            // ** Registro DADO de ALTA, NO BAJA                                              ** //
            // ********************************************************************************* //
            // ** Así que las pinto, pero sólo si no son las columnas que van a               ** //
            // ** ser dibujadas                                                               ** //
            // ********************************************************************************* //
            if State <> [gdSelected] then
            begin
                if (Column.FieldName <> 'predeterminada') then
                begin
                    Canvas.font.Color := clBlack;
                end;
            end;
        end;

        // ***************************************************************************************** //
        // ** Ahora paso a dibujar una celda normal con los colores elegidos o una                ** //
        // ** dibujada                                                                            ** //
        // ***************************************************************************************** //
        if (Column.FieldName <> 'predeterminada') then
        begin
            // ********************************************************************************* //
            // ** No es una de las columnas a dibujar por lo que la pinto con los             ** //
            // ** colores elegidos                                                            ** //
            // ********************************************************************************* //
            DefaultDrawColumnCell(Rect, DataCol, Column, State);
        end else begin
            // ********************************************************************************* //
            // ** Es una de las columnas a dibujar                                            ** //
            // ********************************************************************************* //
            // ** COLUMNA CONFIRMADA                                                          ** //
            // ********************************************************************************* //
            if Column.FieldName = 'predeterminada'  then
            begin
                if SQLQuery_Impresoras.FieldByName('predeterminada_SN').Value = 'S' then
                     Canvas.StretchDraw(Rect, Image_Predeterminada.Picture.Graphic)
                else DefaultDrawColumnCell(Rect, DataCol, Column, State);
            end;
        end;

        Canvas.Font.Color := var_Color_Normal;
    end;
end;

procedure Tform_impresoras_000.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then
    begin
        If public_Elegimos then
             Seleccionado_Rgtro
        else Editar_Registro;
    end;
end;

procedure Tform_impresoras_000.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

procedure Tform_impresoras_000.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_Impresoras.SQLConnector_Impresoras,
                      DataModule_Impresoras.SQLTransaction_Impresoras,
                      SQLQuery_Impresoras ) = false then UTI_GEN_Salir;

    DataModule_Impresoras.Free;
end;

procedure Tform_impresoras_000.Cerramos_Tablas_Ligadas;
begin
{ ESTE form NO TIENE TABLAS LIGADAS

    if UTI_TB_Cerrar( DataModule_del_form_000.SQLConnector_de_la_tabla,
                      DataModule_Users.SQLTransaction_de_la_tabla,
                      SQLQuery_la_tabla ) = false then UTI_GEN_Salir;
}
end;

procedure Tform_impresoras_000.Filtrar_tablas_ligadas;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
begin
    if SQLQuery_Impresoras.RecordCount = 0 then Exit;

    if SQLQuery_Impresoras.State = dsInsert then
    begin
        Cerramos_Tablas_Ligadas;
        Exit;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;
end;

procedure Tform_impresoras_000.no_Tocar;
begin
    BitBtn_Imprimir.Enabled := False;
end;

procedure Tform_impresoras_000.Seleccionado_Rgtro;
begin
    private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    public_Rgtro_Seleccionado := true;
    Close;
end;

procedure Tform_impresoras_000.Presentar_Datos;
begin
     /// guardar por lo que pueda pasar
end;

procedure Tform_impresoras_000.para_Empezar;
begin
  { ****************************************************************************
    Solo para formularios que traten con datos
    **************************************************************************** }
    if UTI_GEN_Form_Abierto_Ya('DataModule_Impresoras') = False then
    begin
        DataModule_Impresoras := TDataModule_Impresoras.Create(Application);
    end;

  { ****************************************************************************
    Preparamos los diferentes tipos de orden preconfigurados
    **************************************************************************** }
    SetLength(private_Order_By, 2);

    private_Order_By[0].Titulo       := 'Por la descripción'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[0].Memo_OrderBy := 'i.descripcion ASC';

    private_Order_By[1].Titulo       := 'Por la id';
    private_Order_By[1].Memo_OrderBy := 'i.id ASC';

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

procedure Tform_impresoras_000.Refrescar_Registros;
var var_descripcion : String;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_descripcion := '';

    if SQLQuery_Impresoras.RecordCount > 0 then
    begin
        var_descripcion := SQLQuery_Impresoras.FieldByName('descripcion').Value;
    end;

    Filtrar_Principal_Sin_Preguntar;

    if Trim(var_descripcion) <> '' then SQLQuery_Impresoras.Locate('descripcion', var_descripcion, []);
end;

function Tform_impresoras_000.Existe_la_Impresora_Ya( param_id,
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

        var_SQL.Add('SELECT i.*' );
        var_SQL.Add(  'FROM impresoras AS i' );
        var_SQL.Add(' WHERE i.descripcion LIKE ' + UTI_GEN_Comillas('%' + Trim(param_descripcion) + '%') );

        if Trim(param_id) <> '' then
        begin
             var_SQL.Add(  ' AND NOT i.id = ' + Trim(param_id) );
        end;

        var_SQL.Add(' ORDER BY i.descripcion ASC' );

      { ****************************************************************************
        Abrimos la tabla
        **************************************************************************** }
        var_SQLQuery      := TSQLQuery.Create(nil);
        var_SQLQuery.Name := 'SQLQuery_Existe_la_Impresora_Ya';

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
             UTI_GEN_Error_Log( 'Error al comprobar si la impresora existe ya.' +
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

procedure Tform_impresoras_000.DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
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
                UTI_RGTRO_Borrar( 'impresoras',
                                  SQLQuery_Impresoras,
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

procedure Tform_impresoras_000.SQLQuery_ImpresorasBeforePost(DataSet: TDataSet);
begin
    UTI_RGTRO_param_assign_value( SQLQuery_Impresoras );
end;

procedure Tform_impresoras_000.Filtrar_Principal_Sin_Preguntar;
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

procedure Tform_impresoras_000.ComboBox_FiltrosChange(Sender: TObject);
begin
    Memo_OrderBy.Lines.Clear;
    Memo_OrderBy.Lines.Add( private_Order_By[ComboBox_Filtros.ItemIndex].Memo_OrderBy );
    BitBtn_FiltrarClick(Nil);
end;

procedure Tform_impresoras_000.BitBtn_Considerar_como_cerradoClick(Sender: TObject);
var var_msg : TStrings;
begin
    with SQLQuery_Impresoras do
    begin
        if RecordCount <> 0 then
        begin
            if UTI_IMPRESORAS_Crear_Predeterminada( FieldByName('id').AsString,
                                                    FieldByName('descripcion').AsString ) = false then
            begin
                var_msg := TStringList.Create;
                var_msg.Add('No se pudo poner como predeterminada.');
                UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
                var_msg.Free;
            end else begin
                // ********************************************************************************* //
                // ** Refrescar los registros para presentar la nueva impresora predeterminada    ** //
                // ********************************************************************************* //
                Refrescar_Registros;

                // ********************************************************************************* //
                // ** Asignamos a la aplicación cual es la impresora predeterminada y cantidad de ** //
                // ** copias preconfiguradas cuando se use                                        ** //
                // ********************************************************************************* //
                form_menu.Traer_Impresora_Predeterminada;
            end;
        end else begin

        end;
    end;
end;

procedure Tform_impresoras_000.Insertar_Registro;
var var_msg           : TStrings;
    var_Form          : Tform_impresoras_001;
    var_Fecha_Hora    : ShortString;
    var_descripcion   : ShortString;
    var_record_Existe : Trecord_Existe;
begin
    with SQLQuery_Impresoras do
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

                FieldByName('predeterminada_SN').AsString := 'N';
                FieldByName('Copias_a_Imprimir').AsString := '1';

                var_Form := Tform_impresoras_001.Create(nil);

                var_Form.para_Empezar;

                var_Form.ShowModal;

                if var_Form.public_Pulso_Aceptar = true then
                begin
                    var_record_Existe := Existe_la_Impresora_Ya( '',
                                                              FieldByName('descripcion').AsString );

                    if var_record_Existe.Fallo_en_Conexion_BD = true then
                    begin
                        var_Form.Free;
                        Cancel;
                    end else begin
                        if var_record_Existe.Existe = false then
                        begin
                            var_Form.Free;

                            var_descripcion                     := FieldByName('descripcion').AsString;

                            var_Fecha_Hora                      := DateTimeToStr(UTI_CN_Fecha_Hora);
                            FieldByName('Insert_WHEN').AsString := var_Fecha_Hora;
                            FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                            UTI_RGTRO_Grabar_Antes( 'impresoras', SQLQuery_Impresoras );
                        end else begin
                            var_Form.Free;
                            Cancel;
                            var_msg.Clear;
                            var_msg.Add( 'Impresora repetida.');

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

procedure Tform_impresoras_000.Editar_Registro;
var var_msg           : TStrings;
    var_Form          : Tform_impresoras_001;
    var_record_Existe : Trecord_Existe;
    var_id            : ShortString;
begin
    with SQLQuery_Impresoras do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
        begin
            var_id := FieldByName('id').AsString;

            if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
            begin
                if UTI_RGTRO_isLock( 'impresoras',
                                     FieldByName('id').AsString,
                                     true ) = true then
                begin
                    Exit;
                end else begin
                    if UTI_RGTRO_Lock( 'impresoras', FieldByName('id').AsString ) = true then
                    begin
                        Edit
                    end else begin
                        Exit;
                    end;
                end;

                var_Form := Tform_impresoras_001.Create(nil);

                var_Form.public_Menu_Worked := public_Menu_Worked;

                if public_Solo_Ver = true then
                begin
                    var_Form.public_Solo_Ver := true;
                end;

                var_Form.para_Empezar;

                var_Form.ShowModal;

                if var_Form.public_Pulso_Aceptar = true then
                begin
                    var_record_Existe := Existe_la_Impresora_Ya( FieldByName('id').AsString,
                                                                 FieldByName('descripcion').AsString );

                    if var_record_Existe.Fallo_en_Conexion_BD = true then
                    begin
                        var_Form.Free;
                        Cancel;
                    end else begin
                        if var_record_Existe.Existe = false then
                        begin
                            if (Trim(Params.ParamByName('COPY_' + 'descripcion').AsString)       <> Trim(FieldByName('descripcion').AsString))       or
                               (Trim(Params.ParamByName('COPY_' + 'predeterminada_SN').AsString) <> Trim(FieldByName('predeterminada_SN').AsString)) or
                               (Trim(Params.ParamByName('COPY_' + 'Copias_a_Imprimir').AsString) <> Trim(FieldByName('Copias_a_Imprimir').AsString)) then
                            begin
                                FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                                FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                                UTI_RGTRO_Grabar_Antes( 'impresoras',
                                                        SQLQuery_Impresoras );
                            end else begin
                                Cancel;
                            end;

                            var_Form.Free;
                        end else begin
                            var_Form.Free;
                            Cancel;
                            var_msg.Clear;
                            var_msg.Add( 'Impresora repetida.');

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

                UTI_RGTRO_UnLock( 'impresoras', var_id );
            end;
        end else begin
            var_msg.Add(rs_no_Hay_Rgtros);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        end;
    end;

    var_msg.Free;
end;

end.


