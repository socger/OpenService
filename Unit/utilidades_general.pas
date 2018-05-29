unit utilidades_general;

{$mode objfpc}{$H+}

interface

uses
    Graphics, sysutils, syncobjs, Dialogs, Forms, Controls, Classes, ButtonPanel, DBGrids, Grids,
    LCLTranslator, sqldb, db, DateTimePicker, printers, utilidades_impresoras, utilidades_informes,
    LR_Class, PrintersDlgs;

    function  UTI_GEN_Comprobar_2_Fechas( param_Desde, param_Hasta : TDateTimePicker ) : Boolean;
    function  UTI_GEN_Cut_to_3_Decimal( param_Importe : String ) : String;
    Function  UTI_GEN_Round_to_2_Decimal( param_Importe : String ) : String;
    function  UTI_GEN_Comillas(param_Frase : string) : string;
    function  UTI_GEN_Format_Fecha_Hora( param_Fecha : TDateTime; param_Devolver_Segundos : Boolean ) : ShortString;
    function  UTI_GEN_Format_Numero( param_Numero : ShortString ) : ShortString;
    function  UTI_GEN_Form_Abierto_Ya(param_Form : string) : boolean;
    function  UTI_GEN_Aviso(param_Aviso : Boolean; param_msg : TStrings; param_Titulo : String; param_BitBtn_Aceptar, param_BitBtn_Cancelar : Boolean ) : Boolean;
    procedure UTI_GEN_Cambiar_Idioma( param_Idioma : ShortString );
    procedure UTI_GEN_Salir;
    procedure UTI_GEN_Log(param_msg : String);
    procedure UTI_GEN_Enviar_SMS;
    procedure UTI_GEN_Enviar_eMAIL;
    procedure UTI_GEN_Visitar_Situl;
    procedure UTI_GEN_ver_direccion_en_Internet;
    procedure UTI_GEN_Dibujar_Grid( param_Sender: TObject; param_SQLQuery : TSQLQuery; param_Rect: TRect; param_DataCol: Integer; param_Column: TColumn; param_State: TGridDrawState );
    procedure UTI_GEN_Error_Log( param_Mensaje : String; param_error : Exception );
    function  UTI_GEN_Copiar_Fichero( param_Path_Lectura, param_Path_Conservacion, param_Name_File_Lectura, param_Name_File_Conservacion, param_Borrar_Fichero_SN: String ) : String;
    function  UTI_GEN_Comprobar_2_Ficheros( param_path_File_1, param_path_File_2, param_name_File_1, param_name_File_2 : String ) : String;
    function  UTI_GEN_Borrar_Fichero( param_Path, param_Fichero: String ) : String;

    procedure UTI_GEN_Informes( param_Ordenado_por : String; param_Tabla : TSQLQuery; param_Ds_Maestro, param_Ds_Detalle, param_Ds_Detalle_2, param_Ds_Detalle_3 : TDataSource; param_Menu_Worked : Integer; param_Solo_Ver : Boolean; param_id_empresas, param_Impuesto_Comun : String; param_Ficheros : TStrings );
    procedure UTI_GEN_Informes_II( p_opcion : ShortInt; p_frReport : TfrReport; p_Fichero : String; p_Menu_Worked : Integer; p_PrintDialog : TPrintDialog; p_Copias : String );

    procedure UTI_GEN_Traer_Trimestre( p_DateTimePicker_Desde, p_DateTimePicker_Hasta : TDateTimePicker );

    procedure UTI_GEN_AclararSeparadoresDecimales;
    procedure UTI_GEN_AclararFormatoFecha;
    procedure UTI_GEN_AclararFormatoHora;

    function  UTI_GEN_Comprobar_Introducido_es_DiaHora( p_numero : String; p_Texto_paraVer_siError : String ) : String;
    function  UTI_GEN_Comprobar_Introducido_es_Dia( p_numero : String; p_Texto_paraVer_siError : String ) : String;
    function  UTI_GEN_Comprobar_Introducido_es_Hora( p_numero : String; p_Texto_paraVer_siError : String ) : String;
    function  UTI_GEN_Comprobar_Introducido_es_Numero( p_numero : String; p_Texto_paraVer_siError : String ) : String;
var
  var_Global_CriticalSection : TCriticalSection;

implementation

uses menu, avisos, barra_progreso, informe, utilidades_usuarios, utilidades_ini, elija_ano_trimestre;

procedure UTI_GEN_Traer_Trimestre( p_DateTimePicker_Desde,
                                   p_DateTimePicker_Hasta : TDateTimePicker );
var v_ano       : Integer;
    v_Trimestre : Integer;
begin
    Application.CreateForm(Tform_elija_ano_trimestre, form_elija_ano_trimestre);
    form_elija_ano_trimestre.ShowModal;

    if form_elija_ano_trimestre.public_Pulso_Aceptar = true then
    begin
        v_ano       := form_elija_ano_trimestre.TISpinEdit_Ano.Value;
        v_Trimestre := form_elija_ano_trimestre.TISpinEdit_Trimestre.Value;

        if v_Trimestre = 1 then
        begin
            p_DateTimePicker_Desde.Date := StrToDate('01/01/' + IntToStr(v_ano));
            p_DateTimePicker_Hasta.Date := StrToDate('01/04/' + IntToStr(v_ano)) - 1;
        end;

        if v_Trimestre = 2 then
        begin
            p_DateTimePicker_Desde.Date := StrToDate('01/04/' + IntToStr(v_ano));
            p_DateTimePicker_Hasta.Date := StrToDate('01/07/' + IntToStr(v_ano)) - 1;
        end;

        if v_Trimestre = 3 then
        begin
            p_DateTimePicker_Desde.Date := StrToDate('01/07/' + IntToStr(v_ano));
            p_DateTimePicker_Hasta.Date := StrToDate('01/10/' + IntToStr(v_ano)) - 1;
        end;

        if v_Trimestre = 4 then
        begin
            p_DateTimePicker_Desde.Date := StrToDate('01/10/' + IntToStr(v_ano));
            p_DateTimePicker_Hasta.Date := StrToDate('31/12/' + IntToStr(v_ano));
        end;
    end;

    form_elija_ano_trimestre.Free;
end;

procedure UTI_GEN_Error_Log( param_Mensaje : String;
                             param_error : Exception );
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Clear;

    var_msg.Add(param_Mensaje);
    var_msg.Add( ' ');
    var_msg.Add('Este es el mensaje de error: ');
    var_msg.Add( ' ');
    var_msg.Add(param_error.Message);
    var_msg.Add( ' ');

    UTI_GEN_Log(var_msg.Text);
    UTI_GEN_Aviso(true, var_msg, 'ERROR', True, False);

    var_msg.Free;
end;

function UTI_GEN_Form_Abierto_Ya( param_Form : String ) : boolean;
var
  var_Contador : Integer;

