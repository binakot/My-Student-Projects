#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <conio.h>
#include <time.h>
int n;
float a[10][10];
void enter(float a1[10][10],int n1)
 {
    int i,j;

    for (i=0;i<n1;i++)
    for (j=0;j<n1;j++)
      a1[i][j]=0.1*random(100);
 }
void active(float a1[10][10],int n1)
 {
   int i,j;
   float a_max;

   a_max=a1[1][1];
   for (i=0;i<n1;i++)
   for (j=0;j<n1;j++)
    {
      if (i>=j)
        if (i+j>n1)
          if (a1[i][j]>a_max) a_max=a1[i][j];
    }
    printf("Макс.элемент:%0.3f",a_max);
 }

void output(float a1[10][10],int n1)
 {
   int i,j;

   for (i=0;i<n1;i++)
   for (j=0;j<n1;j++)
    {
      printf("%0.3f ",a1[i][j]);
      if (j==n1-1) printf("\n");
    }
 }
void main()
{
 clrscr();
 randomize();
 printf("Введите n:");
 scanf("%d",&n);
 enter(a,n);
 puts("");
 output(a,n);
 puts("");
 active(a,n);
 getch();
}