program zad489b;
uses crt;
var f,g:file of integer;
a:array[1..40] of integer;
i,k:integer;
begin
clrscr;
 assign(f,'c:\f.txt');
 reset(f);
 assign(g,'c:\g.txt');
 rewrite(g);
  while not EOF(f) do
  begin
    For i:= 1 to 40 do
     begin
      Read(f,a[i]);
     end;
    for i:= 1 to 40 do
     begin
      case i of
        1..10,31..40: k:=i;
        21..30: k:=i-10;
        11..20: k:=i+10;
     end;
      write(g,a[k]);
     end;
    end;
  close(f);
  close(g);
end.