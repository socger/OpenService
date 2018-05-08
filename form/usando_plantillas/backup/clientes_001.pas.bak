unit clientes_001;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DBDateTimePicker, Forms, Controls, Graphics, Dialogs, StdCtrls, db,
  ExtCtrls, DbCtrls, Buttons, plantilla_detalle_000, utilidades_general, utilidades_forms_Filtrar;

resourcestring
  rs_clientes_001_001 = '* El nombre del contacto.';

type

  { Tf_clientes_001 }

  Tf_clientes_001 = class(Tform_plantilla_detalle_000)
    BitBtn_Copiar_Datos_Cliente: TBitBtn;
    BitBtn_eMAIL: TBitBtn;
    BitBtn_SMS1: TBitBtn;
    BitBtn_visitar_Situl: TBitBtn;
    DBDateTimePicker_FechaNacimiento: TDBDateTimePicker;
    DBEdit_a_quien_facturamos: TDBEdit;
    DBEdit_eMail1: TDBEdit;
    DBEdit_FAX1: TDBEdit;
    DBEdit_Movil1: TDBEdit;
    DBEdit_NIF_CIF2: TDBEdit;
    DBEdit_Nombre_Contacto: TDBEdit;
    DBEdit_NIF_CIF: TDBEdit;
    DBEdit_Nombre_Comercial: TDBEdit;
    DBEdit_Nombre_Contacto1: TDBEdit;
    DBEdit_Pagina_Web1: TDBEdit;
    DBEdit_Tfno_Fijo_3: TDBEdit;
    DBEdit_Tfno_Fijo_4: TDBEdit;
    GroupBox2: TGroupBox;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Label11: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label_Fecha1: TLabel;

    procedure BitBtn_Copiar_Datos_ClienteClick(Sender: TObject);
    procedure BitBtn_eMAILClick(Sender: TObject);
    procedure BitBtn_SMS1Click(Sender: TObject);
    procedure BitBtn_visitar_SitulClick(Sender: TObject);

    procedure Campo_Foco_en_modo_Edicion_Inserccion; override;
    procedure NewRecord_Insert; override;
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
    { private declarations }

  public
    { public declarations }
    public_Record_Rgtro  : TRecord_Rgtro_Comun;

  end;

var
  f_clientes_001: Tf_clientes_001;

implementation

{$R *.lfm}

uses menu, clientes_000;

{ Tf_clientes_001 }

procedure Tf_clientes_001.BitBtn_eMAILClick(Sender: TObject);
begin
  UTI_GEN_Enviar_eMAIL;
end;

procedure Tf_clientes_001.BitBtn_Copiar_Datos_ClienteClick(Sender: TObject);
begin
  with f_clientes_000.SQLQuery_Principal do
  begin
      f_clientes_000.SQLQuery_Clientes_Contactos.FieldByName('nombre').AsString :=
          FieldByName('nombre_propietario').AsString;

      f_clientes_000.SQLQuery_Clientes_Contactos.FieldByName('nif_cif').AsString :=
          FieldByName('nif_cif').AsString;

      f_clientes_000.SQLQuery_Clientes_Contactos.FieldByName('Fecha_Nacimiento').AsString :=
          FieldByName('Fecha_Nacimiento').AsString;

      f_clientes_000.SQLQuery_Clientes_Contactos.FieldByName('eMail').AsString :=
          FieldByName('eMail').AsString;

      f_clientes_000.SQLQuery_Clientes_Contactos.FieldByName('pagina_web').AsString :=
          FieldByName('pagina_web').AsString;

      f_clientes_000.SQLQuery_Clientes_Contactos.FieldByName('Tfno_Fijo_1').AsString :=
          FieldByName('Tfno_Fijo_1').AsString;

      f_clientes_000.SQLQuery_Clientes_Contactos.FieldByName('Tfno_Fijo_2').AsString :=
          FieldByName('Tfno_Fijo_2').AsString;

      f_clientes_000.SQLQuery_Clientes_Contactos.FieldByName('FAX').AsString :=
          FieldByName('FAX').AsString;

      f_clientes_000.SQLQuery_Clientes_Contactos.FieldByName('Movil').AsString :=
          FieldByName('Movil').AsString;
  end;
end;

procedure Tf_clientes_001.BitBtn_SMS1Click(Sender: TObject);
begin
  UTI_GEN_Enviar_SMS;
end;

procedure Tf_clientes_001.BitBtn_visitar_SitulClick(Sender: TObject);
begin
  UTI_GEN_Visitar_Situl;
end;

procedure Tf_clientes_001.Campo_Foco_en_modo_Edicion_Inserccion;
begin
  Self.ActiveControl := DBEdit_Nombre_Contacto;
end;

procedure Tf_clientes_001.NewRecord_Insert;
begin
  if f_clientes_000.SQLQuery_Clientes_Contactos.State = dsInsert then
  begin

    with f_clientes_000.SQLQuery_Clientes_Contactos do
    begin
      // ******************************************************************************************* //
      // ** Asignamos valores de inicio si no los tenían                                          ** //
      // ******************************************************************************************* //
      // FieldByName('numero_siguiente').AsString := '1';

    end;

  end;
end;

procedure Tf_clientes_001.Antes_del_Post_NO_Principal_Sin_Rellenar_Permitido_SI(p_msg : TStrings);
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

procedure Tf_clientes_001.Antes_del_Post_NO_Principal_Sin_Rellenar_Permitido_NO( p_msg,
                                                                                 p_msg_Comprobar : TStrings );
begin
  with f_clientes_000.SQLQuery_Clientes_Contactos do
  begin
    if Trim(FieldByName('nombre').AsString) = '' then
    begin
      p_msg.Add(rs_clientes_001_001);
    end;

  end;

end;

procedure Tf_clientes_001.Antes_del_Post_NO_Principal_Asignar_Valores;
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

procedure Tf_clientes_001.Cambiar_WindowState;
begin
  Self.WindowState := wsNormal; // Puede ser wsNormal, wsFullScreen, wsMaximized o wsMinimized
end;

procedure Tf_clientes_001.Cambiar_Titulo_Form;
begin
  Self.Caption := 'Ficha - Contacto de un cliente';
end;

function Tf_clientes_001.Devolver_public_Elegimos : Boolean;
begin
  Result := f_clientes_000.public_Elegimos;
end;

function Tf_clientes_001.Devolver_public_Solo_Ver : Boolean;
begin
  Result := f_clientes_000.public_Solo_Ver;
end;

procedure Tf_clientes_001.para_Empezar_GroupBox_Registro;
begin
  with f_clientes_000.SQLQuery_Clientes_Contactos do
  begin
    public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                       '',
                                                       '',
                                                       FieldByName('nombre').AsString,
                                                       '',
                                                       '' );
  end;

  Presentar_Datos_GroupBox_Registro;
  Presentar_Datos_GroupBox_Registro_Principal;
end;

procedure Tf_clientes_001.Presentar_Datos_GroupBox_Registro;
begin
  with f_clientes_000.SQLQuery_Clientes_Contactos do
  begin
    if RecordCount > 0 then
    begin
      // Edit_Descripcion_Articulo.Text := FieldByName('OT_descripcion_articulo').AsString;
    end;
  end;
end;

procedure Tf_clientes_001.Presentar_Datos_GroupBox_Registro_Principal;
begin
  with f_clientes_000.SQLQuery_Principal do
  begin
    // Edit_Descripcion_Almacen_Destino.Text := FieldByName('OT_descripcion_almacen_destino').AsString;
  end;
end;

end.


