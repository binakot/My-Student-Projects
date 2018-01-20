.model large
.stack 100h
.data


mes1 db 'n=$'
mes2 db 'x=$'
unset db 13,10,'$'
unset2 db '  $'
mes3 db 'element [$'
mes4 db ']  $'

mas dd 100 dup(?)

x dd ?
n dw ?
two dw 2
four dw 4
ten dw 10
underzero dw 0
eqzero dw 0
done dd 1.0
myword dd ?
one dw 1
zero dw 0
tmpcx dw ?

srarifm dd 100.0
raznitsa dd ?

x1 dd ?
x2 dd ?
tmpx1 dd ?
tmpx2 dd ?
dtwo dd 2.0

.code

.386
finit

jmp endproc


;--------------------------------------------
;���� ������ �����
public input_n
input_n proc near

xor ax,ax  ;�������� ax
xor bx,bx  ;�������� bx

read:
;���� n
	mov ah,1
	int 21h
;�������� ������>9
	cmp al,39h
	ja error
;�������� ������<0
	cmp al,29h
	jna error

	push ax      ;ax � ����
	mov ax,bx    ;bx->ax
	mul ten      ;ax*10->ax
	mov bx,ax    ;ax->bx
	pop ax       ;������� ax �� �����

	cmp ax,0h    ;ax=0?
	je read      ;��������� �����
	sub al,30h   ;�������� � ASCII �������
	cbw
	add ax,bx    ;ax+bx->ax
	mov bx,ax    ;ax->bx
	jmp read     ;��������� �����

error:
; �������� ������� enter
	cmp al,0dh   ;al=13?
	jne read     ;���� ���, �� ������ ������  

	lea dx,unset ;[unset]->dx
	mov ah,9h
	int 21h

	ret
input_n endp
;----------------------------------------------
;����� ������ �����
public output_vl
output_vl proc near

xor bx,bx   ;�������� bx

		Show1:
   		xor dx,dx   ;�������� dx
   		div ten     ;ax/10->ax
   		push dx     ;dx � ����
   		inc bx      ;bx+1->bx
   		cmp ax,0    ;ax=0?
   		jne show1   ;���� ���, �� ����������
   		mov ah,02h

 		Show2:
   		pop dx      ;dx �� �����
   		add dl,30h  ;�������� � ASCII �������
   		int 21h
   		dec bx      ;bx-1->bx
   		cmp bx,0h   ;bx=0?
   		jne show2   ;���� ���, �� ����������

	ret
output_vl endp
;-----------------------------------------------------
;���� ������������� �����
public infloat
infloat proc    near
        push    ax          ;ax � ����
        push    dx          ;dx � ����
        push    si          ;si � ����
        push    bp          ;bp � ����
        mov     bp, sp      ;sp->bp
        push    10          ;10 � ����
        push    0           ;0 � ����
        xor     si, si      ;�������� si
        fldz                ;0->st(0)
        mov     ah, 01h
        int     21h
        cmp     al, '-'     ;al='-'?
        jne     short @if1  ;���� ���, �� ������� @if1
        inc     si          ;si+1->si
@if0:   mov     ah, 01h
        int     21h
@if1:   cmp     al, '.'     ;al='.'?
        je      short @if2  ;���� ��, �� ������� @if2
        cmp     al, 39h     ;al=9?
        ja      short @if5  ;���� ������, �� @if5
        sub     al, 30h     ;al=0?
        jb      short @if5  ;���� ������, �� @if5
        mov     [bp - 4], al          ;al->[bp-4]
        fimul   word ptr [bp - 2]
        fiadd   word ptr [bp - 4]
        jmp     short @if0            ;���������� ��������� �����
@if2:   fld1                          ;1->st(0)
@if3:   mov     ah, 01h
        int     21h
        cmp     al, 39h            ;al=9?
        ja      short @if4         ;���� ������, �� @if4
        sub     al, 30h            ;al=0?
        jb      short @if4         ;���� ������, �� @if4
        mov     [bp - 4], al       ;al->[bp-4]
        fidiv   word ptr [bp - 2] 
        fld     st(0)
        fimul   word ptr [bp - 4]
        faddp   st(2), st
        jmp     short @if3         ;������� @if3
@if4:   fstp    st(0)              ;��������� � st(0)
@if5:   mov     ah, 02h
        mov     dl, 0Dh            ;13->dl
        int     21h
        mov     dl, 0Ah            ;10->dl
        int     21h
        test    si, si             ;si&si?
        jz      short @if6         ;���� 0, �� @if6
        fchs                       ;�������� ���� �����
@if6:   leave
        pop     si                 ;������� �� ����� si
        pop     dx                 ;������� �� ����� dx
        pop     ax                 ;������� �� ����� ax
        ret
