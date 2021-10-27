using System;
using System.Collections.Generic;
using System.Text;

namespace MinimalisticTelnet
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                //Создает Telnet-соединение по IP:Port
                TelnetConnection tc = new TelnetConnection("46.172.182.72", 23);

                //Указываем логин, пароль и время ожидания
                string s = tc.Login(" ", " ", 100);

                // Строка ответа должна заканчиватсья на "$" или ">", иначе соединение неудачно
                string prompt = s.TrimEnd();
                prompt = s.Substring(prompt.Length - 1, 1);
                if (prompt != "$" && prompt != ">")
                    throw new Exception("Connection failed");

                Console.WriteLine("OMG! TelNet Connection is success! U can do everything! Hahahaha: ");

                prompt = "";

                // Цикл обработки
                while (tc.IsConnected && prompt.Trim() != "exit")
                {
                    // Вывод ответа сервера
                    Console.Write(tc.Read());

                    // Отправляем серверу команду
                    prompt = Console.ReadLine();
                    tc.WriteLine(prompt);

                    // Вывод ответа сервера
                    Console.Write(tc.Read());
                }

                Console.WriteLine("Disconnected");
                Console.ReadLine();
            }
            catch (Exception exception)
            {
                Console.WriteLine(exception.ToString());
            }
            finally
            {
                Console.ReadKey();
            }
        }
    }
}
