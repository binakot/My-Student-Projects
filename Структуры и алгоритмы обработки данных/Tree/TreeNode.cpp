// BinSTree зависит от TreeNode
template <class T>
class BinSTree;

// объявление объекта для узла бинарного дерева
template <class T>
class TreeNode
{
  private:
    // указатели левого и правого дочерних узлов
    TreeNode<T> *left;
    TreeNode<T> *right;
    T data;
  public:
    // конструктор
    TreeNode (const T& item, TreeNode<T> *lptr = NULL, TreeNode<T> *rptr = NULL);
    // методы доступа к полям указателей
    TreeNode<T>* Left(void);
    TreeNode<T>* Right(void);
    T GetData(void) const;
    void SetData(const T& item);
    // сделать класс BinSTree дружественным, поскольку необходим
    // доступ к полям left и right
    friend class BinSTree<T>;
};

// конструктор инициализирует поля данных и указателей
// значение NULL соответствует пустому поддереву
template <class T>
TreeNode<T>::TreeNode(const T& item, TreeNode<T> *lptr, TreeNode<T> *rptr) :
  data(item), left(lptr), right(rptr)
  {}
  
template <class T>
TreeNode<T>* TreeNode<T>::Left(void)
{
  return left;
}

template <class T>
TreeNode<T>* TreeNode<T>::Right(void)
{
  return right;
}

template <class T>
T TreeNode<T>::GetData(void) const
{
  return data;
}

template <class T>
void TreeNode<T>::SetData(const T& item)
{
  data = item;
}
