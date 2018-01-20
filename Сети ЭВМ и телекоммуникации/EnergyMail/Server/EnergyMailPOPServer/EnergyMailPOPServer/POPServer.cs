using System;
using System.Data;
using System.Text;
using System.Net.Sockets;
using System.Threading;
using System.Net.Security;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Security.Authentication;
using System.Security.Cryptography.X509Certificates;

namespace ConsoleApplication1
{
    class PopServer
    {
        private TcpClient client;
        private NetworkStream stream;
        private System.IO.StreamReader reader;
        private System.IO.StreamWriter writer;
        private static int port = 110;
        public static SqlConnection connection = new SqlConnection();
        public static bool output = true;

        private PopServer(TcpClient client)
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

            Console.WriteLine("POP сервер EnergyMail готов к работе.");
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
                PopServer handler = new PopServer(listener.AcceptTcpClient());
                Console.WriteLine("Попытка подключения к серверу:");
                Thread thread = new System.Threading.Thread(new ThreadStart(handler.Run));
                thread.Start();
            }
        }

        private void Writer(string mes)
        {
            byte[] buf = Encoding.Default.GetBytes(mes + "\r\n");
            stream.Write(buf, 0, buf.Length);
        }

        private string Reader()
        {
            byte[] buf = new byte[10000];
            stream.Read(buf, 0, buf.Length);
            ASCIIEncoding encoding = new ASCIIEncoding();
            return (encoding.GetString(buf, 0, buf.Length));
        }

        private string ConvertFromBase64String(string line)
        {
            byte[] buf = new byte[1024];
            buf = Convert.FromBase64String(line);
            ASCIIEncoding encoding = new ASCIIEncoding();
            return(encoding.GetString(buf, 0, buf.Length));
        }

        private SqlCommand SqlCmd(SqlConnection con, string strCmd)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            cmd.CommandText = strCmd;
            cmd.CommandType = CommandType.Text;
            
            return cmd;
        }

        private void Run()
        {
            string command,mes,line = "";
            string login = "", password = "";
            writer.WriteLine("+OK POP server EnergyMail\r\n");
            bool authorization = false;
            SqlCommand cmd;

            while (true)
            {
                //line = reader.ReadLine();
                try
                {
                    line = reader.ReadLine();
                }
                catch (Exception err)
                {
                    Console.Error.WriteLine("Клиент разорвал соединение");
                    return;
                }

                if (output) Console.WriteLine("Получено сообщение: " + line);
                command = line.Substring(0, 4);                
                command = command.ToUpper();
                mes = line.Substring(command.Length);


                switch (command)
                {
                    case "APOP":
                        login = mes.Substring(line[0], line.IndexOf(" ") - line[0]);
                        password = mes.Substring(line.IndexOf(" "), line.IndexOf("\r\n") - line.IndexOf(" "));

                        cmd = new SqlCommand("Aauthorization", connection);
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.Add("@login", SqlDbType.VarChar);
                        cmd.Parameters["@login"].Value = login;

                        cmd.Parameters.Add("@password", SqlDbType.VarChar);
                        cmd.Parameters["@password"].Value = password;
                        try
                        {
                            Int32 rowsAffected = cmd.ExecuteNonQuery();
                            SqlDataReader rdr = cmd.ExecuteReader();
                            if (rdr.Read())
                            {
                                authorization = true;

                                cmd = new SqlCommand("CountOfMes", connection);
                                cmd.CommandType = CommandType.StoredProcedure;

                                cmd.Parameters.Add("@login", SqlDbType.VarChar);
                                cmd.Parameters["@login"].Value = login;

                                try
                                {
                                    Int32 rowsAffected1 = cmd.ExecuteNonQuery();
                                    SqlDataReader rdr1 = cmd.ExecuteReader();
                                    rdr1.Read();
                                    Writer("+OK " + login + " имеет " + rdr.GetSqlInt32(0) + " сообщений");
                                    rdr1.Close();
                                }

                                catch (Exception err)
                                {
                                    Writer("-ERR Паролья для " + login + " некорректен");
                                }
                                finally
                                {
                                    for (int i = 0; i < cmd.Parameters.Count; i++)
                                        cmd.Parameters.RemoveAt(i);                                    
                                }
                            }
                            else
                                Writer("-ERR Паролья для " + login + " некорректен");
                            rdr.Close();
                        }
                        catch (Exception err)
                        {
                            Writer("-ERR Паролья для " + login + " некорректен");
                        }
                        finally
                        {
                            for (int i = 0; i < cmd.Parameters.Count; i++)
                                cmd.Parameters.RemoveAt(i);
                        }
                        break;
                    case "USER":
                        login = line.Substring(5, line.Length - 5);;
                        Writer("+OK");

                        line = reader.ReadLine();
                        if (!line.Substring(0, 3).Equals("PASS", StringComparison.OrdinalIgnoreCase))
                        {
                            password = line.Substring(5, line.Length - 5);


                            //SqlCmd(connection, "exec Aauthorization '" + Convert.ToString(login) + "', '" + Convert.ToString(password) + "'");

                            cmd = new SqlCommand("Aauthorization", connection);
                            cmd.CommandType = CommandType.StoredProcedure;

                            cmd.Parameters.Add("@login", SqlDbType.VarChar);
                            cmd.Parameters["@login"].Value = login;

                            cmd.Parameters.Add("@password", SqlDbType.VarChar);
                            cmd.Parameters["@password"].Value = password;
                            try
                            {
                                Int32 rowsAffected = cmd.ExecuteNonQuery();
                                SqlDataReader rdr = cmd.ExecuteReader();
                                if (rdr.Read())
                                {
                                    Writer("+OK Почтовый ящик " + login + " действительно существует");
                                    authorization = true;
                                }
                                else
                                    Writer("-ERR Введенный логин или/и пароль не существует");
                                rdr.Close();
                                
                            }
                            catch (Exception err)
                            {
                                Writer("-ERR Почтовогоо ящика с именем " + login + " не существует");
                            }
                            finally
                            {
                                for (int i = 0; i < cmd.Parameters.Count; i++)
                                    cmd.Parameters.RemoveAt(i);
                            }
                        }
                        break;                    
                    case "QUIT":
                        Writer("+OK ");
                        cmd = new SqlCommand("CheckConditeon", connection);
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.Add("@receiver", SqlDbType.VarChar);
                        cmd.Parameters["@receiver"].Value = login;

                        try
                        {
                            Int32 rowsAffected = cmd.ExecuteNonQuery();                            
                        }

                        catch (Exception err)
                        {
                            Console.WriteLine("Ошибка при удалении отмеченных сообщений");
                        }
                        finally
                        {
                            for (int i = 0; i < cmd.Parameters.Count; i++)
                                cmd.Parameters.RemoveAt(i);
                        }
                        Console.WriteLine("Подключение к серверу завершно.");                     
                        return;
                    case "STAT":
                        if (authorization)
                        {
                            cmd = new SqlCommand("CountOfMes", connection);
                            cmd.CommandType = CommandType.StoredProcedure;

                            cmd.Parameters.Add("@receiver", SqlDbType.VarChar);
                            cmd.Parameters["@receiver"].Value = login;

                            try
                            {
                                Int32 rowsAffected = cmd.ExecuteNonQuery();
                                SqlDataReader rdr = cmd.ExecuteReader();
                                if (rdr.Read())
                                {
                                    int num = rdr.GetInt32(0);
                                    int size;
                                    if (num == 0) size = 0;
                                    else size = rdr.GetInt32(1);
                                    Writer("+OK " + Convert.ToString(num) + " " + Convert.ToString(size));
                                }
                                else
                                    Writer("-ERR");
                                rdr.Close();
                            }

                            catch (Exception err)
                            {
                                Writer("-ERR");
                            }
                            finally
                            {
                                for (int i = 0; i < cmd.Parameters.Count; i++)
                                    cmd.Parameters.RemoveAt(i);
                            }
                        }
                        break;
                    case "TOP ":
                        if (authorization)
                        {
                            int num = Convert.ToInt32(mes.Remove(mes.IndexOf(" ")));
                            //int pos_ = mes.IndexOf(" ");
                            //int len = mes.Length - 1;
                            //int numOfLines = Convert.ToInt32(mes.Substring(pos_,len));

                            cmd = new SqlCommand("GetMail", connection);
                            cmd.CommandType = CommandType.StoredProcedure;

                            cmd.Parameters.Add("@receiver", SqlDbType.VarChar);
                            cmd.Parameters["@receiver"].Value = login;

                            cmd.Parameters.Add("@mesNum", SqlDbType.Int);
                            cmd.Parameters["@mesNum"].Value = num;

                            try
                            {
                                Int32 rowsAffected = cmd.ExecuteNonQuery();
                                SqlDataReader rdr = cmd.ExecuteReader();
                                rdr.Read();
                                String Message = "+OK\r\nfrom: " + rdr.GetString(1) + "\r\n" + "subject: " + rdr.GetString(3) + "\r\n" + "date: " + Convert.ToString(rdr.GetDateTime(4)) + "\r\n" + "Content-Transfer-Encoding: " + Convert.ToString(rdr.GetInt32(7)) + "bit" + "\r\n\r\n" + rdr.GetString(8) + "\r\n\r\n";
                                byte[] buff = Encoding.Default.GetBytes(Message + "\r\n");
                                stream.Write(buff, 0, buff.Length);

                                Writer(".\r\n");
                                rdr.Close();
                            }

                            catch (Exception err)
                            {
                                Writer("-ERR\r\n");
                            }
                            finally
                            {
                                for (int i = 0; i < cmd.Parameters.Count; i++)
                                    cmd.Parameters.RemoveAt(i);
                            }
                        }
                        break;
                    case "LIST":
                        if (authorization)
                        {
                            int num = 0;
                            num = Convert.ToInt32(line.Substring(5));

                            cmd = new SqlCommand("GetInform", connection);
                            cmd.CommandType = CommandType.StoredProcedure;

                            cmd.Parameters.Add("@receiver", SqlDbType.VarChar);
                            cmd.Parameters["@receiver"].Value = login;

                            cmd.Parameters.Add("@mesNum", SqlDbType.Int);
                            cmd.Parameters["@mesNum"].Value = num;
                            try
                            {
                                Int32 rowsAffected = cmd.ExecuteNonQuery();
                                SqlDataReader rdr = cmd.ExecuteReader();
                                rdr.Read();

                                if (num == 0)
                                {
                                    Writer("+OK " + Convert.ToString(rdr.GetSqlInt32(0)) + " " + Convert.ToString(rdr.GetSqlInt32(1)));
                                    rdr.Close();

                                    cmd = new SqlCommand("GetInform", connection);
                                    cmd.CommandType = CommandType.StoredProcedure;

                                    cmd.Parameters.Add("@receiver", SqlDbType.VarChar);
                                    cmd.Parameters["@receiver"].Value = login;

                                    cmd.Parameters.Add("@mesNum", SqlDbType.Int);
                                    cmd.Parameters["@mesNum"].Value = num;
                                    try
                                    {
                                        Int32 rowsAffected1 = cmd.ExecuteNonQuery();
                                        SqlDataReader rdr1 = cmd.ExecuteReader();
                                        for (int i = 1; i <= num; i++)
                                        {
                                            rdr1.Read();
                                            Writer(Convert.ToString(i) + " " + Convert.ToString(rdr1.GetSqlInt32(0)));
                                        }
                                        Writer(".");
                                        rdr1.Close();
                                    }
                                    catch (Exception err1)
                                    {
                                        Writer("-ERR");
                                    }
                                    finally
                                    {
                                        for (int i = 0; i < cmd.Parameters.Count; i++)
                                            cmd.Parameters.RemoveAt(i);
                                    }
                                }
                                else
                                {                                    
                                    Writer("+OK " + num + " " + Convert.ToString(rdr.GetSqlInt32(0)));
                                    rdr.Close();
                                    Writer(".");
                                }
                            }

                            catch (Exception err)
                            {
                                Writer("-ERR");
                            }
                            finally
                            {
                                for (int i = 0; i < cmd.Parameters.Count; i++)
                                    cmd.Parameters.RemoveAt(i);
                            }
                        }

                        break;
                    case "RETR":
                        if (authorization)
                        {
                            int num = Convert.ToInt32(line.Substring(4));

                            cmd = new SqlCommand("GetInform", connection);
                            cmd.CommandType = CommandType.StoredProcedure;

                            cmd.Parameters.Add("@receiver", SqlDbType.VarChar);
                            cmd.Parameters["@receiver"].Value = login;

                            cmd.Parameters.Add("@mesNum", SqlDbType.Int);
                            cmd.Parameters["@mesNum"].Value = num;

                            try
                            {
                                Int32 rowsAffected = cmd.ExecuteNonQuery();
                                SqlDataReader rdr = cmd.ExecuteReader();
                                rdr.Read();
                                Writer("+OK "+Convert.ToString(rdr.GetSqlInt32(0))+" octets");
                                rdr.Close();

                                cmd = new SqlCommand("GetMail", connection);
                                cmd.CommandType = CommandType.StoredProcedure;

                                cmd.Parameters.Add("@receiver", SqlDbType.VarChar);
                                cmd.Parameters["@receiver"].Value = login;

                                cmd.Parameters.Add("@mesNum", SqlDbType.Int);
                                cmd.Parameters["@mesNum"].Value = num;

                                try
                                {
                                    Int32 rowsAffected1 = cmd.ExecuteNonQuery();
                                    rdr = cmd.ExecuteReader();
                                    rdr.Read();
                                    String Message = "mime-version: " + Convert.ToString(rdr.GetString(0) + "\r\nFrom: " + rdr.GetString(1) + "\r\nTo: " + rdr.GetString(2) + "@EnergyMail.ru\r\nSubject: " + rdr.GetString(3) + "\r\nDate: " + Convert.ToString(rdr.GetDateTime(4)) + "\r\nPriority: " + rdr.GetString(5) + "\r\nContent-Type: " + rdr.GetString(6) + "\r\nContent-Transfer-Encoding: " + Convert.ToString(rdr.GetInt32(7)) + "bit" + "\r\n\r\n" + rdr.GetString(8) + "\r\n");
                                    byte[] buff = Encoding.Default.GetBytes(Message);
                                    stream.Write(buff, 0, buff.Length);

                                    Writer(".\r\n");
                                    rdr.Close();
                                }

                                catch (Exception err)
                                {
                                    Writer("-ERR");
                                }
                                finally
                                {
                                    for (int i = 0; i < cmd.Parameters.Count; i++)
                                        cmd.Parameters.RemoveAt(i);
                                }
                            }

                            catch (Exception err)
                            {
                                Writer("-ERR");
                            }
                            finally
                            {
                                for (int i = 0; i < cmd.Parameters.Count; i++)
                                    cmd.Parameters.RemoveAt(i);
                            }
                        }
                        break;
                    case "DELE":
                        if (authorization)
                        {
                            int num = Convert.ToInt32(line.Substring(4));

                            cmd = new SqlCommand("CheckMes", connection);
                            cmd.CommandType = CommandType.StoredProcedure;

                            cmd.Parameters.Add("@receiver", SqlDbType.VarChar);
                            cmd.Parameters["@receiver"].Value = login;

                            cmd.Parameters.Add("@mesNum", SqlDbType.Int);
                            cmd.Parameters["@mesNum"].Value = num;

                            try
                            {
                                Int32 rowsAffected = cmd.ExecuteNonQuery();
                                Writer("+OK Сообщение " + Convert.ToString(num) + " удалено");
                            }

                            catch (Exception err)
                            {
                                Writer("-ERR Сообщение " + Convert.ToString(num) + " не существует");
                            }
                            finally
                            {
                                for (int i = 0; i < cmd.Parameters.Count; i++)
                                    cmd.Parameters.RemoveAt(i);
                            }
                        }
                        break;
                    case "NOOP":
                        if (authorization)
                        {
                            Writer("+OK");
                        }
                        break;
                    case "RSET":
                        if (authorization)
                        {
                            cmd = new SqlCommand("ResetOfConditeon", connection);
                            cmd.CommandType = CommandType.StoredProcedure;

                            cmd.Parameters.Add("@receiver", SqlDbType.VarChar);
                            cmd.Parameters["@receiver"].Value = login;

                            try
                            {
                                Int32 rowsAffected = cmd.ExecuteNonQuery();
                                Writer("+OK");
                            }

                            catch (Exception err)
                            {
                                Writer("-ERR");
                            }
                            finally
                            {
                                for (int i = 0; i < cmd.Parameters.Count; i++)
                                    cmd.Parameters.RemoveAt(i);
                            }


                        }
                        break;

                }
            }
        }
    }
}
