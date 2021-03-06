unit mp3unit1;

INTERFACE

uses crt;

type
  TPlayer = object
    Work    : Boolean;    {����⠥� ��� ���}
    Memory  : integer;    {��ꥬ �����}
    CurSong : integer;    {����� ⥪�饩 ��᭨}
    LastSong: integer;    {����� ��᫥���� ��᭨}
    Songs   : array[1..4096] of integer;  {���ᨢ �������}
    CurVol  : byte;       {������ �஬�����}
    CurEq   : string[10]; {����饥 ���ﭨ� ����������}
    Playing : boolean;    {�ந��뢠���� ������� ��� ���}

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
        curEq:='�⠭����';
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
        cureq:='�⠭����';
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
  writeln('     ������� �஬����');
  writeln('\/ - 4               /\ - 6');
  writeln('         ��室 - 2');
  gotoxy(5,15);
  textcolor(yellow);
  write('������ �஬�����:',curvol);
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
        writeln('             ����');
        writeln('������� - 4        ������� - 6');
        writeln('           ���������� - 2');
        c:=readkey;
        case c of
          '4': begin
                 clrscr;
                 write('������ ����� �������, ������ �� ��� 㤠����:');
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
                 writeln('��� ������� �㤥� ',LastSong+1);
                 write('������ �� �����:');
                 readln(Songs[LastSong+1]);
                 inc(LastSong)
               end;
          '2': begin
                 clrscr;
                 writeln('    ����ன�� ����������');
                 writeln('���� - 4            ���� - 6');
                 writeln('        �⠭���� - 2');
                 c:=readkey;
                 case c of
                   '4': cureq:='����';
                   '2': cureq:='�⠭����';
                   '6': cureq:='����'
                 end
               end
      end
    end;

  begin
  end.