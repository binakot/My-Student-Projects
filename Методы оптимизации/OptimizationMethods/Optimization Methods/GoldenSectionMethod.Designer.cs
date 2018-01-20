namespace Optimization_Methods
{
    partial class GoldenSectionMethod
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
            this.AccuracyBox = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.RightBorderBox = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.FunctionBox = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.LeftBorderBox = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.ResultBox = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.GoldenSectionMethodButton = new System.Windows.Forms.Button();
            this.LogTextBox = new System.Windows.Forms.RichTextBox();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.AccuracyBox);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.RightBorderBox);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.FunctionBox);
            this.groupBox1.Controls.Add(this.label5);
            this.groupBox1.Controls.Add(this.LeftBorderBox);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Location = new System.Drawing.Point(12, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(319, 126);
            this.groupBox1.TabIndex = 4;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Входные данные";
            // 
            // AccuracyBox
            // 
            this.AccuracyBox.Location = new System.Drawing.Point(95, 97);
            this.AccuracyBox.Name = "AccuracyBox";
            this.AccuracyBox.Size = new System.Drawing.Size(218, 20);
            this.AccuracyBox.TabIndex = 2;
            this.AccuracyBox.Text = "0,000001";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(6, 100);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(54, 13);
            this.label3.TabIndex = 1;
            this.label3.Text = "Точность";
            // 
            // RightBorderBox
            // 
            this.RightBorderBox.Location = new System.Drawing.Point(95, 71);
            this.RightBorderBox.Name = "RightBorderBox";
            this.RightBorderBox.Size = new System.Drawing.Size(218, 20);
            this.RightBorderBox.TabIndex = 2;
            this.RightBorderBox.Text = "10";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(6, 74);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(89, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "Правая граница";
            // 
            // FunctionBox
            // 
            this.FunctionBox.Location = new System.Drawing.Point(95, 19);
            this.FunctionBox.Name = "FunctionBox";
            this.FunctionBox.Size = new System.Drawing.Size(218, 20);
            this.FunctionBox.TabIndex = 2;
            this.FunctionBox.Text = "exp(x  * ln(5)) - 6 * x - 3";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(6, 22);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(53, 13);
            this.label5.TabIndex = 1;
            this.label5.Text = "Функция";
            // 
            // LeftBorderBox
            // 
            this.LeftBorderBox.Location = new System.Drawing.Point(95, 45);
            this.LeftBorderBox.Name = "LeftBorderBox";
            this.LeftBorderBox.Size = new System.Drawing.Size(218, 20);
            this.LeftBorderBox.TabIndex = 2;
            this.LeftBorderBox.Text = "-10";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(6, 48);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(83, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Левая граница";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.ResultBox);
            this.groupBox2.Controls.Add(this.label4);
            this.groupBox2.Location = new System.Drawing.Point(12, 144);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(319, 44);
            this.groupBox2.TabIndex = 7;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Выходные данные";
            // 
            // ResultBox
            // 
            this.ResultBox.Location = new System.Drawing.Point(95, 13);
            this.ResultBox.Name = "ResultBox";
            this.ResultBox.ReadOnly = true;
            this.ResultBox.Size = new System.Drawing.Size(218, 20);
            this.ResultBox.TabIndex = 2;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(6, 16);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(59, 13);
            this.label4.TabIndex = 1;
            this.label4.Text = "Результат";
            // 
            // GoldenSectionMethodButton
            // 
            this.GoldenSectionMethodButton.Location = new System.Drawing.Point(12, 194);
            this.GoldenSectionMethodButton.Name = "GoldenSectionMethodButton";
            this.GoldenSectionMethodButton.Size = new System.Drawing.Size(319, 56);
            this.GoldenSectionMethodButton.TabIndex = 6;
            this.GoldenSectionMethodButton.Text = "Вычислить корень уравнения методом золотого сечения";
            this.GoldenSectionMethodButton.UseVisualStyleBackColor = true;
            this.GoldenSectionMethodButton.Click += new System.EventHandler(this.GoldenSectionMethodButton_Click);
            // 
            // LogTextBox
            // 
            this.LogTextBox.Location = new System.Drawing.Point(337, 12);
            this.LogTextBox.Name = "LogTextBox";
            this.LogTextBox.ReadOnly = true;
            this.LogTextBox.Size = new System.Drawing.Size(478, 238);
            this.LogTextBox.TabIndex = 5;
            this.LogTextBox.Text = "";
            // 
            // GoldenSectionMethod
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(823, 259);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.GoldenSectionMethodButton);
            this.Controls.Add(this.LogTextBox);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.Name = "GoldenSectionMethod";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Метод золотого сечения";
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.TextBox AccuracyBox;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox RightBorderBox;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox FunctionBox;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox LeftBorderBox;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.TextBox ResultBox;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button GoldenSectionMethodButton;
        private System.Windows.Forms.RichTextBox LogTextBox;
    }
}