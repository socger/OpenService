unit almacenes_001;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ButtonPanel, StdCtrls, DbCtrls,
  Buttons, db, utilidades_general, utilidades_forms_Filtrar, LCLTranslator;

resourcestring
  rs_Close_1    = '* La descripción';
  rs_Close_2    = '* La empresa';
  rs_Close_3    = '* La dirección.';
  rs_Close_4    = '* La población.';
  rs_Close_5    = '* La provincia.';
  rs_Close_6    = '* El país.';
  rs_Close_7    = '* El responsable.';

  rs_Quitamos_1 = '¿QUITAMOS la EMPRESA';
  rs_Quitamos_2 = '¿QUITAMOS el PAIS';
  rs_Quitamos_3 = '¿QUITAMOS la POBLACIÓN';
  rs_Quitamos_4 = '¿QUITAMOS la PROVINCIA';

type

  { Tform_almacenes_001 }

  Tform_almacenes_001 = class(TForm)
    BitBtn_SMS: TBitBtn;
    Boton_Elegir_Empresa: TBitBtn;
    Boton_Elegir_Pais: TBitBtn;
    Boton_Elegir_Pais1: TBitBtn;
    Boton_Elegir_Poblacion: TBitBtn;
    Boton_Elegir_Provincia: TBitBtn;
    ButtonPanel1: TButtonPanel;
    DBEdit_Codigo_Postal: TDBEdit;
    DBEdit_Descripcion: TDBEdit;
    DBEdit_Direccion: TDBEdit;
    DBEdit_Direccion_Numero: TDBEdit;
    DBEdit_Direccion_Piso_Letra: TDBEdit;
    DBEdit_eMail: TDBEdit;
    DBEdit_eMail1: TDBEdit;
    DBEdit_FAX: TDBEdit;
    DBEdit_Movil: TDBEdit;
    DBEdit_Responsable: TDBEdit;
    DBEdit_Tfno_Fijo_1: TDBEdit;
    DBEdit_Tfno_Fijo_2: TDBEdit;
    Edit_Descripcion_Empresa: TEdit;
    Edit_Descripcion_Pais: TEdit;
    Edit_Descripcion_Poblacion: TEdit;
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
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label62: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;

    procedure Validacion( param_msg : TStrings );
    procedure Boton_Elegir_EmpresaClick(Sender: TObject);
    procedure Boton_Elegir_PaisClick(Sender: TObject);
    function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
    procedure Boton_Elegir_PoblacionClick(Sender: TObject);
    procedure Boton_Elegir_ProvinciaClick(Sender: TObject);
    procedure Edit_Descripcion_EmpresaClick(Sender: TObject);
    procedure Edit_Descripcion_PaisClick(Sender: TObject);
    procedure Edit_Descripcion_PoblacionClick(Sender: TObject);
    procedure Edit_Descripcion_ProvinciaClick(Sender: TObject);
    procedure para_Empezar;
    procedure FormCreate(Sender: TObject);
    procedure no_Tocar;
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure Presentar_Datos;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);

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
  form_almacenes_001: Tform_almacenes_001;

implementation

{$R *.lfm}

uses menu, almacenes_000;

{ Tform_almacenes_001 }

procedure Tform_almacenes_001.FormActivate(Sender: TObject);
begin
    If form_almacenes_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    Comprobar_No_Tocar(true, true);
end;

