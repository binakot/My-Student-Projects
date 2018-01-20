using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {  
            Exceptions MyExceptions = new Exceptions();
            Int32 n;
            UInt32 i;
            string path = @"H:\Temp\g.txt";

            do
            {
                Console.Clear();
                Console.WriteLine("Введите n :");
                Int32.TryParse(Console.ReadLine(), out n);
            } while (MyExceptions.GetUInt(n) != true);

            FileStream fs = File.Create(path);
            fs.Close();
                           
            using (StreamWriter sw = new StreamWriter(path))
            {
                for (i = 1; i <= n; i++)
                {
                    sw.Write(i + " ");
                }

                sw.Close();

            }

            
            Console.ReadKey();
        }
    }
}
