//---------------------------------------------------------------------------


#pragma hdrstop
#include "Stack.h"
const Size = 100;

//---------------------------------------------------------------------------

#pragma package(smart_init)

class Stack {
private:
  char mas[Size];
  int top;
public:
  Stack();
  bool StackEmpty();
  bool StackFull();
  char Pop();
  void Push(char Cur);
  char Peek();
  void ClearStack();
};

Stack::Stack()
{
  top = -1;
};

bool Stack::StackEmpty()
{
  if (top == -1) return true;
  else return false;
};

bool Stack::StackFull()
{
  if (top == Size-1) return true;
  else return false;
};

char Stack::Pop()
{
  char cur;

  if (StackEmpty() == false) {
    cur = mas[top];
    top--;
  }
  return cur;
};

void Stack::Push(char Cur)
{
  if (StackFull() == false) {
    top++;
    mas[top] = Cur;
  }
};

char Stack::Peek()
{
  char cur;

  if (StackEmpty() == false) {
    cur = mas[top];
  };
  return cur;
};

void Stack::ClearStack()
{
  top = -1;
};
