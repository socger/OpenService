unit dm_articulos_referencias;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, FileUtil, utilidades_bd, utilidades_general;

type

  { TDataModule_Articulos_Referencias }

  TDataModule_Articulos_Referencias = class(TDataModule)
    SQLConnector_Art_Ref_Elegir: TSQLConnector;
    SQLTransaction_Art_Ref_Elegir: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_Articulos_Referencias: TDataModule_Articulos_Referencias;

implementation

{$R *.lfm}

{ TDataModule_Articulos_Referencias }

procedure TDataModule_Articulos_Referencias.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Connector_Open( SQLTransaction_Art_Ref_Elegir, SQLConnector_Art_Ref_Elegir ) = False then UTI_GEN_Salir;
end;

end.

