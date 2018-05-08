unit dm_presupuestos_compras;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, mysql50conn, mysql56conn, FileUtil, utilidades_bd, utilidades_general;

type

  { TDataModule_Presupuestos_Compras }

  TDataModule_Presupuestos_Compras = class(TDataModule)
    SQLConnector_Imptos_Totales: TSQLConnector;
    SQLConnector_List_Presup: TSQLConnector;
    SQLConnector_Pedido: TSQLConnector;
    SQLConnector_Pedido_Detalles: TSQLConnector;
    SQLConnector_Presup: TSQLConnector;
    SQLConnector_Presup_Detalles: TSQLConnector;
    SQLConnector_Presup_Imptos: TSQLConnector;
    SQLTransaction_Imptos_Totales: TSQLTransaction;
    SQLTransaction_List_Presup: TSQLTransaction;
    SQLTransaction_Pedido: TSQLTransaction;
    SQLTransaction_Pedido_Detalles: TSQLTransaction;
    SQLTransaction_Presup: TSQLTransaction;
    SQLTransaction_Presup_Detalles: TSQLTransaction;
    SQLTransaction_Presup_Imptos: TSQLTransaction;

    procedure DataModuleCreate(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_Presupuestos_Compras: TDataModule_Presupuestos_Compras;

implementation

{$R *.lfm}

{ TDataModule_Presupuestos_Compras }

procedure TDataModule_Presupuestos_Compras.DataModuleCreate(Sender: TObject);
begin
  if UTI_CN_Connector_Open( SQLTransaction_List_Presup, SQLConnector_List_Presup ) = False then UTI_GEN_Salir;

  if UTI_CN_Connector_Open( SQLTransaction_Presup, SQLConnector_Presup ) = False then UTI_GEN_Salir;
  if UTI_CN_Connector_Open( SQLTransaction_Presup_Detalles, SQLConnector_Presup_Detalles ) = False then UTI_GEN_Salir;
  if UTI_CN_Connector_Open( SQLTransaction_Presup_Imptos, SQLConnector_Presup_Imptos ) = False then UTI_GEN_Salir;

  if UTI_CN_Connector_Open( SQLTransaction_Pedido, SQLConnector_Pedido ) = False then UTI_GEN_Salir;
  if UTI_CN_Connector_Open( SQLTransaction_Pedido_Detalles, SQLConnector_Pedido_Detalles ) = False then UTI_GEN_Salir;
  if UTI_CN_Connector_Open( SQLTransaction_Imptos_Totales, SQLConnector_Imptos_Totales ) = False then UTI_GEN_Salir;
end;

end.

