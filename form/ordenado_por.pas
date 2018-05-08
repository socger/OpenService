unit ordenado_por;

{$mode objfpc}{$H+}

interface

uses
    db, Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ButtonPanel, StdCtrls,
    utilidades_general, Buttons;

type

    { TForm_ordenado_por }

    TForm_ordenado_por = class(TForm)
        BitBtn_Add: TBitBtn;
        BitBtn_Ignorar: TBitBtn;
        ButtonPanel1: TButtonPanel;
        ComboBox_Campo: TComboBox;
        GroupBox_And_Or: TGroupBox;
        Label3: TLabel;
        Memo_OrderBy: TMemo;
        Radio_ASC: TRadioButton;
        Radio_OR: TRadioButton;

    procedure AnadirStrings_OrderBy( param_SQL : TStrings );
    procedure BitBtn_IgnorarClick(Sender: TObject);
    procedure BitBtn_AddClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure Rellenar_Campos;

    procedure FormCreate(Sender: TObject);

    private
        { private declarations }
        private_Salir_OK : Boolean;
    public
        { public declarations }
        public_Campos        : TFieldDefs;
        public_nombre_tabla  : String;
        public_Pulso_Aceptar : Boolean;
    end;

var
    Form_ordenado_por: TForm_ordenado_por;

implementation

{$R *.lfm}

{ TForm_ordenado_por }

****************************************************************************************************
****************************************************************************************************
****************************************************************************************************
****************************************************************************************************
****************************************************************************************************
****************************************************************************************************
****************************************************************************************************
****************************************************************************************************
****************************************************************************************************
****************************************************************************************************

procedure TForm_ordenado_por.FormCreate(Sender: TObject);
begin
  { ****************************************************************************
    Obligado en cada formulario para no olvidarlo
    **************************************************************************** }
    with Self do
    begin
        Position    := poScreenCenter;
        BorderIcons := [];
        BorderStyle := bsSingle;
    end;

    private_Salir_OK     := false;
    public_Pulso_Aceptar := false;
  { **************************************************************************** }

    Memo_OrderBy.Lines.Clear;

    public_Campos := TFieldDefs.Create(Nil);
end;

procedure TForm_ordenado_por.Rellenar_Campos;
var var_Contador : ShortInt;
    var_Campo    : String;
begin
  { ****************************************************************************
    Rellenamos el combobox de los campos de la tabla devueltos por la sql
    **************************************************************************** }
    ComboBox_Campo.Items.Clear;

    for var_Contador := 0 to (public_Campos.Count - 1) do
    begin
        If Pos( UpperCase('OT_'), UpperCase(public_Campos.Items[var_Contador].Name) ) = 0 then
        begin
            var_Campo := public_Campos.Items[var_Contador].Name;
            if Trim(public_nombre_tabla) <> '' then
            begin
                var_Campo := Trim(public_nombre_tabla) + '.' + var_Campo;
            end;
        end;

        ComboBox_Campo.Items.Add(var_Campo);
    end;

    ComboBox_Campo.ItemIndex := 0;
end;

procedure TForm_ordenado_por.AnadirStrings_OrderBy( param_SQL : TStrings );
begin
    with Memo_OrderBy do
    begin
        Clear;
        if Trim(param_SQL.Text) <> '' then
        begin
            Lines.AddStrings(param_SQL);
        end;
    end;
end;

procedure TForm_ordenado_por.BitBtn_IgnorarClick(Sender: TObject);
begin
    Memo_OrderBy.Lines.Clear;
end;

procedure TForm_ordenado_por.CancelButtonClick(Sender: TObject);
begin
    private_Salir_OK     := True;
    public_Pulso_Aceptar := false;
end;

procedure TForm_ordenado_por.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;

    if public_Pulso_Aceptar = true then
    begin
        {   COMPROBAMOS SI FALTA ALGO

            if Memo_Filtros.Lines.Count = 0 then
            begin
                var_msg.Add( 'No hay ningún filtro');
                Aviso(var_msg, '¿Está seguro?', True, False);
                var_msg.Clear;
            end;
        }
    end;

    if private_Salir_OK = False then
        begin
          { ********************************************************************
            Intento salir de la aplicación de un modo no permitido
            ******************************************************************** }
            CloseAction := caNone;
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
                    Aviso(var_msg, 'FALTA POR COMPLETAR.-', True, False);
                    CloseAction := caNone;
                end
            else
                begin
                    CloseAction := caFree;
                end;
        end;

    var_msg.Free;
end;

procedure TForm_ordenado_por.OKButtonClick(Sender: TObject);
begin
    private_Salir_OK     := true;
    public_Pulso_Aceptar := true;
end;

procedure TForm_ordenado_por.BitBtn_AddClick(Sender: TObject);
begin
    if Trim(Memo_OrderBy.Lines.Text) <> '' then
    begin
         Memo_OrderBy.Lines.Text := Trim(Memo_OrderBy.Lines.Text) + ', ';
    end;

    Memo_OrderBy.Lines.Text := Memo_OrderBy.Lines.Text + ComboBox_Campo.Text;

    if Radio_ASC.Checked = true then
         Memo_OrderBy.Lines.Text := Memo_OrderBy.Lines.Text + ' ASC'
    else Memo_OrderBy.Lines.Text := Memo_OrderBy.Lines.Text + ' DESC';
end;

end.


