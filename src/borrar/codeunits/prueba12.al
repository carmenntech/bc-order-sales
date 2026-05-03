codeunit 50101 prueba12


{
    var
        Cursos: Record Cursos;

    procedure contarInactiv(): Integer

    var
        contador: Integer;




    begin

        contador := 0;

        if Cursos.FindSet() then
            repeat
                if Cursos.ActividadCurso = 1 then
                    contador += 1;
            until Cursos.Next() = 0;
        exit(contador)


    end;

    procedure pruebauno(): Text

    var
        contador, i : Integer;
        textoaux, totaltext : text;
        ListVocales: List of [Text];
        charaux: text;




    begin

        contador := 0;

        ListVocales.Add('a');
        ListVocales.Add('e');
        ListVocales.Add('i');
        ListVocales.Add('o');
        ListVocales.Add('u');



        if Cursos.FindSet() then
            repeat
                totaltext += Cursos.nombreCurso;
            until Cursos.Next() = 0;

        totaltext := LowerCase(TotalText);

        for i := 1 to StrLen(totaltext) do begin

            charaux := CopyStr(totaltext, i, 1);

            if (charaux = 'a') or (charaux = 'e') or
               (charaux = 'i') or (charaux = 'u') or
               (charaux = 'o') then
                contador += 1;


        end;

        exit(StrSubstNo('El número es: %1', Contador));





    end;

    procedure contaralumnosactivos(): Integer

    var
        totalcursos, contador, i : Integer;
        arrayalumnos: array[5] of Integer;

    begin


        for i := 1 to ArrayLen(arrayalumnos) do begin

            repeat

                if Cursos.ActividadCurso = 0 then begin

                    arrayalumnos[i] := Cursos.NumeroAlumnos;
                    totalcursos += arrayalumnos[i];
                end;

            until Cursos.Next() = 0;

        end;

        exit(totalcursos);

    end;


    procedure dicionario()

    var
        listaactivos, listainactivos : list of [Text];
        dicionariomix: Dictionary of [Text, List of [Text]];
        nombre, nombrecast, nom : Text;
        numerocast, num : Integer;


    begin

        repeat

            if Cursos.ActividadCurso = 0 then begin

                nombre := Cursos.nombreCurso;
                listaactivos.Add(nombre);
            end;

            if Cursos.ActividadCurso = 1 then begin

                nombre := Cursos.nombreCurso;
                listainactivos.Add(nombre);
            end;

        until Cursos.Next() = 0;

        dicionariomix.Add('IN', listainactivos);
        dicionariomix.Add('AC', listaactivos);

        nombrecast := '22';
        numerocast := 33;

        nom := Format(numerocast);
        Evaluate(num, nombrecast);



    end;


    procedure MixParamBoolean(TotalCursos: Integer): Boolean
    var
        CapacidadAlumnosCentro: Integer;
        EspacioEnAula: Boolean;
    begin
        CapacidadAlumnosCentro := 50;

        if CapacidadAlumnosCentro > TotalCursos then
            EspacioEnAula := true
        else
            EspacioEnAula := false;

        exit(EspacioEnAula);
    end;


    procedure caseenum(): Text

    var
        countpowerplatform, countbc, countadmin : Integer;
        TipoCurso: Enum TipoCurso;
        text: Text;
    begin

        case
        TipoCurso of
            TipoCurso::Administracion:
                countadmin += 1;
            TipoCurso::Businesscentral:
                countbc += 1;
            TipoCurso::PowerPlatform:
                countpowerplatform += 1;

        end;

        exit(StrSubstNo('Hay %1 cursos de Administracion, %2 de Business Central y %3 de Power Platform', countadmin, countbc, countpowerplatform));


    end;


    procedure confirmacion()

    var
        useridtext: Text;
        Datework: Date;

    begin
        if Confirm('Abrir pantalla', false) then begin


            Message('OK');
            useridtext := UserId();

            Datework := WorkDate();

            Message(useridtext, Datework);

        end

        else
            Error('Not ok');
    end;





}