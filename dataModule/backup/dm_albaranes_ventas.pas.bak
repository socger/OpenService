unit dm_albaranes_ventas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, mysql50conn, mysql56conn, FileUtil, utilidades_bd,
  utilidades_general;

type

  { TDataModule_Albaranes_Ventas }

  TDataModule_Albaranes_Ventas = class(TDataModule)
    SQLConnector_Alb_Detalles: TSQLConnector;
    SQLConnector_Alb: TSQLConnector;
    SQLConnector_Alb_Detalles_Stock: TSQLConnector;
    SQLConnector_Alb_Imptos: TSQLConnector;
    SQLConnector_Imptos_Totales: TSQLConnector;
    SQLConnector_List_Alb: TSQLConnector;
    SQLTransaction_Alb_Detalles: TSQLTransaction;
    SQLTransaction_Alb: TSQLTransaction;
    SQLTransaction_Alb_Detalles_Stock: TSQLTransaction;
    SQLTransaction_Alb_Imptos: TSQLTransaction;
    SQLTransaction_Imptos_Totales: TSQLTransaction;
    SQLTransaction_List_Alb: TSQLTransaction;

    procedure DataModuleCreate(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_Albaranes_Ventas: TDataModule_Albaranes_Ventas;

implementation

{$R *.lfm}

{ TDataModule_Albaranes_Ventas }

procedure TDataModule_Albaranes_Ventas.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Abrir(SQLTransaction_List_Alb, SQLConnector_List_Alb) = False then UTI_GEN_Salir;

    if UTI_CN_Abrir(SQLTransaction_Alb, SQLConnector_Alb) = False then UTI_GEN_Salir;
    if UTI_CN_Abrir(SQLTransaction_Alb_Detalles, SQLConnector_Alb_Detalles) = False then UTI_GEN_Salir;
    if UTI_CN_Abrir(SQLTransaction_Alb_Detalles_Stock, SQLConnector_Alb_Detalles_Stock) = False then UTI_GEN_Salir;
    if UTI_CN_Abrir(SQLTransaction_Alb_Imptos, SQLConnector_Alb_Imptos) = False then UTI_GEN_Salir;
    if UTI_CN_Abrir(SQLTransaction_Imptos_Totales, SQLConnector_Imptos_Totales) = False then UTI_GEN_Salir;
end;

end.

