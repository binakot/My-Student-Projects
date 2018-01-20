using System;
using System.Collections.Generic;
using System.Text;

namespace Cryptography
{
    public class CharactersClass
    {
        public string ASCII = string.Empty;
        public static string alphabet = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмнопрстуфхцчшщъыьэюя";

        public CharactersClass()
        {
            ASCII = GetASCII();
        }

        /// <summary>
        /// Возвращет строку содержащую все символы ASCII таблицы
        /// </summary>
        /// <returns>Строка ASCII символов</returns>
        private string GetASCII()
        {
            string resStr = string.Empty;
            int shift = 33;

            for (int i = 0; i < 256 - shift; i++)
            {
                resStr += Convert.ToChar(i + shift);
            }

            byte[] resByte = new byte[256 - shift];

            for (int i = 0; i < 256 - shift; i++)
            {                
                resByte[i] = Convert.ToByte(resStr[i]);
            }

            return Encoding.Default.GetString(resByte);
        }
    }
}
