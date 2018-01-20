#include <stdio.h>
#include <math.h>
#include <conio.h>
unsigned int n,a=0,b=0;
void main()
{
clrscr();
do
 {
  printf("‚Ά¥¤¨β¥ n:");
  scanf("%d",&n);
 }
while (n<=7);

for (a=0;a<=10;a++)
 {
  if (3*a==n) break;
  else
  for (b=0;b<=10;b++)
   {
    if (3*a+5*b==n) break;
   }
  if (3*a+5*b==n) break;
 }
puts("¥§γ«μβ β:");
printf("’ΰρθ¥ª:%d, οβρΰ®ª:%d",a,b);
getch();
}
