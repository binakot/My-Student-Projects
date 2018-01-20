using System;
using System.Collections.Generic;
using System.Collections;
using System.Text;
using System.Net;
using System.Net.Sockets;
using System.Net.Security;
using System.IO;
using System.Windows.Forms;
using System.Threading;

namespace EnergyMailClient
{
    public delegate void ClientCommandEventHandler(object sender, string command);
    public delegate void ServerResponseEventHandler(object sender, string response);
    public delegate void DataReceivingEventHandler(object sender);

    public class Pop3Client
    {
        // Данные
        private string pop3ServerAddress;  // Адрес сервера
        private int pop3ServerPort;  // Порт сервера
        private string userName;  // Логин
        private string password;  // Пароль
        private string from;  // От кого
        private string to;  // Кому
        private string subject;  // Тема
        private string date;  // Дата
        private string mimeVersion;  // MIME-версия
        private int totalEmails;  // Количество сообщений
        private int totalEmailSize;  // Общий размер сообщений
        private string errorMessage;  // Сообщение об ошибке
        private int receiveTimeOut;  // Время ожидания
        private ArrayList boundry;  // Разделители
        private ArrayList mailType;  // Типы писем        
        private ArrayList mailSections;  // Разделы сообщений

        private Socket tcp_Socket;  // Сокет
        private NetworkStream networkStream;  // Поток данных        
        private string command;  // Команда

        // События        
        public event ConnectEventHandler ConnectionEstablishing;        
        public event ConnectEventHandler ConnectionEstablished;        
        public event DisconnectEventHandler Disconnected;       
        public event AuthenticateEventHandler AuthenticationBegan;        
        public event AuthenticateEventHandler AuthenticationFinished;        
        public event ClientCommandEventHandler SendedCommand;        
        public event ServerResponseEventHandler ServerResponse;       
        public event DataReceivingEventHandler StartedDataReceiving;       
        public event DataReceivingEventHandler EndedDataReceiving;

        // Конструктор
        public Pop3Client()
        {
            this.pop3ServerAddress = "";
            this.pop3ServerPort = 110;
            this.userName = "";
            this.password = "";
            this.from = "";
            this.to = "";           
            this.subject = "";
            this.date = "";
            this.mimeVersion = "";
            this.totalEmails = 0;
            this.totalEmailSize = 0;
            this.receiveTimeOut = 10;  // Время ожидания ответа от сервера
            this.errorMessage = "";
            this.boundry = new ArrayList();
            this.mailType = new ArrayList();            
            this.mailSections = new ArrayList();
            this.command = "";
        }

        // Описание событий
        private void RaiseConnectionEstablishing(string popServer, int popPort)
        {
            if (ConnectionEstablishing != null)
            {
                ConnectionEstablishing(this, popServer, popPort);
            }
        }

        private void RaiseConnectionEstablished(string popServer, int popPort)
        {
            if (ConnectionEstablished != null)
            {
                ConnectionEstablished(this, popServer, popPort);
            }
        }

        private void RaiseDisconnected(string popServer)
        {
            if (Disconnected != null)
            {
                Disconnected(this, popServer);
            }
        }

        private void RaiseAuthenticationBegan(string userName)
        {
            if (AuthenticationBegan != null)
            {
                AuthenticationBegan(this, userName);
            }
        }

        private void RaiseAuthenticationFinished(string userName)
        {
            if (AuthenticationFinished != null)
            {
                AuthenticationFinished(this, userName);
            }
        }

        private void RaiseSendedCommand(string command)
        {
            if (SendedCommand != null)
            {
                SendedCommand(this, command);
            }
        }

        private void RaiseServerResponse(string response)
        {
            if (ServerResponse != null)
            {
                ServerResponse(this, response);
            }
        }

        private void RaiseStartedDataReceiving()
        {
            if (StartedDataReceiving != null)
            {
                StartedDataReceiving(this);
            }
        }

        private void RaiseEndedDataReceiving()
        {
            if (EndedDataReceiving != null)
            {
                EndedDataReceiving(this);
            }
        }

        // Свойства
        public string Pop3Server
        {
            get
            {
                return this.pop3ServerAddress;
            }
            set
            {
                this.pop3ServerAddress = value;
            }
        }

