page 50102 ProfesoresCard
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Profesor;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(codigoProfesor; Rec.codigo)
                {
                    ApplicationArea = All;
                }
                field(nombreProfesor; Rec.nombre)
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