page 50005 "XMLPort Action"
{
    //Pagina para mostrar el XMLPort, en una accion (action)
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Action Ejecution', comment = 'ESP="Ejeccucion de acciones"';

    actions
    {
        area(Processing)
        {
            action(SalesOrderXML)
            {
                Caption = 'Sales Order XML', comment = 'ESP="Pedidos Venta XML"';
                ApplicationArea = All;
                RunObject = xmlport "Sales Order Export"; //lazamos en esta page CARd , el XMLPort
                Image = Export;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Message('Hola desde XMLPOrt');
                end;
            }
        }
    }


}