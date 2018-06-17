unit tarifas_001;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ButtonPanel, StdCtrls, DbCtrls,
  DBGrids, Buttons, Grids, ExtCtrls, sqldb, utilidades_usuarios, utilidades_forms_Filtrar,
  utilidades_datos_tablas, utilidades_rgtro, utilidades_general, utilidades_bd;

type

  { Tform_tarifas_001 }

  Tform_tarifas_001 = class(TForm)
    BitBtn_Ver_Situacion_Registro_Margenes: TBitBtn;
    ButtonPanel1: TButtonPanel;
    DBEdit_eMail1: TDBEdit;
    DBEdit_Descripcion: TDBEdit;
    DBGrid_Margenes: TDBGrid;
    DBNavigator_Margenes: TDBNavigator;
    GroupBox11: TGroupBox;
    GroupBox_Contactos: TGroupBox;
    Label1: TLabel;
    Label57: TLabel;
    Label62: TLabel;
    RadioGroup_Bajas: TRadioGroup;
    Shape2: TShape;

    procedure Insertar_Registro_Margenes;
    procedure Editar_Registro_Margenes;
    procedure Borrar_Registro_Margenes;
    procedure para_Empezar;
    procedure FormCreate(Sender: TObject);
    procedure Presentar_Datos;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure no_Tocar;
    procedure BitBtn_Ver_Situacion_Registro_MargenesClick(Sender: TObject);
    procedure DBGrid_MargenesDblClick(Sender: TObject);
    procedure DBGrid_MargenesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_MargenesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBNavigator_MargenesBeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure RadioGroup_BajasClick(Sender: TObject);
    procedure Refrescar_Registros;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;

  private
      { private declarations }
      private_Salir_OK  : Boolean;
  public
      { public declarations }
      public_Solo_Ver      : Boolean;
      public_Menu_Worked   : Integer;
      public_Pulso_Aceptar : Boolean;
      public_Record_Rgtro  : TRecord_Rgtro_Comun;
  end;

var
  form_tarifas_001: Tform_tarifas_001;

implementation

{$R *.lfm}

uses menu, tarifas_000, tarifas_002;

{ Tform_tarifas_001 }

procedure Tform_tarifas_001.FormActivate(Sender: TObject);
begin
    If form_tarifas_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    Comprobar_No_Tocar(true, true);
end;

procedure Tform_tarifas_001.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := True;
    public_Pulso_Aceptar := false;
end;

procedure Tform_tarifas_001.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := True;
    public_Pulso_Aceptar := true;
end;

procedure Tform_tarifas_001.Refrescar_Registros;
begin
    form_tarifas_000.Refrescar_Registros_Margenes;
end;

procedure Tform_tarifas_001.DBGrid_MargenesDblClick(Sender: TObject);
begin
    Editar_Registro_Margenes;
end;

procedure Tform_tarifas_001.BitBtn_Ver_Situacion_Registro_MargenesClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if form_tarifas_000.SQLQuery_Tarifas_Margenes.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'tarifas_margenes',
                                           form_tarifas_000.SQLQuery_Tarifas_Margenes,
                                           form_tarifas_000.DataSource_Tarifas_Margenes,
                                           DBGrid_Margenes );
        end;
    end;
end;

