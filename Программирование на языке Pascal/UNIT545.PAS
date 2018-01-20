unit unit545;
interface

     procedure spisok(kol_human:integer);
     procedure to_kill(n:integer);

implementation
 type sp=^rec;
      rec=record
       number:integer;
       next:sp;
       pred:sp;
      end;

 var          x:sp;
              first:sp;
              last:sp;
           address:sp;


 procedure spisok(kol_human:integer);
  var i:integer;
  begin
   address:=nil;
   for i:=1 to kol_human do
   begin
    new(x);
    x^.pred:=address;
    address:=x;
    if i=1 then
     first:=x;
    if i=kol_human then begin
     x^.next:=first;
     last:=x;
    end;
    if i>1 then
    begin
     x:=x^.pred;
     x^.next:=address;
     x:=x^.next;
    end;
    x^.number:=i;
   end;
  end;


 procedure to_kill(n:integer);
   var i,k:integer;
           trup:sp;
   begin
    x:=first;
    repeat
     write(' ',x^.number);
     x:=x^.next;
    until x=first;
    writeln;
    writeln;
    repeat
     k:=1;
     repeat
      if k=n then
      begin
       if x=first then
        begin
        trup:=first;
        first:=trup^.next;
        x:=first;
        x^.pred:=nil;
        x:=last;
        x^.next:=first;
        x:=first;
         end
         else
        if x=last then
        begin
         trup:=last;
         x:=trup^.pred;
         x^.next:=first;
         last:=x;
         x:=first;
        end
        else
        begin
         trup:=x;
         x:=trup^.pred;
         x^.next:=trup^.next;
         x:=x^.next;
         x^.pred:=trup^.pred;
        end;
       dispose(trup);
       break;
      end;
      k:=k+1;
      x:=x^.next;
     until false;
     trup:=first;
     repeat
      write(' ',trup^.number);
      trup:=trup^.next;
     until trup=first;
     writeln;
    until x^.next=x;
    writeln;
    writeln;
    write('Номер последнего человека: ',x^.number);
   end;

begin
end.











