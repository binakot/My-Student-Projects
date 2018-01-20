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
            int[] myLengthsArray = new int[2] { MyExceptions.DefSize, MyExceptions.DefSize };           
            Array a = Array.CreateInstance(typeof(Int32), myLengthsArray);
            UInt32 i, j;
            Int32 n;
            
            do
            {
                Console.Clear();
                Console.WriteLine("Введите n :");
                Int32.TryParse(Console.ReadLine(),out n);               
            } while (MyExceptions.GetUInt(n) != true);

            Console.WriteLine();
            for (i=1; i<=2*n; i++) {
                for (j=1; j<=2*n; j++) {
                    if ((i <= n) & (j <= n)) a.SetValue(1, i, j);
                    else if ((i <= n) & (j > n)) a.SetValue(2, i, j);
                    else if ((i > n) & (j <= n)) a.SetValue(3, i, j);
                    else a.SetValue(4, i, j);
                }
            }

            for (i=1; i<=2*n; i++) {
                for (j=1; j<=2*n; j++) {
                    if (j==2*n) Console.WriteLine(" " + a.GetValue(i, j));
                    else Console.Write(" " + a.GetValue(i, j));
                }
            }
            
            Console.ReadKey();
        }
    }
}