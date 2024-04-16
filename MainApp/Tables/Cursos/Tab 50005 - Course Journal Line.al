table 50005 "Course Journal Line"
{
    Caption = 'Course Journal Line', Comment = 'ESP = "Linea diario curso"';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Journal Template Name"; Code[10])
        {
            Caption = 'Journal Template Name';
            //  TableRelation = "Course. Journal Template"; 
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.', Comment = 'ESP = "Numero linea"';
        }
        field(4; "Document No."; Code[20])
        {
            Caption = 'Document No.', Comment = 'ESP = "Numero docuemtno"';
        }
        field(5; "Posting Date"; Date)
        {
            Caption = 'Posting Date', Comment = 'ESP = "Fecha de registro"';

            trigger OnValidate()
            begin
                TestField("Posting Date");
            end;
        }
        field(6; "Course No."; Code[20])
        {
            Caption = 'Course No.', Comment = 'ESP = "Nº cursos"';
            TableRelation = Course;

            trigger OnValidate()
            begin
                if "Course No." = '' then
                    exit;

                Course.Get("Course No.");
                Rec.Description := Course.Name;
                Rec."Unit Price" := Course.Price;
            end;
        }
        field(7; "Course Edition"; Code[20])
        {
            Caption = 'Course Edition', Comment = 'ESP = "Edicion del curso"';
            TableRelation = "Course Edition";
        }
        field(8; Description; Text[100])
        {
            Caption = 'Description', Comment = 'ESP = "Descripción"';
        }
        field(12; Quantity; Decimal)
        {
            Caption = 'Quantity', Comment = 'ESP = "Cantidad"';
            ;
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                Validate("Unit Price");
            end;
        }

        field(16; "Unit Price"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Price', Comment = 'ESP = "Precio unitario"';
            ;
            MinValue = 0;

            trigger OnValidate()
            begin
                "Total Price" := Quantity * "Unit Price";
            end;
        }
        field(17; "Total Price"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Total Price', Comment = 'ESP = "Precio total"';
            ;

            trigger OnValidate()
            begin
                TestField(Quantity);
                GetGLSetup();
                "Unit Price" := Round("Total Price" / Quantity, GLSetup."Unit-Amount Rounding Precision");
            end;
        }
        field(23; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
            //TableRelation = "Res. Journal Batch".Name where("Journal Template Name" = field("Journal Template Name"));
        }
        field(959; "System-Created Entry"; Boolean)
        {
            Caption = 'System-Created Entry';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Journal Template Name", "Journal Batch Name", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    /* trigger OnInsert()
    begin
        LockTable();
        ResJnlTemplate.Get("Journal Template Name"); PARA INTERFAZ GRAFCICA, POR AHORA COMENTADOS
        ResJnlBatch.Get("Journal Template Name", "Journal Batch Name");

    end; */

    var
        /*  ResJnlTemplate: Record "Res. Journal Template";
         ResJnlBatch: Record "Res. Journal Batch"; */
        Course: Record Course;
        GLSetup: Record "General Ledger Setup";
        GLSetupRead: Boolean;

    procedure EmptyLine(): Boolean
    begin
        exit((Rec."Course No." = '') and (Rec.Quantity = 0));
    end;

    procedure CopyDocumentFields(DocNo: Code[20])
    begin
        Rec."Document No." := DocNo;
    end;

    procedure CopyFromSalesHeader(SalesHeader: Record "Sales Header")
    begin
        Rec."Posting Date" := SalesHeader."Posting Date";


        OnAfterCopyCourseJnlLineFromSalesHeader(SalesHeader, Rec);
    end;

    procedure CopyFromSalesLine(SalesLine: Record "Sales Line")
    begin
        Rec."Course No." := SalesLine."No.";
        Rec."Course Edition" := SalesLine."Course Edition";
        Rec.Description := SalesLine.Description;
        Rec.Quantity := -SalesLine."Qty. to Invoice";
        Rec."Unit Price" := SalesLine."Unit Price";
        Rec."Total Price" := -SalesLine.Amount;

        OnAfterCopyCourseJnlLineFromSalesLine(SalesLine, Rec);
    end;

    local procedure GetGLSetup()
    begin
        if not GLSetupRead then
            GLSetup.Get();
        GLSetupRead := true;
    end;


    [IntegrationEvent(false, false)]
    local procedure OnAfterCopyCourseJnlLineFromSalesHeader(var SalesHeader: Record "Sales Header"; var CourseJournalLine: Record "Course Journal Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCopyCourseJnlLineFromSalesLine(var SalesLine: Record "Sales Line"; var CourseJnlLine: Record "Course Journal Line")
    begin
    end;
}

