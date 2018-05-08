unit personal_familias_001;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ButtonPanel, ExtCtrls, StdCtrls,
  utilidades_general, utilidades_usuarios, utilidades_forms_Filtrar, DbCtrls, DBGrids, Buttons, db,
  utilidades_contabilidad, utilidades_bd, utilidades_rgtro, sqldb, variants, Grids;

type

  { Tform_personal_familias_001 }

  Tform_personal_familias_001 = class(TForm)
    BitBtn_Ver_Situacion_Registro_SubFamilias: TBitBtn;
    Boton_Elegir_Familia_Superior: TBitBtn;
    ButtonPanel1: TButtonPanel;
    DBEdit_Cuenta_Contable: TDBEdit;
    DBEdit_Descripcion: TDBEdit;
    DBEdit_eMail1: TDBEdit;
    DBGrid_SubFamilias: TDBGrid;
    DBNavigator_SubFamilias: TDBNavigator;
    Edit_Descripcion_Familia_Superior: TEdit;
    GroupBox11: TGroupBox;
    Label1: TLabel;
    Label17: TLabel;
    Label24: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Panel_SubFamilias: TPanel;
    RadioGroup_Bajas: TRadioGroup;

    procedure para_Empezar;
    function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
    function  Elegir_Familia(param_familia : ShortString) : TRecord_Rgtro_Comun;
    procedure Cauto_SubFamilia_Y_Guardo_en_Historico_sus_Cambios( param_id_personal_familias, param_Id, param_descripcion : ShortString );
    procedure Asignar_Familia_Personal_como_SubFamilia;
    function  Asignar_Familia_Personal_como_SubFamilia_2( param_id, param_personal_familias : ShortString ) : Boolean;
    function  Existe_SubFamilia_Personal_Ya( param_id, param_id_personal_familias : ShortString ) : Trecord_Existe;
    procedure Quitar_SubFamilia_de_Familia;
    procedure Boton_Elegir_Familia_SuperiorClick(Sender: TObject);
    procedure Edit_Descripcion_Familia_SuperiorClick(Sender: TObject);
    procedure no_Tocar;
    procedure DBGrid_SubFamiliasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBNavigator_SubFamiliasBeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure Presentar_Datos;
    procedure BitBtn_Ver_Situacion_Registro_SubFamiliasClick(Sender: TObject);
    procedure RadioGroup_BajasClick(Sender: TObject);
    procedure Refrescar_Registros;
    procedure Actualizar_Campos_Fecha_Hora_Si_Completado( param_msg : TStrings );
    procedure CancelButtonClick(Sender: TObject);
    procedure Comprobar_Toda_Fecha_Hora( param_msg : TStrings );
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
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
  form_personal_familias_001: Tform_personal_familias_001;

implementation

{$R *.lfm}

uses dm_personal_familias, menu, personal_familias_000, personal_familias_002;

{ Tform_personal_familias_001 }

procedure Tform_personal_familias_001.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg : TStrings;
begin
    ButtonPanel1.SetFocus; // Con esto consigo que salga del campo que este y pueda actualizarlo

    var_msg := TStringList.Create;

    if public_Pulso_Aceptar = true then
    begin
        with form_personal_familias_000.SQLQuery_Personal_Familias do
        begin
            Comprobar_Toda_Fecha_Hora(var_msg);

            if Trim(FieldByName('descripcion').AsString) = '' then
            begin
                var_msg.Add( '* La descripción.');
            end;

            form_Menu.Traer_Configuracion_APP;

            UTI_CONTA_esta_Cta_Ctble_BIEN( form_menu.public_User_Configuracion.Personal_Familias_Obligar_Cuenta_Contable_SN, //.... aqui tambien permitir el control de exigirlo o no
                                           var_msg,
                                           form_personal_familias_000.SQLQuery_Personal_Familias,
                                           '',
                                           'personal_familias',
                                           'Cuenta_Contable',
                                           'LA CUENTA CONTABLE' );
        end;
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

procedure Tform_personal_familias_001.FormCreate(Sender: TObject);
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

procedure Tform_personal_familias_001.para_Empezar;
begin
  { ****************************************************************************
    Solo para formularios que traten con datos
    **************************************************************************** }
    with form_personal_familias_000.SQLQuery_Personal_Familias do
    begin
        public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                           '',
                                                           '',

                                                           FieldByName('descripcion').AsString,
                                                           FieldByName('Cuenta_Contable').AsString,
                                                           FieldByName('Cuenta_Contable').AsString );
    end;

    Presentar_Datos;

  { ****************************************************************************
    SOLO PARA ESTE FORM
    **************************************************************************** }
