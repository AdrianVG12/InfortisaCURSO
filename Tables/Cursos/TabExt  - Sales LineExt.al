tableextension 50000 "Curso Tabla Extension" extends "Sales Line"
{
    fields
    {
        modify("No.")
        {
            Caption = 'Course', Comment = 'ESP="Curso"';
            TableRelation = if (Type = const(Course)) Course;
        }
        /* modify(Description)
        {
            Caption = 'Description', Comment = 'ESP="Descripción"';
            TableRelation = if (Type = const(Course)) Course;
        } */
    }
}