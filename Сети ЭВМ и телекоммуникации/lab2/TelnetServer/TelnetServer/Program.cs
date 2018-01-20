using System;
using System.Net.Sockets;
using System.Net;
using System.IO;
using System.Diagnostics;

namespace TelnetServer
{
    class AsyncRedirect
    {
        // Буфер
        readonly byte[] buf = new byte[4096];
        // Два стрима для чтения и записи
        readonly Stream r, w;
        // Метод для завершения асинхронной операции
        readonly AsyncCallback AsyncCallback_;
        // Конструктор класса
        public AsyncRedirect(Stream Read, Stream Write) 
        { 
            r = Read; 
            w = Write; 
            AsyncCallback_ = this.AsyncCallback; 
        }

        void AsyncCallback(IAsyncResult ar)
        {
            if (!ar.IsCompleted) 
                return;

            int n = 0;

            try 
            { 
                n = r.EndRead(ar); 
            }
            catch (Exception e)
            {
                Console.WriteLine("EndRead failed:{0}", e);
            }

            if (n > 0)
            {
                w.Write(buf, 0, n);
                w.Flush();
                BeginRead();
            }
            else
            {
                Console.WriteLine("read 0 bytes,finished");
                w.Close();
            }
        }

        public IAsyncResult BeginRead()
        {
            return r.BeginRead(buf, 0, buf.Length, AsyncCallback_, null);
        }

        static void Main(string[] args)
        {
            // Перехват cmd.exe
            var psi = new ProcessStartInfo("cmd.exe");
            // Считываем входные и выходные данные из cmd.exe
            psi.RedirectStandardInput = psi.RedirectStandardOutput = true;
            // Запускаем без оболочки
            psi.UseShellExecute = false;
            // Соединение для подключения клиентов
            var tcpListener = new TcpListener(IPAddress.Any, 23);
            // Запускаем
            tcpListener.Start();
            // Цикл обработки
            while (true)
            {
                // Ожидаем подключение
                var tcpClient = tcpListener.AcceptTcpClient();
                // Отправка или получение данных
                var clientStream = tcpClient.GetStream();
                // Запускаем перехват cmd.exe
                var p = Process.Start(psi);
                var Pro = new AsyncRedirect(p.StandardOutput.BaseStream, clientStream);
                var Tcp = new AsyncRedirect(clientStream, p.StandardInput.BaseStream);
                Pro.BeginRead();
                Tcp.BeginRead();
            }
        }
    };
}
