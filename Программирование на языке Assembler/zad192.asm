.model large
.stack 100h
.data

mes1 db 'n=$'
mes2 db 'Error!$'
mes3 db 'element [$'
unset db 13,10,'$'
unset2 db '  $'
mes4 db ']  $'
out1 db ' <0: $'
out2 db ' =0: $'

mas dd 100 dup(?)

x dd ?
n dw ?
two dw 2
four dw 4
ten dw 10
underzero dw 0
eqzero dw 0
one dd 1.0
myword dd ?

.code

.386
finit  ;инициализируем сопроцессор

jmp endproc
;--------------------------------------------
;ввод целого числа
public input_n
input_n proc near

xor ax,ax  ;обнуляем ax
xor bx,bx  ;обнуляем bx

read:
;ввод n
	mov ah,1
	int 21h
;проверка символ>9
	cmp al,39h
	ja error
;проверка символ<0
	cmp al,29h
	jna error

	push ax      ;ax в стек
	mov ax,bx    ;bx->ax
	mul ten      ;ax*10->ax
	mov bx,ax    ;ax->bx
	pop ax       ;достаем ax из стека

	cmp ax,0h    ;ax=0?
	je read      ;считываем далее
	sub al,30h   ;приводим к ASCII символу
	cbw
	add ax,bx    ;ax+bx->ax
	mov bx,ax    ;ax->bx
	jmp read     ;считываем далее

error:
; проверка нажатия enter
	cmp al,0dh   ;al=13?
	jne read     ;если нет, то читаем дальше  

	lea dx,unset ;[unset]->dx
	mov ah,9h
	int 21h

	ret
input_n endp
;----------------------------------------------
;вывод целого числа
public output_vl
output_vl proc near

xor bx,bx   ;обнуляем bx

		Show1:
   		xor dx,dx   ;обнуляем dx
   		div ten     ;ax/10->ax
   		push dx     ;dx в стек
   		inc bx      ;bx+1->bx
   		cmp ax,0    ;ax=0?
   		jne show1   ;если нет, то продолжаем
   		mov ah,02h

 		Show2:
   		pop dx      ;dx из стека
   		add dl,30h  ;приводим к ASCII символу
   		int 21h
   		dec bx      ;bx-1->bx
   		cmp bx,0h   ;bx=0?
   		jne show2   ;если нет, то продолжаем

	ret
output_vl endp
;-----------------------------------------------------
;ввод вещественного числа
public infloat
infloat proc    near
        push    ax          ;ax в стек
        push    dx          ;dx в стек
        push    si          ;si в стек
        push    bp          ;bp в стек
        mov     bp, sp      ;sp->bp
        push    10          ;10 в стек
        push    0           ;0 в стек
        xor     si, si      ;обнуляем si
        fldz                ;0->st(0)
        mov     ah, 01h
        int     21h
        cmp     al, '-'     ;al='-'?
        jne     short @if1  ;если нет, то прыгаем @if1
        inc     si          ;si+1->si
@if0:   mov     ah, 01h
        int     21h
@if1:   cmp     al, '.'     ;al='.'?
        je      short @if2  ;если да, то прыгаем @if2
        cmp     al, 39h     ;al=9?
        ja      short @if5  ;если больше, то @if5
        sub     al, 30h     ;al=0?
        jb      short @if5  ;если меньше, то @if5
        mov     [bp - 4], al          ;al->[bp-4]
        fimul   word ptr [bp - 2]
        fiadd   word ptr [bp - 4]
        jmp     short @if0            ;продолжаем считывать числа
@if2:   fld1                          ;1->st(0)
@if3:   mov     ah, 01h
        int     21h
        cmp     al, 39h            ;al=9?
        ja      short @if4         ;если больше, то @if4
        sub     al, 30h            ;al=0?
        jb      short @if4         ;если меньше, то @if4
        mov     [bp - 4], al       ;al->[bp-4]
        fidiv   word ptr [bp - 2] 
        fld     st(0)
        fimul   word ptr [bp - 4]
        faddp   st(2), st
        jmp     short @if3         ;прыгаем @if3
@if4:   fstp    st(0)              ;результат в st(0)
@if5:   mov     ah, 02h
        mov     dl, 0Dh            ;13->dl
        int     21h
        mov     dl, 0Ah            ;10->dl
        int     21h
        test    si, si             ;si&si?
        jz      short @if6         ;если 0, то @if6
        fchs                       ;изменяем знак числа
@if6:   leave
        pop     si                 ;достаем из стека si
        pop     dx                 ;достаем из стека dx
        pop     ax                 ;достаем из стека ax
        ret
