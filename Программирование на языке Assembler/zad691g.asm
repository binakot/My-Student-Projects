.model large
.stack 100h
.data
 mes1 db 'n=$'
 unset db 13,10,'$'
 unset2 db '       $'

ten dw 10
n dw ?
n2 dw ?
eight dw 8
two dw 2
one dw 1
zero dw 0
sixteen dw 16
a128 dw 128
a14 dw 14
a112 dw 112
k dw ?

mas dw 8 dup(8 dup(?))

.code

.386
jmp endproc

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
;------------------------------------------------
;������� �� ������� �����
 strup proc near
	push ax
	mov ax,bx
	sub ax,sixteen
	mov bx,ax
	inc si
	inc si
pop ax
ret
strup endp

;������� �� ������� ����
strdown proc near
	push ax
	mov ax,bx
	add ax,sixteen
	mov bx,ax
	pop ax
	dec si
	dec si
		
ret
strdown endp

endproc:

mov ax,@data
mov ds,ax
;���������� � ����������� �������
lea dx,mes1
mov ah,09h
int 21h
;��������� n
call input_n
;��������� ����� � ����������� ���������� �������
mov n,bx
mov ax,bx
mul two
sub ax,two
mov a14,ax
mov ax,bx
mul sixteen
sub ax,sixteen
mov a112,ax
mov n2,bx
mov ax,n2
mul two
mov n2,ax
mov ax,n
mul n
mov cx,ax
mov n,cx
xor bx,bx
xor si,si
;� ���������� �������� ����������� ���-�� ���-�� ��� ������
mov cx,n

out1:

	push bx         ;��������� bx
	call input_n    ;�������� �������
	mov ax,bx
	pop bx          ;���������� bx
	mov mas[bx][si],ax	 ;������� � �������
	cmp cx,n             ;cx=n?
	
	jne next             ;���� ���, �� ��������� ����� �� ������
		inc si
		inc si
		mov ax,two
		mov k,ax
	jmp next2            ;���� ��, �� ������� �� ��������� ������
	next:	
		mov ax,k
		CMP ax,TWO
		jne  up
		
		  cmp bx,a112			
			je right

		  cmp si,zero
			je down
					
		  call strdown				
			
		  	jmp next2
			down:           ;���������� ����
				cmp si,a14
				jne next6
				mov ax,two
				mov k,ax
				mov ax,bx
				add ax,sixteen
				mov bx,ax
			jmp next2
				next6:
				mov ax,one
				mov k,ax
				mov ax,bx
				add ax,sixteen
				mov bx,ax
			jmp next2
 
		up:                   ;����������� �����
			cmp bx,zero
				je right
			cmp si,a14
				je down

			call strup
		jmp next2	
			right:            ;�������� ������
			cmp bx,a112
			jne next5		
				mov ax,one
				mov k,ax
				inc si
				inc si
				mov ax,two
				mov dx,one
				mov two,dx
				mov one,ax
				mov ax,one
				mov k,ax
				jmp next2
			next5:
				mov ax,two
				mov k,ax
				inc si
				inc si
			jmp next2
next2:

dec cx
cmp cx,zero
jne out1

xor bx,bx
xor si,si
mov cx,n
@out2:
	mov ax,mas[bx][si]
	push bx
	call output_vl
	pop bx
	cmp si,a14
		jne next3
		mov ax,bx
		add ax,sixteen
		mov bx,ax
		xor si,si

		lea dx,unset
		mov ah,9h
		int 21h
		
		jmp next4		

next3:
inc si
inc si
		lea dx,unset2
		mov ah,9h
		int 21h

next4:

loop @out2

rep1:
mov ah,7h
int 21h
cmp al,1bh
jne rep1

mov ah,4ch
int 21h

end