begin
  Result := false;

  if Trim(param_Form) = '' then
  begin
    Exit;
  end;

  for var_Contador := 0 to Screen.FormCount - 1 do
  begin
    if Pos( LowerCase(Trim(param_Form)), LowerCase(Screen.Forms[var_Contador].Name) ) > 0 then
    begin
      Result := true;
      Break;
    end;
  end;

end;

function UTI_GEN_Format_Fecha_Hora( param_Fecha : TDateTime;
                                    param_Devolver_Segundos : Boolean ) : ShortString;
var var_CN_Conexion : Trecord_CN_Conexion;
begin
    var_CN_Conexion := UTI_INI_Configuracion_Inicio;
    if var_CN_Conexion.con_Exito = False then UTI_GEN_Salir;

    if UpperCase(Copy(var_CN_Conexion.ConnectorType, 1, 5)) = UpperCase('MySQL') then
    begin
        if param_Devolver_Segundos = true then
        begin
            Result := FormatDateTime( 'yyyy-mm-dd hh:nn:ss', param_Fecha );
        end else begin
            Result := FormatDateTime( 'yyyy-mm-dd', param_Fecha );
        end;
    end;
end;


procedure UTI_GEN_Salir;
// var var_msg : TStrings;
begin
    with form_Menu do
    begin
        try
           Timer_Sin_Usar.Enabled := false;
           public_Salir_OK := True;

         { var_msg := TStringList.Create;
           var_msg.Add('ESTAMOS SALIENDO FORZADAMENTE POR UN ERROR.');
           var_msg.Add(' ');
           var_msg.Add('Compruébelo en el fichero .log.');
           UTI_GEN_Aviso(true, var_msg, 'FALLO', True, False);
           var_msg.Free; }

           Application.Terminate;  { No puedo poner Close, tiene que ser Application.Terminate }
        Except
           on E: Exception do
           begin
                ShowMessage('Error! ' + E.Message);
                raise;
           end;
        end;
    end;
end;

procedure UTI_GEN_ver_direccion_en_Internet;
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('NO SE HA REALIZADO CONEXION CON EL SERVIDOR DE MAPAS.-');
    UTI_GEN_Aviso(true, var_msg, 'FALLO', True, False);
    var_msg.Free;
end;


procedure UTI_GEN_Visitar_Situl;
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('NO SE PUDO ENCONTRAR ESTE SITE.-');
    UTI_GEN_Aviso(true, var_msg, 'FALLO', True, False);
    var_msg.Free;
end;

procedure UTI_GEN_Enviar_eMAIL;
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('NO SE HA REALIZADO CONEXION CON EL SERVIDOR DE CORREO.-');
    UTI_GEN_Aviso(true, var_msg, 'FALLO', True, False);
    var_msg.Free;
end;

procedure UTI_GEN_Enviar_SMS;
var var_msg : TStrings;
begin
    var_msg := TStringList.Create;
    var_msg.Add('NO SE HA REALIZADO CONEXION CON EL PUERTO RS232.-');
    UTI_GEN_Aviso(true, var_msg, 'FALLO', True, False);
    var_msg.Free;
end;

// Esta funcion nos permite guardar mensajes en un .log
procedure UTI_GEN_Log(param_msg : String);
var var_F              : TextFile;
    var_nombre_Fichero : String;
    var_SearchRec      : TSearchRec;
    var_Usuario        : ShortString;
begin
    if Trim(form_Menu.public_User_Descripcion_Nick) <> '' then
         var_Usuario := ' - ' + Trim(form_Menu.public_User_Descripcion_Nick)
    else var_Usuario := '';

    // Damos formato al param_msg
    param_msg          := FormatDateTime('[ddd dd mmm, hh:nn:ss]', Now) +
                          Trim(var_Usuario) +
                          ' ... ' +
                          param_msg;

    var_nombre_Fichero := ChangeFileExt(ParamStr(0), '.log');

  { Comenzamos el bloqueo  . la variable global se crea para evitar que cuando se trabajen
    con threads ... que dos partes del programa intenten trabajar con el fichero log }
    var_Global_CriticalSection.Enter;

    try
        if FindFirst(var_nombre_Fichero, faArchive, var_SearchRec) = 0 then
        begin
             // Comprobamos el tamaño de .log
             if var_SearchRec.Size > (1024*1024) then
             begin
                  // Y si es mayor de 1 MB lo renombramos
                  RenameFile( var_nombre_Fichero,
                              var_nombre_Fichero +
                              FormatDateTime('_YYYY_MM_DD-hh_nn_ss', Now) );
            end;
            FindClose(var_SearchRec);
        end;

        // Aqui abrimos el archivo si existe, o lo creamos sino existe
        AssignFile(var_F, var_nombre_Fichero);
        {$I-}
             Append(var_F);
             if IOResult <> 0 then Rewrite(var_F);
        {$I+}

        if IOResult = 0 then
        begin
          // Escribimos el param_msg
          Writeln( var_F, param_msg );
          CloseFile(var_F);
        end;
    finally
        // Terminamos el bloqueo
        var_Global_CriticalSection.Leave;
    end;
end;

function UTI_GEN_Comillas(param_Frase : string) : string;
begin
     Result := AnsiQuotedStr(param_Frase, '"');
end;

procedure UTI_GEN_Dibujar_Grid( param_Sender: TObject;
                                param_SQLQuery : TSQLQuery;
                                param_Rect: TRect;
                                param_DataCol: Integer;
                                param_Column: TColumn;
                                param_State: TGridDrawState );
var var_Color_Normal : TColor;
begin
    with param_Sender as TDBGrid do
    begin
        if param_SQLQuery.RecordCount = 0 then Exit;

        var_Color_Normal := Canvas.Brush.Color;

      { ************************************************************************
        Primero comprobamos si es un registro dado de baja o no
        ************************************************************************ }
        if not param_SQLQuery.FieldByName('Del_WHEN').IsNull then
            begin
              { ****************************************************************
                Registro DADO de BAJA
                **************************************************************** }
                Canvas.Font.Color := clSilver;
            end
        else
            begin
              { ****************************************************************
                Registro DADO de ALTA, NO BAJA
                ****************************************************************
                Así que las pinto, pero sólo si no son las columnas que van a
                ser dibujadas
                **************************************************************** }
                if param_State <> [gdSelected] then
                begin
                    if (param_Column.FieldName <> 'COLUMNA_CON_IMAGEN') then
                    begin
                        Canvas.font.Color := clBlack;
                    end;
                end;
            end;

      { ************************************************************************
        Ahora paso a dibujar una celda normal con los colores elegidos o una
        dibujada
        ************************************************************************ }
        if (param_Column.FieldName <> 'COLUMNA_CON_IMAGEN') then
            begin
              { ****************************************************************
                No es una de las columnas a dibujar por lo que la pinto con los
                colores elegidos
                **************************************************************** }
                DefaultDrawColumnCell(param_Rect, param_DataCol, param_Column, param_State)
            end
        else
            begin
              { ****************************************************************
                Es una de las columnas a dibujar
                **************************************************************** }
                // COLUMNA CONFIRMADA
                if param_Column.FieldName = 'COLUMNA_CON_IMAGEN'  then
                begin
                    {
                    if Trim(param_SQLQuery.FieldByName('id_medio').asString) = '1' then
                    begin
                        Canvas.StretchDraw(param_Rect, Image_Confirmado.Picture.Graphic);
                    end;
                    }
                end;
            end;

        Canvas.Font.Color := var_Color_Normal;
    end;
