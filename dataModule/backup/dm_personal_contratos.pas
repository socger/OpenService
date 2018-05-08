unit dm_personal_contratos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, FileUtil, utilidades_bd, utilidades_general;

type

  { TDataModule_Personal_Contratos }

  TDataModule_Personal_Contratos = class(TDataModule)
    SQLConnector: TSQLConnector;
    SQLTransaction: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_Personal_Contratos: TDataModule_Personal_Contratos;

implementation

{$R *.lfm}

{ TDataModule_Personal_Contratos }

procedure TDataModule_Personal_Contratos.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Abrir(SQLTransaction, SQLConnector) = False then UTI_GEN_Salir;
end;

end.

