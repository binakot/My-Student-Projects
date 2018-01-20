using System;

class GList<T>
{
    T[] array;

    public GList()
    {
        array = new T[0];
    }

    public T GetLast()
    {
        return array[array.Length-1];
    }

    public void Add(T item)
    {
        T[] b = new T[array.Length];
        for (int i = 0; i < array.Length; i++)
            b[i] = array[i];
        array = new T[array.Length + 1];
        for (int i = 0; i < b.Length; i++)
            array[i] = b[i];
        array[array.Length - 1] = item;
    }

    public void AddRange(T[] items)
    {
        for (int i = 0; i < items.Length; i++)
            Add(items[i]);
    }

    public T[] ToArray()
    {
        return array;
    }

    public T this[int index]
    {
        get
        {
            return array[index];
        }
        set
        {
            array[index] = value;
        }
    }

    public void Remove(int pos)
    {
        T[] buf = new T[array.Length];

        for (int i = 0; i < buf.Length; i++)
            buf[i] = array[i];

        array = new T[buf.Length - 1];

        for (int i = 0; i < pos; i++)
            array[i] = buf[i];

        for (int i = pos; i < buf.Length - 1; i++)
            array[i] = buf[i + 1];
    }

    public void Clear()
    {
        array = new T[0];
    }

    public int Count
    {
        get
        {
            return array.Length;
        }
    }

    public void Sort()
    {
        System.Array.Sort(array);
    }

    public void Reverse()
    {
        System.Array.Reverse(array);
    }
}