infloat endp
;-------------------------------------------------------------
;����� ������������� �����
outfloat proc   near
        push    ax            ;ax � ����
        push    cx            ;cx � ����
        push    dx            ;dx � ����
        push    bp            ;bp � ����
        mov     bp, sp        ;sp->bp
        push    10            ;10 � ����
        push    0             ;0 � ����
        ftst                  ;���������� � �����
        fstsw   ax            ;�� ������������ � ���������
        sahf
        jnc     @of           ;������� @of
        mov     ah, 02h       ;2->ah
        mov     dl, '-'       ;'-'->dl
		push ax               ;ax � ����
		mov ax,underzero      ;unz->ax
		add ax,1              ;ax+1->ax
		mov underzero,ax      ;ax->unz
		pop ax                ;������� ax �� �����
        int     21h
        fchs                  ;������ ���� �����
	@of:
	jnz @of1                  ;���� �� ����, �� @of1
		push ax               ;ax � ����
		mov ax,eqzero         ;ez->ax
		add ax,1              ;ax+1->ax
		mov eqzero,ax         ;ax->ez
		pop ax                ;����������� ax �� �����
@of1:   fld1                           ;1->st(0)
        fld     st(1)                  ;st(1)->st(0)
        fprem                          ;st(0) div st(1) -> st(0)
        fsub    st(2), st              ;st(2)+st(0)->st(0)
        fxch    st(2)                  ;st(0)<->st(2)
        xor     cx, cx                 ;�������� cx
@of2:   fidiv   word ptr [bp - 2]      ;������������ ����� ->st(0)
        fxch    st(1)                  ;st(1)<->st(0)
        fld     st(1)                  ;st(1)->st(0)
        fprem                          ;���������� ���������� �������
        fsub    st(2), st              ;st(2)-st(0)->st(0)
        fimul   word ptr [bp - 2]      ;�������� st(0) �� �����
        fistp   word ptr [bp - 4]      ;����� ������
        inc     cx                     ;cx+1->cx
        push    word ptr [bp - 4]      ;��������� � ����
        fxch    st(1)                  ;st(1)<->st(0)
        ftst                           ;st(0)=0?
        fstsw   ax                     ;st(0)->ax
        sahf
        jnz     short @of2             ;���� �� 0, �� @of2
        mov     ah, 02h
@of3:   pop     dx                     ;����������� dx
        add     dl, 30h                ;�������� � ASCII
        int     21h
        loop    @of3                   ;���������� ����
        fstp    st(0)                  ;��������� -> st(0)
        fxch    st(1)                  ;st(0)<->st(1)
        ftst                           ;st(0)=0?
        fstsw   ax                     ;st(0)->ax
        sahf
        jz      short @of5             ;���� 0, �� @of5
        mov     ah, 02h
        mov     dl, '.'  
        int     21h
        mov     cx, 6                 ;6->cx
@of4:   fimul   word ptr [bp - 2]      ;
        fxch    st(1)                  ; 
        fld     st(1)                  ; 
        fprem                          ; 
        fsub    st(2), st              ;
        fxch    st(2)                  ; 
        fistp   word ptr [bp - 4]      ; 
        mov     ah, 02h
        mov     dl, [bp - 4]
        add     dl, 30h
        int     21h
        fxch    st(1)                  ; 
        ftst
        fstsw   ax
        sahf
        loopnz  @of4                   ;
@of5:   fstp    st(0)                  ; 
        fstp    st(0)                  ;
        leave
        pop     dx
        pop     cx
        pop     ax
        ret
outfloat endp
;------------------------------------------------

endproc:

mov ax,@data
mov ds,ax
;������� ����������� �� ���� n
lea dx,mes1
mov ah,9h
int 21h
;��������� ����� ����� n
call input_n
mov n,bx
mov cx,n
;����������� �� ���� ����� x
lea dx,mes2
mov ah,9h
int 21h
;�������� ������������ ����� � 
call infloat
fstp x

inpmass:
;����������� �� ���� n ��������� �������	
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
;�������� ��������
	fstp mas[bx]	
loop inpmass

mov cx,n    ;n->cx
xor ax,ax
xor bx,bx
outmass:
	mov ax,n   ;n->ax
	sub ax,cx  ;n-cx->ax
	mul four   ;ax*4->ax
	mov bx,ax  ;ax->bx
	
	fld mas[bx] ;������� ������� � ����
	fstp tmpx1	;�� ������� ����� � tmpx1

cmp cx,one;cx=1?
je @gonext; ���� ��, �� ��������� �����

mov tmpcx,cx
dec cx
	outmass2:
  
		mov ax,n
		sub ax,cx
		mul four
		mov bx,ax
		
		fld mas[bx]
		fstp tmpx2
			
		fld tmpx1
		fadd tmpx2
		fdiv dtwo
		fsub x		
		fabs ;|(tmpx1+tmpx2)/2-x|->st(0)			
		fstp raznitsa ;st(0)->razn
		mov eax,raznitsa
		CMP eax,srarifm	;���������� � ������� ���������	
		jnl @gonext2
			mov srarifm,eax
			fld tmpx1
			fstp x1
			fld tmpx2
			fstp x2	

		@gonext2:

	loop outmass2

mov cx,tmpcx	
@gonext:
dec cx
cmp cx,0
jne outmass

;������� 2 ��������� �����
lea dx,unset
mov ah,9h
int 21h
	
	fld x1
	call outfloat

lea dx,unset
mov ah,9h
int 21h
	
	fld x2
	call outfloat


mov ah,8h
int 21h
mov ah,4ch
	int 21h
end
