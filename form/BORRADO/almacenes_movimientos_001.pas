unit almacenes_movimientos_001;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DBDateTimePicker, Forms, Controls, Graphics, Dialogs, ButtonPanel,
  utilidades_forms_Filtrar, utilidades_usuarios, ExtCtrls, StdCtrls, DBGrids, DbCtrls, Buttons,
  utilidades_bd, sqldb, utilidades_general, utilidades_rgtro, Grids, LCLTranslator;

resourcestring
  rs_Quitamos_1 = '¿Quitamos el ALMACEN DE DESTINO?';
  rs_Quitamos_2 = '¿Quitamos el ALMACEN DE ORIGEN?';
  rs_Quitamos_3 = '¿Quitamos el CONCEPTO?';

  rs_FormClose_1 = '* La fecha del movimiento.';
  rs_FormClose_2 = '* El almacén de destino.';
  rs_FormClose_3 = '* Si el tipo de movimiento es "Entrada manual", no puede existir el almacén de origen.';
  rs_FormClose_4 = '* Si el tipo de movimiento es "Traspaso entre almacenes", necesitamos el almacén de origen.';
  rs_FormClose_5 = '* El tipo de movimiento.';

  rs_Existe_Articulo_Ya_1 = 'Error al comprobar si el artículo ya fué puesto para este';
  rs_Existe_Articulo_Ya_2 = ' movimiento de almacén. La tabla ha sido ';
  rs_Existe_Articulo_Ya_3 = ' desde el módulo ';

  rs_Art_Repetido = 'Artículo repetido para este movimiento de almacén.';

type

  { Tform_almacenes_movimientos_001 }

  Tform_almacenes_movimientos_001 = class(TForm)
    BitBtn_Ver_Situacion_Registro_AMD: TBitBtn;
    Boton_Elegir_Almacen_Destino: TBitBtn;
    Boton_Elegir_Almacen_Origen: TBitBtn;
    Boton_Elegir_Concepto: TBitBtn;
    ButtonPanel1: TButtonPanel;
    DBDateTimePicker_Fecha_Movimiento: TDBDateTimePicker;
    DBEdit_eMail1: TDBEdit;
    DBGrid_AMD: TDBGrid;
    DBNavigator_AMD: TDBNavigator;
    DBRadioGroup_Tipo_Cuenta: TDBRadioGroup;
    Edit_Descripcion_Almacen_Destino: TEdit;
    Edit_Descripcion_Almacen_Origen: TEdit;
    Edit_Descripcion_Concepto: TEdit;
    GroupBox11: TGroupBox;
    GroupBox_AMD: TGroupBox;
    Label1: TLabel;
    Label6: TLabel;
    Label62: TLabel;
    Label64: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel_Tipo_Movimiento: TPanel;
    RadioGroup_Bajas: TRadioGroup;

    procedure Validacion( param_msg : TStrings );
    procedure Borrar_Registro_AMD;
    procedure Insertar_Registro_AMD;
    procedure Editar_Registro_AMD;
    procedure para_Empezar;
    function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
    function  Existe_Articulo_Ya( param_id, param_id_almacenes_movimientos, param_id_articulos : String ) : Trecord_Existe;
    procedure FormCreate(Sender: TObject);
    procedure Presentar_Datos;
    procedure Boton_Elegir_Almacen_DestinoClick(Sender: TObject);
    procedure Boton_Elegir_Almacen_OrigenClick(Sender: TObject);
    procedure Boton_Elegir_ConceptoClick(Sender: TObject);
    procedure Edit_Descripcion_Almacen_DestinoClick(Sender: TObject);
    procedure Edit_Descripcion_Almacen_OrigenClick(Sender: TObject);
    procedure Edit_Descripcion_ConceptoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure no_Tocar;
    procedure BitBtn_Ver_Situacion_Registro_AMDClick(Sender: TObject);
    procedure DBGrid_AMDDblClick(Sender: TObject);
    procedure DBGrid_AMDDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_AMDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBNavigator_AMDBeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure RadioGroup_BajasClick(Sender: TObject);
    procedure Refrescar_Registros;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
  private
    { private declarations }
    private_Salir_OK : Boolean;
public
    { public declarations }
    public_Solo_Ver      : Boolean;
    public_Menu_Worked   : Integer;
    public_Pulso_Aceptar : Boolean;
    public_Record_Rgtro  : TRecord_Rgtro_Comun;
  end;

