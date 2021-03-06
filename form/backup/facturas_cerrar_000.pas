unit facturas_cerrar_000;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls,
  DBGrids, DbCtrls, Buttons, ExtCtrls, Grids, utilidades_bd, utilidades_general, variants,
  utilidades_datos_tablas, utilidades_rgtro, utilidades_usuarios, utilidades_forms_Filtrar;

type

  { Tform_facturas_cerrar_000 }

  Tform_facturas_cerrar_000 = class(TForm)
    BitBtn_Filtrar: TBitBtn;
    BitBtn_SALIR: TBitBtn;
    BitBtn_Ver_Situacion_Registro: TBitBtn;
    Boton_Elegir_Empresa: TBitBtn;
    ComboBox_Filtros: TComboBox;
    DataSource_Ftras_Cerrar: TDataSource;
    DBGrid_Principal: TDBGrid;
    DBNavigator1: TDBNavigator;
    Edit_Descripcion_Empresa: TEdit;
    Edit_id_Empresas: TEdit;
    Image_Confirmado: TImage;
    Label10: TLabel;
    Label46: TLabel;
    Label9: TLabel;
    Label_Ctdad_Rgtros: TLabel;
    Label_Fecha2: TLabel;
    Label_tipo_de_facturas: TLabel;
    Memo_Filtros: TMemo;
    Memo_OrderBy: TMemo;
    PageControl_Filtros: TPageControl;
    RadioGroup_Bajas: TRadioGroup;
    SQLQuery_Ftras_Cerrar: TSQLQuery;
    SQLQuery_Ftras_CerrarChange_Id_User: TLargeintField;
    SQLQuery_Ftras_CerrarChange_WHEN: TDateTimeField;
    SQLQuery_Ftras_CerrarDel_Id_User: TLargeintField;
    SQLQuery_Ftras_CerrarDel_WHEN: TDateTimeField;
    SQLQuery_Ftras_CerrarDel_WHY: TStringField;
    SQLQuery_Ftras_CerrarDesde: TDateField;
    SQLQuery_Ftras_CerrarHasta: TDateField;
    SQLQuery_Ftras_Cerrarid: TLargeintField;
    SQLQuery_Ftras_Cerrarid_empresas: TLargeintField;
    SQLQuery_Ftras_CerrarInsert_Id_User: TLargeintField;
    SQLQuery_Ftras_CerrarInsert_WHEN: TDateTimeField;
    SQLQuery_Ftras_CerrarOT_Descripcion_empresa: TStringField;
    SQLQuery_Ftras_CerrarTipo_Ventas_o_Compras_VC: TStringField;
    TabSheet_Busqueda_Concreta: TTabSheet;
    TabSheet_Filtros_Generales: TTabSheet;

    procedure Boton_Elegir_EmpresaClick(Sender: TObject);
    procedure Editar_Registro;
    procedure Edit_Descripcion_EmpresaClick(Sender: TObject);
    procedure para_Empezar;
    procedure Presentar_Datos;
    procedure Insertar_Registro;
    procedure Filtrar_tablas_ligadas;
    procedure Refrescar_Registros;
    procedure BitBtn_SALIRClick(Sender: TObject);
    procedure BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
    procedure DBGrid_PrincipalCellClick(Column: TColumn);
    procedure DBGrid_PrincipalDblClick(Sender: TObject);
    procedure DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
    function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
    procedure ComboBox_FiltrosChange(Sender: TObject);
    procedure Filtrar_Principal_Sin_Preguntar;
    procedure Cerramos_Tablas;
    procedure Cerramos_Tablas_Ligadas;
    procedure no_Tocar;
    procedure BitBtn_FiltrarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RadioGroup_BajasClick(Sender: TObject);
    procedure SQLQuery_Ftras_CerrarAfterPost(DataSet: TDataSet);
    procedure SQLQuery_Ftras_CerrarAfterScroll(DataSet: TDataSet);
    procedure SQLQuery_Ftras_CerrarBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_Ftras_CerrarBeforePost(DataSet: TDataSet);

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
    public_ventas_o_compras   : ShortString;
  end;

