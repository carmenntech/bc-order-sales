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

                field("Total cantidad"; Rec."Total cantidad")
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
            action(PasoPedidoFactura)
            {

                ApplicationArea = All;
                Caption = 'Paso pedido a Factura';


                trigger OnAction()

                var
                    Transferencia: Codeunit "Transferir Pedido a Factura";
                    Pedido: Record "Sales Header 2";
                begin

                    if Rec.No = '' then
                        Error('Debes seleccionar un pedido válido.');


                    Pedido := Rec;


                    Transferencia.ProcesarCursoConProfesores(Pedido);


                end;

            }
        }
    }

    var
        myInt: Integer;
}