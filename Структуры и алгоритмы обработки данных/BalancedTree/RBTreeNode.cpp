template <class T>
class RBTree;

template <class T>
class RBTreeNode
{
  private:
    RBTreeNode<T> *left;
    RBTreeNode<T> *right;
    RBTreeNode<T> *parent;
    T data;
  public:
    RBTreeNode(RBTreeNode<T> *lptr = NULL, RBTreeNode<T> *rptr = NULL, RBTreeNode<T> *prnt = NULL, int item = 0);
    RBTreeNode<T>* Left(void);
    RBTreeNode<T>* Right(void);
    RBTreeNode<T>* Parent(void);
    char GetColor(void);
    T& GetData(void);
    void SetData(const T& item);
    void SetRed(void);
    void SetBlack(void);
    friend class RBTree<T>;
};

#define NIL &sentinel          
RBTreeNode<int> sentinel(NIL, NIL, 0, 0);

template <class T>
RBTreeNode<T>::RBTreeNode(RBTreeNode<T> *lptr, RBTreeNode<T> *rptr, RBTreeNode<T> *prnt, int item)
{
  left = lptr;
  right = rptr;
  parent = prnt;
  data = item;
}
  
template <class T>
RBTreeNode<T>* RBTreeNode<T>::Left(void)
{
  return left;
}

template <class T>
RBTreeNode<T>* RBTreeNode<T>::Right(void)
{
  return right;
}

template <class T>
RBTreeNode<T>* RBTreeNode<T>::Parent(void)
{
  return parent;
}

template <class T>
T& RBTreeNode<T>::GetData(void)
{
  return data;
}

template <class T>
void RBTreeNode<T>::SetData(const T& item)
{
  data = item;
}

template <class T>
char RBTreeNode<T>::GetColor(void)
{
  if (right->GetData() > left->GetData())
    return 'b';
  else
    return 'r';
}

template <class T>
void RBTreeNode<T>::SetRed(void)
{
  RBTreeNode<T> *tmp;

  if (right->GetData() > left->GetData())
    {
      tmp = left;
      left = right;
      right = tmp;
    }
}

template <class T>
void RBTreeNode<T>::SetBlack(void)
{
   RBTreeNode<T> *tmp;

   if (right->GetData() < left->GetData())
    {
      tmp = left;
      left = right;
      right = tmp;
    }
}
