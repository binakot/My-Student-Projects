#include <stdio.h>
#include <math.h>
#include <conio.h>
#include <stdlib.h>
unsigned int n,n2,i,num;
void main()
{
 clrscr();
 printf("������ n:");
 scanf("%d",&n);
 n2=pow(n,2);
 for (i=1;i<=100000;i=i*10)
  {
   num=n2/i;
   num=num%10;
   if (num==3)
    {
     puts("�室��");
     break;
    }
   if (i==100000) puts("�� �室��");
  }
 getch();
}