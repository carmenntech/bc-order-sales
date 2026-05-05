table 50105 "Sales Header 2"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Tipo Documento"; Enum "Tipo Documento Ventas")
        {
            DataClassification = ToBeClassified;
            Caption = 'Tipo Documento';

        }

        field(2; No; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Número Factura';




        }

        field(3; "Venta a No Cliente"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Venta cliente';

            TableRelation = Customer."No.";


        }

        field(4; "Venta a cliente Nombre"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Venta Cliente Nombre';

        }

        field(5; "Venta a cliente Direccion"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Venta Dirección cliente';

            trigger OnValidate()
            var
                Customer: Record Customer;
                Sales: Record "Sales Header 2";

            begin

                if Customer.Get('Adress') then
                    Rec."Venta a cliente Direccion" := Customer.Address

                else
                    Rec."Venta a cliente Direccion" := 'Sin dirección asociada';

            end;
        }

        field(6; "Fecha Pedido"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Fecha del pedido';

            trigger OnValidate()

            var
                Sales: Record "Sales Header 2";

            begin
                if Rec."Fecha Pedido" = 0D then
                    Rec."Fecha Pedido" := Today();
            end;
        }

        field(7; "Fecha Registro"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Fecha del Registro';
        }

        field(8; "codigo terminos de pago"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Términos de pago';

            TableRelation = "Payment Terms".Code;
        }


        field(9; "Total"; Decimal) //50100
        {
            FieldClass = FlowField;
            CalcFormula = sum("Sales Line 2".Importe WHERE("Documento No" = FIELD("No")));

        }

        field(10; "Total Cantidad"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Sales Line 2".Cantidad WHERE("Documento No" = FIELD("No")));

        }


    }

    keys
    {
        key(ClaveNumeroPedido; No, "Tipo Documento")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()

    var
        Validaciones: Codeunit "Validaciones Sales";

    begin

        if Rec.No = '' then
            Rec.No := Validaciones.GetNextNoCode();

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()

    var
        SalesLine: Record "Sales Line 2";

    begin
        SalesLine.SetRange("Documento No", Rec.No);

        if SalesLine.FindSet() then
            repeat
                SalesLine.Delete(true);
            until SalesLine.Next() = 0;

    end;


    trigger OnRename()
    begin

    end;

}