end;

function UTI_GEN_Format_Numero( param_Numero : ShortString ) : ShortString;
var var_CN_Conexion    : Trecord_CN_Conexion;
    var_Antes_Quitarlo : ShortString;
begin
    // ********************************************************************************************* //
    // ** mySQL graba los decimales con punto en vez de con coma .... asi  que quito toda coma,   ** //
    // ** menos la última que la convierto a un punto para los decimales                          ** //
    // ********************************************************************************************* //
    var_CN_Conexion := UTI_INI_Configuracion_Inicio;
    if var_CN_Conexion.con_Exito = False then UTI_GEN_Salir;

    if UpperCase(Copy(var_CN_Conexion.ConnectorType, 1, 5)) = UpperCase('MySQL') then
    begin
        while Pos(',', param_Numero) > 0 do
        begin
            // ************************************************************************************* //
            // ** Quito todas las comas                                                           ** //
            // ************************************************************************************* //
            var_Antes_Quitarlo := param_Numero;
            param_Numero := Copy( param_Numero, 1, Pos( ',', param_Numero) -1 ) +
                             // '.' +
                             Copy( param_Numero,
                                   Pos( ',', param_Numero) + 1,
                                   length(param_Numero) - Pos(',', param_Numero) );

            // ************************************************************************************* //
            // ** Si no hay más comas, significa que la última hay que cambiarla por un punto, en ** //
            // ** vez de quitarla                                                                 ** //
            // ************************************************************************************* //
            if Pos(',', param_Numero) = 0 then
            begin
                param_Numero := var_Antes_Quitarlo;
                param_Numero := Copy( param_Numero, 1, Pos( ',', param_Numero) -1 ) +
                                 '.' +
                                 Copy( param_Numero,
                                       Pos( ',', param_Numero) + 1,
                                       length(param_Numero) - Pos(',', param_Numero) );
            end;
        end;
    end;

    Result := param_Numero;
end;

function UTI_GEN_Cut_to_3_Decimal( param_Importe : String ) : String;
var var_Parte_Entera : String;
    var_Decimal_1    : Byte;
    var_Decimal_2    : Byte;
    var_Decimal_3    : Byte;
    var_ande_sta     : Byte;
begin
    // ********************************************************************************************* //
    // ** Primero quitamos el separador ThousandSeparator de el importe pasado, pues nos daría un ** //
    // ** error al devolverlo o tratarlo                                                          ** //
    // ********************************************************************************************* //
    var_ande_sta := Pos( DefaultFormatSettings.ThousandSeparator, param_Importe );
    While var_ande_sta > 0 do
    begin
        param_Importe := Copy( param_Importe,
                                  1,
                                  (var_ande_sta - 1) ) +

                         Copy( param_Importe,
                               (var_ande_sta + 1),
                               (length(param_Importe) - var_ande_sta) );

        var_ande_sta := Pos( DefaultFormatSettings.ThousandSeparator, param_Importe );
    end;

    // ********************************************************************************************* //
    // ** Ponemos a 0 los valores del primero, segundo y tercero decimal.                         ** //
    // ********************************************************************************************* //
    var_Decimal_1 := 0;
    var_Decimal_2 := 0;
    var_Decimal_3 := 0;

    // ********************************************************************************************* //
    // ** Guardamos la posición de la coma (,) ... en españa (.)                                  ** //
    // ********************************************************************************************* //
    var_ande_sta := Pos( DefaultFormatSettings.DecimalSeparator, param_Importe );

    // ********************************************************************************************* //
    // ** Comprobamos si contiene la coma (,)                                                     ** //
    // ********************************************************************************************* //
    if  var_ande_sta > 0 then
    begin
        // ***************************************************************************************** //
        // ** Guardamos el numero entero en ( var_Parte_Entera ), es decir sin decimales          ** //
        // ***************************************************************************************** //
        var_Parte_Entera := Copy( param_Importe,
                                  1,
                                  (var_ande_sta - 1) );

        // ***************************************************************************************** //
        // ** Guardamos los tres decimales, cada decimal en una variable ... pero solo si existe  ** //
        // ** este decimal                                                                        ** //
        // ***************************************************************************************** //
        if (var_ande_sta + 1) <= length(param_Importe) then
        begin
             var_Decimal_1 := StrToInt( param_Importe[ var_ande_sta + 1 ] );
        end;

        if (var_ande_sta + 2) <= length(param_Importe) then
        begin
             var_Decimal_2 := StrToInt( param_Importe[ var_ande_sta + 2 ] );
        end;

        if (var_ande_sta + 3) <= length(param_Importe) then
        begin
             var_Decimal_3 := StrToInt( param_Importe[ var_ande_sta + 3 ] );
        end;

        // ***************************************************************************************** //
        // ** Guardamos el ( var_Parte_Entera + var_Decimal_1 + var_Decimal_2 + var_Decimal_3 ) en** //
        // ** ( param_Importe )                                                                   ** //
        // ***************************************************************************************** //
        param_Importe := var_Parte_Entera +
                         '.' +
                         IntToStr( var_Decimal_1 ) +
                         IntToStr( var_Decimal_2 ) +
                         IntToStr( var_Decimal_3 );
    end;

    Result := param_Importe;
end;

Function UTI_GEN_Round_to_2_Decimal( param_Importe : String ) : String;
var var_Parte_Entera : String;
    var_Decimal_1    : Byte;
    var_Decimal_2    : Byte;
    var_Decimal_3    : Byte;
    var_ande_sta     : Byte;
