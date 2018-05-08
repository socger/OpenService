unit plantilla_detalle_000;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, ButtonPanel,
  DbCtrls, ComCtrls, utilidades_general, utilidades_usuarios;

type

  { Tform_plantilla_detalle_000 }

  Tform_plantilla_detalle_000 = class(TForm)
    ButtonPanel1: TButtonPanel;
    DBEdit_Id: TDBEdit;
    GroupBox_Registro: TGroupBox;
    GroupBox_Registro_Principal: TGroupBox;
    Label62: TLabel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel13: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel3: TPanel;
    Shape1: TShape;

    procedure FormShow(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure no_Tocar;
    procedure Cambiar_Estilo_Form;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);

    procedure Campo_Foco_en_modo_Edicion_Inserccion; virtual;
    procedure NewRecord_Insert_SQLQuery_Principal; virtual;
    procedure Antes_del_Post_NO_Principal_Sin_Rellenar_Permitido_SI( p_msg : TStrings ); virtual;
    procedure Antes_del_Post_NO_Principal_Sin_Rellenar_Permitido_NO( p_msg, p_msg_Comprobar : TStrings ); virtual;
    procedure Antes_del_Post_NO_Principal_Asignar_Valores; virtual;
    procedure Cambiar_WindowState; virtual;
    procedure Cambiar_Titulo_Form; virtual;
    function  Devolver_public_Elegimos : Boolean; virtual;
    function  Devolver_public_Solo_Ver : Boolean; virtual;
    procedure para_Empezar_GroupBox_Registro; virtual;
    procedure Presentar_Datos_GroupBox_Registro; virtual;
    procedure Presentar_Datos_GroupBox_Registro_Principal; virtual;

  private
    { private declarations }
    private_Salir_OK : Boolean;

  public
    { public declarations }
    public_Pulso_Aceptar : Boolean;

  end;

var
  form_plantilla_detalle_000: Tform_plantilla_detalle_000;

implementation

{$R *.lfm}

uses menu;

{ Tform_plantilla_detalle_000 }

procedure Tform_plantilla_detalle_000.Cambiar_Estilo_Form;
begin
  with Self do
  begin
    Color       := $00C2C29E;
    Position    := poScreenCenter;
    BorderIcons := [];
    BorderStyle := bsSingle;
  end;

  Cambiar_WindowState;
end;

procedure Tform_plantilla_detalle_000.FormActivate(Sender: TObject);
begin
  Cambiar_Estilo_Form;

  if Devolver_public_Elegimos = true then
  begin
    with Self do
    begin
      Color := $00B9959C;
    end;
  end;

  if Devolver_public_Solo_Ver = true then
  begin
    no_Tocar;
  end;
end;

procedure Tform_plantilla_detalle_000.no_Tocar;
begin
  GroupBox_Registro.Enabled := False;
end;

procedure Tform_plantilla_detalle_000.OKButtonClick(Sender: TObject);
begin
  private_Salir_OK     := true;
  public_Pulso_Aceptar := true;
end;

procedure Tform_plantilla_detalle_000.FormShow(Sender: TObject);
begin
  Campo_Foco_en_modo_Edicion_Inserccion;
end;

procedure Tform_plantilla_detalle_000.Campo_Foco_en_modo_Edicion_Inserccion;
begin
  Self.ActiveControl := GroupBox_Registro;
end;

procedure Tform_plantilla_detalle_000.CancelButtonClick(Sender: TObject);
begin
  private_Salir_OK     := true;
  public_Pulso_Aceptar := false;
end;

procedure Tform_plantilla_detalle_000.Presentar_Datos_GroupBox_Registro;
begin
  { Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo

  with f_almacenes_movimientos_000.SQLQuery_AMD do
  begin
    if RecordCount > 0 then
    begin
      Edit_Descripcion_Articulo.Text        := FieldByName('OT_descripcion_articulo').AsString;

      Edit_Descripcion_Almacen_Destino.Text := f_almacenes_movimientos_001.Edit_Descripcion_Almacen_Destino.Text;
      Edit_Descripcion_Almacen_Origen.Text  := f_almacenes_movimientos_001.Edit_Descripcion_Almacen_Origen.Text;
      Edit_Descripcion_Concepto.Text        := f_almacenes_movimientos_001.Edit_Descripcion_Concepto.Text;
    end;
  end;
  }
