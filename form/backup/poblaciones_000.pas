unit poblaciones_000;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
    utilidades_usuarios, utilidades_rgtro, utilidades_general, utilidades_bd, StdCtrls, DbCtrls,
    utilidades_datos_tablas, DBGrids, Grids, ComCtrls, variants, utilidades_forms_Filtrar;

type

    { Tform_poblaciones_000 }

    Tform_poblaciones_000 = class(TForm)
      BitBtn_Filtrar: TBitBtn;
        BitBtn_Imprimir: TBitBtn;
        BitBtn_SALIR: TBitBtn;
        BitBtn_Seleccionar: TBitBtn;
        BitBtn_Ver_Situacion_Registro: TBitBtn;
        Boton_Elegir_id_paises: TBitBtn;
        Boton_Elegir_id_provincias: TBitBtn;
        ComboBox_Filtros: TComboBox;
        DataSource_Poblaciones: TDataSource;
        DBGrid_Principal: TDBGrid;
        DBNavigator1: TDBNavigator;
        Edit_Descripcion: TEdit;
        Edit_Descripcion_id_paises: TEdit;
        Edit_Descripcion_id_provincias: TEdit;
        Edit_id_paises: TEdit;
        Edit_id_provincias: TEdit;
        Image_Confirmado: TImage;
        Label10: TLabel;
        Label49: TLabel;
        Label50: TLabel;
        Label6: TLabel;
        Label9: TLabel;
        Label_Ctdad_Rgtros: TLabel;
        Label_Fecha2: TLabel;
        Memo_Filtros: TMemo;
        Memo_OrderBy: TMemo;
        PageControl_Filtros: TPageControl;
        RadioGroup_Bajas: TRadioGroup;
        SQLQuery_Poblaciones: TSQLQuery;
        SQLQuery_PoblacionesChange_Id_User: TLargeintField;
        SQLQuery_PoblacionesChange_WHEN: TDateTimeField;
        SQLQuery_PoblacionesCodigo_Postal: TStringField;
        SQLQuery_PoblacionesDel_Id_User: TLargeintField;
        SQLQuery_PoblacionesDel_WHEN: TDateTimeField;
        SQLQuery_PoblacionesDel_WHY: TStringField;
        SQLQuery_Poblacionesdescripcion: TStringField;
        SQLQuery_Poblacionesid: TLargeintField;
        SQLQuery_Poblacionesid_paises: TLargeintField;
        SQLQuery_Poblacionesid_provincias: TLargeintField;
        SQLQuery_PoblacionesInsert_Id_User: TLargeintField;
        SQLQuery_PoblacionesInsert_WHEN: TDateTimeField;
        SQLQuery_PoblacionesOT_descripcion_pais: TStringField;
        SQLQuery_PoblacionesOT_descripcion_provincia: TStringField;
        TabSheet_Busqueda_Concreta: TTabSheet;
        TabSheet_Filtros_Generales: TTabSheet;

        procedure Boton_Elegir_id_paisesClick(Sender: TObject);
        procedure Boton_Elegir_id_provinciasClick(Sender: TObject);
        procedure ComboBox_FiltrosChange(Sender: TObject);
        procedure Edit_Descripcion_id_paisesClick(Sender: TObject);
        procedure Edit_Descripcion_id_provinciasClick(Sender: TObject);
        procedure Filtrar_Principal_Sin_Preguntar;
        procedure Cerramos_Tablas_Ligadas;
        procedure BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
        function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
        procedure FormCreate(Sender: TObject);
        procedure Refrescar_Registros;
        procedure BitBtn_FiltrarClick(Sender: TObject);
        procedure Presentar_Datos;
        procedure Filtrar_tablas_ligadas;
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
        procedure Cerramos_Tablas;
        procedure DBGrid_PrincipalDblClick(Sender: TObject);
        procedure DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
        procedure FormActivate(Sender: TObject);
        procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
        procedure para_Empezar;
        procedure FormDestroy(Sender: TObject);
        procedure RadioGroup_BajasClick(Sender: TObject);
        procedure SQLQuery_PoblacionesAfterPost(DataSet: TDataSet);
        procedure SQLQuery_PoblacionesAfterScroll(DataSet: TDataSet);
        procedure SQLQuery_PoblacionesBeforeEdit(DataSet: TDataSet);
        procedure SQLQuery_PoblacionesBeforePost(DataSet: TDataSet);
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
    form_poblaciones_000: Tform_poblaciones_000;

