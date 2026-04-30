page 50106 "Sales Order List 2"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Sales Header 2";
    //SourceTableView = where("Tipo Documento" = const(Pedido)); //solo pedidos
    CardPageID = "Sales Order 2";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater("Datos del pedido")
            {
                field(No; Rec.No)
                {
                    ApplicationArea = All;
                }

                field("Venta a No Cliente"; Rec."Venta a No Cliente")
                {
                    ApplicationArea = All;
                }

                field("Venta a cliente Nombre"; Rec."Venta a cliente Nombre")
                {
                    ApplicationArea = All;
                }

                field("Fecha Pedido"; Rec."Fecha Pedido")
                {
                    ApplicationArea = All;
                }

                field("Total pedido"; Rec."Total")
                {
                    ApplicationArea = All;
                }


            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}