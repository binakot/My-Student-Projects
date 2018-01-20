 PROGRAM zad136b;

 uses crt,unit136;
 VAR
  n:word;
  ch:char;
  t:text;
  pn:pspisk;
  pr:real;

 BEGIN
  repeat
   clrscr;
 Ysl;
   clrscr;
    writeln('Исходный размер кучи-',memavail);
 FileLink(t);
   mark(heaporg);
 Sostpos(pn,n);
 Obrpos(pn,n,pr);
 VivodPosvfl(t,pn,n,pr);
   release(heaporg);
  writeln('Размер кучи после работы-',memavail);
  writeln('Хотите продолжить?[y-да/n-нет]');
    readln(ch);
  until (ch='n') or (ch='N');
   close(t);
 END.