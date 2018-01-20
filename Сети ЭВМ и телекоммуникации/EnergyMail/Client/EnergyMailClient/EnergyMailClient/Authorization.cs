using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Diagnostics;
using System.Net.Mail;
using System.Net;

namespace EnergyMailClient
{
    public partial class Authorization : Form
    {
        public Authorization()
        {
            InitializeComponent();
        }

        private void Authorization_Load(object sender, EventArgs e)
        {
            PasswordBox.PasswordChar = '*';  // Прячем пароль за звездочками            
        }

        private void Authorization_Activated(object sender, EventArgs e)
        {
            SmtpServerBox.Text = SmtpServer.smtpHost.ToString() + " : " + SmtpServer.smtpPort.ToString();  // Выводим Адрес и Порт Smtp-сервера
            PopServerBox.Text = PopServer.popHost.ToString() + " : " + PopServer.popPort.ToString();  // Выводим Адрес и Порт Pop-сервера
            RegServerBox.Text = RegServer.regHost.ToString() + " : " + RegServer.regPort.ToString();  // Выводим Адрес и Порт сервера регистрации
        }   

        private void настройкаToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Options OptionForm = new Options();
            OptionForm.ShowDialog();
        }

        private void выходToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.Exit();  // Закрываем форму
        }

        //--- Ссылки на допольнительную информацию

        private void ссылкаНаRFCоригиналToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Process.Start("http://www.rfc-editor.org/rfc/rfc5321.txt");
        }

        private void ссылкаНаRFCпереводToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Process.Start("http://rfc2.ru/5321.rfc");            
        }        

        private void rFCToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Process.Start("http://www.rfc-editor.org/rfc/rfc1939.txt");
        }

        private void rFCToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            Process.Start("http://rfc2.ru/1939.rfc");
        }

        private void sMTPToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Process.Start("http://ru.wikipedia.org/wiki/SMTP");
        }

        private void pOPToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Process.Start("http://ru.wikipedia.org/wiki/POP3");
        }        

        //---

        // Окно регистрации
        private void регистрацияToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Registration RegForm = new Registration();
            RegForm.ShowDialog();
        }

        // Открываем почтовый клиент
        private void Enter_Click(object sender, EventArgs e)
        {
            if (LoginBox.Text == "")
            {
                MessageBox.Show("Введите логин", "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                User.Login = LoginBox.Text;  // Логин
                if (PasswordBox.Text == "")
                {
                    MessageBox.Show("Введите пароль", "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                else
                {
                    User.Password = PasswordBox.Text;  // Пароль
                    EnergyMailClient MainForm = new EnergyMailClient();
                    MainForm.ShowDialog();
                } 
            }
        }
        
        // Информация об авторах
        private void авторыToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Authors AuthorsForm = new Authors();
            AuthorsForm.ShowDialog();
        }

        private void Authorization_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.ExitThread();  // Завершаем все потоки
            Application.Exit();  // Завершаем приложение и все его окна
        }                   
    }
}
