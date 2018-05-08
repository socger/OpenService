unit dm_vehiculos_tipo_cambios;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, FileUtil, utilidades_bd, utilidades_general;

type

  { TDataModule_Vehiculos_Tipo_Cambios }

  TDataModule_Vehiculos_Tipo_Cambios = class(TDataModule)
    SQLConnector_VTCambios: TSQLConnector;
    SQLTransaction_VTCambios: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_Vehiculos_Tipo_Cambios: TDataModule_Vehiculos_Tipo_Cambios;

implementation

{$R *.lfm}

{ TDataModule_Vehiculos_Tipo_Cambios }

procedure TDataModule_Vehiculos_Tipo_Cambios.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Abrir( SQLTransaction_VTCambios,
                     SQLConnector_VTCambios ) = False then
    begin
        UTI_GEN_Salir;
    end;
end;

end.

