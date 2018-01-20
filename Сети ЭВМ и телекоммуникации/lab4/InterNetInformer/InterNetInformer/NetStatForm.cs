using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Net;
using System.Net.NetworkInformation;

namespace InterNetInformer
{
    public partial class NetStatForm : Form
    {
        public NetStatForm()
        {
            InitializeComponent();
        }       

        private void выходToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void выходToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }       

        private void tCPIPv4StatisticsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            IPGlobalProperties properties = IPGlobalProperties.GetIPGlobalProperties();
            TcpStatistics tcpStat = properties.GetTcpIPv4Statistics();   

            StatTextBox.Text = "Статисктика TCP для IPv4:" + "\r\r";

            StatTextBox.Text += "Общее число установленных подключений: " + tcpStat.CumulativeConnections + "\r";
            StatTextBox.Text += "Число текущих подключений: " + tcpStat.CurrentConnections + "\r";
            StatTextBox.Text += "Сбоев при подключении: " + tcpStat.FailedConnectionAttempts + "\r";
            StatTextBox.Text += "Сброшено подключений: " + tcpStat.ResetConnections + "\r";
            StatTextBox.Text += "Запросов на подключение: " + tcpStat.ConnectionsAccepted + "\r";
            StatTextBox.Text += "Число полученных ошибок: " + tcpStat.ErrorsReceived + "\r\r";

            StatTextBox.Text += "Максимальное число поддерживаемых подключений: " + tcpStat.MaximumConnections + "\r";
            StatTextBox.Text += "Минимальное время ожидания при отправке сегмента: " + tcpStat.MinimumTransmissionTimeout + "\r";
            StatTextBox.Text += "Максимальное время ожидания при отправке сегмента: " + tcpStat.MaximumTransmissionTimeout + "\r\r";

