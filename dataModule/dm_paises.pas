unit dm_paises;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, sqldb, mysql56conn, FileUtil, utilidades_bd,
    utilidades_general;

type

    { TDataModule_Paises }

    TDataModule_Paises = class(TDataModule)
        SQLConnector: TSQLConnector;
        SQLTransaction: TSQLTransaction;
        procedure DataModuleCreate(Sender: TObject);
    private
        { private declarations }
    public
        { public declarations }
    end;

var
    DataModule_Paises: TDataModule_Paises;

implementation

{$R *.lfm}

{ TDataModule_Paises }

procedure TDataModule_Paises.DataModuleCreate(Sender: TObject);
begin
     if UTI_CN_Connector_Open( SQLTransaction, SQLConnector ) = False then UTI_GEN_Salir;
end;

end.

