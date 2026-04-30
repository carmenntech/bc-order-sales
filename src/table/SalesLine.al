table 50106 "Sales Line 2"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Tipo Documento"; Enum "Tipo Documento Ventas")
        {
            DataClassification = ToBeClassified;
            Caption = 'Tipo de Documento';
        }

        field(2; "Documento No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Número de Documento';

            TableRelation = "Sales Header 2".No;
        }

        field(3; "Linea No"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Número de linea';


            trigger OnValidate()

            var

                Sales: Record "Sales Line 2";

            begin


                if rec."Linea No" = 0 then
                    if Sales.FindLast() then
                        rec."Linea No" := Sales."Linea No" + 1;

            end;

        }

        field(4; "Venta a No. Cliente"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Numero de Cliente por Venta';


            TableRelation = Customer."No.";
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
            Caption = 'Descripción';

            trigger OnValidate()

            var
                Sales: Record "Sales Line 2";
                Item: Record "Item";
                Fixed: Record "Fixed Asset";

            begin
                if Rec.Tipo = Tipo::Producto then
                    Rec.Descripcion := Item.Description;
                if Rec.Tipo = Tipo::Activo then
                    Rec.Descripcion := Fixed.Description;
            end;

        }

        field(8; Cantidad; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Cantidad Producto';

            trigger OnValidate()

            var
                Sales: Record "Sales Line 2";

            begin

                Rec.Importe := Rec.Cantidad * Rec.Precio;

            end;

        }

        field(9; Precio; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Precio Producto';

            trigger OnValidate()

            var
                Sales: Record "Sales Line 2";

            begin

                Rec.Importe := Rec.Cantidad * Rec.Precio;

            end;

        }

        field(10; Importe; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Importe venta';

            Editable = false;

        }
    }

    keys
    {
        key(Key1; "Linea No", "Documento No", "Tipo Documento")
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