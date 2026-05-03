page 50104 CursosList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Cursos;

    layout
    {
        area(Content)
        {
            repeater(General)
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

                field(TipoCurso; Rec.Tipo)
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
            action(totalletras)
            {
                ApplicationArea = All;
                Caption = 'Total letras';


                trigger OnAction()
                var
                    prueba12: Codeunit prueba12;
                    Total: Text;
                begin
                    Total := prueba12.pruebauno();
                    Message('Total letras: %1', Total);
                end;
            }

            action(alumnosactivos)
            {
                ApplicationArea = All;
                Caption = 'Alumnos activos totales';


                trigger OnAction()
                var
                    prueba12: Codeunit prueba12;
                    Total: Integer;
                begin
                    Total := prueba12.contaralumnosactivos();
                    Message('Total alumnos activos: %1', Total);
                end;
            }

            action(capacidadAlumnos)
            {
                ApplicationArea = All;
                Caption = 'Capacidad del centro para albergar a los alumnos';

                trigger OnAction()
                var
                    prueba: Codeunit prueba12;
                    texto: Text;
                    numeroAlumnosActivo: Integer;
                    CabenLosAlumnos: Boolean;

                begin
                    numeroAlumnosActivo := prueba.contaralumnosactivos();
                    CabenLosAlumnos := prueba.MixParamBoolean(numeroAlumnosActivo);

                    Message('C: %1 A: %2', numeroAlumnosActivo, CabenLosAlumnos);

                end;

            }

            action(CantidadTiposCurso)
            {
                ApplicationArea = All;
                Caption = 'Numero de alumnos por tipo de curso';

                trigger OnAction()
                var
                    prueba: Codeunit prueba12;
                    texto: Text;


                begin


                    Message(prueba.caseenum());

                end;

            }

            action(Confirm)
            {
                trigger OnAction()

                var
                    confirmacion1: Codeunit prueba12;

                begin

                    confirmacion1.confirmacion();
                end;

            }

            action(strmenuuu)
            {
                trigger OnAction()

                var
                    Opcion: Integer;
                begin
                    Opcion := StrMenu('Alta,Baja,Salir', 1);
                end;

            }

            action(ComprobarDisponibilidad)
            {
                ApplicationArea = All;
                Caption = 'Comprobar Disponibilidad';


                trigger OnAction()
                var
                    VentanaDialogo: Page "Dialogo Reserva Curso";
                    ManejoCursos: Codeunit Prueba456;
                begin
                    // 1. Abrimos la ventanita
                    if VentanaDialogo.RunModal() = Action::OK then begin
                        // 2. Si el usuario pulsó OK, recuperamos sus datos
                        // "Rec" es el curso seleccionado en la lista
                        ManejoCursos.ComprobarEspacio(
                            Rec.codigoCurso,
                            VentanaDialogo.GetCantidad(),
                            VentanaDialogo.GetFecha()
                        );
                    end;
                end;
            }

            action(RunCode)
            {
                ApplicationArea = All;
                Image = NewSum;
                Caption = 'Runea el codeunit';
                ToolTip = 'tooltip';
                RunObject = codeunit pruebarun;
            }

        }
    }

    var
        myInt: Integer;
}