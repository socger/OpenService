unit dm_actividades;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, mysql50conn, mysql56conn, FileUtil, utilidades_bd,
  utilidades_general;

type

  { TDataModule_actividades }

  TDataModule_actividades = class(TDataModule)
    SQLConnector: TSQLConnector;
    SQLTransaction: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_actividades: TDataModule_actividades;

implementation

{$R *.lfm}

{ TDataModule_actividades }

procedure TDataModule_actividades.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Abrir(SQLTransaction, SQLConnector) = False then UTI_GEN_Salir;
end;

end.

