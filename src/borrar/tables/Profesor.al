table 50102 Profesor
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; codigo; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Codigo Profesor';

        }

        field(2; nombre; text[200])
        {
            DataClassification = ToBeClassified;
            Caption = 'Nombre Profesor';

        }
    }

    keys
    {
        key(PK_profesor; codigo)
        {
            Clustered = true;
        }
    }





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