begin
    // ********************************************************************************************* //
    // ** Primero quitamos el separador ThousandSeparator de el importe pasado, pues nos daría un ** //
    // ** error al devolverlo o tratarlo                                                          ** //
    // ********************************************************************************************* //
    var_ande_sta := Pos( DefaultFormatSettings.ThousandSeparator, param_Importe );
    While var_ande_sta > 0 do
    begin
        param_Importe := Copy( param_Importe,
                                  1,
                                  (var_ande_sta - 1) ) +

                         Copy( param_Importe,
                               (var_ande_sta + 1),
                               (length(param_Importe) - var_ande_sta) );

        var_ande_sta := Pos( DefaultFormatSettings.ThousandSeparator, param_Importe );
    end;

    // ********************************************************************************************* //
    // ** Ponemos a 0 los valores del primero, segundo y tercero decimal.                         ** //
    // ********************************************************************************************* //
    var_Decimal_1 := 0;
    var_Decimal_2 := 0;
    var_Decimal_3 := 0;

    // ********************************************************************************************* //
    // ** Guardamos la posición de la coma (,) ... en españa (.)                                  ** //
    // ********************************************************************************************* //
    var_ande_sta := Pos( DefaultFormatSettings.DecimalSeparator, param_Importe );

    // ********************************************************************************************* //
    // ** Comprobamos si contiene la coma (,)                                                     ** //
    // ********************************************************************************************* //
    if  var_ande_sta > 0 then
    begin
        // ***************************************************************************************** //
        // ** Guardamos el numero entero en ( var_Parte_Entera ), es decir sin decimales          ** //
        // ***************************************************************************************** //
        var_Parte_Entera := Copy( param_Importe,
                                  1,
                                  (var_ande_sta - 1) );

        // ***************************************************************************************** //
        // ** Guardamos los tres decimales, cada decimal en una variable ... pero solo si existe  ** //
        // ** este decimal                                                                        ** //
        // ***************************************************************************************** //
        if (var_ande_sta + 1) <= length(param_Importe) then
        begin
             var_Decimal_1 := StrToInt( param_Importe[ var_ande_sta + 1 ] );
        end;

        if (var_ande_sta + 2) <= length(param_Importe) then
        begin
             var_Decimal_2 := StrToInt( param_Importe[ var_ande_sta + 2 ] );
        end;

        if (var_ande_sta + 3) <= length(param_Importe) then
        begin
             var_Decimal_3 := StrToInt( param_Importe[ var_ande_sta + 3 ] );
        end;

        // ***************************************************************************************** //
        // ** Comprobar si la variable ( var_Decimal_3 ) es Mayor o igual que ( 5 )               ** //
        // si es Mayor aumentar 1 en ( var_Decimal_2 )                                            ** //
        // ***************************************************************************************** //
        if var_Decimal_3 >= 5 then
        begin
            Inc( var_Decimal_2 );
            if var_Decimal_2 > 9 then
            begin
                var_Decimal_2 := 0;
                Inc(var_Decimal_1);
                if var_Decimal_1 > 9 then
                begin
                    var_Decimal_1 := 0;
                    var_Parte_Entera := FloatToStr( StrToFloat(var_Parte_Entera) + 1 );
                end;
            end;
        end;

        // ***************************************************************************************** //
        // ** Guardamos el (var_Parte_Entera + var_Decimal_1 + var_Decimal_2) en (param_Importe)  ** //
        // ***************************************************************************************** //
        param_Importe := var_Parte_Entera + '.' + IntToStr( var_Decimal_1 ) + IntToStr( var_Decimal_2 );
    end;

    Result := param_Importe;
end;

function UTI_GEN_Comprobar_2_Fechas( param_Desde,
                                     param_Hasta : TDateTimePicker ) : Boolean;
begin
    Result := true;

    if (param_Desde.DateIsNull) and
       (param_Hasta.DateIsNull) then
    begin
        Result := true;
    end else begin
        if (param_Desde.DateIsNull) or
           (param_Hasta.DateIsNull) then
        begin
            Result := false;
        end else begin
            if param_Hasta.Date < param_Desde.Date then
            begin
                Result := false;
            end;
        end;
    end;
end;

function UTI_GEN_Aviso( param_Aviso : Boolean;
                        param_msg : TStrings;
                        param_Titulo : String;
                        param_BitBtn_Aceptar,
                        param_BitBtn_Cancelar : Boolean ) : Boolean;
// var var_Formito : tform_Avisos;
begin
  { ****************************************************************************
    Ejemplos:
        UTI_GEN_Aviso(true,  'Para el codigo del trabajador NO EMPLEAR el signo -',
               '', True, False, True );

        if UTI_GEN_Aviso(true,  '¿SOLO EL tipo de personal ELEGIDO S/N?',
                  '', True, True, True ) = True then
        begin
        end;

    ****************************************************************************
    Ejemplos .... llamando desde fuera de esta opción:
    ****************************************************************************
        Application.CreateForm(tform_Avisos, form_Avisos);
        form_Avisos.Memo_Aviso.Lines.Clear;
        form_Avisos.Memo_Aviso.Lines.Add('-. IMAGEN CAPTURADA .-');
        form_Avisos.Show;
        form_Avisos.Repaint;
    ****************************************************************************
        Application.CreateForm(tform_Avisos, form_Avisos);
        form_Avisos.Memo_Aviso.Lines.Clear;
        form_Avisos.Memo_Aviso.Lines.Add('-. IMAGEN CAPTURADA .-');
        form_Avisos.Show;
        form_Avisos.Repaint;
        for Contador := 1 to 999999999 do
        begin
            // Contador de tiempo //
        end;
        form_Avisos.Free;
    **************************************************************************** }

    // var_Formito := tform_Avisos.Create(nil);
    Application.CreateForm(tform_Avisos, form_Avisos);

    with form_Avisos do
    begin
        Memo_Aviso.Lines.Clear;

        if Trim(param_msg.Text) <> '' then Memo_Aviso.Lines.AddStrings(param_msg);

        with ButtonPanel_Avisos do
        begin
            ShowButtons := [];

            if (param_BitBtn_Aceptar = True) and
               (param_BitBtn_Cancelar = True) then
            begin
                ShowButtons := [pbOK,pbCancel];
                DefaultButton := pbOK;
            end else begin
                if param_BitBtn_Aceptar = True then
                begin
                    ShowButtons := [pbOK];
                    DefaultButton := pbOK;
                end;

                if param_BitBtn_Cancelar = True then
                begin
                    ShowButtons := [pbCancel];
                    DefaultButton := pbCancel;
                end;
            end;

            if Trim(param_Titulo) <> '' then
            begin
                Caption := Trim(param_Titulo);
            end;
        end;

        if param_Aviso = true then
        begin
            Memo_Aviso.Color := $005B5BFF; // casi rojo
        end else begin
            Memo_Aviso.Color := $008CB46B; // casi verde
        end;

        ShowModal;
        if public_Pulso_Aceptar = true then
             Result := True
        else Result := False;

        Free;
    end;
end;

function UTI_GEN_Copiar_Fichero( param_Path_Lectura,
                                 param_Path_Conservacion,
                                 param_Name_File_Lectura,
                                 param_Name_File_Conservacion,
                                 param_Borrar_Fichero_SN : String ) : String;
var var_Origen   : File of byte;
    var_Destino  : File of byte;
    var_Buffer   : Array[0..4096] of Char;
    var_Leidos   : Integer;
    var_Longitud : LongInt;
