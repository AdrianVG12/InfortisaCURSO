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

        }

    }
}