codeunit 50108 "Transferir Pedido a Factura"
{
    procedure ProcesarCursoConProfesores(Pedido: Record "Sales Header 2")
    var
        Factura: Record "Sales Invoice Header 2";
        FacturaLineas: Record "Sales Invoice Line 2";
        PedidoLineas: Record "Sales Line 2";
    begin

        Factura.Init();
        //Factura.TransferFields(Pedido);
        Factura."Tipo Documento" := Pedido."Tipo Documento";
        Factura."No." := Pedido.No;
        Factura."Venta a No. Cliente" := Pedido."Venta a No Cliente";
        Factura."Venta a Cliente Nombre" := Pedido."Venta a cliente Nombre";
        Factura."Venta a Cliente Dirección" := Pedido."Venta a cliente Direccion";
        Factura."Fecha Pedido" := Pedido."Fecha Pedido";
        Factura."Fecha Registro" := Pedido."Fecha Registro";
        Factura."Código Términos de Pago " := Pedido."codigo terminos de pago";
        Factura."Total" := Pedido."Total";



        Factura.Insert(true);

        PedidoLineas.SetRange("Documento No", Pedido.No);
        if PedidoLineas.FindSet() then
            repeat

                FacturaLineas.Init();

                FacturaLineas.TransferFields(PedidoLineas);

                FacturaLineas."Document No." := Factura."No.";

                FacturaLineas.Insert(true);

            until PedidoLineas.Next() = 0;

        Message('Factura %1 creada con éxito', Factura."No.");
    end;
}




