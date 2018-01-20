program zad519a;
uses
  crt;
var
  c:char;
  k1,k2:integer;
  f:text;
begin
  clrscr;
  assign(f,'c:\proga.pas');
  reset(f);
  while not(eof(f)) do
    begin
      read(f,c);
      if c='('
      then
	inc(k1)
      else
	if c=')'
	then
	  inc(k2);
      if c=#13
      then
        if k1<>k2
        then
          begin
            writeln('Нехватает  скобки');
            readkey;
	    halt
          end;
    end;
close(f);
writeln('Все соответствует');
readkey;
end.