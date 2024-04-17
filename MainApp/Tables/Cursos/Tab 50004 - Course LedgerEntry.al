table 50004 "Course Ledger Entry" //Tabla del codigo madre de movimientos de recurso, para MODIFICARLA y hacer los movimientos de curso
{
    Caption = 'Course Course Entry', Comment = 'ESP = "Movimientos Curso"';
    DrillDownPageID = "Course Ledger Entries";
    LookupPageID = "Course Ledger Entries";
    DataClassification = CustomerContent;

    fields
    {
        //Eliminacion de campos de codigo fuente que no vamos a usar
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.', Comment = 'ESP = "Nº movimiento"';
            DataClassification = SystemMetadata;
        }
        field(3; "Document No."; Code[20])
        {
            Caption = 'Document No.', Comment = 'ESP = "Nº documento"';
        }
        field(4; "Posting Date"; Date)
        {
            Caption = 'Posting Date', Comment = 'ESP = "Fecha registro"';
        }
        field(5; "Course No."; Code[20])
        {
            Caption = 'Course No.', Comment = 'ESP = "Nº curso"';
            ;
            TableRelation = Course;
        }
        field(6; "Course Edition"; Code[20])
        {
            Caption = 'Course Edition', Comment = 'ESP = "Edicion del curso"';
            TableRelation = "Course Edition";
        }
        field(7; Description; Text[100])
        {
            Caption = 'Description', Comment = 'ESP = "Descripcion"';
        }

        field(11; Quantity; Decimal)
        {
            Caption = 'Quantity', Comment = 'ESP = "Cantidad"';
            ;
            DecimalPlaces = 0 : 5;
        }
        field(15; "Unit Price"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Price', Comment = 'ESP = "Precio unitario"';
        }
        field(16; "Total Price"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Total Price', Comment = 'ESP = "Precio total"';
        }

    }

    keys //Borrar las keys que ya no usamos
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Course No.", "Course Edition", "Posting Date")
        {
            SumIndexFields = Quantity; // para el calc sums crear clave
        }
        key(Key5; "Document No.", "Posting Date")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Entry No.", Description, "Document No.", "Posting Date")
        {
        }
    }

    procedure GetLastEntryNo(): Integer; //Borrar los campos que hemos borrado y que estan siendo asignaods
    var
        FindRecordManagement: Codeunit "Find Record Management";
    begin
        exit(FindRecordManagement.GetLastEntryIntFieldValue(Rec, FieldNo("Entry No.")))
    end;

    procedure CopyFromCourseJnlLine(CourseJournaLine: Record "Course Journal Line") //tiene la liena de diario y va  a crear la linea de diario con la info q tenemos en ella
    begin
        Rec."Document No." := CourseJournaLine."Document No.";
        Rec."Posting Date" := CourseJournaLine."Posting Date";
        Rec."Course No." := CourseJournaLine."Course No.";
        Rec."Course Edition" := CourseJournaLine."Course Edition";
        Rec.Description := CourseJournaLine.Description;
        Rec.Quantity := CourseJournaLine.Quantity;
        Rec."Unit Price" := CourseJournaLine."Unit Price";
        Rec."Total Price" := CourseJournaLine."Total Price";

        OnAfterCopyFromCourseJnlLine(Rec, CourseJournaLine);
    end;

    [IntegrationEvent(false, false)]
    procedure OnAfterCopyFromCourseJnlLine(var CourseLedgerEntry: Record "Course Ledger Entry"; CourseJournalLine: Record "Course Journal Line")
    begin
    end;
}

