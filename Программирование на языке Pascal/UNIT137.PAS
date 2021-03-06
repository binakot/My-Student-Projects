 Unit unit137;

INTERFACE

  Uses crt;
    type
     Ptr = ^table;
     table = record
        x: real;
        number: integer;
        next: Ptr;
     end;

    {��楤�� ��뢠��� txt ��६����� � 䠩���}
   Procedure FileLink(var t:text);
   {�᫮��� ����� �137�}
   Procedure Us137(var t:text);
  {��楤�� ���������� �����,�� ������ ��뫠���� 㪠��⥫� a,
               ��ࢮ� � �易��� ᯨ᮪ f }
   Procedure AddFirst(a:Ptr;var f:Ptr);
  {���������� � ᯨ᮪ first ��᫥ �������,�� ����� ��뫠����
                     㪠��⥫� old}
   Procedure AddAfter(a:Ptr;var old:Ptr);
   {��楤�� ��筮��ᮧ����� ᯨ᪠}
   Procedure HandMake(var t:text;var f:Ptr);
   {��楤�� ��⮬���᪮�� ᮧ����� ᯨ᪠}
   Procedure AutoMake(var t:text;var f:Ptr);
  {��楤�� ᮧ����� ᯨ᪠,��� ���-��।������ ��ࠬ���}
   Procedure BuildList(var t:text;var f:Ptr);
  {�������� ��ࢮ� ����� �� ᯨ᪠ � ��ᢠ������ 㪠��⥫� ��
                   ���� � ��६����� �}
   Procedure DelFirst(var a,f:Ptr);
     {�������� �� ᯨ᪠ �������,���饣� ��᫥ �������
      old,� ��ᢠ������ 㪠��⥫� �� ���� � ��६����� �}
   Procedure DelAfter(old:Ptr; var a:Ptr);
  {�������� �������᪨� ��६����� �� ᯨ᪠ � ������� ������ }
   Procedure DelList(var f:Ptr);
     {�㭪�� ��� � ᯨ᪥ ������,���� number ���ன
      ᮢ������ � ��ࠬ��஬ n.�����頥� 㪠��⥫� ��
       ��������� ������ ��� nil,�᫨ ������ �� �������.}
   Function FindNumber(n:integer;var f: Ptr) : Ptr;
     {�㭪�� ��� � ᯨ᪥ ������,���� X ���ன ᮢ������ � ��ࠬ��஬ X.
         �����頥� 㪠��⥫� �� ��������� ������ ��� nil,
                  �᫨ ������ �� �������.}
   Function FindX(x:real;var f: Ptr) : Ptr;
           {��楤�� ����祭�� ��᫥����⥫쭮��  }
   Procedure Posl(var t:text;f:Ptr;n:integer);

