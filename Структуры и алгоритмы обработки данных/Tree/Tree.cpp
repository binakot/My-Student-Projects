#include "TreeNode.cpp"

template <class T>
class BinSTree
{
  protected: // ��������� ��� ������������
    // ��������� �� ������ � �� ������� ����
    TreeNode<T> *root;
    TreeNode<T> *current;
    // ����� ��������� ������
    int size;
    TreeNode<T> *GetTreeNode(T item, TreeNode<T> *lptr = NULL, TreeNode<T> *rptr = NULL);
  public:
    // �����������
    BinSTree(void);
    // ����������� ������ ��������� �������
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

// �������� item � ������ ������
template <class T>
void BinSTree<T>::Insert(const T& item)
{
  // t � ������� ����, parent � ���������� ����
  TreeNode<T> *t = root, *parent = NULL, *newNode;
  newNode = GetTreeNode(item, NULL, NULL); 
  // ��������� �� ������ ������
  while(t != NULL)
  {
    // �������� ��������� parent � ���� ������� ��� ������
    parent = t;
    if (item < t->GetData())
      t = t->Left();
    else
      t = t->Right();
  }
  // ���� �������� ���, �������� � �������� ��������� ����
  if (parent == NULL)
    root = newNode;
    // ���� item ������ ������������� ����, �������� � �������� ������ ����
  else
  if (item < parent->GetData())
    parent->left = newNode;
  else
    // ���� item ������ ��� ����� ������������� ����,
    // �������� � �������� ������� ����
    parent->right = newNode;
  // ��������� ��������� current ����� ������ ���� � ��������� size �� �������
  current = newNode;
  size++;
}

// ������ ������� ������ �� ������, ���� ������, ���������� �����
// ���������� ���� � ��������� �� ��� ��������, ����� ���������� NULL
template <class T>
TreeNode<T> *BinSTree<T>::FindNode(const T& item, TreeNode<T>* & parent) const
{
  // ��������� �� ����� ������, ������� � �����
  TreeNode<T> *t = root;
  //� ����� ��� ��������
  parent = NULL;
  // ���������� �� ������ ������
  while (t !== NULL)
  {
    // ������������ �� ����������
    if (item == t->GetData())
      break;
    else
    {
      // �������� ������������ ��������� � ���� ������� ��� ������
      parent = t;
      if (item < t->GetData())
        t = t->Left();
      else
        t = t->Right();
    }
  }
  // ���������� ��������� �� ����; NULL, ���� �� ������
  return t;
}


// ���� ������� ��������� �� ������, ������� ���
template <class T>
void BinSTree<T>::Delete(const T& item)
{
  // DNodePtr � ��������� �� ��������� ���� D
  // DNodePtr � ��������� �� ������������ ���� � ���� D
  // RNodePtr � ��������� ���� R, ���������� ���� D
  TreeNode<T> *DNodePtr, *PNodePtr, *RNodePtr;
  // ����� ����, ������ � ������� ��������� � item.
  // �������� ��� ����� � ����� ��� ��������
  if ((DNodePtr = FindNode (item, PNodePtr)) == NULL
    return;
  // ���� ���� D ����� NULL-���������, �� ����������
  // ����� �������� ���, ��� ��������� �� ������ �����
  if ((DNodePtr->Right() == NULL) && (DNodePtr->Left() != NULL))
    RNodePtr = DNodePtr->Left();
  else
  if ((DNodePtr->Left() == NULL) && (DNodePtr->Right() != NULL))
    RNodePtr = DNodePtr->Right();
    // ���� D ����� ���� �������
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

// ���� ������� ���� ��������� � ������� ������ (item) ������
// � ������� � ���� ����, ���������� ������� ������ � ����.
// ����� �������� item � ������
template <class T>
void BinSTree<T>::Update(const T& item)
{
  if (current != NULL && current->GetData() == item)
    current->SetData(item);
  else
    Insert(item);
}

// ������� ������ TreeNode � ������������� ������ lptr � rptr.
//�� ��������� ��������� �������� NULL.
template <class T>
TreeNode<T>* BinSTree<T>::GetTreeNode(T item, TreeNode<T> *lptr, TreeNode<T> *rptr)
{
  TreeNode<T> *p;
  // ������� new ��� �������� ������ ����
  // �������� ���� ��������� lptr � rptr
  p = new TreeNode<T> (item, lptr, rptr);
  // ���� ������ ������������, ��������� ��������� ���������� �� ������
  if (p == NULL)
    exit(1);
  // ������� ��������� �� ���������� �������� ������
  return p;
}

template <class T>
TreeNode<T>* BinSTree<T>::Max(TreeNode<T> *t)
{
  if (t->Right() != NULL)
    Max(t->Right()); // ������ ������ ���������
  else
    return t;
}

template <class T>
TreeNode<T>* BinSTree<T>::Min(TreeNode<T> *t)
{
  if (t->Left() != NULL)
    Min(t->Left()); // ������ ����� ���������
  else
    return t;
}

// ���������� ������������ ������, ���������� ������ �����
template <class T>
void BinSTree<T>::FreeTreeNode(TreeNode<T> *p)
{
  delete p;
}   

// ������������ �������� �������� ��� ����������� ����� ������
//� ������� ������ ���� ��� ��� ���������
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

// ������� ������� DeleteTree ��� �������� ����� ������.
// ����� �������� ��������� �� ��� ������ � NULL
template <class T>
void BinSTree<T>::ClearTree(TreeNode<T> *t)
{
  DeleteTree(t);
  t = NULL;
  root = NULL;
  // ������ ������ ����
}



