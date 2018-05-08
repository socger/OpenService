unit dm_conceptos_almacen_traspaso;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, FileUtil, utilidades_bd, utilidades_general;

type

  { TDataModule_Conceptos_Almacen_Traspaso }

  TDataModule_Conceptos_Almacen_Traspaso = class(TDataModule)
    SQLConnector: TSQLConnector;
    SQLTransaction: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_Conceptos_Almacen_Traspaso: TDataModule_Conceptos_Almacen_Traspaso;

implementation

{$R *.lfm}

{ TDataModule_Conceptos_Almacen_Traspaso }

procedure TDataModule_Conceptos_Almacen_Traspaso.DataModuleCreate(Sender: TObject);
begin
    if UTI_CN_Connector_Open( SQLTransaction, SQLConnector ) = False then UTI_GEN_Salir;
end;

end.

