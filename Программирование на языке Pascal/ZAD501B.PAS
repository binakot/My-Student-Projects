program zad501b;
uses crt;
type
output=record
      sname:string [15];
      name:string [15];
      ot:string [15];
end;
input=record
         sname:string [15];
         name:string [2];
         ot:string [2];
end;

var f,g:text;
    a:array[1..5] of output; b:array[1..5] of input; i,k:integer;
    c:char;
begin
 clrscr;
 assign(f,'C:\fio1.txt');
 reset(f);
 i:=1; k:=0;
 while not(eof(f)) do
  begin
   read(f,c);
   if c='_' then begin k:=k+1; continue; end;
   if k=3 then begin k:=0; inc(i); end;
   if k=0 then a[i].sname:=a[i].sname+c;
   if k=1 then a[i].name:=a[i].name+c;
   if k=2 then a[i].ot:=a[i].ot+c;
  end;
 assign(g,'C:\fio2.txt');
 rewrite(g);
 for i:=1 to 5 do
  begin
   b[i].name:=a[i].name[1]+'.';
   b[i].ot:=a[i].ot[1]+'.';
  end;
  for i:=1 to 5 do
   begin
    writeln(g,a[i].sname,' ',b[i].name,b[i].ot,',');
   end;
   close(f);
   close(g);
end.