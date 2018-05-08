unit clientes_003;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ButtonPanel, ExtCtrls, StdCtrls,
    utilidades_usuarios, DbCtrls, EditBtn, Buttons, db, utilidades_general, utilidades_forms_Filtrar,
    utilidades_clientes;

type

    { Tform_clientes_003 }

    Tform_clientes_003 = class(TForm)
        BitBtn_SMS: TBitBtn;
        Boton_Elegir_Pais: TBitBtn;
        Boton_Elegir_Poblacion: TBitBtn;
        Boton_Elegir_Contacto: TBitBtn;
        Boton_Elegir_Provincia: TBitBtn;
        ButtonPanel1: TButtonPanel;
        DBCheckBox_IVA_Excluido_SN1: TDBCheckBox;
        DBEdit_a_quien_facturamos: TDBEdit;
        DBEdit_Codigo_Postal: TDBEdit;
        DBEdit_Direccion: TDBEdit;
        DBEdit_Direccion_Numero: TDBEdit;
        DBEdit_Direccion_Piso_Letra: TDBEdit;
        DBEdit_eMail1: TDBEdit;
        DBEdit_FAX: TDBEdit;
        DBEdit_Movil: TDBEdit;
        DBEdit_NIF_CIF: TDBEdit;
        DBEdit_Nombre_Comercial: TDBEdit;
        DBEdit_Tfno_Fijo_1: TDBEdit;
        DBEdit_Tfno_Fijo_2: TDBEdit;
        Edit_Descripcion_Pais: TEdit;
        Edit_Descripcion_Poblacion: TEdit;
        Edit_Descripcion_Contacto: TEdit;
        Edit_Descripcion_Provincia: TEdit;
        GroupBox1: TGroupBox;
        GroupBox11: TGroupBox;
        Label1: TLabel;
        Label10: TLabel;
        Label11: TLabel;
        Label12: TLabel;
        Label13: TLabel;
        Label14: TLabel;
        Label15: TLabel;
        Label16: TLabel;
        Label3: TLabel;
        Label4: TLabel;
        Label5: TLabel;
        Label6: TLabel;
        Label62: TLabel;
        Label7: TLabel;
        Label8: TLabel;
        Label9: TLabel;
        Panel1: TPanel;
        Panel_Mantenimiento: TPanel;

        procedure BitBtn_SMSClick(Sender: TObject);
        function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
        procedure Boton_Elegir_ContactoClick(Sender: TObject);
        procedure Boton_Elegir_PaisClick(Sender: TObject);
        procedure Boton_Elegir_PoblacionClick(Sender: TObject);
        procedure Boton_Elegir_ProvinciaClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
        procedure DBCheckBox_IVA_Excluido_SN1Change(Sender: TObject);
        procedure Edit_Descripcion_PaisChange(Sender: TObject);
        procedure Edit_Descripcion_PaisClick(Sender: TObject);
        procedure Edit_Descripcion_ContactoClick(Sender: TObject);
        procedure Edit_Descripcion_PoblacionClick(Sender: TObject);
        procedure Edit_Descripcion_ProvinciaClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure OKButtonClick(Sender: TObject);
        procedure Panel_MantenimientoClick(Sender: TObject);
        procedure Presentar_Datos;
        procedure no_Tocar;
        procedure Actualizar_Campos_Fecha_Hora_Si_Completado( param_msg : TStrings );
        procedure Comprobar_Toda_Fecha_Hora( param_msg : TStrings );
        procedure FormActivate(Sender: TObject);
        procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
        procedure para_Empezar;

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
    form_clientes_003: Tform_clientes_003;

implementation

{$R *.lfm}

uses menu, clientes_000, clientes_004;

{ Tform_clientes_003 }

procedure Tform_clientes_003.FormActivate(Sender: TObject);
begin
    If form_clientes_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    Comprobar_No_Tocar(true, true);
end;