begin
    if ( Trim(param_Path_Lectura) = '' )           or
       ( Trim(param_Path_Conservacion) = '' )      or
       ( Trim(param_Name_File_Lectura) = '' )      or
       ( Trim(param_Name_File_Conservacion) = '' ) or
       ( Trim(param_Borrar_Fichero_SN) = '' )      then
    begin
        Result := 'No se pudo copiar el fichero por falta de parámetros.';
        Exit;
    end;

    try
        // ***************************************************************************************** //
        // ** Abrimos fichero Origen y Destino                                                    ** //
        // ***************************************************************************************** //
        if Copy( Trim(param_Path_Lectura),
                 length(Trim(param_Path_Lectura)),
                 1 ) <> '\' then
        begin
            param_Path_Lectura := Trim(param_Path_Lectura) + '\';
        end;

        AssignFile( var_Origen,
                    Trim(param_Path_Lectura) + Trim(param_Name_File_Lectura) );

        Reset(var_Origen);

        if Copy( Trim(param_Path_Conservacion),
                 length(Trim(param_Path_Conservacion)),
                 1 ) <> '\' then
        begin
            param_Path_Conservacion := Trim(param_Path_Conservacion) + '\';
        end;

        AssignFile( var_Destino,
                    Trim(param_Path_Conservacion) + Trim(param_Name_File_Conservacion) );

        ReWrite(var_Destino);

        // ***************************************************************************************** //
        // ** Hallamos la longitud del fichero a copiar                                           ** //
        // ***************************************************************************************** //
        var_Longitud := FileSize(var_Origen);

        // ***************************************************************************************** //
        // ** Actualizamos limites de la ProgressBar y la llamamos                                ** //
        // ***************************************************************************************** //
        Application.CreateForm(tform_barra_progreso, form_barra_progreso);

        form_barra_progreso.Caption := 'COPIANDO.-';
        form_barra_progreso.ProgressBar_Principal.Visible  := True;

        form_barra_progreso.ProgressBar_Principal.Max      := var_Longitud;
        form_barra_progreso.ProgressBar_Principal.Min      := 0;
        form_barra_progreso.ProgressBar_Principal.Position := 0;

        form_barra_progreso.Show;
        form_barra_progreso.Repaint;

        Application.ProcessMessages;

        // ***************************************************************************************** //
        // ** Recorremos el fichero leyendolo por bloques y lo grabamos                           ** //
        // ***************************************************************************************** //
        while var_Longitud > 0 do
        begin
            BlockRead(var_Origen, var_Buffer[0], SizeOf(var_Buffer), var_Leidos);
            var_Longitud := var_Longitud - var_Leidos;
            BlockWrite(var_Destino, var_Buffer[0], var_Leidos);

            with form_barra_progreso do
            begin
                ProgressBar_Principal.Position := ProgressBar_Principal.Position + var_Leidos;
                ProgressBar_Principal.Repaint;
            end;

            Application.ProcessMessages;
        end;

        // ***************************************************************************************** //
        // ** Cerramos los ficheros                                                               ** //
        // ***************************************************************************************** //
        CloseFile(var_Origen);
        CloseFile(var_Destino);

        form_barra_progreso.Free;

        // ***************************************************************************************** //
        // ** Compruebo los dos ficheros para ver si son iguales                                  ** //
        // ***************************************************************************************** //
        Result := UTI_GEN_Comprobar_2_Ficheros( param_Path_Lectura,
                                                param_Path_Conservacion,
                                                param_Name_File_Lectura,
                                                param_Name_File_Conservacion );
        if Trim(Result) = '' then
        begin
            // ************************************************************************************* //
            // ** La comprobación de ficheros ha sido correcta. Así que procedemos a borrar el de ** //
            // ** origen, pero solo si me lo han pedido                                           ** //
            // ************************************************************************************* //
            if Trim(UpperCase(param_Borrar_Fichero_SN)) = 'S' then
            begin
                Result := UTI_GEN_Borrar_Fichero(param_Path_Lectura, param_Name_File_Lectura)
            end else begin
                Result := '';
            end;
        end else begin
            Result := 'El fichero de origen y el de destino son diferentes, así que no se borrará' +
                      ' el de origen';
        end;
    except
        Result := 'Se produjo un error durante la copia del fichero';
    end;
end;

function UTI_GEN_Comprobar_2_Ficheros( param_path_File_1,
                                       param_path_File_2,
                                       param_name_File_1,
                                       param_name_File_2 : String ) : String;
var var_Fichero_1  : File of byte;
    var_Fichero_2  : File of byte;
    var_Buffer_1   : Array[0..4096] of Char;
    var_Buffer_2   : Array[0..4096] of Char;
    var_Leidos_1   : Integer;
    var_Leidos_2   : Integer;
    var_Longitud_1 : LongInt;
    var_Longitud_2 : LongInt;
begin
    if ( Trim(param_path_File_1) = '' ) or
       ( Trim(param_path_File_2) = '' ) or
       ( Trim(param_name_File_1) = '' ) or
       ( Trim(param_name_File_2) = '' ) then
    begin
        Result := 'No se pudo comparar los dos ficheros por falta de parámetros.';
        Exit;
    end;

    try
        // ***************************************************************************************** //
        // ** Abrimos los dos ficheros                                                            ** //
        // ***************************************************************************************** //
        if Copy( Trim(param_path_File_1),
                 length(Trim(param_path_File_1)),
                 1 ) <> '\' then
        begin
            param_path_File_1 := Trim(param_path_File_1) + '\';
        end;

        AssignFile( var_Fichero_1, Trim(param_path_File_1) + Trim(param_name_File_1) );
        Reset(var_Fichero_1);

        if Copy( Trim(param_path_File_2),
                 length(Trim(param_path_File_2)),
                 1 ) <> '\' then
        begin
            param_path_File_2 := Trim(param_path_File_2) + '\';
        end;

        AssignFile(var_Fichero_2, Trim(param_path_File_2) + Trim(param_name_File_2));
        Reset(var_Fichero_2);

        // ***************************************************************************************** //
        // ** Hallamos la longitud del fichero a copiar                                           ** //
        // ***************************************************************************************** //
        var_Longitud_1 := FileSize(var_Fichero_1);
        var_Longitud_2 := FileSize(var_Fichero_2);

        if var_Longitud_1 <> var_Longitud_2 then
        begin
            Result := 'El tamaño de los dos ficheros a comparar son diferentes.';
        end
        else begin
            Application.CreateForm(tform_barra_progreso, form_barra_progreso);

            form_barra_progreso.Caption := 'COMPROBANDO.-';
            form_barra_progreso.ProgressBar_Principal.Visible  := True;

            form_barra_progreso.ProgressBar_Principal.Max      := var_Longitud_1;
            form_barra_progreso.ProgressBar_Principal.Min      := 0;
            form_barra_progreso.ProgressBar_Principal.Position := 0;

            form_barra_progreso.Show;
            form_barra_progreso.Repaint;

            Application.ProcessMessages;

            // ************************************************************************************* //
            // ** Actualizamos limites de la ProgressBar                                          ** //
            // ************************************************************************************* //
            while var_Longitud_1 > 0 do
            begin
                BlockRead(var_Fichero_1, var_Buffer_1[0], SizeOf(var_Buffer_1), var_Leidos_1);
                var_Longitud_1 := var_Longitud_1 - var_Leidos_1;
                BlockRead(var_Fichero_2, var_Buffer_2[0], SizeOf(var_Buffer_2), var_Leidos_2);
                if var_Buffer_1 <> var_Buffer_2 then
                    begin
                        Result := 'Se leyeron dos bloques de los ficheros y no son iguales.';
                    end
                else Result := '';

                with form_barra_progreso do
                begin
                    ProgressBar_Principal.Position := ProgressBar_Principal.Position + var_Leidos_1;
                    ProgressBar_Principal.Repaint;
                end;

                Application.ProcessMessages;
            end;

            // ************************************************************************************* //
            // ** Cerramos los ficheros                                                           ** //
            // ************************************************************************************* //
            CloseFile(var_Fichero_1);
            CloseFile(var_Fichero_2);

            form_barra_progreso.Free;
        end;
    except
        Result := 'Se produjo un error durante la comprobación de los dos ficheros.';
    end;