var
  form_facturas_cerrar_000: Tform_facturas_cerrar_000;

implementation

{$R *.lfm}

uses dm_facturas_cerrar, menu, facturas_cerrar_001;

{ Tform_facturas_cerrar_000 }

procedure Tform_facturas_cerrar_000.FormActivate(Sender: TObject);
begin
    if public_Solo_Ver = true then no_Tocar;
end;

procedure Tform_facturas_cerrar_000.FormClose(Sender: TObject; var CloseAction: TCloseAction);
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

procedure Tform_facturas_cerrar_000.FormDestroy(Sender: TObject);
begin
     Cerramos_Tablas;
end;

procedure Tform_facturas_cerrar_000.BitBtn_FiltrarClick(Sender: TObject);
begin
     if PageControl_Filtros.ActivePage = TabSheet_Busqueda_Concreta then
     begin
         Filtrar_Principal_Sin_Preguntar;
     end else begin
         RadioGroup_Bajas.ItemIndex := Filtrar_Principal( true );
     end;
end;

procedure Tform_facturas_cerrar_000.no_Tocar;
begin
    // ********************************************************************************************* //
    // ** De momento nada                                                                         ** //
     // ********************************************************************************************* //
end;

procedure Tform_facturas_cerrar_000.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_facturas_cerrar.SQLConnector,
                      DataModule_facturas_cerrar.SQLTransaction,
                      SQLQuery_Ftras_Cerrar ) = false then UTI_GEN_Salir;

    DataModule_facturas_cerrar.Free;
end;

procedure Tform_facturas_cerrar_000.Cerramos_Tablas_Ligadas;
begin
    { ESTE form NO TIENE TABLAS LIGADAS

        if UTI_TB_Cerrar( DataModule_del_form_000.SQLConnector_de_la_tabla,
                          DataModule_Users.SQLTransaction_de_la_tabla,
                          SQLQuery_la_tabla ) = false then UTI_GEN_Salir;
    }
end;

procedure Tform_facturas_cerrar_000.Filtrar_Principal_Sin_Preguntar;
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

procedure Tform_facturas_cerrar_000.ComboBox_FiltrosChange(Sender: TObject);
begin
    Memo_OrderBy.Lines.Clear;
    Memo_OrderBy.Lines.Add( private_Order_By[ComboBox_Filtros.ItemIndex].Memo_OrderBy );
    BitBtn_FiltrarClick(Nil);
end;

function Tform_facturas_cerrar_000.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
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
    // ** Filtraremos por la empresa                                                              ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_Empresas.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'cie.id_empresas = ' + Trim(Edit_id_Empresas.Text) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Filtraremos por la empresa                                                              ** //
    // ********************************************************************************************* //
    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'cie.Tipo_Ventas_o_Compras_VC = ' + UTI_GEN_Comillas(Trim(UpperCase(public_ventas_o_compras))) );
    UTI_TB_SQL_ADD( false,
                    var_a_Filtrar,
                    var_SQL_ADD );

    { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
      y que por lo se debe de permitir modificarlos en ningún módulo }

    Result := UTI_TB_Filtrar( private_Order_By,

                              // Delete_SQL,
                              '',

                              // Update_SQL,
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Ftras_Cerrar,
                                                            'facturas_cerradas',
                                                            'u' ),

                              // Insert_SQL,
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Ftras_Cerrar,
                                                            'facturas_cerradas',
                                                            'i' ),

                              // var_ctdad_Rgtros,
                              -1,

                              DataModule_facturas_cerrar.SQLTransaction,
                              DataModule_facturas_cerrar.SQLConnector,
                              SQLQuery_Ftras_Cerrar,

                              // name_tabla,
                              'cie',

                              RadioGroup_Bajas.ItemIndex,

                              // SELECT_SQL,
                              'SELECT cie.*,' + ' ' +
                                     'emp.nombre_comercial AS OT_Descripcion_empresa' + ' ' +
                              'FROM facturas_cerradas AS cie' + ' ' +
                              'LEFT JOIN empresas AS emp' + ' ' +
                              'ON cie.id_empresas = emp.id' + ' ',

                              Memo_Filtros.Lines,
                              Memo_OrderBy.Lines,
                              var_a_Filtrar,

                              param_Cambiamos_Filtro,
                              false,   // param_ver_SQL_despues_Abrir : Boolean;
                              true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

    var_a_Filtrar.Free;

    Label_Ctdad_Rgtros.Caption := IntToStr(SQLQuery_Ftras_Cerrar.RecordCount);

    //Filtrar_tablas_ligadas;
    var_SQL_ADD.Free;
