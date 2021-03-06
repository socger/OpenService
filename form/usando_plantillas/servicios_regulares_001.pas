unit servicios_regulares_001;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DBDateTimePicker, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, ButtonPanel, DbCtrls, MaskEdit, Buttons, plantilla_detalle_000, utilidades_forms_Filtrar,
  utilidades_servicios;

resourcestring
  rs_serv_reg_001_001 = '* El desde del periodo.';
  rs_serv_reg_001_002 = '* El hasta del periodo.';
  rs_serv_reg_001_003 = '* El inicio en cocheras.';
  rs_serv_reg_001_004 = '* La anticipación.';
  rs_serv_reg_001_005 = '* El inicio del horario.';
  rs_serv_reg_001_006 = '* El fin del horario.';

type

  { Tf_servicios_regulares_001 }

  Tf_servicios_regulares_001 = class(Tform_plantilla_detalle_000)
    DBDateTimePicker_DesdeFecha: TDBDateTimePicker;
    DBDateTimePicker_DesdeHora: TDBDateTimePicker;
    DBDateTimePicker_HastaFecha: TDBDateTimePicker;
    DBDateTimePicker_HastaHora: TDBDateTimePicker;
    DBEdit_Descripcion: TDBEdit;
    DBEdit_Descripcion8: TDBEdit;
    Domingo: TDBCheckBox;
    DBCheckBox_InicioEnCocheras: TDBCheckBox;
    Edit_Descripcion_Cliente: TEdit;
    Edit_Descripcion_Servicio_Serie: TEdit;
    FueraDelMunicipio: TDBCheckBox;
    GroupBox_Dias_Servicio: TGroupBox;
    Jueves: TDBCheckBox;
    Label1: TLabel;
    Label138: TLabel;
    Label17: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label52: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label78: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Lunes: TDBCheckBox;
    Martes: TDBCheckBox;
    MaskEdit_Horas: TMaskEdit;
    MaskEdit_Minutos: TMaskEdit;
    Miercoles: TDBCheckBox;
    Panel30: TPanel;
    Panel_1: TPanel;
    Panel_10: TPanel;
    Panel_11: TPanel;
    Panel_2: TPanel;
    Panel_3: TPanel;
    Panel_7: TPanel;
    Panel_8: TPanel;
    Panel_9: TPanel;
    Sabado: TDBCheckBox;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Viernes: TDBCheckBox;

    procedure NewRecord_Insert_SQLQuery_Principal; override;
    procedure Antes_del_Post_NO_Principal_Sin_Rellenar_Permitido_SI( p_msg : TStrings ); override;
    procedure Antes_del_Post_NO_Principal_Sin_Rellenar_Permitido_NO( p_msg, p_msg_Comprobar : TStrings ); override;
    procedure Antes_del_Post_NO_Principal_Asignar_Valores; override;
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
  f_servicios_regulares_001: Tf_servicios_regulares_001;

implementation

{$R *.lfm}

uses menu, servicios_regulares_000;

{ Tf_servicios_regulares_001 }

procedure Tf_servicios_regulares_001.Cambiar_WindowState;
begin
  Self.WindowState := wsNormal; // Puede ser wsNormal, wsFullScreen, wsMaximized o wsMinimized
end;

procedure Tf_servicios_regulares_001.Cambiar_Titulo_Form;
begin
  Self.Caption := 'Ficha - Temporada del servicio regular';
end;

function Tf_servicios_regulares_001.Devolver_public_Elegimos : Boolean;
begin
  Result := f_servicios_regulares_000.public_Elegimos;
end;

function Tf_servicios_regulares_001.Devolver_public_Solo_Ver : Boolean;
begin
  Result := f_servicios_regulares_000.public_Solo_Ver;
end;

procedure Tf_servicios_regulares_001.para_Empezar_GroupBox_Registro;
begin
  with f_servicios_regulares_000.SQLQuery_Temporadas do
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

