unit dm_visitas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, FileUtil, utilidades_bd, utilidades_general;

type

  { TDataModule_visitas }

  TDataModule_visitas = class(TDataModule)
    SQLConnector: TSQLConnector;
    SQLTransaction: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_visitas: TDataModule_visitas;

implementation

{$R *.lfm}

{ TDataModule_visitas }

procedure TDataModule_visitas.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Abrir(SQLTransaction, SQLConnector) = False then UTI_GEN_Salir;
end;

end.

