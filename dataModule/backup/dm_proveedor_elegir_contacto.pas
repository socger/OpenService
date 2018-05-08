unit dm_proveedor_elegir_contacto;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, mysql56conn, FileUtil, utilidades_bd,
  utilidades_general;

type

  { TDataModule_Proveedor_Elegir_Contacto }

  TDataModule_Proveedor_Elegir_Contacto = class(TDataModule)
    SQLConnector_ProContactos: TSQLConnector;
    SQLTransaction_ProContactos: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_Proveedor_Elegir_Contacto: TDataModule_Proveedor_Elegir_Contacto;

implementation

{$R *.lfm}

{ TDataModule_Proveedor_Elegir_Contacto }

procedure TDataModule_Proveedor_Elegir_Contacto.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Abrir( SQLTransaction_ProContactos,
                     SQLConnector_ProContactos ) = False then
    begin
        UTI_GEN_Salir;
    end;
end;

end.

