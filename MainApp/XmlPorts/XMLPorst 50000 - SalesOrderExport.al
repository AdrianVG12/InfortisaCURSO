xmlport 50000 "Sales Order Export"
{
    Caption = 'Sales Order Export', Comment = 'ESP="Exportacion pedidos venta"';
    Direction = Export;
    Format = VariableText; //fromato en el que nos devuelve BC el xmlreport
    FormatEvaluate = Xml; //fromato para los datos a manejar, porej: la fecha se muestra 2022/01/16, con el año primero, por la config de BC.
    FieldSeparator = ' ; '; //Propiedades Field.. son solo para el Format = VariableText;
    FieldDelimiter = '''';


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
                    trigger OnBeforePassField()
                    var
                        GeneralLedgerSetup: Record "General Ledger Setup"; //tabla de contablidiad donde esta la divisa
                    begin
                        if SalesHeader."Currency Code" = '' then begin
                            GeneralLedgerSetup.SetLoadFields("LCY Code"); //filtramos para coger solo la divisa
                            GeneralLedgerSetup.Get(); //cogemos la divisa
                            SalesHeader."Currency Code" := GeneralLedgerSetup."LCY Code"; //cambiamos el valor de currency code , por la divisa
                        end;
                    end;
                }
                fieldelement(Location; SalesHeader."Location Code")
                {

                }

                //COMENTAMOS ESTA TABLA PAR MOSTRAR SOLO UNA, YA QUE EN TEXTO PLANO, 2 TABLAS SE ENTIENDEN MAL, EN XML BIEN.
                /* tableelement(SalesLine; "Sales Line") 
                {
                    //filtros para la relacion con la tabla principal
                    SourceTableView = where("Document Type" = const(Order));
                    LinkTable = SalesHeader; //Link de realcion de la talba de arriba( el tablelement de arriba)
                    LinkFields = "Document Type" = field("Document Type"), "Document No." = field("No."); //Relacion link campos claves primaria de saleslines y salesheader


                    textelement(Type) // textelement en vez de un fieldelement para cambiar el Type y que en vez de devolver un numero devuelva el caption del type
                    {
                        trigger OnBeforePassVariable()

                        begin
                            Type := Format(SalesLine.Type);
                        end;
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

                } */
            }
        }
    }
}