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
            int k = 0, count = 0;            
            char symbol;
            string path = @"H:\Temp\f.txt";

            if (File.Exists(path))
            {
                using (StreamReader sr = new StreamReader(path))
                {
                    while (!sr.EndOfStream)
                    {
                        symbol = Convert.ToChar(sr.Read());
                        if (symbol != ' ')
                        {
                            count++;
                            if (sr.EndOfStream)
                            {
                                k++;
                            }
                        }
                        else
                        {
                            if ((count < 20) & (count != 0))
                            {
                                k++;
                                count = 0;
                            }
                        }
                    }
                }
                Console.WriteLine(k);
            }
            else
                Console.WriteLine("Файла не существует");
            
            Console.ReadKey();
        }
    }
}