var
  form_almacenes_movimientos_001: Tform_almacenes_movimientos_001;

implementation

{$R *.lfm}

uses menu, almacenes_movimientos_000, almacenes_movimientos_002;

{ Tform_almacenes_movimientos_001 }

procedure Tform_almacenes_movimientos_001.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := True;
    public_Pulso_Aceptar := true;
end;

procedure Tform_almacenes_movimientos_001.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := True;
    public_Pulso_Aceptar := false;
end;

procedure Tform_almacenes_movimientos_001.Refrescar_Registros;
begin
    form_almacenes_movimientos_000.Refrescar_Registros_AMD;
end;

procedure Tform_almacenes_movimientos_001.DBGrid_AMDDblClick(Sender: TObject);
begin
    Editar_Registro_AMD;
end;

procedure Tform_almacenes_movimientos_001.BitBtn_Ver_Situacion_Registro_AMDClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if form_almacenes_movimientos_000.SQLQuery_AMD.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'almacenes_movimientos_detalles',
                                           form_almacenes_movimientos_000.SQLQuery_AMD,
                                           form_almacenes_movimientos_000.DataSource_AMD,
                                           DBGrid_AMD );
        end;
    end;
end;

procedure Tform_almacenes_movimientos_001.DBGrid_AMDDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
var var_Color_Normal : TColor;
begin
    with Sender as TDBGrid do
    begin
        if form_almacenes_movimientos_000.SQLQuery_AMD.RecordCount = 0 then Exit;

        var_Color_Normal := Canvas.Brush.Color;

      { ************************************************************************
        Primero comprobamos si es un registro dado de baja o no
        ************************************************************************ }
        if not form_almacenes_movimientos_000.SQLQuery_AMD.FieldByName('Del_WHEN').IsNull then
            begin
              { ****************************************************************
                Registro DADO de BAJA
                **************************************************************** }
                Canvas.Font.Color := clSilver;
            end
        else
            begin
              { ****************************************************************
                Registro DADO de ALTA, NO BAJA
                ****************************************************************
                Así que las pinto, pero sólo si no son las columnas que van a
                ser dibujadas
                **************************************************************** }
                if State <> [gdSelected] then
                begin
                    if (Column.FieldName <> 'COLUMNA_CON_IMAGEN') then
                    begin
                        Canvas.font.Color := clBlack;
                    end;
                end;
            end;

      { ************************************************************************
        Ahora paso a dibujar una celda normal con los colores elegidos o una
        dibujada
        ************************************************************************ }
        if (Column.FieldName <> 'COLUMNA_CON_IMAGEN') then
            begin
              { ****************************************************************
                No es una de las columnas a dibujar por lo que la pinto con los
                colores elegidos
                **************************************************************** }
                DefaultDrawColumnCell(Rect, DataCol, Column, State)
            end
        else
            begin
              { ****************************************************************
                Es una de las columnas a dibujar
                **************************************************************** }
                // COLUMNA CONFIRMADA
                if Column.FieldName = 'COLUMNA_CON_IMAGEN'  then
                begin
                    {
                    if Trim(form_almacenes_movimientos_000.SQLQuery_AMD.FieldByName('id_medio').asString) = '1' then
                    begin
                        Canvas.StretchDraw(param_Rect, Image_Confirmado.Picture.Graphic);
                    end;
                    }
                end;
            end;

        Canvas.Font.Color := var_Color_Normal;
    end;
end;

procedure Tform_almacenes_movimientos_001.DBGrid_AMDKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then Editar_Registro_AMD;
end;

procedure Tform_almacenes_movimientos_001.DBNavigator_AMDBeforeAction(Sender: TObject;
    Button: TDBNavButtonType);
begin
    case Button of
        nbInsert : begin
            Insertar_Registro_AMD;
            Abort;
        end;

        nbEdit : begin
            Editar_Registro_AMD;
            Abort;
        end;

        nbDelete : begin
            Borrar_Registro_AMD;
            Abort;
        end;

        nbRefresh : begin
            form_almacenes_movimientos_000.Refrescar_Registros_AMD;
            Abort;
        end;
    end;
end;

procedure Tform_almacenes_movimientos_001.RadioGroup_BajasClick(Sender: TObject);
begin
    //UTI_TB_Ver_Bajas_SN('um', Memo_Filtros.Lines, RadioGroup_Bajas.ItemIndex);
    Refrescar_Registros;
end;

