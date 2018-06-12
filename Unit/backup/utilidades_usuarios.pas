unit utilidades_usuarios;

{$mode objfpc}{$H+}

interface

uses
  utilidades_bd, Forms, utilidades_general, sqldb, Classes, SysUtils, utilidades_datos_tablas;

type

  Trecord_Existe = record
      Fallo_en_Conexion_BD : Boolean;
      Existe               : Boolean;
      deBaja               : ShortString;
      id_Users             : ShortString;
      OT_Descripcion_Nick  : ShortString;
      id_Menus             : ShortString;
  end;

function  UTI_USR_Copiar_de_Usuario_Privilegios( param_msg : TStrings; param_Nick, param_Tipo_Usuario, param_id_Usuario : String ) : Boolean;
function  UTI_USR_Copiar_de_Usuario_Privilegios_2( param_msg : TStrings; param_id_Users_Original, param_id_Users_Copia : String ) : Boolean;
function  UTI_USR_Copiar_de_Usuario_Privilegios_3( param_msg : TStrings; param_id_Users_Original, param_id_Users_Copia : String ) : Boolean;

function  UTI_USR_Permiso_SN( param_Menu : integer; param_Tipo_CRUD : ShortString; param_Ver_Error : boolean ) : Boolean;
function  UTI_USR_Permiso_SN_conPermisoTotal_SN( param_Id : Integer ) : Boolean;
function  UTI_USR_Permiso_SN_TraerNombreModulo( param_Id : Integer ) : String;
function  UTI_USR_Permiso_SN_Modulo_conPermisoTotal_SN( param_Menu : Integer ) : Boolean;
function  UTI_USR_Permiso_SN_Permisos( param_Menu : integer; param_Tipo_CRUD : ShortString; param_Ver_Error : boolean ) : Boolean;
function  UTI_USR_Permiso_SN_Permisos_2( param_SQLQuery : TSQLQuery; param_Menu : integer; param_Tipo_CRUD : ShortString; param_Ver_Error : boolean ) : Boolean;
procedure UTI_USR_Permiso_SN_Permisos_3( param_Mayusculas : ShortString; param_msg : TStrings );

function  UTI_USR_Traer_Nombre_Usuario(param_id : Integer) : ShortString;
function  UTI_USR_Traer_Nombre_Usuario_2(param_id : Integer) : ShortString;

function  UTI_USR_Traer_Users_xDescripcion_Nick( param_Descripcion_Nick : String ) : TUsers;

function  UTI_USR_Obligado_WHY_Delete_SN( param_Menu : integer ) : Boolean;
function  UTI_USR_Obligado_WHY_Delete_SN_2( param_Menu : integer ) : Boolean;

function  UTI_USR_AskByPwd( param_Ctdad_Intentos_Tope, param_ctdad_veces : ShortInt ) : ShortInt;
function  UTI_USR_WhoIs( param_password : String ) : ShortString;

implementation

uses
  menu, AskByPwd;

function UTI_USR_Traer_Nombre_Usuario_2(param_id : Integer) : ShortString;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
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

        var_SQL.Add ( 'SELECT Descripcion_Nick' );
        var_SQL.Add(    'FROM users' );
        var_SQL.Add(   'WHERE Id = ' + Trim(IntToStr(param_id)) );
        var_SQL.Add(     'AND Del_WHEN IS NULL ' );
        var_SQL.Add (  'ORDER BY Id' );

        // ***************************************************************************************** //
        // ** Abrimos la tabla                                                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery          := TSQLQuery.Create(nil);
        var_SQLQuery.Database := var_SQLConnector;
        var_SQLQuery.Name     := 'SQLQuery_UTI_USR_Traer_Nombre_Usuario_2';

        if UTI_TB_Query_Open( '', '', '',
                              var_SQLConnector,
                              var_SQLQuery,
                              -1, // asi me trae todos los registros de golpe
                              var_SQL.Text ) = False then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** TRABAJAMOS CON LOS REGISTROS DEVUELTOS                                              ** //
        // ***************************************************************************************** //
        // ** Si el módulo no se creó, no se permite entrar en él ... Result := False             ** //
        // ***************************************************************************************** //
        Result := var_SQLQuery.FieldByName('Descripcion_Nick').AsString;

        // ***************************************************************************************** //
        // ** Cerramos la tabla                                                                   ** //
        // ***************************************************************************************** //
        if UTI_TB_Cerrar( var_SQLConnector,
                          var_SQLTransaction,
                          var_SQLQuery ) = false then UTI_GEN_Salir;

        var_SQLQuery.Free;
        var_SQL.Free;
        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    Except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( 'No se pudo traer el nombre del usuario.',
                               error );
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

            Result := '';
        end;
    end;
end;

function UTI_USR_Traer_Nombre_Usuario(param_id : Integer) : ShortString;
begin
    if param_id = 0 then
         Result := 'USUARIO INSTALACION'
    else Result := UTI_USR_Traer_Nombre_Usuario_2(param_id);
end;

function UTI_USR_Obligado_WHY_Delete_SN( param_Menu : integer ) : Boolean;
begin
    if Form_Menu.public_User = 0 then // 0 es el superusuario
         Result := False
    else Result := UTI_USR_Obligado_WHY_Delete_SN_2( param_Menu );
end;

