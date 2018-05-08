unit recibos_003;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DBDateTimePicker, Forms, Controls, Graphics, Dialogs, ButtonPanel,
  db, StdCtrls, DbCtrls, ExtCtrls, Buttons, utilidades_forms_Filtrar, utilidades_general,
  utilidades_lineas_detalle, utilidades_ventas, utilidades_datos_tablas;

type

  { Tform_recibos_003 }

  Tform_recibos_003 = class(TForm)
    Boton_Elegir_Almacen: TBitBtn;
    Boton_Elegir_Articulo: TBitBtn;
    Boton_Elegir_Impuesto: TBitBtn;
    ButtonPanel1: TButtonPanel;
    DBCheckBox_Estudia_SN: TDBCheckBox;
    DBDateTimePicker_Fecha_Movimiento2: TDBDateTimePicker;
    DBDateTimePicker_Fecha_Movimiento3: TDBDateTimePicker;
    DBDateTimePicker_Fecha_Nacimiento: TDBDateTimePicker;
    DBEdit_a_quien_facturamos: TDBEdit;
    DBEdit_a_quien_facturamos1: TDBEdit;
    DBEdit_a_quien_facturamos2: TDBEdit;
    DBEdit_a_quien_facturamos3: TDBEdit;
    DBEdit_Concepto_Manual: TDBEdit;
    DBEdit_Descuento_Comercial_1: TDBEdit;
    DBEdit_Descuento_Comercial_2: TDBEdit;
    DBEdit_Descuento_Comercial_3: TDBEdit;
    DBEdit_Descuento_Comercial_4: TDBEdit;
    DBEdit_eMail1: TDBEdit;
    DBEdit_eMail3: TDBEdit;
    DBEdit_Pagina_Web1: TDBEdit;
    DBEdit_PVP: TDBEdit;
    DBEdit_PVP3: TDBEdit;
    DBEdit_PVP4: TDBEdit;
    DBEdit_PVP_con_Impuestos: TDBEdit;
    DBEdit_Repetir_Cada: TDBEdit;
    Edit_Calculo_Importe_menos_Descuento: TEdit;
    Edit_Descripcion_Almacen: TEdit;
    Edit_Descripcion_Articulo: TEdit;
    Edit_Descripcion_Impuesto: TEdit;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    GroupBox12: TGroupBox;
    GroupBox_Internet1: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label6: TLabel;
    Label62: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label68: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Panel1: TPanel;
    Panel_Mantenimiento: TPanel;

    procedure Calcular_Importe_menos_Descuento;
    procedure Presentar_Datos;
    function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
    procedure Boton_Elegir_AlmacenClick(Sender: TObject);
    procedure Boton_Elegir_ArticuloClick(Sender: TObject);
    procedure Boton_Elegir_ImpuestoClick(Sender: TObject);
    procedure DBEdit_Descuento_Comercial_1Exit(Sender: TObject);
    procedure DBEdit_Descuento_Comercial_2Exit(Sender: TObject);
    procedure DBEdit_PVP3Exit(Sender: TObject);
    procedure DBEdit_PVP4Exit(Sender: TObject);
    procedure DBEdit_PVPExit(Sender: TObject);
    procedure DBEdit_PVP_con_ImpuestosExit(Sender: TObject);
    procedure Edit_Descripcion_AlmacenClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure no_Tocar;
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure para_Empezar;
    procedure Edit_Descripcion_ArticuloClick(Sender: TObject);
    procedure Edit_Descripcion_ImpuestoClick(Sender: TObject);
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
  form_recibos_003: Tform_recibos_003;

implementation

{$R *.lfm}

uses menu, recibos_000;

{ Tform_recibos_003 }

procedure Tform_recibos_003.FormActivate(Sender: TObject);
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

