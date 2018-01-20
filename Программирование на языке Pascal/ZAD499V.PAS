program zad499v;
uses crt;
var  c:file of char;
      kolich:integer;
      ksym:integer;
      symvol:char;
begin
clrscr;
assign(c,'c:\c.txt');
ksym:=0;
kolich:=0;
reset(c);
repeat
read(c,symvol);
if symvol<>#32 then begin
 ksym:=ksym+1;
 if eof(c)then
  kolich:=kolich+1;
end else begin
 if (ksym<=20)and(ksym<>0) then
  kolich:=kolich+1;
 ksym:=0;
end;
until eof(c);

write('Количество слов в файле: ',kolich);
readkey;
end.