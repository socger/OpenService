unit dm_pedidos_ventas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, mysql50conn, mysql56conn, FileUtil, utilidades_bd,
  utilidades_general;

type

  { TDataModule_pedidos_ventas }

  TDataModule_pedidos_ventas = class(TDataModule)
    SQLConnector_Alb: TSQLConnector;
    SQLConnector_Alb_Detalles: TSQLConnector;
    SQLConnector_Imptos_Totales: TSQLConnector;
    SQLConnector_List_Pdo: TSQLConnector;
    SQLConnector_Pedido_Imptos: TSQLConnector;
    SQLConnector_Pedido: TSQLConnector;
    SQLConnector_Pedido_Detalles: TSQLConnector;
    SQLConnector_Pedido_Detalles_Stock: TSQLConnector;
    SQLTransaction_Alb: TSQLTransaction;
    SQLTransaction_Alb_Detalles: TSQLTransaction;
    SQLTransaction_Imptos_Totales: TSQLTransaction;
    SQLTransaction_List_Pdo: TSQLTransaction;
    SQLTransaction_Pedido_Imptos: TSQLTransaction;
    SQLTransaction_Pedido: TSQLTransaction;
    SQLTransaction_Pedido_Detalles: TSQLTransaction;
    SQLTransaction_Pedido_Detalles_Stock: TSQLTransaction;

    procedure DataModuleCreate(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_pedidos_ventas: TDataModule_pedidos_ventas;

implementation

{$R *.lfm}

{ TDataModule_pedidos_ventas }

procedure TDataModule_pedidos_ventas.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Abrir(SQLTransaction_List_Pdo, SQLConnector_List_Pdo) = False then UTI_GEN_Salir;

    if UTI_CN_Abrir(SQLTransaction_Pedido, SQLConnector_Pedido) = False then UTI_GEN_Salir;
    if UTI_CN_Abrir(SQLTransaction_Pedido_Detalles, SQLConnector_Pedido_Detalles) = False then UTI_GEN_Salir;
    if UTI_CN_Abrir(SQLTransaction_Pedido_Detalles_Stock, SQLConnector_Pedido_Detalles_Stock) = False then UTI_GEN_Salir;
    if UTI_CN_Abrir(SQLTransaction_Pedido_Imptos, SQLConnector_Pedido_Imptos) = False then UTI_GEN_Salir;

    if UTI_CN_Abrir(SQLTransaction_Alb, SQLConnector_Alb) = False then UTI_GEN_Salir;
    if UTI_CN_Abrir(SQLTransaction_Alb_Detalles, SQLConnector_Alb_Detalles) = False then UTI_GEN_Salir;
    if UTI_CN_Abrir(SQLTransaction_Imptos_Totales, SQLConnector_Imptos_Totales) = False then UTI_GEN_Salir;
end;

end.

