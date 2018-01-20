#include <fstream>
#include <iostream>
#include "Dialogs.hpp"
//---------------------------------------------------------------------------
using namespace std;

const int KeyFieldMax = 12;

const int KFMaxPlus1 = KeyFieldMax + 1;

const int DataFieldMax = 36;

const int DFMaxPlus1 = DataFieldMax + 1;

typedef char KeyFieldType[KFMaxPlus1];

typedef char DataFieldType[DFMaxPlus1];

typedef struct
{
  KeyFieldType KeyField;
  DataFieldType DataField;
} ItemType;
