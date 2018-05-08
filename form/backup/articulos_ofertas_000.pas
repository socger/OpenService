unit articulos_ofertas_000;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs, Buttons, StdCtrls,
  utilidades_usuarios, utilidades_rgtro, variants, utilidades_general, utilidades_bd, DBGrids,
  utilidades_datos_tablas, DbCtrls, ExtCtrls, Grids, ComCtrls, LCLTranslator;

resourcestring
  rs_para_Empezar_1 = 'Por descripción';
  rs_para_Empezar_2 = 'Por la id';
  rs_para_Empezar_3 = 'Por oferta';
  rs_para_Empezar_4 = 'Por oferta + artículo';

  rs_BitBtn_ImprimirClick_1 = ', con descripción %';

type

  { Tform_articulos_ofertas_000 }

  Tform_articulos_ofertas_000 = class(TForm)
    BitBtn_Filtrar: TBitBtn;
    BitBtn_Imprimir: TBitBtn;
    BitBtn_SALIR: TBitBtn;
    BitBtn_Seleccionar: TBitBtn;
    BitBtn_Ver_Situacion_Registro: TBitBtn;
    ComboBox_Filtros: TComboBox;
    DataSource_AO: TDataSource;
    DataSource_AODPV: TDataSource;
    DataSource_AOA: TDataSource;
    DBGrid_Principal: TDBGrid;
    DBNavigator1: TDBNavigator;
    Edit_Descripcion: TEdit;
    Image_Confirmado: TImage;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label_Fecha2: TLabel;
    Memo_Filtros: TMemo;
    Memo_OrderBy: TMemo;
    PageControl_Filtros: TPageControl;
    RadioGroup_Bajas: TRadioGroup;

    SQLQuery_AO: TSQLQuery;
    SQLQuery_AOChange_Id_User: TLargeintField;
    SQLQuery_AOChange_WHEN: TDateTimeField;
    SQLQuery_AODel_Id_User: TLargeintField;
    SQLQuery_AODel_WHEN: TDateTimeField;
    SQLQuery_AODel_WHY: TStringField;
    SQLQuery_AOdescripcion: TStringField;
    SQLQuery_AOdescripcion_para_TPV: TStringField;
    SQLQuery_AODescuento: TBCDField;
    SQLQuery_AODomingo: TStringField;
    SQLQuery_AOFecha_Hora_Fin: TDateTimeField;
    SQLQuery_AOFecha_Hora_Inicio: TDateTimeField;
    SQLQuery_AOOT_Descripcion_Tarifa: TStringField;
    SQLQuery_Articulos_Ofertasid2: TLargeintField;
    SQLQuery_AOid_tarifas: TLargeintField;
    SQLQuery_AOInsert_Id_User: TLargeintField;
    SQLQuery_AOInsert_WHEN: TDateTimeField;
    SQLQuery_AOJueves: TStringField;
    SQLQuery_AOLunes: TStringField;
    SQLQuery_AOMartes: TStringField;
    SQLQuery_AOMiercoles: TStringField;
    SQLQuery_AOSabado: TStringField;
    SQLQuery_AOTipo_Oferta: TStringField;
    SQLQuery_AOUnidades_a_Pagar: TLargeintField;
    SQLQuery_AOUnidades_Compradas: TLargeintField;
    SQLQuery_AOViernes: TStringField;
    SQLQuery_AOAChange_Id_User: TLargeintField;
    SQLQuery_AOAChange_WHEN: TDateTimeField;
    SQLQuery_AOADel_Id_User: TLargeintField;
    SQLQuery_AOADel_WHEN: TDateTimeField;
    SQLQuery_AOADel_WHY: TStringField;
    SQLQuery_AOAid_articulos: TLargeintField;
    SQLQuery_AOAid_articulos_ofertas: TLargeintField;
    SQLQuery_AOAInsert_Id_User: TLargeintField;
    SQLQuery_AOAInsert_WHEN: TDateTimeField;
    SQLQuery_AOAOT_descripcion_articulo: TStringField;
    SQLQuery_AODPV: TSQLQuery;
    SQLQuery_AOid: TLargeintField;
    SQLQuery_Articulos_Ofertasid1: TLargeintField;
    SQLQuery_AOA: TSQLQuery;
    SQLQuery_AODPVCantidad: TBCDField;
    SQLQuery_AODPVChange_Id_User: TLargeintField;
    SQLQuery_AODPVChange_WHEN: TDateTimeField;
    SQLQuery_AODPVDel_Id_User: TLargeintField;
    SQLQuery_AODPVDel_WHEN: TDateTimeField;
    SQLQuery_AODPVDel_WHY: TStringField;
    SQLQuery_AODPVid_articulos_ofertas: TLargeintField;
    SQLQuery_AODPVInsert_Id_User: TLargeintField;
    SQLQuery_AODPVInsert_WHEN: TDateTimeField;
    SQLQuery_AODPVPorcentaje: TBCDField;
    TabSheet_Busqueda_Concreta: TTabSheet;
    TabSheet_Filtros_Generales: TTabSheet;

    procedure ComboBox_FiltrosChange(Sender: TObject);
    procedure Filtrar_Principal_Sin_Preguntar;
    procedure Editar_Registro;
    procedure Insertar_Registro;
    procedure Filtrar_tablas_ligadas;
    function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
    function  Filtrar_AODPV( param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
    function  Filtrar_AOA( param_ver_bajas : ShortInt; param_Cambiamos_Filtro : Boolean; param_Lineas_Filtro, param_Lineas_OrderBy : TStrings ) : ShortInt;
    procedure BitBtn_FiltrarClick(Sender: TObject);
    procedure BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
    procedure Presentar_Datos;
    procedure no_Tocar;
    procedure BitBtn_ImprimirClick(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure Seleccionado_Rgtro;
    procedure BitBtn_SALIRClick(Sender: TObject);
    procedure BitBtn_SeleccionarClick(Sender: TObject);
    procedure DBGrid_PrincipalCellClick(Column: TColumn);
    procedure DBGrid_PrincipalDblClick(Sender: TObject);
    procedure DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Refrescar_Registros;
    procedure Refrescar_Registros_AODPV;
    procedure Refrescar_Registros_AOA;
    procedure Cerramos_Tablas;
    procedure Cerramos_Tablas_Ligadas;
    procedure para_Empezar;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RadioGroup_BajasClick(Sender: TObject);
    procedure SQLQuery_AOAfterPost(DataSet: TDataSet);
    procedure SQLQuery_AOAfterScroll(DataSet: TDataSet);
    procedure SQLQuery_AOBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_AOBeforePost(DataSet: TDataSet);
    procedure SQLQuery_AOCalcFields(DataSet: TDataSet);
    procedure SQLQuery_AOAAfterPost(DataSet: TDataSet);
    procedure SQLQuery_AOABeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_AOABeforePost(DataSet: TDataSet);
    procedure SQLQuery_AOACalcFields(DataSet: TDataSet);
    procedure SQLQuery_AODPVAfterPost(DataSet: TDataSet);
    procedure SQLQuery_AODPVBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_AODPVBeforePost(DataSet: TDataSet);
    procedure SQLQuery_AODPVCalcFields(DataSet: TDataSet);
  private
      { private declarations }
      private_Salir_OK       : Boolean;
      private_Order_By       : array of TOrder_By;
      private_Order_By_AODPV : array of TOrder_By;
      private_Order_By_AOA   : array of TOrder_By;
  public
      { public declarations }
      public_Solo_Ver           : Boolean;
      public_Elegimos           : Boolean;
      public_Menu_Worked        : Integer;
      public_Rgtro_Seleccionado : Boolean;
  end;

var
  form_articulos_ofertas_000: Tform_articulos_ofertas_000;

implementation

{$R *.lfm}

uses dm_articulos_ofertas, menu, articulos_ofertas_001;

{ Tform_articulos_ofertas_000 }

procedure Tform_articulos_ofertas_000.FormActivate(Sender: TObject);
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

procedure Tform_articulos_ofertas_000.FormClose(Sender: TObject; var CloseAction: TCloseAction);
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

procedure Tform_articulos_ofertas_000.FormCreate(Sender: TObject);
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

procedure Tform_articulos_ofertas_000.FormDestroy(Sender: TObject);
begin
    Cerramos_Tablas;
end;

procedure Tform_articulos_ofertas_000.SQLQuery_AOCalcFields(DataSet: TDataSet);
begin
    // ********************************************************************************************* //
    // ** NO EXISTE NINGUN CAMPO A CALCULAR                                                       ** //
    // ********************************************************************************************* //
end;

procedure Tform_articulos_ofertas_000.SQLQuery_AOACalcFields
  (DataSet: TDataSet);
begin
    // ********************************************************************************************* //
    // ** NO EXISTE NINGUN CAMPO A CALCULAR                                                       ** //
    // ********************************************************************************************* //
end;

procedure Tform_articulos_ofertas_000.SQLQuery_AODPVCalcFields
  (DataSet: TDataSet);
begin
    // ********************************************************************************************* //
    // ** NO EXISTE NINGUN CAMPO A CALCULAR                                                       ** //
    // ********************************************************************************************* //
end;

procedure Tform_articulos_ofertas_000.para_Empezar;
begin
  { ****************************************************************************
    Solo para formularios que traten con datos
    **************************************************************************** }
    if UTI_GEN_Form_Abierto_Ya('DataModule_Articulos_Ofertas') = False then
    begin
        DataModule_Articulos_Ofertas := TDataModule_Articulos_Ofertas.Create(Application);
    end;

  { ****************************************************************************
    Preparamos los diferentes tipos de orden preconfigurados
    **************************************************************************** }
    // ARTICULOS OFERTAS
    SetLength(private_Order_By, 2);

    private_Order_By[0].Titulo       := rs_para_Empezar_1; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[0].Memo_OrderBy := 'AO.descripcion ASC';

    private_Order_By[1].Titulo       := rs_para_Empezar_2;
    private_Order_By[1].Memo_OrderBy := 'AO.id ASC';

    Memo_OrderBy.Lines.Text          := private_Order_By[0].Memo_OrderBy;

    UTI_TB_Rellenar_ComboBox_Orden( true,
                                    ComboBox_Filtros,
                                    private_Order_By,
                                    0 );

    // ARTICULOS OFERTAS DTO POR VOLUMEN
    SetLength(private_Order_By_AODPV, 1);

    private_Order_By_AODPV[0].Titulo       := rs_para_Empezar_3; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_AODPV[0].Memo_OrderBy := 'AODPV.id_articulos_ofertas ASC, AODPV.id ASC';

    // ARTICULOS OFERTAS ARTICULOS
    SetLength(private_Order_By_AOA, 1);

    private_Order_By_AOA[0].Titulo       := rs_para_Empezar_4; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By_AOA[0].Memo_OrderBy := 'AOA.id_articulos_ofertas ASC, AOA.id_articulos ASC';

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

procedure Tform_articulos_ofertas_000.RadioGroup_BajasClick(Sender: TObject);
begin
    Refrescar_Registros;
end;

procedure Tform_articulos_ofertas_000.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_Articulos_Ofertas.SQLConnector_AO,
                      DataModule_Articulos_Ofertas.SQLTransaction_AO,
                      SQLQuery_AO ) = false then UTI_GEN_Salir;

    DataModule_Articulos_Ofertas.Free;
end;

procedure Tform_articulos_ofertas_000.Cerramos_Tablas_Ligadas;
begin
    if UTI_TB_Cerrar( DataModule_Articulos_Ofertas.SQLConnector_AODPV,
                      DataModule_Articulos_Ofertas.SQLTransaction_AODPV,
                      SQLQuery_AODPV ) = false then UTI_GEN_Salir;

    if UTI_TB_Cerrar( DataModule_Articulos_Ofertas.SQLConnector_AOA,
                      DataModule_Articulos_Ofertas.SQLTransaction_AOA,
                      SQLQuery_AOA ) = false then UTI_GEN_Salir;
end;

procedure Tform_articulos_ofertas_000.Refrescar_Registros_AODPV;
var var_Lineas_Filtro        : TStrings;
    var_Lineas_OrderBy       : TStrings;

    var_id_articulos_ofertas : String;
    var_Cantidad             : String;
    var_Porcentaje           : String;

    var_ver_Bajas            : ShortInt;
begin
    // ********************************************************************************************* //
    // ** Solo si la cabecera está en modo EDIT se abren las tablas hijas                         ** //
    // ********************************************************************************************* //
    if SQLQuery_AO.State <> dsEdit then Exit;

    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_id_articulos_ofertas := '';
    var_Cantidad             := '';
    var_Porcentaje           := '';

    with SQLQuery_AODPV do
    begin
        if RecordCount > 0 then
        begin
            var_id_articulos_ofertas := FieldByName('id_articulos_ofertas').Value;
            var_Cantidad             := FieldByName('Cantidad').Value;
            var_Porcentaje           := FieldByName('Porcentaje').Value;
        end;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Clear;
    var_Lineas_OrderBy.Clear;

    if Trim(SQLQuery_AO.FieldByName('id').AsString) <> '' then
         var_Lineas_Filtro.Add('AODPV.id_articulos_ofertas = ' + Trim(SQLQuery_AO.FieldByName('id').AsString))
    else var_Lineas_Filtro.Add('AODPV.id_articulos_ofertas = Null');

    var_ver_Bajas := RadioGroup_Bajas.ItemIndex;
    if UTI_GEN_Form_Abierto_Ya('form_articulos_ofertas_001') = true then
    begin
        var_ver_Bajas := form_articulos_ofertas_001.RadioGroup_Bajas.ItemIndex;
    end;

    Filtrar_AODPV( var_ver_Bajas,
                   false,
                   var_Lineas_Filtro,
                   var_Lineas_OrderBy );

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;

    if Trim(var_id_articulos_ofertas) <> '' then
    begin
        SQLQuery_AODPV.Locate( 'id_articulos_ofertas;Cantidad;Porcentaje',
                               VarArrayOf( [ var_id_articulos_ofertas,
                                             var_Cantidad,
                                             var_Porcentaje ] ),
                               [] );
    end;
end;

procedure Tform_articulos_ofertas_000.Refrescar_Registros_AOA;
var var_Lineas_Filtro        : TStrings;
    var_Lineas_OrderBy       : TStrings;

    var_id_articulos_ofertas : String;
    var_id_articulos         : String;

    var_ver_Bajas            : ShortInt;
begin
    // ********************************************************************************************* //
    // ** Solo si la cabecera está en modo EDIT se abren las tablas hijas                         ** //
    // ********************************************************************************************* //
    if SQLQuery_AO.State <> dsEdit then Exit;

    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_id_articulos_ofertas := '';
    var_id_articulos         := '';

    with SQLQuery_AOA do
    begin
        if RecordCount > 0 then
        begin
            var_id_articulos_ofertas := FieldByName('id_articulos_ofertas').Value;
            var_id_articulos         := FieldByName('id_articulos').Value;
        end;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Clear;
    var_Lineas_OrderBy.Clear;

    if Trim(SQLQuery_AO.FieldByName('id').AsString) <> '' then
         var_Lineas_Filtro.Add('AOA.id_articulos_ofertas = ' + Trim(SQLQuery_AO.FieldByName('id').AsString))
    else var_Lineas_Filtro.Add('AOA.id_articulos_ofertas = Null');

    var_ver_Bajas := RadioGroup_Bajas.ItemIndex;
    if UTI_GEN_Form_Abierto_Ya('form_articulos_ofertas_001') = true then
    begin
        var_ver_Bajas := form_articulos_ofertas_001.RadioGroup_Bajas.ItemIndex;
    end;

    Filtrar_AOA( var_ver_Bajas,
                 false,
                 var_Lineas_Filtro,
                 var_Lineas_OrderBy );

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;

    if Trim(var_id_articulos_ofertas) <> '' then
    begin
        SQLQuery_AOA.Locate( 'id_articulos_ofertas;id_articulos',
                             VarArrayOf( [ var_id_articulos_ofertas,
                                           var_id_articulos ] ),
                             [] );
    end;
end;

procedure Tform_articulos_ofertas_000.Refrescar_Registros;
var var_descripcion          : String;
    var_descripcion_para_TPV : String;
    var_Fecha_Hora_Inicio    : String;
    var_Fecha_Hora_Fin       : String;
    var_Lunes                : String;
    var_Martes               : String;
    var_Miercoles            : String;
    var_Jueves               : String;
    var_Viernes              : String;
    var_Sabado               : String;
    var_Domingo              : String;
    var_Tipo_Oferta          : String;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_descripcion          := '';
    var_descripcion_para_TPV := '';
    var_Fecha_Hora_Inicio    := '';
    var_Fecha_Hora_Fin       := '';
    var_Lunes                := '';
    var_Martes               := '';
    var_Miercoles            := '';
    var_Jueves               := '';
    var_Viernes              := '';
    var_Sabado               := '';
    var_Domingo              := '';
    var_Tipo_Oferta          := '';

    with SQLQuery_AO do
    begin
        if RecordCount > 0 then
        begin
            var_descripcion          := FieldByName('descripcion').asString;
            var_descripcion_para_TPV := FieldByName('descripcion_para_TPV').asString;
            var_Fecha_Hora_Inicio    := FieldByName('Fecha_Hora_Inicio').asString;
            var_Fecha_Hora_Fin       := FieldByName('Fecha_Hora_Fin').asString;
            var_Lunes                := FieldByName('Lunes').asString;
            var_Martes               := FieldByName('Martes').asString;
            var_Miercoles            := FieldByName('Miercoles').asString;
            var_Jueves               := FieldByName('Jueves').asString;
            var_Viernes              := FieldByName('Viernes').asString;
            var_Sabado               := FieldByName('Sabado').asString;
            var_Domingo              := FieldByName('Domingo').asString;
            var_Tipo_Oferta          := FieldByName('Tipo_Oferta').asString;
        end;
    end;

    Filtrar_Principal_Sin_Preguntar;

    if (Trim(var_descripcion) <> '')          or
       (Trim(var_descripcion_para_TPV) <> '') then
    begin
         SQLQuery_AO.Locate( 'descripcion;descripcion_para_TPV',
                             VarArrayOf( [ var_descripcion, var_descripcion_para_TPV ] ),
                             [] );
    end;
end;

procedure Tform_articulos_ofertas_000.SQLQuery_AODPVAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'articulos_ofertas_dto_por_volumen',
                       DataModule_Articulos_Ofertas.SQLTransaction_AODPV,
                       SQLQuery_AODPV,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros_AODPV;
end;

procedure Tform_articulos_ofertas_000.SQLQuery_AOAAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'articulos_ofertas_articulos',
                       DataModule_Articulos_Ofertas.SQLTransaction_AOA,
                       SQLQuery_AOA,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros_AOA;
end;

procedure Tform_articulos_ofertas_000.SQLQuery_AOAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'articulos_ofertas',
                       DataModule_Articulos_Ofertas.SQLTransaction_AO,
                       SQLQuery_AO,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros;
end;

procedure Tform_articulos_ofertas_000.SQLQuery_AODPVBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_AODPV );
end;

