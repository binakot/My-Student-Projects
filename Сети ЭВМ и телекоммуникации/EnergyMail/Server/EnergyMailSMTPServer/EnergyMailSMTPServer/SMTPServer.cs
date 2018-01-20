using System;
using System.Data;
using System.Text;
using System.Net.Sockets;
using System.Threading;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Security.Cryptography.X509Certificates;

namespace ConsoleApplication1
{
    class SMTPServer
    {
        private TcpClient client, friendlyServer;
        private NetworkStream stream;
        private System.IO.StreamReader reader;
        private System.IO.StreamWriter writer;
        private static int port = 25;
        public static SqlConnection connection = new SqlConnection();
        public static bool output = true;
        public struct otherConnection
        {
            public string Login;
            public TcpClient serv;            
        }     
        private string key = "ewq";

        private SMTPServer(TcpClient client)
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

            Console.WriteLine("SMTP сервер EnergyMail готов к работе.");
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
                SMTPServer handler = new SMTPServer(listener.AcceptTcpClient());
                
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
            return(Encoding.Default.GetString(buff, 0, readBytes));
            /*byte[] buf = new byte[10000];
            stream.Read(buf, 0, buf.Length);
            ASCIIEncoding encoding = new ASCIIEncoding();
            return (encoding.GetString(buf, 0, buf.Length));*/
        }

        private string DecodeFromKOI8(string strKOI8)
        {
            byte[] dstData = System.Convert.FromBase64String(strKOI8);
            Encoding dstEnc = Encoding.GetEncoding("koi8-r");
            char[] chars = new char[dstEnc.GetCharCount(dstData, 0, dstData.Length)];
            dstEnc.GetChars(dstData, 0, dstData.Length, chars, 0);
            string unicodeString = new string(chars);
            return unicodeString;
        }

        private string DecodeFrom1251(string str)
        {
            Encoding win1251 = Encoding.GetEncoding("windows-1251");
            Encoding koi8r = Encoding.GetEncoding("koi8-r");
            byte[] winBytes = win1251.GetBytes(str);
            byte[] koi8Bytes = Encoding.Convert(win1251, koi8r, winBytes, 0, winBytes.Length);
            string koi8rString = koi8r.GetString(winBytes, 0, winBytes.Length);
            return koi8rString;
        }

        private void Run()
        {                   
            String line = "", command, mes;
            string senderLogin = "", senderDomen = "", login = "", password = "";
            List<string> receiver = new List<string>();
            List<otherConnection> otherServ = new List<otherConnection>();

            bool auth = false, mail = false, rcpt = false, forwarding = false;

            SqlCommand cmd;
            DateTime date = DateTime.Now;

            Writer("220 EnergyMail");
            while (true)
            {
                //line = Reader();
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
                    case "EHLO":
                        Writer("250");
                        break;
                    case "QUIT":
                        Writer("221");
                        client.Close();
                        return;
                    case "AUTH":
                        Writer("334");

                        byte[] buf = new byte[1024];
                        //stream.Read(buf, 0, buf.Length);

                        line = reader.ReadLine();
                        buf = Convert.FromBase64String(line);
                        ASCIIEncoding encoding = new ASCIIEncoding();
                        login = encoding.GetString(buf, 0, buf.Length);
                        Writer("334");

                        line = reader.ReadLine();
                        buf = Convert.FromBase64String(line);
                        encoding = new ASCIIEncoding();
                        password = encoding.GetString(buf, 0, buf.Length);

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
                                Writer("235");
                                auth = true;
                            }
                            else
                                Writer("504");
                            rdr.Close();
                        }
                        catch (Exception err)
                        {
                            Writer("504 Неизвестный тип аутентификации");
                        }
                        finally
                        {
                            for (int i = 0; i < cmd.Parameters.Count; i++)
                                cmd.Parameters.RemoveAt(i);
                        }

