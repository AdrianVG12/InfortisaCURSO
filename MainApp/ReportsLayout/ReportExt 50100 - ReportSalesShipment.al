reportextension 50100 ReportSalesShipment extends "Sales - Shipment"
{
    dataset
    {
        add("Sales Shipment Line")
        {
            column(Course_Edition; "Course Edition")
            {

            }
        }
        modify("Sales Shipment Line")
        {

        }
    }

    requestpage
    {
        layout
        {
            modify(NoOfCopies)
            {
                Visible = false;
            }
        }
    }

    rendering
    {
        layout(LayoutNombre)
        {
            Type = RDLC;
            LayoutFile = 'mylayout.rdl';
        }
    }
}