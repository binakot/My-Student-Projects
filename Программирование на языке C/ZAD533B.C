#include <stdio.h>
#include <math.h>
#include <CONIO.H>
#include <alloc.h>
struct list
 {
  int a;
  struct list *next,*prev;
 } *head,*last,*p1,*p2;
int i,n;
long sum;

void main()
{
 clrscr();
 printf("Введите n:");
 scanf("%d", &n);
 head=NULL; p2=NULL;
  for (i=1;i<=n;i++)
   {
    printf("%d элемент:", i);
    p1=(struct list *) malloc(sizeof(struct list));
    scanf("%d", &(p1->a));
    p1->prev=p2;
    if (head==NULL) head=p1;
    else p2->next=p1;
    p1->next=NULL;
    p2=p1;
    last=p1;
   }
 sum=1; p1=head; p2=last;
  while (p1)
   {
    sum=sum*((p1->a)+(p2->a));
    p1=p1->next;
    p2=p2->prev;
   }
 printf("Сумма=%d", sum);
  while (head)
   {
    p1=head;
    head=head->next;
    free(p1);
   }
 getch();
}