end;

procedure Tform_personal_familias_001.Comprobar_Toda_Fecha_Hora( param_msg : TStrings );
var var_msg : TStrings;
begin
    Actualizar_Campos_Fecha_Hora_Si_Completado(param_msg);

  { ************************************************************************************************
    ** COMPROBAR CUALES SON OBLIGADOS O DE SÓLO AVISO                                             **
    ************************************************************************************************ }
  { ** Cuando un campo de fecha o hora es de introducción obligatoria                             **
    ************************************************************************************************
    if DateEdit_Fecha_Nacimiento.Text  = '  /  /    ' then
    begin
         param_msg.Add( '* La fecha de nacimiento de quien facturamos' );
    end;

    ************************************************************************************************
    ** Cuando un campo de fecha o hora es de solo aviso, pero no introducción obligatoria         **
    ************************************************************************************************
    if DateEdit_Fecha_Nacimiento.Text  = '  /  /    ' then
    begin
         var_msg := TStringList.Create;
         var_msg.Add('** NO SE HA INTRODUCIDO LA FECHA DE NACIMIENTO DE QUIEN FACTURAMOS ** ');
         UTI_GEN_Aviso(true, var_msg, 'AVISAMOS DE ... ', True, False);
         var_msg.Free;
    end; }
end;

procedure Tform_personal_familias_001.Actualizar_Campos_Fecha_Hora_Si_Completado( param_msg : TStrings );
var var_Fecha_Hora : ShortString;
begin
    WITH form_personal_familias_000.SQLQuery_Personal_Familias DO
    BEGIN
    { NO HAY NINGUN CAMPO DE HORA O FECHA
      { ********************************************************************************************
        ** FECHA DE NACIMIENTO                                                                    **
        ******************************************************************************************** }
        var_Fecha_Hora := '';
        if DateEdit_Fecha_Nacimiento.Text <> '  /  /    ' then
        begin
             var_Fecha_Hora := DateEdit_Fecha_Nacimiento.Text;
        end;

      { ********************************************************************************************
        ** Por si tiene control de hora                                                           **
        ********************************************************************************************
        if MaskEdit_Hora_Inicio.Text <> '  :  :  '     then
        begin
            if var_Fecha_Hora <> '' then
                 var_Fecha_Hora := var_Fecha_Hora + ' ' + MaskEdit_Hora_Inicio.Text
            else var_Fecha_Hora := MaskEdit_Hora_Inicio.Text;
        end; }

        Try
            if var_Fecha_Hora <> '' then
                begin
                     FieldByName('Fecha_Nacimiento').AsString := var_Fecha_Hora;
                end
            else
                begin
                    FieldByName('Fecha_Nacimiento').Clear;
                end;
        Except
            param_msg.Add('** ERROR en el campo FECHA DE NACIMIENTO **');
        end;
    }
    END;
end;

procedure Tform_personal_familias_001.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := true;
end;

procedure Tform_personal_familias_001.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := false;
end;

procedure Tform_personal_familias_001.Refrescar_Registros;
begin
    form_personal_familias_000.Refrescar_Registros_SubFamilias;
end;

procedure Tform_personal_familias_001.RadioGroup_BajasClick(Sender: TObject);
begin
    //UTI_TB_Ver_Bajas_SN('um', Memo_Filtros.Lines, RadioGroup_Bajas.ItemIndex);
    Refrescar_Registros;
end;

procedure Tform_personal_familias_001.BitBtn_Ver_Situacion_Registro_SubFamiliasClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if form_personal_familias_000.SQLQuery_Personal_Familias_SubFamilias.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'personal_familias',
                                           form_personal_familias_000.SQLQuery_Personal_Familias_SubFamilias,
                                           form_personal_familias_000.DataSource_PerFam_SubFamilias,
                                           DBGrid_SubFamilias );
        end;
    end;
end;

procedure Tform_personal_familias_001.Presentar_Datos;
begin
    with form_personal_familias_000.SQLQuery_Personal_Familias do
    begin
         Edit_Descripcion_Familia_Superior.Text   := FieldByName('OT_descripcion_familia_superior').AsString;
    end;
end;

