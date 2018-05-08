unit almacenes_movimientos_002;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DBDateTimePicker, Forms, Controls, Graphics, Dialogs, ButtonPanel,
  db, StdCtrls, DbCtrls, ExtCtrls, Buttons, utilidades_forms_Filtrar, utilidades_stock,
  utilidades_general, LCLTranslator;

resourcestring
  rs_Quitamos_1 = '¿QUITAMOS el ARTICULO';

  rs_FormClose_1 = '* El artículo.';
  rs_FormClose_2 = '* Del artículo ';
  rs_FormClose_3 = ' su stock actual en el almacén ';
  rs_FormClose_4 = ' es de ';
  rs_FormClose_5 = ', así que no puedo traspasar al almacén ';
  rs_FormClose_6 = ' la cantidad solicitada de ';
  rs_FormClose_7 = '* Las unidades ó cantidad.';

type

  { Tform_almacenes_movimientos_002 }

  Tform_almacenes_movimientos_002 = class(TForm)
    Boton_Elegir_Articulo: TBitBtn;
    ButtonPanel1: TButtonPanel;
    DBDateTimePicker_Fecha_Movimiento: TDBDateTimePicker;
    DBEdit_Direccion_Numero: TDBEdit;
    DBEdit_eMail1: TDBEdit;
    DBRadioGroup_Tipo_Cuenta: TDBRadioGroup;
    Edit_Descripcion_Almacen_Destino: TEdit;
    Edit_Descripcion_Almacen_Origen: TEdit;
    Edit_Descripcion_Articulo: TEdit;
    Edit_Descripcion_Concepto: TEdit;
    GroupBox11: TGroupBox;
    Label1: TLabel;
    Label16: TLabel;
    Label6: TLabel;
    Label62: TLabel;
    Label64: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    Panel_Mantenimiento: TPanel;
    Panel_Tipo_Movimiento: TPanel;

    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure Validacion( param_msg : TStrings );

    procedure para_Empezar;
    procedure FormCreate(Sender: TObject);
    procedure no_Tocar;
    function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure Presentar_Datos;
    procedure Boton_Elegir_ArticuloClick(Sender: TObject);
    procedure Edit_Descripcion_ArticuloClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
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
  form_almacenes_movimientos_002: Tform_almacenes_movimientos_002;

implementation

{$R *.lfm}

uses menu, almacenes_movimientos_000, almacenes_movimientos_001;

{ Tform_almacenes_movimientos_002 }

procedure Tform_almacenes_movimientos_002.Boton_Elegir_ArticuloClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_almacenes_movimientos_000.SQLQuery_AMD do
    begin
        var_Registro := UTI_Abrir_Form( true, false, '', 170 );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_articulos').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Articulo.Text       := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_almacenes_movimientos_002.Edit_Descripcion_ArticuloClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add(rs_Quitamos_1);
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_almacenes_movimientos_000.SQLQuery_AMD.FieldByName('id_articulos').Clear;
         Edit_Descripcion_Articulo.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_almacenes_movimientos_002.FormActivate(Sender: TObject);
begin
    If form_almacenes_movimientos_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    Comprobar_No_Tocar(true, true);
end;

function Tform_almacenes_movimientos_002.Comprobar_No_Tocar( param_Reproducir_Mensajes,
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

procedure Tform_almacenes_movimientos_002.FormClose(Sender: TObject; var CloseAction: TCloseAction);
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

procedure Tform_almacenes_movimientos_002.Validacion( param_msg : TStrings );
var var_Stock_Articulo : TStock_Traerlo;
begin
    with form_almacenes_movimientos_000.SQLQuery_AMD do
    begin
        if Trim(FieldByName('id_articulos').AsString) = '' then
        begin
            param_msg.Add(rs_FormClose_1);
        end else begin
            // ********************************************************************************* //
            // ** Solo si es un artículo y está puesto el almacén se comprobará si existe el  ** //
            // ** stock en los almacenes                                                      ** //
            // ********************************************************************************* //
            if not form_almacenes_movimientos_000.SQLQuery_AM.FieldByName('id_almacenes_origen').IsNull then
            begin
                if FieldByName('OT_Tipo_de_articulo').Value = 0 then
                begin
                    // ************************************************************************* //
                    // ** Solo si se trata de un artículo para stock                          ** //
                    // ************************************************************************* //
                    var_Stock_Articulo := UTI_STOCK_Traer_Stock_Articulo( FieldByName('id_articulos').AsString,
                                                                          form_almacenes_movimientos_000.SQLQuery_AM.FieldByName('id_almacenes_origen').AsString );
                    if State = dsEdit then
                    begin
                        // ********************************************************************* //
                        // ** Si es una edición al stock devuelto hay que añadirle el valor   ** //
                        // ** anterior de Unidades(el que tenía antes de intentar modificar el** //
                        // ** rgtro)                                                          ** //
                        // ********************************************************************* //
                        var_Stock_Articulo.Stock := var_Stock_Articulo.Stock +
                                                    Params.ParamByName('COPY_Unidades').Value;
                    end;

                    if var_Stock_Articulo.Stock < FieldByName('Unidades').Value then
                    begin
                        param_msg.Add( rs_FormClose_2 + Trim(Edit_Descripcion_Articulo.Text) +
                                     rs_FormClose_3  +
                                     Trim(Edit_Descripcion_Almacen_Origen.Text) +
                                     rs_FormClose_4 + FloatToStr(var_Stock_Articulo.Stock) +
                                     rs_FormClose_5 +
                                     Trim(Edit_Descripcion_Almacen_Destino.Text) +
                                     rs_FormClose_6 +
                                     FieldByName('Unidades').AsString + '.' );
                    end;
                end;
            end;
        end;

        if Trim(FieldByName('Unidades').AsString) = '' then
        begin
            param_msg.Add(rs_FormClose_7);
        end;
    end;
end;

procedure Tform_almacenes_movimientos_002.para_Empezar;
begin
    { ****************************************************************************
      Solo para formularios que traten con datos
      **************************************************************************** }
      with form_almacenes_movimientos_000.SQLQuery_AMD do
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

procedure Tform_almacenes_movimientos_002.Presentar_Datos;
begin
    with form_almacenes_movimientos_000.SQLQuery_AMD do
    begin
        Edit_Descripcion_Articulo.Text        := FieldByName('OT_descripcion_articulo').AsString;
        Edit_Descripcion_Almacen_Destino.Text := form_almacenes_movimientos_001.Edit_Descripcion_Almacen_Destino.Text;
        Edit_Descripcion_Almacen_Origen.Text  := form_almacenes_movimientos_001.Edit_Descripcion_Almacen_Origen.Text;
        Edit_Descripcion_Concepto.Text        := form_almacenes_movimientos_001.Edit_Descripcion_Concepto.Text;
    end;
end;

procedure Tform_almacenes_movimientos_002.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := True;
    public_Pulso_Aceptar := true;
end;

procedure Tform_almacenes_movimientos_002.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := True;
    public_Pulso_Aceptar := false;
end;

procedure Tform_almacenes_movimientos_002.no_Tocar;
begin
    Panel_Mantenimiento.Enabled := False;
end;

procedure Tform_almacenes_movimientos_002.FormCreate(Sender: TObject);
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
    { **************************************************************************** }

    { ****************************************************************************
      Solo para formularios que traten con datos
      **************************************************************************** }
      public_Solo_Ver := false;
end;

end.