procedure Tform_articulos_ofertas_000.SQLQuery_AOABeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_AOA );
end;

procedure Tform_articulos_ofertas_000.SQLQuery_AOBeforePost(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_AO );
end;

procedure Tform_articulos_ofertas_000.SQLQuery_AOAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure Tform_articulos_ofertas_000.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    If public_Elegimos then
         Seleccionado_Rgtro
    else Editar_Registro;
end;

procedure Tform_articulos_ofertas_000.DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    UTI_GEN_Dibujar_Grid( Sender, SQLQuery_AO, Rect, DataCol, Column, State );
end;

procedure Tform_articulos_ofertas_000.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then
    begin
        If public_Elegimos then
             Seleccionado_Rgtro
        else Editar_Registro;
    end;
end;

procedure Tform_articulos_ofertas_000.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

procedure Tform_articulos_ofertas_000.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure Tform_articulos_ofertas_000.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_articulos_ofertas_000.BitBtn_SeleccionarClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
end;

procedure Tform_articulos_ofertas_000.Seleccionado_Rgtro;
begin
    private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    public_Rgtro_Seleccionado := true;
    Close;
end;

procedure Tform_articulos_ofertas_000.DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
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
                UTI_RGTRO_Borrar( 'articulos_ofertas',
                                  SQLQuery_AO,
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

procedure Tform_articulos_ofertas_000.BitBtn_ImprimirClick(Sender: TObject);
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
                            rs_BitBtn_ImprimirClick_1 +
                            Trim(Edit_Descripcion.Text) + '%';
    end;

    // ********************************************************************************************* //
    // ** Configuramos la llamada al generador de informes                                        ** //
    // ********************************************************************************************* //
    var_Ficheros := TStringList.Create;

    UTI_GEN_Informes( var_Ordenado_por,
                      SQLQuery_AO,
                      DataSource_AO,
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

procedure Tform_articulos_ofertas_000.no_Tocar;
begin
    BitBtn_Imprimir.Enabled := False;
end;

procedure Tform_articulos_ofertas_000.Presentar_Datos;
begin
     /// guardar por lo que pueda pasar
end;

procedure Tform_articulos_ofertas_000.BitBtn_FiltrarClick(Sender: TObject);
begin
    if PageControl_Filtros.ActivePage = TabSheet_Busqueda_Concreta then
    begin
        Filtrar_Principal_Sin_Preguntar;
    end else begin
        RadioGroup_Bajas.ItemIndex := Filtrar_Principal( true );
    end;
end;

procedure Tform_articulos_ofertas_000.BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if SQLQuery_AO.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'articulos_ofertas',
                                           SQLQuery_AO,
                                           DataSource_AO,
                                           DBGrid_Principal );
        end;
    end;
end;

procedure Tform_articulos_ofertas_000.Filtrar_tablas_ligadas;
var
  var_Lineas_Filtro  : TStrings;
  var_Lineas_OrderBy : TStrings;
  var_SQL_ADD        : TStrings;
begin
    var_SQL_ADD := TStringList.Create;

    if SQLQuery_AO.RecordCount = 0 then Exit;

    if SQLQuery_AO.State = dsInsert then
    begin
        Cerramos_Tablas_Ligadas;
        Exit;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    // ********************************************************************************************* //
    // ** ARTICULOS OFERTAS DTO.POR VOLUMEN                                                       ** //
    // ********************************************************************************************* //
    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'AODPV.id_articulos_ofertas = ' + SQLQuery_AO.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_Lineas_OrderBy.Clear;
    Filtrar_AODPV( RadioGroup_Bajas.ItemIndex,
                   false,
                   var_Lineas_Filtro,
                   var_Lineas_OrderBy );

    // ********************************************************************************************* //
    // ** ARTICULOS OFERTAS ARTICULOS                                                             ** //
    // ********************************************************************************************* //
    var_SQL_ADD.Clear;
    var_SQL_ADD.Add( 'AOA.id_articulos_ofertas = ' + SQLQuery_AO.FieldByName('id').AsString );
    UTI_TB_SQL_ADD( true,
                    var_Lineas_Filtro,
                    var_SQL_ADD );

    var_Lineas_OrderBy.Clear;
    Filtrar_AOA( RadioGroup_Bajas.ItemIndex,
                 false,
                 var_Lineas_Filtro,
                 var_Lineas_OrderBy );

    // ********************************************************************************************* //
    // ** CONTINUAMOS LIBERANDO MEMORIA                                                           ** //
    // ********************************************************************************************* //
    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;
    var_SQL_ADD.Free;
end;

function Tform_articulos_ofertas_000.Filtrar_AOA( param_ver_bajas : ShortInt;
                                                  param_Cambiamos_Filtro : Boolean;
                                                  param_Lineas_Filtro,
                                                  param_Lineas_OrderBy : TStrings ) : ShortInt;
var
  var_a_Filtrar_Plus : TStrings;
begin
  var_a_Filtrar_Plus := TStringList.Create;
  var_a_Filtrar_Plus.Clear;

  if Trim(param_Lineas_OrderBy.Text) = '' then
  begin
    param_Lineas_OrderBy.Text := private_Order_By_AOA[0].Memo_OrderBy;
  end;

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  Result := UTI_TB_Filtrar( private_Order_By_AOA,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_AOA,
                                                          'articulos_ofertas_articulos',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_AOA,
                                                          'articulos_ofertas_articulos',
                                                          'i' ),

                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_Articulos_Ofertas.SQLTransaction_AOA,
                            DataModule_Articulos_Ofertas.SQLConnector_AOA,
                            SQLQuery_AOA,

                            // name_tabla,
                            'AOA',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT AOA.*,' + ' ' +
                                   'art.descripcion AS OT_descripcion_articulo' + ' ' +
                            'FROM articulos_ofertas_articulos AS AOA' + ' ' +

                            'LEFT JOIN articulos AS art' + ' ' +
                            'ON AOA.id_articulos = art.id' + ' ',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_a_Filtrar_Plus.Free;
end;

function Tform_articulos_ofertas_000.Filtrar_AODPV( param_ver_bajas : ShortInt;
                                                    param_Cambiamos_Filtro : Boolean;
                                                    param_Lineas_Filtro,
                                                    param_Lineas_OrderBy : TStrings ) : ShortInt;
var
  var_a_Filtrar_Plus : TStrings;
begin
  var_a_Filtrar_Plus := TStringList.Create;
  var_a_Filtrar_Plus.Clear;

  if Trim(param_Lineas_OrderBy.Text) = '' then
  begin
    param_Lineas_OrderBy.Text := private_Order_By_AODPV[0].Memo_OrderBy;
  end;

  { NO OLVIDEMOS que los campos que empiezan por OT_ son campos que pertenecen a otras tablas(JOIN de la SELECT)
    y que por lo se debe de permitir modificarlos en ningún módulo }

  Result := UTI_TB_Filtrar( private_Order_By_AODPV,

                            // Delete_SQL,
                            '',

                            // Update_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_AODPV,
                                                          'articulos_ofertas_dto_por_volumen',
                                                          'u' ),

                            // Insert_SQL,
                            UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_AODPV,
                                                          'articulos_ofertas_dto_por_volumen',
                                                          'i' ),

                            // var_ctdad_Rgtros,
                            -1,

                            DataModule_Articulos_Ofertas.SQLTransaction_AODPV,
                            DataModule_Articulos_Ofertas.SQLConnector_AODPV,
                            SQLQuery_AODPV,

                            // name_tabla,
                            'AODPV',

                            param_ver_bajas,

                            // SELECT_SQL,
                            'SELECT AODPV.*' + ' ' +
                            'FROM articulos_ofertas_dto_por_volumen AS AODPV' + ' ',

                            param_Lineas_Filtro,
                            param_Lineas_OrderBy,
                            var_a_Filtrar_Plus,

                            param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

  var_a_Filtrar_Plus.Free;
