using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Sockets;
using System.Windows.Forms;

namespace EnergyMailClient
{
    static public class PopServer  // Класс Pop-сервера
    {
        // Сервер по умолчанию
        public static String popHost = "pop.mail.ru";
        public static Int32 popPort = 110;

        // Проверка соединения с сервером
        static public void check(string IP, Int32 Port)
        {
            popHost = IP;
            popPort = Port;
            TcpClient tmpClient = new TcpClient();

            try
            {
                tmpClient.Connect(popHost, popPort);
                MessageBox.Show("POP-сервер доступен", "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Information);  
            }
            catch (Exception e)
            {
                MessageBox.Show("POP-сервер не доступен!\r\nОшибка: " + e.ToString(), "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);  
            }
            finally
            {
                tmpClient.Close();
            }
        }
    }
}
