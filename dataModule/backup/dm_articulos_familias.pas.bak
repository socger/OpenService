unit dm_articulos_familias;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, sqldb, mysql56conn, FileUtil, utilidades_bd,
    utilidades_general;

type

    { TDataModule_Articulos_Familias }

    TDataModule_Articulos_Familias = class(TDataModule)
        SQLConnector_ArtFam: TSQLConnector;
        SQLConnector_ArtFamSubFamilias: TSQLConnector;
        SQLConnector_ArtFamTerminales: TSQLConnector;
        SQLConnector_ArtFamTarifas: TSQLConnector;
        SQLTransaction_ArtFam: TSQLTransaction;
        SQLTransaction_ArtFamSubFamilias: TSQLTransaction;
        SQLTransaction_ArtFamTerminales: TSQLTransaction;
        SQLTransaction_ArtFamTarifas: TSQLTransaction;
        procedure DataModuleCreate(Sender: TObject);
    private
        { private declarations }
    public
        { public declarations }
    end;

var
    DataModule_Articulos_Familias: TDataModule_Articulos_Familias;

implementation

{$R *.lfm}

{ TDataModule_Articulos_Familias }

procedure TDataModule_Articulos_Familias.DataModuleCreate(Sender: TObject);
begin
  if UTI_CN_Abrir(SQLTransaction_ArtFam, SQLConnector_ArtFam) = False then UTI_GEN_Salir;
  if UTI_CN_Abrir(SQLTransaction_ArtFamSubFamilias, SQLConnector_ArtFamSubFamilias) = False then UTI_GEN_Salir;
  if UTI_CN_Abrir(SQLTransaction_ArtFamTerminales, SQLConnector_ArtFamTerminales) = False then UTI_GEN_Salir;
  if UTI_CN_Abrir(SQLTransaction_ArtFamTarifas, SQLConnector_ArtFamTarifas) = False then UTI_GEN_Salir;
end;

end.

