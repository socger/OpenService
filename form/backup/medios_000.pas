unit medios_000;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs, Buttons, StdCtrls,
    utilidades_general, utilidades_usuarios, utilidades_rgtro, utilidades_bd, ExtCtrls, DBGrids,
    DbCtrls, Grids, ComCtrls, utilidades_datos_tablas, LCLTranslator;

resourcestring
  rs_BitBtn_ImprimirClick_1 = ', con descripción %';

  rs_para_Empezar_1         = 'Por la descripción';
  rs_para_Empezar_2         = 'Por la id';

type

    { Tform_medios_000 }

    Tform_medios_000 = class(TForm)
      BitBtn_Filtrar: TBitBtn;
      BitBtn_Imprimir: TBitBtn;
      BitBtn_SALIR: TBitBtn;
      BitBtn_Seleccionar: TBitBtn;
        BitBtn_Ver_Situacion_Registro: TBitBtn;
        ComboBox_Filtros: TComboBox;
        DataSource_Medios: TDataSource;
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
        SQLQuery_Medios: TSQLQuery;
        SQLQuery_MediosChange_Id_User: TLargeintField;
        SQLQuery_MediosChange_WHEN: TDateTimeField;
        SQLQuery_MediosDel_Id_User: TLargeintField;
        SQLQuery_MediosDel_WHEN: TDateTimeField;
        SQLQuery_MediosDel_WHY: TStringField;
        SQLQuery_Mediosdescripcion: TStringField;
        SQLQuery_Mediosid: TLargeintField;
        SQLQuery_MediosInsert_Id_User: TLargeintField;
        SQLQuery_MediosInsert_WHEN: TDateTimeField;
        TabSheet_Busqueda_Concreta: TTabSheet;
        TabSheet_Filtros_Generales: TTabSheet;

        procedure ComboBox_FiltrosChange(Sender: TObject);
        procedure Filtrar_Principal_Sin_Preguntar;
        procedure Cerramos_Tablas_Ligadas;
        procedure FormCreate(Sender: TObject);
        procedure Presentar_Datos;
        function  Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
        procedure Filtrar_tablas_ligadas;
        procedure Cerramos_Tablas;
        procedure FormDestroy(Sender: TObject);
        procedure Insertar_Registro;
        procedure Editar_Registro;
        procedure BitBtn_ImprimirClick(Sender: TObject);
        procedure BitBtn_SeleccionarClick(Sender: TObject);
        procedure BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
        procedure DBGrid_PrincipalCellClick(Column: TColumn);
        procedure DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
        procedure Seleccionado_Rgtro;
        procedure DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure DBGrid_PrincipalDblClick(Sender: TObject);
        procedure DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
        procedure Refrescar_Registros;
        procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
        procedure para_Empezar;
        procedure no_Tocar;
        procedure BitBtn_FiltrarClick(Sender: TObject);
        procedure FormActivate(Sender: TObject);
        procedure RadioGroup_BajasClick(Sender: TObject);
        procedure BitBtn_SALIRClick(Sender: TObject);
        procedure SQLQuery_MediosAfterPost(DataSet: TDataSet);
        procedure SQLQuery_MediosAfterScroll(DataSet: TDataSet);
        procedure SQLQuery_MediosBeforeEdit(DataSet: TDataSet);
        procedure SQLQuery_MediosBeforePost(DataSet: TDataSet);
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
    form_medios_000: Tform_medios_000;

implementation

{$R *.lfm}

uses dm_medios, menu, medios_001;

{ Tform_medios_000 }

procedure Tform_medios_000.FormActivate(Sender: TObject);
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

procedure Tform_medios_000.FormClose(Sender: TObject; var CloseAction: TCloseAction);
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

procedure Tform_medios_000.FormDestroy(Sender: TObject);
begin
     Cerramos_Tablas;
end;

procedure Tform_medios_000.SQLQuery_MediosAfterPost(DataSet: TDataSet);
begin
    UTI_RGTROS_Grabar( 'medio',
                       DataModule_Medios.SQLTransaction,
                       SQLQuery_Medios,
                       false {Devolver_hacemos_commit_alFinalizar} );

    Refrescar_Registros;
end;

procedure Tform_medios_000.SQLQuery_MediosAfterScroll(DataSet: TDataSet);
begin
    Filtrar_tablas_ligadas;
end;

procedure Tform_medios_000.SQLQuery_MediosBeforePost(DataSet: TDataSet);
begin
     UTI_RGTROS_guardar_valorCampo_BoforePost( SQLQuery_Medios );
end;

procedure Tform_medios_000.BitBtn_FiltrarClick(Sender: TObject);
begin
     if PageControl_Filtros.ActivePage = TabSheet_Busqueda_Concreta then
     begin
         Filtrar_Principal_Sin_Preguntar;
     end else begin
         RadioGroup_Bajas.ItemIndex := Filtrar_Principal( true );
     end;
