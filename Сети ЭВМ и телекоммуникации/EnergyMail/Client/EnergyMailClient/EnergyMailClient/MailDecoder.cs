using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;

namespace EnergyMailClient
{
    public static class MailDecoder  // Класс декодирования строк
    { 
        // Общая функция декодировки
        public static string DecodeEncodedString(string mimeString)
        {
            var regex = new Regex(@"=\?(?<charset>.*?)\?(?<encoding>[qQbB])\?(?<value>.*?)\?=");  // Создаем регулярное выражения для считывания MIME-строки
            var encodedString = mimeString;  // Входящая кодированная строка
            var decodedString = string.Empty;  // Исходящая декодированная строка
            while (encodedString.Length > 0)  // Полходим строку посимвольно
            {
                var match = regex.Match(encodedString);  // Находим регулярное выражение, которое указывает на кодировку строки
                if (match.Success)  // если найдено, то декодируем
                {
                    decodedString += encodedString.Substring(0, match.Index);  // Получаем подстроку с кодировкой
                    var charset = match.Groups["charset"].Value;  // Кодировка символов
                    var encoding = match.Groups["encoding"].Value.ToUpper();  // Способ кодировки
                    var value = match.Groups["value"].Value;
                    if (encoding.Equals("B"))  // Если с помощью Base64
                    {                        
                        var bytes = Convert.FromBase64String(value);  // Получаем массив байт из строки base64
                        decodedString += Encoding.GetEncoding(charset).GetString(bytes);  // И раскодируем строку
                    }
                    else if (encoding.Equals("Q"))  // Если с помощью quoted printable
                    {                        
                        var regx = new Regex("(\\=([0-9A-F][0-9A-F]))", RegexOptions.IgnoreCase);  // Игнориуем вспомогательные символы
                        decodedString += regx.Replace(value, new MatchEvaluator(delegate(Match m)
                        {
                            // Алгоритм декодировки из строк quoted printable
                            byte[] bytes = new byte[m.Value.Length / 3];
                            for (int i = 0; i < bytes.Length; i++)
                            {
                                string hex = m.Value.Substring(i * 3 + 1, 2);
                                int iHex = Convert.ToInt32(hex, 16);
                                bytes[i] = Convert.ToByte(iHex);
                            }
                            return Encoding.GetEncoding(charset).GetString(bytes);  // Возвращаем декодированную строку
                        }));
                        decodedString = decodedString.Replace('_', ' ');  // Заменяем '_' на ' '
                    }
                    else // Если способ кодировки не указан
                    {                        
                        decodedString += encodedString;
                        break;
                    }                    
                    encodedString = encodedString.Substring(match.Index + match.Length);
                }
                else  // Если не найдено, строка не требует декодировки
                {                    
                    decodedString += encodedString;
                    break;
                }
            }
            return decodedString;
        }
    }
}
