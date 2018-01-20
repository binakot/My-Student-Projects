#include "itemtype.h"
//---------------------------------------------------------------------------
class TableBaseClass
{
  public:
    virtual bool Empty(void) = 0;
    virtual bool Insert(const ItemType & Item) = 0;
    virtual bool Retrieve(KeyFieldType SearchKey, ItemType & Item) = 0;
  protected:
    fstream DataFile;
    long NumItems;
    char OpenMode;
};
