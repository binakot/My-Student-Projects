//---------------------------------------------------------------------------   

#pragma hdrstop
#include "Unit2.h"
#define size 10

//---------------------------------------------------------------------------

#pragma package(smart_init)

class Vector {
public:
   Vector();
   Vector(float mas[size]);
   double GetNum(Num);
   Vector operator+(const Vector &operand2);
   Vector operator+(const float &operand2);
   Vector operator-(const Vector &operand2);
   Vector operator-(const float &operand2);
   Vector operator*(const Vector &operand2);
   Vector operator*(const float &operand2);
   Vector operator/(const Vector &operand2);
   Vector operator/(const float &operand2);
   Vector operator+=(const Vector &operand2);
   Vector operator+=(const float &operand2);
   Vector operator-=(const Vector &operand2);
   Vector operator-=(const float &operand2);
   Vector operator*=(const Vector &operand2);
   Vector operator*=(const float &operand2);
   Vector operator/=(const Vector &operand2);
   Vector operator/=(const float &operand2);
   Vector operator=(const float mas[4]);
   Vector operator=(const Vector &operand2);
private:
   float a,b,c,d,e;
};

Vector::Vector()
{
   a = .0;
   b = .0;
   c = .0;
   d = .0;
   e = .0;
}

Vector::Vector(float mas[4])
{
   a = mas[0];
   b = mas[1];
   c = mas[2];
   d = mas[3];
   e = mas[4];
}

double Vector::GetNum(Num)
{
  if (Num == 0)
    return a;
  else
    if (Num == 1)
      return b;
    else
      if (Num == 2)
        return c;
      else
        if (Num == 3)
          return d;
        else
          if (Num == 4)
            return e;

  return 0;
}

Vector Vector::operator+(const Vector &operand2)
{
  Vector res;

  res.a = a + operand2.a;
  res.b = b + operand2.b;
  res.c = c + operand2.c;
  res.d = d + operand2.d;
  res.e = e + operand2.e;

  return res;
}

Vector Vector::operator+(const float &operand2)
{
  Vector res;

  res.a = a + operand2;
  res.b = b + operand2;
  res.c = c + operand2;
  res.d = d + operand2;
  res.e = e + operand2;

  return res;
}

Vector Vector::operator-(const Vector &operand2)
{
  Vector res;

  res.a = a - operand2.a;
  res.b = b - operand2.b;
  res.c = c - operand2.c;
  res.d = d - operand2.d;
  res.e = e - operand2.e;

  return res;
}

Vector Vector::operator-(const float &operand2)
{
  Vector res;

  res.a = a - operand2;
  res.b = b - operand2;
  res.c = c - operand2;
  res.d = d - operand2;
  res.e = e - operand2;

  return res;
}

Vector Vector::operator*(const Vector &operand2)
{
  Vector res;

  res.a = a * operand2.a;
  res.b = b * operand2.b;
  res.c = c * operand2.c;
  res.d = d * operand2.d;
  res.e = e * operand2.e;

  return res;
}

Vector Vector::operator*(const float &operand2)
{
  Vector res;

  res.a = a * operand2;
  res.b = b * operand2;
  res.c = c * operand2;
  res.d = d * operand2;
  res.e = e * operand2;

  return res;
}

Vector Vector::operator/(const Vector &operand2)
{
  Vector res;

  if ((operand2.a!=0)&(operand2.b!=0)&(operand2.c!=0)&(operand2.d!=0)&(operand2.e!=0)) {
    res.a = a / operand2.a;
    res.b = b / operand2.b;
    res.c = c / operand2.c;
    res.d = d / operand2.d;
    res.e = e / operand2.e;
  }
  else {
    res.a = a;
    res.b = b;
    res.c = c;
    res.d = d;
    res.e = e;
  };

  return res;
}

Vector Vector::operator/(const float &operand2)
{
  Vector res;

  if (operand2!=0) {
    res.a = a / operand2;
    res.b = b / operand2;
    res.c = c / operand2;
    res.d = d / operand2;
    res.e = e / operand2;
  }
  else {
    res.a = a;
    res.b = b;
    res.c = c;
    res.d = d;
    res.e = e;
  };

  return res;
}

Vector Vector::operator+=(const Vector &operand2)
{
  a = a + operand2.a;
  b = b + operand2.b;
  c = c + operand2.c;
  d = d + operand2.d;
  e = e + operand2.e;
}

Vector Vector::operator+=(const float &operand2)
{
  a = a + operand2;
  b = b + operand2;
  c = c + operand2;
  d = d + operand2;
  e = e + operand2;
}

Vector Vector::operator-=(const Vector &operand2)
{
  a = a - operand2.a;
  b = b - operand2.b;
  c = c - operand2.c;
  d = d - operand2.d;
  e = e - operand2.e;
}

Vector Vector::operator-=(const float &operand2)
{
  a = a - operand2;
  b = b - operand2;
  c = c - operand2;
  d = d - operand2;
  e = e - operand2;
}

Vector Vector::operator*=(const Vector &operand2)
{
  a = a * operand2.a;
  b = b * operand2.b;
  c = c * operand2.c;
  d = d * operand2.d;
  e = e * operand2.e;
}

Vector Vector::operator*=(const float &operand2)
{
  a = a * operand2;
  b = b * operand2;
  c = c * operand2;
  d = d * operand2;
  e = e * operand2;
}

Vector Vector::operator/=(const Vector &operand2)
{
  if ((operand2.a!=0)&(operand2.b!=0)&(operand2.c!=0)&(operand2.d!=0)&(operand2.e!=0)) {
    a = a / operand2.a;
    b = b / operand2.b;
    c = c / operand2.c;
    d = d / operand2.d;
    e = e / operand2.e;
  }
}

Vector Vector::operator/=(const float &operand2)
{
  if (operand2!=0) {
    a = a / operand2;
    b = b / operand2;
    c = c / operand2;
    d = d / operand2;
    e = e / operand2;
  }
}

Vector Vector::operator=(const float mas[4])
{
  a = mas[0];
  b = mas[1];
  c = mas[2];
  d = mas[3];
  e = mas[4];
}

Vector Vector::operator=(const Vector &operand2)
{
  a = operand2.a;
  b = operand2.b;
  c = operand2.c;
  d = operand2.d;
  e = operand2.e;
}