end;

procedure Tform_facturas_cerrar_000.RadioGroup_BajasClick(Sender: TObject);
begin
     Refrescar_Registros;
end;

procedure Tform_facturas_cerrar_000.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_facturas_cerrar_000.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure Tform_facturas_cerrar_000.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    Editar_Registro;
end;

procedure Tform_facturas_cerrar_000.DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    UTI_GEN_Dibujar_Grid( Sender, SQLQuery_Ftras_Cerrar, Rect, DataCol, Column, State );
end;

procedure Tform_facturas_cerrar_000.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if Key = 13 then
    begin
        Editar_Registro;
    end;
end;

procedure Tform_facturas_cerrar_000.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

procedure Tform_facturas_cerrar_000.DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
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
                UTI_RGTRO_Borrar( 'facturas_cerradas',
                                  SQLQuery_Ftras_Cerrar,
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

procedure Tform_facturas_cerrar_000.BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if SQLQuery_Ftras_Cerrar.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'facturas_cerradas',
                                           SQLQuery_Ftras_Cerrar,
                                           DataSource_Ftras_Cerrar,
                                           DBGrid_Principal );
        end;
    end;
end;

procedure Tform_facturas_cerrar_000.Refrescar_Registros;
var var_id_empresas : Int64;
    var_Desde       : TDateTime;
    var_Hasta       : TDateTime;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_id_empresas := 0;

    with SQLQuery_Ftras_Cerrar do
    begin
        if SQLQuery_Ftras_Cerrar.RecordCount > 0 then
        begin
            var_id_empresas := FieldByName('id_empresas').Value;
            var_Desde       := FieldByName('Desde').Value;
            var_Hasta       := FieldByName('Hasta').Value;
        end;
    end;

    Filtrar_Principal_Sin_Preguntar;

    if var_id_empresas <> 0 then
    begin
        SQLQuery_Ftras_Cerrar.Locate( 'id_empresas;Desde;Hasta',
                                      VarArrayOf( [ var_id_empresas, var_Desde, var_Hasta ] ),
                                      [] );
    end;
end;

procedure Tform_facturas_cerrar_000.Filtrar_tablas_ligadas;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
begin
    if SQLQuery_Ftras_Cerrar.RecordCount = 0 then Exit;

    if SQLQuery_Ftras_Cerrar.State = dsInsert then
    begin
        Cerramos_Tablas_Ligadas;
        Exit;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;
end;

procedure Tform_facturas_cerrar_000.Insertar_Registro;
var var_msg  : TStrings;
    var_Form : Tform_facturas_cerrar_001;
begin
    with SQLQuery_Ftras_Cerrar do
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

                FieldByName('Tipo_Ventas_o_Compras_VC').AsString := UpperCase(public_ventas_o_compras);

                var_Form := Tform_facturas_cerrar_001.Create(nil);

                var_Form.para_Empezar;

                var_Form.ShowModal;
                if var_Form.public_Pulso_Aceptar = true then
                    begin
                        FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
                        FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                        UTI_RGTRO_Grabar_Antes( 'facturas_cerradas',
                                                SQLQuery_Ftras_Cerrar );
                    end
                else Cancel;

                var_Form.Free;
            end;
        end;

        var_msg.Free;
    end;
end;

procedure Tform_facturas_cerrar_000.Presentar_Datos;
begin
     /// guardar por lo que pueda pasar
end;

