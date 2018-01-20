.model small
.stack 100h
.data
	mes1 db  13,10,'n=$'
    mes11 db 'mass:',13,10,'$'
	mes2 db  'Error in input!$'
	mes3 db 'Error in create file!$'
	unset db 13,10,'$'
	mas  dw  100 dup(?)
	n  dw 0
	i  dw 0
	j  dw 0
	path db 'c:\work\asm\zad\f481.txt'
	handle dw 0	
	TEN DW 10
.code
main:
	mov ax,@data
	mov ds,ax
	xor ax,ax
;----------------------------------------------	
	;Ввод n	
lea dx, mes1
mov ah,9h
int 21h
;в bx будет храниться число  
xor bx,bx
l1:
;ввод символа
   mov ah,01h
   int 21h
;проверяем была ли нажата клавиша 'enter'
   cmp al,0dh
   jne l2
;если да, то переходим на новую строку
   lea dx,unset
   mov ah,9h
   int 21h
;и выходим из ввода
   jmp m1
l2:
;проверяем был ли введён символ
   cmp al,39h
   jna l3
;если больше '9', то переходим на новую строку
   lea dx,unset
   mov ah,9h
   int 21h
;выводим ошибку
   lea dx,mes2
   mov ah,9h
   int 21h
;и завершаем работу
   jmp error1
l3:
;проверка на символ, продолжение
   cmp al,30h
   jnb l4
;если меньше '0', то переходим на новую строку
   lea dx,unset
   mov ah,9h
   int 21h
;выводим ошибку
   lea dx,mes2
   mov ah,9h
   int 21h
;и завершаем работу
   jmp error1
  l4:
;переводим символ в число
   sub al,30h
;поместим цифру в cx
   mov cl,al
;умножим результат на десять
   shl bx,1   ;bx=2*bx
   mov ax,bx  ;ax=2*bx
   shl ax,2   ;ax=8*bx
   add bx,ax  ;bx=10*bx
   add bx,cx  ;bx=10*bx+al
;и так пока вводятся цифры
   jmp l1
  m1:
;проверим натуральное ли это число
   cmp bx,0
   jne m2
;если это ноль, то выводим ошибку
   lea dx,mes2
   mov ah,9h
   int 21h
;и завершаем работу
   jmp error1
 m2:
;в n хранится введенное натуральное число
   mov n,bx
;--------------------------------------------
	mov cx,n
	mov si,0
go:
	mov ax,1
    mov dx,1
    mov cx,n
.l: add ax,dx
    xchg ax,dx 
	mov mas[si],dx
	inc si
    loop .l	
	
	mov cx,n
	sub cx,2
	mov si,0
	mov ah,09h
	lea dx,mes11
	int 21h
	
	mov ah,02h
	mov dx,'1'
	int 21h
	mov ah,02h
	mov dx,'1'
	int 21h
show:    
	mov ah,02h
	mov dx,mas[si]
	add dx,30h
	int 21h
	inc si
	loop show	
;-----------------Запись массива в файл ----------------
; создаем файл
	MOV   AH,  3Ch		;Создаем новый файл
   	MOV   CX,  0		;Атрибуты файла
   	MOV   DX,  offset path	;Путь к файлу
   	INT   21h	
	JC error2
	MOV handle, ax

;записываем
	MOV   AH,40h		  ;Записываем в файл
   	mov   BX,handle		  ;Идентификатор файла	
   	MOV   DX,offset mas   ;Адрес буфера с данными	
	MOV   CX,n 		
   	INT   21h		;Вызов функции 40h

; закрываем файл
	MOV AH, 3Eh	
	int 21h
;----------------------------------------------------------------
exit:
    mov ah,07h
	int 21h
	mov ax,4c00h
	int 21h	
;----------------------------------
;---------------------------------ВЫВОД ЦЕЛОГО ЧИСЛА
error1:
	jmp main
error2:
   lea dx,mes3
   mov ah,9h
   int 21h
   jmp main
;--------------------------------
end	main