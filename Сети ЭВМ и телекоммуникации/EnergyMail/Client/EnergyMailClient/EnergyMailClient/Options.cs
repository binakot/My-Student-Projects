using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace EnergyMailClient
{
    public partial class Options : Form
    {
        public Options()
        {
            InitializeComponent();
        }        

        // Проверяем доступность соединения с введенным Smtp-сервером
        private void CheckSmtpButton_Click(object sender, EventArgs e)
        {
            SmtpServer.check(SmtpAddressBox.Text.ToString(), Convert.ToInt32(SmtpPortBox.Text));            
        }

        // Проверяем доступность соединения с введенным Pop-сервером
        private void CheckPopButton_Click(object sender, EventArgs e)
        {
            PopServer.check(PopAddressBox.Text.ToString(), Convert.ToInt32(PopPortBox.Text));
        }

        // Проверяем доступность соединения с введенным Reg-сервером
        private void CheckRegButton_Click(object sender, EventArgs e)
        {
            RegServer.check(RegAddressBox.Text.ToString(), Convert.ToInt32(RegPortBox.Text));
        }  
      
        // Применить новые почтовые серверы
        private void Accept_Click(object sender, EventArgs e)
        {
            SmtpServer.smtpHost = SmtpAddressBox.Text;
            SmtpServer.smtpPort = Convert.ToInt32(SmtpPortBox.Text);
            PopServer.popHost = PopAddressBox.Text;
            PopServer.popPort = Convert.ToInt32(PopPortBox.Text);
            RegServer.regHost = RegAddressBox.Text;
            RegServer.regPort = Convert.ToInt32(RegPortBox.Text);
        }

        // При загрузке формы выводим текущие серверы
        private void Options_Load(object sender, EventArgs e)
        {
            SmtpAddressBox.Text = SmtpServer.smtpHost;
            SmtpPortBox.Text = SmtpServer.smtpPort.ToString();
            PopAddressBox.Text = PopServer.popHost;
            PopPortBox.Text = PopServer.popPort.ToString();
            RegAddressBox.Text = RegServer.regHost;
            RegPortBox.Text = RegServer.regPort.ToString();
        }                     
    }
}
