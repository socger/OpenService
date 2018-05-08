unit dm_visitas_por_tipo_cliente;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, FileUtil, utilidades_bd, utilidades_general;

type

  { TDataModule_visitas_por_tipo_cliente }

  TDataModule_visitas_por_tipo_cliente = class(TDataModule)
    SQLCon_TCli: TSQLConnector;
    SQLCon_Visita: TSQLConnector;
    SQLTran_TCli: TSQLTransaction;
    SQLTran_Visita: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_visitas_por_tipo_cliente: TDataModule_visitas_por_tipo_cliente;

implementation

{$R *.lfm}

{ TDataModule_visitas_por_tipo_cliente }

procedure TDataModule_visitas_por_tipo_cliente.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Connector_Open(SQLTran_TCli, SQLCon_TCli) = False then UTI_GEN_Salir;
    if UTI_CN_Connector_Open(SQLTran_Visita, SQLCon_Visita) = False then UTI_GEN_Salir;
end;

end.