function UTI_USR_Obligado_WHY_Delete_SN_2( param_Menu : integer ) : Boolean;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
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

        var_SQL.Add('SELECT Forcing_Why_Delete' );
        var_SQL.Add(  'FROM users_menus' );
        var_SQL.Add(' WHERE Id_Users = ' +  Trim(IntToStr(Form_Menu.public_User)) + ' ' );
        var_SQL.Add('   AND Id_Menus  = ' +  Trim(IntToStr(param_Menu)) + ' ' );
        var_SQL.Add(   'AND Del_WHEN IS NULL ' );
        var_SQL.Add(' ORDER BY Id_Users, Id_Menus ' );

        // ***************************************************************************************** //
        // ** Abrimos la tabla                                                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery          := TSQLQuery.Create(nil);
        var_SQLQuery.Database := var_SQLConnector;
        var_SQLQuery.Name     := 'SQLQuery_UTI_USR_Obligado_WHY_Delete_SN_2';

        if UTI_TB_Query_Open( '', '', '',
                              var_SQLConnector,
                              var_SQLQuery,
                              -1, // asi me trae todos los registros de golpe
                              var_SQL.Text ) = False then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** TRABAJAMOS CON LOS REGISTROS DEVUELTOS                                              ** //
        // ***************************************************************************************** //
        // ** Si el módulo no se creó, no se permite entrar en él ... Result := False             ** //
        // ***************************************************************************************** //
        Result := False;
        if Trim(UpperCase(var_SQLQuery.FieldByName('Forcing_Why_Delete').AsString)) = 'S' then
        begin
            Result := True;
        end;

        // ***************************************************************************************** //
        // ** Cerramos la tabla                                                                   ** //
        // ***************************************************************************************** //
        if UTI_TB_Cerrar( var_SQLConnector,
                          var_SQLTransaction,
                          var_SQLQuery ) = false then UTI_GEN_Salir;

        var_SQLQuery.Free;
        var_SQL.Free;
        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    Except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( 'No se pudo comprobar si obligado el poner porque se borra el registro.',
                               error );
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

            Result := false;
        end;
    end;
end;

function UTI_USR_AskByPwd( param_Ctdad_Intentos_Tope, param_ctdad_veces : ShortInt ) : ShortInt;
begin
    if UTI_GEN_Form_Abierto_Ya('form_AskByPwd') = False then
    begin
        Application.CreateForm(Tform_AskByPwd, form_AskByPwd);

        form_AskByPwd.RecogerParametros( param_Ctdad_Intentos_Tope, param_ctdad_veces );

        // 0 = Pulsó salir de la aplicación, 1 = Contraseña correcta, 2 = Contraseña incorrecta
        Result := 0; // No pulsó el OK

        form_AskByPwd.ShowModal;
        if form_AskByPwd.public_Pulso_Aceptar = true then
        begin
            if form_Menu.public_pwd <> '' then
                 Result := 1  // CONTRASEÑA CORRECTA
            else Result := 2; // CONTRASEÑA INCORRECTA
        end;

        form_AskByPwd.Free;
    end;
end;

function UTI_USR_WhoIs( param_password : String ) : ShortString;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;

    var_Expira         : Boolean;
    var_Fecha_Actual   : tDateTime;
begin
    try
        form_Menu.public_User_Descripcion_Nick := '';
        Result                                 := '';
        // ***************************************************************************************** //
        // ** Creamos la Transaccion y la conexión con el motor BD, y la abrimos                  ** //
        // ***************************************************************************************** //
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Connector_Open( var_SQLTransaction,
                                  var_SQLConnector ) = False then
        begin
             UTI_GEN_Salir;
        end;

        // ***************************************************************************************** //
        // ** Creamos la SQL Según el motor de BD                                                 ** //
        // ***************************************************************************************** //
        var_SQL := TStringList.Create;

        var_SQL.Add( 'SELECT u.Id_Empleados,' );
        var_SQL.Add(        'u.Permiso_Total_SN,' );
        var_SQL.Add(        'u.Del_WHEN AS users_Del_WHEN,' );
        var_SQL.Add(        'u.Descripcion_Nick AS users_Descripcion_Nick,' );

        var_SQL.Add(        'e.descripcion as empleados_descripcion,' );

        var_SQL.Add(        'up.*' );

        var_SQL.Add(   'FROM users_passwords AS up' );

        var_SQL.Add( 'LEFT JOIN users as u' );
        var_SQL.Add(   'ON up.Id_Users = u.id' );

        var_SQL.Add( 'LEFT JOIN empleados as e' );
        var_SQL.Add(   'ON u.Id_Empleados = e.id' );

        var_SQL.Add(  'WHERE up.Password =  ' + UTI_GEN_Comillas(Trim(param_password)) );

        var_SQL.Add( 'ORDER BY up.Password ' );

        // ***************************************************************************************** //
        // ** Abrimos la tabla                                                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery          := TSQLQuery.Create(nil);
        var_SQLQuery.Database := var_SQLConnector;
        var_SQLQuery.Name     := 'SQLQuery_UTI_USR_WhoIs';

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
        with var_SQLQuery do
        begin
            if RecordCount > 0 then
            begin
                if (FieldByName('users_Del_WHEN').IsNull) and
                   (FieldByName('Del_WHEN').IsNull)       then
                begin
                    var_Expira := True;
                    if FieldByName('Password_Expira_SN').Value = 'N' then
                        var_Expira := False
                    else begin
                        var_Fecha_Actual := UTI_CN_Fecha_Hora;
                        if (var_Fecha_Actual >= FieldByName('Password_Expira_Inicio').Value) and
                           (var_Fecha_Actual <= FieldByName('Password_Expira_Fin').Value)    then
                        begin
                            var_Expira := False;
                        end;
                    end;

                    if var_Expira = False then
                    begin
                        form_Menu.public_User                   := FieldByName('Id_Users').Value;
                        form_Menu.public_User_Descripcion_Nick  := FieldByName('users_Descripcion_Nick').AsString;

                        form_Menu.public_User_Id_Empleados      := FieldByName('Id_Empleados').AsString;
                        form_Menu.public_User_Nombre_Empleado   := FieldByName('empleados_descripcion').AsString;

                        form_Menu.public_Password_Expira_Inicio := FieldByName('Password_Expira_Inicio').AsString;
                        form_Menu.public_Password_Expira_Fin    := FieldByName('Password_Expira_Fin').AsString;

                        if Trim(UpperCase(FieldByName('Password_Expira_SN').AsString)) = 'S' then
                             form_Menu.public_Password_Expira_SN := true
                        else form_Menu.public_Password_Expira_SN := false;
                    end else begin
                        Result := 'Contraseña caducada';
                    end;
                end else begin
                    if not FieldByName('users_Del_WHEN').IsNull then
                    begin
                        Result := 'Usuario dado de baja';
                    end;

                    if not FieldByName('Del_WHEN').IsNull then
                    begin
                        Result := 'Contraseña dada de baja';
                    end;
                end;

                if FieldByName('Obligado_NICK_SN').AsString = 'S' then
                begin
                    Result := 'Obligado el código de usuario';
                end;
            end else begin
                Result := 'NO EXISTE';
            end;
        end;

        // ***************************************************************************************** //
        // ** Cerramos la tabla                                                                   ** //
        // ***************************************************************************************** //
        if UTI_TB_Cerrar( var_SQLConnector,
                          var_SQLTransaction,
                          var_SQLQuery ) = false then UTI_GEN_Salir;

        var_SQLQuery.Free;

        var_SQL.Free;

        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    Except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( 'No se pudo comprobar quien es el usuario de la password (' +
                               Trim(param_password) + ').',
                               error );
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

            Result := 'Error al intentar comprobar quien es el usuario de la password (' +
                      Trim(param_password) + ').';
        end;
    end;
