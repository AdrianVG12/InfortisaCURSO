page 50002 "Courses Setup"
{
    AccessByPermission = TableData Course = R;
    ApplicationArea = All;
    //CaptionML = ENU = 'Courses Setup', ESP = 'Coonf. cursos';
    Caption = 'Course Setup', Comment = 'ESP="Coonf. cursos"';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Courses Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(Numbering)
            {
                //CaptionML = ENU = 'Numbering', ESP = 'Numeración';
                Caption = 'Numbering', Comment = 'ESP="Numeración"';
                field("Course Nos."; Rec."Course Nos.")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the number series code you can use to assign numbers to Courses.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}

