unit dm_impresoras;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, sqldb, mysql56conn, FileUtil, utilidades_bd, utilidades_general;

type

    { TDataModule_Impresoras }

    TDataModule_Impresoras = class(TDataModule)
        SQLConnector_Impresoras: TSQLConnector;
        SQLTransaction_Impresoras: TSQLTransaction;
        procedure DataModuleCreate(Sender: TObject);
    private
        { private declarations }
    public
        { public declarations }
    end;

var
    DataModule_Impresoras: TDataModule_Impresoras;

implementation

{$R *.lfm}

{ TDataModule_Impresoras }

procedure TDataModule_Impresoras.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Abrir(SQLTransaction_Impresoras, SQLConnector_Impresoras) = False then UTI_GEN_Salir;
end;

end.

