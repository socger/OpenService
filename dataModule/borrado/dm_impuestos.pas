unit dm_impuestos;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, sqldb, FileUtil, utilidades_bd, utilidades_general;

type

    { TDataModule_Impuestos }

    TDataModule_Impuestos = class(TDataModule)
        SQLConnector_Imptos: TSQLConnector;
        SQLConnector_ImptosComp: TSQLConnector;
        SQLTransaction_Imptos: TSQLTransaction;
        SQLTransaction_ImptosComp: TSQLTransaction;
        procedure DataModuleCreate(Sender: TObject);
    private
        { private declarations }
    public
        { public declarations }
    end;

var
    DataModule_Impuestos: TDataModule_Impuestos;

implementation

{$R *.lfm}

{ TDataModule_Impuestos }

procedure TDataModule_Impuestos.DataModuleCreate(Sender: TObject);
begin
     if UTI_CN_Abrir(SQLTransaction_Imptos, SQLConnector_Imptos) = False then UTI_GEN_Salir;
     if UTI_CN_Abrir(SQLTransaction_ImptosComp, SQLConnector_ImptosComp) = False then UTI_GEN_Salir;
end;

end.

