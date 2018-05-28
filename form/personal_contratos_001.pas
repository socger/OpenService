unit personal_contratos_001;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ButtonPanel, StdCtrls, DbCtrls,
  db, utilidades_general, utilidades_forms_Filtrar, Buttons, DBExtCtrls;

type

  { Tform_personal_contratos_001 }

  Tform_personal_contratos_001 = class(TForm)
    Boton_Elegir_Contrato_Tipo: TBitBtn;
    Boton_Elegir_Empleado: TBitBtn;
    Boton_Elegir_Empresa: TBitBtn;
    ButtonPanel1: TButtonPanel;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    DBEdit_eMail1: TDBEdit;
    DBMemo_Observaciones_Comentarios: TDBMemo;
    Edit_Descripcion_Contrato_Tipo: TEdit;
    Edit_Descripcion_Empleado: TEdit;
    Edit_Descripcion_Empresa: TEdit;
    GroupBox11: TGroupBox;
    Label10: TLabel;
    Label26: TLabel;
    Label6: TLabel;
    Label62: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;

    procedure Presentar_Datos;
    procedure no_Tocar;
    function  Comprobar_No_Tocar( param_Reproducir_Mensajes, param_Ejecutar_No_Tocar : Boolean ) : Boolean;
    procedure para_Empezar;
    procedure Boton_Elegir_Contrato_TipoClick(Sender: TObject);
    procedure Boton_Elegir_EmpleadoClick(Sender: TObject);
    procedure Boton_Elegir_EmpresaClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure Edit_Descripcion_Contrato_TipoClick(Sender: TObject);
    procedure Edit_Descripcion_EmpleadoClick(Sender: TObject);
    procedure Edit_Descripcion_EmpresaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
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
  form_personal_contratos_001: Tform_personal_contratos_001;

implementation

{$R *.lfm}

uses menu, personal_contratos_000;

{ Tform_personal_contratos_001 }

procedure Tform_personal_contratos_001.FormActivate(Sender: TObject);
begin
    If form_personal_contratos_000.public_Elegimos = true then
    begin
        with Self do
        begin
            Color := $00B9959C;
        end;
    end;

    Comprobar_No_Tocar(true, true);
end;

function Tform_personal_contratos_001.Comprobar_No_Tocar( param_Reproducir_Mensajes,
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

procedure Tform_personal_contratos_001.FormCreate(Sender: TObject);
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

procedure Tform_personal_contratos_001.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg : TStrings;
begin
    ButtonPanel1.SetFocus; // Con esto consigo que salga del campo que este y pueda actualizarlo

    var_msg := TStringList.Create;

    if public_Pulso_Aceptar = true then
    begin
        with form_personal_contratos_000.SQLQuery_Personal_Contratos do
        begin
            if Trim(FieldByName('id_personal').AsString) = '' then
            begin
                var_msg.Add( '* El empleado.');
            end;

            if Trim(FieldByName('id_empresas').AsString) = '' then
            begin
                var_msg.Add( '* La empresa.');
            end;

            if Trim(FieldByName('id_personal_contratos_familias').AsString) = '' then
            begin
                var_msg.Add( '* El tipo de contrato.');
            end;

            if Trim(FieldByName('Inicio').AsString) = '' then
            begin
                var_msg.Add( '* El inicio del contrato.');
            end;

            if Trim(FieldByName('Fin').AsString) = '' then
            begin
                var_msg.Add( '* El fin del contrato.');
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

procedure Tform_personal_contratos_001.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := True;
    public_Pulso_Aceptar := false;
end;

procedure Tform_personal_contratos_001.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := True;
    public_Pulso_Aceptar := true;
end;

procedure Tform_personal_contratos_001.Edit_Descripcion_EmpleadoClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS el EMPLEADO');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_personal_contratos_000.SQLQuery_Personal_Contratos.FieldByName('id_personal').Clear;
         Edit_Descripcion_Empleado.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_personal_contratos_001.Edit_Descripcion_EmpresaClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS la EMPRESA');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_personal_contratos_000.SQLQuery_Personal_Contratos.FieldByName('id_empresas').Clear;
         Edit_Descripcion_Empresa.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_personal_contratos_001.Edit_Descripcion_Contrato_TipoClick(Sender: TObject);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('¿QUITAMOS el TIPO DE CONTRATO');
    if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
    begin
         form_personal_contratos_000.SQLQuery_Personal_Contratos.FieldByName('id_personal_contratos_familias').Clear;
         Edit_Descripcion_Contrato_Tipo.Text := '';
    end;
    var_msg.Free;
end;

procedure Tform_personal_contratos_001.Boton_Elegir_EmpleadoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_personal_contratos_000.SQLQuery_Personal_Contratos do
    begin
        var_Registro := UTI_Abrir_Modulo_Personal( true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_personal').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Empleado.Text      := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_personal_contratos_001.Boton_Elegir_EmpresaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_personal_contratos_000.SQLQuery_Personal_Contratos do
    begin
        var_Registro := UTI_Abrir_Modulo_Empresas( true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_empresas').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Empresa.Text       := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_personal_contratos_001.Boton_Elegir_Contrato_TipoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
    with form_personal_contratos_000.SQLQuery_Personal_Contratos do
    begin
        var_Registro := UTI_Abrir_Modulo_FamiliasContratosPersonal( true, false, '1' );
        if var_Registro.id_1 <> '' then
        begin
             FieldByName('id_personal_contratos_familias').AsString := Trim(var_Registro.id_1);
             Edit_Descripcion_Contrato_Tipo.Text                    := var_Registro.descripcion_1;
        end;
    end;
end;

procedure Tform_personal_contratos_001.para_Empezar;
begin
    { ****************************************************************************
      Solo para formularios que traten con datos
      **************************************************************************** }
      with form_personal_contratos_000.SQLQuery_Personal_Contratos do
      begin
          public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                             '',
                                                             '',

                                                             FieldByName('OT_Descripcion_Contrato').AsString,
                                                             '',
                                                             '' );
      end;

      Presentar_Datos;

    { ****************************************************************************
      SOLO PARA ESTE FORM
      **************************************************************************** }
end;

procedure Tform_personal_contratos_001.no_Tocar;
begin
    Boton_Elegir_Empleado.Enabled            := False;
    Edit_Descripcion_Empleado.Enabled        := False;
    Boton_Elegir_Empresa.Enabled             := False;
    Edit_Descripcion_Empresa.Enabled         := False;
    Boton_Elegir_Contrato_Tipo.Enabled       := False;
    Edit_Descripcion_Contrato_Tipo.Enabled   := False;
    DBDateEdit1.Enabled                      := False;
    DBDateEdit2.Enabled                      := False;
    DBMemo_Observaciones_Comentarios.Enabled := False;
end;

procedure Tform_personal_contratos_001.Presentar_Datos;
var var_Hora : tTime;
    var_Dia  : tDate;
begin
    with form_personal_contratos_000.SQLQuery_Personal_Contratos do
    begin
        Edit_Descripcion_Empleado.Text      := FieldByName('OT_Nombre_Empleado').AsString;
        Edit_Descripcion_Empresa.Text       := FieldByName('OT_Descripcion_Empresa').AsString;
        Edit_Descripcion_Contrato_Tipo.Text := FieldByName('OT_Descripcion_Contrato').AsString;
    end;
end;

end.


