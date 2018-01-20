#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <conio.h>
unsigned int n,i,k_otr=0,k_1_2=0;
float a[100];
void main()
{
 clrscr();
 printf("Введите n:");
 scanf("%d",&n);
 for (i=1;i<=n;i++)
 {
  printf("Введите число:");
  scanf("%f",&a[i]);
 }
 for (i=1;i<=n;i++)
  if ((a[i]>=0&&a[i]<1.0)||(a[i]>2.0)) a[i]=1; else
   if (a[i]<0) k_otr=k_otr++; else
    if (a[i]>=1.0&&a[i]<=2.0) k_1_2=k_1_2++;
 printf("Кол-во отриц.:%d \nКол-во [1;2]:%d",k_otr,k_1_2);
 getch();
}