#include "Tree.cpp"
#include "Stack.cpp"
#include "Iterator.cpp"

// �������� ������������� ����������� ��������� ������.
// ���������� ������� ����� Iterator
template <class T>
class InorderIterator : public Iterator<T>
{
  private:
    // ������������ ���� ������� �����
    Stack< TreeNode <T> * > S;
    // ������ ������ � ������� ����
    TreeNode<T> *root, *current;
    // ������������ ������ ��������� ������������ �������� Next
    TreeNode<T> *GoFarLeft(TreeNode<T> *t);
  public:
    // �����������
    InorderIterator(TreeNode<T> *tree);   
    // ���������� ������� �������� �����������
    virtual void Next(void);
    virtual void Reset(void);
    virtual T Data(void);
};

// ������� ����� �������� ���� �� ����� ����� ���� t.
// ��������� � ����� ������ ���� ���������� �����
template <class T>
TreeNode<T> *InorderIterator<T>::GoFarLeft(TreeNode<T> *t)
{
  // ���� t=NULL, ������� NULL
  if (t == NULL)
    return NULL;
  // ���� �� ���������� ���� � ������� ����� ����������,
  // ���������� �� ����� ������, ��������� � ����� S
  // ������ ���������� �����. ���������� ��������� �� ���� ����
  while (t->Left() != NULL)
  {
    S.Push(t);
    t = t->Left();
  }
  return t;
}

// ���������������� ���� iterationComplete. ������� ����� ���������� ���, ��
// ������ ����� ���� ������. ��������� ����� ������������ - ������� ����� ����.
template <class T>
InorderIterator<T>::InorderIterator(TreeNode<T> *tree) : Iterator<T>()
{
  root = tree;
  iterationComplete = (root == NULL);
  current = GoFarLeft(root);
}

template <class T>
void InorderIterator<T>::Reset(void)
{
  iterationComplete = (root == NULL);
  current = GoFarLeft(root);
  S.ClearStack();
}

template <class T>
T InorderIterator<T>::Data(void)
{
  current->GetData();
}

template <class T>
void InorderIterator<T>::Next(void)
{
  if (iterationComplete)
  {  
    exit(1);
  }
  // current - ������� �������������� ����. 
  // ���� ���� ������ ���������, ���������� �� ����� �� ��� ����� �����,
  // ������� ��������� � ����� ������ ���������� �����
  if (current->Right() != NULL)
    current = GoFarLeft(current->Right());  
  // ������� ��������� ���, �� � ����� ���� ������ ����,
  // ���������� ���������. ���������� �� ����� ����� ������� �����,
  // ������������ ����� �� ������
  else if (!S.StackEmpty())
    current = S.Pop();
  // ��� �� ������� ���������, �� ����� � �����. ������������ ���������
  else
    iterationComplete = 1;
}
