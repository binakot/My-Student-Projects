namespace Cryptography
{
    partial class EDSForm
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
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.InputBox = new System.Windows.Forms.RichTextBox();
            this.ChangeBox = new System.Windows.Forms.RichTextBox();
            this.OutputBox = new System.Windows.Forms.RichTextBox();
            this.SendButton = new System.Windows.Forms.Button();
            this.ChangeButton = new System.Windows.Forms.Button();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.KeyBox1 = new System.Windows.Forms.TextBox();
            this.KeyBox2 = new System.Windows.Forms.TextBox();
            this.TSBox1 = new System.Windows.Forms.TextBox();
            this.CheckButton = new System.Windows.Forms.Button();
            this.DecodeSpy = new System.Windows.Forms.Button();
            this.TSBox2 = new System.Windows.Forms.TextBox();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.groupBox4.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.TSBox1);
            this.groupBox1.Controls.Add(this.groupBox4);
            this.groupBox1.Controls.Add(this.SendButton);
            this.groupBox1.Controls.Add(this.InputBox);
            this.groupBox1.Location = new System.Drawing.Point(12, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(200, 321);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Отправитель";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.TSBox2);
            this.groupBox2.Controls.Add(this.DecodeSpy);
            this.groupBox2.Controls.Add(this.ChangeButton);
            this.groupBox2.Controls.Add(this.ChangeBox);
            this.groupBox2.Location = new System.Drawing.Point(218, 12);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(200, 400);
            this.groupBox2.TabIndex = 0;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Перехватчик";
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.CheckButton);
            this.groupBox3.Controls.Add(this.OutputBox);
            this.groupBox3.Location = new System.Drawing.Point(424, 12);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(200, 400);
            this.groupBox3.TabIndex = 0;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Получатель";
            // 
            // InputBox
            // 
            this.InputBox.Location = new System.Drawing.Point(6, 19);
            this.InputBox.Name = "InputBox";
            this.InputBox.Size = new System.Drawing.Size(188, 150);
            this.InputBox.TabIndex = 0;
            this.InputBox.Text = "Dear James Bond,\n  How are u?\n  GGWP!\n  xD";
            // 
            // ChangeBox
            // 
            this.ChangeBox.Location = new System.Drawing.Point(6, 19);
            this.ChangeBox.Name = "ChangeBox";
            this.ChangeBox.Size = new System.Drawing.Size(188, 150);
            this.ChangeBox.TabIndex = 0;
            this.ChangeBox.Text = "";
            // 
            // OutputBox
            // 
            this.OutputBox.Location = new System.Drawing.Point(6, 19);
            this.OutputBox.Name = "OutputBox";
            this.OutputBox.Size = new System.Drawing.Size(188, 150);
            this.OutputBox.TabIndex = 0;
            this.OutputBox.Text = "";
            // 
            // SendButton
            // 
            this.SendButton.Location = new System.Drawing.Point(6, 175);
            this.SendButton.Name = "SendButton";
            this.SendButton.Size = new System.Drawing.Size(188, 30);
            this.SendButton.TabIndex = 1;
            this.SendButton.Text = "Отправить";
            this.SendButton.UseVisualStyleBackColor = true;
            this.SendButton.Click += new System.EventHandler(this.button1_Click);
            // 
            // ChangeButton
            // 
            this.ChangeButton.Location = new System.Drawing.Point(6, 211);
            this.ChangeButton.Name = "ChangeButton";
            this.ChangeButton.Size = new System.Drawing.Size(188, 30);
            this.ChangeButton.TabIndex = 1;
            this.ChangeButton.Text = "Перехватить";
            this.ChangeButton.UseVisualStyleBackColor = true;
            this.ChangeButton.Click += new System.EventHandler(this.ChangeButton_Click);
            // 
            // groupBox4
            // 
            this.groupBox4.Controls.Add(this.KeyBox2);
            this.groupBox4.Controls.Add(this.KeyBox1);
            this.groupBox4.Location = new System.Drawing.Point(6, 211);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Size = new System.Drawing.Size(188, 74);
            this.groupBox4.TabIndex = 2;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "Ключи";
            // 
            // KeyBox1
            // 
            this.KeyBox1.Location = new System.Drawing.Point(6, 19);
            this.KeyBox1.Name = "KeyBox1";
            this.KeyBox1.Size = new System.Drawing.Size(176, 20);
            this.KeyBox1.TabIndex = 0;
            // 
            // KeyBox2
            // 
            this.KeyBox2.Location = new System.Drawing.Point(6, 45);
            this.KeyBox2.Name = "KeyBox2";
            this.KeyBox2.Size = new System.Drawing.Size(176, 20);
            this.KeyBox2.TabIndex = 0;
            // 
            // TSBox1
            // 
            this.TSBox1.Location = new System.Drawing.Point(6, 291);
            this.TSBox1.Name = "TSBox1";
            this.TSBox1.Size = new System.Drawing.Size(188, 20);
            this.TSBox1.TabIndex = 3;
            // 
            // CheckButton
            // 
            this.CheckButton.Location = new System.Drawing.Point(6, 175);
            this.CheckButton.Name = "CheckButton";
            this.CheckButton.Size = new System.Drawing.Size(188, 30);
            this.CheckButton.TabIndex = 1;
            this.CheckButton.Text = "Проверить";
            this.CheckButton.UseVisualStyleBackColor = true;
            this.CheckButton.Click += new System.EventHandler(this.CheckButton_Click);
            // 
            // DecodeSpy
            // 
            this.DecodeSpy.Location = new System.Drawing.Point(6, 175);
            this.DecodeSpy.Name = "DecodeSpy";
            this.DecodeSpy.Size = new System.Drawing.Size(188, 30);
            this.DecodeSpy.TabIndex = 2;
            this.DecodeSpy.Text = "Декодировать";
            this.DecodeSpy.UseVisualStyleBackColor = true;
            this.DecodeSpy.Click += new System.EventHandler(this.DecodeSpy_Click);
            // 
            // TSBox2
            // 
            this.TSBox2.Location = new System.Drawing.Point(6, 247);
            this.TSBox2.Name = "TSBox2";
            this.TSBox2.Size = new System.Drawing.Size(188, 20);
            this.TSBox2.TabIndex = 4;
            // 
            // EDSForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(637, 423);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Name = "EDSForm";
            this.Text = "Электронная Цифровая Подпись";
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.groupBox4.ResumeLayout(false);
            this.groupBox4.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.RichTextBox InputBox;
        private System.Windows.Forms.RichTextBox ChangeBox;
        private System.Windows.Forms.RichTextBox OutputBox;
        private System.Windows.Forms.Button SendButton;
        private System.Windows.Forms.Button ChangeButton;
        private System.Windows.Forms.GroupBox groupBox4;
        private System.Windows.Forms.TextBox KeyBox2;
        private System.Windows.Forms.TextBox KeyBox1;
        private System.Windows.Forms.TextBox TSBox1;
        private System.Windows.Forms.Button CheckButton;
        private System.Windows.Forms.Button DecodeSpy;
        private System.Windows.Forms.TextBox TSBox2;
    }
}