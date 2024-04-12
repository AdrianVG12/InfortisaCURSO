codeunit 50140 "Codeunit Cursos Test"
{
    Subtype = Test; //Codeunit tipo Testing


    [Test]
    procedure SelectCourseOnSalesLine()
    var
        Course: Record Course;
        LibraryCourses: Codeunit "Library - courses";

    // LibrarySales: Codeunit "Library - Sales"; //PROBLEMAS CON LAS EXTENSIONES DE TEST , CORREGIR EN UN FUTURO.
    begin
        //[Scenario] Se puede seleciionar un curso en una linea de venta

        Course := LibraryCourses.CreateCourse();

        //          Un documento de venta




        //[When] Cuando selecionamos el curso en la linea de venta 

        //[Then] La linea de venta tiene la Nombre del curso, el precio y los grupos contables


    end;
}