                        break;
                    case "MAIL":
                        if (auth)
                        {
                            senderLogin = line.Substring(line.IndexOf("<") + 1, line.IndexOf("@") - line.IndexOf("<") - 1);
                            senderDomen = line.Substring(line.IndexOf("@") + 1, line.IndexOf(">") - line.IndexOf("@") - 1);

                            if (senderDomen == "energymail.ru")
                            {
                                cmd = new SqlCommand("ChackClientLogin", connection);
                                cmd.CommandType = CommandType.StoredProcedure;

                                cmd.Parameters.Add("@login", SqlDbType.VarChar);
                                cmd.Parameters["@login"].Value = senderLogin;
                                try
                                {
                                    Int32 rowsAffected = cmd.ExecuteNonQuery();
                                    SqlDataReader rdr = cmd.ExecuteReader();
                                    if (rdr.Read())
                                    {
                                        Writer("250 Почтовый ящик отправителя" + senderLogin + " действительно существует");
                                        mail = true;
                                    }
                                    else
                                        Writer("553 Недопустимое имя почтового ящика отправителя");
                                    rdr.Close();
                                }
                                catch (Exception err)
                                {
                                    Writer("553 Недопустимое имя почтового ящика отправителя");
                                }
                                finally
                                {
                                    for (int i = 0; i < cmd.Parameters.Count; i++)
                                        cmd.Parameters.RemoveAt(i);
                                }
                            }
                            else
                                Writer("253 Сервер отклонил адрес электронной почты");
                        }
                        break;
                    case "RCPT":
                        if (mail)
                        {                            
                            date = DateTime.Now;
                            string receiverDomen = line.Substring(line.IndexOf("@") + 1, line.IndexOf(".") - line.IndexOf("@") - 1);
                            string receiverLogin = line.Substring(line.IndexOf("<") + 1, line.IndexOf("@") - line.IndexOf("<") - 1);

                            if (receiverDomen.ToLower() == "energymail")
                            {
                                cmd = new SqlCommand("ChackClientLogin", connection);
                                cmd.CommandType = CommandType.StoredProcedure;

                                cmd.Parameters.Add("@login", SqlDbType.VarChar);
                                cmd.Parameters["@login"].Value = receiverLogin;
                                try
                                {
                                    Int32 rowsAffected = cmd.ExecuteNonQuery();
                                    SqlDataReader rdr = cmd.ExecuteReader();
                                    if (rdr.Read())
                                    {
                                        Writer("250 Почтовый ящик получателя" + receiverLogin + " действительно существует");
                                        receiver.Add(receiverLogin);
                                        rcpt = true;
                                    }
                                    else
                                        Writer("550 Недопустимое имя почтового ящика получателя");
                                    rdr.Close();                                     
                                }
                                catch (Exception err)
                                {
                                    Writer("550 Недопустимое имя почтового ящика получателя");
                                }
                                finally
                                {
                                    cmd.Parameters.RemoveAt(0);
                                }
                            }
                            else
                            {
                                cmd = new SqlCommand("GetForwardingList", connection);
                                cmd.CommandType = CommandType.StoredProcedure;
                                try
                                {
                                    Int32 rowsAffected = cmd.ExecuteNonQuery();
                                    SqlDataReader rdr = cmd.ExecuteReader();
                                    while (rdr.Read())
                                        if (receiverDomen.ToLower() == rdr.GetString(0).ToLower())
                                        {
                                            string IPserver = rdr.GetString(1);
                                            string pword = rdr.GetString(2);

                                            try
                                            {
                                                friendlyServer = new TcpClient(IPserver, 25);
                                            }
                                            catch (SocketException)
                                            {
                                                Console.WriteLine("ошибка при связи с удаленным сервером!");                                                
                                                return;
                                            }
                                            NetworkStream ns = friendlyServer.GetStream();
                                            
                                            encoding = new ASCIIEncoding();

                                            byte[] buff = Encoding.Default.GetBytes("forwarding\r\n");
                                            ns.Write(buff, 0, buff.Length);
                                            
                                            string message = Convert.ToBase64String(encoding.GetBytes(Convert.ToString(pword))) + "\r\n";
                                            // отправка пароля                                            
                                            buff = Encoding.Default.GetBytes(message);                                          
                                            ns.Write(buff, 0, buff.Length);
                                            // ожидаем подтверждения от сервера...
                                            buff = new byte[1024];
                                            int readBytes = ns.Read(buff, 0, buff.Length);
                                            message = Encoding.Default.GetString(buff, 0, readBytes);
                                            
                                            readBytes = ns.Read(buff, 0, buff.Length);
                                            message = Encoding.Default.GetString(buff, 0, readBytes);
                                            if (message.Substring(0, 3).Equals("250"))
                                            {
                                                //отправка получателя для проверки
                                                buff = Encoding.Default.GetBytes("To <" + senderLogin + ">\r\n");
                                                ns.Write(buff, 0, buff.Length);

                                                readBytes = ns.Read(buff, 0, buff.Length);
                                                //при положительном ответе
                                                message = Encoding.Default.GetString(buff, 0, readBytes);
                                                if (message.Substring(0, 3).Equals("250"))
                                                {
                                                    otherConnection oc = new otherConnection();
                                                    oc.Login = receiverLogin; oc.serv = friendlyServer;
                                                    otherServ.Add(oc);
                                                    Writer("250");
                                                    rcpt = true;
                                                }
                                                else
                                                {
                                                    Writer("550 Недопустимое имя почтового ящика получателя");
                                                    friendlyServer.Close();
                                                }
                                                                                                                                                                                           
                                                //ns.Close();                                                
                                            }
                                            else
                                            {
                                                Writer("550 Недопустимое имя почтового ящика получателя");
                                            }
                                        }
                                    rdr.Close();
                                }
                                catch (Exception err)
                                {
                                    Console.WriteLine("Ошибка при обращении к базе данных!");
                                }                                
                            }                           
                        }                        
                        break;

