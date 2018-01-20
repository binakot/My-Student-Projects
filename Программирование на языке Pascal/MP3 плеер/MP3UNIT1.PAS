unit mp3unit1;

INTERFACE

uses crt;

type
  TPlayer = object
    Work    : Boolean;    {Работает или нет}
    Memory  : integer;    {Объем памяти}
    CurSong : integer;    {Номер текущей песни}
    LastSong: integer;    {Номер последней песни}
    Songs   : array[1..4096] of integer;  {Массив мелодий}
    CurVol  : byte;       {Текущая громкость}
    CurEq   : string[10]; {Текущее состояние эквалайзера}
    Playing : boolean;    {Проигрывается мелодия или нет}

    procedure Create(mem1:integer);
    procedure On;
    procedure Off;
    procedure Play;
    procedure Pause;
    procedure Next;
    procedure Prev;
    procedure V;
    procedure M;
  end;

IMPLEMENTATION

    procedure TPlayer.Create(mem1:integer);
      var i:integer;
      begin
        memory:=mem1;
        for i:=1 to 10 do
          begin
            Songs[i]:=i*350;
          end;
        cursong:=1;
        lastsong:=10;
        curvol:=15;
        curEq:='Стандарт';
        work:=false;
        playing:=false;
      end;

    procedure TPlayer.On;
      begin
        work:=true;
      end;

    procedure TPlayer.Off;
      begin
        TPlayer.pause;
        playing:=false;
        cursong:=1;
        curvol:=15;
        cureq:='Стандарт';
        work:=false;
      end;

    procedure TPlayer.Play;
      begin
        sound(Songs[CurSong]);
        playing:=true;
      end;

    procedure TPlayer.Pause;
      begin
        nosound;
        playing:=false;
      end;

    procedure TPlayer.Next;
      begin
        if Playing=true then
          begin
            TPlayer.Pause;
            Playing:=true
          end;
        if CurSong<LastSong then Inc(CurSong);
        if playing=true then TPlayer.Play;
      end;

    procedure TPlayer.Prev;
      begin
        if Playing=true then
          begin
            TPlayer.Pause;
            Playing:=true
          end;
        if CurSong>1 then dec(CurSong);
        if playing=true then TPlayer.Play;
      end;

    procedure TPlayer.V;
      var c:char;
      begin
        repeat
          clrscr;
  writeln('     Регулятор громкости');
  writeln('\/ - 4               /\ - 6');
  writeln('         Выход - 2');
  gotoxy(5,15);
  textcolor(yellow);
  write('Текущая громкость:',curvol);
  textcolor(white);
          c:=readkey;
          if c='6' then if curvol<30 then inc(curvol);
          if c='4' then if curvol>0 then dec(curvol)
        until c='2';
      end;

    procedure TPlayer.M;
      var c:char; i,j:integer;
      begin
        TPlayer.Pause;
        clrscr;
        writeln('             Меню');
        writeln('Удалить - 4        Записать - 6');
        writeln('           Эквалайзер - 2');
        c:=readkey;
        case c of
          '4': begin
                 clrscr;
                 write('Введите номер мелодии, которую Вы хотите удалить:');
                 readln(j);
                 if (j<=lastsong)and(j>0) then
                   begin
                     for i:=j to LastSong-1 do
                       Songs[i]:=Songs[i+1];
                     dec(lastsong)
                   end
               end;
          '6': begin
                 clrscr;
                 writeln('Ваша мелодия будет ',LastSong+1);
                 write('Введите её частоту:');
                 readln(Songs[LastSong+1]);
                 inc(LastSong)
               end;
          '2': begin
                 clrscr;
                 writeln('    Настройки эквалайзера');
                 writeln('Джаз - 4            Басс - 6');
                 writeln('        Стандарт - 2');
                 c:=readkey;
                 case c of
                   '4': cureq:='Джаз';
                   '2': cureq:='Стандарт';
                   '6': cureq:='Басс'
                 end
               end
      end
    end;

  begin
  end.