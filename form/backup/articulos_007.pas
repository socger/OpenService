unit articulos_007;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids, DbCtrls,
    utilidades_rgtro, utilidades_general, utilidades_bd, Buttons, StdCtrls, ExtCtrls, Grids,
    ComCtrls, utilidades_datos_tablas, utilidades_forms_Filtrar, utilidades_usuarios, LCLTranslator;

resourcestring
  rs_para_Empezar_1 = 'Por descripción';

type

    { Tform_articulos_007 }

    Tform_articulos_007 = class(TForm)
      BitBtn_Filtrar: TBitBtn;
      BitBtn_SALIR: TBitBtn;
      BitBtn_Seleccionar: TBitBtn;
        Boton_Elegir_id_articulos_familias: TBitBtn;
        Boton_Elegir_id_proveedores: TBitBtn;
        ComboBox_Filtros: TComboBox;
        DataSource_ArtaEleg: TDataSource;
        DBGrid_Principal: TDBGrid;
        DBNavigator1: TDBNavigator;
        Edit_Descripcion: TEdit;
        Edit_Descripcion_id_articulos_familias: TEdit;
        Edit_Descripcion_id_proveedores: TEdit;
        Edit_Descripcion_Para_Terminal: TEdit;
        Edit_id_articulos_familias: TEdit;
        Edit_id_proveedores: TEdit;
        Label45: TLabel;
        Label49: TLabel;
        Label6: TLabel;
        Label7: TLabel;
        Label8: TLabel;
        Label9: TLabel;
        Label_Cambiable_1: TLabel;
        Label_Fecha2: TLabel;
        Memo_Filtros: TMemo;
        Memo_OrderBy: TMemo;
        PageControl_Filtros: TPageControl;
        RadioGroup_Bajas: TRadioGroup;
        SQLQuery_Articulos_a_Elegir: TSQLQuery;
        SQLQuery_Articulos_a_ElegirActivar_Proporciones_SN: TStringField;
        SQLQuery_Articulos_a_ElegirAgregar_a_Favoritos_SN: TStringField;
        SQLQuery_Articulos_a_ElegirArticulo_Compuesto_SN: TStringField;
        SQLQuery_Articulos_a_ElegirChange_Id_User: TLargeintField;
        SQLQuery_Articulos_a_ElegirChange_WHEN: TDateTimeField;
        SQLQuery_Articulos_a_ElegirCombinado: TStringField;
        SQLQuery_Articulos_a_ElegirComision: TBCDField;
        SQLQuery_Articulos_a_ElegirCubicaje_Peso: TBCDField;
        SQLQuery_Articulos_a_ElegirCubicaje_Volumen: TBCDField;
        SQLQuery_Articulos_a_ElegirCuenta_Contable_Compras: TStringField;
        SQLQuery_Articulos_a_ElegirCuenta_Contable_Ventas: TStringField;
        SQLQuery_Articulos_a_ElegirDel_Id_User: TLargeintField;
        SQLQuery_Articulos_a_ElegirDel_WHEN: TDateTimeField;
        SQLQuery_Articulos_a_ElegirDel_WHY: TStringField;
        SQLQuery_Articulos_a_Elegirdescripcion: TStringField;
        SQLQuery_Articulos_a_Elegirdescripcion_para_TPV: TStringField;
        SQLQuery_Articulos_a_Elegirid: TLargeintField;
        SQLQuery_Articulos_a_Elegirid_articulos_familias: TLargeintField;
        SQLQuery_Articulos_a_Elegirid_grupos_cocina: TLargeintField;
        SQLQuery_Articulos_a_Elegirid_impresoras: TLargeintField;
        SQLQuery_Articulos_a_Elegirid_impuestos_Compras: TLargeintField;
        SQLQuery_Articulos_a_Elegirid_impuestos_Ventas: TLargeintField;
        SQLQuery_Articulos_a_Elegirid_proveedores: TLargeintField;
        SQLQuery_Articulos_a_ElegirInsert_Id_User: TLargeintField;
        SQLQuery_Articulos_a_ElegirInsert_WHEN: TDateTimeField;
        SQLQuery_Articulos_a_ElegirMinimo_Variacion_Actualizar_en_tanto_por_ciento: TBCDField;
        SQLQuery_Articulos_a_ElegirOT_descripcion_familia: TStringField;
        SQLQuery_Articulos_a_ElegirOT_descripcion_grupo_cocina: TStringField;
        SQLQuery_Articulos_a_ElegirOT_descripcion_impresora_comandas: TStringField;
        SQLQuery_Articulos_a_ElegirOT_descripcion_impto_compras: TStringField;
        SQLQuery_Articulos_a_ElegirOT_descripcion_impto_ventas: TStringField;
        SQLQuery_Articulos_a_ElegirOT_descripcion_proveedor: TStringField;
        SQLQuery_Articulos_a_ElegirPedir_precio_venta_SN: TStringField;
        SQLQuery_Articulos_a_ElegirPVP: TBCDField;
        SQLQuery_Articulos_a_ElegirPVP_Impuestos_Incluidos: TBCDField;
        SQLQuery_Articulos_a_ElegirTiempo_asignado: TBCDField;
        SQLQuery_Articulos_a_ElegirTipo_de_articulo: TStringField;
        SQLQuery_Articulos_a_ElegirVenta_por_peso_SN: TStringField;
        SQLQuery_Articulos_a_ElegirVisualizar_en_terminales_SN: TStringField;
        TabSheet_Busqueda_Concreta: TTabSheet;
        TabSheet_Filtros_Generales: TTabSheet;

        procedure Boton_Elegir_id_articulos_familiasClick(Sender: TObject);
        procedure Boton_Elegir_id_proveedoresClick(Sender: TObject);
        procedure ComboBox_FiltrosChange(Sender: TObject);
        procedure Edit_Descripcion_id_articulos_familiasClick(Sender: TObject);
        procedure Edit_Descripcion_id_proveedoresClick(Sender: TObject);
        procedure Filtrar_Principal_Sin_Preguntar;
        procedure Obligar_como_Filtrado_Principal;
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
        procedure Filtrar_tablas_ligadas;
        procedure Refrescar_Registros;
        function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
        procedure Cerramos_Tablas;
        procedure Cerramos_Tablas_Ligadas;
        procedure FormDestroy(Sender: TObject);
        procedure para_Empezar;
        procedure FormActivate(Sender: TObject);
        procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
        procedure FormCreate(Sender: TObject);
        procedure SQLQuery_Articulos_a_ElegirAfterPost(DataSet: TDataSet);
        procedure SQLQuery_Articulos_a_ElegirAfterScroll(DataSet: TDataSet);
        procedure SQLQuery_Articulos_a_ElegirBeforePost(DataSet: TDataSet);
        procedure SQLQuery_Articulos_a_ElegirCalcFields(DataSet: TDataSet);

    private
        { private declarations }
        private_Salir_OK : Boolean;
        private_Order_By : array of TOrder_By;
    public
        { public declarations }
        public_Solo_Ver                              : Boolean;
        public_Elegimos                              : Boolean;
        public_Menu_Worked                           : Integer;
        public_Rgtro_Seleccionado                    : Boolean;
        public_id_articulo_que_no_tiene_que_aparecer : ShortString;
    end;

