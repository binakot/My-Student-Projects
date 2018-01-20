using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Threading;
using System.Collections;
using System.Resources;
using System.IO;
using System.Text.RegularExpressions;

namespace EnergyMailClient
{
    public partial class EnergyMailClient : Form
    {    
        public EnergyMailClient()
        {
            InitializeComponent();
        }        

        //--- Отправка сообщений
              
        // Очистка полей ввода
        private void Clear_Click(object sender, EventArgs e)
        {
            FromBox.Text = "";
            ToBox.Text = "";
            SubjectBox.Text = "";
            MsgBox.Text = "";
        }

        // Отправить письмо
        private void Send_Click(object sender, EventArgs e)
        {  
            MailMessage mail_message = new MailMessage();  // Создаем сообщение
            mail_message.From = this.FromBox.Text;  // От кого
            mail_message.To = this.ToBox.Text;  // Кому            
            mail_message.Subject = this.SubjectBox.Text;  // Тема 
            mail_message.Message = this.MsgBox.Text; // Текст сообщения           

            Thread thread = new Thread(new ParameterizedThreadStart(this.SendEmail));  // Поток для передачи сообщения
            thread.Start(mail_message);  // Отправляем сообщение
        }        

        private void SendEmail(object mail_msg)
        {
            try
            {
                MailMessage mail_message = (MailMessage)mail_msg;

                SmtpClient smtp = new SmtpClient(SmtpServer.smtpHost, SmtpServer.smtpPort);  // Smtp клиент для отправки сообщения
                smtp.UserName = User.Login;  // Логин
                smtp.Password = User.Password;  // Пароль 
                if (smtp.SendMail(mail_message) == 1)  // Отправялем сообщение       
                {
                    MessageBox.Show("Сообщение было отправлено.", "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            catch (SmtpClientException obj)
            {
                MessageBox.Show(obj.ErrorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }            
        }

        //---

        //--- Мои сообщения  

        private delegate void InboxItemEventHandler(ListViewItem item);
        private delegate void UpdatePopMessageHeaderEventHandler(string from, string to, string subject);
        private delegate void WritePopMessageEventHandler(string content);

        Pop3Client pop_client = new Pop3Client();
        Pop3Client pop = null;
        string email = "";
        int msg_id = 0;

        // Проверить почтовый ящик
        private void CheckMailButton_Click(object sender, EventArgs e)
        {
            this.MsgList.Items.Clear();            
            Thread th = new Thread(new ThreadStart(this.ReceiveEmails));
            th.Start();
        }

        private void ReceiveEmails()
        {
            try
            {                
                pop_client.Disconnect();  // Отключимся от текущего подключение, если оно есть
                
                // Передаем параметы
                pop_client.Pop3Server = PopServer.popHost;
                pop_client.Pop3Port = PopServer.popPort;
                pop_client.UserName = User.Login;
                pop_client.Password = User.Password;
                pop = pop_client;

                pop_client.Connect();  // Соединяемся 
                pop_client.GetAllMailInfo();  // Получаем общую информацию (кол-во сообщение и их общий размер)  
                       
                if (pop_client.TotalEmails >= 1)  // Если есть хоть одно сообщение, то
                {                   
                    this.FillInboxListView(pop_client);  // Выводим их в список                    
                }
                else
                {
                    MessageBox.Show("Почтовый ящик пуст!", "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            catch (SmtpClientException err)
            {
                MessageBox.Show(err.ErrorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);                
            }
        }

        // Заполняем список сообщений из почтового ящика
        private void FillInboxListView(Pop3Client obj)
        {
            ArrayList sender = new ArrayList();
            ArrayList subject = new ArrayList();
            ArrayList date = new ArrayList();
            ArrayList size = new ArrayList();
            DateTime date_time; string temp = "";

            this.MsgList.Items.Clear();            
            
            for (int i = 1; i <= obj.TotalEmails; i++)
            {
                string emailHeader = obj.FetchEmailTop(i, 0);
                sender.Add(obj.From);
                subject.Add(obj.Subject);
                try
                {
                    date_time = DateTime.Parse(obj.Date);
                    temp = date_time.ToString("D");
                    date.Add(temp);
                }
                catch (Exception)
                {
                    date.Add(obj.Date);
                }

                size.Add(obj.GetMailSize(i));
            }

            for (int j = 0; j < sender.Count; j++)
            {
                ListViewItem item = new ListViewItem();

                item.Text = sender[j].ToString();
                item.SubItems.Add(subject[j].ToString());
                item.SubItems.Add(date[j].ToString());
                item.SubItems.Add(size[j].ToString());

                this.InsertItem(item);
            }
        }        

        // Добавить сообщение в список
        private void InsertItem(ListViewItem item)
        {
            if (this.MsgList.InvokeRequired)
            {
                InboxItemEventHandler obj = new InboxItemEventHandler(this.InsertItem);
                this.Invoke(obj, new object[] { item });
            }
            else
            {
                this.MsgList.Items.Add(item);
            }
        }

        // Выбрать сообщение из списка
        private void MsgList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!(this.MsgList.SelectedItems.Count > 0))
            {
                this.MailFrom.Text = "";
                this.MailTo.Text = "";
                this.MailSubject.Text = "";                
                this.MailMessage.DocumentText = "";
            }
        }

        // Просмотреть данные о сообщении
        private void MsgList_MouseClick(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Right && this.MsgList.SelectedItems.Count > 0)
            {
                ContextMenuStrip menu = new ContextMenuStrip();                
                menu.Items.Add("Удалить");
                menu.ItemClicked += new ToolStripItemClickedEventHandler(menu_ItemClicked);
                menu.Show(Control.MousePosition);
            }
            else if (e.Button == MouseButtons.Left && this.MsgList.SelectedItems.Count > 0)
            {
                int index = this.MsgList.SelectedItems[0].Index;
                index = index + 1;
                this.email = "";
                this.msg_id = index;
                this.MailFrom.Text = "";
                this.MailTo.Text = "";
                this.MailSubject.Text = "";
                this.MailMessage.DocumentText = "<html></html>";                

                Thread th = new Thread(new ThreadStart(this.FetchEmailCallBack));
                th.Start();
            }
        }

        // Удаление сообщения
        private void menu_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {
            DialogResult result = MessageBox.Show("Вы действительно хотите удалить данное сообщение?", "EnergyMailClient", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

            if (result == DialogResult.Yes)
            {
                int index = this.MsgList.SelectedItems[0].Index;
                index = index + 1;
                try
                {
                    this.pop.DeleteEmail(index);
                    this.MsgList.SelectedItems[0].Remove();

                    if (this.msg_id == index)
                    {
                        this.MailFrom.Text = "";
                        this.MailTo.Text = "";
                        this.MailSubject.Text = "";                       
                        this.MailFrom.Text = "";
                    }
                    MessageBox.Show("Сообщение под номером # " + index + " удалено.", "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                catch (Pop3ClientException err)
                {
                    MessageBox.Show(err.ErrorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        // Обработка сообщения для вывода
        private void FetchEmailCallBack()
        {
            try
            {
                this.email = this.pop.FetchEmail(this.msg_id);
                this.UpdatePopMessageHeader(this.pop.From, this.pop.To, this.pop.Subject);

                string content = "";
                string content_type = "";
                string attached_file_name = "";
                bool isHtmlIncluded = false;
                int plain_text_message_section = -1;

                for (int i = 1; i <= this.pop.MailSections; i++)
                {
                    this.pop.GetMailSection(i, ref content, ref content_type, ref attached_file_name);

                    if (content_type.ToLower().Equals("text/html"))
                    {
                        try
                        {
                            content = Encoding.GetEncoding("utf-8").GetString(Encoding.GetEncoding("windows-1251").GetBytes(content));                                                        

                            content = MailDecoder.DecodeEncodedString(content.Trim());

                            var occurences = new Regex(@"=[0-9A-Z]{2}", RegexOptions.Multiline);
                            var matches = occurences.Matches(content);
                            foreach (Match match in matches)
                            {
                                char hexChar = (char)Convert.ToInt32(match.Groups[0].Value.Substring(1), 16);
                                content = content.Replace(match.Groups[0].Value, hexChar.ToString());
                            }
                            content.Replace("=\r\n", "");                            
                        }
                        catch
                        {
                        }

                        this.WritePopMessage(content);
                        isHtmlIncluded = true;
                    }
                    else if (content_type.ToLower().Equals("base64"))
                    {
                        ListViewItem item = new ListViewItem(attached_file_name);
                        item.ImageIndex = 0;                        
                    }
                    else if (content_type.ToLower().Equals("text/plain"))
                    {
                        plain_text_message_section = i;
                    }
                }             

                if (isHtmlIncluded == false && plain_text_message_section != -1)
                {
                    this.pop.GetMailSection(plain_text_message_section, ref content, ref content_type, ref attached_file_name);
                    this.WritePopMessage(content);
                }  
            }
            catch (Pop3ClientException err)
            {
                MessageBox.Show(err.ErrorMessage, "EnergyMailClient", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }        

        // Обновить список сообщений
        private void UpdatePopMessageHeader(string from, string to, string subject)
        {
            if (this.MailFrom.InvokeRequired || this.MailTo.InvokeRequired || this.MailSubject.InvokeRequired)
            {
                UpdatePopMessageHeaderEventHandler obj = new UpdatePopMessageHeaderEventHandler(this.UpdatePopMessageHeader);
                this.Invoke(obj, new object[] { from, to, subject });
            }
            else
            {
                this.MailFrom.Text = from.Trim();
                this.MailTo.Text = to.Trim();
                this.MailSubject.Text = subject.Trim();
            }
        }        

        // Вывод текста сообщения
        private void WritePopMessage(string content)
        {
            if (this.MailMessage.InvokeRequired)
            {
                WritePopMessageEventHandler obj = new WritePopMessageEventHandler(this.WritePopMessage);
                this.Invoke(obj, new object[] { content });
            }
            else
            {
                this.MailMessage.DocumentText = content;                
            }
        }

        //---
        
        private void EnergyMailClient_FormClosed(object sender, FormClosedEventArgs e)
        {
            pop_client.Disconnect();  // Завершение соединения перед закрытием окна
        }                                  
    }
}
