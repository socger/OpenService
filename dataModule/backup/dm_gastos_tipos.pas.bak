unit dm_gastos_tipos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, FileUtil, utilidades_bd, utilidades_general;

type

  { TDataModule_Gastos_Tipos }

  TDataModule_Gastos_Tipos = class(TDataModule)
    SQLConnector: TSQLConnector;
    SQLTransaction: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_Gastos_Tipos: TDataModule_Gastos_Tipos;

implementation

{$R *.lfm}

{ TDataModule_Gastos_Tipos }

procedure TDataModule_Gastos_Tipos.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Abrir(SQLTransaction, SQLConnector) = False then UTI_GEN_Salir;
end;

end.

