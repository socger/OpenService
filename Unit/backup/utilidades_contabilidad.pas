unit utilidades_contabilidad;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, sqldb, db, utilidades_bd, utilidades_general, utilidades_usuarios, // Grids,
  utilidades_forms_Filtrar;

resourcestring
  rs_uti_conta_001 = 'AVISAMOS DE ... ';

  procedure UTI_CONTA_esta_Cta_Ctble_BIEN( param_comprobar : ShortString; param_msg : TStrings; param_SQLQuery : TSQLQuery; param_Cta_Ctble_elegida, param_Nombre_Tabla, param_Nombre_Cta_Ctble, param_mensaje_falta : String );
  procedure UTI_CONTA_esta_NIF_BIEN( param_comprobar : ShortString; param_msg : TStrings; param_SQLQuery : TSQLQuery; param_Nombre_Tabla : String );

  function  UTI_CONTA_Borrar_Del_Todo_Ftra_Cabecera( param_tabla, param_id_facturas : String ) : Boolean;
  function  UTI_CONTA_Borrar_Del_Todo_Ftra_Detalle( param_tabla, param_id_facturas : String ) : Boolean;

  function  UTI_CONTA_Existe_Ftra_Alb_Pdo_Pto( param_Tabla, param_id_empresas, param_Serie, param_Numero : String ) : String;

  function  UTI_CONTA_Esta_cerrada_la_Ftra( param_id_facturas, param_Compras_o_Ventas_CV : String ) : String;
  function  UTI_CONTA_Esta_cerrada_la_fecha_para_Ftra( param_Fecha, param_id_empresas, param_Compras_o_Ventas_CV : String ) : String;

  function  UTI_CONTA_Existe_cta_ctble_Ya( param_id, param_cta, param_nombre_tabla, param_Nombre_Cta_Ctble : String ) : Trecord_Existe;
  function  UTI_CONTA_Existe_el_NIF_Ya( param_id, param_nif_cif, param_nombre_tabla : ShortString ) : Trecord_Existe;
  function  IsValidNIF(param_NIF : String) : Boolean;

  function UTI_CONTA_Elegir_Diario_tipo : TRecord_Rgtro_Comun;

implementation

uses menu, elegir_diarios_tipos;

