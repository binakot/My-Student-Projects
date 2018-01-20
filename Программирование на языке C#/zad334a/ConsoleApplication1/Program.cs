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
            uint i, j;
            double Result = 0;
                        
            for (i = 1; i <= 100; i++) {
                for (j = 1; j <= 50; j++) {
                    Result += 1.0 / (i + j * j);
                }
            }

            Console.WriteLine("Результат = " + Result);
            Console.ReadKey();
        }
    }
}
