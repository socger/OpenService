unit utilidades_articulos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, Forms, utilidades_impuestos, utilidades_general;

{ type

  TCalculo_Linea_Detalle = record
      Unidades_por_Precio : Extended;
      Dto_1               : Extended;
      Dto_2               : Extended;
      Impuestos           : Extended;
  end; }

  function  UTI_LINEAS_Calculo_de_Linea_Detalle( param_SQLQuery: TSQLQuery; param_Compras_SN : ShortString ) : TCalculo_Linea_Detalle;

implementation

function UTI_LINEAS_Calculo_de_Linea_Detalle( param_SQLQuery: TSQLQuery;
                                              param_Compras_SN : ShortString ) : TCalculo_Linea_Detalle;
var var_Precio                   : Extended;
    var_Calculo                  : Extended;
    var_Nombre_Campo_id_Impuesto : String;
begin
    // ********************************************************************************************* //
    // ** El unico campo que cambia es el id_impuestos que segun sea de compras o ventas se llama ** //
    // ** de una manera u otra. Así que vamos a ver como lo vamos a llamar                        ** //
    // ********************************************************************************************* //
    var_Nombre_Campo_id_Impuesto := 'id_impuestos_Ventas';
    if UpperCase(param_Compras_SN) = 'S' then
    begin
        var_Nombre_Campo_id_Impuesto := 'id_impuestos_Compras';
    end;

    with param_SQLQuery do
    begin
        var_Precio                 := 0;
        Result.Unidades_por_Precio := 0;
        Result.Dto_1               := 0;
        Result.Dto_2               := 0;
        Result.Impuestos           := 0;

        if not FieldByName('PVP').IsNull then
        begin
            var_Precio := FieldByName('PVP').Value;
        end;

        if not FieldByName('PVP_Impuestos_Incluidos').IsNull then
        begin
            var_Precio := FieldByName('PVP_Impuestos_Incluidos').Value;
        end;

        if ( FieldByName('Unidades').IsNull )              or
           ( Trim(FieldByName('Unidades').AsString) = '' ) then
        begin
            // ************************************************************************************* //
            // ** Puede ser que no se haya puesto nada en Unidades y sin embargo si que tenga un  ** //
            // ** precio. Y si no tiene precio, pues tomara el valor de 0                         ** //
            // ************************************************************************************* //
            Result.Unidades_por_Precio := var_Precio;
        end else begin
            // ************************************************************************************* //
            // ** Resulta que tiene puesto algo en Unidades, por lo que tiene que hacer el cálculo** //
            // ************************************************************************************* //
            Result.Unidades_por_Precio := FieldByName('Unidades').Value * var_Precio;
        end;

        // ***************************************************************************************** //
        // ** Redondeamos a dos decimales (por si el cálculo tiene más decimales)                 ** //
        // ***************************************************************************************** //
        Result.Unidades_por_Precio := StrToFloat(UTI_GEN_Round_to_2_Decimal(FloatToStr(Result.Unidades_por_Precio)));

        // ***************************************************************************************** //
        // ** Si el calculo es de 0, para que calcular los descuentos o los impuestos             ** //
        // ***************************************************************************************** //
        if Result.Unidades_por_Precio <> 0 then
        begin
            Result.Dto_1 := 0;
            if not FieldByName('Descuento_Comercial_1').IsNull then
            begin
                if FieldByName('Descuento_Comercial_1').Value <> 0 then
                begin
                    Result.Dto_1 := ( Result.Unidades_por_Precio *
                                      FieldByName('Descuento_Comercial_1').Value ) / 100;

                    // ***************************************************************************** //
                    // ** Redondeamos a dos decimales (por si el cálculo tiene más decimales)     ** //
                    // ***************************************************************************** //
                    Result.Dto_1 := StrToFloat(UTI_GEN_Round_to_2_Decimal(FloatToStr(Result.Dto_1)));
                end;
            end;

            Result.Dto_2 := 0;
            if not FieldByName('Descuento_Comercial_2').IsNull then
            begin
                if FieldByName('Descuento_Comercial_1').Value <> 0 then
                begin
                    Result.Dto_2 := ( Result.Unidades_por_Precio *
                                      FieldByName('Descuento_Comercial_2').Value ) / 100;

                    // ***************************************************************************** //
                    // ** Redondeamos a dos decimales (por si el cálculo tiene más decimales)     ** //
                    // ***************************************************************************** //
                    Result.Dto_2 := StrToFloat(UTI_GEN_Round_to_2_Decimal(FloatToStr(Result.Dto_2)));
                end;
            end;

            var_Calculo := Result.Unidades_por_Precio - Result.Dto_1;
            var_Calculo := var_Calculo - Result.Dto_2;

            // ************************************************************************************* //
            // ** Si se introdujo el impuesto pues hace sus cálculos, pero claro sólo si resulta  ** //
            // ** que el precio es SIN IMPUESTOS incluidos                                        ** //
            // ************************************************************************************* //
            Result.Impuestos := 0;
            if not FieldByName(var_Nombre_Campo_id_Impuesto).IsNull then
            begin
                if not FieldByName('PVP').IsNull then
                begin
                    // ***************************************************************************** //
                    // ** Es un PVP sin impuestos incluidos por lo que el cálculo de los impuestos** //
                    // ** se calcula así                                                          ** //
                    // ***************************************************************************** //
                    Result.Impuestos := UTI_IMPTOS_Calcular_Impuesto( var_Calculo,
                                                                      FieldByName(var_Nombre_Campo_id_Impuesto).AsString,
                                                                      'D');

                    // ***************************************************************************** //
                    // ** Redondeamos a dos decimales (por si el cálculo tiene más decimales)     ** //
                    // ***************************************************************************** //
                    Result.Impuestos := StrToFloat( UTI_GEN_Round_to_2_Decimal(FloatToStr(Result.Impuestos)) );
                end else begin
                    // jeromito esto es nuevo
                    // ***************************************************************************** //
                    // ** Es un PVP con impuestos incluidos por lo que el cálculo de los impuestos** //
                    // ** se calcula así                                                          ** //
                    // ***************************************************************************** //
                    Result.Impuestos := UTI_IMPTOS_Calcular_Impuesto( var_Calculo,
                                                                      FieldByName(var_Nombre_Campo_id_Impuesto).AsString,
                                                                      'E');

                    // ***************************************************************************** //
                    // ** Redondeamos a dos decimales (por si el cálculo tiene más decimales)     ** //
                    // ***************************************************************************** //
                    Result.Impuestos := StrToFloat( UTI_GEN_Round_to_2_Decimal(FloatToStr(Result.Impuestos)) );
                end;

            end;
        end;
    end;
end;

end.


