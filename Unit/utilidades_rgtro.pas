unit utilidades_rgtro;

{$mode objfpc}{$H+}

interface

uses
    Controls, Forms, FileUtil, Classes, SysUtils, DB, sqldb, ButtonPanel, Dialogs, DBGrids,
    utilidades_usuarios, utilidades_general, utilidades_bd;

type

  TCampos_para_Existe_ya = record
      Campo_Valor  : String;
      Campo_Nombre : String;
      Campo_Tipo   : ShortInt; // 0: Numerico, 1: String, 2:Fecha ó Fecha+Hora, 3:Hora
  end;

  procedure UTI_RGTRO_where_o_And(var param_where_o_and : ShortString);
  function  UTI_RGTRO_Existe_Ya( param_nombre_tabla : String; param_order_by : String; param_id_a_no_traer : String; param_Campos_para_Existe_ya : Array of TCampos_para_Existe_ya ) : Trecord_Existe;

  function  UTI_RGTRO_Campo_es_DiaHora( param_FieldType : TFieldType; param_parte_de_SQL_tipoDato : String ) : Boolean;
  function  UTI_RGTRO_Campo_es_Dia( param_FieldType : TFieldType; param_parte_de_SQL_tipoDato : String ) : Boolean;
  function  UTI_RGTRO_Campo_es_Hora( param_FieldType : TFieldType; param_parte_de_SQL_tipoDato : String ) : Boolean;
  function  UTI_RGTRO_Campo_es_Numero( param_FieldType : TFieldType; param_parte_de_SQL_tipoDato : String ) : Boolean;
  function  UTI_RGTRO_Campo_es_Texto( param_FieldType : TFieldType; param_parte_de_SQL_tipoDato : String ) : Boolean;

  function  UTI_RGTRO_Borrar_Cabecera_y_Detalle( param_nombre_campo, param_tabla_Cabecera, param_tabla_Detalle : String; param_SQLQuery_Cabecera, param_SQLQuery_Detalle : TSQLQuery; param_Solo_Ver : Boolean; param_Menu_Worked : Integer ) : Boolean;
  function  UTI_RGTRO_BAJA_o_ALTA_Rgtro( param_alta : Boolean; param_nombre_tabla, param_nombre_campo, param_valor_nombre_campo : String ) : Boolean;
  function  UTI_RGTRO_Borrar_ALTA_Cabecera_y_Detalle( param_nombre_campo, param_tabla_Cabecera, param_tabla_Detalle : String; param_SQLQuery_Cabecera, param_SQLQuery_Detalle : TSQLQuery; param_msg : TStrings ) : Boolean;
  function  UTI_RGTRO_Borrar_BAJA_Cabecera_y_Detalle( param_nombre_campo, param_tabla_Cabecera, param_tabla_Detalle : String; param_SQLQuery_Cabecera, param_SQLQuery_Detalle : TSQLQuery; param_msg : TStrings; param_Menu_Worked : Integer ) : Boolean;

  function  UTI_RGTRO_Borrar( param_nombre_tabla : ShortString; param_SQLQuery : TSQLQuery; param_Solo_Ver : Boolean; param_Menu_Worked : Integer ) : Boolean;
  function  UTI_RGTRO_Borrar_BAJA( param_nombre_tabla : ShortString; param_SQLQuery : TSQLQuery; param_msg : TStrings; param_Menu_Worked : Integer ) : Boolean;
  function  UTI_RGTRO_Borrar_ALTA( param_nombre_tabla : ShortString; param_SQLQuery : TSQLQuery; param_msg : TStrings ) : Boolean;

  function  UTI_RGTRO_Lock( param_nombre_tabla, param_id : ShortString ) : Boolean;

  function  UTI_RGTRO_isLock( param_nombre_tabla, param_id : ShortString; param_ver_mensaje : Boolean ) : Boolean;
  function  UTI_RGTRO_isLock_Preguntar_si_Desbloqueamos( param_msg : TStrings ) : Boolean;

  procedure UTI_RGTRO_UnLock( param_nombre_tabla, param_id : ShortString );

  function  UTI_RGTRO_Grabar_Antes( param_Nombre_Tabla : ShortString; param_SQLQuery : TSQLQuery ) : Boolean;

  function  UTI_RGTRO_Buscar_Rgtro_y_Grabar_Cambios_en_Historico( param_Nombre_Tabla : ShortString; param_SQL : TStrings ) : Boolean;

  procedure UTI_RGTRO_Ver_Estado_Registro( param_nombre_tabla : ShortString; param_SQLQuery : TSQLQuery; param_DataSource : TDataSource; param_DBGrid : TDBGrid );

implementation

uses estado_registro, menu;

procedure UTI_RGTRO_Ver_Estado_Registro( param_nombre_tabla : ShortString;
                                         param_SQLQuery : TSQLQuery;
                                         param_DataSource : TDataSource;
                                         param_DBGrid : TDBGrid );
var
  var_Form_Estado_Registro : TForm_Estado_Registro;
  var_a_Filtrar_Plus       : TStrings;
begin
  var_a_Filtrar_Plus := TStringList.Create;

  with param_SQLQuery do
  begin
      var_Form_Estado_Registro := TForm_Estado_Registro.Create(nil);

      var_Form_Estado_Registro.ButtonPanel_Estado_Registro.ShowButtons := [pbOK];
      var_Form_Estado_Registro.ButtonPanel_Estado_Registro.DefaultButton := pbOK;

      var_Form_Estado_Registro.Edit_Motivo_Baja.Color           := $006AD3D7;
      var_Form_Estado_Registro.Edit_Motivo_Baja.ReadOnly        := True;

      var_Form_Estado_Registro.Edit_Motivo_Baja.Text            := FieldByName('Del_WHY').AsString;
      var_Form_Estado_Registro.Edit_Fecha_Baja.Text             := FieldByName('Del_WHEN').AsString;
      var_Form_Estado_Registro.Edit_Fecha_Ult_Modificacion.Text := FieldByName('Change_WHEN').AsString;
      var_Form_Estado_Registro.Edit_Fecha_Alta.Text             := FieldByName('Insert_WHEN').AsString;

      if not FieldByName('Del_Id_User').isNull then
      begin
          var_Form_Estado_Registro.Edit_Usuario_Baja.Text := UTI_USR_Traer_Nombre_Usuario(FieldByName('Del_Id_User').Value);
      end;

      if not FieldByName('Change_Id_User').isNull then
      begin
          var_Form_Estado_Registro.Edit_Usuario_Ult_Modificacion.Text := UTI_USR_Traer_Nombre_Usuario(FieldByName('Change_Id_User').Value);
      end;

      if not FieldByName('Insert_Id_User').isNull then
      begin
          var_Form_Estado_Registro.Edit_Usuario_Alta.Text := UTI_USR_Traer_Nombre_Usuario(FieldByName('Insert_Id_User').Value);
      end;

      var_Form_Estado_Registro.DBGrid_Principal.Columns.Assign(param_DBGrid.Columns);
      var_Form_Estado_Registro.DBGrid_Principal.DataSource := param_DataSource;

      if Trim(param_nombre_tabla) <> '' then
      begin
        var_a_Filtrar_Plus.Clear;
        var_a_Filtrar_Plus.Add( 'r.tb = ' + UTI_GEN_Comillas(param_nombre_tabla) );
        UTI_TB_SQL_ADD( true,
                        var_Form_Estado_Registro.Memo_Filtros.Lines,
                        var_a_Filtrar_Plus );
      end
      else
      begin
        var_a_Filtrar_Plus.Clear;
        var_a_Filtrar_Plus.Add( 'r.tb = ' + UTI_GEN_Comillas(param_SQLQuery.Name) );
        UTI_TB_SQL_ADD( true,
                        var_Form_Estado_Registro.Memo_Filtros.Lines,
                        var_a_Filtrar_Plus );
      end;

      var_a_Filtrar_Plus.Clear;
      var_a_Filtrar_Plus.Add( 'r.id = ' + param_SQLQuery.FieldByName('id').AsString );
      UTI_TB_SQL_ADD( false,
                      var_Form_Estado_Registro.Memo_Filtros.Lines,
                      var_a_Filtrar_Plus );

      // ***************************************************************************************** //
      // ** Preparamos los diferentes tipos de orden preconfigurados                            ** //
      // ***************************************************************************************** //
      SetLength(var_Form_Estado_Registro.public_Order_By, 1);

      var_Form_Estado_Registro.public_Order_By[0].Titulo       := 'Por el registro a comprobar'; // El índice 0 siempre será por el que empezará la aplicación y los filtros
      var_Form_Estado_Registro.public_Order_By[0].Memo_OrderBy := 'r.tb ASC, r.id ASC, r.Momento ASC, r.Id_Users ASC';

      var_Form_Estado_Registro.Memo_OrderBy.Lines.Text         := var_Form_Estado_Registro.public_Order_By[0].Memo_OrderBy;

      var_Form_Estado_Registro.Filtrar_users_row_changes( 0,
                                                          false,
                                                          var_Form_Estado_Registro.Memo_Filtros.Lines,
                                                          var_Form_Estado_Registro.Memo_OrderBy.Lines );

      var_Form_Estado_Registro.ShowModal;

      var_Form_Estado_Registro.Free;
  end;

  var_a_Filtrar_Plus.Free;
