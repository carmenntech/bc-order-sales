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
            Caption = 'Número Producto';

            TableRelation = if (Tipo = const(Producto)) "Item"."No."
            else if (Tipo = const(Activo)) "Fixed Asset"."No.";

            trigger OnValidate()

            var

                Sales: Record "Sales Line 2";
                Item: Record "Item";
                Fixed: Record "Fixed Asset";
                SalesHeader: Record "Sales Header 2";

            begin


                if rec."Linea No" = 0 then
                    if Sales.FindLast() then
                        rec."Linea No" := Sales."Linea No" + 1;

                if Rec.Tipo = Tipo::Producto then
                    if Item.Get(Rec.No) then begin
                        Rec.Descripcion := Item.Description;

                    end;

                if Rec.Tipo = Tipo::Activo then
                    if Fixed.Get(Rec.No) then begin
                        Rec.Descripcion := Fixed.Description;
                    end;

                /* Sales.SetRange("Documento No", SalesHeader.No);

                 if Sales.FindLast() then
                     Rec."Linea No" := Sales."Linea No" + 1
                 else
                     Rec."Linea No" := 1;*/

            end;

        }

        field(7; Descripcion; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Descripción';

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

    var

        validacion: Codeunit "Validaciones Sales";
        Sales: Record "Sales Line 2";
        SalesHeader: Record "Sales Header 2";

    begin



        if Sales.FindLast() then
            Rec."Linea No" := Sales."Linea No" + 1
        else
            Rec."Linea No" := 1;


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