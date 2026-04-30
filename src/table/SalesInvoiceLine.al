table 50108 "Sales Invoice Line 2"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Tipo Documento"; Enum "Tipo Documento Ventas")
        {
            DataClassification = ToBeClassified;
            Caption = 'Tipo Documento';

        }

        field(2; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Sales Invoice Line 2"."Document No.";

        }

        field(3; "Linea No. "; Integer)
        {
            DataClassification = ToBeClassified;

        }

        field(4; "Venta a No. Cliente"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = customer."No.";

        }

        field(5; Tipo; Enum "Tipo Linea Venta")
        {
            DataClassification = ToBeClassified;
            Caption = 'Tipo de venta';

        }



        field(6; No; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Número Venta';

            TableRelation = if (Tipo = const(Producto)) "Item"."No."
            else if (Tipo = const(Activo)) "Fixed Asset"."No.";

        }

        field(7; Descripcion; Text[100])
        {
            DataClassification = ToBeClassified;

        }

        field(8; Cantidad; Decimal)
        {
            DataClassification = ToBeClassified;

        }

        field(9; Precio; Decimal)
        {
            DataClassification = ToBeClassified;

        }

        field(10; Importe; Decimal)
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(Key1; "Document No.", "Tipo Documento", "Linea No. ")
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