end;

procedure Tform_medios_000.RadioGroup_BajasClick(Sender: TObject);
begin
     Refrescar_Registros;
end;

procedure Tform_medios_000.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_medios_000.DBGrid_PrincipalCellClick(Column: TColumn);
begin
    //Filtrar_tablas_ligadas;
end;

procedure Tform_medios_000.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    If public_Elegimos then
         Seleccionado_Rgtro
    else Editar_Registro;
end;

procedure Tform_medios_000.DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    UTI_GEN_Dibujar_Grid( Sender, SQLQuery_Medios, Rect, DataCol, Column, State );
end;

procedure Tform_medios_000.DBGrid_PrincipalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if Key = 13 then
    begin
        If public_Elegimos then
             Seleccionado_Rgtro
        else Editar_Registro;
    end;
end;

procedure Tform_medios_000.DBGrid_PrincipalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if (key = 40) or (key = 38) then
    begin
         //Filtrar_tablas_ligadas;
    end;
end;

procedure Tform_medios_000.DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
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
                UTI_RGTRO_Borrar( 'medio',
                                  SQLQuery_Medios,
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

procedure Tform_medios_000.BitBtn_Ver_Situacion_RegistroClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if SQLQuery_Medios.RecordCount > 0 then UTI_RGTRO_Ver_Estado_Registro( 'medio', SQLQuery_Medios, DataSource_Medios, DBGrid_Principal );
    end;
end;

procedure Tform_medios_000.BitBtn_ImprimirClick(Sender: TObject);
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
                      SQLQuery_Medios,
                      DataSource_Medios,
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

procedure Tform_medios_000.BitBtn_SeleccionarClick(Sender: TObject);
begin
    Seleccionado_Rgtro;
end;

function Tform_medios_000.Filtrar_Principal( param_Cambiamos_Filtro : Boolean ) : ShortInt;
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
        var_SQL_ADD.Add( 'm.descripcion LIKE ' + UTI_GEN_Comillas('%' + Trim(Edit_Descripcion.Text) + '%') );
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
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Medios,
                                                            'medio',
                                                            'u' ),

                              // Insert_SQL,
                              UTI_DATOS_TABLA_Rellenar_SQL( SQLQuery_Medios,
                                                            'medio',
                                                            'i' ),

                              // var_ctdad_Rgtros,
                              -1,

                              DataModule_Medios.SQLTransaction,
                              DataModule_Medios.SQLConnector,
                              SQLQuery_Medios,

                              // name_tabla,
                              'm',

                              RadioGroup_Bajas.ItemIndex,

                              // SELECT_SQL,
                              'SELECT m.*' + ' ' +
                              'FROM medio AS m' + ' ',

                              Memo_Filtros.Lines,
                              Memo_OrderBy.Lines,
                              var_a_Filtrar,

                              param_Cambiamos_Filtro,
                              false,   // param_ver_SQL_despues_Abrir : Boolean;
                              false ); // param_no_Cerrar_Conexion : Boolean {= false}

    var_a_Filtrar.Free;

    Label_Ctdad_Rgtros.Caption := IntToStr(SQLQuery_Medios.RecordCount);

    //Filtrar_tablas_ligadas;
    var_SQL_ADD.Free;
end;

procedure Tform_medios_000.Refrescar_Registros;
var var_descripcion : String;
begin
    // ********************************************************************************************* //
    // ** OJITO ... NO USAR CAMPOS AUTOINCREMENTABLES                                             ** //
    // ********************************************************************************************* //
    var_descripcion := '';

    if SQLQuery_Medios.RecordCount > 0 then
    begin
        var_descripcion := SQLQuery_Medios.FieldByName('descripcion').Value;
    end;

    Filtrar_Principal_Sin_Preguntar;

    if Trim(var_descripcion) <> '' then SQLQuery_Medios.Locate('descripcion', var_descripcion, []);
end;

procedure Tform_medios_000.Filtrar_tablas_ligadas;
var var_Lineas_Filtro  : TStrings;
    var_Lineas_OrderBy : TStrings;
begin
    if SQLQuery_Medios.RecordCount = 0 then Exit;

    if SQLQuery_Medios.State = dsInsert then
    begin
        Cerramos_Tablas_Ligadas;
        Exit;
    end;

    var_Lineas_Filtro  := TStringList.Create;
    var_Lineas_OrderBy := TStringList.Create;

    var_Lineas_Filtro.Free;
    var_Lineas_OrderBy.Free;
end;

procedure Tform_medios_000.no_Tocar;
begin
    BitBtn_Imprimir.Enabled := False;
