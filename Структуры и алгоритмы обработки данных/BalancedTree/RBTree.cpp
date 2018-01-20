#define compLT(a,b) (a < b)
#define compRT(a,b) (a > b)
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
    void deleteFixup(RBTreeNode<T> *x);
    RBTreeNode<T>* insertNode(T& data);
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
  while (x != root && x->parent->GetColor() == 'r')
  {
    if (x->parent == x->parent->parent->left)
    {
      RBTreeNode<T> *y = x->parent->parent->right;
      if (y->GetColor() == 'r')
      {
        x->parent->SetBlack();
        y->SetBlack();
        x->parent->parent->SetRed();
        x = x->parent->parent;
      }
      else
      {
        if (x == x->parent->right)
        {
          x = x->parent;
          rotateLeft(x);
        }
        x->parent->SetBlack();
        x->parent->parent->SetRed();
        rotateRight(x->parent->parent);
      }
    }
    else
    {
      RBTreeNode<T> *y = x->parent->parent->left;
      if (y->GetColor() == 'r')
      {
        x->parent->SetBlack();
        y->SetBlack();
        x->parent->parent->SetRed();
        x = x->parent->parent;
      }
      else
      {
        if (x == x->parent->left)
        {
          x = x->parent;
          rotateRight(x);
        }
        x->parent->SetBlack();
        x->parent->parent->SetRed();
        rotateLeft(x->parent->parent);
      }
    }
  }
  root->SetBlack();
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
  x->SetRed();
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
RBTreeNode<T>* RBTree<T>::findNode(T& data)
{
  RBTreeNode<T> *current = root;
  while(current != NIL)
    if (current->right->data > current->left->data)
      if(compEQ(data, current->data))
        return (current);
      else
        current = compLT (data, current->data) ? current->left : current->right;
    else
      if(compEQ(data, current->data))
        return (current);
      else
        current = compRT (data, current->data) ? current->left : current->right;
  return(0);
}

template <class T>
void RBTree<T>::deleteFixup(RBTreeNode<T> *x)
{
  while (x != root && x->GetColor() == 'b')
  {
    if (x == x->parent->left)
    {
      RBTreeNode<T> *w = x->parent->right;
      if (w->GetColor() == 'r')
      {
        w->SetBlack();
        x->parent->SetRed();
        rotateLeft (x->parent);
        w = x->parent->right;
      }
      if (w->left->GetColor() == 'b' && w->right->GetColor() == 'b')
      {
        w->SetRed();
        x = x->parent;
      }
      else
      {
        if (w->right->GetColor() == 'b')
        {
          w->left->SetBlack();
          w->SetRed();
          rotateRight (w);
          w = x->parent->right;
        }
        if (x->parent->GetColor() == 'b')
          w->SetBlack();
        else
          w->SetRed();
        x->parent->SetBlack();
        w->right->SetBlack();
        rotateLeft (x->parent);
        x = root;
      }
    }
    else
    {
      RBTreeNode<T> *w = x->parent->left;
      if (w->GetColor() == 'r')
      {
        w->SetBlack();
        x->parent->SetRed();
        rotateRight (x->parent);
        w = x->parent->left;
      }
      if (w->right->GetColor() == 'b' && w->left->GetColor() == 'b')
      {
        w->SetRed();
        x = x->parent;
      }
      else
      {
        if (w->left->GetColor() == 'b')
        {
          w->right->SetBlack();
          w->SetRed();
          rotateLeft (w);
          w = x->parent->left;
        }
        if (x->parent->GetColor() == 'b')
          w->SetBlack();
        else
          w->SetRed();
        x->parent->SetBlack();
        w->left->SetBlack();
        rotateRight (x->parent);
        x = root;
      }
    }
  }
  x->SetBlack();
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
  if (y->GetColor() == 'b')
    deleteFixup (x);
  delete y;
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