var
    form_articulos_007: Tform_articulos_007;

implementation

{$R *.lfm}

uses menu, dm_articulos_elegir, articulos_000;

{ Tform_articulos_007 }

procedure Tform_articulos_007.FormActivate(Sender: TObject);
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

procedure Tform_articulos_007.FormClose(Sender: TObject; var CloseAction: TCloseAction);
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
    end else begin
      { ********************************************************************
        Fue correcto el modo como quiere BitBtn_SALIR de la aplicación
        ******************************************************************** }
    end;
end;

procedure Tform_articulos_007.FormCreate(Sender: TObject);
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

procedure Tform_articulos_007.FormDestroy(Sender: TObject);
begin
    Cerramos_Tablas;
end;

procedure Tform_articulos_007.para_Empezar;
begin
  { ****************************************************************************
    Solo para formularios que traten con datos
    **************************************************************************** }
    if UTI_GEN_Form_Abierto_Ya('DataModule_Articulos_Elegir') = False then
    begin
        DataModule_Articulos_Elegir := TDataModule_Articulos_Elegir.Create(Application);
    end;

  { ****************************************************************************
    Preparamos los diferentes tipos de orden preconfigurados
    **************************************************************************** }
    // ARTICULOS FAMILIAS
    SetLength(private_Order_By, 1);

    private_Order_By[0].Titulo       := rs_para_Empezar_1; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[0].Memo_OrderBy := 'a.descripcion ASC';

    Memo_OrderBy.Lines.Text := private_Order_By[0].Memo_OrderBy;

    UTI_TB_Rellenar_ComboBox_Orden( true,
                                    ComboBox_Filtros,
                                    private_Order_By,
                                    0 );

    Obligar_como_Filtrado_Principal;

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