end;

function UTI_USR_Permiso_SN_conPermisoTotal_SN( param_Id : Integer ) : Boolean;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
    Try
        // ***************************************************************************************** //
        // ** Creamos la Transaccion y la conexión con el motor BD, y la abrimos                  ** //
        // ***************************************************************************************** //
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Connector_Open( var_SQLTransaction,
                                  var_SQLConnector ) = false then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Creamos la SQL Según el motor de BD                                                 ** //
        // ***************************************************************************************** //
        var_SQL := TStringList.Create;

        var_SQL.Add( 'SELECT *' );
        var_SQL.Add(   'FROM users' );
        var_SQL.Add(  'WHERE Id =  ' + Trim(IntToStr(param_Id)) );
        var_SQL.Add(    'AND Del_WHEN IS NULL ' );
        var_SQL.Add(  'ORDER BY Id' );

        // ***************************************************************************************** //
        // ** Abrimos la tabla                                                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery          := TSQLQuery.Create(nil);
        var_SQLQuery.Database := var_SQLConnector;
        var_SQLQuery.Name     := 'SQLQuery_UTI_USR_Permiso_SN_conPermisoTotal_SN';

        if UTI_TB_Query_Open( '', '', '',
                              var_SQLConnector,
                              var_SQLQuery,
                              -1, // asi me trae todos los registros de golpe
                              var_SQL.Text ) = False then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** TRABAJAMOS CON LOS REGISTROS DEVUELTOS                                              ** //
        // ***************************************************************************************** //
        // ** Si el módulo no se creó, no se permite entrar en él ... Result := False             ** //
        // ***************************************************************************************** //
        with var_SQLQuery do
        begin
            if RecordCount > 0 then
            begin
                if FieldByName('Del_WHEN').IsNull then
                begin
                    if Trim(FieldByName('Permiso_Total_SN').AsString) = '' then
                    begin
                        // ************************************************************************* //
                        // ** No se puso nada, así que no tiene permiso total                     ** //
                        // ************************************************************************* //
                        Result := False;
                    end else begin
                        Result := False;
                        if UpperCase(Trim(FieldByName('Permiso_Total_SN').AsString)) = 'S' then
                        begin
                            Result := True;
                        end;
                    end;
                end else begin
                    // ***************************************************************************** //
                    // ** Usuario dado de baja ... no tiene permisos totales                      ** //
                    // ***************************************************************************** //
                    Result := False;
                end;
            end else begin
                // ********************************************************************************* //
                // ** No se encuentra este usuario                                                ** //
                // ********************************************************************************* //
                Result := False;
            end;
        end;

        // ***************************************************************************************** //
        // ** Cerramos la tabla                                                                   ** //
        // ***************************************************************************************** //
        if UTI_TB_Cerrar( var_SQLConnector,
                          var_SQLTransaction,
                          var_SQLQuery ) = false then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Vaciamos la memoria                                                                 ** //
        // ***************************************************************************************** //
        var_SQLQuery.Free;
        var_SQL.Free;
        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    Except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( 'No se pudo comprobar si el usuario tiene permisos totales para' +
                               ' cualquier módulo/menú.',
                               error );
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

            Result := false
        end;
    end;
end;

function UTI_USR_Permiso_SN( param_Menu : integer;
                             param_Tipo_CRUD : ShortString;
                             param_Ver_Error : Boolean ) : Boolean;
var var_msg    : TStrings;
    var_Fecha  : tDateTime;
    var_Expira : Boolean;
begin
  if (Form_Menu.public_User = 0) { Usuario = 0 es el superusuario }        or
     (UTI_USR_Permiso_SN_conPermisoTotal_SN(Form_Menu.public_User) = true) then
  begin
    // ***************************************************************************************** //
    // ** O es el SUPER USUARIO, o tiene PERMISOS TOTALES. Por lo que devuelvo que lo tiene   ** //
    // ***************************************************************************************** //
    Result := True;
  end

  else
  begin
    // ***************************************************************************************** //
    // ** Compruebo si tiene permisos para la opción solicitada.                              ** //
    // ***************************************************************************************** //
    // ** Primero compruebo si tiene permisos totales para el modulo solicitado.              ** //
    // ***************************************************************************************** //
    // ** Si no los tiene compruebo si los tiene para la opción CRUD en concreto solicitada   ** //
    // ***************************************************************************************** //
    Result := UTI_USR_Permiso_SN_Modulo_conPermisoTotal_SN(param_Menu);
    if Result = false then
    begin
      Result := UTI_USR_Permiso_SN_Permisos( param_Menu, param_Tipo_CRUD, param_Ver_Error );
    end;
  end;

{ ****************************************************************************
  Pero puede ocurrir que la contraseña haya caducado, por lo que no debo de
  dar permisos
  **************************************************************************** }
  var_Expira := True;
  if Form_Menu.public_Password_Expira_SN = false then
  begin
    var_Expira := false
  end

  else
  begin
    var_Fecha := UTI_CN_Fecha_Hora;

    if ( var_Fecha >= StrToDateTime(Form_Menu.public_Password_Expira_Inicio) ) and
       ( var_Fecha <= StrToDateTime(Form_Menu.public_Password_Expira_Fin) )    then
    begin
      var_Expira := False;
    end;
  end;

  if var_Expira = True then
  begin
    var_msg := TStringList.Create;
    var_msg.Add('CONTRASEÑA CADUCADA');
    UTI_GEN_Aviso(true, var_msg, 'PERMISO DENEGADO', True, False);
    var_msg.Free;
    Result := False;
  end;

