namespace InterNetInformer
{
    partial class NetStatForm
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
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.менюToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.выходToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.выходToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.tCPToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.tCPIPv4StatisticsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.tCPIPv6StatisticsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.uDPToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.uDPIPv4СтатистикаToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.uDPIPv4СтатистикаToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.сетевойИнтерфейсToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.сетевыеПодключенияToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.StatTextBox = new System.Windows.Forms.RichTextBox();
            this.iPадресКомпьютераToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.BackColor = System.Drawing.SystemColors.Desktop;
            this.menuStrip1.Font = new System.Drawing.Font("Consolas", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.менюToolStripMenuItem,
            this.tCPToolStripMenuItem,
            this.uDPToolStripMenuItem,
            this.сетевойИнтерфейсToolStripMenuItem,
            this.сетевыеПодключенияToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(427, 24);
            this.menuStrip1.TabIndex = 1;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // менюToolStripMenuItem
            // 
            this.менюToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.iPадресКомпьютераToolStripMenuItem,
            this.выходToolStripMenuItem,
            this.toolStripSeparator1,
            this.выходToolStripMenuItem1});
            this.менюToolStripMenuItem.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.менюToolStripMenuItem.Name = "менюToolStripMenuItem";
            this.менюToolStripMenuItem.Size = new System.Drawing.Size(47, 20);
            this.менюToolStripMenuItem.Text = "Меню";
            // 
            // выходToolStripMenuItem
            // 
            this.выходToolStripMenuItem.Name = "выходToolStripMenuItem";
            this.выходToolStripMenuItem.Size = new System.Drawing.Size(207, 22);
            this.выходToolStripMenuItem.Text = "Назад";
            this.выходToolStripMenuItem.Click += new System.EventHandler(this.выходToolStripMenuItem_Click);
            // 
            // toolStripSeparator1
            // 
            this.toolStripSeparator1.Name = "toolStripSeparator1";
            this.toolStripSeparator1.Size = new System.Drawing.Size(204, 6);
            // 
            // выходToolStripMenuItem1
            // 
            this.выходToolStripMenuItem1.Name = "выходToolStripMenuItem1";
            this.выходToolStripMenuItem1.Size = new System.Drawing.Size(207, 22);
            this.выходToolStripMenuItem1.Text = "Выход";
            this.выходToolStripMenuItem1.Click += new System.EventHandler(this.выходToolStripMenuItem1_Click);
            // 
            // tCPToolStripMenuItem
            // 
            this.tCPToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tCPIPv4StatisticsToolStripMenuItem,
            this.tCPIPv6StatisticsToolStripMenuItem});
            this.tCPToolStripMenuItem.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.tCPToolStripMenuItem.Name = "tCPToolStripMenuItem";
            this.tCPToolStripMenuItem.Size = new System.Drawing.Size(40, 20);
            this.tCPToolStripMenuItem.Text = "TCP";
            // 
            // tCPIPv4StatisticsToolStripMenuItem
            // 
            this.tCPIPv4StatisticsToolStripMenuItem.Name = "tCPIPv4StatisticsToolStripMenuItem";
            this.tCPIPv4StatisticsToolStripMenuItem.Size = new System.Drawing.Size(207, 22);
            this.tCPIPv4StatisticsToolStripMenuItem.Text = "TCP/IPv4 Статистика";
            this.tCPIPv4StatisticsToolStripMenuItem.Click += new System.EventHandler(this.tCPIPv4StatisticsToolStripMenuItem_Click);
            // 
            // tCPIPv6StatisticsToolStripMenuItem
            // 
            this.tCPIPv6StatisticsToolStripMenuItem.Name = "tCPIPv6StatisticsToolStripMenuItem";
            this.tCPIPv6StatisticsToolStripMenuItem.Size = new System.Drawing.Size(207, 22);
            this.tCPIPv6StatisticsToolStripMenuItem.Text = "TCP/IPv6 Статистика";
            this.tCPIPv6StatisticsToolStripMenuItem.Click += new System.EventHandler(this.tCPIPv6StatisticsToolStripMenuItem_Click);
            // 
            // uDPToolStripMenuItem
            // 
            this.uDPToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.uDPIPv4СтатистикаToolStripMenuItem,
            this.uDPIPv4СтатистикаToolStripMenuItem1});
            this.uDPToolStripMenuItem.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.uDPToolStripMenuItem.Name = "uDPToolStripMenuItem";
            this.uDPToolStripMenuItem.Size = new System.Drawing.Size(40, 20);
            this.uDPToolStripMenuItem.Text = "UDP";
            // 
            // uDPIPv4СтатистикаToolStripMenuItem
            // 
            this.uDPIPv4СтатистикаToolStripMenuItem.Name = "uDPIPv4СтатистикаToolStripMenuItem";
            this.uDPIPv4СтатистикаToolStripMenuItem.Size = new System.Drawing.Size(207, 22);
            this.uDPIPv4СтатистикаToolStripMenuItem.Text = "UDP/IPv4 Статистика";
            this.uDPIPv4СтатистикаToolStripMenuItem.Click += new System.EventHandler(this.uDPIPv4СтатистикаToolStripMenuItem_Click);
            // 
            // uDPIPv4СтатистикаToolStripMenuItem1
            // 
            this.uDPIPv4СтатистикаToolStripMenuItem1.Name = "uDPIPv4СтатистикаToolStripMenuItem1";
            this.uDPIPv4СтатистикаToolStripMenuItem1.Size = new System.Drawing.Size(207, 22);
            this.uDPIPv4СтатистикаToolStripMenuItem1.Text = "UDP/IPv4 Статистика";
            this.uDPIPv4СтатистикаToolStripMenuItem1.Click += new System.EventHandler(this.uDPIPv4СтатистикаToolStripMenuItem1_Click);
            // 
            // сетевойИнтерфейсToolStripMenuItem
            // 
            this.сетевойИнтерфейсToolStripMenuItem.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.сетевойИнтерфейсToolStripMenuItem.Name = "сетевойИнтерфейсToolStripMenuItem";
            this.сетевойИнтерфейсToolStripMenuItem.Size = new System.Drawing.Size(138, 20);
            this.сетевойИнтерфейсToolStripMenuItem.Text = "Сетевой интерфейс";
            this.сетевойИнтерфейсToolStripMenuItem.Click += new System.EventHandler(this.сетевойИнтерфейсToolStripMenuItem_Click);
            // 
            // сетевыеПодключенияToolStripMenuItem
            // 
            this.сетевыеПодключенияToolStripMenuItem.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.сетевыеПодключенияToolStripMenuItem.Name = "сетевыеПодключенияToolStripMenuItem";
            this.сетевыеПодключенияToolStripMenuItem.Size = new System.Drawing.Size(96, 20);
            this.сетевыеПодключенияToolStripMenuItem.Text = "Подключения";
            this.сетевыеПодключенияToolStripMenuItem.Click += new System.EventHandler(this.сетевыеПодключенияToolStripMenuItem_Click);
            // 
            // StatTextBox
            // 
            this.StatTextBox.BackColor = System.Drawing.SystemColors.Desktop;
            this.StatTextBox.Font = new System.Drawing.Font("Consolas", 10F);
            this.StatTextBox.ForeColor = System.Drawing.SystemColors.HighlightText;
            this.StatTextBox.Location = new System.Drawing.Point(12, 27);
            this.StatTextBox.Name = "StatTextBox";
            this.StatTextBox.ReadOnly = true;
            this.StatTextBox.Size = new System.Drawing.Size(403, 345);
            this.StatTextBox.TabIndex = 2;
            this.StatTextBox.Text = "";
            // 
            // iPадресКомпьютераToolStripMenuItem
            // 
            this.iPадресКомпьютераToolStripMenuItem.Name = "iPадресКомпьютераToolStripMenuItem";
            this.iPадресКомпьютераToolStripMenuItem.Size = new System.Drawing.Size(207, 22);
            this.iPадресКомпьютераToolStripMenuItem.Text = "IP-адрес компьютера";
            this.iPадресКомпьютераToolStripMenuItem.Click += new System.EventHandler(this.iPадресКомпьютераToolStripMenuItem_Click);
            // 
            // NetStatForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.Desktop;
            this.ClientSize = new System.Drawing.Size(427, 384);
            this.Controls.Add(this.StatTextBox);
            this.Controls.Add(this.menuStrip1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MainMenuStrip = this.menuStrip1;
            this.MaximizeBox = false;
            this.Name = "NetStatForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Сетевая статистика";
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem менюToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem выходToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem tCPToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem uDPToolStripMenuItem;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator1;
        private System.Windows.Forms.ToolStripMenuItem выходToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem tCPIPv4StatisticsToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem tCPIPv6StatisticsToolStripMenuItem;
        private System.Windows.Forms.RichTextBox StatTextBox;
        private System.Windows.Forms.ToolStripMenuItem uDPIPv4СтатистикаToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem uDPIPv4СтатистикаToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem сетевойИнтерфейсToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem сетевыеПодключенияToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem iPадресКомпьютераToolStripMenuItem;

    }
}