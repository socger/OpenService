unit informes_000;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  StdCtrls, Buttons, DBGrids, DbCtrls, Grids, variants, utilidades_bd, utilidades_general,
  utilidades_rgtro, utilidades_usuarios, utilidades_datos_tablas, utilidades_forms_Filtrar;

type

  { Tform_informes_000 }

  Tform_informes_000 = class(TForm)
    BitBtn_Filtrar: TBitBtn;
    BitBtn_Imprimir: TBitBtn;
    BitBtn_SALIR: TBitBtn;
    BitBtn_Seleccionar: TBitBtn;
    BitBtn_Ver_Situacion_Registro: TBitBtn;
    Boton_Elegir_id_menus: TBitBtn;
    ComboBox_Filtros: TComboBox;
    DataSource_Informes: TDataSource;
    DBEdit_nombre_fichero: TDBEdit;
    DBGrid_Principal: TDBGrid;
    DBNavigator1: TDBNavigator;
    Edit_Nombre_Fichero: TEdit;
    Edit_Descripcion_id_menus: TEdit;
    Edit_id_menus: TEdit;
    Edit_Descripcion: TEdit;
    Image_Confirmado: TImage;
    Label49: TLabel;
    Label5: TLabel;
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
    SQLQuery_Informes: TSQLQuery;
    SQLQuery_InformesChange_Id_User: TLargeintField;
    SQLQuery_InformesChange_WHEN: TDateTimeField;
    SQLQuery_InformesDel_Id_User: TLargeintField;
    SQLQuery_InformesDel_WHEN: TDateTimeField;
    SQLQuery_InformesDel_WHY: TStringField;
    SQLQuery_Informesdescripcion: TStringField;
    SQLQuery_Informesid: TLargeintField;
    SQLQuery_Informesid_menus: TLargeintField;
    SQLQuery_InformesInsert_Id_User: TLargeintField;
    SQLQuery_InformesInsert_WHEN: TDateTimeField;
    SQLQuery_Informesnombre_fichero: TStringField;
    SQLQuery_InformesOT_Descripcion_Menu: TStringField;
    TabSheet_Busqueda_Concreta: TTabSheet;
    TabSheet_Filtros_Generales: TTabSheet;

    procedure Boton_Elegir_id_menusClick(Sender: TObject);
    procedure ComboBox_FiltrosChange(Sender: TObject);
    procedure Edit_Descripcion_id_menusClick(Sender: TObject);
    procedure para_Empezar;
    procedure BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Presentar_Datos;
    procedure Filtrar_tablas_ligadas;
    function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
    procedure Filtrar_Principal_Sin_Preguntar;
    procedure Refrescar_Registros;
    procedure Insertar_Registro;
    procedure Editar_Registro;
    procedure no_Tocar;
    procedure BitBtn_ImprimirClick(Sender: TObject);
    procedure BitBtn_SeleccionarClick(Sender: TObject);
    procedure DBGrid_PrincipalCellClick(Column: TColumn);
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure Seleccionado_Rgtro;
    procedure BitBtn_FiltrarClick(Sender: TObject);
    procedure BitBtn_SALIRClick(Sender: TObject);
    procedure Cerramos_Tablas;
    procedure Cerramos_Tablas_Ligadas;
    procedure DBGrid_PrincipalDblClick(Sender: TObject);
    procedure DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure RadioGroup_BajasClick(Sender: TObject);
    procedure SQLQuery_InformesAfterPost(DataSet: TDataSet);
    procedure SQLQuery_InformesAfterScroll(DataSet: TDataSet);
    procedure SQLQuery_InformesBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_InformesBeforePost(DataSet: TDataSet);

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
  form_informes_000: Tform_informes_000;

implementation

{$R *.lfm}

uses dm_informes, menu, informes_001;

{ Tform_informes_000 }

procedure TForm_informes_000.FormActivate(Sender: TObject);
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

procedure TForm_informes_000.no_Tocar;
begin
    BitBtn_Imprimir.Enabled := False;
end;

