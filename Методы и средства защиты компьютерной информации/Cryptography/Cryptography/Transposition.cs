/// <summary>
/// Метод простых перестановок по ключу
/// <summary>

using System;
using System.Collections.Generic;
using System.Text;

namespace Cryptography
{
    public class Transposition
    {    
        public Transposition()
        {
            
        }

        /// <summary>
        /// Шифрование методом перестановок
        /// </summary>
        /// <param name="input">Входные данные</param>
        /// <param name="key">Ключ шифрования</param>
        /// <returns>Зашифрованная строка</returns>
        public string Encode(string input, string key, out string log)
        {            
            int columnCount, rowCount;
            GetTableSize(input.Length, out columnCount, out rowCount);
            char[,] table = new char[rowCount, columnCount];

            log = "Шифрование:\r\n   Исходные данные: " + input + "\r\n" +
                  "   Ключ: " + key + "\r\n" +
                  "Размерность таблицы:\r\n" +
                  "   Общее количество элементов: " + input.Length.ToString() + "\r\n" +
                  "   Ширина (кол-во столбцов): " + columnCount.ToString() + "\r\n" +
                  "   Высота (кол-во строк): " + rowCount.ToString() + "\r\n";

            // Заполняем таблицу по столбцам
            int index = 0;
            for (int i = 0; i < columnCount; i++)
            {
                for (int j = 0; j < rowCount; j++)
                {
                    table[j, i] = input[index];
                    index++;
                }
            }

            // Выводим таблицу
            log += "Таблица:\r\n";

            for (int i = 0; i < rowCount; i++)
            {
                for (int j = 0; j < columnCount; j++)
                {
                    if (j == 0)
                    {
                        log += "   ";
                    }

                    if (j + 1 == columnCount)
                        log += table[i, j].ToString() + "\r\n";
                    else
                        log += table[i, j].ToString() + "   ";
                }
            }

            // Переставляет столбцы по ключу
            ColumnTransposition(key, table);

            // Выводим таблицу с переставленными столбцами
            log += "Таблица после перестановки столбцов по ключу:\r\n";

            for (int i = 0; i < rowCount; i++)
            {
                for (int j = 0; j < columnCount; j++)
                {
                    if (j == 0)
                    {
                        log += "   ";
                    }

                    if (j + 1 == columnCount)
                        log += table[i, j].ToString() + "\r\n";
                    else
                        log += table[i, j].ToString() + "   ";
                }
            }           
 
            // Собираем строку по строкам таблицы
            string result = string.Empty;

            for (int i = 0; i < rowCount; i++)
            {
                for (int j = 0; j < columnCount; j++)
                {
                    result += table[i, j];
                }
            }

            log += "Результат шифрования: \r\n" +
                   result + "\r\n";

            return result;
        }

        /// <summary>
        /// Дешиифрование методом перестановок
        /// </summary>
        /// <param name="input">Входные данные</param>
        /// <param name="key">Ключ дешифрования</param>
        /// <returns>Дешифрованная строка</returns>
        public string Decode(string input, string key, out string log)
        {

            int columnCount, rowCount;
            GetTableSize(input.Length, out columnCount, out rowCount);
            char[,] table = new char[rowCount, columnCount];

            log = "Дешифрование:\r\n   Исходные данные: " + input + "\r\n" +
                  "   Ключ: " + key + "\r\n" +
                  "Размерность таблицы:\r\n" +
                  "   Общее количество элементов: " + input.Length.ToString() + "\r\n" +
                  "   Ширина (кол-во столбцов): " + columnCount.ToString() + "\r\n" +
                  "   Высота (кол-во строк): " + rowCount.ToString() + "\r\n";

            // Заполняем таблицу по строкам
            int index = 0;
            for (int i = 0; i < rowCount; i++)
            {
                for (int j = 0; j < columnCount; j++)
                {
                    table[i, j] = input[index];
                    index++;
                }
            }

            // Выводим таблицу
            log += "Таблица с переставленными столбцами по ключу:\r\n";

            for (int i = 0; i < rowCount; i++)
            {
                for (int j = 0; j < columnCount; j++)
                {
                    if (j == 0)
                    {
                        log += "   ";
                    }

                    if (j + 1 == columnCount)
                        log += table[i, j].ToString() + "\r\n";
                    else
                        log += table[i, j].ToString() + "   ";
                }
            }

            // Возвращаем столбцы на свои места
            ColumnTransposition(key, table);

            // Выводим первоначальную таблицу
            log += "Таблица без перестановки:\r\n";

            for (int i = 0; i < rowCount; i++)
            {
                for (int j = 0; j < columnCount; j++)
                {
                    if (j == 0)
                    {
                        log += "   ";
                    }

                    if (j + 1 == columnCount)
                        log += table[i, j].ToString() + "\r\n";
                    else
                        log += table[i, j].ToString() + "   ";
                }
            }

            // Собираем строку по столбцам таблицы
            string result = string.Empty;

            for (int i = 0; i < columnCount; i++)
            {
                for (int j = 0; j < rowCount; j++)
                {
                    result += table[j, i];
                }
            }

            log += "Результат дешифрования: \r\n" +
                   result + "\r\n";

            return result;
        }

