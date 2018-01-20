using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Net.Sockets;

namespace UDPclient
{
    class Program
    {
        static void Main(string[] args)
        {
            int groupPort = 12345;
            IPEndPoint groupIP = new IPEndPoint(IPAddress.Broadcast, groupPort);
            Socket socket = new Socket(AddressFamily.InterNetwork, SocketType.Dgram, ProtocolType.Udp);
            socket.SetSocketOption(SocketOptionLevel.Socket, SocketOptionName.Broadcast, 1);
            socket.SendTo(System.Text.ASCIIEncoding.ASCII.GetBytes("He's alive! Alive! ... It's alive! IT'S ALIVE!"), groupIP);            
        }
    }
}