function Tform_recibos_003.Comprobar_No_Tocar( param_Reproducir_Mensajes,
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

procedure Tform_recibos_003.Edit_Descripcion_ArticuloClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS el ARTICULO?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_recibos_000.SQLQuery_Alb_Detalles.FieldByName('id_articulos').Clear;
         Edit_Descripcion_Articulo.Text   := '';

         DBEdit_Concepto_Manual.Color     := clDefault;
         DBEdit_Concepto_Manual.ReadOnly  := false;
    end;
    var_msg.Free;
end;

procedure Tform_recibos_003.Edit_Descripcion_ImpuestoClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS el IMPUESTO?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_recibos_000.SQLQuery_Alb_Detalles.FieldByName('id_impuestos_Ventas').Clear;
         Edit_Descripcion_Impuesto.Text := '';

         Calcular_Importe_menos_Descuento;
    end;
    var_msg.Free;
end;

procedure Tform_recibos_003.FormCreate(Sender: TObject);
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

procedure Tform_recibos_003.para_Empezar;
begin
    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    with form_recibos_000.SQLQuery_Alb_Detalles do
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

procedure Tform_recibos_003.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := true;
end;

procedure Tform_recibos_003.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := false;
end;

procedure Tform_recibos_003.no_Tocar;
begin
    Panel_Mantenimiento.Enabled := False;
end;

procedure Tform_recibos_003.Boton_Elegir_ArticuloClick(Sender: TObject);
var var_Registro          : TRecord_Rgtro_Comun;
    var_Registro_Articulo : TArticulos;
begin
    with form_recibos_000.SQLQuery_Alb_Detalles do
    begin
        var_Registro := UTI_Abrir_Form( true, false, '', 170 );
        if var_Registro.id_1 <> '' then
        begin
            FieldByName('id_articulos').AsString := Trim(var_Registro.id_1);
            Edit_Descripcion_Articulo.Text       := var_Registro.descripcion_2;

            var_Registro_Articulo := UTI_DATOS_TABLA_Traer_Articulos_xID( Trim(var_Registro.id_1) );

            if var_Registro_Articulo.id <> '0' then
            begin
                 FieldByName('Repetir_Cada').AsString            := var_Registro_Articulo.Repetir_Cada;
                 FieldByName('PVP').AsString                     := var_Registro_Articulo.PVP;
                 FieldByName('PVP_Impuestos_Incluidos').AsString := var_Registro_Articulo.PVP_Impuestos_Incluidos;
                 FieldByName('id_impuestos_Ventas').AsString     := var_Registro_Articulo.id_impuestos_Ventas;
                 Edit_Descripcion_Impuesto.Text                  := var_Registro_Articulo.OT_descripcion_impto_ventas;
            end;

            Calcular_Importe_menos_Descuento;

            DBEdit_Concepto_Manual.Color    := $006AD3D7;
            DBEdit_Concepto_Manual.ReadOnly := true;

            FieldByName('descripcion').Clear;
            FieldByName('descripcion_para_TPV').Clear;
        end else begin
            DBEdit_Concepto_Manual.Color    := clDefault;
            DBEdit_Concepto_Manual.ReadOnly := false;
        end;
    end;
end;

procedure Tform_recibos_003.Boton_Elegir_ImpuestoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_recibos_000.SQLQuery_Alb_Detalles do
    begin
        var_Registro := UTI_Abrir_Form( true, false, '', 200 );
        if var_Registro.id_1 <> '' then
        begin
            FieldByName('id_impuestos_Ventas').AsString := Trim(var_Registro.id_1);
            Edit_Descripcion_Impuesto.Text              := var_Registro.descripcion_1;

            Calcular_Importe_menos_Descuento;
        end;
    end;
end;

procedure Tform_recibos_003.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg : TStrings;
begin
    ButtonPanel1.SetFocus; // Con esto consigo que salga del campo que este y pueda actualizarlo

    var_msg := TStringList.Create;

    if public_Pulso_Aceptar = true then
    begin
        with form_recibos_000.SQLQuery_Alb_Detalles do
        begin
            // ************************************************************************************* //
            // ** Tengo que obligadamente o poner un artículo o poner una descripción manualmente ** //
            // ************************************************************************************* //
            if Trim(FieldByName('id_articulos').AsString) = '' then
            begin
                if Trim(FieldByName('descripcion_para_TPV').AsString) = '' then
                begin
                    var_msg.Add( '* El artículo o el concepto manual.');
                end;
            end else begin
                if Trim(FieldByName('descripcion_para_TPV').AsString) <> '' then
                begin
                    var_msg.Add( '* El artículo o el concepto manual.');
                end;
            end;

            // ************************************************************************************* //
            // ** Hay que poner un tipo de PVP (o uno, o otro)                                    ** //
            // ************************************************************************************* //
            if (FieldByName('PVP_Impuestos_Incluidos').IsNull) and
               (FieldByName('PVP').IsNull)                     then
            begin
                var_msg.Add( '* Uno de los dos PVP.');
            end else begin
                if (not FieldByName('PVP_Impuestos_Incluidos').IsNull) and
                   (not FieldByName('PVP').IsNull)                     then
                begin
                    var_msg.Add( '* Sólo uno de los dos PVP.');
                end;
            end;

            if FieldByName('OT_Tipo_de_articulo').Value = '0' then
            begin
                // ********************************************************************************* //
                // ** Si es un articulo con stock a controlar que pida obligado las unidades, el  ** //
                // ** almacen y la fecha del movimiento                                           ** //
                // ********************************************************************************* //
                var_msg.Add( '* Es un artículo para controlar su stock, así que ... ');

                if ( Trim(FieldByName('Unidades').AsString) = ''  ) or
                   ( Trim(FieldByName('Unidades').AsString) = '0' ) then
                begin
                    var_msg.Add( '    + nos falta la cantidad / peso / volumen.');
                end;

                if Trim(FieldByName('id_almacenes').AsString) = '' then
                begin
                    var_msg.Add( '    + nos falta el almacén.');
                end;

                if Trim(FieldByName('Fecha_Movimiento').AsString) = '' then
                begin
                    var_msg.Add( '    + nos falta la fecha.');
                end;
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
            if form_Menu.public_Salir_OK = False then CloseAction := caNone;
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
                    CloseAction := caNone;
                end
            else
                begin
                    // var_msg.Free;
                    CloseAction := caFree;
                end;
        end;

    var_msg.Free;
end;

procedure Tform_recibos_003.DBEdit_Descuento_Comercial_1Exit(Sender: TObject);
begin
    Calcular_Importe_menos_Descuento;
end;

procedure Tform_recibos_003.DBEdit_Descuento_Comercial_2Exit(Sender: TObject);
begin
    Calcular_Importe_menos_Descuento;
end;

procedure Tform_recibos_003.DBEdit_PVP3Exit(Sender: TObject);
begin
    Calcular_Importe_menos_Descuento;
end;

procedure Tform_recibos_003.DBEdit_PVP4Exit(Sender: TObject);
begin
    Calcular_Importe_menos_Descuento;
end;

procedure Tform_recibos_003.DBEdit_PVPExit(Sender: TObject);
begin
    Calcular_Importe_menos_Descuento;
end;

procedure Tform_recibos_003.DBEdit_PVP_con_ImpuestosExit(Sender: TObject);
begin
    Calcular_Importe_menos_Descuento;
end;

procedure Tform_recibos_003.Edit_Descripcion_AlmacenClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿Quitamos el ALMACEN?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_recibos_000.SQLQuery_Alb_Detalles.FieldByName('id_almacenes').Clear;
         Edit_Descripcion_Almacen.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_recibos_003.Boton_Elegir_AlmacenClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_recibos_000.SQLQuery_Alb_Detalles do
    begin
        var_Registro := UTI_Abrir_Form( true, false, '', 260 );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_almacenes').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Almacen.Text        := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_recibos_003.Presentar_Datos;
begin
    WITH form_recibos_000.SQLQuery_Alb_Detalles do
    BEGIN
        Edit_Descripcion_Almacen.Text  := FieldByName('OT_descripcion_almacen').AsString;
        Edit_Descripcion_Articulo.Text := FieldByName('OT_descripcion_articulo').AsString;
        Edit_Descripcion_Impuesto.Text := FieldByName('OT_descripcion_impuesto').AsString;

        Calcular_Importe_menos_Descuento;
    END;
end;

procedure Tform_recibos_003.Calcular_Importe_menos_Descuento;
var var_Valores_Linea : TCalculo_Linea_Detalle;
    var_Calculo       : Extended;
begin
    var_Valores_Linea := UTI_LINEAS_Calculo_de_Linea_Detalle( form_recibos_000.SQLQuery_Alb_Detalles,
                                                              'N' );

    var_Calculo := (    (  var_Valores_Linea.Unidades_por_Precio -
                           var_Valores_Linea.Dto_1  ) -
                        var_Valores_Linea.Dto_2    ) + var_Valores_Linea.Impuestos;

    Edit_Calculo_Importe_menos_Descuento.Text := FloatToStr(var_Calculo);
end;

end.