        /// <summary>
        /// Поиск размерности таблицы наиболее близкой к квадрату
        /// </summary>
        /// <param name="count">Число элементов в входных данных</param>
        /// <param name="width">Ширина таблицы (кол-во столбцов)</param>
        /// <param name="height">Высота таблицы (Кол-во строк)</param>
        private void GetTableSize(int count, out int width, out int height)
        {
            int temp = (int)Math.Sqrt(count);

            if (temp == Math.Sqrt(count))
            {
                // Если извлекается целый корень
                width = height = temp;
                return;
            }
            else
            {
                // Если целый корень не извлекается
                float index;

                for (; temp <= count; temp++)
                {
                    for (index = temp; index > 0; index--)
                    {
                        if (count / index == temp)
                        {
                            width = (int)index;
                            height = temp;

                            return;
                        }
                    }
                }                
            }

            width = 0;
            height = 0;
        }   

        /// <summary>
        /// Перестановка столбцов таблицы по ключу
        /// </summary>
        /// <param name="key">Ключ шифрования</param>
        /// <param name="mas">Таблица шифрования</param>
        private void ColumnTransposition(string key, char[,] mas)
        { 
            byte[] keyByte = new byte[key.Length];            

            if (keyByte.Length < mas.GetLength(1))
            {
                // Если ключ короче кол-ва столбцов               
                List<byte> temp = new List<byte>(keyByte);

                int index = 0;
                while (temp.Count < mas.GetLength(1))
                {
                    temp.Add(keyByte[index]);
                    index++;
                    if (index == keyByte.Length)
                        index = 0;                    
                }

                keyByte = new byte[temp.Count];
                keyByte = temp.ToArray();
            }
            else if (keyByte.Length > mas.GetLength(1))
            {
                // Если ключ длиннее кол-ва столбцов
                List<byte> temp = new List<byte>(keyByte);
                                
                while (temp.Count > mas.GetLength(1))
                {
                    temp.RemoveAt(temp.Count - 1);
                }

                keyByte = new byte[temp.Count];
                keyByte = temp.ToArray();
            }

            int k = 0;
            for (int i = 0; i < keyByte.Length; i++)
            {
                keyByte[i] = (byte)key[k];
                k++;
                if (k == key.Length)
                    k = 0;
            }

            for (int i = 0; i < keyByte.Length - 1; i++)
            {
                for (int j = i + 1; j < keyByte.Length; j++)
                {
                    if (keyByte[i] > keyByte[j])
                    {
                        byte temp = keyByte[i];
                        keyByte[i] = keyByte[j];
                        keyByte[j] = temp;

                        ChangeColumn(i, j, mas);
                    }
                }
            }
        }        

        /// <summary>
        /// Перестановка двух столбцов местами
        /// </summary>
        /// <param name="from">Первый столбец для замены</param>
        /// <param name="to">Второй столбец</param>
        /// <param name="mas">Таблица, в которой выполняется замена</param>
        private void ChangeColumn(int from, int to, char[,] mas)
        {
            for (int i = 0; i < mas.GetLength(0); i++)
            {
                char temp = mas[i, from];
                mas[i, from] = mas[i, to];
                mas[i, to] = temp;
            }
        }
    }
}
