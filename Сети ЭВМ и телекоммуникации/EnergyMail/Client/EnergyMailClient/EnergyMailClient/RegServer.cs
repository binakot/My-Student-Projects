using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Sockets;
using System.Windows.Forms;

namespace EnergyMailClient
{
    class RegServer
    {
        // Сервер по умолчанию
        public static String regHost = "127.0.0.1";
        public static Int32 regPort = 12345;

        // Проверка соединения с сервером
        static public void check(string IP, Int32 Port)
        {
            regHost = IP;
            regPort = Port;
            TcpClient tmpClient = new TcpClient();

            try
            {
                tmpClient.Connect(regHost, regPort);
                MessageBox.Show("Сервер регистрации доступен", "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (Exception e)
            {
                MessageBox.Show("Сервер регистрации не доступен!\r\nОшибка: " + e.ToString(), "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                tmpClient.Close();
            }
        }
    }
}
