unit almacenes_movimientos_001;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DBDateTimePicker, Forms, Controls, Graphics, Dialogs, StdCtrls, db,
  ExtCtrls, ButtonPanel, DbCtrls, Buttons, plantilla_detalle_000, utilidades_forms_Filtrar,
  utilidades_general, utilidades_stock;

resourcestring
  rs_alm_mov_001_001 = '¿QUITAMOS el ARTICULO';
  rs_alm_mov_001_002 = '* El artículo.';
  rs_alm_mov_001_003 = '* Del artículo ';
  rs_alm_mov_001_004 = ' su stock actual en el almacén ';
  rs_alm_mov_001_005 = ' es de ';
  rs_alm_mov_001_006 = ', así que no puedo traspasar al almacén ';
  rs_alm_mov_001_007 = ' la cantidad solicitada de ';
  rs_alm_mov_001_008 = '* Las unidades ó cantidad.';

type

  { Tf_almacenes_movimientos_001 }

  Tf_almacenes_movimientos_001 = class(Tform_plantilla_detalle_000)
    Boton_Elegir_Articulo: TBitBtn;
    DBDateTimePicker_Fecha_Movimiento: TDBDateTimePicker;
    DBEdit_Direccion_Numero: TDBEdit;
    DBRadioGroup_Tipo_Cuenta: TDBRadioGroup;
    Edit_Descripcion_Almacen_Destino: TEdit;
    Edit_Descripcion_Almacen_Origen: TEdit;
    Edit_Descripcion_Articulo: TEdit;
    Edit_Descripcion_Concepto: TEdit;
    Label1: TLabel;
    Label16: TLabel;
    Label6: TLabel;
    Label64: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel_Tipo_Movimiento: TPanel;

    procedure Boton_Elegir_ArticuloClick(Sender: TObject);
    procedure Edit_Descripcion_ArticuloClick(Sender: TObject);

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
  f_almacenes_movimientos_001: Tf_almacenes_movimientos_001;

implementation

{$R *.lfm}

uses menu, almacenes_movimientos_000;

{ Tf_almacenes_movimientos_001 }

procedure Tf_almacenes_movimientos_001.Boton_Elegir_ArticuloClick(Sender: TObject);
var var_Registro : TRecord_Rgtro_Comun;
begin
  with f_almacenes_movimientos_000.SQLQuery_AMD do
  begin
    var_Registro := UTI_Abrir_Modulo_Articulos( true, false, 170, '1' );
    if var_Registro.id_1 <> '' then
    begin
      FieldByName('id_articulos').AsString := Trim(var_Registro.id_1);
      Edit_Descripcion_Articulo.Text       := var_Registro.descripcion_1;
    end;
  end;
end;

procedure Tf_almacenes_movimientos_001.Edit_Descripcion_ArticuloClick(Sender: TObject);
var var_msg : TStrings;
begin
  var_msg := TStringList.Create;
  var_msg.Add(rs_alm_mov_001_001);
  if UTI_GEN_Aviso(true, var_msg, rs_OK, True, True) = True then
  begin
    f_almacenes_movimientos_000.SQLQuery_AMD.FieldByName('id_articulos').Clear;
    Edit_Descripcion_Articulo.Text := '';
  end;
  var_msg.Free;
end;

procedure Tf_almacenes_movimientos_001.Cambiar_WindowState;
begin
  Self.WindowState := wsNormal; // Puede ser wsNormal, wsFullScreen, wsMaximized o wsMinimized
end;

procedure Tf_almacenes_movimientos_001.Cambiar_Titulo_Form;
begin
  Self.Caption := 'Ficha - Movimiento entre almacenes';
end;

function Tf_almacenes_movimientos_001.Devolver_public_Elegimos : Boolean;
begin
  Result := f_almacenes_movimientos_000.public_Elegimos;
end;

function Tf_almacenes_movimientos_001.Devolver_public_Solo_Ver : Boolean;
begin
  Result := f_almacenes_movimientos_000.public_Solo_Ver;
end;

procedure Tf_almacenes_movimientos_001.para_Empezar_GroupBox_Registro;
begin
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
end;

procedure Tf_almacenes_movimientos_001.Presentar_Datos_GroupBox_Registro;
begin
  with f_almacenes_movimientos_000.SQLQuery_AMD do
  begin
    if RecordCount > 0 then
    begin
      Edit_Descripcion_Articulo.Text := FieldByName('OT_descripcion_articulo').AsString;
    end;
  end;
