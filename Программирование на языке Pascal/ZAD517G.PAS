program zad517g;
uses
  crt;
type
  tmp=record
    name  :string[15];
    value :shortint;
    Age1,age2:shortint;
    end;
var
  f:text;a:array[1..10] of tmp;
  toy:tmp; n,i:integer;
procedure Reg;
  begin
    readln;
    write('           ����誠__');
    readln(toy.name);
    write('              ����__');
    readln(toy.value);
    writeln('������� �࠭���:');
    write('                  ��__');
    readln(toy.Age1);
    write('                  ��__');
    readln(toy.Age2);
    writeln(f,toy.name,' ',toy.value,' ',toy.age1,' ',toy.age2);
  end;

begin
  clrscr;
  assign(F,'c:\toy.txt');
  rewrite(F);
  writeln ('���� �������� ����襪? (y/n)');
  if readkey='y' then
  write('������ ���-�� ����襪:');readln(n);
   for i:=1 to n do
    begin
     Reg;
     writeln('��� ��室� - Esc');
     if readkey=#27 then break;
    end;
  close(f);
  reset(f);
  clrscr;i:=1;
  while not(eof(F)) and (i<=n)
  do
    begin
      readln(f,a[i].name,a[i].value,a[i].age1,a[i].age2); inc(i);
    end;
  close(f);
  for i:=1 to n do
   begin
    if (a[i].age1<=4) and (a[i].age2>=10) then
    writeln(a[i].name);
   end;
   readkey;
end.