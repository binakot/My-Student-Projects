/// <summary>
/// Алгоритм Виженера матричный
/// <summary>

using System;
using System.Collections.Generic;
using System.Text;

namespace Cryptography
{
    public class Vigenere
    {
        private char[,] table = new char[256, 256];

        public Vigenere(string alphabet)
        {
            CreateTable(alphabet);
        }

        /// <summary>
        /// Шифрование методом Виженера
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
            int indexkey = -1;

            string stralpha = CharactersClass.alphabet;
            string[] stralphatab = null;
            
            stralphatab = new string[stralpha.Length];
            int ialphalen = stralpha.Length;
            stralphatab[0] = stralpha;

            for (int i = 1; i < ialphalen; i++)
            {
                string firstcar = stralphatab[i - 1].Substring(0, 1);
                string stralphatabtmp = stralphatab[i - 1].Substring(1, stralphatab[i - 1].Length - 1);
                stralphatab[i] = stralphatabtmp + firstcar;
            }

            for (int i = 0; i < input.Length; i++)
            {
                string strcharsrc = input.Substring(i, 1);
                int indexcharsrcinalpha = stralpha.IndexOf(strcharsrc);

                indexkey++; 
                if (indexkey > key.Length - 1) 
                    indexkey = 0;

                string strkeytouse = key.Substring(indexkey, 1);
                int indexkeyinalpha = stralpha.IndexOf(strkeytouse);
                int indexcarinalphatab = indexkeyinalpha;
                string strchardest = stralphatab[indexkeyinalpha].Substring(indexcharsrcinalpha, 1);                            
                result += strchardest;
            }   

            log += "Результат шифрования: \r\n" +
                    result + "\r\n";

            return result;
        }

        /// <summary>
        /// Дешифрование методом Виженера
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
            int indexkey = -1;

            string stralpha = CharactersClass.alphabet;
            string[] stralphatab = null;           

            stralphatab = new string[stralpha.Length];
            int ialphalen = stralpha.Length;
            stralphatab[0] = stralpha;

            for (int i = 1; i < ialphalen; i++)
            {
                string firstcar = stralphatab[i - 1].Substring(0, 1);
                string stralphatabtmp = stralphatab[i - 1].Substring(1, stralphatab[i - 1].Length - 1);
                stralphatab[i] = stralphatabtmp + firstcar;
            }

            for (int i = 0; i < input.Length; i++)
            {
                indexkey++; 
                if (indexkey > key.Length - 1) 
                    indexkey = 0;

                string strcharsrc = input.Substring(i, 1);
                string strcharofindexkey = key.Substring(indexkey, 1);
                int indexkeycharinalpha = stralpha.IndexOf(strcharofindexkey);
                int indexofcharscrinalphatab = stralphatab[indexkeycharinalpha].IndexOf(strcharsrc);
                string strchardest = stralpha.Substring(indexofcharscrinalphatab, 1);
                result += strchardest;
            }           

            log += "Результат дешифрования: \r\n" +
                  result + "\r\n";

            return result;
        }

        private char GetChar(int yp, int xp)
        {  
            for (int i = 0; i < table.GetLength(0); i++)
            {
                if (yp == table[i, 0])
                {
                    for (int j = 0; j < table.GetLength(1); j++)
                    {
                        if (xp == table[0, j])
                            return table[i, j];
                    }
                }
            }

            return '♥';
        }

        private void CreateTable(string alphabet)
        {
            int shift = 0;

            for (int i = 0; i < alphabet.Length; i++)
            {
                for (int j = 0; j < alphabet.Length; j++)
                {
                    shift = j + i;

                    if (shift >= alphabet.Length)
                        shift = shift % alphabet.Length;

                    table[i, j] = alphabet[shift];
                }
            }
        }
    }
}
