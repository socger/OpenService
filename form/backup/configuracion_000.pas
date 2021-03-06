unit configuracion_000;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  ExtCtrls, Buttons, DBGrids, DbCtrls, Grids, utilidades_bd, utilidades_rgtro, utilidades_general,
  utilidades_usuarios, utilidades_datos_tablas;

type

  { Tform_configuracion_000 }

  Tform_configuracion_000 = class(TForm)
    BitBtn_Filtrar: TBitBtn;
    BitBtn_SALIR: TBitBtn;
    BitBtn_Seleccionar: TBitBtn;
    BitBtn_Ver_Situacion_Registro: TBitBtn;
    ComboBox_Filtros: TComboBox;
    DataSource_Configuracion: TDataSource;
    DBGrid_Principal: TDBGrid;
    DBNavigator1: TDBNavigator;
    Edit_Descripcion: TEdit;
    Image_Confirmado: TImage;
    Label10: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label_Ctdad_Rgtros: TLabel;
    Label_Fecha2: TLabel;
    Memo_Filtros: TMemo;
    Memo_OrderBy: TMemo;
    PageControl_Filtros: TPageControl;
    RadioGroup_Bajas: TRadioGroup;
    SQLQuery_Configuracion: TSQLQuery;
    SQLQuery_ConfiguracionAlbaranes_Obligar_Almacen_SN: TStringField;

      SQLQuery_ConfiguracionArticulos_Compras_Obligar_Cuenta_Contable_SN: TStringField;

      SQLQuery_ConfiguracionArticulos_Familias_Compras_Obligar_Cuenta_Contable_SN: TStringField;

      SQLQuery_ConfiguracionArticulos_Familias_Ventas_Obligar_Cuenta_Contable_SN: TStringField;

        SQLQuery_ConfiguracionArticulos_Ventas_Obligar_Cuenta_Contable_SN: TStringField;
        SQLQuery_ConfiguracionBancos_Cuenta_Contable_SN: TStringField;
    SQLQuery_ConfiguracionChange_Id_User: TLargeintField;
    SQLQuery_ConfiguracionChange_WHEN: TDateTimeField;
    SQLQuery_ConfiguracionClientes_Obligar_Actividad_SN: TStringField;
    SQLQuery_ConfiguracionClientes_Obligar_Cuenta_Contable_SN: TStringField;
    SQLQuery_ConfiguracionClientes_Obligar_FormaPago_SN: TStringField;
    SQLQuery_ConfiguracionClientes_Obligar_NIF_SN: TStringField;
    SQLQuery_ConfiguracionClientes_Obligar_Ruta_SN: TStringField;
    SQLQuery_ConfiguracionClientes_Obligar_Tarifa_SN: TStringField;
    SQLQuery_ConfiguracionClientes_Obligar_Tipo_Cliente_SN: TStringField;

      SQLQuery_ConfiguracionCtas_pagos_cobros_Obligar_Cuenta_Contable_SN: TStringField;
    SQLQuery_ConfiguracionDel_Id_User: TLargeintField;
    SQLQuery_ConfiguracionDel_WHEN: TDateTimeField;
    SQLQuery_ConfiguracionDel_WHY: TStringField;
    SQLQuery_Configuraciondescripcion: TStringField;
    SQLQuery_ConfiguracionFacturas_Permitir_Borrar_SN: TStringField;
    SQLQuery_ConfiguracionGuardar_Cambios_de_Registros_SN: TStringField;
    SQLQuery_Configuracionid: TLargeintField;
    SQLQuery_ConfiguracionImpuestos_Obligar_Cuenta_Contable_SN: TStringField;
    SQLQuery_ConfiguracionInsert_Id_User: TLargeintField;
    SQLQuery_ConfiguracionInsert_WHEN: TDateTimeField;
    SQLQuery_ConfiguracionModulo_Profesorado_Activo_SN: TStringField;

      SQLQuery_ConfiguracionPersonal_Familias_Obligar_Cuenta_Contable_SN: TStringField;
      SQLQuery_ConfiguracionPersonal_Obligar_Cuenta_Contable_SN: TStringField;
      SQLQuery_ConfiguracionPersonal_Obligar_NIF_SN: TStringField;
    SQLQuery_ConfiguracionProveedores_Obligar_Cuenta_Contable_SN: TStringField;
    SQLQuery_ConfiguracionProveedores_Obligar_NIF_SN: TStringField;
    SQLQuery_ConfiguracionRecibos_automaticos_SN: TStringField;

      SQLQuery_ConfiguracionRepresentantes_Obligar_Cuenta_Contable_SN: TStringField;
    SQLQuery_ConfiguracionRepresentantes_Obligar_NIF_SN: TStringField;

    SQLQuery_ConfiguracionTipo_Clientes_Obligar_Cuenta_Contable_SN: TStringField;

      SQLQuery_ConfiguracionTipo_Proveedores_Obligar_Cuenta_Contable_SN: TStringField;
    SQLQuery_ConfiguracionTrabajar_Albaranes_con_Vehiculos_SN: TStringField;
    SQLQuery_ConfiguracionTrabajar_Grupos_Cocina_SN: TStringField;
    TabSheet_Busqueda_Concreta: TTabSheet;
    TabSheet_Filtros_Generales: TTabSheet;

    procedure ComboBox_FiltrosChange(Sender: TObject);
    procedure Insertamos_o_Editamos;
    procedure Insertar_Registro;
    procedure Editar_Registro;
    procedure Filtrar_Principal_Sin_Preguntar;
    function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
    procedure para_Empezar;
    procedure FormCreate(Sender: TObject);
    procedure Presentar_Datos;
    procedure Cerramos_Tablas;
    procedure Cerramos_Tablas_Ligadas;
    procedure Seleccionado_Rgtro;
    procedure no_Tocar;
    procedure Filtrar_tablas_ligadas;
    procedure Refrescar_Registros;
    procedure BitBtn_FiltrarClick(Sender: TObject);
    procedure BitBtn_SALIRClick(Sender: TObject);
    procedure BitBtn_SeleccionarClick(Sender: TObject);
    procedure BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
    procedure DBGrid_PrincipalCellClick(Column: TColumn);
    procedure DBGrid_PrincipalDblClick(Sender: TObject);
    procedure DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure RadioGroup_BajasClick(Sender: TObject);
    procedure SQLQuery_ConfiguracionAfterPost(DataSet: TDataSet);
    procedure SQLQuery_ConfiguracionAfterScroll(DataSet: TDataSet);
    procedure SQLQuery_ConfiguracionBeforeEdit(DataSet: TDataSet);
    procedure SQLQuery_ConfiguracionBeforePost(DataSet: TDataSet);

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
  form_configuracion_000: Tform_configuracion_000;

