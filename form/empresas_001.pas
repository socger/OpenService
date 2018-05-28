unit empresas_001;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ButtonPanel, StdCtrls, DbCtrls,
  Buttons, ExtCtrls, ComCtrls, ExtDlgs, db, utilidades_general, utilidades_forms_Filtrar,
  utilidades_contabilidad;

type

  { Tform_empresas_001 }

  Tform_empresas_001 = class(TForm)
    BitBtn_eMAIL: TBitBtn;
    BitBtn_eMAIL1: TBitBtn;
    BitBtn_SMS: TBitBtn;
    BotonFotos: TBitBtn;
    Boton_Buscar_Direccion: TBitBtn;
    Boton_Elegir_Pais: TBitBtn;
    Boton_Elegir_Poblacion: TBitBtn;
    Boton_Elegir_Provincia: TBitBtn;
    ButtonPanel1: TButtonPanel;
    DBEdit_Codigo_Postal: TDBEdit;
    DBEdit_Direccion: TDBEdit;
    DBEdit_Direccion_Numero: TDBEdit;
    DBEdit_Direccion_Piso_Letra: TDBEdit;
    DBEdit_eMail: TDBEdit;
    DBEdit_eMail1: TDBEdit;
    DBEdit_eMail10: TDBEdit;
    DBEdit_eMail11: TDBEdit;
    DBEdit_eMail2: TDBEdit;
    DBEdit_eMail3: TDBEdit;
    DBEdit_eMail4: TDBEdit;
    DBEdit_eMail5: TDBEdit;
    DBEdit_eMail6: TDBEdit;
    DBEdit_eMail7: TDBEdit;
    DBEdit_eMail8: TDBEdit;
    DBEdit_eMail9: TDBEdit;
    DBEdit_FAX: TDBEdit;
    DBEdit_Movil: TDBEdit;
    DBEdit_NIF_CIF: TDBEdit;
    DBEdit_nombre_comercial: TDBEdit;
    DBEdit_Pagina_Web: TDBEdit;
    DBEdit_Pagina_Web1: TDBEdit;
    DBEdit_Pagina_Web10: TDBEdit;
    DBEdit_Pagina_Web2: TDBEdit;
    DBEdit_Pagina_Web3: TDBEdit;
    DBEdit_Pagina_Web4: TDBEdit;
    DBEdit_Pagina_Web5: TDBEdit;
    DBEdit_Pagina_Web6: TDBEdit;
    DBEdit_Pagina_Web7: TDBEdit;
    DBEdit_Pagina_Web8: TDBEdit;
    DBEdit_Pagina_Web9: TDBEdit;
    DBEdit_Responsable: TDBEdit;
    DBEdit_Tfno_Fijo_1: TDBEdit;
    DBEdit_Tfno_Fijo_2: TDBEdit;
    DBMemo_Observaciones_Comentarios: TDBMemo;
    Edit_Descripcion_Pais: TEdit;
    Edit_Descripcion_Poblacion: TEdit;
    Edit_Descripcion_Provincia: TEdit;
    GroupBox11: TGroupBox;
    GroupBox_Internet: TGroupBox;
    GroupBox_Logotipo: TGroupBox;
    GroupBox_Next_Albaran: TGroupBox;
    GroupBox_Next_Albaran1: TGroupBox;
    GroupBox_Next_Factura: TGroupBox;
    GroupBox_Next_Factura1: TGroupBox;
    GroupBox_Next_Factura2: TGroupBox;
    GroupBox_Next_Factura3: TGroupBox;
    GroupBox_Next_Pedido: TGroupBox;
    GroupBox_Next_Pedido1: TGroupBox;
    GroupBox_Next_Presupuesto: TGroupBox;
    GroupBox_Next_Presupuesto1: TGroupBox;
    GroupBox_Telefonos: TGroupBox;
    ImgLogo: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label62: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label_Fecha3: TLabel;
    Label_Fecha4: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    Panel1: TPanel;
    Panel2: TPanel;

    procedure Presentar_Logo;
    procedure BotonFotosClick(Sender: TObject);
    procedure Boton_Elegir_PaisClick(Sender: TObject);
    procedure Boton_Elegir_PoblacionClick(Sender: TObject);
    function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
    procedure Boton_Elegir_ProvinciaClick(Sender: TObject);
    procedure Edit_Descripcion_PaisClick(Sender: TObject);
    procedure Edit_Descripcion_PoblacionClick(Sender: TObject);
    procedure Edit_Descripcion_ProvinciaClick(Sender: TObject);
    procedure para_Empezar;
    procedure FormCreate(Sender: TObject);
    procedure no_Tocar;
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure Presentar_Datos;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);

  private
      { private declarations }
      private_Salir_OK     : Boolean;
  public
      { public declarations }
      public_Solo_Ver      : Boolean;
      public_Menu_Worked   : Integer;
      public_Pulso_Aceptar : Boolean;
      public_Record_Rgtro  : TRecord_Rgtro_Comun;
  end;

