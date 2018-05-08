unit dm_visitas_por_zona;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, FileUtil, utilidades_bd, utilidades_general;

type

  { TDataModule_visitas_por_zona }

  TDataModule_visitas_por_zona = class(TDataModule)
    SQLCon_Ruta: TSQLConnector;
    SQLCon_Visita: TSQLConnector;
    SQLTran_Ruta: TSQLTransaction;
    SQLTran_Visita: TSQLTransaction;
    procedure DataModule_visitas_por_zona(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_visitas_por_zona: TDataModule_visitas_por_zona;

implementation

{$R *.lfm}

{ TDataModule_visitas_por_zona }

procedure TDataModule_visitas_por_zona.DataModule_visitas_por_zona(Sender: TObject);
begin
    if UTI_CN_Connector_Open(SQLTran_Ruta, SQLCon_Ruta) = False then UTI_GEN_Salir;
    if UTI_CN_Connector_Open(SQLTran_Visita, SQLCon_Visita) = False then UTI_GEN_Salir;
end;

end.