implementation

{$R *.lfm}

uses dm_configuracion, menu, configuracion_001;

{ Tform_configuracion_000 }

procedure Tform_configuracion_000.FormActivate(Sender: TObject);
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

procedure Tform_configuracion_000.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
    if private_Salir_OK = False then
    begin
        // ***************************************************************************************** //
        // ** Intento BitBtn_SALIR de la aplicación de un modo no permitido.                      ** //
        // ***************************************************************************************** //
        // ** Pero si desde el menu principal está a true la variable public_Salir_Ok, significa  ** //
        // ** que hay que salir si o si, pues pulsó cancelar al preguntar otra vez la contraseña  ** //
        // ***************************************************************************************** //
        if form_Menu.public_Salir_OK = False then CloseAction := caNone;
    end else begin
        // ***************************************************************************************** //
        // ** Fue correcto el modo como quiere BitBtn_SALIR de la aplicación                      ** //
        // ***************************************************************************************** //
    end;
end;

procedure Tform_configuracion_000.FormDestroy(Sender: TObject);
begin
     Cerramos_Tablas;
end;

procedure Tform_configuracion_000.SQLQuery_ConfiguracionAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'configuracion',
                       DataModule_configuracion.SQLTransaction,
                       SQLQuery_Configuracion,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros;
