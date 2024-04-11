codeunit 50141 "Min"
{

    procedure GetMin(v1: Decimal; v2: Decimal): Decimal //esta funcion devuelve un numero decimal( se indica con el :Deciaml al fianl)
    begin
        /* if v1 < v2 then
            exit(v1)
        else
            exit(v2); */

        if v1 < v2 then // bucle refactorizado
            exit(v1);
        exit(v2);
    end;
}