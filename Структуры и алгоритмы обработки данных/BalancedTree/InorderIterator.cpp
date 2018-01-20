#include "Stack.cpp"
#include "RBTree.cpp"
#include "Iterator.cpp"

// �������� ������������� ����������� ��������� ������.
// ���������� ������� ����� Iterator
template <class T>
class InorderIterator : public Iterator<T>
{
  private:
    // ������������ ���� ������� �����
    Stack< RBTreeNode <T> * > S;
    // ������ ������ � ������� ����
    RBTreeNode<T> *root, *current;
    // ������������ ������ ��������� ������������ �������� Next
    RBTreeNode<T> *GoFarLeft(RBTreeNode<T> *t);
  public:
    // �����������
    InorderIterator(RBTreeNode<T> *tree);
    // ���������� ������� �������� �����������
    virtual void Next(void);
    virtual void Reset(void);
    virtual T& Data(void);
    virtual char GetColor(void);
    virtual int EndOfList(void) const;
};

// ������� ����� �������� ���� �� ����� ����� ���� t.
// ��������� � ����� ������ ���� ���������� �����
template <class T>
RBTreeNode<T> *InorderIterator<T>::GoFarLeft(RBTreeNode<T> *t)
{
  // ���� t=NIL, ������� NIL
  if (t == NIL)
    return NIL;
  // ���� �� ���������� ���� � ������� ����� ����������,
  // ���������� �� ����� ������, ��������� � ����� S
  // ������ ���������� �����. ���������� ��������� �� ���� ����
  while (t->Left() != NIL)
  {
    S.Push(t);
    t = t->Left();
  }
  return t;
}

// ���������������� ���� iterationComplete. ������� ����� ���������� ���, �� 
// ������ ����� ���� ������. ��������� ����� ������������ - ������� ����� ����.
template <class T>
InorderIterator<T>::InorderIterator(RBTreeNode<T> *tree) : Iterator<T>()
{
  root = tree;
  iterationComplete = (root == NIL);
  current = GoFarLeft(root);
}

template <class T>
void InorderIterator<T>::Reset(void)
{
  iterationComplete = (root == NIL);
  current = GoFarLeft(root);
  S.ClearStack();
}

template <class T>
int InorderIterator<T>::EndOfList(void) const
{
  return iterationComplete;
}

template <class T>
void InorderIterator<T>::Next(void)
{  
  // current - ������� �������������� ����. 
  // ���� ���� ������ ���������, ���������� �� ����� �� ��� ����� �����,
  // ������� ��������� � ����� ������ ���������� �����
  if (current->Right() != NIL)
    current = GoFarLeft(current->Right());
  // ������� ��������� ���, �� � ����� ���� ������ ����,
  // ���������� ���������. ���������� �� ����� ����� ������� �����,
  // ������������ ����� �� ������
  else
  {
    if (!S.StackEmpty())
      current = S.Pop();
      // ��� �� ������� ���������, �� ����� � �����. ������������ ���������
    else
      iterationComplete = 1;
  }
}

template <class T>
T& InorderIterator<T>::Data(void)
{
  return current->GetData();
}

template <class T>
char InorderIterator<T>::GetColor(void)
{
  return current->GetColor();
}
