;MOD11B

.MODEL small
.data
  a dd 0.0
  b dd 0.0
  c dd 0.0
  p dd 0.0
  s dd ?
  s1 dd ?
  s2 dd ?
  s3 dd ?

  r dd ?
  twodd dd 2.0
  tmp1 dd ?
  tmp2 dd ?
  tmp3 dd ?
  tmpx dd ?
  tmpy dd ?
  zero dw 0
  zr dd 0

  one    dw 1
  two    dw 2
  three  dw 3

extrn  x1:dword, x2:dword, x3:dword, y1:dword, y2:dword, y3:dword, mn:dword;
 .code

  public calc

calc   proc   far
 finit
 .386


  mov cx,three

  ploschad:

  ;a:
     fld x1
     fsub x2
     fstp tmp1
     fld tmp1
     fmul tmp1
          fstp tmp1

     fld y1
     fsub y2
     fstp tmp2
     fld tmp2
     fmul tmp2
          fstp tmp2

     fld tmp1
     fadd tmp2
     fsqrt
          fstp a


    ;b:
     fld x2
     fsub x3
     fstp tmp1
     fld tmp1
     fmul tmp1
          fstp tmp1

     fld y2
     fsub y3
     fstp tmp2
     fld tmp2
     fmul tmp2
          fstp tmp2

     fld tmp1
     fadd tmp2
     fsqrt
          fstp b

    ;c:
     fld x3
     fsub x1
     fstp tmp1
     fld tmp1
     fmul tmp1
          fstp tmp1

     fld y3
     fsub y1
     fstp tmp2
     fld tmp2
     fmul tmp2
          fstp tmp2

     fld tmp1
     fadd tmp2
     fsqrt
          fstp c


    ;poluperimetr
      fld a
      fadd b
      fadd c
      fdiv twodd
           fstp p



  ;---------------------------------------------

     ;nahozhdenie r

     fld p
     fsub a
     fstp tmp1

     fld p
     fsub b
     fstp tmp2

     fld p
     fsub c
     fstp tmp3

     fld tmp1
     fmul tmp2
     fmul tmp3
      fdiv p
      fsqrt
        fstp r



   ;-----------------------------------------------

     ; ploschad'


     fld r
     fmul p
     ; fstp mn
      ;ret

      cmp cx,three
       jne next1

           fstp s

           fld x1
           fstp tmpx
           fld y1
           fstp tmpy

           fld zr
           fld zr
           fstp x1
           fstp y1

           dec cx

        jmp ploschad

       next1:
        cmp cx,two
        jne next2


        fstp s1
          fld tmpx
          fstp x1
          fld tmpy
          fstp y1

           fld x2
           fstp tmpx
           fld y2
           fstp tmpy

           fld zr
           fld zr
           fstp x2
           fstp y2

           dec cx
         jmp ploschad


        next2:
        cmp cx,one
         jne next3


         fstp s2
          fld tmpx
          fstp x2
          fld tmpy
          fstp y2

           fld x3
           fstp tmpx
           fld y3
           fstp tmpy

           fld zr
           fld zr
           fstp x3
           fstp y3

           dec cx
         jmp ploschad

        next3:
         fstp s3

         fld s1
         fadd s2
         fadd s3
         fsub s
         fstp mn


        fld tmpx
        fstp x3
        fld tmpy
        fstp y3


        ret
calc   endp

        end
