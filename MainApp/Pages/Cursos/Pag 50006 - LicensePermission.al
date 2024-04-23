page 50006 "Page License Permission" //para el funcionamiento de testing
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "License Permission";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Object Type"; Rec."Object Type") { ApplicationArea = All; }
                field("Object Number"; Rec."Object Number") { ApplicationArea = All; }
                field("Execute Permission"; Rec."Execute Permission") { ApplicationArea = All; }
                field("Read Permission"; Rec."Read Permission") { ApplicationArea = All; }
                field("Modify Permission"; Rec."Modify Permission") { ApplicationArea = All; }
                field("Insert Permission"; Rec."Insert Permission") { ApplicationArea = All; }
                field("Delete Permission"; Rec."Delete Permission") { ApplicationArea = All; }
                field("Limited Usage Permission"; Rec."Limited Usage Permission") { ApplicationArea = All; }

            }
        }
    }
}