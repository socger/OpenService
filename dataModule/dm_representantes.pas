unit dm_representantes;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, sqldb, mysql56conn, FileUtil, utilidades_bd,
    utilidades_general;

type

    { TDataModule_Representantes }

    TDataModule_Representantes = class(TDataModule)
        SQLConnector: TSQLConnector;
        SQLTransaction: TSQLTransaction;
        procedure DataModuleCreate(Sender: TObject);
    private
        { private declarations }
    public
        { public declarations }
    end;

var
    DataModule_Representantes: TDataModule_Representantes;

implementation

{$R *.lfm}

{ TDataModule_Representantes }

procedure TDataModule_Representantes.DataModuleCreate(Sender: TObject);
begin
     if UTI_CN_Connector_Open( SQLTransaction, SQLConnector ) = False then UTI_GEN_Salir;
end;

end.

