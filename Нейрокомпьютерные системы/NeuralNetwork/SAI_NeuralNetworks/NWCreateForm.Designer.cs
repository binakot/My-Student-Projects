namespace NeuralNetworks
{
    partial class NWCreateForm
    {
        /// <summary>
        /// Требуется переменная конструктора.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Освободить все используемые ресурсы.
        /// </summary>
        /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Код, автоматически созданный конструктором форм Windows

        /// <summary>
        /// Обязательный метод для поддержки конструктора - не изменяйте
        /// содержимое данного метода при помощи редактора кода.
        /// </summary>
        private void InitializeComponent()
        {
            this.CreateButton = new System.Windows.Forms.Button();
            this.CreateBox = new System.Windows.Forms.GroupBox();
            this.HideLayerCountNumeric = new System.Windows.Forms.NumericUpDown();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.OutputCountNumeric = new System.Windows.Forms.NumericUpDown();
            this.InputCountNumeric = new System.Windows.Forms.NumericUpDown();
            this.CreateBox.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.HideLayerCountNumeric)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.OutputCountNumeric)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.InputCountNumeric)).BeginInit();
            this.SuspendLayout();
            // 
            // CreateButton
            // 
            this.CreateButton.DialogResult = System.Windows.Forms.DialogResult.OK;
            this.CreateButton.Location = new System.Drawing.Point(149, 97);
            this.CreateButton.Name = "CreateButton";
            this.CreateButton.Size = new System.Drawing.Size(120, 23);
            this.CreateButton.TabIndex = 0;
            this.CreateButton.Text = "Создать сеть";
            this.CreateButton.UseVisualStyleBackColor = true;
            this.CreateButton.Click += new System.EventHandler(this.CreateButton_Click);
            // 
            // CreateBox
            // 
            this.CreateBox.Controls.Add(this.HideLayerCountNumeric);
            this.CreateBox.Controls.Add(this.CreateButton);
            this.CreateBox.Controls.Add(this.label3);
            this.CreateBox.Controls.Add(this.label2);
            this.CreateBox.Controls.Add(this.label1);
            this.CreateBox.Controls.Add(this.OutputCountNumeric);
            this.CreateBox.Controls.Add(this.InputCountNumeric);
            this.CreateBox.Location = new System.Drawing.Point(12, 12);
            this.CreateBox.Name = "CreateBox";
            this.CreateBox.Size = new System.Drawing.Size(283, 255);
            this.CreateBox.TabIndex = 3;
            this.CreateBox.TabStop = false;
            this.CreateBox.Text = "Нейронная сеть";
            // 
            // HideLayerCountNumeric
            // 
            this.HideLayerCountNumeric.Location = new System.Drawing.Point(6, 32);
            this.HideLayerCountNumeric.Maximum = new decimal(new int[] {
            5,
            0,
            0,
            0});
            this.HideLayerCountNumeric.Name = "HideLayerCountNumeric";
            this.HideLayerCountNumeric.Size = new System.Drawing.Size(120, 20);
            this.HideLayerCountNumeric.TabIndex = 8;
            this.HideLayerCountNumeric.ValueChanged += new System.EventHandler(this.HideLayerCountNumeric_ValueChanged);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(6, 16);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(122, 13);
            this.label3.TabIndex = 7;
            this.label3.Text = "Число скрытых слоев:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(149, 55);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(91, 13);
            this.label2.TabIndex = 6;
            this.label2.Text = "Число выходов: ";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(149, 16);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(83, 13);
            this.label1.TabIndex = 5;
            this.label1.Text = "Число входов: ";
            // 
            // OutputCountNumeric
            // 
            this.OutputCountNumeric.Location = new System.Drawing.Point(149, 71);
            this.OutputCountNumeric.Maximum = new decimal(new int[] {
            10000,
            0,
            0,
            0});
            this.OutputCountNumeric.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.OutputCountNumeric.Name = "OutputCountNumeric";
            this.OutputCountNumeric.Size = new System.Drawing.Size(120, 20);
            this.OutputCountNumeric.TabIndex = 4;
            this.OutputCountNumeric.Value = new decimal(new int[] {
            1,
            0,
            0,
            0});
            // 
            // InputCountNumeric
            // 
            this.InputCountNumeric.Location = new System.Drawing.Point(149, 32);
            this.InputCountNumeric.Maximum = new decimal(new int[] {
            10000,
            0,
            0,
            0});
            this.InputCountNumeric.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.InputCountNumeric.Name = "InputCountNumeric";
            this.InputCountNumeric.Size = new System.Drawing.Size(120, 20);
            this.InputCountNumeric.TabIndex = 3;
            this.InputCountNumeric.Value = new decimal(new int[] {
            1,
            0,
            0,
            0});
            // 
            // NWCreateForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(305, 278);
            this.Controls.Add(this.CreateBox);
            this.DoubleBuffered = true;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "NWCreateForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Создание нейронной сети";
            this.CreateBox.ResumeLayout(false);
            this.CreateBox.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.HideLayerCountNumeric)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.OutputCountNumeric)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.InputCountNumeric)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button CreateButton;
        private System.Windows.Forms.GroupBox CreateBox;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.NumericUpDown OutputCountNumeric;
        private System.Windows.Forms.NumericUpDown InputCountNumeric;
        private System.Windows.Forms.NumericUpDown HideLayerCountNumeric;
    }
}

