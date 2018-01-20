using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Drawing.Drawing2D;

namespace method_amper_volt
{
    public partial class Main : Form
    {
        public Main()
        {
            InitializeComponent();
        }

        public Double AStep, VStep;  // Шаг прорисовки цены деления

        public int x = 150, y = 150;  // Координаты для прорисовки шкалы

        public static Double l = 0.1,  // Общая длина проводников в сети (метр)
                      p = 0.0171,  // электрическое удельное сопротивление  материалла проводников (Медь) 
                      d = 1.0;  // номинальный диаметр провода (миллиметр)

        public Double R,  // Действительное сопротивление
                      Rx,  // Сопротивление, выставленное в магазине сопротивлений
                      Ra,  // Сопротивление амперметра
                      Rv,  // Сопротивление вольметра
                      Rprov,  // Сопротивление проводника
                      curV = 0,  // Текущее напряжение сети
                      curI = 0;  // Текущая сила тока в сети        

        private void button1_Click(object sender, EventArgs e)
        {
            // ВКЛ
            button1.Enabled = false;
            button2.Enabled = true;
            RaBox.Enabled = false;
            RvBox.Enabled = false;
            RxBox.Enabled = false;
            groupBox7.Enabled = true;
            // Создаем шкалы аналоговых датчиков
            // Амперметр       
            Data.AvalOfDiv = (Data.AMax + Data.AMin) / 10;
            AStep = Data.AMax / Data.AvalOfDiv;  // Шаг прорисовки
            PaintEventArgs Apea = new PaintEventArgs(this.panel1.CreateGraphics(), this.panel1.ClientRectangle);
            APaint(sender, Apea);
            // Вольметр
            Data.VvalOfDiv = (Data.VMax + Data.VMin) / 10;
            VStep = Data.VMax / Data.VvalOfDiv;  // Шаг прорисовки
            PaintEventArgs Vpea = new PaintEventArgs(this.panel2.CreateGraphics(), this.panel2.ClientRectangle);
            VPaint(sender, Vpea);
            // Напряжение сети от источника тока 
            VSetValue(this.panel2, curV);
            // Сила тока в цепи  
            ASetValue(this.panel1, curI);
            // Сопротивление цепи
            R = Convert.ToDouble(RaBox.Text) + Convert.ToDouble(RxBox.Text);
            RBox.Text = R.ToString();      
        }

        private void button2_Click(object sender, EventArgs e)
        {
            // ВЫКЛ
            button1.Enabled = true;
            button2.Enabled = false;
            RaBox.Enabled = true;
            RvBox.Enabled = true;
            RxBox.Enabled = true;
            textBox1.Text = "0";
            textBox2.Text = "0";
            trackBar7.Value = 0;
            trackBar8.Value = 0;
            groupBox7.Enabled = false;
            RBox.Text = "";
        }

        private void Main_Load(object sender, EventArgs e)
        {
            // Подготовка к работе
            Data data = new Data();
            Rprov = (4 * l * p) / (Math.PI * d * d);  // Сопротивление проводников в сети
            RprovBox.Text = Rprov.ToString();
            // По умолчанию схема для малых сопротивленй
            pictureBox6.Visible = true;
            pictureBox7.Visible = false;
            textBox3.Text = Data.AMax.ToString();
            textBox5.Text = Data.VMax.ToString();
        }

        private void pictureBox3_Click(object sender, EventArgs e)
        {
            // Амперметр
            if (button1.Enabled)
            {
                Ampermeter form3 = new Ampermeter();
                form3.ShowDialog();

                Data.AvalOfDiv = (Data.AMax + Data.AMin) / 10;
                AStep = Data.AMax / Data.AvalOfDiv;  // Шаг прорисовки
                PaintEventArgs Apea = new PaintEventArgs(this.panel1.CreateGraphics(), this.panel1.ClientRectangle);
                APaint(sender, Apea);
            }
            else
            {
                MessageBox.Show("Перед заменой амперметра необходимо отключить стенд от сети");
            }
        }

