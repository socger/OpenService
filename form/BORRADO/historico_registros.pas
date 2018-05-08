unit historico_registros;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids, DbCtrls;

type

    { Tform_historico_registros }

    Tform_historico_registros = class(TForm)
        DataSource_user_row_changes: TDataSource;
        DBGrid_Principal: TDBGrid;
        DBNavigator1: TDBNavigator;
        SQLQuery_user_row_changes: TSQLQuery;
    private
        { private declarations }
    public
        { public declarations }
    end;

var
    form_historico_registros: Tform_historico_registros;

implementation

{$R *.lfm}

end.

