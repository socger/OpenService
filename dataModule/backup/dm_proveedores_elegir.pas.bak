unit dm_proveedores_elegir;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, mysql56conn, FileUtil, utilidades_bd, utilidades_general;

type

  { TDataModule_Proveedores_Elegir }

  TDataModule_Proveedores_Elegir = class(TDataModule)
    SQLConnector_Pr_Elegir: TSQLConnector;
    SQLTransaction_Pr_Elegir: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_Proveedores_Elegir: TDataModule_Proveedores_Elegir;

implementation

{$R *.lfm}

{ TDataModule_Proveedores_Elegir }

procedure TDataModule_Proveedores_Elegir.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Abrir(SQLTransaction_Pr_Elegir, SQLConnector_Pr_Elegir) = False then UTI_GEN_Salir;
end;

end.

