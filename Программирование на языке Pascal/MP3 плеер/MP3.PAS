uses mp3unit1,crt;
label l1;
type
  Mplayer=^TPlayer;
var
  PPlayer:Mplayer;
  mem:integer;
  c:char;
begin
  clrscr;
  textcolor(white);
  write('���� �ਮ���� MP3-�����? y/n ');readln(c);
  if c='n' then halt
  else
    begin
      writeln('������ �ࠪ���⨪�:');
      write('��ꥬ �����(<=4 ��):');readln(mem);mem:=1024*mem;
      new(PPlayer);
      PPlayer^.Create(mem);
      readkey;
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
  write('�ᯮ�짮���� �����: ',PPlayer^.lastsong,'/',PPlayer^.memory,' ��');
  gotoxy(5,12);
  write('���� ������� = 1 ��');
  gotoxy(5,13);
  if PPlayer^.work=true then writeln('����⠥�') else writeln('�� ࠡ�⠥�');
  gotoxy(5,16);
  if PPlayer^.work=true then
    begin
      if PPlayer^.playing=true then
        begin
          writeln('������� �ந��뢠����');
          gotoxy(5,17);
          writeln('����� �������:',PPlayer^.CurSong,' �����:',PPlayer^.songs[PPlayer^.cursong])
        end
      else
        begin
          writeln('������� �� ��㧥');
          gotoxy(5,17);
          writeln('����� �������:',PPlayer^.CurSong,' �����:',PPlayer^.songs[PPlayer^.cursong])
        end;
      gotoxy(5,18);
      writeln('�஬�����:',PPlayer^.CurVol);
      gotoxy(5,19);
      writeln('����������:',PPlayer^.CurEq);
    end;
  textcolor(white);

  c:=readkey;
  if c=#27 then
    begin
      clrscr;
      nosound;
      dispose(PPlayer);
      halt
    end;
  if PPlayer^.work=false then
    if c<>#13 then goto l1;
  case c of
    '2': PPlayer^.V;
    '4': PPlayer^.Prev;
    '5': if PPlayer^.playing=false then PPlayer^.Play else PPlayer^.Pause;
    '6': PPlayer^.Next;
    '8': PPlayer^.M;
    #13: if PPlayer^.work=true then PPlayer^.Off else PPlayer^.On;
  end;
  goto l1;
  end.