infloat endp
;-------------------------------------------------------------
;вывод вещественного числа
outfloat proc   near
        push    ax            ;ax в стек
        push    cx            ;cx в стек
        push    dx            ;dx в стек
        push    bp            ;bp в стек
        mov     bp, sp        ;sp->bp
        push    10            ;10 в стек
        push    0             ;0 в стек
        ftst                  ;сравниваем с нулем
        fstsw   ax            ;из сопроцессора в процессор
        sahf
        jnc     @of           ;прыгаем @of
        mov     ah, 02h       ;2->ah
        mov     dl, '-'       ;'-'->dl
		push ax               ;ax в стек
		mov ax,underzero      ;unz->ax
		add ax,1              ;ax+1->ax
		mov underzero,ax      ;ax->unz
		pop ax                ;вытащим ax из стека
        int     21h
        fchs                  ;меняем знак числа
	@of:
	jnz @of1                  ;если не ноль, то @of1
		push ax               ;ax в стек
		mov ax,eqzero         ;ez->ax
		add ax,1              ;ax+1->ax
		mov eqzero,ax         ;ax->ez
		pop ax                ;вытаскиваем ax из стека
@of1:   fld1                           ;1->st(0)
        fld     st(1)                  ;st(1)->st(0)
        fprem                          ;st(0) div st(1) -> st(0)
        fsub    st(2), st              ;st(2)+st(0)->st(0)
        fxch    st(2)                  ;st(0)<->st(2)
        xor     cx, cx                 ;обнуляем cx
@of2:   fidiv   word ptr [bp - 2]      ;целочисленно делим ->st(0)
        fxch    st(1)                  ;st(1)<->st(0)
        fld     st(1)                  ;st(1)->st(0)
        fprem                          ;вычисление частичного остатка
        fsub    st(2), st              ;st(2)-st(0)->st(0)
        fimul   word ptr [bp - 2]      ;умножаем st(0) на адрес
        fistp   word ptr [bp - 4]      ;целый формат
        inc     cx                     ;cx+1->cx
        push    word ptr [bp - 4]      ;вставляем в стек
        fxch    st(1)                  ;st(1)<->st(0)
        ftst                           ;st(0)=0?
        fstsw   ax                     ;st(0)->ax
        sahf
        jnz     short @of2             ;если не 0, то @of2
        mov     ah, 02h
@of3:   pop     dx                     ;вытаскиваем dx
        add     dl, 30h                ;приводим к ASCII
        int     21h
        loop    @of3                   ;продолжаем цикл
        fstp    st(0)                  ;результат -> st(0)
        fxch    st(1)                  ;st(0)<->st(1)
        ftst                           ;st(0)=0?
        fstsw   ax                     ;st(0)->ax
        sahf
        jz      short @of5             ;если 0, то @of5
        mov     ah, 02h
        mov     dl, '.'  
        int     21h
        mov     cx, 6                 ;6->cx
@of4:   fimul   word ptr [bp - 2]      ;
        fxch    st(1)                  ; st(0)<->st(1)
        fld     st(1)                  ; st(1)->st(0)
        fprem                          ; вычисляем частичный остаток
        fsub    st(2), st              ; st(2)-st(0)->st(0)
        fxch    st(2)                  ; st(2)<->st(0)
        fistp   word ptr [bp - 4]      ; 
        mov     ah, 02h
        mov     dl, [bp - 4]
        add     dl, 30h
        int     21h
        fxch    st(1)                  ;st(1)<->st(0)
        ftst                           ;сравниваем с нулем
        fstsw   ax                     ;из сопроца в проц
        sahf
        loopnz  @of4                   ;
@of5:   fstp    st(0)                  ;результат в st(0)	 
        fstp    st(0)                  ;еще раз
        leave
        pop     dx                     ;достаем регистры
        pop     cx
        pop     ax
        ret
outfloat endp
;------------------------------------------------

endproc:
;считываем кол-во элементов
	mov ax,@data
	mov ds,ax
	call input_n
	mov n,bx
	mov cx,n

inpmass:
;считываем n элементов массива	
	lea dx,mes3
	mov ah,9h
	int 21h

	mov ax,n
	sub ax,cx
	push bx
	xor bx,bx	
	call output_vl
	pop bx

	lea dx,mes4
	mov ah,9h
	int 21h	
	call infloat

	mov ax,n
	sub ax,cx
	mul four
	mov bx,ax

	fstp mas[bx]
	
loop inpmass

;надо вывести n элеменотов
mov cx,n
xor ax,ax
xor bx,bx
outmass:
	mov ax,n
	sub ax,cx
	mul four
	mov bx,ax

	mov eax,dword ptr [mas[bx]]
	mov myword,eax
	fld myword
	call outfloat	
	
lea dx,unset2
mov ah,9h
	int 21h

loop outmass
xor bx,bx

lea dx,unset
mov ah,9h
	int 21h

lea dx,out1
mov ah,9h
int 21h

;выводим сколько <0
xor bx,bx
mov ax,underzero
	call output_vl

lea dx,unset
mov ah,9h
	int 21h

lea dx,out2
mov ah,9h
int 21h

;выводим сколько =0
xor bx,bx
mov ax,eqzero
	call output_vl

mov ah,8h
int 21h
mov ah,4ch
	int 21h
end
