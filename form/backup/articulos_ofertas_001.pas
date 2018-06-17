unit articulos_ofertas_001;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DBDateTimePicker, Forms, Controls, Graphics, Dialogs, ButtonPanel,
  utilidades_forms_Filtrar, utilidades_usuarios, StdCtrls, DbCtrls, ExtCtrls, Buttons, ComCtrls,
  utilidades_bd, sqldb, utilidades_rgtro, utilidades_general, utilidades_datos_tablas, db, DBGrids,
  Grids, LCLTranslator;

resourcestring
  rs_FormClose_1  = '* La descripción.';
  rs_FormClose_2  = '* El inicio de la oferta.';
  rs_FormClose_3  = '* El final de la oferta.';
  rs_FormClose_4  = '* No puede ser que el inicio y final de la oferta sea el mismo.';
  rs_FormClose_5  = '* No puede ser que el inicio sea mayor que el final de la oferta.';
  rs_FormClose_6  = '* Algún día de la semana para la oferta, o todos los días.';
  rs_FormClose_7  = '* Ha elegido el tipo de oferta "Porcentaje dto.",';
  rs_FormClose_8  = ' y no ha elegido el descuento todavía.';
  rs_FormClose_9  = '* Ha elegido el tipo de oferta "Descuento por volumen",';
  rs_FormClose_10 = ' y no ha introducido todavía ninguna cantidad y porcentaje.';
  rs_FormClose_11 = '* Ha elegido el tipo de oferta "Regalo por cantidad",';
  rs_FormClose_12 = ' y no ha puesto las UNIDADES COMPRADAS.';
  rs_FormClose_13 = '* Ha elegido el tipo de oferta "Regalo por cantidad",';
  rs_FormClose_14 = ' y no ha puesto las UNIDADES A PAGAR.';
  rs_FormClose_15 = '* Ha elegido el tipo de oferta "Aplicar una tarifa",';
  rs_FormClose_16 = ' y no ha elegido todavía TARIFA.';
  rs_FormClose_17 = '* Tiene que elegir un TIPO DE OFERTA.';

  rs_Quitamos_1 = '¿QUITAMOS la TARIFA?';

  rs_Insertar_Registro_AOA_1 =  'Artículo repetido para esta oferta.';

  rs_Editar_Registro_AOA_1 = 'Artículo repetido para esta oferta.';

type

  { Tform_articulos_ofertas_001 }

  Tform_articulos_ofertas_001 = class(TForm)
    BitBtn_Ver_Situacion_Registro_AOA: TBitBtn;
    BitBtn_Ver_Situacion_Registro_AODPV: TBitBtn;
    Boton_Elegir_Tarifa: TBitBtn;
    ButtonPanel1: TButtonPanel;
    DBCheckBox_Jueves: TDBCheckBox;
    DBCheckBox_Viernes: TDBCheckBox;
    DBCheckBox_Sabado: TDBCheckBox;
    DBCheckBox_Domingo: TDBCheckBox;
    DBCheckBox_Martes: TDBCheckBox;
    DBCheckBox_Lunes: TDBCheckBox;
    DBCheckBox_Miercoles: TDBCheckBox;
    DBDateTimePicker_Fin: TDBDateTimePicker;
    DBDateTimePicker_Inicio: TDBDateTimePicker;
    DBEdit_Descripcion_para_terminal: TDBEdit;
    DBEdit_eMail1: TDBEdit;
    DBEdit_Dto: TDBEdit;
    DBEdit_Ud_Compradas: TDBEdit;
    DBEdit_Ud_a_Pagar: TDBEdit;
    DBGrid_AOA: TDBGrid;
    DBGrid_AODPV: TDBGrid;
    DBMemo_Descripcion: TDBMemo;
    DBNavigator_AOA: TDBNavigator;
    DBNavigator_AODPV: TDBNavigator;
    DBRadioGroup_Tipo_Cuenta: TDBRadioGroup;
    Edit_Descripcion_Tarifa: TEdit;
    GroupBox1: TGroupBox;
    GroupBox11: TGroupBox;
    Label1: TLabel;
    Label18: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    PageControl_Segun_Tipo_Oferta: TPageControl;
    Panel_Tipo_Oferta: TPanel;
    RadioGroup_Bajas: TRadioGroup;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    TabSheet_Porcentaje_Descuento: TTabSheet;
    TabSheet_Regalo_por_Cantidad: TTabSheet;
    TabSheet_Aplicar_una_Tarifa: TTabSheet;
    TabSheet_Descuento_Volumen: TTabSheet;

    procedure Validacion( param_msg : TStrings );
    procedure Borrar_Registro_AOA;
    procedure Borrar_Registro_AODPV;
    procedure BitBtn_Ver_Situacion_Registro_AOAClick(Sender: TObject);
    procedure BitBtn_Ver_Situacion_Registro_AODPVClick(Sender: TObject);
    function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
    procedure DBGrid_AOADblClick(Sender: TObject);
    procedure DBGrid_AODPVDblClick(Sender: TObject);
    procedure Presentar_Datos;
    procedure DBRadioGroup_Tipo_CuentaChange(Sender: TObject);
    procedure no_Tocar;
    procedure Editar_Registro_AODPV;
    procedure Insertar_Registro_AODPV;
    procedure Editar_Registro_AOA;
    procedure Insertar_Registro_AOA;
    procedure DBGrid_AOADrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_AOAKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid_AODPVDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_AODPVKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBNavigator_AOABeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure DBNavigator_AODPVBeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure Refrescar_Registros;
    procedure Boton_Elegir_TarifaClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure Edit_Descripcion_TarifaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure para_Empezar;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup_BajasClick(Sender: TObject);
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
  form_articulos_ofertas_001: Tform_articulos_ofertas_001;

