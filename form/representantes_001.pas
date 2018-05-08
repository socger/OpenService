unit representantes_001;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ButtonPanel, ExtCtrls, EditBtn,
    utilidades_general, utilidades_forms_Filtrar, StdCtrls, DbCtrls, Buttons, ComCtrls, DBGrids, db,
    utilidades_contabilidad;

type

    { Tform_representantes_001 }

    Tform_representantes_001 = class(TForm)
      BitBtn_eMAIL: TBitBtn;
      BitBtn_eMAIL1: TBitBtn;
        BitBtn_SMS: TBitBtn;
        Boton_Elegir_Cta_Bco_Pais: TBitBtn;
        Boton_Elegir_Cta_Bco_Poblacion: TBitBtn;
        Boton_Elegir_Cta_Bco_Provincia: TBitBtn;
        Boton_Elegir_Forma_Pago: TBitBtn;
        Boton_Elegir_Pais: TBitBtn;
        Boton_Elegir_Pais1: TBitBtn;
        Boton_Elegir_Poblacion: TBitBtn;
        Boton_Elegir_Provincia: TBitBtn;
        Boton_Elegir_Provincia1: TBitBtn;
        ButtonPanel1: TButtonPanel;
        DateEdit_Cta_Bco_Mandato_Fecha_de_Firma: TDateEdit;
        DateEdit_Fecha_Nacimiento: TDateEdit;
        DBCheckBox_Activar_Proximidad_SN: TDBCheckBox;
        DBCheckBox_IVA_con_Recargo_SN: TDBCheckBox;
        DBCheckBox_IVA_Excluido_SN: TDBCheckBox;
        DBCheckBox_Vencimientos_automaticos_SN: TDBCheckBox;
        DBEdit_Comision: TDBEdit;
        DBEdit_Cuenta_Contable: TDBEdit;
        DBEdit_eMail: TDBEdit;
        DBEdit_eMail1: TDBEdit;
        DBEdit_nombre: TDBEdit;
        DBEdit_Codigo_Postal: TDBEdit;
        DBEdit_Cta_Bco_BIC_SWIFT: TDBEdit;
        DBEdit_Cta_Bco_Cuenta: TDBEdit;
        DBEdit_Cta_Bco_Digito_Control: TDBEdit;
        DBEdit_Cta_Bco_Entidad: TDBEdit;
        DBEdit_Cta_Bco_IBAN: TDBEdit;
        DBEdit_Cta_Bco_Mandato_Ref: TDBEdit;
        DBEdit_Cta_Bco_Sucursal: TDBEdit;
        DBEdit_DBEdit_Cta_Bco_Direccion: TDBEdit;
        DBEdit_DBEdit_Cta_Bco_Direccion_Codigo_Postal: TDBEdit;
        DBEdit_DBEdit_Cta_Bco_Direccion_Numero: TDBEdit;
        DBEdit_DBEdit_Cta_Bco_Direccion_Piso_Letra: TDBEdit;
        DBEdit_Direccion: TDBEdit;
        DBEdit_Direccion_Numero: TDBEdit;
        DBEdit_Direccion_Piso_Letra: TDBEdit;
        DBEdit_FAX: TDBEdit;
        DBEdit_Forma_pago_Dia_1: TDBEdit;
        DBEdit_Forma_pago_Dia_2: TDBEdit;
        DBEdit_Forma_pago_Vacaciones_Dia_Fin: TDBEdit;
        DBEdit_Forma_pago_Vacaciones_Dia_Inicio: TDBEdit;
        DBEdit_Forma_pago_Vacaciones_Mes_Fin: TDBEdit;
        DBEdit_Forma_pago_Vacaciones_Mes_Inicio: TDBEdit;
        DBEdit_Movil: TDBEdit;
        DBEdit_NIF_CIF: TDBEdit;
        DBEdit_Nombre_Comercial: TDBEdit;
        DBEdit_Pagina_Web: TDBEdit;
        DBEdit_Retencion: TDBEdit;
        DBEdit_Saldo_Acumulado: TDBEdit;
        DBEdit_Tfno_Fijo_1: TDBEdit;
        DBEdit_Tfno_Fijo_2: TDBEdit;
        DBMemo_Observaciones_Comentarios: TDBMemo;
        Edit_Cta_Bco_Descripcion_Pais: TEdit;
        Edit_Cta_Bco_Descripcion_Poblacion: TEdit;
        Edit_Cta_Bco_Descripcion_Provincia: TEdit;
        Edit_Descripcion_Forma_Pago: TEdit;
        Edit_Descripcion_Pais: TEdit;
        Edit_Descripcion_Poblacion: TEdit;
        Edit_Descripcion_Provincia: TEdit;
        GroupBox1: TGroupBox;
        GroupBox11: TGroupBox;
        GroupBox2: TGroupBox;
        GroupBox3: TGroupBox;
        GroupBox6: TGroupBox;
        GroupBox7: TGroupBox;
        GroupBox8: TGroupBox;
        GroupBox9: TGroupBox;
        Label1: TLabel;
        Label10: TLabel;
        Label11: TLabel;
        Label12: TLabel;
        Label13: TLabel;
        Label14: TLabel;
        Label15: TLabel;
        Label16: TLabel;
        Label2: TLabel;
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
        Label38: TLabel;
        Label39: TLabel;
        Label4: TLabel;
        Label40: TLabel;
        Label41: TLabel;
        Label42: TLabel;
        Label44: TLabel;
        Label45: TLabel;
        Label46: TLabel;
        Label47: TLabel;
        Label5: TLabel;
        Label50: TLabel;
        Label51: TLabel;
        Label52: TLabel;
        Label58: TLabel;
        Label59: TLabel;
        Label6: TLabel;
        Label61: TLabel;
        Label62: TLabel;
        Label7: TLabel;
        Label8: TLabel;
        Label9: TLabel;
        Label_Fecha: TLabel;
        Label_Fecha1: TLabel;
        PageControl_Otros_Datos: TPageControl;
        TabSheet2: TTabSheet;
        TabSheet_DatosAdicionales: TTabSheet;

        procedure BitBtn_eMAILClick(Sender: TObject);
        function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
        procedure Actualizar_Campos_Fecha_Hora_Si_Completado( param_msg : TStrings );
        procedure Comprobar_Toda_Fecha_Hora( param_msg : TStrings );
        procedure BitBtn_SMSClick(Sender: TObject);
        procedure Comprobar_Vencimientos(param_msg : TStrings);
        procedure Boton_Elegir_Cta_Bco_PaisClick(Sender: TObject);
        procedure Boton_Elegir_Cta_Bco_PoblacionClick(Sender: TObject);
        procedure Boton_Elegir_Cta_Bco_ProvinciaClick(Sender: TObject);
        procedure Boton_Elegir_Forma_PagoClick(Sender: TObject);
        procedure Boton_Elegir_PoblacionClick(Sender: TObject);
        procedure Edit_Cta_Bco_Descripcion_PaisClick(Sender: TObject);
        procedure Edit_Cta_Bco_Descripcion_PoblacionClick(Sender: TObject);
        procedure Edit_Cta_Bco_Descripcion_ProvinciaClick(Sender: TObject);
        procedure Edit_Descripcion_Forma_PagoClick(Sender: TObject);
        procedure Edit_Descripcion_PoblacionClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure Presentar_Datos;
        procedure no_Tocar;
        procedure Boton_Elegir_PaisClick(Sender: TObject);
        procedure Boton_Elegir_ProvinciaClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
        procedure Edit_Descripcion_PaisClick(Sender: TObject);
        procedure Edit_Descripcion_ProvinciaClick(Sender: TObject);
        procedure FormActivate(Sender: TObject);
        procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
        procedure para_Empezar;
        procedure OKButtonClick(Sender: TObject);
    private
        { private declarations }
        private_Salir_OK : Boolean;
    public
        { public declarations }
        public_Solo_Ver      : Boolean;
        public_Menu_Worked   : Integer;
        public_Pulso_Aceptar : Boolean;
        public_Record_Rgtro  : TRecord_Rgtro_Comun;
    end;

