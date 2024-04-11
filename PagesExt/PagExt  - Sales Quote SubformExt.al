pageextension 50102 "Pagina Ext Lineas Quote" extends "Sales Quote Subform"
{ //Extension de la pagina de lineas para añadir el campo edicion en las lineas al crear un curso
    layout
    {
        addafter("No.")
        {
            field("Course Edition"; Rec."Course Edition")
            {
                ApplicationArea = All;
            }
        }
    }
}