end;

function UTI_GEN_Borrar_Fichero( param_Path,
                                 param_Fichero: String ) : String;
begin
    if (Trim(param_Path) = '')    or
       (Trim(param_Fichero) = '') then
    begin
        Result := 'No se pudo borrar el fichero por falta de parámetros.';
        Exit;
    end;

    if Copy( Trim(param_Path),
             length(Trim(param_Path)),
             1 ) <> '\' then
    begin
        param_Path := Trim(param_Path) + '\';
    end;

    if DeleteFile( Pchar(Trim(param_Path) + Trim(param_Fichero)) ) then
    begin
        Result := '';
    end else begin
        Result := 'No se pudo borrar el fichero: ' + Trim(param_Path) + Trim(param_Fichero);
    end;
end;

procedure UTI_GEN_Cambiar_Idioma( param_Idioma : ShortString );
begin
    SetDefaultLang(param_Idioma);
    with form_Menu do
    begin
        Presentar_Titulo_form_Menu_Principal;
        Que_Menus_Tiene_Permisos;
        Repaint;
    end;
end;

procedure UTI_GEN_Informes( param_Ordenado_por : String;
                            param_Tabla : TSQLQuery;
                            param_Ds_Maestro,
                            param_Ds_Detalle,
                            param_Ds_Detalle_2,
                            param_Ds_Detalle_3 : TDataSource;
                            param_Menu_Worked : Integer;
                            param_Solo_Ver : Boolean;
                            param_id_empresas,
                            param_Impuesto_Comun : String;
                            param_Ficheros : TStrings );
var var_msg                     : TStrings;
    var_Informes_nombre_Fichero : TStrings;
    var_Informes_Descripcion    : TStrings;
    var_id_AndeTaba             : Int64;
    var_form_Informe            : Tform_Informe;
    var_Linea                   : Integer;
    var_Str                     : String;
    var_Empieza_en              : Integer;
    var_Fichero                 : String;
begin
  var_Informes_nombre_Fichero := TStringList.Create;
  var_Informes_Descripcion    := TStringList.Create;

  // ********************************************************************************************* //
  // ** Si no se tienen permisos o solo se permite la visualización pues no se imprime          ** //
  // ********************************************************************************************* //
  if UTI_USR_Permiso_SN(param_Menu_Worked, 'I', True) = false then
  begin
    Exit;
  end else
  begin
    // ***************************************************************************************** //
    // ** Comprobamos si sólo se llamó para ser observado                                     ** //
    // ***************************************************************************************** //
    if param_Solo_Ver = True then
    begin
      var_msg := TStringList.Create;
      var_msg.Add(rs_Solo_Visualizar);
      UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
      var_msg.Free;

      Exit;
    end;
  end;

  // ********************************************************************************************* //
  // ** Si no se pasaron ficheros pues no imprimimos nada                                       ** //
  // ********************************************************************************************* //
  if param_Ficheros.Count = 0 then
  begin
    // ***************************************************************************************** //
    // ** Resulta que no se le pasaron los ficheros, asi que puede ser que tenga que traerlos ** //
    // ** de la tabla informes. Para ello tengo que usar param_Menu_Worked para id_Menus de la** //
    // ** tabla informes                                                                      ** //
    // ***************************************************************************************** //
    UTI_INFORMES_Traer_Informes_por_Modulo( param_Menu_Worked,
                                            var_Informes_nombre_Fichero,
                                            var_Informes_Descripcion );

    if var_Informes_nombre_Fichero.Count = 0 then
    begin
      // ************************************************************************************* //
      // ** Resulta que la tabla informes tampoco tiene ningún fichero asociado al módulo   ** //
      // ** que se pasó a param_Menu_Worked                                                 ** //
      // ************************************************************************************* //
      Exit;
    end;
  end;

  if param_Ds_Maestro = Nil then
  begin
    Exit;
  end;

  // ********************************************************************************************* //
  // ** Pasamos a llamar el informe                                                             ** //
  // ********************************************************************************************* //
  var_form_Informe := Tform_Informe.Create(nil);

  // ********************************************************************************************* //
  // ** Configuramos la descripción del impuesto común. Esto es solo para empresas que trabajen ** //
  // ** con un solo tipo de impuesto                                                            ** //
  // ********************************************************************************************* //
  var_form_Informe.public_Impuesto_Comun := param_Impuesto_Comun;

  // ********************************************************************************************* //
  // ** Configuramos el título del listado                                                      ** //
  // ********************************************************************************************* //
  var_form_Informe.public_Ordenado_por := param_Ordenado_por;

  // ********************************************************************************************* //
  // ** Guardamos el valor de la id donde se encontraba antes del listado, y nos posiciona-     ** //
  // ** remos sobre el primer registro. Esto lo hacemos porque cuando tratamos con manteni-     ** //
  // ** mientos de tablas master detail nos da problemas                                        ** //
  // ********************************************************************************************* //
  var_id_AndeTaba := 0;
  with param_Tabla do
  begin
    var_id_AndeTaba := FieldByName('id').Value;
  end;

  // ********************************************************************************************* //
  // ** Si se le ha pasado la id de la empresa pues se la pasamos al informe para que imprima el** //
  // ** logotipo correspondiente a la empresa                                                   ** //
  // ********************************************************************************************* //
  if Trim(param_id_empresas) <> '' then
  begin
    var_form_Informe.public_id_empresas := param_id_empresas;
  end;

  with var_form_Informe do
  begin
    // ********************************************************************************************* //
    // ** Continuamos con el listado                                                              ** //
    // ********************************************************************************************* //
    frDBDataSet_Maestro.DataSource   := param_Ds_Maestro;
    frDBDataSet_Detalle.DataSource   := param_Ds_Detalle;
    frDBDataSet_Detalle_2.DataSource := param_Ds_Detalle_2;
    frDBDataSet_Detalle_3.DataSource := param_Ds_Detalle_3;
    public_Menu_Worked               := param_Menu_Worked;

    if param_Ficheros.Count > 0 then
    begin
      // ************************************************************************************* //
      // ** Este era el método old, el que pasaba los ficheros mediante un TStrings         ** //
      // ** Con el tiempo tengo que quitarlo y el param_Ficheros quitarlo de todas las      ** //
      // ** llamadas a esta función                                                         ** //
      // ************************************************************************************* //
      for var_Linea := 1 to param_Ficheros.Count do
      begin
        ListBox_a_Listar_Visible_NO.Items.Add(param_Ficheros.Strings[var_Linea - 1]);

        // ************************************************************************************* //
        // ** Comprobamos si es sólo un registro el que hay que imprimir. Si lo es, traemos   ** //
        // ** solo el nombre real del fichero                                                 ** //
        // ************************************************************************************* //
        var_Str        := param_Ficheros.Strings[var_Linea - 1];
        var_Empieza_en := Pos( '{[#RGTRO#]}', var_Str );

        var_Fichero    := var_Str;
        if var_Empieza_en > 0 then
        begin
          var_Fichero := Copy( var_Str, 1, (var_Empieza_en - 1) );
        end;

        ListBox_a_Listar_Visible_SI.Items.Add(var_Fichero);
      end;
    end else
    begin
      for var_Linea := 1 to var_Informes_Descripcion.Count do
      begin
        ListBox_a_Listar_Visible_NO.Items.Add(var_Informes_nombre_Fichero.Strings[var_Linea - 1]);
        ListBox_a_Listar_Visible_SI.Items.Add(Trim(var_Informes_Descripcion.Strings[var_Linea - 1]));
      end;
    end;

    LabeledEdit_Copias.Text := form_Menu.public_Impresora_Ctdad_Copias;

    ShowModal;

    if public_opcion > 0 then
    begin
      if ListBox_a_Listar_Visible_SI.Items.Count = 0 then
      begin
        // ********************************************************************************* //
        // ** No se le ha pasado ningún nombre de fichero para el informe a imprimir      ** //
        // ********************************************************************************* //
        var_msg := TStringList.Create;
        var_msg.Add('No se eligió ningún informe a imprimir');
        UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        var_msg.Free;

        Exit;
      end;

      // ************************************************************************************* //
      // ** Comprobamos si es sólo un registro el que hay que imprimir. Si lo es, traemos el** //
      // ** nombre real del fichero y posicionamos tabla maestra sobre registro solicitado  ** //
      // ************************************************************************************* //
      var_Str        := ListBox_a_Listar_Visible_NO.Items.Strings[ListBox_a_Listar_Visible_SI.ItemIndex];
      var_Empieza_en := Pos( '{[#RGTRO#]}', var_Str );

      var_Fichero    := var_Str;
      if var_Empieza_en > 0 then
      begin
        var_Fichero := Copy( var_Str, 1, (var_Empieza_en - 1) );
      end;

      // ************************************************************************************* //
      // ** Se trata de un listado grande por lo que nos ponemos al principio de todos sus  ** //
      // ** registros                                                                       ** //
      // ************************************************************************************* //
      if var_Empieza_en = 0 then
      begin
        param_Tabla.First;
      end;

      UTI_GEN_Informes_II( public_opcion,
                           frReport1,
                           var_Fichero,
                           public_Menu_Worked,
                           PrintDialog1,
                           LabeledEdit_Copias.Text );
    end;

    Free;
  end;

  // ********************************************************************************************* //
  // ** Se trata de un listado grande por lo que nos quedamos sobre el registro donde estaba    ** //
  // ********************************************************************************************* //
  if var_Empieza_en = 0 then
  begin
    param_Tabla.Locate( 'id', var_id_AndeTaba, [] );
  end;

  var_Informes_nombre_Fichero.Free;
  var_Informes_Descripcion.Free;