procedure Tform_tarifas_001.DBGrid_MargenesDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
var var_Color_Normal : TColor;
begin
    with Sender as TDBGrid do
    begin
        if form_tarifas_000.SQLQuery_Tarifas_Margenes.RecordCount = 0 then Exit;

        var_Color_Normal := Canvas.Brush.Color;
        // ***************************************************************************************** //
        // ** Primero comprobamos si es un registro dado de baja o no                             ** //
        // ***************************************************************************************** //
        if not form_tarifas_000.SQLQuery_Tarifas_Margenes.FieldByName('Del_WHEN').IsNull then
        begin
            // ************************************************************************************* //
            // ** Registro DADO de BAJA                                                           ** //
            // ************************************************************************************* //
            Canvas.Font.Color := clSilver;
        end else begin
            // ************************************************************************************* //
            // ** Registro DADO de ALTA, NO BAJA                                                  ** //
            // ************************************************************************************* //
            // ** Así que las pinto, pero sólo si no son las columnas que van a ser dibujadas     ** //
            // ************************************************************************************* //
            if State <> [gdSelected] then
            begin
                if (Column.FieldName <> 'COLUMNA_CON_IMAGEN') then
                begin
                    Canvas.font.Color := clBlack;
                end;
            end;
        end;

        // ***************************************************************************************** //
        // ** Ahora paso a dibujar una celda normal con los colores elegidos o una dibujada       ** //
        // ***************************************************************************************** //
        if (Column.FieldName <> 'COLUMNA_CON_IMAGEN') then
        begin
            // ************************************************************************************* //
            // ** No es una de las columnas a dibujar por lo que la pinto con los colores elegidos** //
            // ************************************************************************************* //
            DefaultDrawColumnCell(Rect, DataCol, Column, State)
        end else begin
            // ************************************************************************************* //
            // ** Es una de las columnas a dibujar                                                ** //
            // ************************************************************************************* //
            if Column.FieldName = 'COLUMNA_CON_IMAGEN'  then
            begin
              { if Trim(form_tarifas_000.SQLQuery_Tarifas_Margenes.FieldByName('id_medio').asString) = '1' then
                begin
                    Canvas.StretchDraw(param_Rect, Image_Confirmado.Picture.Graphic);
                end; }
            end;
        end;

        Canvas.Font.Color := var_Color_Normal;
    end;
end;

procedure Tform_tarifas_001.DBGrid_MargenesKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then Editar_Registro_Margenes;
end;

procedure Tform_tarifas_001.DBNavigator_MargenesBeforeAction(Sender: TObject;
    Button: TDBNavButtonType);
begin
    case Button of
        nbInsert : begin
            Insertar_Registro_Margenes;
            Abort;
        end;

        nbEdit : begin
            Editar_Registro_Margenes;
            Abort;
        end;

        nbDelete : begin
            Borrar_Registro_Margenes;
            Abort;
        end;

        nbRefresh : begin
            form_tarifas_000.Refrescar_Registros_Margenes;
            Abort;
        end;
    end;
end;

procedure Tform_tarifas_001.RadioGroup_BajasClick(Sender: TObject);
begin
    //UTI_TB_Ver_Bajas_SN('um', Memo_Filtros.Lines, RadioGroup_Bajas.ItemIndex);
    Refrescar_Registros;
end;

procedure Tform_tarifas_001.no_Tocar;
begin
    DBEdit_Descripcion.Enabled := False;
    GroupBox_Contactos.Enabled := False;
end;

procedure Tform_tarifas_001.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg : TStrings;
begin
    ButtonPanel1.SetFocus; // Con esto consigo que salga del campo que este y pueda actualizarlo

    var_msg := TStringList.Create;

    if public_Pulso_Aceptar = true then
    begin
        with form_tarifas_000.SQLQuery_Tarifas do
        begin
            if Trim(FieldByName('descripcion').asString) = '' then
            begin
                var_msg.Add( '* La descripción');
            end;
        end;
    end;

    if private_Salir_OK = False then
    begin
        // ***************************************************************************************** //
        // ** Intento BitBtn_SALIR de la aplicación de un modo no permitido.                      ** //
        // ***************************************************************************************** //
        // ** Pero si desde el menu principal está a true la variable public_Salir_Ok, significa  ** //
        // ** que hay que salir si o si pues se pulsó cancelar al preguntar otra vez por la       ** //
        // ** contraseña                                                                          ** //
        // ***************************************************************************************** //
        if form_Menu.public_Salir_OK = False then CloseAction := TCloseAction.caNone;
    end else begin
        // ***************************************************************************************** //
        // ** Fue correcto el modo como quiere salir de la aplicación                             ** //
        // ***************************************************************************************** //
        // ** Comprobaremos si no se generó algún error por falta de completar algun campo y si se** //
        // ** salió con el botón Ok o Cancel                                                      ** //
        // ***************************************************************************************** //
        if (Trim(var_msg.Text) <> '') and (public_Pulso_Aceptar = true) then
        begin
            UTI_GEN_Aviso(true, var_msg, rs_Falta, True, False);
            CloseAction := TCloseAction.caNone;
        end else begin
            CloseAction := caFree;
        end;
    end;

    var_msg.Free;
