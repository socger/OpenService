unit dm_historico_registros;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, sqldb, FileUtil, utilidades_bd, utilidades_general;

type

    { TDataModule_historico_registros }

    TDataModule_historico_registros = class(TDataModule)
        SQLConnector: TSQLConnector;
        SQLConnector1: TSQLConnector;
        SQLTransaction: TSQLTransaction;
        SQLTransaction1: TSQLTransaction;
        procedure DataModuleCreate(Sender: TObject);
    private
        { private declarations }
    public
        { public declarations }
    end;

var
    DataModule_historico_registros: TDataModule_historico_registros;

implementation

{$R *.lfm}

{ TDataModule_historico_registros }

procedure TDataModule_historico_registros.DataModuleCreate(Sender: TObject);
begin
     if UTI_CN_Connector_Open(SQLTransaction, SQLConnector) = False then UTI_GEN_Salir;
     if UTI_CN_Connector_Open(SQLTransaction1, SQLConnector1) = False then UTI_GEN_Salir;
end;

end.

