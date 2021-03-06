unit facturas_compras_002;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DBDateTimePicker, Forms, Controls, Graphics, Dialogs, ButtonPanel,
  StdCtrls, DbCtrls, ExtCtrls, Buttons, utilidades_forms_Filtrar, utilidades_general, utilidades_impuestos,
  utilidades_lineas_detalle, utilidades_usuarios;

type

  { Tform_facturas_compras_002 }

  Tform_facturas_compras_002 = class(TForm)
    Boton_Buscar_Referencia_Articulo: TBitBtn;
    Boton_Elegir_Almacen: TBitBtn;
    Boton_Elegir_Articulo: TBitBtn;
    Boton_Elegir_Impuesto: TBitBtn;
    Boton_ver_Historico: TBitBtn;
    ButtonPanel1: TButtonPanel;
    DBCheckBox_Excluido_su_cobro_SN: TDBCheckBox;
    DBDateTimePicker_Fecha: TDBDateTimePicker;
    DBDateTimePicker_Fecha_Albaran: TDBDateTimePicker;
    DBDateTimePicker_Fecha_Movimiento_Detalle: TDBDateTimePicker;
    DBEdit_Codigo: TDBEdit;
    DBEdit_Concepto_Manual: TDBEdit;
    DBEdit_Ctdad: TDBEdit;
    DBEdit_Ctdad1: TDBEdit;
    DBEdit_Descuento_Comercial_1: TDBEdit;
    DBEdit_Descuento_Comercial_2: TDBEdit;
    DBEdit_Numero: TDBEdit;
    DBEdit_Numero_Albaran: TDBEdit;
    DBEdit_PVP: TDBEdit;
    DBEdit_Repetir_Cada: TDBEdit;
    DBEdit_Serie: TDBEdit;
    DBMemo_Descripcion: TDBMemo;
    Edit_Descripcion_Almacen: TEdit;
    Edit_Descripcion_Articulo: TEdit;
    Edit_Descripcion_Impuesto: TEdit;
    Edit_PVP_Imptos_Incluidos: TEdit;
    Edit_Descripcion_Almacen1: TEdit;
    Edit_Descripcion_Empresa: TEdit;
    Edit_Descripcion_Proveedor: TEdit;
    Edit_Total_Linea: TEdit;
    GroupBox10: TGroupBox;
    GroupBox_Serie_Numero: TGroupBox;
    GroupBox_Serie_Numero1: TGroupBox;
    Label1: TLabel;
    Label103: TLabel;
    Label104: TLabel;
    Label19: TLabel;
    Label3: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label62: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label68: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label74: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label82: TLabel;
    Label_Almacen: TLabel;
    Label_Almacen1: TLabel;
    Label_Fecha3: TLabel;
    Panel1: TPanel;
    Panel_Mantenimiento: TPanel;

    procedure Boton_Buscar_Referencia_ArticuloClick(Sender: TObject);
    procedure Boton_ver_HistoricoClick(Sender: TObject);
    procedure Calcular_Importe_menos_Descuento;
    procedure DBCheckBox_Excluido_su_cobro_SNChange(Sender: TObject);
    procedure Edit_PVP_Imptos_IncluidosExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure Presentar_Descripcion_en_Amarillo_o_no;
    procedure Presentar_Datos;
    procedure CancelButtonClick(Sender: TObject);
    procedure DBEdit_CtdadExit(Sender: TObject);
    procedure DBEdit_Descuento_Comercial_1Exit(Sender: TObject);
    procedure DBEdit_Descuento_Comercial_2Exit(Sender: TObject);
    procedure DBEdit_PVPExit(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure para_Empezar;
    procedure Boton_Elegir_AlmacenClick(Sender: TObject);
    procedure Boton_Elegir_ArticuloClick(Sender: TObject);
    procedure Boton_Elegir_ImpuestoClick(Sender: TObject);
    procedure Edit_Descripcion_AlmacenClick(Sender: TObject);
    procedure Edit_Descripcion_ArticuloClick(Sender: TObject);
    procedure Edit_Descripcion_ImpuestoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure no_Tocar;
    function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
    procedure FormCreate(Sender: TObject);
    procedure Panel_MantenimientoClick(Sender: TObject);

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
  form_facturas_compras_002: Tform_facturas_compras_002;

implementation

{$R *.lfm}

uses menu, facturas_compras_000, facturas_compras_001, articulos_ultimas_ventas_000;

{ Tform_facturas_compras_002 }

procedure Tform_facturas_compras_002.FormActivate(Sender: TObject);
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

procedure Tform_facturas_compras_002.FormCreate(Sender: TObject);
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
    Edit_Descripcion_Almacen.Visible  := false;
    Label_Almacen1.Visible            := false;
    Boton_Elegir_Almacen.Visible      := false;

    form_Menu.Traer_Configuracion_APP;
    if UpperCase(Trim(form_menu.public_User_Configuracion.Albaranes_Obligar_Almacen_SN)) = 'S' then
    begin
        Label_Almacen.Visible             := true;
        Edit_Descripcion_Almacen1.Visible := true;
        // Edit_Descripcion_Almacen.Visible  := true;
        // Label_Almacen1.Visible            := true;
        // Boton_Elegir_Almacen.Visible      := true;
    end;
end;

procedure Tform_facturas_compras_002.Panel_MantenimientoClick(Sender: TObject);
begin

end;

function Tform_facturas_compras_002.Comprobar_No_Tocar( param_Reproducir_Mensajes,
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
    if not form_facturas_compras_000.SQLQuery_Ftra_Detalles.FieldByName('Del_WHEN').IsNull then
    begin
        Result := true;

        if param_Reproducir_Mensajes = true then
        begin
            var_msg.Add( '* Es una línea de detalle borrada, no se puede modificar nada de ella. Si desea modificarla, primero hay que darla de alta anteriormente.' );
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

procedure Tform_facturas_compras_002.no_Tocar;
begin
    Panel_Mantenimiento.Enabled := False;
end;

procedure Tform_facturas_compras_002.Boton_Elegir_AlmacenClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_facturas_compras_000.SQLQuery_Ftra_Detalles do
    begin
        var_Registro := UTI_Abrir_Modulo_Almacenes( '', '', true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_almacenes').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Almacen.Text        := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_facturas_compras_002.Edit_Descripcion_AlmacenClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿Quitamos el ALMACEN?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_facturas_compras_000.SQLQuery_Ftra_Detalles.FieldByName('id_almacenes').Clear;
         Edit_Descripcion_Almacen.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_facturas_compras_002.Edit_Descripcion_ArticuloClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS el ARTICULO?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_facturas_compras_000.SQLQuery_Ftra_Detalles.FieldByName('id_articulos').Clear;
         form_facturas_compras_000.SQLQuery_Ftra_Detalles.FieldByName('Repetir_Cada').Clear;

         Edit_Descripcion_Articulo.Text    := '';

         Presentar_Descripcion_en_Amarillo_o_no;
    end;
    var_msg.Free;
end;

procedure Tform_facturas_compras_002.Edit_Descripcion_ImpuestoClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS el IMPUESTO?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
        Edit_Descripcion_Impuesto.Text := '';
        with form_facturas_compras_000.SQLQuery_Ftra_Detalles do
        begin
            FieldByName('id_impuestos_Compras').Clear;
            FieldByName('OT_descripcion_impuesto').Clear;
            FieldByName('OT_Tanto_Por_Ciento').Clear;
            FieldByName('OT_Sumado_A_Ftra_SN').Clear;
        end;

        Calcular_Importe_menos_Descuento;
    end;
    var_msg.Free;
end;

procedure Tform_facturas_compras_002.para_Empezar;
begin
    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    with form_facturas_compras_000.SQLQuery_Ftra_Detalles do
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

procedure Tform_facturas_compras_002.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := true;
end;

procedure Tform_facturas_compras_002.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := false;
end;

procedure Tform_facturas_compras_002.DBEdit_Descuento_Comercial_1Exit(Sender: TObject);
begin
    Calcular_Importe_menos_Descuento;
end;

procedure Tform_facturas_compras_002.DBEdit_Descuento_Comercial_2Exit(Sender: TObject);
begin
    Calcular_Importe_menos_Descuento;
end;

procedure Tform_facturas_compras_002.DBEdit_PVPExit(Sender: TObject);
begin
    Calcular_Importe_menos_Descuento;
end;

procedure Tform_facturas_compras_002.DBEdit_CtdadExit(Sender: TObject);
begin
    Calcular_Importe_menos_Descuento;
end;

procedure Tform_facturas_compras_002.Presentar_Datos;
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
        Edit_Descripcion_Almacen.Text      := form_facturas_compras_001.Edit_Descripcion_Almacen.Text;
        Edit_Descripcion_Almacen1.Text     := form_facturas_compras_001.Edit_Descripcion_Almacen.Text;
        Edit_Descripcion_Empresa.Text      := form_facturas_compras_001.Edit_Descripcion_Empresa.Text;
    end;

    with form_facturas_compras_000.SQLQuery_Ftra_Detalles do
    begin
        Edit_Descripcion_Almacen.Text  := FieldByName('OT_descripcion_almacen').AsString;
        Edit_Descripcion_Articulo.Text := FieldByName('OT_descripcion_articulo').AsString;
        Edit_Descripcion_Impuesto.Text := FieldByName('OT_descripcion_impuesto').AsString;

        Calcular_Importe_menos_Descuento;
    end;

    Presentar_Descripcion_en_Amarillo_o_no;
end;

procedure Tform_facturas_compras_002.Presentar_Descripcion_en_Amarillo_o_no;
begin
    with form_facturas_compras_000.SQLQuery_Ftra_Detalles do
    begin
        if Trim(FieldByName('id_articulos').AsString) <> '' then
        begin
            DBEdit_Concepto_Manual.Color      := $006AD3D7;
            DBEdit_Concepto_Manual.ReadOnly   := true;
            DBEdit_Concepto_Manual.Font.Color := clRed;

            DBMemo_Descripcion.Color          := $006AD3D7;
            DBMemo_Descripcion.ReadOnly       := true;
            DBMemo_Descripcion.Font.Color     := clRed;
        end else begin
            DBEdit_Concepto_Manual.Color      := clWhite;
            DBEdit_Concepto_Manual.ReadOnly   := false;
            DBEdit_Concepto_Manual.Font.Color := clBlack;

            DBMemo_Descripcion.Color          := clWhite;
            DBMemo_Descripcion.ReadOnly       := false;
            DBMemo_Descripcion.Font.Color     := clBlack;
        end;
    end;
end;

procedure Tform_facturas_compras_002.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg             : TStrings;
    var_msg_sin_Obligar : TStrings;
    var_almacen         : String;
    var_pedir_Impto     : Boolean;
begin
    ButtonPanel1.SetFocus; // Con esto consigo que salga del campo que este y pueda actualizarlo

    var_msg             := TStringList.Create;
    var_msg_sin_Obligar := TStringList.Create;

    if public_Pulso_Aceptar = true then
    begin
        UTI_LINEAS_Controlar_PVP( form_facturas_compras_000.SQLQuery_Ftra_Detalles,
                                  'facturas_compras_detalles',
                                  Edit_PVP_Imptos_Incluidos.Text,
                                  var_msg );

        with form_facturas_compras_000.SQLQuery_Ftra_Detalles do
        begin
            // ************************************************************************************* //
            // ** Tengo que obligar a poner el tipo de impuesto, si se puso algún tipo de PVP     ** //
            // ** Así permitiremos crear líneas de detalle sin cantidades                         ** //
            // ************************************************************************************* //
            if Trim(FieldByName('id_impuestos_Compras').AsString) = '' then
            begin
                if Trim(FieldByName('PVP').AsString) <> '' then
                begin
                    var_pedir_Impto := false;

                    if Trim(FieldByName('PVP').AsString) <> '' then
                    begin
                        if FieldByName('PVP').Value > 0 then
                        begin
                            var_pedir_Impto := true;
                        end;
                    end;

                    if var_pedir_Impto = true then
                    begin
                        var_msg.Add( ' ');
                        var_msg.Add( '* El tipo de impuesto. Pero si lo que desea es dejar una línea sin PVP y sin impuestos, símplemente ponga un PVP a 0.');
                    end;
                end;
            end;

            // ************************************************************************************* //
            // ** Tengo que obligadamente o poner un artículo o poner una descripción manualmente ** //
            // ************************************************************************************* //
            if (Trim(FieldByName('id_articulos').AsString) = '')         and
               (Trim(FieldByName('descripcion_para_TPV').AsString) = '') and
               (Trim(FieldByName('descripcion').AsString) = '')          then
            begin
                var_msg_sin_Obligar.Add( ' ');
                var_msg_sin_Obligar.Add( '* El artículo o alguna de las descripciones.');
            end else begin
                // ********************************************************************************* //
                // ** Automatizar el rellenado de la descripción para TPV                         ** //
                // ********************************************************************************* //
                if Length(Trim(FieldByName('descripcion').AsString)) <= 50 then
                begin
                    if Trim(FieldByName('descripcion_para_TPV').AsString) = '' then
                    begin
                        FieldByName('descripcion_para_TPV').AsString := Trim(FieldByName('descripcion').AsString);
                    end;
                end;
            end;

            // ************************************************************************************* //
            // ** Hay que poner un tipo de PVP                                                    ** //
            // ************************************************************************************* //
            if FieldByName('PVP').IsNull then
            begin
                var_msg.Add( ' ');
                var_msg.Add( '* El PVP.');
            end;

            var_almacen := form_facturas_compras_000.SQLQuery_Ftra.FieldByName('id_almacenes').AsString;
            if ( FieldByName('OT_Tipo_de_articulo').Value = '0' )          and
               ( ( Trim(FieldByName('Unidades').AsString) = ''  )    or
                 ( Trim(FieldByName('Unidades').AsString) = '0' )    or
                 ( Trim(var_almacen) = '' )                          or
                 ( Trim(FieldByName('Fecha_Movimiento').AsString) = '' ) ) then
            begin
                // ********************************************************************************* //
                // ** Si es un articulo con stock a controlar que pida obligado las unidades, el  ** //
                // ** almacen y la fecha del movimiento                                           ** //
                // ********************************************************************************* //
                var_msg.Add( ' ');
                var_msg.Add( '* Es un artículo para controlar su stock, así que ... ');

                if ( Trim(FieldByName('Unidades').AsString) = ''  ) or
                   ( Trim(FieldByName('Unidades').AsString) = '0' ) then
                begin
                    var_msg.Add( '    + nos falta la cantidad / peso / volumen.');
                end;

                if Trim(var_almacen) = '' then
                begin
                    var_msg.Add( '    + nos falta el almacén.');
                end;

                if Trim(FieldByName('Fecha_Movimiento').AsString) = '' then
                begin
                    var_msg.Add( '    + nos falta la fecha.');
                end;
            end;

            // ************************************************************************************* //
            // ** Si el artículo es un artículo para control de stock (Tipo = 0), las unidades no ** //
            // ** pueden ser positivas y el importe total de la línea negativo. Seguro que han    ** //
            // ** puesto en alguno de los PVP una cantidad negativa.                              ** //
            // ************************************************************************************* //
            if ( FieldByName('OT_Tipo_de_articulo').Value = '0' )   and
               ( FieldByName('Unidades').Value > 0 )                and
               ( FieldByName('OT_Total_Linea_con_Dtos').Value < 0 ) then
            begin
                var_msg.Add( '* Se trata de un artículo para control de su stock. ' );
                var_msg.Add( '  Así que las unidades no pueden ser positivas, si el importe total de la ' +
                                'línea es negativo.' );
                var_msg.Add( '  Probablemente su PVP negativo debería de ser positivo y sus unidades ' +
                                'negativas. Así se controlara bien el stock de este artículo.' );
            end;

            // ************************************************************************************* //
            // ** Si el artículo es un artículo para control de stock (Tipo = 0), las unidades no ** //
            // ** ser negativas y el importe total de la línea positivo. Seguro que han puesto en ** //
            // ** alguno de los PVP una cantidad negativa.                                        ** //
            // ************************************************************************************* //
            if ( FieldByName('OT_Tipo_de_articulo').Value = '0' )   and
               ( FieldByName('Unidades').Value < 0 )                and
               ( FieldByName('OT_Total_Linea_con_Dtos').Value > 0 ) then
            begin
                var_msg.Add( '* Se trata de un artículo para control de su stock.' );
                var_msg.Add( '  Así que las unidades no pueden ser negativas, si el importe total de la ' +
                               'línea es positivo.' );
                var_msg.Add( '  Probablemente su PVP debería de ser positivo y sus unidades negativas.' );
                var_msg.Add( '  Así se controlara bien el stock de este artículo.' );
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

procedure Tform_facturas_compras_002.DBCheckBox_Excluido_su_cobro_SNChange(Sender: TObject);
begin
    Calcular_Importe_menos_Descuento;
end;

procedure Tform_facturas_compras_002.Edit_PVP_Imptos_IncluidosExit(Sender: TObject);
begin
    Calcular_Importe_menos_Descuento;
end;

procedure Tform_facturas_compras_002.Boton_Buscar_Referencia_ArticuloClick(Sender: TObject);
var var_msg      : TStrings;
    var_Devuelve : String;
begin
    var_msg := TStringList.Create;

    with form_facturas_compras_000.SQLQuery_Ftra_Detalles do
    begin
        if not FieldByName('id_articulos').IsNull then
        begin
            var_msg.Add( 'Ya tenemos elegido un artículo, ¿SEGURO QUE DESEA QUITARLO?' );
        end else begin
            if (not FieldByName('descripcion').IsNull)          or
               (not FieldByName('descripcion_para_TPV').IsNull) then
            begin
                var_msg.Add( 'Ya tenemos puesto algo en la descripcion, ¿SEGURO QUE DESEA QUITARLO?' );
            end;
        end;

        if Trim(var_msg.Text) <> '' then
        begin
            // ************************************************************************************* //
            // ** Pregunta si quitamos los datos anteriores del artículo o de la descripción      ** //
            // ************************************************************************************* //
            if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
            begin
                // ********************************************************************************* //
                // ** Quitamos los datos anteriores y buscamos la referencia                      ** //
                // ********************************************************************************* //
                var_Devuelve := UTI_LINEAS_Buscar_Articulo_por_Referencia( form_facturas_compras_000.SQLQuery_Ftra_Detalles,
                                                                           FieldByName('CodigoBarras_Referencia').asString,
                                                                           false );
                if var_Devuelve <> '' then
                begin
                    Edit_Descripcion_Impuesto.Text := var_Devuelve;
                    Edit_Descripcion_Articulo.Text := FieldByName('descripcion_para_TPV').AsString;
                end;
            end;
        end else begin
            // ************************************************************************************* //
            // ** Buscamos la referencia                                                          ** //
            // ************************************************************************************* //
            var_Devuelve := UTI_LINEAS_Buscar_Articulo_por_Referencia( form_facturas_compras_000.SQLQuery_Ftra_Detalles,
                                                                       FieldByName('CodigoBarras_Referencia').asString,
                                                                       false );
            if var_Devuelve <> '' then
            begin
                Edit_Descripcion_Impuesto.Text := var_Devuelve;
                Edit_Descripcion_Articulo.Text := FieldByName('descripcion_para_TPV').AsString;
            end;
        end;

        Calcular_Importe_menos_Descuento;
        Presentar_Descripcion_en_Amarillo_o_no;
    end;

    var_msg.Free;
end;

procedure Tform_facturas_compras_002.Boton_ver_HistoricoClick(Sender: TObject);
var var_msg  : TStrings;
    var_Form : Tform_articulos_ultimas_ventas_000;
begin
    var_msg := TStringList.Create;

    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = True then
    begin
        var_Form := Tform_articulos_ultimas_ventas_000.Create(nil);

        with form_facturas_compras_000.SQLQuery_Ftra do
        begin
            if Trim(FieldByName('id_proveedores').AsString) <> '' then
            begin
                var_Form.Edit_id_proveedores.Text        := FieldByName('id_proveedores').AsString;
                var_Form.Edit_descripcion_proveedor.Text := FieldByName('OT_descripcion_proveedor').AsString;
            end;
        end;

        with form_facturas_compras_000.SQLQuery_Ftra_Detalles do
        begin
            if Trim(FieldByName('id_articulos').AsString) <> '' then
            begin
                var_Form.Edit_id_articulos.Text         := FieldByName('id_articulos').AsString;
                var_Form.Edit_descripcion_articulo.Text := FieldByName('OT_descripcion_articulo').AsString;
            end;
        end;

        var_Form.para_Empezar;

        var_Form.ShowModal;
        var_Form.Free;
    end;

    var_msg.Free;
end;

procedure Tform_facturas_compras_002.Boton_Elegir_ArticuloClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_facturas_compras_000.SQLQuery_Ftra_Detalles do
    begin
        var_Registro := UTI_Abrir_Modulo_Articulos( true, false, '1' );

        if var_Registro.id_1 <> '' then
        begin
            Edit_Descripcion_Impuesto.Text := UTI_LINEAS_Traer_Resto_Datos_Articulo( form_facturas_compras_000.SQLQuery_Ftra_Detalles,
                                                                                     var_Registro.id_1,
                                                                                     false,
                                                                                     '' );
            Edit_Descripcion_Articulo.Text := var_Registro.descripcion_2;
        end;

        Calcular_Importe_menos_Descuento;
        Presentar_Descripcion_en_Amarillo_o_no;
    end;
end;

procedure Tform_facturas_compras_002.Calcular_Importe_menos_Descuento;
var var_msg  : TStrings;
    var_Calc : Extended;
begin
    var_msg := TStringList.Create;

    UTI_LINEAS_Controlar_PVP( form_facturas_compras_000.SQLQuery_Ftra_Detalles,
                              'facturas_compras_detalles',
                              Edit_PVP_Imptos_Incluidos.Text,
                              var_msg );

    if Trim(var_msg.Text) <> '' then
    begin
        UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        var_msg.Free;
        Exit;
    end else begin
        var_msg.Free;
    end;

    with form_facturas_compras_000.SQLQuery_Ftra_Detalles do
    begin
        if Trim(Edit_PVP_Imptos_Incluidos.Text) <> '' then
        begin
            Try
                var_Calc := 1 + ( FieldByName('OT_Tanto_Por_Ciento').Value / 100 );
                var_Calc := StrToFloat(FloatToStr(StrToFloat(Edit_PVP_Imptos_Incluidos.Text) / var_Calc));
                var_Calc := StrToFloat(UTI_GEN_Cut_to_3_Decimal(FloatToStr(StrToFloat(Edit_PVP_Imptos_Incluidos.Text) - var_Calc)));

                FieldByName('PVP').Value       := StrToFloat(Edit_PVP_Imptos_Incluidos.Text) - var_Calc;
                Edit_PVP_Imptos_Incluidos.Text := '';
            Except
                var_msg := TStringList.Create;
                var_msg.Add( 'Error al calcular el (PVP) obteniéndolo de el (PVP, incluye sus impuestos), así que vacío los dos PVP.' );
                UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
                var_msg.Free;

                FieldByName('PVP').Clear;
                Edit_PVP_Imptos_Incluidos.Text := '';
            end;
        end;

        FieldByName('PVP').AsString := UTI_GEN_Round_to_2_Decimal(FieldByName('PVP').AsString);

        // ***************************************************************************************** //
        // ** Como resulta que en cuanto cambie algo de la línea de detalle se vuelve a recalcular** //
        // ** su total de línea por el onCalcFields de la tabla de detalle, pues sólo tengo que   ** //
        // ** ponerlo en el edit                                                                  ** //
        // ***************************************************************************************** //
        Edit_Total_Linea.Text := FieldByName('OT_Total_Linea_con_Dtos').AsString;
    end;
end;

procedure Tform_facturas_compras_002.Boton_Elegir_ImpuestoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
    var_msg      : TStrings;
begin
    with form_facturas_compras_000.SQLQuery_Ftra_Detalles do
    begin
        var_Registro := UTI_Abrir_Modulo_Impuestos( true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
            if var_Registro.descripcion_2 <> '' then
            begin
                // ********************************************************************************* //
                // ** Es un impuesto NO compuesto así que voy a comprobar si fué introducido ya   ** //
                // ** como impuesto compuesto en alguna de las líneas de detalle                  ** //
                // ********************************************************************************* //
                if UTI_IMPTOS_Existe_el_impto_NOcompuesto_como_compuesto( FieldByName('id_facturas').AsString,
                                                                          var_Registro.id_1,
                                                                          'facturas_compras_detalles' ) <> '0' then
                begin
                    var_msg := TStringList.Create;
                    var_msg.Add( 'Este impuesto ya está usado como impuesto compuesto en otra línea de detalle.' );
                    var_msg.Add( 'O lo usas como impuesto compuesto o como no compuesto.' );
                    UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
                    var_msg.Free;
                    Exit;
                end;
            end else begin
                // ********************************************************************************* //
                // ** Es un impuesto compuesto así que voy a comprobar si fué introducido ya como ** //
                // ** impuesto NO compuesto en alguna de las líneas de detalle                    ** //
                // ********************************************************************************* //
                if UTI_IMPTOS_Existe_el_impto_compuesto_como_NOcompuesto( FieldByName('id_facturas').AsString,
                                                                          var_Registro.id_1,
                                                                          'facturas_compras_detalles' ) <> '0' then
                begin
                    var_msg := TStringList.Create;
                    var_msg.Add( 'Este impuesto ya está usado como impuesto no compuesto en otra línea de detalle.' );
                    var_msg.Add( 'O lo usas como impuesto compuesto o como no compuesto.' );
                    UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
                    var_msg.Free;
                    Exit;
                end;

                // ********************************************************************************* //
                // ** Es un impuesto compuesto así que voy a comprobar si alguna parte de él está ** //
                // ** en otro impuesto compuesto de las líneas de detalle                         ** //
                // ********************************************************************************* //
                if UTI_IMPTOS_Existe_alguna_parte_del_impto_compuesto_en_otro_compuesto( FieldByName('id_facturas').AsString,
                                                                                         var_Registro.id_1,
                                                                                         'facturas_compras_detalles' ) <> '0' then
                begin
                    var_msg := TStringList.Create;
                    var_msg.Add( 'Alguna parte de este impuesto ya está siendo usado como parte de otro impuesto compuesto en otra línea de detalle.' );
                    UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
                    var_msg.Free;
                    Exit;
                end;
            end;

            Edit_Descripcion_Impuesto.Text                  := var_Registro.descripcion_1;

            FieldByName('id_impuestos_Compras').AsString    := Trim(var_Registro.id_1);
            FieldByName('OT_descripcion_impuesto').AsString := var_Registro.descripcion_1;
            FieldByName('OT_Tanto_Por_Ciento').AsString     := var_Registro.descripcion_2;
            FieldByName('OT_Sumado_A_Ftra_SN').AsString     := var_Registro.descripcion_3;

            Calcular_Importe_menos_Descuento;
        end;
    end;
end;

end.