end;

procedure UTI_GEN_AclararFormatoHora;
begin

  DefaultFormatSettings.ShortTimeFormat {%H-} := 'hh:nn';
  DefaultFormatSettings.LongTimeFormat  {%H-} := 'hh:nn:ss';

  DefaultFormatSettings.TimeSeparator   {%H-} := ':';
end;

procedure UTI_GEN_AclararFormatoFecha;
begin
  DefaultFormatSettings.ShortDateFormat {%H-} := 'dd/mm/yyyy';
  DefaultFormatSettings.DateSeparator   {%H-} := '/';
end;

procedure UTI_GEN_AclararSeparadoresDecimales;
begin
  DefaultFormatSettings.DecimalSeparator  {%H-} := '.';
  DefaultFormatSettings.ThousandSeparator {%H-} := ',';

  { Ha quedado antigüo ...
    formatsettings.DecimalSeparator  := '.';
    formatsettings.ThousandSeparator := ','; }
end;

function UTI_GEN_Comprobar_Introducido_es_DiaHora( p_numero : String;
                                                   p_Texto_paraVer_siError : String ) : String;
var
  v_paraProbar : TDateTime;
begin
  Result := '';

  if p_numero = '' then Exit;

  UTI_GEN_AclararFormatoFecha;

  try
    v_paraProbar := StrToDateTime( p_numero, FormatSettings );

  except
    on e:exception do
    begin
      Result := '* El valor ' + p_numero + ' para ' + p_Texto_paraVer_siError + ' no es día + hora (dd/mm/yyy hh:mm:ss).';
    end;

  end;

end;

function UTI_GEN_Comprobar_Introducido_es_Dia( p_numero : String;
                                               p_Texto_paraVer_siError : String ) : String;
var
  v_paraProbar : TDate;
begin
  Result := '';

  if p_numero = '' then Exit;

  UTI_GEN_AclararFormatoFecha;

  try
    v_paraProbar := StrToDate( p_numero, FormatSettings );

  except
    on e:exception do
    begin
      Result := '* El valor ' + p_numero + ' para ' + p_Texto_paraVer_siError + ' no es día (dd/mm/yyy).';
    end;

  end;

end;

function UTI_GEN_Comprobar_Introducido_es_Hora( p_numero : String;
                                                p_Texto_paraVer_siError : String ) : String;
var
  v_paraProbar : TTime;
begin
  Result := '' ;

  if p_numero = '' then Exit;

  UTI_GEN_AclararFormatoHora;

  try
    v_paraProbar := StrToTime( p_numero, FormatSettings );

  except
    on e:exception do
    begin
      Result := '* El valor ' + p_numero + ' para ' + p_Texto_paraVer_siError + ' no es hora (hh:mm:ss).';
    end;

  end;

end;

function UTI_GEN_Comprobar_Introducido_es_Numero( p_numero : String;
                                                  p_Texto_paraVer_siError : String ) : String;
var
  v_paraProbar : Currency;
begin
  Result := '';

  if p_numero = '' then Exit;

  UTI_GEN_AclararSeparadoresDecimales;

  try
    v_paraProbar := StrToCurr( p_numero, FormatSettings );

  except
    on e:exception do // writeln (e.message);
    begin
      Result := '* El valor ' + p_numero + ' para ' + p_Texto_paraVer_siError + ' no es numérico.';
    end;

  end;

end;

procedure UTI_GEN_Informes_II( p_opcion : ShortInt;
                               p_frReport : TfrReport;
                               p_Fichero : String;
                               p_Menu_Worked : Integer;
                               p_PrintDialog : TPrintDialog;
                               p_Copias : String );
