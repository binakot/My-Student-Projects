using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Net;
using System.Net.Sockets;
using System.IO;

namespace EnergyMailClient
{
    public partial class Registration : Form
    {
        public Registration()
        {
            InitializeComponent();
        }

        // Данные
        private string regServer; // Адрес сервера
        private int regPort;  // Порт сервера        
        private int timeOut = 10;  // Время ожидания
        private string login;  // Имя пользователя
        private string password;  // Пароль
        private string fio;
        private string sex;
        private string phone;
        private string country;
        private string errorMessage;  // Сообщение об ошибке

        private Socket tcp_Socket;  // Сокет для соединения
        private NetworkStream networkStream;  // Поток данных     

        private void Form3_Load(object sender, EventArgs e)
        {
            // Прячем введенный пароль за звездочками
            PasswordBox.PasswordChar = '*';
            ConfirmPasswordBox.PasswordChar = '*';
        }

        // Регистрация
        private void RegistrationButton_Click(object sender, EventArgs e)
        {
            // Проверяем введный пароль
            if (PasswordBox.Text == ConfirmPasswordBox.Text)  // Если совпадают, то регистрируемся
            {
                regServer = RegServer.regHost;
                regPort = RegServer.regPort;
                login = LoginBox.Text;
                password = PasswordBox.Text;
                fio = FIOBox.Text;
                sex = SexBox.Text;
                phone = PhoneBox.Text;
                country = CountryBox.Text;
                if (RegNewUser(login, password, fio, sex, phone, country) == 1)
                {
                    MessageBox.Show("Клиент успешно зарегестрирован", "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Information);                
                }
            }
            else  // Иначе сообщение об ошибке
            {
                PasswordBox.Text = "";
                ConfirmPasswordBox.Text = "";
                MessageBox.Show("Пароли не совпадают, введите еще раз", "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);                
            }
        }

        private int RegNewUser(string Login, string Password, string FIO, string Sex, string Phone, string Country)
        { 
            tcp_Socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);  // соединение с сервером
            IPAddress[] ip_Addresses;  // IP-адрес

            try
            {
                ip_Addresses = Dns.GetHostAddresses(this.regServer);  // Проверяем существование нашего сервера по его DNS-имени
            }
            catch (Exception)
            {
                errorMessage = "Сервер регистрации " + regServer.ToString() + " не существует.";
                MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return 0;
            }

            IPEndPoint remote_EndPoint = new IPEndPoint(ip_Addresses[0], regPort);  // Создаем точку подключения

            try
            {
                tcp_Socket.Connect((EndPoint)remote_EndPoint);  // Пытаемся соединиться к серверу
            }
            catch
            {
                this.errorMessage = "Невозможно подключиться к серверу регистрации: " + regServer + ", по порту " + regPort + ".";
                MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return 0;
            }

            networkStream = new NetworkStream(tcp_Socket);  // Передача данных между сервером и клиентом            
            string responseText = "";  // Ответы сервера            
            string message = "";  // Сообщение            
            ASCIIEncoding encoding = new ASCIIEncoding();  // Кодировка отправляемых строк
                        
            if (this.WaitForResponse("OK", ref responseText) == false)
            {
                // Сервер не ответил OK
                errorMessage = "Не получено приветственное сообщение от сервера регистарции: " + regServer + ".\r\nСервер ответил: " + responseText;
                tcp_Socket.Close();  // Закрываем соединение
                MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return 0;
            }
            else
            {
                // Отправляем команду для регистрации
                message = "REG";
                SendDataThroughNetworkStream(message);
                if (this.WaitForResponse("OK", ref responseText) == false)
                {
                    // Сервер не ответил OK
                    errorMessage = "Сервер регистрации отклонил запрос: " + regServer + ".\r\nСервер ответил: " + responseText;
                    tcp_Socket.Close();  // Закрываем соединение
                    MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return 0;
                }
                else
                {
                    // Отправляем логин
                    message = "LOGIN <" + Login.ToString() + ">";
                    SendDataThroughNetworkStream(message);                    
                    if (this.WaitForResponse("OK", ref responseText) == false)
                    {
                        // Вводим логин повторно или прекращаем регистрацию
                        while (responseText.Substring(0, 2) == "ER")
                        {
                            BusyLogin form = new BusyLogin();
                            form.ShowDialog();
                            if (User.flag == "Cancel")
                            {
                                // Отключаемся от сервера регистрации
                                message = "QUIT";
                                SendDataThroughNetworkStream(message);
                                return 0;
                            }
                            else if (User.flag == "reply")
                            {
                                Login = User.newLogin;
                                message = "LOGIN <" + Login.ToString() + ">";
                                SendDataThroughNetworkStream(message);
                                this.WaitForResponse("OK", ref responseText);                                                              
                            }
                        }                                       
                    }
                    
                    {
                        // Отправляем пароль
                        message = "PWORD <" + Password.ToString() + ">";
                        SendDataThroughNetworkStream(message);
                        if (this.WaitForResponse("OK", ref responseText) == false)
                        {
                            // Сервер не ответил OK
                            errorMessage = "Сервер регистрации отклонил запрос: " + regServer + ".\r\nСервер ответил: " + responseText;
                            tcp_Socket.Close();  // Закрываем соединение
                            MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                            return 0;
                        }
                        else
                        {
                            // Отправляем данные пользователя
                            message = "DATA <" + FIO.ToString() + "," + Sex.ToString() + "," + Country.ToString() + "," + Phone.ToString() + ">";
                            SendDataThroughNetworkStream(message);
                            if (this.WaitForResponse("OK", ref responseText) == false)
                            {
                                // Сервер не ответил OK
                                errorMessage = "Сервер регистрации отклонил запрос: " + regServer + ".\r\nСервер ответил: " + responseText;
                                tcp_Socket.Close();  // Закрываем соединение
                                MessageBox.Show(errorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                return 0;
                            }                                                                      
                        }
                    }
                }                
            }
            // Отключаемся от сервера регистрации
            message = "QUIT";
            SendDataThroughNetworkStream(message);
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
    }
}
