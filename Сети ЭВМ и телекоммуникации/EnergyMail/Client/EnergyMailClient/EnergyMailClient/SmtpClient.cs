using System;
using System.Collections.Generic;
using System.Text;
using System.Net;
using System.Net.Sockets;
using System.IO;
using System.Windows.Forms;

namespace EnergyMailClient
{
    public delegate void ConnectEventHandler(object sender, string Server, int Port);
    public delegate void AuthenticateEventHandler(object sender, string userName);
    public delegate void DisconnectEventHandler(object sender, string Server);
    public delegate void DataTransferEventHandler(object sender);

    public class SmtpClient
    {        
        // Данные
        private string smtpServer; // Адрес сервера
        private int smtpPort;  // Порт сервера
        private MailMessage mailMessage;  // Сообщение
        private int timeOut;  // Время ожидания
        private string userName;  // Имя пользователя
        private string password;  // Пароль
        private string errorMessage;  // Сообщение об ошибке
        
        private Socket tcp_Socket;  // Сокет для соединения
        private NetworkStream networkStream;  // Поток данных         

        //События        
        public event ConnectEventHandler ConnectionEstablishing;        
        public event ConnectEventHandler ConnectionEstablished;      
        public event DisconnectEventHandler Disconnected;    
        public event AuthenticateEventHandler AuthenticationBegan;        
        public event AuthenticateEventHandler AuthenticationFinished;        
        public event DataTransferEventHandler StartedDataTransfer;   
        public event DataTransferEventHandler EndedDataTransfer;
        
        // Конструкторы
        public SmtpClient(string server, int port)
        {
            this.smtpServer = server;
            this.smtpPort = port;
            this.timeOut = 10;  // Время ожидание на получение ответа от сервера
            this.userName = "";
            this.password = "";
            this.errorMessage = "";
        }

        // Описание событий
        private void RaiseConnectionEstablishing(string smtpServer, int smtpPort)
        {
            if (ConnectionEstablishing != null)
            {
                ConnectionEstablishing(this, smtpServer, smtpPort);
            }
        }

        private void RaiseConnectionEstablished(string smtpServer, int smtpPort)
        {
            if (ConnectionEstablished != null)
            {
                ConnectionEstablished(this, smtpServer, smtpPort);
            }
        }

