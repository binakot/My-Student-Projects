const int MaxStackSize = 100;

template <class T>
class Stack
{
    private:
        T stacklist[MaxStackSize];
        int top;
    public:
        // �����������; �������������� �������
        Stack(void);
        // �������� ����������� �����
        void Push(const T& item);
        T Pop(void);
        void ClearStack(void);
        // ������ � �����
        T Peek(void) const;
       // ������ �������� ��������� �����
       int StackEmpty(void) const;
       int StackFull(void) const; // ��� ����������, ���������� �� �������
};

//������������� ������� �����
template <class T>
Stack<T>::Stack (void) : top(-1)
{ }

// ��������� ������� � ����
template <class T>
void Stack<T>::Push (const T& item)
{
   // ���� ���� ������, ��������� ���������� ���������
   if (top ==  MaxStackSize-1)
   {
      exit(1);
   }
   // ��������� ������ top � ���������� item � ������ stacklist
   top++;
   stacklist[top] = item;
}

// ����� ������� �� �����
template <class T>
T Stack<T>::Pop (void)
{
  T temp;
  // ���� ����, ��������� ���������
  if (top == -1)
  {
    exit(1);
  }
  // ������� ������� � ������� �����
  temp = stacklist[top];   
  // ��������� top � ���������� �������� �� ������� �����
  top--;
  return temp;
}

// ���������� ������ � ������� �����
template <class T>
T Stack<T>::Peek (void) const
{
    // ���� ���� ����, ��������� ���������
    if (top == -1)
   {   
       exit(l);
    }
    return stacklist[top];
}

// ������������ ����� �� ������� � ��� ������
template <class T>
int Stack<T>::StackEmpty(void) const
{
   return top == -1;
}

// ��������, �� ���������� �� ����
template <class T>
int Stack<T>::StackFull(void) const
{
   return top == MaxStackSize-1;
}

// ������� ��� �������� �� �����
template <class T>
void Stack<T>::ClearStack(void)
{
    top = -1;
}
