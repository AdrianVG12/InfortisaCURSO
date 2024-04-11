pageextension 50105 "Pagina Ext Lineas Blanket" extends "Blanket Sales Order Subform"
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