unit arrancar;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs;

type

    { TForm_Arrancar }

    TForm_Arrancar = class(TForm)
        procedure FormCreate(Sender: TObject);
    private
        { private declarations }
    public
        { public declarations }
    end;

var
    Form_Arrancar: TForm_Arrancar;

implementation

{$R *.lfm}

uses menu;

{ TForm_Arrancar }

procedure TForm_Arrancar.FormCreate(Sender: TObject);
begin
    Application.CreateForm(TForm_Menu, Form_Menu);
    Form_Menu.ShowModal;
    try
       Form_Menu.Free;
       Application.Terminate;
    Except
      on E: Exception do
      begin
         ShowMessage('Error! ' + E.Message);
         raise;
      end;
    end;
end;

end.

