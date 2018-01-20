#include "Node.cpp"

template <class T>
class LinkedList
{
private:
  Node<T> *front, *rear;  // ��������� ��� ������� � ������ � ����� ������
  Node<T> *prevPtr, *currPtr;   // ������������ ��� ����������, ������� � �������� ������
  int size;  // ����� ��������� � ������
  int position;    // ��������� � ������, ������������ ������� Reset
  Node<T> *GetNode(const T& item, Node<T> *nextPtr);
public:
  LinkedList(void);  // �����������
  LinkedList(const LinkedList<T>& L);
  LinkedList<T>& operator= (const LinkedList<T>& L);  // �������� ������������
  int ListSize(void) const;  // �������� ��������� ������
  int ListEmpty(void) const;
  void Reset(int pos = 0);    // ������ ����������� ������
  void Next(void);
  int EndOfList(void) const;
  int CurrentPosition(void) const;
  // ������ �������
  void InsertFront(const T& item);
  void InsertRear(const T& item);
  void InsertAt(const T& item);
  void InsertAfter(const T& item);
  // ������ ��������
  T DeleteFront(void);
  void DeleteAt(void);
  T& Data(void);   // ����������/�������� ������
  void ClearList(void); // ������� ������
};
//---------------------------------------------------------------------------
// ��������� ���� � ������-������ item � ���������� nextPtr
template <class T>
Node<T> *LinkedList<T>::GetNode(const T& item, Node<T> *nextPtr = NULL)
{
  Node<T> *newNode;
  // ��������� ������ ��� �������� item � NextPtr ������������.
  // ���������� ���������, ���� ��������� ������ ��������
  newNode = new Node<T>(item, nextPtr);
  if (newNode == NULL)
    exit(1);
  return newNode;
}
//---------------------------------------------------------------------------
// ������� ������ ������
template <class T>
LinkedList<T>::LinkedList(void): front(NULL), rear(NULL),
  prevPtr(NULL), currPtr(NULL), size(0), position(-1)
  {}
//---------------------------------------------------------------------------
template <class T>
void LinkedList<T>::ClearList(void)
{
  Node<T> *currPosition, *nextPosition;
  currPosition = front;
  while(currPosition != NULL)
  {
    // �������� ����� ���������� ���� � ������� �������
    nextPosition = currPosition->NextNode(); 
    currPosition = nextPosition; // ������� � ���������� ����
  }
  front = rear = NULL;
  prevPtr = currPtr = NULL;
  size = 0;
  position = -1;
}
//---------------------------------------------------------------------------
template <class T>
void LinkedList<T>::Reset(int pos)
{
  int startPos;
  // ���� ������ ������, �����
  if (front == NULL)
    return;
  // ���� ��������� ������ �� �����, ��������� ���������
  if (pos < 0 || pos > size-1)
    return;
  // ���������� �������� ����������� � pos
  if(pos == 0)
  {
    // ������� � ������ ������
    prevPtr = NULL;
    currPtr = front;
    position = 0;
  }
  else
  // �������������� currPtr, prevPtr, � startPos
  {
    currPtr = front->NextNode();
    prevPtr = front;
    startPos = 1;
    // ������������� ������ �� pos
    for(position=startPos; position != pos; position++)
    {
      // ����������� ��� ��������� ����������� ������
      prevPtr = currPtr;
      currPtr = currPtr->NextNode();
    }
  }
}
//---------------------------------------------------------------------------
// �������������� prevPtr � currPtr ������ �� ���� ����
template <class T>
void LinkedList<T>::Next(void)
{
  // �����, ���� ����� ������ ���
  // ������ ������
  if (currPtr != NULL)
  {
    // �������������� ��� ��������� �� ���� ���� ������
    prevPtr = currPtr;
    currPtr = currPtr->NextNode();
    position++;
  }
}
//---------------------------------------------------------------------------
// ���������� ������ �� ������ �������� ����
template <class T>
T& LinkedList<T>::Data (void)
{
  // ������, ���� ������ ������ ��� ����������� ���������
  if (size == 0 || currPtr == NULL)
  {
    exit(1);
  }
  return currPtr->data();
}
//---------------------------------------------------------------------------
// ������� item � ������� ������� ������
template <class T>
void LinkedList<T>::InsertAt(const T& item)
{
  Node<T> *newNode;
  // ��� ������: ������� � ������ ��� ������ ������
  if (prevPtr == NULL)
  {
    // ������� � ������ ������, �������� �����
    // ���� � ������ ������
    newNode = GetNode(item,front);
    front = newNode;
  }
  else
  {
    // ������� ������ ������, �������� ���� ����� prevPtr
    newNode = GetNode(item);
    prevPtr->InsertAfter(newNode);
  }
  // ��� prevPtr *� rear, ����� ������� � ������ ������
  // ��� � ����� ��������� ������; ��������� rear � position
  if (prevPtr == rear)
  {
    rear = newNode;
    position = size;
  }
  // �������� currPtr � ��������� size
  currPtr = newNode;
  size++;
}
//---------------------------------------------------------------------------
// �������� ���� � ������� ������� ������
template <class T>
void LinkedList<T>::DeleteAt(void)
{
  Node<T> *p;
  // ������, ���� ������ ������ ��� ����� ������
  if (currPtr == NULL)
    exit();
  // �������� ����� ������ � ������ � ������ ������
  if (prevPtr == NULL)
  {
    // ��������� ����� ������, �� �� ��������� ���. ���� ��� -
    // ��������� ����, ��������� front �������� NULL
    p = front;
    front = front->NextNode();
  }
  else
    // �� ��������� ���������� ���� ����� prevPtr.
    // ��������� �����
    p = prevPtr->DeleteAfter();
  // ���� ����� ������, ����� ������ ������ � prevPtr,
  // a position ����������� �� 1
  if (p == rear)
  {
    rear = prevPtr;
    position--;
  }
  // ���������� currPtr �� ��������� ��������� ����.
  // ���� � � ��������� ���� � ������,
  // currPtr ���������� ������ NULL
  currPtr = p->NextNode();
  // ���������� ���� � ��������� �������� size
  FreeNode(p);
  size--;
}
//---------------------------------------------------------------------------
template <class T>
void LinkedList<T>::InsertFront(const T& item)
{
  Node<T> *newNode;
  // ������� � ������ ������, �������� �����
  // ���� � ������ ������
  newNode = GetNode(item,front);
  front = newNode; 
  // �������� currPtr � ��������� size
  currPtr = newNode;
  size++;
}
//---------------------------------------------------------------------------
template <class T>
T LinkedList<T>::DeleteFront(void)
{
  // ��������� ����� ���������� ����
  Node<T> *p = front;
  // ��������� � ���, ��� ������ �� ����
  if (front != NULL)
  {
    // ����������� ������ � ���������� ���� � ������� ��������
    front = front->NextNode();
    delete p;
  }
  currPtr = p->NextNode();
  // ���������� ���� � ��������� �������� size
  size--;
}
//---------------------------------------------------------------------------


