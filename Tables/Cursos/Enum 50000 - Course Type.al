enum 50000 "Course Type"
{
    Extensible = true;
    Caption = 'Coourse Type', Comment = 'ESP="Tipo Curso"';

    value(0; " ")
    {
        //COMENTADOS YA QUE LA TRADUCCION YA SE HACE Y NO ES NECESARIO PONERLO
    }
    value(1; "Instructor-lead")
    {
        Caption = 'Instructor-lead', Comment = 'ESP="Guiado"';
    }
    value(2; "Video Tutorial")
    {
        Caption = 'Video Tutorial', Comment = 'ESP="Tutorial de Video"';
    }
}