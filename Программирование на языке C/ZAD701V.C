#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <conio.h>
int i,j,b[100],A[100][100],n,res[100];
void main()
{
 clrscr();
 printf("Введите n:");
 scanf("%d",&n);
 puts("Ввод вектора:");
 for (i=1;i<=n;i++)
  {
   printf("Введите x[%d]:",i);
   scanf("%d",&b[i]);
  }
 puts("Ввод квадратной матрицы:");
 for (i=1;i<=n;i++)
 for (j=1;j<=n;j++)
  {
   printf("Введите A[%d,%d]:",i,j);
   scanf("%d",&A[i][j]);
  }
 for (i=1;i<=n;i++)
 for (j=1;j<=n;j++)
  {
   if (i==j) A[i][j]--;
   res[i]=res[i]+A[i][j]*b[j];
  }
 printf("Результат:");
 for (i=1;i<=n;i++)
  printf("%d ",res[i]);
 getch();
}