{ ****************************************************************************
  Si tiene permisos, se cambia el momento de comprobación de tiempo de espera
  para pedir la password otra vez
  **************************************************************************** }
  if Result = True then
  begin
    Form_Menu.public_When_Last_Permission := Now;
  end;

end;

function UTI_USR_Permiso_SN_Permisos( param_Menu : integer;
                                      param_Tipo_CRUD : ShortString;
                                      param_Ver_Error : boolean ) : Boolean;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
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

        var_SQL.Add( 'SELECT *' );
        var_SQL.Add(   'FROM users_menus_permissions' );
        var_SQL.Add(  'WHERE Id_Users = ' +  Trim(IntToStr(Form_Menu.public_User)) );
        var_SQL.Add(    'AND Id_Menus  = ' +  Trim(IntToStr(param_Menu)) );
        var_SQL.Add(    'AND Del_WHEN IS NULL ' );

        // ***************************************************************************************** //
        // ** Puede que a veces no pida en concreto un tipo de CRUD asi que diréctamente veo si   ** //
        // ** tiene algún permiso, sea la opción que sea                                          ** //
        // ***************************************************************************************** //
        if Trim(param_Tipo_CRUD) <> '' then
        begin
            var_SQL.Add(  ' AND Tipo_CRUD  = ' + UTI_GEN_Comillas(Trim(param_Tipo_CRUD)) )
        end else begin
            var_SQL.Add(  ' AND PermisoSN  = ' + UTI_GEN_Comillas('S') + ' ' );
        end;

        var_SQL.Add(' ORDER BY Id_Users, Id_Menus, Tipo_CRUD ' );

        // ***************************************************************************************** //
        // ** Abrimos la tabla                                                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery          := TSQLQuery.Create(nil);
        var_SQLQuery.Database := var_SQLConnector;
        var_SQLQuery.Name     := 'SQLQuery_UTI_USR_Permiso_SN_Permisos';

        if UTI_TB_Query_Open( '', '', '',
                              var_SQLConnector,
                              var_SQLQuery,
                              -1, // asi me trae todos los registros de golpe
                              var_SQL.Text ) = False then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** TRABAJAMOS CON LOS REGISTROS DEVUELTOS                                              ** //
        // ***************************************************************************************** //
        // ** Si el módulo no se creó, no se permite entrar en él ... Result := False             ** //
        // ***************************************************************************************** //
        Result := UTI_USR_Permiso_SN_Permisos_2( var_SQLQuery,
                                                 param_Menu,
                                                 param_Tipo_CRUD,
                                                 param_Ver_Error );

        // ***************************************************************************************** //
        // ** Cerramos la tabla                                                                   ** //
        // ***************************************************************************************** //
        if UTI_TB_Cerrar( var_SQLConnector,
                          var_SQLTransaction,
                          var_SQLQuery ) = false then UTI_GEN_Salir;

        var_SQLQuery.Free;

        var_SQL.Free;

        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    Except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( 'No se pudo comprobar si en ese módulo el usuario tiene permisos totales.',
                               error );
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

            Result := false
        end;
    end;
end;

function UTI_USR_Permiso_SN_Permisos_2( param_SQLQuery : TSQLQuery;
                                        param_Menu : integer;
                                        param_Tipo_CRUD : ShortString;
                                        param_Ver_Error : boolean ) : Boolean;
var var_Mayusculas : ShortString;
    var_msg        : TStrings;
begin
    var_msg := TStringList.Create;
    Result  := False;

    // ********************************************************************************************* //
    // param_Tipo_CRUD puede contener ... 'A' .- Alta
    //                                    'M' .- Modificar
    //                                    'B' .- Borrar
    //                                    'I' .- Imprimir
    //                                    'O' .- Otro uso
    //                                    ''  .- Ninguna opción ... para ver si
    //                                           tiene algún tipo de permiso para
    //                                           el menu que preguntamos
    // ********************************************************************************************* //
    if Trim(param_Tipo_CRUD) = '' then
    begin
        // ************************************************************************************* //
        // ** No se pidió ningún tipo de uso ('A', 'M', 'B', 'I' o 'O'), por lo que podría    ** //
        // ** devolver un registro, varios o ninguno                                          ** //
        // ************************************************************************************* //
        if param_SQLQuery.RecordCount > 0 then
             Result := True // devuelvo true porque tiene algún tipo de uso para este modulo
        else var_msg.Add( 'PARA ESTA OPCION NO TIENE PERMISOS' );
    end else begin
        // ************************************************************************************* //
        // ** Se pidió en concreto permiso para un tipo de uso para un menu, así que solo me  ** //
        // ** tiene que devolver un registro                                                  ** //
        // ************************************************************************************* //
        var_Mayusculas := AnsiUpperCase(param_Tipo_CRUD);
        if param_SQLQuery.RecordCount = 0 then
        begin
            UTI_USR_Permiso_SN_Permisos_3( var_Mayusculas, var_msg );
        end else begin
            // ***************************************************************************** //
            // ** El tipo de opción solicitada('A', 'M', 'B', 'I' o 'O') fué creado como  ** //
            // ** permiso para el menú solicitado, así que devol vemos si tiene permiso,  ** //
            // ** según valor del campo (PermisoSN)                                       ** //
            // ***************************************************************************** //
            if AnsiUpperCase(param_SQLQuery.FieldByName('PermisoSN').Value) = 'S' then
            begin
                Result := True; { tiene permiso }
            end else begin
                UTI_USR_Permiso_SN_Permisos_3( var_Mayusculas, var_msg );
            end;
        end;
    end;

    if Trim(var_msg.Text) <> '' then
    begin
        if param_Ver_Error = True then
        begin
            UTI_GEN_Aviso(true, var_msg, 'PERMISO DENEGADO', True, False);
        end;
    end;

    var_msg.Free;
end;

procedure UTI_USR_Permiso_SN_Permisos_3( param_Mayusculas : ShortString;
                                         param_msg : TStrings );
