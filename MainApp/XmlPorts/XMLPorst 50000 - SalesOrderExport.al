xmlport 50000 "Sales Order Export"
{
    Caption = 'Sales Order Export', Comment = 'ESP="Exportacion pedidos venta"';
    Direction = Export;

    schema //esquema XML
    {
        textelement(Root)
        {
            tableelement(SalesHeader; "Sales Header")
            {

                //filtro de la talba prncipal
                SourceTableView = where("Document Type" = const(Order)); // para que el tipo de docuemtno sea tipo pedido si o si (order)
                fieldattribute(Customer; SalesHeader."Sell-to Customer No.")
                {
                }
                fieldelement(No; SalesHeader."No.")
                {
                }
                fieldelement(Name; SalesHeader."Sell-to Customer Name")
                {
                }
                fieldelement(Date; SalesHeader."Order Date")
                {
                }
                fieldelement(Currency; SalesHeader."Currency Code")
                {

                }
                fieldelement(Location; SalesHeader."Location Code")
                {

                }

                tableelement(SalesLine; "Sales Line")
                {
                    //filtros para la relacion con la tabla principal
                    SourceTableView = where("Document Type" = const(Order));
                    LinkTable = SalesHeader; //Link de realcion de la talba de arriba( el tablelement de arriba)
                    LinkFields = "Document Type" = field("Document Type"), "Document No." = field("No."); //Relacion link campos claves primaria de saleslines y salesheader

                    fieldelement(Type; SalesLine.Type)
                    {

                    }
                    fieldelement(No; SalesLine."No.")
                    {

                    }
                    fieldelement(Name; SalesLine.Description)
                    {

                    }
                    fieldelement(Quantity; SalesLine.Quantity)
                    {

                    }
                    fieldelement(Price; SalesLine."Unit Price")
                    {

                    }
                    fieldelement(Discount; SalesLine."Line Discount %")
                    {

                    }

                }
            }
        }
    }
}