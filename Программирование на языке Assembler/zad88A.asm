;unit88a

.model large
.data
  step dw 10
  ten dw 10
  zero dw 0
  three dw 3
  tmp dw 0


extrn n:word, a:word;
.code

public calc

calc proc far

     mov ax,zero    ;0->ax
     mov a,ax       ;0->a

     mov ax,n       ;n->ax
     cwd            ;��������� ������� ax
     mul n          ;n^2->ax

    chp:
       div step     ;ax/10->ax
       cmp dx,three ;dx=3?
       je addone    ;���� ��, �� ������
    cont:           
        xor dx,dx   ;�������� dx

        cmp ax,zero ;ax=0?
        jne chp     ;���� �� ��� �����, �� ������
        jmp finish  ;���� ������ ��� �����, �� ���������

      addone:
        inc a       ;a+1->a
        jmp cont    ;������� �� ��������

       finish:

     ret
calc endp
     end