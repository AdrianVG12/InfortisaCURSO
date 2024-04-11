tableextension 50101 "Curso Tabla ExtShipment Line" extends "Sales Shipment Line"
{
    fields
    {
        modify("No.")
        {
            TableRelation = if (Type = const(Course)) Course;
        }
        field(50000; "Course Edition"; Code[20]) // Poner 50000, el mismo codigo que la primera y pricipal table extension (Sales LineExt)
        {
            Caption = 'Course Edition', Comment = 'ESP = "Edición curso"';
            DataClassification = CustomerContent;
            TableRelation = "Course Edition".Edition where("Course No." = field("No.")); //Filtros apra que se muestre la edicion del curso selecionado (No. es el codigo identificativo del curso)

        }
    }
}