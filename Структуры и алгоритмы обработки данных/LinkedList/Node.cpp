template <class T>
class Node
{
  private:
    Node<T> *next;   // next ��������� �� ����� ���������� ����
    T data;   // �������� ������
  public:
    Node(const T& item, Node<T>* ptrnext);   // �����������
    Node<T> *NextNode(void) const;   // ��������� ������ ���������� ����
    T& Data (void); 
};

// �����������, ������������� ������ � ���������
template <class T>
Node<T>::Node(const T& item, Node<T>* ptrnext = NULL) :
  data(item), next(ptrnext)
  {}

// ���������� �������� ���� next
template <class T>
Node<T> *Node<T>::NextNode(void) const
{
  return next;
}

// ���������� ������ �� ������ �������� ����
template <class T>
T& Node<T>::Data (void)
{ 
  return data;
}

