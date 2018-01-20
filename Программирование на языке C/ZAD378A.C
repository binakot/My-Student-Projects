#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <conio.h>
unsigned long i,j,x[8],X[8][8];
void main()
{
 clrscr();
 for (i=0;i<8;i++)
  {
   printf("Введите x[%d]:",i+1);
   scanf("%d",&x[i]);
  }
 for (i=0;i<8;i++)
 for (j=0;j<8;j++)
  X[i][j]=pow(x[j],i+1);
 for (i=0;i<8;i++)
  {
   for (j=0;j<8;j++)
   printf(" %d",X[i][j]);
   printf("\n");
  }
 getch();
}