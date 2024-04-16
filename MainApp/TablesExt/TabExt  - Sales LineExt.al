tableextension 50100 "Curso Tabla Extension" extends "Sales Line"
{
    fields
    {
        modify("No.")
        {
            TableRelation = if (Type = const(Course)) Course;
        }
        field(50000; "Course Edition"; Code[20])
        {
            Caption = 'Course Edition', Comment = 'ESP = "Edición curso"';
            DataClassification = CustomerContent;
            TableRelation = "Course Edition".Edition where("Course No." = field("No.")); //Filtros apra que se muestre la edicion del curso selecionado (No. es el codigo identificativo del curso)

            trigger OnValidate()

            begin
                CheckCourseEditionMaxEstudents();
            end;
        }
        modify(Quantity)
        {
            trigger OnAfterValidate()
            begin
                CheckCourseEditionMaxEstudents();
            end;
        }

    }
    local procedure CheckCourseEditionMaxEstudents()
    var
        CourseEdition: Record "Course Edition";
        CourseLedgerEntry: Record "Course Ledger Entry";
        SoldQuantity: Decimal;
        //MaxStudentsExceeded: TextConst ENU = 'Text in english', ESP = 'Texto en español';
        MaxStudentsExceededMsg: Label 'Text in english', Comment = 'ESP="La venta actual para el curso %1, edicion %2 superara el numero maximo de alumnos: %3"';

    begin
        if Rec.Type <> Rec.Type::Course then //si el tipo es difretene a un curso, salir
            exit;
        if "Course Edition" = '' then // Si la edicion del curso esta vacia, salir
            exit;
        if Rec.Quantity = 0 then   // Si el registro de canitdad esta vacio, salir
            exit;

        CourseEdition.Get(Rec."No.", Rec."Course Edition"); //Get en la variable para obetenr los datos de la BD, para leer el registro en conctero le pasamos de las claves priamrias 

        CourseLedgerEntry.SetRange("Course No.", Rec."No."); //filtro para que se obtenga para el numero de curso ("Course No."), del registro en la linea de numero de curso (Rec."No.")
        CourseLedgerEntry.SetRange("Course Edition", Rec."Course Edition"); //filtro para que se obtenga para la edicion de curso ("Course Edition"), del registro en la linea de edicion de curso (Rec."Course Edition)
        if CourseLedgerEntry.FindSet() then //findSet devuelve un boolean , true si ha encontrado registros y false si no los ha encontrado
            repeat
                SoldQuantity := SoldQuantity + CourseLedgerEntry.Quantity; //La catnaidad vendida, asignamos la cantidad indicada en courseLedgerEntry
            until CourseLedgerEntry.Next() = 0;

        if SoldQuantity + Rec.Quantity > CourseEdition."Max. Students" then //si la suma de soldquintity y el registro de quantity es mas grande que el numero maximo de estudiadntes de la edicion, manda mensaje
            Message(MaxStudentsExceededMsg, Rec."No.", Rec."Course Edition", CourseEdition."Max. Students") //para mosrar el mensaje con la varibale creada (MaxStudentsExceedingMsg) y los valores que se asignaran en el mensaje a 1%,2%,3%;   
    end;
}