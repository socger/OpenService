unit visitas_planificacion_por_provincia_000;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids, DbCtrls, Buttons,
  StdCtrls, ExtCtrls, ComCtrls, Grids, variants, utilidades_bd, utilidades_general, utilidades_rgtro,
  utilidades_usuarios, utilidades_datos_tablas;

type

  { Tform_visitas_planificacion_por_provincia_000 }

  Tform_visitas_planificacion_por_provincia_000 = class(TForm)
    BitBtn_Filtrar: TBitBtn;
    BitBtn_SALIR: TBitBtn;
    BitBtn_Seleccionar: TBitBtn;
    BitBtn_Ver_Situacion_Registro_1: TBitBtn;
    ComboBox_Filtros: TComboBox;
    DataSource_Provincias: TDataSource;
    DBGrid_Principal: TDBGrid;
    DBNavigator_1: TDBNavigator;
    Edit_Descripcion: TEdit;
    Label10: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label_Fecha2: TLabel;
    Memo_Filtros: TMemo;
    Memo_OrderBy: TMemo;
    PageControl_Filtros: TPageControl;
    RadioGroup_Bajas: TRadioGroup;
    SQLQuery_Provincias: TSQLQuery;
    SQLQuery_ProvinciasChange_Id_User: TLargeintField;
    SQLQuery_ProvinciasChange_WHEN: TDateTimeField;
    SQLQuery_ProvinciasDel_Id_User: TLargeintField;
    SQLQuery_ProvinciasDel_WHEN: TDateTimeField;
    SQLQuery_ProvinciasDel_WHY: TStringField;
    SQLQuery_Provinciasdescripcion: TStringField;
    SQLQuery_Provinciasid: TLargeintField;
    SQLQuery_Provinciasid_paises: TLargeintField;
    SQLQuery_ProvinciasInsert_Id_User: TLargeintField;
    SQLQuery_ProvinciasInsert_WHEN: TDateTimeField;
    SQLQuery_ProvinciasOT_descripcion_pais: TStringField;
    TabSheet_Busqueda_Concreta: TTabSheet;
    TabSheet_Filtros_Generales: TTabSheet;

    procedure ComboBox_FiltrosChange(Sender: TObject);
    procedure Salir;
    procedure Insertar_Planificacion_Visitas;
    procedure Seleccionado_Rgtro;
    procedure Filtrar_Principal_Sin_Preguntar;
    procedure Obligar_como_Filtrado_Principal;
    procedure Presentar_Datos;
    procedure BitBtn_FiltrarClick(Sender: TObject);
    procedure no_Tocar;
    procedure BitBtn_SeleccionarClick(Sender: TObject);
    procedure DBGrid_PrincipalCellClick(Column: TColumn);
    procedure DBGrid_PrincipalDblClick(Sender: TObject);
    procedure DBNavigator_1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
    function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
    procedure DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Filtrar_tablas_ligadas;
    procedure Refrescar_Registros;
    procedure Cerramos_Tablas;
    procedure Cerramos_Tablas_Ligadas;
    procedure para_Empezar;
    procedure BitBtn_SALIRClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SQLQuery_ProvinciasAfterPost(DataSet: TDataSet);
    procedure SQLQuery_ProvinciasAfterScroll(DataSet: TDataSet);
    procedure SQLQuery_ProvinciasBeforePost(DataSet: TDataSet);

  private
    { private declarations }
    private_Salir_OK : Boolean;
    private_Order_By : array of TOrder_By;
  public
    { public declarations }
    public_Menu_Worked  : Integer;
  end;

var
  form_visitas_planificacion_por_provincia_000: Tform_visitas_planificacion_por_provincia_000;

implementation

{$R *.lfm}

uses menu, dm_visitas_planificacion_por_provincia, visitas_000;

{ Tform_visitas_planificacion_por_provincia_000 }

procedure Tform_visitas_planificacion_por_provincia_000.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
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

procedure Tform_visitas_planificacion_por_provincia_000.BitBtn_SALIRClick(Sender: TObject);
begin
    Salir;
end;

procedure Tform_visitas_planificacion_por_provincia_000.Salir;
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_visitas_planificacion_por_provincia_000.ComboBox_FiltrosChange(
  Sender: TObject);
begin
    Memo_OrderBy.Lines.Clear;
    Memo_OrderBy.Lines.Add( private_Order_By[ComboBox_Filtros.ItemIndex].Memo_OrderBy );
    BitBtn_FiltrarClick(Nil);
end;

procedure Tform_visitas_planificacion_por_provincia_000.FormCreate(Sender: TObject);
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

procedure Tform_visitas_planificacion_por_provincia_000.FormDestroy(Sender: TObject);
begin
    Cerramos_Tablas;
end;

