using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Sockets;
using System.Windows.Forms;
using System.Net.Mail;

namespace EnergyMailClient
{
    static public class SmtpServer  // Класс SMTP-сервера
    {
        // Сервер по умолчанию
        public static String smtpHost = "smtp.mail.ru"; 
        public static Int32 smtpPort = 25;

        // Проверка соединения с сервером
        static public void check(string IP, Int32 Port)
        {
            smtpHost = IP;
            smtpPort = Port;
            TcpClient tmpClient = new TcpClient();

            try
            {
                tmpClient = new TcpClient(smtpHost, smtpPort);
                MessageBox.Show("SMTP-сервер доступен", "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Information);  
            }
            catch (Exception e)
            {
                MessageBox.Show("SMTP-сервер не доступен!\r\nОшибка: " + e.ToString(), "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);                
            }
            finally
            {
                tmpClient.Close();
            }
        }               
    }
}
