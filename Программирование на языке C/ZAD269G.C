#include <stdio.h>
#include <stdlib.h>
#include <string.h>
unsigned int n;
int i,j,k=0;
char s[100],s_first,s_end;
void main()
{
 clrscr();
 puts("Введите строку:");
 gets(s);
 i=0;
  for (; i<strlen(s); i++)
     {
       if (s[i]!=' ')
          {
              s_first=s[i];
              for (j=i; j<strlen(s) && s[j]!=' '; j++);
              s_end=s[j-1];
              if (s_first==s_end) k++;
              i=j;
          }
      }
 printf("Кол-во слов с одинаковыми 1 и последней буквой:%d",k);
 getch();
}