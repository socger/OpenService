unit facturas_compras_004;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, Forms, Controls, Graphics, Dialogs, ButtonPanel,
  StdCtrls, Buttons, utilidades_general, utilidades_contabilidad, utilidades_forms_Filtrar;

type

  { Tform_facturas_compras_004 }

  Tform_facturas_compras_004 = class(TForm)
    BitBtn_Ver_Ftras_Borradas: TBitBtn;
    BitBtn_Configurar_Empresa: TBitBtn;
    ButtonPanel1: TButtonPanel;
    DateTimePicker_Fecha_ACT: TDateTimePicker;
    DateTimePicker_Fecha_NEW: TDateTimePicker;
    Edit_Descripcion_Empresa: TEdit;
    Edit_Factura_Numero_ACT: TEdit;
    Edit_Factura_Numero_NEW: TEdit;
    Edit_Factura_Serie_ACT: TEdit;
    Edit_Factura_Serie_NEW: TEdit;
    Edit_id_Empresas: TEdit;
    GroupBox_Serie_Numero: TGroupBox;
    GroupBox_Serie_Numero1: TGroupBox;
    Label50: TLabel;
    Label51: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;

    procedure BitBtn_Configurar_EmpresaClick(Sender: TObject);
    procedure Elegir_Ftra_Borrada_Compras;
    procedure Elegir_Ftra_Borrada_Ventas;
    procedure BitBtn_Ver_Ftras_BorradasClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);

  private
    { private declarations }
    private_Salir_OK  : Boolean;
  public
    { public declarations }
    public_Pulso_Aceptar : Boolean;
  end;

var
  form_facturas_compras_004: Tform_facturas_compras_004;

implementation

{$R *.lfm}

uses menu, facturas_compras_006, facturas_compras_000, facturas_ventas_006, facturas_ventas_000;

{ Tform_facturas_compras_004 }

procedure Tform_facturas_compras_004.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
var var_msg    : TStrings;
    var_Existe : String;
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
        // ************************************************************************************* //
        // ** DATOS QUE SON OBLIGADOS POR LO QUE SE DEBE DE AVISAR DE SU FALTA                ** //
        // ************************************************************************************* //
        if Trim(Edit_Factura_Serie_NEW.Text) = '' then
        begin
            var_msg.Add( '* La nueva serie.');
        end;

        if Trim(Edit_Factura_Numero_NEW.Text) = '' then
        begin
            var_msg.Add( '* El nuevo número.');
        end;

        if DateTimePicker_Fecha_NEW.DateIsNull then
        begin
            var_msg.Add( '* La nueva fecha.');
        end;

        // ********************************************************************************* //
        // ** Comprobamos que no exista el número de factura                              ** //
        // ********************************************************************************* //
        if (Trim(Edit_Factura_Serie_NEW.Text) <> Trim(Edit_Factura_Serie_ACT.Text))   or
           (Trim(Edit_Factura_Numero_NEW.Text) <> Trim(Edit_Factura_Numero_ACT.Text)) then
        begin
            if UTI_GEN_Form_Abierto_Ya('form_facturas_ventas_000') = true then
            begin
                var_Existe := UTI_CONTA_Existe_Ftra_Alb_Pdo_Pto( 'facturas_ventas',
                                                                 Edit_id_Empresas.Text,
                                                                 Edit_Factura_Serie_NEW.Text,
                                                                 Edit_Factura_Numero_NEW.Text );
            end else begin
                var_Existe := UTI_CONTA_Existe_Ftra_Alb_Pdo_Pto( 'facturas_compras',
                                                                 Edit_id_Empresas.Text,
                                                                 Edit_Factura_Serie_NEW.Text,
                                                                 Edit_Factura_Numero_NEW.Text );
            end;

            if var_Existe = 'ERROR' then
            begin
                var_msg.Add( '* No se pudo comprobar si existe la factura.');
            end else begin
                if var_Existe <> '0' then
                begin
                    var_msg.Add( '* La factura ya existe.');
                end;
            end;
        end;
    end;

    if private_Salir_OK = False then
    begin
        // ***************************************************************************************** //
        // ** Intento BitBtn_SALIR de la aplicación de un modo no permitido.
        // ***************************************************************************************** //
        // ** Pero si desde el menu principal está a true la variable public_Salir_Ok, significa  ** //
        // ** que hay que salir si o si pues se pulsó cancelar al preguntar otra vez por la con-  ** //
        // ** traseña                                                                             ** //
        // ***************************************************************************************** //
        if form_Menu.public_Salir_OK = False then
        begin
            CloseAction := caNone;
        end;
    end else begin
        // ***************************************************************************************** //
        // ** Fue correcto el modo como quiere salir de la aplicación                             ** //
        // ***************************************************************************************** //
        // ** SI ESTAMOS EN MODO DE INSERCCION (CREANDO LA CABECERA), ASIGNAMOS A LA CABECERA SU  ** //
        // ** NUMERACION Y ACTUALIZAMOS EL REGISTRO DE EMPRESA CON EL A GENERAR.                  ** //
        // **                                                                                     ** //
        // ** ... LUEGO ...                                                                       ** //
        // **                                                                                     ** //
        // ** Comprobaremos si no se generó algún error por falta de completar algun campo y si se** //
        // ** salió con el botón Ok o Cancel                                                      ** //
        // ***************************************************************************************** //
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

