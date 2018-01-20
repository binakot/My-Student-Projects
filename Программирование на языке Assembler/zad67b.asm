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
		inc i        ;����������� ������� �� 1		
		mov di,0     ;������ ��������� ����� 0

	input:           ;��������� �����

		mov ah,08h
		int 21h

		cmp al,13    ;������ inter?
		je done      ;���� ��, �� ���� ��������
		cmp al,'9'   ;���� ����� ������ 9, �� ����������
		ja input
		cmp al,'0'   ;���� ����� ������ 0, �� ����������
		jb input

		mov ah,02h   ;��������� �����, ������� �����
		mov dl,al    ;�������� ������, ������� �����, �� al -> dl
		int 21h

		sub al,'0'   
		xor ah,ah    ;�������� ah
		mov cx,ax    ;ax->cx
		mov ax,di    ;� ax ����� ���������
		mov bx,10    ;��������� �� = 10
		mul bx       ;�������� ����� �� ��������� ��
		add ax,cx    ;��������� ��������� ����� � ��������� �����
		mov di,ax    ;� ������ ��������� ����� ������ �����
		jmp input    ;��������� � ��������� ����� �����
	
	done:
	  
	    mov dh,10
		mov ah,06h
		int 21h
	
		mov n,di     ;���������� ����� � ���������� 
		
    action:			 ;���������� ����������
	
	    mov ax,n        ;� ax ��������� �����
		mov bx,1100100b ;� bx 100
		cmp ax,bx       ;������� n<=100 ?
		ja get          ;���� ���, �� ������ ������ �����		
		
		mov bl,10		
		
	oper:		    
	
			mov ax,n      ;�������� ����� � ax
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
		mov al,res      ;������� ���������
	
	exit:        	 ;����� ����������� ����������
	
	xor cx,cx        ;�������� cx
	mov si,10        ;� ������ ��������� ������� 10
l:
	xor dx,dx        ;�������� dx
	div si           ;����� �� 10
	add dx,30h       ;��������� 30
	push dx          ;�������� dx � ����
	inc cx           ;��������� � cx 1
	or ax,ax         
	jnz l            ;���� ��� �� ��� �����, ��������� c�������� �����

w:	
	dec cx           ;��������� cx �� 1
	pop dx           ;��������� dx �� �����
	mov ah,06h
    int 21h
	cmp cx,0         ;���� ������ �� ��� �����, �� ������� ���� �����
	jne w
	
	no_more:
	
		mov ax,4c00h
		int 21h

main endp
code ends
end