implementation

{$R *.lfm}

uses dm_poblaciones, menu, poblaciones_001;

{ Tform_poblaciones_000 }

procedure Tform_poblaciones_000.FormActivate(Sender: TObject);
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

procedure Tform_poblaciones_000.FormClose(Sender: TObject; var CloseAction: TCloseAction);
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

procedure Tform_poblaciones_000.FormDestroy(Sender: TObject);
begin
    Cerramos_Tablas;
end;

procedure Tform_poblaciones_000.RadioGroup_BajasClick(Sender: TObject);
begin
    Refrescar_Registros;
end;

procedure Tform_poblaciones_000.SQLQuery_PoblacionesAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'poblaciones',
                       DataModule_Poblaciones.SQLTransaction,
                       SQLQuery_Poblaciones,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros;
end;

procedure Tform_poblaciones_000.Refrescar_Registros;
var var_descripcion   : String;
    var_id_provincias : LargeInt{Integer};
    var_id_paises     : LargeInt{Integer};
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_descripcion   := '';
    var_id_provincias := 0;
    var_id_paises     := 0;

    if SQLQuery_Poblaciones.RecordCount > 0 then
    begin
        var_descripcion   := SQLQuery_Poblaciones.FieldByName('descripcion').AsString;
        var_id_provincias := SQLQuery_Poblaciones.FieldByName('id_provincias').Value;
        var_id_paises     := SQLQuery_Poblaciones.FieldByName('id_paises').Value;
    end;

    Filtrar_Principal_Sin_Preguntar;

    if Trim(var_descripcion) <> '' then
    begin
         SQLQuery_Poblaciones.Locate( 'descripcion;id_provincias;id_paises',
                                      VarArrayOf( [ var_descripcion,
                                                    var_id_provincias,
                                                    var_id_paises ] ),
                                      [] );
    end;
end;

procedure Tform_poblaciones_000.SQLQuery_PoblacionesAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure Tform_poblaciones_000.Filtrar_tablas_ligadas;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
begin
    if SQLQuery_Poblaciones.RecordCount = 0 then Exit;

    if SQLQuery_Poblaciones.State = dsInsert then
    begin
        Cerramos_Tablas_Ligadas;
        Exit;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;
end;

procedure Tform_poblaciones_000.SQLQuery_PoblacionesBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Poblaciones );
end;

procedure Tform_poblaciones_000.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_Poblaciones.SQLConnector,
                      DataModule_Poblaciones.SQLTransaction,
                      SQLQuery_Poblaciones ) = false then UTI_GEN_Salir;

    DataModule_Poblaciones.Free;
end;

procedure Tform_poblaciones_000.Cerramos_Tablas_Ligadas;
begin
{ ESTE form NO TIENE TABLAS LIGADAS

    if UTI_TB_Cerrar( DataModule_del_form_000.SQLConnector_de_la_tabla,
                      DataModule_Users.SQLTransaction_de_la_tabla,
                      SQLQuery_la_tabla ) = false then UTI_GEN_Salir;
}
end;

procedure Tform_poblaciones_000.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    If public_Elegimos then
         Seleccionado_Rgtro
    else Editar_Registro;
end;

procedure Tform_poblaciones_000.DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    UTI_GEN_Dibujar_Grid( Sender, SQLQuery_Poblaciones, Rect, DataCol, Column, State );
end;

procedure Tform_poblaciones_000.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_poblaciones_000.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then
    begin
        If public_Elegimos then
             Seleccionado_Rgtro
        else Editar_Registro;
    end;
end;

procedure Tform_poblaciones_000.Seleccionado_Rgtro;
begin
    private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    public_Rgtro_Seleccionado := true;
    Close;
end;

procedure Tform_poblaciones_000.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

procedure Tform_poblaciones_000.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure Tform_poblaciones_000.BitBtn_SeleccionarClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
end;

