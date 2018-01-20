using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Cryptography
{
    public class Gamma
    {
        private string PI = "1415926535897932384626433832795";

        public Gamma()
        {

        }

        /// <summary>
        /// Шифрование методом гаммирования
        /// </summary>
        /// <param name="input">Входные данные</param>
        /// <param name="key">Ключ шифрования</param>        
        /// <returns>Зашифрованная строка</returns>
        public string Encode(string input, string key, out string log)
        {
            log = "Шифрование:\r\n   Исходные данные: " + input + "\r\n" +
                  "   Ключ: " + key + "\r\n" +
                  "Размер входных данных:\r\n" +
                  "   Общее количество элементов: " + input.Length.ToString() + "\r\n";

            string result = String.Empty;

            Int32 step = 0;

            for (int i = 0; i < input.Length; i++)
            {
                Int32 a = Convert.ToInt32(input[i]);                
                Int32 b = Convert.ToInt32(key[step]);
                if (i > 0)
                    b = b + Convert.ToByte(PI[input.Length % i]);
                Int32 rez = a ^ b;                

                result += Convert.ToChar(rez);
                step++;
                if (step == key.Length)
                    step = 0;
            }            

            log += "Результат шифрования: \r\n" +
                    result + "\r\n";

            return result;
        }

        /// <summary>
        /// Дешифрование методом гаммирования
        /// </summary>
        /// <param name="input">Входные данные</param>
        /// <param name="key">Ключ дешифрования</param>        
        /// <returns>Дешифрованная строка</returns>
        public string Decode(string input, string key, out string log)
        {
            log = "Дешифрование:\r\n   Исходные данные: " + input + "\r\n" +
                  "   Ключ: " + key + "\r\n" +
                  "Размерность таблицы:\r\n" +
                  "   Общее количество элементов: " + input.Length.ToString() + "\r\n";

            string result = String.Empty;

            Int32 step = 0;

            for (int i = 0; i < input.Length; i++)
            {
                Int32 a = Convert.ToInt32(input[i]);                                
                Int32 b = Convert.ToInt32(key[step]);
                if (i > 0)
                    b = b + Convert.ToByte(PI[input.Length % i]);
                Int32 rez = a ^ b;                

                result += Convert.ToChar(rez);
                step++;
                if (step == key.Length)
                    step = 0;
            }            

            log += "Результат дешифрования: \r\n" +
                  result + "\r\n";

            return result;
        }
    }
}