end;

procedure Tf_almacenes_movimientos_001.Presentar_Datos_GroupBox_Registro_Principal;
begin
  with f_almacenes_movimientos_000.SQLQuery_Principal do
  begin
    Edit_Descripcion_Almacen_Destino.Text := FieldByName('OT_descripcion_almacen_destino').AsString;
    Edit_Descripcion_Almacen_Origen.Text  := FieldByName('OT_descripcion_almacen_origen').AsString;
    Edit_Descripcion_Concepto.Text        := FieldByName('OT_descripcion_conceptos_almacen_traspaso').AsString;
  end;
end;

procedure Tf_almacenes_movimientos_001.Antes_del_Post_NO_Principal_Asignar_Valores;
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

procedure Tf_almacenes_movimientos_001.Antes_del_Post_NO_Principal_Sin_Rellenar_Permitido_SI(p_msg : TStrings);
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

procedure Tf_almacenes_movimientos_001.Antes_del_Post_NO_Principal_Sin_Rellenar_Permitido_NO( p_msg,
                                                                                              p_msg_Comprobar : TStrings );
var var_Stock_Articulo : TStock_Traerlo;
begin
  with f_almacenes_movimientos_000.SQLQuery_AMD do
  begin

    if Trim(FieldByName('id_articulos').AsString) = '' then
    begin
      p_msg.Add(rs_alm_mov_001_002);
    end else begin
      // ******************************************************************************************* //
      // ** Solo si es artículo y está puesto el almacén se comprobará si existe el stock en los  ** //
      // ** almacenes                                                                             ** //
      // ******************************************************************************************* //
      if not f_almacenes_movimientos_000.SQLQuery_Principal.FieldByName('id_almacenes_origen').IsNull then
      begin
        if FieldByName('OT_Tipo_de_articulo').Value = 0 then
        begin
          // *************************************************************************************** //
          // ** Solo si se trata de un artículo para stock                                        ** //
          // *************************************************************************************** //
          var_Stock_Articulo := UTI_STOCK_Traer_Stock_Articulo( FieldByName('id_articulos').AsString,
                                                                f_almacenes_movimientos_000.SQLQuery_Principal.FieldByName('id_almacenes_origen').AsString );
          if State = dsEdit then
          begin
            // ************************************************************************************* //
            // ** Si es una edición al stock devuelto hay que añadirle el valor anterior de Unida-** //
            // ** des(el que tenía antes de intentar modificar el rgtro)                          ** //
            // ************************************************************************************* //
            var_Stock_Articulo.Stock := var_Stock_Articulo.Stock +
                                        Params.ParamByName('COPY_Unidades').Value;
          end;

          if var_Stock_Articulo.Stock < FieldByName('Unidades').Value then
          begin
            p_msg.Add( rs_alm_mov_001_003 + Trim(Edit_Descripcion_Articulo.Text) +
                       rs_alm_mov_001_004  +
                       Trim(Edit_Descripcion_Almacen_Origen.Text) +
                       rs_alm_mov_001_005 + FloatToStr(var_Stock_Articulo.Stock) +
                       rs_alm_mov_001_006 +
                       Trim(Edit_Descripcion_Almacen_Destino.Text) +
                       rs_alm_mov_001_007 +
                       FieldByName('Unidades').AsString + '.' );
          end;
        end;
      end;
    end;

    if Trim(FieldByName('Unidades').AsString) = '' then
    begin
      p_msg.Add(rs_alm_mov_001_008);
    end;

  end;

end;

procedure Tf_almacenes_movimientos_001.NewRecord_Insert_SQLQuery_Principal;
begin
  if f_almacenes_movimientos_000.SQLQuery_AMD.State = dsInsert then
  begin

    with f_almacenes_movimientos_000.SQLQuery_AMD do
    begin
      // ******************************************************************************************* //
      // ** Asignamos valores de inicio si no los tenían                                          ** //
      // ******************************************************************************************* //
      // FieldByName('numero_siguiente').AsString := '1';

    end;

  end;
end;

procedure Tf_almacenes_movimientos_001.Campo_Foco_en_modo_Edicion_Inserccion;
begin
  Self.ActiveControl := Boton_Elegir_Articulo;
end;

end.


