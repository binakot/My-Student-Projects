.model large
.stack 100h
.data

 mes1 db 'n=$'
 mes2 db 'Error$'
 mes3 db 'element [$'
 mes4 db ']  $'
 unset db 13,10,'$'

 mas dw 100 dup(?)
	i dw 0
	zero dw 0
	hnd dw 1000h
	delitel dw 100h
	six dw 5

 ten dw 10
 ten2 dd 10
 one dw 1
 two dw 2

 n dw ?

.code
finit
.386

;вывод строки mes1
	mov ax,@data
	mov ds,ax
	lea dx,mes1
	mov ah,9h
	int 21h

xor ax,ax     ;обнуляем ax
xor bx,bx     ;обнуляем bx

read:
;ввод n
	mov ah,1
	int 21h
;проверка символ>9
	cmp al,39h
	jnl error
;проверка символ<0
	cmp al,29h
	jna error

	push ax
	mov ax,bx
	mul ten
	mov bx,ax
	pop ax

	cmp ax,0h
	je read
	sub al,30h
	cbw
	add ax,bx
	mov bx,ax
	jmp read
;завершение ввода n

;вычисление элементов массива
next:
	lea dx,unset    ;переходим на следующую строку
	mov ah,9h
	int 21h


	mov ax,bx       ;bx->ax
	mul two         ;ax*2->ax
	mov n,ax        ;n->ax
	xor bx,bx       ;обнуляем bx
	xor ax,ax       ;обнуляем ax

repeat:
	inc bx          ;bx+1->bx
	inc bx          ;bx+1->bx
	mov ax,one      ;1->ax
	mov cx,one      ;1->cx

;факториал
	factorial:
	mul cx	        ;ax*cx->ax
	push ax         ;ax в стек
	mov ax,bx       ;bx->ax
	div two         ;ax/2->ax
	cmp cx,ax       ;ax=cx?
	je endfact      ;если да, то в конец
	inc cx          ;cx+1->cx
	pop ax          ;вытаскивыаем ax
	jmp factorial   ;продолжаем считать
endfact:
	pop ax	        ;вытаскиваем ax
	mov mas[bx],ax  ;ax->mas

	cmp bx,n        ;bx=n?
	jne repeat      ;если не конец массива, то повторяем
;конец заполнения элементов списка

xor ax,ax
xor dx,dx
xor bx,bx

;вывод элементов массива
output:
	inc bx    ;bx+1->bx
	inc bx    ;bx+1->bx
	lea dx,mes3  ;выводим сообщение для вывода элементов
	mov ah,9h
	int 21h

	xor dx,dx
	mov ax,bx
	div two
	mov dx,ax
	add dl,30h    ;выводим номер элемента
	mov ah,6
	int 21h

	lea dx,mes4   ;завершаем вывод элемента
	mov ah,9h
	int 21h
;разбиение на символы
    xor ax,ax
	mov ax,mas[bx]	 ;обнуляем элементы массива

    push bx          ;запоминаем текущий номер элемента
    xor bx,bx        ;обнуляем индекс
;считываем все эелементы
 Show1:
    xor dx,dx
    div ten
    push dx
    inc bx
    cmp ax,0
    jne show1
    mov ah,02h
;и выводим их
 Show2:
    pop dx
    add dl,30h
    int 21h
    dec bx
    cmp bx,0h
    jne show2

	lea dx,unset
	mov ah,9h
	int 21h	
    pop bx

	cmp bx,n
	jne output
    jmp endprog

error:
;обработка ошибок
	cmp al,0dh
	je next	

	lea dx,unset
	mov ah,9h
	int 21h

	xor ax,ax
	xor dx,dx

	lea dx,mes2
	mov ah,9h
	int 21h

	xor ax,ax
	xor dx,dx

 	mov ah,8h
  	int 21h

endprog:
	xor ax,ax
	xor dx,dx

 	mov ah,8h
  	int 21h
	mov ah,4ch
	int 21h
end