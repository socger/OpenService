unit dm_empresas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, mysql56conn, mysql50conn, FileUtil, utilidades_bd,
  utilidades_general;

type

  { TDataModule_Empresas }

  TDataModule_Empresas = class(TDataModule)
    SQLConnector: TSQLConnector;
    SQLTransaction: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_Empresas: TDataModule_Empresas;

implementation

{$R *.lfm}

{ TDataModule_Empresas }

procedure TDataModule_Empresas.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Connector_Open( SQLTransaction, SQLConnector ) = False then UTI_GEN_Salir;
end;

end.

