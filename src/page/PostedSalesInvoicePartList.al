page 50114 "Posted Sales Part List"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Sales Invoice Line 2";
    Editable = false;

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

                field("Linea No"; Rec."Linea No. ")
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


            }
        }
    }

    var
        myInt: Integer;
}