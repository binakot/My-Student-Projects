using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            Exceptions MyExceptions = new Exceptions();
            Array a = Array.CreateInstance(typeof(Int32), 10);               
            int[] myLengthsArray = new int[2] { MyExceptions.DefSize, MyExceptions.DefSize };
            Array b = Array.CreateInstance(typeof(Int32), myLengthsArray);
            Random rand = new Random();
            UInt32 i, j, k;
            Int32 n;

            do
            {
                Console.Clear();
                Console.WriteLine("Введите n :");
                Int32.TryParse(Console.ReadLine(), out n);
            } while (MyExceptions.GetUInt(n) != true);

            Console.WriteLine("--------------------");

            for (k = 0; k < 10; k++)
            {
                a.SetValue(rand.Next(10), k);                
                Console.Write(" " + a.GetValue(k));
            }

            Console.WriteLine();
            Console.WriteLine("--------------------");
            
            for (i = 0; i < n; i++)
            {
                for (j = 0; j < n; j++)
                {
                    b.SetValue(rand.Next(10), i, j);                  
                }
            }            

            for (i = 0; i < n; i++)
            {
                for (j = 0; j < n; j++)
                {
                    if (j == n-1) Console.WriteLine(" " + b.GetValue(i,j));
                    else Console.Write(" " + b.GetValue(i, j));
                }
            }

            Console.WriteLine("--------------------");

            for (i = 0; i < n; i++)
            {
                for (j = 0; j < n; j++)
                {
                    for (k = 0; k < 10; k++) 
                    {
                        if ((i+j) % 2 == 0)
                        {
                            if (Convert.ToInt32(a.GetValue(k)) == Convert.ToInt32(b.GetValue(i, j))) 
                            {
                                b.SetValue(0, i, j);                                
                            }
                        }
                    }
                }
            }

            for (i = 0; i < n; i++)
            {
                for (j = 0; j < n; j++)
                {
                    if (j == n - 1) Console.WriteLine(" " + b.GetValue(i, j));
                    else Console.Write(" " + b.GetValue(i, j));
                }
            }

            Console.ReadKey();
        }
    }
}