var
  form_empresas_001: Tform_empresas_001;

implementation

{$R *.lfm}

uses menu, empresas_000;

{ Tform_empresas_001 }

procedure Tform_empresas_001.FormActivate(Sender: TObject);
begin
    If form_empresas_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    Comprobar_No_Tocar(true, true);
end;

function Tform_empresas_001.Comprobar_No_Tocar( param_Reproducir_Mensajes,
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

procedure Tform_empresas_001.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg    : TStrings;
    var_msg_2  : TStrings;
    var_Existe : String;
begin
    ButtonPanel1.SetFocus; // Con esto consigo que salga del campo que este y pueda actualizarlo

    var_msg   := TStringList.Create;
    var_msg_2 := TStringList.Create;

    if public_Pulso_Aceptar = true then
    begin
        with form_empresas_000.SQLQuery_Empresas do
        begin
            // ************************************************************************************* //
            // ** Estos campos sólo son avisos de color verde, no son obligados                   ** //
            // ************************************************************************************* //
            if Trim(FieldByName('Serie_Presupuesto').AsString) = '' then
            begin
                var_msg_2.Add( '* La serie para el próximo presupuesto a crear.');
            end;

            if Trim(FieldByName('Serie_Pedido').AsString) = '' then
            begin
                var_msg_2.Add( '* La serie para el próximo pedido a crear.');
            end;
            if Trim(FieldByName('Serie_Albaran').AsString) = '' then
            begin
                var_msg_2.Add( '* La serie para el próximo albarán/recibo a crear.');
            end;

            if Trim(FieldByName('Serie_Factura').AsString) = '' then
            begin
                var_msg_2.Add( '* La serie para la próxima factura a crear.');
            end;

            if Trim(FieldByName('Serie_Abono').AsString) = '' then
            begin
                var_msg_2.Add( '* La serie para el próximo abono a crear.');
            end;

            // ************************************************************************************* //
            // ** Estos campos son avisos de color rojo, son obligados                            ** //
            // ************************************************************************************* //
            if Trim(DBEdit_nombre_comercial.Text) <> '' then
                 FieldByName('nombre_comercial').asString := AnsiUpperCase(Trim(FieldByName('nombre_comercial').AsString))
            else var_msg.Add( '* La descripción');

            if Trim(FieldByName('Responsable').asString) = '' then
            begin
                var_msg.Add( '* El responsable');
            end;

            if Trim(FieldByName('nif_cif').asString) = '' then
            begin
                var_msg.Add( '* El NIF/CIF');
            end;

            if Trim(FieldByName('Direccion').AsString) = '' then
            begin
                var_msg.Add( '* La dirección de quien facturamos.');
            end;

            if Trim(FieldByName('id_poblaciones').AsString) = '' then
            begin
                var_msg.Add( '* La población de quien facturamos.');
            end;

            if Trim(FieldByName('id_provincias').AsString) = '' then
            begin
                var_msg.Add( '* La provincia de quien facturamos.');
            end;

            if Trim(FieldByName('id_paises').AsString) = '' then
            begin
                var_msg.Add( '* El país de quien facturamos.');
            end;

            if Trim(FieldByName('Numero_Presupuesto').AsString) = '' then
            begin
                var_msg.Add( '* El número para la próximo presupuesto a crear.');
            end;

            if Trim(FieldByName('Numero_Pedido').AsString) = '' then
            begin
                var_msg.Add( '* El número para la próximo pedido a crear.');
            end;

            if Trim(FieldByName('Numero_Albaran').AsString) = '' then
            begin
                var_msg.Add( '* El número para el próximo albarán/recibo a crear.');
            end;

            if Trim(FieldByName('Numero_Factura').AsString) = '' then
            begin
                var_msg.Add( '* El número para la próxima factura a crear.');
            end;

            if Trim(FieldByName('Numero_Abono').AsString) = '' then
            begin
                var_msg.Add( '* El número para el próximo abono a crear.');
            end;

            // ************************************************************************************* //
            // ** Comprobamos que las numeraciones puestas no existan ya para esta empresa        ** //
            // ************************************************************************************* //
            if state <> dsInsert then
            begin
                // ********************************************************************************* //
                // ** VENTAS. Comprobamos que no exista el número de abono                        ** //
                // ********************************************************************************* //
                var_Existe := UTI_CONTA_Existe_Ftra_Alb_Pdo_Pto( 'facturas_ventas',
                                                                 FieldByName('id').AsString,
                                                                 FieldByName('Serie_Abono').AsString,
                                                                 FieldByName('Numero_Abono').AsString );
                if var_Existe = 'ERROR' then
                begin
                    var_msg.Add( '* No se pudo comprobar si existe el abono de ventas.');
                end else begin
                    if var_Existe <> '0' then
                    begin
                        var_msg.Add( '* El abono de ventas ya existe.');
                    end;
                end;

                // ********************************************************************************* //
                // ** VENTAS. Comprobamos que no exista el número de factura                      ** //
                // ********************************************************************************* //
                var_Existe := UTI_CONTA_Existe_Ftra_Alb_Pdo_Pto( 'facturas_ventas',
                                                                 FieldByName('id').AsString,
                                                                 FieldByName('Serie_Factura').AsString,
                                                                 FieldByName('Numero_Factura').AsString );
                if var_Existe = 'ERROR' then
                begin
                    var_msg.Add( '* No se pudo comprobar si existe la factura de ventas.');
                end else begin
                    if var_Existe <> '0' then
                    begin
                        var_msg.Add( '* La factura de ventas ya existe.');
                    end;
                end;

                // ********************************************************************************* //
                // ** VENTAS. Comprobamos que no exista el número de albarán                      ** //
                // ********************************************************************************* //
                var_Existe := UTI_CONTA_Existe_Ftra_Alb_Pdo_Pto( 'albaranes_ventas',
                                                                 FieldByName('id').AsString,
                                                                 FieldByName('Serie_Albaran').AsString,
                                                                 FieldByName('Numero_Albaran').AsString );
                if var_Existe = 'ERROR' then
                begin
                    var_msg.Add( '* No se pudo comprobar si existe el albarán de ventas.');
                end else begin
                    if var_Existe <> '0' then
                    begin
                        var_msg.Add( '* El albarán de ventas ya existe.');
                    end;
                end;

                // ********************************************************************************* //
                // ** VENTAS. Comprobamos que no exista el número de pedido                       ** //
                // ********************************************************************************* //
                var_Existe := UTI_CONTA_Existe_Ftra_Alb_Pdo_Pto( 'pedidos_ventas',
                                                                 FieldByName('id').AsString,
                                                                 FieldByName('Serie_Pedido').AsString,
                                                                 FieldByName('Numero_Pedido').AsString );
                if var_Existe = 'ERROR' then
                begin
                    var_msg.Add( '* No se pudo comprobar si existe el pedido de ventas.');
                end else begin
                    if var_Existe <> '0' then
                    begin
                        var_msg.Add( '* El pedido de ventas ya existe.');
                    end;
                end;

                // ********************************************************************************* //
                // ** VENTAS. Comprobamos que no exista el número de presupuesto                  ** //
                // ********************************************************************************* //
                var_Existe := UTI_CONTA_Existe_Ftra_Alb_Pdo_Pto( 'presupuestos_ventas',
                                                                 FieldByName('id').AsString,
                                                                 FieldByName('Serie_Presupuesto').AsString,
                                                                 FieldByName('Numero_Presupuesto').AsString );
                if var_Existe = 'ERROR' then
                begin
                    var_msg.Add( '* No se pudo comprobar si existe el presupuesto de ventas.');
                end else begin
                    if var_Existe <> '0' then
                    begin
                        var_msg.Add( '* El presupuesto de ventas ya existe.');
                    end;
                end;

                // ********************************************************************************* //
                // ** COMPRAS. Comprobamos que no exista el número de abono                       ** //
                // ********************************************************************************* //
                var_Existe := UTI_CONTA_Existe_Ftra_Alb_Pdo_Pto( 'facturas_compras',
                                                                 FieldByName('id').AsString,
                                                                 FieldByName('Serie_Abono_Compras').AsString,
                                                                 FieldByName('Numero_Abono_Compras').AsString );
                if var_Existe = 'ERROR' then
                begin
                    var_msg.Add( '* No se pudo comprobar si existe el abono de compras.');
                end else begin
                    if var_Existe <> '0' then
                    begin
                        var_msg.Add( '* El abono de compras ya existe.');
                    end;
                end;

                // ********************************************************************************* //
                // ** COMPRAS. Comprobamos que no exista el número de factura                     ** //
                // ********************************************************************************* //
                var_Existe := UTI_CONTA_Existe_Ftra_Alb_Pdo_Pto( 'facturas_compras',
                                                                 FieldByName('id').AsString,
                                                                 FieldByName('Serie_Factura_Compras').AsString,
                                                                 FieldByName('Numero_Factura_Compras').AsString );
                if var_Existe = 'ERROR' then
                begin
                    var_msg.Add( '* No se pudo comprobar si existe la factura de compras.');
                end else begin
                    if var_Existe <> '0' then
                    begin
                        var_msg.Add( '* La factura de compras ya existe.');
                    end;
                end;

                // ********************************************************************************* //
                // ** COMPRAS. Comprobamos que no exista el número de albarán                     ** //
                // ********************************************************************************* //
                var_Existe := UTI_CONTA_Existe_Ftra_Alb_Pdo_Pto( 'albaranes_compras',
                                                                 FieldByName('id').AsString,
                                                                 FieldByName('Serie_Albaran_Compras').AsString,
                                                                 FieldByName('Numero_Albaran_Compras').AsString );
                if var_Existe = 'ERROR' then
                begin
                    var_msg.Add( '* No se pudo comprobar si existe el albarán de compras.');
                end else begin
                    if var_Existe <> '0' then
                    begin
                        var_msg.Add( '* El albarán de compras ya existe.');
                    end;
                end;

                // ********************************************************************************* //
                // ** COMPRAS. Comprobamos que no exista el número de pedido                      ** //
                // ********************************************************************************* //
                var_Existe := UTI_CONTA_Existe_Ftra_Alb_Pdo_Pto( 'pedidos_compras',
                                                                 FieldByName('id').AsString,
                                                                 FieldByName('Serie_Pedido_Compras').AsString,
                                                                 FieldByName('Numero_Pedido_Compras').AsString );
                if var_Existe = 'ERROR' then
                begin
                    var_msg.Add( '* No se pudo comprobar si existe el pedido de compras.');
                end else begin
                    if var_Existe <> '0' then
                    begin
                        var_msg.Add( '* El pedido de compras ya existe.');
                    end;
                end;

                // ********************************************************************************* //
                // ** COMPRAS. Comprobamos que no exista el número de presupuesto                 ** //
                // ********************************************************************************* //
                var_Existe := UTI_CONTA_Existe_Ftra_Alb_Pdo_Pto( 'presupuestos_compras',
                                                                 FieldByName('id').AsString,
                                                                 FieldByName('Serie_Presupuesto_Compras').AsString,
                                                                 FieldByName('Numero_Presupuesto_Compras').AsString );
                if var_Existe = 'ERROR' then
                begin
                    var_msg.Add( '* No se pudo comprobar si existe el presupuesto de compras.');
                end else begin
                    if var_Existe <> '0' then
                    begin
                        var_msg.Add( '* El presupuesto de compras ya existe.');
                    end;
                end;
            end;
        end;
    end;

    if private_Salir_OK = false then
    begin
        // ***************************************************************************************** //
        // ** Intento BitBtn_SALIR de la aplicación de un modo no permitido.                  ** //
        // ***************************************************************************************** //
        // ** Pero si desde el menu principal está a true la variable public_Salir_Ok, significa  ** //
        // ** que hay que salir si o si pues se pulsó cancelar al preguntar otra vez por  la con- ** //
        // ** traseña                                                                             ** //
        // ***************************************************************************************** //
        if form_Menu.public_Salir_OK = False then CloseAction := caNone;
    end else begin
        // ***************************************************************************************** //
        // ** Fue correcto el modo como quiere salir de la aplicación                             ** //
        // ***************************************************************************************** //
        // ** Comprobaremos si no se generó algún error por falta de completar algun campo y si se** //
        // ** salió con el botón Ok o Cancel                                                      ** //
        // ***************************************************************************************** //
        if (Trim(var_msg_2.Text) <> '') and (public_Pulso_Aceptar = true) then
        begin
            UTI_GEN_Aviso(false, var_msg_2, rs_Falta, True, False);
        end;

        if (Trim(var_msg.Text) <> '') and (public_Pulso_Aceptar = true) then
        begin
            UTI_GEN_Aviso(true, var_msg, rs_Falta, True, False);
            CloseAction := caNone;
        end else begin
            CloseAction := caFree;
        end;
    end;

    var_msg_2.Free;
    var_msg.Free;
end;

procedure Tform_empresas_001.Presentar_Datos;
begin
    with form_empresas_000.SQLQuery_Empresas do
    begin
        Edit_Descripcion_Poblacion.Text := FieldByName('OT_descripcion_poblacion').AsString;
        Edit_Descripcion_Provincia.Text := FieldByName('OT_descripcion_provincia').AsString;
        Edit_Descripcion_Pais.Text      := FieldByName('OT_descripcion_pais').AsString;
    end;

    Presentar_Logo;
end;

procedure Tform_empresas_001.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := true;
end;

procedure Tform_empresas_001.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := True;
    public_Pulso_Aceptar := false;
end;

procedure Tform_empresas_001.no_Tocar;
begin
    DBEdit_nombre_comercial.Enabled          := False;
    DBEdit_Responsable.Enabled               := False;
    DBEdit_NIF_CIF.Enabled                   := False;
    DBEdit_Direccion.Enabled                 := False;
    DBEdit_Direccion_Numero.Enabled          := False;
    DBEdit_Direccion_Piso_Letra.Enabled      := False;
    DBEdit_Codigo_Postal.Enabled             := False;
    Boton_Buscar_Direccion.Enabled           := False;
    Boton_Elegir_Poblacion.Enabled           := False;
    Edit_Descripcion_Poblacion.Enabled       := False;
    Boton_Elegir_Provincia.Enabled           := False;
    Edit_Descripcion_Provincia.Enabled       := False;
    Boton_Elegir_Pais.Enabled                := False;
    Edit_Descripcion_Pais.Enabled            := False;
    GroupBox_Telefonos.Enabled               := False;
    GroupBox_Internet.Enabled                := False;
    GroupBox_Next_Presupuesto.Enabled        := False;
    GroupBox_Next_Pedido.Enabled             := False;
    GroupBox_Next_Albaran.Enabled            := False;
    GroupBox_Next_Factura.Enabled            := False;
    DBMemo_Observaciones_Comentarios.Enabled := False;
    GroupBox_Logotipo.Enabled                := False;
end;

procedure Tform_empresas_001.FormCreate(Sender: TObject);
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

procedure Tform_empresas_001.para_Empezar;
begin
    { ****************************************************************************
      Solo para formularios que traten con datos
      **************************************************************************** }
      with form_empresas_000.SQLQuery_Empresas do
      begin
          public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                             '',
                                                             '',
                                                             FieldByName('nombre_comercial').AsString,
                                                             '',
                                                             '' );
      end;

      Presentar_Datos;
