 program p534b;
 uses crt,unit534;
  var
   f,e:r;
   n:integer;
   ch:char;
   t:text;
 begin
  repeat
  clrscr;
  FileLink(t);
  Ysl(t);

 writeln(' Введите n ');
  readln(n);
 writeln(t,' Ввели n= ',n);
  Dospisok(f,e,n);
  Outanswer(f,e,t);
  Fremem(f);
 writeln(' Хотите продолжить?[y-да/n-нет]');
  readln(ch);
 until (ch='n') or (ch='N');
  close(t);
 end.