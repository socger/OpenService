unit barra_progreso;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls;

type

  { Tform_barra_progreso }

  Tform_barra_progreso = class(TForm)
    ProgressBar_Principal: TProgressBar;
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  form_barra_progreso: Tform_barra_progreso;

implementation

{$R *.lfm}

{ Tform_barra_progreso }

procedure Tform_barra_progreso.FormCreate(Sender: TObject);
begin
    // ********************************************************************************************* //
    // ** Obligado en cada formulario para no olvidarlo                                           ** //
    // ********************************************************************************************* //
    with Self do
    begin
        Position    := poScreenCenter;
        BorderIcons := [];
        BorderStyle := bsSingle;
    end;
end;

end.

