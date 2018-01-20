using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Net;
using System.Net.Sockets;

namespace Client
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            richTextBox1.Text = "Подключитесь к серверу...";
        }

        private TcpClient client;
        private NetworkStream stream;        
        private Int32 port;
        private string server;

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {                
                server = textBox1.Text.ToString();
                port = Convert.ToInt32(textBox2.Text.ToString());                      
                
                client = new TcpClient(server, port); // Создаем TCP-клиента с ip и портом, как у сервера 

                richTextBox1.Text += "\n" + "Подключение к серверу выполнено";
            }
            catch (ArgumentNullException Exception)
            {
                richTextBox1.Text += "\n" + "Ошибка в передачи указателя NULL: " + Exception.ToString();                 
            }
            catch (SocketException Exception)
            {
                richTextBox1.Text += "\n" + "Ошибка на сокете: " + Exception.ToString();   
            }           
        }

        private void textBox3_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                Byte[] data = System.Text.Encoding.UTF8.GetBytes(textBox3.Text.ToString()); // Формируем буфер байт, содержащий сообщение 

                stream = client.GetStream(); // Формируем поток для отправки и получения данных
                stream.Write(data, 0, data.Length); //Отправляем сообщение по установленному соединению

                richTextBox1.Text += "\n" + "Сообщение серверу: " + textBox3.Text.ToString();

                data = new Byte[256]; // Буфер для ответа сервера                
                String responseData = String.Empty; // Строка ответа

                Int32 bytes = stream.Read(data, 0, data.Length);
                responseData = System.Text.Encoding.UTF8.GetString(data, 0, bytes);
                richTextBox1.Text += "\n" + "Ответ от сервера: " + responseData.ToString();   
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            // Закрываем все
            stream.Close();
            client.Close();
            richTextBox1.Text += "\n" + "Соединение разорвано";
        }              
    }
}
