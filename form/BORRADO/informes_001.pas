unit informes_001;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, PrintersDlgs, Forms, Controls, Graphics, Dialogs, ButtonPanel,
  StdCtrls, DbCtrls, Buttons, utilidades_forms_Filtrar, utilidades_general;

type

  { Tform_informes_001 }

  Tform_informes_001 = class(TForm)
    Boton_Elegir_Fichero: TBitBtn;
    Boton_Elegir_Menu: TBitBtn;
    ButtonPanel1: TButtonPanel;
    DBEdit_Descripcion: TDBEdit;
    DBEdit_eMail1: TDBEdit;
    DBEdit_nombre_fichero: TDBEdit;
    Edit_Descripcion_Menu: TEdit;
    GroupBox11: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label62: TLabel;
    OpenDialog1: TOpenDialog;

    procedure no_Tocar;
    procedure para_Empezar;
    procedure Boton_Elegir_FicheroClick(Sender: TObject);
    procedure Boton_Elegir_MenuClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure Edit_Descripcion_MenuClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure Presentar_Datos;

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
  form_informes_001: Tform_informes_001;

implementation

{$R *.lfm}

uses menu, informes_000;

{ Tform_informes_001 }

procedure TForm_informes_001.FormCreate(Sender: TObject);
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
end;

procedure TForm_informes_001.FormActivate(Sender: TObject);
begin
    If Form_informes_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    Comprobar_No_Tocar(true, true);
end;

function TForm_informes_001.Comprobar_No_Tocar( param_Reproducir_Mensajes,
                                                param_Ejecutar_No_Tocar : Boolean ) : Boolean;
begin
    Result := false;

    // ********************************************************************************************* //
    // ** Si se llamó para solo verlo, pues no se puede tocar                                     ** //
    // ********************************************************************************************* //
    if public_Solo_Ver = true then
    begin
        Result := true;

        if param_Ejecutar_No_Tocar = true then
        begin
            no_Tocar;
        end;
    end;
end;

procedure TForm_informes_001.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := True;
    public_Pulso_Aceptar := true;
end;

procedure TForm_informes_001.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := True;
    public_Pulso_Aceptar := false;
end;

procedure TForm_informes_001.no_Tocar;
begin
    Boton_Elegir_Fichero.Enabled  := False;
    DBEdit_nombre_fichero.Enabled := False;
    Boton_Elegir_Menu.Enabled     := False;
    Edit_Descripcion_Menu.Enabled := False;
    DBEdit_Descripcion.Enabled    := False;
end;

procedure TForm_informes_001.Presentar_Datos;
begin
    with Form_informes_000.SQLQuery_Informes do
    begin
        // Edit_Nombre_Fichero.Text   := FieldByName('nombre_fichero').AsString;
        Edit_Descripcion_Menu.Text := FieldByName('OT_Descripcion_Menu').AsString;
    end;
end;

procedure TForm_informes_001.Boton_Elegir_MenuClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with Form_informes_000.SQLQuery_Informes do
    begin
        var_Registro := UTI_Abrir_Form( true, false, '', 40 );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_menus').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Menu.Text       := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_informes_001.Boton_Elegir_FicheroClick(Sender: TObject);
begin
    Try
        OpenDialog1.InitialDir := form_menu.public_path_listados;
        OpenDialog1.FileName   := '';
        OpenDialog1.Filter     := 'Diseño de informes|*.LRF;*.lrf';

        if OpenDialog1.Execute then
        begin
            if Trim(OpenDialog1.Filename) <> '' then
            begin
                form_informes_000.SQLQuery_Informes.FieldByName('nombre_fichero').AsString := OpenDialog1.FileName;
            end;
        end;
    Except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( 'Error al intentar traer los *.lfr que existen en el directorio ' +
                               form_menu.public_path_listados,
                               error );
        end;
    end;
end;

procedure TForm_informes_001.Edit_Descripcion_MenuClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS el MODULO');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         Form_informes_000.SQLQuery_Informes.FieldByName('id_menus').Clear;
         Edit_Descripcion_Menu.Text := '';
    end;
    var_msg.Free;
end;

procedure TForm_informes_001.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg : TStrings;
begin
    ButtonPanel1.SetFocus; // Con esto consigo que salga del campo que este y pueda actualizarlo

    var_msg := TStringList.Create;

    if public_Pulso_Aceptar = true then
    begin
        with form_informes_000.SQLQuery_Informes do
        begin
            if Trim(FieldByName('nombre_fichero').AsString) = '' then
            begin
                var_msg.Add( '* El nombre de fichero.' );
            end;

            if Trim(FieldByName('id_menus').AsString) = '' then
            begin
                var_msg.Add( '* El módulo al que pertenece.' );
            end;

            if Trim(FieldByName('descripcion').AsString) = '' then
            begin
                var_msg.Add( '* La descripción del informe.' );
            end;
        end;
    end;

    if private_Salir_OK = False then
    begin
        // ***************************************************************************************** //
        // ** Intento BitBtn_SALIR de la aplicación de un modo no permitido.                      ** //
        // ***************************************************************************************** //
        // ** Pero si desde el menu principal está a true la variable public_Salir_Ok, significa  ** //
        // ** que hay que salir si o si pues se pulsó cancelar al preguntar otra vez por la pwd   ** //
        // ***************************************************************************************** //
        if form_Menu.public_Salir_OK = False then
        begin
            CloseAction := caNone;
        end;
    end else begin
        // ***************************************************************************************** //
        // ** Fue correcto el modo como quiere salir de la aplicación                             ** //
        // ***************************************************************************************** //
        // ** Comprobaremos si no se generó algún error por falta de completar algun campo y si se** //
        // ** salió con el botón Ok o Cancel                                                      ** //
        // ***************************************************************************************** //
        if (Trim(var_msg.Text) <> '') and (public_Pulso_Aceptar = true) then
        begin
            UTI_GEN_Aviso(true, var_msg, rs_Falta, True, False);
            CloseAction := caNone;
        end else begin
            CloseAction := caFree;
        end;
    end;

    var_msg.Free;
end;

procedure TForm_informes_001.para_Empezar;
begin
    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    with Form_informes_000.SQLQuery_Informes do
    begin
        public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                           FieldByName('id_menus').AsString,
                                                           '',
                                                           FieldByName('nombre_fichero').AsString,
                                                           FieldByName('descripcion').AsString,
                                                           '');
    end;

    Presentar_Datos;
end;

end.


