unit dm_bancos_empresas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, mysql56conn, mysql50conn, FileUtil,
  utilidades_general, utilidades_bd;

type

  { TDataModule_Bancos_Empresas }

  TDataModule_Bancos_Empresas = class(TDataModule)
    SQLConnector: TSQLConnector;
    SQLTransaction: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_Bancos_Empresas: TDataModule_Bancos_Empresas;

implementation

{$R *.lfm}

{ TDataModule_Bancos_Empresas }

procedure TDataModule_Bancos_Empresas.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Abrir(SQLTransaction, SQLConnector) = False then UTI_GEN_Salir;
end;

end.

