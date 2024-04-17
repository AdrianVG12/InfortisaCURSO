table 50000 Course
{

    //CaptionML = ENU = 'Course Table', ESP = 'Tabla Curso';
    Caption = 'Course Table', Comment = 'ESP="Tabla Curso"';
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.', Comment = 'ESP="Nº"';

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin //Explicacion del bucle en APUNTES.al
                    CoursesSetup.Get();
                    NoSeriesMgt.TestManual(CoursesSetup."Course Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Name; Text[100])
        {
            Caption = 'No.', Comment = 'ESP="Nº"';
        }
        field(3; "Content Description"; Text[2048])
        {
            Caption = 'Content Description', Comment = 'ESP="Contenido de descripcion"';
        }
        field(4; "Duration (hours)"; Integer)
        {
            Caption = 'Duration (hours)', Comment = 'ESP="Duracion (horas)"';
            BlankZero = true;
        }
        field(5; Price; Decimal)
        {
            Caption = 'Price', Comment = 'ESP="Precio"';
            BlankZero = true;
            AutoFormatType = 1; //Busca la congiguracion de contabilidad para darle los deciamles necesarios y la config necesaria
        }
        field(6; "Language Code"; Code[10])
        {
            Caption = 'Language Code', Comment = 'ESP="Codigo Idioma"';
            TableRelation = Language;
        }
        field(7; "Type Option"; Option)
        {
            Caption = 'Type Option', Comment = 'ESP="Tipo Opcion"';
            OptionMembers = " ","Instructor-Lead","Video Tutorial";
            OptionCaption = ' ,Instructor-Lead,Video Tutorial', Comment = 'ESP=" ,Guiado,Tutorial de Video"';
        }
        field(8; Type; Enum "Course Type")
        {
            Caption = 'Type', Comment = 'ESP="Tipo"';
        }
        field(9; "No. Series"; Code[20]) //campo copiadod de tabla origen "Resource"
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(10; "Gen. Prod. Posting Group"; Code[20]) //Campos de la tabla recource para codeunit
        {
            Caption = 'Gen. Prod. Posting Group', Comment = 'ESP="Grupo contable prod. gen."';
            TableRelation = "Gen. Product Posting Group";

            trigger OnValidate()
            var
                GenProdPostingGrp: Record "Gen. Product Posting Group";
            begin
                if xRec."Gen. Prod. Posting Group" <> "Gen. Prod. Posting Group" then //Si el valor de xRec(registro anterior) son distintos del actual..
                    if GenProdPostingGrp.ValidateVatProdPostingGroup(GenProdPostingGrp, "Gen. Prod. Posting Group") then //Llama a la funcion ValidateVatProdPostingGroup, y si nos dice que si..
                        Validate("VAT Prod. Posting Group", GenProdPostingGrp."Def. VAT Prod. Posting Group"); //Llama al trigger onValidate del campo "VAT Prod. Posting Group" y le asigna un nuevo valor, el valor del grupo contable (SERVICIO en este caso al indicarlo en BC)
            end;
        }
        field(11; "VAT Prod. Posting Group"; Code[20])
        {
            Caption = 'VAT Prod. Posting Group', Comment = 'ESP="Grupo contable IVA prod."';
            TableRelation = "VAT Product Posting Group";
        }
    }

    keys
    {
        key(PK; "No.")
        {

        }
    }


    trigger OnInsert()
    begin
        if Rec."No." = '' then begin
            CoursesSetup.Get();
            CoursesSetup.TestField("Course Nos."); //El TestField se asegura de que el campo tiene un valor
            NoSeriesMgt.InitSeries(CoursesSetup."Course Nos.", xRec."No. Series", 0D, Rec."No.", Rec."No. Series");
        end;
    end;

    var
        CoursesSetup: Record "Courses Setup"; //TODO: Crear nuestra propia config , YA REALIZADO, cambiar "Recources Nos." a " "Course Nos."(El campo de nuestra tabla Courses Setup) y luego cambiar las variables respectivas
        NoSeriesMgt: Codeunit NoSeriesManagement;

}