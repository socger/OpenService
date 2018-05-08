unit dm_empresas_elegir;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, mysql50conn, FileUtil, utilidades_bd,
  utilidades_general;

type

  { TDataModule_empresas_elegir }

  TDataModule_empresas_elegir = class(TDataModule)
    SQLConnector: TSQLConnector;
    SQLTransaction: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_empresas_elegir: TDataModule_empresas_elegir;

implementation

{$R *.lfm}

{ TDataModule_empresas_elegir }

procedure TDataModule_empresas_elegir.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Connector_Open( SQLTransaction, SQLConnector ) = False then UTI_GEN_Salir;
end;

end.

