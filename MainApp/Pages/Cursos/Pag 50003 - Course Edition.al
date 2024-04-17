page 50003 "Course Edition"
{
    //CaptionML = ENU = 'Course Edition', ESP = 'Ediciones curso';
    Caption = 'Course Edition', Comment = 'ESP="Ediciones curso"';
    PageType = ListPart; //Creamos ListPart para poder poner en la pagina Course, esta pag. dentro de "part () {}"
    UsageCategory = None;
    SourceTable = "Course Edition";

    layout
    {
        area(Content)
        {

            repeater(ReapeterControl)
            {
                field("Course No."; Rec."Course No.")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field(Edition; Rec.Edition)
                {
                    ApplicationArea = All;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                }
                field("Max. Students"; Rec."Max. Students")
                {
                    ApplicationArea = All;
                }
                field("Sales (Qty.)"; Rec."Sales (Qty.)")
                {
                    ApplicationArea = All;
                    //Editable = false; //mejor hacerlo en la tabla en su respectivo campo
                }
            }
        }
    }
}