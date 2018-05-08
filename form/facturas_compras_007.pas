unit facturas_compras_007;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DBDateTimePicker, Forms, Controls, Graphics, Dialogs, ButtonPanel,
  StdCtrls, DbCtrls, ExtCtrls, utilidades_forms_Filtrar, utilidades_general;

type

  { Tform_facturas_compras_007 }

  Tform_facturas_compras_007 = class(TForm)
    ButtonPanel1: TButtonPanel;
    DBDateTimePicker_Fecha: TDBDateTimePicker;
    DBDateTimePicker_Fecha_Movimiento_Detalle: TDBDateTimePicker;
    DBDateTimePicker_Fecha_Movimiento_Detalle1: TDBDateTimePicker;
    DBDateTimePicker_Fecha_Movimiento_Detalle2: TDBDateTimePicker;
    DBEdit_Codigo: TDBEdit;
    DBEdit_Numero: TDBEdit;
    DBEdit_PVP: TDBEdit;
    DBEdit_PVP1: TDBEdit;
    DBEdit_Serie: TDBEdit;
    DBMemo_Descripcion: TDBMemo;
    Edit_Descripcion_Almacen1: TEdit;
    Edit_Descripcion_Empresa: TEdit;
    Edit_Descripcion_Proveedor: TEdit;
    GroupBox_Serie_Numero: TGroupBox;
    Label1: TLabel;
    Label103: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label50: TLabel;
    Label62: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label74: TLabel;
    Label76: TLabel;
    Label80: TLabel;
    Label82: TLabel;
    Label_Almacen: TLabel;
    Label_Fecha3: TLabel;
    Panel1: TPanel;
    Panel_Mantenimiento: TPanel;

    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure Presentar_Datos;
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure para_Empezar;
    function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
    procedure no_Tocar;
    procedure FormActivate(Sender: TObject);
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
  form_facturas_compras_007: Tform_facturas_compras_007;

implementation

{$R *.lfm}

uses menu, facturas_compras_000, facturas_compras_001;

{ Tform_facturas_compras_007 }

procedure Tform_facturas_compras_007.FormActivate(Sender: TObject);
begin
  If form_facturas_compras_000.public_Elegimos = true then
  begin
       with Self do
       begin
            Color := $00B9959C;
       end;
  end;

  Comprobar_No_Tocar(true, true);
end;

procedure Tform_facturas_compras_007.FormCreate(Sender: TObject);
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
    // ** Solo para este modulo                                                                   ** //
    // ********************************************************************************************* //
    Label_Almacen.Visible             := false;
    Edit_Descripcion_Almacen1.Visible := false;
    Label_Almacen.Visible             := false;

    form_Menu.Traer_Configuracion_APP;
    if UpperCase(Trim(form_menu.public_User_Configuracion.Albaranes_Obligar_Almacen_SN)) = 'S' then
    begin
        Label_Almacen.Visible             := true;
        Edit_Descripcion_Almacen1.Visible := true;
    end;
end;

function Tform_facturas_compras_007.Comprobar_No_Tocar( param_Reproducir_Mensajes,
                                                        param_Ejecutar_No_Tocar : Boolean ) : Boolean;
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    Result  := false;

    // ********************************************************************************************* //
    // ** Si se llamó para solo verlo, pues no se puede tocar                                     ** //
    // ********************************************************************************************* //
    if public_Solo_Ver = true then
    begin
        Result := true;
        if param_Ejecutar_No_Tocar = true then no_Tocar;
    end;

    // ********************************************************************************************* //
    // ** Si la línea de detalle ya estaba borrada, no permitimos hacer nada con ella.            ** //
    // ********************************************************************************************* //
    if not form_facturas_compras_000.SQLQuery_Ftra_Rcbos.FieldByName('Del_WHEN').IsNull then
    begin
        Result := true;

        if param_Reproducir_Mensajes = true then
        begin
            var_msg.Add( '* Es un recibo borrado, no se puede modificar nada de el. Si desea modificarlo, primero hay que darlo de alta anteriormente.' );
        end;

        if param_Ejecutar_No_Tocar = true then no_Tocar;
    end;

    // ********************************************************************************************* //
    // ** Si se creó un nuevo mensaje a presentar, lo hacemos                                     ** //
    // ********************************************************************************************* //
    if Trim(var_msg.Text) <> '' then
    begin
        UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
    end;

    var_msg.Free;