end;

procedure Tform_medios_000.Insertar_Registro;
var var_msg  : TStrings;
    var_Form : TForm_medios_001;
begin
    with SQLQuery_Medios do
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
                    Insert ;

                    var_Form := TForm_medios_001.Create(nil);

                    var_Form.para_Empezar;

                    var_Form.ShowModal;
                    if var_Form.public_Pulso_Aceptar = true then
                        begin
                            FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
                            FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                            UTI_RGTRO_Grabar_Antes( 'medio',
                                                    SQLQuery_Medios );
                        end
                    else Cancel;

                    var_Form.Free;
                end;
        end;

        var_msg.Free;
    end;
end;

procedure Tform_medios_000.Seleccionado_Rgtro;
begin
    private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    public_Rgtro_Seleccionado := true;
    Close;
end;

procedure Tform_medios_000.Cerramos_Tablas;
begin
    Cerramos_Tablas_Ligadas;

    if UTI_TB_Cerrar( DataModule_Medios.SQLConnector,
                      DataModule_Medios.SQLTransaction,
                      SQLQuery_Medios ) = false then UTI_GEN_Salir;

    DataModule_Medios.Free;
end;

procedure TForm_medios_000.Presentar_Datos;
begin
     /// guardar por lo que pueda pasar
end;

procedure TForm_medios_000.Cerramos_Tablas_Ligadas;
begin
{ ESTE form NO TIENE TABLAS LIGADAS

    if UTI_TB_Cerrar( DataModule_del_form_000.SQLConnector_de_la_tabla,
                      DataModule_Users.SQLTransaction_de_la_tabla,
                      SQLQuery_la_tabla ) = false then UTI_GEN_Salir;
}
end;

procedure Tform_medios_000.FormCreate(Sender: TObject);
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

procedure Tform_medios_000.para_Empezar;
begin
  { ****************************************************************************
    Solo para formularios que traten con datos
    **************************************************************************** }
    if UTI_GEN_Form_Abierto_Ya('DataModule_Medios') = False then
    begin
        DataModule_Medios := TDataModule_Medios.Create(Application);
    end;

  { ****************************************************************************
    Preparamos los diferentes tipos de orden preconfigurados
    **************************************************************************** }
    SetLength(private_Order_By, 2);

    private_Order_By[0].Titulo       := rs_para_Empezar_1; // El índice 0 siempre será por el que empezará la aplicación y los filtros
    private_Order_By[0].Memo_OrderBy := 'm.descripcion ASC';

    private_Order_By[1].Titulo       := rs_para_Empezar_2;
    private_Order_By[1].Memo_OrderBy := 'm.id ASC';

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

procedure Tform_medios_000.SQLQuery_MediosBeforeEdit(DataSet: TDataSet);
begin
    UTI_RGTROS_guardar_valorCampo_BoforeEdit( SQLQuery_Medios );
end;

procedure Tform_medios_000.Editar_Registro;
var var_msg  : TStrings;
    var_Form : TForm_medios_001;
    var_id   : ShortString;
begin
    with SQLQuery_Medios do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
            begin
                var_id := FieldByName('id').AsString;

                if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
                begin
                    if UTI_RGTRO_isLock( 'medio',
                                         var_id,
                                         true ) = true then

                        begin
                            Exit;
                        end
                    else
                        begin
                            if UTI_RGTRO_Lock( 'medio',
                                               var_id ) = true then
                                 Edit
                            else Exit;
                        end;

                    var_Form := TForm_medios_001.Create(nil);

                    var_Form.public_Menu_Worked := public_Menu_Worked;

                    if public_Solo_Ver = true then
                    begin
                        var_Form.public_Solo_Ver := true;
                    end;

                    var_Form.para_Empezar;

                    var_Form.ShowModal;
                    if var_Form.public_Pulso_Aceptar = true then
                        begin
                            if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( SQLQuery_Medios ) = true then
                               begin
                                    FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                                    FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                                    UTI_RGTRO_Grabar_Antes( 'medio',
                                                            SQLQuery_Medios );
                               end
                            else Cancel;
                        end
                    else Cancel;

                    var_Form.Free;

                    UTI_RGTRO_UnLock( 'medio',
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

procedure Tform_medios_000.Filtrar_Principal_Sin_Preguntar;
begin
    RadioGroup_Bajas.ItemIndex := Filtrar_Principal( false );
end;

procedure Tform_medios_000.ComboBox_FiltrosChange(Sender: TObject);
begin
    Memo_OrderBy.Lines.Clear;
    Memo_OrderBy.Lines.Add( private_Order_By[ComboBox_Filtros.ItemIndex].Memo_OrderBy );
    BitBtn_FiltrarClick(Nil);
end;

end.


