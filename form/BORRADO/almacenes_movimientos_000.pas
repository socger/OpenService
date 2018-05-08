unit almacenes_movimientos_000;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, DateTimePicker, Forms, Controls, Graphics, Dialogs,
  Buttons, StdCtrls, DBGrids, DbCtrls, ExtCtrls, Grids, ComCtrls, variants, utilidades_general,
  utilidades_rgtro, utilidades_bd, utilidades_datos_tablas, utilidades_stock, utilidades_usuarios,
  utilidades_forms_Filtrar, LCLTranslator;

resourcestring
  SQLQuery_AMCalcFields_1   = 'Traspaso entre almacenes';
  SQLQuery_AMCalcFields_2   = 'Entrada manual';

  rs_BitBtn_ImprimirClick_1 = ', con almacén de destino = ';
  rs_BitBtn_ImprimirClick_2 = ', con almacén de origen = ';
  rs_BitBtn_ImprimirClick_3 = ', entre ';
  rs_BitBtn_ImprimirClick_4 = ' y el ';
  rs_BitBtn_ImprimirClick_5 = ', con concepto = ';

  rs_para_Empezar_1         = 'Por fecha';
  rs_para_Empezar_2         = 'Por almacén de destino';
  rs_para_Empezar_3         = 'Por nombre';

