unit proveedores_002;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ButtonPanel, ExtCtrls, db,
    utilidades_general, utilidades_forms_Filtrar, StdCtrls, DbCtrls, EditBtn, Buttons;

type

    { Tform_proveedores_002 }

    Tform_proveedores_002 = class(TForm)
        BitBtn_eMail: TBitBtn;
        BitBtn_SMS: TBitBtn;
        Boton_Elegir_Provincia1: TBitBtn;
        ButtonPanel1: TButtonPanel;
        DateEdit_Fecha_Nacimiento: TDateEdit;
        DBEdit_a_quien_facturamos: TDBEdit;
        DBEdit_a_quien_facturamos2: TDBEdit;
        DBEdit_eMail: TDBEdit;
        DBEdit_eMail1: TDBEdit;
        DBEdit_FAX: TDBEdit;
        DBEdit_Movil: TDBEdit;
        DBEdit_NIF_CIF: TDBEdit;
        DBEdit_NIF_CIF1: TDBEdit;
        DBEdit_Nombre_Comercial: TDBEdit;
        DBEdit_Nombre_Contacto: TDBEdit;
        DBEdit_Pagina_Web: TDBEdit;
        DBEdit_Tfno_Fijo_1: TDBEdit;
        DBEdit_Tfno_Fijo_2: TDBEdit;
        GroupBox1: TGroupBox;
        GroupBox11: TGroupBox;
        GroupBox2: TGroupBox;
        Label1: TLabel;
        Label10: TLabel;
        Label11: TLabel;
        Label12: TLabel;
        Label13: TLabel;
        Label14: TLabel;
        Label15: TLabel;
        Label16: TLabel;
        Label17: TLabel;
        Label2: TLabel;
        Label3: TLabel;
        Label62: TLabel;
        Label7: TLabel;
        Label_Fecha: TLabel;
        Panel1: TPanel;
        Panel_Mantenimiento: TPanel;

        function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
        procedure BitBtn_eMailClick(Sender: TObject);
        procedure BitBtn_SMSClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure OKButtonClick(Sender: TObject);
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
    form_proveedores_002: Tform_proveedores_002;

implementation

{$R *.lfm}

uses menu, proveedores_000;

{ Tform_proveedores_002 }

procedure Tform_proveedores_002.FormActivate(Sender: TObject);
begin
    If form_proveedores_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    Comprobar_No_Tocar(true, true);
end;

function Tform_proveedores_002.Comprobar_No_Tocar( param_Reproducir_Mensajes,
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

procedure Tform_proveedores_002.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg : TStrings;
begin
    ButtonPanel1.SetFocus; // Con esto consigo que salga del campo que este y pueda actualizarlo

    var_msg := TStringList.Create;

    if public_Pulso_Aceptar = true then
    begin
        with form_proveedores_000.SQLQuery_Proveedores_Contactos do
        begin
            Comprobar_Toda_Fecha_Hora(var_msg);

            if Trim(FieldByName('nombre').AsString) = '' then
            begin
                var_msg.Add( '* El nombre del contacto.');
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

procedure Tform_proveedores_002.Comprobar_Toda_Fecha_Hora( param_msg : TStrings );
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

procedure Tform_proveedores_002.Actualizar_Campos_Fecha_Hora_Si_Completado( param_msg : TStrings );
var var_Fecha_Hora : ShortString;
begin
    WITH form_proveedores_000.SQLQuery_Proveedores_Contactos DO
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
    END;
end;

procedure Tform_proveedores_002.Presentar_Datos;
var var_Hora : tTime;
    var_Dia  : tDate;
begin
    WITH form_proveedores_000.SQLQuery_Proveedores_Contactos do
    BEGIN
        if not FieldByName('Fecha_Nacimiento').IsNull then
        begin
            var_Dia                        := FieldByName('Fecha_Nacimiento').AsDateTime;
            DateEdit_Fecha_Nacimiento.Text := DateToStr(var_Dia);
        end;
    END;
end;

procedure Tform_proveedores_002.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := true;
end;

procedure Tform_proveedores_002.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := false;
end;

procedure Tform_proveedores_002.BitBtn_SMSClick(Sender: TObject);
begin
    UTI_GEN_Enviar_SMS;
end;

procedure Tform_proveedores_002.BitBtn_eMailClick(Sender: TObject);
begin
    UTI_GEN_Enviar_eMAIL;
end;

procedure Tform_proveedores_002.no_Tocar;
begin
    Panel_Mantenimiento.Enabled := False;
end;

procedure Tform_proveedores_002.FormCreate(Sender: TObject);
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

procedure Tform_proveedores_002.para_Empezar;
begin
    { ****************************************************************************
      Solo para formularios que traten con datos
      **************************************************************************** }
      with form_proveedores_000.SQLQuery_Proveedores_Contactos do
      begin
          public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                             '',
                                                             '',

                                                             FieldByName('nombre').AsString,
                                                             '',
                                                             '' );
      end;

      Presentar_Datos;
end;

end.