function UTI_CONTA_Existe_cta_ctble_Ya( param_id,
                                        param_cta,
                                        param_nombre_tabla,
                                        param_Nombre_Cta_Ctble : String ) : Trecord_Existe;
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

        var_SQL.Add('SELECT x.*' );
        var_SQL.Add(  'FROM ' + Trim(param_nombre_tabla) + ' AS x' );
        var_SQL.Add(' WHERE x.' + Trim(param_Nombre_Cta_Ctble) + ' = ' + UTI_GEN_Comillas(Trim(param_cta)) );

        if Trim(param_id) <> '' then
        begin
             var_SQL.Add(  ' AND NOT x.id = ' + Trim(param_id) );
        end;

        var_SQL.Add(' ORDER BY x.' + Trim(param_Nombre_Cta_Ctble) + ' ASC' );

      { ****************************************************************************
        Abrimos la tabla
        **************************************************************************** }
        var_SQLQuery      := TSQLQuery.Create(nil);
        var_SQLQuery.Name := 'SQLQuery_UTI_CONTA_Existe_cta_ctble_Ya';

        if UTI_TB_Query_Open( '',
                              '',
                              '',
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

        if var_SQLQuery.RecordCount > 0 then
        begin
            Result.Existe := true;
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
             UTI_GEN_Error_Log( 'Error al comprobar si la cuenta contable existe ya.' +
                                'La tabla ha sido ' + var_SQLQuery.Name + '/' + Trim(param_nombre_tabla) +
                                ' desde el módulo ' + Screen.ActiveForm.Name,
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

function UTI_CONTA_Existe_el_NIF_Ya( param_id,
                                     param_nif_cif,
                                     param_nombre_tabla : ShortString ) : Trecord_Existe;
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

        var_SQL.Add('SELECT x.*' );
        var_SQL.Add(  'FROM ' + Trim(param_nombre_tabla) + ' AS x' );
        var_SQL.Add(' WHERE x.nif_cif = ' + UTI_GEN_Comillas(Trim(param_nif_cif)) );

        if Trim(param_id) <> '' then
        begin
             var_SQL.Add(  ' AND NOT x.id = ' + Trim(param_id) );
        end;

        var_SQL.Add(' ORDER BY x.nif_cif ASC' );

      { ****************************************************************************
        Abrimos la tabla
        **************************************************************************** }
        var_SQLQuery      := TSQLQuery.Create(nil);
        var_SQLQuery.Name := 'SQLQuery_UTI_CONTA_Existe_el_NIF_Ya';

        if UTI_TB_Query_Open( '',
                              '',
                              '',
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

        if var_SQLQuery.RecordCount > 0 then
        begin
            Result.Existe := true;
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
             UTI_GEN_Error_Log( 'Error al comprobar si el NIF existe ya.' +
                                'La tabla ha sido ' + var_SQLQuery.Name + '/' + Trim(param_nombre_tabla) +
                                ' desde el módulo ' + Screen.ActiveForm.Name,
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

procedure UTI_CONTA_esta_NIF_BIEN( param_comprobar : ShortString;
                                   param_msg : TStrings;
                                   param_SQLQuery : TSQLQuery;
                                   param_Nombre_Tabla : String );
var var_Existe_NIF_CIF_NIE : Trecord_Existe;
    var_msg        : String;
begin
    if Trim(UpperCase(param_comprobar)) = 'S' then
    begin
        with param_SQLQuery do
        begin
            if Trim(FieldByName('nif_cif').AsString) = '' then
            begin
                param_msg.Add( '* El NIF/CIF/NIE.' );
                Exit;
            end else begin
                // ************************************************************************************* //
                // ** COMPROBAMOS QUE SEA CORRECTA SU ESCRITURA ... FORMULA                           ** //
                // ************************************************************************************* //
                if IsValidNIF(Trim(FieldByName('nif_cif').AsString)) = false then
                begin
                    param_msg.Add( '* El NIF/CIF/NIE no es correcto.' );
                    Exit;
                end;

                // ************************************************************************************* //
                // ** COMPROBAMOS SI EXISTE EL NIF/CIF/NIE YA                                         ** //
                // ************************************************************************************* //
                if param_SQLQuery.State = dsEdit then
                begin
                    // ********************************************************************************* //
                    // ** ESTAMOS EN MODO EDICION                                                     ** //
                    // ********************************************************************************* //
                    var_Existe_NIF_CIF_NIE := UTI_CONTA_Existe_el_NIF_Ya( FieldByName('id').AsString,
                                                                          FieldByName('nif_cif').AsString,
                                                                          param_Nombre_Tabla );
                end else begin
                    // ********************************************************************************* //
                    // ** ESTAMOS EN MODO INSERT O APPEND                                             ** //
                    // ********************************************************************************* //
                    var_Existe_NIF_CIF_NIE := UTI_CONTA_Existe_el_NIF_Ya( '',
                                                                          FieldByName('nif_cif').AsString,
                                                                          param_Nombre_Tabla );
                end;

                if var_Existe_NIF_CIF_NIE.Fallo_en_Conexion_BD = true then
                begin
                    param_msg.Add( '* No se pudo comprobar si el NIF/CIF/NIE existe ya con anterioridad.' );
                    Exit;
                end else begin
                    if var_Existe_NIF_CIF_NIE.Existe = true then
                    begin
                        // ***************************************************************** //
                        // ** O existe la cuenta contable ya, o existe el NIF ya          ** //
                        // ***************************************************************** //
                        var_msg := '* El NIF/CIF/NIE esta repetido en ' + Trim(param_Nombre_Tabla) + '.';

                        if UpperCase(var_Existe_NIF_CIF_NIE.deBaja) = 'S' then
                        begin
                            var_msg := var_msg + ' Y el registro fué dado de baja.';
                        end;

                        param_msg.Add( var_msg );
                        Exit;
                    end;
                end;
            end;
        end;
    end;
end;

function IsValidNIF(param_NIF : String) : Boolean;
var var_sChar           : String;
    var_DNI             : String;
    var_Suma_A          : Integer;
    var_Suma_B          : Integer;
    var_Multiplicado_x2 : String;
    var_Suma_del_Impar  : Integer;
    var_Suma_C          : String;
    var_Digito_E        : String;
    var_D               : String;
begin
  { Texto recogido de WIKIPEDIA
    https://es.wikipedia.org/wiki/N%C3%BAmero_de_identificaci%C3%B3n_fiscal

    -------------------------------
    Número de identificación fiscal
    -------------------------------
    El Número de Identificación Fiscal (NIF) es la manera de identificación tributaria utilizada en
    España para las personas físicas (con documento nacional de identidad (DNI) o número de identi-
    ficación de extranjero (NIE) asignados por el Ministerio del Interior) y las personas jurídicas.
    El antecedente del NIF es el CIF, utilizado en personas jurídicas. El Real Decreto 338/1990, de
    9 de marzo, regula la composición y la forma de uso del NIF, hasta la entrada en vigor en enero
    de 2008 del Real Decreto 1065/2007, de 27 de julio.

    ===============
    Formato del NIF
    ===============
    Dependiendo de si se trata de una persona física o jurídica tenemos:


    NIF de Personas físicas
    -----------------------
    El formato del NIF consiste básicamente en ocho números más un dígito de control para españoles
    con DNI o bien en una letra, siete números y un dígito de control para el resto de personas
    físicas:

    -----------------------------------------------------------------------------------------------------
    Tipo	Formato	                                Comentario
    -----------------------------------------------------------------------------------------------------
    DNI	        8 números + dígito de control	        Españoles con documento nacional de identidad
                                                        (DNI) asignado por el Ministerio del Interior
    -----------------------------------------------------------------------------------------------------
    NIF K	K + 7 números + dígito de control	Españoles menores de 14 años que carezcan de
                                                        DNI. Anterior a la entrada en vigor de la Orden
                                                        EHA/451/2008 el 1 de julio de 2008 también se
                                                        incluían los extranjeros menores de 18 años
                                                        que carecían de NIE (para los menores de la
                                                        edad indicada no es obligatorio que tengan
                                                        documentación de identidad, pero pueden solicitar
                                                        un NIF si lo necesitan), esta Orden separa las
                                                        claves de españoles y extranjeros, de forma
                                                        que los extranjeros sin NIE transitoria o
                                                        definitivamente pueden solicitar un NIF M.
    -----------------------------------------------------------------------------------------------------
    NIF L	L + 7 números + dígito de control	Españoles mayores de 14 años residentes en el
                                                        extranjero y que no tengan DNI que se trasladan
                                                        a España por un tiempo inferior a seis meses.
    -----------------------------------------------------------------------------------------------------
    NIF M	M + 7 números + dígito de control	Extranjeros sin NIE, de forma transitoria por
                                                        estar obligados a tenerlo o bien de forma
                                                        definitiva al no estar obligados a ello.
                                                        Anterior a la entrada en vigor de la Orden
                                                        EHA/451/2008 el 1 de julio de 2008 sólo se
                                                        incluían los extranjeros sin NIE miembros de
                                                        embajadas, consulados u organismos internacionales
                                                        y que estuvieran acreditados en España (no
                                                        están obligados a disponer de NIE).
    -----------------------------------------------------------------------------------------------------
    NIE X	X + 7 números + dígito de control	Extranjeros residentes en España e identificados
                                                        por la Policía con un número de identidad de
                                                        extranjero (NIE), asignado hasta el 15 de
                                                        julio de 2008. Los NIE, según la Orden de 7
                                                        de febrero de 1997, inicialmente constaban de
                                                        X + 8 números + dígito de control, la Orden
                                                        INT/2058/2008 redujo de 8 a 7 los números para
                                                        que tuvieran la misma longitud que los NIF y
                                                        CIF, y añadió las claves Y y Z antes que se
                                                        asignaran 9999999 NIE X y desbordara la capacidad
                                                        de los 7 dígitos, pero esta Orden mantiene la
                                                        validez de los NIE X de 8 dígitos anteriores ya
                                                        asignados.
    -----------------------------------------------------------------------------------------------------
    NIE Y	Y + 7 números + dígito de control	Extranjeros residentes en España e identificados
                                                        por la Policía con un NIE, asignado desde el
                                                        16 de julio de 2008 (Orden INT/2058/2008, BOE
                                                        del 15 de julio )
    -----------------------------------------------------------------------------------------------------
    NIE Z	Z + 7 números + dígito de control	Letra reservada para Extranjeros identificados
                                                        por la Policía, para cuando se agoten los 'NIE Y'
    -----------------------------------------------------------------------------------------------------


    NIF de Personas jurídicas y entidades en general
    ------------------------------------------------
    Artículo principal: Formato del código de identificación fiscal
    El formato consiste en una letra según la naturaleza jurídica de la entidad, 7 números y un dígito
    de control (que según la naturaleza jurídica de la entidad es un número o una letra). La letra
    inicial según la naturaleza jurídica es:

    ---------------------------------------------------------------------------------------------------------------------------
    Letra  Naturaleza jurídica	                                                   Carácter de control
    ---------------------------------------------------------------------------------------------------------------------------
    A	   Sociedades anónimas	                                                   Número
    B	   Sociedades de responsabilidad limitada	                           Número
    C	   Sociedades colectivas	                                           Número
    D	   Sociedades comanditarias	                                           Número
    E	   Comunidades de bienes y herencias yacentes	                           Número
    F	   Sociedades cooperativas	                                           Número
    G	   Asociaciones	                                                           Número
    H	   Comunidades de propietarios en régimen de propiedad horizontal	   Número
    J	   Sociedades civiles, con o sin personalidad jurídica	                   Número
    N	   Entidades extranjeras	                                           Letra
    P	   Corporaciones Locales	                                           Letra
    Q	   Organismos públicos	                                                   Letra
    R	   Congregaciones e instituciones religiosas	                           Letra
    S	   Órganos de la Administración del Estado y de las Comunidades Autónomas  Letra
    U	   Uniones Temporales de Empresas	                                   Número
    V	   Otros tipos no definidos en el resto de claves	                   Número
    W	   Establecimientos permanentes de entidades no residentes en España       Letra
    ---------------------------------------------------------------------------------------------------------------------------

    Desde la Orden EHA/451/2008, los CIF de las personas jurídicas y entidades extranjeras (claves N
    y W) tienen claves separadas de las españolas, anteriormente había claves compartidas y las
    entidades extranjeras se distinguían por tener el carácter de control en letra mientras que las
    entidades españolas lo tenían en número. Sólo las claves P, Q, R y S han mantenido desde que se
    crearon el carácter de control en letra, a pesar de corresponder a organismos públicos españoles.

    ===============
    Características
    ===============
    El dígito de control del NIF, sirve como código de garantía de seguridad. Su fundamento es el
    siguiente: de acuerdo al número de identificación, puede establecerse un modo por el cual saber
    si este número es correcto, o se trata de una falsificación

    Para saber si el número es correcto, el último dígito es un dígito de control que se obtiene a
    partir de los dígitos anteriores. En caso de que el dígito de control no coincida con el que se
    obtiene de los dígitos anteriores, se trataría de un número no válido.

    Si por error se introduce mal uno de los dígitos del NIF, el resultado del dígito de control será
    distinto y no coincidirá . Esto sirve para verificar que el número introducido es correcto.

    Dígito de control para números de DNI o NIE
    -------------------------------------------
    El dígito de control se obtiene a partir del número completo del DNI (8 cifras) o el NIE (letra
    X, Y o Z seguido de 7 cifras) y dividiéndolo entre 23. En el caso del NIE se sustituye la primera
    letra por un 0, un 1 o un 2, según sea X, Y o Z respectivamente. Al resto resultante de dicha
    división, que deberá estar comprendido entre 0 y 22, se le asigna la letra de control según la
    equivalencia siguiente:
    resto de la división -> 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22
    dígito de control ->    T R W A G M Y F P D X  B  N  J  Z  S  Q  V  H  L  C  K  E

    No se utilizan las letras: I, Ñ, O, U
    La I y la O se descartan para evitar confusiones con otros caracteres, como 1, l o 0. La Ñ se
    descarta para evitar confusiones con la N.

    Dígito de control para otros NIF
    --------------------------------
    En el caso de NIF que no son obtenidos a partir del DNI o NIE, el dígito de control se obtiene
    utilizando el número de 7 cifras, excluyendo la letra inicial y el último dígito, puesto que es
    el que vamos a validar.

    Procedimiento:
    1. Se suman las posiciones pares de los 7 dígitos centrales, es decir, no se tiene en cuenta la
       letra inicial ni el dígito de control. (Suma = A)
    2. Por cada uno de los dígitos de las posiciones impares, se multiplica el dígito por 2 y se
       suman las cifras del resultado
       (p.e. si el dígito es 6, el resultado sería 6 x 2 = 12 -> 1 + 2 = 3).
       Se repite la operación con todos los dígitos en posiciones impares y se suman los resultados.
       (Suma = B)
    3. Sumar el resultado de los 2 pasos anteriores. (A + B = C)
    4. El último dígito de la suma anterior (C) se lo restamos a 10, cuyo resultado sería el dígito
       de control (p.e. si C = 14, el último dígito es 4, por lo que tendríamos 10 - 4 = 6). Si el
       último dígito de la suma del paso anterior es 0 (p.e. C = 30), no se realiza resta y se toma
       el 0 como dígito de control.
       Si el dígito de control es un número, este sería el resultado de la última operación. Si se
       trata de una letra, se utilizaría la siguiente relación:
       número obtenido ->   1 2 3 4 5 6 7 8 9 0
       dígito de control -> A B C D E F G H I J  }

    Result := false;

    param_NIF := UpperCase(param_NIF);

    if length(Trim(param_NIF)) = 9 Then
    begin
        if ( UpperCase(param_NIF[1]) = '0' ) or
           ( UpperCase(param_NIF[1]) = '1' ) or
           ( UpperCase(param_NIF[1]) = '2' ) or
           ( UpperCase(param_NIF[1]) = '3' ) or
           ( UpperCase(param_NIF[1]) = '4' ) or
           ( UpperCase(param_NIF[1]) = '5' ) or
           ( UpperCase(param_NIF[1]) = '6' ) or
           ( UpperCase(param_NIF[1]) = '7' ) or
           ( UpperCase(param_NIF[1]) = '8' ) or
           ( UpperCase(param_NIF[1]) = '9' ) or

           ( UpperCase(param_NIF[1]) = 'X' ) or
           ( UpperCase(param_NIF[1]) = 'Y' ) or
           ( UpperCase(param_NIF[1]) = 'Z' ) then
        begin
            // ************************************************************************************* //
            // ** Dígito de control para números de DNI o NIE[editar]                             ** //
            // ** El dígito de control se obtiene a partir del número completo del DNI (8 cifras) ** //
            // ** o el NIE (letra X, Y o Z seguido de 7 cifras) y dividiéndolo entre 23. En el    ** //
            // ** caso del NIE se sustituye la primera letra por un 0, un 1 o un 2, según sea X,  ** //
            // ** Y o Z respectivamente. Al resto resultante de dicha división, que deberá estar  ** //
            // ** comprendido entre 0 y 22, se le asigna la letra de control según la equivalencia** //
            // ** siguiente:                                                                      ** //
            // ** resto de división -> 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 ** //
            // ** dígito de control -> T R W A G M Y F P D X  B  N  J  Z  S  Q  V  H  L  C  K  E  ** //
            // ** No se utilizan las letras: I, Ñ, O, U                                           ** //
            // ** La I y la O se descartan para evitar confusiones con otros caracteres, como 1,  ** //
            // ** l o 0. La Ñ se descarta para evitar confusiones con la N.                       ** //
            // ************************************************************************************* //
            var_DNI := Copy(param_NIF, 1, 8);

            var_sChar  := Copy('TRWAGMYFPDXBNJZSQVHLCKE', StrToInt(var_DNI) Mod 23 + 1, 1);
            Result := var_sChar = param_NIF[9];
        end else begin
            // ************************************************************************************* //
            // ** Dígito de control para otros NIF
            // ************************************************************************************* //
            // ** En el caso de NIF que no son obtenidos a partir del DNI o NIE, el dígito de     ** //
            // ** control se obtiene utilizando el número de 7 cifras, excluyendo la letra inicial** //
            // ** y el último dígito, puesto que es el que vamos a validar.                       ** //
            // ** Procedimiento:                                                                  ** //
            // **                                                                                 ** //
            // ** 1. Se suman las posiciones pares de los 7 dígitos centrales, es decir, no se    ** //
            // **    tiene en cuenta la letra inicial ni el dígito de control. (Suma = A)         ** //
            // **                                                                                 ** //
            // ** 2. Por cada uno de los dígitos de las posiciones impares, se multiplica el      ** //
            // **    dígito por 2 y se suman las cifras del resultado (p.e. si el dígito es 6, el ** //
            // **    resultado sería 6 x 2 = 12 -> 1 + 2 = 3). Se repite la operación con todos   ** //
            // **    los dígitos en posiciones impares y se suman los resultados. (Suma = B)      ** //
            // **                                                                                 ** //
            // ** 3. Sumar el resultado de los 2 pasos anteriores. (A + B = C)                    ** //
            // **                                                                                 ** //
            // ** 4. El último dígito de la suma anterior (C) se lo restamos a 10, cuyo resultado ** //
            // **    sería el dígito de control (p.e. si C = 14, el último dígito es 4, por lo que** //
            // **    tendríamos 10 - 4 = 6). Si el último dígito de la suma del paso anterior es 0** //
            // **    (p.e. C = 30), no se realiza resta y se toma el 0 como dígito de control.    ** //
            // **                                                                                 ** //
            // **    Si el dígito de control es un número, este sería el resultado de la última   ** //
            // **    operación. Si se trata de una letra, se utilizaría la siguiente relación:    ** //
            // **                                                                                 ** //
            // **    número obtenido ->   1 2 3 4 5 6 7 8 9 0                                     ** //
            // **    dígito de control -> A B C D E F G H I J                                     ** //
            // ************************************************************************************* //


            // ************************************************************************************* //
            // ** Utilizamos los siete dígitos centrales                                          ** //
            // ************************************************************************************* //
            var_DNI := Copy(param_NIF, 2, 7);

            // ************************************************************************************* //
            // ** 1. Se suman las posiciones pares de los 7 dígitos centrales, es decir, no se    ** //
            // **    tiene en cuenta la letra inicial ni el dígito de control. (Sum a= A)         ** //
            // **    Resumiendo Sumar los dígitos de la posiciones pares. Suma = A                ** //
            // ************************************************************************************* //
            var_Suma_A := 0;
            var_Suma_A := var_Suma_A + StrToInt(var_DNI[2]);
            var_Suma_A := var_Suma_A + StrToInt(var_DNI[4]);
            var_Suma_A := var_Suma_A + StrToInt(var_DNI[6]);

            // ************************************************************************************* //
            // ** 2. Por cada uno de los dígitos de las posiciones impares, se multiplica el      ** //
            // **    dígito por 2 y se suman las cifras del resultado (p.e. si el dígito es 6, el ** //
            // **    resultado sería 6 x 2 = 12 -> 1 + 2 = 3). Se repite la operación con todos   ** //
            // **    los dígitos en posiciones impares y se suman los resultados. (Suma = B)      ** //
            // ************************************************************************************* //
            var_Suma_B := 0;

            // ************************************************************************************* //
            // ** La posición impar 1                                                             ** //
            // ************************************************************************************* //
            var_Multiplicado_x2 := IntToStr(StrToInt(var_DNI[1]) * 2);
            if Length(Trim(var_Multiplicado_x2)) = 1 then
            begin
                var_Multiplicado_x2 := '0' + Trim(var_Multiplicado_x2);
            end;

            var_Suma_del_Impar := StrToInt(var_Multiplicado_x2[1]) +
                                  StrToInt(var_Multiplicado_x2[2]);

            var_Suma_B := var_Suma_B + var_Suma_del_Impar;

            // ************************************************************************************* //
            // ** La posición impar 3                                                             ** //
            // ************************************************************************************* //
            var_Multiplicado_x2 := IntToStr(StrToInt(var_DNI[3]) * 2);
            if Length(Trim(var_Multiplicado_x2)) = 1 then
            begin
                var_Multiplicado_x2 := '0' + Trim(var_Multiplicado_x2);
            end;

            var_Suma_del_Impar := StrToInt(var_Multiplicado_x2[1]) +
                                  StrToInt(var_Multiplicado_x2[2]);

            var_Suma_B := var_Suma_B + var_Suma_del_Impar;

            // ************************************************************************************* //
            // ** La posición impar 5                                                             ** //
            // ************************************************************************************* //
            var_Multiplicado_x2 := IntToStr(StrToInt(var_DNI[5]) * 2);
            if Length(Trim(var_Multiplicado_x2)) = 1 then
            begin
                var_Multiplicado_x2 := '0' + Trim(var_Multiplicado_x2);
            end;

            var_Suma_del_Impar := StrToInt(var_Multiplicado_x2[1]) +
                                  StrToInt(var_Multiplicado_x2[2]);

            var_Suma_B := var_Suma_B + var_Suma_del_Impar;

            // ************************************************************************************* //
            // ** La posición impar 7                                                             ** //
            // ************************************************************************************* //
            var_Multiplicado_x2 := IntToStr(StrToInt(var_DNI[7]) * 2);
            if Length(Trim(var_Multiplicado_x2)) = 1 then
            begin
                var_Multiplicado_x2 := '0' + Trim(var_Multiplicado_x2);
            end;

            var_Suma_del_Impar := StrToInt(var_Multiplicado_x2[1]) +
                                  StrToInt(var_Multiplicado_x2[2]);

            var_Suma_B := var_Suma_B + var_Suma_del_Impar;

            // ************************************************************************************* //
            // ** 3. Sumar el resultado de los 2 pasos anteriores. (A + B = C)                    ** //
            // ************************************************************************************* //
            var_Suma_C := IntToStr(var_Suma_A + var_Suma_B);

            // ************************************************************************************* //
            // ** 4. El último dígito de la suma anterior (C) se lo restamos a 10, cuyo resultado ** //
            // **    sería el dígito de control (p.e. si C = 14, el último dígito es 4, por lo que** //
            // **    tendríamos 10 - 4 = 6). Si el último dígito de la suma del paso anterior es 0** //
            // **    (p.e. C = 30), no se realiza resta y se toma el 0 como dígito de control.    ** //
            // **                                                                                 ** //
            // **    Si el dígito de control es un número, este sería el resultado de la última   ** //
            // **    operación. Si se trata de una letra, se utilizaría la siguiente relación:    ** //
            // **                                                                                 ** //
            // **    número obtenido ->   1 2 3 4 5 6 7 8 9 0                                     ** //
            // **    dígito de control -> A B C D E F G H I J                                     ** //
            // ************************************************************************************* //

            // ************************************************************************************* //
            // ** Tomar sólo El último dígito de C. Lo llamaremos dígito E.                       ** //
            // ************************************************************************************* //
            var_Digito_E := var_Suma_C[Length(var_Suma_C)];

            // ************************************************************************************* //
            // ** Si el dígito E es distinto de 0 lo restaremos a 10. D = 10-E. Esta resta da D   ** //
            // ** Si no, si el dígito E es 0 entonces D = 0 y no hacemos resta.                   ** //
            // ************************************************************************************* //
            if var_Digito_E <> '0' then
            begin
                var_D := IntToStr(10 - StrToInt(var_Digito_E));
            end else begin
                var_D := '0';
            end;

            // ************************************************************************************* //
            // ** A partir de D ya se obtiene el dígito de control.                               ** //
            // **                                                                                 ** //
            // ** Si ha de ser numérico es directamente D                                         ** //
            // **                                                                                 ** //
            // ** Y si se trata de una letra, se corresponde con la relación:                     ** //
            // **            J = 0, A = 1, B = 2, C= 3, D = 4,                                    ** //
            // **            E = 5, F = 6, G = 7, H = 8, I = 9                                    ** //
            // ************************************************************************************* //
            if ( UpperCase(param_NIF[9]) = '0' ) or
               ( UpperCase(param_NIF[9]) = '1' ) or
               ( UpperCase(param_NIF[9]) = '2' ) or
               ( UpperCase(param_NIF[9]) = '3' ) or
               ( UpperCase(param_NIF[9]) = '4' ) or
               ( UpperCase(param_NIF[9]) = '5' ) or
               ( UpperCase(param_NIF[9]) = '6' ) or
               ( UpperCase(param_NIF[9]) = '7' ) or
               ( UpperCase(param_NIF[9]) = '8' ) or
               ( UpperCase(param_NIF[9]) = '9' ) then
            begin
                // ********************************************************************************* //
                // ** El dígito de control es un número                                           ** //
                // ********************************************************************************* //
                Result := UpperCase(var_D) = UpperCase(param_NIF[9]);
            end else begin
                // ********************************************************************************* //
                // ** El dígito de control es una letra                                           ** //
                // ********************************************************************************* //
                // **    número obtenido ->   1 2 3 4 5 6 7 8 9 0                                 ** //
                // **    dígito de control -> A B C D E F G H I J                                 ** //
                // ********************************************************************************* //
                if UpperCase(var_D) = '1' then var_D := 'A';
                if UpperCase(var_D) = '2' then var_D := 'B';
                if UpperCase(var_D) = '3' then var_D := 'C';
                if UpperCase(var_D) = '4' then var_D := 'D';
                if UpperCase(var_D) = '5' then var_D := 'E';
                if UpperCase(var_D) = '6' then var_D := 'F';
                if UpperCase(var_D) = '7' then var_D := 'G';
                if UpperCase(var_D) = '8' then var_D := 'H';
                if UpperCase(var_D) = '9' then var_D := 'I';
                if UpperCase(var_D) = '0' then var_D := 'J';
                Result := UpperCase(var_D) = UpperCase(param_NIF[9]);
            end;
        end;
    end;
end;

procedure UTI_CONTA_esta_Cta_Ctble_BIEN( param_comprobar : ShortString;
                                         param_msg : TStrings;
                                         param_SQLQuery : TSQLQuery;
                                         param_Cta_Ctble_elegida,
                                         param_Nombre_Tabla,
                                         param_Nombre_Cta_Ctble,
                                         param_mensaje_falta : String );
var var_Longitud_Cta_Contable_Tipo : Integer;
    var_Existe_Cta_Ctble           : Trecord_Existe;
    var_msg                        : String;
begin
    if Trim(UpperCase(param_comprobar)) = 'S' then
    begin
        with param_SQLQuery do
        begin
            if Trim(FieldByName(Trim(param_Nombre_Cta_Ctble)).AsString) = '' then
            begin
                param_msg.Add( '* ' + Trim(param_mensaje_falta) + '.' );
                Exit;
            end else begin
                    // ************************************************************************************* //
                    // ** Comprobamos con otra cuenta (tipo) pero sólo si se la pasamos                   ** //
                    // ************************************************************************************* //
                    if Trim(param_Cta_Ctble_elegida) <> '' then
                    begin
                        if Trim(FieldByName(Trim(param_Nombre_Cta_Ctble)).AsString) = Trim(param_Cta_Ctble_elegida) then
                        begin
                            param_msg.Add( '* ' + Trim(param_mensaje_falta) + ', no puede ser la misma que la del tipo/familia. Hay que terminarla.' );
                            Exit;
                        end;

                        var_Longitud_Cta_Contable_Tipo := Length(Trim(param_Cta_Ctble_elegida));

                        if Length(Trim(FieldByName(Trim(param_Nombre_Cta_Ctble)).AsString)) >= var_Longitud_Cta_Contable_Tipo then
                        begin
                            if UpperCase( Copy( Trim(FieldByName(Trim(param_Nombre_Cta_Ctble)).AsString),
                                          0,
                                          var_Longitud_Cta_Contable_Tipo ) ) <>
                               UpperCase (Trim(param_Cta_Ctble_elegida)) then
                            begin
                                param_msg.Add( '* ' + Trim(param_mensaje_falta) + ', no empieza igual que la del tipo/familia. Hay que ARREGLARLA.' );
                                Exit;
                            end;
                        end else begin
                            param_msg.Add( '* ' + Trim(param_mensaje_falta) + ', no empieza igual que la del tipo/familia. Hay que ARREGLARLA.' );
                            Exit;
                        end;
                    end;

                    // ************************************************************************************* //
                    // ** COMPROBAMOS SI EXISTE LA CUENTA CONTABLE YA                                     ** //
                    // ************************************************************************************* //
                    if param_SQLQuery.State = dsEdit then
                    begin
                        // ********************************************************************************* //
                        // ** ESTAMOS EN MODO EDICION                                                     ** //
                        // ********************************************************************************* //
                         var_Existe_Cta_Ctble := UTI_CONTA_Existe_cta_ctble_Ya( FieldByName('id').AsString,
                                                                                FieldByName(Trim(param_Nombre_Cta_Ctble)).AsString,
                                                                                param_Nombre_Tabla,
                                                                                param_Nombre_Cta_Ctble );
                    end else begin
                        // ********************************************************************************* //
                        // ** ESTAMOS EN MODO INSERT O APPEND                                             ** //
                        // ********************************************************************************* //
                        var_Existe_Cta_Ctble := UTI_CONTA_Existe_cta_ctble_Ya( '',
                                                                               FieldByName(Trim(param_Nombre_Cta_Ctble)).AsString,
                                                                               param_Nombre_Tabla,
                                                                               param_Nombre_Cta_Ctble );
                    end;

                    if var_Existe_Cta_Ctble.Fallo_en_Conexion_BD = true then
                    begin
                        param_msg.Add( '* No se pudo comprobar si ' + Trim(param_mensaje_falta) + ' existe ya con anterioridad.' );
                        Exit;
                    end else begin
                        if var_Existe_Cta_Ctble.Existe = true then
                        begin
                            // ***************************************************************** //
                            // ** O existe la cuenta contable ya, o existe el NIF ya          ** //
                            // ***************************************************************** //
                            var_msg := '* ' + Trim(param_mensaje_falta) + ' esta repetida en ' + Trim(param_Nombre_Tabla) + '.';

                            if UpperCase(var_Existe_Cta_Ctble.deBaja) = 'S' then
                            begin
                                var_msg := var_msg + ' Y el registro fué dado de baja.';
                            end;

                            param_msg.Add( var_msg );
                            Exit;
                        end;
                    end;
            end;
        end;
    end;
end;

function UTI_CONTA_Esta_cerrada_la_Ftra( param_id_facturas,
                                         param_Compras_o_Ventas_CV : String ) : String;
var var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
    if Trim(param_id_facturas) = '' then
    begin
        // ***************************************************************************************** //
        // ** Probablemente nos han mandado una id vacía porque se trata de una insert y todavía  ** //
        // ** no sabemos cual es la id. Pero lo que si que vamos a devolver es 0 = no cartera     ** //
        // ** Y no pasamos por la sql de abajo porque daría un error                              ** //
        // ***************************************************************************************** //
        Result := '0';
        Exit;
    end;

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
        var_SQLQuery.Name     := 'SQLQuery_UTI_CONTA_Esta_cerrada_la_Ftra';
        var_SQLQuery.Database := var_SQLConnector;

        // ***************************************************************************************** //
        // ** Creamos la SQL                                                                      ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add( 'SELECT COUNT(*) as Existe' );

        if UpperCase(param_Compras_o_Ventas_CV) = 'V' then
        begin
            var_SQLQuery.SQL.Add( 'FROM facturas_ventas AS fco' );
        end else begin
            var_SQLQuery.SQL.Add( 'FROM facturas_compras AS fco' );
        end;

        var_SQLQuery.SQL.Add( 'RIGHT JOIN facturas_cerradas AS fce' );
        var_SQLQuery.SQL.Add( 'ON fce.id_empresas = fco.id_empresas AND' );
        var_SQLQuery.SQL.Add( 'fco.Fecha >= fce.Desde AND' );
        var_SQLQuery.SQL.Add( 'fco.Fecha <= fce.Hasta AND' );
        var_SQLQuery.SQL.Add( 'fce.Del_WHEN IS NULL AND' );
        var_SQLQuery.SQL.Add( 'fce.Tipo_Ventas_o_Compras_VC = ' +
                              UTI_GEN_Comillas( Trim(UpperCase(param_Compras_o_Ventas_CV)) ) );

        var_SQLQuery.SQL.Add( 'WHERE fco.id = ' + Trim(param_id_facturas) );

        var_SQLQuery.SQL.Add( 'ORDER BY fco.id' );

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
        // ** Result = 0 aclarara que no existe ninguna compra todavia                            ** //
        // ***************************************************************************************** //
        with var_SQLQuery do
        begin
            Result := FieldByName('Existe').AsString;
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
            Result := '0'; // No encontremos este registro

            UTI_GEN_Error_Log( 'Ocurrió un error al intentar ver si ' +
                               'la factura con la id ' + Trim(param_id_facturas) + ' está cerrada o no. ' +
                               'La tabla ha sido ' + var_SQLQuery.Name +
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

function UTI_CONTA_Esta_cerrada_la_fecha_para_Ftra( param_Fecha,
                                                    param_id_empresas,
                                                    param_Compras_o_Ventas_CV : String ) : String;
var var_SQLTransaction : TSQLTransaction;
    var_SQLConnector   : TSQLConnector;
    var_SQLQuery       : TSQLQuery;
begin
    if Trim(param_id_empresas) = '' then
    begin
        // ***************************************************************************************** //
        // ** Probablemente nos han mandado una id vacía porque se trata de una insert y todavía  ** //
        // ** no sabemos cual es la id. Pero lo que si que vamos a devolver es 0 = no cartera     ** //
        // ** Y no pasamos por la sql de abajo porque daría un error                              ** //
        // ***************************************************************************************** //
        Result := '0';
        Exit;
    end;

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
        var_SQLQuery.Name     := 'UTI_CONTA_Esta_cerrada_la_fecha_para_Ftra';
        var_SQLQuery.Database := var_SQLConnector;

        // ***************************************************************************************** //
        // ** Creamos la SQL                                                                      ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add( 'SELECT COUNT(*) as Existe' );

        var_SQLQuery.SQL.Add( 'FROM facturas_cerradas AS fce' );

        var_SQLQuery.SQL.Add( 'WHERE fce.id_empresas = ' + Trim(param_id_empresas) );

        var_SQLQuery.SQL.Add( 'AND ' +
                              UTI_GEN_Comillas(UTI_GEN_Format_Fecha_Hora(StrToDateTime(param_Fecha), false)) +
                              ' >= fce.Desde' );

        var_SQLQuery.SQL.Add( 'AND ' +
                              UTI_GEN_Comillas(UTI_GEN_Format_Fecha_Hora(StrToDateTime(param_Fecha), false)) +
                              ' <= fce.Hasta' );


        var_SQLQuery.SQL.Add( 'AND fce.Del_WHEN IS NULL' );

        var_SQLQuery.SQL.Add( 'AND fce.Tipo_Ventas_o_Compras_VC = ' +
                              UTI_GEN_Comillas( Trim(UpperCase(param_Compras_o_Ventas_CV)) ) );

        var_SQLQuery.SQL.Add( 'ORDER BY fce.id_empresas ASC, fce.Desde ASC, fce.Hasta ASC' );

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
        // ** Result = 0 aclarara que no existe ninguna compra todavia                            ** //
        // ***************************************************************************************** //
        with var_SQLQuery do
        begin
            Result := FieldByName('Existe').AsString;
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
            Result := '0'; // No encontremos este registro

            UTI_GEN_Error_Log( 'Ocurrió un error al intentar ver si ' +
                               'la fecha ' + Trim(param_Fecha) +
                               ' está cerrada o no para la empresa ' +
                               'con la id ' + Trim(param_Fecha) + '. ' +
                               'La tabla ha sido ' + var_SQLQuery.Name +
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

function UTI_CONTA_Existe_Ftra_Alb_Pdo_Pto( param_Tabla,
                                            param_id_empresas,
                                            param_Serie,
                                            param_Numero : String ) : String;
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
        var_SQLQuery.Name     := 'SQLQuery_UTI_VENTAS_Existe_Ftra_Alb_Pdo_Pto';
        var_SQLQuery.Database := var_SQLConnector;

        // ***************************************************************************************** //
        // ** Creamos la SQL                                                                      ** //
        // ***************************************************************************************** //
        var_SQLQuery.SQL.Add( 'SELECT Count(*) AS Existe' );
        var_SQLQuery.SQL.Add( 'FROM ' + Trim(param_Tabla) );

        var_SQLQuery.SQL.Add( 'WHERE id_empresas = ' + Trim(param_id_empresas) );

        with var_SQLQuery.SQL do
        begin
            if (Trim(param_tabla) = 'facturas_ventas')  or
               (Trim(param_tabla) = 'facturas_compras') then
            begin
                Add( 'AND Serie_Factura = ' + UTI_GEN_Comillas(param_Serie) );
                Add( 'AND Numero_Factura = ' + Trim(param_Numero) );
                Add(  'ORDER BY id_empresas ASC, Serie_Factura ASC, Numero_Factura ASC' );
            end;

            if (Trim(param_tabla) = 'albaranes_ventas')  or
               (Trim(param_tabla) = 'albaranes_compras') then
            begin
                Add( 'AND Serie_Albaran = ' + UTI_GEN_Comillas(param_Serie) );
                Add( 'AND Numero_Albaran = ' + Trim(param_Numero) );
                Add(  'ORDER BY id_empresas ASC, Serie_Albaran ASC, Numero_Albaran ASC' );
            end;

            if (Trim(param_tabla) = 'pedidos_ventas')  or
               (Trim(param_tabla) = 'pedidos_compras') then
            begin
                Add( 'AND Serie_Pedido = ' + UTI_GEN_Comillas(param_Serie) );
                Add( 'AND Numero_Pedido = ' + Trim(param_Numero) );
                Add(  'ORDER BY id_empresas ASC, Serie_Pedido ASC, Numero_Pedido ASC' );
            end;

            if (Trim(param_tabla) = 'presupuestos_ventas') or
               (Trim(param_tabla) = 'presupuestos_compras') then
            begin
                Add( 'AND Serie_Presupuesto = ' + UTI_GEN_Comillas(param_Serie) );
                Add( 'AND Numero_Presupuesto = ' + Trim(param_Numero) );
                Add(  'ORDER BY id_empresas ASC, Serie_Presupuesto ASC, Numero_Presupuesto ASC' );
            end;
        end;

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
        // ** Result = 0 aclarara que no existe ninguna venta todavia                             ** //
        // ***************************************************************************************** //
        Result := var_SQLQuery.FieldByName('Existe').AsString;

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
            Result := 'ERROR'; // No encontremos este registro

            UTI_GEN_Error_Log( 'Ocurrió un error al intentar comprobar si existe la factura ' +
                               Trim(param_Serie) + '/' + Trim(param_Numero) +
                               ', en la empresa con id: ' + Trim(param_id_empresas) +
                               '. La tabla ha sido ' + var_SQLQuery.Name +
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

function UTI_CONTA_Borrar_Del_Todo_Ftra_Cabecera( param_tabla,
                                                  param_id_facturas : String ) : Boolean;
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

        // ***************************************************************************************** //
        // ** Creamos la SQL                                                                      ** //
        // ***************************************************************************************** //
        var_SQL.Add( 'DELETE FROM ' + Trim(param_tabla) );
        var_SQL.Add(  'WHERE id = ' + param_id_facturas );

        // ***************************************************************************************** //
        // ** Pasamos Abrimos la SQL al Query que la ejecuta                                      ** //
        // ***************************************************************************************** //
        var_SQLQuery          := TSQLQuery.Create(nil);

        var_SQLQuery.Database := var_SQLConnector;
        var_SQLQuery.SQL.Text := var_SQL.Text;

        var_SQLQuery.Name     := 'SQLQuery_UTI_CONTA_Borrar_Del_Todo_Ftra_Cabecera';

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
            UTI_GEN_Error_Log( 'Error al borrar la cabecera de factura con id ' +
                               Trim(param_id_facturas) + '. La tabla ha sido ' + var_SQLQuery.Name +
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

function UTI_CONTA_Borrar_Del_Todo_Ftra_Detalle( param_tabla,
                                                 param_id_facturas : String ) : Boolean;
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

        // ***************************************************************************************** //
        // ** Creamos la SQL                                                                      ** //
        // ***************************************************************************************** //
        var_SQL.Add( 'DELETE FROM ' + Trim(param_tabla) );
        var_SQL.Add(  'WHERE id_facturas = ' + param_id_facturas );

        // ***************************************************************************************** //
        // ** Pasamos Abrimos la SQL al Query que la ejecuta                                      ** //
        // ***************************************************************************************** //
        var_SQLQuery          := TSQLQuery.Create(nil);

        var_SQLQuery.Database := var_SQLConnector;
        var_SQLQuery.SQL.Text := var_SQL.Text;

        var_SQLQuery.Name     := 'SQLQuery_UTI_CONTA_Borrar_Del_Todo_Ftra_Detalle';

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
            UTI_GEN_Error_Log( 'Error al borrar el detalle de factura con id ' +
                               Trim(param_id_facturas) + '. La tabla ha sido ' + var_SQLQuery.Name +
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

function UTI_CONTA_Elegir_Diario_tipo : TRecord_Rgtro_Comun;
var var_msg : TStrings;
begin
  Result.id_1 := '';

  if UTI_GEN_Form_Abierto_Ya('f_elegir_diarios_tipos') = false then
  begin
    Application.CreateForm(Tf_elegir_diarios_tipos, f_elegir_diarios_tipos);

    f_elegir_diarios_tipos.public_hacemos_commit_alFinalizar := '1';
    f_elegir_diarios_tipos.public_Solo_Ver                   := true;
    f_elegir_diarios_tipos.public_Elegimos                   := true;
    f_elegir_diarios_tipos.public_Menu_Worked                := 0 (*public_Menu_Worked*);

    f_elegir_diarios_tipos.para_Empezar;

    f_elegir_diarios_tipos.ShowModal;

    if f_elegir_diarios_tipos.public_Rgtro_Seleccionado = true then
    begin
      with f_elegir_diarios_tipos.SQLQuery_Principal do
      begin
        Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                              '',
                                              '',

                                              FieldByName('descripcion').AsString,
                                              '',
                                              '' );
      end;
    end;

    f_elegir_diarios_tipos.Free;
  end

  else
  begin
    var_msg := TStringList.Create;
    var_msg.Add(rs_Modulo_Abierto);
    UTI_GEN_Aviso(true, var_msg, rs_uti_conta_001, True, False);
    var_msg.Free;
    Exit;
  end;
end;

end.