procedure Tform_facturas_compras_004.FormCreate(Sender: TObject);
begin
    // ********************************************************************************************* //
    // ** Obligado en cada formulario para no olvidarlo                                           ** //
    // ********************************************************************************************* //
    with Self do
    begin
        Color       := $00B9959C;;
        Position    := poScreenCenter;
        BorderIcons := [];
        BorderStyle := bsSingle;
    end;

    private_Salir_OK  := false;

    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
end;

procedure Tform_facturas_compras_004.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := false;
end;

procedure Tform_facturas_compras_004.BitBtn_Configurar_EmpresaClick(Sender: TObject);
begin
    UTI_Abrir_Modulo_Empresas( true, false, 250, '1' );
end;

procedure Tform_facturas_compras_004.BitBtn_Ver_Ftras_BorradasClick(Sender: TObject);
begin
    if UTI_GEN_Form_Abierto_Ya('form_facturas_compras_000') = true then
    begin
        Elegir_Ftra_Borrada_Compras;
    end else begin
        Elegir_Ftra_Borrada_Ventas;
    end;
end;

procedure Tform_facturas_compras_004.Elegir_Ftra_Borrada_Compras;
var var_msg   : TStrings;
    var_Form  : Tform_facturas_compras_006;
    var_Salir : Boolean;
begin
    var_Salir := false;

    if form_facturas_compras_000.Hay_Huecos_de_Ftras( Trim(Edit_id_Empresas.Text) ) = true then
    begin
        var_Form := Tform_facturas_compras_006.Create(nil);

        var_Form.BitBtn_Seleccionar.Visible    := true;

        var_Form.Edit_Descripcion_Empresa.Text := Edit_Descripcion_Empresa.Text;
        var_Form.Edit_id_Empresas.Text         := Edit_id_Empresas.Text;

        var_Form.para_Empezar;

        var_Form.ShowModal;

        if var_Form.public_Rgtro_Seleccionado = true then
        begin
            // ***************************************************************************************** //
            // ** Eligió uno de los huecos de factura o abono borrados. Así que tengo que borrarla.   ** //
            // ** Una vez borrada la cabecera y el detalle, asignaremos esta numeración a la nueva.   ** //
            // ***************************************************************************************** //
            with form_facturas_compras_000.SQLQuery_Ftra_Borradas do
            begin
                if UTI_CONTA_Borrar_Del_Todo_Ftra_Cabecera( 'facturas_compras', FieldByName('id').AsString ) = false then
                begin
                    var_msg := TStringList.Create;
                    var_msg.Add( '* No se pudo borrar la cabecera de la factura borrada.' );
                    var_msg.Add( '  Por lo que no podemos elegir esta factura para cubrir su hueco.' );
                    var_msg.Add( '  Vuelva a intentarlo.' );
                    UTI_GEN_Aviso(true, var_msg, '¿ Que pasó ... ?', true, false);
                    var_msg.Free;
                end else begin
                    UTI_CONTA_Borrar_Del_Todo_Ftra_Detalle( 'facturas_compras_detalles', FieldByName('id').AsString );

                    Edit_Factura_Serie_NEW.Text   := FieldByName('Serie_Factura').AsString;
                    Edit_Factura_Numero_NEW.Text  := FieldByName('Numero_Factura').AsString;
                    DateTimePicker_Fecha_NEW.Date := StrToDate(FieldByName('Fecha').AsString);

                    var_Salir := true;
                end;
            end;
        end else begin
            // ***************************************************************************************** //
            // ** No eligió uno de los huecos de factura o abono borrados                             ** //
            // ***************************************************************************************** //
            var_msg := TStringList.Create;
            var_msg.Add('Teníamos huecos de facturas o albaranes borrados, pero no eligió ninguno.');
            UTI_GEN_Aviso(true, var_msg, '¿ Que pasó ... ?', true, false);
            var_msg.Free;
        end;

        var_Form.Free;
    end else begin
        var_msg := TStringList.Create;
        var_msg.Add('* No existen facturas borradas.');
        UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        var_msg.Free;
    end;

    if var_Salir = true then
    begin
        private_Salir_OK     := true;
        public_Pulso_Aceptar := true;

        Close;
    end;
