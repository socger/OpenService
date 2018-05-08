unit dm_tarjetas_transporte;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, FileUtil, utilidades_bd, utilidades_general;

type

  { TDataModule_Tarjetas_Transporte }

  TDataModule_Tarjetas_Transporte = class(TDataModule)
    SQLConnector_Tjtas_Tte: TSQLConnector;
    SQLTransaction_Tjtas_Tte: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_Tarjetas_Transporte: TDataModule_Tarjetas_Transporte;

implementation

{$R *.lfm}

{ TDataModule_Tarjetas_Transporte }

procedure TDataModule_Tarjetas_Transporte.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Connector_Open( SQLTransaction_Tjtas_Tte,
                              SQLConnector_Tjtas_Tte ) = False then
    begin
        UTI_GEN_Salir;
    end;
end;

end.

