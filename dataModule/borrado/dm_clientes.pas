unit dm_clientes;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, sqldb, mysql56conn, FileUtil, utilidades_bd,
    utilidades_general;

type

    { TDataModule_Clientes }

    TDataModule_Clientes = class(TDataModule)
      SQLConnector_Clientes_Alb_Detalles: TSQLConnector;
        SQLConnector_Clientes: TSQLConnector;
        SQLConnector_Clientes_Contactos: TSQLConnector;
        SQLConnector_Clientes_Envios: TSQLConnector;
        SQLConnector_Clientes_Periodos: TSQLConnector;
        SQLTransaction_Clientes_Alb_Detalles: TSQLTransaction;
        SQLTransaction_Clientes: TSQLTransaction;
        SQLTransaction_Clientes_Contactos: TSQLTransaction;
        SQLTransaction_Clientes_Envios: TSQLTransaction;
        SQLTransaction_Clientes_Periodos: TSQLTransaction;
        procedure DataModuleCreate(Sender: TObject);
    private
        { private declarations }
    public
        { public declarations }
    end;

var
    DataModule_Clientes: TDataModule_Clientes;

implementation

{$R *.lfm}

{ TDataModule_Clientes }

procedure TDataModule_Clientes.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Abrir(SQLTransaction_Clientes, SQLConnector_Clientes) = False then UTI_GEN_Salir;
    if UTI_CN_Abrir(SQLTransaction_Clientes_Contactos, SQLConnector_Clientes_Contactos) = False then UTI_GEN_Salir;
    if UTI_CN_Abrir(SQLTransaction_Clientes_Envios, SQLConnector_Clientes_Envios) = False then UTI_GEN_Salir;
    if UTI_CN_Abrir(SQLTransaction_Clientes_Periodos, SQLConnector_Clientes_Periodos) = False then UTI_GEN_Salir;
    if UTI_CN_Abrir(SQLTransaction_Clientes_Alb_Detalles, SQLConnector_Clientes_Alb_Detalles) = False then UTI_GEN_Salir;
end;

end.

