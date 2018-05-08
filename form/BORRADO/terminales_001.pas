unit terminales_001;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ButtonPanel, StdCtrls, DbCtrls,
    db, utilidades_general, utilidades_forms_Filtrar, Buttons;

type

    { Tform_terminales_001 }

    Tform_terminales_001 = class(TForm)
        BitBtn_Configurar_Terminal: TBitBtn;
        ButtonPanel1: TButtonPanel;
        DBEdit_Descripcion: TDBEdit;
        DBEdit_Saldo: TDBEdit;
        DBEdit_eMail1: TDBEdit;
        GroupBox11: TGroupBox;
        Label1: TLabel;
        Label2: TLabel;
        Label62: TLabel;

        procedure Presentar_Datos;
        procedure no_Tocar;
        function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
        procedure CancelButtonClick(Sender: TObject);
        procedure Comprobar_Toda_Fecha_Hora( param_msg : TStrings );
        procedure Actualizar_Campos_Fecha_Hora_Si_Completado( param_msg : TStrings );
        procedure FormActivate(Sender: TObject);
        procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
        procedure para_Empezar;
        procedure FormCreate(Sender: TObject);
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
    form_terminales_001: Tform_terminales_001;

implementation

{$R *.lfm}

uses menu, terminales_000;

{ Tform_terminales_001 }

procedure Tform_terminales_001.FormCreate(Sender: TObject);
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
    public_Solo_Ver := false;
end;

procedure Tform_terminales_001.para_Empezar;
begin
  { ****************************************************************************
    Solo para formularios que traten con datos
    **************************************************************************** }
    with form_terminales_000.SQLQuery_Terminales do
    begin
        public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                           '',
                                                           '',

                                                           FieldByName('descripcion').AsString,
                                                           '',
                                                           '' );
    end;

    Presentar_Datos;

  { ****************************************************************************
    SOLO PARA ESTE FORM
    **************************************************************************** }
end;

procedure Tform_terminales_001.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg : TStrings;
begin
    ButtonPanel1.SetFocus; // Con esto consigo que salga del campo que este y pueda actualizarlo

    var_msg := TStringList.Create;

    if public_Pulso_Aceptar = true then
    begin
        with form_terminales_000.SQLQuery_Terminales do
        begin
            Comprobar_Toda_Fecha_Hora(var_msg);

            if Trim(DBEdit_Descripcion.Text) <> '' then
                 FieldByName('descripcion').asString := AnsiUpperCase(Trim(FieldByName('descripcion').AsString))
            else var_msg.Add( '* La descripción');

            if (Trim(FieldByName('Saldo').AsString) = '') or
               (FieldByName('Saldo').IsNull)              then
            begin
                var_msg.Add( '* El saldo de esta terminal.');
            end;
        end;
    end;

    if private_Salir_OK = false then
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
                    CloseAction := caNone;
                end
            else CloseAction := caFree;
        end;

    var_msg.Free;
end;

procedure Tform_terminales_001.Comprobar_Toda_Fecha_Hora( param_msg : TStrings );
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

procedure Tform_terminales_001.Actualizar_Campos_Fecha_Hora_Si_Completado( param_msg : TStrings );
var var_Fecha_Hora : ShortString;
begin
    WITH form_terminales_000.SQLQuery_Terminales DO
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

procedure Tform_terminales_001.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := false;
end;

procedure Tform_terminales_001.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := true;
end;

procedure Tform_terminales_001.no_Tocar;
begin
    DBEdit_Descripcion.Enabled         := False;
    DBEdit_Saldo.Enabled               := False;
    BitBtn_Configurar_Terminal.Enabled := False;
end;

procedure Tform_terminales_001.Presentar_Datos;
begin
    { no hay tablas adicionales en este form }
end;

procedure Tform_terminales_001.FormActivate(Sender: TObject);
begin
    If form_terminales_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    Comprobar_No_Tocar(true, true);
end;

function Tform_terminales_001.Comprobar_No_Tocar( param_Reproducir_Mensajes,
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

end.