        private void pictureBox4_Click(object sender, EventArgs e)
        {
            // Источник постоянного тока
            if (button1.Enabled)
            {
                CurrentSource form2 = new CurrentSource();
                form2.ShowDialog();
            }
            else
            {
                MessageBox.Show("Перед заменой источника тока необходимо отключить стенд от сети");
            }
        }

        private void pictureBox5_Click(object sender, EventArgs e)
        {
            // Вольтметр
            if (button1.Enabled)
            {
                Voltmeter form4 = new Voltmeter();
                form4.ShowDialog();

                Data.VvalOfDiv = (Data.VMax + Data.VMin) / 10;
                VStep = Data.VMax / Data.VvalOfDiv;  // Шаг прорисовки
                PaintEventArgs Vpea = new PaintEventArgs(this.panel2.CreateGraphics(), this.panel2.ClientRectangle);
                VPaint(sender, Vpea);
            }
            else
            {
                MessageBox.Show("Перед заменой вольметра необходимо отключить стенд от сети");
            }
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            // Выбираем схему для малых сопротивленй
            pictureBox6.Visible = true;
            pictureBox7.Visible = false;
            if (!button1.Enabled)
            {
                R = Convert.ToDouble(RaBox.Text) + Convert.ToDouble(RxBox.Text);  // R = Rx + Ra
                RBox.Text = R.ToString();
            }
        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {
            // Выбираем схему для больших сопротивленй
            pictureBox6.Visible = false;
            pictureBox7.Visible = true;
            if (!button1.Enabled)
            {
                R = (Convert.ToDouble(RxBox.Text) * Convert.ToDouble(RvBox.Text)) / (Convert.ToDouble(RxBox.Text) + Convert.ToDouble(RvBox.Text));  // R = (Rx * Rv) / (Rx + Rv)
                RBox.Text = R.ToString();
            }
        }

        private void APaint(object sender, PaintEventArgs e)
        {
            panel1.Refresh();

            x = 60; y = 150;
            Graphics g = e.Graphics;

            Pen pen = new Pen(Color.Black, 2);
            g.DrawArc(pen, 50, 50, 200, 200, -180, 180);

            pen = new Pen(Color.Red, 2);
            g.DrawArc(pen, 60, 60, 180, 180, -180, 180);

            double alfa = 0, Dalfa = ((180 * Data.AvalOfDiv) / Data.AMax);

            int x1 = 50, y1 = 150, x2 = 60, y2 = 150;

            Font drawFont = new Font("Arial", 7);
            SolidBrush drawBrush = new SolidBrush(Color.Black);

            for (double i = 0; i <= Data.AMax; i += Data.AvalOfDiv)
            {
                x1 = Convert.ToInt32(150 - 100 * Math.Cos(alfa));
                y1 = Convert.ToInt32(150 - 100 * Math.Sin(alfa));

                x2 = Convert.ToInt32(150 - 90 * Math.Cos(alfa));
                y2 = Convert.ToInt32(150 - 90 * Math.Sin(alfa));

                g.DrawLine(pen, x1, y1, x2, y2);
                g.DrawString(Convert.ToString(i), drawFont, drawBrush, Convert.ToSingle(145 - 110 * Math.Cos(alfa)), Convert.ToSingle(145 - 110 * Math.Sin(alfa)));

                alfa += (Dalfa * (Math.PI / 180));
            }

        }

        private void VPaint(object sender, PaintEventArgs e)
        {
            panel2.Refresh();

            x = 60; y = 150;
            Graphics g = e.Graphics;

            Pen pen = new Pen(Color.Black, 2);
            g.DrawArc(pen, 50, 50, 200, 200, -180, 180);

            pen = new Pen(Color.Red, 2);
            g.DrawArc(pen, 60, 60, 180, 180, -180, 180);

            double alfa = 0, Dalfa = ((180 * Data.VvalOfDiv) / Data.VMax);

            int x1 = 50, y1 = 150, x2 = 60, y2 = 150;

            Font drawFont = new Font("Arial", 7);
            SolidBrush drawBrush = new SolidBrush(Color.Black);

            for (double i = 0; i <= Data.VMax; i += Data.VvalOfDiv)
            {
                x1 = Convert.ToInt32(150 - 100 * Math.Cos(alfa));
                y1 = Convert.ToInt32(150 - 100 * Math.Sin(alfa));

                x2 = Convert.ToInt32(150 - 90 * Math.Cos(alfa));
                y2 = Convert.ToInt32(150 - 90 * Math.Sin(alfa));

                g.DrawLine(pen, x1, y1, x2, y2);
                g.DrawString(Convert.ToString(i), drawFont, drawBrush, Convert.ToSingle(145 - 110 * Math.Cos(alfa)), Convert.ToSingle(145 - 110 * Math.Sin(alfa)));

                alfa += (Dalfa * (Math.PI / 180));
            }
        }

        private void ASetValue(object sender, double value)
        {
            if (value > Data.AMax)
            {
                ASetValue(sender, Data.AMax);
                MessageBox.Show("Показания амперметра зашкаливают");
                return;
            }

            PaintEventArgs pea = new PaintEventArgs(this.panel1.CreateGraphics(), this.panel1.ClientRectangle);
            Graphics g = pea.Graphics;

            Pen pen = new Pen(Color.White, 2);
            SolidBrush drawBrush = new SolidBrush(Color.White);

            pen.EndCap = LineCap.ArrowAnchor;

            g.FillEllipse(drawBrush, 60, 60, 180, 180);

            double a;

            a = (value * Math.PI) / Data.AMax;

            x = Convert.ToInt32(150 - 88 * Math.Cos(a));
            y = Convert.ToInt32(150 - 88 * Math.Sin(a));

            pen = new Pen(Color.Black, 2);
            pen.EndCap = LineCap.ArrowAnchor;

            g.DrawLine(pen, 150, 150, x, y);
        }

        private void VSetValue(object sender, double value)
        {
            if (value > Data.VMax)
            {
                VSetValue(sender, Data.VMax);
                MessageBox.Show("Показания вольтметра зашкаливают");
                return;
            }

            PaintEventArgs pea = new PaintEventArgs(this.panel2.CreateGraphics(), this.panel2.ClientRectangle);
            Graphics g = pea.Graphics;

            Pen pen = new Pen(Color.White, 2);
            SolidBrush drawBrush = new SolidBrush(Color.White);

            g.FillEllipse(drawBrush, 60, 60, 180, 180);

            double a;

            a = (value * Math.PI) / Data.VMax;

            x = Convert.ToInt32(150 - 88 * Math.Cos(a));
            y = Convert.ToInt32(150 - 88 * Math.Sin(a));

            pen = new Pen(Color.Black, 2);
            pen.EndCap = LineCap.ArrowAnchor;

            g.DrawLine(pen, 150, 150, x, y);
        }    

        // Декады магазина сопротивлений x0.01, x0.1, x1, x10, x100, x1000, x10000
        private void trackBar9_Scroll(object sender, EventArgs e)
        {
            Rx = trackBar9.Value * 0.001 + trackBar0.Value * 0.01 + trackBar1.Value * 0.1 + trackBar2.Value * 1 + trackBar3.Value * 10 + trackBar4.Value * 100 + trackBar5.Value * 1000 + trackBar6.Value * 10000;
            RxBox.Text = Rx.ToString();
            if (radioButton1.Checked)
            {
                R = Convert.ToDouble(RaBox.Text) + Convert.ToDouble(RxBox.Text);  // R = Rx + Ra
                RBox.Text = R.ToString();
            }
            else if (radioButton2.Checked)
            {
                R = (Convert.ToDouble(RxBox.Text) * Convert.ToDouble(RvBox.Text)) / (Convert.ToDouble(RxBox.Text) + Convert.ToDouble(RvBox.Text));  // R = (Rx * Rv) / (Rx + Rv)
                RBox.Text = R.ToString();
            }

            curI = curV / R;
            trackBar8.Value = Convert.ToInt32(curI);
            ASetValue(panel2, curI);
            textBox2.Text = curI.ToString();
        }

        private void trackBar0_Scroll(object sender, EventArgs e)
        {
            Rx = trackBar9.Value * 0.001 + trackBar0.Value * 0.01 + trackBar1.Value * 0.1 + trackBar2.Value * 1 + trackBar3.Value * 10 + trackBar4.Value * 100 + trackBar5.Value * 1000 + trackBar6.Value * 10000;
            RxBox.Text = Rx.ToString();
            if (radioButton1.Checked)
            {
                R = Convert.ToDouble(RaBox.Text) + Convert.ToDouble(RxBox.Text);  // R = Rx + Ra
                RBox.Text = R.ToString();
            }
            else if (radioButton2.Checked)
            {
                R = (Convert.ToDouble(RxBox.Text) * Convert.ToDouble(RvBox.Text)) / (Convert.ToDouble(RxBox.Text) + Convert.ToDouble(RvBox.Text));  // R = (Rx * Rv) / (Rx + Rv)
                RBox.Text = R.ToString();
            }

            curI = curV / R;
            trackBar8.Value = Convert.ToInt32(curI);
            ASetValue(panel2, curI);
            textBox2.Text = curI.ToString();
        }

        private void trackBar1_Scroll(object sender, EventArgs e)
        {
            Rx = trackBar9.Value * 0.001 + trackBar0.Value * 0.01 + trackBar1.Value * 0.1 + trackBar2.Value * 1 + trackBar3.Value * 10 + trackBar4.Value * 100 + trackBar5.Value * 1000 + trackBar6.Value * 10000;
            RxBox.Text = Rx.ToString();
            if (radioButton1.Checked)
            {
                R = Convert.ToDouble(RaBox.Text) + Convert.ToDouble(RxBox.Text);  // R = Rx + Ra
                RBox.Text = R.ToString();
            }
            else if (radioButton2.Checked)
            {
                R = (Convert.ToDouble(RxBox.Text) * Convert.ToDouble(RvBox.Text)) / (Convert.ToDouble(RxBox.Text) + Convert.ToDouble(RvBox.Text));  // R = (Rx * Rv) / (Rx + Rv)
                RBox.Text = R.ToString();
            }

            curI = curV / R;
            trackBar8.Value = Convert.ToInt32(curI);
            ASetValue(panel2, curI);
            textBox2.Text = curI.ToString();
        }

        private void trackBar2_Scroll(object sender, EventArgs e)
        {
            Rx = trackBar9.Value * 0.001 + trackBar0.Value * 0.01 + trackBar1.Value * 0.1 + trackBar2.Value * 1 + trackBar3.Value * 10 + trackBar4.Value * 100 + trackBar5.Value * 1000 + trackBar6.Value * 10000;
            RxBox.Text = Rx.ToString();
            if (radioButton1.Checked)
            {
                R = Convert.ToDouble(RaBox.Text) + Convert.ToDouble(RxBox.Text);  // R = Rx + Ra
                RBox.Text = R.ToString();
            }
            else if (radioButton2.Checked)
            {
                R = (Convert.ToDouble(RxBox.Text) * Convert.ToDouble(RvBox.Text)) / (Convert.ToDouble(RxBox.Text) + Convert.ToDouble(RvBox.Text));  // R = (Rx * Rv) / (Rx + Rv)
                RBox.Text = R.ToString();
            }

            curI = curV / R;
            trackBar8.Value = Convert.ToInt32(curI);
            ASetValue(panel2, curI);
            textBox2.Text = curI.ToString();
        }

        private void trackBar3_Scroll(object sender, EventArgs e)
        {
            Rx = trackBar9.Value * 0.001 + trackBar0.Value * 0.01 + trackBar1.Value * 0.1 + trackBar2.Value * 1 + trackBar3.Value * 10 + trackBar4.Value * 100 + trackBar5.Value * 1000 + trackBar6.Value * 10000;
            RxBox.Text = Rx.ToString();
            if (radioButton1.Checked)
            {
                R = Convert.ToDouble(RaBox.Text) + Convert.ToDouble(RxBox.Text);  // R = Rx + Ra
                RBox.Text = R.ToString();
            }
            else if (radioButton2.Checked)
            {
                R = (Convert.ToDouble(RxBox.Text) * Convert.ToDouble(RvBox.Text)) / (Convert.ToDouble(RxBox.Text) + Convert.ToDouble(RvBox.Text));  // R = (Rx * Rv) / (Rx + Rv)
                RBox.Text = R.ToString();
            }

            curI = curV / R;
            trackBar8.Value = Convert.ToInt32(curI);
            ASetValue(panel2, curI);
            textBox2.Text = curI.ToString();
        }

        private void trackBar4_Scroll(object sender, EventArgs e)
        {
            Rx = trackBar9.Value * 0.001 + trackBar0.Value * 0.01 + trackBar1.Value * 0.1 + trackBar2.Value * 1 + trackBar3.Value * 10 + trackBar4.Value * 100 + trackBar5.Value * 1000 + trackBar6.Value * 10000;
            RxBox.Text = Rx.ToString();
            if (radioButton1.Checked)
            {
                R = Convert.ToDouble(RaBox.Text) + Convert.ToDouble(RxBox.Text);  // R = Rx + Ra
                RBox.Text = R.ToString();
            }
            else if (radioButton2.Checked)
            {
                R = (Convert.ToDouble(RxBox.Text) * Convert.ToDouble(RvBox.Text)) / (Convert.ToDouble(RxBox.Text) + Convert.ToDouble(RvBox.Text));  // R = (Rx * Rv) / (Rx + Rv)
                RBox.Text = R.ToString();
            }

            curI = curV / R;
            trackBar8.Value = Convert.ToInt32(curI);
            ASetValue(panel2, curI);
            textBox2.Text = curI.ToString();
        }

        private void trackBar5_Scroll(object sender, EventArgs e)
        {
            Rx = trackBar9.Value * 0.001 + trackBar0.Value * 0.01 + trackBar1.Value * 0.1 + trackBar2.Value * 1 + trackBar3.Value * 10 + trackBar4.Value * 100 + trackBar5.Value * 1000 + trackBar6.Value * 10000;
            RxBox.Text = Rx.ToString();
            if (radioButton1.Checked)
            {
                R = Convert.ToDouble(RaBox.Text) + Convert.ToDouble(RxBox.Text);  // R = Rx + Ra
                RBox.Text = R.ToString();
            }
            else if (radioButton2.Checked)
            {
                R = (Convert.ToDouble(RxBox.Text) * Convert.ToDouble(RvBox.Text)) / (Convert.ToDouble(RxBox.Text) + Convert.ToDouble(RvBox.Text));  // R = (Rx * Rv) / (Rx + Rv)
                RBox.Text = R.ToString();
            }

            curI = curV / R;
            trackBar8.Value = Convert.ToInt32(curI);
            ASetValue(panel2, curI);
            textBox2.Text = curI.ToString();
        }

        private void trackBar6_Scroll(object sender, EventArgs e)
        {
            Rx = trackBar9.Value * 0.001 + trackBar0.Value * 0.01 + trackBar1.Value * 0.1 + trackBar2.Value * 1 + trackBar3.Value * 10 + trackBar4.Value * 100 + trackBar5.Value * 1000 + trackBar6.Value * 10000;
            RxBox.Text = Rx.ToString();
            if (radioButton1.Checked)
            {
                R = Convert.ToDouble(RaBox.Text) + Convert.ToDouble(RxBox.Text);  // R = Rx + Ra
                RBox.Text = R.ToString();
            }
            else if (radioButton2.Checked)
            {
                R = (Convert.ToDouble(RxBox.Text) * Convert.ToDouble(RvBox.Text)) / (Convert.ToDouble(RxBox.Text) + Convert.ToDouble(RvBox.Text));  // R = (Rx * Rv) / (Rx + Rv)
                RBox.Text = R.ToString();
            }

            curI = curV / R;
            trackBar8.Value = Convert.ToInt32(curI);
            ASetValue(panel2, curI);
            textBox2.Text = curI.ToString();
        }

        // Установка напряжения на источнике постоянного тока
        private void trackBar7_Scroll(object sender, EventArgs e)
        {
            curV = trackBar7.Value * ((Data.EvMax + Data.EvMin) / 100);
            textBox1.Text = curV.ToString();
            VSetValue(panel1, curV);

            Rx = trackBar9.Value * 0.001 + trackBar0.Value * 0.01 + trackBar1.Value * 0.1 + trackBar2.Value * 1 + trackBar3.Value * 10 + trackBar4.Value * 100 + trackBar5.Value * 1000 + trackBar6.Value * 10000;
            RxBox.Text = Rx.ToString();

            if (radioButton1.Checked)
            {
                R = Convert.ToDouble(RaBox.Text) + Convert.ToDouble(RxBox.Text);  // R = Rx + Ra
                RBox.Text = R.ToString();
            }
            else if (radioButton2.Checked)
            {
                R = (Convert.ToDouble(RxBox.Text) * Convert.ToDouble(RvBox.Text)) / (Convert.ToDouble(RxBox.Text) + Convert.ToDouble(RvBox.Text));  // R = (Rx * Rv) / (Rx + Rv)
                RBox.Text = R.ToString();
            }

            try
            {
                curI = curV / R;
                ASetValue(panel2, curI);
                trackBar8.Value = Convert.ToInt32(curI);
                textBox2.Text = curI.ToString();
            }
            catch
            {
                return;
            }
        }

        // Установка силы тока на источнике постоянного ток
        private void trackBar8_Scroll(object sender, EventArgs e)
        {
            curI = trackBar8.Value * ((Data.EaMax + Data.EaMin) / 100);
            textBox2.Text = curI.ToString();
            ASetValue(panel2, curI);

            Rx = trackBar9.Value * 0.001 + trackBar0.Value * 0.01 + trackBar1.Value * 0.1 + trackBar2.Value * 1 + trackBar3.Value * 10 + trackBar4.Value * 100 + trackBar5.Value * 1000 + trackBar6.Value * 10000;
            RxBox.Text = Rx.ToString();

            if (radioButton1.Checked)
            {
                R = Convert.ToDouble(RaBox.Text) + Convert.ToDouble(RxBox.Text);  // R = Rx + Ra
                RBox.Text = R.ToString();
            }
            else if (radioButton2.Checked)
            {
                R = (Convert.ToDouble(RxBox.Text) * Convert.ToDouble(RvBox.Text)) / (Convert.ToDouble(RxBox.Text) + Convert.ToDouble(RvBox.Text));  // R = (Rx * Rv) / (Rx + Rv)
                RBox.Text = R.ToString();
            }
            try
            {
                curV = curI * R;
                VSetValue(panel1, curV);
                trackBar7.Value = Convert.ToInt32(curV);
                textBox1.Text = curV.ToString();
            }
            catch
            {
                return;
            }
        }

        private void RBox_TextChanged(object sender, EventArgs e)
        {
            try
            {
                RBox.Text = RBox.Text.Substring(0, 13);
            }
            catch
            {
            }
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox1.Checked)
            {
                textBox2.Visible = true;
            }
            else
            {
                textBox2.Visible = false;
            }
        }

        private void checkBox2_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox2.Checked)
            {
                textBox1.Visible = true;
            }
            else
            {
                textBox1.Visible = false;
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Double tmp;

            if (Double.TryParse(textBox3.Text, out tmp))
            {
                Data.AMax = tmp;
            }

            Data.AvalOfDiv = (Data.AMax + Data.AMin) / 10;
            AStep = Data.AMax / Data.AvalOfDiv;  // Шаг прорисовки
            PaintEventArgs Apea = new PaintEventArgs(this.panel1.CreateGraphics(), this.panel1.ClientRectangle);
            APaint(sender, Apea);

            ASetValue(this.panel1, curI);
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Double tmp;

            if (Double.TryParse(textBox5.Text, out tmp))
            {
                Data.VMax = tmp;
            }

            Data.VvalOfDiv = (Data.VMax + Data.VMin) / 10;
            VStep = Data.VMax / Data.VvalOfDiv;  // Шаг прорисовки
            PaintEventArgs Vpea = new PaintEventArgs(this.panel2.CreateGraphics(), this.panel2.ClientRectangle);
            VPaint(sender, Vpea);

            VSetValue(this.panel2, curV);
        }  
    }
}
