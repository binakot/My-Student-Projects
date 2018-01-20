uses crt,mp3noun;

label l1;

var mem : integer;
    c   : char;

begin
  clrscr;
  textcolor(white);
  write('Хотите приобрести MP3-плеер? y/n ');readln(c);
  if c='n' then halt
  else
    begin
      writeln('Введите характеристики:');
      write('Объем памяти(<=4 Гб):');readln(mem);mem:=1024*mem;
      Create(mem);
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
  write('Использовано памяти: ',lastsong,'/',memory,' мб');
  gotoxy(5,12);
  write('Одна мелодия = 1 мб');
  gotoxy(5,13);
  if work=true then writeln('Работает') else writeln('Не работает');
  gotoxy(5,16);
  if work=true then
    begin
      if playing=true then
        begin
          writeln('Мелодия проигрывается');
          gotoxy(5,17);
          writeln('Номер мелодии:',CurSong,' Частота:',songs[cursong])
        end
      else
        begin
          writeln('Мелодия на паузе');
          gotoxy(5,17);
          writeln('Номер мелодии:',CurSong,' Частота:',songs[cursong])
        end;
      gotoxy(5,18);
      writeln('Громкость:',CurVol);
      gotoxy(5,19);
      writeln('Эквалайзер:',CurEq);
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