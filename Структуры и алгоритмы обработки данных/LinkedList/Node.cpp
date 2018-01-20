template <class T>
class Node
{
  private:
    Node<T> *next;   // next указывает на адрес следующего узла
    T data;   // открытые данные
  public:
    Node(const T& item, Node<T>* ptrnext);   // конструктор
    Node<T> *NextNode(void) const;   // получение адреса следующего узла
    T& Data (void); 
};

// конструктор, инициализация данных и указателя
template <class T>
Node<T>::Node(const T& item, Node<T>* ptrnext = NULL) :
  data(item), next(ptrnext)
  {}

// возвратить закрытый член next
template <class T>
Node<T> *Node<T>::NextNode(void) const
{
  return next;
}

// возвратить ссылку на данные текущего узла
template <class T>
T& Node<T>::Data (void)
{ 
  return data;
}

