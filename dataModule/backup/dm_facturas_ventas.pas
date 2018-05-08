unit dm_facturas_ventas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, mysql56conn, FileUtil, utilidades_bd,
  utilidades_general;

type

  { TDataModule_facturas_ventas }

  TDataModule_facturas_ventas = class(TDataModule)
    SQLConnector_Alb_Pdtes: TSQLConnector;
    SQLConnector_Alb_Pdtes_D: TSQLConnector;
    SQLConnector_Ftra_Borradas: TSQLConnector;
    SQLConnector_Ftra_Rcbos: TSQLConnector;
    SQLConnector_Ftra_Imptos: TSQLConnector;
    SQLConnector_Ftra_Detalles_Stock: TSQLConnector;
    SQLConnector_Ftra: TSQLConnector;
    SQLConnector_Ftra_Detalles: TSQLConnector;
    SQLConnector_Imptos_Totales: TSQLConnector;
    SQLConnector_List_Ftras: TSQLConnector;
    SQLTransaction_Alb_Pdtes: TSQLTransaction;
    SQLTransaction_Alb_Pdtes_D: TSQLTransaction;
    SQLTransaction_Ftra_Borradas: TSQLTransaction;
    SQLTransaction_Ftra_Rcbos: TSQLTransaction;
    SQLTransaction_Ftra_Imptos: TSQLTransaction;
    SQLTransaction_Ftra_Detalles_Stock: TSQLTransaction;
    SQLTransaction_Ftra: TSQLTransaction;
    SQLTransaction_Ftra_Detalles: TSQLTransaction;
    SQLTransaction_Imptos_Totales: TSQLTransaction;
    SQLTransaction_List_Ftras: TSQLTransaction;

    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_facturas_ventas: TDataModule_facturas_ventas;

implementation

{$R *.lfm}

{ TDataModule_facturas_ventas }

procedure TDataModule_facturas_ventas.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Connector_Open( SQLTransaction_List_Ftras, SQLConnector_List_Ftras ) = False then UTI_GEN_Salir;

    if UTI_CN_Abrir(SQLTransaction_Ftra, SQLConnector_Ftra ) = False then UTI_GEN_Salir;
    if UTI_CN_Abrir(SQLTransaction_Ftra_Detalles, SQLConnector_Ftra_Detalles ) = False then UTI_GEN_Salir;
    if UTI_CN_Abrir(SQLTransaction_Ftra_Detalles_Stock, SQLConnector_Ftra_Detalles_Stock ) = False then UTI_GEN_Salir;

    if UTI_CN_Abrir(SQLTransaction_Ftra_Rcbos, SQLConnector_Ftra_Rcbos ) = False then UTI_GEN_Salir;

    if UTI_CN_Abrir(SQLTransaction_Ftra_Borradas, SQLConnector_Ftra_Borradas ) = False then UTI_GEN_Salir;

    if UTI_CN_Abrir(SQLTransaction_Ftra_Imptos, SQLConnector_Ftra_Imptos ) = False then UTI_GEN_Salir;
    if UTI_CN_Abrir(SQLTransaction_Imptos_Totales, SQLConnector_Imptos_Totales ) = False then UTI_GEN_Salir;

    if UTI_CN_Abrir(SQLTransaction_Alb_Pdtes, SQLConnector_Alb_Pdtes ) = False then UTI_GEN_Salir;
    if UTI_CN_Abrir(SQLTransaction_Alb_Pdtes_D, SQLConnector_Alb_Pdtes_D ) = False then UTI_GEN_Salir;
end;

end.

