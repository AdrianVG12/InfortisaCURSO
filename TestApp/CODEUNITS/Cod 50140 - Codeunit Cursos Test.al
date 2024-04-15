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

    //Test para cirucito de ventas
    [Test]

    procedure PostingASalesDocument()
    var
        Course: Record Course;
        CourseEdition: Record "Course Edition";
        LibraryCourses: Codeunit "Library - courses";
    begin
        // [Scenario] Al registrar un documento de venta con una linea tipo Curso, con una edcion seleciionada, la edicion se traslada a los docuemtnos registrados.

        // [Given] Un curso con ediciones
        Course := LibraryCourses.CreateCourse();
        CourseEdition := LibraryCourses.CreateCourseEdition(Course."No.")
        //          Un docuemtno de venta para el curso y edicion


        // [When] Cuando registramos el documento de vente

        //[Then] y luego la edicion se ha guardado correctamente en los docuemtnos regitrados.
    end;

}



