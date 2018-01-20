using System;
using System.Collections.Generic;
using System.Text;

namespace MinimalisticTelnet
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                //������� Telnet-���������� �� IP:Port
                TelnetConnection tc = new TelnetConnection("46.172.182.72", 23);

                //��������� �����, ������ � ����� ��������
                string s = tc.Login(" ", " ", 100);

                // ������ ������ ������ ������������� �� "$" ��� ">", ����� ���������� ��������
                string prompt = s.TrimEnd();
                prompt = s.Substring(prompt.Length - 1, 1);
                if (prompt != "$" && prompt != ">")
                    throw new Exception("Connection failed");

                Console.WriteLine("OMG! TelNet Connection is success! U can do everything! Hahahaha: ");

                prompt = "";

                // ���� ���������
                while (tc.IsConnected && prompt.Trim() != "exit")
                {
                    // ����� ������ �������
                    Console.Write(tc.Read());

                    // ���������� ������� �������
                    prompt = Console.ReadLine();
                    tc.WriteLine(prompt);

                    // ����� ������ �������
                    Console.Write(tc.Read());
                }

                Console.WriteLine("Disconnected");
                Console.ReadLine();
            }
            catch (Exception exception)
            {
                Console.WriteLine(exception.ToString());
            }
            finally
            {
                Console.ReadKey();
            }
        }
    }
}