procedure Tform_almacenes_movimientos_001.Boton_Elegir_Almacen_DestinoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_almacenes_movimientos_000.SQLQuery_AM do
    begin
        var_Registro := UTI_Abrir_Form( true, false, '', 260 );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_almacenes_destino').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Almacen_Destino.Text        := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_almacenes_movimientos_001.Boton_Elegir_Almacen_OrigenClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_almacenes_movimientos_000.SQLQuery_AM do
    begin
        var_Registro := UTI_Abrir_Form( true, false, '', 260 );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_almacenes_origen').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Almacen_Origen.Text        := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_almacenes_movimientos_001.Boton_Elegir_ConceptoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_almacenes_movimientos_000.SQLQuery_AM do
    begin
        var_Registro := UTI_Abrir_Form( true, false, '', 290 );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_conceptos_almacen_traspaso').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Concepto.Text                        := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_almacenes_movimientos_001.Edit_Descripcion_Almacen_DestinoClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add(rs_Quitamos_1);
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_almacenes_movimientos_000.SQLQuery_AM.FieldByName('id_almacenes_destino').Clear;
         Edit_Descripcion_Almacen_Destino.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_almacenes_movimientos_001.Edit_Descripcion_Almacen_OrigenClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add(rs_Quitamos_2);
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_almacenes_movimientos_000.SQLQuery_AM.FieldByName('id_almacenes_origen').Clear;
         Edit_Descripcion_Almacen_Origen.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_almacenes_movimientos_001.Edit_Descripcion_ConceptoClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add(rs_Quitamos_3);
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_almacenes_movimientos_000.SQLQuery_AM.FieldByName('id_conceptos_almacen_traspaso').Clear;
         Edit_Descripcion_Concepto.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_almacenes_movimientos_001.Validacion( param_msg : TStrings );
begin
    with form_almacenes_movimientos_000.SQLQuery_AM do
    begin
        if FieldByName('Fecha_Movimiento').IsNull then
        begin
            param_msg.Add(rs_FormClose_1);
        end else begin
            FieldByName('Fecha_Movimiento').asstring := FieldByName('Fecha_Movimiento').asstring;
        end;

        if Trim(FieldByName('id_almacenes_destino').AsString) = '' then
        begin
            param_msg.Add(rs_FormClose_2);
        end;

        if Trim(FieldByName('Tipo_Movimiento').AsString) = '' then
           begin
               param_msg.Add(rs_FormClose_5);
           end
        else begin
            if (Trim(FieldByName('Tipo_Movimiento').AsString) = '2')     and
               (Trim(FieldByName('id_almacenes_origen').AsString) <> '') then
            begin
               param_msg.Add(rs_FormClose_3);
            end;

            if (Trim(FieldByName('Tipo_Movimiento').AsString) = '1')     and
               (Trim(FieldByName('id_almacenes_origen').AsString) = '') then
            begin
               param_msg.Add(rs_FormClose_4);
            end;
        end;
    end;
end;

procedure Tform_almacenes_movimientos_001.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg : TStrings;
begin
    ButtonPanel1.SetFocus; // Con esto consigo que salga del campo que este y pueda actualizarlo

    var_msg := TStringList.Create;

    if public_Pulso_Aceptar = true then
    begin
        Validacion(var_msg);
    end;

    if private_Salir_OK = False then
        begin
          { ********************************************************************
            Intento BitBtn_SALIR de la aplicación de un modo no permitido.
            ********************************************************************
            Pero si desde el menu principal está a true la variable
            public_Salir_Ok, significa que hay que salir si o si pues se pulsó
            cancelar al preguntar otra vez por la contraseña
            ******************************************************************** }
            if form_Menu.public_Salir_OK = False then
            begin
                CloseAction := CloseAction.caNone;
            end;
        end
    else
        begin
          { ********************************************************************
            Fue correcto el modo como quiere salir de la aplicación
            ********************************************************************
            Comprobaremos si no se generó algún error por falta de completar
            algun campo y si se salió con el botón Ok o Cancel
            ******************************************************************** }
            if (Trim(var_msg.Text) <> '') and (public_Pulso_Aceptar = true) then
                begin
                    UTI_GEN_Aviso(true, var_msg, rs_Falta, True, False);
                    // var_msg.Free;
                    CloseAction := CloseAction.caNone;
                end
            else
                begin
                    // var_msg.Free;
                    CloseAction := caFree;
                end;
        end;

    var_msg.Free;
