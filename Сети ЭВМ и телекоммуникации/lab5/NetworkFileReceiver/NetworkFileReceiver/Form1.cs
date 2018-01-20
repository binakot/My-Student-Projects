using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Threading;
using System.Net;
using System.Net.Sockets;
using System.IO;

namespace NetworkFileReceiver
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        Thread DownloadThread;  // Поток для получения файла
        int flag = 0;  // Флаг
        string receivedPath = "";  // Путь для сохранения файла
        public delegate void MyDelegate();

        private void Form1_Load(object sender, EventArgs e)
        {
            LogBox.Text = "Для получения файлов запустите сервер\r\n";
        }

        private void Form1_FormClosed(object sender, FormClosedEventArgs e)
        {
            DownloadThread.Abort();            
        }

        private void button1_Click(object sender, EventArgs e)
        {
            LogBox.Text += "Запуск сервера...\r\n";
            DownloadThread = new Thread(new ThreadStart(StartListening));
            DownloadThread.Start();
            LogBox.Text += "Сервер успешно запущен\r\n";
        }

        // Класс для получения файла
        public class StateObject
        {            
            public Socket workSocket = null;  // Сокет для соединения с клиентом
            // Буфер для передачи файла
            public const int BufferSize = 1024;            
            public byte[] buffer = new byte[BufferSize];
        }

        public static ManualResetEvent allDone = new ManualResetEvent(false);  // Событие для потока получения файла

        public void StartListening()
        {
            byte[] bytes = new Byte[1024];  // Буфер
            IPEndPoint ipEnd = new IPEndPoint(IPAddress.Any, Convert.ToInt32(PortBox.Text));  // Ожидаем соединения клиента по порту
            Socket listener = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);  // Прослушиваем порт            

            try
            {
                // Ожидаем передачи данных от клиента
                listener.Bind(ipEnd);
                listener.Listen(100);
                // Цикл получения файла
                while (true)
                {
                    allDone.Reset();  // Поток свободен для приема данных
                    listener.BeginAccept(new AsyncCallback(AcceptCallback), listener);  // Принимаем данные
                    allDone.WaitOne();  // Ожидаем завершение передачи
                }
            }
            catch (Exception ex)
            {
                LogBox.Text += ex.ToString();
            }            
        }

        public void AcceptCallback(IAsyncResult ar)
        {
            allDone.Set();  // Указываем, что поток занят получением данных

            Socket listener = (Socket)ar.AsyncState;
            Socket handler = listener.EndAccept(ar);

            StateObject state = new StateObject();
            state.workSocket = handler;
            handler.BeginReceive(state.buffer, 0, StateObject.BufferSize, 0, new AsyncCallback(ReadCallback), state);  // Начинаем получение данных
            flag = 0;
        }

        public void ReadCallback(IAsyncResult ar)
        {
            int fileNameLen = 1;
            String content = String.Empty;
            StateObject state = (StateObject)ar.AsyncState;
            Socket handler = state.workSocket;
            int bytesRead = handler.EndReceive(ar);  // Считываем данные от клиента

            if (bytesRead > 0)  // Если клиент что-то передает
            {
                if (flag == 0)  // Если передают новый файл, то считываем имя
                {
                    fileNameLen = BitConverter.ToInt32(state.buffer, 0);
                    string fileName = Encoding.UTF8.GetString(state.buffer, 4, fileNameLen);
                    receivedPath = PathBox.Text + fileName;
                    flag++;
                }

                if (flag >= 1)  // Если передают очередную часть файла, то считываем ее
                {
                    BinaryWriter writer = new BinaryWriter(File.Open(receivedPath, FileMode.Append));
                    if (flag == 1)  // Если это первая часть файла, то считываем байты сразу после имени файла
                    {
                        writer.Write(state.buffer, 4 + fileNameLen, bytesRead - (4 + fileNameLen));
                        flag++;
                    }
                    else  // Иначе просто читаем очередную порцию данных
                        writer.Write(state.buffer, 0, bytesRead);
                    
                    writer.Close();  // Закрываем поток
                    handler.BeginReceive(state.buffer, 0, StateObject.BufferSize, 0, new AsyncCallback(ReadCallback), state);  // Продолжаем читать
                }
            }
            else
            {
                Invoke(new MyDelegate(LabelWriter));
            }
        }

        public void LabelWriter()
        {
            LogBox.Text += "Передача файла успешно завершена";
        }  
    }
}