type

  { Tform_almacenes_movimientos_000 }

  Tform_almacenes_movimientos_000 = class(TForm)
    BitBtn_Filtrar: TBitBtn;
    BitBtn_Imprimir: TBitBtn;
    BitBtn_SALIR: TBitBtn;
    BitBtn_Seleccionar: TBitBtn;
    BitBtn_Ver_Situacion_Registro: TBitBtn;
    Boton_Elegir_conceptos_almacen_traspaso: TBitBtn;
    Boton_Elegir_id_almacenes_destino: TBitBtn;
    Boton_Elegir_id_almacenes_origen: TBitBtn;
    ComboBox_Filtros: TComboBox;
    DataSource_AM: TDataSource;
    DataSource_AMD: TDataSource;
    DateTimePicker_Desde: TDateTimePicker;
    DateTimePicker_Hasta: TDateTimePicker;
    DBGrid_Principal: TDBGrid;
    DBNavigator1: TDBNavigator;
    Edit_Descripcion_conceptos_almacen_traspaso: TEdit;
    Edit_Descripcion_id_almacenes_destino: TEdit;
    Edit_Descripcion_id_almacenes_origen: TEdit;
    Edit_id_almacenes_destino: TEdit;
    Edit_id_almacenes_origen: TEdit;
    Edit_id_conceptos_almacen_traspaso: TEdit;
    Image_Confirmado: TImage;
    Label15: TLabel;
    Label16: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label_Fecha2: TLabel;
    Memo_Filtros: TMemo;
    Memo_OrderBy: TMemo;
    PageControl_Filtros: TPageControl;
    RadioGroup_Bajas: TRadioGroup;
    Shape2: TShape;
    SQLQuery_AM: TSQLQuery;
    SQLQuery_AMChange_Id_User: TLargeintField;
    SQLQuery_AMChange_WHEN: TDateTimeField;
    SQLQuery_AMDChange_Id_User: TLargeintField;
    SQLQuery_AMDChange_WHEN: TDateTimeField;
    SQLQuery_AMDDel_Id_User: TLargeintField;
    SQLQuery_AMDDel_WHEN: TDateTimeField;
    SQLQuery_AMDDel_WHY: TStringField;
    SQLQuery_AMDel_Id_User: TLargeintField;
    SQLQuery_AMDel_WHEN: TDateTimeField;
    SQLQuery_AMDel_WHY: TStringField;
    SQLQuery_AMDid_almacenes_destino: TLargeintField;
    SQLQuery_AMDid_almacenes_movimientos: TLargeintField;
    SQLQuery_AMDid_almacenes_origen: TLargeintField;
    SQLQuery_AMDid_articulos: TLargeintField;
    SQLQuery_AMDInsert_Id_User: TLargeintField;
    SQLQuery_AMDInsert_WHEN: TDateTimeField;
    SQLQuery_AMDOT_descripcion_articulo: TStringField;
    SQLQuery_AMDOT_Tipo_de_articulo: TStringField;
    SQLQuery_AMDUnidades: TBCDField;
    SQLQuery_AMFecha_Movimiento: TDateTimeField;
    SQLQuery_AMid: TLargeintField;
    SQLQuery_AMid_almacenes_destino: TLargeintField;
    SQLQuery_AMid_almacenes_origen: TLargeintField;
    SQLQuery_AMid_conceptos_almacen_traspaso: TLargeintField;
    SQLQuery_AMInsert_Id_User: TLargeintField;
    SQLQuery_AMInsert_WHEN: TDateTimeField;
    SQLQuery_AMOT_descripcion_almacen_destino: TStringField;
    SQLQuery_AMOT_descripcion_almacen_origen: TStringField;
    SQLQuery_AMOT_descripcion_conceptos_almacen_traspaso: TStringField;
    SQLQuery_AMOT_Tipo_Movimiento_Descripcion1: TStringField;
    SQLQuery_AMD: TSQLQuery;
    SQLQuery_AMDid: TLargeintField;
    SQLQuery_AMTipo_Movimiento: TStringField;
    TabSheet_Busqueda_Concreta: TTabSheet;
    TabSheet_Filtros_Generales: TTabSheet;

    procedure Boton_Elegir_conceptos_almacen_traspasoClick(Sender: TObject);
    procedure Boton_Elegir_id_almacenes_destinoClick(Sender: TObject);
    procedure Boton_Elegir_id_almacenes_origenClick(Sender: TObject);
    procedure ComboBox_FiltrosChange(Sender: TObject);
    procedure Edit_Descripcion_conceptos_almacen_traspasoClick(Sender: TObject);
    procedure Edit_Descripcion_id_almacenes_destinoClick(Sender: TObject);
    procedure Edit_Descripcion_id_almacenes_origenClick(Sender: TObject);
    procedure Filtrar_Principal_Sin_Preguntar;
    procedure para_Empezar;
    procedure FormCreate(Sender: TObject);
    procedure Insertar_Registro;
    procedure Editar_Registro;
    procedure BitBtn_FiltrarClick(Sender: TObject);
    procedure BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
    function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
    function  Filtrar_AMD( param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
    procedure Presentar_Datos;
    procedure no_Tocar;
    procedure BitBtn_ImprimirClick(Sender: TObject);
    procedure BitBtn_SeleccionarClick(Sender: TObject);
    procedure DBGrid_PrincipalCellClick(Column: TColumn);
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure Seleccionado_Rgtro;
    procedure DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Filtrar_tablas_ligadas;
    procedure Refrescar_Registros;
    procedure Refrescar_Registros_AMD;
    procedure BitBtn_SALIRClick(Sender: TObject);
    procedure Cerramos_Tablas;
    procedure Cerramos_Tablas_Ligadas;
    procedure DBGrid_PrincipalDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure RadioGroup_BajasClick(Sender: TObject);
    procedure SQLQuery_AMAfterPost(DataSet: TDataSet);
    procedure SQLQuery_AMAfterScroll(DataSet: TDataSet);
    procedure SQLQuery_AMBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_AMBeforePost(DataSet: TDataSet);
    procedure SQLQuery_AMCalcFields(DataSet: TDataSet);
    procedure SQLQuery_AMDAfterPost(DataSet: TDataSet);
    procedure SQLQuery_AMDBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_AMDBeforePost(DataSet: TDataSet);
    procedure SQLQuery_AMDCalcFields(DataSet: TDataSet);
  private
      { private declarations }
      private_Salir_OK     : Boolean;
      private_Order_By     : array of TOrder_By;
      private_Order_By_AMD : array of TOrder_By;
  public
      { public declarations }
      public_Solo_Ver           : Boolean;
      public_Elegimos           : Boolean;
      public_Menu_Worked        : Integer;
      public_Rgtro_Seleccionado : Boolean;
  end;

var
  form_almacenes_movimientos_000: Tform_almacenes_movimientos_000;

implementation

{$R *.lfm}

uses dm_almacenes_movimientos, menu, almacenes_movimientos_001;

{ Tform_almacenes_movimientos_000 }

procedure Tform_almacenes_movimientos_000.FormActivate(Sender: TObject);
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

procedure Tform_almacenes_movimientos_000.FormClose(Sender: TObject; var CloseAction: TCloseAction);
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
            if form_Menu.public_Salir_OK = False then CloseAction := CloseAction.caNone;
        end
    else
        begin
          { ********************************************************************
            Fue correcto el modo como quiere BitBtn_SALIR de la aplicación
            ******************************************************************** }
        end;
end;

procedure Tform_almacenes_movimientos_000.FormDestroy(Sender: TObject);
begin
    Cerramos_Tablas;
end;

procedure Tform_almacenes_movimientos_000.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_Almacenes_Movimientos.SQLConnector_AM,
                      DataModule_Almacenes_Movimientos.SQLTransaction_AM,
                      SQLQuery_AM ) = false then UTI_GEN_Salir;

    DataModule_Almacenes_Movimientos.Free;
