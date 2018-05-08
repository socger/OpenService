unit utilidades_impresoras;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, Forms, printers;

type

  TImpresora_Predeterminada = record
      Error                         : ShortString;
      Impresora_descripcion_Elegida : String;
      Impresora_Ctdad_Copias        : String;
  end;

  function UTI_IMPRESORAS_Devolver_Numero_Impresora(p_Descripcion_Impresora : String) : String;
  function UTI_IMPRESORAS_Crear_Predeterminada( param_id, param_impresora_nombre : String ) : Boolean;
  function UTI_IMPRESORAS_Traer_Predeterminada : TImpresora_Predeterminada;
  function UTI_IMPRESORAS_Elegir_Impresora : TImpresora_Predeterminada;

implementation

uses utilidades_bd, utilidades_general, menu, opciones_impresion;

function UTI_IMPRESORAS_Crear_Predeterminada( param_id, param_impresora_nombre : String ) : Boolean;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
    Result := true;

    Try
        // ***************************************************************************************** //
        // ** Creamos la Transaccion y la conexión con el motor BD, y la abrimos                  ** //
        // ***************************************************************************************** //
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Connector_Open( var_SQLTransaction,
                                  var_SQLConnector ) = False then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Creamos la SQL Según el motor de BD                                                 ** //
        // ***************************************************************************************** //
        var_SQL := TStringList.Create;

        var_SQL.Add( 'CALL funct_Impresora_Predeterminada( ' +
                     UTI_GEN_Comillas(Trim(param_id)) + ' );' );

        // ***************************************************************************************** //
        // ** Abrimos la tabla                                                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery          := TSQLQuery.Create(nil);

        var_SQLQuery.Database := var_SQLConnector;
        var_SQLQuery.SQL.Text := var_SQL.Text;

        var_SQLQuery.Name     := 'SQLQuery_UTI_IMPRESORAS_Crear_Predeterminada';


        var_SQLQuery.ExecSQL;
        var_SQLTransaction.Commit;


        // ***************************************************************************************** //
        // ** Destruimos la tabla y conexiones                                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery.Free;
        var_SQL.Free;

        // ***************************************************************************************** //
        // ** Cerramos La transacción y la conexión con la BD                                     ** //
        // ***************************************************************************************** //
        if UTI_CN_Connector_Close( var_SQLTransaction,
                                   var_SQLConnector ) = False then UTI_GEN_Salir;

        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    Except
         on error : Exception do
         begin
             UTI_GEN_Error_Log( 'Error al actualizar la impresora ' + Trim(param_impresora_nombre) +
                                ' como predeterminada. El error se ha producido desde el módulo ' +
                                Screen.ActiveForm.Name,
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

function UTI_IMPRESORAS_Devolver_Numero_Impresora(p_Descripcion_Impresora : String) : String;
var v_Contador : Integer;
begin
    Result := '';

    // ********************************************************************************************* //
    // ** El número de impresora puede ser cambiado por el sistema operativo, o tambien puede ser ** //
    // ** borrada o cambiada de nombre la impresora. Por lo que tenemos que ver cual es su número ** //
    // ** actual o devolver que no existe.                                                        ** //
    // ********************************************************************************************* //
    // ** A la función tengo que pasarle la descripción de la impresora predeterminada su valor lo** //
    // ** guardamos en la variable ... form_Menu.public_Impresora_descripcion_Elegida             ** //
    // ********************************************************************************************* //
    if Trim(p_Descripcion_Impresora) <> '' then
    begin
        if Trim(Printer.Printers.Text) <> '' then
        begin
            // ************************************************************************************* //
            // ** El sistema operativo me devuelve que hay impresoras, por lo que vamos a ver cual** //
            // ** es la elegida como predeterminada                                               ** //
            // ************************************************************************************* //
            for v_Contador := 0 to Printer.Printers.Count - 1 do
            begin
                if Trim(Printer.Printers.Strings[v_Contador]) = Trim(p_Descripcion_Impresora) then
                begin
                    // ***************************************************************************** //
                    // ** Se encontró la impresora elegida como predeterminada, asu que devuelvo  ** //
                    // ** su número                                                               ** //
                    // ***************************************************************************** //
                    Result := IntToStr(v_Contador);
                    Break;
                end;
            end;
        end;
    end;
end;

function UTI_IMPRESORAS_Traer_Predeterminada : TImpresora_Predeterminada;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
    Result.Error                         := 'S';
    Result.Impresora_descripcion_Elegida := '';
    Result.Impresora_Ctdad_Copias        := '';

    try
        // ***************************************************************************************** //
        // ** Creamos la Transaccion y la conexión con el motor BD, y la abrimos                  ** //
        // ***************************************************************************************** //
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Connector_Open( var_SQLTransaction,
                                  var_SQLConnector ) = False then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Creamos la SQL Según el motor de BD                                                 ** //
        // ***************************************************************************************** //
        var_SQL := TStringList.Create;

        var_SQL.Add ( 'SELECT *' );
        var_SQL.Add(    'FROM impresoras' );
        var_SQL.Add(   'WHERE predeterminada_SN = ' + UTI_GEN_Comillas('S') );
        var_SQL.Add(     'AND Del_WHEN IS NULL ' );
        var_SQL.Add (  'ORDER BY Id' );

        // ***************************************************************************************** //
        // ** Abrimos la tabla                                                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery      := TSQLQuery.Create(nil);
        var_SQLQuery.Name := 'SQLQuery_UTI_IMPRESORAS_Traer_Predeterminada';

        if UTI_TB_Query_Open( '', '', '',
                              var_SQLConnector,
                              var_SQLQuery,
                              -1, // asi me trae todos los registros de golpe
                              var_SQL.Text ) = False then
        begin
            UTI_GEN_Salir;
        end;

        // ***************************************************************************************** //
        // ** TRABAJAMOS CON LOS REGISTROS DEVUELTOS                                              ** //
        // ***************************************************************************************** //
        // ** Si el módulo no se creó, no se permite entrar en él ... Result := False             ** //
        // ***************************************************************************************** //
        if var_SQLQuery.RecordCount > 0 then
        begin
            Result.Error                         := 'N';
            Result.Impresora_descripcion_Elegida := var_SQLQuery.FieldByName('descripcion').AsString;
            Result.Impresora_Ctdad_Copias        := var_SQLQuery.FieldByName('Copias_a_Imprimir').Value;
        end;

        // ***************************************************************************************** //
        // ** Cerramos la tabla                                                                   ** //
        // ***************************************************************************************** //
        if UTI_TB_Cerrar( var_SQLConnector,
                          var_SQLTransaction,
                          var_SQLQuery ) = false then
        begin
            UTI_GEN_Salir;
        end;

        var_SQLQuery.Free;
        var_SQL.Free;
        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    Except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( 'No se pudo traer la impresora predeterminada.', error );
            try
                // ********************************************************************************* //
                // ** Intentamos vaciar la memoria                                                ** //
                // ********************************************************************************* //
                var_SQLQuery.Free;
                var_SQL.Free;
                var_SQLTransaction.Free;
                var_SQLConnector.Free;
            except
            end;
        end;
    end;
end;

function UTI_IMPRESORAS_Elegir_Impresora : TImpresora_Predeterminada;
var var_msg : TStrings;
begin
  Result.Error                         := 'S';
  Result.Impresora_descripcion_Elegida := '';
  Result.Impresora_Ctdad_Copias        := '';

  if UTI_GEN_Form_Abierto_Ya('form_opciones_impresion') = false then
  begin
    Application.CreateForm(Tform_opciones_impresion, form_opciones_impresion);
    form_opciones_impresion.para_Empezar;
    form_opciones_impresion.Copias_Visible(true);

    form_opciones_impresion.ShowModal;

    if form_opciones_impresion.public_Pulso_Aceptar = true then
    begin
      Result.Error                         := 'N';
      Result.Impresora_descripcion_Elegida := form_opciones_impresion.ComboBox_Elegir_Impresora.Text;
      Result.Impresora_Ctdad_Copias        := IntToStr(form_opciones_impresion.SpinEdit_Copias.Value);
    end;

    form_opciones_impresion.Free;
  end else
  begin
    var_msg := TStringList.Create;
    var_msg.Add(rs_Modulo_Abierto);
    UTI_GEN_Aviso(true, var_msg, rs_Falta, True, False);
    var_msg.Free;
  end;
end;

end.

