table 50002 "Courses Setup"
{
    Caption = 'Courses Setup'; //Tabla copiada de  Resources Setup, modifcada con lo necesario

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key', Comment = 'ESP="Clave Primaria"';
        }
        field(2; "Course Nos."; Code[20])
        {
            Caption = 'Courses Nos.', Comment = 'ESP="Nº Cursos"';
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }
}