end;

function UTI_RGTRO_Grabar_Antes( param_Nombre_Tabla : ShortString;
                                 param_SQLQuery : TSQLQuery ) : Boolean;
var var_msg : String;
begin
    Result := true;

    with param_SQLQuery do
    begin
        try
           Post;
        except
            on error : Exception do
            begin
                Result := false;

                // ********************************************************************************* //
                // ** Las líneas de abajo tratan el error en el fichero .log                      ** //
                // ********************************************************************************* //
                if Trim(param_Nombre_Tabla) <> '' then
                begin
                    var_msg := 'No se pudo salvar el registro en la tabla ' + param_Nombre_Tabla;
                end else begin
                    var_msg := 'No se pudo salvar el registro en la tabla ' + param_SQLQuery.Name;
                end;

                UTI_GEN_Error_Log( var_msg, error );
                // ********************************************************************************* //
                // ** Las líneas de arriba tratan el error en el fichero .log                     ** //
                // ********************************************************************************* //
            end;
        end;
    end;
end;

function UTI_RGTRO_Buscar_Rgtro_y_Grabar_Cambios_en_Historico( param_Nombre_Tabla : ShortString;
                                                               param_SQL : TStrings ) : Boolean;
var var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
    Try
        Result := true;

      { ****************************************************************************
        Creamos la Transaccion y la conexión con el motor BD, y la abrimos
        **************************************************************************** }
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Connector_Open( var_SQLTransaction,
                                  var_SQLConnector ) = False then UTI_GEN_Salir;

      { ****************************************************************************
        Abrimos la tabla
        **************************************************************************** }
        var_SQLQuery      := TSQLQuery.Create(nil);
        var_SQLQuery.Name := param_Nombre_Tabla;

        if UTI_TB_Query_Open( '',
                              '',
                              '',
                              var_SQLConnector,
                              var_SQLQuery,
                              -1, // asi me trae todos los registros de golpe
                              param_SQL.Text ) = False then UTI_GEN_Salir;

      { ****************************************************************************
        TRABAJAMOS CON LOS REGISTROS DEVUELTOS
        ****************************************************************************
        Si el módulo no se creó, no se permite entrar en él ... Result := False
        **************************************************************************** }
        if var_SQLQuery.RecordCount > 0 then
           begin
               // ************************************************************************************** //
               // ** Encontró el registro así que pasamos a crear su histórico                        ** //
               // ************************************************************************************** //
               var_SQLQuery.First;
               While not var_SQLQuery.EOF do
               begin
                    UTI_RGTROS_Historico_Update( param_Nombre_Tabla,
                                                 // var_SQLTransaction,
                                                 var_SQLQuery );
                    var_SQLQuery.Next;
               end;
           end;

      { ****************************************************************************
        Cerramos la tabla
        **************************************************************************** }
        if UTI_TB_Cerrar( var_SQLConnector,
                          var_SQLTransaction,
                          var_SQLQuery ) = false then UTI_GEN_Salir;

        var_SQLQuery.Free;

        var_SQLTransaction.Free;
        var_SQLConnector.Free;

    Except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( 'Error al buscar el registro para grabar su histórico de cambios.' +
                               'La tabla ha sido ' + var_SQLQuery.Name + ' desde el módulo ' +
                               Screen.ActiveForm.Name,
                               error );

            try
                var_SQLTransaction.Free;
                var_SQLConnector.Free;
                var_SQLQuery.Free;
            except
            end;

            Result := false;
        end;
    end;
end;

function UTI_RGTRO_isLock_Preguntar_si_Desbloqueamos( param_msg : TStrings ) : Boolean;
begin
    param_msg.Add( ' ' );
    param_msg.Add( '¿Desea desbloquearlo?' );

    Result := UTI_GEN_Aviso(true, param_msg, '¿DESBLOQUEAMOS EL REGISTRO?', True, True);
end;

function UTI_RGTRO_isLock( param_nombre_tabla,
                           param_id : ShortString;
                           param_ver_mensaje : Boolean ) : Boolean;
var var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;

    var_msg            : TStrings;
