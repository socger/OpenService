unit dm_margenes_tarifas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, FileUtil, utilidades_bd, utilidades_general;

type

  { TDataModule_Margenes_Tarifas }

  TDataModule_Margenes_Tarifas = class(TDataModule)
    SQLConnector: TSQLConnector;
    SQLTransaction: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_Margenes_Tarifas: TDataModule_Margenes_Tarifas;

implementation

{$R *.lfm}

{ TDataModule_Margenes_Tarifas }

procedure TDataModule_Margenes_Tarifas.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Connector_Open(SQLTransaction, SQLConnector) = False then UTI_GEN_Salir;
end;

end.

