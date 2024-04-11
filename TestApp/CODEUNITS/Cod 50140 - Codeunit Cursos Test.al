codeunit 50140 "Codeunit Cursos Test"
{
    Subtype = Test;


    [Test]
    procedure SelectCourseOnSalesLine()
    var
        Course: Record Course;
    begin
        //[Scenario] Se puede seleciionar un curso en una linea de venta

        //[Given] Un curso configurado con: grupos contables
        //          Un documento de venta

        //[When] Cuando selecionamos el curso en la linea de venta 

        //[Then] La linea de venta tiene la Nombre del curso, el precio y los grupos contables


    end;
}