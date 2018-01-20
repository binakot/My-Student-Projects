#include "Stack.cpp"
#include "RBTree.cpp"
#include "Iterator.cpp"

// итератор симметричного прохождения бинарного дерева.
// использует базовый класс Iterator
template <class T>
class InorderIterator : public Iterator<T>
{
  private:
    // поддерживать стек адресов узлов
    Stack< RBTreeNode <T> * > S;
    // корень дерева и текущий узел
    RBTreeNode<T> *root, *current;
    // сканирование левого поддерева используется функцией Next
    RBTreeNode<T> *GoFarLeft(RBTreeNode<T> *t);
  public:
    // конструктор
    InorderIterator(RBTreeNode<T> *tree);
    // реализации базовых операций прохождения
    virtual void Next(void);
    virtual void Reset(void);
    virtual T& Data(void);
    virtual char GetColor(void);
    virtual int EndOfList(void) const;
};

// вернуть адрес крайнего узла на левой ветви узла t.
// запомнить в стеке адреса всех пройденных узлов
template <class T>
RBTreeNode<T> *InorderIterator<T>::GoFarLeft(RBTreeNode<T> *t)
{
  // если t=NIL, вернуть NIL
  if (t == NIL)
    return NIL;
  // пока не встретится узел с нулевым левым указателем,
  // спускаться по левым ветвям, запоминая в стеке S
  // адреса пройденных узлов. Возвратить указатель на этот узел
  while (t->Left() != NIL)
  {
    S.Push(t);
    t = t->Left();
  }
  return t;
}

// инициализировать флаг iterationComplete. Базовый класс сбрасывает его, но 
// дерево может быть пустым. начальный узлел сканирования - крайний слева узел.
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
  // current - текущий обрабатываемый узел. 
  // если есть правое поддерево, спуститься до конца по его левой ветви,
  // попутно запоминая в стеке адреса пройденных узлов
  if (current->Right() != NIL)
    current = GoFarLeft(current->Right());
  // правого поддерева нет, но в стеке есть другие узлы,
  // подлежащие обработке. вытолкнуть из стека новый текущий адрес,
  // продвинуться вверх по дереву
  else
  {
    if (!S.StackEmpty())
      current = S.Pop();
      // нет ни правого поддерева, ни узлов в стеке. сканирование завершено
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
