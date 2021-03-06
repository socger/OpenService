unit articulos_002;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs,
    ButtonPanel, StdCtrls, DbCtrls, utilidades_general,
    utilidades_forms_Filtrar, ExtCtrls, LCLTranslator, Buttons, DBGrids;

resourcestring
  rs_FormClose_1  = '* Uno de los dos PVP.';
  rs_FormClose_2 = '* Sólo uno de los dos PVP.';
  rs_FormClose_3 = '* El % de DESCUENTO.';

type

    { Tform_articulos_002 }

    Tform_articulos_002 = class(TForm)
      BitBtn_Ver_Situacion_Registro_Margenes: TBitBtn;
        ButtonPanel1: TButtonPanel;
        DBEdit_a_quien_facturamos: TDBEdit;
        DBEdit_Descripcion: TDBEdit;
        DBEdit_Descripcion1: TDBEdit;
        DBEdit_Descripcion2: TDBEdit;
        DBEdit_eMail1: TDBEdit;
        DBEdit_Importe_con_Impuestos: TDBEdit;
        DBEdit_Importe_con_Impuestos1: TDBEdit;
        DBEdit_Importe_Neto: TDBEdit;
        DBEdit_Importe_Neto1: TDBEdit;
        DBEdit_Retencion1: TDBEdit;
        DBGrid_Margenes: TDBGrid;
        DBNavigator_Margenes: TDBNavigator;
        DBRadioGroup1: TDBRadioGroup;
        Edit_Compra_Ultima_Fecha: TEdit;
        Edit_Compra_Ultimo_Precio: TEdit;
        Edit_Descripcion_Impto_Ventas: TEdit;
        GroupBox1: TGroupBox;
        GroupBox11: TGroupBox;
        GroupBox2: TGroupBox;
        GroupBox_Contactos: TGroupBox;
        GroupBox_Cuentas_Contables4: TGroupBox;
        Label1: TLabel;
        Label2: TLabel;
        Label22: TLabel;
        Label3: TLabel;
        Label30: TLabel;
        Label31: TLabel;
        Label4: TLabel;
        Label57: TLabel;
        Label60: TLabel;
        Label61: TLabel;
        Label62: TLabel;
        Label63: TLabel;
        Label64: TLabel;
        Label65: TLabel;
        Label66: TLabel;
        Label67: TLabel;
        Label68: TLabel;
        Label69: TLabel;
        Label70: TLabel;
        Label72: TLabel;
        Label73: TLabel;
        Label74: TLabel;
        Panel1: TPanel;
        Panel_Mantenimiento: TPanel;
        Panel_Mantenimiento1: TPanel;
        Panel_Mantenimiento2: TPanel;
        Panel_Mantenimiento3: TPanel;
        Shape2: TShape;
        Shape3: TShape;

        procedure Validacion( param_msg : TStrings );
        procedure DBNavigator_MargenesBeforeAction(Sender: TObject; Button: TDBNavButtonType);
        procedure Panel_Mantenimiento2Click(Sender: TObject);
        procedure Poner_Ultima_Compra;
        procedure OKButtonClick(Sender: TObject);
        function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
        procedure CancelButtonClick(Sender: TObject);
        procedure Presentar_Datos;
        procedure no_Tocar;
        procedure para_Empezar;
        procedure FormActivate(Sender: TObject);
        procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
        procedure FormCreate(Sender: TObject);
    private
        { private declarations }
        private_Salir_OK : Boolean;
    public
        { public declarations }
        public_Pulso_Aceptar : Boolean;
        public_Menu_Worked   : Integer;
        public_Solo_Ver      : Boolean;
        public_Record_Rgtro  : TRecord_Rgtro_Comun;
    end;

var
    form_articulos_002: Tform_articulos_002;

implementation

{$R *.lfm}

uses menu, articulos_000;

{ Tform_articulos_002 }

procedure Tform_articulos_002.FormActivate(Sender: TObject);
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

function Tform_articulos_002.Comprobar_No_Tocar( param_Reproducir_Mensajes,
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

procedure Tform_articulos_002.Validacion( param_msg : TStrings );
begin
    with form_articulos_000.SQLQuery_Articulos_Tarifas do
    begin
        // ************************************************************************************* //
        // ** Hay que poner un tipo de IMPORTE (o uno, o otro)                                ** //
        // ************************************************************************************* //
        if (FieldByName('Importe_Impuestos_Incluidos').IsNull) and
           (FieldByName('Importe_Neto').IsNull)                then
        begin
            param_msg.Add( ' ');
            param_msg.Add(rs_FormClose_1);
        end else begin
            if (not FieldByName('Importe_Impuestos_Incluidos').IsNull) and
               (not FieldByName('Importe_Neto').IsNull)                     then
            begin
                param_msg.Add( ' ');
                param_msg.Add(rs_FormClose_2);
            end;
        end;

      { if Trim(FieldByName('Descuento').AsString) = '' then
        begin
            param_msg.Add(rs_FormClose_3);
        end; }
    end;
end;

procedure Tform_articulos_002.FormClose(Sender: TObject; var CloseAction: TCloseAction);
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
        if form_Menu.public_Salir_OK = False then CloseAction := caNone;
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
            CloseAction := caNone;
        end else begin
            // var_msg.Free;
            CloseAction := caFree;
        end;
    end;

    var_msg.Free;
end;

procedure Tform_articulos_002.FormCreate(Sender: TObject);
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

procedure Tform_articulos_002.para_Empezar;
begin
    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
  { with form_articulos_000.SQLQuery_Articulos_Tarifas do
    begin
        public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                           '',
                                                           '',

                                                           FieldByName('OT_descripcion_tarifa').AsString,
                                                           '',
                                                           '' );
    end; }

    Presentar_Datos;
end;

procedure Tform_articulos_002.no_Tocar;
begin
    Panel_Mantenimiento.Enabled := False;
end;

procedure Tform_articulos_002.Poner_Ultima_Compra;
begin
    Edit_Compra_Ultima_Fecha.Text  := form_articulos_000.public_Compra_Ultima_Fecha;
    Edit_Compra_Ultimo_Precio.Text := form_articulos_000.public_Compra_Ultimo_Precio;
end;

procedure Tform_articulos_002.DBNavigator_MargenesBeforeAction(Sender: TObject;
  Button: TDBNavButtonType);
begin
    case Button of
        nbRefresh : begin
            form_articulos_000.Refrescar_Registros_Margenes;
            Abort;
        end;
    end;
end;

procedure Tform_articulos_002.Panel_Mantenimiento2Click(Sender: TObject);
begin

end;

procedure Tform_articulos_002.Presentar_Datos;
begin
    form_articulos_000.Refrescar_Registros_Margenes;

    WITH form_articulos_000.SQLQuery_Articulos DO
    BEGIN
        Edit_Descripcion_Impto_Ventas.Text := FieldByName('OT_descripcion_impto_ventas').AsString;
    END;

    Poner_Ultima_Compra;
end;

procedure Tform_articulos_002.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := true;
end;

procedure Tform_articulos_002.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := false;
end;

end.


