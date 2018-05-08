unit clientes_004;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs,
    DBGrids, DbCtrls, utilidades_rgtro, utilidades_general, utilidades_bd,
    Buttons, StdCtrls, ExtCtrls, Grids, ComCtrls, utilidades_datos_tablas;

type

    { Tform_clientes_004 }

    Tform_clientes_004 = class(TForm)
      BitBtn_Filtrar: TBitBtn;
      BitBtn_SALIR: TBitBtn;
      BitBtn_Seleccionar: TBitBtn;
        DataSource_Clientes_Contactos: TDataSource;
        DBGrid_Principal: TDBGrid;
        DBNavigator1: TDBNavigator;
        Edit_Descripcion: TEdit;
        Edit_id: TEdit;
        Edit_Nombre: TEdit;
        Label1: TLabel;
        Label6: TLabel;
        Label7: TLabel;
        Label8: TLabel;
        Memo_Filtros: TMemo;
        Memo_OrderBy: TMemo;
        PageControl_Filtros: TPageControl;
        RadioGroup_Bajas: TRadioGroup;

        SQLQuery_Clientes_Contactos: TSQLQuery;
        SQLQuery_Clientes_ContactosCargo_Puesto: TStringField;
        SQLQuery_Clientes_ContactosChange_Id_User: TLargeintField;
        SQLQuery_Clientes_ContactosChange_WHEN: TDateTimeField;
        SQLQuery_Clientes_ContactosDel_Id_User: TLargeintField;
        SQLQuery_Clientes_ContactosDel_WHEN: TDateTimeField;
        SQLQuery_Clientes_ContactosDel_WHY: TStringField;
        SQLQuery_Clientes_ContactoseMail: TStringField;
        SQLQuery_Clientes_ContactosFAX: TStringField;
        SQLQuery_Clientes_ContactosFecha_Nacimiento: TDateTimeField;
        SQLQuery_Clientes_Contactosid: TLargeintField;
        SQLQuery_Clientes_Contactosid_clientes: TLargeintField;
        SQLQuery_Clientes_ContactosInsert_Id_User: TLargeintField;
        SQLQuery_Clientes_ContactosInsert_WHEN: TDateTimeField;
        SQLQuery_Clientes_ContactosMovil: TStringField;
        SQLQuery_Clientes_Contactosnif_cif: TStringField;
        SQLQuery_Clientes_Contactosnombre: TStringField;
        SQLQuery_Clientes_ContactosOT_todos_los_Tfnos1: TStringField;
        SQLQuery_Clientes_Contactospagina_web: TStringField;
        SQLQuery_Clientes_ContactosTfno_Fijo_1: TStringField;
        SQLQuery_Clientes_ContactosTfno_Fijo_2: TStringField;
        TabSheet_Busqueda_Concreta: TTabSheet;
        TabSheet_Filtros_Generales: TTabSheet;

        procedure Filtrar_Principal_Sin_Preguntar;
        procedure Obligar_como_Filtrado_Principal;
        procedure Presentar_Datos;
        procedure BitBtn_FiltrarClick(Sender: TObject);
        procedure no_Tocar;
        procedure BitBtn_SeleccionarClick(Sender: TObject);
        procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
        procedure Seleccionado_Rgtro;
        procedure DBGrid_PrincipalCellClick(Column: TColumn);
        procedure DBGrid_PrincipalDblClick(Sender: TObject);
        procedure DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
        procedure DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
        function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
        procedure Filtrar_tablas_ligadas;
        procedure Refrescar_Registros;
        procedure Cerramos_Tablas_Ligadas;
        procedure Cerramos_Tablas;
        procedure BitBtn_SALIRClick(Sender: TObject);
        procedure FormActivate(Sender: TObject);
        procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
        procedure FormCreate(Sender: TObject);
        procedure FormDestroy(Sender: TObject);
        procedure para_Empezar;
        procedure SQLQuery_Clientes_ContactosAfterPost(DataSet: TDataSet);
        procedure SQLQuery_Clientes_ContactosAfterScroll(DataSet: TDataSet);
        procedure SQLQuery_Clientes_ContactosBeforePost(DataSet: TDataSet);
        procedure SQLQuery_Clientes_ContactosCalcFields(DataSet: TDataSet);

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
    form_clientes_004: Tform_clientes_004;

implementation

{$R *.lfm}

uses menu, dm_cliente_elegir_contacto;

{ Tform_clientes_004 }

procedure Tform_clientes_004.FormActivate(Sender: TObject);
begin
    If public_Elegimos = true then
    begin
        BitBtn_Seleccionar.Visible := True;

        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    if public_Solo_Ver = true then no_Tocar;
end;

