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
  writeln(' ������ n ');
   readln(n);
  dospisok(f,n);
  outspisok(f);
writeln('������ ��� ��᫥ ᮧ����� ᯨ᪠: ',memavail);
  checkup(f);
  outspisok(f);
  fremem(f);
  writeln(' ���� �த������? [y-��/n-���]');
   readln(ch);
  until (ch='n') or (ch='N');
 end.