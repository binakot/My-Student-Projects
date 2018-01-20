//---------------------------------------------------------------------------
#ifndef BTreeH
#define BTreeH
//---------------------------------------------------------------------------
#include "table.h"
//---------------------------------------------------------------------------
const int MaxKeys = 11;        //������������ ���������� ������

const int MaxKeysPlusOne = MaxKeys + 1;   //������������ ���-�� �������

const int MinKeys = 5;         //����������� ���������� ������

const long NilPtr = -1L;       //L ��������� �� LongInt

typedef struct
{
  int Count;     //���-�� ������, ���������� � ������� ����
  ItemType Key[MaxKeys];   //���������� � 0
  long Branch[MaxKeysPlusOne];   //��������� �� �������
} NodeType;

void Error(char * msg);

class BTTableClass: public TableBaseClass
{
  public:
    BTTableClass(char Mode, char * FileName);                 //�����������
    ~BTTableClass(void);                                      //����������
    bool Empty(void);                                         //������� �� �������������
    bool Insert(const ItemType & Item);                       //�������
    bool Retrieve(KeyFieldType SearchKey, ItemType & Item);   //�����  
  private:
    //����� ���� �� �����
    bool SearchNode(const KeyFieldType Target, int & location) const;
    //���������� ������ �������� � ����
    void AddItem(const ItemType & NewItem, long NewRight, NodeType & Node, int Location);
    //����������� ����
    void Split(const ItemType & CurrentItem, long CurrentRight, long CurrentRoot, int Location, ItemType & NewItem, long & NewRight);
    //����� ����������� ����� ��� ������� � ������� ���������
    void PushDown(const ItemType & CurrentItem, long CurrentRoot, bool & MoveUp, ItemType & NewItem, long & NewRight);
    long Root;            //��������� �� ������
    long NumNodes;        //���-�� ����� � �-������
    int NodeSize;         //���-�� ������ � ����
    NodeType CurrentNode; //��������� �� ������� ����
};
//---------------------------------------------------------------------------
#endif