end;

function Tform_articulos_ofertas_000.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
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
        var_SQL_ADD.Add( 'AO.descripcion LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Descripcion.Text) + '%') );
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
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_AO,
                                                            'articulos_ofertas',
                                                            'u' ),

                              // Insert_SQL,
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_AO,
                                                            'articulos_ofertas',
                                                            'i' ),

                              // var_ctdad_Rgtros,
                              -1,

                              DataModule_Articulos_Ofertas.SQLTransaction_AO,
                              DataModule_Articulos_Ofertas.SQLConnector_AO,
                              SQLQuery_AO,

                              // name_tabla,
                              'AO',

                              RadioGroup_Bajas.ItemIndex,

                              // SELECT_SQL,
                              'SELECT AO.*,' + ' ' +
                                     'tr.descripcion AS OT_Descripcion_Tarifa' + ' ' +
                              'FROM articulos_ofertas AS AO' + ' ' +

                              'LEFT JOIN tarifas AS tr' + ' ' +
                              'ON AO.id_tarifas = tr.id' + ' ',

                              Memo_Filtros.Lines,
                              Memo_OrderBy.Lines,
                              var_a_Filtrar,

                              param_Cambiamos_Filtro,
                            false,   // param_ver_SQL_despues_Abrir : Boolean;
                            true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

    var_a_Filtrar.Free;

    if SQLQuery_AO.RecordCount = 0 then
    begin
        Cerramos_Tablas_Ligadas;
    end;

    //Filtrar_tablas_ligadas;
    var_SQL_ADD.Free;
