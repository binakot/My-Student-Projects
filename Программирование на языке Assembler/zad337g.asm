model large
.stack 100h
.data

xnew dd ?
ynew dd ?
x dw ?
y dw ?
x1 dw 0
y1 dw 0
x2 dw 320
y2 dw 240
ten dw 10;
color db 2

five dw 5
unset db ' ','$'
fft dw 80
hnd dw 100
a320 dw 320
a240 dw 240
k2 dd ?
xd dd ?
yd dd ?

tmp dd ?
one_2 dd 1.0

i dw ?
n dw 40
n2 dd 40.0
h dd ?
a dd -1.0
b dd 3.0
one dd 1.0

unset2 db ' $'

k dw ?
zero dw 0
two dw 2

dty2 dd ?
dtx2 dd ?


.code
   .386
finit

jmp endproc
;получаем координаты x
GetX proc far

    fild x2   ;x2->st(0) в целом формате
    fild x1   ;x1->st(0) в целом формате
    fsub      ;x1-x2->st(0)

    fild y2
    fild y1
    fsub

    fdiv      ;st(0)/st(1)->st(0) 

    fild y
    fild y1
    fsub

    fmul
    fild x1
    fadd

 ret
GetX endp
;получаем координаты y
GetY proc far

    fild x2
    fild x1
    fsub

    fild y2
    fild y1
    fsub

    fdivr

    fild x
    fild x1
    fsub

    fmul
    fild y1
    fadd

 ret
GetY endp
;рисование точки
point proc far
    mov ah,0ch
    mov al,color
    mov cx,x
    mov dx,y
    int 10h
ret
point endp
;рисование линий координат
line proc far
    fild x2   ;x2->st(0)
    fild x1   ;x1->st(0)
    fsub      ;x1-x2->st(0)
    fabs      ;|x1-x2|->st(0)
    fistp x   ;x->st(0)

    fild y2
    fild y1
    fsub
    fabs
    fistp y

    mov cx,x
    cmp cx,y
    jge draw0

    mov cx,y
    mov ax,y1
    cmp ax,y2
    jl ydraw
    mov ax,y2
    jmp ydraw

 draw0:
    mov ax,x1
    cmp ax,x2
    jl xdraw
    mov ax,x2
;ось Х
 xdraw:
    push cx

    inc ax
    mov x,ax
    push ax

    call GetY
    fistp y

    call point

    pop ax
    pop cx
    loop xdraw

    jmp exitline
;ось У
 ydraw:
    push cx

    inc ax
    mov y,ax
    push ax

    call GetX
    fistp x

    call point

    pop ax
    pop cx
    loop ydraw

 exitline:
ret
line endp

;-------------------------------
PUBLIC OUTPUT_VL
OUTPUT_VL PROC NEAR

XOR BX,BX
		SHOW1:
   		XOR DX,DX
   		DIV TEN
   		PUSH DX
   		INC BX
   		CMP AX,0
   		JNE SHOW1
   		MOV AH,02H

 		SHOW2:
   		POP DX
   		ADD DL,30H
   		INT 21H
   		DEC BX
   		CMP BX,0H
   		JNE SHOW2

	RET
OUTPUT_VL ENDP


;ВЫВОД ВЕЩЕСТВЕННОГО ЧИСЛА
OUTFLOAT PROC   NEAR
MOV AX,TWO
MOV K,AX

        PUSH    AX
        PUSH    CX
        PUSH    DX
        PUSH    BP
        MOV     BP, SP
        PUSH    10
        PUSH    0
        FTST
        FSTSW   AX
        SAHF
        JNC     @OF1
        MOV     AH, 02H
        MOV     DL, '-'		
        INT     21H
	MOV AX,ZERO
	MOV K,AX

        FCHS	
@OF1:   FLD1                          
        FLD     ST(1)                  
        FPREM                        
        FSUB    ST(2), ST             
        FXCH    ST(2)                
	
        XOR     CX, CX
@OF2:   FIDIV   WORD PTR [BP - 2]      
        FXCH    ST(1)                 
        FLD     ST(1)                 
        FPREM                         
        FSUB    ST(2), ST              
        FIMUL   WORD PTR [BP - 2]      
        FISTP   WORD PTR [BP - 4]      
        INC     CX
        PUSH    WORD PTR [BP - 4]
        FXCH    ST(1)                  
        FTST
        FSTSW   AX
        SAHF
        JNZ     SHORT @OF2
        MOV     AH, 02H
@OF3:   POP     DX
        ADD     DL, 30H
        INT     21H
        LOOP    @OF3                   
        FSTP    ST(0)                  
        FXCH    ST(1)                  
        FTST
        FSTSW   AX
        SAHF
        JZ      SHORT @OF5
        MOV     AH, 02H
        MOV     DL, '.'
        INT     21H
        MOV     CX, 6
@OF4:   FIMUL   WORD PTR [BP - 2]    
        FXCH    ST(1)                 
        FLD     ST(1)                
        FPREM                         
        FSUB    ST(2), ST            
        FXCH    ST(2)                 
        FISTP   WORD PTR [BP - 4]     
        MOV     AH, 02H
        MOV     DL, [BP - 4]
        ADD     DL, 30H
        INT     21H
        FXCH    ST(1)               
        FTST
        FSTSW   AX
        SAHF
        LOOPNZ  @OF4                 
@OF5:   FSTP    ST(0)                
        FSTP    ST(0)                 
        LEAVE
        POP     DX
        POP     CX
        POP     AX
        RET
OUTFLOAT ENDP


endproc:

   mov ax,@data
   mov ds,ax


mov ax,12h
int 10h
;рисуем координатную плоскость
mov x1,0
mov x2,640
mov y1,240
mov y2,240
call line 

mov x1,320
mov x2,320
mov y1,0
mov y2,480
call line 

mov x1,320

mov y1,240

mov cx,10
@hrz:

mov k,cx
fild k
fisub five
fimul fft
fiadd a320
frndint
fistp x2
mov ax,x2
mov x1,ax

mov y1,230
mov y2,250

push cx
call line
pop cx
loop @hrz

mov ah,7h
int 21h
mov cx,4
@vert:

mov k,cx
fild k
fisub two
fimul hnd
frndint
fstp k2
fild a240
fsub k2
fistp k

mov x2,310
mov x1,330
mov ax,k
mov y1,ax
mov y2,ax

push cx
call line
pop cx
loop @vert

nex:

mov y1,140
mov y2,140

mov x1,310
mov x2,330

call line

mov cx,40
@draw:
	
mov ax,n
sub ax,cx
mov i,ax

fld b
fsub a 
fdiv n2
fstp h

fild i
fmul h
fadd a
fstp xd
fld xd

fld xd
fmul xd

fsub xd
fadd one
fstp tmp
fld tmp
fstp st(0)

fld1
fdiv tmp
fstp yd
fld yd
fstp st(0)

fld xd
fimul fft
frndint
fiadd a320
fistp x2
mov ax,x2
fstp st(0)


fld yd
fimul hnd
frndint
fstp yd
fild a240
fsub yd
fistp y2
mov ax,y2
fstp st(0)

cmp cx,40
je next

push cx
call line
pop cx

next:
mov ax,x2
mov x1,ax
mov ax,y2
mov y1,ax

dec cx
cmp cx,0
jne @draw

mov ah,1h
int 21h
mov ah,4ch
int 21h


end