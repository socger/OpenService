unit clientes_002;

{$mode objfpc}{$H+}

interface

uses

  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, db, ExtCtrls, DbCtrls,
  Buttons, plantilla_detalle_000, utilidades_general, utilidades_forms_Filtrar, utilidades_usuarios;

resourcestring
  rs_clientes_002_001 = '* La dirección.';
  rs_clientes_002_002 = '* La población.';
  rs_clientes_002_003 = '* La provincia.';
  rs_clientes_002_004 = '* El país.';

type

  { Tf_clientes_002 }

  Tf_clientes_002 = class(Tform_plantilla_detalle_000)
    BitBtn_SMS: TBitBtn;
    BitBtn_ver_direccion_en_Maps: TBitBtn;
    Boton_Elegir_Pais: TBitBtn;
    Boton_Elegir_Contacto: TBitBtn;
    Boton_Elegir_Poblacion: TBitBtn;
    Boton_Elegir_Provincia: TBitBtn;
    DBCheckBox_IVA_Excluido_SN: TDBCheckBox;
    DBEdit_a_quien_facturamos: TDBEdit;
    DBEdit_Codigo_Postal: TDBEdit;
    DBEdit_Direccion: TDBEdit;
    DBEdit_Direccion_Numero: TDBEdit;
    DBEdit_Direccion_Piso_Letra: TDBEdit;
    DBEdit_FAX: TDBEdit;
    DBEdit_Movil: TDBEdit;
    DBEdit_NIF_CIF: TDBEdit;
    DBEdit_Nombre_Comercial: TDBEdit;
    DBEdit_Tfno_Fijo_1: TDBEdit;
    DBEdit_Tfno_Fijo_2: TDBEdit;
    Edit_Descripcion_Pais: TEdit;
    Edit_Descripcion_Contacto: TEdit;
    Edit_Descripcion_Poblacion: TEdit;
    Edit_Descripcion_Provincia: TEdit;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;

    procedure BitBtn_SMSClick(Sender: TObject);
    procedure Boton_Elegir_ContactoClick(Sender: TObject);
    procedure Boton_Elegir_PaisClick(Sender: TObject);
    procedure Boton_Elegir_PoblacionClick(Sender: TObject);
    procedure Boton_Elegir_ProvinciaClick(Sender: TObject);
    procedure Edit_Descripcion_ContactoClick(Sender: TObject);
    procedure Edit_Descripcion_PaisClick(Sender: TObject);
    procedure Edit_Descripcion_PoblacionClick(Sender: TObject);
    procedure Edit_Descripcion_ProvinciaClick(Sender: TObject);

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
    { private declarations }

  public
    { public declarations }
    public_Record_Rgtro  : TRecord_Rgtro_Comun;

  end;

var
  f_clientes_002: Tf_clientes_002;

implementation

{$R *.lfm}

uses menu, clientes_000;

{ Tf_clientes_002 }

procedure Tf_clientes_002.Edit_Descripcion_ContactoClick(
  Sender: TObject);
var var_msg : TStrings;
begin
  var_msg := TStringList.Create;
  var_msg.Add('¿QUITAMOS la persona CON QUIEN HABLAR');

  if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
  begin
    f_clientes_000.SQLQuery_Clientes_Envios.FieldByName('id_clientes_contactos').Clear;
    Edit_Descripcion_Contacto.Text := '';
  end;

  var_msg.Free;
end;

procedure Tf_clientes_002.Edit_Descripcion_PaisClick(Sender: TObject);
var var_msg : TStrings;
begin
  var_msg := TStringList.Create;
  var_msg.Add('¿QUITAMOS el PAIS');
  if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
  begin
    f_clientes_000.SQLQuery_Clientes_Envios.FieldByName('id_paises').Clear;
    Edit_Descripcion_Pais.Text := '';
  end;
  var_msg.Free;
end;

procedure Tf_clientes_002.Boton_Elegir_ContactoClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
  with f_clientes_000.SQLQuery_Clientes_Envios do
  begin
    if UTI_USR_Permiso_SN(f_clientes_000.public_Menu_Worked, 'M', True) = True then
    begin
      var_Registro := UTI_Abrir_Modulo_Elegir_cliente_contacto( true, true, 51, '1' );
      if var_Registro.id_1 <> '' then
      begin
        FieldByName('id_clientes_contactos').AsString := Trim(var_Registro.id_1);
        Edit_Descripcion_Contacto.Text                := var_Registro.descripcion_1;
      end;
    end;
  end;
end;