end;

procedure Tform_almacenes_movimientos_000.Cerramos_Tablas_Ligadas;
begin
    if UTI_TB_Cerrar( DataModule_Almacenes_Movimientos.SQLConnector_AMD,
                      DataModule_Almacenes_Movimientos.SQLTransaction_AMD,
                      SQLQuery_AMD ) = false then UTI_GEN_Salir;
end;

procedure Tform_almacenes_movimientos_000.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    If public_Elegimos then
         Seleccionado_Rgtro
    else Editar_Registro;
end;

procedure Tform_almacenes_movimientos_000.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_almacenes_movimientos_000.RadioGroup_BajasClick(Sender: TObject);
begin
    Refrescar_Registros;
end;

procedure Tform_almacenes_movimientos_000.SQLQuery_AMAfterPost(DataSet: TDataSet);
begin
    UTI_RGTRO_Grabar( 'almacenes_movimientos',
                      DataModule_Almacenes_Movimientos.SQLTransaction_AM,
                      SQLQuery_AM );

    Refrescar_Registros;
end;

procedure Tform_almacenes_movimientos_000.SQLQuery_AMAfterScroll(DataSet: TDataSet
  );
begin
    Filtrar_tablas_ligadas;
end;

procedure Tform_almacenes_movimientos_000.SQLQuery_AMBeforeEdit(DataSet: TDataSet
  );
begin
    UTI_RGTRO_param_assign_value_Edit( SQLQuery_AM );
end;

procedure Tform_almacenes_movimientos_000.SQLQuery_AMBeforePost(DataSet: TDataSet
  );
begin
    UTI_RGTRO_param_assign_value( SQLQuery_AM );
end;

procedure Tform_almacenes_movimientos_000.SQLQuery_AMCalcFields(DataSet: TDataSet
  );
begin
    with SQLQuery_AM do
    begin
        if FieldByName('Tipo_Movimiento').AsString = '1' then
        begin
            FieldByName('OT_Tipo_Movimiento_Descripcion').AsString := SQLQuery_AMCalcFields_1;
        end;

        if FieldByName('Tipo_Movimiento').AsString = '2' then
        begin
            FieldByName('OT_Tipo_Movimiento_Descripcion').AsString := SQLQuery_AMCalcFields_2;
        end;
    end;
end;

procedure Tform_almacenes_movimientos_000.Refrescar_Registros;
var var_Fecha_Movimiento     : TDateTime;
    var_Tipo_Movimiento      : ShortString;
    var_id_almacenes_destino : Largeint;
    var_Insert_WHEN          : TDateTime;
    var_Insert_Id_User       : Largeint;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_Tipo_Movimiento := '';

    with SQLQuery_AM do
    begin
        if RecordCount > 0 then
        begin
            var_Fecha_Movimiento     := FieldByName('Fecha_Movimiento').Value;
            var_Tipo_Movimiento      := FieldByName('Tipo_Movimiento').Value;
            var_id_almacenes_destino := FieldByName('id_almacenes_destino').Value;
            var_Insert_WHEN          := FieldByName('Insert_WHEN').Value;
            var_Insert_Id_User       := FieldByName('Insert_Id_User').Value;
        end;
    end;

    Filtrar_Principal_Sin_Preguntar;

    if Trim(var_Tipo_Movimiento) <> '' then
    begin
         SQLQuery_AM.Locate( 'Fecha_Movimiento;' +
                             'Tipo_Movimiento;' +
                             'id_almacenes_destino;' +
                             'Insert_WHEN;' +
                             'Insert_Id_User',

                             VarArrayOf( [ var_Fecha_Movimiento,
                                           var_Tipo_Movimiento,
                                           var_id_almacenes_destino,
                                           var_Insert_WHEN,
                                           var_Insert_Id_User ] ),

                             [] );

       { jeromillo, Este locate dice que si que encuentra el registro, pero no lo hace asi que igual es problema
         del query y tengo que cambiarlo }

    end;