                    case "DATA":
                        if (rcpt || forwarding)
                        {
                            Writer("354");  
                            line = Reader();
                            for (int i = 0; i < otherServ.Count; i++)
                            {
                                NetworkStream ns = otherServ[i].serv.GetStream();

                                byte[] buff = Encoding.Default.GetBytes("DATA\r\n");
                                ns.Write(buff, 0, buff.Length);                                                               

                                int readBytes = ns.Read(buff, 0, buff.Length);
                                if (Encoding.Default.GetString(buff, 0, readBytes) == "354")
                                {
                                    buff = Encoding.Default.GetBytes(line);
                                    ns.Write(buff, 0, buff.Length);
                                    Console.WriteLine("Пересылка сообщения на сервер EnergyGmail");
                                }
                                else
                                {
                                    buff = Encoding.Default.GetBytes("503 Неверная последовательность команд");
                                    ns.Write(buff, 0, buff.Length);
                                }

                                buff = Encoding.Default.GetBytes("QUIT\r\n");
                                ns.Write(buff, 0, buff.Length);

                                otherServ[i].serv.Close();
                                ns.Close();
                            }
                            if (receiver.Count == 0) 
                            {
                                Writer("250 OK");
                                break;
                            }

                            StringBuilder data = new StringBuilder();
                            String mime = "", from = "", to = "", subject = "", date_ = "", priority = "", content = "", contentTE = "", message = "";
                            int CTE = 0;
                            //line = Reader();                            

                            if (line != null && line != ".")
                            {
                                //line = line.Remove(0, line.IndexOf("\r\n") + 2);
                                mime = line.Substring(line.IndexOf(":") + 1, line.IndexOf("\r\n") - line.IndexOf(":") - 1);
                                line = line.Remove(0, line.IndexOf("\r\n") + 2);
                                
                                from = line.Substring(line.IndexOf("<") + 1, line.IndexOf(">") - line.IndexOf("<") - 1);
                                line = line.Remove(0, line.IndexOf("\r\n") + 2);
                                
                                to = line.Substring(line.IndexOf("<") + 1, line.IndexOf("@") - line.IndexOf("<") - 1);
                                line = line.Remove(0, line.IndexOf("\r\n") + 2);
                                
                                subject = line.Substring(line.IndexOf(":") + 1, line.IndexOf("\r\n") - line.IndexOf(":") - 1);
                                line = line.Remove(0, line.IndexOf("\r\n") + 2);
                                
                                date_ = line.Substring(line.IndexOf(":") + 1, line.IndexOf("\r\n") - line.IndexOf(":") - 1);
                                line = line.Remove(0, line.IndexOf("\r\n") + 2);
                                
                                priority = line.Substring(line.IndexOf(":") + 2, line.IndexOf("\r\n") - line.IndexOf(":") - 1);
                                line = line.Remove(0, line.IndexOf("\r\n") + 2);
                                
                                content = line.Substring(line.IndexOf(":") + 2, line.IndexOf("\r\n") - line.IndexOf(":") - 1);
                                line = line.Remove(0, line.IndexOf("\r\n") + 2);
                                
                                contentTE = line.Substring(line.IndexOf(":") + 2, line.IndexOf("\r\n") - line.IndexOf(":") - 1);
                                CTE = Convert.ToInt32(contentTE.Substring(0, contentTE.IndexOf("b")));
                                line = line.Remove(0, line.IndexOf("\r\n\r\n")+4);

                                message = line.Remove(line.IndexOf("\r"), line.Length - line.IndexOf("\r"));
                            }
                            if (output)
                            {
                                Console.WriteLine("Received email with mime-version: {0}", mime);
                                Console.WriteLine("From: {0}", from);
                                Console.WriteLine("To: {0}", to);
                                Console.WriteLine("Subject: {0}", subject);
                                Console.WriteLine("Date: {0}", date_);
                                Console.WriteLine("Priority: {0}", priority);
                                Console.WriteLine("Content-Type: {0}", content);
                                Console.WriteLine("Content-Transfer-Encoding: {0}", contentTE);
                                Console.WriteLine("Message: {0}", message);
                            }
                            //Writer("250 OK");

                            cmd = new SqlCommand("AddMail", connection);
                            cmd.CommandType = CommandType.StoredProcedure;
                            for (int i = 0; i < receiver.Count; i++)
                            {                                
                                cmd.Parameters.Add("@mime", SqlDbType.VarChar);
                                cmd.Parameters["@mime"].Value = mime;

                                cmd.Parameters.Add("@from", SqlDbType.VarChar);
                                cmd.Parameters["@from"].Value = from;

                                cmd.Parameters.Add("@to", SqlDbType.VarChar);
                                cmd.Parameters["@to"].Value = to;

                                cmd.Parameters.Add("@Subject", SqlDbType.VarChar);
                                cmd.Parameters["@Subject"].Value = subject;

                                cmd.Parameters.Add("@date", SqlDbType.Date);
                                cmd.Parameters["@date"].Value = date;

                                cmd.Parameters.Add("@priority", SqlDbType.VarChar);
                                cmd.Parameters["@priority"].Value = priority;

                                cmd.Parameters.Add("@Content", SqlDbType.VarChar);
                                cmd.Parameters["@Content"].Value = content;

                                cmd.Parameters.Add("@ContentTE", SqlDbType.Int);
                                cmd.Parameters["@ContentTE"].Value = CTE;

                                cmd.Parameters.Add("@Message", SqlDbType.VarChar);
                                cmd.Parameters["@Message"].Value = message;
                                try
                                {
                                    Int32 rowsAffected = cmd.ExecuteNonQuery();
                                    Writer("250 Сообщения для " + receiver[i] + " утверждено к доставке");
                                    Console.WriteLine("Осуществлена передача сообщения от {0}, на почтовый ящик {1}", senderLogin, receiver[i]);
                                }
                                catch (Exception err)
                                {
                                    Writer("503 Bad sequence of commands");
                                }
                                finally
                                {
                                    for (int j = 0; j < cmd.Parameters.Count; j++)
                                        cmd.Parameters.RemoveAt(j);
                                }
                            }
                        }