procedure TForm_informes_000.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure TForm_informes_000.BitBtn_FiltrarClick(Sender: TObject);
begin
    if PageControl_Filtros.ActivePage = TabSheet_Busqueda_Concreta then
    begin
        Filtrar_Principal_Sin_Preguntar;
    end else begin
        RadioGroup_Bajas.ItemIndex := Filtrar_Principal( true );
    end;
end;

procedure TForm_informes_000.RadioGroup_BajasClick(Sender: TObject);
begin
    Refrescar_Registros;
end;

procedure TForm_informes_000.ComboBox_FiltrosChange(Sender: TObject);
begin
    Memo_OrderBy.Lines.Clear;
    Memo_OrderBy.Lines.Add( private_Order_By[ComboBox_Filtros.ItemIndex].Memo_OrderBy );
    BitBtn_FiltrarClick(Nil);
end;

procedure TForm_informes_000.FormClose(Sender: TObject; var CloseAction: TCloseAction);
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
             CloseAction := CloseAction.caNone;
         end;
    end else begin
        // ***************************************************************************************** //
        // ** Fue correcto el modo como quiere BitBtn_SALIR de la aplicación                      ** //
        // ***************************************************************************************** //
    end;
end;

procedure TForm_informes_000.FormCreate(Sender: TObject);
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

procedure TForm_informes_000.FormDestroy(Sender: TObject);
begin
    Cerramos_Tablas;
end;

procedure TForm_informes_000.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_Informes.SQLConnector_Informes,
                      DataModule_Informes.SQLTransaction_Informes,
                      SQLQuery_Informes ) = false then UTI_GEN_Salir;

    DataModule_Informes.Free;
end;

procedure TForm_informes_000.Cerramos_Tablas_Ligadas;
begin
    // ********************************************************************************************* //
    // ** ESTE form NO TIENE TABLAS LIGADAS                                                       ** //
    // ********************************************************************************************* //
end;

procedure TForm_informes_000.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    If public_Elegimos then
         Seleccionado_Rgtro
    else Editar_Registro;
end;

procedure TForm_informes_000.DBGrid_PrincipalDrawColumnCell( Sender: TObject;
                                                             const Rect: TRect;
                                                             DataCol: Integer;
                                                             Column: TColumn;
                                                             State: TGridDrawState );
begin
    UTI_GEN_Dibujar_Grid( Sender, SQLQuery_Informes, Rect, DataCol, Column, State );
end;

procedure TForm_informes_000.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then
    begin
        If public_Elegimos then
             Seleccionado_Rgtro
        else Editar_Registro;
    end;
end;

procedure TForm_informes_000.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

procedure TForm_informes_000.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure TForm_informes_000.Seleccionado_Rgtro;
begin
    private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    public_Rgtro_Seleccionado := true;
    Close;
end;

procedure TForm_informes_000.SQLQuery_InformesAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure TForm_informes_000.SQLQuery_InformesBeforePost(DataSet: TDataSet);
begin
    UTI_RGTRO_param_assign_value( SQLQuery_Informes );
end;

procedure TForm_informes_000.SQLQuery_InformesAfterPost(DataSet: TDataSet);
begin
    UTI_RGTRO_Grabar( 'informes',
                      DataModule_Informes.SQLTransaction_Informes,
                      SQLQuery_Informes );

    Refrescar_Registros;
end;

procedure TForm_informes_000.SQLQuery_InformesBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTRO_param_assign_value_Edit( SQLQuery_Informes );
end;