end;

procedure Tform_configuracion_000.SQLQuery_ConfiguracionAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure Tform_configuracion_000.SQLQuery_ConfiguracionBeforePost(DataSet: TDataSet);
begin
     UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Configuracion );
end;

procedure Tform_configuracion_000.BitBtn_FiltrarClick(Sender: TObject);
begin
     if PageControl_Filtros.ActivePage = TabSheet_Busqueda_Concreta then
     begin
         Filtrar_Principal_Sin_Preguntar;
     end else begin
         RadioGroup_Bajas.ItemIndex := Filtrar_Principal( true );
     end;
end;

procedure Tform_configuracion_000.RadioGroup_BajasClick(Sender: TObject);
begin
     Refrescar_Registros;
end;

procedure Tform_configuracion_000.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_configuracion_000.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure Tform_configuracion_000.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    If public_Elegimos then
         Seleccionado_Rgtro
    else Editar_Registro;
end;

procedure Tform_configuracion_000.DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    UTI_GEN_Dibujar_Grid( Sender, SQLQuery_Configuracion, Rect, DataCol, Column, State );
end;

procedure Tform_configuracion_000.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if Key = 13 then
    begin
        If public_Elegimos then
             Seleccionado_Rgtro
        else Editar_Registro;
    end;
end;

procedure Tform_configuracion_000.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

procedure Tform_configuracion_000.DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
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
                UTI_RGTRO_Borrar( 'configuracion',
                                  SQLQuery_Configuracion,
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

procedure Tform_configuracion_000.BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if SQLQuery_Configuracion.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'configuracion',
                                           SQLQuery_Configuracion,
                                           DataSource_Configuracion,
                                           DBGrid_Principal );
        end;
    end;
end;

procedure Tform_configuracion_000.BitBtn_SeleccionarClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
end;

procedure Tform_configuracion_000.Refrescar_Registros;
var var_id : Int64;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_id := 0;

    if SQLQuery_Configuracion.RecordCount > 0 then
    begin
        var_id := 1;
    end;

    Filtrar_Principal_Sin_Preguntar;

    if var_id <> 0 then
    begin
        SQLQuery_Configuracion.Locate( 'id',
                                       var_id,
                                       [] );
    end;
end;

procedure Tform_configuracion_000.Filtrar_tablas_ligadas;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
begin
    if SQLQuery_Configuracion.RecordCount = 0 then Exit;

    if SQLQuery_Configuracion.State = dsInsert then
    begin
        Cerramos_Tablas_Ligadas;
        Exit;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;
end;

procedure Tform_configuracion_000.no_Tocar;
begin
    // BitBtn_Imprimir.Enabled := False;
end;

procedure Tform_configuracion_000.Seleccionado_Rgtro;
begin
    private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    public_Rgtro_Seleccionado := true;
    Close;
end;

procedure Tform_configuracion_000.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_configuracion.SQLConnector,
                      DataModule_configuracion.SQLTransaction,
                      SQLQuery_Configuracion ) = false then UTI_GEN_Salir;

    DataModule_configuracion.Free;
end;

procedure Tform_configuracion_000.Cerramos_Tablas_Ligadas;
begin
    { ESTE form NO TIENE TABLAS LIGADAS

        if UTI_TB_Cerrar( DataModule_del_form_000.SQLConnector_de_la_tabla,
                          DataModule_Users.SQLTransaction_de_la_tabla,
                          SQLQuery_la_tabla ) = false then UTI_GEN_Salir;
    }
end;

procedure Tform_configuracion_000.Presentar_Datos;
begin
     /// guardar por lo que pueda pasar
end;

procedure Tform_configuracion_000.FormCreate(Sender: TObject);
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

