using System;
using System.Data;
using System.Text;
using System.Net.Sockets;
using System.Threading;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Security.Cryptography.X509Certificates;
namespace EnergyMailRegistrar
{
    class EnergyMailReger
    {
        private TcpClient client, friendlyServer;
        private NetworkStream stream;
        private System.IO.StreamReader reader;
        private System.IO.StreamWriter writer;
        private static int port = 12345;
        public static SqlConnection connection = new SqlConnection();
        public static bool output = true;

        private EnergyMailReger(TcpClient client)
        {
            this.client = client;
            stream = client.GetStream();
            reader = new System.IO.StreamReader(stream);
            writer = new System.IO.StreamWriter(stream);
            writer.NewLine = "\r\n";
            writer.AutoFlush = true;
        }

        static void Main(string[] args)
        {
            string DataSource = "localhost";
            string InitialCatalog = "MailDataBase";
            string IntegratedSecurity = "SSPI";
            connection.ConnectionString = "Data Source = " + DataSource + "; Initial Catalog = " + InitialCatalog + "; Integrated Security = " + IntegratedSecurity;
            Console.SetWindowSize(100, 30);

            Console.WriteLine("EnergyMailRegistrar готов к работе.");
            bool flag = true;
            string cmd;
            while (flag)
            {
                Console.WriteLine(" - Преднастройку сервера (config).");
                Console.WriteLine(" - Преступить к прслушиванию порта (listen).");
                cmd = Console.ReadLine();
                if (cmd == "listen") break;
                if (cmd == "config")
                {
                    while (true)
                    {
                        Console.WriteLine("    Прослушиваемый порт - {0} (port)", Convert.ToString(port));
                        Console.WriteLine("    Вывод полученной информации в консоль - {0} (output)", output ? "Да" : "Нет");
                        Console.WriteLine("    Параметры подключения к базе данных сервера (DBParam):");

                        cmd = Console.ReadLine();
                        if (cmd == "port")
                        {
                            while (true)
                            {
                                Console.Write("     Введите номер порта (целое чисо): ");
                                try
                                {
                                    port = Convert.ToInt32(Console.ReadLine());
                                    break;
                                }
                                catch
                                {
                                    Console.WriteLine("     Не корректный ввод. Попробуйте еще раз.");
                                }
                            }
                        }
                        else
                            if (cmd == "output")
                            {
                                if (output)
                                {
                                    Console.WriteLine("     Вывод получаемой информации в консоль отключен");
                                    output = false;
                                }
                                else
                                {
                                    Console.WriteLine("     Вывод получаемой информации в консоль включен");
                                    output = true;
                                }
                            }
                            else
                                if (cmd == "dbparam" || cmd == "DBParam")
                                {
                                    while (true)
                                    {
                                        //connection.ConnectionString = "Data Source = localhost; Initial Catalog = MailDataBase; Integrated Security = SSPI";
                                        Console.WriteLine("     - IP адрес соединения с базой данных сервера - {0}", DataSource);
                                        Console.WriteLine("     - Название базыданных сервера - {0}", InitialCatalog);
                                        Console.WriteLine("     - Windows аутентификация - {0}", IntegratedSecurity);
                                        Console.WriteLine("      Желаете внести измениения? Да - 'y', нет - 'n'");
                                        cmd = Console.ReadLine();
                                        while (true)
                                            if (cmd == "y" || cmd == "n") break;
                                            else Console.WriteLine("      Некорректный ввод.");

                                        if (cmd == "n")
                                            break;

                                        if (cmd == "y")
                                        {
                                            Console.Write("      Data Source = {0}. Новое значение = ", DataSource);
                                            DataSource = Console.ReadLine();

                                            Console.Write("      Initial Catalog= {0}. Новое значение = ", InitialCatalog);
                                            InitialCatalog = Console.ReadLine();

                                            Console.Write("      Integrated Security = {0}. Новое значение = ", IntegratedSecurity);
                                            IntegratedSecurity = Console.ReadLine();

                                            connection.ConnectionString = "Data Source = " + DataSource + "; Initial Catalog = " + InitialCatalog + "; Integrated Security = " + IntegratedSecurity;
                                        }

                                        try
                                        {
                                            connection.Open();
                                            break;
                                        }
                                        catch (Exception err)
                                        {
                                            Console.Error.WriteLine("      Ошибка соединения с базой данных");
                                        }
                                    }
                                }
                                else
                                    Console.WriteLine("     Введенная команда не опознана");
                        while (true)
                        {
                            Console.WriteLine("     Желаете преступить к прслушиванию порта? Да -'y', нет - 'n'");
                            cmd = Console.ReadLine();
                            if (cmd == "y" || cmd == "n") break;
                            else Console.WriteLine("     Некорректный ввод.");
                        }
                        if (cmd == "y")
                        {
                            flag = false;
                            break;
                        }

                    }
                }
            }
            if (connection.State != ConnectionState.Open)
            {
                try
                {
                    connection.Open();
                    Console.WriteLine("Соединение с базой данных сервера произведено.");
                }
                catch (Exception err)
                {
                    Console.Error.WriteLine("Ошибка соединения с базой данных");

                }
            }

            Console.WriteLine("Ожидание подключений по порту {0}...", port);
            TcpListener listener = new TcpListener(port);
            listener.Start();
            while (true)
            {
                EnergyMailReger handler = new EnergyMailReger(listener.AcceptTcpClient());

                Console.WriteLine("Попытка подключения к серверу:");
                Thread thread = new System.Threading.Thread(new ThreadStart(handler.Run));
                thread.Start();
            }
        }

