unit unit534;
INTERFACE
 TYPE
   r = ^mtype;
   mtype = record
       xw   : real;
       snext : r;
       pnext : r;
       end;
   {���-� ��뢠��� txt ��६����� � 䠩���}
 PROCEDURE FileLink(var v:text);
   {���-� �뢮�� �᫮��� �����}
 PROCEDURE Ysl(var v:text);
   {���-� ᮧ����� ��ࢮ�� ������� ᯨ᪠}
 PROCEDURE First(var p,e:r; x:real);
   {���-� ᮧ����� ��᫥����� ������⮢ ᯨ᪠}
 PROCEDURE Nex(var e:r; x:real);
   {���-� ����஥��� ᯨ᪠}
 PROCEDURE Dospisok( var f,e:r; n:integer );
   {���-� 㤠����� ᯨ᪠}
 PROCEDURE Fremem(var p:r);
   {�p��-� �뢮�� �⢥�}
 PROCEDURE Outanswer(f,e:r;var v:text);
   {}
 PROCEDURE Outspisok(f:r);

IMPLEMENTATION


 PROCEDURE FileLink(var v:text);
  begin
 assign(v,'vad.txt');
 rewrite(v);
  end;

 PROCEDURE Ysl(var v:text);
  begin
   writeln('  ���� ����ࠫ쭮� �᫮ n � ����⢨⥫�� �᫠ a(1),..,a(n)  ');
   writeln('            �������  a(1)*a(2n)+...+a(n)*a(n+1)                ');
   writeln(v,'  ���� ����ࠫ쭮� �᫮ n � ����⢨⥫�� �᫠ a(1),..,a(n)  ');
   writeln(v,'            �������  a(1)*a(2n)+...+a(n)*a(n+1)                ');
  end;

 PROCEDURE First;
  var
   s:r;
  begin
   new(s);
   s^.xw:=x;
   s^.snext:=nil;
   s^.pnext:=nil;
   e:=s;
   p:=s;
  end;

 PROCEDURE Nex;
  var
   s:r;
  begin
   new(s);
   s^.xw:=x;
   s^.snext:=nil;
   e^.snext:=s;
   s^.pnext:=e;
   e:=s;
  end;

 PROCEDURE Dospisok;
  var
   i:integer;
   x:real;
   ch:char;
  begin
   writeln('������ ��� �� ࠡ��� ',MemAvail);
   writeln('  �㤥� ������� � ���������� (y/n)');
    readln(ch);

  if (ch='y') then
   begin
    for i:=1 to 2*n do
     begin
      write('������ ',i,'-� �������  ');
      readln(x);
      if (i=1) then first(f,e,x)
             else nex(e,x);
     end;
   end
            else
   begin
    randomize;
    for i:=1 to 2*n do
     begin
      x:=random(30000)/666;
      if (i=1) then first(f,e,x)
             else nex(e,x);
     end;
   outspisok(f);
    end;
   writeln('������ ��� ��᫥ ��⠢����� ᯨ᪠-',Memavail);
  end;

 PROCEDURE Fremem;
  var
   f:r;
 begin
  while (not (p^.snext=nil)) do
   begin
    f:=p^.snext;
    dispose(p);
    p:=f;
   end;
  dispose(p);
  writeln('������ ��� ��᫥ ࠡ��� ',MemAvail)
 end;

 PROCEDURE Outanswer(f,e:r;var v:text);
  var
   s:real;
 begin
  s:=0;
  while not ((f=e) or (f^.snext=e)) do
   begin
    s:=s+f^.xw*e^.xw;
    f:=f^.snext;
    e:=e^.pnext;
   end;
  s:=s+f^.xw*e^.xw;
  writeln('  ���祭�� ��ࠦ���� ',s:0:5);
  writeln(v,'  ���祭�� ��ࠦ����: ',s:0:5);
 end;

 PROCEDURE Outspisok;
  begin
   while not (f^.snext=nil) do
    begin
     writeln('  ',f^.xw:0:5);
     f:=f^.snext
    end;
   writeln('  ',f^.xw:0:5);
  end;

END.