procedure TForm_informes_000.DBNavigator1BeforeAction(Sender: TObject;
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
                UTI_RGTRO_Borrar( 'informes',
                                  SQLQuery_Informes,
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

procedure TForm_informes_000.BitBtn_SeleccionarClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
end;

procedure TForm_informes_000.BitBtn_ImprimirClick(Sender: TObject);
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

    if Trim(Edit_Nombre_Fichero.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con nombre de fichero %' +
                            Trim(Edit_Nombre_Fichero.Text) + '%';
    end;

    if Trim(Edit_Descripcion_id_menus.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con módulo = ' +
                            Trim(Edit_Descripcion_id_menus.Text);
    end;

    if Trim(Edit_Descripcion.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            ', con descripción = %' +
                            Trim(Edit_Descripcion.Text) + '%';
    end;

    // ********************************************************************************************* //
    // ** Configuramos la llamada al generador de informes                                        ** //
    // ********************************************************************************************* //
    var_Ficheros := TStringList.Create;

    UTI_GEN_Informes( var_Ordenado_por,
                      SQLQuery_Informes,
                      DataSource_Informes,
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

procedure TForm_informes_000.Presentar_Datos;
begin
     /// guardar por lo que pueda pasar
end;

procedure TForm_informes_000.BitBtn_Ver_Situacion_RegistroClick( Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if SQLQuery_Informes.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'informes', SQLQuery_Informes, DataSource_Informes, DBGrid_Principal );
        end;
    end;
end;

procedure TForm_informes_000.para_Empezar;
begin
    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    if UTI_GEN_Form_Abierto_Ya('DataModule_Informes') = False then
    begin
        DataModule_Informes := TDataModule_Informes.Create(Application);
    end;

    // ********************************************************************************************* //
    // ** Preparamos los diferentes tipos de orden preconfigurados                                ** //
    // ********************************************************************************************* //
    SetLength(private_Order_By, 5);

    private_Order_By[0].Titulo       := 'Por el nombre de fichero'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[0].Memo_OrderBy := 'i.nombre_fichero ASC';

    private_Order_By[1].Titulo       := 'Por el módulo + nombre de fichero';
    private_Order_By[1].Memo_OrderBy := 'i.id_menus ASC, i.nombre_fichero ASC';

    private_Order_By[2].Titulo       := 'Por la descripción'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[2].Memo_OrderBy := 'i.descripcion ASC';

    private_Order_By[3].Titulo       := 'Por el módulo + descripción';
    private_Order_By[3].Memo_OrderBy := 'i.id_menus ASC, i.descripcion ASC';

    private_Order_By[4].Titulo       := 'Por la id';
    private_Order_By[4].Memo_OrderBy := 'i.id ASC';

    Memo_OrderBy.Lines.Text          := private_Order_By[3].Memo_OrderBy;

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

procedure TForm_informes_000.Filtrar_tablas_ligadas;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
begin
    if SQLQuery_Informes.RecordCount = 0 then
    begin
        Exit;
    end;

    if SQLQuery_Informes.State = dsInsert then
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

procedure TForm_informes_000.Refrescar_Registros;
var var_nombre_fichero : String;
    var_id_menus       : Integer;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_nombre_fichero := '';
    var_id_menus       := 0;

    if SQLQuery_Informes.RecordCount > 0 then
    begin
        var_nombre_fichero := SQLQuery_Informes.FieldByName('nombre_fichero').Value;
        var_id_menus       := SQLQuery_Informes.FieldByName('id_menus').Value;
    end;

    Filtrar_Principal_Sin_Preguntar;

    if Trim(var_nombre_fichero) <> '' then
    begin
         SQLQuery_Informes.Locate( 'nombre_fichero;id_menus',
                                VarArrayOf( [ var_nombre_fichero, var_id_menus ] ),
                                [] );
    end;
end;

function TForm_informes_000.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
var var_Registro_CRUD : TRegistro_CRUD;
    var_ctdad_Rgtros  : Integer;
    var_a_Filtrar     : TStrings;
begin
    var_a_Filtrar := TStringList.Create;
    var_a_Filtrar.Clear;

    var_Registro_CRUD := UTI_DATOS_TABLA_Informes_CRUD;
    var_ctdad_Rgtros  := -1;

    // ********************************************************************************************* //
    // ** AHORA PONDREMOS EL RESTO DE LOS FILTROS QUE NO SON GENERALES                            ** //
    // ********************************************************************************************* //
    // ** Primero buscaremos en el nombre y apellido el texto a buscar                              ** //
    // ********************************************************************************************* //
    if Trim(Edit_Nombre_Fichero.Text) <> '' then
    begin
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'i.nombre_fichero LIKE ' +
                                UTI_GEN_Comillas('%' + Trim(Edit_Nombre_Fichero.Text) + '%') );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por el medio                                                           ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_menus.Text) <> '' then
    begin
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'i.id_menus = ' + Trim(Edit_id_menus.Text) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la descripción                                                     ** //
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
                              DataModule_Informes.SQLTransaction_Informes,
                              DataModule_Informes.SQLConnector_Informes,
                              SQLQuery_Informes,

                              var_Registro_CRUD.name_tabla,
                              RadioGroup_Bajas.ItemIndex,

                              var_Registro_CRUD.SELECT_SQL,
                              // var_SQL_ORDER_BY,

                              Memo_Filtros.Lines,
                              Memo_OrderBy.Lines,
                              var_a_Filtrar.Text,

                              param_Cambiamos_Filtro );

    var_a_Filtrar.Free;

    Label_Ctdad_Rgtros.Caption := IntToStr(SQLQuery_Informes.RecordCount);

    //Filtrar_tablas_ligadas;
end;

procedure TForm_informes_000.Filtrar_Principal_Sin_Preguntar;
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

procedure Tform_informes_000.Edit_Descripcion_id_menusClick(Sender: TObject);
begin
    Edit_id_menus.Text             := '';
    Edit_Descripcion_id_menus.Text := '';
end;

procedure TForm_informes_000.Boton_Elegir_id_menusClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Form( true, true, '', 40 );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_menus.Text             := Trim(var_Registro.id_1);
        Edit_Descripcion_id_menus.Text := var_Registro.descripcion_1;
    end;
end;

procedure TForm_informes_000.Insertar_Registro;
var var_msg        : TStrings;
    var_formulario : TForm_informes_001;
begin
    with SQLQuery_Informes do
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

                var_formulario := TForm_informes_001.Create(nil);

                var_formulario.para_Empezar;

                var_formulario.ShowModal;
                if var_formulario.public_Pulso_Aceptar = true then
                    begin
                        FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
                        FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                        UTI_RGTRO_Grabar_Antes( 'informes', SQLQuery_Informes );
                    end
                else Cancel;

                var_formulario.Free;
            end;
        end;

        var_msg.Free;
    end;
end;

procedure TForm_informes_000.Editar_Registro;
var var_msg        : TStrings;
    var_formulario : TForm_informes_001;
    var_id         : ShortString;
begin
    with SQLQuery_Informes do
    begin
        if RecordCount > 0 then
        begin
            if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
            begin
                var_id := FieldByName('id').AsString;

                if UTI_RGTRO_isLock( 'informes',
                                     var_id,
                                     true ) = true then
                begin
                    Exit;
                end else begin
                    if UTI_RGTRO_Lock( 'informes',
                                       var_id ) = true then
                         Edit
                    else Exit;
                end;

                var_formulario := TForm_informes_001.Create(nil);
                // Application.CreateForm(tForm_informes_001, Form_informes_001);

                var_formulario.public_Menu_Worked := public_Menu_Worked;

                if public_Solo_Ver = true then
                begin
                    var_formulario.public_Solo_Ver := true;
                end;

                var_formulario.para_Empezar;
                var_formulario.ShowModal;
                if var_formulario.public_Pulso_Aceptar = true then
                begin
                     if ( Trim(Params.ParamByName('COPY_' + 'nombre_fichero').AsString) <> Trim(FieldByName('nombre_fichero').AsString) ) or
                        ( Trim(Params.ParamByName('COPY_' + 'descripcion').AsString)    <> Trim(FieldByName('descripcion').AsString) )    or
                        ( Trim(Params.ParamByName('COPY_' + 'id_menus').AsString)       <> Trim(FieldByName('id_menus').AsString) )       then
                     begin
                         FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                         FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                         UTI_RGTRO_Grabar_Antes( 'informes', SQLQuery_Informes );
                     end else begin
                         Cancel;
                     end;
                end else begin
                    Cancel;
                end;

                var_formulario.Free;

                UTI_RGTRO_UnLock( 'informes', var_id );
            end;
        end else begin
            var_msg := TStringList.Create;
            var_msg.Add(rs_no_Hay_Rgtros);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            var_msg.Free;
        end;
    end;
end;

end.

