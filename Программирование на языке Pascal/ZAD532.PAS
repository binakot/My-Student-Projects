  program z532;
  uses crt,unit532;
  var
   f:r;
   n:integer;
   ch:char;
 begin
  repeat
  clrscr;
   ysl;
  writeln(' Введите n ');
   readln(n);
  dospisok(f,n);
  outspisok(f);
writeln('Размер кучи после создания списка: ',memavail);
  checkup(f);
  outspisok(f);
  fremem(f);
  writeln(' Хотите продолжить? [y-да/n-нет]');
   readln(ch);
  until (ch='n') or (ch='N');
 end.