end;

procedure Tform_facturas_compras_004.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := true;
end;

procedure Tform_facturas_compras_004.Elegir_Ftra_Borrada_Ventas;
var var_msg   : TStrings;
    var_Form  : Tform_facturas_ventas_006;
    var_Salir : Boolean;
begin
    var_Salir := false;

    if form_facturas_ventas_000.Hay_Huecos_de_Ftras( Trim(Edit_id_Empresas.Text) ) = true then
    begin
        var_Form := Tform_facturas_ventas_006.Create(nil);

        var_Form.BitBtn_Seleccionar.Visible    := true;

        var_Form.Edit_Descripcion_Empresa.Text := Edit_Descripcion_Empresa.Text;
        var_Form.Edit_id_Empresas.Text         := Edit_id_Empresas.Text;

        var_Form.para_Empezar;

        var_Form.ShowModal;

        if var_Form.public_Rgtro_Seleccionado = true then
        begin
            // ***************************************************************************************** //
            // ** Eligió uno de los huecos de factura o abono borrados. Así que tengo que borrarla.   ** //
            // ** Una vez borrada la cabecera y el detalle, asignaremos esta numeración a la nueva.   ** //
            // ***************************************************************************************** //
            with form_facturas_ventas_000.SQLQuery_Ftra_Borradas do
            begin
                if UTI_CONTA_Borrar_Del_Todo_Ftra_Cabecera( 'facturas_ventas', FieldByName('id').AsString ) = false then
                begin
                    var_msg := TStringList.Create;
                    var_msg.Add( '* No se pudo borrar la cabecera de la factura borrada.' );
                    var_msg.Add( '  Por lo que no podemos elegir esta factura para cubrir su hueco.' );
                    var_msg.Add( '  Vuelva a intentarlo.' );
                    UTI_GEN_Aviso(true, var_msg, '¿ Que pasó ... ?', true, false);
                    var_msg.Free;
                end else begin
                    UTI_CONTA_Borrar_Del_Todo_Ftra_Detalle( 'facturas_ventas_detalles', FieldByName('id').AsString );

                    Edit_Factura_Serie_NEW.Text   := FieldByName('Serie_Factura').AsString;
                    Edit_Factura_Numero_NEW.Text  := FieldByName('Numero_Factura').AsString;
                    DateTimePicker_Fecha_NEW.Date := StrToDate(FieldByName('Fecha').AsString);

                    var_Salir := true;
                end;
            end;
        end else begin
            // ***************************************************************************************** //
            // ** No eligió uno de los huecos de factura o abono borrados                             ** //
            // ***************************************************************************************** //
            var_msg := TStringList.Create;
            var_msg.Add('Teníamos huecos de facturas o albaranes borrados, pero no eligió ninguno.');
            UTI_GEN_Aviso(true, var_msg, '¿ Que pasó ... ?', true, false);
            var_msg.Free;
        end;

        var_Form.Free;
    end else begin
        var_msg := TStringList.Create;
        var_msg.Add('* No existen facturas borradas.');
        UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        var_msg.Free;
    end;

    if var_Salir = true then
    begin
        private_Salir_OK     := true;
        public_Pulso_Aceptar := true;

        Close;
    end;
end;

end.

