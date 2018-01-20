using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using System.Net.Sockets;

namespace TestSocketAsyncServer
{
    class Server  // Класс сервера
    {
        private Socket Sock;  // Сокет
        private SocketAsyncEventArgs AcceptAsyncArgs;  // данные для асинхронной операции на сокете

        public Server()  // Конструктор
        {
            Sock = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);  // Инициализируем сокет
            AcceptAsyncArgs = new SocketAsyncEventArgs();  // Инициализируем данные 
            AcceptAsyncArgs.Completed += AcceptCompleted;  // Указываем собыите, возникающее при завершении авинхронной операции
        }

        private void AcceptCompleted(object sender, SocketAsyncEventArgs e)
        {
            if (e.SocketError == SocketError.Success)  // Если соединение успешно
            {
                ClientConnection Client = new ClientConnection(e.AcceptSocket);  // Создаем новое подключения клиента
            }
            e.AcceptSocket = null;  // Присваиваем сокету Null, чтобы при следующем подключении создался новый сокет
            AcceptAsync(AcceptAsyncArgs);  // И заново начинаем асинхронную операцию
        }

        private void AcceptAsync(SocketAsyncEventArgs e)  // Асинхронная функция
        {
            bool willRaiseEvent = Sock.AcceptAsync(e);  // Созвращается false, если асинхронная операциия в состоянии ожидания 
                                                        // и true, если операция завершена синхронно
            if (!willRaiseEvent)
                AcceptCompleted(Sock, e);  // Если операция в состоянии ожидания, вызываем обработчик вручную
        }

        public void Start(int Port)  // Запуск сервера
        {
            Sock.Bind(new IPEndPoint(IPAddress.Any,Port));  // биндим сокет к любому IP и конкретному порту
            Sock.Listen(10);  // Прослушиваем соединение, указываем максимальное число подключений
            AcceptAsync(AcceptAsyncArgs);  // Вызываем асинхронную функцию
        }
        public void Stop()  // Остановка сервера
        {
            Sock.Close();  // Закрываем сокет
        }

    }
}
