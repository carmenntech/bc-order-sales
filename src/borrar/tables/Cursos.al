table 50101 Cursos
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; codigoCurso; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Codigo curso';

        }

        field(2; nombreCurso; text[300])
        {
            DataClassification = ToBeClassified;
            Caption = 'Nombre Curso';
        }

        field(3; ActividadCurso; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Activo,Inactivo;
            Caption = 'Actividad Curso';

        }

        field(4; CodigoProfesor; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Profesor.codigo;
        }

        field(5; NumeroAlumnos; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Numero Alumnos';
        }

        field(6; FechaInicio; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Fecha inicio';
        }

        field(7; FechaFIn; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Fecha fin';
        }

        field(8; Tipo; Enum TipoCurso)
        {
            DataClassification = ToBeClassified;
            Caption = 'Tipo Curso';
        }
    }


    keys
    {
        key(PK_cursos; codigoCurso)
        {
            Clustered = true;
        }
    }

    var


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