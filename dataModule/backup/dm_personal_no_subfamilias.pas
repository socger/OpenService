unit dm_personal_no_subfamilias;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, mysql56conn, FileUtil, utilidades_bd, utilidades_general;

type

  { TDataModule_Personal_No_SubFamilias }

  TDataModule_Personal_No_SubFamilias = class(TDataModule)
    SQLConnector_PerFamNOSub: TSQLConnector;
    SQLTransaction_PerFamNOSub: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_Personal_No_SubFamilias: TDataModule_Personal_No_SubFamilias;

implementation

{$R *.lfm}

{ TDataModule_Personal_No_SubFamilias }

procedure TDataModule_Personal_No_SubFamilias.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Abrir( SQLTransaction_PerFamNOSub,
                     SQLConnector_PerFamNOSub ) = False then
    begin
        UTI_GEN_Salir;
    end;
end;

end.

