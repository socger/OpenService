unit dm_tarifas;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, sqldb, mysql56conn, FileUtil, utilidades_bd,
    utilidades_general;

type

    { TDataModule_Tarifas }

    TDataModule_Tarifas = class(TDataModule)
        SQLConnector_Tarifas: TSQLConnector;
        SQLConnector_Tarifas_Margenes: TSQLConnector;
        SQLTransaction_Tarifas: TSQLTransaction;
        SQLTransaction_Tarifas_Margenes: TSQLTransaction;
        procedure DataModuleCreate(Sender: TObject);
    private
        { private declarations }
    public
        { public declarations }
    end;

var
    DataModule_Tarifas: TDataModule_Tarifas;

implementation

{$R *.lfm}

{ TDataModule_Tarifas }

procedure TDataModule_Tarifas.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Abrir(SQLTransaction_Tarifas, SQLConnector_Tarifas) = False then UTI_GEN_Salir;
    if UTI_CN_Abrir(SQLTransaction_Tarifas_Margenes, SQLConnector_Tarifas_Margenes) = False then UTI_GEN_Salir;
end;

end.

