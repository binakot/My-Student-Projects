unit unit532;
INTERFACE
 type
   r = ^mtype;
   mtype = record
       xw   : real;
       next : r;
       end;

{���-� �뢮�� �᫮��� �� ��࠭}
 procedure ysl;
{���-� ᮧ����� ��ࢮ�� ������� ᯨ᪠}
 Procedure first(var p,e:r; x:real);
{���-� ᮧ����� ��᫥����� ������⮢ ᯨ᪠}
 Procedure nex(var e:r; x:real);
{���-� ᮧ����� ��᫥����⥫쭮��}
 Procedure dospisok(var f:r; n:integer);
{���-� 㤠����� ᯨ᪠}
 Procedure fremem(var p:r);
{���-� �뢮�� ��᫥�-�� �� ��࠭}
 Procedure outspisok(f:r);
{���-� �஢�ન ��᫥�-�� �� �����⠭��}
 Procedure checkup(var f:r);
{���-� ��������� ��᫥�-��}
 Procedure chenge(var f:r);


 IMPLEMENTATION

   uses crt;
{���-� �뢮�� �᫮��� �� ��࠭}
 procedure ysl;
   begin
writeln('  ���� ����ࠫ쭮� n, ����⢨⥫�� a[1],...,a[n]. �᫨');
writeln('  ��᫥����⥫쭮��� a[1],...,a[n] 㯮�冷祭� �� ���뢠���');
writeln('  (�.�. �᫨ �[1]<=a[2]<=...<=a[n]), � ��⠢��� �� ���');
writeln('  ���������. ���� ������� ��᫥����⥫쭮��� a[n],...,a[1].');
 readln;
  clrscr;
  end;
{���-� ᮧ����� ��ࢮ�� ������� ᯨ᪠}
 procedure first;
  var
   s:r;
  begin
   new(s);
   s^.xw:=x;
   s^.next:=nil;
   e:=s;
   p:=s;
  end;
{���-� ᮧ����� ��᫥����� ������⮢ ᯨ᪠}
 procedure nex;
  var
   s:r;
  begin
   new(s);
   s^.xw:=x;
   s^.next:=nil;
   e^.next:=s;
   e:=s;
  end;

{���-� ᮧ����� ��᫥����⥫쭮��}
 procedure dospisok;
  var
   i:integer;
   x:real;
   e:r;
   ch:char;
 begin
  writeln('������ ��� �� ࠡ���: ',MemAvail);
  writeln('  �㤥� ������� � ���������� (y/n)');
   readln(ch);
  writeln;
  writeln;
  if (ch='y') then
   begin
    for i:=1 to n do
     begin
      write(' ������ ',i,'-� �������  ');
      readln(x);
      if (i=1) then first(f,e,x)
             else nex(e,x);
     end;
   end
            else
   begin
    randomize;
    for i:=1 to n do
     begin
      x:=random(30000)/666;
      if (i=1) then first(f,e,x)
             else nex(e,x);
     end;
   end;
 end;
{���-� 㤠����� ᯨ᪠}
 procedure fremem;
  var
   f:r;
 begin
  writeln('   ��������� ������   ');
  while (not (p^.next=nil)) do
   begin
    f:=p^.next;
    dispose(p);
    p:=f;
   end;
  dispose(p);
  writeln('������ ��� ��᫥ ࠡ���: ',MemAvail)
 end;
{���-� �뢮�� ��᫥�-�� �� ��࠭}
 procedure outspisok;
 begin
  while (not (f^.next=nil)) do
   begin
    writeln('  ',f^.xw:5:2);
    f:=f^.next;
   end;
   writeln('  ',f^.xw:5:2);
 end;
{���-� �஢�ન ��᫥�-�� �� �����⠭��}
 procedure checkup;
 var
  g:r;
  x:real;
  t:boolean;
 begin
  writeln(' ����祭��� ��᫥����⥫쭮���: ');
  g:=f;
  x:=g^.xw;
  t:=false;
  while (not (g^.next=nil)) do
   begin
   g:=g^.next;
   if (x>g^.xw) then t:=true;
   x:=g^.xw;
   end;
  if t then chenge(f);
 end;
{���-� ��������� ��᫥�-��}
 procedure chenge;
  var
  a,b:r;
 begin
  b:=f;
  f:=f^.next;
  b^.next:=nil;
  while not (f^.next=nil) do
   begin
    a:=b;
    b:=f;
    f:=f^.next;
    b^.next:=a;
   end;
  b^.next:=a;
  f^.next:=b;
 end;
end.