procedure Tform_personal_familias_001.DBGrid_SubFamiliasDrawColumnCell(Sender: TObject;
    const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var var_Color_Normal : TColor;
begin
    with Sender as TDBGrid do
    begin
        if form_personal_familias_000.SQLQuery_Personal_Familias_SubFamilias.RecordCount = 0 then Exit;

        var_Color_Normal := Canvas.Brush.Color;

      { ************************************************************************
        Primero comprobamos si es un registro dado de baja o no
        ************************************************************************ }
        if not form_personal_familias_000.SQLQuery_Personal_Familias_SubFamilias.FieldByName('Del_WHEN').IsNull then
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
                    if Trim(form_personal_familias_000.SQLQuery_Personal_Familias_SubFamilias.FieldByName('id_medio').asString) = '1' then
                    begin
                        Canvas.StretchDraw(param_Rect, Image_Confirmado.Picture.Graphic);
                    end;
                    }
                end;
            end;

        Canvas.Font.Color := var_Color_Normal;
    end;
end;

procedure Tform_personal_familias_001.DBNavigator_SubFamiliasBeforeAction(Sender: TObject;
    Button: TDBNavButtonType);
begin
    case Button of
        nbInsert : begin
            Asignar_Familia_Personal_como_SubFamilia;
            Abort;
        end;

        nbDelete : begin
            Quitar_SubFamilia_de_Familia;
            Abort;
        end;

        nbRefresh : begin
            form_personal_familias_000.Refrescar_Registros_SubFamilias;
            Abort;
        end;
    end;
end;

procedure Tform_personal_familias_001.no_Tocar;
begin
    DBEdit_Descripcion.Enabled                := False;
    Boton_Elegir_Familia_Superior.Enabled     := False;
    Edit_Descripcion_Familia_Superior.Enabled := False;
end;

procedure Tform_personal_familias_001.Edit_Descripcion_Familia_SuperiorClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS la FAMILIA SUPERIOR a la que pertenece');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_personal_familias_000.SQLQuery_Personal_Familias.FieldByName('id_personal_familias').Clear;
         Edit_Descripcion_Familia_Superior.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_personal_familias_001.Boton_Elegir_Familia_SuperiorClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_personal_familias_000.SQLQuery_Personal_Familias do
    begin
        if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = true then
        begin
            var_Registro := Elegir_Familia( FieldByName('id').AsString );
        end;

        if var_Registro.id_1 <> '' then
        begin
            FieldByName('id_personal_familias').AsString := Trim(var_Registro.id_1);
            Edit_Descripcion_Familia_Superior.Text       := var_Registro.descripcion_1;
        end;
    end;
end;

