unit dm_personal_familias;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, mysql56conn, FileUtil, utilidades_bd, utilidades_general;

type

  { TDataModule_Personal_Familias }

  TDataModule_Personal_Familias = class(TDataModule)
    SQLConnector_PerFam: TSQLConnector;
    SQLConnector_PerFamSubFamilias: TSQLConnector;
    SQLTransaction_PerFam: TSQLTransaction;
    SQLTransaction_PerFamSubFamilias: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_Personal_Familias: TDataModule_Personal_Familias;

implementation

{$R *.lfm}

{ TDataModule_Personal_Familias }

procedure TDataModule_Personal_Familias.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Abrir(SQLTransaction_PerFam, SQLConnector_PerFam) = False then UTI_GEN_Salir;
    if UTI_CN_Abrir(SQLTransaction_PerFamSubFamilias, SQLConnector_PerFamSubFamilias) = False then UTI_GEN_Salir;
end;

end.

