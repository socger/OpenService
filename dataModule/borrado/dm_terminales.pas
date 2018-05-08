unit dm_terminales;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, sqldb, FileUtil, utilidades_bd, utilidades_general;

type

    { TDataModule_Terminales }

    TDataModule_Terminales = class(TDataModule)
        SQLConnector_Terminales: TSQLConnector;
        SQLTransaction_Terminales: TSQLTransaction;
        procedure DataModuleCreate(Sender: TObject);
    private
        { private declarations }
    public
        { public declarations }
    end;

var
    DataModule_Terminales: TDataModule_Terminales;

implementation

{$R *.lfm}

{ TDataModule_Terminales }

procedure TDataModule_Terminales.DataModuleCreate(Sender: TObject);
begin
     if UTI_CN_Abrir(SQLTransaction_Terminales, SQLConnector_Terminales) = False then UTI_GEN_Salir;
end;

end.

