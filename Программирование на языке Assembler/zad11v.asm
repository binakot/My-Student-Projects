;unit11v

.MODEL large
.data
  e dd 2.718281828459045
  tmp1 dd 0.0
  tmp2 dd 0.0 
  two dd 2.0
  four dd 4.0
  exp dd 0.0

extrn  x:dword, y:dword, z:dword, a:dword, b:dword;

 .code
  public act
act proc far
    finit    ;инициализируем сопроцессор
    .386     ;проц 80386
;a=...
;x^2+4=tmp1
      fld x   ;x->st(0)
      fmul x  ;x^2->st(0)
      fadd four  ;x^2+4->st(0)
      fstp tmp1  ;x^2+4->tmp1 в вещественном формате

;x+y/tmp1=tmp2
     fld y    ;y->st(0)
     fld tmp1 ;tmp1->st(0), y->st(1)
     fdiv     ;y/tmp1->st(0)
     fadd x   ;x+y/tmp1->st(0)
     fstp tmp2;x+y/tmp1->tmp2

;(1+y)*tmp2
       fld1      ;1->st(0)
       fadd y    ;1+y->st(0)
       fmul tmp2 ;(1+y)*tmp2->st(0)
       fstp tmp2 ;st(0)->tmp2

;e^(-X-2)=exp
     fldz              ;0->st(0)
     fsub x            ;0-x->st(0)
     fsub two          ;0-x-2->st(0)
     fld e             ;e->st(0), -x-2->st(1)
     fyl2x			   ;y*log2(x)->st(0) 
     fld st(0)         ;st(0) в вещественном формате
     frndint           ;Округление до целого
     fsubr st(0),st(1) ;st(0)-st(1), st(0)<->st(1)
     f2xm1             ;2x-1
     fld1              ;1->st(0)
     faddp             ;st(0)+2x-1->st(0)
     fscale            ;маштабирование в степень 2
     fxch st(1)        ;st(1)<->st(0)
     fstp st           ;результат->st
     fstp exp          ;st->exp

;exp+1/tmp1
     fld1         ;1->st(0)
     fdiv tmp1    ;1/tmp1->st(0)
     fadd exp     ;exp+1/tmp1->st(0)
     fstp tmp1    ;st(0)->tmp1

;tmp2/tmp1
  fld tmp2   ;tmp2->st(0)
  fdiv tmp1  ;tmp2/tmp1->st(0)
  fstp a     ;st(0)->a

;b=...
;1+cos(y-z)=tmp1
  fld1      ;1->st(0)
  fld y     ;y->st(0), 1->st(1)
  fsub z    ;y-z->st(0)
  fcos      ;cos(y-z)->st(0)
  fadd      ;st(0)+st(1)->st(0)
  fstp tmp1 ;st(0)->tmp1

;sin^2(z)=tmp2
   fld z      ;z->st(0)
   fsin       ;sin(z)->st(1)
   fld st(0)  ;sin(z)->st(0)
   fmul       ;sin^2(z)->st(0)
   fstp tmp2  ;st(0)->tmp2

;x^4/2+tmp2=tmp2
    fld x     ;x->st(0)
    fmul x    ;x^2->st(0)
    fld st(0) ;st(0)
    fmul      ;x^4->st(0)
    fdiv two  ;st(0)/2->st(0)
    fadd tmp2 ;x^4/2+tmp2->st(0)
    fstp tmp2 ;st(0)->tmp2

;tmp1/tmp2
  fld tmp1  ;tmp1->st(0)
  fdiv tmp2 ;tmp1/tmp2->st(0)
  fstp b    ;st(0)->b

    ret
act endp
    end