                        break;
                    case "FORWARDING":
                        line = reader.ReadLine();
                        buf = Convert.FromBase64String(line);
                        encoding = new ASCIIEncoding();

                        if (encoding.GetString(buf, 0, buf.Length) == key)
                        {
                            Writer("250");
                            //ожидани логина для проверки
                            line = reader.ReadLine();
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
                                {
                                    Writer("250");
                                    receiver.Add(login);
                                }
                                else
                                    Writer("550 Недопустимое имя почтового ящика получателя");
                                rdr.Close();    
                            }
                            catch (Exception err)
                            {
                                Writer("550 Недопустимое имя почтового ящика получателя");
                            }
                            finally
                            {
                                cmd.Parameters.RemoveAt(0);
                            }

                            forwarding = true;
                        }
                                                

                        break;
                    default:
                        Writer("On messege");
                        return;
                }
            }
        }

        /*private string GetEmailInformation()
        {
            StringBuilder msg = new StringBuilder();
            msg.Append("MIME-Version: 1.0\r\n");
            msg.Append("From: <" + this.mailMessage.From.ToString() + ">\r\n");
            msg.Append("To: <" + this.mailMessage.To.ToString() + ">\r\n");
            msg.Append("Subject: " + this.mailMessage.Subject.ToString() + "\r\n");
            msg.Append("Date: " + DateTime.Now.ToString("F") + "\r\n");

            switch (this.mailMessage.MailPriority)
            {
                case MailSendPriority.HIGH:
                    msg.Append("Priority: High\r\n");
                    break;
                case MailSendPriority.LOW:
                    msg.Append("Priority: Low\r\n");
                    break;
                case MailSendPriority.NORMAL:
                    msg.Append("Priority: Normal\r\n");
                    break;
            }

            switch (this.mailMessage.MailType)
            {
                case MailEncodingType.PLAINTEXT:
                    msg.Append("Content-Type: text/plain; ");
                    break;
                case MailEncodingType.HTML:
                    msg.Append("Content-Type: text/html; ");
                    break;
            }

            msg.Append("charset=windows-1251\r\n");
            msg.Append("Content-Transfer-Encoding: 7bit\r\n");
            msg.Append("\r\n");
            msg.Append(this.mailMessage.Message.ToString() + "\r\n\r\n");

            msg.Append("\r\n.\r\n");

            return msg.ToString();
        }*/

        public static byte[] ConvertFromBase64String(string base64String)
        {
            base64String = base64String.Trim(new char[] { '\r', '\n' });
            base64String = base64String.Replace("\r\n", "");
            return Convert.FromBase64String(base64String);
        }

        public string base64Decode(byte[] todecode_byte)
        {
            try
            {
                System.Text.UTF8Encoding encoder = new System.Text.UTF8Encoding();
                System.Text.Decoder utf8Decode = encoder.GetDecoder();

                //byte[] todecode_byte = Convert.FromBase64String(data);
                int charCount = utf8Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
                char[] decoded_char = new char[charCount];
                utf8Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
                string result = new String(decoded_char);
                return result;
            }
            catch (Exception e)
            {
                throw new Exception("Error in base64Decode" + e.Message);
            }
        }
    }
}