unit dm_articulos_ultimas_ventas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, FileUtil, utilidades_bd, utilidades_general;

type

  { TDataModule_articulos_ultimas_ventas }

  TDataModule_articulos_ultimas_ventas = class(TDataModule)
    SQLConnector_Alb_V_D: TSQLConnector;
    SQLConnector_Alb_C_D: TSQLConnector;
    SQLConnector_Ftra_V_D: TSQLConnector;
    SQLConnector_Ftra_C_D: TSQLConnector;
    SQLTransaction_Alb_V_D: TSQLTransaction;
    SQLTransaction_Alb_C_D: TSQLTransaction;
    SQLTransaction_Ftra_V_D: TSQLTransaction;
    SQLTransaction_Ftra_C_D: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_articulos_ultimas_ventas: TDataModule_articulos_ultimas_ventas;

implementation

{$R *.lfm}

{ TDataModule_articulos_ultimas_ventas }

procedure TDataModule_articulos_ultimas_ventas.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Connector_Open( SQLTransaction_Alb_V_D, SQLConnector_Alb_V_D ) = False then UTI_GEN_Salir;
    if UTI_CN_Connector_Open( SQLTransaction_Ftra_V_D, SQLConnector_Ftra_V_D ) = False then UTI_GEN_Salir;
    if UTI_CN_Connector_Open( SQLTransaction_Alb_C_D, SQLConnector_Alb_C_D ) = False then UTI_GEN_Salir;
    if UTI_CN_Connector_Open( SQLTransaction_Ftra_C_D, SQLConnector_Ftra_C_D ) = False then UTI_GEN_Salir;
end;

end.

