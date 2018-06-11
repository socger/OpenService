unit empresas_002;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids, DbCtrls, Grids,
  Buttons, ExtCtrls, ComCtrls, StdCtrls, utilidades_bd, utilidades_general, utilidades_rgtro,
  utilidades_datos_tablas;

type

  { Tform_empresas_002 }

  Tform_empresas_002 = class(TForm)
    BitBtn_Filtrar: TBitBtn;
    BitBtn_SALIR: TBitBtn;
    BitBtn_Seleccionar: TBitBtn;
    ComboBox_Filtros: TComboBox;
    DataSource_Empresas: TDataSource;
    DBGrid_Principal: TDBGrid;
    DBNavigator1: TDBNavigator;
    Edit_Descripcion: TEdit;
    Image_Confirmado: TImage;
    Label10: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label_Cambiable_1: TLabel;
    Label_Fecha2: TLabel;
    Memo_Filtros: TMemo;
    Memo_OrderBy: TMemo;
    PageControl_Filtros: TPageControl;
    RadioGroup_Bajas: TRadioGroup;
    SQLQuery_Empresas: TSQLQuery;
    SQLQuery_EmpresasChange_Id_User: TLargeintField;
    SQLQuery_EmpresasChange_WHEN: TDateTimeField;
    SQLQuery_EmpresasCodigo_Postal: TStringField;
    SQLQuery_EmpresasDel_Id_User: TLargeintField;
    SQLQuery_EmpresasDel_WHEN: TDateTimeField;
    SQLQuery_EmpresasDel_WHY: TStringField;
    SQLQuery_EmpresasDireccion: TStringField;
    SQLQuery_EmpresasDireccion_Numero: TStringField;
    SQLQuery_EmpresasDireccion_Piso_Letra: TStringField;
    SQLQuery_EmpresaseMail: TStringField;
    SQLQuery_EmpresasFAX: TStringField;
    SQLQuery_Empresasid: TLargeintField;
    SQLQuery_Empresasid_paises: TLargeintField;
    SQLQuery_Empresasid_poblaciones: TLargeintField;
    SQLQuery_Empresasid_provincias: TLargeintField;
    SQLQuery_EmpresasInsert_Id_User: TLargeintField;
    SQLQuery_EmpresasInsert_WHEN: TDateTimeField;
    SQLQuery_EmpresasMovil: TStringField;
    SQLQuery_Empresasnif_cif: TStringField;
    SQLQuery_Empresasnombre_comercial: TStringField;
    SQLQuery_EmpresasNumero_Abono: TLargeintField;
    SQLQuery_EmpresasNumero_Albaran: TLargeintField;
    SQLQuery_EmpresasNumero_Factura: TLargeintField;
    SQLQuery_EmpresasNumero_Pedido: TLargeintField;
    SQLQuery_EmpresasNumero_Presupuesto: TLargeintField;
    SQLQuery_EmpresasObservaciones_Comentarios: TStringField;
    SQLQuery_EmpresasOT_descripcion_pais: TStringField;
    SQLQuery_EmpresasOT_descripcion_poblacion: TStringField;
    SQLQuery_EmpresasOT_descripcion_provincia: TStringField;
    SQLQuery_Empresaspagina_web: TStringField;
    SQLQuery_EmpresasResponsable: TStringField;
    SQLQuery_EmpresasSerie_Abono: TStringField;
    SQLQuery_EmpresasSerie_Albaran: TStringField;
    SQLQuery_EmpresasSerie_Factura: TStringField;
    SQLQuery_EmpresasSerie_Pedido: TStringField;
    SQLQuery_EmpresasSerie_Presupuesto: TStringField;
    SQLQuery_EmpresasTfno_Fijo_1: TStringField;
    SQLQuery_EmpresasTfno_Fijo_2: TStringField;
    TabSheet_Busqueda_Concreta: TTabSheet;
    TabSheet_Filtros_Generales: TTabSheet;

    procedure ComboBox_FiltrosChange(Sender: TObject);
    procedure Filtrar_Principal_Sin_Preguntar;
    procedure FormCreate(Sender: TObject);
    procedure Presentar_Datos;
    procedure BitBtn_FiltrarClick(Sender: TObject);
    procedure no_Tocar;
    procedure BitBtn_SeleccionarClick(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure Seleccionado_Rgtro;
    procedure BitBtn_SALIRClick(Sender: TObject);
    procedure DBGrid_PrincipalCellClick(Column: TColumn);
    procedure DBGrid_PrincipalDblClick(Sender: TObject);
    procedure DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Refrescar_Registros;
    function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
    procedure Filtrar_tablas_ligadas;
    procedure Cerramos_Tablas;
    procedure Cerramos_Tablas_Ligadas;
    procedure FormDestroy(Sender: TObject);
    procedure Obligar_como_Filtrado_Principal;
    procedure para_Empezar;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure SQLQuery_EmpresasAfterPost(DataSet: TDataSet);
    procedure SQLQuery_EmpresasAfterScroll(DataSet: TDataSet);
    procedure SQLQuery_EmpresasBeforePost(DataSet: TDataSet);
    procedure SQLQuery_EmpresasCalcFields(DataSet: TDataSet);

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
  form_empresas_002: Tform_empresas_002;

implementation

{$R *.lfm}

uses menu, dm_empresas_elegir;

{ Tform_empresas_002 }

procedure Tform_empresas_002.FormActivate(Sender: TObject);
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

procedure Tform_empresas_002.FormClose(Sender: TObject; var CloseAction: TCloseAction);
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
        if form_Menu.public_Salir_OK = false then CloseAction := caNone;
    end else begin
      { ********************************************************************
        Fue correcto el modo como quiere BitBtn_SALIR de la aplicación
        ******************************************************************** }
    end;
end;

procedure Tform_empresas_002.FormCreate(Sender: TObject);
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

procedure Tform_empresas_002.Obligar_como_Filtrado_Principal;
begin
    // ********************************************************************************************* //
    // ** NO SE VA A OBLIGAR POR NINGUN FILTRO EN ESPECIAL                                        ** //
    // ********************************************************************************************* //
end;

procedure Tform_empresas_002.para_Empezar;
begin
    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    if UTI_GEN_Form_Abierto_Ya('DataModule_empresas_elegir') = False then
    begin
        DataModule_empresas_elegir := TDataModule_empresas_elegir.Create(Application);
    end;

    // ********************************************************************************************* //
    // Preparamos los diferentes tipos de orden preconfigurados                                   ** //
    // ********************************************************************************************* //
    SetLength(private_Order_By, 2);

    private_Order_By[0].Titulo       := 'Por el nombre de la empresa'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[0].Memo_OrderBy := 'e.nombre_comercial ASC';

    private_Order_By[1].Titulo       := 'Por la id';
    private_Order_By[1].Memo_OrderBy := 'e.id ASC';

    Memo_OrderBy.Lines.Text          := private_Order_By[0].Memo_OrderBy;

    UTI_TB_Rellenar_ComboBox_Orden( true,
                                    ComboBox_Filtros,
                                    private_Order_By,
                                    0 );

    Obligar_como_Filtrado_Principal;

    // ********************************************************************************************* //
    // Filtramos los datos                                                                        ** //
    // ********************************************************************************************* //
    Filtrar_Principal_Sin_Preguntar;

    Presentar_Datos;

    // ********************************************************************************************* //
    // ** SOLO PARA ESTE FORM                                                                     ** //
    // ********************************************************************************************* //
    PageControl_Filtros.ActivePage := TabSheet_Busqueda_Concreta;
end;

procedure Tform_empresas_002.FormDestroy(Sender: TObject);
begin
    Cerramos_Tablas;
end;

procedure Tform_empresas_002.SQLQuery_EmpresasAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'empresas',
                       DataModule_empresas_elegir.SQLTransaction,
                       SQLQuery_Empresas,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros;
end;

procedure Tform_empresas_002.SQLQuery_EmpresasAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure Tform_empresas_002.SQLQuery_EmpresasBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Empresas );
end;

