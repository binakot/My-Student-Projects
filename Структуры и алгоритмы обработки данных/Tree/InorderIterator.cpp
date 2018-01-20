#include "Tree.cpp"
#include "Stack.cpp"
#include "Iterator.cpp"

// итератор симметричного прохождения бинарного дерева.
// использует базовый класс Iterator
template <class T>
class InorderIterator : public Iterator<T>
{
  private:
    // поддерживать стек адресов узлов
    Stack< TreeNode <T> * > S;
    // корень дерева и текущий узел
    TreeNode<T> *root, *current;
    // сканирование левого поддерева используется функцией Next
    TreeNode<T> *GoFarLeft(TreeNode<T> *t);
  public:
    // конструктор
    InorderIterator(TreeNode<T> *tree);   
    // реализации базовых операций прохождения
    virtual void Next(void);
    virtual void Reset(void);
    virtual T Data(void);
};

// вернуть адрес крайнего узла на левой ветви узла t.
// запомнить в стеке адреса всех пройденных узлов
template <class T>
TreeNode<T> *InorderIterator<T>::GoFarLeft(TreeNode<T> *t)
{
  // если t=NULL, вернуть NULL
  if (t == NULL)
    return NULL;
  // пока не встретится узел с нулевым левым указателем,
  // спускаться по левым ветвям, запоминая в стеке S
  // адреса пройденных узлов. Возвратить указатель на этот узел
  while (t->Left() != NULL)
  {
    S.Push(t);
    t = t->Left();
  }
  return t;
}

// инициализировать флаг iterationComplete. Базовый класс сбрасывает его, но
// дерево может быть пустым. начальный узлел сканирования - крайний слева узел.
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
  // current - текущий обрабатываемый узел. 
  // если есть правое поддерево, спуститься до конца по его левой ветви,
  // попутно запоминая в стеке адреса пройденных узлов
  if (current->Right() != NULL)
    current = GoFarLeft(current->Right());  
  // правого поддерева нет, но в стеке есть другие узлы,
  // подлежащие обработке. вытолкнуть из стека новый текущий адрес,
  // продвинуться вверх по дереву
  else if (!S.StackEmpty())
    current = S.Pop();
  // нет ни правого поддерева, ни узлов в стеке. сканирование завершено
  else
    iterationComplete = 1;
}
