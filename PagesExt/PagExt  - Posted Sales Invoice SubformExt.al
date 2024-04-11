pageextension 50106 "Pagina Ext Sales Invoice" extends "Posted Sales Invoice Subform"
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