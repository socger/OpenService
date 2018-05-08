unit dm_visitas_por_representante;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, FileUtil, utilidades_bd, utilidades_general;

type

  { TDataModule_visitas_por_representante }

  TDataModule_visitas_por_representante = class(TDataModule)
    SQLCon_Rep: TSQLConnector;
    SQLCon_Visita: TSQLConnector;
    SQLTran_Rep: TSQLTransaction;
    SQLTran_Visita: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_visitas_por_representante: TDataModule_visitas_por_representante;

implementation

{$R *.lfm}

{ TDataModule_visitas_por_representante }

procedure TDataModule_visitas_por_representante.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Abrir(SQLTran_Rep, SQLCon_Rep) = False then UTI_GEN_Salir;
    if UTI_CN_Abrir(SQLTran_Visita, SQLCon_Visita) = False then UTI_GEN_Salir;
end;

end.

