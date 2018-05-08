unit dm_informes;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, FileUtil, utilidades_bd, utilidades_general;

type

  { TDataModule_Informes }

  TDataModule_Informes = class(TDataModule)
    SQLConnector_Informes: TSQLConnector;
    SQLTransaction_Informes: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_Informes: TDataModule_Informes;

implementation

{$R *.lfm}

{ TDataModule_Informes }

procedure TDataModule_Informes.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Abrir(SQLTransaction_Informes, SQLConnector_Informes) = False then UTI_GEN_Salir;
end;

end.

