 Unit unit137;

INTERFACE

  Uses crt;
    type
     Ptr = ^table;
     table = record
        x: real;
        number: integer;
        next: Ptr;
     end;

    {Процедура связывания txt переменной с файлом}
   Procedure FileLink(var t:text);
   {условие задачи №137б}
   Procedure Us137(var t:text);
  {Процедура добавления записи,на которую ссылается указатель a,
               первой в связанный список f }
   Procedure AddFirst(a:Ptr;var f:Ptr);
  {Добавление в список first после элемента,на который ссылается
                     указатель old}
   Procedure AddAfter(a:Ptr;var old:Ptr);
   {Процедура ручногосоздания списка}
   Procedure HandMake(var t:text;var f:Ptr);
   {Процедура автоматического создания списка}
   Procedure AutoMake(var t:text;var f:Ptr);
  {Процедура создания списка,имя его-передаваемый параметр}
   Procedure BuildList(var t:text;var f:Ptr);
  {Удаление первой записи из списка и присваивание указателя на
                   него в переменную а}
   Procedure DelFirst(var a,f:Ptr);
     {Удаление из списка элемента,стоящего после элемента
      old,и присваивание указателя на него в переменную а}
   Procedure DelAfter(old:Ptr; var a:Ptr);
  {Удаление динамических переменных из списка с заданным именем }
   Procedure DelList(var f:Ptr);
     {Функция ищет в списке запись,поле number которой
      совпадает с параметром n.Возвращает указатель на
       найденную запись или nil,если запись не найдена.}
   Function FindNumber(n:integer;var f: Ptr) : Ptr;
     {Функция ищет в списке запись,поле X которой совпадает с параметром X.
         Возвращает указатель на найденную запись или nil,
                  если запись не найдена.}
   Function FindX(x:real;var f: Ptr) : Ptr;
           {Процедура получение последовательности  }
   Procedure Posl(var t:text;f:Ptr;n:integer);