function Tform_personal_familias_001.Existe_SubFamilia_Personal_Ya( param_id,
                                                                    param_id_personal_familias : ShortString ) : Trecord_Existe;
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

        if UTI_CN_Connector_Open( var_SQLTransaction,
                                  var_SQLConnector ) = False then UTI_GEN_Salir;

      { ****************************************************************************
        Creamos la SQL Según el motor de BD
        **************************************************************************** }
        var_SQL := TStringList.Create;

        var_SQL.Add('SELECT a.*' );
        var_SQL.Add(  'FROM personal_familias AS a' );

        var_SQL.Add(' WHERE a.id_personal_familias = ' +  Trim(param_id_personal_familias) );

        if Trim(param_id) <> '' then
        begin
             var_SQL.Add(  ' AND NOT a.id = ' + Trim(param_id) );
        end;

        var_SQL.Add(' ORDER BY a.id_personal_familias ASC' );

      { ****************************************************************************
        Abrimos la tabla
        **************************************************************************** }
        var_SQLQuery      := TSQLQuery.Create(nil);
        var_SQLQuery.Name := 'SQLQuery_Existe_SubFamilia_Personal_Ya';

        if UTI_TB_Query_Open( '', '', '',
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
             UTI_GEN_Error_Log( 'Error al comprobar si la subfamilia existe ya para el tipo de' +
                                ' personal. La tabla ha sido ' + var_SQLQuery.Name +
                                ' desde el módulo ' + Screen.ActiveForm.Name,
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

procedure Tform_personal_familias_001.Cauto_SubFamilia_Y_Guardo_en_Historico_sus_Cambios( param_id_personal_familias,
                                                                                          param_Id,
                                                                                          param_descripcion : ShortString );
var var_SQL : TStrings;
begin
    // ********************************************************************* //
    // ** Esto lo hago porque puede ser que los criterios de filtrado me  ** //
    // ** eviten filtrar el registro recien creado                        ** //
    // ********************************************************************* //
    var_SQL := TStringList.Create;

    var_SQL.Add( 'SELECT tp.*' );
    var_SQL.Add(   'FROM personal_familias AS tp' );
    var_SQL.Add(  'WHERE tp.id_personal_familias = ' + Trim(param_id_personal_familias)  );
    var_SQL.Add(    'AND tp.id = ' +  Trim(param_Id) );
    var_SQL.Add(  'ORDER BY tp.id_personal_familias ASC, tp.descripcion ASC' );

    if UTI_RGTRO_Buscar_Rgtro_y_Grabar_Cambios_en_Historico( 'SQLQuery_Personal_Familias',
                                                             var_SQL ) = false then
    begin
        var_SQL.Clear;

        var_SQL.Add( 'No se pudo grabar el histórico de los cambios' +
                     ' realizados al añadir al tipo ' +
                     Trim(form_personal_familias_000.SQLQuery_Personal_Familias.FieldByName('descripcion').AsString) +
                     ' la subfamilia ' + Trim(param_descripcion) );

        UTI_GEN_Aviso(true, var_SQL, 'ERROR ... ', True, False);
    end;

    var_SQL.Free;
end;

procedure Tform_personal_familias_001.Asignar_Familia_Personal_como_SubFamilia;
var var_Registro      : TRecord_Rgtro_Comun;
    var_msg           : TStrings;
    var_record_Existe : Trecord_Existe;
begin
    with form_personal_familias_000.SQLQuery_Personal_Familias_SubFamilias do
    begin
        var_msg := TStringList.Create;

        if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
        begin
            var_Registro := Elegir_Familia(form_personal_familias_000.SQLQuery_Personal_Familias.FieldByName('id').AsString);

            if var_Registro.id_1 <> '' then
            begin
                var_record_Existe := Existe_SubFamilia_Personal_Ya( '', // en realidad es como si fuera un insercción
                                                                    var_Registro.id_1 );

                if var_record_Existe.Fallo_en_Conexion_BD = true then
                    begin
                    end
                else
                    begin
                        if var_record_Existe.Existe = false then
                            begin
                                if Asignar_Familia_Personal_como_SubFamilia_2( var_Registro.id_1,
                                                                               form_personal_familias_000.SQLQuery_Personal_Familias.FieldByName('id').AsString ) = true then
                                begin
                                    // ********************************************************************* //
                                    // ** Si se consiguió asignar la subfamilia a la familia, lo que hace-** //
                                    // ** mos es refrescar la tabla de subfamilias, buscar el registro re-** //
                                    // ** cién creado y guardar los cambios realizados sobre el registro  ** //
                                    // ** en el historico de cambios                                      ** //
                                    // ********************************************************************* //
                                    form_personal_familias_000.Refrescar_Registros_SubFamilias;


                                    with form_personal_familias_000.SQLQuery_Personal_Familias_SubFamilias do
                                    begin
                                         Locate( 'descripcion;id',
                                                 VarArrayOf( [ var_Registro.descripcion_1,
                                                               var_Registro.id_1 ] ),
                                                 [] );
                                    end;

                                    with form_personal_familias_000.SQLQuery_Personal_Familias do
                                    begin
                                         Cauto_SubFamilia_Y_Guardo_en_Historico_sus_Cambios( FieldByName('id').AsString,
                                                                                             var_Registro.id_1,
                                                                                             var_Registro.descripcion_1 );
                                    end;
                                end;
                            end
                        else
                            begin
                                var_msg.Clear;

                                var_msg.Add( 'Subfamilia repetida.');

                                if UpperCase(var_record_Existe.deBaja) = 'S' then
                                begin
                                    var_msg.Add(rs_Rgtro_Borrado);
                                end;

                                UTI_GEN_Aviso(true, var_msg, rs_Ya_Existe, True, False);
                            end;
                    end;
            end;

        end;

        var_msg.Free;
    end;
end;

function Tform_personal_familias_001.Elegir_Familia(param_familia : ShortString) : TRecord_Rgtro_Comun;
var var_msg : TStrings;
begin
    Result.id_1 := '';

    if UTI_GEN_Form_Abierto_Ya('form_personal_familias_002') = false then
        begin
            Application.CreateForm(Tform_personal_familias_002, form_personal_familias_002);
            form_personal_familias_002.Label_Cambiable_1.Caption := 'Elija una familia para convertirla';
            form_personal_familias_002.Label_Cambiable_2.Caption := 'en familia superior';

            form_personal_familias_002.public_id_familia_que_no_tiene_que_aparecer := param_familia;

            form_personal_familias_002.public_Solo_Ver    := true;
            form_personal_familias_002.public_Elegimos    := true;
            form_personal_familias_002.public_Menu_Worked := public_Menu_Worked;

            form_personal_familias_002.para_Empezar;

            form_personal_familias_002.ShowModal;

            if form_personal_familias_002.public_Rgtro_Seleccionado = true then
            begin
                with form_personal_familias_002.SQLQuery_Personal_NO_SubFamilias do
                begin
                    Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                                       '',
                                                                       '',

                                                                       FieldByName('descripcion').AsString,
                                                                       '',
                                                                       '' );
                end;
            end;

            form_personal_familias_002.Free;
        end
    else
        begin
            var_msg := TStringList.Create;
            var_msg.Add(rs_Modulo_Abierto);
            UTI_GEN_Aviso(true, var_msg, 'AVISAMOS DE ... ', True, False);
            var_msg.Free;
            Exit;
        end;
end;

procedure Tform_personal_familias_001.FormActivate(Sender: TObject);
begin
    If form_personal_familias_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    Comprobar_No_Tocar(true, true);
end;

function Tform_personal_familias_001.Comprobar_No_Tocar( param_Reproducir_Mensajes,
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

function Tform_personal_familias_001.Asignar_Familia_Personal_como_SubFamilia_2( param_id,
                                                                                 param_personal_familias : ShortString ) : Boolean;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
    var_Fecha          : ShortString;
begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    Result := true;
    Try
      { ****************************************************************************
        Creamos la Transaccion y la conexión con el motor BD, y la abrimos
        **************************************************************************** }
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Connector_Open( var_SQLTransaction,
                                  var_SQLConnector ) = False then UTI_GEN_Salir;

      { ****************************************************************************
        Creamos la SQL Según el motor de BD
        **************************************************************************** }
        var_SQL := TStringList.Create;

        var_Fecha := UTI_GEN_Format_Fecha_Hora(UTI_CN_Fecha_Hora, true);

        var_SQL.Add( 'UPDATE personal_familias' +
                       ' SET id_personal_familias = ' + Trim(param_personal_familias) + ',' +
                           ' Change_WHEN = ' + UTI_GEN_Comillas(var_Fecha) + ',' +
                           ' Change_Id_User = ' + IntToStr(Form_Menu.public_User) +
                     ' WHERE id = ' + Trim(param_id) );

      { ****************************************************************************
        Abrimos la tabla
        **************************************************************************** }
        var_SQLQuery          := TSQLQuery.Create(nil);

        var_SQLQuery.Database := var_SQLConnector;
        var_SQLQuery.SQL.Text := var_SQL.Text;

        var_SQLQuery.Name     := 'SQLQuery_Asignar_Familia_Personal_como_SubFamilia_2';


        var_SQLQuery.ExecSQL;
        var_SQLTransaction.Commit;


      { ****************************************************************************
        Destruimos la tabla y conexiones
        **************************************************************************** }
        var_SQLQuery.Free;
        var_SQL.Free;

      { ****************************************************************************
        Cerramos La transacción y la conexión con la BD
        **************************************************************************** }
        if UTI_CN_Connector_Close( var_SQLTransaction,
                                   var_SQLConnector ) = False then UTI_GEN_Salir;

        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    Except
         on error : Exception do
         begin
             UTI_GEN_Error_Log( 'Error al CREAR la subfamilia ' + Trim(param_id) + ' para el tipo ' +
                                Trim(param_personal_familias) + '. La tabla ha sido ' +
                                var_SQLQuery.Name + ' desde el módulo ' + Screen.ActiveForm.Name,
                                error );
             try
                 var_SQL.Free;
                 var_SQLTransaction.Free;
                 var_SQLConnector.Free;
                 var_SQLQuery.Free;
             except
             end;

             Result := false
         end;
    end;
end;

procedure Tform_personal_familias_001.Quitar_SubFamilia_de_Familia;
var var_msg : TStrings;
    var_id  : ShortString;
begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    with form_personal_familias_000.SQLQuery_Personal_Familias_SubFamilias do
    begin
        var_msg := TStringList.Create;

        var_msg.Add('¿Seguro que desea quitarla como subfamilia de ' + form_personal_familias_000.SQLQuery_Personal_Familias.FieldByName('descripcion').AsString);
        if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
        begin
            var_id := FieldByName('id').AsString;

            if UTI_RGTRO_isLock( 'personal_familias',
                                 FieldByName('id').AsString,
                                 true ) = true then
                begin
                    Exit;
                end
            else
                begin
                    if UTI_RGTRO_Lock( 'personal_familias',
                                       FieldByName('id').AsString ) = true then
                         Edit
                    else Exit;
                end;

            FieldByName('id_personal_familias').Clear;

            UTI_RGTRO_Grabar_Antes( 'personal_familias',
                                    form_personal_familias_000.SQLQuery_Personal_Familias_SubFamilias );
        end;

        var_msg.Free;

        UTI_RGTRO_UnLock( 'personal_familias',
                          var_id );
    end;
end;

end.


