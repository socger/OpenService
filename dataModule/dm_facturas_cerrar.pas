unit dm_facturas_cerrar;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, mysql56conn, FileUtil, utilidades_bd,
  utilidades_general;

type

  { TDataModule_facturas_cerrar }

  TDataModule_facturas_cerrar = class(TDataModule)
    SQLConnector: TSQLConnector;
    SQLTransaction: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_facturas_cerrar: TDataModule_facturas_cerrar;

implementation

{$R *.lfm}

{ TDataModule_facturas_cerrar }

procedure TDataModule_facturas_cerrar.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Connector_Open(SQLTransaction, SQLConnector) = False then UTI_GEN_Salir;
end;

end.

