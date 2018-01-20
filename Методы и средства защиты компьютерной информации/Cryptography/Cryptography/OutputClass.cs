using System;
using System.Collections.Generic;
using System.Text;

namespace Cryptography
{
    public static class OutputClass
    {
        /// <summary>
        /// Создает файл и записывает в него переданную строку.
        /// Если файл уже существует, то файл очищается и в него записывается строка.
        /// </summary>
        /// <param name="str">Строка для записи в файл</param>
        /// <param name="fpath">Полный путь к файлу</param>
        public static void WriteToFile(string str, string fpath)
        {
            using (System.IO.StreamWriter file = new System.IO.StreamWriter(fpath, false, Encoding.ASCII))
            {
                file.WriteLine(str);
            }
        }
    }
}
