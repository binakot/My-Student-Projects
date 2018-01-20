using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }        

        private void Form1_Load(object sender, EventArgs e)
        {
            //Размерность таблицы ввода
            dataGridView1.RowCount = 2;
            dataGridView1.ColumnCount = 21;
            //Оформляем
            dataGridView1.Rows[0].Cells[0].Value = "q1(Xi)";
            dataGridView1.Rows[1].Cells[0].Value = "q2(Xi)";
            for (int i = 1; i < 21; i++)
                dataGridView1.Columns[i].HeaderText = i.ToString();             
            //q1(x)
            dataGridView1.Rows[0].Cells[1].Value = 10.4;
            dataGridView1.Rows[0].Cells[2].Value = 2.2;
            dataGridView1.Rows[0].Cells[3].Value = 3.1;
            dataGridView1.Rows[0].Cells[4].Value = 10;
            dataGridView1.Rows[0].Cells[5].Value = 5;
            dataGridView1.Rows[0].Cells[6].Value = 3.2;
            dataGridView1.Rows[0].Cells[7].Value = 2.7;
            dataGridView1.Rows[0].Cells[8].Value = 4;
            dataGridView1.Rows[0].Cells[9].Value = 5.2;
            dataGridView1.Rows[0].Cells[10].Value = 9.1;
            dataGridView1.Rows[0].Cells[11].Value = 3.3;
            dataGridView1.Rows[0].Cells[12].Value = 7.1;
            dataGridView1.Rows[0].Cells[13].Value = 7.4;
            dataGridView1.Rows[0].Cells[14].Value = 8;
            dataGridView1.Rows[0].Cells[15].Value = 10.3;
            dataGridView1.Rows[0].Cells[16].Value = 4.2;
            dataGridView1.Rows[0].Cells[17].Value = 3.8;
            dataGridView1.Rows[0].Cells[18].Value = 1.9;
            dataGridView1.Rows[0].Cells[19].Value = 9;
            dataGridView1.Rows[0].Cells[20].Value = 2;
            //q2(x)
            dataGridView1.Rows[1].Cells[1].Value = 1.5;
            dataGridView1.Rows[1].Cells[2].Value = 5;
            dataGridView1.Rows[1].Cells[3].Value = 4.4;
            dataGridView1.Rows[1].Cells[4].Value = 9.3;
            dataGridView1.Rows[1].Cells[5].Value = 4;
            dataGridView1.Rows[1].Cells[6].Value = 2.1;
            dataGridView1.Rows[1].Cells[7].Value = 3.3;
            dataGridView1.Rows[1].Cells[8].Value = 6;
            dataGridView1.Rows[1].Cells[9].Value = 1.9;
            dataGridView1.Rows[1].Cells[10].Value = 10;
            dataGridView1.Rows[1].Cells[11].Value = 2.1;
            dataGridView1.Rows[1].Cells[12].Value = 5;
            dataGridView1.Rows[1].Cells[13].Value = 1.1;
            dataGridView1.Rows[1].Cells[14].Value = 2;
            dataGridView1.Rows[1].Cells[15].Value = 4.4;
            dataGridView1.Rows[1].Cells[16].Value = 5.9;
            dataGridView1.Rows[1].Cells[17].Value = 7;
            dataGridView1.Rows[1].Cells[18].Value = 2.2;
            dataGridView1.Rows[1].Cells[19].Value = 6;
            dataGridView1.Rows[1].Cells[20].Value = 3;            
        }

        //Метод уступок
        private Data.criterions concessions_method(Data.criterions[] s, double dq1)
        {
            double max_q1, max_q2;
            Data.criterions Result = new Data.criterions();
            LinkedList<Data.criterions> X1 = new LinkedList<Data.criterions>();

            //Находим максимальное значение 1 критерия
            max_q1 = s[0].q1;
            foreach (Data.criterions tmp in s)
            {
                if (max_q1 < tmp.q1) max_q1 = tmp.q1;
            }

            //определяем множество альтернатив
            foreach (Data.criterions tmp in s)
            {
                if ((max_q1 - tmp.q1) <= dq1)
                    X1.AddLast(tmp);
            }
            
            //Определяем максимальное значение 2 критерия из множества альтернатив X1
            max_q2 = X1.First.Value.q2;
            Result = X1.First.Value;
            foreach (Data.criterions tmp in X1)
            {
                if (max_q2 < tmp.q2)
                {
                    max_q2 = tmp.q2;
                    Result = tmp;
                }
            }

            return Result;
        }

        //Множество Парето
        private List<Data.criterions> Pareto(Data.criterions[] s)
        {
            List<Data.criterions> Pareto = new List<Data.criterions>(s);

            for (int i = 0; i < 20; i++)
            {
                for (int j = 0; j < 20; j++)
                {
                    if (i == j) continue;
                    if (((s[i].q1 < s[j].q1) && (s[i].q2 <= s[j].q2)) || ((s[i].q1 <= s[j].q1) && (s[i].q2 < s[j].q2)))
                    {
                        Pareto.Remove(s[i]);
                        break;
                    }
                }
            }

            return Pareto;
        }

        //метод притязаний
        private Data.criterions claims_method(Data.criterions[] s, double q1_, double q2_, List<Data.criterions> pareto)
        {
            bool type = false; // Решение через мн-во Парето или через условие
            double min_p, p;
            Data.criterions Result = new Data.criterions();

            foreach (Data.criterions tmp in s)
            {
                if (tmp.q1 > q1_ && tmp.q2 > q2_)
                {
                    type = true;
                }
            }

            switch (type)
            {
                // Решаем через множество Парето
                case true:
                    min_p = Math.Sqrt(Math.Pow((q1_ - pareto[0].q1), 2) + Math.Pow((q2_ - pareto[0].q2), 2));
                    Result = pareto[0];
                    foreach (Data.criterions tmp in pareto)
                    {
                        p = Math.Sqrt(Math.Pow((q1_ - tmp.q1), 2) + Math.Pow((q2_ - tmp.q2), 2));
                        if (min_p > p)
                        {
                            min_p = p;
                            Result = tmp;
                        }
                    }
                    break;
                
                // Решаем через условие
                case false:
                    min_p = Math.Pow((q1_ - s[0].q1), 2) + Math.Pow((q2_ - s[0].q2), 2);                    
                    Result = s[0];
                    foreach (Data.criterions val in s)
                    {
                        p = Math.Pow((q1_ - val.q1), 2) + Math.Pow((q2_ - val.q2), 2);                        
                        if (min_p > p)
                        {
                            min_p = p;
                            Result = val;
                        }
                    }
                    break;
            }

            return Result;
        }

        // Очистка
        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                panel1.Refresh();
                panel2.Refresh();
                panel3.Refresh();
                textBox4.Text = "";
                textBox5.Text = "";
                textBox6.Text = "";
                textBox7.Text = "";
                for (int i = 0; i < dataGridView2.ColumnCount; i++)
                {
                    dataGridView2.Rows[0].Cells[i].Value = "";
                    dataGridView2.Rows[1].Cells[i].Value = "";
                    dataGridView2.Columns[i].HeaderText = "";
                }
            }
            catch (Exception)
            {

            }
        }        

        // Вычисляем решение по методу уступок
        private void button2_Click(object sender, EventArgs e)
        {
            panel1.Refresh();
            // Создаем множество альтернатив
            Data.criterions[] X = new Data.criterions[20];            
            Data.criterions Result;
            // Считываем исходные данные
            Data.dq1 = Convert.ToDouble(textBox1.Text);
            Data.q_1 = Convert.ToDouble(textBox2.Text);
            Data.q_2 = Convert.ToDouble(textBox3.Text);            
            //Считываем таблицу в множество X
            for (int i = 1; i < 21; i++)
            {
                X[i - 1].q1 = Convert.ToDouble(dataGridView1.Rows[0].Cells[i].Value);
                X[i - 1].q2 = Convert.ToDouble(dataGridView1.Rows[1].Cells[i].Value);
            }
            // Вызвали метод решения уступками
            Result = concessions_method(X, Data.dq1);
            // Выводим решение
            textBox4.Text = Result.q1.ToString();
            textBox5.Text = Result.q2.ToString();
            // Показываем решение графически
            PaintEventArgs pe = new PaintEventArgs(this.panel1.CreateGraphics(), this.panel1.ClientRectangle);
            panel1_Paint(sender, pe, X, Result);
        }

        // Решение методом притязаний
        private void button3_Click(object sender, EventArgs e)
        {
            panel2.Refresh();
            Data.criterions[] S = new Data.criterions[20];
            List<Data.criterions> pareto;
            Data.criterions Result;

            Data.q_1 = Convert.ToDouble(textBox2.Text);
            Data.q_2 = Convert.ToDouble(textBox3.Text);
            Data.dq1 = Convert.ToDouble(textBox1.Text);

            for (int i = 1; i < 21; i++)
            {
                S[i - 1].q1 = Convert.ToDouble(dataGridView1.Rows[0].Cells[i].Value);
                S[i - 1].q2 = Convert.ToDouble(dataGridView1.Rows[1].Cells[i].Value);
            }

            pareto = Pareto(S);
            dataGridView2.ColumnCount = pareto.Count + 1;
            dataGridView2.RowCount = 2;
            dataGridView2.Rows[0].Cells[0].Value = "q1";
            dataGridView2.Rows[1].Cells[0].Value = "q2";

            for (int i = 0; i < pareto.Count; i++)
            {
                dataGridView2.Rows[0].Cells[i + 1].Value = pareto[i].q1;
                dataGridView2.Rows[1].Cells[i + 1].Value = pareto[i].q2;

                for (int j = 0; j < 20; j++)
                {
                    if (S[j].q1 == pareto[i].q1 && S[j].q2 == pareto[i].q2)
                        dataGridView2.Columns[i + 1].HeaderText = (j + 1).ToString();
                }
            }

            Result = claims_method(S, Data.q_1, Data.q_2, pareto);
            textBox6.Text = Result.q1.ToString();
            textBox7.Text = Result.q2.ToString();
            
            Data.criterions s_;
            s_.q1 = Data.q_1;
            s_.q2 = Data.q_2;

            PaintEventArgs pe = new PaintEventArgs(this.panel2.CreateGraphics(), this.panel2.ClientRectangle);
            panel2_Paint(sender, pe, pareto, S, Result, s_);
        }

        // Вывод множества Парето
        private void button4_Click(object sender, EventArgs e)
        {
            List<Data.criterions> pareto;
            Data.criterions[] S = new Data.criterions[20];

            for (int i = 1; i < 21; i++)
            {
                S[i - 1].q1 = Convert.ToDouble(dataGridView1.Rows[0].Cells[i].Value);
                S[i - 1].q2 = Convert.ToDouble(dataGridView1.Rows[1].Cells[i].Value);
            }

            pareto = Pareto(S);
            dataGridView2.ColumnCount = pareto.Count + 1;
            dataGridView2.RowCount = 2;
            dataGridView2.Rows[0].Cells[0].Value = "q1";
            dataGridView2.Rows[1].Cells[0].Value = "q2";

            for (int i = 0; i < pareto.Count; i++)
            {
                dataGridView2.Rows[0].Cells[i + 1].Value = pareto[i].q1;
                dataGridView2.Rows[1].Cells[i + 1].Value = pareto[i].q2;

                for (int j = 0; j < 20; j++)
                {
                    if (S[j].q1 == pareto[i].q1 && S[j].q2 == pareto[i].q2)
                        dataGridView2.Columns[i + 1].HeaderText = (j + 1).ToString();
                }
            }

            PaintEventArgs pe = new PaintEventArgs(this.panel3.CreateGraphics(), this.panel3.ClientRectangle);
            panel3_Paint(sender, pe, pareto, S);
        }       

        private void panel1_Paint(object sender, PaintEventArgs e, Data.criterions[] x, Data.criterions x1)
        {
            panel1.Refresh();
            Graphics g = e.Graphics;
            Pen p = new Pen(Color.Black, 2);

            // Декартовы координаты
            g.DrawLine(p, 0, 350, 400, 350);
            g.DrawLine(p, 50, 0, 50, 400);

            p = new Pen(Color.Blue, 1);
            // Область альтернатив с интервалом dq1
            g.DrawLine(p, (48 + (float)(x1.q1 + Data.dq1) * 22), 350, (48 + (float)(x1.q1 + Data.dq1) * 22), 0);
            g.DrawLine(p, (48 + (float)(x1.q1 - Data.dq1) * 22), 350, (48 + (float)(x1.q1 - Data.dq1) * 22), 0);

            p = new Pen(Color.Black, 1);
            Font f = new Font("Times New Roman", 8);
            SolidBrush drawBrush = new SolidBrush(Color.Black);

            for (int i = 1; i <= 15; i++)
            {
                g.DrawLine(p, 47, 350 - i * 22, 53, 350 - i * 22);
                g.DrawLine(p, 50 + i * 22, 347, 50 + i * 22, 353);

                g.DrawString(i.ToString(), f, drawBrush, 30, 345 - i * 22);
                g.DrawString(i.ToString(), f, drawBrush, 45 + i * 22, 360);
            }
            g.DrawString("0", f, drawBrush, 30, 360);

            foreach (Data.criterions tmp in x)
            {
                g.DrawEllipse(p, 48 + (float)tmp.q1 * 22, 350 - (float)tmp.q2 * 22, 3, 3);
            }

            p = new Pen(Color.Red, 2);            
            p = new Pen(Color.Green, 2);
            g.DrawEllipse(p, 48 + (float)x1.q1 * 22, 350 - (float)x1.q2 * 22, 5, 5); 
        }

        private void panel2_Paint(object sender, PaintEventArgs e, List<Data.criterions> pareto, Data.criterions[] s, Data.criterions s1, Data.criterions s_)
        {
            panel2.Refresh();
            Graphics g = e.Graphics;
            Pen p = new Pen(Color.Black, 2);

            g.DrawLine(p, 0, 350, 400, 350);
            g.DrawLine(p, 50, 0, 50, 400);

            p = new Pen(Color.Black, 1);
            Font f = new Font("Times New Roman", 8);
            SolidBrush drawBrush = new SolidBrush(Color.Black);

            for (int i = 1; i <= 15; i++)
            {
                g.DrawLine(p, 47, 350 - i * 22, 53, 350 - i * 22);
                g.DrawLine(p, 50 + i * 22, 347, 50 + i * 22, 353);

                g.DrawString(i.ToString(), f, drawBrush, 30, 345 - i * 22);
                g.DrawString(i.ToString(), f, drawBrush, 45 + i * 22, 360);
            }
            g.DrawString("0", f, drawBrush, 30, 360);

            foreach (Data.criterions tmp in s)
            {
                g.DrawEllipse(p, 48 + (float)tmp.q1 * 22, 350 - (float)tmp.q2 * 22, 3, 3);
            }
            // Выводим мн-во Парето
            p = new Pen(Color.Red, 2);
            foreach (Data.criterions val in pareto)
            {
                g.DrawEllipse(p, 48 + (float)val.q1 * 22, 350 - (float)val.q2 * 22, 5, 5);
            }
            // Желаемый выбор
            p = new Pen(Color.Green, 2);
            g.DrawEllipse(p, 48 + (float)s1.q1 * 22, 350 - (float)s1.q2 * 22, 5, 5);
            // Полученный выбор
            p = new Pen(Color.Blue, 2);
            g.DrawEllipse(p, 48 + (float)s_.q1 * 22, 350 - (float)s_.q2 * 22, 5, 5);
        }

        private void panel3_Paint(object sender, PaintEventArgs e, List<Data.criterions> pareto, Data.criterions[] s)
        {
            Graphics g = e.Graphics;
            Pen p = new Pen(Color.Black, 2);
            float dy = 100;

            g.DrawLine(p, 0, 350 - dy, 400, 350 - dy);
            g.DrawLine(p, 50, 0, 50, 400);

            p = new Pen(Color.Black, 1);
            Font f = new Font("Times New Roman", 8);
            SolidBrush drawBrush = new SolidBrush(Color.Black);

            for (int i = 1; i <= 10; i++)
            {
                g.DrawLine(p, 47, 350 - i * 22 - dy, 53, 350 - i * 22 - dy);
                g.DrawLine(p, 50 + i * 22, 347 - dy, 50 + i * 22, 353 - dy);

                g.DrawString(i.ToString(), f, drawBrush, 30, 345 - i * 22 - dy);
                g.DrawString(i.ToString(), f, drawBrush, 45 + i * 22, 360 - dy);
            }
            g.DrawString("0", f, drawBrush, 30, 360 - dy);

            foreach (Data.criterions tmp in s)
            {
                g.DrawEllipse(p, 48 + (float)tmp.q1 * 22, 350 - (float)tmp.q2 * 22 - dy, 3, 3);
            }

            p = new Pen(Color.Red, 2);

            foreach (Data.criterions tmp in pareto)
            {
                g.DrawEllipse(p, 48 + (float)tmp.q1 * 22, 350 - (float)tmp.q2 * 22 - dy, 5, 5);
            }

            // Функция полезности
            // Линейная зависимость
            Double S1 = 0, S2 = 0, S3 = 0, S4 = 0;
            Int32 n = 0;
            foreach (Data.criterions tmp in pareto)
            {
                S1 += Math.Pow(tmp.q1, 2);
                S2 += tmp.q1;
                S3 += tmp.q1 * tmp.q2;
                S4 += tmp.q2;
                n++;
            }
            Double det, det1, det2;
            det = S1 * n - S2 * S2;
            det1 = S3 * n - S2 * S4;
            det2 = S1 * S4 - S2 * S3;
            float a, b;
            a = (float)(det1 / det);
            b = (float)(det2 / det);
            p = new Pen(Color.Green, 1);
            g.DrawLine(p, 48 + 0 * 22, 350 - b * 22 - dy, 48 + (-b / a) * 22, 350 - 0 * 22 - dy);
            // Квадратичная зависимость
            S1 = 0; S2 = 0; S3 = 0; S4 = 0;
            Double S5 = 0, S6 = 0, S7 = 0;
            n = 0;
            foreach (Data.criterions tmp in pareto)
            {
                S1 += Math.Pow(tmp.q1, 4);
                S2 += Math.Pow(tmp.q1, 3);
                S3 += Math.Pow(tmp.q1, 2);
                S4 += tmp.q2 * Math.Pow(tmp.q1, 2);
                S5 += tmp.q1;
                S6 += tmp.q2 * tmp.q1;
                S7 += tmp.q2;
                n++;
            }
            Double det3;
            det = GetDet(S1, S2, S3, S2, S3, S5, S3, S5, n);
            det1 = GetDet(S4, S6, S7, S2, S3, S5, S3, S5, n);
            det2 = GetDet(S1, S2, S3, S4, S6, S7, S3, S5, n);
            det3 = GetDet(S1, S2, S3, S2, S3, S5, S4, S6, S7);
            float c;
            a = (float)(det1 / det);
            b = (float)(det2 / det);
            c = (float)(det3 / det);
            p = new Pen(Color.Blue, 1);
            float x = 0;
            for (int i = 0; i < 200; i++)
            {
                x += (float)0.1;
                g.DrawLine(p, 48 + x * 22, 350 - (a * (float)Math.Pow(x, 2) + b * x + c) * 22 - dy, 48 + (x + (float)0.1) * 22, 350 - (a * (float)Math.Pow(x + (float)0.1, 2) + b * (x + (float)0.1) + c) * 22 - dy);
            }            
        }

        private double GetDet(Double a1, Double a2, Double a3, Double b1, Double b2, Double b3, Double c1, Double c2, Double c3)
        {
            Double Result;
            Result = a1 * b2 * c3 + a3 * b1 * c2 + a2 * b3 * c1 - a3 * b2 * c1 - a1 * b3 * c2 - a2 * b1 * c3;
            return Result;
        }
    }
}
