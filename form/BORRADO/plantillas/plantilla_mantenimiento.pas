unit plantilla_mantenimiento;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ExtCtrls, ComCtrls, DBGrids, DbCtrls, ActnList, StdActns;

type

  { Tform_plantilla_mantenimiento }

  Tform_plantilla_mantenimiento = class(TForm)
    ActionList_Prior: TAction;
    ActionList_First: TAction;
    ActionList_Registros_ir_al: TActionList;
    ControlBar1: TControlBar;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    ImageList_Registros_ir_al: TImageList;
    MainMenu_Plantilla_Mantenimiento: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem26: TMenuItem;
    MenuItem27: TMenuItem;
    MenuItem28: TMenuItem;
    MenuItem29: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem30: TMenuItem;
    MenuItem31: TMenuItem;
    MenuItem32: TMenuItem;
    MenuItem33: TMenuItem;
    MenuItem34: TMenuItem;
    MenuItem35: TMenuItem;
    MenuItem36: TMenuItem;
    MenuItem37: TMenuItem;
    MenuItem38: TMenuItem;
    MenuItem39: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem40: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    Panel_Estilo_Modulo: TPanel;
    Panel_Estilo_Listado: TPanel;
    ToolBar1: TToolBar;
    ToolButton_First: TToolButton;
    ToolButton2: TToolButton;
    ToolButton_Prior: TToolButton;

    procedure ActionList_PriorExecute(Sender: TObject);
    procedure ActionList_PriorUpdate(Sender: TObject);
    procedure ControlBar1Click(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure ActionList_FirstExecute(Sender: TObject);
    procedure ActionList_FirstUpdate(Sender: TObject);


  protected

    procedure Primero;   dynamic;
    procedure Anterior;  dynamic;
    procedure Siguiente; dynamic;
    procedure Ultimo;    dynamic;

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  form_plantilla_mantenimiento: Tform_plantilla_mantenimiento;

implementation

{$R *.lfm}

{ Tform_plantilla_mantenimiento }

procedure Tform_plantilla_mantenimiento.DBNavigator1BeforeAction( Sender: TObject;
                                                                  Button: TDBNavButtonType );
begin
  case Button of
      nbFirst : begin
          Ultimo;

          Abort;
      end;

      nbPrior : begin

          Abort;
      end;

      nbNext : begin

          Abort;
      end;

      nbLast : begin

          Abort;
      end;

      nbInsert : begin
          //Insertar_Registro;
          Abort;
      end;

      nbDelete : begin
          //Borrar_Registro;
          Abort;
      end;

      nbEdit : begin
          //Editar_Registro;
          Abort;
      end;

      nbPost : begin

          Abort;
      end;

      nbCancel : begin

          Abort;
      end;

      nbRefresh : begin
          // Refrescar_Registros;
          Abort;
      end;
  end;
end;

procedure Tform_plantilla_mantenimiento.Primero;
begin
  {
  Tabla.First;
  }
end;

procedure Tform_plantilla_mantenimiento.Anterior;
begin
  {
  Tabla.Prior;
  }
end;

procedure Tform_plantilla_mantenimiento.Siguiente;
begin
  {
  Tabla.Next;
  }
end;

procedure Tform_plantilla_mantenimiento.Ultimo;
begin
  {
  Tabla.Last;
  }
end;

procedure Tform_plantilla_mantenimiento.ActionList_FirstExecute(Sender: TObject);
begin
  Ultimo;
end;

procedure Tform_plantilla_mantenimiento.ActionList_FirstUpdate(Sender: TObject);
begin
  {
  If ( Tabla.Eof = true ) or
     ( PEstado = 1      ) then
       ActionList_First.Enabled := false
  else ActionList_First.Enabled := true;
  }
end;

procedure Tform_plantilla_mantenimiento.ActionList_PriorExecute(Sender: TObject);
begin
  Siguiente;
end;

procedure Tform_plantilla_mantenimiento.ActionList_PriorUpdate(Sender: TObject);
begin
  {
  If ( Tabla.Eof = true ) or
     ( PEstado = 1      ) then
       ActionList_Prior.Enabled := false
  else ActionList_Prior.Enabled := true;
  }
end;

procedure Tform_plantilla_mantenimiento.ControlBar1Click(Sender: TObject);
begin

end;

end.