end;

procedure Tform_almacenes_movimientos_000.Refrescar_Registros_AMD;
var var_Lineas_Filtro            : TStrings;
    var_Lineas_OrderBy           : TStrings;

    var_id_almacenes_movimientos : Largeint;
    var_id_articulos             : Largeint;
    var_Unidades                 : Extended;

    var_Hay_Datos                : Boolean;

    var_ver_Bajas                : ShortInt;
begin
    // ********************************************************************************************* //
    // ** Solo si la cabecera está en modo EDIT se abren las tablas hijas                         ** //
    // ********************************************************************************************* //
    if SQLQuery_AM.State <> dsEdit then Exit;

    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_Hay_Datos := false;

    if SQLQuery_AMD.RecordCount > 0 then
    begin
        var_Hay_Datos                := true;
        var_id_almacenes_movimientos := SQLQuery_AMD.FieldByName('id_almacenes_movimientos').Value;
        var_id_articulos             := SQLQuery_AMD.FieldByName('id_articulos').Value;
        var_Unidades                 := SQLQuery_AMD.FieldByName('Unidades').Value;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Clear;
    var_Lineas_OrderBy.Clear;

    if Trim(SQLQuery_AM.FieldByName('id').AsString) <> '' then
         var_Lineas_Filtro.Add('id_almacenes_movimientos = ' + Trim(SQLQuery_AM.FieldByName('id').AsString))
    else var_Lineas_Filtro.Add('id_almacenes_movimientos = Null');

    var_ver_Bajas := RadioGroup_Bajas.ItemIndex;
    if UTI_GEN_Form_Abierto_Ya('form_almacenes_movimientos_001') = true then
    begin
        var_ver_Bajas := form_almacenes_movimientos_001.RadioGroup_Bajas.ItemIndex;
    end;

    Filtrar_AMD( var_ver_Bajas,
                 false,
                 var_Lineas_Filtro,
                 var_Lineas_OrderBy );

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;

    if var_Hay_Datos = true then
    begin
         SQLQuery_AMD.Locate( 'id_almacenes_movimientos;id_articulos;Unidades',
                              VarArrayOf( [ var_id_almacenes_movimientos, var_id_articulos, var_Unidades ] ),
                              [] );
    end;
end;

procedure Tform_almacenes_movimientos_000.Filtrar_tablas_ligadas;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
begin
    if SQLQuery_AM.RecordCount = 0 then Exit;

    if SQLQuery_AM.State = dsInsert then
    begin
        Cerramos_Tablas_Ligadas;
        Exit;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    // ********************************************************************************************* //
    // ** ALMACENES MOVIMIENTOS DETALLES                                                          ** //
    // ********************************************************************************************* //
    UTI_RGTRO_Add_to_Where( true,
                            var_Lineas_Filtro,
                            'amd.id_almacenes_movimientos = ' + SQLQuery_AM.FieldByName('id').AsString );

    var_Lineas_OrderBy.Clear;

    Filtrar_AMD( RadioGroup_Bajas.ItemIndex,
                 false,
                 var_Lineas_Filtro,
                 var_Lineas_OrderBy );

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;
end;

procedure Tform_almacenes_movimientos_000.DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    UTI_GEN_Dibujar_Grid( Sender, SQLQuery_AM, Rect, DataCol, Column, State );
end;

procedure Tform_almacenes_movimientos_000.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then
    begin
        If public_Elegimos then
             Seleccionado_Rgtro
        else Editar_Registro;
    end;
end;

procedure Tform_almacenes_movimientos_000.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

procedure Tform_almacenes_movimientos_000.Seleccionado_Rgtro;
begin
    private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    public_Rgtro_Seleccionado := true;
    Close;
end;