var var_parte_frase : String;
begin
    // ********************************************************************************************* //
    // param_Tipo_CRUD puede contener ... 'A' .- Alta
    //                                    'M' .- Modificar
    //                                    'B' .- Borrar
    //                                    'I' .- Imprimir
    //                                    'O' .- Otro uso
    //                                    ''  .- Ninguna opción ... para ver si
    //                                           tiene algún tipo de permiso para
    //                                           el menu que preguntamos
    // ********************************************************************************************* //
    // ** Para el tipo de permiso solicitado('A', 'M', 'B', 'I' o 'O') no tiene permiso           ** //
    // ********************************************************************************************* //
    if (Trim(param_Mayusculas) = 'A') or
       (Trim(param_Mayusculas) = 'M') or
       (Trim(param_Mayusculas) = 'B') or
       (Trim(param_Mayusculas) = 'I') or
       (Trim(param_Mayusculas) = 'O') then
    begin
        var_parte_frase := 'PARA ESTA OPCION NO TIENE PERMISOS DE ';

        if Trim(param_Mayusculas) = 'A' then
        begin
            param_msg.Add( var_parte_frase + UTI_GEN_Comillas('ALTAS') );
        end;

        if Trim(param_Mayusculas) = 'M' then
        begin
            param_msg.Add( var_parte_frase + UTI_GEN_Comillas('MODIFICAR') );
        end;

        if Trim(param_Mayusculas) = 'B' then
        begin
            param_msg.Add( var_parte_frase + UTI_GEN_Comillas('BORRAR') );
        end;

        if Trim(param_Mayusculas) = 'I' then
        begin
            param_msg.Add( var_parte_frase + UTI_GEN_Comillas('IMPRIMIR') );
        end;

        if Trim(param_Mayusculas) = 'O' then
        begin
            param_msg.Add( var_parte_frase + UTI_GEN_Comillas('OTRO USO') );
        end;
    end else begin
        param_msg.Add( 'LA OPCION DE PERMISOS ' + Trim(param_Mayusculas) + ' NO ESTA CONTEMPLADA' );
    end;
end;

function UTI_USR_Permiso_SN_Modulo_conPermisoTotal_SN( param_Menu : Integer ) : Boolean;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
    Try
        // ***************************************************************************************** //
        // ** Creamos la Transaccion y la conexión con el motor BD, y la abrimos                  ** //
        // ***************************************************************************************** //
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Connector_Open( var_SQLTransaction,
                                  var_SQLConnector ) = false then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Creamos la SQL Según el motor de BD                                                 ** //
        // ***************************************************************************************** //
        var_SQL := TStringList.Create;

        var_SQL.Add( 'SELECT *' );
        var_SQL.Add(   'FROM users_menus' );
        var_SQL.Add(  'WHERE Id_Users = ' +  Trim(IntToStr(Form_Menu.public_User)) );
        var_SQL.Add(    'AND Id_Menus  = ' +  Trim(IntToStr(param_Menu)) );
        var_SQL.Add(    'AND Del_WHEN IS NULL ' );

        // ***************************************************************************************** //
        // ** Abrimos la tabla                                                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery          := TSQLQuery.Create(nil);
        var_SQLQuery.Database := var_SQLConnector;
        var_SQLQuery.Name     := 'SQLQuery_UTI_USR_Permiso_SN_Modulo_conPermisoTotal_SN';

        if UTI_TB_Query_Open( '', '', '',
                              var_SQLConnector,
                              var_SQLQuery,
                              -1, // asi me trae todos los registros de golpe
                              var_SQL.Text ) = False then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** TRABAJAMOS CON LOS REGISTROS DEVUELTOS                                              ** //
        // ***************************************************************************************** //
        // ** Si el módulo no se creó, no se permite entrar en él ... Result := False             ** //
        // ***************************************************************************************** //
        with var_SQLQuery do
        begin
            if RecordCount > 0 then
            begin
                if FieldByName('Del_WHEN').IsNull then
                begin
                    if Trim(FieldByName('Modulo_Permiso_Total_SN').AsString) = '' then
                    begin
                        // ************************************************************************* //
                        // ** No se puso nada, así que no tiene permiso total                     ** //
                        // ************************************************************************* //
                        Result := False;
                    end else begin
                        Result := False;
                        if UpperCase(Trim(FieldByName('Modulo_Permiso_Total_SN').AsString)) = 'S' then
                        begin
                            Result := True;
                        end;
                    end;
                end else begin
                    // ***************************************************************************** //
                    // ** Usuario dado de baja ... no tiene permisos totales                      ** //
                    // ***************************************************************************** //
                    Result := False;
                end;
            end else begin
                // ********************************************************************************* //
                // ** No se encuentra este modulo del usuario                                     ** //
                // ********************************************************************************* //
                Result := False;
            end;
        end;

        // ***************************************************************************************** //
        // ** Cerramos la tabla                                                                   ** //
        // ***************************************************************************************** //
        if UTI_TB_Cerrar( var_SQLConnector,
                          var_SQLTransaction,
                          var_SQLQuery ) = false then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Vaciamos la memoria                                                                 ** //
        // ***************************************************************************************** //
        var_SQLQuery.Free;
        var_SQL.Free;
        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    Except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( 'No se pudo comprobar si en ese módulo el usuario tiene permisos totales.',
                               error );
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

            Result := false;
        end;
    end;
end;

