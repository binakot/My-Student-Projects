unit unit534;
INTERFACE
 TYPE
   r = ^mtype;
   mtype = record
       xw   : real;
       snext : r;
       pnext : r;
       end;
   {проц-ра связывания txt переменной с файлом}
 PROCEDURE FileLink(var v:text);
   {проц-ра вывода условия задачи}
 PROCEDURE Ysl(var v:text);
   {проц-ра создания первого элемента списка}
 PROCEDURE First(var p,e:r; x:real);
   {проц-ра создания последующих элементов списка}
 PROCEDURE Nex(var e:r; x:real);
   {проц-ра построения списка}
 PROCEDURE Dospisok( var f,e:r; n:integer );
   {проц-ра удаления списка}
 PROCEDURE Fremem(var p:r);
   {пpоц-ра вывода ответа}
 PROCEDURE Outanswer(f,e:r;var v:text);
   {}
 PROCEDURE Outspisok(f:r);

IMPLEMENTATION


 PROCEDURE FileLink(var v:text);
  begin
 assign(v,'vad.txt');
 rewrite(v);
  end;

 PROCEDURE Ysl(var v:text);
  begin
   writeln('  Даны натуральное число n и действительные числа a(1),..,a(n)  ');
   writeln('            Получить  a(1)*a(2n)+...+a(n)*a(n+1)                ');
   writeln(v,'  Даны натуральное число n и действительные числа a(1),..,a(n)  ');
   writeln(v,'            Получить  a(1)*a(2n)+...+a(n)*a(n+1)                ');
  end;

 PROCEDURE First;
  var
   s:r;
  begin
   new(s);
   s^.xw:=x;
   s^.snext:=nil;
   s^.pnext:=nil;
   e:=s;
   p:=s;
  end;

 PROCEDURE Nex;
  var
   s:r;
  begin
   new(s);
   s^.xw:=x;
   s^.snext:=nil;
   e^.snext:=s;
   s^.pnext:=e;
   e:=s;
  end;

 PROCEDURE Dospisok;
  var
   i:integer;
   x:real;
   ch:char;
  begin
   writeln('Размер кучи до работы ',MemAvail);
   writeln('  Будете вводить с клавиатуры (y/n)');
    readln(ch);

  if (ch='y') then
   begin
    for i:=1 to 2*n do
     begin
      write('Введите ',i,'-ый элемент  ');
      readln(x);
      if (i=1) then first(f,e,x)
             else nex(e,x);
     end;
   end
            else
   begin
    randomize;
    for i:=1 to 2*n do
     begin
      x:=random(30000)/666;
      if (i=1) then first(f,e,x)
             else nex(e,x);
     end;
   outspisok(f);
    end;
   writeln('Размер кучи после составления списка-',Memavail);
  end;

 PROCEDURE Fremem;
  var
   f:r;
 begin
  while (not (p^.snext=nil)) do
   begin
    f:=p^.snext;
    dispose(p);
    p:=f;
   end;
  dispose(p);
  writeln('Размер кучи после работы ',MemAvail)
 end;

 PROCEDURE Outanswer(f,e:r;var v:text);
  var
   s:real;
 begin
  s:=0;
  while not ((f=e) or (f^.snext=e)) do
   begin
    s:=s+f^.xw*e^.xw;
    f:=f^.snext;
    e:=e^.pnext;
   end;
  s:=s+f^.xw*e^.xw;
  writeln('  Значение выражения ',s:0:5);
  writeln(v,'  Значение выражения: ',s:0:5);
 end;

 PROCEDURE Outspisok;
  begin
   while not (f^.snext=nil) do
    begin
     writeln('  ',f^.xw:0:5);
     f:=f^.snext
    end;
   writeln('  ',f^.xw:0:5);
  end;

END.