procedure Tform_configuracion_000.para_Empezar;
begin
  { ****************************************************************************
    Solo para formularios que traten con datos
    **************************************************************************** }
    if UTI_GEN_Form_Abierto_Ya('DataModule_configuracion') = False then
    begin
        DataModule_configuracion := TDataModule_configuracion.Create(Application);
    end;

  { ****************************************************************************
    Preparamos los diferentes tipos de orden preconfigurados
    **************************************************************************** }
    SetLength(private_Order_By, 1);

    private_Order_By[0].Titulo       := 'Por la id';
    private_Order_By[0].Memo_OrderBy := 'conf.id ASC';

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

procedure Tform_configuracion_000.SQLQuery_ConfiguracionBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Configuracion );
end;

function Tform_configuracion_000.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
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
        var_SQL_ADD.Add( 'conf.descripcion LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Descripcion.Text) + '%') );
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
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Configuracion,
                                                            'configuracion',
                                                            'u' ),

                              // Insert_SQL,
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Configuracion,
                                                            'configuracion',
                                                            'i' ),

                              // var_ctdad_Rgtros,
                              -1,

                              DataModule_configuracion.SQLTransaction,
                              DataModule_configuracion.SQLConnector,
                              SQLQuery_Configuracion,

                              // name_tabla,
                              'conf',

                              RadioGroup_Bajas.ItemIndex,

                              // SELECT_SQL,
                              'SELECT conf.*' + ' ' +
                              'FROM configuracion AS conf' + ' ',

                              Memo_Filtros.Lines,
                              Memo_OrderBy.Lines,
                              var_a_Filtrar,

                              param_Cambiamos_Filtro,
                              false,   // param_ver_SQL_despues_Abrir : Boolean;
                              true ); // jerofa no cerramos la conexión ... param_no_Cerrar_Conexion : Boolean {= false}

    var_a_Filtrar.Free;

    Label_Ctdad_Rgtros.Caption := IntToStr(SQLQuery_Configuracion.RecordCount);

    //Filtrar_tablas_ligadas;
    var_SQL_ADD.Free;
end;

procedure Tform_configuracion_000.Filtrar_Principal_Sin_Preguntar;
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

procedure Tform_configuracion_000.Insertar_Registro;
var var_msg  : TStrings;
    var_Form : Tform_configuracion_001;
begin
    with SQLQuery_Configuracion do
    begin
        var_msg := TStringList.Create;

        if UTI_USR_Permiso_SN(public_Menu_Worked, 'A', True) = True then
        begin
            if public_Solo_Ver = True then
            begin
                var_msg.Add(rs_Solo_Visualizar);
                UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            end else begin
                Insert;

                // ********************************************************************************* //
                // ** INICIALIZAMOS LOS CAMPOS QUE LO NECESITEN                                   ** //
                // ********************************************************************************* //
                FieldByName('id').AsString                                                    := '1';
                FieldByName('Trabajar_Grupos_Cocina_SN').AsString                             := 'N';
                FieldByName('Trabajar_Albaranes_con_Vehiculos_SN').AsString                   := 'N';
                FieldByName('Clientes_Obligar_NIF_SN').AsString                               := 'N';
                FieldByName('Clientes_Obligar_Cuenta_Contable_SN').AsString                   := 'N';
                FieldByName('Tipo_Clientes_Obligar_Cuenta_Contable_SN').AsString              := 'N';
                FieldByName('Representantes_Obligar_NIF_SN').AsString                         := 'N';
                FieldByName('Representantes_Obligar_Cuenta_Contable_SN').AsString             := 'N';
                FieldByName('Tipo_Proveedores_Obligar_Cuenta_Contable_SN').AsString           := 'N';
                FieldByName('Proveedores_Obligar_NIF_SN').AsString                            := 'N';
                FieldByName('Proveedores_Obligar_Cuenta_Contable_SN').AsString                := 'N';
                FieldByName('Articulos_Familias_Ventas_Obligar_Cuenta_Contable_SN').AsString  := 'N';
                FieldByName('Articulos_Familias_Compras_Obligar_Cuenta_Contable_SN').AsString := 'N';
                FieldByName('Articulos_Ventas_Obligar_Cuenta_Contable_SN').AsString           := 'N';
                FieldByName('Articulos_Compras_Obligar_Cuenta_Contable_SN').AsString          := 'N';
                FieldByName('Impuestos_Obligar_Cuenta_Contable_SN').AsString                  := 'N';
                FieldByName('Ctas_pagos_cobros_Obligar_Cuenta_Contable_SN').AsString          := 'N';
                FieldByName('Personal_Familias_Obligar_Cuenta_Contable_SN').AsString          := 'N';
                FieldByName('Personal_Obligar_NIF_SN').AsString                               := 'N';
                FieldByName('Personal_Obligar_Cuenta_Contable_SN').AsString                   := 'N';
                FieldByName('Modulo_Profesorado_Activo_SN').AsString                          := 'N';
                FieldByName('Bancos_Cuenta_Contable_SN').AsString                             := 'N';

                FieldByName('Clientes_Obligar_Tipo_Cliente_SN').AsString                      := 'N';
                FieldByName('Clientes_Obligar_Ruta_SN').AsString                              := 'N';
                FieldByName('Clientes_Obligar_Actividad_SN').AsString                         := 'N';
                FieldByName('Clientes_Obligar_FormaPago_SN').AsString                         := 'N';
                FieldByName('Clientes_Obligar_Tarifa_SN').AsString                            := 'N';
                FieldByName('Albaranes_Obligar_Almacen_SN').AsString                          := 'S';
                FieldByName('Facturas_Permitir_Borrar_SN').AsString                           := 'N';

                var_Form := Tform_configuracion_001.Create(nil);

                var_Form.para_Empezar;

                var_Form.ShowModal;
                if var_Form.public_Pulso_Aceptar = true then
                    begin
                        FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
                        FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                        UTI_RGTRO_Grabar_Antes( 'configuracion',
                                                SQLQuery_Configuracion );
                    end
                else Cancel;

                var_Form.Free;
            end;
        end;

        var_msg.Free;
    end;
