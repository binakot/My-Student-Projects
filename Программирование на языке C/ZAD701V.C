#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <conio.h>
int i,j,b[100],A[100][100],n,res[100];
void main()
{
 clrscr();
 printf("������ n:");
 scanf("%d",&n);
 puts("���� �����:");
 for (i=1;i<=n;i++)
  {
   printf("������ x[%d]:",i);
   scanf("%d",&b[i]);
  }
 puts("���� �����⭮� ������:");
 for (i=1;i<=n;i++)
 for (j=1;j<=n;j++)
  {
   printf("������ A[%d,%d]:",i,j);
   scanf("%d",&A[i][j]);
  }
 for (i=1;i<=n;i++)
 for (j=1;j<=n;j++)
  {
   if (i==j) A[i][j]--;
   res[i]=res[i]+A[i][j]*b[j];
  }
 printf("�������:");
 for (i=1;i<=n;i++)
  printf("%d ",res[i]);
 getch();
}