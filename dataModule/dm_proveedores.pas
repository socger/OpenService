unit dm_proveedores;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, sqldb, mysql56conn, FileUtil, utilidades_bd, utilidades_general;

type

    { TDataModule_Proveedores }

    TDataModule_Proveedores = class(TDataModule)
        SQLConnector_Proveedores: TSQLConnector;
        SQLConnector_Proveedores_Contactos: TSQLConnector;
        SQLTransaction_Proveedores: TSQLTransaction;
        SQLTransaction_Proveedores_Contactos: TSQLTransaction;
        procedure DataModuleCreate(Sender: TObject);
    private
        { private declarations }
    public
        { public declarations }
    end;

var
    DataModule_Proveedores: TDataModule_Proveedores;

implementation

{$R *.lfm}

{ TDataModule_Proveedores }

procedure TDataModule_Proveedores.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Connector_Open( SQLTransaction_Proveedores, SQLConnector_Proveedores ) = False then UTI_GEN_Salir;
    if UTI_CN_Connector_Open( SQLTransaction_Proveedores_Contactos, SQLConnector_Proveedores_Contactos ) = False then UTI_GEN_Salir;
end;

end.

