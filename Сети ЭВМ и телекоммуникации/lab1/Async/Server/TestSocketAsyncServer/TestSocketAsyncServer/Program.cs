using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TestSocketAsyncServer
{
    class Program
    {
        static void Main(string[] args)
        {
            Int32 Port = 12345;  // Указываем порт для прослушивания
            Server srv = new Server();  // Создаем сервер
            srv.Start(Port);  // Запускаем сервер
            Console.WriteLine("Сервер прослушивает порт {0}, нажмите любую клавишу для отключения сервера...", Port);
            Console.ReadKey();
            srv.Stop();
        }
    }
}