implementation

{$R *.lfm}

uses menu, articulos_ofertas_000, articulos_ofertas_002, articulos_ofertas_003;

{ Tform_articulos_ofertas_001 }

procedure Tform_articulos_ofertas_001.FormCreate(Sender: TObject);
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

procedure Tform_articulos_ofertas_001.para_Empezar;
begin
  { ****************************************************************************
    Solo para formularios que traten con datos
    **************************************************************************** }
    with form_articulos_ofertas_000.SQLQuery_AO do
    begin
        public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                           '',
                                                           '',
                                                           FieldByName('descripcion').AsString,
                                                           '',
                                                           '' );
    end;

    Presentar_Datos;

  { ****************************************************************************
    SOLO PARA ESTE FORM
    **************************************************************************** }
end;

procedure Tform_articulos_ofertas_001.Validacion( param_msg : TStrings );
begin
    with form_articulos_ofertas_000.SQLQuery_AO do
    begin
        if Trim(FieldByName('descripcion').AsString) = '' then
        begin
            param_msg.Add(rs_FormClose_1);
        end;

        if FieldByName('Fecha_Hora_Inicio').IsNull then
        begin
            param_msg.Add(rs_FormClose_2);
        end else begin
            FieldByName('Fecha_Hora_Inicio').AsString := FieldByName('Fecha_Hora_Inicio').AsString;
        end;

        if FieldByName('Fecha_Hora_Fin').IsNull then
        begin
            param_msg.Add(rs_FormClose_3);
        end else begin
            FieldByName('Fecha_Hora_Fin').AsString := FieldByName('Fecha_Hora_Fin').AsString;
        end;

        if FieldByName('Fecha_Hora_Inicio').Value = FieldByName('Fecha_Hora_Fin').Value then
        begin
            param_msg.Add(rs_FormClose_4);
        end;

        if FieldByName('Fecha_Hora_Inicio').Value > FieldByName('Fecha_Hora_Fin').Value then
        begin
            param_msg.Add(rs_FormClose_5);
        end;

        if ( Trim(FieldByName('Lunes').AsString)     = 'N' ) and
           ( Trim(FieldByName('Martes').AsString)    = 'N' ) and
           ( Trim(FieldByName('Miercoles').AsString) = 'N' ) and
           ( Trim(FieldByName('Jueves').AsString)    = 'N' ) and
           ( Trim(FieldByName('Viernes').AsString)   = 'N' ) and
           ( Trim(FieldByName('Sabado').AsString)    = 'N' ) and
           ( Trim(FieldByName('Domingo').AsString)   = 'N' ) then
        begin
            param_msg.Add(rs_FormClose_6);
        end;

        if (Trim(FieldByName('Tipo_Oferta').AsString) = '1')   and
           (
             (Trim(FieldByName('Descuento').AsString) = '') or
             (FieldByName('Descuento').IsNull)              or
             (FieldByName('Descuento').Value = 0)
           )                                                   then
        begin
            param_msg.Add( rs_FormClose_7 + rs_FormClose_8 );
        end;

        if (Trim(FieldByName('Tipo_Oferta').AsString) = '2')           and
           (form_articulos_ofertas_000.SQLQuery_AODPV.RecordCount = 0) then
        begin
            param_msg.Add( rs_FormClose_9 +
                         rs_FormClose_10 );
        end;

        if (Trim(FieldByName('Tipo_Oferta').AsString) = '3') and
           (
              (FieldByName('Unidades_Compradas').IsNull) or
              (FieldByName('Unidades_a_Pagar').IsNull)
           )                                                 then
        begin
           if FieldByName('Unidades_Compradas').IsNull then
           begin
               param_msg.Add( rs_FormClose_11 +
                            rs_FormClose_12 );
           end;

           if FieldByName('Unidades_a_Pagar').IsNull then
           begin
               param_msg.Add( rs_FormClose_13 +
                            rs_FormClose_14 );
           end;
        end;

        if Trim(FieldByName('Tipo_Oferta').AsString) = '4' then
        begin
            param_msg.Add( rs_FormClose_15 + rs_FormClose_16 );
        end;

        if Trim(FieldByName('Tipo_Oferta').AsString) = '' then
        begin
            param_msg.Add( rs_FormClose_17 );
        end;
    end;
