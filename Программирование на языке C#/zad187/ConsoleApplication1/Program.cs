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
                        Console.WriteLine("a[" + (i + 1) + "] = ");
                        double.TryParse(Console.ReadLine(), out a[i]);
                    } while (MyExceptions.GetDouble(a[i]) != true);
                    i++;
                } while (i < n);
            }
            else
            {
                Random rand = new Random();
                for (i = 0; i < n; i++)
                {
                    a[i] = Convert.ToDouble(rand.Next(-100, 100)) / 10;
                    Console.WriteLine("a[" + (i + 1) + "] = " + a[i]);
                }
            }
            Console.WriteLine();
            
            for (i = 0; i < n; i++)
            {
                if (a[i] < 0) a[i] += 0.5;
                else a[i] = 0.1;
                Console.WriteLine("a[" + (i + 1) + "] = " + a[i]);
            }
            
            Console.ReadKey();
        }
    }
}
