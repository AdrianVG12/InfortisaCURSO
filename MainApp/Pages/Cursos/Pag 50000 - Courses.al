page 50000 Courses
{

    Caption = 'Courses Page', Comment = 'ESP="Pagina Cursos"';
    PageType = List;
    Editable = false;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Course;
    CardPageId = Course; //Establece que se puedan abrir los registros al pulsar en ellos, ejecutnado la pagCard Course, lo que hace tambien el action

    layout
    {
        area(Content) //Area de contenido principal
        {
            repeater(RepeaterControl)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Campo Numero Registro';

                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    Caption = 'Name', Comment = 'ESP="Nombre Pagina"'; //Sobreecribe a la tradcuccion de la tabla
                    ToolTip = 'Campo Nombre';

                }
                /* field("Content Description"; "Content Description")
                {
                    ApplicationArea = All; // Cometado para quitar este campo de la lista, ya que se muestra en la Card Course
                } */
                field("Duration (hours)"; Rec."Duration (hours)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Campo Duración';

                }
                field(Price; Rec.Price)
                {
                    ApplicationArea = All;
                    ToolTip = 'Campo Precio';
                }
                field("Language Code"; Rec."Language Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Campo Idioma';
                }
                field("Type Option"; Rec."Type Option")
                {
                    ApplicationArea = All;
                    ToolTip = 'Campo Tipo Option';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    ToolTip = 'Campo Tipo';
                }

            }
        }
        area(Factboxes) //Area de contendio lateral, en la pagina sale el contenido de la Factboxes a la derecha
        {
            part(CourseEditions; "Course Edition")
            {
                ApplicationArea = All;
                SubPageLink = "Course No." = field("No."); //Para visualizar en la ListPart, los que coincidadn el campo Nº con el registro acutal

            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action(VerMovs) //No es necesario, solo para info/apuntes, esto ya se hace al indicar el CardPageID = Course;
            {
                Caption = 'Open Card', Comment = 'ESP="Abre la ficha de movs."';
                ApplicationArea = All;
                Image = ServiceItemGroup;
                ToolTip = 'Ver movimientos';


                trigger OnAction()
                var

                begin
                    Message('Abriendo la ficha de movimientos');
                    Page.Run(page::"Course Ledger Entries");
                end;
            }
        }
    }

    views //Vistas para aplicar filtros
    {
        view(EnglishCourses)
        {
            Caption = 'English Courses', Comment = 'ESP="Cursos en inglés"';
            Filters = where("Language Code" = filter('ENU'));
        }
    }
}