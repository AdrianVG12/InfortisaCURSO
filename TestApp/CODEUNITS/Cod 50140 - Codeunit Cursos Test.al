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


    [Test]

    procedure CourseSalesPosting()
    var //COMENTAR PARTE DEL TEST PARA QUE NO DE RRO, YA QUE FALTAN LAS LIBRERIAS INSTALADAS, ERROR A COMENTAR
        Course: Record Course;
        CourseEdition: Record "Course Edition";
        //SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        //CourseLedgerEntry: Record "Course Ledger Entry";
        LibraryCourses: Codeunit "Library - Courses";
    // LibrarySales: Codeunit "Library - Sales";
    // LibraryAssert: Codeunit "Library Assert";
    // PostedDocumentNo: Code[20];
    begin
        // [Scenario] al registrar la venta de un curso(y edcicion) se crea un movimiento de curso

        //[Given] Necesitamos un curso (con edcion)
        Course := LibraryCourses.CreateCourse();
        CourseEdition := LibraryCourses.CreateCourseEdition(Course."No.");
        // y un documento de venta para el curso y edicion
        // LibrarySales.CreateSalesHeader(SalesHeader, "Sales Document Type"::Order, '');
        // LibrarySales.CreateSalesLine(SalesLine, SalesHeader, "Sales Line Type"::Course, Course."No.", 1);
        SalesLine.Validate("Course Edition", CourseEdition.Edition);
        SalesLine.Modify();

        //[When] Cuando obentenmos el registro de doc de venta
        // PostedDocumentNo := LibrarySales.PostSalesDocument(SalesHeader, true, true);

        //[Then] entonces se crea el movimiento de curso con los datos adecuados
        // CourseLedgerEntry.SetRange("Document No.", PostedDocumentNo);
        // LibraryAssert.AreEqual(1, CourseLedgerEntry.Count(), 'Nº de movimintos incorreccto');
        // CourseLedgerEntry.FindFirst();
        //LibraryAssert.AreEqual(SalesHeader."Posting Date", CourseLedgerEntry."Posting Date", 'Dato incorrecto'); //lo que hay en la salesheadr(tabalregsitros)en el dato fecha registro, tiene que ser Equal(igual) a lo que tiene que aparecer en la talba de moviminttos en el campo fecha registro
        //LibraryAssert.AreEqual(SalesLine."No.", CourseLedgerEntry."Course No.", 'Dato incorrecto');//lo que haya en No. salesline tiene q ser lo que haya en Course No. , si no 'dato incorrecto'
        //LibraryAssert.AreEqual(SalesLine."Course Edition", CourseLedgerEntry."Course Edition", 'Dato incorrecto');// que la edcion que haya en la linea de venta, sea que lo hay en los movimeintos en el campo edicion., si no 'dato ioncorrecto'
        //LibraryAssert.AreEqual(SalesLine."Description", CourseLedgerEntry."Description", 'Dato incorrecto');//comprabr que en la linea de ventas(salesline) la descripcion, sea igual que en los movimentos la descripcion
        //LibraryAssert.AreEqual(SalesLine."Quantity", CourseLedgerEntry."Quantity", 'Dato incorrecto');
        // LibraryAssert.AreEqual(SalesLine."Unit Price", CourseLedgerEntry."Unit Price", 'Dato incorrecto');
        // LibraryAssert.AreEqual(SalesLine.Amount, CourseLedgerEntry."Total Price", 'Dato incorrecto');



    end;
}



