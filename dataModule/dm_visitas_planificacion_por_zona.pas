unit dm_visitas_planificacion_por_zona;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, FileUtil, utilidades_bd, utilidades_general;

type

  { TDataModule_visitas_planificacion_por_zona }

  TDataModule_visitas_planificacion_por_zona = class(TDataModule)
    SQLCon_Plan_Zona: TSQLConnector;
    SQLTran_Plan_Zona: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_visitas_planificacion_por_zona: TDataModule_visitas_planificacion_por_zona;

implementation

{$R *.lfm}

{ TDataModule_visitas_planificacion_por_zona }

procedure TDataModule_visitas_planificacion_por_zona.DataModuleCreate(
  Sender: TObject);
begin
    if UTI_CN_Connector_Open( SQLTran_Plan_Zona,
                              SQLCon_Plan_Zona ) = False then
    begin
        UTI_GEN_Salir;
    end;
end;

end.

