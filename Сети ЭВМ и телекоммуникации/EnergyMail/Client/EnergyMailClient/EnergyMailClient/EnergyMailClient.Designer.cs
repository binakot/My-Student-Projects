namespace EnergyMailClient
{
    partial class EnergyMailClient
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(EnergyMailClient));
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.CheckMailButton = new System.Windows.Forms.Button();
            this.MessageInfo = new System.Windows.Forms.GroupBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.MailMessage = new System.Windows.Forms.WebBrowser();
            this.MailSubject = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.MailTo = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.MailFrom = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.MsgList = new System.Windows.Forms.ListView();
            this.Sender = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.Subject = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.Date = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.Size = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.SendButton = new System.Windows.Forms.Button();
            this.ClearButton = new System.Windows.Forms.Button();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.MsgBox = new System.Windows.Forms.RichTextBox();
            this.SubjectBox = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.ToBox = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.FromBox = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.tabControl1.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.MessageInfo.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.tabPage2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.SuspendLayout();
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPage1);
            this.tabControl1.Controls.Add(this.tabPage2);
            this.tabControl1.Location = new System.Drawing.Point(12, 12);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(616, 534);
            this.tabControl1.TabIndex = 0;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.CheckMailButton);
            this.tabPage1.Controls.Add(this.MessageInfo);
            this.tabPage1.Controls.Add(this.groupBox1);
            this.tabPage1.Location = new System.Drawing.Point(4, 22);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(608, 508);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "Мои сообщения";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // CheckMailButton
            // 
            this.CheckMailButton.Location = new System.Drawing.Point(470, 471);
            this.CheckMailButton.Name = "CheckMailButton";
            this.CheckMailButton.Size = new System.Drawing.Size(132, 31);
            this.CheckMailButton.TabIndex = 9;
            this.CheckMailButton.Text = "Проверить сообщения";
            this.CheckMailButton.UseVisualStyleBackColor = true;
            this.CheckMailButton.Click += new System.EventHandler(this.CheckMailButton_Click);
            // 
            // MessageInfo
            // 
            this.MessageInfo.Controls.Add(this.groupBox2);
            this.MessageInfo.Controls.Add(this.MailSubject);
            this.MessageInfo.Controls.Add(this.label3);
            this.MessageInfo.Controls.Add(this.MailTo);
            this.MessageInfo.Controls.Add(this.label2);
            this.MessageInfo.Controls.Add(this.MailFrom);
            this.MessageInfo.Controls.Add(this.label1);
            this.MessageInfo.Location = new System.Drawing.Point(6, 156);
            this.MessageInfo.Name = "MessageInfo";
            this.MessageInfo.Size = new System.Drawing.Size(596, 309);
            this.MessageInfo.TabIndex = 1;
            this.MessageInfo.TabStop = false;
            this.MessageInfo.Text = "Информация о выбранном сообщении";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.MailMessage);
            this.groupBox2.Location = new System.Drawing.Point(6, 71);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(584, 232);
            this.groupBox2.TabIndex = 6;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Сообщение";
            // 
            // MailMessage
            // 
            this.MailMessage.Location = new System.Drawing.Point(6, 19);
            this.MailMessage.MinimumSize = new System.Drawing.Size(20, 20);
            this.MailMessage.Name = "MailMessage";
            this.MailMessage.Size = new System.Drawing.Size(572, 207);
            this.MailMessage.TabIndex = 1;
            // 
            // MailSubject
            // 
            this.MailSubject.Location = new System.Drawing.Point(67, 45);
            this.MailSubject.Name = "MailSubject";
            this.MailSubject.ReadOnly = true;
            this.MailSubject.Size = new System.Drawing.Size(523, 20);
            this.MailSubject.TabIndex = 5;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(12, 48);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(37, 13);
            this.label3.TabIndex = 4;
            this.label3.Text = "Тема:";
            // 
            // MailTo
            // 
            this.MailTo.Location = new System.Drawing.Point(361, 19);
            this.MailTo.Name = "MailTo";
            this.MailTo.ReadOnly = true;
            this.MailTo.Size = new System.Drawing.Size(229, 20);
            this.MailTo.TabIndex = 3;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(306, 22);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(36, 13);
            this.label2.TabIndex = 2;
            this.label2.Text = "Кому:";
            // 
            // MailFrom
            // 
            this.MailFrom.Location = new System.Drawing.Point(67, 19);
            this.MailFrom.Name = "MailFrom";
            this.MailFrom.ReadOnly = true;
            this.MailFrom.Size = new System.Drawing.Size(229, 20);
            this.MailFrom.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 22);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(49, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "От кого:";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.MsgList);
            this.groupBox1.Location = new System.Drawing.Point(6, 6);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(596, 144);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Список сообщений";
            // 
            // MsgList
            // 
            this.MsgList.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.MsgList.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.Sender,
            this.Subject,
            this.Date,
            this.Size});
            this.MsgList.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.MsgList.ForeColor = System.Drawing.SystemColors.ControlText;
            this.MsgList.FullRowSelect = true;
            this.MsgList.HideSelection = false;
            this.MsgList.Location = new System.Drawing.Point(6, 21);
            this.MsgList.MultiSelect = false;
            this.MsgList.Name = "MsgList";
            this.MsgList.Size = new System.Drawing.Size(584, 114);
            this.MsgList.TabIndex = 1;
            this.MsgList.UseCompatibleStateImageBehavior = false;
            this.MsgList.View = System.Windows.Forms.View.Details;
            this.MsgList.SelectedIndexChanged += new System.EventHandler(this.MsgList_SelectedIndexChanged);
            this.MsgList.MouseClick += new System.Windows.Forms.MouseEventHandler(this.MsgList_MouseClick);
            // 
            // Sender
            // 
            this.Sender.Text = "Отправитель";
            this.Sender.Width = 174;
            // 
            // Subject
            // 
            this.Subject.Text = "Тема";
            this.Subject.Width = 201;
            // 
            // Date
            // 
            this.Date.Text = "Дата";
            this.Date.Width = 112;
            // 
            // Size
            // 
            this.Size.Text = "Размер (байт)";
            this.Size.Width = 92;
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.SendButton);
            this.tabPage2.Controls.Add(this.ClearButton);
            this.tabPage2.Controls.Add(this.groupBox3);
            this.tabPage2.Controls.Add(this.SubjectBox);
            this.tabPage2.Controls.Add(this.label6);
            this.tabPage2.Controls.Add(this.ToBox);
            this.tabPage2.Controls.Add(this.label5);
            this.tabPage2.Controls.Add(this.FromBox);
            this.tabPage2.Controls.Add(this.label4);
            this.tabPage2.Location = new System.Drawing.Point(4, 22);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(608, 508);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "Отправить сообщение";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // SendButton
            // 
            this.SendButton.Location = new System.Drawing.Point(478, 471);
            this.SendButton.Name = "SendButton";
            this.SendButton.Size = new System.Drawing.Size(124, 31);
            this.SendButton.TabIndex = 8;
            this.SendButton.Text = "Отправить";
            this.SendButton.UseVisualStyleBackColor = true;
            this.SendButton.Click += new System.EventHandler(this.Send_Click);
            // 
            // ClearButton
            // 
            this.ClearButton.Location = new System.Drawing.Point(348, 471);
            this.ClearButton.Name = "ClearButton";
            this.ClearButton.Size = new System.Drawing.Size(124, 31);
            this.ClearButton.TabIndex = 7;
            this.ClearButton.Text = "Очистить";
            this.ClearButton.UseVisualStyleBackColor = true;
            this.ClearButton.Click += new System.EventHandler(this.Clear_Click);
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.MsgBox);
            this.groupBox3.Location = new System.Drawing.Point(6, 84);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(596, 381);
            this.groupBox3.TabIndex = 6;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Новое сообщение";
            // 
            // MsgBox
            // 
            this.MsgBox.Location = new System.Drawing.Point(6, 19);
            this.MsgBox.Name = "MsgBox";
            this.MsgBox.ScrollBars = System.Windows.Forms.RichTextBoxScrollBars.Vertical;
            this.MsgBox.Size = new System.Drawing.Size(584, 356);
            this.MsgBox.TabIndex = 0;
            this.MsgBox.Text = "Текст сообщения";
            // 
            // SubjectBox
            // 
            this.SubjectBox.Location = new System.Drawing.Point(62, 59);
            this.SubjectBox.Name = "SubjectBox";
            this.SubjectBox.Size = new System.Drawing.Size(238, 20);
            this.SubjectBox.TabIndex = 5;
            this.SubjectBox.Text = "Тема сообщения";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(7, 59);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(37, 13);
            this.label6.TabIndex = 4;
            this.label6.Text = "Тема:";
            // 
            // ToBox
            // 
            this.ToBox.Location = new System.Drawing.Point(62, 32);
            this.ToBox.Name = "ToBox";
            this.ToBox.Size = new System.Drawing.Size(238, 20);
            this.ToBox.TabIndex = 3;
            this.ToBox.Text = "alex@energymail.ru";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(7, 33);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(36, 13);
            this.label5.TabIndex = 2;
            this.label5.Text = "Кому:";
            // 
            // FromBox
            // 
            this.FromBox.Location = new System.Drawing.Point(62, 6);
            this.FromBox.Name = "FromBox";
            this.FromBox.Size = new System.Drawing.Size(238, 20);
            this.FromBox.TabIndex = 1;
            this.FromBox.Text = "binakot@energymail.ru";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(7, 7);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(49, 13);
            this.label4.TabIndex = 0;
            this.label4.Text = "От кого:";
            // 
            // EnergyMailClient
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(641, 558);
            this.Controls.Add(this.tabControl1);
            this.DoubleBuffered = true;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.Name = "EnergyMailClient";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "EnergyMailClient";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.EnergyMailClient_FormClosed);            
            this.tabControl1.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.MessageInfo.ResumeLayout(false);
            this.MessageInfo.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox1.ResumeLayout(false);
            this.tabPage2.ResumeLayout(false);
            this.tabPage2.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.ListView MsgList;
        private System.Windows.Forms.ColumnHeader Sender;
        private System.Windows.Forms.ColumnHeader Subject;
        private System.Windows.Forms.ColumnHeader Date;
        private System.Windows.Forms.ColumnHeader Size;
        private System.Windows.Forms.GroupBox MessageInfo;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.TextBox MailSubject;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox MailTo;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox MailFrom;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox ToBox;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox FromBox;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox SubjectBox;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Button SendButton;
        private System.Windows.Forms.Button ClearButton;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.RichTextBox MsgBox;
        private System.Windows.Forms.Button CheckMailButton;
        private System.Windows.Forms.WebBrowser MailMessage;
    }
}