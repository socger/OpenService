unit dm_cuentas_pagos_cobros;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, FileUtil, utilidades_bd, utilidades_general;

type

  { TDataModule_Cuentas_Pagos_Cobros }

  TDataModule_Cuentas_Pagos_Cobros = class(TDataModule)
    SQLConnector: TSQLConnector;
    SQLTransaction: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_Cuentas_Pagos_Cobros: TDataModule_Cuentas_Pagos_Cobros;

implementation

{$R *.lfm}

{ TDataModule_Cuentas_Pagos_Cobros }

procedure TDataModule_Cuentas_Pagos_Cobros.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Abrir(SQLTransaction, SQLConnector) = False then UTI_GEN_Salir;
end;

end.