procedure Tform_clientes_004.FormClose(Sender: TObject; var CloseAction: TCloseAction);
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
        if form_Menu.public_Salir_OK = False then CloseAction := CloseAction.caNone;
    end else begin
        // ***************************************************************************************** //
        // ** Fue correcto el modo como quiere BitBtn_SALIR de la aplicación                      ** //
        // ***************************************************************************************** //
    end;
end;

procedure Tform_clientes_004.FormCreate(Sender: TObject);
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

procedure Tform_clientes_004.FormDestroy(Sender: TObject);
begin
    Cerramos_Tablas;
end;

procedure Tform_clientes_004.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_clientes_004.para_Empezar;
begin
    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    if UTI_GEN_Form_Abierto_Ya('DataModule_Cliente_Elegir_Contacto') = False then
    begin
        DataModule_Cliente_Elegir_Contacto := TDataModule_Cliente_Elegir_Contacto.Create(Application);
    end;

    // ********************************************************************************************* //
    // ** Preparamos los diferentes tipos de orden preconfigurados                                ** //
    // ********************************************************************************************* //
    // CLIENTES CONTACTOS
    SetLength(private_Order_By, 1);

    private_Order_By[0].Titulo       := 'Por nombre'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[0].Memo_OrderBy := 'cc.id_clientes ASC, cc.nombre ASC';

    Memo_OrderBy.Lines.Text := private_Order_By[0].Memo_OrderBy;

    Obligar_como_Filtrado_Principal;

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

procedure Tform_clientes_004.SQLQuery_Clientes_ContactosAfterPost(DataSet: TDataSet);
begin
    UTI_RGTRO_Grabar( 'clientes_contactos',
                      DataModule_Cliente_Elegir_Contacto.SQLTransaction_CliContactos,
                      SQLQuery_Clientes_Contactos );

    Refrescar_Registros;
end;

procedure Tform_clientes_004.SQLQuery_Clientes_ContactosAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure Tform_clientes_004.SQLQuery_Clientes_ContactosBeforePost(DataSet: TDataSet);
begin
    UTI_RGTRO_param_assign_value( SQLQuery_Clientes_Contactos );
end;

procedure Tform_clientes_004.SQLQuery_Clientes_ContactosCalcFields(DataSet: TDataSet);
begin
    with SQLQuery_Clientes_Contactos do
    begin
        // TELEFONOS
        FieldByName('OT_todos_los_Tfnos').AsString := '';

        if Trim(FieldByName('Tfno_Fijo_1').AsString) <> '' then
        begin
            if Trim(FieldByName('OT_todos_los_Tfnos').AsString) <> '' then
            begin
                FieldByName('OT_todos_los_Tfnos').AsString :=
                      Trim(FieldByName('OT_todos_los_Tfnos').AsString) + ', ';
            end;

            FieldByName('OT_todos_los_Tfnos').AsString :=
                  Trim(FieldByName('OT_todos_los_Tfnos').AsString) + ' ' +
                  Trim(FieldByName('Tfno_Fijo_1').AsString);
        end;

        if Trim(FieldByName('Tfno_Fijo_2').AsString) <> '' then
        begin
            if Trim(FieldByName('OT_todos_los_Tfnos').AsString) <> '' then
            begin
                FieldByName('OT_todos_los_Tfnos').AsString :=
                      Trim(FieldByName('OT_todos_los_Tfnos').AsString) + ', ';
            end;

            FieldByName('OT_todos_los_Tfnos').AsString :=
                  Trim(FieldByName('OT_todos_los_Tfnos').AsString) + ' ' +
                  Trim(FieldByName('Tfno_Fijo_2').AsString);
        end;

        if Trim(FieldByName('Movil').AsString) <> '' then
        begin
            if Trim(FieldByName('OT_todos_los_Tfnos').AsString) <> '' then
            begin
                FieldByName('OT_todos_los_Tfnos').AsString :=
                      Trim(FieldByName('OT_todos_los_Tfnos').AsString) + ', ';
            end;

            FieldByName('OT_todos_los_Tfnos').AsString :=
                  Trim(FieldByName('OT_todos_los_Tfnos').AsString) + ' ' +
                  Trim(FieldByName('Movil').AsString);
        end;
    end;
end;

procedure Tform_clientes_004.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_Cliente_Elegir_Contacto.SQLConnector_CliContactos,
                      DataModule_Cliente_Elegir_Contacto.SQLTransaction_CliContactos,
                      SQLQuery_Clientes_Contactos ) = false then UTI_GEN_Salir;

    DataModule_Cliente_Elegir_Contacto.Free;
end;

