program Zad137b;
uses crt,unit137;
var
    first: Ptr;
    t: text;
    k: integer;
    ch:char;
 begin
   clrscr;
    Us137(output);
    FileLink(t);
    Us137(t);
   readln;
  repeat;
    clrscr;
   BuildList(t,first);
   k:=1;
   Posl(t,first,k);
   DelList(first);
  writeln('Хотите продолжить?[y-да/n-нет]');
  readln(ch);
   Until (ch='n') or (ch='N');
  close(t);
 end.