end;

procedure Tform_articulos_ofertas_001.FormClose(Sender: TObject; var CloseAction: TCloseAction);
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

procedure Tform_articulos_ofertas_001.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := true;
end;

procedure Tform_articulos_ofertas_001.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := false;
end;

procedure Tform_articulos_ofertas_001.Boton_Elegir_TarifaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_articulos_ofertas_000.SQLQuery_AO do
    begin
        var_Registro := UTI_Abrir_Modulo_Tarifas( true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_tarifas').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Tarifa.Text       := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_articulos_ofertas_001.Edit_Descripcion_TarifaClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add(rs_Quitamos_1);
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_articulos_ofertas_000.SQLQuery_AO.FieldByName('id_tarifas').Clear;
         Edit_Descripcion_Tarifa.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_articulos_ofertas_001.RadioGroup_BajasClick(Sender: TObject);
begin
    //UTI_TB_Ver_Bajas_SN('um', Memo_Filtros.Lines, RadioGroup_Bajas.ItemIndex);
    Refrescar_Registros;
end;

procedure Tform_articulos_ofertas_001.Refrescar_Registros;
begin
    form_articulos_ofertas_000.Refrescar_Registros_AODPV;
    form_articulos_ofertas_000.Refrescar_Registros_AOA;
end;

procedure Tform_articulos_ofertas_001.DBGrid_AOADrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
var var_Color_Normal : TColor;
begin
    with Sender as TDBGrid do
    begin
        if form_articulos_ofertas_000.SQLQuery_AOA.RecordCount = 0 then Exit;

        var_Color_Normal := Canvas.Brush.Color;

      { ************************************************************************
        Primero comprobamos si es un registro dado de baja o no
        ************************************************************************ }
        if not form_articulos_ofertas_000.SQLQuery_AOA.FieldByName('Del_WHEN').IsNull then
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
                    if Trim(form_articulos_ofertas_000.SQLQuery_AOA.FieldByName('id_medio').asString) = '1' then
                    begin
                        Canvas.StretchDraw(param_Rect, Image_Confirmado.Picture.Graphic);
                    end;
                    }
                end;
            end;

        Canvas.Font.Color := var_Color_Normal;
    end;
end;

procedure Tform_articulos_ofertas_001.DBGrid_AODPVDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
var var_Color_Normal : TColor;
begin
    with Sender as TDBGrid do
    begin
        if form_articulos_ofertas_000.SQLQuery_AODPV.RecordCount = 0 then Exit;

        var_Color_Normal := Canvas.Brush.Color;

      { ************************************************************************
        Primero comprobamos si es un registro dado de baja o no
        ************************************************************************ }
        if not form_articulos_ofertas_000.SQLQuery_AODPV.FieldByName('Del_WHEN').IsNull then
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
                    if Trim(form_articulos_ofertas_000.SQLQuery_AODPV.FieldByName('id_medio').asString) = '1' then
                    begin
                        Canvas.StretchDraw(param_Rect, Image_Confirmado.Picture.Graphic);
                    end;
                    }
                end;
            end;

        Canvas.Font.Color := var_Color_Normal;
    end;
