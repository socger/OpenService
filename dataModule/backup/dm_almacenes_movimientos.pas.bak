unit dm_almacenes_movimientos;

{$mode objfpc}{$H+}

interface

uses
  utilidades_general, utilidades_bd, Classes, SysUtils, sqldb, mysql56conn,
  mysql50conn, FileUtil;

type

  { TDataModule_Almacenes_Movimientos }

  TDataModule_Almacenes_Movimientos = class(TDataModule)
    SQLConnector_AM: TSQLConnector;
    SQLConnector_AMD: TSQLConnector;
    SQLTransaction_AM: TSQLTransaction;
    SQLTransaction_AMD: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_Almacenes_Movimientos: TDataModule_Almacenes_Movimientos;

implementation

{$R *.lfm}

{ TDataModule_Almacenes_Movimientos }

procedure TDataModule_Almacenes_Movimientos.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Abrir(SQLTransaction_AM, SQLConnector_AM) = False then UTI_GEN_Salir;
    if UTI_CN_Abrir(SQLTransaction_AMD, SQLConnector_AMD) = False then UTI_GEN_Salir;
end;

end.

