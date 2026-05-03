codeunit 50102 Prueba456
{

    [TryFunction]
    procedure ValidarPrecioPositivo(NumeroALumnos: Integer)
    begin
        if NumeroALumnos <= 0 then
            error('El numero %1 no es valido.', NumeroALumnos);


    end;




    procedure ComprobarEspacio(CursoID: Code[20]; Alumnos: Integer; Fecha: Date)
    var
        Curso: Record Cursos;
        MyErrorInfo: ErrorInfo;
    begin
        if not Curso.Get(CursoID) then exit;

        if ValidarPrecioPositivo(Alumnos) then begin

            if (Alumnos > Curso.NumeroAlumnos) then
                Error('No hay espacio suficiente. El curso %1 solo permite %2 alumnos.', Curso.nombreCurso, Curso.NumeroAlumnos)
            else
                Message('Espacio confirmado para el curso %1 el día %2.', Curso.nombreCurso, Fecha);

        end;


        if CursoID = '' then begin
            MyErrorInfo.Title('Falta el código del cliente');
            MyErrorInfo.Message('No puedes continuar sin asignar un cliente a la cabecera.');
            MyErrorInfo.DetailedMessage('El campo No. en la tabla Header Ventas está vacío.');

            // Incluso puedes indicar qué registro y qué campo falló


            Error(MyErrorInfo);



        end;

    end;


}