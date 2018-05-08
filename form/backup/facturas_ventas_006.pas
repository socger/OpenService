unit facturas_ventas_006;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Buttons, StdCtrls, DBGrids,
  DbCtrls, Grids, utilidades_general;

type

  { Tform_facturas_ventas_006 }

  Tform_facturas_ventas_006 = class(TForm)
    BitBtn_SALIR: TBitBtn;
    BitBtn_Seleccionar: TBitBtn;
    DBGrid_Principal: TDBGrid;
    DBNavigator_Detalles: TDBNavigator;
    Edit_Descripcion_Empresa: TEdit;
    Edit_id_Empresas: TEdit;
    Label75: TLabel;
    Label82: TLabel;

    procedure BitBtn_SALIRClick(Sender: TObject);
    procedure BitBtn_SeleccionarClick(Sender: TObject);
    procedure DBGrid_PrincipalDblClick(Sender: TObject);
    procedure DBGrid_PrincipalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBNavigator_DetallesBeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure para_Empezar;
    procedure Presentar_Datos;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { private declarations }
    private_Salir_OK : Boolean;
  public
    { public declarations }
    public_Rgtro_Seleccionado : Boolean;
  end;

var
  form_facturas_ventas_006: Tform_facturas_ventas_006;

implementation

{$R *.lfm}

uses menu, facturas_ventas_000;

{ Tform_facturas_ventas_006 }

procedure Tform_facturas_ventas_006.FormActivate(Sender: TObject);
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

procedure Tform_facturas_ventas_006.FormCreate(Sender: TObject);
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
    public_Rgtro_Seleccionado := false;

    // ********************************************************************************************* //
    // ** Solo para este modulo                                                                   ** //
    // ********************************************************************************************* //
end;

procedure Tform_facturas_ventas_006.para_Empezar;
begin
    Presentar_Datos;
end;

procedure Tform_facturas_ventas_006.Presentar_Datos;
begin
    with form_facturas_ventas_000.SQLQuery_Ftra_Borradas do
    begin
    end;
end;

procedure Tform_facturas_ventas_006.FormClose(Sender: TObject; var CloseAction: TCloseAction);
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

procedure Tform_facturas_ventas_006.BitBtn_SALIRClick(Sender: TObject);
begin
    private_Salir_OK := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}

    Close;
end;

procedure Tform_facturas_ventas_006.BitBtn_SeleccionarClick(Sender: TObject);
begin
    private_Salir_OK          := true;  { La pongo a true para controlar el modo de BitBtn_SALIR del programa}
    public_Rgtro_Seleccionado := true;
    Close;
end;

procedure Tform_facturas_ventas_006.DBGrid_PrincipalDblClick(Sender: TObject);
begin
    if BitBtn_Seleccionar.Visible = true then
    begin
        BitBtn_SeleccionarClick(Nil);
    end;
end;

procedure Tform_facturas_ventas_006.DBGrid_PrincipalDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var var_Color_Font  : TColor;
    var_Color_Brush : TColor;
begin
    // var_Color_Font  := clBlack;
    // var_Color_Brush := $006AD3D7;

    with Sender as TDBGrid do
    begin
        var_Color_Font  := Canvas.Font.Color;
        var_Color_Brush := Canvas.Brush.Color;

            // ********************************************************************************* //
            // ** Registro DADO de ALTA, NO BAJA                                              ** //
            // ********************************************************************************* //
            // ** Así que las pinto, pero sólo si no son las columnas que van a               ** //
            // ** ser dibujadas                                                               ** //
            // ********************************************************************************* //
            if State <> [gdSelected] then
            begin
                if (Column.FieldName <> 'Columna_con_Imagen') then
                begin
                    Canvas.Font.Color := clBlack;
                end;
            end;

        // ***************************************************************************************** //
        // ** Comprobamos si es un registro dado de baja o no, para ponerle un tipo de color al   ** //
        // ** FONT u otro, según esté dada debaja o no                                            ** //
        // ***************************************************************************************** //
        if form_facturas_ventas_000.SQLQuery_Ftra_Borradas.FieldByName('Tipo').AsString = 'F' then
        begin
            // ************************************************************************************* //
            // ** Es una factura                                                                  ** //
            // ************************************************************************************* //
            Canvas.Brush.Color := var_Color_Brush;
        end else begin
            // ************************************************************************************* //
            // ** Es un abono                                                                     ** //
            // ************************************************************************************* //
            Canvas.Brush.Color := $007549F8;
        end;

        Canvas.fillrect(rect);

        // ***************************************************************************************** //
        // ** Ahora paso a dibujar una celda normal con los colores elegidos o una                ** //
        // ** dibujada                                                                            ** //
        // ***************************************************************************************** //
        if (Column.FieldName <> 'Columna_con_Imagen') then
        begin
            // ********************************************************************************* //
            // ** No es una de las columnas a dibujar por lo que la pinto con los             ** //
            // ** colores elegidos                                                            ** //
            // ********************************************************************************* //
            DefaultDrawColumnCell(Rect, DataCol, Column, State)
        end else begin
            // ********************************************************************************* //
            // ** Es una de las columnas a dibujar                                            ** //
            // ********************************************************************************* //
            // ** COLUMNA CONFIRMADA                                                          ** //
            // ********************************************************************************* //
            if Column.FieldName = 'Columna_con_Imagen'  then
            begin
              { if not form_facturas_ventas_000.SQLQuery_Ftra_Detalles.FieldByName('Serie_Albaran').IsNull then
                     Canvas.StretchDraw(Rect, form_facturas_ventas_000.Image_Convertida.Picture.Graphic)
                else DefaultDrawColumnCell(Rect, DataCol, Column, State); }
            end;
        end;

        Canvas.Font.Color  := var_Color_Font;
        Canvas.Brush.Color := var_Color_Brush;
    end;
end;

procedure Tform_facturas_ventas_006.DBNavigator_DetallesBeforeAction(Sender: TObject; Button: TDBNavButtonType);
begin
    case Button of
        nbRefresh : begin
            form_facturas_ventas_000.Refrescar_Registros_Ftras_Borradas;
            Abort;
        end;
    end;
end;

end.