var
    form_representantes_001: Tform_representantes_001;

implementation

{$R *.lfm}

uses menu, representantes_000;

{ Tform_representantes_001 }

procedure Tform_representantes_001.FormActivate(Sender: TObject);
begin
    If form_representantes_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    Comprobar_No_Tocar(true, true);
end;

function Tform_representantes_001.Comprobar_No_Tocar( param_Reproducir_Mensajes,
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

procedure Tform_representantes_001.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := True;
    public_Pulso_Aceptar := false;
end;

procedure Tform_representantes_001.Edit_Descripcion_PaisClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS el PAIS');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_representantes_000.SQLQuery_Representantes.FieldByName('id_paises').Clear;
         Edit_Descripcion_Pais.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_representantes_001.Edit_Descripcion_ProvinciaClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS la PROVINCIA');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_representantes_000.SQLQuery_Representantes.FieldByName('id_provincias').Clear;
         Edit_Descripcion_Provincia.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_representantes_001.Boton_Elegir_PaisClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_representantes_000.SQLQuery_Representantes do
    begin
        var_Registro := UTI_Abrir_Modulo_Paises( true, false, 60, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_paises').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Pais.Text        := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_representantes_001.Boton_Elegir_ProvinciaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_representantes_000.SQLQuery_Representantes do
    begin
        var_Registro := UTI_Abrir_Modulo_Provincias( true, false, 100, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_provincias').AsString := Trim(var_Registro.id_1);
             FieldByName('id_paises').AsString     := Trim(var_Registro.id_2);
             Edit_Descripcion_Provincia.Text       := var_Registro.descripcion_1;
             Edit_Descripcion_Pais.Text            := var_Registro.descripcion_2;
        end;
    end;
end;

procedure Tform_representantes_001.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := True;
    public_Pulso_Aceptar := true;
end;

procedure Tform_representantes_001.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg : TStrings;
begin
    ButtonPanel1.SetFocus; // Con esto consigo que salga del campo que este y pueda actualizarlo

    var_msg := TStringList.Create;

    if public_Pulso_Aceptar = true then
    begin
        with form_representantes_000.SQLQuery_Representantes do
        begin
            Comprobar_Toda_Fecha_Hora(var_msg);

            if Trim(FieldByName('nombre_propietario').AsString) = '' then
            begin
                var_msg.Add( '* El nombre/descripción.');
            end;

            if Trim(FieldByName('Direccion').AsString) = '' then
            begin
                var_msg.Add( '* La dirección.');
            end;

            if Trim(FieldByName('id_poblaciones').AsString) = '' then
            begin
                var_msg.Add( '* La población.');
            end;

            if Trim(FieldByName('id_provincias').AsString) = '' then
            begin
                var_msg.Add( '* La provincia.');
            end;

            if Trim(FieldByName('id_paises').AsString) = '' then
            begin
                var_msg.Add( '* El país.');
            end;

            if Trim(FieldByName('id_formas_pago').AsString) = '' then
            begin
                var_msg.Add( '* La forma de pago.');
            end;

            Comprobar_Vencimientos(var_msg);

            if Trim(FieldByName('Vencimientos_automaticos_SN').AsString) = '' then
            begin
                var_msg.Add( '* Con vencimientos automáticos (Si/No).');
            end;

            if Trim(FieldByName('IVA_con_Recargo_SN').AsString) = '' then
            begin
                var_msg.Add( '* Con RECARGO (Si/No) en REGIMEN DE IVA bajo DATOS COMERCIALES.');
            end;

            if Trim(FieldByName('IVA_Excluido_SN').AsString) = '' then
            begin
                var_msg.Add( '* Con IVA EXCLUIDO (Si/No) en REGIMEN DE IVA bajo DATOS COMERCIALES.');
            end;

            if Trim(FieldByName('Activar_Proximidad_SN').AsString) = '' then
            begin
                var_msg.Add( '* Con actividad de proximidad (Si/No).');
            end;

            form_Menu.Traer_Configuracion_APP;

            UTI_CONTA_esta_NIF_BIEN( form_menu.public_User_Configuracion.Representantes_Obligar_NIF_SN,  //.... aqui tambien permitir el control de exigirlo o no
                                     var_msg,
                                     form_representantes_000.SQLQuery_Representantes,
                                     'representantes' );

            UTI_CONTA_esta_Cta_Ctble_BIEN( form_menu.public_User_Configuracion.Representantes_Obligar_Cuenta_Contable_SN, //.... aqui tambien permitir el control de exigirlo o no
                                           var_msg,
                                           form_representantes_000.SQLQuery_Representantes,
                                           '',
                                           'representantes',
                                           'Cuenta_Contable',
                                           'LA CUENTA CONTABLE' );
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

procedure Tform_representantes_001.no_Tocar;
begin
    DBEdit_nombre.Enabled                                 := False;
    DBEdit_Nombre_Comercial.Enabled                       := False;
    DBEdit_NIF_CIF.Enabled                                := False;
    DBEdit_Direccion.Enabled                              := False;
    DBEdit_Direccion_Numero.Enabled                       := False;
    DBEdit_Direccion_Piso_Letra.Enabled                   := False;
    DBEdit_Codigo_Postal.Enabled                          := False;
    Boton_Elegir_Poblacion.Enabled                        := False;
    Edit_Descripcion_Poblacion.Enabled                    := False;
    Boton_Elegir_Provincia.Enabled                        := False;
    Edit_Descripcion_Provincia.Enabled                    := False;
    Boton_Elegir_Pais.Enabled                             := False;
    Edit_Descripcion_Pais.Enabled                         := False;
    DBEdit_Tfno_Fijo_1.Enabled                            := False;
    DBEdit_Tfno_Fijo_2.Enabled                            := False;
    DBEdit_FAX.Enabled                                    := False;
    BitBtn_SMS.Enabled                                    := False;
    DBEdit_Movil.Enabled                                  := False;

    DateEdit_Fecha_Nacimiento.Enabled                     := False;
    DBEdit_eMail.Enabled                                  := False;
    DBEdit_Pagina_Web.Enabled                             := False;
    DBEdit_Cuenta_Contable.Enabled                        := False;
    DBMemo_Observaciones_Comentarios.Enabled              := False;

    DBEdit_Cta_Bco_Entidad.Enabled                        := False;
    DBEdit_Cta_Bco_Sucursal.Enabled                       := False;
    DBEdit_Cta_Bco_Digito_Control.Enabled                 := False;
    DBEdit_Cta_Bco_Cuenta.Enabled                         := False;
    DBEdit_Cta_Bco_BIC_SWIFT.Enabled                      := False;
    DBEdit_Cta_Bco_IBAN.Enabled                           := False;
    DBEdit_DBEdit_Cta_Bco_Direccion.Enabled               := False;
    DBEdit_DBEdit_Cta_Bco_Direccion_Numero.Enabled        := False;
    DBEdit_DBEdit_Cta_Bco_Direccion_Piso_Letra.Enabled    := False;
    DBEdit_DBEdit_Cta_Bco_Direccion_Codigo_Postal.Enabled := False;
    DateEdit_Cta_Bco_Mandato_Fecha_de_Firma.Enabled       := False;
    DBEdit_Cta_Bco_Mandato_Ref.Enabled                    := False;
    Boton_Elegir_Forma_Pago.Enabled                       := False;
    Edit_Descripcion_Forma_Pago.Enabled                   := False;
    DBEdit_Forma_pago_Dia_1.Enabled                       := False;
    DBEdit_Forma_pago_Dia_2.Enabled                       := False;
    DBEdit_Forma_pago_Vacaciones_Dia_Inicio.Enabled       := False;
    DBEdit_Forma_pago_Vacaciones_Mes_Inicio.Enabled       := False;
    DBEdit_Forma_pago_Vacaciones_Dia_Fin.Enabled          := False;
    DBEdit_Forma_pago_Vacaciones_Mes_Fin.Enabled          := False;
    DBCheckBox_Vencimientos_automaticos_SN.Enabled        := False;

    DBCheckBox_IVA_Excluido_SN.Enabled                    := False;
    DBCheckBox_IVA_con_Recargo_SN.Enabled                 := False;
    DBEdit_Retencion.Enabled                              := False;
    DBEdit_Saldo_Acumulado.Enabled                        := False;
    DBEdit_Comision.Enabled                               := False;

    DBCheckBox_Activar_Proximidad_SN.Enabled              := False;
end;

procedure Tform_representantes_001.Presentar_Datos;
var var_Hora : tTime;
    var_Dia  : tDate;
begin
    with form_representantes_000.SQLQuery_Representantes do
    begin
        Edit_Descripcion_Poblacion.Text          := FieldByName('OT_descripcion_poblacion').AsString;
        Edit_Descripcion_Provincia.Text          := FieldByName('OT_descripcion_provincia').AsString;
        Edit_Descripcion_Pais.Text               := FieldByName('OT_descripcion_pais').AsString;

        Edit_Cta_Bco_Descripcion_Poblacion.Text  := FieldByName('OT_Cta_Bco_descripcion_poblacion').AsString;
        Edit_Cta_Bco_Descripcion_Provincia.Text  := FieldByName('OT_Cta_Bco_descripcion_provincia').AsString;
        Edit_Cta_Bco_Descripcion_Pais.Text       := FieldByName('OT_Cta_Bco_descripcion_pais').AsString;

        Edit_Descripcion_Forma_Pago.Text         := FieldByName('OT_descripcion_forma_pago').AsString;

        if not FieldByName('Fecha_Nacimiento').IsNull then
        begin
            var_Dia                        := FieldByName('Fecha_Nacimiento').AsDateTime;
            DateEdit_Fecha_Nacimiento.Text := DateToStr(var_Dia);
        end;

        if not FieldByName('Cta_Bco_Mandato_Fecha_de_Firma').IsNull then
        begin
            var_Dia  := FieldByName('Cta_Bco_Mandato_Fecha_de_Firma').AsDateTime;
            DateEdit_Cta_Bco_Mandato_Fecha_de_Firma.Text := DateToStr(var_Dia);
        end;
    end;
end;

procedure Tform_representantes_001.Boton_Elegir_PoblacionClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_representantes_000.SQLQuery_Representantes do
    begin
        var_Registro := UTI_Abrir_Modulo_Poblaciones( true, false, 110, '1' );
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

procedure Tform_representantes_001.Edit_Descripcion_PoblacionClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS la POBLACIÓN');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_representantes_000.SQLQuery_Representantes.FieldByName('id_poblaciones').Clear;
         Edit_Descripcion_Poblacion.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_representantes_001.Boton_Elegir_Cta_Bco_PoblacionClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_representantes_000.SQLQuery_Representantes do
    begin
        var_Registro := UTI_Abrir_Modulo_Poblaciones( true, false, 110, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_Cta_Bco_poblaciones').AsString := Trim(var_Registro.id_1);
             FieldByName('id_Cta_Bco_provincias').AsString  := Trim(var_Registro.id_2);
             FieldByName('id_Cta_Bco_pais').AsString        := Trim(var_Registro.id_3);
             Edit_Cta_Bco_Descripcion_Poblacion.Text        := var_Registro.descripcion_1;
             Edit_Cta_Bco_Descripcion_Provincia.Text        := var_Registro.descripcion_2;
             Edit_Cta_Bco_Descripcion_Pais.Text             := var_Registro.descripcion_3;
        end;
    end;
end;

procedure Tform_representantes_001.Edit_Cta_Bco_Descripcion_PoblacionClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS la POBLACIÓN del banco?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_representantes_000.SQLQuery_Representantes.FieldByName('id_Cta_Bco_poblaciones').Clear;
         Edit_Cta_Bco_Descripcion_Poblacion.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_representantes_001.Boton_Elegir_Cta_Bco_ProvinciaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_representantes_000.SQLQuery_Representantes do
    begin
        var_Registro := UTI_Abrir_Modulo_Provincias( true, false, 100, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_Cta_Bco_provincias').AsString := Trim(var_Registro.id_1);
             FieldByName('id_Cta_Bco_pais').AsString       := Trim(var_Registro.id_2);
             Edit_Cta_Bco_Descripcion_Provincia.Text       := var_Registro.descripcion_1;
             Edit_Cta_Bco_Descripcion_Pais.Text            := var_Registro.descripcion_2;
        end;
    end;
end;

procedure Tform_representantes_001.Edit_Cta_Bco_Descripcion_ProvinciaClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS la PROVINCIA del banco?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_representantes_000.SQLQuery_Representantes.FieldByName('id_Cta_Bco_provincias').Clear;
         Edit_Cta_Bco_Descripcion_Provincia.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_representantes_001.Boton_Elegir_Cta_Bco_PaisClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_representantes_000.SQLQuery_Representantes do
    begin
        var_Registro := UTI_Abrir_Modulo_Paises( true, false, 60, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_Cta_Bco_pais').AsString := Trim(var_Registro.id_1);
             Edit_Cta_Bco_Descripcion_Pais.Text      := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_representantes_001.Edit_Cta_Bco_Descripcion_PaisClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS el PAIS del banco?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_representantes_000.SQLQuery_Representantes.FieldByName('id_Cta_Bco_pais').Clear;
         Edit_Cta_Bco_Descripcion_Pais.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_representantes_001.Boton_Elegir_Forma_PagoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_representantes_000.SQLQuery_Representantes do
    begin
        var_Registro := UTI_Abrir_Modulo_FormasPago( true, false, 80, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_formas_pago').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Forma_Pago.Text       := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_representantes_001.Edit_Descripcion_Forma_PagoClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS la FORMA DE PAGO?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_representantes_000.SQLQuery_Representantes.FieldByName('id_formas_pago').Clear;
         Edit_Descripcion_Forma_Pago.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_representantes_001.Comprobar_Vencimientos(param_msg : TStrings);
begin
    with form_representantes_000.SQLQuery_Representantes do
    begin
        if Trim(FieldByName('Vencimientos_automaticos_SN').AsString) = '' then
        begin
            param_msg.Add( '* Generar vencimientos automáticos (Si/No) en la gestión de cobro.');
        end;
    end;
end;

procedure Tform_representantes_001.BitBtn_SMSClick(Sender: TObject);
begin
    UTI_GEN_Enviar_SMS;
end;

procedure Tform_representantes_001.Comprobar_Toda_Fecha_Hora( param_msg : TStrings );
var var_msg : TStrings;
begin
    Actualizar_Campos_Fecha_Hora_Si_Completado(param_msg);

  { ************************************************************************************************
    ** COMPROBAR CUALES SON OBLIGADOS O DE SÓLO AVISO                                             **
    ************************************************************************************************ }
  { ** Cuando un campo de fecha o hora es de introducción obligatoria                             **
    ************************************************************************************************
    if DateEdit_Fecha_Nacimiento.Text  = '  /  /    ' then
    begin
         param_msg.Add( '* La fecha de nacimiento de quien facturamos' );
    end;

    ************************************************************************************************
    ** Cuando un campo de fecha o hora es de solo aviso, pero no introducción obligatoria         **
    ************************************************************************************************
    if DateEdit_Fecha_Nacimiento.Text  = '  /  /    ' then
    begin
         var_msg := TStringList.Create;
         var_msg.Add('** NO SE HA INTRODUCIDO LA FECHA DE NACIMIENTO DE QUIEN FACTURAMOS ** ');
         UTI_GEN_Aviso(true, var_msg, 'AVISAMOS DE ... ', True, False);
         var_msg.Free;
    end; }
end;

procedure Tform_representantes_001.Actualizar_Campos_Fecha_Hora_Si_Completado( param_msg : TStrings );
var var_Fecha_Hora : ShortString;
begin
    WITH form_representantes_000.SQLQuery_Representantes DO
    BEGIN
      { ********************************************************************************************
        ** FECHA DE NACIMIENTO                                                                    **
        ******************************************************************************************** }
        var_Fecha_Hora := '';
        if DateEdit_Fecha_Nacimiento.Text <> '  /  /    ' then
        begin
             var_Fecha_Hora := DateEdit_Fecha_Nacimiento.Text;
        end;

      { ********************************************************************************************
        ** Por si tiene control de hora                                                           **
        ********************************************************************************************
        if MaskEdit_Hora_Inicio.Text <> '  :  :  '     then
        begin
            if var_Fecha_Hora <> '' then
                 var_Fecha_Hora := var_Fecha_Hora + ' ' + MaskEdit_Hora_Inicio.Text
            else var_Fecha_Hora := MaskEdit_Hora_Inicio.Text;
        end; }

        Try
            if var_Fecha_Hora <> '' then
                begin
                     FieldByName('Fecha_Nacimiento').AsString := var_Fecha_Hora;
                end
            else
                begin
                    FieldByName('Fecha_Nacimiento').Clear;
                end;
        Except
            param_msg.Add('** ERROR en el campo FECHA DE NACIMIENTO **');
        end;

      { ********************************************************************************************
        ** FECHA DE FIRMA DEL MANDATO DE DATOS BANCARIOS                                          **
        ******************************************************************************************** }
        var_Fecha_Hora := '';
        if DateEdit_Cta_Bco_Mandato_Fecha_de_Firma.Text <> '  /  /    ' then
        begin
             var_Fecha_Hora := DateEdit_Cta_Bco_Mandato_Fecha_de_Firma.Text;
        end;

      { ********************************************************************************************
        ** Por si tiene control de hora                                                           **
        ********************************************************************************************
        if MaskEdit_Hora_Inicio.Text <> '  :  :  '     then
        begin
            if var_Fecha_Hora <> '' then
                 var_Fecha_Hora := var_Fecha_Hora + ' ' + MaskEdit_Hora_Inicio.Text
            else var_Fecha_Hora := MaskEdit_Hora_Inicio.Text;
        end; }

        Try
            if var_Fecha_Hora <> '' then
                   begin
                     FieldByName('Cta_Bco_Mandato_Fecha_de_Firma').AsString := var_Fecha_Hora;
                end
            else
                begin
                    FieldByName('Cta_Bco_Mandato_Fecha_de_Firma').Clear;
                end;
        Except
            param_msg.Add('** ERROR en el campo FECHA DE FIRMA del mandato de los datos bancarios **');
        end;
    END;
end;

procedure Tform_representantes_001.BitBtn_eMAILClick(Sender: TObject);
begin
      UTI_GEN_Enviar_eMAIL;
end;

procedure Tform_representantes_001.FormCreate(Sender: TObject);
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
      public_Solo_Ver     := false;
end;

procedure Tform_representantes_001.para_Empezar;
begin
    { ****************************************************************************
      Solo para formularios que traten con datos
      **************************************************************************** }
      with form_representantes_000.SQLQuery_Representantes do
      begin
          public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                             FieldByName('Comision').AsString,
                                                             FieldByName('Retencion').AsString,

                                                             FieldByName('nombre_propietario').AsString,
                                                             FieldByName('Tfno_Fijo_1').AsString,
                                                             FieldByName('Movil').AsString );
      end;

      Presentar_Datos;

    { ****************************************************************************
      SOLO PARA ESTE FORM
      **************************************************************************** }
      PageControl_Otros_Datos.ActivePage := TabSheet_DatosAdicionales;
end;

end.

