#include <stdio.h>
#include <math.h>
#include <CONIO.H>
FILE *f,*g;
int n,i,k=0,pos=0;
char c;
struct stud {
  char name[20];
  char fam[20];
  char klass[20];
  char bukva[20];
  } cur1,cur2;

void main()
{
 clrscr();
/* f=fopen("c:\\f507.dat","w");
 printf("Введите n:");
 scanf("%d",&n);
 for (i=0; i<n; i++)
   {
     printf("Имя:"); scanf("%s",&cur1.name);  fprintf(f,"%s;",cur1.name);
     printf("Фамилия:"); scanf("%s",&cur1.fam);  fprintf(f,"%s;",cur1.fam);
     printf("Класс:"); scanf("%s",&cur1.klass);  fprintf(f,"%s;",cur1.klass);
     printf("Буква:"); scanf("%s",&cur1.bukva); fprintf(f,"%s;",cur1.bukva);
   }
 fclose(f); */
 f=fopen("c:\\f507.dat","r");
 g=fopen("c:\\f507.dat","r");
 while(!feof(f))
   {
     i=0;
     do { fscanf(f,"%c",&c); cur1.name[i]=c; i++; } while(c!=';');
     i=0;
     do { fscanf(f,"%c",&c); cur1.fam[i]=c; i++; } while(c!=';');
     i=0;
     do { fscanf(f,"%c",&c); cur1.klass[i]=c; i++; } while(c!=';');
     i=0;
     do { fscanf(f,"%c",&c); cur1.bukva[i]=c; i++; } while(c!=';');
       fseek(g,0,0);
       while(!feof(g))
         {
            i=0;
            do { fscanf(g,"%c",&c); cur2.name[i]=c; i++; } while(c!=';');
            i=0;
            do { fscanf(g,"%c",&c); cur2.fam[i]=c; i++; } while(c!=';');
            i=0;
            do { fscanf(g,"%c",&c); cur2.klass[i]=c; i++; } while(c!=';');
            i=0;
            do { fscanf(g,"%c",&c); cur2.bukva[i]=c; i++; } while(c!=';');

            for (i=0; i<20; i++)
             if (cur1.klass[i]==cur2.klass[i])
              if (cur1.bukva[i]!=cur2.bukva[i])
               if (cur1.fam[i]==cur2.fam[i]) { k++; break; }
         }
   }

 printf("Кол-во однофамильцев из параллельных классов:%d",k);
 fclose(f);
 fclose(g);
 getch();
}