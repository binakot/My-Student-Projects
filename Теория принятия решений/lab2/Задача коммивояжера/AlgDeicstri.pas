Program Alg_dejkstr;
  Uses Crt;
  Const MaxSize=8;
        n=8;
        Infinity=1000;
  Var   D: array [1..MaxSize, 1..MaxSize] of integer;
        A: array [1..MaxSize] of boolean;
        B,C: array [1..MaxSize] of integer;
        Start, Finish, k, i: integer;

  Procedure Init;
    Var  f: text;
         i, j: integer;
    Begin
      Assign(f, 'INPUT.MTR');
      Reset(f);
      For i:=1 to n do
        Begin
          For j:=1 to n do
          Read(f, D[i,j])
        End;
      For i:=1 to n do
        begin
          For j:=1 to n do
            write(d[i,j]);
            writeln
        end;
      Write('Ha4aJIbHa9I BepwuHa: '); Readln(Start);
      For i:=1 to n do
        Begin
          A[i]:=False;
          B[i]:=D[Start, i];
          C[i]:=Start
        End;
      C[Start]:=0;
      A[Start]:=True
    End;

    Function Possible: Boolean;
      Var i: integer;
      Begin
        Possible:=True;
        For i:=1 to n do If not A[i] then Exit;
        Possible:=False
      End;

    Function Min: Integer;
      Var i, minvalue, currentmin: integer;
      Begin
        Minvalue:=Infinity;
        For i:=1 to n do
          If not A[i] then
            If B[i]<minvalue then
              Begin
                currentmin:=i;
                minvalue:=B[i]
              End;
          min:=currentmin
      End;


    Begin
      ClrScr;
      Init;
      While Possible do
        Begin
          k:=min;
          A[k]:=True;
          For i:=1 to n do
            If B[i]>B[k]+D[i, k] then
              Begin
                B[i]:=B[k]+D[i, k];
                C[i]:=k
              End
        End;
      Write('KoHe4Ha9I BepwuHa: '); Readln(Finish);
      Write(Finish);
      Finish:=C[Finish];
      While Finish<>0 do
        Begin
          Write('<-', Finish);
          Finish:=C[Finish];
        End;
      ReadKey
    End.