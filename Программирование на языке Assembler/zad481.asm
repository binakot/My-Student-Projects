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
	;���� n	
lea dx, mes1
mov ah,9h
int 21h
;� bx ����� ��������� �����  
xor bx,bx
l1:
;���� �������
   mov ah,01h
   int 21h
;��������� ���� �� ������ ������� 'enter'
   cmp al,0dh
   jne l2
;���� ��, �� ��������� �� ����� ������
   lea dx,unset
   mov ah,9h
   int 21h
;� ������� �� �����
   jmp m1
l2:
;��������� ��� �� ����� ������
   cmp al,39h
   jna l3
;���� ������ '9', �� ��������� �� ����� ������
   lea dx,unset
   mov ah,9h
   int 21h
;������� ������
   lea dx,mes2
   mov ah,9h
   int 21h
;� ��������� ������
   jmp error1
l3:
;�������� �� ������, �����������
   cmp al,30h
   jnb l4
;���� ������ '0', �� ��������� �� ����� ������
   lea dx,unset
   mov ah,9h
   int 21h
;������� ������
   lea dx,mes2
   mov ah,9h
   int 21h
;� ��������� ������
   jmp error1
  l4:
;��������� ������ � �����
   sub al,30h
;�������� ����� � cx
   mov cl,al
;������� ��������� �� ������
   shl bx,1   ;bx=2*bx
   mov ax,bx  ;ax=2*bx
   shl ax,2   ;ax=8*bx
   add bx,ax  ;bx=10*bx
   add bx,cx  ;bx=10*bx+al
;� ��� ���� �������� �����
   jmp l1
  m1:
;�������� ����������� �� ��� �����
   cmp bx,0
   jne m2
;���� ��� ����, �� ������� ������
   lea dx,mes2
   mov ah,9h
   int 21h
;� ��������� ������
   jmp error1
 m2:
;� n �������� ��������� ����������� �����
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
;-----------------������ ������� � ���� ----------------
; ������� ����
	MOV   AH,  3Ch		;������� ����� ����
   	MOV   CX,  0		;�������� �����
   	MOV   DX,  offset path	;���� � �����
   	INT   21h	
	JC error2
	MOV handle, ax

;����������
	MOV   AH,40h		  ;���������� � ����
   	mov   BX,handle		  ;������������� �����	
   	MOV   DX,offset mas   ;����� ������ � �������	
	MOV   CX,n 		
   	INT   21h		;����� ������� 40h

; ��������� ����
	MOV AH, 3Eh	
	int 21h
;----------------------------------------------------------------
exit:
    mov ah,07h
	int 21h
	mov ax,4c00h
	int 21h	
;----------------------------------
;---------------------------------����� ������ �����
error1:
	jmp main
error2:
   lea dx,mes3
   mov ah,9h
   int 21h
   jmp main
;--------------------------------
end	main