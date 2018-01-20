namespace NeuralNetworks
{
    partial class MainForm
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
            this.файлToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.создатьToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.нейроннуюСетьToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.обучающуюВыборкуToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem2 = new System.Windows.Forms.ToolStripSeparator();
            this.выходToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.saveFileDialog1 = new System.Windows.Forms.SaveFileDialog();
            this.txtDir = new System.Windows.Forms.TextBox();
            this.LearnButton = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.txtLogs = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txtKLern = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.txtKErr = new System.Windows.Forms.TextBox();
            this.txtLernFiles = new System.Windows.Forms.TextBox();
            this.StopButton = new System.Windows.Forms.Button();
            this.OpenTestFileButton = new System.Windows.Forms.Button();
            this.InputVectorBox = new System.Windows.Forms.TextBox();
            this.OutputVectorBox = new System.Windows.Forms.TextBox();
            this.openFileDialog2 = new System.Windows.Forms.OpenFileDialog();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.BrowseEducationFolderButton = new System.Windows.Forms.Button();
            this.folderBrowserDialog1 = new System.Windows.Forms.FolderBrowserDialog();
            this.TestButton = new System.Windows.Forms.Button();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.файлToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(654, 24);
            this.menuStrip1.TabIndex = 0;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // файлToolStripMenuItem
            // 
            this.файлToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.создатьToolStripMenuItem1,
            this.toolStripMenuItem2,
            this.выходToolStripMenuItem});
            this.файлToolStripMenuItem.Name = "файлToolStripMenuItem";
            this.файлToolStripMenuItem.Size = new System.Drawing.Size(45, 20);
            this.файлToolStripMenuItem.Text = "Файл";
            // 
            // создатьToolStripMenuItem1
            // 
            this.создатьToolStripMenuItem1.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.нейроннуюСетьToolStripMenuItem,
            this.обучающуюВыборкуToolStripMenuItem});
            this.создатьToolStripMenuItem1.Name = "создатьToolStripMenuItem1";
            this.создатьToolStripMenuItem1.Size = new System.Drawing.Size(117, 22);
            this.создатьToolStripMenuItem1.Text = "Создать";
            // 
            // нейроннуюСетьToolStripMenuItem
            // 
            this.нейроннуюСетьToolStripMenuItem.Name = "нейроннуюСетьToolStripMenuItem";
            this.нейроннуюСетьToolStripMenuItem.Size = new System.Drawing.Size(264, 22);
            this.нейроннуюСетьToolStripMenuItem.Text = "Нейронную сеть";
            this.нейроннуюСетьToolStripMenuItem.Click += new System.EventHandler(this.нейроннуюСетьToolStripMenuItem_Click);
            // 
            // обучающуюВыборкуToolStripMenuItem
            // 
            this.обучающуюВыборкуToolStripMenuItem.Name = "обучающуюВыборкуToolStripMenuItem";
            this.обучающуюВыборкуToolStripMenuItem.Size = new System.Drawing.Size(264, 22);
            this.обучающуюВыборкуToolStripMenuItem.Text = "Обучающую/Тестирующую выборку";
            this.обучающуюВыборкуToolStripMenuItem.Click += new System.EventHandler(this.обучающуюВыборкуToolStripMenuItem_Click);
            // 
            // toolStripMenuItem2
            // 
            this.toolStripMenuItem2.Name = "toolStripMenuItem2";
            this.toolStripMenuItem2.Size = new System.Drawing.Size(114, 6);
            // 
            // выходToolStripMenuItem
            // 
            this.выходToolStripMenuItem.Name = "выходToolStripMenuItem";
            this.выходToolStripMenuItem.Size = new System.Drawing.Size(117, 22);
            this.выходToolStripMenuItem.Text = "Выход";
            this.выходToolStripMenuItem.Click += new System.EventHandler(this.выходToolStripMenuItem_Click);
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.Filter = "Neural Networks (*.nw) | *.nw";
            this.openFileDialog1.Title = "Открыть...";
            // 
            // saveFileDialog1
            // 
            this.saveFileDialog1.Filter = "Neural Networks (*.nw) | *.nw";
            this.saveFileDialog1.Title = "Сохранить...";
            // 
            // txtDir
            // 
            this.txtDir.Location = new System.Drawing.Point(12, 49);
            this.txtDir.Name = "txtDir";
            this.txtDir.Size = new System.Drawing.Size(339, 20);
            this.txtDir.TabIndex = 1;
            this.txtDir.Text = "C:\\";
            // 
            // LearnButton
            // 
            this.LearnButton.Location = new System.Drawing.Point(255, 86);
            this.LearnButton.Name = "LearnButton";
            this.LearnButton.Size = new System.Drawing.Size(64, 23);
            this.LearnButton.TabIndex = 2;
            this.LearnButton.Text = "Start";
            this.LearnButton.UseVisualStyleBackColor = true;
            this.LearnButton.Click += new System.EventHandler(this.LearnButton_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 33);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(150, 13);
            this.label1.TabIndex = 3;
            this.label1.Text = "Путь к обучающей выборке:";
            // 
            // txtLogs
            // 
            this.txtLogs.Location = new System.Drawing.Point(12, 128);
            this.txtLogs.Multiline = true;
            this.txtLogs.Name = "txtLogs";
            this.txtLogs.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.txtLogs.Size = new System.Drawing.Size(370, 127);
            this.txtLogs.TabIndex = 4;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 112);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(35, 13);
            this.label2.TabIndex = 5;
            this.label2.Text = "Логи:";
            // 
            // txtKLern
            // 
            this.txtKLern.Location = new System.Drawing.Point(12, 89);
            this.txtKLern.Name = "txtKLern";
            this.txtKLern.Size = new System.Drawing.Size(107, 20);
            this.txtKLern.TabIndex = 6;
            this.txtKLern.Text = "0,1";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(12, 73);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(107, 13);
            this.label3.TabIndex = 7;
            this.label3.Text = "Скорость обучения:";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(125, 73);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(114, 13);
            this.label4.TabIndex = 8;
            this.label4.Text = "Критерий остановки:";
            // 
            // txtKErr
            // 
            this.txtKErr.Location = new System.Drawing.Point(125, 89);
            this.txtKErr.Name = "txtKErr";
            this.txtKErr.Size = new System.Drawing.Size(124, 20);
            this.txtKErr.TabIndex = 9;
            this.txtKErr.Text = "0,1";
            // 
            // txtLernFiles
            // 
            this.txtLernFiles.Location = new System.Drawing.Point(12, 128);
            this.txtLernFiles.Multiline = true;
            this.txtLernFiles.Name = "txtLernFiles";
            this.txtLernFiles.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.txtLernFiles.Size = new System.Drawing.Size(370, 127);
            this.txtLernFiles.TabIndex = 10;
            this.txtLernFiles.Visible = false;
            // 
            // StopButton
            // 
            this.StopButton.Enabled = false;
            this.StopButton.Location = new System.Drawing.Point(325, 86);
            this.StopButton.Name = "StopButton";
            this.StopButton.Size = new System.Drawing.Size(57, 23);
            this.StopButton.TabIndex = 11;
            this.StopButton.Text = "Stop";
            this.StopButton.UseVisualStyleBackColor = true;
            this.StopButton.Click += new System.EventHandler(this.StopButton_Click);
            // 
            // OpenTestFileButton
            // 
            this.OpenTestFileButton.Location = new System.Drawing.Point(388, 49);
            this.OpenTestFileButton.Name = "OpenTestFileButton";
            this.OpenTestFileButton.Size = new System.Drawing.Size(252, 23);
            this.OpenTestFileButton.TabIndex = 12;
            this.OpenTestFileButton.Text = "Открыть файл для тестирования";
            this.OpenTestFileButton.UseVisualStyleBackColor = true;
            this.OpenTestFileButton.Click += new System.EventHandler(this.OpenTestFileButton_Click);
            // 
            // InputVectorBox
            // 
            this.InputVectorBox.Location = new System.Drawing.Point(388, 91);
            this.InputVectorBox.Multiline = true;
            this.InputVectorBox.Name = "InputVectorBox";
            this.InputVectorBox.Size = new System.Drawing.Size(125, 164);
            this.InputVectorBox.TabIndex = 13;
            // 
            // OutputVectorBox
            // 
            this.OutputVectorBox.Location = new System.Drawing.Point(519, 91);
            this.OutputVectorBox.Multiline = true;
            this.OutputVectorBox.Name = "OutputVectorBox";
            this.OutputVectorBox.Size = new System.Drawing.Size(125, 135);
            this.OutputVectorBox.TabIndex = 14;
            // 
            // openFileDialog2
            // 
            this.openFileDialog2.Filter = "Текстовые файлы (*.txt)|*.txt";
            this.openFileDialog2.Title = "Открыть файл для тестирования";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(388, 75);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(78, 13);
            this.label5.TabIndex = 15;
            this.label5.Text = "Вектор входа:";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(516, 75);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(86, 13);
            this.label6.TabIndex = 16;
            this.label6.Text = "Вектор выхода:";
            // 
            // BrowseEducationFolderButton
            // 
            this.BrowseEducationFolderButton.Location = new System.Drawing.Point(357, 47);
            this.BrowseEducationFolderButton.Name = "BrowseEducationFolderButton";
            this.BrowseEducationFolderButton.Size = new System.Drawing.Size(25, 23);
            this.BrowseEducationFolderButton.TabIndex = 17;
            this.BrowseEducationFolderButton.Text = "..";
            this.BrowseEducationFolderButton.UseVisualStyleBackColor = true;
            this.BrowseEducationFolderButton.Click += new System.EventHandler(this.BrowseEducationFolderButton_Click);
            // 
            // TestButton
            // 
            this.TestButton.Location = new System.Drawing.Point(519, 232);
            this.TestButton.Name = "TestButton";
            this.TestButton.Size = new System.Drawing.Size(125, 23);
            this.TestButton.TabIndex = 18;
            this.TestButton.Text = "Тестировать";
            this.TestButton.UseVisualStyleBackColor = true;
            this.TestButton.Click += new System.EventHandler(this.TestButton_Click);
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(654, 275);
            this.Controls.Add(this.TestButton);
            this.Controls.Add(this.BrowseEducationFolderButton);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.OutputVectorBox);
            this.Controls.Add(this.InputVectorBox);
            this.Controls.Add(this.OpenTestFileButton);
            this.Controls.Add(this.StopButton);
            this.Controls.Add(this.txtKErr);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txtKLern);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtLogs);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.LearnButton);
            this.Controls.Add(this.txtDir);
            this.Controls.Add(this.menuStrip1);
            this.Controls.Add(this.txtLernFiles);
            this.DoubleBuffered = true;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MainMenuStrip = this.menuStrip1;
            this.MaximizeBox = false;
            this.MaximumSize = new System.Drawing.Size(660, 300);
            this.MinimizeBox = false;
            this.MinimumSize = new System.Drawing.Size(660, 300);
            this.Name = "MainForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Нейронная сеть для распознания символов";
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem файлToolStripMenuItem;
        private System.Windows.Forms.ToolStripSeparator toolStripMenuItem2;
        private System.Windows.Forms.ToolStripMenuItem выходToolStripMenuItem;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
        private System.Windows.Forms.SaveFileDialog saveFileDialog1;
        private System.Windows.Forms.TextBox txtDir;
        private System.Windows.Forms.Button LearnButton;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtLogs;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtKLern;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtKErr;
        private System.Windows.Forms.TextBox txtLernFiles;
        private System.Windows.Forms.Button StopButton;
        private System.Windows.Forms.Button OpenTestFileButton;
        private System.Windows.Forms.TextBox InputVectorBox;
        private System.Windows.Forms.TextBox OutputVectorBox;
        private System.Windows.Forms.OpenFileDialog openFileDialog2;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Button BrowseEducationFolderButton;
        private System.Windows.Forms.FolderBrowserDialog folderBrowserDialog1;
        private System.Windows.Forms.ToolStripMenuItem создатьToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem обучающуюВыборкуToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem нейроннуюСетьToolStripMenuItem;
        private System.Windows.Forms.Button TestButton;
    }
}