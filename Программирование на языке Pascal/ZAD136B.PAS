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
    writeln('��室�� ࠧ��� ���-',memavail);
 FileLink(t);
   mark(heaporg);
 Sostpos(pn,n);
 Obrpos(pn,n,pr);
 VivodPosvfl(t,pn,n,pr);
   release(heaporg);
  writeln('������ ��� ��᫥ ࠡ���-',memavail);
  writeln('���� �த������?[y-��/n-���]');
    readln(ch);
  until (ch='n') or (ch='N');
   close(t);
 END.