end;

procedure Tform_articulos_ofertas_000.Insertar_Registro;
var var_msg         : TStrings;
    var_descripcion : String;
begin
    with SQLQuery_AO do
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

                    FieldByName('Lunes').AsString     := 'N';
                    FieldByName('Martes').AsString    := 'N';
                    FieldByName('Miercoles').AsString := 'N';
                    FieldByName('Jueves').AsString    := 'N';
                    FieldByName('Viernes').AsString   := 'N';
                    FieldByName('Sabado').AsString    := 'N';
                    FieldByName('Domingo').AsString   := 'N';

                    // FieldByName('Tipo_Oferta').AsString := '1';

                    Application.CreateForm(Tform_articulos_ofertas_001, form_articulos_ofertas_001);

                    form_articulos_ofertas_001.DBGrid_AOA.Color   := clSilver;
                    form_articulos_ofertas_001.DBGrid_AODPV.Color := clSilver;

                    form_articulos_ofertas_001.RadioGroup_Bajas.ItemIndex := RadioGroup_Bajas.ItemIndex;

                    form_articulos_ofertas_001.para_Empezar;

                    form_articulos_ofertas_001.ShowModal;
                    if form_articulos_ofertas_001.public_Pulso_Aceptar = true then
                    begin
                        FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
                        FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                        var_descripcion                     := FieldByName('descripcion').AsString;

                        UTI_RGTRO_Grabar_Antes( 'articulos_ofertas', SQLQuery_AO );

                        form_articulos_ofertas_001.Free;

                        if FieldByName('descripcion').AsString = var_descripcion then
                        begin
                            Editar_Registro;
                        end;
                    end else begin
                        Cancel;
                        form_articulos_ofertas_001.Free;
                    end;
                end;
        end;

        var_msg.Free;
    end;
