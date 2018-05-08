unit provincias_001;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ButtonPanel, StdCtrls, DbCtrls,
    db, utilidades_general, utilidades_forms_Filtrar, Buttons;

type

    { Tform_provincias_001 }

    Tform_provincias_001 = class(TForm)
        Boton_Elegir_Pais: TBitBtn;
        ButtonPanel1: TButtonPanel;
        DBEdit_Descripcion: TDBEdit;
        DBEdit_eMail1: TDBEdit;
        Edit_Descripcion_Pais: TEdit;
        GroupBox11: TGroupBox;
        Label1: TLabel;
        Label4: TLabel;
        Label62: TLabel;

        procedure Boton_Elegir_PaisClick(Sender: TObject);
        function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
        procedure Edit_Descripcion_PaisClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure Presentar_Datos;
        procedure CancelButtonClick(Sender: TObject);
        procedure no_Tocar;
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
    form_provincias_001: Tform_provincias_001;

implementation

{$R *.lfm}

uses menu, provincias_000;

{ Tform_provincias_001 }

procedure Tform_provincias_001.FormActivate(Sender: TObject);
begin
    If form_provincias_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    Comprobar_No_Tocar(true, true);
end;

function Tform_provincias_001.Comprobar_No_Tocar( param_Reproducir_Mensajes,
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

procedure Tform_provincias_001.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg : TStrings;
begin
    ButtonPanel1.SetFocus; // Con esto consigo que salga del campo que este y pueda actualizarlo

    var_msg := TStringList.Create;

    if public_Pulso_Aceptar = true then
    begin
        with form_provincias_000.SQLQuery_Provincias do
        begin
            if Trim(DBEdit_Descripcion.Text) <> '' then
                 DBEdit_Descripcion.Text := AnsiUpperCase(Trim(DBEdit_Descripcion.Text))
            else var_msg.Add( '* La descripción de la provincia.');

            if Trim(FieldByName('id_paises').AsString) = '' then
            begin
                var_msg.Add( '* El país de la provincia.');
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

procedure Tform_provincias_001.no_Tocar;
begin
    DBEdit_Descripcion.Enabled    := False;
    Boton_Elegir_Pais.Enabled     := False;
    Edit_Descripcion_Pais.Enabled := False;
end;

procedure Tform_provincias_001.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := True;
    public_Pulso_Aceptar := true;
end;

procedure Tform_provincias_001.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := True;
    public_Pulso_Aceptar := false;
end;

procedure Tform_provincias_001.Boton_Elegir_PaisClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_provincias_000.SQLQuery_Provincias do
    begin
        var_Registro := UTI_Abrir_Modulo_Paises( true, false, 60, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_paises').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Pais.Text        := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_provincias_001.Presentar_Datos;
begin
    with form_provincias_000.SQLQuery_Provincias do
    begin
        Edit_Descripcion_Pais.Text := FieldByName('OT_descripcion_pais').AsString;
    end;
end;

procedure Tform_provincias_001.Edit_Descripcion_PaisClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS el PAIS');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_provincias_000.SQLQuery_Provincias.FieldByName('id_paises').Clear;
         Edit_Descripcion_Pais.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_provincias_001.FormCreate(Sender: TObject);
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
      public_Solo_Ver     := false;
end;

procedure Tform_provincias_001.para_Empezar;
begin
  { ****************************************************************************
    Solo para formularios que traten con datos
    **************************************************************************** }
    with form_provincias_000.SQLQuery_Provincias do
    begin
        public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                           FieldByName('id_paises').AsString,
                                                           '',

                                                           FieldByName('descripcion').AsString,
                                                           FieldByName('OT_descripcion_pais').AsString,
                                                           '' );
    end;

    Presentar_Datos;
end;

end.

