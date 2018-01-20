#include <stdio.h>
#include <math.h>
#include <conio.h>
float a,res;
void main()
{
clrscr();
printf("Введите a:");
scanf("%f",&a);
if (a<=0) res=-a; else
 if (a<1) res=a; else
  if (a<=2) res=1; else
  res=-2*a+5;
printf("f(a)=%0.3f",res);
getch();
}