            StatTextBox.Text += "Отправлено сегментов: " + tcpStat.SegmentsSent + "\r";
            StatTextBox.Text += "Получено сегментов: " + tcpStat.SegmentsReceived + "\r";
            StatTextBox.Text += "Повторно отправленных сегментов: " + tcpStat.SegmentsResent;  
        }

        private void tCPIPv6StatisticsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            IPGlobalProperties properties = IPGlobalProperties.GetIPGlobalProperties();
            TcpStatistics tcpStat = properties.GetTcpIPv6Statistics();

            StatTextBox.Text = "Статисктика TCP для IPv6:" + "\r\r";

            StatTextBox.Text += "Общее число установленных подключений: " + tcpStat.CumulativeConnections + "\r";
            StatTextBox.Text += "Число текущих подключений: " + tcpStat.CurrentConnections + "\r";
            StatTextBox.Text += "Сбоев при подключении: " + tcpStat.FailedConnectionAttempts + "\r";
            StatTextBox.Text += "Сброшено подключений: " + tcpStat.ResetConnections + "\r";
            StatTextBox.Text += "Запросов на подключение: " + tcpStat.ConnectionsAccepted + "\r";
            StatTextBox.Text += "Число полученных ошибок: " + tcpStat.ErrorsReceived + "\r\r";

            StatTextBox.Text += "Максимальное число поддерживаемых подключений: " + tcpStat.MaximumConnections + "\r";
            StatTextBox.Text += "Минимальное время ожидания при отправке сегмента: " + tcpStat.MinimumTransmissionTimeout + "\r";
            StatTextBox.Text += "Максимальное время ожидания при отправке сегмента: " + tcpStat.MaximumTransmissionTimeout + "\r\r";

            StatTextBox.Text += "Отправлено сегментов: " + tcpStat.SegmentsSent + "\r";
            StatTextBox.Text += "Получено сегментов: " + tcpStat.SegmentsReceived + "\r";
            StatTextBox.Text += "Повторно отправленных сегментов: " + tcpStat.SegmentsResent;  
        }

        private void uDPIPv4СтатистикаToolStripMenuItem_Click(object sender, EventArgs e)
        {
            IPGlobalProperties properties = IPGlobalProperties.GetIPGlobalProperties();
            UdpStatistics udpStat = properties.GetUdpIPv4Statistics();

            StatTextBox.Text = "Статисктика UDP для IPv4:" + "\r\r";

            StatTextBox.Text += "Получено датаграмм: " + udpStat.DatagramsReceived + "\r";
            StatTextBox.Text += "Отправлено датаграмм: " + udpStat.DatagramsSent + "\r";
            StatTextBox.Text += "Число датаграмм, удаленных из-за ошибки порта: " + udpStat.IncomingDatagramsDiscarded + "\r";
            StatTextBox.Text += "Число датаграмм, удаленных не из-за ошибки порта: " + udpStat.IncomingDatagramsWithErrors + "\r";
            StatTextBox.Text += "Число серверов, прослушивающих датаграммы: " + udpStat.UdpListeners;
            
        }

        private void uDPIPv4СтатистикаToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            IPGlobalProperties properties = IPGlobalProperties.GetIPGlobalProperties();
            UdpStatistics udpStat = properties.GetUdpIPv6Statistics();

            StatTextBox.Text = "Статисктика UDP для IPv6:" + "\r\r";

            StatTextBox.Text += "Получено датаграмм: " + udpStat.DatagramsReceived + "\r";
            StatTextBox.Text += "Отправлено датаграмм: " + udpStat.DatagramsSent + "\r";
            StatTextBox.Text += "Число датаграмм, удаленных из-за ошибки порта: " + udpStat.IncomingDatagramsDiscarded + "\r";
            StatTextBox.Text += "Число датаграмм, удаленных не из-за ошибки порта: " + udpStat.IncomingDatagramsWithErrors + "\r";
            StatTextBox.Text += "Число серверов, прослушивающих датаграммы: " + udpStat.UdpListeners;
        }

        private void сетевойИнтерфейсToolStripMenuItem_Click(object sender, EventArgs e)
        {
            IPGlobalProperties computerProperties = IPGlobalProperties.GetIPGlobalProperties();
            NetworkInterface[] nics = NetworkInterface.GetAllNetworkInterfaces();

            StatTextBox.Text = "Конфигурация и статистика сетевого интерфейса для: \r" + computerProperties.HostName + "." + computerProperties.DomainName + "\r\r";

            if (nics == null || nics.Length < 1)
            {
                StatTextBox.Text += "Сетевые интерфейсы не найдены";
                return;
            }
                        
            StatTextBox.Text += "Общее количество сетевых интерфейсов: " + nics.Length + "\r";
            foreach (NetworkInterface adapter in nics)
            {
                IPInterfaceProperties properties = adapter.GetIPProperties();

                StatTextBox.Text += "\r";

                StatTextBox.Text += adapter.Description + "\r";
                StatTextBox.Text += "Тип интерфейса: " + adapter.NetworkInterfaceType + "\r";
                StatTextBox.Text += "MAC-адрес (физический адрес): " + adapter.GetPhysicalAddress() + "\r";
                StatTextBox.Text += "Операционное состояние: " + adapter.OperationalStatus + "\r";

                if (adapter.Supports(NetworkInterfaceComponent.IPv4))
                {
                    StatTextBox.Text += "IPv4 поддерживается" + "\r";
                }

                if (adapter.Supports(NetworkInterfaceComponent.IPv6))
                {
                    StatTextBox.Text += "IPv6 поддерживается" + "\r";
                }

                if (adapter.NetworkInterfaceType == NetworkInterfaceType.Loopback)
                {
                    continue;
                }
                                
                StatTextBox.Text += "Разрешение DNS-имен: " + properties.IsDnsEnabled + "\r";
                StatTextBox.Text += "Авто. регистарация IP-адресов в DNS: " + properties.IsDynamicDnsEnabled + "\r";
                StatTextBox.Text += "Только прием пакетов: " + adapter.IsReceiveOnly + "\r";
                StatTextBox.Text += "Прием пакетов многоадресной рассылки: " + adapter.SupportsMulticast + "\r";
            }
        }

        private void сетевыеПодключенияToolStripMenuItem_Click(object sender, EventArgs e)
        {
            IPGlobalProperties properties = IPGlobalProperties.GetIPGlobalProperties();            
            TcpConnectionInformation[] connections = properties.GetActiveTcpConnections();

            StatTextBox.Text = "Сведения о подключениях TCP на локальном компьютере\r\r";

            foreach (TcpConnectionInformation t in connections)
            {
                StatTextBox.Text += "Локальный адрес: " + t.LocalEndPoint.Address + ":" + t.LocalEndPoint.Port + "\r" +
                                    "Внешний адрес: " + t.RemoteEndPoint.Address + ":" + t.RemoteEndPoint.Port + "\r" +
                                    "Состояние: " + t.State + "\r\r";                
            }           
        }

        private void iPадресКомпьютераToolStripMenuItem_Click(object sender, EventArgs e)
        {
            string myHost = Dns.GetHostName();            
            string myIP = Dns.GetHostByName(myHost).AddressList[0].ToString();            

            StatTextBox.Text = myIP + " (" + myHost + ")";
        }
    }
}
