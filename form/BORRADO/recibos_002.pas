unit recibos_002;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DBDateTimePicker, DateTimePicker, Forms, Controls, Graphics, Dialogs,
  ComCtrls, ExtCtrls, DBGrids, DbCtrls, Buttons, StdCtrls, ButtonPanel, Grids, db, utilidades_usuarios,
  utilidades_bd, utilidades_rgtro, utilidades_general, utilidades_forms_Filtrar;

type

  { Tform_recibos_002 }

  Tform_recibos_002 = class(TForm)
    BitBtn_Ver_Situacion_Registro_albaranes_ventas_detalles: TBitBtn;
    Boton_Elegir_Empresa: TBitBtn;
    Boton_Elegir_Forma_Pago: TBitBtn;
    ButtonPanel1: TButtonPanel;
    DBDateTimePicker_Fecha_Nacimiento: TDBDateTimePicker;
    DBEdit_a_quien_facturamos: TDBEdit;
    DBEdit_eMail1: TDBEdit;
    DBEdit_eMail2: TDBEdit;
    DBEdit_eMail3: TDBEdit;
    DBEdit_Pagina_Web1: TDBEdit;
    DBGrid_albaranes_ventas_detalles: TDBGrid;
    DBNavigator_albaranes_ventas_detalles: TDBNavigator;
    Edit_Descripcion_Alumno: TEdit;
    Edit_Descripcion_Empresa: TEdit;
    Edit_Descripcion_Forma_Pago: TEdit;
    Edit_Total_Pdte_Cobro: TEdit;
    GroupBox11: TGroupBox;
    GroupBox_Internet1: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label45: TLabel;
    Label62: TLabel;
    RadioGroup_Bajas: TRadioGroup;

    procedure Borrar_Registro_albaranes_ventas_detalles;
    function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
    procedure Devolver_Total_Pendiente;
    procedure Insertar_Registro_albaranes_ventas_detalles;
    procedure Editar_Registro_albaranes_ventas_detalles;
    procedure BitBtn_Ver_Situacion_Registro_albaranes_ventas_detallesClick(Sender: TObject);
    procedure DBGrid_albaranes_ventas_detallesDblClick(Sender: TObject);
    procedure DBGrid_albaranes_ventas_detallesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_albaranes_ventas_detallesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid_albaranes_ventas_detallesTitleClick(Column: TColumn);
    procedure DBNavigator_albaranes_ventas_detallesBeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure RadioGroup_BajasClick(Sender: TObject);
    procedure Refrescar_Registros;
    procedure Presentar_Datos;
    procedure no_Tocar;
    procedure Boton_Elegir_EmpresaClick(Sender: TObject);
    procedure Boton_Elegir_Forma_PagoClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure Edit_Descripcion_EmpresaClick(Sender: TObject);
    procedure Edit_Descripcion_Forma_PagoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure para_Empezar;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);

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
  form_recibos_002: Tform_recibos_002;

implementation

{$R *.lfm}

uses menu, recibos_000, recibos_003;

{ Tform_recibos_002 }

procedure Tform_recibos_002.FormCreate(Sender: TObject);
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
end;

procedure Tform_recibos_002.para_Empezar;
begin
    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    with form_recibos_000.SQLQuery_Alb do
    begin
        public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                           FieldByName('id_clientes').AsString,
                                                           FieldByName('Fecha').AsString,
                                                           FieldByName('CONCEPTO_SEPA').AsString,
                                                           FieldByName('Serie_Albaran').AsString,
                                                           FieldByName('Numero_Albaran').AsString );
    end;

    Presentar_Datos;

    // ********************************************************************************************* //
    // ** SOLO PARA ESTE FORM                                                                     ** //
    // ********************************************************************************************* //
end;

procedure Tform_recibos_002.Presentar_Datos;
begin
    with form_recibos_000.SQLQuery_Alb do
    begin
        Edit_Descripcion_Empresa.Text    := FieldByName('OT_descripcion_empresa').AsString;
        Edit_Descripcion_Forma_Pago.Text := FieldByName('OT_descripcion_forma_pago').AsString;
        Edit_Descripcion_Alumno.Text     := FieldByName('OT_descripcion_cliente').AsString;

        Devolver_Total_Pendiente;
    end;
end;

