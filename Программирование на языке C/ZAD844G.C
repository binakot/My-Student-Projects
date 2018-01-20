#include <stdio.h>
#include <math.h>
#include <CONIO.H>
#include <graphics.h>
float x,y1,y2;  int driver,mode;
void main()
{
 clrscr();
 driver=DETECT;
 initgraph(&driver,&mode,"c:\\work\\hll\\bc31\\bgi");

 line(320,0,320,479);
 line(0,240,639,240);
 line(350,235,350,245);
 line(315,210,325,210);
 for(x=(-3); x<=3; x=x+0.001)
    {
      y2=pow(x,5);
      putpixel(320+x*30,240-y2*30,15);
    }
 getch();
}
