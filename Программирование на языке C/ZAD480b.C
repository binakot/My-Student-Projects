#include <stdio.h>
#include <math.h>
#include <CONIO.H>
FILE *f,*g;
int a;

void main()
{
 f=fopen("c:\\f480.dat","r");
 g=fopen("c:\\g480.dat","w");
  while (!feof(f))  {
    fscanf(f,"%d",&a);
    if (a%3==0 && a%7!=0) fprintf(g,"%d",a);
  }
 fclose(f);
 fclose(g);
 getch();
}