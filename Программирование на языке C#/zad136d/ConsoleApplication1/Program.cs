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
            Int32 n, Select;
            UInt32 i;
            double Result = 0.0, cur;
            
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
                        double.TryParse(Console.ReadLine(), out cur);
                    } while (MyExceptions.GetDouble(cur) != true);
                    list.Add(cur);
                    i++;
                    Result += list.Last() * list.Last();  
                } while (i < n);                
            }
            else
            {
                Random rand = new Random();
                for (i = 0; i < n; i++)
                {
                    list.Add(Convert.ToDouble(rand.Next(-100, 100)) / 10);
                    Console.WriteLine(list.Last());
                    Result += list.Last() * list.Last();
                }
            }
            Console.WriteLine();

            Console.WriteLine("Результат = " + Result);
            Console.ReadKey();
        }
    }
}
