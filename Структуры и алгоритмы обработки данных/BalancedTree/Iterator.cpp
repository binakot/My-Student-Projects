template <class T>
class Iterator
{
  protected:
    // флажок, показывающий, достиг ли итератор конца списка.
    // должен поддерживаться производными классами
    int iterationComplete;
  public:
    // конструктор
    Iterator(void);
    // обязательные методы итератора
    virtual void Next(void) = 0;
    virtual void Reset(void) = 0;
    // методы для выборки/модификации данных
    virtual T& Data(void) = 0;
    // проверка конца списка
    virtual int EndOfList(void) const;
};

// конструктор, устанавливает iterationComplete в 0 (False)
template <class T>
Iterator<T>::Iterator(void): iterationComplete(0)
{}

template <class T>
int Iterator<T>::EndOfList(void) const
{
  return iterationComplete;
}

