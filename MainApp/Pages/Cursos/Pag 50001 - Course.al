page 50001 Course
{
    Caption = 'Course', Comment = 'ESP="Ficha Curso"';//Locked = true; Para bloquear traduccion
    //CaptionML = ENU = 'Course Card', ESP = 'Ficha Curso';
    PageType = Card;
    UsageCategory = None;
    SourceTable = Course;
    PromotedActionCategories = 'New,Process,Reporting,Movs.', Comment = 'ESP = "Nuevo, Proceso, Informes, Movimientos"'; //Para cambiar las categorias del menu de la pag, poner nombre a la Category4


    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General', Comment = 'ESP="General"';
                field("No."; "No.")
                {
                    ApplicationArea = All;

                }
                field(Name; Name)
                {
                    ApplicationArea = All;
                    //CaptionML = ENU = 'Name', ESP = 'Nombre Pagina'; //Sobreecribe a la tradcuccion de la tabla
                    Caption = 'General', Comment = 'ESP="General"';

                }
                field("Duration (hours)"; "Duration (hours)")
                {
                    ApplicationArea = All;
                }
                field("Language Code"; "Language Code")
                {
                    ApplicationArea = All;
                }
            }
            group(TrainingContent)
            {
                Caption = 'Training', Comment = 'ESP="Formación"';

                field("Content Description"; "Content Description")
                {
                    ApplicationArea = All;
                }
                field("Type Option"; "Type Option")
                {
                    ApplicationArea = All;
                }
                field(Type; Type)
                {
                    ApplicationArea = All;
                }
            }
            part(CourseEditions; "Course Edition")
            {
                ApplicationArea = All;
                SubPageLink = "Course No." = field("No."); //Para visualizar en la ListPart, los que coincidadn el campo Nº con el registro acutal
            }
            group(Inovicing)
            {
                Caption = 'Inovicing', Comment = 'ESP="Facturación"';
                field(Price; Price)
                {
                    ApplicationArea = All;
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = Jobs;
                    Importance = Promoted;
                    ToolTip = 'Specifies the item''s product type to link transactions made for this item with the appropriate general ledger account according to the general posting setup.', Comment = 'ESP="Especifica el tipo de curso para vincular las transacciones realizadas para este curso con la cuenta de contabilidad correspondiente según la configuración de registro general."';
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                    ToolTip = 'Specifies the VAT specification of the involved item or resource to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.', Comment = 'ESP="Indica la especificación de IVA del curso o recurso en cuestión para vincular las transacciones realizadas para este registro con la cuenta de contabilidad general adecuada según la configuración de grupos de registro."';
                }
            }
        }

    }
    actions
    {
        area(Navigation)
        {
            action(VerMovs) //No es necesario, solo para info/apuntes, esto ya se hace al indicar el CardPageID = Course;
            {
                Caption = 'Open Card Ledger Entries', Comment = 'ESP="Abre la ficha de movs."';
                ApplicationArea = All;
                Image = ResourceLedger;
                ToolTip = 'Ver movimientos';
                RunObject = page "Course Ledger Entries"; // Hace lo mismo que el Page.run del trigger OnAction, ejecuta la pag.
                RunPageLink = "Course No." = field("No."); //para que se busque sobre el curso que esta selecionado
                Promoted = true;
                PromotedCategory = Category4; //Para indicar el action en la Category4, cambiamos el nombre arriba en las propiedades principales
                PromotedOnly = true;
                ShortcutKey = 'Ctrl+F7';
                /* trigger OnAction()
                var

                begin
                    Message('Abriendo la ficha de movimientos');
                    Page.Run(page::"Course Ledger Entries");
                end; */
            }
        }
    }
}