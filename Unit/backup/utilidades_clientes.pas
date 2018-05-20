unit utilidades_clientes;

{$mode objfpc}{$H+}

interface

uses
  Classes, Forms, SysUtils, sqldb, utilidades_forms_Filtrar, utilidades_general;


implementation

uses menu;

function UTI_CLIENTES_Elegir_Direccion_Envio( param_id : ShortString;
                                              param_Menu_Worked : Integer ) : TRecord_Rgtro_Comun;
var var_msg : TStrings;
begin
    Result.id_1 := '';

    if UTI_GEN_Form_Abierto_Ya('f_elegir_cliente_direccion_envio') = false then
    begin
        Application.CreateForm(Tf_elegir_cliente_direccion_envio, f_elegir_cliente_direccion_envio);

        f_elegir_cliente_direccion_envio.public_hacemos_commit_alFinalizar := '1';
        f_elegir_cliente_direccion_envio.public_Solo_Ver                   := true;
        f_elegir_cliente_direccion_envio.public_Elegimos                   := true;
        f_elegir_cliente_direccion_envio.public_Menu_Worked                := 52 (*public_Menu_Worked*);

        f_elegir_cliente_direccion_envio.para_Empezar;

        f_elegir_cliente_direccion_envio.ShowModal;

        if f_elegir_cliente_direccion_envio.public_Rgtro_Seleccionado = true then
        begin
            with f_elegir_cliente_direccion_envio.SQLQuery_Principal do
            begin
                Result := UTI_Guardar_Datos_Registro( FieldByName('id').AsString,
                                                      '',
                                                      '',
                                                      FieldByName('OT_Direccion_Entera').AsString,
                                                      '',
                                                      '' );
            end;
        end;

        f_elegir_cliente_direccion_envio.Free;
    end

    else
    begin
        var_msg := TStringList.Create;
        var_msg.Add(rs_Modulo_Abierto);
        UTI_GEN_Aviso(true, var_msg, 'AVISAMOS DE ... ', True, False);
        var_msg.Free;
        Exit;
    end;
end;

end.




{

}
