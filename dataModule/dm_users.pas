unit dm_users;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, sqldb, mysql56conn, FileUtil, utilidades_bd, utilidades_general;

type

    { TDataModule_Users }

    TDataModule_Users = class(TDataModule)
        SQLConnector_Users: TSQLConnector;
        SQLConnector_Users_Menus_Permisos: TSQLConnector;
        SQLConnector_Users_Passwords: TSQLConnector;
        SQLConnector_Users_Menus: TSQLConnector;
        SQLTransaction_Users: TSQLTransaction;
        SQLTransaction_Users_Menus_Permisos: TSQLTransaction;
        SQLTransaction_Users_Passwords: TSQLTransaction;
        SQLTransaction_Users_Menus: TSQLTransaction;
        procedure DataModuleCreate(Sender: TObject);
    private
        { private declarations }
    public
        { public declarations }
    end;

var
    DataModule_Users: TDataModule_Users;

implementation

{$R *.lfm}

{ TDataModule_Users }

procedure TDataModule_Users.DataModuleCreate(Sender: TObject);
begin
     if UTI_CN_Connector_Open( SQLTransaction_Users, SQLConnector_Users ) = False then UTI_GEN_Salir;
     if UTI_CN_Connector_Open( SQLTransaction_Users_Menus, SQLConnector_Users_Menus ) = False then UTI_GEN_Salir;
     if UTI_CN_Connector_Open( SQLTransaction_Users_Menus_Permisos, SQLConnector_Users_Menus_Permisos ) = False then UTI_GEN_Salir;
     if UTI_CN_Connector_Open( SQLTransaction_Users_Passwords, SQLConnector_Users_Passwords ) = False then UTI_GEN_Salir;
end;

end.

