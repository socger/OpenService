unit utilidades_000;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  DBGrids, DbCtrls, Buttons, ExtCtrls, Grids, utilidades_bd, utilidades_general,
  utilidades_datos_tablas, utilidades_rgtro;

type

  { Tform_utilidades_000 }

  Tform_utilidades_000 = class(TForm)
    BitBtn_Filtrar: TBitBtn;
    BitBtn_SALIR: TBitBtn;
    BitBtn_Ejecutar: TBitBtn;
    Boton_Add_All: TBitBtn;
    Boton_Add_One: TBitBtn;
    Boton_Del_All: TBitBtn;
    Boton_Del_One: TBitBtn;
    ComboBox_Filtros: TComboBox;
    DataSource_Tablas: TDataSource;
    DBGrid_Principal: TDBGrid;
    DBNavigator1: TDBNavigator;
    Edit_Descripcion: TEdit;
    Label10: TLabel;
    Label4: TLabel;
    ListBox_a_facturar_Visible_NO: TListBox;
    ListBox_a_facturar_Visible_SI: TListBox;
    ListBox_Comprobador: TListBox;
    Tabla: TLabel;
    Label9: TLabel;
    Label_Ctdad_Rgtros: TLabel;
    Memo_Filtros: TMemo;
    Memo_OrderBy: TMemo;
    PageControl_Filtros: TPageControl;
    SQLQuery_Tablas: TSQLQuery;
    TabSheet_Busqueda_Concreta: TTabSheet;
    TabSheet_Filtros_Generales: TTabSheet;

    procedure Ejecutar( param_Opcion : Integer );
    procedure BitBtn_SALIRClick(Sender: TObject);
    procedure BitBtn_EjecutarClick(Sender: TObject);
    procedure Boton_Add_AllClick(Sender: TObject);
    procedure Boton_Add_OneClick(Sender: TObject);
    procedure Boton_Del_AllClick(Sender: TObject);
    procedure Boton_Del_OneClick(Sender: TObject);
    procedure Filtrar_Principal_Sin_Preguntar;
    function  Esta_Duplicado_SN : Boolean;
    function  Add_Albaran : Boolean;
    function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure para_Empezar;
    procedure Cerramos_Tablas;
    procedure BitBtn_FiltrarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    { private declarations }
    private_Salir_OK : Boolean;
    private_Order_By : array of TOrder_By;
  public
    { public declarations }
  end;

var
  form_utilidades_000: Tform_utilidades_000;

implementation

{$R *.lfm}

uses dm_utilidades, menu;

{ Tform_utilidades_000 }

procedure Tform_utilidades_000.BitBtn_FiltrarClick(Sender: TObject);
begin
    if PageControl_Filtros.ActivePage = TabSheet_Busqueda_Concreta then
    begin
        Filtrar_Principal_Sin_Preguntar;
    end else begin
        Filtrar_Principal( true );
    end;
end;

procedure Tform_utilidades_000.FormClose(Sender: TObject; var CloseAction: TCloseAction);
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
        if form_Menu.public_Salir_OK = False then CloseAction := caNone;
    end else begin
        // ***************************************************************************************** //
        // ** Fue correcto el modo como quiere BitBtn_SALIR de la aplicación                      ** //
        // ***************************************************************************************** //
    end;
end;

procedure Tform_utilidades_000.FormDestroy(Sender: TObject);
begin
    Cerramos_Tablas;
end;

procedure Tform_utilidades_000.Cerramos_Tablas;
begin
    if UTI_TB_Cerrar( DataModule_utilidades.SQLConnector,
                      DataModule_utilidades.SQLTransaction,
                      SQLQuery_Tablas ) = false then UTI_GEN_Salir;

    DataModule_utilidades.Free;
end;

