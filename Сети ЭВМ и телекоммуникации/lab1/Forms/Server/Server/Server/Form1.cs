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

namespace Server
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        TcpListener server = null;

        private void Form1_Load(object sender, EventArgs e)
        {
            richTextBox1.Text = "Ожидание запуска сервера...";
        }

        private void button1_Click(object sender, EventArgs e)
        {
            richTextBox1.Text += "\n" + "Ожидание соединения с клиентом...";

            try
            {
                IPAddress localAddr;

                if (checkBox1.Checked)
                {
                    localAddr = IPAddress.Any;
                }
                else
                {
                    localAddr = IPAddress.Parse(textBox1.Text.ToString()); // Считываем IP адрес
                }
                
                Int32 port = Convert.ToInt32(textBox2.Text.ToString()); // Считываем порт
                Byte[] bytes = new Byte[256]; // Буфер для входящих данных      

                server = new TcpListener(localAddr, port); // Прослушиваем подключения от TCP-клиентов сети
                server.Start(); // Запускаем ожидание входящих запросов на подключение 

                // Цикл для обработки клиентов
                // while (true)
                {
                    TcpClient client = server.AcceptTcpClient(); // Ожидаем подключение клиента
                    richTextBox1.Text += "\n" + "Соединение выполнено!";                    
                    
                    NetworkStream stream = client.GetStream(); // Создаем поток для полючение и отправки данных

                    richTextBox1.Text += "\n" + "Сообщение от клиента: ";

                    int i;
                    String data; // Строка для полученных данных
                    
                    // Цикл получения данных от клиента
                    while ((i = stream.Read(bytes, 0, bytes.Length)) != 0)
                    {                        
                        data = System.Text.Encoding.ASCII.GetString(bytes, 0, i); // Перевод байт дынных в символы ASCII-таблицы
                        richTextBox1.Text += "\n" + data.ToString();  // Выводим строку  
                        
                        data = data.ToUpper(); // Обрабатываем данные, полученные от клиента

                        byte[] msg = System.Text.Encoding.ASCII.GetBytes(data); // Формируем массив байт
                        
                        stream.Write(msg, 0, msg.Length);  // Отправляем ответ
                        richTextBox1.Text += "\n" + "Ответ клиенту: " + data.ToString();                        
                    } 
                                        
                    client.Close(); //Закрываем соединение
                } 
            }
            catch (SocketException Exception)
            {                
                richTextBox1.Text += "\n" + "Ошибка на сокете: " + Exception.ToString();        
            }
            finally
            {
                // Завершаем прослушивание клиентов
                server.Stop();
                richTextBox1.Text += "\n" + "Сервер отключен!";   
            }

        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox1.Checked)
            {
                textBox1.Enabled = false;
            }
            else
            {
                textBox1.Enabled = true;
            }
        }
               
    }
}