procedure Tform_facturas_cerrar_000.FormCreate(Sender: TObject);
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

    public_Rgtro_Seleccionado       := false;
end;

procedure Tform_facturas_cerrar_000.para_Empezar;
begin
    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos
    // ********************************************************************************************* //
    if UTI_GEN_Form_Abierto_Ya('DataModule_facturas_cerrar') = False then
    begin
        DataModule_facturas_cerrar := TDataModule_facturas_cerrar.Create(Application);
    end;

    // ********************************************************************************************* //
    // ** Preparamos los diferentes tipos de orden preconfigurados                                ** //
    // ********************************************************************************************* //
    SetLength(private_Order_By, 2);

    private_Order_By[0].Titulo       := 'Por la empresa'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[0].Memo_OrderBy := 'cie.id_empresas ASC, cie.Desde ASC, cie.Hasta ASC';

    private_Order_By[1].Titulo       := 'Por la id';
    private_Order_By[1].Memo_OrderBy := 'cie.id ASC';

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

    if public_ventas_o_compras = 'V' then
    begin
        Label_tipo_de_facturas.Caption := 'CERRAR FACTURAS DE VENTAS';
    end else begin
        Label_tipo_de_facturas.Caption := 'CERRAR FTRAS.DE COMPRAS/GASTOS';
    end;
end;

procedure Tform_facturas_cerrar_000.SQLQuery_Ftras_CerrarAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'facturas_cerradas',
                       DataModule_facturas_cerrar.SQLTransaction,
                       SQLQuery_Ftras_Cerrar,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros;
end;

procedure Tform_facturas_cerrar_000.SQLQuery_Ftras_CerrarAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure Tform_facturas_cerrar_000.SQLQuery_Ftras_CerrarBeforePost(DataSet: TDataSet);
begin
     UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Ftras_Cerrar );
end;

procedure Tform_facturas_cerrar_000.SQLQuery_Ftras_CerrarBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Ftras_Cerrar );
end;

procedure Tform_facturas_cerrar_000.Editar_Registro;
var var_msg  : TStrings;
    var_Form : Tform_facturas_cerrar_001;
    var_id   : ShortString;
begin
    with SQLQuery_Ftras_Cerrar do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
        begin
            var_id := FieldByName('id').AsString;

            if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
            begin
                if UTI_RGTRO_isLock( 'facturas_cerradas',
                                     FieldByName('id').AsString,
                                     true ) = true then
                begin
                    Exit;
                end else begin
                    if UTI_RGTRO_Lock( 'facturas_cerradas',
                                       FieldByName('id').AsString ) = true then
                         Edit
                    else Exit;
                end;

                var_Form := Tform_facturas_cerrar_001.Create(nil);

                var_Form.public_Menu_Worked := public_Menu_Worked;

                if public_Solo_Ver = true then
                begin
                    var_Form.public_Solo_Ver := true;
                end;

                var_Form.para_Empezar;

                var_Form.ShowModal;
                if var_Form.public_Pulso_Aceptar = true then
                begin
                    if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( SQLQuery_Ftras_Cerrar ) = true then
                    begin
                        FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                        FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                        UTI_RGTRO_Grabar_Antes( 'facturas_cerradas', SQLQuery_Ftras_Cerrar );
                    end else begin
                        Cancel;
                    end;
                end else begin
                    Cancel;
                end;

                var_Form.Free;

                UTI_RGTRO_UnLock( 'facturas_cerradas', var_id );
            end;
        end else begin
            var_msg.Add(rs_no_Hay_Rgtros);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        end;
    end;
    var_msg.Free;
end;

procedure Tform_facturas_cerrar_000.Edit_Descripcion_EmpresaClick(
  Sender: TObject);
begin
    Edit_id_Empresas.Text         := '';
    Edit_Descripcion_Empresa.Text := '';
end;

procedure Tform_facturas_cerrar_000.Boton_Elegir_EmpresaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Empresas( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_Empresas.Text         := Trim(var_Registro.id_1);
        Edit_Descripcion_Empresa.Text := var_Registro.descripcion_1;
    end;
end;

end.

