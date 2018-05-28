unit articulos_ofertas_003;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ButtonPanel, StdCtrls, DbCtrls,
  utilidades_general, utilidades_forms_Filtrar, ExtCtrls, Buttons, LCLTranslator;

resourcestring
  rs_Quitamos_1 = '¿QUITAMOS el ARTICULO';

  rs_FormClose_1 = '* El artículo.';

type

  { Tform_articulos_ofertas_003 }

  Tform_articulos_ofertas_003 = class(TForm)
    Boton_Elegir_Articulo: TBitBtn;
    ButtonPanel1: TButtonPanel;
    DBEdit_eMail1: TDBEdit;
    DBMemo_Descripcion: TDBMemo;
    Edit_Descripcion_Articulo: TEdit;
    GroupBox11: TGroupBox;
    Label1: TLabel;
    Label16: TLabel;
    Label62: TLabel;
    Panel1: TPanel;
    Panel_Mantenimiento: TPanel;

    procedure Validacion( param_msg : TStrings );
    procedure para_Empezar;
    function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
    procedure FormCreate(Sender: TObject);
    procedure no_Tocar;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure Presentar_Datos;
    procedure Boton_Elegir_ArticuloClick(Sender: TObject);
    procedure Edit_Descripcion_ArticuloClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
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
  form_articulos_ofertas_003: Tform_articulos_ofertas_003;

implementation

{$R *.lfm}

uses menu, articulos_ofertas_000;

{ Tform_articulos_ofertas_003 }

procedure Tform_articulos_ofertas_003.FormActivate(Sender: TObject);
begin
    If form_articulos_ofertas_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    Comprobar_No_Tocar(true, true);
end;

function Tform_articulos_ofertas_003.Comprobar_No_Tocar( param_Reproducir_Mensajes,
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

procedure Tform_articulos_ofertas_003.Boton_Elegir_ArticuloClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_articulos_ofertas_000.SQLQuery_AOA do
    begin
        var_Registro := UTI_Abrir_Modulo_Articulos( true, false, 170, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_articulos').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Articulo.Text       := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_articulos_ofertas_003.Edit_Descripcion_ArticuloClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add(rs_Quitamos_1);
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_articulos_ofertas_000.SQLQuery_AOA.FieldByName('id_articulos').Clear;
         Edit_Descripcion_Articulo.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_articulos_ofertas_003.Presentar_Datos;
begin
    WITH form_articulos_ofertas_000.SQLQuery_AOA do
    BEGIN
        // ***************************************************************************************** //
        // ** No hay nada que presentar                                                           ** //
        // ***************************************************************************************** //
    END;
end;

procedure Tform_articulos_ofertas_003.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := True;
    public_Pulso_Aceptar := true;
end;

procedure Tform_articulos_ofertas_003.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := True;
    public_Pulso_Aceptar := false;
end;

procedure Tform_articulos_ofertas_003.Validacion( param_msg : TStrings );
begin
    with form_articulos_ofertas_000.SQLQuery_AOA do
    begin
        if Trim(FieldByName('id_articulos').AsString) = '' then
        begin
            param_msg.Add(rs_FormClose_1);
        end;
    end;
end;

procedure Tform_articulos_ofertas_003.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg : TStrings;
begin
    ButtonPanel1.SetFocus; // Con esto consigo que salga del campo que este y pueda actualizarlo

    var_msg := TStringList.Create;

    if public_Pulso_Aceptar = true then
    begin
        Validacion( var_msg );
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

procedure Tform_articulos_ofertas_003.no_Tocar;
begin
    Panel_Mantenimiento.Enabled := False;
end;

procedure Tform_articulos_ofertas_003.FormCreate(Sender: TObject);
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

procedure Tform_articulos_ofertas_003.para_Empezar;
begin
    { ****************************************************************************
      Solo para formularios que traten con datos
      **************************************************************************** }
      with form_articulos_ofertas_000.SQLQuery_AOA do
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

end.


