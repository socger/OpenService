unit dm_Users_Elegir;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, FileUtil, utilidades_bd, utilidades_general;

type

  { TDataModule_Users_Elegir }

  TDataModule_Users_Elegir = class(TDataModule)
    SQLConnector_Users_Elegir: TSQLConnector;
    SQLTransaction_Users_Elegir: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_Users_Elegir: TDataModule_Users_Elegir;

implementation

{$R *.lfm}

{ TDataModule_Users_Elegir }

procedure TDataModule_Users_Elegir.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Abrir(SQLTransaction_Users_Elegir, SQLConnector_Users_Elegir) = False then UTI_GEN_Salir;
end;

end.

