// BinSTree ������� �� TreeNode
template <class T>
class BinSTree;

// ���������� ������� ��� ���� ��������� ������
template <class T>
class TreeNode
{
  private:
    // ��������� ������ � ������� �������� �����
    TreeNode<T> *left;
    TreeNode<T> *right;
    T data;
  public:
    // �����������
    TreeNode (const T& item, TreeNode<T> *lptr = NULL, TreeNode<T> *rptr = NULL);
    // ������ ������� � ����� ����������
    TreeNode<T>* Left(void);
    TreeNode<T>* Right(void);
    T GetData(void) const;
    void SetData(const T& item);
    // ������� ����� BinSTree �������������, ��������� ���������
    // ������ � ����� left � right
    friend class BinSTree<T>;
};

// ����������� �������������� ���� ������ � ����������
// �������� NULL ������������� ������� ���������
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
