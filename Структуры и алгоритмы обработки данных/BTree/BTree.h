//---------------------------------------------------------------------------
#ifndef BTreeH
#define BTreeH
//---------------------------------------------------------------------------
#include "table.h"
//---------------------------------------------------------------------------
const int MaxKeys = 11;        //Максимальное количество ключей

const int MaxKeysPlusOne = MaxKeys + 1;   //Максимальное кол-во сыновей

const int MinKeys = 5;         //Минимальное количество ключей

const long NilPtr = -1L;       //L указывает на LongInt

typedef struct
{
  int Count;     //Кол-во ключей, хранящихся в текущем узле
  ItemType Key[MaxKeys];   //Индексация с 0
  long Branch[MaxKeysPlusOne];   //Указатели на сыновей
} NodeType;

void Error(char * msg);

class BTTableClass: public TableBaseClass
{
  public:
    BTTableClass(char Mode, char * FileName);                 //Конструктор
    ~BTTableClass(void);                                      //Деструктор
    bool Empty(void);                                         //Провера на заполненность
    bool Insert(const ItemType & Item);                       //Вставка
    bool Retrieve(KeyFieldType SearchKey, ItemType & Item);   //Обход  
  private:
    //Поиск узла по ключу
    bool SearchNode(const KeyFieldType Target, int & location) const;
    //Добавление нового элемента в узел
    void AddItem(const ItemType & NewItem, long NewRight, NodeType & Node, int Location);
    //Расщепление узла
    void Split(const ItemType & CurrentItem, long CurrentRight, long CurrentRoot, int Location, ItemType & NewItem, long & NewRight);
    //Поиск подходящего места для вставки в текущем поддереве
    void PushDown(const ItemType & CurrentItem, long CurrentRoot, bool & MoveUp, ItemType & NewItem, long & NewRight);
    long Root;            //Указатель на корень
    long NumNodes;        //Кол-во узлов в Б-дереве
    int NodeSize;         //Кол-во байтов в узле
    NodeType CurrentNode; //Указатель на текущий узел
};
//---------------------------------------------------------------------------
#endif