        public int Pop3Port
        {
            get
            {
                return this.pop3ServerPort;
            }
            set
            {
                this.pop3ServerPort = value;
            }
        }

        public string UserName
        {
            get
            {
                return this.userName;
            }
            set
            {
                this.userName = value;
            }
        }

        public string Password
        {
            get
            {
                return this.password;
            }
            set
            {
                this.password = value;
            }
        }

        public string From
        {
            get
            {
                return this.from;
            }
        }

        public string To
        {
            get
            {
                return this.to;
            }
        }
        
        public string Subject
        {
            get
            {
                return this.subject;
            }
        }

        public string Date
        {
            get
            {
                return this.date;
            }
        }

        public string MimeVersion
        {
            get
            {
                return this.mimeVersion;
            }
        }

        public int TotalEmails
        {
            get
            {
                return this.totalEmails;
            }
        }

        public int TotalEmailSize
        {
            get
            {
                return this.totalEmailSize;
            }
        }

        public int ReceiveTimeOut
        {
            get
            {
                return this.receiveTimeOut;
            }
            set
            {
                this.receiveTimeOut = value;
            }
        }

        public string ErrorMessage
        {
            get
            {
                return this.errorMessage;
            }
        }

        public int MailSections
        {
            get
            {
                return this.mailSections.Count;
            }
        }

        // Методы
        // Подключение к серверу
        public void Connect()
        {
            string message = "";  // Сообщение серверу
            string response = "";  // Ответ от сервера
            this.tcp_Socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);  // Соединение с сервером
            IPAddress[] ip_Addresses;  // IP-адрес

