#include <stdio.h>
#include <math.h>
#include <CONIO.H>
#include <alloc.h>

struct list  {
  float a;
  struct list *next;
  }
  *head,*p1,*p2;
 unsigned int i,n;
 float x,res=1;
void main()
{
  clrscr();
  printf("‚Ά¥¤¨β¥ n:");
  scanf("%d",&n);
  head=NULL;
  p2=NULL;
  for (i=1;i<=n;i++)  {
    p1=(struct list *)malloc(sizeof(struct list));
    printf("‚Ά¥¤¨β¥ a[%d]:",i);
    scanf("%f",&x);
    p1->a=x;
    if(!head) head=p1;
    else p2->next=p1;
    p1->next=NULL;
    p2=p1;
    res=res*fabs(p1->a);
  }
  printf("¥§γ«μβ β:%0.3f",res);
  getch();
}