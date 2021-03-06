unit poblaciones_001;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ButtonPanel, StdCtrls, DbCtrls,
    db, utilidades_general, utilidades_forms_Filtrar, Buttons;

type

    { Tform_poblaciones_001 }

    Tform_poblaciones_001 = class(TForm)
        Boton_Elegir_Pais: TBitBtn;
        Boton_Elegir_Provincia: TBitBtn;
        ButtonPanel1: TButtonPanel;
        DBEdit_Codigo_Postal: TDBEdit;
        DBEdit_Descripcion: TDBEdit;
        DBEdit_eMail1: TDBEdit;
        Edit_Descripcion_Pais: TEdit;
        Edit_Descripcion_Provincia: TEdit;
        GroupBox11: TGroupBox;
        Label1: TLabel;
        Label2: TLabel;
        Label4: TLabel;
        Label5: TLabel;
        Label62: TLabel;

        function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
        procedure FormCreate(Sender: TObject);
        procedure Presentar_Datos;
        procedure Boton_Elegir_PaisClick(Sender: TObject);
        procedure Boton_Elegir_ProvinciaClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
        procedure Edit_Descripcion_PaisClick(Sender: TObject);
        procedure Edit_Descripcion_ProvinciaClick(Sender: TObject);
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
    form_poblaciones_001: Tform_poblaciones_001;

implementation

{$R *.lfm}

uses menu, poblaciones_000;

{ Tform_poblaciones_001 }

procedure Tform_poblaciones_001.FormActivate(Sender: TObject);
begin
    If form_poblaciones_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    Comprobar_No_Tocar(true, true);
end;

function Tform_poblaciones_001.Comprobar_No_Tocar( param_Reproducir_Mensajes,
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

procedure Tform_poblaciones_001.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := True;
    public_Pulso_Aceptar := true;
end;

procedure Tform_poblaciones_001.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := True;
    public_Pulso_Aceptar := false;
end;

procedure Tform_poblaciones_001.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg : TStrings;
begin
    ButtonPanel1.SetFocus; // Con esto consigo que salga del campo que este y pueda actualizarlo

    var_msg := TStringList.Create;

    if public_Pulso_Aceptar = true then
    begin
        with form_poblaciones_000.SQLQuery_Poblaciones do
        begin
            if Trim(DBEdit_Descripcion.Text) <> '' then
                 DBEdit_Descripcion.Text := AnsiUpperCase(Trim(DBEdit_Descripcion.Text))
            else var_msg.Add( '* La descripción de la poblacion.');

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

procedure Tform_poblaciones_001.Boton_Elegir_PaisClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_poblaciones_000.SQLQuery_Poblaciones do
    begin
        var_Registro := UTI_Abrir_Modulo_Paises( true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_paises').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Pais.Text        := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_poblaciones_001.Boton_Elegir_ProvinciaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_poblaciones_000.SQLQuery_Poblaciones do
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

procedure Tform_poblaciones_001.Edit_Descripcion_PaisClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS el PAIS');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_poblaciones_000.SQLQuery_Poblaciones.FieldByName('id_paises').Clear;
         Edit_Descripcion_Pais.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_poblaciones_001.Edit_Descripcion_ProvinciaClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS la PROVINCIA');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_poblaciones_000.SQLQuery_Poblaciones.FieldByName('id_provincias').Clear;
         Edit_Descripcion_Provincia.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_poblaciones_001.no_Tocar;
begin
    DBEdit_Descripcion.Enabled         := False;
    DBEdit_Codigo_Postal.Enabled       := False;
    Boton_Elegir_Provincia.Enabled     := False;
    Edit_Descripcion_Provincia.Enabled := False;
    Boton_Elegir_Pais.Enabled          := False;
    Edit_Descripcion_Pais.Enabled      := False;
end;

procedure Tform_poblaciones_001.Presentar_Datos;
begin
    with form_poblaciones_000.SQLQuery_Poblaciones do
    begin
        Edit_Descripcion_Provincia.Text := FieldByName('OT_descripcion_provincia').AsString;
        Edit_Descripcion_Pais.Text      := FieldByName('OT_descripcion_pais').AsString;
    end;
end;

procedure Tform_poblaciones_001.FormCreate(Sender: TObject);
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

procedure Tform_poblaciones_001.para_Empezar;
begin
  { ****************************************************************************
    Solo para formularios que traten con datos
    **************************************************************************** }
    with form_poblaciones_000.SQLQuery_Poblaciones do
    begin
        public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                           FieldByName('id_provincias').AsString,
                                                           FieldByName('id_paises').AsString,

                                                           FieldByName('descripcion').AsString,
                                                           FieldByName('OT_descripcion_provincia').AsString,
                                                           FieldByName('OT_descripcion_pais').AsString );
    end;

    Presentar_Datos;
end;

end.