end;

procedure Tform_tarifas_001.Presentar_Datos;
var var_Hora : tTime;
    var_Dia  : tDate;
begin
    with form_tarifas_000.SQLQuery_Tarifas do
    begin
        // ***************************************************************************************** //
        // ** No hay nada que presentar                                                           ** //
        // ***************************************************************************************** //
    end;
end;

procedure Tform_tarifas_001.FormCreate(Sender: TObject);
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
    public_Solo_Ver := false;

    // ********************************************************************************************* //
    // ** Solo para este formulario                                                               ** //
    // ********************************************************************************************* //
end;

procedure Tform_tarifas_001.para_Empezar;
begin
    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    with form_tarifas_000.SQLQuery_Tarifas do
    begin
        public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                           '',
                                                           '',

                                                           FieldByName('descripcion').AsString,
                                                           '',
                                                           '' );
    end;

    Presentar_Datos;

    // ********************************************************************************************* //
    // ** SOLO PARA ESTE FORM                                                                     ** //
    // ********************************************************************************************* //
end;

function Tform_tarifas_001.Comprobar_No_Tocar( param_Reproducir_Mensajes,
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

procedure Tform_tarifas_001.Editar_Registro_Margenes;
var
  var_Campos_para_Existe_ya : Array of TCampos_para_Existe_ya;
  var_msg                   : TStrings;
  var_Form                  : Tform_tarifas_002;
  var_record_Existe         : Trecord_Existe;
  var_id                    : ShortString;

begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    with form_tarifas_000.SQLQuery_Tarifas_Margenes do
    begin
        var_msg := TStringList.Create;

        if (RecordCount > 0) and
           (Active = true)   then
        begin
            var_id := FieldByName('id').AsString;

            if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
            begin
                if UTI_RGTRO_isLock( 'tarifas_margenes',
                                     FieldByName('id').AsString,
                                     true ) = true then
                begin
                    Exit;
                end else begin
                    if UTI_RGTRO_Lock( 'tarifas_margenes',
                                       FieldByName('id').AsString ) = true then
                         Edit
                    else Exit;
                end;

                var_Form := Tform_tarifas_002.Create(nil);

                var_Form.public_Menu_Worked := public_Menu_Worked;

                if public_Solo_Ver = true then
                begin
                    var_Form.public_Solo_Ver := true;
                end;

                var_Form.para_Empezar;

                var_Form.ShowModal;
                if var_Form.public_Pulso_Aceptar = true then
                begin
                    SetLength(var_Campos_para_Existe_ya, 1);

                    var_Campos_para_Existe_ya[0].Campo_Valor  := FieldByName('id_margenes_tarifas').AsString;
                    var_Campos_para_Existe_ya[0].Campo_Nombre := 'id_margenes_tarifas';
                    var_Campos_para_Existe_ya[0].Campo_Tipo   := 0; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                    var_record_Existe := UTI_RGTRO_Existe_Ya( 'tarifas_margenes',                                  // param_nombre_tabla
                                                              'ORDER BY tarifas_margenes.id_tarifas ASC, ' +
                                                                       'tarifas_margenes.id_margenes_tarifas ASC', // param_order_by
                                                              FieldByName('id_tarifas').AsString,                       // param_id_a_no_traer ... Estoy insertando
                                                              var_Campos_para_Existe_ya );                      // param_Campos_para_Existe_ya

                    if var_record_Existe.Fallo_en_Conexion_BD = true then
                    begin
                        var_Form.Free;
                        Cancel;
                    end else begin
                        if var_record_Existe.Existe = false then
                        begin
                            if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( form_tarifas_000.SQLQuery_Tarifas_Margenes ) = true then
                            begin
                                FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                                FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                                UTI_RGTRO_Grabar_Antes( 'tarifas_margenes',
                                                        form_tarifas_000.SQLQuery_Tarifas_Margenes );
                            end else begin
                                Cancel;
                            end;

                            var_Form.Free;

                        end else begin
                            var_Form.Free;
                            Cancel;
                            var_msg.Clear;
                            var_msg.Add( 'Margen repetido para esta tarifa.');

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

                UTI_RGTRO_UnLock( 'tarifas_margenes', var_id );
            end;
        end else begin
            var_msg.Add(rs_no_Hay_Rgtros);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        end;
    end;

    var_msg.Free;
end;

procedure Tform_tarifas_001.Insertar_Registro_Margenes;
var
  var_Campos_para_Existe_ya : Array of TCampos_para_Existe_ya;
  var_msg                   : TStrings;
  var_Form                  : Tform_tarifas_002;
  var_record_Existe         : Trecord_Existe;

begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    with form_tarifas_000.SQLQuery_Tarifas_Margenes do
    begin
        var_msg := TStringList.Create;

        if UTI_USR_Permiso_SN(public_Menu_Worked, 'A', True) = True then
        begin
            if public_Solo_Ver = True then
            begin
                var_msg.Clear;
                var_msg.Add(rs_Solo_Visualizar);
                UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            end else begin
                Insert;

                FieldByName('Beneficio_en_Tanto_por_Ciento_SN').AsString := 'S';
                FieldByName('id_tarifas').AsString                       := form_tarifas_000.SQLQuery_Tarifas.FieldByName('id').AsString;

                var_Form := Tform_tarifas_002.Create(nil);

                var_Form.para_Empezar;

                var_Form.ShowModal;
                if var_Form.public_Pulso_Aceptar = true then
                begin
                    var_Form.Free;

                    SetLength(var_Campos_para_Existe_ya, 1);

                    var_Campos_para_Existe_ya[0].Campo_Valor  := FieldByName('id_margenes_tarifas').AsString;
                    var_Campos_para_Existe_ya[0].Campo_Nombre := 'id_margenes_tarifas';
                    var_Campos_para_Existe_ya[0].Campo_Tipo   := 0; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                    var_record_Existe := UTI_RGTRO_Existe_Ya( 'tarifas_margenes',                                  // param_nombre_tabla
                                                              'ORDER BY tarifas_margenes.id_tarifas ASC, ' +
                                                                       'tarifas_margenes.id_margenes_tarifas ASC', // param_order_by
                                                              '',                       // param_id_a_no_traer ... Estoy insertando
                                                              var_Campos_para_Existe_ya );                      // param_Campos_para_Existe_ya

                    if var_record_Existe.Fallo_en_Conexion_BD = true then
                    begin
                        // var_Form.Free;
                        Cancel;
                    end else begin
                        if var_record_Existe.Existe = false then
                        begin
                            FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
                            FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                            UTI_RGTRO_Grabar_Antes( 'tarifas_margenes',
                                                    form_tarifas_000.SQLQuery_Tarifas_Margenes );
                        end else begin
                            Cancel;
                            var_msg.Clear;

                            var_msg.Add( 'Margen repetido para esta tarifa.');

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
            end;
        end;

        var_msg.Free;
    end;
end;

procedure Tform_tarifas_001.Borrar_Registro_Margenes;
begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    if UTI_USR_Permiso_SN(public_Menu_Worked, 'B', True) = True then
    begin
        UTI_RGTRO_Borrar( 'tarifas_margenes',
                          form_tarifas_000.SQLQuery_Tarifas_Margenes,
                          public_Solo_Ver,
                          public_Menu_Worked );
    end;
end;



end.

