unit dm_pelis;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, sqlite3conn, pqconnection, oracleconnection, db,
  IBConnection, mssqlconn, mysql55conn, mysql40conn, mysql56conn, utilidades_bd,
  utilidades_general;

type

  { TDataModule_Pelis }

  TDataModule_Pelis = class(TDataModule)
    SQLConnector: TSQLConnector;
    SQLTransaction: TSQLTransaction;

    procedure DataModuleCreate(Sender: TObject);
    procedure GetLogEvent( Sender: TSQLConnection; EventType: TDBEventType; const Msg: String );

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule_Pelis: TDataModule_Pelis;

implementation

{$R *.lfm}

{ TDataModule_Pelis }

procedure TDataModule_Pelis.GetLogEvent( Sender : TSQLConnection;
                                         EventType : TDBEventType;
                                         const Msg : String );
  // The procedure is called by TSQLConnection and saves the received log messages
  // in the FConnectionLog stringlist
var var_msg    : TStrings;
    var_Source : string;
begin
    // Nicely right aligned...
    case EventType of
        detCustom:   var_Source := 'Custom:  ';
        detPrepare:  var_Source := 'Prepare: ';
        detExecute:  var_Source := 'Execute: ';
        detFetch:    var_Source := 'Fetch:   ';
        detCommit:   var_Source := 'Commit:  ';
        detRollBack: var_Source := 'Rollback:';
        else var_Source := 'Unknown event. Please fix program code.';
    end;

    // FConnectionLog.Add(var_Source + ' ' + Msg);
    var_msg := TStringList.Create;
        var_msg.Clear;
        var_msg.Add(var_Source + ' ' + Msg);
        UTI_GEN_Aviso(true, var_msg, 'LOG', True, False);
    var_msg.Free;
end;

procedure TDataModule_Pelis.DataModuleCreate(Sender: TObject);
begin
     if UTI_CN_Abrir(SQLTransaction, SQLConnector) = False then UTI_GEN_Salir;
end;

end.