end;

procedure Tform_configuracion_000.Insertamos_o_Editamos;
begin
    with SQLQuery_Configuracion do
    begin
        if RecordCount > 0 then
             Editar_Registro
        else Insertar_Registro;
    end;

    BitBtn_SALIRClick(nil);
end;

procedure Tform_configuracion_000.ComboBox_FiltrosChange(Sender: TObject);
begin
    Memo_OrderBy.Lines.Clear;
    Memo_OrderBy.Lines.Add( private_Order_By[ComboBox_Filtros.ItemIndex].Memo_OrderBy );
    BitBtn_FiltrarClick(Nil);
end;

procedure Tform_configuracion_000.Editar_Registro;
var var_msg  : TStrings;
    var_Form : Tform_configuracion_001;
    var_id   : ShortString;
begin
    with SQLQuery_Configuracion do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
        begin
            var_id := FieldByName('id').AsString;

            if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
            begin
                if UTI_RGTRO_isLock( 'configuracion',
                                     FieldByName('id').AsString,
                                     true ) = true then
                begin
                    Exit;
                end else begin
                    if UTI_RGTRO_Lock( 'configuracion',
                                       FieldByName('id').AsString ) = true then
                         Edit
                    else Exit;
                end;

                var_Form := Tform_configuracion_001.Create(nil);

                var_Form.public_Menu_Worked := public_Menu_Worked;

                if public_Solo_Ver = true then
                begin
                    var_Form.public_Solo_Ver := true;
                end;

                var_Form.para_Empezar;

                var_Form.ShowModal;
                if var_Form.public_Pulso_Aceptar = true then
                begin
                    if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( SQLQuery_Configuracion ) = true then
                    begin
                        FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                        FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                        UTI_RGTRO_Grabar_Antes( 'configuracion', SQLQuery_Configuracion );
                    end else begin
                        Cancel;
                    end;
                end else begin
                    Cancel;
                end;

                var_Form.Free;

                UTI_RGTRO_UnLock( 'configuracion', var_id );
            end;
        end  else begin
            var_msg.Add(rs_no_Hay_Rgtros);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        end;
    end;
    var_msg.Free;
end;

end.

