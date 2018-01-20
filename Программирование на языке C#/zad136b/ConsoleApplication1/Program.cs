using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            Exceptions MyExceptions = new Exceptions();
            double[] a = new double[MyExceptions.DefSize];            
            double Result = 1.0, cur;
            Int32 i, n, Select;
            
            do
            {
                Console.Clear();
                Console.WriteLine("Введите n :"); 
                Int32.TryParse(Console.ReadLine(), out n);
            } while (MyExceptions.GetUInt(n) != true);
            Console.WriteLine();

            Console.WriteLine("Способ ввода:");
            Console.WriteLine("1. Ручной");
            Console.WriteLine("2. Автоматический");
            do
            {                
                Int32.TryParse(Console.ReadLine(), out Select);
            } while (MyExceptions.GetSelect2(Select) != true);
            Console.WriteLine();

            if (Select == 1)
            {
                i = 0;
                do
                {
                    do
                    {                      
                        Console.WriteLine("a[" + (i+1) + "] = ");
                        Double.TryParse(Console.ReadLine(), out cur);
                    } while (MyExceptions.GetDouble(cur) != true);
                    a[i] = cur;
                    i++;
                } while (i < n);
            }
            else
            {
                Random rand = new Random();
                for (i = 0; i < n; i++)
                {
                    a[i] = Convert.ToDouble(rand.Next(-100, 100)) / 10;
                    Console.WriteLine("a[" + (i+1) + "] = " + a[i]);
                } 
            }
                         
            for (i = 0; i < n; i++)
            {
                Result = Result * a[i];
            }
            Console.WriteLine();

            Console.WriteLine("Результат = " + Result);
            Console.ReadKey();
        }
    }
}