end;

procedure Tform_facturas_compras_007.para_Empezar;
begin
    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    with form_facturas_compras_000.SQLQuery_Ftra_Rcbos do
    begin
        public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                           '',
                                                           '',
                                                           '',
                                                           '',
                                                           '' );
    end;

    Presentar_Datos;
end;

procedure Tform_facturas_compras_007.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := true;
end;

procedure Tform_facturas_compras_007.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := false;
end;

procedure Tform_facturas_compras_007.Presentar_Datos;
begin
    with form_facturas_compras_000.SQLQuery_Ftra do
    begin
        if FieldByName('Tipo').AsString = 'F' then
        begin
            // ************************************************************************************* //
            // ** Es una factura                                                                  ** //
            // ************************************************************************************* //
            DBEdit_Serie.Color       := $006AD3D7;
            DBEdit_Numero.Color      := $006AD3D7;

            DBEdit_Serie.Font.Color  := clRed;
            DBEdit_Numero.Font.Color := clRed;
        end else begin
            // ************************************************************************************* //
            // ** Es un abono                                                                     ** //
            // ************************************************************************************* //
            DBEdit_Serie.Color       := $007549F8;
            DBEdit_Numero.Color      := $007549F8;

            DBEdit_Serie.Font.Color  := clBlack;
            DBEdit_Numero.Font.Color := clBlack;
        end;

        Edit_Descripcion_Proveedor.Text    := form_facturas_compras_001.Edit_Descripcion_Proveedor.Text;
        Edit_Descripcion_Almacen1.Text     := form_facturas_compras_001.Edit_Descripcion_Almacen.Text;
        Edit_Descripcion_Empresa.Text      := form_facturas_compras_001.Edit_Descripcion_Empresa.Text;
    end;
end;

procedure Tform_facturas_compras_007.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg             : TStrings;
    var_msg_sin_Obligar : TStrings;
begin
    ButtonPanel1.SetFocus; // Con esto consigo que salga del campo que este y pueda actualizarlo

    var_msg             := TStringList.Create;
    var_msg_sin_Obligar := TStringList.Create;

    if public_Pulso_Aceptar = true then
    begin
        with form_facturas_compras_000.SQLQuery_Ftra_Rcbos do
        begin
            // ************************************************************************************* //
            // ** Hay que poner el importe del recibo                                             ** //
            // ************************************************************************************* //
            if FieldByName('importe').IsNull then
            begin
                var_msg.Add( '* El importe del recibo.');
            end;

            // ************************************************************************************* //
            // ** Hay que poner el vencimiento del recibo                                         ** //
            // ************************************************************************************* //
            if FieldByName('fecha_vencimiento').IsNull then
            begin
                var_msg.Add( '* El vencimiento del recibo.');
            end else begin
                // ********************************************************************************* //
                // ** El vencimiento no puede ser menor que la fecha de expedición                ** //
                // ********************************************************************************* //
                if FieldByName('fecha_vencimiento').Value < FieldByName('fecha_expedicion').Value then
                begin
                    var_msg.Add( '* El vencimiento no puede ser menor que su fecha de expedición.');
                end;
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
        if form_Menu.public_Salir_OK = False then CloseAction := caNone;
    end else begin
        // ***************************************************************************************** //
        // ** Fue correcto el modo como quiere salir de la aplicación                             ** //
        // ***************************************************************************************** //
        // ** Comprobaremos si no se generó algún error por falta de completar algun campo y si se** //
        // ** salió con el botón Ok o Cancel                                                      ** //
        // ***************************************************************************************** //
        if (Trim(var_msg_sin_Obligar.Text) <> '') and (public_Pulso_Aceptar = true) then
        begin
             UTI_GEN_Aviso(false, var_msg_sin_Obligar, 'No es obligatorio pero falta', True, False);
        end;

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
    var_msg_sin_Obligar.Free;
end;

procedure Tform_facturas_compras_007.no_Tocar;
begin
    Panel_Mantenimiento.Enabled := False;
end;


end.

