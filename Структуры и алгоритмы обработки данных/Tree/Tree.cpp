#include "TreeNode.cpp"

template <class T>
class BinSTree
{
  protected: // требуется для наследования
    // указатели на корень и на текущий узел
    TreeNode<T> *root;
    TreeNode<T> *current;
    // число элементов дерева
    int size;
    TreeNode<T> *GetTreeNode(T item, TreeNode<T> *lptr = NULL, TreeNode<T> *rptr = NULL);
  public:
    // конструктор
    BinSTree(void);
    // стандартные методы обработки списков
    TreeNode<T> *FindNode(const T& item, TreeNode<T>* & parent) const;
    void Insert(const T& item);
    void Delete(const T& item);
    void Update(const T& item);
    TreeNode<T>* Max(TreeNode<T> *t);
    TreeNode<T>* Min(TreeNode<T> *t);
    TreeNode<T>* GetRoot();
    void FreeTreeNode(TreeNode<T> *p);
    void DeleteTree(TreeNode<T> *t);
    void ClearTree(TreeNode<T> *t);
};

template <class T>
BinSTree<T>::BinSTree(void)
{ 
  root = current = NULL;
  size = -1;
}

template <class T>
TreeNode<T>* BinSTree<T>::GetRoot()
{
  return root;
}

// вставить item в дерево поиска
template <class T>
void BinSTree<T>::Insert(const T& item)
{
  // t — текущий узел, parent — предыдущий узел
  TreeNode<T> *t = root, *parent = NULL, *newNode;
  newNode = GetTreeNode(item, NULL, NULL); 
  // закончить на пустом дереве
  while(t != NULL)
  {
    // обновить указатель parent и идти направо или налево
    parent = t;
    if (item < t->GetData())
      t = t->Left();
    else
      t = t->Right();
  }
  // если родителя нет, вставить в качестве корневого узла
  if (parent == NULL)
    root = newNode;
    // если item меньше родительского узла, вставить в качестве левого сына
  else
  if (item < parent->GetData())
    parent->left = newNode;
  else
    // если item больше или равен родительскому узлу,
    // вставить в качестве правого сына
    parent->right = newNode;
  // присвоить указателю current адрес нового узла и увеличить size на единицу
  current = newNode;
  size++;
}

// искать элемент данных на дереве, если найден, возвратить адрес
// совпавшего узла и указатель на его родителя, иначе зозвратить NULL
template <class T>
TreeNode<T> *BinSTree<T>::FindNode(const T& item, TreeNode<T>* & parent) const
{
  // пробежать по узлам дерева, начиная с корня
  TreeNode<T> *t = root;
  //у корня нет родителя
  parent = NULL;
  // прерваться на пустом дереве
  while (t !== NULL)
  {
    // остановиться по совпадении
    if (item == t->GetData())
      break;
    else
    {
      // обновить родительский указатель и идти направо или налево
      parent = t;
      if (item < t->GetData())
        t = t->Left();
      else
        t = t->Right();
    }
  }
  // возвратить указатель на узел; NULL, если не найден
  return t;
}


// если элемент находится на дереве, удалить его
template <class T>
void BinSTree<T>::Delete(const T& item)
{
  // DNodePtr — указатель на удаляемый узел D
  // DNodePtr — указатель на родительский узел Р узла D
  // RNodePtr — указатель узел R, замещающий узел D
  TreeNode<T> *DNodePtr, *PNodePtr, *RNodePtr;
  // найти узел, данные в котором совпадают с item.
  // получить его адрес и адрес его родителя
  if ((DNodePtr = FindNode (item, PNodePtr)) == NULL
    return;
  // если узел D имеет NULL-указатель, то заменяющим
  // узлом является тот, что находится на другой ветви
  if ((DNodePtr->Right() == NULL) && (DNodePtr->Left() != NULL))
    RNodePtr = DNodePtr->Left();
  else
  if ((DNodePtr->Left() == NULL) && (DNodePtr->Right() != NULL))
    RNodePtr = DNodePtr->Right();
    // узел D имеет двух сыновей
  else
  if ((DNodePtr->Left() != NULL) && (DNodePtr->Right() != NULL))
  {
    TreeNode<T> *PofRNodePtr = DNodePtr;

    RNodePtr = DNodePtr->Right();
    while (RNodePtr->Left() != NULL)
    {
      PofRNodePtr = RNodePtr;
      RNodePtr = RNodePtr->Left();
    }
    if (PofRNodePtr == DNodePtr)
      RNodePtr->Left() = DNodePtr->Left();
    else
    {
      PofRNodePtr->Right() = RNodePtr->Left();
    }
    if (RNodePtr == NULL)
      root = RNodePtr;
    else
    if (DNodePtr->GetData() < PNodePtr->GetData())
      PNodePtr->Left() = RNodePtr;
    else
      PNodePtr->Right() = RNodePtr;
  }
  FreeTreeNode(DNodePtr);
  size--;
}

// если текущий узел определен и элемент данных (item) совпал
// с данными в этом узле, переписать элемент данных в узел.
// иначе включить item в дерево
template <class T>
void BinSTree<T>::Update(const T& item)
{
  if (current != NULL && current->GetData() == item)
    current->SetData(item);
  else
    Insert(item);
}

// создать объект TreeNode с указательными полями lptr и rptr.
//по умолчанию указатели содержат NULL.
template <class T>
TreeNode<T>* BinSTree<T>::GetTreeNode(T item, TreeNode<T> *lptr, TreeNode<T> *rptr)
{
  TreeNode<T> *p;
  // вызвать new для создания нового узла
  // передать туда параметры lptr и rptr
  p = new TreeNode<T> (item, lptr, rptr);
  // если памяти недостаточно, завершить программу сообщением об ошибке
  if (p == NULL)
    exit(1);
  // вернуть указатель на выделенную системой память
  return p;
}

template <class T>
TreeNode<T>* BinSTree<T>::Max(TreeNode<T> *t)
{
  if (t->Right() != NULL)
    Max(t->Right()); // пройти правое поддерево
  else
    return t;
}

template <class T>
TreeNode<T>* BinSTree<T>::Min(TreeNode<T> *t)
{
  if (t->Left() != NULL)
    Min(t->Left()); // пройти левое поддерево
  else
    return t;
}

// освободить динамическую память, занимаемую данным узлом
template <class T>
void BinSTree<T>::FreeTreeNode(TreeNode<T> *p)
{
  delete p;
}   

// использовать обратный алгоритм для прохождения узлов дерева
//и удалить каждый узел при его посещении
template <class T>
void BinSTree<T>::DeleteTree(TreeNode<T> *t)
{
  if (t != NULL)
  {
    DeleteTree(t->Left());
    DeleteTree(t->Right());
    FreeTreeNode(t);
  }
}

// вызвать функцию DeleteTree для удаления узлов дерева.
// затем сбросить указатель на его корень в NULL
template <class T>
void BinSTree<T>::ClearTree(TreeNode<T> *t)
{
  DeleteTree(t);
  t = NULL;
  root = NULL;
  // теперь корень пуст
}



