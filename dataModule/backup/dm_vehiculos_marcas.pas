unit dm_vehiculos_marcas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, FileUtil, utilidades_bd, utilidades_general;

type

  { TDataModule_Vehiculos_Marcas }

  TDataModule_Vehiculos_Marcas = class(TDataModule)
    SQLConnector_Vehiculos_Marcas: TSQLConnector;
    SQLTransaction_Vehiculos_Marcas: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_Vehiculos_Marcas: TDataModule_Vehiculos_Marcas;

implementation

{$R *.lfm}

{ TDataModule_Vehiculos_Marcas }

procedure TDataModule_Vehiculos_Marcas.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Abrir( SQLTransaction_Vehiculos_Marcas,
                     SQLConnector_Vehiculos_Marcas ) = False then
    begin
        UTI_GEN_Salir;
    end;
end;

end.