procedure Tform_visitas_planificacion_por_provincia_000.para_Empezar;
begin
    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    if UTI_GEN_Form_Abierto_Ya('DataModule_visitas_planificacion_por_provincia') = False then
    begin
        DataModule_visitas_planificacion_por_provincia := TDataModule_visitas_planificacion_por_provincia.Create(Application);
    end;

    // ********************************************************************************************* //
    // ** Preparamos los diferentes tipos de orden preconfigurados                                ** //
    // ********************************************************************************************* //
    SetLength(private_Order_By, 3);

    private_Order_By[0].Titulo       := 'Por la descripción'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[0].Memo_OrderBy := 'pr.descripcion ASC';

    private_Order_By[1].Titulo       := 'Por país + descripción'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[1].Memo_OrderBy := 'pr.id_paises ASC, pr.descripcion ASC';

    private_Order_By[2].Titulo       := 'Por la id';
    private_Order_By[2].Memo_OrderBy := 'pr.id ASC';

    Memo_OrderBy.Lines.Text          := private_Order_By[0].Memo_OrderBy;

    UTI_TB_Rellenar_ComboBox_Orden( true,
                                    ComboBox_Filtros,
                                    private_Order_By,
                                    0 );

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

procedure Tform_visitas_planificacion_por_provincia_000.SQLQuery_ProvinciasAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'provincias',
                       DataModule_visitas_planificacion_por_provincia.SQLTran_Plan_Pro,
                       SQLQuery_Provincias,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros;
end;

procedure Tform_visitas_planificacion_por_provincia_000.SQLQuery_ProvinciasAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure Tform_visitas_planificacion_por_provincia_000.SQLQuery_ProvinciasBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Provincias );
end;

procedure Tform_visitas_planificacion_por_provincia_000.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_visitas_planificacion_por_provincia.SQLCon_Plan_Pro,
                      DataModule_visitas_planificacion_por_provincia.SQLTran_Plan_Pro,
                      SQLQuery_Provincias ) = false then UTI_GEN_Salir;

    DataModule_visitas_planificacion_por_provincia.Free;
end;

procedure Tform_visitas_planificacion_por_provincia_000.Cerramos_Tablas_Ligadas;
begin
    // ********************************************************************************************* //
    // ** ESTE form NO TIENE TABLAS LIGADAS                                                       ** //
    // ********************************************************************************************* //
end;

procedure Tform_visitas_planificacion_por_provincia_000.Refrescar_Registros;
var var_descripcion : String;
    var_id_paises   : LargeInt{Integer};
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_descripcion := '';
    var_id_paises   := 0;

    if SQLQuery_Provincias.RecordCount > 0 then
    begin
        var_descripcion := SQLQuery_Provincias.FieldByName('descripcion').Value;
        var_id_paises   := SQLQuery_Provincias.FieldByName('id_paises').Value;
    end;

    Filtrar_Principal_Sin_Preguntar;

    if Trim(var_descripcion) <> '' then
    begin
         SQLQuery_Provincias.Locate( 'descripcion;id_paises',
                                     VarArrayOf( [ var_descripcion, var_id_paises ] ),
                                     [] );
    end;
end;

procedure Tform_visitas_planificacion_por_provincia_000.Filtrar_tablas_ligadas;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
begin
    if SQLQuery_Provincias.RecordCount = 0 then Exit;

    if SQLQuery_Provincias.State = dsInsert then
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

procedure Tform_visitas_planificacion_por_provincia_000.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
end;

procedure Tform_visitas_planificacion_por_provincia_000.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure Tform_visitas_planificacion_por_provincia_000.DBGrid_PrincipalDrawColumnCell( Sender: TObject;
                                                                                        const Rect: TRect;
                                                                                        DataCol: Integer;
                                                                                        Column: TColumn;
                                                                                        State: TGridDrawState);
begin
    UTI_GEN_Dibujar_Grid( Sender, SQLQuery_Provincias, Rect, DataCol, Column, State );
end;

procedure Tform_visitas_planificacion_por_provincia_000.DBGrid_PrincipalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if Key = 13 then
    begin
        Seleccionado_Rgtro;
    end;
end;

procedure Tform_visitas_planificacion_por_provincia_000.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

function Tform_visitas_planificacion_por_provincia_000.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
var
  var_a_Filtrar : TStrings;
  var_SQL_ADD   : TStrings;
