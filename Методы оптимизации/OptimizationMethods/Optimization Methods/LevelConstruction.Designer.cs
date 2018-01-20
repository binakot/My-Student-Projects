namespace Optimization_Methods
{
    partial class LevelConstruction
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
            this.GraphBox = new System.Windows.Forms.PictureBox();
            this.ParamBox = new System.Windows.Forms.GroupBox();
            this.EpsilonBox = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.LevelBox = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.MaxYBox = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.MinYBox = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.MaxXBox = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.MinXBox = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.BuildButton = new System.Windows.Forms.Button();
            this.ClearButton = new System.Windows.Forms.Button();
            this.ProgressBar = new System.Windows.Forms.ProgressBar();
            ((System.ComponentModel.ISupportInitialize)(this.GraphBox)).BeginInit();
            this.ParamBox.SuspendLayout();
            this.SuspendLayout();
            // 
            // GraphBox
            // 
            this.GraphBox.Location = new System.Drawing.Point(12, 12);
            this.GraphBox.Name = "GraphBox";
            this.GraphBox.Size = new System.Drawing.Size(500, 500);
            this.GraphBox.TabIndex = 0;
            this.GraphBox.TabStop = false;
            // 
            // ParamBox
            // 
            this.ParamBox.Controls.Add(this.EpsilonBox);
            this.ParamBox.Controls.Add(this.label6);
            this.ParamBox.Controls.Add(this.LevelBox);
            this.ParamBox.Controls.Add(this.label5);
            this.ParamBox.Controls.Add(this.MaxYBox);
            this.ParamBox.Controls.Add(this.label4);
            this.ParamBox.Controls.Add(this.MinYBox);
            this.ParamBox.Controls.Add(this.label3);
            this.ParamBox.Controls.Add(this.MaxXBox);
            this.ParamBox.Controls.Add(this.label2);
            this.ParamBox.Controls.Add(this.MinXBox);
            this.ParamBox.Controls.Add(this.label1);
            this.ParamBox.Location = new System.Drawing.Point(518, 12);
            this.ParamBox.Name = "ParamBox";
            this.ParamBox.Size = new System.Drawing.Size(221, 174);
            this.ParamBox.TabIndex = 0;
            this.ParamBox.TabStop = false;
            this.ParamBox.Text = "Параметры";
            // 
            // EpsilonBox
            // 
            this.EpsilonBox.Location = new System.Drawing.Point(109, 143);
            this.EpsilonBox.Name = "EpsilonBox";
            this.EpsilonBox.Size = new System.Drawing.Size(100, 20);
            this.EpsilonBox.TabIndex = 3;
            this.EpsilonBox.Text = "0,01";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(6, 146);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(66, 13);
            this.label6.TabIndex = 0;
            this.label6.Text = "Точность = ";
            // 
            // LevelBox
            // 
            this.LevelBox.Location = new System.Drawing.Point(109, 117);
            this.LevelBox.Name = "LevelBox";
            this.LevelBox.Size = new System.Drawing.Size(100, 20);
            this.LevelBox.TabIndex = 3;
            this.LevelBox.Text = "20";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(6, 120);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(97, 13);
            this.label5.TabIndex = 0;
            this.label5.Text = "Кол-во уровней = ";
            // 
            // MaxYBox
            // 
            this.MaxYBox.Location = new System.Drawing.Point(109, 91);
            this.MaxYBox.Name = "MaxYBox";
            this.MaxYBox.Size = new System.Drawing.Size(100, 20);
            this.MaxYBox.TabIndex = 3;
            this.MaxYBox.Text = "1";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(6, 94);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(48, 13);
            this.label4.TabIndex = 0;
            this.label4.Text = "max Y = ";
            // 
            // MinYBox
            // 
            this.MinYBox.Location = new System.Drawing.Point(109, 65);
            this.MinYBox.Name = "MinYBox";
            this.MinYBox.Size = new System.Drawing.Size(100, 20);
            this.MinYBox.TabIndex = 2;
            this.MinYBox.Text = "-1";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(6, 68);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(45, 13);
            this.label3.TabIndex = 0;
            this.label3.Text = "min Y = ";
            // 
            // MaxXBox
            // 
            this.MaxXBox.Location = new System.Drawing.Point(109, 39);
            this.MaxXBox.Name = "MaxXBox";
            this.MaxXBox.Size = new System.Drawing.Size(100, 20);
            this.MaxXBox.TabIndex = 1;
            this.MaxXBox.Text = "1";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(6, 42);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(48, 13);
            this.label2.TabIndex = 0;
            this.label2.Text = "max X = ";
            // 
            // MinXBox
            // 
            this.MinXBox.Location = new System.Drawing.Point(109, 13);
            this.MinXBox.Name = "MinXBox";
            this.MinXBox.Size = new System.Drawing.Size(100, 20);
            this.MinXBox.TabIndex = 0;
            this.MinXBox.Text = "-1";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(6, 16);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(45, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "min X = ";
            // 
            // BuildButton
            // 
            this.BuildButton.Location = new System.Drawing.Point(518, 192);
            this.BuildButton.Name = "BuildButton";
            this.BuildButton.Size = new System.Drawing.Size(221, 40);
            this.BuildButton.TabIndex = 1;
            this.BuildButton.Text = "Выполнить построение";
            this.BuildButton.UseVisualStyleBackColor = true;
            this.BuildButton.Click += new System.EventHandler(this.BuildButton_Click);
            // 
            // ClearButton
            // 
            this.ClearButton.Location = new System.Drawing.Point(518, 238);
            this.ClearButton.Name = "ClearButton";
            this.ClearButton.Size = new System.Drawing.Size(221, 40);
            this.ClearButton.TabIndex = 2;
            this.ClearButton.Text = "Очистить";
            this.ClearButton.UseVisualStyleBackColor = true;
            this.ClearButton.Click += new System.EventHandler(this.ClearButton_Click);
            // 
            // ProgressBar
            // 
            this.ProgressBar.Location = new System.Drawing.Point(518, 487);
            this.ProgressBar.Name = "ProgressBar";
            this.ProgressBar.Size = new System.Drawing.Size(221, 25);
            this.ProgressBar.TabIndex = 3;
            // 
            // LevelConstruction
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(747, 521);
            this.Controls.Add(this.ProgressBar);
            this.Controls.Add(this.ClearButton);
            this.Controls.Add(this.BuildButton);
            this.Controls.Add(this.ParamBox);
            this.Controls.Add(this.GraphBox);
            this.DoubleBuffered = true;
            this.Name = "LevelConstruction";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Построение линий уровня для функций двух переменнных";
            this.Load += new System.EventHandler(this.LevelConstruction_Load);
            ((System.ComponentModel.ISupportInitialize)(this.GraphBox)).EndInit();
            this.ParamBox.ResumeLayout(false);
            this.ParamBox.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.PictureBox GraphBox;
        private System.Windows.Forms.GroupBox ParamBox;
        private System.Windows.Forms.TextBox MaxYBox;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox MinYBox;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox MaxXBox;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox MinXBox;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button BuildButton;
        private System.Windows.Forms.Button ClearButton;
        private System.Windows.Forms.TextBox LevelBox;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox EpsilonBox;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.ProgressBar ProgressBar;
    }
}