procedure Tform_articulos_007.Obligar_como_Filtrado_Principal;
var
  var_SQL_ADD : TStrings;
begin
  var_SQL_ADD := TStringList.Create;

  if Trim(public_id_articulo_que_no_tiene_que_aparecer) <> '' then
  begin
    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'a.id <> ' + Trim(public_id_articulo_que_no_tiene_que_aparecer) );
    UTI_TB_SQL_ADD( true,
                    Memo_Filtros.Lines,
                    var_SQL_ADD ); // para que no elija ninguna ya elegida como superior
  end;

  var_SQL_ADD.Free;
end;

procedure Tform_articulos_007.SQLQuery_Articulos_a_ElegirAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'articulos',
                       DataModule_Articulos_Elegir.SQLTransaction_Art_Elegir,
                       SQLQuery_Articulos_a_Elegir,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros;
end;

procedure Tform_articulos_007.SQLQuery_Articulos_a_ElegirAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure Tform_articulos_007.SQLQuery_Articulos_a_ElegirBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Articulos_a_Elegir );
end;

procedure Tform_articulos_007.SQLQuery_Articulos_a_ElegirCalcFields(DataSet: TDataSet);
begin
    // ********************************************************************************************* //
    // ** PARA DAR VALOR A CAMPOS CALCULADOS                                                      ** //
    // ********************************************************************************************* //
end;

procedure Tform_articulos_007.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_Articulos_Elegir.SQLConnector_Art_Elegir,
                      DataModule_Articulos_Elegir.SQLTransaction_Art_Elegir,
                      SQLQuery_Articulos_a_Elegir ) = false then UTI_GEN_Salir;

    DataModule_Articulos_Elegir.Free;
end;

procedure Tform_articulos_007.Cerramos_Tablas_Ligadas;
begin
{ ESTE form NO TIENE TABLAS LIGADAS

    if UTI_TB_Cerrar( DataModule_del_form_000.SQLConnector_de_la_tabla,
                      DataModule_Users.SQLTransaction_de_la_tabla,
                      SQLQuery_la_tabla ) = false then UTI_GEN_Salir;
}
end;

procedure Tform_articulos_007.Refrescar_Registros;
var var_descripcion : String;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_descripcion := '';

    if SQLQuery_Articulos_a_Elegir.RecordCount > 0 then
    begin
        var_descripcion := SQLQuery_Articulos_a_Elegir.FieldByName('descripcion').asString;
    end;

    Filtrar_Principal_Sin_Preguntar;

    if Trim(var_descripcion) <> '' then
    begin
         SQLQuery_Articulos_a_Elegir.Locate('descripcion', var_descripcion, []);
    end;
end;

procedure Tform_articulos_007.Filtrar_tablas_ligadas;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
begin
    if SQLQuery_Articulos_a_Elegir.RecordCount = 0 then Exit;

    if SQLQuery_Articulos_a_Elegir.State = dsInsert then
    begin
        Cerramos_Tablas_Ligadas;
        Exit;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    // ********************************************************************************************* //
    // ** NO TIENE TABLAS LIGADAS                                                                 ** //
    // ********************************************************************************************* //

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;
end;