procedure Tform_poblaciones_000.DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
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
                UTI_RGTRO_Borrar( 'poblaciones',
                                  SQLQuery_Poblaciones,
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

procedure Tform_poblaciones_000.Insertar_Registro;
var var_msg        : TStrings;
    var_formulario : Tform_poblaciones_001;
begin
    with SQLQuery_Poblaciones do
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

                    var_formulario := Tform_poblaciones_001.Create(nil);

                    var_formulario.para_Empezar;

                    var_formulario.ShowModal;
                    if var_formulario.public_Pulso_Aceptar = true then
                        begin
                            FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
                            FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                            UTI_RGTRO_Grabar_Antes( 'poblaciones',
                                                    SQLQuery_Poblaciones );
                        end
                    else Cancel;

                    var_formulario.Free;
                end;
        end;

        var_msg.Free;
    end;
end;

procedure Tform_poblaciones_000.BitBtn_ImprimirClick(Sender: TObject);
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

    if Trim(Edit_Descripcion_id_paises.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con país = ' +
                            Trim(Edit_Descripcion_id_paises.Text);
    end;

    if Trim(Edit_Descripcion_id_provincias.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con provincia = ' +
                            Trim(Edit_Descripcion_id_provincias.Text);
    end;

    // ********************************************************************************************* //
    // ** Configuramos la llamada al generador de informes                                        ** //
    // ********************************************************************************************* //
    var_Ficheros := TStringList.Create;

    UTI_GEN_Informes( var_Ordenado_por,
                      SQLQuery_Poblaciones,
                      DataSource_Poblaciones,
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

procedure Tform_poblaciones_000.no_Tocar;
begin
    BitBtn_Imprimir.Enabled := False;
end;

procedure Tform_poblaciones_000.Presentar_Datos;
begin
     /// guardar por lo que pueda pasar
end;

procedure Tform_poblaciones_000.BitBtn_FiltrarClick(Sender: TObject);
begin
    if PageControl_Filtros.ActivePage = TabSheet_Busqueda_Concreta then
    begin
        Filtrar_Principal_Sin_Preguntar;
    end else begin
        RadioGroup_Bajas.ItemIndex := Filtrar_Principal( true );
    end;
end;

function Tform_poblaciones_000.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
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
        var_SQL_ADD.Add( 'pb.descripcion LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Descripcion.Text) + '%') );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la id del pais                                                     ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_paises.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pb.id_paises = ' + Trim(Edit_id_paises.Text) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la id_provincias                                                   ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_provincias.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pb.id_provincias = ' + Trim(Edit_id_provincias.Text) );
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
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Poblaciones,
                                                            'poblaciones',
                                                            'u' ),
                              // Insert_SQL,
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Poblaciones,
                                                            'poblaciones',
                                                            'i' ),
                              // var_ctdad_Rgtros,
                              -1,

                              DataModule_Poblaciones.SQLTransaction,
                              DataModule_Poblaciones.SQLConnector,
                              SQLQuery_Poblaciones,

                              // name_tabla,
                              'pb',

                              RadioGroup_Bajas.ItemIndex,

                              // SELECT_SQL,
                              'SELECT pb.*,' + ' ' +
                                     'pr.descripcion AS OT_descripcion_provincia,' + ' ' +
                                     'ps.descripcion AS OT_descripcion_pais' + ' ' +
                              'FROM poblaciones AS pb' + ' ' +

                              'LEFT JOIN provincias AS pr' + ' ' +
                              'ON pb.id_provincias = pr.id' + ' ' +

                              'LEFT JOIN paises AS ps' + ' ' +
                              'ON pb.id_paises = ps.id' + ' ',

                              Memo_Filtros.Lines,
                              Memo_OrderBy.Lines,
                              var_a_Filtrar,

                              param_Cambiamos_Filtro,
                              false,   // param_ver_SQL_despues_Abrir : Boolean;
                              true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

    var_a_Filtrar.Free;

    Label_Ctdad_Rgtros.Caption := IntToStr(SQLQuery_Poblaciones.RecordCount);

    //Filtrar_tablas_ligadas;
    var_SQL_ADD.Free;
end;

procedure Tform_poblaciones_000.BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if SQLQuery_Poblaciones.RecordCount > 0 then UTI_RGTRO_Ver_Estado_Registro( 'poblaciones',
                                                                                    SQLQuery_Poblaciones,
                                                                                    DataSource_Poblaciones,
                                                                                    DBGrid_Principal );
    end;
end;

procedure Tform_poblaciones_000.FormCreate(Sender: TObject);
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

procedure Tform_poblaciones_000.para_Empezar;
begin
  { ****************************************************************************
    Solo para formularios que traten con datos
    **************************************************************************** }
    if UTI_GEN_Form_Abierto_Ya('DataModule_Poblaciones') = False then
    begin
        DataModule_Poblaciones := TDataModule_Poblaciones.Create(Application);
    end;

  { ****************************************************************************
    Preparamos los diferentes tipos de orden preconfigurados
    **************************************************************************** }
    SetLength(private_Order_By, 3);

    private_Order_By[0].Titulo       := 'Por la descripción'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[0].Memo_OrderBy := 'pb.descripcion ASC';

    private_Order_By[1].Titulo       := 'Por provincia + país + descripción'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[1].Memo_OrderBy := 'pb.id_provincias ASC, pb.id_paises ASC, pr.descripcion ASC';

    private_Order_By[2].Titulo       := 'Por la id';
    private_Order_By[2].Memo_OrderBy := 'pb.id ASC';

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

procedure Tform_poblaciones_000.SQLQuery_PoblacionesBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Poblaciones );
end;

procedure Tform_poblaciones_000.Editar_Registro;
var var_msg        : TStrings;
    var_formulario : Tform_poblaciones_001;
    var_id         : ShortString;
begin
    with SQLQuery_Poblaciones do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
            begin
                var_id := FieldByName('id').AsString;

                if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
                begin
                    if UTI_RGTRO_isLock( 'poblaciones',
                                         FieldByName('id').AsString,
                                         true ) = true then
                        begin
                            Exit;
                        end
                    else
                        begin
                            if UTI_RGTRO_Lock( 'poblaciones',
                                               FieldByName('id').AsString ) = true then
                                 Edit
                            else Exit;
                        end;

                    var_formulario := Tform_poblaciones_001.Create(nil);
                    // Application.CreateForm(Tform_poblaciones_001, form_poblaciones_001);

                    var_formulario.public_Menu_Worked := public_Menu_Worked;

                    if public_Solo_Ver = true then
                    begin
                        var_formulario.public_Solo_Ver := true;
                    end;

                    var_formulario.para_Empezar;

                    var_formulario.ShowModal;
                    if var_formulario.public_Pulso_Aceptar = true then
                        begin
                            if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( SQLQuery_Poblaciones ) = true then
                               begin
                                    FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                                    FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                                    UTI_RGTRO_Grabar_Antes( 'poblaciones',
                                                            SQLQuery_Poblaciones );
                               end
                            else Cancel;
                        end
                    else Cancel;

                    var_formulario.Free;

                    UTI_RGTRO_UnLock( 'poblaciones',
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

procedure Tform_poblaciones_000.Filtrar_Principal_Sin_Preguntar;
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

procedure Tform_poblaciones_000.Boton_Elegir_id_paisesClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Paises( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_paises.Text             := Trim(var_Registro.id_1);
        Edit_Descripcion_id_paises.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_poblaciones_000.Boton_Elegir_id_provinciasClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Provincias( true, false, 100, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_provincias.Text             := Trim(var_Registro.id_1);
        Edit_Descripcion_id_provincias.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_poblaciones_000.ComboBox_FiltrosChange(Sender: TObject);
begin
    Memo_OrderBy.Lines.Clear;
    Memo_OrderBy.Lines.Add( private_Order_By[ComboBox_Filtros.ItemIndex].Memo_OrderBy );
    BitBtn_FiltrarClick(Nil);
end;

procedure Tform_poblaciones_000.Edit_Descripcion_id_paisesClick(Sender: TObject);
begin
    Edit_id_paises.Text             := '';
    Edit_Descripcion_id_paises.Text := '';
end;

procedure Tform_poblaciones_000.Edit_Descripcion_id_provinciasClick(Sender: TObject);
begin
    Edit_id_provincias.Text             := '';
    Edit_Descripcion_id_provincias.Text := '';
end;

end.