end;

procedure Tform_almacenes_movimientos_001.Presentar_Datos;
begin
    with form_almacenes_movimientos_000.SQLQuery_AM do
    begin
        Edit_Descripcion_Almacen_Destino.Text := FieldByName('OT_descripcion_almacen_destino').AsString;
        Edit_Descripcion_Almacen_Origen.Text  := FieldByName('OT_descripcion_almacen_origen').AsString;
        Edit_Descripcion_Concepto.Text        := FieldByName('OT_descripcion_conceptos_almacen_traspaso').AsString;
    end;
end;

procedure Tform_almacenes_movimientos_001.FormCreate(Sender: TObject);
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
      public_Solo_Ver     := false;
end;

procedure Tform_almacenes_movimientos_001.para_Empezar;
begin
  { ****************************************************************************
    Solo para formularios que traten con datos
    **************************************************************************** }
    with form_almacenes_movimientos_000.SQLQuery_AM do
    begin
        public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                           '',
                                                           '',

                                                           '',
                                                           '',
                                                           '' );
    end;

    Presentar_Datos;

  { ****************************************************************************
    SOLO PARA ESTE FORM
    **************************************************************************** }
end;

function Tform_almacenes_movimientos_001.Existe_Articulo_Ya( param_id,
                                                             param_id_almacenes_movimientos,
                                                             param_id_articulos : String ) : Trecord_Existe;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
    try
      { ****************************************************************************
        Creamos la Transaccion y la conexión con el motor BD, y la abrimos
        **************************************************************************** }
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Abrir( var_SQLTransaction,
                         var_SQLConnector ) = False then UTI_GEN_Salir;

      { ****************************************************************************
        Creamos la SQL Según el motor de BD
        **************************************************************************** }
        var_SQL := TStringList.Create;

        var_SQL.Add('SELECT amd.*' );
        var_SQL.Add(  'FROM almacenes_movimientos_detalles AS amd' );
        var_SQL.Add(' WHERE amd.id_articulos = ' +  Trim(param_id_articulos) );
        var_SQL.Add(  ' AND amd.id_almacenes_movimientos = ' +  Trim(param_id_almacenes_movimientos) );

        if Trim(param_id) <> '' then
        begin
             var_SQL.Add(  ' AND NOT amd.id = ' + Trim(param_id) );
        end;

        var_SQL.Add(' ORDER BY amd.id_almacenes_movimientos ASC, amd.id_articulos ASC, amd.Unidades ASC' );

      { ****************************************************************************
        Abrimos la tabla
        **************************************************************************** }
        var_SQLQuery      := TSQLQuery.Create(nil);
        var_SQLQuery.Name := 'SQLQuery_Existe_Articulo_Ya';

        if UTI_TB_Abrir( '', '', '',
                         var_SQLConnector,
                         var_SQLTransaction,
                         var_SQLQuery,
                         -1, // asi me trae todos los registros de golpe
                         var_SQL.Text ) = False then UTI_GEN_Salir;

      { ****************************************************************************
        TRABAJAMOS CON LOS REGISTROS DEVUELTOS
        ****************************************************************************
        Si el módulo no se creó, no se permite entrar en él ... Result := False
        **************************************************************************** }
        Result.Fallo_en_Conexion_BD := false;
        Result.Existe               := false;
        Result.deBaja               := 'N';

        if var_SQLQuery.RecordCount > 0 then
        begin
            Result.Existe := true;
            if not var_SQLQuery.FieldByName('Del_WHEN').IsNull then Result.deBaja := 'S';
        end;

      { ****************************************************************************
        Cerramos la tabla
        **************************************************************************** }
        if UTI_TB_Cerrar( var_SQLConnector,
                          var_SQLTransaction,
                          var_SQLQuery ) = false then UTI_GEN_Salir;

        var_SQLQuery.Free;

        var_SQL.Free;

        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( rs_Existe_Articulo_Ya_1 +
                               rs_Existe_Articulo_Ya_2 + var_SQLQuery.Name +
                               rs_Existe_Articulo_Ya_3 + Screen.ActiveForm.Name,
                               error );
            try
                var_SQL.Free;
                var_SQLTransaction.Free;
                var_SQLConnector.Free;
                var_SQLQuery.Free;
            except
            end;

            Result.Fallo_en_Conexion_BD := true;
        end;
    end;
end;