end;

procedure Tform_plantilla_detalle_000.Presentar_Datos_GroupBox_Registro_Principal;
begin
  { Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo

  with f_almacenes_movimientos_000.SQLQuery_AMD do
  begin
    Edit_Descripcion_Articulo.Text        := FieldByName('OT_descripcion_articulo').AsString;
    Edit_Descripcion_Almacen_Destino.Text := f_almacenes_movimientos_001.Edit_Descripcion_Almacen_Destino.Text;
    Edit_Descripcion_Almacen_Origen.Text  := f_almacenes_movimientos_001.Edit_Descripcion_Almacen_Origen.Text;
    Edit_Descripcion_Concepto.Text        := f_almacenes_movimientos_001.Edit_Descripcion_Concepto.Text;
  end;
  }
end;

procedure Tform_plantilla_detalle_000.para_Empezar_GroupBox_Registro;
begin
  { Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo

  with f_almacenes_movimientos_000.SQLQuery_AMD do
  begin
      public_Record_Rgtro := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                         '',
                                                         '',
                                                         '',
                                                         '',
                                                         '' );
  end;

  Presentar_Datos_GroupBox_Registro;
  Presentar_Datos_GroupBox_Registro_Principal;
  }
end;

procedure Tform_plantilla_detalle_000.Cambiar_WindowState;
begin
  { Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo }

  Self.WindowState := wsNormal; // Puede ser wsNormal, wsFullScreen, wsMaximized o wsMinimized
end;

function Tform_plantilla_detalle_000.Devolver_public_Elegimos : Boolean;
begin
  { Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo

  Result := f_almacenes_movimientos_000.public_Elegimos;
  }
end;

function Tform_plantilla_detalle_000.Devolver_public_Solo_Ver : Boolean;
begin
  { Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo

  Result := f_almacenes_movimientos_000.public_Solo_Ver;
  }
end;

procedure Tform_plantilla_detalle_000.FormCreate(Sender: TObject);
begin
  private_Salir_OK := false;

  Cambiar_Titulo_Form;
  NewRecord_Insert_SQLQuery_Principal;
end;

procedure Tform_plantilla_detalle_000.Cambiar_Titulo_Form;
begin
  { Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo }

  Self.Caption := 'Ficha - ... ';
end;

procedure Tform_plantilla_detalle_000.FormClose( Sender: TObject;
                                                 var CloseAction: TCloseAction );
var var_msg           : TStrings;
    var_msg_Comprobar : TStrings;
begin
  ButtonPanel1.SetFocus; // Con esto consigo que salga del campo que este y pueda actualizarlo

  var_msg := TStringList.Create;
  var_msg.Clear;

  var_msg_Comprobar := TStringList.Create;
  var_msg_Comprobar.Clear;

  if public_Pulso_Aceptar = true then
  begin

    Antes_del_Post_NO_Principal_Asignar_Valores;

    Antes_del_Post_NO_Principal_Sin_Rellenar_Permitido_NO(var_msg, var_msg_Comprobar);

    var_msg_Comprobar.Clear;
    Antes_del_Post_NO_Principal_Sin_Rellenar_Permitido_SI(var_msg_Comprobar);

  end;

  if private_Salir_OK = False then
  begin
    // ********************************************************************************************* //
    // ** Intento BitBtn_SALIR de la aplicación de un modo no permitido.
    // ********************************************************************************************* //
    // ** Pero si desde el menu principal está a true la variable public_Salir_Ok, significa que  ** //
    // ** hay que salir si o si pues se pulsó cancelar al preguntar otra vez por la contraseña    ** //
    // ********************************************************************************************* //
    if form_Menu.public_Salir_OK = False then CloseAction := caNone;
  end
  else
  begin
    // ********************************************************************************************* //
    // ** Fue correcto el modo como quiere salir de la aplicación                                 ** //
    // ********************************************************************************************* //
    // ** Comprobaremos si no se generó algún error por falta de completar algun campo y si se    ** //
    // ** salió con el botón Ok o Cancel                                                          ** //
    // ********************************************************************************************* //
    if (Trim(var_msg.Text) <> '') and (public_Pulso_Aceptar = true) then
    begin
      UTI_GEN_Aviso(true, var_msg, rs_Falta, True, False);
      CloseAction := caNone;
    end
    else
    begin
      CloseAction := caFree;
    end;
  end;

  var_msg.Free;
  var_msg_Comprobar.Free;
