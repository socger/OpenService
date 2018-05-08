unit dm_impuestos_para_composicion;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, sqldb, FileUtil, utilidades_bd, utilidades_general;

type

    { TDataModule_impuestos_para_composicion }

    TDataModule_impuestos_para_composicion = class(TDataModule)
        SQLConnector_ImptosC: TSQLConnector;
        SQLTransaction_ImptosC: TSQLTransaction;
        procedure DataModuleCreate(Sender: TObject);
    private
        { private declarations }
    public
        { public declarations }
    end;

var
    DataModule_impuestos_para_composicion: TDataModule_impuestos_para_composicion;

implementation

{$R *.lfm}

{ TDataModule_impuestos_para_composicion }

procedure TDataModule_impuestos_para_composicion.DataModuleCreate(
  Sender: TObject);
begin
     if UTI_CN_Abrir(SQLTransaction_ImptosC, SQLConnector_ImptosC) = False then UTI_GEN_Salir;
end;

end.

