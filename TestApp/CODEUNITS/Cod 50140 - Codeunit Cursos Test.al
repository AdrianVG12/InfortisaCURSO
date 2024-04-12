codeunit 50140 "Codeunit Cursos Test"
{
    Subtype = Test; //Codeunit tipo Testing


    [Test]
    procedure SelectCourseOnSalesLine()
    var
        Course: Record Course;
    // LibrarySales : Codeunit "Library - Sales";
    begin
        //[Scenario] Se puede seleciionar un curso en una linea de venta

        //[Given] Un curso configurado con: nombre, grupos contables, precio
        Course.Init(); //inicia el registro para una tabla
        Course.Validate(Name, 'Nombre de curso');
        Course.Validate(Price, 999);
        Course.Insert(true); //Insterta el registro en una tabla

        //          Un documento de venta




        //[When] Cuando selecionamos el curso en la linea de venta 

        //[Then] La linea de venta tiene la Nombre del curso, el precio y los grupos contables


    end;
}