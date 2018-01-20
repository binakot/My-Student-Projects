program zad509b;
uses crt;
 type
  mnf=record
  m,f:string[15];
  n:string[6];
  end;

  sym=file of mnf;

var
z:char;
q:sym;
nn,ss,tt,data:mnf;
i,x,y,n:integer;
str:string;
b:boolean;

procedure avto(var nn:mnf; var f1:sym; c:integer);
 var i:integer;
  begin
   reset(f1);
   for i:=1 to c do
    begin
    read(f1,nn);
     writeln(nn.m);
     writeln(nn.n);
     writeln(nn.f);
  end;
end;

begin
 repeat
 clrscr;
 assign(q,'c:\avto.txt');
 reset(q);
 avto(data,q,5);

 y:=0;
 seek(q,0);

 while not eof(q) do
 begin
 b:=true;
 read(q,nn);
 x:=filepos(q);
 str:=nn.m;
 seek(q,0);
 for i:=1 to x-1 do
 begin
 read(q,tt);
 if str=tt.m then begin b:=false; break; end;
 end;

 if b then
 begin
 while not (eof(q)) do
 begin
 read(q,ss);
 if ss.m=str then inc(y);
 end;
 if filesize(q)=1 then    writeln(str,'-',1) else
 writeln(str,'-',y);
 y:=0;
 seek(q,x);

 end;
  seek(q,x);

 end;

 close(q);
 writeln;
 writeln('Нажмите Esc для выхода, любую другую клавишу для повтора');
 z:=readkey;
 until z=#27;
end.