begin
    try
        Result := false;

        // ***************************************************************************************** //
        // ** Creamos la Transaccion y la conexión con el motor BD, y la abrimos                  ** //
        // ***************************************************************************************** //
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Connector_Open( var_SQLTransaction,
                                  var_SQLConnector ) = false then
        begin
            Exit; UTI_GEN_Salir;
        end;

        // ***************************************************************************************** //
        // ** Creamos el SQLQuery y le pasamos el SQLConnector                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery          := TSQLQuery.Create(nil);
        var_SQLQuery.Name     := 'SQLQuery_UTI_RGTRO_isLock';
        var_SQLQuery.Database := var_SQLConnector;

        // ***************************************************************************************** //
        // ** Creamos la SQL                                                                      ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add( 'SELECT *' );
        var_SQLQuery.SQL.Add(   'FROM users_row_lock' );
        var_SQLQuery.SQL.Add(  'WHERE tb = ' + UTI_GEN_Comillas(param_nombre_tabla) );
        var_SQLQuery.SQL.Add(    'AND id = ' + param_id );

        // ***************************************************************************************** //
        // ** Continuamos con la confección de la SQL                                             ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add(  'ORDER BY tb ASC, id ASC' );

        // ***************************************************************************************** //
        // ** Abrimos la Query                                                                    ** //
        // ***************************************************************************************** //
        if UTI_TB_Query_Open( '',
                              '',
                              '',
                              var_SQLConnector,
                              var_SQLQuery,
                              -1, // asi me trae todos los registros de golpe
                              var_SQLQuery.SQL.Text ) = false then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Hacemos las comprobaciones que nos hagan falta de la SQL que hemos hecho            ** //
        // ***************************************************************************************** //
        // ** Result = false enseña que no existe el bloqueo                                      ** //
        // ***************************************************************************************** //
        if var_SQLQuery.RecordCount > 0 then
        begin
            Result := true;

            var_msg := TStringList.Create;
            var_msg.Clear;

            var_msg.Add( 'El registro está bloqueado por el usuario ' +
                         var_SQLQuery.FieldByName('Id_Users').AsString +
                         ' desde ' + var_SQLQuery.FieldByName('Momento').AsString +
                         ' y desde la terminal ' +
                         var_SQLQuery.FieldByName('id_terminales').AsString + '.' );

            // ************************************************************************************* //
            // ** Primero comprobamos si es el super usuario. Si lo es pues preguntamos de todos  ** //
            // ** modos si queremos desbloquear el registro                                       ** //
            // ************************************************************************************* //
            // ** Si no es super usuario, o no es un usuario con todos los privilegios comprobamos** //
            // ** si hay que avisar del bloqueo                                                   ** //
            // ************************************************************************************* //
            if (form_Menu.public_User = 0)                                           or
               (UTI_USR_Permiso_SN_conPermisoTotal_SN(Form_Menu.public_User) = True) then
            begin
                // ********************************************************************************* //
                // ** O es un superUsuario o es un usuario con todos los privilegios              ** //
                // ********************************************************************************* //
                if UTI_RGTRO_isLock_Preguntar_si_Desbloqueamos(var_msg) = true then
                begin
                    UTI_RGTRO_UnLock( param_nombre_tabla, param_id );
                end;
            end else begin
                // ********************************************************************************* //
                // ** Como no es un superUsuario, ni es un usuario con todos los privilegios, pues** //
                // ** nos avisa para que un usuario con todos los privilegios lo desbloquee. Pero ** //
                // ** solo si la variable param_ver_mensaje estaba configurada a true             ** //
                // ********************************************************************************* //
                if param_ver_mensaje = true then
                begin
                    UTI_GEN_Aviso(true, var_msg, 'ERROR', true, false);
                end;
            end;

            var_msg.Free;
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
            // ************************************************************************************* //
            // ** Si se produce un error tambien devuelvo Result a true para que no pueda hacer la** //
            // ** comprobación del bloqueo                                                        ** //
            // ************************************************************************************* //
            Result  := true;

            UTI_GEN_Error_Log( 'Ocurrió un error al intentar comprobar si el registro está' +
                               ' bloqueado. La tabla ha sido ' + var_SQLQuery.Name +
                               ' desde el módulo ' + Screen.ActiveForm.Name,
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

function UTI_RGTRO_Lock( param_nombre_tabla,
                         param_id : ShortString ) : Boolean;
var var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;

    var_Momento        : TDateTime;

    var_User           : ShortString;
    var_Terminal       : ShortString;
begin
    Result := false;

    try
        // ***************************************************************************************** //
        // ** Creamos la Transaccion y la conexión con el motor BD, y la abrimos                  ** //
        // ***************************************************************************************** //
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Connector_Open( var_SQLTransaction,
                                  var_SQLConnector ) = False then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Creamos el SQLQuery                                                                 ** //
        // ***************************************************************************************** //
        var_SQLQuery          := TSQLQuery.Create(nil);
        var_SQLQuery.Database := var_SQLConnector;

        // ***************************************************************************************** //
        // ** VEMOS CUAL ES EL USUARIO QUE CREA O MODIFICA EL REGISTRO                            ** //
        // ***************************************************************************************** //
        var_User := Trim(IntToStr(Form_Menu.public_User));

        // ***************************************************************************************** //
        // ** VEMOS CUAL ES EL MOMENTO EN EL QUE SE CREA O MODIFICA EL REGISTRO                   ** //
        // ***************************************************************************************** //
        // ** ESTO CAMBIARA SEGUN SEA UNA MODIFICACION O UN ALTA O UN BORRADO                     ** //
        // ***************************************************************************************** //
        var_Momento := UTI_CN_Fecha_Hora;

       // ****************************************************************************************** //
       // ** VEMOS CUAL ES LA TERMINAL, SI NO ESTA CONFIGURADA EN EL FICHERO .INI SE PON DRA LA   ** //
       // ** TERMINAL COMO 0                                                                      ** //
       // ****************************************************************************************** //
        var_Terminal := '0';
        if Trim(form_menu.public_Terminal) <> '' then
        begin
             var_Terminal := form_menu.public_Terminal;
        end;

        with var_SQLQuery do
        begin
            // ************************************************************************************* //
            // ** Creamos los parámetros                                                          ** //
            // ************************************************************************************* //
            Params.CreateParam(ftUnknown, 'tb', ptUnknown);
            Params.CreateParam(ftUnknown, 'id', ptUnknown);
            Params.CreateParam(ftUnknown, 'Momento', ptUnknown);
            Params.CreateParam(ftUnknown, 'Id_Users', ptUnknown);
            Params.CreateParam(ftUnknown, 'id_terminales', ptUnknown);

            // ************************************************************************************* //
            // ** Creamos la SQL                                                                  ** //
            // ************************************************************************************* //
            SQL.Clear;

            SQL.Add( 'INSERT INTO users_row_lock' );
            SQL.Add(     '( tb,' );
            SQL.Add(       'id,' );
            SQL.Add(       'Momento,' );
            SQL.Add(       'Id_Users,' );
            SQL.Add(       'id_terminales )' );
            SQL.Add( 'VALUES' );
            SQL.Add(     '( :tb,' );
            SQL.Add(       ':id,' );
            SQL.Add(       ':Momento,' );
            SQL.Add(       ':Id_Users,' );
            SQL.Add(       ':id_terminales )' );

            // ************************************************************************************* //
            // ** Le damos un nombre a la tabla o procedimiento                                   ** //
            // ************************************************************************************* //
            Name := 'SQLQuery_UTI_RGTRO_Lock';

            // ************************************************************************************* //
            // ** Les pasamos los valores a los parámetros de la sql                              ** //
            // ************************************************************************************* //
            Params.ParamByName('tb').AsString         := param_nombre_tabla;
            Params.ParamByName('id').AsString         := param_id;
            Params.ParamByName('Momento').Value       := var_Momento;
            Params.ParamByName('Id_Users').Value      := var_User;
            Params.ParamByName('id_terminales').Value := var_Terminal;
        end;

        // ***************************************************************************************** //
        // ** Ejecutamos la SQL                                                                   ** //
        // ***************************************************************************************** //
        var_SQLQuery.ExecSQL;
        var_SQLTransaction.Commit;

        // ***************************************************************************************** //
        // ** Destruimos la tabla y conexiones                                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery.Free;

        // ***************************************************************************************** //
        // ** Cerramos La transacción y la conexión con la BD                                     ** //
        // ***************************************************************************************** //
        if UTI_CN_Connector_Close( var_SQLTransaction,
                                   var_SQLConnector ) = False then
        begin
             Result := false;
        end;

        var_SQLTransaction.Free;
        var_SQLConnector.Free;

        Result := true;
    except
        on error : Exception do
        begin
            Result := false;

            UTI_GEN_Error_Log( 'Ocurrió un error al intentar marcar el registro como bloqueado' +
                               ' para toda terminal.',
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

function UTI_RGTRO_Borrar( param_nombre_tabla : ShortString;
                           param_SQLQuery : TSQLQuery;
                           param_Solo_Ver : Boolean;
                           param_Menu_Worked : Integer ) : Boolean;
var var_msg : TStrings;
begin
    Result := false;

    with param_SQLQuery do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
        begin
            if param_Solo_Ver = True then
            begin
                var_msg.Clear;
                var_msg.Add('Sólo se puede CONSULTAR.');
                UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            end else begin
                if FieldByName('Del_WHEN').IsNull then
                     Result := UTI_RGTRO_Borrar_BAJA( param_nombre_tabla, param_SQLQuery, var_msg, param_Menu_Worked)
                else Result := UTI_RGTRO_Borrar_ALTA( param_nombre_tabla, param_SQLQuery, var_msg );
            end;
        end else begin
            var_msg.Clear;
            var_msg.Add(rs_no_Hay_Rgtros);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        end;

        var_msg.Free;
    end;
end;

function UTI_RGTRO_Borrar_BAJA( param_nombre_tabla : ShortString;
                                param_SQLQuery : TSQLQuery;
                                param_msg : TStrings;
                                param_Menu_Worked : Integer ) : Boolean;
var var_Form_Estado_Registro : TForm_Estado_Registro;
var var_OK                   : Boolean;
  var_id                     : ShortString;
begin
    Result := true;

    with param_SQLQuery do
    begin
        try
            var_id := FieldByName('id').AsString;

            if UTI_RGTRO_isLock( param_nombre_tabla,
                                 var_id,
                                 true ) = true then
            begin
                 Exit;
            end else begin
                if UTI_RGTRO_Lock( param_nombre_tabla,
                                   var_id ) = true then
                     Edit
                else Exit;
            end;

            FieldByName('Del_WHEN').Value    := UTI_CN_Fecha_Hora;
            FieldByName('Del_Id_User').Value := Form_Menu.public_User;

            // Llamo a un formulario para que pregunte por el motivo por el que se da de baja
            var_Form_Estado_Registro := TForm_Estado_Registro.Create(nil);
            //Application.CreateForm(tform_Estado_Registro, form_Estado_Registro);

            var_Form_Estado_Registro.Edit_Usuario_Baja.Text           := UTI_USR_Traer_Nombre_Usuario(Form_Menu.public_User);
            var_Form_Estado_Registro.Edit_Fecha_Baja.Text             := FieldByName('Del_WHEN').AsString;

            var_Form_Estado_Registro.Edit_Fecha_Ult_Modificacion.Text := FieldByName('Change_WHEN').AsString;
            var_Form_Estado_Registro.Edit_Fecha_Alta.Text             := FieldByName('Insert_WHEN').AsString;

            if not FieldByName('Change_Id_User').IsNull then
            begin
                var_Form_Estado_Registro.Edit_Usuario_Ult_Modificacion.Text := UTI_USR_Traer_Nombre_Usuario(FieldByName('Change_Id_User').Value);
            end;

            if not FieldByName('Insert_Id_User').IsNull then
            begin
                var_Form_Estado_Registro.Edit_Usuario_Alta.Text := UTI_USR_Traer_Nombre_Usuario(FieldByName('Insert_Id_User').Value);
            end;

            var_OK := True;
            if UTI_USR_Obligado_WHY_Delete_SN(param_Menu_Worked) = true then
            begin
                var_OK := False;
                While Trim(var_Form_Estado_Registro.Edit_Motivo_Baja.Text) = '' do
                begin
                    var_Form_Estado_Registro.ShowModal;
                    if var_Form_Estado_Registro.public_Pulso_Aceptar = true then
                    begin
                        var_OK := True;
                        if Trim(var_Form_Estado_Registro.Edit_Motivo_Baja.Text) = '' then
                        begin
                            param_msg.Clear;
                            param_msg.Add('Está Obligado a decirme PORQUE BORRAR el registro.');
                            UTI_GEN_Aviso(true, param_msg, 'NO PUEDO BORRAR', True, False);
                        end;
                    end else begin
                        var_OK := False;
                        Break;
                    end;
                end;
            end;

            FieldByName('Del_WHY').AsString := var_Form_Estado_Registro.Edit_Motivo_Baja.Text;
            var_Form_Estado_Registro.Free;

            if var_OK = True then
            begin
                Post;
            end else begin
                Cancel;
            end;
        except
            on error : Exception do
            begin
                UTI_GEN_Error_Log( 'Error, NO SE PUDO BORRAR el registro, ocurrió un error de' +
                                   ' conexión con la BD. La tabla ha sido ' + param_SQLQuery.Name +
                                   ' desde el módulo ' + Screen.ActiveForm.Name,
                                   error );
                try
                    var_Form_Estado_Registro.Free;
                except
                end;

                Result := false
            end;
        end;

        UTI_RGTRO_UnLock( param_nombre_tabla,
                          var_id );
    end;
end;

function UTI_RGTRO_Borrar_ALTA( param_nombre_tabla : ShortString;
                                param_SQLQuery : TSQLQuery;
                                param_msg : TStrings ) : Boolean;
var var_id : ShortString;
begin
    Result := true;

    with param_SQLQuery do
    begin
      { param_msg.Clear;   quito la comprobación de si damos de alta, me afecta al proceso de stock de almacen
        param_msg.Add('El registro ya estaba dado de baja.');
        param_msg.Add('¿SEGURO que desea darlo de ALTA?');
        if UTI_GEN_Aviso(true, param_msg, rs_OK, True, True) = True then
        begin }
            try
                var_id := FieldByName('id').AsString;

                if UTI_RGTRO_isLock( param_nombre_tabla,
                                     var_id,
                                     true ) = true then
                begin
                    Exit;
                end else begin
                    if UTI_RGTRO_Lock( param_nombre_tabla,
                                       var_id ) = true then
                         Edit
                    else Exit;
                end;

                // ********************************************************************************* //
                // ** le quitamos las marcas del borrado                                          ** //
                // ********************************************************************************* //
                FieldByName('Del_WHEN').Clear;
                FieldByName('Del_Id_User').Clear;
                FieldByName('Del_WHY').Clear;

                // ********************************************************************************* //
                // ** Pero lo consideramos como que ha vuelto a ser modificado                    ** //
                // ********************************************************************************* //
                FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                Post;
            except
                on error : Exception do
                begin
                    Result := false;

                    UTI_GEN_Error_Log( 'Error, NO SE PUDO DAR DE ALTA el registro, ocurrió un error' +
                                       ' de conexión con la BD. La tabla ha sido ' +
                                       param_SQLQuery.Name + ' desde el módulo ' +
                                       Screen.ActiveForm.Name,
                                       error );
                end;
            end;

            UTI_RGTRO_UnLock( param_nombre_tabla,
                              var_id );
      { end; }
    end;
end;

procedure UTI_RGTRO_UnLock( param_nombre_tabla,
                            param_id : ShortString );
var var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;

    var_Momento        : TDateTime;

    var_User           : ShortString;
    var_Terminal       : ShortString;
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
        // ** Creamos el SQLQuery                                                                 ** //
        // ***************************************************************************************** //
        var_SQLQuery          := TSQLQuery.Create(nil);
        var_SQLQuery.Database := var_SQLConnector;

        // ***************************************************************************************** //
        // ** VEMOS CUAL ES EL USUARIO QUE CREA O MODIFICA EL REGISTRO                            ** //
        // ***************************************************************************************** //
        var_User := Trim(IntToStr(Form_Menu.public_User));

        // ***************************************************************************************** //
        // ** VEMOS CUAL ES EL MOMENTO EN EL QUE SE CREA O MODIFICA EL REGISTRO                   ** //
        // ***************************************************************************************** //
        // ** ESTO CAMBIARA SEGUN SEA UNA MODIFICACION O UN ALTA O UN BORRADO                     ** //
        // ***************************************************************************************** //
        var_Momento := UTI_CN_Fecha_Hora;

       // ****************************************************************************************** //
       // ** VEMOS CUAL ES LA TERMINAL, SI NO ESTA CONFIGURADA EN EL FICHERO .INI SE PON DRA LA   ** //
       // ** TERMINAL COMO 0                                                                      ** //
       // ****************************************************************************************** //
        var_Terminal := '0';
        if Trim(form_menu.public_Terminal) <> '' then
        begin
             var_Terminal := form_menu.public_Terminal;
        end;

        with var_SQLQuery do
        begin
            // ************************************************************************************* //
            // ** Creamos la SQL                                                                  ** //
            // ************************************************************************************* //
            SQL.Clear;

            SQL.Add( 'DELETE FROM users_row_lock' );
            SQL.Add(  'WHERE tb = ' + UTI_GEN_Comillas(param_nombre_tabla) );
            SQL.Add(    'AND id = ' + param_id );

            // ************************************************************************************* //
            // ** Le damos un nombre a la tabla o procedimiento                                   ** //
            // ************************************************************************************* //
            Name := 'SQLQuery_UTI_RGTRO_UnLock';
        end;

        // ***************************************************************************************** //
        // ** Ejecutamos la SQL                                                                   ** //
        // ***************************************************************************************** //
        var_SQLQuery.ExecSQL;
        var_SQLTransaction.Commit;

        // ***************************************************************************************** //
        // ** Destruimos la tabla y conexiones                                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery.Free;

        // ***************************************************************************************** //
        // ** Cerramos La transacción y la conexión con la BD                                     ** //
        // ***************************************************************************************** //
        UTI_CN_Connector_Close( var_SQLTransaction,
                                var_SQLConnector );

        var_SQLTransaction.Free;
        var_SQLConnector.Free;
    except
        on error : Exception do
        begin
            UTI_GEN_Error_Log( 'Ocurrió un error al intentar desbloquear el registro. Debe avisar' +
                               ' de este error, pues el registro va a permanecer siempre bloqueado',
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

function UTI_RGTRO_Borrar_Cabecera_y_Detalle( param_nombre_campo,
                                              param_tabla_Cabecera,
                                              param_tabla_Detalle : String;
                                              param_SQLQuery_Cabecera,
                                              param_SQLQuery_Detalle : TSQLQuery;
                                              param_Solo_Ver : Boolean;
                                              param_Menu_Worked : Integer ) : Boolean;
var var_msg : TStrings;
begin
    Result := false;

    with param_SQLQuery_Cabecera do
    begin
        var_msg := TStringList.Create;

        if RecordCount > 0 then
        begin
            if param_Solo_Ver = True then
            begin
                var_msg.Clear;
                var_msg.Add('Sólo se puede CONSULTAR.');
                UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
            end else begin
                if FieldByName('Del_WHEN').IsNull then
                begin
                     Result := UTI_RGTRO_Borrar_BAJA_Cabecera_y_Detalle( param_nombre_campo, param_tabla_Cabecera, param_tabla_Detalle, param_SQLQuery_Cabecera, param_SQLQuery_Detalle, var_msg, param_Menu_Worked );
                end else begin
                    Result := UTI_RGTRO_Borrar_ALTA_Cabecera_y_Detalle( param_nombre_campo, param_tabla_Cabecera, param_tabla_Detalle, param_SQLQuery_Cabecera, param_SQLQuery_Detalle, var_msg );
                end;
            end;
        end else begin
            var_msg.Clear;
            var_msg.Add(rs_no_Hay_Rgtros);
            UTI_GEN_Aviso(true, var_msg, rs_No_Se_Puede, True, False);
        end;

        var_msg.Free;
    end;
end;

function UTI_RGTRO_Borrar_BAJA_Cabecera_y_Detalle( param_nombre_campo,
                                                   param_tabla_Cabecera,
                                                   param_tabla_Detalle : String;
                                                   param_SQLQuery_Cabecera,
                                                   param_SQLQuery_Detalle : TSQLQuery;
                                                   param_msg : TStrings;
                                                   param_Menu_Worked : Integer ) : Boolean;
var var_Form_Estado_Registro : TForm_Estado_Registro;
    var_OK                   : Boolean;
    var_id                   : ShortString;
    var_estoy_en             : ShortInt;
begin
    Result := true;

    with param_SQLQuery_Cabecera do
    begin
        try
            var_id := FieldByName('id').AsString;

            if UTI_RGTRO_isLock( param_tabla_Cabecera,
                                 var_id,
                                 true ) = true then
            begin
                 Exit;
            end else begin
                if UTI_RGTRO_Lock( param_tabla_Cabecera,
                                   var_id ) = true then
                     Edit
                else Exit;
            end;

            var_estoy_en := 0;

            // ************************************************************************************* //
            // ** Marcamos el registro de cabecera como borrado                                   ** //
            // ************************************************************************************* //
            FieldByName('Del_WHEN').Value    := UTI_CN_Fecha_Hora;
            FieldByName('Del_Id_User').Value := Form_Menu.public_User;

            // ************************************************************************************* //
            // ** Llamo a un formulario para que pregunte por el motivo por el que se da de baja  ** //
            // ************************************************************************************* //
            var_Form_Estado_Registro := TForm_Estado_Registro.Create(nil);

            var_Form_Estado_Registro.Edit_Usuario_Baja.Text           := UTI_USR_Traer_Nombre_Usuario(Form_Menu.public_User);
            var_Form_Estado_Registro.Edit_Fecha_Baja.Text             := FieldByName('Del_WHEN').AsString;

            var_Form_Estado_Registro.Edit_Fecha_Ult_Modificacion.Text := FieldByName('Change_WHEN').AsString;
            var_Form_Estado_Registro.Edit_Fecha_Alta.Text             := FieldByName('Insert_WHEN').AsString;

            if not FieldByName('Change_Id_User').IsNull then
            begin
                var_Form_Estado_Registro.Edit_Usuario_Ult_Modificacion.Text := UTI_USR_Traer_Nombre_Usuario(FieldByName('Change_Id_User').Value);
            end;

            if not FieldByName('Insert_Id_User').IsNull then
            begin
                var_Form_Estado_Registro.Edit_Usuario_Alta.Text := UTI_USR_Traer_Nombre_Usuario(FieldByName('Insert_Id_User').Value);
            end;

            var_OK := True;
            if UTI_USR_Obligado_WHY_Delete_SN(param_Menu_Worked) = true then
            begin
                var_OK := False;
                While Trim(var_Form_Estado_Registro.Edit_Motivo_Baja.Text) = '' do
                begin
                    var_Form_Estado_Registro.ShowModal;
                    if var_Form_Estado_Registro.public_Pulso_Aceptar = true then
                    begin
                        var_OK := True;
                        if Trim(var_Form_Estado_Registro.Edit_Motivo_Baja.Text) = '' then
                        begin
                            param_msg.Clear;
                            param_msg.Add('Está Obligado a decirme PORQUE BORRAR el registro.');
                            UTI_GEN_Aviso(true, param_msg, 'NO PUEDO BORRAR', True, False);
                        end;
                    end else begin
                        var_OK := False;
                        Break;
                    end;
                end;
            end;

            FieldByName('Del_WHY').AsString := var_Form_Estado_Registro.Edit_Motivo_Baja.Text;
            var_Form_Estado_Registro.Free;

            if var_OK = True then
            begin
                var_estoy_en := 1;

                // ********************************************************************************* //
                // ** Como se guardo el motivo del porque se dió de baja o no hizo falta pedirlo, ** //
                // ** pasamos a borrar primero las líneas de detalle y luego a grabar el registro ** //
                // ** cabecera conforme está ahora mismo                                          ** //
                // ********************************************************************************* //
                if UTI_RGTRO_BAJA_o_ALTA_Rgtro( false,
                                                param_tabla_Detalle,
                                                param_nombre_campo,
                                                param_SQLQuery_Cabecera.FieldByName('id').AsString ) = true then
                begin
                    var_estoy_en := 0;

                    // ***************************************************************************** //
                    // ** Grabamos el registro de cabecera como que ha sido borrado               ** //
                    // ***************************************************************************** //
                    Post;
                end else begin
                    // ***************************************************************************** //
                    // ** Se produjo un error al marcar los registros de la tabla detalle como que** //
                    // ** están borrados                                                          ** //
                    // ***************************************************************************** //
                    Cancel;
                end;
            end else begin
                Cancel;
            end;
        except
            on error : Exception do
            begin

                if Trim(param_tabla_Detalle) = '' then
                begin
                    UTI_GEN_Error_Log( 'Error, NO SE PUDO BORRAR el registro, ocurrió un error de' +
                                       ' conexión con la BD. La tabla ha sido ' + param_SQLQuery_Cabecera.Name +
                                       ' desde el módulo ' + Screen.ActiveForm.Name,
                                       error );
                end else begin
                    if var_estoy_en = 1 then
                    begin
                        UTI_GEN_Error_Log( 'Error, NO SE PUDO BORRAR el registro de detalle, ocurrió un error' +
                                           ' de conexión con la BD. La tabla ha sido ' +
                                           param_SQLQuery_Detalle.Name + ' desde el módulo ' +
                                           Screen.ActiveForm.Name,
                                           error );
                    end else begin
                        UTI_GEN_Error_Log( 'Error, NO SE PUDO BORRAR el registro de cabecera, ocurrió un error' +
                                           ' de conexión con la BD. La tabla ha sido ' +
                                           param_SQLQuery_Cabecera.Name + ' desde el módulo ' +
                                           Screen.ActiveForm.Name,
                                           error );
                    end;
                end;

                try
                    var_Form_Estado_Registro.Free;
                except
                end;

                Result := false
            end;
        end;

        UTI_RGTRO_UnLock( param_tabla_Cabecera, var_id );
    end;
end;

function UTI_RGTRO_Borrar_ALTA_Cabecera_y_Detalle( param_nombre_campo,
                                                   param_tabla_Cabecera,
                                                   param_tabla_Detalle : String;
                                                   param_SQLQuery_Cabecera,
                                                   param_SQLQuery_Detalle : TSQLQuery;
                                                   param_msg : TStrings ) : Boolean;
var var_id       : String;
    var_estoy_en : ShortInt;
begin
    Result := true;

    with param_SQLQuery_Cabecera do
    begin
        try
            // ************************************************************************************* //
            // ** Comprobamos si podemos bloquear la cabecera                                     ** //
            // ************************************************************************************* //
            var_id := FieldByName('id').AsString;

            if UTI_RGTRO_isLock( param_tabla_Cabecera,
                                 var_id,
                                 true ) = true then
            begin
                Exit;
            end else begin
                if UTI_RGTRO_Lock( param_tabla_Cabecera,
                                   var_id ) = true then
                     Edit
                else Exit;
            end;

            // ************************************************************************************* //
            // ** Ahora vamos a dar de alta todas las líneas de detalle. No hace falta bloquearlas** //
            // ** porque al bloquear la cabecera no se puede acceder a las líneas de detalle      ** //
            // ************************************************************************************* //
            var_estoy_en := 1;
            if UTI_RGTRO_BAJA_o_ALTA_Rgtro( true,
                                            param_tabla_Detalle,
                                            param_nombre_campo,
                                            param_SQLQuery_Cabecera.FieldByName('id').AsString ) = true then
            begin
                var_estoy_en := 0;

                // ************************************************************************************* //
                // ** Le quitamos las marcas del borrado de registro a la tabla cabecera              ** //
                // ************************************************************************************* //
                FieldByName('Del_WHEN').Clear;
                FieldByName('Del_Id_User').Clear;
                FieldByName('Del_WHY').Clear;

                // ************************************************************************************* //
                // ** Pero consideramos como que ha vuelto a ser modificado el registro de cabecera   ** //
                // ************************************************************************************* //
                FieldByName('Change_WHEN').Value    := UTI_CN_Fecha_Hora;
                FieldByName('Change_Id_User').Value := Form_Menu.public_User;

                // ************************************************************************************* //
                // ** Grabamos el registro de la tabla de cabecera                                    ** //
                // ************************************************************************************* //
                Post;
            end else begin
                Cancel;
            end;
        except
            on error : Exception do
            begin
                Result := false;

                if Trim(param_tabla_Detalle) = '' then
                begin
                    UTI_GEN_Error_Log( 'Error, NO SE PUDO DAR DE ALTA el registro, ocurrió un error' +
                                       ' de conexión con la BD. La tabla ha sido ' +
                                       param_SQLQuery_Cabecera.Name + ' desde el módulo ' +
                                       Screen.ActiveForm.Name,
                                       error );
                end else begin
                    if var_estoy_en = 1 then
                    begin
                        UTI_GEN_Error_Log( 'Error, NO SE PUDO DAR DE ALTA el registro de detalle, ocurrió un error' +
                                           ' de conexión con la BD. La tabla ha sido ' +
                                           param_SQLQuery_Detalle.Name + ' desde el módulo ' +
                                           Screen.ActiveForm.Name,
                                           error );
                    end else begin
                        UTI_GEN_Error_Log( 'Error, NO SE PUDO DAR DE ALTA el registro de cabecera, ocurrió un error' +
                                           ' de conexión con la BD. La tabla ha sido ' +
                                           param_SQLQuery_Cabecera.Name + ' desde el módulo ' +
                                           Screen.ActiveForm.Name,
                                           error );
                    end;
                end;
            end;
        end;

        UTI_RGTRO_UnLock( param_tabla_Cabecera, var_id );
    end;
end;

function UTI_RGTRO_BAJA_o_ALTA_Rgtro( param_alta : Boolean;
                                      param_nombre_tabla,
                                      param_nombre_campo,
                                      param_valor_nombre_campo : String ) : Boolean;
var var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;

    var_Momento        : TDateTime;

    var_User           : ShortString;
    var_Terminal       : ShortString;
begin
    Result := false;

    try
        // ***************************************************************************************** //
        // ** Creamos la Transaccion y la conexión con el motor BD, y la abrimos                  ** //
        // ***************************************************************************************** //
        var_SQLTransaction := TSQLTransaction.Create(nil);
        var_SQLConnector   := TSQLConnector.Create(nil);

        if UTI_CN_Connector_Open( var_SQLTransaction,
                                  var_SQLConnector ) = False then UTI_GEN_Salir;

        // ***************************************************************************************** //
        // ** Creamos el SQLQuery                                                                 ** //
        // ***************************************************************************************** //
        var_SQLQuery          := TSQLQuery.Create(nil);
        var_SQLQuery.Database := var_SQLConnector;

        // ***************************************************************************************** //
        // ** VEMOS CUAL ES EL USUARIO QUE CREA O MODIFICA EL REGISTRO                            ** //
        // ***************************************************************************************** //
        var_User := Trim(IntToStr(Form_Menu.public_User));

        // ***************************************************************************************** //
        // ** VEMOS CUAL ES EL MOMENTO EN EL QUE SE CREA O MODIFICA EL REGISTRO                   ** //
        // ***************************************************************************************** //
        // ** ESTO CAMBIARA SEGUN SEA UNA MODIFICACION O UN ALTA O UN BORRADO                     ** //
        // ***************************************************************************************** //
        var_Momento := UTI_CN_Fecha_Hora;

       // ****************************************************************************************** //
       // ** VEMOS CUAL ES LA TERMINAL, SI NO ESTA CONFIGURADA EN EL FICHERO .INI SE PON DRA LA   ** //
       // ** TERMINAL COMO 0                                                                      ** //
       // ****************************************************************************************** //
        var_Terminal := '0';
        if Trim(form_menu.public_Terminal) <> '' then
        begin
             var_Terminal := form_menu.public_Terminal;
        end;

        with var_SQLQuery do
        begin
            // ************************************************************************************* //
            // ** Creamos la SQL                                                                  ** //
            // ************************************************************************************* //
            SQL.Clear;

            if param_alta = true then
            begin
                SQL.Add( 'UPDATE ' + Trim(param_nombre_tabla) );
                SQL.Add( 'SET Del_WHEN = NULL,' );
                SQL.Add(     'Del_Id_User = NULL,' );
                SQL.Add(     'Del_WHY = NULL,' );
                SQL.Add(     'Change_WHEN = ' + UTI_GEN_Comillas(UTI_GEN_Format_Fecha_Hora(var_Momento, true)) + ',' );
                SQL.Add(     'Change_Id_User = ' + Trim(var_User) );
                SQL.Add( 'WHERE ' + Trim(param_nombre_campo) + ' = ' + Trim(param_valor_nombre_campo) );
                SQL.Add( '  AND Del_WHY = ' + UTI_GEN_Comillas('.oOo.') + ';' );
            end else begin
                SQL.Add( 'UPDATE ' + Trim(param_nombre_tabla) );
                SQL.Add( 'SET Del_WHEN = ' + UTI_GEN_Comillas(UTI_GEN_Format_Fecha_Hora(var_Momento, true)) + ',' );
                SQL.Add(     'Del_Id_User = ' + Trim(var_User) + ',' );
                SQL.Add(     'Del_WHY = ' + UTI_GEN_Comillas('.oOo.') );
                SQL.Add( 'WHERE ' + Trim(param_nombre_campo) + ' = ' + Trim(param_valor_nombre_campo) );
                SQL.Add( '  AND Del_WHY IS NULL;' );
            end;

            // ************************************************************************************* //
            // ** Le damos un nombre a la tabla o procedimiento                                   ** //
            // ************************************************************************************* //
            Name := 'UTI_RGTRO_BAJA_o_ALTA_Rgtro';
        end;

        // ***************************************************************************************** //
        // ** Ejecutamos la SQL                                                                   ** //
        // ***************************************************************************************** //
        var_SQLQuery.ExecSQL;
        var_SQLTransaction.Commit;

        // ***************************************************************************************** //
        // ** Destruimos la tabla y conexiones                                                    ** //
        // ***************************************************************************************** //
        var_SQLQuery.Free;

        // ***************************************************************************************** //
        // ** Cerramos La transacción y la conexión con la BD                                     ** //
        // ***************************************************************************************** //
        if UTI_CN_Connector_Close( var_SQLTransaction,
                                   var_SQLConnector ) = False then
        begin
             Result := false;
        end;

        var_SQLTransaction.Free;
        var_SQLConnector.Free;

        Result := true;
    except
        on error : Exception do
        begin
            Result := false;

            if param_alta = true then
            begin
                 UTI_GEN_Error_Log( 'Ocurrió un error al intentar marcar el registro como dado de alta.',
                                    error );
            end else begin
                UTI_GEN_Error_Log( 'Ocurrió un error al intentar marcar el registro como dado de baja.',
                                   error );
            end;

            try
                var_SQLTransaction.Free;
                var_SQLConnector.Free;
                var_SQLQuery.Free;
            except
            end;
        end;
    end;
end;

function UTI_RGTRO_Campo_es_DiaHora( param_FieldType : TFieldType;
                                     param_parte_de_SQL_tipoDato : String ) : Boolean;
begin
  Result := false;

  if    ( UpperCase(param_parte_de_SQL_tipoDato) = UpperCase('DIAHORA') )
     or ( param_FieldType = ftDateTime )
  then
  begin
    Result := true;
  end;
end;

function UTI_RGTRO_Campo_es_Dia( param_FieldType : TFieldType;
                                 param_parte_de_SQL_tipoDato : String ) : Boolean;
begin
  Result := false;

  if    ( UpperCase(param_parte_de_SQL_tipoDato) = UpperCase('DIA') )
     or ( param_FieldType = ftDate )
  then
  begin
    Result := true;
  end;
end;

function UTI_RGTRO_Campo_es_Hora( param_FieldType : TFieldType;
                                  param_parte_de_SQL_tipoDato : String ) : Boolean;
begin
  Result := false;

  if    ( UpperCase(param_parte_de_SQL_tipoDato) = UpperCase('HORA') )
     or ( param_FieldType = ftTime )
  then
  begin
    Result := true;
  end;
end;

function UTI_RGTRO_Campo_es_Numero( param_FieldType : TFieldType;
                                    param_parte_de_SQL_tipoDato : String ) : Boolean;
begin
  Result := false;

  if    (
           ( UpperCase(param_parte_de_SQL_tipoDato) = UpperCase('NUMERO') ) or
           ( UpperCase(param_parte_de_SQL_tipoDato) = UpperCase('NÙMERO') ) or
           ( UpperCase(param_parte_de_SQL_tipoDato) = UpperCase('NÚMERO') )
        )
     or (
           ( param_FieldType = ftAutoInc )                                  or
           ( param_FieldType = ftCurrency )                                 or
           ( param_FieldType = ftWord )                                     or
           ( param_FieldType = ftSmallint )                                 or
           ( param_FieldType = ftInteger )                                  or
           ( param_FieldType = ftFloat )                                    or
           ( param_FieldType = ftBCD )                                      or
           ( param_FieldType = ftLargeint )
        )
  then
  begin
    Result := true;
  end;
end;

function UTI_RGTRO_Campo_es_Texto( param_FieldType : TFieldType;
                                   param_parte_de_SQL_tipoDato : String ) : Boolean;
begin
  Result := false;

  if    (
          UpperCase(param_parte_de_SQL_tipoDato) = UpperCase('TEXTO')
        )
     or (
          ( param_FieldType = ftWideString ) or
          ( param_FieldType = ftMemo )       or
          ( param_FieldType = ftFmtMemo )    or
          ( param_FieldType = ftFixedChar )  or
          ( param_FieldType = ftString )
        )
  then
  begin
    Result := true;
  end;
end;

procedure UTI_RGTRO_where_o_And(var param_where_o_and : ShortString);
begin
  if Trim(param_where_o_and) = '' then
       param_where_o_and := 'WHERE '
  else param_where_o_and := 'AND ';

end;

function UTI_RGTRO_Existe_Ya( param_nombre_tabla          : String;
                              param_order_by              : String;
                              param_id_a_no_traer         : String;
                              param_Campos_para_Existe_ya : Array of TCampos_para_Existe_ya ) : Trecord_Existe;
var
  var_SQL            : TStrings;
  var_SQLTransaction : TSQLTransaction;
  var_SQLConnector   : TSQLConnector;
  var_SQLQuery       : TSQLQuery;
  var_antes_de_campo : AnsiString;
  var_where_o_and    : ShortString;
  var_Contador       : Integer;

begin
  try
    var_antes_de_campo := Trim(param_nombre_tabla) + '.';
    var_where_o_and    := '';

    // ********************************************************************************************* //
    // ** Creamos la Transaccion y la conexión con el motor BD, y la abrimos                      ** //
    // ********************************************************************************************* //
    var_SQLTransaction := TSQLTransaction.Create(nil);
    var_SQLConnector   := TSQLConnector.Create(nil);

    if UTI_CN_Connector_Open( var_SQLTransaction,
                              var_SQLConnector ) = False then UTI_GEN_Salir;

    // ********************************************************************************************* //
    // ** Creamos la SQL Según el motor de BD                                                     ** //
    // ********************************************************************************************* //
    var_SQL := TStringList.Create;

    var_SQL.Add('SELECT ' + var_antes_de_campo + '*' );
    var_SQL.Add(  'FROM ' + Trim(param_nombre_tabla) );

    for var_Contador := 0 to Length(param_Campos_para_Existe_ya) do
    begin
      if     ( Trim(param_Campos_para_Existe_ya[var_Contador].Campo_Valor) <> '' )
         and ( Trim(param_Campos_para_Existe_ya[var_Contador].Campo_Nombre) <> '' ) then
      begin
        UTI_RGTRO_where_o_And(var_where_o_and);
        if param_Campos_para_Existe_ya[var_Contador].Campo_Tipo = 0 then // Numerico
          var_SQL.Add( var_where_o_and +
                       var_antes_de_campo +
                       Trim(param_Campos_para_Existe_ya[var_Contador].Campo_Nombre) +
                       ' = ' +
                       Trim(param_Campos_para_Existe_ya[var_Contador].Campo_Valor) );

        if param_Campos_para_Existe_ya[var_Contador].Campo_Tipo = 1 then // String
          var_SQL.Add( var_where_o_and +
                       var_antes_de_campo +
                       Trim(param_Campos_para_Existe_ya[var_Contador].Campo_Nombre) +
                       ' = ' +
                       UTI_GEN_Comillas(Trim(param_Campos_para_Existe_ya[var_Contador].Campo_Valor)) );

        if param_Campos_para_Existe_ya[var_Contador].Campo_Tipo = 2 then // Fecha ó Fecha+Hora
          var_SQL.Add( var_where_o_and +
                       var_antes_de_campo +
                       Trim(param_Campos_para_Existe_ya[var_Contador].Campo_Nombre) +
                       ' = ' +
                       UTI_GEN_Comillas(UTI_GEN_Format_Fecha_Hora(StrToDateTime(param_Campos_para_Existe_ya[var_Contador].Campo_Valor), true)) );

        if param_Campos_para_Existe_ya[var_Contador].Campo_Tipo = 3 then // Hora
          var_SQL.Add( var_where_o_and +
                       var_antes_de_campo +
                       Trim(param_Campos_para_Existe_ya[var_Contador].Campo_Nombre) +
                       ' = ' +
                       UTI_GEN_Comillas(Trim(param_Campos_para_Existe_ya[var_Contador].Campo_Valor)) );

      end;
    end;

    if Trim(param_id_a_no_traer) <> '' then
    begin
      UTI_RGTRO_where_o_And(var_where_o_and);
      var_SQL.Add( var_where_o_and +
                   ' NOT ' + var_antes_de_campo + 'id = ' +
                   Trim(param_id_a_no_traer) );
    end;

    var_SQL.Add(param_order_by );

    // ********************************************************************************************* //
    // **  Abrimos la tabla                                                                       ** //
    // ********************************************************************************************* //
    var_SQLQuery          := TSQLQuery.Create(nil);
    var_SQLQuery.DataBase := var_SQLConnector;
    var_SQLQuery.Name     := 'SQLQuery_Existe_' + Trim(param_nombre_tabla);

    if UTI_TB_Query_Open( '',
                          '',
                          '',
                          var_SQLConnector,
                          var_SQLQuery,
                          -1, // asi me trae todos los registros de golpe
                          var_SQL.Text ) = False then UTI_GEN_Salir;

    // ********************************************************************************************* //
    // ** TRABAJAMOS CON LOS REGISTROS DEVUELTOS                                                  ** //
    // ********************************************************************************************* //
    // ** Si el módulo no se creó, no se permite entrar en él ... Result := False                 ** //
    // ********************************************************************************************* //
    Result.Fallo_en_Conexion_BD := false;
    Result.Existe               := false;
    Result.deBaja               := 'N';

    if var_SQLQuery.RecordCount > 0 then
    begin
      Result.Existe := true;

      if not var_SQLQuery.FieldByName('Del_WHEN').IsNull then
        Result.deBaja := 'S';
    end;

    // ********************************************************************************************* //
    // ** Cerramos la tabla                                                                       ** //
    // ********************************************************************************************* //
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
      UTI_GEN_Error_Log( 'Error al comprobar si ya existe el registro.' +
                         'La tabla ha sido ' + var_SQLQuery.Name + ' desde el módulo ' +
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

end.

