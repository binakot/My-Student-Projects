#include <stdio.h>
#include <math.h>
#include <conio.h>
unsigned int n,a=0,b=0;
void main()
{
clrscr();
do
 {
  printf("������ n:");
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
puts("�������:");
printf("���襪:%d, ����ப:%d",a,b);
getch();
}
