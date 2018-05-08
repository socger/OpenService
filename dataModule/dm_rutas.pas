unit dm_rutas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, FileUtil, utilidades_bd, utilidades_general;

type

  { TDataModule_rutas }

  TDataModule_rutas = class(TDataModule)
    SQLConnector: TSQLConnector;
    SQLTransaction: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_rutas: TDataModule_rutas;

implementation

{$R *.lfm}

{ TDataModule_rutas }

procedure TDataModule_rutas.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Connector_Open(SQLTransaction, SQLConnector) = False then UTI_GEN_Salir;
end;

end.

