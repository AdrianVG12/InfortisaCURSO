table 50003 "Course Edition"
{
    Caption = 'Course Edition', Comment = 'ESP="Edicion Curso"';

    fields
    {
        field(1; "Course No."; Code[20])
        {
            Caption = 'Course No.', Comment = 'ESP="Nº Curso"';
            TableRelation = Course;

        }
        field(2; Edition; Code[20])
        {
            Caption = 'Edition', Comment = 'ESP="Edición"';
        }
        field(3; "Start Date"; Date)
        {
            Caption = 'Start Date', Comment = 'ESP="Fecha Inicio"';
        }
        field(4; "Max. Students"; Integer)
        {
            Caption = 'Max. Students', Comment = 'ESP="Nº máx. estudiantes"';
        }
        field(7; "Sales (Qty.)"; Decimal) //campo calculado
        {
            CalcFormula = sum("Course Ledger Entry".Quantity where(
                                "Course No." = field("Course No."),
                                "Course Edition" = field(Edition)
            ));
            Caption = 'Sales (Qty.)', Comment = 'ESP="Ventas realizadas de la edicion"';
            DecimalPlaces = 0;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(PK; "Course No.", Edition)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Edition, "Start Date", "Max. Students") //DropDown se usa en los Lookups
        {

        }
    }
}