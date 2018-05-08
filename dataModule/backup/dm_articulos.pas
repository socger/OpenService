unit dm_articulos;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, sqldb, mysql56conn, FileUtil, utilidades_bd, utilidades_general;

type

    { TDataModule_Articulos }

    TDataModule_Articulos = class(TDataModule)
      SQLConnector_Ftra_Compras_Detalles: TSQLConnector;
      SQLConnector_Alb_Ventas_Detalles: TSQLConnector;
        SQLConnector_Art: TSQLConnector;
        SQLConnector_ArtPropTa: TSQLConnector;
        SQLConnector_Alb_Compras_Detalles: TSQLConnector;
        SQLConnector_ArtStock: TSQLConnector;
        SQLConnector_ArtRef: TSQLConnector;
        SQLConnector_ArtTerminales: TSQLConnector;
        SQLConnector_ArtTarifas: TSQLConnector;
        SQLConnector_ArtComp: TSQLConnector;
        SQLConnector_ArtProp: TSQLConnector;
        SQLConnector_Ftra_Ventas_Detalles: TSQLConnector;
        SQLConnector_Tarifas_Margenes: TSQLConnector;
        SQLTransaction_Ftra_Compras_Detalles: TSQLTransaction;
        SQLTransaction_Alb_Ventas_Detalles: TSQLTransaction;
        SQLTransaction_Art: TSQLTransaction;
        SQLTransaction_ArtPropTa: TSQLTransaction;
        SQLTransaction_Alb_Compras_Detalles: TSQLTransaction;
        SQLTransaction_ArtStock: TSQLTransaction;
        SQLTransaction_ArtRef: TSQLTransaction;
        SQLTransaction_ArtTerminales: TSQLTransaction;
        SQLTransaction_ArtTarifas: TSQLTransaction;
        SQLTransaction_ArtComp: TSQLTransaction;
        SQLTransaction_ArtProp: TSQLTransaction;
        SQLTransaction_Ftra_Ventas_Detalles: TSQLTransaction;
        SQLTransaction_Tarifas_Margenes: TSQLTransaction;
        procedure DataModuleCreate(Sender: TObject);
    private
        { private declarations }
    public
        { public declarations }
    end;

var
    DataModule_Articulos: TDataModule_Articulos;

implementation

{$R *.lfm}

{ TDataModule_Articulos }

procedure TDataModule_Articulos.DataModuleCreate(Sender: TObject);
begin
     if UTI_CN_Abrir(SQLTransaction_Art, SQLConnector_Art) = False then UTI_GEN_Salir;
     if UTI_CN_Abrir(SQLTransaction_ArtRef, SQLConnector_ArtRef) = False then UTI_GEN_Salir;
     if UTI_CN_Abrir(SQLTransaction_ArtTarifas, SQLConnector_ArtTarifas) = False then UTI_GEN_Salir;
     if UTI_CN_Abrir(SQLTransaction_ArtTerminales, SQLConnector_ArtTerminales) = False then UTI_GEN_Salir;
     if UTI_CN_Abrir(SQLTransaction_ArtComp, SQLConnector_ArtComp) = False then UTI_GEN_Salir;
     if UTI_CN_Abrir(SQLTransaction_ArtProp, SQLConnector_ArtProp) = False then UTI_GEN_Salir;
     if UTI_CN_Abrir(SQLTransaction_ArtPropTa, SQLConnector_ArtPropTa) = False then UTI_GEN_Salir;
     if UTI_CN_Abrir(SQLTransaction_ArtStock, SQLConnector_ArtStock) = False then UTI_GEN_Salir;
     if UTI_CN_Abrir(SQLTransaction_Alb_Compras_Detalles, SQLConnector_Alb_Compras_Detalles) = False then UTI_GEN_Salir;
     if UTI_CN_Abrir(SQLTransaction_Alb_Ventas_Detalles, SQLConnector_Alb_Ventas_Detalles) = False then UTI_GEN_Salir;
     if UTI_CN_Abrir(SQLTransaction_Ftra_Compras_Detalles, SQLConnector_Ftra_Compras_Detalles) = False then UTI_GEN_Salir;
     if UTI_CN_Abrir(SQLTransaction_Ftra_Ventas_Detalles, SQLConnector_Ftra_Ventas_Detalles) = False then UTI_GEN_Salir;
     if UTI_CN_Abrir(SQLTransaction_Tarifas_Margenes, SQLConnector_Tarifas_Margenes) = False then UTI_GEN_Salir;
end;

end.

