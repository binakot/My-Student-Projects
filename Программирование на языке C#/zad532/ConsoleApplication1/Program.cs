using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections.Generic;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            Exceptions MyExceptions = new Exceptions();
            List<double> list = new List<double>();              
            int i = 0, n, Select;
            double cur;
            bool check = true;

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
                Console.WriteLine("a[" + (i + 1) + "] = ");
                double.TryParse(Console.ReadLine(), out cur);
                list.Add(cur);
                i++; 
                do
                {
                    do
                    {
                        Console.WriteLine("a[" + (i + 1) + "] = ");
                        double.TryParse(Console.ReadLine(), out cur);
                    } while (MyExceptions.GetDouble(cur) != true);                    
                    if (cur < list.Last())
                    {
                        check = false;
                    }
                    list.Add(cur);
                    i++;
                } while (i < n);
            }
            else
            {
                Random rand = new Random();
                cur = Convert.ToDouble(rand.Next(-100, 100)) / 10;
                list.Add(cur);
                Console.WriteLine("a[" + (i + 1) + "] = " + cur);
                for (i = 1; i < n; i++)
                {
                    list.Add(Convert.ToDouble(rand.Next(-100, 100)) / 10);
                    if (cur > list.Last())
                    {
                        check = false;
                    }
                    cur = list.Last();
                    Console.WriteLine("a[" + (i + 1) + "] = " + cur);
                }
            }
            Console.WriteLine();

            if (!check)
            {
                list.Reverse();
            }
            Console.WriteLine(string.Join(" ", list.ToArray().Select(x => x.ToString()).ToArray())); 

            Console.ReadKey();
        }
    }
}
