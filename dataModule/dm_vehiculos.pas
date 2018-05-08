unit dm_vehiculos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, FileUtil, utilidades_bd, utilidades_general;

type

  { TDataModule_Vehiculos }

  TDataModule_Vehiculos = class(TDataModule)
    SQLConnector_Vehiculos: TSQLConnector;
    SQLConnector_Vehiculos_su_Equipamiento: TSQLConnector;
    SQLTransaction_Vehiculos: TSQLTransaction;
    SQLTransaction_Vehiculos_su_Equipamiento: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_Vehiculos: TDataModule_Vehiculos;

implementation

{$R *.lfm}

{ TDataModule_Vehiculos }

procedure TDataModule_Vehiculos.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Connector_Open( SQLTransaction_Vehiculos,
                              SQLConnector_Vehiculos ) = False then
    begin
        UTI_GEN_Salir;
    end;

    if UTI_CN_Connector_Open( SQLTransaction_Vehiculos_su_Equipamiento,
                              SQLConnector_Vehiculos_su_Equipamiento ) = False then
    begin
        UTI_GEN_Salir;
    end;
end;

end.