function UTI_USR_Copiar_de_Usuario_Privilegios( param_msg : TStrings;
                                                param_Nick,
                                                param_Tipo_Usuario,
                                                param_id_Usuario : String ) : Boolean;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
    var_Registro_Users : TUsers;
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

        // ***************************************************************************************** //
        // ** PRIMERO CREAMOS EL USUARIO NUEVO COMO COPIA DE ALGUNOS CAMPOS DEL ORIGINAL          ** //
        // ***************************************************************************************** //
        var_SQL.Add( 'INSERT INTO users' );
        var_SQL.Add(        '( Descripcion_Nick,' );
        var_SQL.Add(         ' Permiso_Total_SN,' );
        var_SQL.Add(         ' Tipo,' );

        var_SQL.Add(         ' Insert_WHEN,' );
        var_SQL.Add(         ' Insert_Id_User )' );

        var_SQL.Add( 'SELECT ' + UTI_GEN_Comillas(Trim(param_Nick)) + ',' );
        var_SQL.Add(           ' Permiso_Total_SN,' );
        var_SQL.Add(             UTI_GEN_Comillas(Trim(param_Tipo_Usuario)) + ',' );

        var_SQL.Add(             UTI_GEN_Comillas(DateTimeToStr(UTI_CN_Fecha_Hora)) + ',' );
        var_SQL.Add(             Trim(FloatToStr(Form_Menu.public_User)) );

        var_SQL.Add( 'FROM users' );

        var_SQL.Add( 'WHERE id = ' + Trim(param_id_Usuario) );

        var_SQL.Add( 'ORDER BY id ASC' );

        // ***************************************************************************************** //
        // ** Abrimos la tabla                                                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery          := TSQLQuery.Create(nil);

        var_SQLQuery.Database := var_SQLConnector;
        var_SQLQuery.SQL.Text := var_SQL.Text;

        var_SQLQuery.Name     := 'SQLQuery_UTI_USR_Copiar_de_Usuario_Privilegios';

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

        // ***************************************************************************************** //
        // ** Traer la id del nuevo usuario                                                       ** //
        // ***************************************************************************************** //
        var_Registro_Users := UTI_USR_Traer_Users_xDescripcion_Nick( Trim(param_Nick) );

        if var_Registro_Users.id <> '0' then
        begin
            // ************************************************************************************* //
            // ** AHORA COPIAREMOS LOS MENUS A LOS QUE TENDRÁ ACCESO                              ** //
            // ************************************************************************************* //
            UTI_USR_Copiar_de_Usuario_Privilegios_2( param_msg,
                                                     param_id_Usuario,
                                                     var_Registro_Users.id );
        end else begin
            // ************************************************************************************* //
            // ** usuario creado pero no encuentro su id                                          ** //
            // ************************************************************************************* //
        end;
    Except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( 'Error al copiar los privilegios del usuario con id = ' +
                               Trim(param_id_Usuario) + ' para el nuevo usuario ' +
                               Trim(param_Nick),
                               error );
            try
                var_SQLQuery.Free;
                var_SQL.Free;
                var_SQLTransaction.Free;
                var_SQLConnector.Free;
            except
            end;

            Result := false
        end;
    end;
end;

function UTI_USR_Copiar_de_Usuario_Privilegios_2( param_msg : TStrings;
                                                  param_id_Users_Original,
                                                  param_id_Users_Copia : String ) : Boolean;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
    var_Registro_Users : TUsers;
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

        // ***************************************************************************************** //
        // ** AHORA COPIAMOS LOS MENUS A LOS QUE TIENE PERMISO                                    ** //
        // ***************************************************************************************** //
        var_SQL.Add( 'INSERT INTO users_menus' );
        var_SQL.Add(        '( Id_Users,' );
        var_SQL.Add(         ' Id_Menus,' );
        var_SQL.Add(         ' Forcing_Why_Delete,' );
        var_SQL.Add(         ' Modulo_Permiso_Total_SN,' );

        var_SQL.Add(         ' Insert_WHEN,' );
        var_SQL.Add(         ' Insert_Id_User )' );

        var_SQL.Add( 'SELECT ' + Trim(param_id_Users_Copia) + ',' );
        var_SQL.Add(           ' Id_Menus,' );
        var_SQL.Add(           ' Forcing_Why_Delete,' );
        var_SQL.Add(           ' Modulo_Permiso_Total_SN,' );

        var_SQL.Add(             UTI_GEN_Comillas(DateTimeToStr(UTI_CN_Fecha_Hora)) + ',' );
        var_SQL.Add(             Trim(FloatToStr(Form_Menu.public_User)) );

        var_SQL.Add( 'FROM users_menus' );

        var_SQL.Add( 'WHERE Id_Users = ' + Trim(param_id_Users_Original) );
        var_SQL.Add( 'AND Del_WHEN IS NULL' );

        var_SQL.Add( 'ORDER BY Id_Users ASC, Id_Menus ASC' );

        // ***************************************************************************************** //
        // ** Abrimos la tabla                                                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery          := TSQLQuery.Create(nil);

        var_SQLQuery.Database := var_SQLConnector;
        var_SQLQuery.SQL.Text := var_SQL.Text;

        var_SQLQuery.Name     := 'SQLQuery_UTI_USR_Copiar_de_Usuario_Privilegios_2';

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

        // ***************************************************************************************** //
        // ** aHORA Copiar los privilegios de cada módulo / menu                                  ** //
        // ***************************************************************************************** //
        UTI_USR_Copiar_de_Usuario_Privilegios_3( param_msg,
                                                 param_id_Users_Original,
                                                 param_id_Users_Copia );
    Except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( 'Error al copiar los menus asociados al usuario con id = ' +
                               Trim(param_id_Users_Original) + ' para el nuevo usuario ' +
                               Trim(param_id_Users_Copia),
                               error );
            try
                var_SQLQuery.Free;
                var_SQL.Free;
                var_SQLTransaction.Free;
                var_SQLConnector.Free;
            except
            end;

            Result := false
        end;
    end;
end;

