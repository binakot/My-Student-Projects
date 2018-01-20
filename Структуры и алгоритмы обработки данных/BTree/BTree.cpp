//---------------------------------------------------------------------------
#pragma hdrstop
#include "BTree.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
//---------------------------------------------------------------------------
//Вывод ошибки
void Error(char * msg)
{
  ShowMessage(msg);
  exit(1);
}
//---------------------------------------------------------------------------
//Конструктор
BTTableClass::BTTableClass(char Mode, char * FileName)
{
  OpenMode = Mode;
  NodeSize = sizeof(NodeType);

  if (Mode == 'r')
  {
    DataFile.open(FileName, ios::in | ios::binary);
    if (DataFile.fail())
      Error("Файл не доступен для чтения");

    DataFile.read(reinterpret_cast <char *> (&CurrentNode), NodeSize);
    if (DataFile.fail())
    {
      NumItems = 0;
      NumNodes = 0;
      Root = NilPtr;
    }
    else
    {
      NumItems = CurrentNode.Branch[0];
      NumNodes = CurrentNode.Branch[1];
      Root = CurrentNode.Branch[2];
    }
  }
  else if (Mode == 'w')
  {
    DataFile.open(FileName, ios::in | ios::out | ios:: trunc | ios::binary);
    if (DataFile.fail())
      Error("Файл не доступен для записи");

    Root = NilPtr;
    NumItems = 0;
    NumNodes = 0;   
    CurrentNode.Branch[0] = NumItems;
    CurrentNode.Branch[1] = NumNodes;
    CurrentNode.Branch[2] = Root;
    DataFile.seekp(0, ios::beg);
    DataFile.write(reinterpret_cast <char *> (&CurrentNode), NodeSize);
  }
  else
    Error("Необходимо ввести либо 'r' (чтение), либо 'w' (запись)");
}
//---------------------------------------------------------------------------
//Деструктор
BTTableClass::~BTTableClass(void)
{  
  if (OpenMode == 'w')
  {
    CurrentNode.Branch[0] = NumItems;
    CurrentNode.Branch[1] = NumNodes;
    CurrentNode.Branch[2] = Root;
    DataFile.seekp(0, ios::beg);
    DataFile.write(reinterpret_cast <char *> (&CurrentNode), NodeSize); 
  } 

  DataFile.close();
}
//---------------------------------------------------------------------------
bool BTTableClass::Empty(void)
{
  return (Root == NilPtr);
}
//---------------------------------------------------------------------------
bool BTTableClass::SearchNode(const KeyFieldType Target, int & Location) const
{
  bool Found;

  Found = false;
  if (strcmp(Target, CurrentNode.Key[0].KeyField) < 0)
    Location = -1;
  else
  {
    Location = CurrentNode.Count - 1;
    while ((strcmp(Target, CurrentNode.Key[Location].KeyField) < 0) && (Location > 0))
       Location--;

    if (strcmp(Target, CurrentNode.Key[Location].KeyField) == 0)
      Found = true;
  }
  return Found;
}
//---------------------------------------------------------------------------
void BTTableClass::AddItem(const ItemType & NewItem, long NewRight, NodeType & Node, int Location)
{
  int j;

  for (j = Node.Count; j > Location; j--)
  {
    Node.Key[j] = Node.Key[j - 1];
    Node.Branch[j + 1] = Node.Branch[j];
  }

  Node.Key[Location] = NewItem;
  Node.Branch[Location + 1] = NewRight;
  Node.Count++;
}
//---------------------------------------------------------------------------
//Слияние узла и его сына если кол-во ключей в узле меньше максимального
void BTTableClass::Split(const ItemType & CurrentItem, long CurrentRight, long CurrentRoot, int Location, ItemType & NewItem, long & NewRight)
{
  int j, Median;
  NodeType RightNode;

  if (Location < MinKeys)
    Median = MinKeys;
  else
    Median = MinKeys + 1;

  DataFile.seekg(CurrentRoot * NodeSize, ios::beg);
  DataFile.read(reinterpret_cast <char *> (&CurrentNode), NodeSize);

  for (j = Median; j < MaxKeys; j++)
  {
    RightNode.Key[j - Median] = CurrentNode.Key[j];
    RightNode.Branch[j - Median + 1] = CurrentNode.Branch[j + 1];
  }

  RightNode.Count = MaxKeys - Median;
  CurrentNode.Count = Median;

  if (Location < MinKeys)
    AddItem(CurrentItem, CurrentRight, CurrentNode, Location + 1);
  else
    AddItem(CurrentItem, CurrentRight, RightNode, Location - Median + 1);

  NewItem = CurrentNode.Key[CurrentNode.Count - 1];
  RightNode.Branch[0] = CurrentNode.Branch[CurrentNode.Count];
  CurrentNode.Count--;

  DataFile.seekp(CurrentRoot * NodeSize, ios::beg);
  DataFile.write(reinterpret_cast <char *> (&CurrentNode), NodeSize);

  NumNodes++;
  NewRight = NumNodes;
  DataFile.seekp(NewRight * NodeSize, ios::beg);
  DataFile.write(reinterpret_cast <char *> (&RightNode), NodeSize);
}
//---------------------------------------------------------------------------
// Поиск подходящего места для вставки начиная с текущего узла
void BTTableClass::PushDown(const ItemType & CurrentItem, long CurrentRoot, bool & MoveUp, ItemType & NewItem, long & NewRight)
{
  int Location;

  if (CurrentRoot == NilPtr)
  {   
    MoveUp = true;     //true если ключ нужно поместить в родительский узел из-за расщепления
    NewItem = CurrentItem;
    NewRight = NilPtr;
  }
  else
  {
    DataFile.seekg(CurrentRoot * NodeSize, ios::beg);
    DataFile.read(reinterpret_cast <char *> (&CurrentNode), NodeSize);

    if (SearchNode(CurrentItem.KeyField, Location))
      Error("Ошибка: попытка создать копию ключа в Б-дереве");

    PushDown(CurrentItem, CurrentNode.Branch[Location + 1], MoveUp, NewItem, NewRight);

    if (MoveUp)
    {
      DataFile.seekg(CurrentRoot * NodeSize, ios::beg);
      DataFile.read(reinterpret_cast <char *> (&CurrentNode), NodeSize);

      if (CurrentNode.Count < MaxKeys)
      {
        MoveUp = false;
        AddItem(NewItem, NewRight, CurrentNode, Location + 1);
        DataFile.seekp(CurrentRoot * NodeSize, ios::beg);
        DataFile.write(reinterpret_cast <char *> (&CurrentNode), NodeSize);
      }
      else
      {
        MoveUp = true;
        Split(NewItem, NewRight, CurrentRoot, Location, NewItem, NewRight);
      }
    }
  }
}
//---------------------------------------------------------------------------
bool BTTableClass::Insert(const ItemType & Item)
{
  bool MoveUp;
  long NewRight;
  ItemType NewItem;  

  PushDown(Item, Root, MoveUp, NewItem, NewRight);

  if (MoveUp)
  {
    CurrentNode.Count = 1;
    CurrentNode.Key[0] = NewItem;
    CurrentNode.Branch[0] = Root;
    CurrentNode.Branch[1] = NewRight;
    NumNodes++;
    Root = NumNodes;
    DataFile.seekp(NumNodes * NodeSize, ios::beg);
    DataFile.write(reinterpret_cast <char *> (&CurrentNode), NodeSize);
  }
  
  NumItems++;
  return true;   
}
//---------------------------------------------------------------------------
bool BTTableClass::Retrieve(KeyFieldType SearchKey, ItemType & Item)
{
  long CurrentRoot;
  int Location;
  bool Found;

  Found = false;
  CurrentRoot = Root;

  while ((CurrentRoot != NilPtr) && (! Found))
  {
    DataFile.seekg(CurrentRoot * NodeSize, ios::beg);
    DataFile.read(reinterpret_cast <char *> (&CurrentNode), NodeSize);   

    if (SearchNode(SearchKey, Location))
    {
      Found = true;
      Item = CurrentNode.Key[Location];
    }
    else
      CurrentRoot = CurrentNode.Branch[Location + 1];
  }

  return Found;
}
//---------------------------------------------------------------------------
 