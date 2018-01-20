using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IteratorPattern
{
    class Program
    {
        static void Main(string[] args)
        {
            Stack<int> stack = new Stack<int>();  // Стек целый чисел
            
            // Заполняем числами по порядку
            for (int number = 0; number <= 9; number++)
            {
                stack.Push(number);
            }
            
            // Выводим числа простым извлечением без итератора
            foreach (int number in stack)
            {
                Console.Write("{0} ", number);
            }
            Console.WriteLine();           

            // Выводим числа с помощью итератора в прямом порядке
            foreach (int number in stack.TopToBottom)
            {
                Console.Write("{0} ", number);
            }
            Console.WriteLine();            

            // Выводим числа с помощью итератора в обратном порядке
            foreach (int number in stack.BottomToTop)
            {
                Console.Write("{0} ", number);
            }
            Console.WriteLine();            

            // Выводим числа с помощью итератора до определенной глубины
            foreach (int number in stack.TopN(7))
            {
                Console.Write("{0} ", number);
            }
            Console.WriteLine();            

            Console.ReadKey();
        }
    }

    // Итератор стека
    public class Stack<T> : IEnumerable<T>
    {
        private T[] values = new T[100];
        private int top = 0;

        public void Push(T t)
        {
            values[top] = t;
            top++;
        }
        public T Pop()
        {
            top--;
            return values[top];
        }
        
        public IEnumerator<T> GetEnumerator()
        {
            for (int index = top - 1; index >= 0; index--)
            {
                yield return values[index];
            }
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return GetEnumerator();
        }

        public IEnumerable<T> TopToBottom
        {
            get { return this; }
        }

        public IEnumerable<T> BottomToTop
        {
            get
            {
                for (int index = 0; index <= top - 1; index++)
                {
                    yield return values[index];
                }
            }
        }

        public IEnumerable<T> TopN(int itemsFromTop)
        {            
            int startIndex = itemsFromTop >= top ? 0 : top - itemsFromTop;

            for (int index = top - 1; index >= startIndex; index--)
            {
                yield return values[index];
            }
        }
    }
}