function UTI_USR_Copiar_de_Usuario_Privilegios_3( param_msg : TStrings;
                                                  param_id_Users_Original,
                                                  param_id_Users_Copia : String ) : Boolean;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
    var_Registro_Users : TUsers;
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

        // ***************************************************************************************** //
        // ** Por ultimo insertamos los permisos para cada menu                                   ** //
        // ***************************************************************************************** //
        var_SQL.Add( 'INSERT INTO users_menus_permissions' );
        var_SQL.Add(        '( Id_Users,' );
        var_SQL.Add(         ' Id_Menus,' );

        var_SQL.Add(         ' Tipo_CRUD,' );
        var_SQL.Add(         ' Descripcion,' );
        var_SQL.Add(         ' PermisoSN,' );

        var_SQL.Add(         ' Insert_WHEN,' );
        var_SQL.Add(         ' Insert_Id_User )' );

        var_SQL.Add( 'SELECT ' + Trim(param_id_Users_Copia) + ',' );
        var_SQL.Add(           ' Id_Menus,' );

        var_SQL.Add(           ' Tipo_CRUD,' );
        var_SQL.Add(           ' Descripcion,' );
        var_SQL.Add(           ' PermisoSN,' );

        var_SQL.Add(             UTI_GEN_Comillas(DateTimeToStr(UTI_CN_Fecha_Hora)) + ',' );
        var_SQL.Add(             Trim(FloatToStr(Form_Menu.public_User)) );

        var_SQL.Add( 'FROM users_menus_permissions' );

        var_SQL.Add( 'WHERE Id_Users = ' + Trim(param_id_Users_Original) );
        var_SQL.Add( 'AND Del_WHEN IS NULL' );

        var_SQL.Add( 'ORDER BY Id_Users ASC, Id_Menus ASC, Tipo_CRUD ASC' );

        // ***************************************************************************************** //
        // ** Abrimos la tabla                                                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery          := TSQLQuery.Create(nil);

        var_SQLQuery.Database := var_SQLConnector;
        var_SQLQuery.SQL.Text := var_SQL.Text;

        var_SQLQuery.Name     := 'SQLQuery_UTI_USR_Copiar_de_Usuario_Privilegios_3';

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
            UTI_GEN_Error_Log( 'Error al copiar los menus asociados al usuario con id = ' +
                               Trim(param_id_Users_Original) + ' para el nuevo usuario ' +
                               Trim(param_id_Users_Copia),
                               error );
            try
                var_SQLQuery.Free;
                var_SQL.Free;
                var_SQLTransaction.Free;
                var_SQLConnector.Free;
            except
            end;

            Result := false
        end;
    end;
end;

function UTI_USR_Traer_Users_xDescripcion_Nick( param_Descripcion_Nick : String ) : TUsers;
var var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
    try
        // ***************************************************************************************** //
        // ** Creamos la Transaccion y la conexión con el motor BD, y la abrimos                  ** //
        // ***************************************************************************************** //
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Connector_Open( var_SQLTransaction,
                                  var_SQLConnector ) = false then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Creamos el SQLQuery y le pasamos el SQLConnector                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery          := TSQLQuery.Create(nil);
        var_SQLQuery.Name     := 'SQLQuery_UTI_USR_Traer_Users_xDescripcion_Nick';
        var_SQLQuery.Database := var_SQLConnector;

        // ***************************************************************************************** //
        // ** Creamos la SQL                                                                      ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Clear;
        var_SQLQuery.SQL.AddStrings( 'SELECT u.*' + ' ' +
                                     'FROM users AS u' + ' ' );

        // ***************************************************************************************** //
        // ** Continuamos con la confección de la SQL                                             ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add( 'WHERE u.Descripcion_Nick = ' + UTI_GEN_Comillas(Trim(param_Descripcion_Nick)) );
        var_SQLQuery.SQL.Add( 'ORDER BY u.Descripcion_Nick ASC' );

        // ***************************************************************************************** //
        // ** Abrimos la Query                                                                    ** //
        // ***************************************************************************************** //
        if UTI_TB_Query_Open( '', '', '',
                              var_SQLConnector,
                              var_SQLQuery,
                              -1, // asi me trae todos los registros de golpe
                              var_SQLQuery.SQL.Text ) = false then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Hacemos las comprobaciones que nos hagan falta de la SQL que hemos hecho            ** //
        // ***************************************************************************************** //
        // ** Result = 0 aclarara que no existe el registro buscado por su id                     ** //
        // ***************************************************************************************** //
        if var_SQLQuery.RecordCount = 0 then
             Result.id := '0' // No encontremos este registro
        else begin
             with var_SQLQuery do
             begin
                 Result.id               := FieldByName('id').AsString;

                 Result.Descripcion_Nick := FieldByName('Descripcion_Nick').AsString;
                 Result.Id_Empleados     := FieldByName('Id_Empleados').AsString;
                 Result.Permiso_Total_SN := FieldByName('Permiso_Total_SN').AsString;
                 Result.Tipo             := FieldByName('Tipo').AsString;

                 Result.Insert_WHEN      := FieldByName('Insert_WHEN').AsString;
                 Result.Insert_Id_User   := FieldByName('Insert_Id_User').AsString;
                 Result.Del_WHEN         := FieldByName('Del_WHEN').AsString;
                 Result.Del_Id_User      := FieldByName('Del_Id_User').AsString;
                 Result.Del_WHY          := FieldByName('Del_WHY').AsString;
                 Result.Change_WHEN      := FieldByName('Change_WHEN').AsString;
                 Result.Change_Id_User   := FieldByName('Change_Id_User').AsString;
             end;
        end;

        // ***************************************************************************************** //
        // ** Cerramos la tabla y asi se cierra automaticamente La transacción y conexión con BD  ** //
        // ***************************************************************************************** //
        if UTI_TB_Cerrar( var_SQLConnector,
                          var_SQLTransaction,
                          var_SQLQuery ) = false then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Destruimos la tabla y conexiones                                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery.Free;
        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( 'Ocurrió un error al intentar traer todos los datos del usuario ' +
                               Trim(param_Descripcion_Nick) + '. La tabla ha sido ' +
                               var_SQLQuery.Name + ' desde el módulo ' + Screen.ActiveForm.Name,
                               error );
            try
                var_SQLTransaction.Free;
                var_SQLConnector.Free;
                var_SQLQuery.Free;
            except
            end;
        end;
    end;
end;

function UTI_USR_Permiso_SN_TraerNombreModulo( param_Id : Integer ) : String;

