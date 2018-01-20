unit unit136;
INTERFACE
 uses crt;
  TYPE
       pspisk=^spisk;
       spisk=record
         znach:integer;
         p1,p2:pspisk;
       end;
  {проц-ра связывания txt переменной с файлом}
 PROCEDURE FileLink(var v:text);
  {проц-ра вывода условия на экран}
 PROCEDURE Ysl;
  {проц-ра вывода послед-сти}
 PROCEDURE VivodPosl(var txt:text;pt:pspisk;namb:word);
  {проц-ра связывания двух элементов при ручном вводе}
 PROCEDURE Svayz(var pn1:pspisk;var pn2:pspisk;sch:word;var zn:integer);
  {проц-ра связывания двух элементов при вводе randomom}
 PROCEDURE Svayz1(var pn1:pspisk;var pn2:pspisk;var sch:word);
  {проц-ра ввода элементов массива в ручную}
 PROCEDURE Sumy(var pnt:pspisk;var kol:word);
  {проц-ра ввода элементов массива случайными числами}
 PROCEDURE Auto(var pnt:pspisk;var kol:word);
  {проц-ра составления послед-сти в ручную или случайно}
 PROCEDURE Sostpos(var ukaz:pspisk;var nom:word);
  {возращает указатель nmr-ого элемента списка}
 FUNCTION  UkNom(pnach:pspisk;nomer:word):pspisk;
  {проц-ра нахождения произведения}
 PROCEDURE Obrpos(pnt:pspisk;nmr:word;var pp:real);
  {проц-ра вывода результата}
 PROCEDURE VivodPosvfl(var tx:text;pn1:pspisk;nm:word;p:real);

IMPLEMENTATION

PROCEDURE FileLink(var v:text);
  begin
   assign(v,'vad.txt');
   rewrite(v);
  end;

PROCEDURE Ysl;
 begin
writeln('');
writeln('    Дано натуральное n, действительные a[1],...a[n].Вычислить:      ');
writeln('                          a[1]*...*a[n]                             ');
 readln;
 end;

PROCEDURE VivodPosl(var txt:text;pt:pspisk;namb:word);
 Var
  pt1:pspisk;
  i:word;
  k:byte;
 Begin
   pt1:=pt;
  for i:=1 to namb do
        begin
         k:=2;
         if (i mod 5)=0 then
                 writeln(txt,'':k,'x[',i,']=',pt1^.znach,';')
         else
                write(txt,'':k,'x[',i,']=',pt1^.znach,';');
         pt1:=pt1^.p2;
        end;
  writeln(txt);
 End;

PROCEDURE Svayz(var pn1:pspisk;var pn2:pspisk;sch:word;var zn:integer);
 Begin
  write('  x[',sch,']= ');
  readln(zn);
  new(pn1);
  pn2^.p2:=pn1;
  pn1^.znach:=zn;
  pn1^.p1:=pn2;
 End;


PROCEDURE Svayz1(var pn1:pspisk;var pn2:pspisk;var sch:word);
 Begin
  new(pn1);
  pn2^.p2:=pn1;
  pn1^.znach:=random(99);
  pn1^.p1:=pn2;
  inc(sch);
 End;


PROCEDURE Sumy(var pnt:pspisk;var kol:word);
 Var
  a,b:pspisk;
  x:integer;
 Begin

  kol:=1;
  writeln;
  writeln('  Введите значения x (для выхода нажмите esk)');
  write('  x[1]= ');
  readln(x);
  new(a);
  pnt:=a;
  a^.znach:=x;
  inc(kol);
 repeat
        svayz(b,a,kol,x);
        inc(kol);
        if readkey=#27 then break;
        svayz(a,b,kol,x);
        inc(kol);
  until readkey=#27;
   dec(kol);
   vivodposl(output,pnt,kol);
  writeln('Полученный размер кучи-',memavail);
 End;


PROCEDURE Auto(var pnt:pspisk;var kol:word);
 Var
  a,b:pspisk;
  i:word;
 Begin
  randomize;
  i:=1;
  writeln('  Введите количество элементов');
  write('  n=');
  readln(kol);
  new(a);
  pnt:=a;
  a^.znach:=random(99);
  inc(i);
 while (i<=kol+1) do
        begin
         svayz1(b,a,i);
         if (i=kol+1) then break;
         svayz1(a,b,i);
        end;
  VivodPosl(output,pnt,kol);
    writeln('Полученный размер кучи-',memavail);
 End;


PROCEDURE Sostpos(var ukaz:pspisk;var nom:word);
 Var ch:char;
  Begin
   repeat
        writeln('  Вы сами будете заполнять последовательность?(y/n)');
         readln(ch);
  until (ch='y')or(ch='n');
  if ch='y'then sumy(ukaz,nom)
  else auto(ukaz,nom);
 End;


Function UkNom(pnach:pspisk;nomer:word):pspisk;
 Var
  i:word;
  p:pspisk;
 Begin
  p:=pnach;
   for i:=2 to nomer do
        p:=p^.p2;
   uknom:=p;
 End;

PROCEDURE Obrpos(pnt:pspisk;nmr:word;var pp:real);
 Var
  a:pspisk;
  i:word;
 Begin
  pp:=1;
   for i:=1 to nmr do
        begin
         a:=uknom(pnt,i);
         pp:=pp*a^.znach;
        end;
  writeln(' Произведение всех членов последовательности: ',pp:5:0);
 End;


PROCEDURE VivodPosvfl(var tx:text;pn1:pspisk;nm:word;p:real);
 Begin
  writeln(tx,' Исходная последовательность:');
  vivodposl(tx,pn1,nm);
  writeln(tx,' Произведение всех членов последовательности: ',p:5:0);
 End;

 END.

