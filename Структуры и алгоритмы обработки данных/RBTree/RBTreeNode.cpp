typedef enum { BLACK, RED } nodeColor;

template <class T>
class RBTree;

template <class T>
class RBTreeNode
{
  private:
    RBTreeNode<T> *left;
    RBTreeNode<T> *right;
    RBTreeNode<T> *parent;
    nodeColor color;
    int data;
  public:
    RBTreeNode(RBTreeNode<T> *lptr = NULL, RBTreeNode<T> *rptr = NULL, RBTreeNode<T> *prnt = NULL, nodeColor clr = BLACK, int item = 0);
    RBTreeNode<T>* Left(void);
    RBTreeNode<T>* Right(void);
    RBTreeNode<T>* Parent(void);
    T& GetData(void);
    char GetColor(void);
    void SetData(const T& item);
    friend class RBTree<T>;
};

#define NIL &sentinel          
RBTreeNode<int> sentinel(NIL, NIL, 0, BLACK, 0);

template <class T>
RBTreeNode<T>::RBTreeNode(RBTreeNode<T> *lptr, RBTreeNode<T> *rptr, RBTreeNode<T> *prnt, nodeColor clr, int item)
{
  left = lptr;
  right = rptr;
  parent = prnt;
  color = clr;
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
  if (color == BLACK)
    return 'b';
  else
    return 'r';
}
