//---------------------------------------------------------------------------

#pragma hdrstop
#include "queue.h"
#define MaxQSize 20

typedef int ItemType;

//---------------------------------------------------------------------------

#pragma package(smart_init)

class Queue {
private:
  ItemType mas[MaxQSize];
  int first;
  int last;
  int count;
public:
  Queue();
  bool isEmpty();
  bool isFull();
  void push(ItemType Cur);
  void pop();
  ItemType getFirst();
  void ClearQueue();
};

Queue::Queue()
{
  first = 0;
  last = MaxQSize-1;
  count = 0;
};

bool Queue::isEmpty()
{
  if (count == 0)
    return true;
  else
    return false;
};

bool Queue::isFull()
{
  if (count == MaxQSize-1)
    return true;
  else
    return false;
};

void Queue::push(ItemType cur)
{
  if (!isFull())
  {
    count++;
    mas[last] = cur;
    last = (last + 1) % MaxQSize;
  }
};

void Queue::pop()
{
  if (!isEmpty())
  {
    count--;
    first = (first + 1) % MaxQSize;
  }
};

ItemType Queue::getFirst()
{
  if (!isEmpty())
  {
    return mas[first];
  }
};

void Queue::ClearQueue()
{
  first = 0;
  last = MaxQSize-1;
  count = 0;
};
