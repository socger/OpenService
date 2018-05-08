unit dm_cliente_elegir_direccion_envio;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, FileUtil, utilidades_bd, utilidades_general;

type

  { TDataModule_Cliente_Elegir_Direccion_Envio }

  TDataModule_Cliente_Elegir_Direccion_Envio = class(TDataModule)
    SQLConnector_CliEnv: TSQLConnector;
    SQLTransaction_CliEnv: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_Cliente_Elegir_Direccion_Envio: TDataModule_Cliente_Elegir_Direccion_Envio;

implementation

{$R *.lfm}

{ TDataModule_Cliente_Elegir_Direccion_Envio }

procedure TDataModule_Cliente_Elegir_Direccion_Envio.DataModuleCreate(Sender: TObject);
begin
  if UTI_CN_Connector_Open( SQLTransaction_CliEnv,
                            SQLConnector_CliEnv ) = False then
  begin
      UTI_GEN_Salir;
  end;
end;

end.