            try
            {
                ip_Addresses = Dns.GetHostAddresses(this.Pop3Server);  // Проверяем существование сервера
            }
            catch (Exception)
            {
                this.errorMessage = "Pop-сервер " + this.Pop3Server + " не существует.";
                MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            IPEndPoint remote_EndPoint = new IPEndPoint(ip_Addresses[0], this.Pop3Port);  // Точка соединения с сервером           
            this.RaiseConnectionEstablishing(this.pop3ServerAddress, this.pop3ServerPort);

            try
            {
                this.tcp_Socket.Connect((EndPoint)remote_EndPoint);  // Устанавливаем соединение
            }
            catch
            {
                this.errorMessage = "Невозможно подключиться к Pop-серверу: " + this.pop3ServerAddress + ", по порту " + this.pop3ServerPort + ".";
                MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            this.networkStream = new NetworkStream(this.tcp_Socket);            

            response = this.GetResponseFromStream();
            if (!response.Substring(0, 3).Equals("+ok", StringComparison.OrdinalIgnoreCase))
            {
                this.errorMessage = "Сервер " + this.pop3ServerAddress + " не отправил приветственное сообщение.";
                this.Disconnect();  // Отключаемся
                MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            
            this.RaiseConnectionEstablished(this.pop3ServerAddress, this.pop3ServerPort);

            // Отправляем логин
            this.command = "USER";
            message = this.command + " " + this.userName + "\r\n";  
            Thread.Sleep(2000);  // Делаем паузу перед отправкой сообщения
            
            this.RaiseAuthenticationBegan(this.userName);
            this.WriteMessageToStream(message);  // Отправляем команду

            response = this.GetResponseFromStream();  // Получаем ответ от сервера
            if (!response.Substring(0, 3).Equals("+ok", StringComparison.OrdinalIgnoreCase))  // Если сервер не ответил положительно
            {
                this.errorMessage = response;
                this.Disconnect();  // Отключаемся
                MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            // Отправляем пароль
            this.command = "PASS";
            message = this.command + " " + this.password + "\r\n";            
            this.WriteMessageToStream(message);
            response = this.GetResponseFromStream();
            if (!response.Substring(0, 3).Equals("+ok", StringComparison.OrdinalIgnoreCase))
            {
                this.errorMessage = response;
                this.Disconnect();
                MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            
            this.RaiseAuthenticationFinished(this.userName);
            return;
        }

        // Подключение с параметрами
        public void Connect(string server, int port, string user_name, string password)
        {
            this.pop3ServerAddress = server;
            this.pop3ServerPort = port;
            this.userName = user_name;
            this.password = password;
            this.Connect();
        }

        // Завершаем соединение
        public void Disconnect()
        {
            if (this.tcp_Socket != null && this.networkStream != null)  // Если соединение установлено и возможна передача данных
            {
                string message = "";  // Сообщение серверу
                string response = "";  // Ответ сервера
                this.command = "QUIT";
                message = this.command + "\r\n";                
                this.WriteMessageToStream(message);
                response = this.GetResponseFromStream();
                try
                {
                    if (!response.Substring(0, 3).Equals("+ok", StringComparison.OrdinalIgnoreCase))
                    {
                        this.errorMessage = response;
                        MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        return;
                    }
                }
                catch
                {                    
                    MessageBox.Show("Введенные вами логин и/или пароль не верны!", "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                if (this.tcp_Socket.Connected)  // Если соединение есть, то
                {
                    this.tcp_Socket.Close();  // Завершаем его

                }
                
                // Обнуляем Сокет и Стрим
                this.tcp_Socket = null;
                this.networkStream = null;                
                
                this.RaiseDisconnected(this.pop3ServerAddress);
                return;
            }
            else
            {
                this.errorMessage = "Соединение с Pop-сервером не установлено.";                
            }
        }

        // Получение информации о количестве сообщений и их размере
        public void GetAllMailInfo()
        {
            if (this.tcp_Socket != null && this.networkStream != null)  // Если соединение установлено и возможна передача данных
            {
                string message = "";  // Сообщение серверу
                string response = "";  // Ответ от сервера
                this.command = "STAT";
                message = this.command + "\r\n";                
                this.WriteMessageToStream(message);  // Отправляем команду
                response = this.GetResponseFromStream();  // Получаем ответ
                if (!response.Substring(0, 3).Equals("+ok", StringComparison.OrdinalIgnoreCase))
                {
                    this.errorMessage = response;
                    MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                // Формат ответа от сервера на команду STAT: +OK n m, где n - кол-во сообшений, m - размер в байтах
                // Разбиваем ответ на части с помощью индексов
                int indexFirstSpace = response.IndexOf(" ", 3);
                int indexSecondSpace = response.IndexOf(" ", indexFirstSpace + 1);
                int indexLineTermination = response.IndexOf("\r\n", indexSecondSpace + 1);

                if (indexFirstSpace == -1 || indexSecondSpace == -1 || indexLineTermination == -1)
                {
                    this.errorMessage = "Сервер вернул неверный ответ на команду STAT.";
                    MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                else
                {
                    this.totalEmails = Convert.ToInt32(response.Substring(indexFirstSpace + 1, indexSecondSpace - (indexFirstSpace + 1)));
                    this.totalEmailSize = Convert.ToInt32(response.Substring(indexSecondSpace + 1, indexLineTermination - (indexSecondSpace + 1)));
                    return;
                }
            }
            else
            {
                this.errorMessage = "Нет соединения с Pop-сервером.";
                MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
        }

        // Получение размера отдельного сообщения
        public int GetMailSize(int message_id)
        {
            if (this.tcp_Socket != null && this.networkStream != null)  // Если соединение установлено и возможна передача данных
            {
                if (message_id >= 1 && message_id <= this.totalEmails)  // Если есть хоть одно сообщение и индекс указанного сообщения корректен
                {
                    string message = ""; // Сообщение серверу
                    string response = "";  // Ответ от сервера
                    this.command = "LIST";
                    message = this.command + " " + message_id + "\r\n";                    
                    this.WriteMessageToStream(message);
                    response = this.GetResponseFromStream();
                    if (!response.Substring(0, 3).Equals("+ok", StringComparison.OrdinalIgnoreCase))
                    {
                        this.errorMessage = response;
                        MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        return 0;
                    }

                    // Формат ответа от сервера на команду LIST: +OK n m, где n - номер сообшения, m - размер в байтах
                    // Разбиваем ответ на части с помощью индексов
                    int indexFirstSpace = response.IndexOf(" ", 3);
                    int indexSecondSpace = response.IndexOf(" ", indexFirstSpace + 1);
                    int indexLineTermination = response.IndexOf("\r\n", indexSecondSpace + 1);

                    if (indexFirstSpace == -1 || indexSecondSpace == -1 || indexLineTermination == -1)
                    {
                        this.errorMessage = "Сервер вернул неверный ответ на команду LIST.";
                        MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        return 0;
                    }
                    else
                    {
                        int mail_size = Convert.ToInt32(response.Substring(indexSecondSpace + 1, indexLineTermination - (indexSecondSpace + 1)));
                        return mail_size;
                    }
                }
                else
                {
                    this.errorMessage = "Номер сообщения не корректен.";
                    MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return 0;
                }
            }
            else
            {
                this.errorMessage = "Нет соединения с Pop-сервером.";
                MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return 0;
            }
        }

        // Удаление сообщения
        public void DeleteEmail(int message_id)
        {
            if (this.tcp_Socket != null && this.networkStream != null)  // Если соединение установлено и возможна передача данных
            {
                if (message_id >= 1 && message_id <= this.totalEmails)  // Если есть хоть одно сообщение и индекс указанного сообщения корректен
                {
                    string message = "";
                    string response = "";
                    this.command = "DELE";
                    message = this.command + " " + message_id + "\r\n";                    
                    this.WriteMessageToStream(message);
                    response = this.GetResponseFromStream();
                    if (!response.Substring(0, 3).Equals("+ok", StringComparison.OrdinalIgnoreCase))
                    {
                        this.errorMessage = response;
                        MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        return;
                    }
                    return;
                }
                else
                {
                    this.errorMessage = "Номер сообщения не корректен.";
                    MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
            }
            else
            {
                this.errorMessage = "Нет соединения с Pop-сервером.";
                MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
        }

        // Снять метки удаления с ссообщений
        public void ResetServer()
        {
            if (this.tcp_Socket != null && this.networkStream != null)  // Если соединение установлено и возможна передача данных
            {
                string message = "";
                string response = "";
                this.command = "RSET";
                message = this.command + "\r\n";                
                this.WriteMessageToStream(message);
                response = this.GetResponseFromStream();
                if (!response.Substring(0, 3).Equals("+ok", StringComparison.OrdinalIgnoreCase))
                {
                    this.errorMessage = response;
                    MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                return;
            }
            else
            {
                this.errorMessage = "Нет соединения с Pop-сервером.";
                MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
        }

        // Получить текст сообщения
        public string FetchEmail(int message_id)
        {
            if (this.tcp_Socket != null && this.networkStream != null)  // Если соединение установлено и возможна передача данных
            {
                if (message_id >= 1 && message_id <= this.totalEmails)  // Если есть хоть одно сообщение и индекс указанного сообщения корректен
                {
                    string message = "";
                    string response = "";
                    string email = "";

                    this.command = "RETR";
                    message = this.command + " " + message_id + "\r\n";                    
                    
                    this.RaiseStartedDataReceiving();
                    this.WriteMessageToStream(message);
                    response = this.GetResponseFromStream();
                    int index = response.IndexOf("\r\n");
                    email = response.Substring(index + 2, response.Length - (index + 2)).Replace("\0", "");
                    this.ParseEmail(email);                    
                    this.RaiseEndedDataReceiving();

                    return email;
                }
                else
                {
                    this.errorMessage = "Номер сообщения не корректен.";
                    MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return "";
                }
            }
            else
            {
                this.errorMessage = "Нет соединения с Pop-сервером.";
                MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return "";
            }
        }

        // Получить заголок и указанное количество строк из тела сообщения
        public string FetchEmailTop(int message_id, int lines_fetch_from_top)
        {
            if (this.tcp_Socket != null && this.networkStream != null)  // Если соединение установлено и возможна передача данных
            {
                if (message_id >= 1 && message_id <= this.totalEmails)  // Если есть хоть одно сообщение и индекс указанного сообщения корректен
                {
                    string message = "";
                    string response = "";
                    string email = "";

                    message = "TOP " + message_id + " " + lines_fetch_from_top + "\r\n";
                    this.command = "TOP";
                    
                    this.WriteMessageToStream(message);
                    response = this.GetResponseFromStream();
                    int index = response.IndexOf("\r\n");
                    email = response.Substring(index + 2, response.Length - (index + 2)).Replace("\0", "");
                    this.ParseEmailForHeader(email);
                    
                    return email;
                }
                else
                {
                    this.errorMessage = "Номер сообщения не корректен.";
                    MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return "";
                }
            }
            else
            {
                this.errorMessage = "Нет соединения с Pop-сервером.";
                MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return "";
            }
        }

        // Получить тело сообщения
        public void GetMailSection(int mail_section, ref string body, ref string type, ref string file_name)
        {
            if (mail_section >= 1 || mail_section <= this.mailSections.Count)
            {
                body = this.mailSections[mail_section - 1].ToString();                
                type = this.mailType[mail_section - 1].ToString();                
            }
            else
            {
                this.errorMessage = "Раздел почты не действителен.";                
                MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
        }        

        // Обработка сообщения для вывода
        private void ParseEmail(string email)
        {
            string emailInLowerCase = email.ToLower();
            int index_mime = 0;
            int index_Termination = 0;
            this.from = "";
            this.to = "";            
            this.subject = "";
            this.date = "";
            this.mimeVersion = "";
            this.boundry.Clear();
            this.mailType.Clear();            
            this.mailSections.Clear();

            // Отправитель
            index_mime = emailInLowerCase.IndexOf("from: ", 0);
            if (index_mime != -1)
            {
                index_Termination = email.IndexOf("\r\n", index_mime + 5);
                this.from = email.Substring(index_mime + 5, index_Termination - (index_mime + 5)).Trim();
                this.from = MailDecoder.DecodeEncodedString(this.from);                
            }

            // Получатель
            index_mime = emailInLowerCase.IndexOf("to: ", 0);
            if (index_mime != -1)
            {
                index_Termination = email.IndexOf("\r\n", index_mime + 3);
                this.to = email.Substring(index_mime + 3, index_Termination - (index_mime + 3)).Trim();
                this.to = MailDecoder.DecodeEncodedString(this.to);                
            }            

            // Тема
            index_mime = emailInLowerCase.IndexOf("subject: ", 0);
            if (index_mime != -1)
            {
                index_Termination = email.IndexOf("\r\n", index_mime + 8);
                this.subject = email.Substring(index_mime + 8, index_Termination - (index_mime + 8)).Trim();
                this.subject = MailDecoder.DecodeEncodedString(this.subject);                
            }

            // Дата
            index_mime = emailInLowerCase.IndexOf("date: ", 0);
            if (index_mime != -1)
            {
                index_Termination = email.IndexOf("\r\n", index_mime + 5);
                this.date = email.Substring(index_mime + 5, index_Termination - (index_mime + 5)).Trim();
            }

            // MIME-версия
            index_mime = emailInLowerCase.IndexOf("mime-version: ", 0);
            if (index_mime != -1)
            {
                index_Termination = email.IndexOf("\r\n", index_mime + 13);
                this.mimeVersion = email.Substring(index_mime + 13, index_Termination - (index_mime + 13)).Trim();
            }

            // Разделитель частей сообщения
            index_mime = emailInLowerCase.IndexOf("boundary=", 0);
            string temp = "";
            for (; index_mime != -1; index_mime = emailInLowerCase.IndexOf("boundary=", index_Termination + 1))
            {
                index_Termination = emailInLowerCase.IndexOf("\r\n", index_mime + 9);
                temp = email.Substring(index_mime + 9, index_Termination - (index_mime + 9));
                temp = temp.TrimStart(new char[] { '"' });
                temp = temp.TrimEnd(new char[] { '"' });
                this.boundry.Add("--" + temp);
            }

            // Тип содержимого
            index_mime = emailInLowerCase.IndexOf("\r\ncontent-type:", 0);
            string substring = "";
            while (index_mime != -1)
            {
                substring = "";
                index_Termination = emailInLowerCase.IndexOf("\r\n\r\n", index_mime + 15);

                if (index_Termination == -1)
                {
                    break;
                }
                substring = email.Substring(index_mime + 15, index_Termination - (index_mime + 15));

                if (substring.ToLower().IndexOf("text/html", 0) != -1)
                {
                    this.mailType.Add("text/html");                    
                }
                else if (substring.ToLower().IndexOf("base64", 0) != -1)
                {
                    this.mailType.Add("base64");
                    int index1 = substring.ToLower().IndexOf("name=", 0);
                    int index2 = substring.IndexOf("\r\n", index1 + 5);                    
                }
                else if (substring.ToLower().IndexOf("text/plain", 0) != -1)
                {
                    this.mailType.Add("text/plain");                    
                }
                else
                {
                    this.mailType.Add("");                   
                }

                index_Termination += 4;
                int index = emailInLowerCase.IndexOf("\r\ncontent-type:", index_Termination);
                if (index != -1)
                {
                    substring = email.Substring(index_Termination, index - index_Termination);
                }
                else
                {
                    substring = email.Substring(index_Termination);
                }

                this.mailSections.Add(substring);

                if (index != -1)
                {
                    index_mime = index;
                }
                else
                {
                    index_mime = -1;
                }
            }

            if (this.boundry.Count > 0)
            {
                for (int i = 0; i < this.boundry.Count; i++)
                {
                    for (int j = 0; j < this.mailSections.Count; j++)
                    {
                        index_mime = this.mailSections[j].ToString().IndexOf(this.boundry[i].ToString(), 0);

                        if (index_mime != -1)
                        {
                            if (index_mime != 0)
                            {
                                this.mailSections[j] = this.mailSections[j].ToString().Substring(0, index_mime - 1);
                            }
                            else
                            {
                                this.mailSections[j] = "";
                            }
                        }
                    }
                }
            }
        }

        // Обработка сообщения для вывода списка сообщений
        private void ParseEmailForHeader(string email)
        {
            this.from = "";
            this.subject = "";
            this.date = "";

            string emailInLowerCase = email.ToLower();
            int index_mime = 0;
            int index_Termination = 0;
            
            // Отправитель
            index_mime = emailInLowerCase.IndexOf("from: ", 0);
            if (index_mime != -1)
            {
                index_Termination = email.IndexOf("\r\n", index_mime + 5);
                this.from = email.Substring(index_mime + 5, index_Termination - (index_mime + 5)).Trim();
                this.from = MailDecoder.DecodeEncodedString(this.from);
            }

            // Тема
            index_mime = emailInLowerCase.IndexOf("subject: ", 0);
            if (index_mime != -1)
            {
                index_Termination = email.IndexOf("\r\n", index_mime + 8);
                this.subject = email.Substring(index_mime + 8, index_Termination - (index_mime + 8)).Trim();
                this.subject = MailDecoder.DecodeEncodedString(this.subject);
            }

            // Дата
            index_mime = emailInLowerCase.IndexOf("date: ", 0);
            if (index_mime != -1)
            {
                index_Termination = email.IndexOf("\r\n", index_mime + 5);
                this.date = email.Substring(index_mime + 5, index_Termination - (index_mime + 5)).Trim();
            }
        }

        // Получение ответа от сервера
        private string GetResponseFromStream()
        {
            DateTime startDateTime = DateTime.Now;  // Текущее время
            TimeSpan timeSpan = DateTime.Now - startDateTime;  // Интервал времени          
            string server_response = "";
            byte[] inputBuffer = new byte[1024];  // Буфер
            int readBytes = 0;

            while (timeSpan.Seconds < this.receiveTimeOut)
            {
                if (this.networkStream.DataAvailable)
                {
                    do
                    {
                        readBytes = this.networkStream.Read(inputBuffer, 0, inputBuffer.Length);

                        if (readBytes == 0)
                        {
                            break;
                        }
                        
                        server_response += Encoding.Default.GetString(inputBuffer, 0, readBytes);
                        if (this.command != "TOP" && this.command != "RETR")
                        {
                            if (server_response.IndexOf("\r\n") != -1)
                            {
                                break;
                            }
                        }
                        else
                        {
                            if (server_response.IndexOf("\r\n.\r\n") != -1)
                            {
                                break;
                            }
                        }

                    } while (readBytes != 0);

                    break;
                }
                else
                {
                    timeSpan = DateTime.Now - startDateTime;
                }
            }
            
            this.RaiseServerResponse(server_response);
            return server_response;
        }

        // Отправка команд серверу
        private void WriteMessageToStream(string msg)
        {              
            byte[] outputBuffer = Encoding.Default.GetBytes(msg);
            this.networkStream.Write(outputBuffer, 0, outputBuffer.Length);            
            this.RaiseSendedCommand(this.command);
        }        
    }
}