procedure Tform_almacenes_movimientos_000.DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
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
                UTI_RGTRO_Borrar_Cabecera_y_Detalle( 'id_almacenes_movimientos',
                                                     'almacenes_movimientos',
                                                     'almacenes_movimientos_detalles',
                                                     SQLQuery_AM,
                                                     SQLQuery_AMD,
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

procedure Tform_almacenes_movimientos_000.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure Tform_almacenes_movimientos_000.BitBtn_SeleccionarClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
end;

procedure Tform_almacenes_movimientos_000.BitBtn_ImprimirClick(Sender: TObject);
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

    if Trim(Edit_Descripcion_id_almacenes_destino.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            rs_BitBtn_ImprimirClick_1 +
                            Trim(Edit_Descripcion_id_almacenes_destino.Text);
    end;

    if Trim(Edit_Descripcion_id_almacenes_origen.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            rs_BitBtn_ImprimirClick_2 +
                            Trim(Edit_Descripcion_id_almacenes_origen.Text);
    end;

    if (not DateTimePicker_Hasta.DateIsNull) or
       (not DateTimePicker_Desde.DateIsNull) then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            rs_BitBtn_ImprimirClick_3 +
                            DateToStr(DateTimePicker_Desde.Date) +
                            rs_BitBtn_ImprimirClick_4 +
                            DateToStr(DateTimePicker_Hasta.Date);
    end;

    if Trim(Edit_Descripcion_conceptos_almacen_traspaso.Text) <> '' then
    begin
        var_Ordenado_por := var_Ordenado_por +
                            rs_BitBtn_ImprimirClick_5 +
                            Trim(Edit_Descripcion_conceptos_almacen_traspaso.Text);
    end;

    // ********************************************************************************************* //
    // ** Configuramos la llamada al generador de informes                                        ** //
    // ********************************************************************************************* //
    var_Ficheros := TStringList.Create;

    UTI_GEN_Informes( var_Ordenado_por,
                      SQLQuery_AM,
                      DataSource_AM,
                      DataSource_AMD,
                      Nil,
                      Nil,
                      public_Menu_Worked,
                      public_Solo_Ver,
                      '',
                      '',
                      var_Ficheros );

    var_Ficheros.Free;
end;

procedure Tform_almacenes_movimientos_000.no_Tocar;
begin
    BitBtn_Imprimir.Enabled := False;
end;

procedure Tform_almacenes_movimientos_000.Presentar_Datos;
begin
     /// guardar por lo que pueda pasar
end;

procedure Tform_almacenes_movimientos_000.BitBtn_FiltrarClick(Sender: TObject);
begin
    if PageControl_Filtros.ActivePage = TabSheet_Busqueda_Concreta then
    begin
        Filtrar_Principal_Sin_Preguntar;
    end else begin
        RadioGroup_Bajas.ItemIndex := Filtrar_Principal( true );
    end;
end;

procedure Tform_almacenes_movimientos_000.BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if SQLQuery_AM.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'almacenes_movimientos',
                                           SQLQuery_AM,
                                           DataSource_AM,
                                           DBGrid_Principal );
        end;
    end;
end;

function Tform_almacenes_movimientos_000.Filtrar_AMD( param_ver_bajas : ShortInt;
                                                      param_Cambiamos_Filtro : Boolean;
                                                      param_Lineas_Filtro,
                                                      param_Lineas_OrderBy : TStrings ) : ShortInt;
var var_Registro_CRUD : TRegistro_CRUD;
    var_ctdad_Rgtros  : Integer;
begin
    var_Registro_CRUD := UTI_DATOS_TABLA_almacenes_movimientos_detalles_CRUD;
    var_ctdad_Rgtros  := -1;

    if Trim(param_Lineas_OrderBy.Text) = '' then
    begin
         param_Lineas_OrderBy.Text := private_Order_By_AMD[0].Memo_OrderBy;
    end;

    Result := UTI_TB_Filtrar( private_Order_By_AMD,

                              var_Registro_CRUD.Delete_SQL,
                              var_Registro_CRUD.Update_SQL,
                              var_Registro_CRUD.Insert_SQL,

                              var_ctdad_Rgtros,
                              DataModule_Almacenes_Movimientos.SQLTransaction_AMD,
                              DataModule_Almacenes_Movimientos.SQLConnector_AMD,
                              SQLQuery_AMD,

                              var_Registro_CRUD.name_tabla,
                              param_ver_bajas,

                              var_Registro_CRUD.SELECT_SQL,

                              param_Lineas_Filtro,
                              param_Lineas_OrderBy,
                              '',

                              param_Cambiamos_Filtro );
end;

function Tform_almacenes_movimientos_000.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
var var_Registro_CRUD : TRegistro_CRUD;
    var_ctdad_Rgtros  : Integer;
    var_a_Filtrar     : TStrings;
begin
    var_a_Filtrar := TStringList.Create;
    var_a_Filtrar.Clear;

    var_Registro_CRUD := UTI_DATOS_TABLA_almacenes_movimientos_CRUD;
    var_ctdad_Rgtros  := -1;

    // ********************************************************************************************* //
    // ** AHORA PONDREMOS EL RESTO DE LOS FILTROS QUE NO SON GENERALES                            ** //
    // ********************************************************************************************* //
    // ** Ahora buscaremos por la forma de pago                                                   ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_conceptos_almacen_traspaso.Text) <> '' then
    begin
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'am.id_conceptos_almacen_traspaso = ' + Trim(Edit_id_conceptos_almacen_traspaso.Text) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la forma el almacén de destino                                     ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_almacenes_destino.Text) <> '' then
    begin
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'am.id_almacenes_destino = ' + Trim(Edit_id_almacenes_destino.Text) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la forma el almacén de destino                                     ** //
    // ********************************************************************************************* //
    if Trim(Edit_id_almacenes_origen.Text) <> '' then
    begin
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'am.id_almacenes_origen = ' + Trim(Edit_id_almacenes_origen.Text) );
    end;

    // ********************************************************************************************* //
    // ** Ahora buscaremos por la fecha del movimiento                                            ** //
    // ********************************************************************************************* //
    if (not DateTimePicker_Hasta.DateIsNull) and
       (not DateTimePicker_Desde.DateIsNull) then
    begin
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'am.Fecha_Movimiento <= ' +
                                UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Hasta.Date, false) +
                                                  ' 23:59:59' ) );
        UTI_RGTRO_Add_to_Where( false,
                                var_a_Filtrar,
                                'am.Fecha_Movimiento >= ' +
                                UTI_GEN_Comillas( UTI_GEN_Format_Fecha_Hora(DateTimePicker_Desde.Date, false) +
                                                  ' 00:00:00' ) );
    end;

    // ********************************************************************************************* //
    // ** Pasamos a filtrar los registros                                                         ** //
    // ********************************************************************************************* //
    Result := UTI_TB_Filtrar( private_Order_By,

                              var_Registro_CRUD.Delete_SQL,
                              var_Registro_CRUD.Update_SQL,
                              var_Registro_CRUD.Insert_SQL,

                              var_ctdad_Rgtros,
                              DataModule_Almacenes_Movimientos.SQLTransaction_AM,
                              DataModule_Almacenes_Movimientos.SQLConnector_AM,
                              SQLQuery_AM,

                              var_Registro_CRUD.name_tabla,
                              RadioGroup_Bajas.ItemIndex,

                              var_Registro_CRUD.SELECT_SQL,

                              Memo_Filtros.Lines,
                              Memo_OrderBy.Lines,
                              var_a_Filtrar.Text,

                              param_Cambiamos_Filtro );

    var_a_Filtrar.Free;

    if SQLQuery_AM.RecordCount = 0 then
    begin
        Cerramos_Tablas_Ligadas;
    end;

    //Filtrar_tablas_ligadas;
