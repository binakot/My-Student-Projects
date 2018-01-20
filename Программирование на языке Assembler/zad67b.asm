.model small
data segment
  ;buffer label byte
  ;l db 30
  ;detl db ?
  ;field db 30 dup (?)    
	i db 0
	n dw 0
	res db 0
	
data ends

.stk segment stack
        db 256 dup (0)
.stk ends

code segment para public "code"
.386
assume cs:code, ds:data

main	proc
	mov ax,data
	mov ds,ax
	
get:
		inc i        ;увеличиваем счетчик на 1		
		mov di,0     ;индекс приемника равен 0

	input:           ;процедура ввода

		mov ah,08h
		int 21h

		cmp al,13    ;нажали inter?
		je done      ;если да, то ввод завершен
		cmp al,'9'   ;если число больше 9, то пропускаем
		ja input
		cmp al,'0'   ;если число меньше 0, то пропускаем
		jb input

		mov ah,02h   ;отобразим число, которое ввели
		mov dl,al    ;помещаем символ, который ввели, из al -> dl
		int 21h

		sub al,'0'   
		xor ah,ah    ;обнуляем ah
		mov cx,ax    ;ax->cx
		mov ax,di    ;в ax адрес приемника
		mov bx,10    ;основание СС = 10
		mul bx       ;умножаем число на основание СС
		add ax,cx    ;добавляем введенную цифру к вводимому числу
		mov di,ax    ;в адресе приемника адрес нашего числа
		jmp input    ;переходим к следующей цифре числа
	
	done:
	  
	    mov dh,10
		mov ah,06h
		int 21h
	
		mov n,di     ;записываем число в переменную 
		
    action:			 ;Вычисление результата
	
	    mov ax,n        ;в ax введенное число
		mov bx,1100100b ;в bx 100
		cmp ax,bx       ;сравним n<=100 ?
		ja get          ;если нет, то вводим другое число		
		
		mov bl,10		
		
	oper:		    
	
			mov ax,n      ;помещаем число в ax
			cmp ax,0
			je goon
			idiv bl        ;n mod 10 -> ah ; n div 10 -> al			
			add res,ah     ;res:=res+ah			
			xor dx,dx
			mov dl,al
			mov n,dx
			call oper
			
	goon:
	
		xor ax,ax
		mov al,res      ;выводим результат
	
	exit:        	 ;вывод полученного результата
	
	xor cx,cx        ;обнуляем cx
	mov si,10        ;в индекс источника запишем 10
l:
	xor dx,dx        ;обнуляем dx
	div si           ;делим на 10
	add dx,30h       ;добавляем 30
	push dx          ;помещаем dx в стек
	inc cx           ;добавляем к cx 1
	or ax,ax         
	jnz l            ;если еще не все число, считываем cледующую цифру

w:	
	dec cx           ;уменьшаем cx на 1
	pop dx           ;извлекаем dx из стека
	mov ah,06h
    int 21h
	cmp cx,0         ;если вывели не все число, то выводим след цифру
	jne w
	
	no_more:
	
		mov ax,4c00h
		int 21h

main endp
code ends
end
