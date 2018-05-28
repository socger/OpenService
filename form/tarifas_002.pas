unit tarifas_002;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, DbCtrls, ButtonPanel,
  Buttons, ExtCtrls, utilidades_forms_Filtrar, utilidades_general;

type

  { Tform_tarifas_002 }

  Tform_tarifas_002 = class(TForm)
    Boton_Elegir_Margen: TBitBtn;
    ButtonPanel1: TButtonPanel;
    DBEdit_Descripcion: TDBEdit;
    DBEdit_Descripcion1: TDBEdit;
    DBEdit_eMail1: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Edit_mayor_igual_que: TEdit;
    Edit_menor_igual_que: TEdit;
    GroupBox11: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    Panel_Mantenimiento: TPanel;
    Shape2: TShape;

    procedure Edit_menor_igual_queClick(Sender: TObject);
    procedure Quitamos_Margen_Precio_Costo;
    procedure Boton_Elegir_MargenClick(Sender: TObject);
    procedure Edit_mayor_igual_queClick(Sender: TObject);
    procedure para_Empezar;
    procedure FormCreate(Sender: TObject);
    procedure no_Tocar;
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure Presentar_Datos;
    procedure FormActivate(Sender: TObject);
    function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);

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
  form_tarifas_002: Tform_tarifas_002;

implementation

{$R *.lfm}

uses menu, tarifas_000;

{ Tform_tarifas_002 }

procedure Tform_tarifas_002.FormActivate(Sender: TObject);
begin
    If form_tarifas_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    Comprobar_No_Tocar(true, true);
end;

function Tform_tarifas_002.Comprobar_No_Tocar( param_Reproducir_Mensajes,
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

procedure Tform_tarifas_002.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg : TStrings;
begin
    ButtonPanel1.SetFocus; // Con esto consigo que salga del campo que este y pueda actualizarlo

    var_msg := TStringList.Create;

    if public_Pulso_Aceptar = true then
    begin
        with form_tarifas_000.SQLQuery_Tarifas_Margenes do
        begin
            if Trim(FieldByName('id_margenes_tarifas').AsString) = '' then
            begin
                var_msg.Add( '* El margen sobre el cual crearemos el beneficio.');
            end;

            if Trim(FieldByName('Beneficio').AsString) = '' then
            begin
                var_msg.Add( '* La cantidad para el beneficio.');
            end;

            if Trim(FieldByName('Beneficio_en_Tanto_por_Ciento_SN').AsString) = '' then
            begin
                var_msg.Add( '* Si el incremento es en % o no.');
            end;
        end;
    end;

    if private_Salir_OK = False then
    begin
        // ***************************************************************************************** //
        // ** Intento BitBtn_SALIR de la aplicación de un modo no permitido.                      ** //
        // ***************************************************************************************** //
        // ** Pero si desde el menu principal está a true la variable public_Salir_Ok, significa  ** //
        // ** que hay que salir si o si pues se pulsó cancelar al preguntar otra vez por la       ** //
        // ** contraseña                                                                          ** //
        // ***************************************************************************************** //
        if form_Menu.public_Salir_OK = False then CloseAction := caNone;
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
            // var_msg.Free;
            CloseAction := caNone;
        end else begin
            // var_msg.Free;
            CloseAction := caFree;
        end;
    end;

    var_msg.Free;
end;

procedure Tform_tarifas_002.Presentar_Datos;
begin
    with form_tarifas_000.SQLQuery_Tarifas_Margenes do
    begin
        Edit_mayor_igual_que.Text := FieldByName('OT_mayor_igual_que').AsString;
        Edit_menor_igual_que.Text := FieldByName('OT_menor_igual_que').AsString;
    end;
end;

procedure Tform_tarifas_002.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := true;
end;

procedure Tform_tarifas_002.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := false;
end;

procedure Tform_tarifas_002.no_Tocar;
begin
    Panel_Mantenimiento.Enabled := False;
end;

procedure Tform_tarifas_002.FormCreate(Sender: TObject);
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

procedure Tform_tarifas_002.para_Empezar;
begin
    // ********************************************************************************************* //
    // ** Solo para formularios que traten con datos                                              ** //
    // ********************************************************************************************* //
    with form_tarifas_000.SQLQuery_Tarifas_Margenes do
    begin
        public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                           FieldByName('id_margenes_tarifas').AsString,
                                                           FieldByName('OT_mayor_igual_que').AsString,

                                                           FieldByName('OT_menor_igual_que').AsString,
                                                           FieldByName('Beneficio').AsString,
                                                           FieldByName('Beneficio_en_Tanto_por_Ciento_SN').AsString );
    end;

    Presentar_Datos;
end;

procedure Tform_tarifas_002.Boton_Elegir_MargenClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_tarifas_000.SQLQuery_Tarifas_Margenes do
    begin
        var_Registro := UTI_Abrir_Modulo_MargenesIncrementoTarifas( true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_margenes_tarifas').AsString := Trim(var_Registro.id_1);
             Edit_mayor_igual_que.Text                   := var_Registro.id_2;
             Edit_menor_igual_que.Text                   := var_Registro.id_3;
        end;
    end;
end;

procedure Tform_tarifas_002.Edit_mayor_igual_queClick(Sender: TObject);
begin
    Quitamos_Margen_Precio_Costo;
end;

procedure Tform_tarifas_002.Quitamos_Margen_Precio_Costo;
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS el MARGEN DE PRECIO DE COSTO elegido?');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_tarifas_000.SQLQuery_Tarifas_Margenes.FieldByName('id_proveedores_tipos').Clear;
         Edit_mayor_igual_que.Text := '';
         Edit_menor_igual_que.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_tarifas_002.Edit_menor_igual_queClick(Sender: TObject);
begin
    Quitamos_Margen_Precio_Costo;
end;

end.


