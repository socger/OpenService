unit articulos_005;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ButtonPanel, StdCtrls, DbCtrls,
    utilidades_rgtro, utilidades_usuarios, utilidades_general, utilidades_forms_Filtrar, Buttons,
    utilidades_bd, utilidades_datos_tablas, DBGrids, sqldb, Grids, ExtCtrls, LCLTranslator;

resourcestring
  rs_FormClose_x1 = '* La descripción.';
  rs_FormClose_x2 = '* La descripción para la terminal/TPV, por que la descripción es mayor de 50 caracteres.';
  rs_FormClose_x3 = '* La cantidad a descontar.';

  rs_EaPtY_1      = 'Error al comprobar si la tarifa existe ya para el artículo.';
  rs_EaPtY_2      = 'La tabla ha sido ';
  rs_EaPtY_3      = ' desde el módulo ';

  rs_Editar_Registro_Proporciones_Tarifas_1 = 'Tarifa repetida.';

type

    { Tform_articulos_005 }

    Tform_articulos_005 = class(TForm)
        BitBtn_Ver_Situacion_Registro_Tarifas: TBitBtn;
        ButtonPanel1: TButtonPanel;
        DBEdit_Descripcion_para_terminal: TDBEdit;
        DBEdit_eMail1: TDBEdit;
        DBEdit_Cantidad_a_Descontar: TDBEdit;
        DBGrid_Tarifas: TDBGrid;
        DBMemo_Descripcion: TDBMemo;
        DBNavigator_Tarifas: TDBNavigator;
        GroupBox11: TGroupBox;
        Label1: TLabel;
        Label2: TLabel;
        Label62: TLabel;
        Label65: TLabel;
        Label68: TLabel;
        RadioGroup_Bajas: TRadioGroup;

        procedure Validacion( param_msg : TStrings );
        procedure RadioGroup_BajasClick(Sender: TObject);
        function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
        procedure Refrescar_Registros;
        function  Existe_art_Proporciones_Tarifa_Ya( param_id, param_id_articulos_proporciones, param_id_tarifas : ShortString ) : Trecord_Existe;
        procedure Editar_Registro_Proporciones_Tarifas;
        procedure BitBtn_Ver_Situacion_Registro_TarifasClick(Sender: TObject);
        procedure DBGrid_TarifasDblClick(Sender: TObject);
        procedure DBGrid_TarifasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
        procedure DBGrid_TarifasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure DBNavigator_TarifasBeforeAction(Sender: TObject; Button: TDBNavButtonType);
        procedure no_Tocar;
        procedure OKButtonClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
        procedure para_Empezar;
        procedure Presentar_Datos;
        procedure FormActivate(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    private
        { private declarations }
        private_Salir_OK     : Boolean;
    public
        { public declarations }
        public_Solo_Ver      : Boolean;
        public_Menu_Worked   : Integer;
        public_Pulso_Aceptar : Boolean;
        public_Record_Rgtro  : TRecord_Rgtro_Comun;
    end;

var
    form_articulos_005: Tform_articulos_005;

implementation

{$R *.lfm}

uses menu, articulos_000, articulos_006;

{ Tform_articulos_005 }

procedure Tform_articulos_005.FormCreate(Sender: TObject);
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
    public_Solo_Ver := false;
end;

procedure Tform_articulos_005.para_Empezar;
begin
  { ****************************************************************************
    Solo para formularios que traten con datos
    **************************************************************************** }
    with form_articulos_000.SQLQuery_Articulos_Proporciones do
    begin
        public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                           '',
                                                           '',

                                                           FieldByName('descripcion').AsString,
                                                           '',
                                                           '' );
    end;

    Presentar_Datos;
end;

procedure Tform_articulos_005.DBGrid_TarifasDblClick(Sender: TObject);
begin
    Editar_Registro_Proporciones_Tarifas;
end;

procedure Tform_articulos_005.DBGrid_TarifasDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
var var_Color_Normal : TColor;
begin
    with Sender as TDBGrid do
    begin
        if form_articulos_000.SQLQuery_Articulos_Proporciones_Tarifas.RecordCount = 0 then Exit;

        var_Color_Normal := Canvas.Brush.Color;

      { ************************************************************************
        Primero comprobamos si es un registro dado de baja o no
        ************************************************************************ }
        if not form_articulos_000.SQLQuery_Articulos_Proporciones_Tarifas.FieldByName('Del_WHEN').IsNull then
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
                    if Trim(form_articulos_000.SQLQuery_Articulos_Proporciones_Tarifas.FieldByName('id_medio').asString) = '1' then
                    begin
                        Canvas.StretchDraw(param_Rect, Image_Confirmado.Picture.Graphic);
                    end;
                    }
                end;
            end;

        Canvas.Font.Color := var_Color_Normal;
    end;