begin
    var_SQL_ADD   := TStringList.Create;
    var_a_Filtrar := TStringList.Create;
    var_a_Filtrar.Clear;

    Obligar_como_Filtrado_Principal;

    // ********************************************************************************************* //
    // ** AHORA PONDREMOS EL RESTO DE LOS FILTROS QUE NO SON GENERALES                            ** //
    // ********************************************************************************************* //
    // ** Primero buscaremos en la descripción                                                    ** //
    // ********************************************************************************************* //
    if Trim(Edit_Descripcion.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'pr.descripcion LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Descripcion.Text) + '%') );
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
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Provincias,
                                                            'provincias',
                                                            'u' ),

                              // Insert_SQL,
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Provincias,
                                                            'provincias',
                                                            'i' ),

                              // var_ctdad_Rgtros,
                              -1,

                              DataModule_visitas_planificacion_por_provincia.SQLTran_Plan_Pro,
                              DataModule_visitas_planificacion_por_provincia.SQLCon_Plan_Pro,
                              SQLQuery_Provincias,

                              // name_tabla,
                              'pr',

                              RadioGroup_Bajas.ItemIndex,

                              // SELECT_SQL,
                              'SELECT pr.*,' + ' ' +
                                     'ps.descripcion AS OT_descripcion_pais' + ' ' +
                              'FROM provincias AS pr' + ' ' +

                              'LEFT JOIN paises AS ps' + ' ' +
                              'ON pr.id_paises = ps.id' + ' ',

                              Memo_Filtros.Lines,
                              Memo_OrderBy.Lines,
                              var_a_Filtrar,

                              param_Cambiamos_Filtro,
                              false,   // param_ver_SQL_despues_Abrir : Boolean;
                              true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

    var_a_Filtrar.Free;

    //Filtrar_tablas_ligadas;
    var_SQL_ADD.Free;
end;

procedure Tform_visitas_planificacion_por_provincia_000.BitBtn_SeleccionarClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
end;

procedure Tform_visitas_planificacion_por_provincia_000.DBNavigator_1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
begin
    //Filtrar_tablas_ligadas;

    case Button of
        nbRefresh : begin
            Refrescar_Registros;
            Abort;
        end;
    end;
end;

procedure Tform_visitas_planificacion_por_provincia_000.no_Tocar;
begin
    // No hay nada para no tocar
end;

procedure Tform_visitas_planificacion_por_provincia_000.BitBtn_FiltrarClick(Sender: TObject);
begin
    if PageControl_Filtros.ActivePage = TabSheet_Busqueda_Concreta then
    begin
        Filtrar_Principal_Sin_Preguntar;
    end else begin
        RadioGroup_Bajas.ItemIndex := Filtrar_Principal( true );
    end;
end;

procedure Tform_visitas_planificacion_por_provincia_000.Presentar_Datos;
begin
    // No hay nada para presentar
end;

procedure Tform_visitas_planificacion_por_provincia_000.Obligar_como_Filtrado_Principal;
var
  var_SQL_ADD : TStrings;
begin
    var_SQL_ADD := TStringList.Create;

    // ********************************************************************************************* //
    // ** No hace falta porque no es una tabla ligada a otras                                     ** //
    // ********************************************************************************************* //
    {
      var_SQL_ADD.Clear;
      var_SQL_ADD.Add( 'ce.id_clientes = ' + Edit_id.Text );
      UTI_TB_SQL_ADD( true,
                      Memo_Filtros.Lines,
                      var_SQL_ADD );
    }
    var_SQL_ADD.Free;
end;

procedure Tform_visitas_planificacion_por_provincia_000.Filtrar_Principal_Sin_Preguntar;
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

procedure Tform_visitas_planificacion_por_provincia_000.Seleccionado_Rgtro;
begin
    Insertar_Planificacion_Visitas;
    Salir;
end;

procedure Tform_visitas_planificacion_por_provincia_000.Insertar_Planificacion_Visitas;
var var_msg   : TStrings;
    var_Fecha : ShortString;
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = true then
    begin
       if UTI_GEN_Form_Abierto_Ya('form_visitas_000') = false then
       begin
           Application.CreateForm(Tform_visitas_000, form_visitas_000);

           form_visitas_000.public_Solo_Ver    := false;
           form_visitas_000.public_Elegimos    := false;
           form_visitas_000.public_Menu_Worked := public_Menu_Worked;

           form_visitas_000.DateTimePicker_Visitado_Desde.Date := Date;
           form_visitas_000.DateTimePicker_Visitado_Hasta.Date := Date;

           form_visitas_000.para_Empezar;

           var_Fecha := form_visitas_000.Insertar_Planificacion_Visitas( 'id_provincias',
                                                                         SQLQuery_Provincias.FieldByName('id').AsString );
           form_visitas_000.Free;

           if Trim(var_Fecha) = '' then
           begin
               Exit;
           end;

           Application.CreateForm(Tform_visitas_000, form_visitas_000);

           form_visitas_000.public_Solo_Ver    := false;
           form_visitas_000.public_Elegimos    := false;
           form_visitas_000.public_Menu_Worked := public_Menu_Worked;

           form_visitas_000.DateTimePicker_Visitado_Desde.Date := StrToDate(var_Fecha);
           form_visitas_000.DateTimePicker_Visitado_Hasta.Date := StrToDate(var_Fecha);

           form_visitas_000.para_Empezar;

           form_visitas_000.ShowModal;

           form_visitas_000.Free;
       end else begin
           var_msg := TStringList.Create;
           var_msg.Add(rs_Modulo_Abierto);
           UTI_GEN_Aviso(true, var_msg, 'NO SE PUEDE ...', True, False);
           var_msg.Free;
       end;
    end;
end;

end.

