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

 writeln(' ������ n ');
  readln(n);
 writeln(t,' ����� n= ',n);
  Dospisok(f,e,n);
  Outanswer(f,e,t);
  Fremem(f);
 writeln(' ���� �த������?[y-��/n-���]');
  readln(ch);
 until (ch='n') or (ch='N');
  close(t);
 end.