end;

procedure Tform_articulos_ofertas_001.DBGrid_AOAKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if Key = 13 then Editar_Registro_AOA;
end;

procedure Tform_articulos_ofertas_001.DBGrid_AODPVKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then Editar_Registro_AODPV;
end;

procedure Tform_articulos_ofertas_001.DBNavigator_AOABeforeAction(Sender: TObject;
    Button: TDBNavButtonType);
begin
    case Button of
        nbInsert : begin
            Insertar_Registro_AOA;
            Abort;
        end;

        nbEdit : begin
            Editar_Registro_AOA;
            Abort;
        end;

        nbDelete : begin
            Borrar_Registro_AOA;
            Abort;
        end;

        nbRefresh : begin
            form_articulos_ofertas_000.Refrescar_Registros_AOA;
            Abort;
        end;
    end;
end;

procedure Tform_articulos_ofertas_001.DBNavigator_AODPVBeforeAction(Sender: TObject;
    Button: TDBNavButtonType);
begin
    case Button of
        nbInsert : begin
            Insertar_Registro_AODPV;
            Abort;
        end;

        nbEdit : begin
            Editar_Registro_AODPV;
            Abort;
        end;

        nbDelete : begin
            Borrar_Registro_AODPV;
            Abort;
        end;

        nbRefresh : begin
            form_articulos_ofertas_000.Refrescar_Registros_AODPV;
            Abort;
        end;
    end;
end;

procedure Tform_articulos_ofertas_001.DBRadioGroup_Tipo_CuentaChange(Sender: TObject);
begin
    TabSheet_Porcentaje_Descuento.Enabled := False;
    TabSheet_Descuento_Volumen.Enabled    := False;
    TabSheet_Regalo_por_Cantidad.Enabled  := False;
    TabSheet_Aplicar_una_Tarifa.Enabled   := False;

    if DBRadioGroup_Tipo_Cuenta.ItemIndex = 0 then
    begin
        TabSheet_Porcentaje_Descuento.Enabled    := True;
        PageControl_Segun_Tipo_Oferta.ActivePage := TabSheet_Porcentaje_Descuento;
    end;

    if DBRadioGroup_Tipo_Cuenta.ItemIndex = 1 then
    begin
        TabSheet_Descuento_Volumen.Enabled       := True;
        PageControl_Segun_Tipo_Oferta.ActivePage := TabSheet_Descuento_Volumen;
    end;

    if DBRadioGroup_Tipo_Cuenta.ItemIndex = 2 then
    begin
        TabSheet_Regalo_por_Cantidad.Enabled     := True;
        PageControl_Segun_Tipo_Oferta.ActivePage := TabSheet_Regalo_por_Cantidad;
    end;

    if DBRadioGroup_Tipo_Cuenta.ItemIndex = 3 then
    begin
        TabSheet_Aplicar_una_Tarifa.Enabled      := True;
        PageControl_Segun_Tipo_Oferta.ActivePage := TabSheet_Aplicar_una_Tarifa;
    end;
end;

procedure Tform_articulos_ofertas_001.Presentar_Datos;
begin
    with form_articulos_ofertas_000.SQLQuery_AO do
    begin
        TabSheet_Porcentaje_Descuento.Enabled := False;
        TabSheet_Descuento_Volumen.Enabled    := False;
        TabSheet_Regalo_por_Cantidad.Enabled  := False;
        TabSheet_Aplicar_una_Tarifa.Enabled   := False;

        if state = dsInsert then
        begin
            FieldByName('Fecha_Hora_Inicio').Value := Now;
            FieldByName('Fecha_Hora_Fin').Value    := Now;
            PageControl_Segun_Tipo_Oferta.ActivePage := TabSheet_Porcentaje_Descuento;
        end else begin
            if (Trim(FieldByName('Tipo_Oferta').AsString) = '1') then
            begin
                TabSheet_Porcentaje_Descuento.Enabled    := True;
                PageControl_Segun_Tipo_Oferta.ActivePage := TabSheet_Porcentaje_Descuento;
            end;

            if (Trim(FieldByName('Tipo_Oferta').AsString) = '2') then
            begin
                TabSheet_Descuento_Volumen.Enabled       := True;
                PageControl_Segun_Tipo_Oferta.ActivePage := TabSheet_Descuento_Volumen;
            end;

            if (Trim(FieldByName('Tipo_Oferta').AsString) = '3') then
            begin
                TabSheet_Regalo_por_Cantidad.Enabled     := True;
                PageControl_Segun_Tipo_Oferta.ActivePage := TabSheet_Regalo_por_Cantidad;
            end;

            if (Trim(FieldByName('Tipo_Oferta').AsString) = '4') then
            begin
                TabSheet_Aplicar_una_Tarifa.Enabled      := True;
                PageControl_Segun_Tipo_Oferta.ActivePage := TabSheet_Aplicar_una_Tarifa;
            end;
        end;

        Edit_Descripcion_Tarifa.Text := FieldByName('OT_Descripcion_Tarifa').AsString;
    end;
