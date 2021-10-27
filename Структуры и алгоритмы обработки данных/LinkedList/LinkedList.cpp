#include "Node.cpp"

template <class T>
class LinkedList
{
private:
  Node<T> *front, *rear;  // указатели для доступа к началу и концу списка
  Node<T> *prevPtr, *currPtr;   // используются для извлечения, вставки и удаления данных
  int size;  // число элементов в списке
  int position;    // положение в списке, используется методом Reset
  Node<T> *GetNode(const T& item, Node<T> *nextPtr);
public:
  LinkedList(void);  // конструктор
  LinkedList(const LinkedList<T>& L);
  LinkedList<T>& operator= (const LinkedList<T>& L);  // оператор присваивания
  int ListSize(void) const;  // проверка состояния списка
  int ListEmpty(void) const;
  void Reset(int pos = 0);    // методы прохождения списка
  void Next(void);
  int EndOfList(void) const;
  int CurrentPosition(void) const;
  // методы вставки
  void InsertFront(const T& item);
  void InsertRear(const T& item);
  void InsertAt(const T& item);
  void InsertAfter(const T& item);
  // методы удаления
  T DeleteFront(void);
  void DeleteAt(void);
  T& Data(void);   // возвратить/изменить данные
  void ClearList(void); // очистка списка
};
//---------------------------------------------------------------------------
// выделение узла с данным-членом item и указателем nextPtr
template <class T>
Node<T> *LinkedList<T>::GetNode(const T& item, Node<T> *nextPtr = NULL)
{
  Node<T> *newNode;
  // выделение памяти при передаче item и NextPtr конструктору.
  // завершение программы, если выделение памяти неудачно
  newNode = new Node<T>(item, nextPtr);
  if (newNode == NULL)
    exit(1);
  return newNode;
}
//---------------------------------------------------------------------------
// создать пустой список
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
    // получить адрес следующего узла и удалить текущий
    nextPosition = currPosition->NextNode(); 
    currPosition = nextPosition; // перейти к следующему узлу
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
  // если список пустой, выход
  if (front == NULL)
    return;
  // если положение задано не верно, закончить программу
  if (pos < 0 || pos > size-1)
    return;
  // установить механизм прохождения в pos
  if(pos == 0)
  {
    // перейти в начало списка
    prevPtr = NULL;
    currPtr = front;
    position = 0;
  }
  else
  // переустановить currPtr, prevPtr, и startPos
  {
    currPtr = front->NextNode();
    prevPtr = front;
    startPos = 1;
    // передвигаться вправо до pos
    for(position=startPos; position != pos; position++)
    {
      // передвинуть оба указателя прохождения вперед
      prevPtr = currPtr;
      currPtr = currPtr->NextNode();
    }
  }
}
//---------------------------------------------------------------------------
// переустановить prevPtr и currPtr вперед на один узел
template <class T>
void LinkedList<T>::Next(void)
{
  // выйти, если конец списка или
  // список пустой
  if (currPtr != NULL)
  {
    // переустановить два указателя на один узел вперед
    prevPtr = currPtr;
    currPtr = currPtr->NextNode();
    position++;
  }
}
//---------------------------------------------------------------------------
// возвратить ссылку на данные текущего узла
template <class T>
T& LinkedList<T>::Data (void)
{
  // ошибка, если список пустой или прохождение закончено
  if (size == 0 || currPtr == NULL)
  {
    exit(1);
  }
  return currPtr->data();
}
//---------------------------------------------------------------------------
// вставка item в текущую позицию списка
template <class T>
void LinkedList<T>::InsertAt(const T& item)
{
  Node<T> *newNode;
  // два случая: вставка в начало или внутрь списка
  if (prevPtr == NULL)
  {
    // вставка в начало списка, помещает также
    // узел в пустой список
    newNode = GetNode(item,front);
    front = newNode;
  }
  else
  {
    // вставка внутрь списка, помещает узел после prevPtr
    newNode = GetNode(item);
    prevPtr->InsertAfter(newNode);
  }
  // при prevPtr *» rear, имеем вставку в пустой список
  // или в хвост непустого списка; обновляет rear и position
  if (prevPtr == rear)
  {
    rear = newNode;
    position = size;
  }
  // обновить currPtr и увеличить size
  currPtr = newNode;
  size++;
}
//---------------------------------------------------------------------------
// удаление узла в текущей позиции списка
template <class T>
void LinkedList<T>::DeleteAt(void)
{
  Node<T> *p;
  // ошибка, если список пустой или конец списка
  if (currPtr == NULL)
    exit();
  // удалаять можно только в начале и внутри списка
  if (prevPtr == NULL)
  {
    // сохранить адрес начала, но не связывать его. если это -
    // последний узел, присвоить front значение NULL
    p = front;
    front = front->NextNode();
  }
  else
    // не связывать внутренний узел после prevPtr.
    // запомнить адрес
    p = prevPtr->DeleteAfter();
  // если хвост удален, адрес нового хвоста в prevPtr,
  // a position уменьшается на 1
  if (p == rear)
  {
    rear = prevPtr;
    position--;
  }
  // установить currPtr на последний удаленный узел.
  // если р — последний узел в списке,
  // currPtr становится равным NULL
  currPtr = p->NextNode();
  // освободить узел и уменьшить значение size
  FreeNode(p);
  size--;
}
//---------------------------------------------------------------------------
template <class T>
void LinkedList<T>::InsertFront(const T& item)
{
  Node<T> *newNode;
  // вставка в начало списка, помещает также
  // узел в пустой список
  newNode = GetNode(item,front);
  front = newNode; 
  // обновить currPtr и увеличить size
  currPtr = newNode;
  size++;
}
//---------------------------------------------------------------------------
template <class T>
T LinkedList<T>::DeleteFront(void)
{
  // сохранить адрес удаляемого узла
  Node<T> *p = front;
  // убедиться в том, что список не пуст
  if (front != NULL)
  {
    // передвинуть голову к следующему узлу и удалить оригинал
    front = front->NextNode();
    delete p;
  }
  currPtr = p->NextNode();
  // освободить узел и уменьшить значение size
  size--;
}
//---------------------------------------------------------------------------


