namespace Optimization_Methods
{
    partial class Gauss
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
            this.OutBox = new System.Windows.Forms.RichTextBox();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.IterCountBox = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.MinFBox = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.MinYBox = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.MinXBox = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.StepBox = new System.Windows.Forms.TextBox();
            this.label11 = new System.Windows.Forms.Label();
            this.EpsilonBox = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.y0Box = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.x0Box = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.GaussButton = new System.Windows.Forms.Button();
            this.groupBox3.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.SuspendLayout();
            // 
            // OutBox
            // 
            this.OutBox.Location = new System.Drawing.Point(12, 174);
            this.OutBox.Name = "OutBox";
            this.OutBox.Size = new System.Drawing.Size(473, 207);
            this.OutBox.TabIndex = 9;
            this.OutBox.Text = "";
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.IterCountBox);
            this.groupBox3.Controls.Add(this.label7);
            this.groupBox3.Controls.Add(this.MinFBox);
            this.groupBox3.Controls.Add(this.label6);
            this.groupBox3.Controls.Add(this.MinYBox);
            this.groupBox3.Controls.Add(this.label5);
            this.groupBox3.Controls.Add(this.MinXBox);
            this.groupBox3.Controls.Add(this.label4);
            this.groupBox3.Location = new System.Drawing.Point(186, 12);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(297, 126);
            this.groupBox3.TabIndex = 8;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Результат градиентного сруска";
            // 
            // IterCountBox
            // 
            this.IterCountBox.Location = new System.Drawing.Point(135, 97);
            this.IterCountBox.Name = "IterCountBox";
            this.IterCountBox.ReadOnly = true;
            this.IterCountBox.Size = new System.Drawing.Size(156, 20);
            this.IterCountBox.TabIndex = 1;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(6, 100);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(99, 13);
            this.label7.TabIndex = 0;
            this.label7.Text = "Всего итераций = ";
            // 
            // MinFBox
            // 
            this.MinFBox.Location = new System.Drawing.Point(135, 71);
            this.MinFBox.Name = "MinFBox";
            this.MinFBox.ReadOnly = true;
            this.MinFBox.Size = new System.Drawing.Size(156, 20);
            this.MinFBox.TabIndex = 1;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(6, 74);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(89, 13);
            this.label6.TabIndex = 0;
            this.label6.Text = "F(min X, min Y) = ";
            // 
            // MinYBox
            // 
            this.MinYBox.Location = new System.Drawing.Point(135, 45);
            this.MinYBox.Name = "MinYBox";
            this.MinYBox.ReadOnly = true;
            this.MinYBox.Size = new System.Drawing.Size(156, 20);
            this.MinYBox.TabIndex = 1;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(6, 48);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(45, 13);
            this.label5.TabIndex = 0;
            this.label5.Text = "min Y = ";
            // 
            // MinXBox
            // 
            this.MinXBox.Location = new System.Drawing.Point(135, 19);
            this.MinXBox.Name = "MinXBox";
            this.MinXBox.ReadOnly = true;
            this.MinXBox.Size = new System.Drawing.Size(156, 20);
            this.MinXBox.TabIndex = 1;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(6, 22);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(45, 13);
            this.label4.TabIndex = 0;
            this.label4.Text = "min X = ";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.StepBox);
            this.groupBox1.Controls.Add(this.label11);
            this.groupBox1.Controls.Add(this.EpsilonBox);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.groupBox2);
            this.groupBox1.Location = new System.Drawing.Point(12, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(168, 156);
            this.groupBox1.TabIndex = 7;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Входные данные";
            // 
            // StepBox
            // 
            this.StepBox.Location = new System.Drawing.Point(75, 124);
            this.StepBox.Name = "StepBox";
            this.StepBox.Size = new System.Drawing.Size(74, 20);
            this.StepBox.TabIndex = 1;
            this.StepBox.Text = "0,5";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(6, 127);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(39, 13);
            this.label11.TabIndex = 0;
            this.label11.Text = "Шаг = ";
            // 
            // EpsilonBox
            // 
            this.EpsilonBox.Location = new System.Drawing.Point(75, 98);
            this.EpsilonBox.Name = "EpsilonBox";
            this.EpsilonBox.Size = new System.Drawing.Size(74, 20);
            this.EpsilonBox.TabIndex = 1;
            this.EpsilonBox.Text = "0,001";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(6, 101);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(66, 13);
            this.label3.TabIndex = 0;
            this.label3.Text = "Точность = ";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.y0Box);
            this.groupBox2.Controls.Add(this.label2);
            this.groupBox2.Controls.Add(this.x0Box);
            this.groupBox2.Controls.Add(this.label1);
            this.groupBox2.Location = new System.Drawing.Point(6, 19);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(154, 73);
            this.groupBox2.TabIndex = 0;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Начальное приближение";
            // 
            // y0Box
            // 
            this.y0Box.Location = new System.Drawing.Point(43, 43);
            this.y0Box.Name = "y0Box";
            this.y0Box.Size = new System.Drawing.Size(100, 20);
            this.y0Box.TabIndex = 1;
            this.y0Box.Text = "0";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(7, 46);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(30, 13);
            this.label2.TabIndex = 0;
            this.label2.Text = "y0 = ";
            // 
            // x0Box
            // 
            this.x0Box.Location = new System.Drawing.Point(43, 17);
            this.x0Box.Name = "x0Box";
            this.x0Box.Size = new System.Drawing.Size(100, 20);
            this.x0Box.TabIndex = 0;
            this.x0Box.Text = "-1";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(7, 20);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(30, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "x0 = ";
            // 
            // GaussButton
            // 
            this.GaussButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.GaussButton.Location = new System.Drawing.Point(186, 144);
            this.GaussButton.Name = "GaussButton";
            this.GaussButton.Size = new System.Drawing.Size(297, 24);
            this.GaussButton.TabIndex = 6;
            this.GaussButton.Text = "Выполнить метод Гаусса";
            this.GaussButton.UseVisualStyleBackColor = true;
            this.GaussButton.Click += new System.EventHandler(this.GaussButton_Click);
            // 
            // Gauss
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(499, 394);
            this.Controls.Add(this.OutBox);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.GaussButton);
            this.Name = "Gauss";
            this.Text = "Метод Гаусса";
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.RichTextBox OutBox;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.TextBox IterCountBox;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TextBox MinFBox;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox MinYBox;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox MinXBox;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.TextBox StepBox;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.TextBox EpsilonBox;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.TextBox y0Box;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox x0Box;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button GaussButton;
    }
}