pageextension 50100 "Pagina Ext Lineas" extends "Sales Order Subform"
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