procedure Tform_almacenes_movimientos_001.no_Tocar;
begin
    DBDateTimePicker_Fecha_Movimiento.Enabled := False;
    Boton_Elegir_Almacen_Destino.Enabled      := False;
    Edit_Descripcion_Almacen_Destino.Enabled  := False;
    Boton_Elegir_Almacen_Origen.Enabled       := False;
    Edit_Descripcion_Almacen_Origen.Enabled   := False;
    Panel_Tipo_Movimiento.Enabled             := False;
    Boton_Elegir_Concepto.Enabled             := False;
    Edit_Descripcion_Concepto.Enabled         := False;
end;

procedure Tform_almacenes_movimientos_001.FormActivate(Sender: TObject);
begin
    If form_almacenes_movimientos_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    Comprobar_No_Tocar(true, true);
end;

function Tform_almacenes_movimientos_001.Comprobar_No_Tocar( param_Reproducir_Mensajes,
                                                             param_Ejecutar_No_Tocar : Boolean ) : Boolean;
begin
    Result := false;

    // ********************************************************************************************* //
    // ** Si se llamó para solo verlo, pues no se puede tocar                                     ** //
    // ********************************************************************************************* //
    if public_Solo_Ver = true then
    begin
        Result := true;
        if param_Ejecutar_No_Tocar = true then no_Tocar;
    end;
end;

procedure Tform_almacenes_movimientos_001.Insertar_Registro_AMD;
var var_msg           : TStrings;
    var_Form          : Tform_almacenes_movimientos_002;
    var_record_Existe : Trecord_Existe;
begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    with form_almacenes_movimientos_000.SQLQuery_AMD do
    begin
        var_msg := TStringList.Create;

        if UTI_USR_Permiso_SN(public_Menu_Worked, 'A', True) = True then
        begin
            if public_Solo_Ver = True then
                begin
                    var_msg.Clear;
                    var_msg.Add(rs_Solo_Visualizar);
                    UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
                end
            else
                begin
                    Insert;

                    FieldByName('id_almacenes_movimientos').AsString := form_almacenes_movimientos_000.SQLQuery_AM.FieldByName('id').AsString;

                    FieldByName('id_almacenes_destino').AsString     := form_almacenes_movimientos_000.SQLQuery_AM.FieldByName('id_almacenes_destino').AsString;
                    FieldByName('id_almacenes_origen').AsString      := form_almacenes_movimientos_000.SQLQuery_AM.FieldByName('id_almacenes_origen').AsString;

                    var_Form := Tform_almacenes_movimientos_002.Create(nil);

                    var_Form.para_Empezar;

                    var_Form.ShowModal;
                    if var_Form.public_Pulso_Aceptar = true then
                        begin
                            var_Form.Free;
                            var_record_Existe := Existe_Articulo_Ya( '', // Estoy insertando/creando y lo que tengo que comprobar es que no exista la pwd en cualquier otro usuario, por lo que el campo id_Users no lo paso
                                                                     FieldByName('id_almacenes_movimientos').AsString,
                                                                     FieldByName('id_articulos').AsString );

                            if var_record_Existe.Fallo_en_Conexion_BD = true then
                                begin
                                    // var_Form.Free;
                                    Cancel;
                                end
                            else
                                begin
                                    if var_record_Existe.Existe = false then
                                        begin
                                            // FieldByName('id_almacenes_movimientos').AsString := form_almacenes_movimientos_000.SQLQuery_AM.FieldByName('id').AsString;

                                            FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
                                            FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                                            UTI_RGTRO_Grabar_Antes( 'almacenes_movimientos_detalles',
                                                                    form_almacenes_movimientos_000.SQLQuery_AMD );
                                        end
                                    else
                                        begin
                                            Cancel;
                                            var_msg.Clear;

                                            var_msg.Add(rs_Art_Repetido);

                                            if UpperCase(var_record_Existe.deBaja) = 'S' then
                                            begin
                                                var_msg.Add(rs_Rgtro_Borrado);
                                            end;

                                            UTI_GEN_Aviso(true, var_msg, rs_Ya_Existe, True, False);
                                        end;
                                end;
                        end
                    else
                        begin
                            var_Form.Free;
                            Cancel;
                        end;
                end;
        end;

        var_msg.Free;
    end;
end;

procedure Tform_almacenes_movimientos_001.Editar_Registro_AMD;
var var_msg           : TStrings;
    var_Form          : Tform_almacenes_movimientos_002;
    var_record_Existe : Trecord_Existe;
    var_id            : ShortString;
begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    with form_almacenes_movimientos_000.SQLQuery_AMD do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
            begin
                var_id := FieldByName('id').AsString;

                if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
                begin
                    if UTI_RGTRO_isLock( 'almacenes_movimientos_detalles',
                                         FieldByName('id').AsString,
                                         true ) = true then
                        begin
                            Exit;
                        end
                    else
                        begin
                            if UTI_RGTRO_Lock( 'almacenes_movimientos_detalles',
                                               FieldByName('id').AsString ) = true then
                                 Edit
                            else Exit;
                        end;

                    var_Form := Tform_almacenes_movimientos_002.Create(nil);

                    var_Form.public_Menu_Worked := public_Menu_Worked;

                    if public_Solo_Ver = true then
                    begin
                        var_Form.public_Solo_Ver := true;
                    end;

                    var_Form.para_Empezar;

                    var_Form.ShowModal;
                    if var_Form.public_Pulso_Aceptar = true then
                        begin
                            var_record_Existe := Existe_Articulo_Ya( FieldByName('id').AsString, // Estoy insertando/creando y lo que tengo que comprobar es que no exista la pwd en cualquier otro usuario, por lo que el campo id_Users no lo paso
                                                                     FieldByName('id_almacenes_movimientos').AsString,
                                                                     FieldByName('id_articulos').AsString );

                            if var_record_Existe.Fallo_en_Conexion_BD = true then
                                begin
                                    var_Form.Free;
                                    Cancel;
                                end
                            else
                                begin
                                    if var_record_Existe.Existe = false then
                                        begin
                                            if ( Trim(Params.ParamByName('COPY_' + 'id_almacenes_movimientos').AsString) <> Trim(FieldByName('id_almacenes_movimientos').AsString) ) or
                                               ( Trim(Params.ParamByName('COPY_' + 'id_almacenes_destino').AsString)     <> Trim(FieldByName('id_almacenes_destino').AsString) )     or
                                               ( Trim(Params.ParamByName('COPY_' + 'id_almacenes_origen').AsString)      <> Trim(FieldByName('id_almacenes_origen').AsString) )      or
                                               ( Trim(Params.ParamByName('COPY_' + 'id_articulos').AsString)             <> Trim(FieldByName('id_articulos').AsString) )             or
                                               ( Trim(Params.ParamByName('COPY_' + 'Unidades').AsString)                 <> Trim(FieldByName('Unidades').AsString) )                 then
                                                begin
                                                    FieldByName('Change_WHEN').Value             := UTI_CN_Fecha_Hora;
                                                    FieldByName('Change_Id_User').Value          := Form_Menu.public_User;

                                                    FieldByName('id_almacenes_destino').AsString := form_almacenes_movimientos_000.SQLQuery_AM.FieldByName('id_almacenes_destino').AsString;
                                                    FieldByName('id_almacenes_origen').AsString  := form_almacenes_movimientos_000.SQLQuery_AM.FieldByName('id_almacenes_origen').AsString;

                                                    UTI_RGTRO_Grabar_Antes( 'almacenes_movimientos_detalles',
                                                                            form_almacenes_movimientos_000.SQLQuery_AMD );
                                               end
                                            else Cancel;
                                            var_Form.Free;
                                        end
                                    else
                                        begin
                                            var_Form.Free;
                                            Cancel;
                                            var_msg.Clear;

                                            var_msg.Add(rs_Art_Repetido);

                                            if UpperCase(var_record_Existe.deBaja) = 'S' then
                                            begin
                                                var_msg.Add(rs_Rgtro_Borrado);
                                            end;

                                            UTI_GEN_Aviso(true, var_msg, rs_Ya_Existe, True, False);
                                        end;
                                end;
                        end
                    else
                        begin
                            var_Form.Free;
                            Cancel;
                        end;

                    UTI_RGTRO_UnLock( 'almacenes_movimientos_detalles',
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

procedure Tform_almacenes_movimientos_001.Borrar_Registro_AMD;
begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    if UTI_USR_Permiso_SN(public_Menu_Worked, 'B', True) = True then
    begin
        UTI_RGTRO_Borrar( 'almacenes_movimientos_detalles',
                          form_almacenes_movimientos_000.SQLQuery_AMD,
                          public_Solo_Ver,
                          public_Menu_Worked );
    end;
end;

end.


