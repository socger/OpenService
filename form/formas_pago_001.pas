unit formas_pago_001;

{$mode objfpc}{$H+}

interface

uses
    utilidades_forms_Filtrar, Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, db,
    utilidades_general, ButtonPanel, StdCtrls, DbCtrls;

type

    { Tform_formas_pago_001 }

    Tform_formas_pago_001 = class(TForm)
        ButtonPanel1: TButtonPanel;
        DBEdit_Descripcion: TDBEdit;
        DBEdit_eMail1: TDBEdit;
        DBEdit_Vencimientos_Cantidad: TDBEdit;
        DBEdit_Vencimientos_Cantidad1: TDBEdit;
        DBEdit_Vencimientos_Dias_Entre: TDBEdit;
        GroupBox11: TGroupBox;
        Label48: TLabel;
        Label49: TLabel;
        Label50: TLabel;
        Label51: TLabel;
        Label62: TLabel;

        function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
        procedure Comprobar_Vencimientos(param_msg : TStrings);
        procedure FormCreate(Sender: TObject);
        procedure no_Tocar;
        procedure CancelButtonClick(Sender: TObject);
        procedure OKButtonClick(Sender: TObject);
        procedure Presentar_Datos;
        procedure FormActivate(Sender: TObject);
        procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
        procedure para_Empezar;
    private
        { private declarations }
        private_Salir_OK : Boolean;
    public
        { public declarations }
        public_Solo_Ver      : Boolean;
        public_Pulso_Aceptar : Boolean;
        public_Menu_Worked   : Integer;
        public_Record_Rgtro  : TRecord_Rgtro_Comun;
    end;

var
    form_formas_pago_001: Tform_formas_pago_001;

implementation

{$R *.lfm}

uses menu, formas_pago_000;

{ Tform_formas_pago_001 }

procedure Tform_formas_pago_001.FormActivate(Sender: TObject);
begin
    If form_formas_pago_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    Comprobar_No_Tocar(true, true);
end;

function Tform_formas_pago_001.Comprobar_No_Tocar( param_Reproducir_Mensajes,
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

procedure Tform_formas_pago_001.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg : TStrings;
begin
    ButtonPanel1.SetFocus; // Con esto consigo que salga del campo que este y pueda actualizarlo

    var_msg := TStringList.Create;

    if public_Pulso_Aceptar = true then
    begin
        with form_formas_pago_000.SQLQuery_Formas_Pago do
        begin
            if Trim(DBEdit_Descripcion.Text) <> '' then
                 FieldByName('descripcion').asString := AnsiUpperCase(Trim(FieldByName('descripcion').AsString))
            else var_msg.Add( '* La descripción');

            Comprobar_Vencimientos(var_msg);
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

procedure Tform_formas_pago_001.Presentar_Datos;
begin
     /// guardar por lo que pueda pasar
end;

procedure Tform_formas_pago_001.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := true;
end;

procedure Tform_formas_pago_001.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := True;
    public_Pulso_Aceptar := false;
end;

procedure Tform_formas_pago_001.no_Tocar;
begin
    DBEdit_Descripcion.Enabled := False;
end;

procedure Tform_formas_pago_001.Comprobar_Vencimientos(param_msg : TStrings);
begin
    with form_formas_pago_000.SQLQuery_Formas_Pago do
    begin
        if Trim(FieldByName('Vencimientos_Cantidad').AsString) = '' then
            begin
                param_msg.Add( '* Tiene que decirnos la cantidad de vencimientos a generar.');
            end
        else
            begin
                if FieldByName('Vencimientos_Cantidad').Value = 0 then
                    begin
                        param_msg.Add( '* Tiene que decirnos la cantidad de vencimientos a generar.');
                    end
                else
                    begin
                        if Trim(FieldByName('Vencimientos_1_Dias').AsString) = '' then
                        begin
                            param_msg.Add( '* La cantidad de días para el primer vencimiento. Puede ser 0 dias.');
                        end;

                        if FieldByName('Vencimientos_Cantidad').Value > 1 then
                        begin
                            if Trim(FieldByName('Vencimientos_Dias_Entre').AsString) = '' then
                                begin
                                     param_msg.Add( '* Al ser mas de un vencimiento, necesitamos los días entre vencimientos.');
                                end
                            else
                                begin
                                    if FieldByName('Vencimientos_Dias_Entre').Value = 0 then
                                    begin
                                         param_msg.Add( '* Al ser mas de un vencimiento, necesitamos los días entre vencimientos.');
                                    end;
                                end;
                        end;
                    end;
            end;
    end;
end;

procedure Tform_formas_pago_001.FormCreate(Sender: TObject);
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

procedure Tform_formas_pago_001.para_Empezar;
begin
  { ****************************************************************************
    Solo para formularios que traten con datos
    **************************************************************************** }
    with form_formas_pago_000.SQLQuery_Formas_Pago do
    begin
        public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                           FieldByName('Vencimientos_Cantidad').AsString,
                                                           FieldByName('Vencimientos_1_Dias').AsString,
                                                           FieldByName('descripcion').AsString,
                                                           FieldByName('Vencimientos_Dias_Entre').AsString,
                                                           '' );
    end;

    Presentar_Datos;
end;

end.

