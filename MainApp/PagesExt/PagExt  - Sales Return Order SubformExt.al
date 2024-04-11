pageextension 50104 "Pagina Ext Lineas Return" extends "Sales Return Order Subform"
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