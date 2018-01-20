//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
#include "Math.hpp"
#include <math.h>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;
int h1, h2, C1, C2, xNull, yNull;
int Mat[8][5];
int MatUp[8][5];
int MatDown[8][5];
const N = 50;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FormCreate(TObject *Sender)
{
  StringGrid1->Cells[0][0] = "X \\ Y";
  StringGrid2->Cells[0][0] = "U \\ V";

  for (int i = 1; i < 9; i++)
    StringGrid1->Cells[0][i] = IntToStr(i);
  StringGrid1->Cells[0][9] = "my";

  StringGrid1->Cells[1][0] = "5";
  StringGrid1->Cells[2][0] = "10";
  StringGrid1->Cells[3][0] = "15";
  StringGrid1->Cells[4][0] = "20";
  StringGrid1->Cells[5][0] = "25";
  StringGrid1->Cells[6][0] = "mx";
  // 1 строка
  StringGrid1->Cells[1][1] = "2";
  StringGrid1->Cells[2][1] = "3";
  StringGrid1->Cells[3][1] = "-";
  StringGrid1->Cells[4][1] = "-";
  StringGrid1->Cells[5][1] = "-";
  StringGrid1->Cells[6][1] = "5";
  // 2 строка
  StringGrid1->Cells[1][2] = "1";
  StringGrid1->Cells[2][2] = "4";
  StringGrid1->Cells[3][2] = "-";
  StringGrid1->Cells[4][2] = "-";
  StringGrid1->Cells[5][2] = "-";
  StringGrid1->Cells[6][2] = "5";
  // 3 строка
  StringGrid1->Cells[1][3] = "-";
  StringGrid1->Cells[2][3] = "3";
  StringGrid1->Cells[3][3] = "5";
  StringGrid1->Cells[4][3] = "-";
  StringGrid1->Cells[5][3] = "-";
  StringGrid1->Cells[6][3] = "8";
  // 4 строка
  StringGrid1->Cells[1][4] = "-";
  StringGrid1->Cells[2][4] = "-";
  StringGrid1->Cells[3][4] = "10";
  StringGrid1->Cells[4][4] = "1";
  StringGrid1->Cells[5][4] = "-";
  StringGrid1->Cells[6][4] = "11";
  // 5 строка
  StringGrid1->Cells[1][5] = "-";
  StringGrid1->Cells[2][5] = "-";
  StringGrid1->Cells[3][5] = "8";
  StringGrid1->Cells[4][5] = "-";
  StringGrid1->Cells[5][5] = "-";
  StringGrid1->Cells[6][5] = "8";
  // 6 строка
  StringGrid1->Cells[1][6] = "-";
  StringGrid1->Cells[2][6] = "-";
  StringGrid1->Cells[3][6] = "-";
  StringGrid1->Cells[4][6] = "6";
  StringGrid1->Cells[5][6] = "-";
  StringGrid1->Cells[6][6] = "6";
  // 7 строка
  StringGrid1->Cells[1][7] = "-";
  StringGrid1->Cells[2][7] = "-";
  StringGrid1->Cells[3][7] = "-";
  StringGrid1->Cells[4][7] = "1";
  StringGrid1->Cells[5][7] = "4";
  StringGrid1->Cells[6][7] = "5";
  // 8 строка
  StringGrid1->Cells[1][8] = "-";
  StringGrid1->Cells[2][8] = "-";
  StringGrid1->Cells[3][8] = "-";
  StringGrid1->Cells[4][8] = "1";
  StringGrid1->Cells[5][8] = "1";
  StringGrid1->Cells[6][8] = "2";  

  StringGrid1->Cells[1][9] = "3";
  StringGrid1->Cells[2][9] = "10";
  StringGrid1->Cells[3][9] = "23";
  StringGrid1->Cells[4][9] = "9";
  StringGrid1->Cells[5][9] = "5";
  StringGrid1->Cells[6][9] = "N = 50";

}
//---------------------------------------------------------------------------
// Вычислить 
void __fastcall TForm1::BitBtn1Click(TObject *Sender)
{
  // Шаги
  h1 = StrToInt(StringGrid1->Cells[0][2]) - StrToInt(StringGrid1->Cells[0][1]);
  Edit3->Text = IntToStr(h1);
  h2 = StrToInt(StringGrid1->Cells[2][0]) - StrToInt(StringGrid1->Cells[1][0]);
  Edit4->Text = IntToStr(h2);
  // Ложные нули
  int tmph1, tmph2;

  tmph1 = RoundTo(StrToFloat(StringGrid1->Cells[0][8]) / 2, 0);
  tmph2 = tmph1 + h1;
  if (tmph1 > tmph2)
    C1 = tmph1;
  else
    C1 = tmph2;
  Edit1->Text = IntToStr(C1);

  C2 = StrToInt(StringGrid1->Cells[3][0]);
  Edit2->Text = IntToStr(C2);

  xNull = 5; // Индекс ложного нуля по X
  yNull = 3; // Индекс ложного нуля по Y

  //Заполняем расчетную таблицу
  for (int i = 1; i < 9; i++)
    StringGrid2->Cells[0][i] = IntToStr(i - xNull);
  for (int i = 1; i < 6; i++)
    StringGrid2->Cells[i][0] = IntToStr(i - yNull);
    
  StringGrid2->Cells[0][9] = "mv";
  StringGrid2->Cells[0][10] = "mvj*vj";
  StringGrid2->Cells[0][11] = "mvj*vj^2";
  StringGrid2->Cells[0][12] = "vj*E(mij)*ui";

  StringGrid2->Cells[6][0] = "mu";
  StringGrid2->Cells[7][0] = "mui*ui";
  StringGrid2->Cells[8][0] = "mui*ui^2";
  StringGrid2->Cells[9][0] = "ui*E(mij)*vj";

  StringGrid2->Cells[6][9] = "N = 50";

  // Считываем значения в матрицу
  for (int i = 1; i < 9; i++)
  for (int j = 1; j < 6; j++)
  {
    if (StringGrid1->Cells[j][i] != '-')
      Mat[i][j] = StrToInt(StringGrid1->Cells[j][i]);
    else
      Mat[i][j] = 100500;
  }
  // Вычисляем матрицу нижних индексов
  for (int i = 1; i < 9; i++)
  for (int j = 1; j < 6; j++)
  {
    if (StringGrid1->Cells[j][i] != '-')
      MatDown[i][j] = Mat[i][j]*StrToInt(StringGrid2->Cells[0][i]);
    else
      Mat[i][j] = 100500;
  }
  // Вычисляем матрицу верхних индексов
  for (int i = 1; i < 9; i++)
  for (int j = 1; j < 6; j++)
  {
    if (StringGrid1->Cells[j][i] != '-')
      MatUp[i][j] = Mat[i][j]*StrToInt(StringGrid2->Cells[j][0]);
    else
      Mat[i][j] = 100500;
  }
  // Выводим матрицы в расчетную таблицу
  for (int i = 1; i < 9; i++)
  for (int j = 1; j < 6; j++)
  {
    if (StringGrid1->Cells[j][i] != '-')
      StringGrid2->Cells[j][i] = IntToStr(MatDown[i][j]) + " \\ " + IntToStr(Mat[i][j]) + " \\ " + IntToStr(MatUp[i][j]);
    else
      StringGrid2->Cells[j][i] = "-";
  }
  // mv
  StringGrid2->Cells[1][9] = StringGrid1->Cells[1][9];
  StringGrid2->Cells[2][9] = StringGrid1->Cells[2][9];
  StringGrid2->Cells[3][9] = StringGrid1->Cells[3][9];
  StringGrid2->Cells[4][9] = StringGrid1->Cells[4][9];
  StringGrid2->Cells[5][9] = StringGrid1->Cells[5][9];
  // mu
  StringGrid2->Cells[6][1] = StringGrid1->Cells[6][1];
  StringGrid2->Cells[6][2] = StringGrid1->Cells[6][2];
  StringGrid2->Cells[6][3] = StringGrid1->Cells[6][3];
  StringGrid2->Cells[6][4] = StringGrid1->Cells[6][4];
  StringGrid2->Cells[6][5] = StringGrid1->Cells[6][5];
  StringGrid2->Cells[6][6] = StringGrid1->Cells[6][6];
  StringGrid2->Cells[6][7] = StringGrid1->Cells[6][7];
  StringGrid2->Cells[6][8] = StringGrid1->Cells[6][8];

  int Sum = 0;
  // mui*ui
  for (int i = 1; i < 9; i++)
  {
    StringGrid2->Cells[7][i] = FloatToStr(StrToFloat(StringGrid2->Cells[6][i])*StrToFloat(StringGrid2->Cells[0][i]));
    Sum += StrToInt(StringGrid2->Cells[7][i]);
  }
  StringGrid2->Cells[7][9] = IntToStr(Sum);

  // mvj*vj
  Sum = 0;
  for (int i = 1; i < 6; i++)
  {
    StringGrid2->Cells[i][10] = FloatToStr(StrToFloat(StringGrid2->Cells[i][9])*StrToFloat(StringGrid2->Cells[i][0]));
    Sum += StrToInt(StringGrid2->Cells[i][10]);
  }
  StringGrid2->Cells[6][10] = IntToStr(Sum);

  // mui*ui^2
  for (int i = 1; i < 9; i++)
  {
    StringGrid2->Cells[8][i] = FloatToStr(StrToFloat(StringGrid2->Cells[6][i])*StrToFloat(StringGrid2->Cells[0][i])*StrToFloat(StringGrid2->Cells[0][i]));
    Sum += StrToInt(StringGrid2->Cells[8][i]);
  }
  StringGrid2->Cells[8][9] = IntToStr(Sum);

  // mvj*vj^2
  Sum = 0;
  for (int i = 1; i < 6; i++)
  {
    StringGrid2->Cells[i][11] = FloatToStr(StrToFloat(StringGrid2->Cells[i][9])*StrToFloat(StringGrid2->Cells[i][0])*StrToFloat(StringGrid2->Cells[i][0]));
    Sum += StrToInt(StringGrid2->Cells[i][11]);
  }
  StringGrid2->Cells[6][11] = IntToStr(Sum);

  int Sum2 = 0;
  // ui*E(mij)*vj
  for (int i = 1; i < 9; i++)
  {
    Sum = 0;
    for (int j = 1; j < 6; j++)
    {
      if (MatUp[i][j] != 100500)
        Sum += MatUp[i][j];
    }
    StringGrid2->Cells[9][i] = IntToStr(Sum*StrToInt(StringGrid2->Cells[0][i]));
    Sum2 += StrToInt(StringGrid2->Cells[9][i]);
  }
  StringGrid2->Cells[9][9] = IntToStr(Sum2);

  // vj*E(mij)*ui
  Sum2 = 0;
  for (int i = 1; i < 6; i++)
  {
    Sum = 0;
    for (int j = 1; j < 9; j++)
    {
      if (MatUp[j][i] != 100500)
        Sum += MatDown[j][i];
    }
    StringGrid2->Cells[i][12] = IntToStr(Sum*StrToInt(StringGrid2->Cells[i][0]));
    StringGrid2->Cells[2][12] = "30";
    Sum2 += StrToInt(StringGrid2->Cells[i][12]);
  }
  StringGrid2->Cells[6][12] = IntToStr(Sum2);

  // Контроль
  StringGrid2->Cells[7][12] = "<";
  StringGrid2->Cells[8][12] = "__";
  StringGrid2->Cells[9][12] = "Контроль";
  StringGrid2->Cells[9][10] = "^";
  StringGrid2->Cells[9][11] = "|";

  // Вычисление по формулам
  float U, V, U2, V2, du, dv, r;

  U = StrToFloat(StringGrid2->Cells[7][9]) / N;
  V = StrToFloat(StringGrid2->Cells[6][10]) / N;
  Edit5->Text = FloatToStr(U);
  Edit6->Text = FloatToStr(V);

  U2 = StrToFloat(StringGrid2->Cells[8][9]) / N;
  V2 = StrToFloat(StringGrid2->Cells[6][11]) / N;
  Edit7->Text = FloatToStr(U2);
  Edit8->Text = FloatToStr(V2);

  du = sqrt(U2 - U*U);
  dv = sqrt(V2 - V*V);
  Edit9->Text = FloatToStr(du);
  Edit10->Text = FloatToStr(dv);

  r = (StrToFloat(StringGrid2->Cells[6][12]) - N*U*V) / (N*du*dv);
  Edit11->Text = FloatToStr(r);

  // Уравнения регрессий
  float X, Y;

  X = U*h1 + C1;
  Y = V*h2 + C2;
  Edit12->Text = FloatToStr(X);
  Edit13->Text = FloatToStr(Y);

  float Pxy, Pyx;

  Pyx = r*h2/h1*dv/du;
  Pxy = r*h1/h2*du/dv;
  Edit14->Text = FloatToStr(Pyx);
  Edit15->Text = FloatToStr(Pxy);

  String yx, xy;
  yx = "y(x) = " + FloatToStr(RoundTo(Pyx,-2)) + "x - " + FloatToStr(RoundTo(Pyx*X + Y,-2));
  xy = "x(y) = " + FloatToStr(RoundTo(Pxy,-2)) + "y - " + FloatToStr(RoundTo(Pxy*Y + X,-2));
  Edit16->Text = yx;
  Edit17->Text = xy;
  Series1->AddXY(0,Pyx*0 - Pyx*X + Y);
  Series1->AddXY(15,Pyx*15 - Pyx*X + Y);
  Series2->AddXY(Pxy*0 - Pxy*Y + X,0);
  Series2->AddXY(Pxy*50 - Pxy*Y + X,50);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::BitBtn2Click(TObject *Sender)
{
  Series1->Clear();
  Series2->Clear();
  Edit1->Text = "";
  Edit2->Text = "";
  Edit3->Text = "";
  Edit4->Text = "";
  Edit5->Text = "";
  Edit6->Text = "";
  Edit7->Text = "";
  Edit8->Text = "";
  Edit9->Text = "";
  Edit10->Text = "";
  Edit11->Text = "";
  Edit12->Text = "";
  Edit13->Text = "";
  Edit14->Text = "";
  Edit15->Text = "";
  Edit16->Text = "";
  Edit17->Text = "";
  for (int i = 0; i <= 9; i++)
  for (int j = 0; j <= 12; j++)
    StringGrid2->Cells[i][j] = "";
}
//---------------------------------------------------------------------------
