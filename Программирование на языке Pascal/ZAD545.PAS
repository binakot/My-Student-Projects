uses unit545,crt;
var n,k:integer;
begin
repeat
clrscr;
write('������ ������⢮ ��  >1: ');
readln(n);
until n>1;
spisok(n);
repeat
write('����� �� ���� 祫���� �㤥� ��室��� �� ��㣠: ');
read(k);
until k<n;
writeln;
to_kill(k);
readkey;
end.