function Tform_clientes_003.Comprobar_No_Tocar( param_Reproducir_Mensajes,
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

procedure Tform_clientes_003.Comprobar_Toda_Fecha_Hora( param_msg : TStrings );
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

procedure Tform_clientes_003.Presentar_Datos;
var var_Hora : tTime;
    var_Dia  : tDate;
begin
    WITH form_clientes_000.SQLQuery_Clientes_Envios do
    BEGIN
        Edit_Descripcion_Contacto.Text  := FieldByName('OT_descripcion_Contacto').AsString;
        Edit_Descripcion_Poblacion.Text := FieldByName('OT_descripcion_poblacion').AsString;
        Edit_Descripcion_Provincia.Text := FieldByName('OT_descripcion_provincia').AsString;
        Edit_Descripcion_Pais.Text      := FieldByName('OT_descripcion_pais').AsString;
    END;
end;

procedure Tform_clientes_003.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := True;
    public_Pulso_Aceptar := true;
end;

procedure Tform_clientes_003.Panel_MantenimientoClick(Sender: TObject);
begin

end;

procedure Tform_clientes_003.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := True;
    public_Pulso_Aceptar := false;
end;

procedure Tform_clientes_003.DBCheckBox_IVA_Excluido_SN1Change(Sender: TObject);
begin

end;

procedure Tform_clientes_003.Edit_Descripcion_PaisChange(Sender: TObject);
begin

end;

procedure Tform_clientes_003.Edit_Descripcion_PaisClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS el PAIS');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_clientes_000.SQLQuery_Clientes_Envios.FieldByName('id_paises').Clear;
         Edit_Descripcion_Pais.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_clientes_003.Edit_Descripcion_PoblacionClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS la POBLACIÓN');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_clientes_000.SQLQuery_Clientes_Envios.FieldByName('id_poblaciones').Clear;
         Edit_Descripcion_Poblacion.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_clientes_003.Edit_Descripcion_ProvinciaClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS la PROVINCIA');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_clientes_000.SQLQuery_Clientes_Envios.FieldByName('id_provincias').Clear;
         Edit_Descripcion_Provincia.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_clientes_003.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg : TStrings;
begin
    ButtonPanel1.SetFocus; // Con esto consigo que salga del campo que este y pueda actualizarlo

    var_msg := TStringList.Create;

    if public_Pulso_Aceptar = true then
    begin
        with form_clientes_000.SQLQuery_Clientes_Envios do
        begin
            Comprobar_Toda_Fecha_Hora(var_msg);

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

procedure Tform_clientes_003.Actualizar_Campos_Fecha_Hora_Si_Completado( param_msg : TStrings );
var var_Fecha_Hora : ShortString;
begin
    WITH form_clientes_000.SQLQuery_Clientes_Envios DO
    BEGIN
    { NO HAY NINGUN CAMPO DE HORA O FECHA
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
    }
    END;
end;

procedure Tform_clientes_003.no_Tocar;
begin
    Panel_Mantenimiento.Enabled := False;
end;

procedure Tform_clientes_003.Boton_Elegir_PaisClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_clientes_000.SQLQuery_Clientes_Envios do
    begin
        var_Registro := UTI_Abrir_Form( true, false, '', 60 );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_paises').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Pais.Text        := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_clientes_003.BitBtn_SMSClick(Sender: TObject);
begin
    UTI_GEN_Enviar_SMS;
end;

procedure Tform_clientes_003.FormCreate(Sender: TObject);
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

procedure Tform_clientes_003.para_Empezar;
begin
    { ****************************************************************************
      Solo para formularios que traten con datos
      **************************************************************************** }
      with form_clientes_000.SQLQuery_Clientes_Envios do
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

procedure Tform_clientes_003.Edit_Descripcion_ContactoClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS la persona CON QUIEN HABLAR');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_clientes_000.SQLQuery_Clientes_Envios.FieldByName('id_clientes_contactos').Clear;
         Edit_Descripcion_Contacto.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_clientes_003.Boton_Elegir_ContactoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_clientes_000.SQLQuery_Clientes_Envios do
    begin
        if UTI_USR_Permiso_SN(public_Menu_Worked, 'M', True) = True then
        begin
            var_Registro := UTI_CLIENTES_Elegir_Contacto( form_clientes_000.SQLQuery_Clientes.FieldByName('id').AsString,
                                                          public_Menu_Worked );

            if var_Registro.id_1 <> '' then
            begin
                 FieldByName('id_clientes_contactos').AsString := Trim(var_Registro.id_1);
                 Edit_Descripcion_Contacto.Text                := var_Registro.descripcion_1;
            end;
        end;
    end;
end;

procedure Tform_clientes_003.Boton_Elegir_PoblacionClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_clientes_000.SQLQuery_Clientes_Envios do
    begin
        var_Registro := UTI_Abrir_Form( true, false, '', 110 );
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

procedure Tform_clientes_003.Boton_Elegir_ProvinciaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_clientes_000.SQLQuery_Clientes_Envios do
    begin
        var_Registro := UTI_Abrir_Form( true, false, '', 100 );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_provincias').AsString := Trim(var_Registro.id_1);
             FieldByName('id_paises').AsString     := Trim(var_Registro.id_2);

             Edit_Descripcion_Provincia.Text       := var_Registro.descripcion_1;
             Edit_Descripcion_Pais.Text            := var_Registro.descripcion_2;
        end;
    end;
end;

end.


