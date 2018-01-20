namespace WindowsFormsApplication4
{
    partial class Form1
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.pictureGraph = new System.Windows.Forms.PictureBox();
            this.button_Clear = new System.Windows.Forms.Button();
            this.btnUpper = new System.Windows.Forms.Button();
            this.numericUpDown1 = new System.Windows.Forms.NumericUpDown();
            this.richTextBox1 = new System.Windows.Forms.RichTextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.btnLower = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.btnDual = new System.Windows.Forms.Button();
            this.btnInverse = new System.Windows.Forms.Button();
            this.btnAddition = new System.Windows.Forms.Button();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.btnOptions = new System.Windows.Forms.Button();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.btnHom = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.pictureGraph)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown1)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.groupBox4.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // pictureGraph
            // 
            this.pictureGraph.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.pictureGraph.Location = new System.Drawing.Point(12, 12);
            this.pictureGraph.Name = "pictureGraph";
            this.pictureGraph.Size = new System.Drawing.Size(310, 275);
            this.pictureGraph.TabIndex = 0;
            this.pictureGraph.TabStop = false;
            this.pictureGraph.MouseDown += new System.Windows.Forms.MouseEventHandler(this.pictureGraph_MouseDown);
            this.pictureGraph.MouseMove += new System.Windows.Forms.MouseEventHandler(this.pictureGraph_MouseMove);
            this.pictureGraph.MouseUp += new System.Windows.Forms.MouseEventHandler(this.pictureGraph_MouseUp);
            // 
            // button_Clear
            // 
            this.button_Clear.Location = new System.Drawing.Point(332, 12);
            this.button_Clear.Name = "button_Clear";
            this.button_Clear.Size = new System.Drawing.Size(116, 36);
            this.button_Clear.TabIndex = 1;
            this.button_Clear.Text = "Стереть граф";
            this.button_Clear.UseVisualStyleBackColor = true;
            this.button_Clear.Click += new System.EventHandler(this.button_Clear_Click);
            // 
            // btnUpper
            // 
            this.btnUpper.Location = new System.Drawing.Point(6, 48);
            this.btnUpper.Name = "btnUpper";
            this.btnUpper.Size = new System.Drawing.Size(107, 23);
            this.btnUpper.TabIndex = 3;
            this.btnUpper.Text = "Верхнее";
            this.btnUpper.UseVisualStyleBackColor = true;
            this.btnUpper.Click += new System.EventHandler(this.btnUpper_Click);
            // 
            // numericUpDown1
            // 
            this.numericUpDown1.Location = new System.Drawing.Point(64, 19);
            this.numericUpDown1.Maximum = new decimal(new int[] {
            0,
            0,
            0,
            0});
            this.numericUpDown1.Name = "numericUpDown1";
            this.numericUpDown1.Size = new System.Drawing.Size(49, 20);
            this.numericUpDown1.TabIndex = 4;
            // 
            // richTextBox1
            // 
            this.richTextBox1.BackColor = System.Drawing.SystemColors.Window;
            this.richTextBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.richTextBox1.Location = new System.Drawing.Point(12, 293);
            this.richTextBox1.Name = "richTextBox1";
            this.richTextBox1.ReadOnly = true;
            this.richTextBox1.Size = new System.Drawing.Size(310, 163);
            this.richTextBox1.TabIndex = 5;
            this.richTextBox1.Text = "";
            this.richTextBox1.TextChanged += new System.EventHandler(this.richTextBox1_TextChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(6, 21);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(52, 13);
            this.label2.TabIndex = 7;
            this.label2.Text = "Вершина";
            // 
            // btnLower
            // 
            this.btnLower.Location = new System.Drawing.Point(6, 77);
            this.btnLower.Name = "btnLower";
            this.btnLower.Size = new System.Drawing.Size(107, 23);
            this.btnLower.TabIndex = 8;
            this.btnLower.Text = "Нижнее";
            this.btnLower.UseVisualStyleBackColor = true;
            this.btnLower.Click += new System.EventHandler(this.btnLower_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.btnUpper);
            this.groupBox1.Controls.Add(this.btnLower);
            this.groupBox1.Controls.Add(this.numericUpDown1);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Location = new System.Drawing.Point(454, 293);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(125, 107);
            this.groupBox1.TabIndex = 9;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Сечения";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.btnDual);
            this.groupBox2.Controls.Add(this.btnInverse);
            this.groupBox2.Controls.Add(this.btnAddition);
            this.groupBox2.Location = new System.Drawing.Point(328, 293);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(120, 107);
            this.groupBox2.TabIndex = 11;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Операции";
            // 
            // btnDual
            // 
            this.btnDual.Location = new System.Drawing.Point(10, 77);
            this.btnDual.Name = "btnDual";
            this.btnDual.Size = new System.Drawing.Size(99, 23);
            this.btnDual.TabIndex = 2;
            this.btnDual.Text = "Двойственное";
            this.btnDual.UseVisualStyleBackColor = true;
            this.btnDual.Click += new System.EventHandler(this.btnDual_Click);
            // 
            // btnInverse
            // 
            this.btnInverse.Location = new System.Drawing.Point(10, 48);
            this.btnInverse.Name = "btnInverse";
            this.btnInverse.Size = new System.Drawing.Size(99, 23);
            this.btnInverse.TabIndex = 1;
            this.btnInverse.Text = "Обратное";
            this.btnInverse.UseVisualStyleBackColor = true;
            this.btnInverse.Click += new System.EventHandler(this.btnInverse_Click);
            // 
            // btnAddition
            // 
            this.btnAddition.Location = new System.Drawing.Point(10, 19);
            this.btnAddition.Name = "btnAddition";
            this.btnAddition.Size = new System.Drawing.Size(99, 23);
            this.btnAddition.TabIndex = 0;
            this.btnAddition.Text = "Дополнение";
            this.btnAddition.UseVisualStyleBackColor = true;
            this.btnAddition.Click += new System.EventHandler(this.btnAddition_Click);
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.btnOptions);
            this.groupBox3.Location = new System.Drawing.Point(328, 406);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(120, 50);
            this.groupBox3.TabIndex = 12;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Свойства";
            // 
            // btnOptions
            // 
            this.btnOptions.Location = new System.Drawing.Point(10, 19);
            this.btnOptions.Name = "btnOptions";
            this.btnOptions.Size = new System.Drawing.Size(95, 25);
            this.btnOptions.TabIndex = 0;
            this.btnOptions.Text = "Вывод";
            this.btnOptions.UseVisualStyleBackColor = true;
            this.btnOptions.Click += new System.EventHandler(this.btnOptions_Click);
            // 
            // groupBox4
            // 
            this.groupBox4.Controls.Add(this.btnHom);
            this.groupBox4.Location = new System.Drawing.Point(454, 406);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Size = new System.Drawing.Size(125, 50);
            this.groupBox4.TabIndex = 13;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "Гомоморфизм";
            // 
            // btnHom
            // 
            this.btnHom.Location = new System.Drawing.Point(9, 19);
            this.btnHom.Name = "btnHom";
            this.btnHom.Size = new System.Drawing.Size(104, 23);
            this.btnHom.TabIndex = 14;
            this.btnHom.Text = "Выполнить";
            this.btnHom.UseVisualStyleBackColor = true;
            this.btnHom.Click += new System.EventHandler(this.btnHom_Click);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(454, 12);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(125, 36);
            this.button1.TabIndex = 14;
            this.button1.Text = "Граф готов";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // dataGridView1
            // 
            this.dataGridView1.AllowUserToAddRows = false;
            this.dataGridView1.AllowUserToDeleteRows = false;
            this.dataGridView1.AllowUserToResizeColumns = false;
            this.dataGridView1.AllowUserToResizeRows = false;
            this.dataGridView1.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dataGridView1.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(328, 67);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(251, 220);
            this.dataGridView1.TabIndex = 16;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(382, 51);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(111, 13);
            this.label1.TabIndex = 17;
            this.label1.Text = "Матрица смежности";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(593, 469);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.richTextBox1);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.groupBox4);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.button_Clear);
            this.Controls.Add(this.pictureGraph);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.Name = "Form1";
            this.Text = "ТПР - 2 л.р. Бинарное отношение";
            this.MouseDown += new System.Windows.Forms.MouseEventHandler(this.pictureGraph_MouseDown);
            this.MouseMove += new System.Windows.Forms.MouseEventHandler(this.pictureGraph_MouseMove);
            this.MouseUp += new System.Windows.Forms.MouseEventHandler(this.pictureGraph_MouseUp);
            ((System.ComponentModel.ISupportInitialize)(this.pictureGraph)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown1)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox3.ResumeLayout(false);
            this.groupBox4.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox pictureGraph;
        private System.Windows.Forms.Button button_Clear;
        private System.Windows.Forms.Button btnUpper;
        private System.Windows.Forms.NumericUpDown numericUpDown1;
        private System.Windows.Forms.RichTextBox richTextBox1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button btnLower;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Button btnAddition;
        private System.Windows.Forms.Button btnDual;
        private System.Windows.Forms.Button btnInverse;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.Button btnOptions;
        private System.Windows.Forms.GroupBox groupBox4;
        private System.Windows.Forms.Button btnHom;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Label label1;
    }
}

