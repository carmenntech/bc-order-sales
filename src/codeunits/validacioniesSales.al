codeunit 50100 "Validaciones Sales"
{
    procedure GetNextNoCode(): Code[200]
    var
        Sales: Record "Sales Header 2";
        UltimoNo: Integer;
    begin

        if Sales.FindLast() then
            Evaluate(UltimoNo, Sales.No);

        UltimoNo += +1;

        exit(Format(UltimoNo));
    end;

    /*  procedure GetNextLine()
      var
          Sales: Record "Sales Line 2";
          UltimaLinea : Integer;

      begin

          if Sales."Linea No" = 0 then begin

               if Sales.FindLast() then
          Rec.TuCampoInteger := MiTabla.TuCampoInteger + 1
      else
          Rec.TuCampoInteger := 1; // Si es el primero, empezamos en 1
          end;

      end;
  */
}