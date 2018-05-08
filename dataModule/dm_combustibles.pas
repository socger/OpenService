unit dm_combustibles;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, FileUtil, utilidades_bd, utilidades_general;

type

  { TDataModule_Combustibles }

  TDataModule_Combustibles = class(TDataModule)
    SQLConnector_Combustibles: TSQLConnector;
    SQLTransaction_Combustibles: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_Combustibles: TDataModule_Combustibles;

implementation

{$R *.lfm}

{ TDataModule_Combustibles }

procedure TDataModule_Combustibles.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Connector_Open( SQLTransaction_Combustibles,
                              SQLConnector_Combustibles ) = False then
    begin
        UTI_GEN_Salir;
    end;
end;

end.

