page 50101 CursosCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Cursos;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(codigoCurso; Rec.codigoCurso)
                {
                    ApplicationArea = All;
                }
                field(nombreCurso; Rec.nombreCurso)
                {
                    ApplicationArea = All;
                }

                field(CodigoProfesor; Rec.CodigoProfesor)
                {
                    ApplicationArea = All;
                }

                field(ActividadCurso; Rec.ActividadCurso)
                {
                    ApplicationArea = All;
                }

                field(NumeroAlumnos; Rec.NumeroAlumnos)
                {
                    ApplicationArea = All;
                }

                field(FechaInicio; Rec.FechaInicio)
                {
                    ApplicationArea = All;
                }

                field(FechaFIn; Rec.FechaFIn)
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