end;

procedure Tform_articulos_005.DBGrid_TarifasKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then Editar_Registro_Proporciones_Tarifas;
end;

procedure Tform_articulos_005.DBNavigator_TarifasBeforeAction(Sender: TObject;
    Button: TDBNavButtonType);
begin
    case Button of
        nbInsert : begin
            // ************************************************************************************* //
            // ** No hace falta insertar porque se insertan automáticamente en el momento que se  ** //
            // ** crea una nueva tarifa, incluso cuando se borra la tarifa, también se borra auto-** //
            // ** máticamente en familias de articulos y articulos                                ** //
            // ************************************************************************************* //
            Abort;
        end;

        nbEdit : begin
            Editar_Registro_Proporciones_Tarifas;
            Abort;
        end;

        nbDelete : begin
            // ************************************************************************************* //
            // ** No hace falta borrar porque se borran automáticamente en el momento se borra la ** //
            // ** tarifa, desde el mantenimiento de tarifas                                       ** //
            // ************************************************************************************* //
            Abort;
        end;

        nbRefresh : begin
            form_articulos_000.Refrescar_Registros_Proporciones_Tarifas;
            Abort;
        end;
    end;
end;

procedure Tform_articulos_005.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := true;
end;

procedure Tform_articulos_005.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := false;
end;

procedure Tform_articulos_005.Refrescar_Registros;
begin
    form_articulos_000.Refrescar_Registros_Proporciones_Tarifas;
end;

procedure Tform_articulos_005.RadioGroup_BajasClick(Sender: TObject);
begin
    //UTI_TB_Ver_Bajas_SN('um', Memo_Filtros.Lines, RadioGroup_Bajas.ItemIndex);
    Refrescar_Registros;
end;

procedure Tform_articulos_005.BitBtn_Ver_Situacion_Registro_TarifasClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if form_articulos_000.SQLQuery_Articulos_Proporciones_Tarifas.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'articulos_proporciones_tarifas',
                                           form_articulos_000.SQLQuery_Articulos_Proporciones_Tarifas,
                                           form_articulos_000.DataSource_Art_Proporciones_Tarifas,
                                           DBGrid_Tarifas );
        end;
    end;
end;

procedure Tform_articulos_005.Presentar_Datos;
begin
    WITH form_articulos_000.SQLQuery_Articulos_Proporciones DO
    BEGIN
        { NO HAY NINGUN CAMPO que necesite ser presentado }
    END;
end;

procedure Tform_articulos_005.Validacion( param_msg : TStrings );
begin
    with form_articulos_000.SQLQuery_Articulos_Proporciones do
    begin
        if Trim(FieldByName('descripcion').AsString) = '' then
        begin
            param_msg.Add(rs_FormClose_x1);
        end else begin
            if Length(Trim(FieldByName('descripcion').AsString)) <= 50 then
            begin
                if Trim(FieldByName('descripcion_para_TPV').AsString) = '' then
                begin
                    FieldByName('descripcion_para_TPV').AsString := Trim(FieldByName('descripcion').AsString);
                end;
            end;
        end;

        if Trim(FieldByName('descripcion_para_TPV').AsString) = '' then
        begin
            param_msg.Add(rs_FormClose_x2);
        end;

        if Trim(FieldByName('Cantidad_Descontar').AsString) = '' then
        begin
            param_msg.Add(rs_FormClose_x3);
        end;
    end;
end;

procedure Tform_articulos_005.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg : TStrings;
begin
    ButtonPanel1.SetFocus; // Con esto consigo que salga del campo que este y pueda actualizarlo

    var_msg := TStringList.Create;

    if public_Pulso_Aceptar = true then
    begin
        Validacion( var_msg );
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
            if form_Menu.public_Salir_OK = False then CloseAction := TCloseAction.caNone;
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
                    CloseAction := TCloseAction.caNone;
                end
            else
                begin
                    // var_msg.Free;
                    CloseAction := caFree;
                end;
        end;

    var_msg.Free;
end;

