#include <stdio.h>
#include <math.h>
#include <conio.h>
int x,y,z;
float a,b;
void main()
{
clrscr();
printf("‚Ά¥¤¨β¥ x,y,z:");
scanf("%d %d %d",&x,&y,&z);
a=y+x/(pow(y,2)+fabs(pow(x,2)/(y+pow(x,3)/3)));
b=1+pow(tan(z/2),2);
printf("¥§γ«μβ β:%0.5f, %0.5f",a,b);
getch();
}