procedure Tf_clientes_002.Boton_Elegir_PaisClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
  with f_clientes_000.SQLQuery_Clientes_Envios do
  begin
    var_Registro := UTI_Abrir_Modulo_Paises( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
       FieldByName('id_paises').AsString := Trim(var_Registro.id_1);
       Edit_Descripcion_Pais.Text        := var_Registro.descripcion_1;
    end;
  end;
end;

procedure Tf_clientes_002.Boton_Elegir_PoblacionClick(
  Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
  with f_clientes_000.SQLQuery_Clientes_Envios do
  begin
    var_Registro := UTI_Abrir_Modulo_Poblaciones( true, false, '1' );

    if var_Registro.id_1 <> '' then
    begin
      FieldByName('id_poblaciones').AsString := Trim(var_Registro.id_1);
      FieldByName('id_provincias').AsString  := Trim(var_Registro.id_2);
      FieldByName('id_paises').AsString      := Trim(var_Registro.id_3);

      Edit_Descripcion_Poblacion.Text        := var_Registro.descripcion_1;
      Edit_Descripcion_Provincia.Text        := var_Registro.descripcion_2;
      Edit_Descripcion_Pais.Text             := var_Registro.descripcion_3;
    end;
  end;
end;

procedure Tf_clientes_002.Boton_Elegir_ProvinciaClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
  with f_clientes_000.SQLQuery_Clientes_Envios do
  begin
    var_Registro := UTI_Abrir_Modulo_Provincias( true, false, '1' );
    if var_Registro.id_1 <> '' then
    begin
      FieldByName('id_provincias').AsString := Trim(var_Registro.id_1);
      FieldByName('id_paises').AsString     := Trim(var_Registro.id_2);

      Edit_Descripcion_Provincia.Text       := var_Registro.descripcion_1;
      Edit_Descripcion_Pais.Text            := var_Registro.descripcion_2;
    end;
  end;
end;

procedure Tf_clientes_002.Edit_Descripcion_PoblacionClick(
  Sender: TObject);
var var_msg : TStrings;
begin
  var_msg := TStringList.Create;
  var_msg.Add('¿QUITAMOS la POBLACIÓN');

  if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
  begin
    f_clientes_000.SQLQuery_Clientes_Envios.FieldByName('id_poblaciones').Clear;
    Edit_Descripcion_Poblacion.Text := '';
  end;

  var_msg.Free;
end;

procedure Tf_clientes_002.Edit_Descripcion_ProvinciaClick(
  Sender: TObject);
var var_msg : TStrings;
begin
  var_msg := TStringList.Create;
  var_msg.Add('¿QUITAMOS la PROVINCIA');
  if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
  begin
     f_clientes_000.SQLQuery_Clientes_Envios.FieldByName('id_provincias').Clear;
     Edit_Descripcion_Provincia.Text := '';
  end;
  var_msg.Free;
end;

procedure Tf_clientes_002.BitBtn_SMSClick(Sender: TObject);
begin
  UTI_GEN_Enviar_SMS;
end;

procedure Tf_clientes_002.Campo_Foco_en_modo_Edicion_Inserccion;
begin
  Self.ActiveControl := Boton_Elegir_Contacto;
end;

procedure Tf_clientes_002.NewRecord_Insert_SQLQuery_Principal;
begin
  if f_clientes_000.SQLQuery_Clientes_Envios.State = dsInsert then
  begin

    with f_clientes_000.SQLQuery_Clientes_Envios do
    begin
      // ******************************************************************************************* //
      // ** Asignamos valores de inicio si no los tenían                                          ** //
      // ******************************************************************************************* //
      // FieldByName('numero_siguiente').AsString := '1';

    end;

  end;
end;

procedure Tf_clientes_002.Antes_del_Post_NO_Principal_Sin_Rellenar_Permitido_NO( p_msg,
                                                                                 p_msg_Comprobar : TStrings );
begin
  with f_clientes_000.SQLQuery_Clientes_Envios do
  begin
    if Trim(FieldByName('nombre').AsString) = '' then
    begin
      p_msg.Add(rs_clientes_002_001);
    end;

    if Trim(FieldByName('Direccion').AsString) = '' then
    begin
      p_msg.Add(rs_clientes_002_001);
    end;

    if Trim(FieldByName('id_poblaciones').AsString) = '' then
    begin
      p_msg.Add(rs_clientes_002_002);
    end;

    if Trim(FieldByName('id_provincias').AsString) = '' then
    begin
      p_msg.Add(rs_clientes_002_003);
    end;

    if Trim(FieldByName('id_paises').AsString) = '' then
    begin
      p_msg.Add(rs_clientes_002_004);
    end;

  end;

end;

procedure Tf_clientes_002.Antes_del_Post_NO_Principal_Sin_Rellenar_Permitido_SI(p_msg : TStrings);
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

procedure Tf_clientes_002.Antes_del_Post_NO_Principal_Asignar_Valores;
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

procedure Tf_clientes_002.Cambiar_WindowState;
begin
  Self.WindowState := wsNormal; // Puede ser wsNormal, wsFullScreen, wsMaximized o wsMinimized
end;

procedure Tf_clientes_002.Cambiar_Titulo_Form;
begin
  Self.Caption := 'Ficha - Dirección de envío de un cliente';
end;

function Tf_clientes_002.Devolver_public_Elegimos : Boolean;
begin
  Result := f_clientes_000.public_Elegimos;
end;

function Tf_clientes_002.Devolver_public_Solo_Ver : Boolean;
begin
  Result := f_clientes_000.public_Solo_Ver;
end;

procedure Tf_clientes_002.para_Empezar_GroupBox_Registro;
begin
  with f_clientes_000.SQLQuery_Clientes_Envios do
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
end;

procedure Tf_clientes_002.Presentar_Datos_GroupBox_Registro;
begin
  with f_clientes_000.SQLQuery_Clientes_Envios do
  begin
    if RecordCount > 0 then
    begin
      // Edit_Descripcion_Articulo.Text := FieldByName('OT_descripcion_articulo').AsString;
    end;
  end;
end;

procedure Tf_clientes_002.Presentar_Datos_GroupBox_Registro_Principal;
begin
  with f_clientes_000.SQLQuery_Principal do
  begin
    // Edit_Descripcion_Almacen_Destino.Text := FieldByName('OT_descripcion_almacen_destino').AsString;
  end;
end;


end.