procedure Tform_recibos_002.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg : TStrings;
begin
    // ********************************************************************************************* //
    // ** SOLO PARA ESTE FORM                                                                     ** //
    // ********************************************************************************************* //
    ButtonPanel1.SetFocus;   // ** Con esto consigo que salga del campo que este y que se pueda   ** //
                             // ** actualizar                                                     ** //
    // ********************************************************************************************* //

    var_msg := TStringList.Create;

    if public_Pulso_Aceptar = true then
    begin
        with form_recibos_000.SQLQuery_Alb do
        begin
            if Trim(FieldByName('Fecha').AsString) = '' then
            begin
                var_msg.Add( '* La fecha.');
            end;

            if Trim(FieldByName('id_empresas').AsString) = '' then
            begin
                var_msg.Add( '* La empresa.');
            end;

            if Trim(FieldByName('CONCEPTO_SEPA').AsString) = '' then
            begin
                var_msg.Add( '* El NIF/CIF.');
            end;
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
        if form_Menu.public_Salir_OK = False then CloseAction := CloseAction.caNone;
    end else begin
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
        end else begin
            // var_msg.Free;
            CloseAction := caFree;
        end;
    end;

    var_msg.Free;
end;

procedure Tform_recibos_002.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := true;
end;

procedure Tform_recibos_002.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := false;
end;

procedure Tform_recibos_002.Refrescar_Registros;
begin
    form_recibos_000.Refrescar_Registros_Alb_Detalles;

    Devolver_Total_Pendiente;
end;

procedure Tform_recibos_002.RadioGroup_BajasClick(Sender: TObject);
begin
    //UTI_TB_Ver_Bajas_SN('um', Memo_Filtros.Lines, RadioGroup_Bajas.ItemIndex);
    Refrescar_Registros;
end;

procedure Tform_recibos_002.BitBtn_Ver_Situacion_Registro_albaranes_ventas_detallesClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if form_recibos_000.SQLQuery_Alb_Detalles.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'albaranes_ventas_detalles',
                                           form_recibos_000.SQLQuery_Alb_Detalles,
                                           form_recibos_000.DataSource_Alb_Detalles,
                                           DBGrid_albaranes_ventas_detalles );
        end;
    end;
end;

procedure Tform_recibos_002.DBGrid_albaranes_ventas_detallesDblClick(Sender: TObject);
begin
    Editar_Registro_albaranes_ventas_detalles;
end;

procedure Tform_recibos_002.DBGrid_albaranes_ventas_detallesDrawColumnCell( Sender: TObject;
                                                                            const Rect: TRect;
                                                                            DataCol: Integer;
                                                                            Column: TColumn;
                                                                            State: TGridDrawState);
var var_Color_Normal : TColor;
begin
    with Sender as TDBGrid do
    begin
        if form_recibos_000.SQLQuery_Alb_Detalles.RecordCount = 0 then Exit;

        var_Color_Normal := Canvas.Brush.Color;

        // ***************************************************************************************** //
        // ** Primero comprobamos si es un registro dado de baja o no                             ** //
        // ***************************************************************************************** //
        if not form_recibos_000.SQLQuery_Alb_Detalles.FieldByName('Del_WHEN').IsNull then
            begin
                // ********************************************************************************* //
                // ** Registro DADO de BAJA                                                       ** //
                // ********************************************************************************* //
                Canvas.Font.Color := clSilver;
            end
        else
            begin
                // ********************************************************************************* //
                // ** Registro DADO de ALTA, NO BAJA                                              ** //
                // ********************************************************************************* //
                // ** Así que las pinto, pero sólo si no son las columnas que van a               ** //
                // ** ser dibujadas                                                               ** //
                // ********************************************************************************* //
                if State <> [gdSelected] then
                begin
                    if (Column.FieldName <> 'COLUMNA_CON_IMAGEN') then
                    begin
                        Canvas.font.Color := clBlack;
                    end;
                end;
            end;

        // ***************************************************************************************** //
        // ** Ahora paso a dibujar una celda normal con los colores elegidos o una                ** //
        // ** dibujada                                                                            ** //
        // ***************************************************************************************** //
        if (Column.FieldName <> 'COLUMNA_CON_IMAGEN') then
            begin
                // ********************************************************************************* //
                // ** No es una de las columnas a dibujar por lo que la pinto con los             ** //
                // ** colores elegidos                                                            ** //
                // ********************************************************************************* //
                DefaultDrawColumnCell(Rect, DataCol, Column, State)
            end
        else
            begin
                // ********************************************************************************* //
                // ** Es una de las columnas a dibujar                                            ** //
                // ********************************************************************************* //
                // ** COLUMNA CONFIRMADA                                                          ** //
                // ********************************************************************************* //
                if Column.FieldName = 'COLUMNA_CON_IMAGEN'  then
                begin
                    // ***************************************************************************** //
                    // ** Canvas.StretchDraw(param_Rect, Image_Confirmado.Picture.Graphic);       ** //
                    // ***************************************************************************** //
                end;
            end;

        Canvas.Font.Color := var_Color_Normal;
    end;
end;

procedure Tform_recibos_002.DBGrid_albaranes_ventas_detallesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if Key = 13 then Editar_Registro_albaranes_ventas_detalles;
end;