procedure Tform_utilidades_000.para_Empezar;
begin
    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos
    // ********************************************************************************************* //
    if UTI_GEN_Form_Abierto_Ya('DataModule_utilidades') = False then
    begin
        DataModule_utilidades := TDataModule_utilidades.Create(Application);
    end;

    // ********************************************************************************************* //
    // ** Preparamos los diferentes tipos de orden preconfigurados                                ** //
    // ********************************************************************************************* //
    SetLength(private_Order_By, 1);

    private_Order_By[0].Titulo       := 'Por el nombre de tabla'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[0].Memo_OrderBy := '';

    Memo_OrderBy.Lines.Text          := private_Order_By[0].Memo_OrderBy;

    // ********************************************************************************************* //
    // ** Filtramos los datos                                                                     ** //
    // ********************************************************************************************* //
    Filtrar_Principal_Sin_Preguntar;

    // ********************************************************************************************* //
    // ** SOLO PARA ESTE FORM                                                                     ** //
    // ********************************************************************************************* //
    PageControl_Filtros.ActivePage := TabSheet_Busqueda_Concreta;
end;

procedure Tform_utilidades_000.Filtrar_Principal_Sin_Preguntar;
begin
    Filtrar_Principal( false );
end;

function Tform_utilidades_000.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
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
        var_SQL_ADD.Add( 'name LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Descripcion.Text) + '%') );
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
                              '',

                              // Insert_SQL,
                              '',

                              // var_ctdad_Rgtros,
                              -1,

                              DataModule_utilidades.SQLTransaction,
                              DataModule_utilidades.SQLConnector,
                              SQLQuery_Tablas,

                              // name_tabla,
                              '',

                              0, // asi se verán todos los registros y no usara el filtro por el campo borrado si o no

                              // SELECT_SQL,
                              'SHOW TABLE STATUS FROM `socger`',

                              Memo_Filtros.Lines,
                              Memo_OrderBy.Lines,
                              var_a_Filtrar,

                              param_Cambiamos_Filtro,
                              false,   // param_ver_SQL_despues_Abrir : Boolean;
                              true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

    var_a_Filtrar.Free;

    Label_Ctdad_Rgtros.Caption := IntToStr(SQLQuery_Tablas.RecordCount);
    var_SQL_ADD.Free;
end;

procedure Tform_utilidades_000.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_utilidades_000.BitBtn_EjecutarClick(Sender: TObject);
begin
    Ejecutar(ComboBox_Filtros.ItemIndex);
end;

procedure Tform_utilidades_000.Ejecutar( param_Opcion : Integer );
var var_Str   : String;
    var_msg   : TStrings;
var var_Linea : Integer;
begin
    var_msg := TStringList.Create;

    for var_Linea := 1 to ListBox_Comprobador.items.Count do
    begin
        ListBox_Comprobador.itemindex := var_Linea - 1;

        var_Str := Trim(ListBox_Comprobador.Items.Strings[ListBox_Comprobador.ItemIndex]);

        // ***************************************************************************************** //
        // ** Ahora pasamos a crear las líneas de detalle de la factura.                          ** //
        // ** Serán una copia de las líneas de detalle de los albaranes elegidos.                 ** //
        // ***************************************************************************************** //
        if param_Opcion = 0 then
        begin
            var_msg.Add('¿Borramos los registros de la tabla ' + Trim(var_Str) + '?' );
            if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
            begin
                var_msg.Clear;
                if UTI_TB_Borrar_Tabla_Respetando_Autoinc( var_Str ) = false then
                begin
                    var_msg.Add( 'No se pudo borrar, respetando los AutoInc, los registros de la tabla ' +
                                 Trim(var_Str) );
                end;
            end else begin
                var_msg.Clear;
            end;
        end;

        if param_Opcion = 1 then
        begin
            var_msg.Add('¿Borramos(TRUNCANDO) los registros de la tabla ' + Trim(var_Str) + '?' );
            if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
            begin
                var_msg.Clear;
                if UTI_TB_Borrar_Tabla_Sin_Respetar_Autoinc( var_Str ) = false then
                begin
                    var_msg.Add( 'No se pudo borrar, SIN RESPETAR los AutoInc, los registros de la tabla ' +
                                 Trim(var_Str) );
                end;
            end else begin
                var_msg.Clear;
            end;
        end;

        if Trim(var_msg.Text) <> '' then
        begin
            UTI_GEN_Aviso(true, var_msg, 'NO SE PUDO', True, False);
            Break;
        end;
    end;

    var_msg.Free;
end;

procedure Tform_utilidades_000.Boton_Add_AllClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;

    ListBox_a_facturar_Visible_SI.Clear;
    ListBox_a_facturar_Visible_NO.Clear;
    ListBox_Comprobador.Clear;

    with SQLQuery_Tablas do
    begin
        if RecordCount > 0 then
        begin
            First;
            while not Eof do
            begin
                if Add_Albaran = False then
                begin
                    Break;
                end;

                Next;
            end;
        end else begin
            var_msg := TStringList.Create;
            var_msg.Add( '* No hay tablas creadas todavía.' );
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        end;
    end;

    var_msg.Free;
end;

function Tform_utilidades_000.Esta_Duplicado_SN : Boolean;
var var_Linea           : Integer;
    var_que_Comprobamos : String;
    var_msg             : TStrings;
begin
    with SQLQuery_Tablas do
    begin
        Result := False;

        for var_Linea := 1 to ListBox_Comprobador.Items.Count do
        begin
            var_que_Comprobamos := Trim(FieldByName('name').AsString);

            ListBox_Comprobador.ItemIndex := var_Linea - 1;

            if Trim(ListBox_Comprobador.Items.Strings[ListBox_Comprobador.ItemIndex]) =
               Trim(var_que_Comprobamos) then
            begin
                var_msg := TStringList.Create;
                var_msg.Add('Ya fué elegida.');
                UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
                var_msg.Free;

                Result := True;
                Break;
            end;
        end;
    end;
end;

procedure Tform_utilidades_000.Boton_Add_OneClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;

    if SQLQuery_Tablas.RecordCount > 0 then
    begin
        if Esta_Duplicado_SN = True then
        begin
            Exit;
        end;
        Add_Albaran;
    end else begin
        var_msg := TStringList.Create;
        var_msg.Add( '* No hay tablas creadas todavía.' );
        UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        var_msg.Free;
    end;
end;

procedure Tform_utilidades_000.Boton_Del_AllClick(Sender: TObject);
begin
    ListBox_a_facturar_Visible_SI.Clear;
    ListBox_a_facturar_Visible_NO.Clear;
    ListBox_Comprobador.Clear;
end;

procedure Tform_utilidades_000.Boton_Del_OneClick(Sender: TObject);
var var_Linea: Integer;
begin
    if ListBox_Comprobador.Items.Count > 0 then
    begin
        for var_Linea:= 1 to ListBox_Comprobador.items.Count do
        begin
            ListBox_Comprobador.itemindex := var_Linea - 1;

            if ListBox_Comprobador.Items.Strings[ListBox_Comprobador.ItemIndex] =
               ListBox_a_facturar_Visible_NO.Items.Strings[ListBox_a_facturar_Visible_SI.ItemIndex] then
            begin
                ListBox_Comprobador.items.Delete(ListBox_Comprobador.ItemIndex);
                Break;
            end;
        end;

        ListBox_a_facturar_Visible_NO.items.Delete(ListBox_a_facturar_Visible_SI.ItemIndex);
        ListBox_a_facturar_Visible_SI.items.Delete(ListBox_a_facturar_Visible_SI.ItemIndex);
    end;
end;

procedure Tform_utilidades_000.FormCreate(Sender: TObject);
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
end;

function Tform_utilidades_000.Add_Albaran : Boolean;
begin
    Result := False;

    with SQLQuery_Tablas do
    begin
        ListBox_a_facturar_Visible_SI.Items.Add( Trim(FieldByName('name').AsString));

        ListBox_a_facturar_Visible_NO.Items.Add( Trim(FieldByName('name').AsString) );

        ListBox_Comprobador.Items.Add( Trim(FieldByName('name').AsString) );

        Result := True;
    end;
end;

end.

