unit pedidos_ventas_003;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DBDateTimePicker, Forms, Controls, Graphics, Dialogs, ButtonPanel,
  ExtCtrls, StdCtrls, DbCtrls, Buttons, DBGrids, Grids, utilidades_datos_tablas, utilidades_general;

type

  { Tform_pedidos_ventas_003 }

  Tform_pedidos_ventas_003 = class(TForm)
    BitBtn_SALIR: TBitBtn;
    DBDateTimePicker_Fecha: TDBDateTimePicker;
    DBEdit_eMail1: TDBEdit;
    DBEdit_eMail3: TDBEdit;
    DBEdit_Pagina_Web1: TDBEdit;
    DBGrid_Detalles: TDBGrid;
    DBNavigator_Detalles: TDBNavigator;
    Edit_Descripcion_Almacen: TEdit;
    Edit_Descripcion_Cliente: TEdit;
    Edit_Descripcion_Empresa: TEdit;
    Edit_Descripcion_id_Vehiculos: TEdit;
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
    Label_Vehiculo: TLabel;

    procedure DBGrid_DetallesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBNavigator_DetallesBeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure BitBtn_SALIRClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure Presentar_Datos;
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
  form_pedidos_ventas_003: Tform_pedidos_ventas_003;

implementation

{$R *.lfm}

uses menu, pedidos_ventas_000;

{ Tform_pedidos_ventas_003 }

procedure Tform_pedidos_ventas_003.FormActivate(Sender: TObject);
begin
    // ********************************************************************************************* //
    // ** Si esta llamado desde otro modulo, le cambiamos el color de fondo                       ** //
    // ********************************************************************************************* //
    If form_pedidos_ventas_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;
end;

procedure Tform_pedidos_ventas_003.FormCreate(Sender: TObject);
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
    Label_Vehiculo.Visible                := false;
    Edit_Descripcion_id_Vehiculos.Visible := false;

    Label_Almacen.Visible                 := false;
    Edit_Descripcion_Almacen.Visible      := false;

    form_Menu.Traer_Configuracion_APP;
    if UpperCase(Trim(form_menu.public_User_Configuracion.Trabajar_Albaranes_con_Vehiculos_SN)) = 'S' then
    begin
        Label_Vehiculo.Visible                := true;
        Edit_Descripcion_id_Vehiculos.Visible := true;
    end;

    if UpperCase(Trim(form_menu.public_User_Configuracion.Albaranes_Obligar_Almacen_SN)) = 'S' then
    begin
        Label_Almacen.Visible            := true;
        Edit_Descripcion_Almacen.Visible := true;
    end;

    form_pedidos_ventas_000.Filtrar_Lineas_Detalles_Agrupadas_Por_Articulo;
end;

procedure Tform_pedidos_ventas_003.para_Empezar;
begin
    Presentar_Datos;
end;

procedure Tform_pedidos_ventas_003.Presentar_Datos;
begin
    with form_pedidos_ventas_000.SQLQuery_Pdo do
    begin
        Edit_Descripcion_id_Vehiculos.Text := FieldByName('OT_vehiculo_matricula').AsString;
        Edit_Descripcion_Almacen.Text      := FieldByName('OT_descripcion_almacen').AsString;
        Edit_Descripcion_Empresa.Text      := FieldByName('OT_descripcion_empresa').AsString;

        if Trim(FieldByName('nombre_propietario').AsString) <> '' then
        begin
           Edit_Descripcion_Cliente.Text := Trim(FieldByName('nombre_propietario').AsString);
        end else begin
           Edit_Descripcion_Cliente.Text := Trim(FieldByName('nombre_comercial').AsString);
        end;
    end;
end;

procedure Tform_pedidos_ventas_003.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
    if private_Salir_OK = False then
    begin
            // ************************************************************************************* //
            // ** Intento BitBtn_SALIR de la aplicación de un modo no permitido.                  ** //
            // ************************************************************************************* //
            // Pero si desde el menu principal está a true la variable                            ** //
            // public_Salir_Ok, significa que hay que salir si o si pues se pulsó                 ** //
            // cancelar al preguntar otra vez por la contraseña                                   ** //
            // ************************************************************************************* //
            if form_Menu.public_Salir_OK = False then CloseAction := caNone;
    end else begin
        // ************************************************************************************* //
        // ** Fue correcto el modo como quiere BitBtn_SALIR de la aplicación                  ** //
        // ************************************************************************************* //
    end;
end;

procedure Tform_pedidos_ventas_003.FormDestroy(Sender: TObject);
begin
    form_pedidos_ventas_000.Cerramos_Tabla_Detalles_Stock;
end;

procedure Tform_pedidos_ventas_003.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_pedidos_ventas_003.DBGrid_DetallesDrawColumnCell( Sender: TObject;
                                                                  const Rect: TRect;
                                                                  DataCol: Integer;
                                                                  Column: TColumn;
                                                                  State: TGridDrawState);
var var_Color_Normal : TColor;
begin
    with Sender as TDBGrid do
    begin
        if form_pedidos_ventas_000.SQLQuery_Pdo_Detalles_Stock.RecordCount = 0 then Exit;

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
            // ** No es una de las columnas a dibujar por lo que la pinto con los                 ** //
            // ** colores elegidos                                                                ** //
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
                if form_pedidos_ventas_000.SQLQuery_Pdo_Detalles_Stock.FieldByName('unidades').Value >
                   form_pedidos_ventas_000.SQLQuery_Pdo_Detalles_Stock.FieldByName('Stock').Value then
                begin
                     Canvas.StretchDraw(Rect, form_pedidos_ventas_000.Image_Candado.Picture.Graphic);
                end else begin
                    DefaultDrawColumnCell(Rect, DataCol, Column, State);
                end;
            end;
        end;

        Canvas.Font.Color := var_Color_Normal;
    end;
end;

procedure Tform_pedidos_ventas_003.DBNavigator_DetallesBeforeAction(Sender: TObject; Button: TDBNavButtonType);
begin
    case Button of
        nbRefresh : begin
            form_pedidos_ventas_000.Refrescar_Registros_Detalles_Stock;
            Abort;
        end;
    end;
end;

end.