end;

procedure Tform_articulos_ofertas_001.BitBtn_Ver_Situacion_Registro_AODPVClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if form_articulos_ofertas_000.SQLQuery_AODPV.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'articulos_ofertas_dto_por_volumen',
                                           form_articulos_ofertas_000.SQLQuery_AODPV,
                                           form_articulos_ofertas_000.DataSource_AODPV,
                                           DBGrid_AODPV );
        end;
    end;
end;

procedure Tform_articulos_ofertas_001.BitBtn_Ver_Situacion_Registro_AOAClick(Sender: TObject);
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        if form_articulos_ofertas_000.SQLQuery_AOA.RecordCount > 0 then
        begin
            UTI_RGTRO_Ver_Estado_Registro( 'articulos_ofertas_articulos',
                                           form_articulos_ofertas_000.SQLQuery_AOA,
                                           form_articulos_ofertas_000.DataSource_AOA,
                                           DBGrid_AOA );
        end;
    end;
end;

procedure Tform_articulos_ofertas_001.DBGrid_AOADblClick(Sender: TObject);
begin
    Editar_Registro_AOA;
end;

procedure Tform_articulos_ofertas_001.DBGrid_AODPVDblClick(Sender: TObject);
begin
    Editar_Registro_AODPV;
end;

procedure Tform_articulos_ofertas_001.no_Tocar;
begin
    DBMemo_Descripcion.Enabled                := False;
    DBEdit_Descripcion_para_terminal.Enabled  := False;
    DBDateTimePicker_Inicio.Enabled           := False;
    DBDateTimePicker_Fin.Enabled              := False;
    DBCheckBox_Lunes.Enabled                  := False;
    DBCheckBox_Martes.Enabled                 := False;
    DBCheckBox_Miercoles.Enabled              := False;
    DBCheckBox_Jueves.Enabled                 := False;
    DBCheckBox_Viernes.Enabled                := False;
    DBCheckBox_Sabado.Enabled                 := False;
    DBCheckBox_Domingo.Enabled                := False;

    DBEdit_Dto.Enabled                        := False;
    DBEdit_Ud_Compradas.Enabled               := False;
    DBEdit_Ud_a_Pagar.Enabled                 := False;
    Boton_Elegir_Tarifa.Enabled               := False;
    Edit_Descripcion_Tarifa.Enabled           := False;

    Panel_Tipo_Oferta.Enabled                 := False;
    TabSheet_Descuento_Volumen.Enabled        := False;
    TabSheet_Regalo_por_Cantidad.Enabled      := False;
    TabSheet_Aplicar_una_Tarifa.Enabled       := False;
end;

procedure Tform_articulos_ofertas_001.FormActivate(Sender: TObject);
begin
    If form_articulos_ofertas_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    Comprobar_No_Tocar(true, true);
end;

