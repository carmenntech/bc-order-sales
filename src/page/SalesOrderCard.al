page 50107 "Sales Order 2"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Sales Header 2";
    Editable = true;

    layout
    {
        area(Content)
        {
            group("Datos del Pedido")
            {
                field(No; Rec.No)
                {
                    ApplicationArea = All;
                    Editable = true;
                }

                field("Venta a No Cliente"; Rec."Venta a No Cliente")
                {
                    ApplicationArea = All;
                    Editable = true;
                }

                field("Venta a cliente Nombre"; Rec."Venta a cliente Nombre")
                {
                    ApplicationArea = All;
                    Editable = true;
                }

                field("Fecha Pedido"; Rec."Fecha Pedido")
                {
                    ApplicationArea = All;
                    Editable = true;
                }

                field("Fecha Registro"; Rec."Fecha Registro")
                {
                    ApplicationArea = All;
                    Editable = true;
                }
            }

            part("Sales Header 2"; "Sales Order Part List")
            {
                SubPageLink = "Documento No" = field(No);
            }

            group(Totales)
            {

                field("Total"; Rec."Total")
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