function Tform_articulos_007.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
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
    // ** Primero buscaremos en la descripción del artículo                                       ** //
    // ********************************************************************************************* //
    if Trim(Edit_Descripcion.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'a.descripcion LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Descripcion.Text) + '%') );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Primero buscaremos en la descripción del artículo para el TPV                           ** //
    // ********************************************************************************************* //
    if Trim(Edit_Descripcion_Para_Terminal.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'a.descripcion_para_TPV LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Descripcion_Para_Terminal.Text) + '%') );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la familia del artículo                                            ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_articulos_familias.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'a.id_articulos_familias = ' + Trim(Edit_id_articulos_familias.Text) );
        UTI_TB_SQL_ADD( false,
                        var_a_Filtrar,
                        var_SQL_ADD );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por el proveedor habitual                                              ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_proveedores.Text) <> '' then
    begin
        var_SQL_ADD.Clear;
        var_SQL_ADD.Add( 'a.id_proveedores = ' + Trim(Edit_id_proveedores.Text) );
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

                              DataModule_Articulos_Elegir.SQLTransaction_Art_Elegir,
                              DataModule_Articulos_Elegir.SQLConnector_Art_Elegir,
                              SQLQuery_Articulos_a_Elegir,

                              // name_tabla,
                              'a',

                              RadioGroup_Bajas.ItemIndex,

                              // SELECT_SQL,
                              'SELECT a.*,' + ' ' +

                                     'iv.descripcion OT_descripcion_impto_ventas,' + ' ' +
                                     'ic.descripcion OT_descripcion_impto_compras,' + ' ' +

                                     'p.nombre_propietario AS OT_descripcion_proveedor,' + ' ' +

                                     'g.descripcion AS OT_descripcion_grupo_cocina,' + ' ' +
                                     'im.descripcion AS OT_descripcion_impresora_comandas,' + ' ' +

                                     'f.descripcion AS OT_descripcion_familia' + ' ' +

                              'FROM articulos AS a' + ' ' +

                              'LEFT JOIN impuestos AS iv' + ' ' +
                              'ON a.id_impuestos_Ventas = iv.id' + ' ' +

                              'LEFT JOIN impuestos AS ic' + ' ' +
                              'ON a.id_impuestos_Compras = ic.id' + ' ' +

                              'LEFT JOIN proveedores AS p' + ' ' +
                              'ON a.id_proveedores = p.id' + ' ' +

                              'LEFT JOIN grupos_cocina AS g' + ' ' +
                              'ON a.id_grupos_cocina = g.id' + ' ' +

                              'LEFT JOIN impresoras AS im' + ' ' +
                              'ON a.id_impresoras = im.id' + ' ' +

                              'LEFT JOIN articulos_familias AS f' + ' ' +
                              'ON a.id_articulos_familias = f.id' + ' ',

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

procedure Tform_articulos_007.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    If public_Elegimos then Seleccionado_Rgtro;
end;

procedure Tform_articulos_007.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure Tform_articulos_007.DBGrid_PrincipalDrawColumnCell(Sender: TObject;
    const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    UTI_GEN_Dibujar_Grid( Sender, SQLQuery_Articulos_a_Elegir, Rect, DataCol, Column, State );
end;

procedure Tform_articulos_007.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then
    begin
        If public_Elegimos then Seleccionado_Rgtro;
    end;
end;

procedure Tform_articulos_007.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

procedure Tform_articulos_007.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_articulos_007.Seleccionado_Rgtro;
begin
    private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    public_Rgtro_Seleccionado := true;
    Close;
end;

procedure Tform_articulos_007.BitBtn_SeleccionarClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
end;

procedure Tform_articulos_007.DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
begin
    //Filtrar_tablas_ligadas;

    case Button of
        nbRefresh : begin
            Refrescar_Registros;
            Abort;
        end;
    end;
end;

procedure Tform_articulos_007.no_Tocar;
begin
    // No hay nada para no tocar
end;

procedure Tform_articulos_007.BitBtn_FiltrarClick(Sender: TObject);
begin
    if PageControl_Filtros.ActivePage = TabSheet_Busqueda_Concreta then
    begin
        Filtrar_Principal_Sin_Preguntar;
    end else begin
        RadioGroup_Bajas.ItemIndex := Filtrar_Principal( true );
    end;
end;

procedure Tform_articulos_007.Presentar_Datos;
begin
    // No hay nada para presentar
end;

procedure Tform_articulos_007.Filtrar_Principal_Sin_Preguntar;
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

procedure Tform_articulos_007.Boton_Elegir_id_articulos_familiasClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_articulos_000.SQLQuery_Articulos do
    begin
        if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = true then
        begin
            var_Registro := form_articulos_000.Elegir_Familia;
        end;

        if var_Registro.id_1 <> '' then
        begin
            Edit_id_articulos_familias.Text             := Trim(var_Registro.id_1);
            Edit_Descripcion_id_articulos_familias.Text := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_articulos_007.Boton_Elegir_id_proveedoresClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Modulo_Proveedores( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_proveedores.Text             := Trim(var_Registro.id_1);
        Edit_Descripcion_id_proveedores.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_articulos_007.ComboBox_FiltrosChange(Sender: TObject);
begin
    Memo_OrderBy.Lines.Clear;
    Memo_OrderBy.Lines.Add( private_Order_By[ComboBox_Filtros.ItemIndex].Memo_OrderBy );
    BitBtn_FiltrarClick(Nil);
end;

procedure Tform_articulos_007.Edit_Descripcion_id_articulos_familiasClick(Sender: TObject);
begin
    Edit_id_articulos_familias.Text             := '';
    Edit_Descripcion_id_articulos_familias.Text := '';
end;

procedure Tform_articulos_007.Edit_Descripcion_id_proveedoresClick(
  Sender: TObject);
begin
    Edit_id_proveedores.Text             := '';
    Edit_Descripcion_id_proveedores.Text := '';
end;

end.