end;

procedure Tform_plantilla_detalle_000.Antes_del_Post_NO_Principal_Asignar_Valores;
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

procedure Tform_plantilla_detalle_000.Antes_del_Post_NO_Principal_Sin_Rellenar_Permitido_SI(p_msg : TStrings);
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

procedure Tform_plantilla_detalle_000.Antes_del_Post_NO_Principal_Sin_Rellenar_Permitido_NO( p_msg,
                                                                                             p_msg_Comprobar : TStrings );
var var_record_Existe : Trecord_Existe;
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

    if Trim(FieldByName('Direccion').AsString) = '' then
    begin
      p_msg.Add( rs_bcta_008 );
    end;

    if Trim(FieldByName('id_poblaciones').AsString) = '' then
    begin
      p_msg.Add( rs_bcta_009 );
    end;

    if Trim(FieldByName('id_provincias').AsString) = '' then
    begin
      p_msg.Add( rs_bcta_010 );
    end;

    if Trim(FieldByName('id_paises').AsString) = '' then
    begin
      p_msg.Add( rs_bcta_011 );
    end;

    if Trim(FieldByName('Responsable').AsString) = '' then
    begin
      p_msg.Add( rs_bcta_012 );
    end;

    // ********************************************************************************************* //
    // ** Comprobamos que el iban es correcto                                                     ** //
    // ********************************************************************************************* //
    p_msg_Comprobar.Clear;
    Comprobar_Cuenta_IBAN(p_msg_Comprobar);

    if Trim(p_msg_Comprobar.Text) <> '' then
    begin
      p_msg.AddStrings( p_msg_Comprobar );
    end;

    // ********************************************************************************************* //
    // ** Comprobamos que la cuenta contable es correcta                                          ** //
    // ********************************************************************************************* //
    p_msg_Comprobar.Clear;
    UTI_CONTA_esta_Cta_Ctble_BIEN( form_menu.public_User_Configuracion.Bancos_Cuenta_Contable_SN,
                                   p_msg_Comprobar,
                                   SQLQuery_Tabla_no_Principal,
                                   '',
                                   'bancos_empresas',
                                   'Cuenta_Contable',
                                   rs_bcta_019 );

    if Trim(p_msg_Comprobar.Text) <> '' then
    begin
      p_msg.AddStrings( p_msg_Comprobar );
    end;

    // ********************************************************************************************* //
    // ** Comprobamos que la cuenta contable no esté ya creada para otra cuenta bancaria          ** //
    // ********************************************************************************************* //
    if SQLQuery_Tabla_no_Principal.State = dsInsert then
    begin
      var_record_Existe := Existe_la_Cta_Ya( '',
                                             FieldByName('descripcion').AsString );
    end;

    if SQLQuery_Tabla_no_Principal.State = dsEdit then
    begin
      var_record_Existe := Existe_la_Cta_Ya( FieldByName('id').AsString,
                                             FieldByName('descripcion').AsString );

    end;

    if (SQLQuery_Tabla_no_Principal.State = dsInsert) or
       (SQLQuery_Tabla_no_Principal.State = dsEdit)   then
    begin
      if var_record_Existe.Fallo_en_Conexion_BD = true then
      begin
        p_msg.Add( rs_bcta_017 );
      end
      else
      begin
        if var_record_Existe.Existe = true then
        begin
          p_msg.Add( rs_bcta_018 + Trim(FieldByName('id_empresas').AsString) );

          if UpperCase(var_record_Existe.deBaja) = 'S' then
          begin
            p_msg.Add(rs_Rgtro_Borrado);
          end;
        end;

      end;
    end;

  end;
}
end;

procedure Tform_plantilla_detalle_000.NewRecord_Insert_SQLQuery_Principal;
begin
  { Hacer algo parecido a lo de abajo pero en plan hereditario con su inherited y todo

  if SQLQuery_Tabla_no_Principal.State = dsInsert then
  begin

    with SQLQuery_Tabla_no_Principal do
    begin
      // ******************************************************************************************* //
      // ** Asignamos valores de inicio si no los tenían                                          ** //
      // ******************************************************************************************* //
      FieldByName('numero_siguiente').AsString := '1';

    end;

  end;

}
end;

end.