procedure Tf_servicios_regulares_001.Presentar_Datos_GroupBox_Registro;
var v_ValorFecha   : Real;
    v_Valor_Minuto : Extended;
    v_Horas        : Extended;
    v_Minutos      : Extended;
begin
  with f_servicios_regulares_000.SQLQuery_Temporadas do
  begin
    if RecordCount > 0 then
    begin
      MaskEdit_Horas.Text   := '0';
      MaskEdit_Minutos.Text := '0';

      if (not FieldByName('inicio_servicio_anticipacion').IsNull) and
         (not FieldByName('clientes_recogida_inicio').IsNull)     then
      begin
          v_ValorFecha := FieldByName('clientes_recogida_inicio').Value -
                          FieldByName('inicio_servicio_anticipacion').Value;

          v_Valor_Minuto := StrToTime('00:02:00') - StrToTime('00:01:00');

          v_Minutos := Round(v_ValorFecha / v_Valor_Minuto);
          v_Horas   := Trunc(v_Minutos / 60);
          v_Minutos := v_Minutos - (v_Horas * 60);

          MaskEdit_Horas.Text   := FloatToStr(Round(v_Horas));
          MaskEdit_Minutos.Text := FloatToStr(v_Minutos);
      end;
    end;
  end;
end;

procedure Tf_servicios_regulares_001.Presentar_Datos_GroupBox_Registro_Principal;
begin
  with f_servicios_regulares_000.SQLQuery_Principal do
  begin
    if RecordCount > 0 then
    begin
      Edit_Descripcion_Servicio_Serie.Text := FieldByName('OT_series_servicios_descripcion').AsString;
      Edit_Descripcion_Cliente.Text        := FieldByName('OT_cliente_descripcion').AsString;
    end;
  end;
end;

procedure Tf_servicios_regulares_001.Antes_del_Post_NO_Principal_Asignar_Valores;
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

procedure Tf_servicios_regulares_001.Antes_del_Post_NO_Principal_Sin_Rellenar_Permitido_SI(p_msg : TStrings);
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

procedure Tf_servicios_regulares_001.Antes_del_Post_NO_Principal_Sin_Rellenar_Permitido_NO( p_msg,
                                                                                            p_msg_Comprobar : TStrings );
begin
  with f_servicios_regulares_000.SQLQuery_Temporadas do
  begin

    if FieldByName('desde_fecha').IsNull then
    begin
      p_msg.Add(rs_serv_reg_001_001);
    end;

    if FieldByName('hasta_fecha').IsNull then
    begin
      p_msg.Add(rs_serv_reg_001_002);
    end;

    if FieldByName('inicio_en_cocheras_SN').IsNull then
    begin
      p_msg.Add(rs_serv_reg_001_003);
    end;

    if FieldByName('inicio_servicio_anticipacion').IsNull then
    begin
      p_msg.Add(rs_serv_reg_001_004);
    end;

    if FieldByName('clientes_recogida_inicio').IsNull then
    begin
      p_msg.Add(rs_serv_reg_001_005);
    end;

    if FieldByName('clientes_fin_servicio').IsNull then
    begin
      p_msg.Add(rs_serv_reg_001_006);
    end;

    Comprobar_Periodo( f_servicios_regulares_000.SQLQuery_Temporadas,
                       p_msg );

    Comprobar_Anticipacion( p_msg,
                            MaskEdit_Horas.Text,
                            MaskEdit_Minutos.Text, True );

    FieldByName('inicio_servicio_anticipacion').Value :=  Actualizar_inicio_servicio_anticipacion( FieldByName('clientes_recogida_inicio').Value,
                                                                                                   MaskEdit_Horas.Text,
                                                                                                   MaskEdit_Minutos.Text );

  end;

end;

procedure Tf_servicios_regulares_001.NewRecord_Insert_SQLQuery_Principal;
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


