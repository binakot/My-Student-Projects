using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Net.Sockets;


namespace UDPserver
{
    class Program
    {
        static void Main(string[] args)
        {
            while (true)
            {
                Socket listener = new Socket(AddressFamily.InterNetwork, SocketType.Dgram, ProtocolType.Udp);
                IPEndPoint localEndPoint = new IPEndPoint(IPAddress.Any, 12345);
                listener.Bind(localEndPoint);
                EndPoint ip = (EndPoint)localEndPoint;

                Console.WriteLine("Ready to receive...");

                byte[] data = new byte[1024];
                int recv = listener.ReceiveFrom(data, ref ip);
                string stringData = Encoding.ASCII.GetString(data, 0, recv);

                Console.WriteLine("Received: \n message: {0} \n from: {1}", stringData, ip.ToString());
                Console.WriteLine(" ");

                listener.Close();
            }
        }
    }
}
