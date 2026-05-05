page 50112 "Posed Sales Invoice"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Sales Invoice Header 2";
    CardPageID = "Sales Invoice Header 2";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.")
                {

                    ApplicationArea = All;
                }

                field("Venta a No. Cliente"; Rec."Venta a No. Cliente")
                {
                    ApplicationArea = All;
                }

                field("Venta a Nombre"; Rec."Venta a Cliente Nombre")
                {
                    ApplicationArea = All;
                }

                field("Fecha Registro"; Rec."Fecha Registro")
                {
                    ApplicationArea = All;
                }

                field(Total; Rec.Total)
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