end;

procedure Tform_almacenes_movimientos_000.Insertar_Registro;
var var_msg                  : TStrings;
    var_Fecha_Movimiento     : String;
    var_id_almacenes_destino : String;
    var_Tipo_Movimiento      : String;
begin
    with SQLQuery_AM do
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
                    Insert;

                    //Filtrar_tablas_ligadas;

                    FieldByName('Fecha_Movimiento').Value := Now;

                    Application.CreateForm(Tform_almacenes_movimientos_001, form_almacenes_movimientos_001);

                    form_almacenes_movimientos_001.DBGrid_AMD.Color := clSilver;

                    form_almacenes_movimientos_001.RadioGroup_Bajas.ItemIndex := RadioGroup_Bajas.ItemIndex;

                    form_almacenes_movimientos_001.para_Empezar;

                    form_almacenes_movimientos_001.ShowModal;
                    if form_almacenes_movimientos_001.public_Pulso_Aceptar = true then
                    begin
                        FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
                        FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                        var_Fecha_Movimiento                := FieldByName('Fecha_Movimiento').AsString;
                        var_id_almacenes_destino            := FieldByName('id_almacenes_destino').AsString;
                        var_Tipo_Movimiento                 := FieldByName('Tipo_Movimiento').AsString;

                        UTI_RGTRO_Grabar_Antes( 'almacenes_movimientos', SQLQuery_AM );

                        form_almacenes_movimientos_001.Free;

                        if (FieldByName('Fecha_Movimiento').AsString = var_Fecha_Movimiento)         and
                           (FieldByName('id_almacenes_destino').AsString = var_id_almacenes_destino) and
                           (FieldByName('Tipo_Movimiento').AsString = var_Tipo_Movimiento)           then
                        begin
                            Editar_Registro;
                        end;
                    end else begin
                        Cancel;
                        form_almacenes_movimientos_001.Free;
                    end;
                end;
        end;

        var_msg.Free;
    end;
