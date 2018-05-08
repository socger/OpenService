unit facturas_ventas_003;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DBDateTimePicker, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DbCtrls, Buttons, DBGrids, Grids, utilidades_general;

type

  { Tform_facturas_ventas_003 }

  Tform_facturas_ventas_003 = class(TForm)
    BitBtn_SALIR: TBitBtn;
    DBDateTimePicker_Fecha: TDBDateTimePicker;
    DBEdit_eMail1: TDBEdit;
    DBEdit_Serie: TDBEdit;
    DBEdit_Numero: TDBEdit;
    DBGrid_Detalles: TDBGrid;
    DBNavigator_Detalles: TDBNavigator;
    Edit_Descripcion_Almacen: TEdit;
    Edit_Descripcion_Cliente: TEdit;
    Edit_Descripcion_Empresa: TEdit;
    GroupBox_Serie_Numero: TGroupBox;
    Label103: TLabel;
    Label50: TLabel;
    Label62: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label78: TLabel;
    Label_Almacen: TLabel;
    Label82: TLabel;

    procedure BitBtn_SALIRClick(Sender: TObject);
    procedure DBGrid_DetallesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBNavigator_DetallesBeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure Presentar_Datos;
    procedure FormDestroy(Sender: TObject);
    procedure para_Empezar;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { private declarations }
    private_Salir_OK : Boolean;
  public
    { public declarations }
  end;

var
  form_facturas_ventas_003: Tform_facturas_ventas_003;

implementation

{$R *.lfm}

uses menu, facturas_ventas_000;

{ Tform_facturas_ventas_003 }

procedure Tform_facturas_ventas_003.FormActivate(Sender: TObject);
begin
    // ********************************************************************************************* //
    // ** Si esta llamado desde otro modulo, le cambiamos el color de fondo                       ** //
    // ********************************************************************************************* //
    If form_facturas_ventas_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;
end;

procedure Tform_facturas_ventas_003.FormCreate(Sender: TObject);
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
    // public_Solo_Ver := false;

    // ********************************************************************************************* //
    // ** Solo para este modulo                                                                   ** //
    // ********************************************************************************************* //
    Label_Almacen.Visible                 := false;
    Edit_Descripcion_Almacen.Visible      := false;

    form_Menu.Traer_Configuracion_APP;
    if UpperCase(Trim(form_menu.public_User_Configuracion.Albaranes_Obligar_Almacen_SN)) = 'S' then
    begin
        Label_Almacen.Visible            := true;
        Edit_Descripcion_Almacen.Visible := true;
    end;
end;

procedure Tform_facturas_ventas_003.para_Empezar;
begin
    Presentar_Datos;
end;

procedure Tform_facturas_ventas_003.FormDestroy(Sender: TObject);
begin
    form_facturas_ventas_000.Cerramos_Tabla_Detalles_Stock;
end;

procedure Tform_facturas_ventas_003.Presentar_Datos;
begin
    with form_facturas_ventas_000.SQLQuery_Ftra do
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

        Edit_Descripcion_Almacen.Text := FieldByName('OT_descripcion_almacen').AsString;
        Edit_Descripcion_Empresa.Text := FieldByName('OT_descripcion_empresa').AsString;

        if Trim(FieldByName('nombre_propietario').AsString) <> '' then
        begin
           Edit_Descripcion_Cliente.Text := Trim(FieldByName('nombre_propietario').AsString);
        end else begin
           Edit_Descripcion_Cliente.Text := Trim(FieldByName('nombre_comercial').AsString);
        end;
    end;
end;

procedure Tform_facturas_ventas_003.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
    if private_Salir_OK = False then
    begin
        // ***************************************************************************************** //
        // ** Intento BitBtn_SALIR de la aplicación de un modo no permitido.                      ** //
        // ***************************************************************************************** //
        // ** Pero si desde el menu principal está a true la variable public_Salir_Ok, significa  ** //
        // ** que hay que salir si o si se pulsó cancelar al preguntar otra vez por la contraseña ** //
        // ***************************************************************************************** //
        if form_Menu.public_Salir_OK = False then
        begin
            CloseAction := CloseAction.caNone;
        end;
    end else begin
        // ***************************************************************************************** //
        // ** Fue correcto el modo como quiere BitBtn_SALIR de la aplicación                      ** //
        // ***************************************************************************************** //
    end;
end;

procedure Tform_facturas_ventas_003.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_facturas_ventas_003.DBGrid_DetallesDrawColumnCell( Sender: TObject;
                                                                   const Rect: TRect;
                                                                   DataCol: Integer;
                                                                   Column: TColumn;
                                                                   State: TGridDrawState);
var var_Color_Normal : TColor;
begin
    with Sender as TDBGrid do
    begin
        if form_facturas_ventas_000.SQLQuery_Ftra_Detalles_Stock.RecordCount = 0 then Exit;

        var_Color_Normal := Canvas.Brush.Color;

        // ***************************************************************************************** //
        // ** Registro DADO de ALTA, NO BAJA                                                      ** //
        // ***************************************************************************************** //
        // ** Así que las pinto, pero sólo si no son las columnas que van a                       ** //
        // ** ser dibujadas                                                                       ** //
        // ***************************************************************************************** //
        if State <> [gdSelected] then
        begin
            if (Column.FieldName <> 'sin_Stock') then
            begin
                Canvas.font.Color := clBlack;
            end;
        end;

        // ***************************************************************************************** //
        // ** Ahora paso a dibujar una celda normal con los colores elegidos o una                ** //
        // ** dibujada                                                                            ** //
        // ***************************************************************************************** //
        if (Column.FieldName <> 'sin_Stock') then
        begin
            // ************************************************************************************* //
            // ** No es una de las columnas a dibujar por lo que la pinto con los colores elegidos** //
            // ************************************************************************************* //
            DefaultDrawColumnCell(Rect, DataCol, Column, State)
        end else begin
            // ************************************************************************************* //
            // ** Es una de las columnas a dibujar                                                ** //
            // ************************************************************************************* //
            // ** COLUMNA CONFIRMADA                                                              ** //
            // ************************************************************************************* //
            if Column.FieldName = 'sin_Stock'  then
            begin
    	        if form_facturas_ventas_000.SQLQuery_Ftra_Detalles_Stock.FieldByName('OT_Stock_Resultado').Value < 0 then
                begin
                    Canvas.StretchDraw(Rect, form_facturas_ventas_000.Image_Candado.Picture.Graphic);
                end else begin
                    DefaultDrawColumnCell(Rect, DataCol, Column, State);
                end;
            end;
        end;

        Canvas.Font.Color := var_Color_Normal;
    end;
end;

procedure Tform_facturas_ventas_003.DBNavigator_DetallesBeforeAction(Sender: TObject; Button: TDBNavButtonType);
begin
    case Button of
        nbRefresh : begin
            form_facturas_ventas_000.Refrescar_Registros_Detalles_Stock;
            Abort;
        end;
    end;
end;

end.

