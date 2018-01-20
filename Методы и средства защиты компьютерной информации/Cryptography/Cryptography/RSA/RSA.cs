using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Cryptography
{
    public class RSA
    {
        public RSA()
        {

        }

        public string Encode(string input, out string key1, out string key2, out string log, out int TS)
        {
            log = "Шифрование:\r\n   Исходные данные: " + input + "\r\n" +                  
                  "Размер входных данных:\r\n" +
                  "   Общее количество элементов: " + input.Length.ToString() + "\r\n";

            string result = String.Empty;
            int TotalSum = 0;

            RSAClass rsa = new RSAClass();
            result = rsa.encode(input, out TotalSum);
            key1 = rsa.GetNKey().ToString();
            key2 = rsa.GetDKey().ToString();

            log += "Числовые переменные:\r\n" +
                   "p = " + rsa.p + "\r\n" +
                   "q = " + rsa.q + "\r\n" +
                   "n = " + rsa.n + "\r\n" +
                   "phi = " + rsa.phi + "\r\n" +
                   "e = " + rsa.e + "\r\n" +
                   "d = " + rsa.d + "\r\n" +
                   "Контрольная сумма = " + TotalSum + "\r\n";

            TS = TotalSum;

            log += "Результат шифрования: \r\n" +
                  result + "\r\n";

            return result;
        }

        public string Decode(string input, string key1, string key2, out string log, out int TS)
        {
            log = "Дешифрование:\r\n   Исходные данные: " + input + "\r\n" +
                  "   Ключи: " + key1 + " и "  + key2 + "\r\n" +
                  "Размерность таблицы:\r\n" +
                  "   Общее количество элементов: " + input.Length.ToString() + "\r\n";

            string result = String.Empty;
            int TotalSum = 0;

            RSAClass rsa = new RSAClass();
            result = rsa.decode(input, key1, key2, out TotalSum);

            log += "Контрольная сумма = " + TotalSum + "\r\n";

            TS = TotalSum;

            log += "Результат дешифрования: \r\n" +
                  result + "\r\n";

            return result;
        }    
    }
}