procedure Tform_recibos_002.DBGrid_albaranes_ventas_detallesTitleClick(Column: TColumn);
begin
    form_recibos_000.public_Last_Column_Alb_Detalles := UTI_GEN_Ordenar_dbGrid( form_recibos_000.public_Last_Column_Alb_Detalles,
                                                                                Column,
                                                                                form_recibos_000.SQLQuery_Alb_Detalles );
end;

procedure Tform_recibos_002.DBNavigator_albaranes_ventas_detallesBeforeAction(
  Sender: TObject; Button: TDBNavButtonType);
begin
    case Button of
        nbInsert : begin
            Insertar_Registro_albaranes_ventas_detalles;
            Abort;
        end;

        nbEdit : begin
            Editar_Registro_albaranes_ventas_detalles;
            Abort;
        end;

        nbDelete : begin
            Borrar_Registro_albaranes_ventas_detalles;
            Abort;
        end;

        nbRefresh : begin
            form_recibos_000.Refrescar_Registros_Alb_Detalles;
            Abort;
        end;
    end;
end;

procedure Tform_recibos_002.Devolver_Total_Pendiente;
var var_Total_Pendiente : Extended;
    var_id_andetaba     : Int64;
begin
    var_Total_Pendiente := 0;

    if form_recibos_000.SQLQuery_Alb_Detalles.Active = true then
    begin
        With form_recibos_000.SQLQuery_Alb_Detalles do
        begin
            if RecordCount > 0 then
            begin
                var_id_andetaba := FieldByName('id').Value;

                First;

                While not Eof do
                begin
                    if UpperCase(Trim(FieldByName('Excluido_su_Cobro_SN').AsString)) <> 'S' then
                    begin
                         var_Total_Pendiente := var_Total_Pendiente +
                                                FieldByName('OT_para_Cobrar').Value;
                    end;

                    Next;
                end;

                Locate( 'id', var_id_andetaba, [] );
            end;
        end;
    end;
    Edit_Total_Pdte_Cobro.Text := FormatFloat( '###,###,##0.000', var_Total_Pendiente );
end;

procedure Tform_recibos_002.Edit_Descripcion_EmpresaClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS la EMPRESA');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_recibos_000.SQLQuery_Alb.FieldByName('id_empresas').Clear;
         Edit_Descripcion_Empresa.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_recibos_002.Boton_Elegir_Forma_PagoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_recibos_000.SQLQuery_Alb do
    begin
        var_Registro := UTI_Abrir_Form( true, false, '', 80 );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_formas_pago').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Forma_Pago.Text       := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_recibos_002.Boton_Elegir_EmpresaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_recibos_000.SQLQuery_Alb do
    begin
        var_Registro := UTI_Abrir_Form( true, false, '', 250 );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_empresas').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Empresa.Text       := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_recibos_002.Edit_Descripcion_Forma_PagoClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS la FORMA DE PAGO?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_recibos_000.SQLQuery_Alb.FieldByName('id_formas_pago').Clear;
         Edit_Descripcion_Forma_Pago.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_recibos_002.no_Tocar;
begin
    Boton_Elegir_Empresa.Enabled              := False;
    Edit_Descripcion_Empresa.Enabled          := False;
    Boton_Elegir_Forma_Pago.Enabled           := False;
    Edit_Descripcion_Forma_Pago.Enabled       := False;
    DBEdit_a_quien_facturamos.Enabled         := False;
    DBDateTimePicker_Fecha_Nacimiento.Enabled := False;
end;

procedure Tform_recibos_002.FormActivate(Sender: TObject);
begin
    If form_recibos_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    Comprobar_No_Tocar(true, true);
end;

