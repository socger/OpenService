unit dm_formas_pago;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, sqldb, FileUtil, utilidades_bd, utilidades_general;

type

    { TDataModule_Formas_Pago }

    TDataModule_Formas_Pago = class(TDataModule)
        SQLConnector: TSQLConnector;
        SQLTransaction: TSQLTransaction;
        procedure DataModuleCreate(Sender: TObject);
    private
        { private declarations }
    public
        { public declarations }
    end;

var
    DataModule_Formas_Pago: TDataModule_Formas_Pago;

implementation

{$R *.lfm}

{ TDataModule_Formas_Pago }

procedure TDataModule_Formas_Pago.DataModuleCreate(Sender: TObject);
begin
     if UTI_CN_Connector_Open( SQLTransaction, SQLConnector ) = False then UTI_GEN_Salir;
end;

end.