function Tform_almacenes_001.Comprobar_No_Tocar( param_Reproducir_Mensajes,
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

procedure Tform_almacenes_001.Validacion( param_msg : TStrings );
begin
    with form_almacenes_000.SQLQuery_Almacenes do
    begin
        if Trim(DBEdit_Descripcion.Text) <> '' then
             FieldByName('descripcion').asString := AnsiUpperCase(Trim(FieldByName('descripcion').AsString))
        else param_msg.Add( rs_Close_1 );

        if Trim(FieldByName('id_empresas').AsString) = '' then
        begin
            param_msg.Add( rs_Close_2 );
        end;

        if Trim(FieldByName('Direccion').AsString) = '' then
        begin
            param_msg.Add( rs_Close_3 );
        end;

        if Trim(FieldByName('id_poblaciones').AsString) = '' then
        begin
            param_msg.Add( rs_Close_4 );
        end;

        if Trim(FieldByName('id_provincias').AsString) = '' then
        begin
            param_msg.Add( rs_Close_5 );
        end;

        if Trim(FieldByName('id_paises').AsString) = '' then
        begin
            param_msg.Add( rs_Close_6 );
        end;

        if Trim(FieldByName('Responsable').AsString) = '' then
        begin
            param_msg.Add( rs_Close_7 );
        end;
    end;
end;

procedure Tform_almacenes_001.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg : TStrings;
begin
    ButtonPanel1.SetFocus; // Con esto consigo que salga del campo que este y pueda actualizarlo

    var_msg := TStringList.Create;

    if public_Pulso_Aceptar = true then
    begin
        Validacion(var_msg);
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

procedure Tform_almacenes_001.Presentar_Datos;
begin
    with form_almacenes_000.SQLQuery_Almacenes do
    begin
        Edit_Descripcion_Poblacion.Text := FieldByName('OT_descripcion_poblacion').AsString;
        Edit_Descripcion_Provincia.Text := FieldByName('OT_descripcion_provincia').AsString;
        Edit_Descripcion_Pais.Text      := FieldByName('OT_descripcion_pais').AsString;
        Edit_Descripcion_Empresa.Text   := FieldByName('OT_Descripcion_Empresa').AsString;
    end;
end;

procedure Tform_almacenes_001.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := true;
end;

procedure Tform_almacenes_001.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := True;
    public_Pulso_Aceptar := false;
end;

procedure Tform_almacenes_001.no_Tocar;
begin
    DBEdit_Descripcion.Enabled          := False;
    Boton_Elegir_Empresa.Enabled        := False;
    Edit_Descripcion_Empresa.Enabled    := False;
    DBEdit_Responsable.Enabled          := False;
    DBEdit_eMail.Enabled                := False;
    DBEdit_Direccion.Enabled            := False;
    DBEdit_Direccion_Numero.Enabled     := False;
    DBEdit_Direccion_Piso_Letra.Enabled := False;
    DBEdit_Codigo_Postal.Enabled        := False;
    Boton_Elegir_Poblacion.Enabled      := False;
    Edit_Descripcion_Poblacion.Enabled  := False;
    Boton_Elegir_Provincia.Enabled      := False;
    Edit_Descripcion_Provincia.Enabled  := False;
    Boton_Elegir_Pais.Enabled           := False;
    Edit_Descripcion_Pais.Enabled       := False;
    DBEdit_Tfno_Fijo_1.Enabled          := False;
    DBEdit_Tfno_Fijo_2.Enabled          := False;
    DBEdit_FAX.Enabled                  := False;
    BitBtn_SMS.Enabled                  := False;
    DBEdit_Movil.Enabled                := False;
end;

procedure Tform_almacenes_001.FormCreate(Sender: TObject);
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

procedure Tform_almacenes_001.para_Empezar;
begin
    { ****************************************************************************
      Solo para formularios que traten con datos
      **************************************************************************** }
      with form_almacenes_000.SQLQuery_Almacenes do
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

procedure Tform_almacenes_001.Boton_Elegir_PoblacionClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_almacenes_000.SQLQuery_Almacenes do
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

procedure Tform_almacenes_001.Boton_Elegir_PaisClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_almacenes_000.SQLQuery_Almacenes do
    begin
        var_Registro := UTI_Abrir_Form( true, false, '', 60 );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_paises').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Pais.Text        := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_almacenes_001.Boton_Elegir_EmpresaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_almacenes_000.SQLQuery_Almacenes do
    begin
        var_Registro := UTI_Abrir_Form( true, false, '', 250 );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_empresas').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Empresa.Text       := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_almacenes_001.Boton_Elegir_ProvinciaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_almacenes_000.SQLQuery_Almacenes do
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

procedure Tform_almacenes_001.Edit_Descripcion_EmpresaClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add(rs_Quitamos_1);
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_almacenes_000.SQLQuery_Almacenes.FieldByName('id_empresas').Clear;
         Edit_Descripcion_Empresa.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_almacenes_001.Edit_Descripcion_PaisClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add(rs_Quitamos_2);
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_almacenes_000.SQLQuery_Almacenes.FieldByName('id_paises').Clear;
         Edit_Descripcion_Pais.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_almacenes_001.Edit_Descripcion_PoblacionClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add(rs_Quitamos_3);
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_almacenes_000.SQLQuery_Almacenes.FieldByName('id_poblaciones').Clear;
         Edit_Descripcion_Poblacion.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_almacenes_001.Edit_Descripcion_ProvinciaClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add(rs_Quitamos_4);
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_almacenes_000.SQLQuery_Almacenes.FieldByName('id_provincias').Clear;
         Edit_Descripcion_Provincia.Text := '';
    end;
    var_msg.Free;
end;

end.