procedure Tform_empresas_002.SQLQuery_EmpresasCalcFields(DataSet: TDataSet);
begin
    // ********************************************************************************************* //
    // ** PARA DAR VALOR A CAMPOS CALCULADOS                                                      ** //
    // ********************************************************************************************* //
end;

procedure Tform_empresas_002.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_empresas_elegir.SQLConnector,
                      DataModule_empresas_elegir.SQLTransaction,
                      SQLQuery_Empresas ) = false then UTI_GEN_Salir;

    DataModule_empresas_elegir.Free;
end;

procedure Tform_empresas_002.Cerramos_Tablas_Ligadas;
begin
{ ESTE form NO TIENE TABLAS LIGADAS

    if UTI_TB_Cerrar( DataModule_del_form_000.SQLConnector_de_la_tabla,
                      DataModule_Users.SQLTransaction_de_la_tabla,
                      SQLQuery_la_tabla ) = false then UTI_GEN_Salir;
}
end;

procedure Tform_empresas_002.Refrescar_Registros;
var var_nombre_comercial : String;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_nombre_comercial := '';

    if SQLQuery_Empresas.RecordCount > 0 then
    begin
        var_nombre_comercial := SQLQuery_Empresas.FieldByName('nombre_comercial').Value;
    end;

    Filtrar_Principal_Sin_Preguntar;

    if Trim(var_nombre_comercial) <> '' then
    begin
        SQLQuery_Empresas.Locate( 'nombre_comercial', var_nombre_comercial, [] );
    end;
