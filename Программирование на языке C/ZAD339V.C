#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <conio.h>
int n,i,j,a[100],k=1;
void main()
{
 clrscr();
 printf("Введите n:");
 scanf("%d",&n);
 for (i=0;i<n;i++)
  {
   printf("Введите число:");
   scanf("%d",&a[i]);
  }
 for (i=0;i<n;i++)
  {
   for (j=i+1;j<n;j++)
    {
     if (a[i]!=a[j]) k++;
     for (i=0; i<j; i++)
      if (a[i]==a[j]) k--;
    }
  }
 printf("Кол-во разных членов:%d",k);
 getch();
}