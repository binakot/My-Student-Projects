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
  write('Хотите приобрести MP3-плеер? y/n ');readln(c);
  if c='n' then halt
  else
    begin
      writeln('Введите характеристики:');
      write('Объем памяти(<=4 Гб):');readln(mem);mem:=1024*mem;
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
  writeln; writeln('Включить/Выключить (enter)');

  textcolor(yellow);
  gotoxy(5,11);
  write('Использовано памяти: ',PPlayer^.lastsong,'/',PPlayer^.memory,' мб');
  gotoxy(5,12);
  write('Одна мелодия = 1 мб');
  gotoxy(5,13);
  if PPlayer^.work=true then writeln('Работает') else writeln('Не работает');
  gotoxy(5,16);
  if PPlayer^.work=true then
    begin
      if PPlayer^.playing=true then
        begin
          writeln('Мелодия проигрывается');
          gotoxy(5,17);
          writeln('Номер мелодии:',PPlayer^.CurSong,' Частота:',PPlayer^.songs[PPlayer^.cursong])
        end
      else
        begin
          writeln('Мелодия на паузе');
          gotoxy(5,17);
          writeln('Номер мелодии:',PPlayer^.CurSong,' Частота:',PPlayer^.songs[PPlayer^.cursong])
        end;
      gotoxy(5,18);
      writeln('Громкость:',PPlayer^.CurVol);
      gotoxy(5,19);
      writeln('Эквалайзер:',PPlayer^.CurEq);
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