end;

procedure Tform_articulos_ofertas_000.SQLQuery_AOBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_AO );
end;

procedure Tform_articulos_ofertas_000.SQLQuery_AODPVBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_AODPV );
end;

procedure Tform_articulos_ofertas_000.SQLQuery_AOABeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_AOA );
end;

procedure Tform_articulos_ofertas_000.Editar_Registro;
var var_msg : TStrings;
    var_id  : ShortString;
begin
    with SQLQuery_AO do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
            begin
                var_id := FieldByName('id').AsString;

                if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
                begin
                    if UTI_RGTRO_isLock( 'articulos_ofertas',
                                         FieldByName('id').AsString,
                                         true ) = true then
                        begin
                            Exit;
                        end
                    else
                        begin
                            if UTI_RGTRO_Lock( 'articulos_ofertas',
                                               FieldByName('id').AsString ) = true then
                                 Edit
                            else Exit;
                        end;

                    Application.CreateForm(Tform_articulos_ofertas_001, form_articulos_ofertas_001);

                    form_articulos_ofertas_001.RadioGroup_Bajas.ItemIndex := RadioGroup_Bajas.ItemIndex;
                    form_articulos_ofertas_001.public_Menu_Worked         := public_Menu_Worked;

                    if public_Solo_Ver = true then
                    begin
                        form_articulos_ofertas_001.public_Solo_Ver := true;
                    end;

                    form_articulos_ofertas_001.para_Empezar;

                    form_articulos_ofertas_001.ShowModal;
                    if form_articulos_ofertas_001.public_Pulso_Aceptar = true then
                        begin
                            if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( SQLQuery_AO ) = true then
                               begin
                                    FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                                    FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                                    UTI_RGTRO_Grabar_Antes( 'articulos_ofertas',
                                                            SQLQuery_AO );
                               end
                            else Cancel;
                        end
                    else Cancel;

                    form_articulos_ofertas_001.Free;

                    UTI_RGTRO_UnLock( 'articulos_ofertas',
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

procedure Tform_articulos_ofertas_000.Filtrar_Principal_Sin_Preguntar;
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

procedure Tform_articulos_ofertas_000.ComboBox_FiltrosChange(Sender: TObject);
begin
    Memo_OrderBy.Lines.Clear;
    Memo_OrderBy.Lines.Add( private_Order_By[ComboBox_Filtros.ItemIndex].Memo_OrderBy );
    BitBtn_FiltrarClick(Nil);
end;

end.