end;

procedure Tform_empresas_002.Filtrar_tablas_ligadas;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
begin
    if SQLQuery_Empresas.RecordCount = 0 then Exit;

    if SQLQuery_Empresas.State = dsInsert then
    begin
        Cerramos_Tablas_Ligadas;
        Exit;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;
end;

function Tform_empresas_002.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
var
  var_a_Filtrar : TStrings;
  var_SQL_ADD   : TStrings;
begin
  var_SQL_ADD := TStringList.Create;

  var_a_Filtrar := TStringList.Create;
  var_a_Filtrar.Clear;

  Obligar_como_Filtrado_Principal;

  // ********************************************************************************************* //
  // ** AHORA PONDREMOS EL RESTO DE LOS FILTROS QUE NO SON GENERALES                            ** //
  // ********************************************************************************************* //
  // ** Primero buscaremos en el nombre y apellido el texto a buscar                              ** //
  // ********************************************************************************************* //
  if Trim(Edit_Descripcion.Text) <> '' then
  begin
      var_SQL_ADD.Clear;
      var_SQL_ADD.Add( 'e.descripcion LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Descripcion.Text) + '%') );
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
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Empresas,
                                                          'empresas',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Empresas,
                                                          'empresas',
                                                          'i' ),

                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_empresas_elegir.SQLTransaction,
                            DataModule_empresas_elegir.SQLConnector,
                            SQLQuery_Empresas,

                            // name_tabla,
                            'e',

                            RadioGroup_Bajas.ItemIndex,

                            // SELECT_SQL,
                            'SELECT e.*,' + ' ' +

                                   'pb.descripcion AS OT_descripcion_poblacion,' + ' ' +
                                   'pr.descripcion AS OT_descripcion_provincia,' + ' ' +
                                   'ps.descripcion AS OT_descripcion_pais' + ' ' +

                            'FROM empresas AS e' + ' ' +

                            'LEFT JOIN poblaciones AS pb' + ' ' +
                            'ON e.id_poblaciones = pb.id' + ' ' +

                            'LEFT JOIN provincias AS pr' + ' ' +
                            'ON e.id_provincias = pr.id' + ' ' +

                            'LEFT JOIN paises AS ps' + ' ' +
                            'ON e.id_paises = ps.id' + ' ',

                            Memo_Filtros.Lines,
                            Memo_OrderBy.Lines,
                            var_a_Filtrar,

                            param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_a_Filtrar.Free;
  var_SQL_ADD.Free;

  //Filtrar_tablas_ligadas;
end;

procedure Tform_empresas_002.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    If public_Elegimos then Seleccionado_Rgtro;
end;

procedure Tform_empresas_002.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure Tform_empresas_002.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_empresas_002.DBGrid_PrincipalDrawColumnCell(Sender: TObject;
    const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    UTI_GEN_Dibujar_Grid( Sender, SQLQuery_Empresas, Rect, DataCol, Column, State );
end;

procedure Tform_empresas_002.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then
    begin
        If public_Elegimos then Seleccionado_Rgtro;
    end;
end;

procedure Tform_empresas_002.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

procedure Tform_empresas_002.Seleccionado_Rgtro;
begin
    private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    public_Rgtro_Seleccionado := true;
    Close;
end;

procedure Tform_empresas_002.BitBtn_SeleccionarClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
end;

procedure Tform_empresas_002.DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
begin
    //Filtrar_tablas_ligadas;

    case Button of
        nbRefresh : begin
            Refrescar_Registros;
            Abort;
        end;
    end;
end;

procedure Tform_empresas_002.no_Tocar;
begin
    // No hay nada para no tocar
end;

procedure Tform_empresas_002.BitBtn_FiltrarClick(Sender: TObject);
begin
    if PageControl_Filtros.ActivePage = TabSheet_Busqueda_Concreta then
    begin
        Filtrar_Principal_Sin_Preguntar;
    end else begin
        RadioGroup_Bajas.ItemIndex := Filtrar_Principal( true );
    end;
end;

procedure Tform_empresas_002.Presentar_Datos;
begin
    // No hay nada para presentar
end;

procedure Tform_empresas_002.Filtrar_Principal_Sin_Preguntar;
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

procedure Tform_empresas_002.ComboBox_FiltrosChange(Sender: TObject);
begin
    Memo_OrderBy.Lines.Clear;
    Memo_OrderBy.Lines.Add( private_Order_By[ComboBox_Filtros.ItemIndex].Memo_OrderBy );
    BitBtn_FiltrarClick(Nil);
end;

end.


