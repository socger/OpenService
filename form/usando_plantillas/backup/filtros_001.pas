unit filtros_001;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DBDateTimePicker, Forms, Controls, Graphics, Dialogs, StdCtrls, db, ExtCtrls, DbCtrls, Buttons,
  ButtonPanel, plantilla_detalle_000, utilidades_general, utilidades_forms_Filtrar, utilidades_usuarios;

resourcestring
  rs_filtros_001_001 = '* El módulo (id_menus) al que pertenece.';
  rs_filtros_001_002 = '* La descripción del campo del filtro.';
  rs_filtros_001_003 = '* El campo físico de la tabla por el que filtraremos.';
  rs_filtros_001_004 = 'Ficha - Filtro para módulo ';

type

  { Tf_filtros_001 }

  Tf_filtros_001 = class(Tform_plantilla_detalle_000)
    DBEdit_a_quien_facturamos: TDBEdit;
    DBEdit_Nombre_Contacto: TDBEdit;
    Label1: TLabel;
    Label4: TLabel;


    procedure Campo_Foco_en_modo_Edicion_Inserccion; override;
    procedure NewRecord_Insert_SQLQuery_Principal; override;
    procedure Antes_del_Post_NO_Principal_Sin_Rellenar_Permitido_SI( p_msg : TStrings ); override;
    procedure Antes_del_Post_NO_Principal_Sin_Rellenar_Permitido_NO( p_msg, p_msg_Comprobar : TStrings ); override;
    procedure Antes_del_Post_NO_Principal_Asignar_Valores; virtual;
    procedure Cambiar_WindowState; override;
    procedure Cambiar_Titulo_Form; override;
    function  Devolver_public_Elegimos : Boolean; override;
    function  Devolver_public_Solo_Ver : Boolean; override;
    procedure para_Empezar_GroupBox_Registro; override;
    procedure Presentar_Datos_GroupBox_Registro; override;
    procedure Presentar_Datos_GroupBox_Registro_Principal; override;

  private

  public
    public_Record_Rgtro  : TRecord_Rgtro_Comun;
    public_Menu_Worked                : Integer;
  end;

var
  f_filtros_001: Tf_filtros_001;

implementation

{$R *.lfm}

// uses menu;

{ Tf_filtros_001 }

procedure Tf_filtros_001.Campo_Foco_en_modo_Edicion_Inserccion;
begin
  Self.ActiveControl := DBEdit_Nombre_Contacto;
end;

procedure Tf_filtros_001.NewRecord_Insert_SQLQuery_Principal;
begin
  if form_plantilla_000.SQLQuery_Filtros.State = dsInsert then
  begin
    with form_plantilla_000.SQLQuery_Filtros do
    begin
      // ******************************************************************************************* //
      // ** Asignamos valores de inicio si no los tenían                                          ** //
      // ******************************************************************************************* //
      FieldByName('id_menus').AsString := IntToStr(form_plantilla_000.public_Menu_Worked);
    end;
  end;

end;

procedure Tf_filtros_001.Antes_del_Post_NO_Principal_Sin_Rellenar_Permitido_SI(p_msg : TStrings);
begin
  { Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo

  // *********************************************************************************************** //
  // ** Ahora vienen las comprobaciones de porque no grabamos                                     ** //
  // *********************************************************************************************** //
  with SQLQuery_Tabla_no_Principal do
  begin
    if Trim(DBEdit_Descripcion.Text) <> '' then
      FieldByName('descripcion').asString := AnsiUpperCase(Trim(FieldByName('descripcion').AsString))
    else
    begin
      p_msg.Add( rs_bcta_006 );
    end;

    if Trim(FieldByName('id_empresas').AsString) = '' then
    begin
      p_msg.Add( rs_bcta_007 );
    end;
  end;
}
end;

procedure Tf_filtros_001.Antes_del_Post_NO_Principal_Sin_Rellenar_Permitido_NO( p_msg,
                                                                                p_msg_Comprobar : TStrings );
begin
  with form_plantilla_000.SQLQuery_Filtros do
  begin
    if Trim(FieldByName('id_menus').AsString) = '' then
      p_msg.Add(rs_filtros_001_001);

    if Trim(FieldByName('Descripcion').AsString) = '' then
      p_msg.Add(rs_filtros_001_002);

    if Trim(FieldByName('nombre_campo').AsString) = '' then
      p_msg.Add(rs_filtros_001_003);
  end;

end;

procedure Tf_filtros_001.Antes_del_Post_NO_Principal_Asignar_Valores;
begin
  { Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo

  // *********************************************************************************************** //
  // ** Asignamos valores si no los tenían                                                        ** //
  // *********************************************************************************************** //
  with SQLQuery_Tabla_no_Principal do
  begin

    if FieldByName('').IsNull then
    begin
      FieldByName('Nombre_Campo').Value := Valor_Campo;
    end;

  end;
}
end;

procedure Tf_filtros_001.Cambiar_WindowState;
begin
  Self.WindowState := wsNormal; // Puede ser wsNormal, wsFullScreen, wsMaximized o wsMinimized
end;

procedure Tf_filtros_001.Cambiar_Titulo_Form;
begin
  Showmessage(IntToStr(form_plantilla_000.public_Menu_Worked));

  Self.Caption := rs_filtros_001_004 +
                  UTI_USR_Permiso_SN_TraerNombreModulo(form_plantilla_000.public_Menu_Worked);
end;

function Tf_filtros_001.Devolver_public_Elegimos : Boolean;
begin
  Result := form_plantilla_000.public_Elegimos;
end;

function Tf_filtros_001.Devolver_public_Solo_Ver : Boolean;
begin
  Result := form_plantilla_000.public_Solo_Ver;
end;

procedure Tf_filtros_001.para_Empezar_GroupBox_Registro;
begin
  with form_plantilla_000.SQLQuery_Filtros do
  begin
    public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                       'id_menus',
                                                       'Id_Users',
                                                       FieldByName('Descripcion').AsString,
                                                       'nombre_campo',
                                                       '' );
  end;

  Presentar_Datos_GroupBox_Registro;
  Presentar_Datos_GroupBox_Registro_Principal;
end;

procedure Tf_filtros_001.Presentar_Datos_GroupBox_Registro;
begin
  with form_plantilla_000.SQLQuery_Filtros do
  begin
    if RecordCount > 0 then
    begin
      // Edit_Descripcion_Articulo.Text := FieldByName('OT_descripcion_articulo').AsString;
    end;
  end;
end;

procedure Tf_filtros_001.Presentar_Datos_GroupBox_Registro_Principal;
begin
  with form_plantilla_000.SQLQuery_Filtros do
  begin
    // Edit_Descripcion_Almacen_Destino.Text := FieldByName('OT_descripcion_almacen_destino').AsString;
  end;
end;

end.

