#include <stdio.h>
#include <math.h>
#include <stdlib.h>
int m,n;

int nod(int n1,int m1)
 {
   return (m1==0)?n1:nod(m1,n1%m1);
 }

void main()
 {
   clrscr();
   printf("Введите n,m:");
   scanf("%d %d",&n,&m);
   printf("НОД=%d",nod(n,m));
   getch();
}