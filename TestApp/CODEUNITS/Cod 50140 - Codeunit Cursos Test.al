codeunit 50140 "Codeunit Cursos Test"
{

    Subtype = Test;

    [Test]
    procedure Test001()
    var
        GetMinVar: Codeunit Min;
        Value1, Value2 : Decimal;
        Result: Decimal;
    begin
        //[Scenario] una funcion llamada GetMin devuelve el minimo de 2 valores numericos

        //[Given] 2 valores numericos
        Value1 := 1;
        Value2 := 2;

        //[When] cuando se llama a la funcion GetMin
        Result := GetMinVar.GetMin(Value1, Value2);
        //[Then] el resutlado tiene que ser el menor de los 2 valores minimos
        if Result <> Value1 then
            Error('El resultado no es correcto');
    end;


    [Test]
    procedure Test002()
    var
        GetMinVar: Codeunit Min;
        Value1, Value2 : Decimal;
        Result: Decimal;
    begin
        //[Scenario] una funcion llamada GetMin devuelve el minimo de 2 valores numericos

        //[Given] 2 valores numericos
        Value1 := 3;
        Value2 := 2;

        //[When] cuando se llama a la funcion GetMin
        Result := GetMinVar.GetMin(Value1, Value2);
        //[Then] el resutlado tiene que ser el menor de los 2 valores minimos
        if Result <> Value2 then
            Error('El resultado no es correcto');
    end;
}