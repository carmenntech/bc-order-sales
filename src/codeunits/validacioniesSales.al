codeunit 50100 "Validaciones Sales"
{
    procedure GetNextNoCode(): Code[20]
    var
        Sales: Record "Sales Header 2";
        UltimoNo: Integer;
    begin



        if Sales.FindLast() then
            Evaluate(UltimoNo, Sales.No);

        UltimoNo += 1;

        exit(Format(UltimoNo));
    end;
}