var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
  Result := '';

  Try
    // ***************************************************************************************** //
    // ** Creamos la Transaccion y la conexión con el motor BD, y la abrimos                  ** //
    // ***************************************************************************************** //
    var_SQLTransaction := TSQLTransaction.Create(nil);
    var_SQLConnector   := TSQLConnector.Create(nil);

    if UTI_CN_Connector_Open( var_SQLTransaction,
                              var_SQLConnector ) = false then UTI_GEN_Salir;

    // ***************************************************************************************** //
    // ** Creamos la SQL Según el motor de BD                                                 ** //
    // ***************************************************************************************** //
    var_SQL := TStringList.Create;

    var_SQL.Add( 'SELECT menus.Modulo' );
    var_SQL.Add(   'FROM menus' );
    var_SQL.Add(  'WHERE menus.id =  ' + Trim(IntToStr(param_Id)) );
    var_SQL.Add(    'AND menus.Del_WHEN IS NULL ' );
    var_SQL.Add(  'ORDER BY Id' );

    // ***************************************************************************************** //
    // ** Abrimos la tabla                                                                    ** //
    // ***************************************************************************************** //
    var_SQLQuery          := TSQLQuery.Create(nil);
    var_SQLQuery.Database := var_SQLConnector;
    var_SQLQuery.Name     := 'SQLQuery_UTI_USR_Permiso_SN_TraerNombreModulo';

    if UTI_TB_Query_Open( '', '', '',
                          var_SQLConnector,
                          var_SQLQuery,
                          -1, // asi me trae todos los registros de golpe
                          var_SQL.Text ) = False then UTI_GEN_Salir;

    // ***************************************************************************************** //
    // ** TRABAJAMOS CON LOS REGISTROS DEVUELTOS                                              ** //
    // ***************************************************************************************** //
    // ** Si el módulo no se creó, no se permite entrar en él ... Result := False             ** //
    // ***************************************************************************************** //
    with var_SQLQuery do
    begin
      if RecordCount > 0 then
      begin
        if Trim(FieldByName('Modulo').AsString) <> '' then
        begin
          Result := Trim(FieldByName('Modulo').AsString);
        end;
      end;
    end;

    // ***************************************************************************************** //
    // ** Cerramos la tabla                                                                   ** //
    // ***************************************************************************************** //
    if UTI_TB_Cerrar( var_SQLConnector,
                      var_SQLTransaction,
                      var_SQLQuery ) = false then UTI_GEN_Salir;

    // ***************************************************************************************** //
    // ** Vaciamos la memoria                                                                 ** //
    // ***************************************************************************************** //
    var_SQLQuery.Free;
    var_SQL.Free;
    var_SQLTransaction.Free;
    var_SQLConnector.Free;

  Except
    on error : Exception do
    begin
      UTI_GEN_Error_Log( 'No se pudo traer el nombre del módulo',
                         error );
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

end.

{
function UTI_USR_Existe_Menu_Ya( param_Id,
                                 param_Id_Users,
                                 param_id_Menus : String ) : Trecord_Existe;
var var_SQL            : TStrings;
    var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
    try
      { ****************************************************************************
        Creamos la Transaccion y la conexión con el motor BD, y la abrimos
        **************************************************************************** }
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Connector_Open( var_SQLTransaction,
                                  var_SQLConnector ) = False then UTI_GEN_Salir;

      { ****************************************************************************
        Creamos la SQL Según el motor de BD
        **************************************************************************** }
        var_SQL := TStringList.Create;

        var_SQL.Add('SELECT um.*,' );
        var_SQL.Add(        'u.Descripcion_Nick AS OT_Descripcion_Nick,' );
        var_SQL.Add(        'm.Descripcion AS OT_Descripcion_Menu' );

        var_SQL.Add(  'FROM users_menus AS um' );

        var_SQL.Add(  'LEFT JOIN users AS u' );
        var_SQL.Add(    'ON um.Id_Users = u.id' );

        var_SQL.Add(  'LEFT JOIN menus AS m' );
        var_SQL.Add(    'ON um.Id_Menus = m.id' );

        var_SQL.Add(' WHERE um.id_Menus = ' +  Trim(param_id_Menus) );
        var_SQL.Add(  ' AND um.Id_Users = ' +  Trim(param_Id_Users) );

        if Trim(param_Id) <> '' then
        begin
             var_SQL.Add(  ' AND NOT um.Id = ' + Trim(param_Id) );
        end;

        var_SQL.Add(' ORDER BY um.Id_Users, um.id_Menus' );

      { ****************************************************************************
        Abrimos la tabla
        **************************************************************************** }
        var_SQLQuery          := TSQLQuery.Create(nil);
        var_SQLQuery.Database := var_SQLConnector;
        var_SQLQuery.Name     := 'SQLQuery_UTI_USR_Existe_Menu_Ya';

        if UTI_TB_Query_Open( '', '', '',
                              var_SQLConnector,
                              var_SQLQuery,
                              -1, // asi me trae todos los registros de golpe
                              var_SQL.Text ) = False then UTI_GEN_Salir;

      { ****************************************************************************
        TRABAJAMOS CON LOS REGISTROS DEVUELTOS
        ****************************************************************************
        Si el módulo no se creó, no se permite entrar en él ... Result := False
        **************************************************************************** }
        Result.Fallo_en_Conexion_BD := false;
        Result.Existe               := false;
        Result.deBaja               := 'N';

        Result.id_Users             := '';
        Result.id_Menus             := '';
        Result.OT_Descripcion_Nick  := '';

        // if var_SQLQuery.FieldByName('Ctdad').Value > 0 then Result := True;
        if var_SQLQuery.RecordCount > 0 then
        begin
            Result.Existe              := true;
            if not var_SQLQuery.FieldByName('Del_WHEN').IsNull then Result.deBaja := 'S';
        end;

      { ****************************************************************************
        Cerramos la tabla
        **************************************************************************** }
        if UTI_TB_Cerrar( var_SQLConnector,
                          var_SQLTransaction,
                          var_SQLQuery ) = false then UTI_GEN_Salir;

        var_SQLQuery.Free;

        var_SQL.Free;

        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    except
      on error : Exception do
      begin
          UTI_GEN_Error_Log( 'Error al comprobar si el menu existe ya para este usuario.' +
                             ' La tabla ha sido ' + var_SQLQuery.Name + ' desde el módulo ' +
                             Screen.ActiveForm.Name,
                             error );
          try
              var_SQL.Free;
              var_SQLTransaction.Free;
              var_SQLConnector.Free;
              var_SQLQuery.Free;
          except
          end;

          Result.Fallo_en_Conexion_BD := true;
      end;
    end;
end;

}
