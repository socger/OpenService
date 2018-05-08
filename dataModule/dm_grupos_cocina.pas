unit dm_grupos_cocina;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, sqldb, mysql56conn, FileUtil, utilidades_bd,
    utilidades_general;

type

    { TDataModule_Grupos_Cocina }

    TDataModule_Grupos_Cocina = class(TDataModule)
        SQLConnector: TSQLConnector;
        SQLTransaction: TSQLTransaction;
        procedure DataModuleCreate(Sender: TObject);
    private
        { private declarations }
    public
        { public declarations }
    end;

var
    DataModule_Grupos_Cocina: TDataModule_Grupos_Cocina;

implementation

{$R *.lfm}

{ TDataModule_Grupos_Cocina }

procedure TDataModule_Grupos_Cocina.DataModuleCreate(Sender: TObject);
begin
     if UTI_CN_Connector_Open( SQLTransaction, SQLConnector ) = False then UTI_GEN_Salir;
end;

end.

