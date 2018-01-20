template <class T>
class Iterator
{
  protected:
    // ������, ������������, ������ �� �������� ����� ������.
    // ������ �������������� ������������ ��������
    int iterationComplete;
  public:
    // �����������
    Iterator(void);
    // ������������ ������ ���������
    virtual void Next(void) = 0;
    virtual void Reset(void) = 0;
    // ������ ��� �������/����������� ������
    virtual T& Data(void) = 0;
    // �������� ����� ������
    virtual int EndOfList(void) const;
};

// �����������, ������������� iterationComplete � 0 (False)
template <class T>
Iterator<T>::Iterator(void): iterationComplete(0)
{}

template <class T>
int Iterator<T>::EndOfList(void) const
{
  return iterationComplete;
}

