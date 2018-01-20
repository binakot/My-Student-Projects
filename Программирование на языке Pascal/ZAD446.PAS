program z446;
var n, m, f, k:integer;
    w:boolean;
function s(n:integer):boolean;
var i:integer; p:boolean;
begin
  p:=true;
  i:=3;
  while (i<=trunc(sqrt(n))) and p do
   if n mod i=0 then p:=false
   else i:=i+2;
   if p then s:=true else s:=false;
  end;
 begin
  write('n=');
  readln(n);
  write('Числа-близнецы ');
   if n mod 2=0 then f:=n+1
   else f:=n;
  m:=f;
   while m<2*n do begin
    if s(m) then begin
    if w then begin
    write(m-2,' и ',m,' ');
    k:=k+1
   end;
  w:=true end
  else w:=false;
  m:=m+2 end;
  if k=0 then writeln('в данном диапазоне отсутствуют');
  readln;
 end.