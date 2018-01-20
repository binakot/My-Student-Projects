using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Net.Sockets;
using System.IO;

namespace NetworkFileSender
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        string splitter = "'\\'";  // Разделитель
        string fName;  // Имя файла
        string[] split = null;  // Путь файла
        byte[] clientData;  // Данные о файле    

        // Выбор файла для передачи
        private void button1_Click(object sender, EventArgs e)
        {
            char[] delimiter = splitter.ToCharArray();  // Знак разделения в массиве символов
            openFileDialog1.ShowDialog();  // Выбираем файл
            textBox1.Text = openFileDialog1.FileName;  // Выводим путь файла
            split = textBox1.Text.Split(delimiter);  // Путь файла по разделителям
            int limit = split.Length;  // Порядок вложенности файла
            fName = split[limit - 1].ToString();  // Имя файла с путем
            if (textBox1.Text != null)  // Если файл указан
                button2.Enabled = true;  // То можно отправлять
        }

        // Отправка файла
        private void button2_Click(object sender, EventArgs e)
        {
            Socket clientSock = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);  // Сокет для передачи файла от клиента к серверу

            byte[] fileName = Encoding.UTF8.GetBytes(fName);  // Имя файла
            byte[] fileData = File.ReadAllBytes(textBox1.Text);  // Файл
            byte[] fileNameLen = BitConverter.GetBytes(fileName.Length);  // Длина имени файла
            clientData = new byte[4 + fileName.Length + fileData.Length];  // Формируем данные о файле
            // Распределяем данные о файле по отдельным массивам байт
            fileNameLen.CopyTo(clientData, 0);
            fileName.CopyTo(clientData, 4);
            fileData.CopyTo(clientData, 4 + fileName.Length);

            clientSock.Connect(textBox2.Text, Convert.ToInt32(textBox3.Text));  // Адрес сервера для отправки файла
            clientSock.Send(clientData);  // Отправляем файл
            clientSock.Close();  // Закрываем соединение
            MessageBox.Show("Файл успешно отправлен");
        }
    }
}
