unit impresoras_001;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ButtonPanel, StdCtrls, DbCtrls,
    utilidades_usuarios, utilidades_general, utilidades_forms_Filtrar, Buttons, ExtCtrls, Spin, db;

type

    { Tform_impresoras_001 }

    Tform_impresoras_001 = class(TForm)
        Boton_Elegir_Impresora: TBitBtn;
        ButtonPanel1: TButtonPanel;
        DBCheckBox1: TDBCheckBox;
        DBEdit_eMail1: TDBEdit;
        Edit_Descripcion_Impresora: TEdit;
        GroupBox11: TGroupBox;
        Label17: TLabel;
        Label62: TLabel;
        Label_Copias: TLabel;
        Panel1: TPanel;
        SpinEdit_Copias: TSpinEdit;

        procedure Panel1Click(Sender: TObject);
        procedure para_Empezar;
        function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
        procedure no_Tocar;
        procedure CancelButtonClick(Sender: TObject);
        procedure OKButtonClick(Sender: TObject);
        procedure Presentar_Datos;
        procedure Boton_Elegir_ImpresoraClick(Sender: TObject);
        procedure Edit_Descripcion_ImpresoraClick(Sender: TObject);
        procedure FormActivate(Sender: TObject);
        procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
        procedure FormCreate(Sender: TObject);

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
    form_impresoras_001: Tform_impresoras_001;

implementation

{$R *.lfm}

uses menu, impresoras_000, opciones_impresion;

{ Tform_impresoras_001 }

procedure Tform_impresoras_001.FormActivate(Sender: TObject);
begin
    If form_impresoras_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    Comprobar_No_Tocar(true, true);
end;

function Tform_impresoras_001.Comprobar_No_Tocar( param_Reproducir_Mensajes,
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

procedure Tform_impresoras_001.Edit_Descripcion_ImpresoraClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS la FAMILIA a la que pertenece');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_impresoras_000.SQLQuery_Impresoras.FieldByName('descripcion').Clear;
         Edit_Descripcion_Impresora.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_impresoras_001.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg : TStrings;
begin
    ButtonPanel1.SetFocus; // Con esto consigo que salga del campo que este y pueda actualizarlo

    var_msg := TStringList.Create;

    if public_Pulso_Aceptar = true then
    begin
        with form_impresoras_000.SQLQuery_Impresoras do
        begin
            if Trim(FieldByName('descripcion').AsString) = '' then
            begin
                var_msg.Add( '* La impresora');
            end;

            FieldByName('Copias_a_Imprimir').Value := SpinEdit_Copias.Value;

            ShowMessage(FieldByName('Copias_a_Imprimir').AsString);
            ShowMessage(IntToStr(SpinEdit_Copias.Value));
        end;
    end;

    if private_Salir_OK = false then
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
        if (Trim(var_msg.Text) <> '')    and
           (public_Pulso_Aceptar = true) then
        begin
            UTI_GEN_Aviso(true, var_msg, rs_Falta, True, False);
            CloseAction := caNone;
        end else begin
            CloseAction := caFree;
        end;
    end;

    var_msg.Free;
end;

procedure Tform_impresoras_001.FormCreate(Sender: TObject);
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

procedure Tform_impresoras_001.para_Empezar;
begin
    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    with form_impresoras_000.SQLQuery_Impresoras do
    begin
        public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                           '',
                                                           '',

                                                           FieldByName('descripcion').AsString,
                                                           '',
                                                           '' );
    end;

    Presentar_Datos;
end;

procedure Tform_impresoras_001.Panel1Click(Sender: TObject);
begin

end;

procedure Tform_impresoras_001.Presentar_Datos;
begin
    with form_impresoras_000.SQLQuery_Impresoras do
    begin
        Edit_Descripcion_Impresora.Text := FieldByName('descripcion').AsString;

        if Trim(FieldByName('Copias_a_Imprimir').AsString) <> '' then
        begin
            SpinEdit_Copias.Value := FieldByName('Copias_a_Imprimir').Value;
        end;
    end;
end;

procedure Tform_impresoras_001.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := true;
end;

procedure Tform_impresoras_001.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := True;
    public_Pulso_Aceptar := false;
end;

procedure Tform_impresoras_001.no_Tocar;
begin
    Boton_Elegir_Impresora.Enabled     := False;
    Edit_Descripcion_Impresora.Enabled := False;
end;

procedure Tform_impresoras_001.Boton_Elegir_ImpresoraClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
    var_msg      : TStrings;
begin
    if UTI_USR_Permiso_SN(public_Menu_Worked, '', True) = true then
    begin
        if UTI_GEN_Form_Abierto_Ya('form_opciones_impresion') = false then
        begin
            Application.CreateForm(Tform_opciones_impresion, form_opciones_impresion);
            form_opciones_impresion.para_Empezar;
            form_opciones_impresion.Copias_Visible(true);

            form_opciones_impresion.ShowModal;

            if form_opciones_impresion.public_Pulso_Aceptar = true then
            begin
                with form_impresoras_000.SQLQuery_Impresoras do
                begin
                    FieldByName('descripcion').AsString    := form_opciones_impresion.ComboBox_Elegir_Impresora.Text;
                    FieldByName('Copias_a_Imprimir').Value := form_opciones_impresion.SpinEdit_Copias.Value;
                end;

                Edit_Descripcion_Impresora.Text := form_opciones_impresion.ComboBox_Elegir_Impresora.Text;
                SpinEdit_Copias.Value           := form_opciones_impresion.SpinEdit_Copias.Value;
            end;

            form_opciones_impresion.Free;
        end else begin
            var_msg := TStringList.Create;
            var_msg.Add(rs_Modulo_Abierto);
            var_msg.Free;
        end;
    end;

end;

end.

no guarda los totales de copias
ni tampoco se pueden crear nuevas impresoras


