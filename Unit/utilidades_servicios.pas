unit utilidades_servicios;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, sqldb, db, utilidades_bd, utilidades_general, utilidades_usuarios;

resourcestring
  rs_serv_reg_001_007 = '* La fecha de finalización del periodo es menor que la de inicio.';
  rs_serv_reg_001_008 = '* La finalización del horario es menor que el inicio.';

  function  Actualizar_inicio_servicio_anticipacion( p_clientes_recogida_inicio : tDateTime; p_Horas_Antes, p_Minutos_Antes : ShortString ) : tDateTime;
  function  UTI_SERV_Duplicar_Serv_Regular_Cabecera( p_id : String ) : Boolean;
  procedure Comprobar_Periodo( p_SQLQuery : TSQLQuery; p_msg : TStrings );
  procedure Comprobar_Anticipacion( p_msg : TStrings; p_Horas_Antes, p_Minutos_Antes : ShortString; p_Permitir_ningun_Minutos : Boolean );

implementation

uses menu;

function Actualizar_inicio_servicio_anticipacion( p_clientes_recogida_inicio : tDateTime;
                                                  p_Horas_Antes,
                                                  p_Minutos_Antes : ShortString ) : tDateTime;
var v_Valor_Minuto : Extended;
begin
    v_Valor_Minuto := StrToTime('00:02:00') - StrToTime('00:01:00');

    Result := p_clientes_recogida_inicio -
              (
                 ( (StrToInt(Trim(p_Horas_Antes)) * 60) * v_Valor_Minuto ) +
                 ( StrToInt(Trim(p_Minutos_Antes)) * v_Valor_Minuto )
              );
end;

procedure Comprobar_Anticipacion( p_msg : TStrings;
                                  p_Horas_Antes,
                                  p_Minutos_Antes : ShortString;
                                  p_Permitir_ningun_Minutos : Boolean );
var var_Hasta_Minuto : ShortInt;
    var_Mensaje      : ShortString;
begin
  if (Trim(p_Horas_Antes) <> '')   and
     (Trim(P_Minutos_Antes) <> '') then
  begin
    if p_Permitir_ningun_Minutos = false then
    begin
      if (StrToInt(Trim(p_Horas_Antes)) = 0)   and
         (StrToInt(Trim(P_Minutos_Antes)) = 0) then
      begin
        p_msg.Add('* Tiene que haber algún minuto de anticipación. No puedes poner HORAS=0 y MINUTOS=0');
        Exit;
      end;
    end;
  end;

  var_Hasta_Minuto := -1;
  if p_Permitir_ningun_Minutos = false then
  begin
    var_Hasta_Minuto := 0;
  end;

  var_Mensaje := '* El margen máximo para HORAS es entre 0 y 24 horas';
  if Trim(p_Horas_Antes) <> '' then
  begin
    if (StrToInt(Trim(p_Horas_Antes)) > 24) or
       (StrToInt(Trim(p_Horas_Antes)) < 0)  then
    begin
      p_msg.Add(var_Mensaje);
    end;
  end else
  begin
    p_msg.Add(var_Mensaje);
  end;

  var_Mensaje := '* El margen máximo para MINUTOS es entre 0 y 59 MINUTOS';
  if Trim(P_Minutos_Antes) <> '' then
  begin
    if (StrToInt(Trim(P_Minutos_Antes)) > 59)               or
       (StrToInt(Trim(P_Minutos_Antes)) < var_Hasta_Minuto) then
    begin
      p_msg.Add(var_Mensaje);
    end;
  end else
  begin
    p_msg.Add(var_Mensaje);
  end;

end;

procedure Comprobar_Periodo( p_SQLQuery : TSQLQuery;
                             p_msg : TStrings );
begin
  with p_SQLQuery do
  begin

    if FieldByName('hasta_fecha').Value < FieldByName('desde_fecha').Value then
    begin
      p_msg.Add('rs_serv_reg_001_007');
    end;

    if FieldByName('clientes_fin_servicio').Value < FieldByName('clientes_recogida_inicio').Value then
    begin
      p_msg.Add('rs_serv_reg_001_008');
    end;

  end;
end;

