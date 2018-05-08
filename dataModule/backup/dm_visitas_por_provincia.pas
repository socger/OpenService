unit dm_visitas_por_provincia;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, FileUtil, utilidades_bd, utilidades_general;

type

  { TDataModule_visitas_por_provincia }

  TDataModule_visitas_por_provincia = class(TDataModule)
    SQLCon_Prov: TSQLConnector;
    SQLCon_Visita: TSQLConnector;
    SQLTran_Prov: TSQLTransaction;
    SQLTran_Visita: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_visitas_por_provincia: TDataModule_visitas_por_provincia;

implementation

{$R *.lfm}

{ TDataModule_visitas_por_provincia }

procedure TDataModule_visitas_por_provincia.DataModuleCreate(Sender: TObject);
begin
  if UTI_CN_Abrir(SQLTran_Prov, SQLCon_Prov) = False then UTI_GEN_Salir;
  if UTI_CN_Abrir(SQLTran_Visita, SQLCon_Visita) = False then UTI_GEN_Salir;
end;

end.

