const int MaxStackSize = 100;

template <class T>
class Stack
{
    private:
        T stacklist[MaxStackSize];
        int top;
    public:
        // конструктор; инициализирует вершину
        Stack(void);
        // операции модификации стека
        void Push(const T item);
        T Pop(void);
        void ClearStack(void);
        // доступ к стеку
        T Peek(void) const;
       // методы проверки состояния стека
       int StackEmpty(void) const;
       int StackFull(void) const; // для реализации, основанной на массиве
};

//инициализация вершины стека
template <class T>
Stack<T>::Stack (void) : top(-1)
{ }

// поместить элемент в стек
template <class T>
void Stack<T>::Push (const T item)
{
   // если стек полный, завершить выполнение программы
   if (top ==  MaxStackSize-1)
  {
      exit(1);
   }
   // увеличить индекс top и копировать item в массив stacklist
   top++;
   stacklist[top] = item;
}

// взять элемент из стека
template <class T>
T Stack<T>::Pop (void)
{
   T temp;

  // стек пуст, завершить программу
  if (top == -1)
  {
    exit(1);
  }

  // считать элемент в вершине стека
  temp = stacklist[top];

  // уменьшить top и возвратить значение из вершины стека
  top--;
  return temp;
}

// возвратить данные в вершине стека
template <class T>
T Stack<T>::Peek (void) const
{
    // если стек пуст, завершить программу
    if (top == -1)
   {    
       exit(l);
    }
    return stacklist[top];
}

// тестирование стека на наличие в нем данных
template <class T>
int Stack<T>::StackEmpty(void) const
{
   return top == -1;
}

// проверка, не переполнен ли стек
template <class T>
int Stack<T>::StackFull(void) const
{
   return top == MaxStackSize-1;
}

// удалить все элементы из стека
template <class T>
void Stack<T>::ClearStack(void)
{
    top = -1;
}