var var_Impresora_Predeterminada : TImpresora_Predeterminada;
    var_Impresora                : String;
    var_DesdePagina              : Integer;
    var_HastaPagina              : Integer;
    var_Ctdad_Copias             : Integer;
    var_Contador                 : Integer;
    var_msg                      : TStrings;
begin
    // ************************************************************************************* //
    // ** Vista previa                                                                    ** //
    // ************************************************************************************* //
    if p_opcion = 1 then
    begin
      try
        p_frReport.LoadFromFile( form_menu.public_path_listados + p_Fichero );
        p_frReport.ShowReport;
      Except
       on error : Exception do
       begin
         UTI_GEN_Error_Log( 'Error al hacer la vista previa del informe ' +
                            p_Fichero + ' desde el módulo ' + Screen.ActiveForm.Name,
                            error );
       end;
      end;
    end;

    // ************************************************************************************* //
    // ** Vista diseño                                                                    ** //
    // ************************************************************************************* //
    if p_opcion = 2 then
    begin
      if UTI_USR_Permiso_SN(p_Menu_Worked, 'ID', True) = True then // permiso para diseñar informes
      begin
        try
          p_frReport.LoadFromFile( form_menu.public_path_listados + p_Fichero );
          p_frReport.DesignReport;
        Except
          on error : Exception do
          begin
            UTI_GEN_Error_Log( 'Error al intentar modificar el diseño del informe ' +
                               p_Fichero + ' desde el módulo ' + Screen.ActiveForm.Name,
                               error );
          end;
        end;
      end;
    end;

    // ************************************************************************************* //
    // ** Informe sobre impresora                                                         ** //
    // ************************************************************************************* //
    if p_opcion = 3 then
    begin
      try
        // ***************************************************************************** //
        // ** Carga la definición del reporte desde la carpeta de la aplicación       ** //
        // ***************************************************************************** //
        // ** AppDirectory := ExtractFilePath(ParamStr(0));                           ** //
        // ***************************************************************************** //
        p_frReport.LoadFromFile( form_menu.public_path_listados + p_Fichero );

        // ***************************************************************************** //
        // ** Hay que realizar un seguimiento de qué impresora se seleccionó original-** //
        // ** mente para comprobar los cambios del usuario                            ** //
        // ***************************************************************************** //
        // ** Así que nos traemos el número de la impresora predeterminada            ** //
        // ***************************************************************************** //
        var_Impresora := UTI_IMPRESORAS_Devolver_Numero_Impresora(form_Menu.public_Impresora_descripcion_Elegida);
        if Trim(var_Impresora) = '' then
        begin
          // ************************************************************************************* //
          // ** Todavía no hay ninguna impresora en fichero .ini ni predeterminada. Así que la  ** //
          // ** elijo de una de las impresoras del sistema                                      ** //
          // ************************************************************************************* //
          var_Impresora_Predeterminada := UTI_IMPRESORAS_Elegir_Impresora;
          if UpperCase(var_Impresora_Predeterminada.Error) = 'N' then
          begin
            var_Impresora := UTI_IMPRESORAS_Devolver_Numero_Impresora(var_Impresora_Predeterminada.Impresora_descripcion_Elegida);
          end;

        end;

        if Trim(var_Impresora) <> '' then
        begin
          // ************************************************************************************* //
          // ** Se eligió una impresora, así que paso al sistema cual es la impresora elegida   ** //
          // ************************************************************************************* //
          Printer.PrinterIndex := StrToInt(var_Impresora);

          // ************************************************************************************* //
          // ** Prepara el informe y se detiene si hay un error                                 ** //
          // ************************************************************************************* //
          if not p_frReport.PrepareReport then
          begin
            Exit;
          end;

          // ************************************************************************************* //
          // ** Configura el diálogo con algunos parámetros por defecto(como las copias)        ** //
          // ************************************************************************************* //
          with p_PrintDialog do
          begin
            Options         := [poPageNums ];                     { permite seleccionar páginas }
            Copies          := StrToInt(p_Copias);                { Ctdad. de copias }
            Collate         := True;                              { copias ordenadas }
            var_DesdePagina := 1;                                 { página de inicio }
            var_HastaPagina := p_frReport.EMFPages.Count;        { última página }
            MaxPage         := p_frReport.EMFPages.Count;        { número máximo de páginas }

            // *********************************************************************************** //
            // ** Muestra el diálogo. Si tiene éxito, procesa el retorno del usuario.           ** //
            // *********************************************************************************** //
            if Execute then
            begin
              // ********************************************************************************* //
              // ** Si el usuario cambió la impresora, pues intentamos cambiarla                ** //
              // ********************************************************************************* //
              if (Printer.PrinterIndex <> StrToInt(Trim(var_Impresora)) )     or
                 p_frReport.CanRebuild { sólo si podemos cambiar el reporte }  or
                 p_frReport.ChangePrinter(StrToInt(Trim(var_Impresora)), Printer.PrinterIndex) then
              begin
                // ******************************************************************************* //
                // ** Reformatea para la nueva impresora                                        ** //
                // ******************************************************************************* //
                if not p_frReport.PrepareReport then
                begin
                  Exit;
                end;
              end else
              begin
                // ******************************************************************************* //
                // ** No pudimos cumplir con el cambio de impresora                             ** //
                // ******************************************************************************* //
                Exit;
              end;

              // ********************************************************************************* //
              // ** Si el usuario seleccionó un rango de páginas ...                            ** //
              // ********************************************************************************* //
              if p_PrintDialog.PrintRange = prPageNums then
              begin
                var_DesdePagina := p_PrintDialog.FromPage; { Primera página }
                var_HastaPagina := p_PrintDialog.ToPage; { Ultima página }
              end;

              Var_Ctdad_Copias := p_PrintDialog.Copies; { Número de copias }

              // ********************************************************************************* //
              // ** Imprime el reporte usando el número de páginas y copias indicado            ** //
              // ********************************************************************************* //
              for var_Contador := 1 to Var_Ctdad_Copias do
              begin
                p_frReport.PrintPreparedReport( IntToStr(var_DesdePagina) + '-' +
                                                IntToStr(var_HastaPagina),
                                                1 );
              end;
            end;
          end;

        end else
        begin
          var_msg := TStringList.Create;
          var_msg.Clear;
          var_msg.Add('No se pudo elegir una impresora.');
          UTI_GEN_Aviso(true, var_msg, rs_Falta, True, False);
          var_msg.Free;
        end;

      Except
        on error : Exception do
        begin
          UTI_GEN_Error_Log( 'Error al intentar imprimir el informe ' +
                            p_Fichero + ' desde el módulo ' + Screen.ActiveForm.Name,
                            error );
        end;
      End;

    end;

end;

initialization
  var_Global_CriticalSection := TCriticalSection.Create;
finalization
  var_Global_CriticalSection.Free;
end.





