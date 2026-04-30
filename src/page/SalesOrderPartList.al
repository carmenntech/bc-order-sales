page 50109 "Sales Order Part List"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Sales Line 2";

    layout
    {
        area(Content)
        {
            repeater("Lineas del Pedido")
            {
                field(Tipo; Rec.Tipo)
                {
                    ApplicationArea = All;
                }

                field("Linea No"; Rec."Linea No")
                {
                    ApplicationArea = All;
                }

                field(Descripcion; Rec.Descripcion)
                {
                    ApplicationArea = All;
                }

                field(Cantidad; Rec.Cantidad)
                {
                    ApplicationArea = All;
                }

                field(Precio; Rec.Precio)
                {
                    ApplicationArea = All;
                }

                field(Importe; Rec.Importe)
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