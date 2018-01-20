//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Prog.h"
#include "Math.h"

//---------------------------------------------------------------------------

#pragma package(smart_init)

class Progress {
private:
  int a1,d;
  char type;
public:
  Progress();
  Progress(int A1, int D);
  void TypeProg(char Value);
  void SetA1(int A1);
  int GetA1();
  void SetD(int D);
  int GetD();
  int GetSum(int Num);
  int GetOne(int Num);
};

Progress::Progress()
{
  a1 = 0;
  d = 0;
}

Progress::Progress(int A1, int D)
{
  a1 = A1;
  d = D;
}

void Progress::TypeProg(char Value)
{
  type = Value;
};

void Progress::SetA1(int A1)
{
  a1 = A1;
};

int Progress::GetA1()
{
  return a1;
}

void Progress::SetD(int D)
{
  d = D;
};

int Progress::GetD()
{
  return d;
};

int Progress::GetOne(int Num)
{
  int value;

  if (type == 'a') {value = a1+(Num-1)*d;}
  else {value = a1*pow(d,Num-1);}
  return value;
};

int Progress::GetSum(int Num)
{
  int value;

  if (type == 'a') {value = ((2*a1+d*(Num-1))/2)*Num;}
  else
    {
      if (d==1) {value = Num*a1;}
      else { value = (a1*(1-pow(d,Num)))/(1-d);}
    }
  return value;
};