        private void RaiseDisconnected(string smtpServer)
        {
            if (Disconnected != null)
            {
                Disconnected(this, smtpServer);
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

        private void RaiseStartedDataTransfer()
        {
            if (StartedDataTransfer != null)
            {
                StartedDataTransfer(this);
            }
        }

        private void RaiseEndedDataTransfer()
        {
            if (EndedDataTransfer != null)
            {
                EndedDataTransfer(this);
            }
        }
        
        // Свойства
        public string SmtpServer
        {
            get
            {
                return this.smtpServer;
            }
            set
            {
                this.smtpServer = value;
            }
        }

        public int SmtpPort
        {
            get
            {
                return this.smtpPort;
            }
            set
            {
                this.smtpPort = value;
            }
        }

        public int TimeOut
        {
            get
            {
                return this.timeOut;
            }
            set
            {
                this.timeOut = value;
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

        // Методы
        // Отправка сообщения
        public int SendMail(MailMessage mailMessage)
        {        
            this.mailMessage = mailMessage;  // Наше сообщение

            this.tcp_Socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);  // соединение с сервером
            IPAddress[] ip_Addresses;  // IP-адрес

            try
            {
                ip_Addresses = Dns.GetHostAddresses(this.smtpServer);  // Проверяем существование нашего сервера по его DNS-имени
            }
            catch (Exception)
            {
                this.errorMessage = "Smtp-сервер " + this.smtpServer.ToString() + " не существует.";
                MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);                
                return 0;
            }

            IPEndPoint remote_EndPoint = new IPEndPoint(ip_Addresses[0], this.SmtpPort);  // Создаем точку подключения
            this.RaiseConnectionEstablishing(this.smtpServer, this.smtpPort);

            try
            {
                tcp_Socket.Connect((EndPoint)remote_EndPoint);  // Пытаемся соединиться к серверу
            }
            catch
            {
                this.errorMessage = "Невозможно подключиться к Smtp-серверу: " + this.smtpServer + ", по порту " + this.smtpPort + ".";
                MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return 0;
            }

            this.networkStream = new NetworkStream(this.tcp_Socket);  // Передача данных между сервером и клиентом
            byte[] buffer;  // Буфер
            string responseText = "";  // Ответы сервера            
            string message = "";  // Сообщение            
            ASCIIEncoding encoding = new ASCIIEncoding();  // Кодировка отправляемых строк

            if (this.WaitForResponse("220", ref responseText) == false)
            {
                // Сервер не ответил 220
                this.errorMessage = "Не получено приветственное сообщение от Smtp-сервера: " + this.smtpServer + ".\r\nСервер ответил: " + responseText;
                this.tcp_Socket.Close();  // Закрываем соединение
                MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return 0;
            }
            else
            {
                // Сервер ответил 220, отправляем EHLO, ждем ответа 250                
                this.RaiseConnectionEstablished(this.smtpServer, this.smtpPort);
                message = "EHLO" + " " + Dns.GetHostEntry("127.0.0.1").HostName + "\r\n";
                this.SendDataThroughNetworkStream(message);
                if (this.WaitForResponse("250", ref responseText) == false)
                {
                    // Сервер не ответил 250
                    this.errorMessage = "Не получен ответ " + "250" + " от сервера на команду " + "EHLO" + ".\r\nСервер ответил: " + responseText;
                    this.tcp_Socket.Close();
                    MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return 0;
                }
                else
                {                    
                    {
                        // Сервер ответил 220, отправляем AUTH LOGIN, ждем 334                        
                        message = "Auth Login" + "\r\n";
                        this.SendDataThroughNetworkStream(message);
                        if (this.WaitForResponse("334", ref responseText) == false)
                        {
                            // Сервер не ответил 334
                            this.errorMessage = "Не получен ответ 334 от сервера на команду AUTH LOGIN" + ".\r\nСервер ответил: " + responseText;
                            this.tcp_Socket.Close();
                            MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                            return 0;
                        }
                        else
                        {                            
                            // Сервер ответил 334, отправляем логин, ждем 334
                            buffer = encoding.GetBytes(this.userName);  
                            message = Convert.ToBase64String(buffer) + "\r\n";                            
                            this.RaiseAuthenticationBegan(this.userName);
                            this.SendDataThroughNetworkStream(message);
                            if (this.WaitForResponse("334", ref responseText) == false)
                            {
                                // Сервер не ответил 334
                                this.errorMessage = "Не получен ответ 334 от сервера на команду UserName Confirmation" + ".\r\nСервер ответил: " + responseText;
                                this.tcp_Socket.Close();
                                MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                return 0;
                            }
                            else
                            {
                                // Сервер ответил 334, отправляем пароль, ждем 235                                
                                buffer = encoding.GetBytes(this.password);
                                message = Convert.ToBase64String(buffer) + "\r\n";
                                this.SendDataThroughNetworkStream(message);
                                if (this.WaitForResponse("235", ref responseText) == false)
                                {
                                    // Сервер не ответил 235
                                    this.errorMessage = "Не получен ответ 235 от сервера на команду Password Confirmation" + ".\r\nСервер ответил: " + responseText;
                                    this.tcp_Socket.Close();
                                    MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                    return 0;
                                }
                                else
                                {
                                    // Сервер ответил 235, отправляем MAIL FROM, ждем 250                                    
                                    this.RaiseAuthenticationFinished(this.userName);
                                    message = "MAIL FROM:" + "<" + this.mailMessage.From + ">\r\n";
                                    this.SendDataThroughNetworkStream(message);
                                    if (this.WaitForResponse("250", ref responseText) == false)
                                    {
                                        // Сервер не ответил 250
                                        this.errorMessage = "Не получен ответ " + "250" + " от сервера на команду " + "MAIL FROM" + ".\r\nСервер ответил: " + responseText;
                                        this.tcp_Socket.Close();
                                        MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                        return 0;
                                    }
                                    else
                                    {
                                        // Сервер ответил 250, отправляем RCPT TO, ждем 250
                                        string recipientAddress = "";
                                        string[] split = this.mailMessage.To.Split(new char[] { ',', ';' });
                                        for (int j = 0; j < split.Length; j++)
                                        {
                                            if (split[j].Trim() != "")
                                            {
                                                recipientAddress = "<" + split[j] + ">";
                                                message = "RCPT TO:" + recipientAddress + "\r\n";
                                                this.SendDataThroughNetworkStream(message);

                                                if (this.WaitForResponse("250", ref responseText) == false)
                                                {
                                                    // Сервер не ответил 250
                                                    this.errorMessage = "Сервер отколнил адрес электронной почты: " + recipientAddress + ".";
                                                    this.tcp_Socket.Close();
                                                    MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                                    return 0;
                                                }
                                                else
                                                {
                                                    // Сервер ответил 250, отправляем DATA, ждем 354
                                                    message = "DATA" + "\r\n";
                                                    this.SendDataThroughNetworkStream(message);
                                                    if (this.WaitForResponse("354", ref responseText) == false)
                                                    {
                                                        // Сервер не ответил 354
                                                        this.errorMessage = "Не получен ответ " + "354" + " от сервера на команду " + "DATA" + ".\r\nСервер ответил: " + responseText;
                                                        this.tcp_Socket.Close();
                                                        MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                                        return 0;
                                                    }
                                                    else
                                                    {
                                                        // Сервер ответил 354  
                                                        message = this.GetEmailInformation();
                                                        this.RaiseStartedDataTransfer();
                                                        this.SendDataThroughNetworkStream(message);
                                                        if (this.WaitForResponse("250", ref responseText) == false)
                                                        {
                                                            // Сервер не ответил 250
                                                            this.errorMessage = "Не получен ответ " + "250" + " от сервера на команду " + "DATA" + ".\r\nСервер ответил: " + responseText;
                                                            this.tcp_Socket.Close();
                                                            MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                                            return 0;
                                                        }
                                                        else
                                                        {
                                                            // Сервер ответил 250
                                                            message = "QUIT" + "\r\n";
                                                            this.SendDataThroughNetworkStream(message);
                                                            if (this.WaitForResponse("221", ref responseText) == false)
                                                            {
                                                                // Сервер не ответил 221
                                                                this.errorMessage = "Не получен ответ " + "221" + " от сервера на команду " + "QUIT" + ".\r\nСервер ответил: " + responseText;
                                                                this.tcp_Socket.Close();
                                                                MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                                                return 0;
                                                            }
                                                            else
                                                            {
                                                                // Сервер ответил 221
                                                                if (tcp_Socket.Connected)
                                                                {
                                                                    tcp_Socket.Close();
                                                                    this.RaiseDisconnected(this.smtpServer);                                                                   
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }                                          
                                        }
                                    }
                                }
                            }
                        }
                    }
                }                
            }
            return 1;
        }

        // Ожидание ответа от сервера
        private bool WaitForResponse(string responseCode, ref string responseText)
        {
            DateTime startDateTime = DateTime.Now;  // Текущее время
            TimeSpan timeSpan = DateTime.Now - startDateTime;  // Интервал времени
            byte[] buffer = new byte[1024];  // Буфер
            ASCIIEncoding encoding = new ASCIIEncoding();  // Кодировка сообщения
            int bytesRead = 0;  // Счетчик считанных байт

            // Цикл ожидания ответа
            while (timeSpan.Seconds < this.timeOut)
            {
                if (networkStream.DataAvailable)  // Если данные для чтения есть, то считываем их
                {
                    bytesRead = networkStream.Read(buffer, 0, buffer.Length);                    
                    responseText = encoding.GetString(buffer, 0, buffer.Length);
                    if (responseText.Substring(0, responseCode.Length).Equals(responseCode))  // Если мы получили желаемый ответ, то
                    {
                        return true;  // Возвращаем true
                    }
                    else
                    {
                        return false;  // Иначе false
                    }
                }
                else
                {
                    timeSpan = DateTime.Now - startDateTime;  // Если время ожидания истек, то выходим
                }
            }
            return false;
        }

        // Передача данных серверу
        private void SendDataThroughNetworkStream(string msg)
        {
            byte[] buff = Encoding.Default.GetBytes(msg);           
            networkStream.Write(buff, 0, buff.Length);           
        }        

        // Формирование DATA 
        private string GetEmailInformation()
        {
            StringBuilder msg = new StringBuilder();
            msg.Append("MIME-Version: 1.0\r\n");
            msg.Append("From: <" + this.mailMessage.From.ToString() + ">\r\n");
            msg.Append("To: <" + this.mailMessage.To.ToString() + ">\r\n");
            msg.Append("Subject: " + this.mailMessage.Subject.ToString() + "\r\n"); 
            msg.Append("Date: " + DateTime.Now.ToString("F") + "\r\n");

            switch (this.mailMessage.MailPriority)
            {
                case MailSendPriority.HIGH:
                    msg.Append("Priority: High\r\n");
                    break;
                case MailSendPriority.LOW:
                    msg.Append("Priority: Low\r\n");
                    break;
                case MailSendPriority.NORMAL:
                    msg.Append("Priority: Normal\r\n");
                    break;
            }                 

            switch (this.mailMessage.MailType)
            {
                case MailEncodingType.PLAINTEXT:
                    msg.Append("Content-Type: text/plain; ");
                    break;
                case MailEncodingType.HTML:
                    msg.Append("Content-Type: text/html; ");
                    break;
            }

            msg.Append("charset=windows-1251\r\n");
            msg.Append("Content-Transfer-Encoding: 7bit\r\n");
            msg.Append("\r\n");
            msg.Append(this.mailMessage.Message.ToString() + "\r\n\r\n");
                        
            msg.Append("\r\n.\r\n");

            return msg.ToString();
        }
    }
}
