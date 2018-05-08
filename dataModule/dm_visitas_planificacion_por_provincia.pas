unit dm_visitas_planificacion_por_provincia;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, FileUtil, utilidades_bd, utilidades_general;

type

  { TDataModule_visitas_planificacion_por_provincia }

  TDataModule_visitas_planificacion_por_provincia = class(TDataModule)
    SQLCon_Plan_Pro: TSQLConnector;
    SQLTran_Plan_Pro: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_visitas_planificacion_por_provincia: TDataModule_visitas_planificacion_por_provincia;

implementation

{$R *.lfm}

{ TDataModule_visitas_planificacion_por_provincia }

procedure TDataModule_visitas_planificacion_por_provincia.DataModuleCreate(
  Sender: TObject);
begin
    if UTI_CN_Connector_Open( SQLTran_Plan_Pro,
                              SQLCon_Plan_Pro ) = False then
    begin
        UTI_GEN_Salir;
    end;
end;

end.

