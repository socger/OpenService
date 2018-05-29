unit utilidades_ini;

{$mode objfpc}{$H+}

interface

uses
  Controls, Forms, LazFileUtils, Classes, SysUtils, DB, sqldb, IniFiles, Dialogs, utilidades_general,
  StdCtrls, Graphics;

Const
  const_Path_Ini = '\ini\socger.ini';

type

  Trecord_Skin = record
      con_Exito                           : Boolean;

      DbGrid_Color                        : TColor;
      DbGrid_Color_AlternateColor         : TColor;
      DbGrid_Font_Color                   : TColor;

      DbGrid_Filtros_Color                : TColor;
      DbGrid_Filtros_Color_AlternateColor : TColor;
      DbGrid_Filtros_Font_Color           : TColor;

      DbMemo_Color                        : TColor;
      DbMemo_Font_Color                   : TColor;

      Memo_Color                          : TColor;
      Memo_Font_Color                     : TColor;

      Memo_Color_Filtros                  : TColor;
      Memo_Font_Color_Filtros             : TColor;

      Memo_Color_OrderBy                  : TColor;
      Memo_Font_Color_OrderBy             : TColor;

      Form_Color                          : TColor;
      Form_Color_Eligiendo                : TColor;

      DBEdit_Color                        : TColor;
      DBEdit_Font_Color                   : TColor;

      Edit_Color                          : TColor;
      Edit_Font_Color                     : TColor;

      DBDateTimePicker_Color              : TColor;
      DBDateTimePicker_Font_Color         : TColor;
  end;

  Trecord_CN_Conexion = record
      con_Exito                     : Boolean;
      ConnectorType                 : String;
      DatabaseName                  : String;
      HostName                      : String;
      Port                          : String;
      Password                      : String;
      UserName                      : String;
      min_no_Work                   : String;
      NumTerminal                   : String;
      Language                      : String;
      Impresora_descripcion_Elegida : String;
      Impresora_Ctdad_Copias        : String;
  end;

function  UTI_INI_Configuracion_Inicio : Trecord_CN_Conexion;
function  UTI_INI_Grabar_Idioma( param_Idioma : ShortString ) : Boolean;
function  UTI_INI_Configuracion_Skin : Trecord_Skin;

implementation

uses filtrar_registros, estado_registro, menu, utilidades_rgtro;

function UTI_INI_Configuracion_Inicio : Trecord_CN_Conexion;
var var_fichero_ini : TIniFile;
begin
    if (FileExists(GetCurrentDirUTF8 + const_Path_Ini)) then
    begin
        try
            var_fichero_ini                      := TIniFile.Create(GetCurrentDirUTF8 + const_Path_Ini);

            Result.con_Exito                     := true;
            Result.ConnectorType                 := var_fichero_ini.ReadString('HowConnectBD', 'ConnectorType', '');
            Result.DatabaseName                  := var_fichero_ini.ReadString('HowConnectBD', 'DatabaseName', '');
            Result.HostName                      := var_fichero_ini.ReadString('HowConnectBD', 'HostName', '');
            Result.Port                          := var_fichero_ini.ReadString('HowConnectBD', 'Port', '');
            Result.Password                      := var_fichero_ini.ReadString('HowConnectBD', 'Password', '');
            Result.UserName                      := var_fichero_ini.ReadString('HowConnectBD', 'UserName', '');

            Result.min_no_Work                   := var_fichero_ini.ReadString('Config', 'min_no_Work', '');
            Result.NumTerminal                   := var_fichero_ini.ReadString('Config', 'NumTerminal', '');
            Result.Language                      := var_fichero_ini.ReadString('Config', 'Language', '');

            Result.Impresora_descripcion_Elegida := var_fichero_ini.ReadString('Config', 'Impresora_descripcion_Elegida', '');
            Result.Impresora_Ctdad_Copias        := var_fichero_ini.ReadString('Config', 'Impresora_Ctdad_Copias', '');

            var_fichero_ini.Free;
        except
            on error : Exception do
            begin
                UTI_GEN_Error_Log( 'Error al ABRIR el fichero de CONFIGURACION' + ' desde ' +
                                   Screen.ActiveForm.Name,
                                   error );
                try
                    var_fichero_ini.Free;
                Except
                end;

                Result.con_Exito := False;
            end;
        end;
    end;
end;