end;

procedure Tform_empresas_001.Boton_Elegir_PoblacionClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_empresas_000.SQLQuery_Empresas do
    begin
        var_Registro := UTI_Abrir_Modulo_Poblaciones( true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_poblaciones').AsString := Trim(var_Registro.id_1);
             FieldByName('id_provincias').AsString  := Trim(var_Registro.id_2);
             FieldByName('id_paises').AsString      := Trim(var_Registro.id_3);

             Edit_Descripcion_Poblacion.Text        := var_Registro.descripcion_1;
             Edit_Descripcion_Provincia.Text        := var_Registro.descripcion_2;
             Edit_Descripcion_Pais.Text             := var_Registro.descripcion_3;
        end;
    end;
end;

procedure Tform_empresas_001.Boton_Elegir_PaisClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_empresas_000.SQLQuery_Empresas do
    begin
        var_Registro := UTI_Abrir_Modulo_Paises( true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_paises').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Pais.Text        := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_empresas_001.Boton_Elegir_ProvinciaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_empresas_000.SQLQuery_Empresas do
    begin
        var_Registro := UTI_Abrir_Modulo_Provincias( true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_provincias').AsString := Trim(var_Registro.id_1);
             FieldByName('id_paises').AsString     := Trim(var_Registro.id_2);
             Edit_Descripcion_Provincia.Text       := var_Registro.descripcion_1;
             Edit_Descripcion_Pais.Text            := var_Registro.descripcion_2;
        end;
    end;
end;

procedure Tform_empresas_001.Edit_Descripcion_PaisClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS el PAIS');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_empresas_000.SQLQuery_Empresas.FieldByName('id_paises').Clear;
         Edit_Descripcion_Pais.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_empresas_001.Edit_Descripcion_PoblacionClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS la POBLACIÓN');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_empresas_000.SQLQuery_Empresas.FieldByName('id_poblaciones').Clear;
         Edit_Descripcion_Poblacion.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_empresas_001.Edit_Descripcion_ProvinciaClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS la PROVINCIA');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_empresas_000.SQLQuery_Empresas.FieldByName('id_provincias').Clear;
         Edit_Descripcion_Provincia.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_empresas_001.Presentar_Logo;
var var_logo : String;
    var_Info : TSearchRec;
begin
    if Trim(form_empresas_000.SQLQuery_Empresas.FieldByName('id').AsString) <> '' then
    begin
        var_logo := form_menu.public_path_empresas_logos +
                    Trim(form_empresas_000.SQLQuery_Empresas.FieldByName('id').AsString);

        If FindFirst( var_logo + '.*',
                      faAnyFile and faDirectory,
                      var_Info ) = 0 then
        begin
            ImgLogo.Picture.LoadFromFile( form_menu.public_path_empresas_logos + var_Info.Name );
        end;
    end;
end;

procedure Tform_empresas_001.BotonFotosClick(Sender: TObject);
var var_se_Copio     : String;
    var_msg          : TStrings;
    var_FileName_New : String;
begin
    if OpenPictureDialog1.Execute then
    begin
        If OpenPictureDialog1.Filename <> '' then
        begin
          { var_msg := TStringList.Create;
            var_msg.Add( 'FileName      : ' + OpenPictureDialog1.FileName );
            var_msg.Add( 'Has Name      : ' + ExtractFileName(OpenPictureDialog1.FileName) );
            var_msg.Add( 'Has Path      : ' + ExtractFilePath(OpenPictureDialog1.FileName) );
            var_msg.Add( 'Has Extension : ' + ExtractFileExt(OpenPictureDialog1.FileName) );
            var_msg.Add( 'Has Directory : ' + ExtractFileDir(OpenPictureDialog1.FileName) );
            var_msg.Add( 'Has Drive     : ' + ExtractFileDrive(OpenPictureDialog1.FileName) );
            UTI_GEN_Aviso(true, var_msg, 'EL FICHERO ELEGIDO.-', True, False);
            var_msg.Free; }

            var_FileName_New := Trim(form_empresas_000.SQLQuery_Empresas.FieldByName('id').AsString) +
                                ExtractFileExt(OpenPictureDialog1.FileName);

            var_se_Copio := UTI_GEN_Copiar_Fichero( ExtractFilePath(OpenPictureDialog1.FileName),
                                                    form_menu.public_path_empresas_logos,
                                                    ExtractFileName(OpenPictureDialog1.FileName),
                                                    var_FileName_New,
                                                    'S' );

            if Trim(var_se_Copio) <> '' then
            begin
                var_msg := TStringList.Create;
                var_msg.Text := Trim(var_se_Copio);
                UTI_GEN_Aviso(true, var_msg, rs_Falta, True, False);
                var_msg.Free;

                Exit;
            end;

            Presentar_Logo;
        end;
    end;
end;

end.


