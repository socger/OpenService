unit dm_utilidades;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, mysql56conn, FileUtil, utilidades_bd,
  utilidades_general;

type

  { TDataModule_utilidades }

  TDataModule_utilidades = class(TDataModule)
    SQLConnector: TSQLConnector;
    SQLTransaction: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_utilidades: TDataModule_utilidades;

implementation

{$R *.lfm}

{ TDataModule_utilidades }

procedure TDataModule_utilidades.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Abrir(SQLTransaction, SQLConnector) = False then UTI_GEN_Salir;
end;

end.

