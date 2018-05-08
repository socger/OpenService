unit dm_Provincias;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, sqldb, FileUtil, utilidades_bd, utilidades_general;

type

    { TDataModule_Provincias }

    TDataModule_Provincias = class(TDataModule)
        SQLConnector: TSQLConnector;
        SQLTransaction: TSQLTransaction;
        procedure DataModuleCreate(Sender: TObject);
    private
        { private declarations }
    public
        { public declarations }
    end;

var
    DataModule_Provincias: TDataModule_Provincias;

implementation

{$R *.lfm}

{ TDataModule_Provincias }

procedure TDataModule_Provincias.DataModuleCreate(Sender: TObject);
begin
     if UTI_CN_Connector_Open( SQLTransaction, SQLConnector ) = False then UTI_GEN_Salir;
end;

end.

