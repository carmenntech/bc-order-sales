page 50110 "Dialogo Reserva Curso"
{
    PageType = StandardDialog;
    Caption = 'Datos de la Reserva';

    layout
    {
        area(Content)
        {
            group(Informacion)
            {
                field(CantAlumnos; CantidadAlumnos)
                {
                    ApplicationArea = All;
                    Caption = 'Cantidad de Alumnos';
                }
                field(FechaReserva; FechaNecesitada)
                {
                    ApplicationArea = All;
                    Caption = 'Fecha Necesitada';
                }
            }
        }
    }

    var
        CantidadAlumnos: Integer;
        FechaNecesitada: Date;


    procedure GetCantidad(): Integer
    begin
        exit(CantidadAlumnos);
    end;

    procedure GetFecha(): Date
    begin
        exit(FechaNecesitada);
    end;
}