function Tform_recibos_002.Comprobar_No_Tocar( param_Reproducir_Mensajes,
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

procedure Tform_recibos_002.Insertar_Registro_albaranes_ventas_detalles;
var var_msg  : TStrings;
    var_Form : Tform_recibos_003;
begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    with form_recibos_000.SQLQuery_Alb_Detalles do
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

                FieldByName('id_clientes').AsString          := form_recibos_000.SQLQuery_Alb.FieldByName('id_clientes').AsString;
                FieldByName('Excluido_su_Cobro_SN').AsString := 'N';
                FieldByName('id_albaranes').AsString         := form_recibos_000.SQLQuery_Alb.FieldByName('id').AsString;

                var_Form := Tform_recibos_003.Create(nil);

                var_Form.para_Empezar;

                var_Form.ShowModal;
                if var_Form.public_Pulso_Aceptar = true then
                begin
                    var_Form.Free;

                    FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
                    FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                    UTI_RGTRO_Grabar_Antes( 'albaranes_ventas_detalles',
                                            form_recibos_000.SQLQuery_Alb_Detalles );

                    Devolver_Total_Pendiente;
                end else begin
                    var_Form.Free;
                    Cancel;
                end;
            end;
        end;

        var_msg.Free;
    end;
end;

procedure Tform_recibos_002.Editar_Registro_albaranes_ventas_detalles;
var var_msg  : TStrings;
    var_Form : Tform_recibos_003;
    var_id   : ShortString;
begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    with form_recibos_000.SQLQuery_Alb_Detalles do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
        begin
            var_id := FieldByName('id').AsString;

            if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
            begin
                if UTI_RGTRO_isLock( 'albaranes_ventas_detalles',
                                     var_id,
                                     true ) = true then
                begin
                    Exit;
                end else begin
                    if UTI_RGTRO_Lock( 'albaranes_ventas_detalles',
                                       var_id ) = true then
                         Edit
                    else Exit;
                end;

                var_Form := Tform_recibos_003.Create(nil);

                var_Form.public_Menu_Worked := public_Menu_Worked;

                if public_Solo_Ver = true then
                begin
                    var_Form.public_Solo_Ver := true;
                end;

                var_Form.para_Empezar;

                var_Form.ShowModal;
                if var_Form.public_Pulso_Aceptar = true then
                begin
                    if ( Trim(Params.ParamByName('COPY_' + 'Fecha_Movimiento').AsString)        <> Trim(FieldByName('Fecha_Movimiento').AsString) )        or
                       ( Trim(Params.ParamByName('COPY_' + 'id_clientes').AsString)             <> Trim(FieldByName('id_clientes').AsString) )             or
                       ( Trim(Params.ParamByName('COPY_' + 'Unidades').AsString)                <> Trim(FieldByName('Unidades').AsString) )   or
                       ( Trim(Params.ParamByName('COPY_' + 'id_articulos').AsString)            <> Trim(FieldByName('id_articulos').AsString) )            or
                       ( Trim(Params.ParamByName('COPY_' + 'Repetir_Cada').AsString)            <> Trim(FieldByName('Repetir_Cada').AsString) )            or
                       ( Trim(Params.ParamByName('COPY_' + 'descripcion').AsString)             <> Trim(FieldByName('descripcion').AsString) )             or
                       ( Trim(Params.ParamByName('COPY_' + 'descripcion_para_TPV').AsString)    <> Trim(FieldByName('descripcion_para_TPV').AsString) )    or
                       ( Trim(Params.ParamByName('COPY_' + 'PVP').AsString)                     <> Trim(FieldByName('PVP').AsString) )                     or
                       ( Trim(Params.ParamByName('COPY_' + 'PVP_Impuestos_Incluidos').AsString) <> Trim(FieldByName('PVP_Impuestos_Incluidos').AsString) ) or
                       ( Trim(Params.ParamByName('COPY_' + 'id_impuestos_Ventas').AsString)     <> Trim(FieldByName('id_impuestos_Ventas').AsString) )     or
                       ( Trim(Params.ParamByName('COPY_' + 'Descuento_Comercial_1').AsString)   <> Trim(FieldByName('Descuento_Comercial_1').AsString) )   or
                       ( Trim(Params.ParamByName('COPY_' + 'Descuento_Comercial_2').AsString)   <> Trim(FieldByName('Descuento_Comercial_2').AsString) )   or
                       ( Trim(Params.ParamByName('COPY_' + 'PVP_Manual_Final').AsString)        <> Trim(FieldByName('PVP_Manual_Final').AsString) )        or
                       ( Trim(Params.ParamByName('COPY_' + 'Excluido_su_Cobro_SN').AsString)    <> Trim(FieldByName('Excluido_su_Cobro_SN').AsString) )    then
                    begin
                        FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                        FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                        UTI_RGTRO_Grabar_Antes( 'albaranes_ventas_detalles',
                                                form_recibos_000.SQLQuery_Alb_Detalles );

                        Devolver_Total_Pendiente;
                    end else begin
                        Cancel;
                    end;

                    var_Form.Free;

                end else begin
                    var_Form.Free;
                    Cancel;
                end;

                UTI_RGTRO_UnLock( 'albaranes_ventas_detalles', var_id );
            end;
        end else begin
            var_msg.Add(rs_no_Hay_Rgtros);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        end;
    end;

    var_msg.Free;
end;

procedure Tform_recibos_002.Borrar_Registro_albaranes_ventas_detalles;
begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    if UTI_USR_Permiso_SN(public_Menu_Worked, 'B', True) = True then
    begin
        UTI_RGTRO_Borrar( 'albaranes_ventas_detalles',
                          form_recibos_000.SQLQuery_Alb_Detalles,
                          public_Solo_Ver,
                          public_Menu_Worked );

        Devolver_Total_Pendiente;
    end;
end;

end.


