uses crt,mp3noun;

label l1;

var mem : integer;
    c   : char;

begin
  clrscr;
  textcolor(white);
  write('���� �ਮ���� MP3-�����? y/n ');readln(c);
  if c='n' then halt
  else
    begin
      writeln('������ �ࠪ���⨪�:');
      write('��ꥬ �����(<=4 ��):');readln(mem);mem:=1024*mem;
      Create(mem);
      clrscr
    end;
l1:
  clrscr;
  writeln('           M  - 8');
  writeln('< - 4     >|| - 5   > - 6');
  writeln('           V  - 2');
  writeln; writeln('�������/�몫���� (enter)');
  textcolor(yellow);
  gotoxy(5,11);
  write('�ᯮ�짮���� �����: ',lastsong,'/',memory,' ��');
  gotoxy(5,12);
  write('���� ������� = 1 ��');
  gotoxy(5,13);
  if work=true then writeln('����⠥�') else writeln('�� ࠡ�⠥�');
  gotoxy(5,16);
  if work=true then
    begin
      if playing=true then
        begin
          writeln('������� �ந��뢠����');
          gotoxy(5,17);
          writeln('����� �������:',CurSong,' �����:',songs[cursong])
        end
      else
        begin
          writeln('������� �� ��㧥');
          gotoxy(5,17);
          writeln('����� �������:',CurSong,' �����:',songs[cursong])
        end;
      gotoxy(5,18);
      writeln('�஬�����:',CurVol);
      gotoxy(5,19);
      writeln('����������:',CurEq);
    end;
  textcolor(white);
  c:=readkey;
  if c=#27 then
    begin
      clrscr;
      nosound;
      halt
    end;
  if work=false then
    if c<>#13 then goto l1;
  case c of
    '2': V;
    '4': Prev;
    '5': if playing=false then Play else Pause;
    '6': Next;
    '8': M;
    #13: if work=true then Off else On
  end;
  goto l1
  end.