        private void Writer(string mes)
        {
            /*byte[] buf = Encoding.ASCII.GetBytes(mes);
            stream.Write(buf, 0, buf.Length);*/
            byte[] buf = Encoding.Default.GetBytes(mes);
            this.stream.Write(buf, 0, buf.Length);
        }

        private string Reader()
        {
            int readBytes = 0;
            byte[] buff = new byte[1024];
            readBytes = stream.Read(buff, 0, buff.Length);
            return (Encoding.Default.GetString(buff, 0, readBytes));
            /*byte[] buf = new byte[10000];
            stream.Read(buf, 0, buf.Length);
            ASCIIEncoding encoding = new ASCIIEncoding();
            return (encoding.GetString(buf, 0, buf.Length));*/
        }

        private void Run()
        {
            String line = "", command, mes;
            string login = "", password = "";
            bool log = false, data = false;

            SqlCommand cmd;
            DateTime date = DateTime.Now;

            Writer("OK EnergyMailRegistrar");
            while (true)
            {
                //line = Reader();
                try
                {
                    line = Reader();
                }
                catch (Exception err)
                {
                    Console.Error.WriteLine("Клиент разорвал соединение");
                    return;
                }

                if (output) Console.WriteLine("Получено сообщение: " + line);
                try
                {
                    command = line.Substring(0, line.IndexOf(" "));
                }
                catch (Exception err)
                {
                    command = line.Substring(0, line.Length);
                }
                command = command.ToUpper();
                mes = line.Substring(command.Length);
                switch (command)
                {
                    case "REG":
                        Writer("OK");
                        break;
                    case "QUIT":
                        Writer("OK");
                        client.Close();
                        return;
                    case "LOGIN":
                        login = line.Substring(line.IndexOf("<") + 1, line.IndexOf(">") - line.IndexOf("<") - 1);

                        cmd = new SqlCommand("ChackClientLogin", connection);
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.Add("@login", SqlDbType.VarChar);
                        cmd.Parameters["@login"].Value = login;
                        try
                        {
                            Int32 rowsAffected = cmd.ExecuteNonQuery();
                            SqlDataReader rdr = cmd.ExecuteReader();
                            if (rdr.Read())                            
                                Writer("ER this login already exists");                            
                            else
                            {
                                Writer("OK");
                                log = true;
                            }
                            rdr.Close();                                                       
                        }
                        catch (Exception err)
                        {
                            Writer("ER");
                        }
                        finally
                        {
                            for (int i = 0; i < cmd.Parameters.Count; i++)
                                cmd.Parameters.RemoveAt(i);                         
                        }
                        break;
                    case "PWORD":
                        if (log)
                        {
                            password = line.Substring(line.IndexOf("<") + 1, line.IndexOf(">") - line.IndexOf("<") - 1);
                            Writer("OK");
                            data = true;
                        }
                        break;
                    case "DATA":
                        if (data)
                        {
                            string name, sex, country, phone;

                            name = line.Substring(line.IndexOf("<") + 1, line.IndexOf(",") - line.IndexOf("<") - 1);
                            line = line.Remove(0, line.IndexOf(",") + 1);

                            sex = line.Substring(0, line.IndexOf(","));
                            line = line.Remove(0, line.IndexOf(",") + 1);

                            country = line.Substring(0, line.IndexOf(","));
                            line = line.Remove(0, line.IndexOf(",") + 1);

                            phone = line.Substring(line.IndexOf(",") + 1, line.IndexOf(">") - line.IndexOf(",") - 1);
                            line = line.Remove(0, line.IndexOf(",") + 1);

                            Console.WriteLine("New client: {0}", name);
                            Console.WriteLine("whis login: {0}", login);
                            Console.WriteLine("пол: {0}", sex);
                            Console.WriteLine("Страна: {0}", country);
                            Console.WriteLine("Телефон: {0}", phone);


                            cmd = new SqlCommand("AddClient", connection);
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.Add("@login", SqlDbType.VarChar);
                            cmd.Parameters["@login"].Value = login;

                            cmd.Parameters.Add("@password", SqlDbType.VarChar);
                            cmd.Parameters["@password"].Value = password;

                            cmd.Parameters.Add("@name", SqlDbType.VarChar);
                            cmd.Parameters["@name"].Value = name;

                            cmd.Parameters.Add("@sex", SqlDbType.VarChar);
                            cmd.Parameters["@sex"].Value = sex;

                            cmd.Parameters.Add("@country", SqlDbType.VarChar);
                            cmd.Parameters["@country"].Value = country;

                            cmd.Parameters.Add("@phone", SqlDbType.VarChar);
                            cmd.Parameters["@phone"].Value = phone;
                            try
                            {
                                Int32 rowsAffected = cmd.ExecuteNonQuery();
                                Writer("OK");
                                Console.WriteLine("Осуществлена регистрация нового клиента");
                            }
                            catch (Exception err)
                            {
                                Writer("ER");
                            }
                            finally
                            {
                                for (int j = 0; j < cmd.Parameters.Count; j++)
                                    cmd.Parameters.RemoveAt(j);
                            }

                        }
                        break;
                    default:
                        Writer("On messege");
                        return;
                }

            }
        }
    }
}