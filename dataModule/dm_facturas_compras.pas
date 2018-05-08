unit dm_facturas_compras;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, mysql56conn, FileUtil, utilidades_bd,
  utilidades_general;

type

  { TDataModule_facturas_compras }

  TDataModule_facturas_compras = class(TDataModule)
    SQLConnector_Alb_Pdtes: TSQLConnector;
    SQLConnector_Alb_Pdtes_D: TSQLConnector;
    SQLConnector_Ftra: TSQLConnector;
    SQLConnector_Ftra_Rcbos: TSQLConnector;
    SQLConnector_List_Ftras: TSQLConnector;
    SQLConnector_Ftra_Borradas: TSQLConnector;
    SQLConnector_Ftra_Detalles: TSQLConnector;
    SQLConnector_Ftra_Imptos: TSQLConnector;
    SQLConnector_Imptos_Totales: TSQLConnector;
    SQLTransaction_Alb_Pdtes: TSQLTransaction;
    SQLTransaction_Alb_Pdtes_D: TSQLTransaction;
    SQLTransaction_Ftra: TSQLTransaction;
    SQLTransaction_Ftra_Rcbos: TSQLTransaction;
    SQLTransaction_List_Ftras: TSQLTransaction;
    SQLTransaction_Ftra_Borradas: TSQLTransaction;
    SQLTransaction_Ftra_Detalles: TSQLTransaction;
    SQLTransaction_Ftra_Imptos: TSQLTransaction;
    SQLTransaction_Imptos_Totales: TSQLTransaction;

    procedure DataModuleCreate(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_facturas_compras: TDataModule_facturas_compras;

implementation

{$R *.lfm}

{ TDataModule_facturas_compras }

procedure TDataModule_facturas_compras.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Connector_Open( SQLTransaction_List_Ftras, SQLConnector_List_Ftras ) = False then UTI_GEN_Salir;

    if UTI_CN_Connector_Open( SQLTransaction_Ftra, SQLConnector_Ftra ) = False then UTI_GEN_Salir;
    if UTI_CN_Connector_Open( SQLTransaction_Ftra_Detalles, SQLConnector_Ftra_Detalles ) = False then UTI_GEN_Salir;

    if UTI_CN_Connector_Open( SQLTransaction_Ftra_Rcbos, SQLConnector_Ftra_Rcbos ) = False then UTI_GEN_Salir;

    if UTI_CN_Connector_Open( SQLTransaction_Ftra_Borradas, SQLConnector_Ftra_Borradas ) = False then UTI_GEN_Salir;

    if UTI_CN_Connector_Open( SQLTransaction_Ftra_Imptos, SQLConnector_Ftra_Imptos ) = False then UTI_GEN_Salir;
    if UTI_CN_Connector_Open( SQLTransaction_Imptos_Totales, SQLConnector_Imptos_Totales ) = False then UTI_GEN_Salir;

    if UTI_CN_Connector_Open( SQLTransaction_Alb_Pdtes, SQLConnector_Alb_Pdtes ) = False then UTI_GEN_Salir;
    if UTI_CN_Connector_Open( SQLTransaction_Alb_Pdtes_D, SQLConnector_Alb_Pdtes_D ) = False then UTI_GEN_Salir;
end;

end.

