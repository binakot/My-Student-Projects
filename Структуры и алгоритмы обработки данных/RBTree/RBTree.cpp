#define compLT(a,b) (a < b)
#define compEQ(a,b) (a == b)
#include "RBTreeNode.cpp"

template <class T>
class RBTree
{
  protected:
    RBTreeNode<T> *root;
  public:
    RBTree(void);
    void rotateLeft(RBTreeNode<T> *x);
    void rotateRight(RBTreeNode<T> *x);
    void insertFixup(RBTreeNode<T> *x);
    RBTreeNode<T>* insertNode(T& data);
    void deleteFixup(RBTreeNode<T> *x);
    void deleteNode(RBTreeNode<T> *z);
    RBTreeNode<T>* findNode(T& data);
    RBTreeNode<T>* GetRoot();
    void FreeTreeNode(RBTreeNode<T> *p);
    void DeleteTree(RBTreeNode<T> *t);
    void ClearTree(RBTreeNode<T> *t);
};

template <class T>
RBTree<T>::RBTree(void)
{
  root = NIL;
}

template <class T>
void RBTree<T>::rotateLeft(RBTreeNode<T> *x)
{
  RBTreeNode<T> *y = x->Right();
  x->right = y->Left();
  if (y->left != NIL)
    y->left->parent = x;
  if (y != NIL)
    y->parent = x->Parent();
  if (x->Parent())
  {
    if (x == x->parent->left)
      x->parent->left = y;
    else
      x->parent->right = y;
  }
  else
    root = y;
  y->left = x;
  if (x != NIL)
    x->parent = y;
}

template <class T>
void RBTree<T>::rotateRight(RBTreeNode<T> *x)
{
  RBTreeNode<T> *y = x->left;
  x->left = y->right;
  if (y->right != NIL)
    y->right->parent = x;
  if (y != NIL)
    y->parent = x->parent;
  if (x->parent)
  {
    if (x == x->parent->right)
      x->parent->right = y;
    else
      x->parent->left = y;
  }
  else
    root = y;
  y->right = x;
  if (x != NIL)
    x->parent = y;
}

template <class T>
void RBTree<T>::insertFixup(RBTreeNode<T> *x)
{
  while (x != root && x->parent->color == RED)
  {
    if (x->parent == x->parent->parent->left)
    {
      RBTreeNode<T> *y = x->parent->parent->right;
      if (y->color == RED)
      {
        x->parent->color = BLACK;
        y->color = BLACK;
        x->parent->parent->color = RED;
        x = x->parent->parent;
      }
      else
      {
        if (x == x->parent->right)
        {
          x = x->parent;
          rotateLeft(x);
        }
        x->parent->color = BLACK;
        x->parent->parent->color = RED;
        rotateRight(x->parent->parent);
      }
    }
    else
    {
      RBTreeNode<T> *y = x->parent->parent->left;
      if (y->color == RED)
      {
        x->parent->color = BLACK;
        y->color = BLACK;
        x->parent->parent->color = RED;
        x = x->parent->parent;
      }
      else
      {
        if (x == x->parent->left)
        {
          x = x->parent;
          rotateRight(x);
        }
        x->parent->color = BLACK;
        x->parent->parent->color = RED;
        rotateLeft(x->parent->parent);
      }
    }
  }
  root->color = BLACK;
}

template <class T>
RBTreeNode<T>* RBTree<T>::insertNode(T& data)
{
  RBTreeNode<T> *current, *parent, *x;
  current = root;
  parent = 0;
  while (current != NIL)
  {
    if (compEQ(data, current->data))
      return (current);
    parent = current;
    current = compLT(data, current->data) ? current->left : current->right;
  }
  x = new RBTreeNode<T>;
  if (!x)
    exit(1);
  x->data = data;
  x->parent = parent;
  x->left = NIL;
  x->right = NIL;
  x->color = RED;
  if(parent)
  {
    if(compLT(data, parent->data))
      parent->left = x;
    else
      parent->right = x;
  }
  else
    root = x;
  insertFixup(x);
  return(x);
}

template <class T>
void RBTree<T>::deleteFixup(RBTreeNode<T> *x)
{
  while (x != root && x->color == BLACK)
  {
    if (x == x->parent->left)
    {
      RBTreeNode *w = x->parent->right;
      if (w->color == RED)
      {
        w->color = BLACK;
        x->parent->color = RED;
        rotateLeft (x->parent);
        w = x->parent->right;
      }
      if (w->left->color == BLACK && w->right->color == BLACK)
      {
        w->color = RED;
        x = x->parent;
      }
      else
      {
        if (w->right->color == BLACK)
        {
          w->left->color = BLACK;
          w->color = RED;
          rotateRight (w);
          w = x->parent->right;
        }
        w->color = x->parent->color;
        x->parent->color = BLACK;
        w->right->color = BLACK;
        rotateLeft (x->parent);
        x = root;
      }
    }
    else
    {
      RBTreeNode *w = x->parent->left;
      if (w->color == RED)
      {
        w->color = BLACK;
        x->parent->color = RED;
        rotateRight (x->parent);
        w = x->parent->left;
      }
      if (w->right->color == BLACK && w->left->color == BLACK)
      {
        w->color = RED;
        x = x->parent;
      }
      else
      {
        if (w->left->color == BLACK)
        {
          w->right->color = BLACK;
          w->color = RED;
          rotateLeft (w);
          w = x->parent->left;
        }
        w->color = x->parent->color;
        x->parent->color = BLACK;
        w->left->color = BLACK;
        rotateRight (x->parent);
        x = root;
      }
    }
  }
  x->color = BLACK;
}

template <class T>
void RBTree<T>::deleteNode(RBTreeNode<T> *z)
{
  RBTreeNode<T> *x, *y;
  if (!z || z == NIL)
    return;
  if (z->left == NIL || z->right == NIL)
    y = z;
  else
  {
    y = z->right;
    while (y->left != NIL)
      y = y->left;
  }
  if (y->left != NIL)
    x = y->left;
  else
    x = y->right;
  x->parent = y->parent;
  if (y->parent)
    if (y == y->parent->left)
      y->parent->left = x;
    else
      y->parent->right = x;
  else
    root = x;
  if (y != z)
    z->data = y->data;
  if (y->color == BLACK)
    deleteFixup (x);
  delete y;
}

template <class T>
RBTreeNode<T>* RBTree<T>::findNode(T& data)
{
  RBTreeNode<T> *current = root;
  while(current != NIL)
    if(compEQ(data, current->data))
      return (current);
    else
      current = compLT (data, current->data) ? current->left : current->right;
  return(0);
}

template <class T>
RBTreeNode<T>* RBTree<T>::GetRoot()
{
  return root;
}

template <class T>
void RBTree<T>::FreeTreeNode(RBTreeNode<T> *p)
{
  delete p;
}   

template <class T>
void RBTree<T>::DeleteTree(RBTreeNode<T> *t)
{
  if (t != NIL)
  {
    DeleteTree(t->Left());
    DeleteTree(t->Right());
    FreeTreeNode(t);
  }
}

template <class T>
void RBTree<T>::ClearTree(RBTreeNode<T> *t)
{
  DeleteTree(t);
  t = NIL;
  root = NIL;
}