function Tform_articulos_ofertas_001.Comprobar_No_Tocar( param_Reproducir_Mensajes,
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

procedure Tform_articulos_ofertas_001.Insertar_Registro_AODPV;
var var_msg  : TStrings;
    var_Form : Tform_articulos_ofertas_002;
begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    with form_articulos_ofertas_000.SQLQuery_AODPV do
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

                    FieldByName('id_articulos_ofertas').AsString := form_articulos_ofertas_000.SQLQuery_AO.FieldByName('id').AsString;

                    var_Form := Tform_articulos_ofertas_002.Create(nil);

                    var_Form.para_Empezar;

                    var_Form.ShowModal;
                    if var_Form.public_Pulso_Aceptar = true then
                        begin
                            var_Form.Free;

                            FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
                            FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                            UTI_RGTRO_Grabar_Antes( 'articulos_ofertas_dto_por_volumen',
                                                    form_articulos_ofertas_000.SQLQuery_AODPV );
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

procedure Tform_articulos_ofertas_001.Editar_Registro_AODPV;
var var_msg  : TStrings;
    var_Form : Tform_articulos_ofertas_002;
    var_id   : ShortString;
begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    with form_articulos_ofertas_000.SQLQuery_AODPV do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
            begin
                var_id := FieldByName('id').AsString;

                if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
                begin
                    if UTI_RGTRO_isLock( 'articulos_ofertas_dto_por_volumen',
                                         FieldByName('id').AsString,
                                         true ) = true then
                        begin
                            Exit;
                        end
                    else
                        begin
                            if UTI_RGTRO_Lock( 'articulos_ofertas_dto_por_volumen',
                                               FieldByName('id').AsString ) = true then
                                 Edit
                            else Exit;
                        end;

                    var_Form := Tform_articulos_ofertas_002.Create(nil);

                    var_Form.public_Menu_Worked := public_Menu_Worked;

                    if public_Solo_Ver = true then
                    begin
                        var_Form.public_Solo_Ver := true;
                    end;

                    var_Form.para_Empezar;

                    var_Form.ShowModal;
                    if var_Form.public_Pulso_Aceptar = true then
                        begin
                            if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( form_articulos_ofertas_000.SQLQuery_AODPV ) = true then
                               begin
                                    FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                                    FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                                    UTI_RGTRO_Grabar_Antes( 'articulos_ofertas_dto_por_volumen',
                                                            form_articulos_ofertas_000.SQLQuery_AODPV );
                               end
                            else Cancel;
                            var_Form.Free;
                        end
                    else
                        begin
                            var_Form.Free;
                            Cancel;
                        end;

                    UTI_RGTRO_UnLock( 'articulos_ofertas_dto_por_volumen',
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

procedure Tform_articulos_ofertas_001.Borrar_Registro_AODPV;
begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    if UTI_USR_Permiso_SN(public_Menu_Worked, 'B', True) = True then
    begin
        UTI_RGTRO_Borrar( 'articulos_ofertas_dto_por_volumen',
                          form_articulos_ofertas_000.SQLQuery_AODPV,
                          public_Solo_Ver,
                          public_Menu_Worked );
    end;
end;

procedure Tform_articulos_ofertas_001.Insertar_Registro_AOA;
var var_msg           : TStrings;
    var_Form          : Tform_articulos_ofertas_003;
    var_record_Existe : Trecord_Existe;
begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    with form_articulos_ofertas_000.SQLQuery_AOA do
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

                    FieldByName('id_articulos_ofertas').AsString := form_articulos_ofertas_000.SQLQuery_AO.FieldByName('id').AsString;

                    var_Form := Tform_articulos_ofertas_003.Create(nil);

                    var_Form.para_Empezar;

                    var_Form.ShowModal;
                    if var_Form.public_Pulso_Aceptar = true then
                        begin
                            var_Form.Free;

                            SetLength(var_Campos_para_Existe_ya, 2);

                            var_Campos_para_Existe_ya[0].Campo_Valor  := FieldByName('id_articulos_ofertas').AsString;
                            var_Campos_para_Existe_ya[0].Campo_Nombre := 'id_articulos_ofertas';
                            var_Campos_para_Existe_ya[0].Campo_Tipo   := 0; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                            var_Campos_para_Existe_ya[1].Campo_Valor  := FieldByName('id_articulos').AsString;
                            var_Campos_para_Existe_ya[1].Campo_Nombre := 'id_articulos';
                            var_Campos_para_Existe_ya[1].Campo_Tipo   := 0; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                            var_record_Existe := UTI_RGTRO_Existe_Ya( 'articulos_ofertas_articulos',                                      // param_nombre_tabla
                                                                      'ORDER BY articulos_ofertas_articulos.id_articulos_ofertas ASC, ' +
                                                                               'articulos_ofertas_articulos.id_articulos ASC',            // param_order_by
                                                                      '',                                                                 // param_id_a_no_traer ... Estoy insertando
                                                                      var_Campos_para_Existe_ya );                                        // param_Campos_para_Existe_ya

                            if var_record_Existe.Fallo_en_Conexion_BD = true then
                                begin
                                    // var_Form.Free;
                                    Cancel;
                                end
                            else
                                begin
                                    if var_record_Existe.Existe = false then
                                        begin
                                            FieldByName('Insert_WHEN').Value    := UTI_CN_Fecha_Hora;
                                            FieldByName('Insert_Id_User').Value := Form_Menu.public_User;

                                            UTI_RGTRO_Grabar_Antes( 'articulos_ofertas_articulos',
                                                                    form_articulos_ofertas_000.SQLQuery_AOA );
                                        end
                                    else
                                        begin
                                            Cancel;
                                            var_msg.Clear;

                                            var_msg.Add(rs_Insertar_Registro_AOA_1);

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

procedure Tform_articulos_ofertas_001.Editar_Registro_AOA;
var var_msg           : TStrings;
    var_Form          : Tform_articulos_ofertas_003;
    var_record_Existe : Trecord_Existe;
    var_id            : ShortString;
begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    with form_articulos_ofertas_000.SQLQuery_AOA do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
            begin
                var_id := FieldByName('id').AsString;

                if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
                begin
                    if UTI_RGTRO_isLock( 'articulos_ofertas_articulos',
                                         FieldByName('id').AsString,
                                         true ) = true then
                        begin
                            Exit;
                        end
                    else
                        begin
                            if UTI_RGTRO_Lock( 'articulos_ofertas_articulos',
                                               FieldByName('id').AsString ) = true then
                                 Edit
                            else Exit;
                        end;

                    var_Form := Tform_articulos_ofertas_003.Create(nil);

                    var_Form.public_Menu_Worked := public_Menu_Worked;

                    if public_Solo_Ver = true then
                    begin
                        var_Form.public_Solo_Ver := true;
                    end;

                    var_Form.para_Empezar;

                    var_Form.ShowModal;
                    if var_Form.public_Pulso_Aceptar = true then
                        begin
                            SetLength(var_Campos_para_Existe_ya, 2);

                            var_Campos_para_Existe_ya[0].Campo_Valor  := FieldByName('id_articulos_ofertas').AsString;
                            var_Campos_para_Existe_ya[0].Campo_Nombre := 'id_articulos_ofertas';
                            var_Campos_para_Existe_ya[0].Campo_Tipo   := 0; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                            var_Campos_para_Existe_ya[1].Campo_Valor  := FieldByName('id_articulos').AsString;
                            var_Campos_para_Existe_ya[1].Campo_Nombre := 'id_articulos';
                            var_Campos_para_Existe_ya[1].Campo_Tipo   := 0; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora

                            var_record_Existe := UTI_RGTRO_Existe_Ya( 'articulos_ofertas_articulos',                                      // param_nombre_tabla
                                                                      'ORDER BY articulos_ofertas_articulos.id_articulos_ofertas ASC, ' +
                                                                               'articulos_ofertas_articulos.id_articulos ASC',            // param_order_by
                                                                      FieldByName('id').AsString,                                         // param_id_a_no_traer ... Estoy insertando
                                                                      var_Campos_para_Existe_ya );                                        // param_Campos_para_Existe_ya

                            if var_record_Existe.Fallo_en_Conexion_BD = true then
                                begin
                                    var_Form.Free;
                                    Cancel;
                                end
                            else
                                begin
                                    if var_record_Existe.Existe = false then
                                        begin
                                            if UTI_DATOS_TABLA_SeCambioAlgoEnRgtro( form_articulos_ofertas_000.SQLQuery_AOA ) = true then
                                               begin
                                                    FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                                                    FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                                                    UTI_RGTRO_Grabar_Antes( 'articulos_ofertas_articulos',
                                                                            form_articulos_ofertas_000.SQLQuery_AOA );
                                               end
                                            else Cancel;
                                            var_Form.Free;
                                        end
                                    else
                                        begin
                                            var_Form.Free;
                                            Cancel;
                                            var_msg.Clear;
                                            var_msg.Add(rs_Editar_Registro_AOA_1);

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

                    UTI_RGTRO_UnLock( 'articulos_ofertas_articulos', var_id );
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

procedure Tform_articulos_ofertas_001.Borrar_Registro_AOA;
begin
    if Comprobar_No_Tocar(true, false) = true then
    begin
        Exit;
    end;

    if UTI_USR_Permiso_SN(public_Menu_Worked, 'B', True) = True then
    begin
        UTI_RGTRO_Borrar( 'articulos_ofertas_articulos',
                          form_articulos_ofertas_000.SQLQuery_AOA,
                          public_Solo_Ver,
                          public_Menu_Worked );
    end;
end;

end.