procedure Tform_clientes_004.Cerramos_Tablas_Ligadas;
begin
{ ESTE form NO TIENE TABLAS LIGADAS

    if UTI_TB_Cerrar( DataModule_del_form_000.SQLConnector_de_la_tabla,
                      DataModule_Users.SQLTransaction_de_la_tabla,
                      SQLQuery_la_tabla ) = false then UTI_GEN_Salir;
}
end;

procedure Tform_clientes_004.Refrescar_Registros;
var var_nombre : String;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_nombre := '';

    if SQLQuery_Clientes_Contactos.RecordCount > 0 then
    begin
        var_nombre := SQLQuery_Clientes_Contactos.FieldByName('nombre').asString;
    end;

    Filtrar_Principal_Sin_Preguntar;

    if Trim(var_nombre) <> '' then
    begin
         SQLQuery_Clientes_Contactos.Locate('nombre', var_nombre, []);
    end;
end;

procedure Tform_clientes_004.Filtrar_tablas_ligadas;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
begin
    if SQLQuery_Clientes_Contactos.RecordCount = 0 then Exit;

    if SQLQuery_Clientes_Contactos.State = dsInsert then
    begin
        Cerramos_Tablas_Ligadas;
        Exit;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    // ********************************************************************************************* //
    // ** NO HAY TABLAS LIGADAS                                                                   ** //
    // ********************************************************************************************* //

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;
end;

function Tform_clientes_004.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
var var_Registro_CRUD : TRegistro_CRUD;
    var_ctdad_Rgtros  : Integer;
    var_a_Filtrar     : TStrings;
begin
    var_a_Filtrar := TStringList.Create;
    var_a_Filtrar.Clear;

    var_Registro_CRUD := UTI_DATOS_TABLA_Elegir_Cliente_Contacto_CRUD;
    var_ctdad_Rgtros  := -1;

    Obligar_como_Filtrado_Principal;

    // ********************************************************************************************* //
    // ** AHORA PONDREMOS EL RESTO DE LOS FILTROS QUE NO SON GENERALES                            ** //
    // ********************************************************************************************* //
    // ** Primero buscaremos en el nombre y apellido el texto a buscar                              ** //
    // ********************************************************************************************* //
    if Trim(Edit_Descripcion.Text) <> '' then
    begin
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'cc.nombre LIKE ' +
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
                              DataModule_Cliente_Elegir_Contacto.SQLTransaction_CliContactos,
                              DataModule_Cliente_Elegir_Contacto.SQLConnector_CliContactos,
                              SQLQuery_Clientes_Contactos,

                              var_Registro_CRUD.name_tabla,
                              RadioGroup_Bajas.ItemIndex,

                              var_Registro_CRUD.SELECT_SQL,

                              Memo_Filtros.Lines,
                              Memo_OrderBy.Lines,
                              var_a_Filtrar.Text,

                              param_Cambiamos_Filtro );

    var_a_Filtrar.Free;

    //Filtrar_tablas_ligadas;
end;

procedure Tform_clientes_004.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    If public_Elegimos then Seleccionado_Rgtro;
end;

procedure Tform_clientes_004.DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    UTI_GEN_Dibujar_Grid( Sender, SQLQuery_Clientes_Contactos, Rect, DataCol, Column, State );
end;

procedure Tform_clientes_004.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then
    begin
        If public_Elegimos then Seleccionado_Rgtro;
    end;
end;

procedure Tform_clientes_004.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

procedure Tform_clientes_004.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure Tform_clientes_004.Seleccionado_Rgtro;
begin
    private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    public_Rgtro_Seleccionado := true;
    Close;
end;

procedure Tform_clientes_004.BitBtn_SeleccionarClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
end;

procedure Tform_clientes_004.DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
begin
    //Filtrar_tablas_ligadas;

    case Button of
        nbRefresh : begin
            Refrescar_Registros;
            Abort;
        end;
    end;
end;

procedure Tform_clientes_004.no_Tocar;
begin
    // No hay nada para no tocar
end;

procedure Tform_clientes_004.BitBtn_FiltrarClick(Sender: TObject);
begin
    if PageControl_Filtros.ActivePage = TabSheet_Busqueda_Concreta then
    begin
        Filtrar_Principal_Sin_Preguntar;
    end else begin
        RadioGroup_Bajas.ItemIndex := Filtrar_Principal( true );
    end;
end;

procedure Tform_clientes_004.Presentar_Datos;
begin
    // No hay nada para presentar
end;

procedure Tform_clientes_004.Obligar_como_Filtrado_Principal;
begin
    UTI_RGTRO_Add_to_Where( true,
                            Memo_Filtros.Lines,
                            'cc.id_clientes = ' + Edit_id.Text );
end;

procedure Tform_clientes_004.Filtrar_Principal_Sin_Preguntar;
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

end.