function UTI_SERV_Duplicar_Serv_Regular_Cabecera( p_id : String ) : Boolean;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
  Result := true;

  Try
    // Creamos la Transaccion y la conexión con el motor BD, y la abrimos
    var_SQLTransaction := TSQLTransaction.Create(nil);
    var_SQLConnector   := TSQLConnector.Create(nil);

    if UTI_CN_Connector_Open( var_SQLTransaction,
                              var_SQLConnector ) = False then UTI_GEN_Salir;

    // Creamos la SQL Según el motor de BD
    var_SQL := TStringList.Create;

    // Creamos la SQL
    var_SQL.Add( 'INSERT INTO servicios_regulares AS sr2' );

    var_SQL.Add(     '(  sr2.id_series_servicios,' );
    var_SQL.Add(        'sr2.id_empresas,' );
    var_SQL.Add(        'sr2.id_clientes,' );
    var_SQL.Add(        'sr2.id_clientes_contratante,' );
    var_SQL.Add(        'sr2.id_servicios_tipos,' );
    var_SQL.Add(        'sr2.id_personal_acompanante,' );
    var_SQL.Add(        'sr2.id_vehiculos_tipos,' );
    var_SQL.Add(        'sr2.descripcion,' );
    var_SQL.Add(        'sr2.fuera_del_municipio_SN,' );
    var_SQL.Add(        'sr2.itinerarios,' );
    var_SQL.Add(        'sr2.Itinerarios_imprimir_en_partes_SN,' );
    var_SQL.Add(        'sr2.conductores_cantidad,' );
    var_SQL.Add(        'sr2.conductores_condiciones,' );
    var_SQL.Add(        'sr2.conductores_instrucciones,' );
    var_SQL.Add(        'sr2.libro_ruta_origen,' );
    var_SQL.Add(        'sr2.libro_ruta_destino,' );
    var_SQL.Add(        'sr2.plazas,' );
    var_SQL.Add(        'sr2.libro_ruta_expediciones,' );
    var_SQL.Add(        'sr2.libro_ruta_contratante,' );
    var_SQL.Add(        'sr2.libro_ruta_nif,' );
    var_SQL.Add(        'sr2.acompanante_recogida_lugar,' );
    var_SQL.Add(        'sr2.acompanante_recogida_hora,' );
    var_SQL.Add(        'sr2.observaciones_comentarios,' );
    var_SQL.Add(        'sr2.observaciones_montaje,' );
    var_SQL.Add(        'sr2.observaciones_facturacion,' );
    var_SQL.Add(        'sr2.observaciones_vehiculo,' );
    var_SQL.Add(        'sr2.observaciones_para_liquidacion,' );
    var_SQL.Add(        'sr2.subcuenta_ventas,' );
    var_SQL.Add(        'sr2.pvp,' );
    var_SQL.Add(        'sr2.inicio_en_cocheras_SN,' );
    var_SQL.Add(        'sr2.inicio_servicio_anticipacion,' );
    var_SQL.Add(        'sr2.clientes_recogida_inicio,' );
    var_SQL.Add(        'sr2.clientes_recogida_lugar,' );
    var_SQL.Add(        'sr2.clientes_fin_servicio,' );
    var_SQL.Add(        'sr2.facturar_por_periodo_SN,' );
    var_SQL.Add(        'sr2.lunes_SN,' );
    var_SQL.Add(        'sr2.martes_SN,' );
    var_SQL.Add(        'sr2.miercoles_SN,' );
    var_SQL.Add(        'sr2.jueves_SN,' );
    var_SQL.Add(        'sr2.viernes_SN,' );
    var_SQL.Add(        'sr2.sabado_SN,' );
    var_SQL.Add(        'sr2.domingo_SN,' );

    var_SQL.Add(        'sr2.Insert_WHEN,' );
    var_SQL.Add(        'sr2.Insert_Id_User  )' );

    var_SQL.Add( 'SELECT sr1.id_series_servicios,' );
    var_SQL.Add(        'sr1.id_empresas,' );
    var_SQL.Add(        'sr1.id_clientes,' );
    var_SQL.Add(        'sr1.id_clientes_contratante,' );
    var_SQL.Add(        'sr1.id_servicios_tipos,' );
    var_SQL.Add(        'sr1.id_personal_acompanante,' );
    var_SQL.Add(        'sr1.id_vehiculos_tipos,' );
    var_SQL.Add(        'sr1.descripcion,' );
    var_SQL.Add(        'sr1.fuera_del_municipio_SN,' );
    var_SQL.Add(        'sr1.itinerarios,' );
    var_SQL.Add(        'sr1.Itinerarios_imprimir_en_partes_SN,' );
    var_SQL.Add(        'sr1.conductores_cantidad,' );
    var_SQL.Add(        'sr1.conductores_condiciones,' );
    var_SQL.Add(        'sr1.conductores_instrucciones,' );
    var_SQL.Add(        'sr1.libro_ruta_origen,' );
    var_SQL.Add(        'sr1.libro_ruta_destino,' );
    var_SQL.Add(        'sr1.plazas,' );
    var_SQL.Add(        'sr1.libro_ruta_expediciones,' );
    var_SQL.Add(        'sr1.libro_ruta_contratante,' );
    var_SQL.Add(        'sr1.libro_ruta_nif,' );
    var_SQL.Add(        'sr1.acompanante_recogida_lugar,' );
    var_SQL.Add(        'sr1.acompanante_recogida_hora,' );
    var_SQL.Add(        'sr1.observaciones_comentarios,' );
    var_SQL.Add(        'sr1.observaciones_montaje,' );
    var_SQL.Add(        'sr1.observaciones_facturacion,' );
    var_SQL.Add(        'sr1.observaciones_vehiculo,' );
    var_SQL.Add(        'sr1.observaciones_para_liquidacion,' );
    var_SQL.Add(        'sr1.subcuenta_ventas,' );
    var_SQL.Add(        'sr1.pvp,' );
    var_SQL.Add(        'sr1.inicio_en_cocheras_SN,' );
    var_SQL.Add(        'sr1.inicio_servicio_anticipacion,' );
    var_SQL.Add(        'sr1.clientes_recogida_inicio,' );
    var_SQL.Add(        'sr1.clientes_recogida_lugar,' );
    var_SQL.Add(        'sr1.clientes_fin_servicio,' );
    var_SQL.Add(        'sr1.facturar_por_periodo_SN,' );
    var_SQL.Add(        'sr1.lunes_SN,' );
    var_SQL.Add(        'sr1.martes_SN,' );
    var_SQL.Add(        'sr1.miercoles_SN,' );
    var_SQL.Add(        'sr1.jueves_SN,' );
    var_SQL.Add(        'sr1.viernes_SN,' );
    var_SQL.Add(        'sr1.sabado_SN,' );
    var_SQL.Add(        'sr1.domingo_SN,' );

    var_SQL.Add(        UTI_GEN_Comillas(UTI_GEN_Format_Fecha_Hora(UTI_CN_Fecha_Hora, true)) + ',' );
    var_SQL.Add(        IntToStr(Form_Menu.public_User) );

    var_SQL.Add( 'FROM servicios_regulares AS sr1' );

    var_SQL.Add( 'WHERE sr1.id = ' + p_id );

    // Pasamos Abrimos la SQL al Query que la ejecuta
    var_SQLQuery          := TSQLQuery.Create(nil);

    var_SQLQuery.Database := var_SQLConnector;
    var_SQLQuery.SQL.Text := var_SQL.Text;

    var_SQLQuery.Name     := 'SQLQuery_UTI_SERV_Duplicar_Serv_Regular_Cabecera';

    var_SQLQuery.ExecSQL;
    var_SQLTransaction.Commit;

    // Destruimos la tabla y conexiones
    var_SQLQuery.Free;
    var_SQL.Free;

    // Cerramos La transacción y la conexión con la BD
    if UTI_CN_Connector_Close( var_SQLTransaction,
                               var_SQLConnector ) = False then UTI_GEN_Salir;

    var_SQLTransaction.Free;
    var_SQLConnector.Free;

  Except
    on error : Exception do
    begin
      UTI_GEN_Error_Log( 'Error al duplicar la cabecera del servicio regular con id ' +
                         Trim(p_id) + '. La tabla ha sido ' + var_SQLQuery.Name +
                         ' desde el módulo ' + Screen.ActiveForm.Name,
                         error );
      try
        var_SQL.Free;
        var_SQLTransaction.Free;
        var_SQLConnector.Free;
        var_SQLQuery.Free;
      except
      end;

      Result := false
    end;
  end;
end;

end.


