page 50103 ProfesoresList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Profesor;

    layout
    {
        area(Content)
        {
            repeater(General)
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