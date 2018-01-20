uses unit545,crt;
var n,k:integer;
begin
repeat
clrscr;
write('Введите количество людей  >1: ');
readln(n);
until n>1;
spisok(n);
repeat
write('Какой по счету человек будет выходить из круга: ');
read(k);
until k<n;
writeln;
to_kill(k);
readkey;
end.







