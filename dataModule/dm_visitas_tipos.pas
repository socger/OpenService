unit dm_visitas_tipos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, FileUtil, utilidades_bd, utilidades_general;

type

  { TDataModule_visitas_tipos }

  TDataModule_visitas_tipos = class(TDataModule)
    SQLConnector: TSQLConnector;
    SQLTransaction: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_visitas_tipos: TDataModule_visitas_tipos;

implementation

{$R *.lfm}

{ TDataModule_visitas_tipos }

procedure TDataModule_visitas_tipos.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Connector_Open(SQLTransaction, SQLConnector) = False then UTI_GEN_Salir;
end;

end.

