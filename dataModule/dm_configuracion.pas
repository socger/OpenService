unit dm_configuracion;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, mysql50conn, mysql56conn, FileUtil, utilidades_bd,
  utilidades_general;

type

  { TDataModule_configuracion }

  TDataModule_configuracion = class(TDataModule)
    SQLConnector: TSQLConnector;
    SQLTransaction: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_configuracion: TDataModule_configuracion;

implementation

{$R *.lfm}

{ TDataModule_configuracion }

procedure TDataModule_configuracion.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Connector_Open( SQLTransaction,
                              SQLConnector ) = False then UTI_GEN_Salir;
end;

end.

