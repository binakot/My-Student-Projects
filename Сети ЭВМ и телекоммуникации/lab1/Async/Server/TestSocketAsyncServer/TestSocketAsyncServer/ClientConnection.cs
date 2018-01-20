using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Sockets;

namespace TestSocketAsyncServer
{
    class ClientConnection  // Класс подлючения клиента
    {
        private static int ClientNumber = 0;  // Номер клиента

        private Socket Sock;  // Сокет
        private SocketAsyncEventArgs SockAsyncEventArgs;  // Данные для соединения с клиентом
        private byte[] buff;  // Буфер для приема данных

        public ClientConnection(Socket AcceptedSocket)  // Конструктор
        {
            ClientNumber++;  // Увеличиваем счетчик клиента
            buff = new byte[256];  // Инициализируем буфер
            Sock = AcceptedSocket;  // Сокет для соединения получаем из парематра 
            SockAsyncEventArgs = new SocketAsyncEventArgs(); 
            SockAsyncEventArgs.Completed += SockAsyncEventArgs_Completed;  // Подписываемся на событие 
            SockAsyncEventArgs.SetBuffer(buff, 0, buff.Length);  // Записываем буфер, сдвиг и максимальное количество байтов

            ReceiveAsync(SockAsyncEventArgs);  
        }

        private void SockAsyncEventArgs_Completed(object sender, SocketAsyncEventArgs e) // Отправка или получение данных
        {
            switch (e.LastOperation)  // В зависимости от последней операции
            {
                case SocketAsyncOperation.Receive:  // Либо получаем данные
                    ProcessReceive(e);
                    break;
                case SocketAsyncOperation.Send:  // Либо отправляем
                    ProcessSend(e);
                    break;
            }
        }

        private void ProcessSend(SocketAsyncEventArgs e)  // Отправляем данные клиенту
        {
            if(e.SocketError == SocketError.Success)  // если соединение успешно
                ReceiveAsync(SockAsyncEventArgs);
        }

        private void ProcessReceive(SocketAsyncEventArgs e)
        {
            if (e.SocketError == SocketError.Success)  // если соединение успешно
            {
                string str = Encoding.UTF8.GetString(e.Buffer, 0, e.BytesTransferred);  // Формируем строку
                Console.WriteLine("Сообщение от клиента #{0}: {1}", ClientNumber, str);  // Вывод
                SendAsync(" " + str.ToUpper());  // Отправляем ответ
            }
        }

        private void ReceiveAsync(SocketAsyncEventArgs e)
        {
            bool willRaiseEvent = Sock.ReceiveAsync(e);
            if (!willRaiseEvent)  // Если прием данных завершен синхронно
                ProcessReceive(e);  // Получаем сообщение
        }

        private void SendAsync(string data)
        {
            byte[] buff = Encoding.UTF8.GetBytes(data);  // Буфер
            SocketAsyncEventArgs e = new SocketAsyncEventArgs();
            e.Completed += SockAsyncEventArgs_Completed;
            e.SetBuffer(buff, 0, buff.Length);
            SendAsync(e);  // Вываем функцию отправки ответа
        }  

        private void SendAsync(SocketAsyncEventArgs e)
        {
            bool willRaiseEvent = Sock.SendAsync(e);
            if (!willRaiseEvent) // если прием данных завершен синхронно
                ProcessSend(e);  // Отпраляем ответ
        }


    }
}
