xmlport 50001 "XMLPort Import Courses"
{
    Caption = 'Import courses', comment = 'ESP="Importar cursos"'; //.txt creado para indicar los datos de los cursos a importar
    Format = VariableText;
    FieldDelimiter = '';
    FieldSeparator = ';';
    Direction = Import; //para importar
    UseRequestPage = false; //para q no pida filtros

    schema
    {
        textelement(Root)
        {
            tableelement(Cursos; Course)
            {
                //AutoSave = false; // Para que no se escriban en base de datos lo que viene de un archivo, para por ejemplo hacer cambios adicionales. Lo que hara sera que sobre la variable Cursos, se asignan los valores del archvio .txt y del codigo, entonces si AutoSave esta a true, el sistema al asuignar la variable hace el insert, si esta en flase, no se hace el inster, y hay que llamar a la funcion de insert o modify
                AutoUpdate = true; //para mdoificar los campos que ya puedan exisitir y crear nuevos
                //AutoReplace = true;//reemplazara el registro con un unevo registro en la bd
                fieldelement(No; Cursos."No.") { }
                fieldelement(Name; Cursos.Name) { }
                fieldelement(Duration; Cursos."Duration (hours)")
                {
                    trigger OnAfterAssignField()

                    begin
                        Cursos."Duration (hours)" := Round(Cursos."Duration (hours)" / 60, 1); // para que se actualicen los datos de horas a minutos (se pone el Round para que redondee, si no da error porque Duration, es in integer y la division devuelve decima)
                    end;
                }
                trigger OnBeforeModifyRecord()
                begin
                    Funcionalidad();
                    //Cursos.Modify(); //Hecho para el AutoSave = flase;
                end;

                trigger OnBeforeInsertRecord()
                begin
                    Funcionalidad();
                    //Cursos.Insert(); //Hecho para el AutoSave = flase;
                end;

            }
        }
    }
    local procedure Funcionalidad()
    begin
        Cursos.Validate("Language Code", 'ESP');
        Cursos.Validate("Gen. Prod. Posting Group", 'SERVICIOs');
        Cursos.Validate("VAT Prod. Posting Group", 'IVA7');
        Cursos.Name := 'Desde archivo: ' + Cursos.Name;
    end;
}