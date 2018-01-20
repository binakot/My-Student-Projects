unit unit532;
INTERFACE
 type
   r = ^mtype;
   mtype = record
       xw   : real;
       next : r;
       end;

{проц-ра вывода условия на экран}
 procedure ysl;
{проц-ра создания первого элемента списка}
 Procedure first(var p,e:r; x:real);
{проц-ра создания последующих элементов списка}
 Procedure nex(var e:r; x:real);
{проц-ра создания последовательности}
 Procedure dospisok(var f:r; n:integer);
{проц-ра удаления списка}
 Procedure fremem(var p:r);
{проц-ра вывода послед-сти на экран}
 Procedure outspisok(f:r);
{проц-ра проверки послед-сти на возрастание}
 Procedure checkup(var f:r);
{проц-ра изменения послед-сти}
 Procedure chenge(var f:r);


 IMPLEMENTATION

   uses crt;
{проц-ра вывода условия на экран}
 procedure ysl;
   begin
writeln('  Даны натуральное n, действительные a[1],...,a[n]. Если');
writeln('  последовательность a[1],...,a[n] упорядочена по неубыванию');
writeln('  (т.е. если а[1]<=a[2]<=...<=a[n]), то оставить ее без');
writeln('  изменения. Иначе получить последовательность a[n],...,a[1].');
 readln;
  clrscr;
  end;
{проц-ра создания первого элемента списка}
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
{проц-ра создания последующих элементов списка}
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

{проц-ра создания последовательности}
 procedure dospisok;
  var
   i:integer;
   x:real;
   e:r;
   ch:char;
 begin
  writeln('Размер кучи до работы: ',MemAvail);
  writeln('  Будете вводить с клавиатуры (y/n)');
   readln(ch);
  writeln;
  writeln;
  if (ch='y') then
   begin
    for i:=1 to n do
     begin
      write(' Введите ',i,'-ый элемент  ');
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
{проц-ра удаления списка}
 procedure fremem;
  var
   f:r;
 begin
  writeln('   УДАЛЯЕТСЯ СПИСОК   ');
  while (not (p^.next=nil)) do
   begin
    f:=p^.next;
    dispose(p);
    p:=f;
   end;
  dispose(p);
  writeln('Размер кучи после работы: ',MemAvail)
 end;
{проц-ра вывода послед-сти на экран}
 procedure outspisok;
 begin
  while (not (f^.next=nil)) do
   begin
    writeln('  ',f^.xw:5:2);
    f:=f^.next;
   end;
   writeln('  ',f^.xw:5:2);
 end;
{проц-ра проверки послед-сти на возрастание}
 procedure checkup;
 var
  g:r;
  x:real;
  t:boolean;
 begin
  writeln(' Полученная последовательность: ');
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
{проц-ра изменения послед-сти}
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
