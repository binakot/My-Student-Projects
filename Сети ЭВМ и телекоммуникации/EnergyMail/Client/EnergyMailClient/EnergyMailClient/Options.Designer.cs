namespace EnergyMailClient
{
    partial class Options
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Options));
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.CheckSmtpButton = new System.Windows.Forms.Button();
            this.SmtpPortBox = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.SmtpAddressBox = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.CheckPopButton = new System.Windows.Forms.Button();
            this.PopAddressBox = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.PopPortBox = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.AcceptButton = new System.Windows.Forms.Button();
            this.tabPage3 = new System.Windows.Forms.TabPage();
            this.CheckRegButton = new System.Windows.Forms.Button();
            this.RegPortBox = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.RegAddressBox = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.tabControl1.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.tabPage2.SuspendLayout();
            this.tabPage3.SuspendLayout();
            this.SuspendLayout();
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPage1);
            this.tabControl1.Controls.Add(this.tabPage2);
            this.tabControl1.Controls.Add(this.tabPage3);
            this.tabControl1.Location = new System.Drawing.Point(12, 12);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(232, 132);
            this.tabControl1.TabIndex = 0;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.CheckSmtpButton);
            this.tabPage1.Controls.Add(this.SmtpPortBox);
            this.tabPage1.Controls.Add(this.label2);
            this.tabPage1.Controls.Add(this.SmtpAddressBox);
            this.tabPage1.Controls.Add(this.label1);
            this.tabPage1.Location = new System.Drawing.Point(4, 22);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(224, 106);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "SMTP сервер";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // CheckSmtpButton
            // 
            this.CheckSmtpButton.Location = new System.Drawing.Point(10, 58);
            this.CheckSmtpButton.Name = "CheckSmtpButton";
            this.CheckSmtpButton.Size = new System.Drawing.Size(208, 37);
            this.CheckSmtpButton.TabIndex = 4;
            this.CheckSmtpButton.Text = "Проверка";
            this.CheckSmtpButton.UseVisualStyleBackColor = true;
            this.CheckSmtpButton.Click += new System.EventHandler(this.CheckSmtpButton_Click);
            // 
            // SmtpPortBox
            // 
            this.SmtpPortBox.Location = new System.Drawing.Point(51, 32);
            this.SmtpPortBox.Name = "SmtpPortBox";
            this.SmtpPortBox.Size = new System.Drawing.Size(167, 20);
            this.SmtpPortBox.TabIndex = 3;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(7, 35);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(32, 13);
            this.label2.TabIndex = 2;
            this.label2.Text = "Порт";
            // 
            // SmtpAddressBox
            // 
            this.SmtpAddressBox.Location = new System.Drawing.Point(51, 6);
            this.SmtpAddressBox.Name = "SmtpAddressBox";
            this.SmtpAddressBox.Size = new System.Drawing.Size(167, 20);
            this.SmtpAddressBox.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(7, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(38, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Адрес";
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.CheckPopButton);
            this.tabPage2.Controls.Add(this.PopAddressBox);
            this.tabPage2.Controls.Add(this.label3);
            this.tabPage2.Controls.Add(this.PopPortBox);
            this.tabPage2.Controls.Add(this.label4);
            this.tabPage2.Location = new System.Drawing.Point(4, 22);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(224, 106);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "POP сервер";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // CheckPopButton
            // 
            this.CheckPopButton.Location = new System.Drawing.Point(10, 58);
            this.CheckPopButton.Name = "CheckPopButton";
            this.CheckPopButton.Size = new System.Drawing.Size(208, 37);
            this.CheckPopButton.TabIndex = 8;
            this.CheckPopButton.Text = "Проверка";
            this.CheckPopButton.UseVisualStyleBackColor = true;
            this.CheckPopButton.Click += new System.EventHandler(this.CheckPopButton_Click);
            // 
            // PopAddressBox
            // 
            this.PopAddressBox.Location = new System.Drawing.Point(51, 6);
            this.PopAddressBox.Name = "PopAddressBox";
            this.PopAddressBox.Size = new System.Drawing.Size(167, 20);
            this.PopAddressBox.TabIndex = 7;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(7, 35);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(32, 13);
            this.label3.TabIndex = 6;
            this.label3.Text = "Порт";
            // 
            // PopPortBox
            // 
            this.PopPortBox.Location = new System.Drawing.Point(51, 32);
            this.PopPortBox.Name = "PopPortBox";
            this.PopPortBox.Size = new System.Drawing.Size(167, 20);
            this.PopPortBox.TabIndex = 5;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(7, 9);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(38, 13);
            this.label4.TabIndex = 4;
            this.label4.Text = "Адрес";
            // 
            // AcceptButton
            // 
            this.AcceptButton.Location = new System.Drawing.Point(12, 150);
            this.AcceptButton.Name = "AcceptButton";
            this.AcceptButton.Size = new System.Drawing.Size(232, 39);
            this.AcceptButton.TabIndex = 1;
            this.AcceptButton.Text = "Применить";
            this.AcceptButton.UseVisualStyleBackColor = true;
            this.AcceptButton.Click += new System.EventHandler(this.Accept_Click);
            // 
            // tabPage3
            // 
            this.tabPage3.Controls.Add(this.CheckRegButton);
            this.tabPage3.Controls.Add(this.RegPortBox);
            this.tabPage3.Controls.Add(this.label5);
            this.tabPage3.Controls.Add(this.RegAddressBox);
            this.tabPage3.Controls.Add(this.label6);
            this.tabPage3.Location = new System.Drawing.Point(4, 22);
            this.tabPage3.Name = "tabPage3";
            this.tabPage3.Size = new System.Drawing.Size(224, 106);
            this.tabPage3.TabIndex = 2;
            this.tabPage3.Text = "REG сервер";
            this.tabPage3.UseVisualStyleBackColor = true;
            // 
            // CheckRegButton
            // 
            this.CheckRegButton.Location = new System.Drawing.Point(10, 58);
            this.CheckRegButton.Name = "CheckRegButton";
            this.CheckRegButton.Size = new System.Drawing.Size(208, 37);
            this.CheckRegButton.TabIndex = 9;
            this.CheckRegButton.Text = "Проверка";
            this.CheckRegButton.UseVisualStyleBackColor = true;
            this.CheckRegButton.Click += new System.EventHandler(this.CheckRegButton_Click);
            // 
            // RegPortBox
            // 
            this.RegPortBox.Location = new System.Drawing.Point(51, 32);
            this.RegPortBox.Name = "RegPortBox";
            this.RegPortBox.Size = new System.Drawing.Size(167, 20);
            this.RegPortBox.TabIndex = 8;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(7, 35);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(32, 13);
            this.label5.TabIndex = 7;
            this.label5.Text = "Порт";
            // 
            // RegAddressBox
            // 
            this.RegAddressBox.Location = new System.Drawing.Point(51, 6);
            this.RegAddressBox.Name = "RegAddressBox";
            this.RegAddressBox.Size = new System.Drawing.Size(167, 20);
            this.RegAddressBox.TabIndex = 6;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(7, 9);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(38, 13);
            this.label6.TabIndex = 5;
            this.label6.Text = "Адрес";
            // 
            // Options
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(255, 201);
            this.Controls.Add(this.AcceptButton);
            this.Controls.Add(this.tabControl1);
            this.DoubleBuffered = true;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.Name = "Options";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Настройка";
            this.Load += new System.EventHandler(this.Options_Load);
            this.tabControl1.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.tabPage1.PerformLayout();
            this.tabPage2.ResumeLayout(false);
            this.tabPage2.PerformLayout();
            this.tabPage3.ResumeLayout(false);
            this.tabPage3.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.TextBox SmtpPortBox;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox SmtpAddressBox;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox PopAddressBox;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox PopPortBox;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button CheckSmtpButton;
        private System.Windows.Forms.Button CheckPopButton;
        private System.Windows.Forms.Button AcceptButton;
        private System.Windows.Forms.TabPage tabPage3;
        private System.Windows.Forms.Button CheckRegButton;
        private System.Windows.Forms.TextBox RegPortBox;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox RegAddressBox;
        private System.Windows.Forms.Label label6;
    }
}