function Tform_articulos_005.Existe_art_Proporciones_Tarifa_Ya( param_id,
                                                                param_id_articulos_proporciones,
                                                                param_id_tarifas : ShortString ) : Trecord_Existe;
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

        var_SQL.Add('SELECT a.*' );
        var_SQL.Add(  'FROM articulos_proporciones_tarifas AS a' );
        var_SQL.Add(' WHERE a.id_articulos_proporciones = ' +  Trim(param_id_articulos_proporciones) );
        var_SQL.Add(  ' AND a.id_tarifas = ' +  Trim(param_id_tarifas) );

        if Trim(param_id) <> '' then
        begin
             var_SQL.Add(  ' AND NOT a.id = ' + Trim(param_id) );
        end;

        var_SQL.Add(' ORDER BY a.id_articulos_proporciones ASC, a.id_tarifas ASC' );

      { ****************************************************************************
        Abrimos la tabla
        **************************************************************************** }
        var_SQLQuery      := TSQLQuery.Create(nil);
        var_SQLQuery.Name := 'SQLQuery_Existe_art_Proporciones_Tarifa_Ya';

        if UTI_TB_Query_Open( '',
                              '',
                              '',
                              var_SQLConnector,
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
             UTI_GEN_Error_Log( rs_EaPtY_1 +
                                rs_EaPtY_2 + var_SQLQuery.Name +
                                rs_EaPtY_3 + Screen.ActiveForm.Name,
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

procedure Tform_articulos_005.no_Tocar;
begin
    DBMemo_Descripcion.Enabled               := False;
    DBEdit_Descripcion_para_terminal.Enabled := False;
    DBEdit_Cantidad_a_Descontar.Enabled      := False;
end;

procedure Tform_articulos_005.FormActivate(Sender: TObject);
begin
    If form_articulos_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    Comprobar_No_Tocar(true, true);
end;

function Tform_articulos_005.Comprobar_No_Tocar( param_Reproducir_Mensajes,
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

procedure Tform_articulos_005.Editar_Registro_Proporciones_Tarifas;
var var_msg           : TStrings;
    var_Form          : Tform_articulos_006;
    var_record_Existe : Trecord_Existe;
    var_id            : ShortString;
begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    with form_articulos_000.SQLQuery_Articulos_Proporciones_Tarifas do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
        begin
            var_id := FieldByName('id').AsString;

            if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
            begin
                if UTI_RGTRO_isLock( 'articulos_proporciones_tarifas',
                                     FieldByName('id').AsString,
                                     true ) = true then
                begin
                    Exit;
                end else begin
                    if UTI_RGTRO_Lock( 'articulos_proporciones_tarifas',
                                       FieldByName('id').AsString ) = true then
                         Edit
                    else Exit;
                end;

                var_Form := Tform_articulos_006.Create(nil);

                var_Form.public_Menu_Worked := public_Menu_Worked;

                if public_Solo_Ver = true then
                begin
                    var_Form.public_Solo_Ver := true;
                end;

                var_Form.para_Empezar;

                var_Form.ShowModal;
                if var_Form.public_Pulso_Aceptar = true then
                begin
                    var_record_Existe := Existe_art_Proporciones_Tarifa_Ya( FieldByName('id').AsString,
                                                                            FieldByName('id_articulos_proporciones').AsString,
                                                                            FieldByName('id_tarifas').AsString );

                    if var_record_Existe.Fallo_en_Conexion_BD = true then
                    begin
                        var_Form.Free;
                        Cancel;
                    end else begin
                        if var_record_Existe.Existe = false then
                        begin
                            if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( form_articulos_000.SQLQuery_Articulos_Proporciones_Tarifas ) = true then
                            begin
                                FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                                FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                                UTI_RGTRO_Grabar_Antes( 'articulos_proporciones_tarifas',
                                                        form_articulos_000.SQLQuery_Articulos_Proporciones_Tarifas );
                            end else begin
                                Cancel;
                            end;
                            var_Form.Free;
                        end else begin
                            var_Form.Free;
                            Cancel;
                            var_msg.Clear;
                            var_msg.Add(rs_Editar_Registro_Proporciones_Tarifas_1);

                            if UpperCase(var_record_Existe.deBaja) = 'S' then
                            begin
                                var_msg.Add(rs_Rgtro_Borrado);
                            end;

                            UTI_GEN_Aviso(true, var_msg, rs_Ya_Existe, True, False);
                        end;
                    end;
                end else begin
                    var_Form.Free;
                    Cancel;
                end;

                UTI_RGTRO_UnLock( 'articulos_proporciones_tarifas',
                                  var_id );
            end;
        end else begin
            var_msg.Add(rs_no_Hay_Rgtros);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        end;
    end;

    var_msg.Free;
end;

end.