function UTI_INI_Grabar_Idioma( param_Idioma : ShortString ) : Boolean;
var var_fichero_ini : TIniFile;
begin
    Result := true;
    try
        var_fichero_ini := TIniFile.Create(GetCurrentDirUTF8 + const_Path_Ini);

        var_fichero_ini.WriteString('Config', 'Language', param_Idioma);

        var_fichero_ini.Free;
    except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( 'Error al actualizar el idioma de la aplicación' + ' desde ' +
                               Screen.ActiveForm.Name,
                               error );
            try
                var_fichero_ini.Free;
            Except
            end;

            Result := false;
        end;
    end;
end;

function UTI_INI_Configuracion_Skin : Trecord_Skin;
var var_fichero_ini : TIniFile;
begin
    if (FileExists(GetCurrentDirUTF8 + const_Path_Ini)) then
    begin
        try
            var_fichero_ini                              := TIniFile.Create(GetCurrentDirUTF8 + const_Path_Ini);

            Result.con_Exito                             := true;

            Result.DbGrid_Color                          := StringToColor(var_fichero_ini.ReadString('Skin', 'DbGrid_Color', ''));
            Result.DbGrid_Color_AlternateColor           := StringToColor(var_fichero_ini.ReadString('Skin', 'DbGrid_Color_AlternateColor', ''));
            Result.DbGrid_Font_Color                     := StringToColor(var_fichero_ini.ReadString('Skin', 'DbGrid_Font_Color', ''));

            Result.DbGrid_Filtros_Color                  := StringToColor(var_fichero_ini.ReadString('Skin', 'DbGrid_Filtros_Color', ''));
            Result.DbGrid_Filtros_Color_AlternateColor   := StringToColor(var_fichero_ini.ReadString('Skin', 'DbGrid_Filtros_Color_AlternateColor', ''));
            Result.DbGrid_Filtros_Font_Color             := StringToColor(var_fichero_ini.ReadString('Skin', 'DbGrid_Filtros_Font_Color', ''));

            Result.DbMemo_Color                          := StringToColor(var_fichero_ini.ReadString('Skin', 'DbMemo_Color', ''));
            Result.DbMemo_Font_Color                     := StringToColor(var_fichero_ini.ReadString('Skin', 'DbMemo_Font_Color', ''));

            Result.Memo_Color                            := StringToColor(var_fichero_ini.ReadString('Skin', 'Memo_Color', ''));
            Result.Memo_Font_Color                       := StringToColor(var_fichero_ini.ReadString('Skin', 'Memo_Font_Color', ''));

            Result.Memo_Color_Filtros                    := StringToColor(var_fichero_ini.ReadString('Skin', 'Memo_Color_Filtros', ''));
            Result.Memo_Font_Color_Filtros               := StringToColor(var_fichero_ini.ReadString('Skin', 'Memo_Font_Color_Filtros', ''));

            Result.Memo_Color_OrderBy                    := StringToColor(var_fichero_ini.ReadString('Skin', 'Memo_Color_OrderBy', ''));
            Result.Memo_Font_Color_OrderBy               := StringToColor(var_fichero_ini.ReadString('Skin', 'Memo_Font_Color_OrderBy', ''));

            Result.Form_Color                            := StringToColor(var_fichero_ini.ReadString('Skin', 'Form_Color', ''));
            Result.Form_Color_Eligiendo                  := StringToColor(var_fichero_ini.ReadString('Skin', 'Form_Color_Eligiendo', ''));

            Result.DBEdit_Color                          := StringToColor(var_fichero_ini.ReadString('Skin', 'DBEdit_Color', ''));
            Result.DBEdit_Font_Color                     := StringToColor(var_fichero_ini.ReadString('Skin', 'DBEdit_Font_Color', ''));

            Result.Edit_Color                            := StringToColor(var_fichero_ini.ReadString('Skin', 'Edit_Color', ''));
            Result.Edit_Font_Color                       := StringToColor(var_fichero_ini.ReadString('Skin', 'Edit_Font_Color', ''));

            Result.DBDateTimePicker_Color                := StringToColor(var_fichero_ini.ReadString('Skin', 'DBDateTimePicker_Color', ''));
            Result.DBDateTimePicker_Font_Color           := StringToColor(var_fichero_ini.ReadString('Skin', 'DBDateTimePicker_Font_Color', ''));

            var_fichero_ini.Free;
        except
            on error : Exception do
            begin
                UTI_GEN_Error_Log( 'Error al ABRIR el fichero de CONFIGURACION' + ' desde ' +
                                   Screen.ActiveForm.Name,
                                   error );
                try
                    var_fichero_ini.Free;
                Except
                end;

                Result.con_Exito := False;
            end;
        end;
    end;
end;

end.


