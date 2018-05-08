unit dm_proveedores_tipos;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, sqldb, FileUtil, utilidades_bd, utilidades_general;

type

    { TDataModule_Proveedores_Tipos }

    TDataModule_Proveedores_Tipos = class(TDataModule)
        SQLConnector: TSQLConnector;
        SQLTransaction: TSQLTransaction;
        procedure DataModuleCreate(Sender: TObject);
    private
        { private declarations }
    public
        { public declarations }
    end;

var
    DataModule_Proveedores_Tipos: TDataModule_Proveedores_Tipos;

implementation

{$R *.lfm}

{ TDataModule_Proveedores_Tipos }

procedure TDataModule_Proveedores_Tipos.DataModuleCreate(Sender: TObject);
begin
     if UTI_CN_Abrir(SQLTransaction, SQLConnector) = False then UTI_GEN_Salir;
end;

end.

