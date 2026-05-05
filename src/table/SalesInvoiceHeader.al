table 50107 "Sales Invoice Header 2"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Tipo Documento"; Enum "Tipo Documento Ventas")
        {
            DataClassification = ToBeClassified;
            Caption = 'Tipo de Documento';
        }

        field(2; "No."; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(3; "Venta a No. Cliente"; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";

        }
        field(4; "Venta a Cliente Nombre"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(5; "Venta a Cliente Dirección"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(6; "Fecha Pedido"; Date)
        {
            DataClassification = ToBeClassified;

        }

        field(7; "Fecha Registro"; Date)
        {
            DataClassification = ToBeClassified;

        }

        field(8; "Código Términos de Pago "; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Payment Terms".Code;

        }

        field(9; "Total"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Sales Invoice Line 2".Importe WHERE("Document No." = FIELD("No.")));

        }

        field(10; "Total Cantidad"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Sales Invoice Line 2".Cantidad WHERE("Document No." = FIELD("No.")));

        }
    }

    keys
    {
        key(Key1; "No.", "Tipo Documento")
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
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}