end;

procedure Tform_almacenes_movimientos_000.Editar_Registro;
var var_msg : TStrings;
    var_id  : ShortString;
begin
    with SQLQuery_AM do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
            begin
                var_id := FieldByName('id').AsString;

                if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
                begin
                    if UTI_RGTRO_isLock( 'almacenes_movimientos',
                                         FieldByName('id').AsString,
                                         true ) = true then
                    begin
                        Exit;
                    end else begin
                        if UTI_RGTRO_Lock( 'almacenes_movimientos',
                                           FieldByName('id').AsString ) = true then
                             Edit
                        else Exit;
                    end;

                    Application.CreateForm(Tform_almacenes_movimientos_001, form_almacenes_movimientos_001);

                    form_almacenes_movimientos_001.RadioGroup_Bajas.ItemIndex := RadioGroup_Bajas.ItemIndex;
                    form_almacenes_movimientos_001.public_Menu_Worked         := public_Menu_Worked;

                    if public_Solo_Ver = true then
                    begin
                        form_almacenes_movimientos_001.public_Solo_Ver := true;
                    end;

                    form_almacenes_movimientos_001.para_Empezar;

                    form_almacenes_movimientos_001.ShowModal;
                    if form_almacenes_movimientos_001.public_Pulso_Aceptar = true then
                        begin
                            if ( Trim(Params.ParamByName('COPY_' + 'Fecha_Movimiento').AsString)              <> Trim(FieldByName('Fecha_Movimiento').AsString) )              or
                               ( Trim(Params.ParamByName('COPY_' + 'Tipo_Movimiento').AsString)               <> Trim(FieldByName('Tipo_Movimiento').AsString) )               or
                               ( Trim(Params.ParamByName('COPY_' + 'id_conceptos_almacen_traspaso').AsString) <> Trim(FieldByName('id_conceptos_almacen_traspaso').AsString) ) or
                               ( Trim(Params.ParamByName('COPY_' + 'id_almacenes_destino').AsString)          <> Trim(FieldByName('id_almacenes_destino').AsString) )          or
                               ( Trim(Params.ParamByName('COPY_' + 'id_almacenes_origen').AsString)           <> Trim(FieldByName('id_almacenes_origen').AsString) )           then
                               begin
                                    FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                                    FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                                    UTI_RGTRO_Grabar_Antes( 'almacenes_movimientos',
                                                            SQLQuery_AM );
                               end
                            else Cancel;
                        end
                    else Cancel;

                    form_almacenes_movimientos_001.Free;

                    UTI_RGTRO_UnLock( 'almacenes_movimientos',
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

procedure Tform_almacenes_movimientos_000.FormCreate(Sender: TObject);
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

procedure Tform_almacenes_movimientos_000.para_Empezar;
begin
  { ****************************************************************************
    Solo para formularios que traten con datos
    **************************************************************************** }
    if UTI_GEN_Form_Abierto_Ya('DataModule_Almacenes_Movimientos') = False then
    begin
        DataModule_Almacenes_Movimientos := TDataModule_Almacenes_Movimientos.Create(Application);
    end;

  { ****************************************************************************
    Preparamos los diferentes tipos de orden preconfigurados
    **************************************************************************** }
    // ALMACENES MOVIMIENTOS
    SetLength(private_Order_By, 2);

    private_Order_By[0].Titulo       := rs_para_Empezar_1; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[0].Memo_OrderBy := 'am.Fecha_Movimiento ASC, am.id_almacenes_destino ASC, am.id_almacenes_origen ASC';

    private_Order_By[1].Titulo       := rs_para_Empezar_2;
    private_Order_By[1].Memo_OrderBy := 'am.id_almacenes_destino ASC, am.Fecha_Movimiento ASC';

    Memo_OrderBy.Lines.Text          := private_Order_By[0].Memo_OrderBy;

    UTI_TB_Rellenar_ComboBox_Orden( true,
                                    ComboBox_Filtros,
                                    private_Order_By,
                                    0 );

    // ALMACENES MOVIMIENTOS DETALLES
    SetLength(private_Order_By_AMD, 1);

    private_Order_By_AMD[0].Titulo       := rs_para_Empezar_3; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_AMD[0].Memo_OrderBy := 'amd.id_almacenes_movimientos ASC, amd.id_articulos ASC, amd.Unidades ASC';

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

// ************************************************************************************************* //
// ** TABLA AMD                                                                                   ** //
// ************************************************************************************************* //
procedure Tform_almacenes_movimientos_000.SQLQuery_AMDCalcFields(DataSet: TDataSet);
begin
    with SQLQuery_AMD do
    begin
        // ***************************************************************************************** //
        // ** NO HAY CAMPOS QUE CALCULAR                                                          ** //
        // ***************************************************************************************** //
    end;
end;

procedure Tform_almacenes_movimientos_000.SQLQuery_AMDBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTRO_param_assign_value_Edit( SQLQuery_AMD );
end;

procedure Tform_almacenes_movimientos_000.SQLQuery_AMDBeforePost(DataSet: TDataSet);
begin
    UTI_RGTRO_param_assign_value( SQLQuery_AMD );
end;

procedure Tform_almacenes_movimientos_000.SQLQuery_AMDAfterPost(DataSet: TDataSet);
begin
    UTI_RGTRO_Grabar( 'almacenes_movimientos_detalles',
                      DataModule_Almacenes_Movimientos.SQLTransaction_AMD,
                      SQLQuery_AMD );

    Refrescar_Registros_AMD;
end;

procedure Tform_almacenes_movimientos_000.Filtrar_Principal_Sin_Preguntar;
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

procedure Tform_almacenes_movimientos_000.Boton_Elegir_conceptos_almacen_traspasoClick
  (Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Form( true, false, '', 290 );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_conceptos_almacen_traspaso.Text          := Trim(var_Registro.id_1);
        Edit_Descripcion_conceptos_almacen_traspaso.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_almacenes_movimientos_000.Boton_Elegir_id_almacenes_destinoClick
  (Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Form( true, false, '', 260 );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_almacenes_destino.Text             := Trim(var_Registro.id_1);
        Edit_Descripcion_id_almacenes_destino.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_almacenes_movimientos_000.Boton_Elegir_id_almacenes_origenClick(
  Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    var_Registro := UTI_Abrir_Form( true, false, '', 260 );
    if var_Registro.id_1 <> '' then
    begin
        Edit_id_almacenes_origen.Text             := Trim(var_Registro.id_1);
        Edit_Descripcion_id_almacenes_origen.Text := var_Registro.descripcion_1;
    end;
end;

procedure Tform_almacenes_movimientos_000.ComboBox_FiltrosChange(Sender: TObject
  );
begin
    Memo_OrderBy.Lines.Clear;
    Memo_OrderBy.Lines.Add( private_Order_By[ComboBox_Filtros.ItemIndex].Memo_OrderBy );
    BitBtn_FiltrarClick(Nil);
end;

procedure Tform_almacenes_movimientos_000.Edit_Descripcion_conceptos_almacen_traspasoClick
  (Sender: TObject);
begin
    Edit_id_conceptos_almacen_traspaso.Text          := '';
    Edit_Descripcion_conceptos_almacen_traspaso.Text := '';
end;

procedure Tform_almacenes_movimientos_000.Edit_Descripcion_id_almacenes_destinoClick
  (Sender: TObject);
begin
    Edit_id_almacenes_destino.Text             := '';
    Edit_Descripcion_id_almacenes_destino.Text := '';
end;

procedure Tform_almacenes_movimientos_000.Edit_Descripcion_id_almacenes_origenClick
  (Sender: TObject);
begin
    Edit_id_almacenes_origen.Text             := '';
    Edit_Descripcion_id_almacenes_origen.Text := '';
end;

end.