IMPLEMENTATION

 {���-� ��뢠��� txt ��६����� � 䠩���}
 PROCEDURE FileLink(var t:text);
  begin
   assign(t,'vad.txt');
   rewrite(t);
  end;

 {���-� �뢮�� �᫮��� �����}
  PROCEDURE Us137(var t:text);
    begin
     write(t,'':4,'���� ����ࠫ쭮� �᫮ n,����⢨⥫�� �᫠ ');
     writeln(t,'A[1],...,A[n].');
     writeln(t,'':2,'���᫨�� A[1]�A[1], A[1]�A[2],..., A[1]�A[n]');
    end;

 {���-� ���������� �����,�� ������ ��뫠���� 㪠��⥫� �,
                ��ࢮ� � �易��� ᯨ᮪ f }
  PROCEDURE AddFirst(a:Ptr;var f:Ptr);
   begin
    a^.next:=f;
    f:=a
   end;
   { ���������� � ᯨ᮪ first ��᫥ �������,�� ����� ��뫠����
                          㪠��⥫� old}
  PROCEDURE AddAfter(a:Ptr;var old:Ptr);
   begin
    a^.next:=old^.next;
    old^.next:=a
   end;

   {���-� ��筮��ᮧ����� ᯨ᪠}
  PROCEDURE HandMake(var t:text;var f:ptr);
    var
     i:Integer;        {���稪 ������⮢}
     p,d:Ptr;        {p-㪠��⥫� �� ⥪�騩 ������� � ���஬ ��ࢮ��砫쭮
                         �࠭���� ���ଠ��
                       d-㪠��⥫� ��� ��뢠��� �ᥤ��� ������⮢}
     y:Real;
     Ch:Char;
   Begin
    f:=NIL;
    i:=0;
    Write('':5,'�⮡� �������� ������ ��ப � 䠩�, ');
    WriteLn('������ ������� ESC!');
    WriteLn('������ �������� ��᫥����⥫쭮��: ');
     Repeat
      Inc(i);
      write('a[',i,']= ');
      ReadLn(y);
      p := New(Ptr);
      p^.x := y;
      p^.number := i;
      if (i mod 5)=0 then writeln(t);
      writeln(t,'a[',p^.number:2,']= ',p^.x:3:2);
       if i = 1 then
        begin
         AddFirst(p,f);
         d := f
        end
       else
        begin
         AddAfter(p,d);
         d :=p;
        end;
     Ch:=ReadKey;
    Until Ch=#27;
  End;

 {���-� ��⮬���᪮�� ᮧ����� ᯨ᪠}
 PROCEDURE AutoMake(var t:text;var f:Ptr);
  var
   n,i:Integer;        {�᫮ ������⮢ ��᫥����⥫쭮��}
   p,d:Ptr;          {p-㪠��⥫� �� ⥪�騩 ������� � ���஬ ��ࢮ��砫쭮
                         �࠭���� ���ଠ��}
  Begin
    Write('������ ������⢮ ������⮢ ��᫥����⥫쭮��: ');
    ReadLn(n);
    f:=NIL;
    For i:=1 to n do
     Begin
       p:=New(Ptr);
       p^.x:=Random(50);
       p^.number := i;
       if (i mod 4)=0 then
        begin
         writeln;
         writeln(t);
        end;
        Write('  a[',p^.number:2,'] = ',p^.x:3:2);
        writeln(t,'a[',p^.number:2,']= ',p^.x:3:2);
       If i=1 then
        Begin
         AddFirst(p,f);
         d:=f
        End
       else
        Begin
         AddAfter(p,d);
         d:=p
        End;
     End;
  End;

 {���-� ᮧ����� ᯨ᪠
  b-ᮧ������� ᯨ᮪}
 PROCEDURE BuildList(var t:text;var f:Ptr);
  var
    Ch:Char;          {ᨬ���쭠� ��६����� �롮�}
  Begin
    Write('������ ����� �� ᮧ����� �������᪨� ��६�����: ',memavail);
    Writeln;
    Write('�� ��� ����� ������ �������� ��᫥����⥫쭮��? (Y-��/N-���) ');
    ReadLn(Ch);
    writeln(t,'���� ����⢨⥫�� �᫠: ');
    If UpCase(Ch)='Y' then HandMake(t,f)
    else AutoMake(t,f);
    writeln;
  End;

   { �������� ��ࢮ� ����� �� ᯨ᪠ � ��ᢠ������ 㪠��⥫� ��
                   ���� � ��६����� �}
  PROCEDURE DelFirst(var a,f:Ptr);
           begin
            a:=f;{f 㪠�뢠�� �� ���� �������}
            f:=f^.next;{���� next ᮤ�ন� 㪠��⥫� �� ��ன ������� ᯨ᪠}
           end;

       { �������� �� ᯨ᪠ �������,���饣� ��᫥ �������
         old,� ��ᢠ������ 㪠��⥫� �� ���� � ��६����� �}

  PROCEDURE DelAfter(old:Ptr; var a:Ptr);
           begin
            a:=old^.next;
            old^.next:=old^.next^.next
           end;

     { �������� �������᪨� ��६����� �� ᯨ᪠ � ������� ������ }
  PROCEDURE DelList(var f:Ptr);
          var
           d: Ptr;
          begin
          writeln('������ ����� �� 㤠����� ��६�����: ',memavail);
           while f <> nil do
            begin
             DelFirst(d,f);
             Dispose(d);
            end;
            writeln('��������� �������᪨� ��६����...   ');
            writeln('������ ����� ࠢ��: ',memavail);
          end;

         {�㭪�� ��� � ᯨ᪥ ������,���� number ���ன
          ᮢ������ � ��ࠬ��஬ n.�����頥� 㪠��⥫� ��
          ��������� ������ ��� nil,�᫨ ������ �� �������.}

  FUNCTION FindNumber(n:integer;var f: Ptr) : Ptr;
           var
            tp : Ptr;
           begin
            tp:=f; { tp 㪠�뢠�� �� ���� ������� ᯨ᪠}
            while tp <> nil do
             if tp^.number = n then
               begin
                FindNumber := tp;
                exit
               end
               else
                tp := tp^.next;
            FindNumber := nil
           end;

         { �㭪�� ��� � ᯨ᪥ ������,���� X ���ன
          ᮢ������ � ��ࠬ��஬ X.�����頥� 㪠��⥫� ��
          ��������� ������ ��� nil,�᫨ ������ �� �������.}

  FUNCTION FindX(x:real;var f: Ptr) : Ptr;
           var
            tp : Ptr;
           begin
            tp:=f; { tp 㪠�뢠�� �� ���� ������� ᯨ᪠}
            while tp <> nil do
             if tp^.x = x then
               begin
                FindX:= tp;
                exit
               end
               else
                tp := tp^.next;
            FindX := nil
           end;

           {��楤�� ����祭�� ��᫥����⥫쭮��}
  PROCEDURE Posl(var t:text;f:Ptr;n:integer);
          var
           p,d: Ptr;
           y: real;
          begin
           d := f;
           p:=f;
           writeln('�������: ');
           writeln(t,'�������: ');
           while p <> nil do
            begin
                y := d^.x * p^.x;
                write('A[',d^.number:2,'] * A[',p^.number:2,']= ');
                writeln(d^.x:1:2,' * ',p^.x:1:2,'= ',y:2:2);
                writeln(t,'X[',d^.number:2,']*[X',p^.number:2,']=',y:2:2);
             p := p^.next;
            end;
           end;
  End.    