IMPLEMENTATION

 {проц-ра связывания txt переменной с файлом}
 PROCEDURE FileLink(var t:text);
  begin
   assign(t,'vad.txt');
   rewrite(t);
  end;

 {проц-ра вывода условия задачи}
  PROCEDURE Us137(var t:text);
    begin
     write(t,'':4,'Даны натуральное число n,действительные числа ');
     writeln(t,'A[1],...,A[n].');
     writeln(t,'':2,'Вычислить A[1]∙A[1], A[1]∙A[2],..., A[1]∙A[n]');
    end;

 {проц-ра добавления записи,на которую ссылается указатель А,
                первой в связанный список f }
  PROCEDURE AddFirst(a:Ptr;var f:Ptr);
   begin
    a^.next:=f;
    f:=a
   end;
   { Добавление в список first после элемента,на который ссылается
                          указатель old}
  PROCEDURE AddAfter(a:Ptr;var old:Ptr);
   begin
    a^.next:=old^.next;
    old^.next:=a
   end;

   {проц-ра ручногосоздания списка}
  PROCEDURE HandMake(var t:text;var f:ptr);
    var
     i:Integer;        {счетчик элементов}
     p,d:Ptr;        {p-указатель на текущий элемент в котором первоначально
                         хранится информация
                       d-указатель для связывания соседних элементов}
     y:Real;
     Ch:Char;
   Begin
    f:=NIL;
    i:=0;
    Write('':5,'Чтобы закончить запись строк в файл, ');
    WriteLn('нажмите клавишу ESC!');
    WriteLn('Введите элементы последовательности: ');
     Repeat
      Inc(i);
      write('a[',i,']= ');
      ReadLn(y);
      p := New(Ptr);
      p^.x := y;
      p^.number := i;
      if (i mod 5)=0 then writeln(t);
      writeln(t,'a[',p^.number:2,']= ',p^.x:3:2);
       if i = 1 then
        begin
         AddFirst(p,f);
         d := f
        end
       else
        begin
         AddAfter(p,d);
         d :=p;
        end;
     Ch:=ReadKey;
    Until Ch=#27;
  End;

 {проц-ра автоматического создания списка}
 PROCEDURE AutoMake(var t:text;var f:Ptr);
  var
   n,i:Integer;        {число элементов последовательности}
   p,d:Ptr;          {p-указатель на текущий элемент в котором первоначально
                         хранится информация}
  Begin
    Write('Введите количество элементов последовательности: ');
    ReadLn(n);
    f:=NIL;
    For i:=1 to n do
     Begin
       p:=New(Ptr);
       p^.x:=Random(50);
       p^.number := i;
       if (i mod 4)=0 then
        begin
         writeln;
         writeln(t);
        end;
        Write('  a[',p^.number:2,'] = ',p^.x:3:2);
        writeln(t,'a[',p^.number:2,']= ',p^.x:3:2);
       If i=1 then
        Begin
         AddFirst(p,f);
         d:=f
        End
       else
        Begin
         AddAfter(p,d);
         d:=p
        End;
     End;
  End;

 {проц-ра создания списка
  b-создаваемый список}
 PROCEDURE BuildList(var t:text;var f:Ptr);
  var
    Ch:Char;          {символьная переменная выбора}
  Begin
    Write('Размер памяти до создания динамических переменных: ',memavail);
    Writeln;
    Write('Вы хотите ввести вручную элементы последовательности? (Y-да/N-нет) ');
    ReadLn(Ch);
    writeln(t,'Даны действительные числа: ');
    If UpCase(Ch)='Y' then HandMake(t,f)
    else AutoMake(t,f);
    writeln;
  End;

   { Удаление первой записи из списка и присваивание указателя на
                   него в переменную а}
  PROCEDURE DelFirst(var a,f:Ptr);
           begin
            a:=f;{f указывает на первый элемент}
            f:=f^.next;{поле next содержит указатель на второй элемент списка}
           end;

       { Удаление из списка элемента,стоящего после элемента
         old,и присваивание указателя на него в переменную а}

  PROCEDURE DelAfter(old:Ptr; var a:Ptr);
           begin
            a:=old^.next;
            old^.next:=old^.next^.next
           end;

     { Удаление динамических переменных из списка с заданным именем }
  PROCEDURE DelList(var f:Ptr);
          var
           d: Ptr;
          begin
          writeln('Размер памяти до удаления переменных: ',memavail);
           while f <> nil do
            begin
             DelFirst(d,f);
             Dispose(d);
            end;
            writeln('Удаляются динамические переменные...   ');
            writeln('Размер памяти равен: ',memavail);
          end;

         {Функция ищет в списке запись,поле number которой
          совпадает с параметром n.Возвращает указатель на
          найденную запись или nil,если запись не найдена.}

  FUNCTION FindNumber(n:integer;var f: Ptr) : Ptr;
           var
            tp : Ptr;
           begin
            tp:=f; { tp указывает на первый элемент списка}
            while tp <> nil do
             if tp^.number = n then
               begin
                FindNumber := tp;
                exit
               end
               else
                tp := tp^.next;
            FindNumber := nil
           end;

         { Функция ищет в списке запись,поле X которой
          совпадает с параметром X.Возвращает указатель на
          найденную запись или nil,если запись не найдена.}

  FUNCTION FindX(x:real;var f: Ptr) : Ptr;
           var
            tp : Ptr;
           begin
            tp:=f; { tp указывает на первый элемент списка}
            while tp <> nil do
             if tp^.x = x then
               begin
                FindX:= tp;
                exit
               end
               else
                tp := tp^.next;
            FindX := nil
           end;

           {Процедура получение последовательности}
  PROCEDURE Posl(var t:text;f:Ptr;n:integer);
          var
           p,d: Ptr;
           y: real;
          begin
           d := f;
           p:=f;
           writeln('Результат: ');
           writeln(t,'Результат: ');
           while p <> nil do
            begin
                y := d^.x * p^.x;
                write('A[',d^.number:2,'] * A[',p^.number:2,']= ');
                writeln(d^.x:1:2,' * ',p^.x:1:2,'= ',y:2:2);
                writeln(t,'X[',d^.number:2,']*[X',p^.number:2,']=',y:2:2);
             p := p^.next;
            end;
           end;
  End.    
