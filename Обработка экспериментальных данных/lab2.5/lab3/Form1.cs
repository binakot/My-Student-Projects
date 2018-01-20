using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Collections;
using System.Drawing;
using System.Drawing.Drawing2D;

namespace lab3
{
    public partial class Form1 : Form
    {
        const Int32 N = 100;
        public static Array masX = Array.CreateInstance(typeof(Double), N);
        public static Array masY = Array.CreateInstance(typeof(Double), N);

        Double[] tmpArrayX = new Double[N] { 22.0, 21.0, 19.0, 21.0, 20.0, 21.0, 20.5, 22.5, 22.0, 22.5, 18.5, 22.0, 20.5, 20.5, 19.0, 21.0, 25.0, 
                                             21.5, 22.5, 20.5, 21.5, 19.5, 21.0, 21.0, 23.5, 19.0, 20.5, 20.5, 23.0, 18.5, 23.5, 22.5, 21.5, 20.5,
                                             23.5, 21.0, 21.5, 21.0, 22.0, 21.5, 21.0, 20.0, 21.0, 21.0, 19.5, 21.5, 23.5, 22.5, 24.5, 21.5, 18.0,
                                             23.0, 20.0, 21.0, 21.5, 22.5, 21.5, 22.0, 22.5, 23.0, 21.5, 22.5, 21.0, 19.0, 22.0, 24.5, 24.0, 22.5,
                                             21.0, 19.0, 21.0, 20.0, 21.5, 21.0, 20.0, 23.5, 20.0, 21.5, 22.0, 21.0, 21.0, 22.0, 21.0, 20.0, 20.5,
                                             21.5, 20.5, 21.5, 22.0, 21.0, 20.0, 20.5, 19.5, 21.5, 21.0, 20.5, 21.5, 21.5, 22.5, 21.5 };

        Double[] tmpArrayY = new Double[N] { 63, 43, 29, 59, 26, 65, 45, 64, 78, 81, 33, 62, 31, 69, 35, 56, 91,
                                             63, 42, 28, 55, 30, 61, 50, 95, 37, 41, 27, 100, 37, 85, 79, 54, 50,
                                             74, 62, 53, 72, 72, 50, 33, 32, 67, 57, 40, 53, 87, 52, 85, 56, 26,
                                             90, 40, 70, 78, 75, 44, 85, 78, 84, 60, 74, 54, 30, 55, 93, 87, 75,
                                             48, 27, 52, 43, 61, 47, 52, 82, 50, 59, 61, 55, 63, 69, 55, 25, 40,
                                             42, 42, 58, 65, 51, 50, 60, 40, 70, 60, 48, 58, 65, 83, 53 };

        public Form1()
        {
            InitializeComponent();
        }

        private static ArrayList RemoveDuplicate(ArrayList sourceList)
        {
            ArrayList list = new ArrayList();
            foreach (Double item in sourceList)
            {
                if (!list.Contains(item))
                {
                    list.Add(item);
                }
            }
            return list;
        }

        private Int32 GetCountOfDoubles(Double X, Double Y)
        {
            Int32 Count = 0;

            for (int i = 0; i < N; i++)
            {
                if ((tmpArrayX[i] == X) && (tmpArrayY[i] == Y))
                {
                    Count++;
                }
            }

            return Count;
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            this.dataGridView1.RowCount = N;  
            
            Array masX = Array.CreateInstance(typeof(Double), N);
            masX = tmpArrayX;
            
            Array masY = Array.CreateInstance(typeof(Double), N);
            masY = tmpArrayY;

            for (int i = masX.GetLowerBound(0); i <= masX.GetUpperBound(0); i++)
            {                
                dataGridView1.Rows[i].Cells[0].Value = masX.GetValue(i);
                dataGridView1.Rows[i].Cells[1].Value = masY.GetValue(i);
            }

            Array.Sort(masX);
            ArrayList listX = new ArrayList(masX);
            masX = RemoveDuplicate(listX).ToArray();

            Array.Sort(masY);
            ArrayList listY = new ArrayList(masY);
            masY = RemoveDuplicate(listY).ToArray();

            if (masX.GetUpperBound(0) > masY.GetUpperBound(0))
            {
                this.dataGridView2.RowCount = masX.GetUpperBound(0) + 1;                
            }
            else
            {
                this.dataGridView2.RowCount = masY.GetUpperBound(0) + 1;                
            }

            try
            {
                for (int i = masX.GetLowerBound(0); i <= masX.GetUpperBound(0); i++)
                {
                    dataGridView2.Rows[i].Cells[0].Value = masX.GetValue(i);                    
                }

                for (int i = masY.GetLowerBound(0); i <= masY.GetUpperBound(0); i++)
                {
                    dataGridView2.Rows[i].Cells[1].Value = masY.GetValue(i);
                }                
            }
            catch
            {
            }
            
            this.dataGridView3.ColumnCount = 0;

            this.dataGridView3.Columns.Add("ColumnXY", "X\\Y");     
                        
            for (int i = masY.GetLowerBound(0); i <= masY.GetUpperBound(0); i++)
            {
                this.dataGridView3.Columns.Add("Column" + i.ToString(), masY.GetValue(i).ToString());               
            }

            DataGridViewCell tmpCell = null; 
            DataGridViewRow tmpRow = null;            

            for (int i = masX.GetLowerBound(0); i <= masX.GetUpperBound(0); i++)
            {
                tmpCell = new DataGridViewTextBoxCell();
                tmpRow = new DataGridViewRow();
                tmpCell.Style.BackColor = Color.LightGray;
                tmpCell.Value = masX.GetValue(i).ToString();
                tmpRow.Cells.AddRange(tmpCell);
                this.dataGridView3.Rows.Add(tmpRow);                
            }

            Int32 tmpCount = 0;

            for (int i = 0; i <= this.dataGridView3.RowCount - 1; i++)
            for (int j = 1; j <= this.dataGridView3.ColumnCount - 1; j++)
            {
                tmpCount = GetCountOfDoubles(Convert.ToDouble(this.dataGridView3.Rows[i].Cells[0].Value), Convert.ToDouble(this.dataGridView3.Columns[j].HeaderText));
                if (tmpCount == 0)
                {
                    this.dataGridView3.Rows[i].Cells[j].Value = "-";
                }
                else
                {
                    this.dataGridView3.Rows[i].Cells[j].Value = tmpCount;
                }                    
            }

            this.dataGridView3.Columns.Add("ColumnMx", "Mx");            
            Int32 tmp = 0;
            for (int i = 0; i <= this.dataGridView3.RowCount - 1; i++)
            {
                tmp = 0;
                for (int j = 1; j <= this.dataGridView3.ColumnCount - 2; j++)
                {
                    if (this.dataGridView3.Rows[i].Cells[j].Value.ToString() != "-")
                    {
                        tmp += Convert.ToInt32(this.dataGridView3.Rows[i].Cells[j].Value);
                    }
                }
                this.dataGridView3.Rows[i].Cells[dataGridView3.ColumnCount - 1].Value = tmp;
            }
            
            tmpCell = new DataGridViewTextBoxCell();
            tmpRow = new DataGridViewRow();
            tmpCell.Style.BackColor = Color.LightGray;
            tmpCell.Value = "My";
            tmpRow.Cells.AddRange(tmpCell);
            this.dataGridView3.Rows.Add(tmpRow);            

            for (int j = 1; j <= this.dataGridView3.ColumnCount - 1; j++)
            {
                tmp = 0;
                for (int i = 0; i <= this.dataGridView3.RowCount - 2; i++)
                {
                    if (this.dataGridView3.Rows[i].Cells[j].Value.ToString() != "-")
                    {
                        tmp += Convert.ToInt32(this.dataGridView3.Rows[i].Cells[j].Value);
                    }
                }
                this.dataGridView3.Rows[dataGridView3.RowCount - 1].Cells[j].Value = tmp;                 
            }            
        }

        private void button1_Click(object sender, EventArgs e)
        {
            // Шаги            
            Double Hx = Convert.ToDouble(this.dataGridView3.Rows[1].Cells[0].Value) - Convert.ToDouble(this.dataGridView3.Rows[0].Cells[0].Value),
                   Hy = Convert.ToDouble(this.dataGridView3.Columns[2].HeaderText) - Convert.ToDouble(this.dataGridView3.Columns[1].HeaderText);

            textBox1.Text = Hx.ToString();
            textBox2.Text = Hy.ToString();
            // Ложные нули            
            Double C1 = Convert.ToDouble(this.dataGridView3.Rows[this.dataGridView3.RowCount / 2].Cells[0].Value),
                   C2 = Convert.ToDouble(this.dataGridView3.Columns[this.dataGridView3.ColumnCount / 2].HeaderText);

            Int32 NullX = dataGridView3.RowCount / 2 - 1,
                  NullY = this.dataGridView3.ColumnCount / 2;

            textBox3.Text = C1.ToString() + " (" + NullX.ToString() + ")";
            textBox4.Text = C2.ToString() + " (" + NullY.ToString() + ")";
            // Заполняем расчетную таблицу
            this.dataGridView4.ColumnCount = 0;

            this.dataGridView4.Columns.Add("ColumnUV", "U\\V");
            for (int i = 1; i <= this.dataGridView3.ColumnCount - 2; i++)
            {
                this.dataGridView4.Columns.Add("Column" + i.ToString(), (i - NullY).ToString());               
            }

            DataGridViewCell tmpCell = null;
            DataGridViewRow tmpRow = null;

            for (int i = 0; i <= this.dataGridView3.RowCount - 2; i++)
            {
                tmpCell = new DataGridViewTextBoxCell();
                tmpRow = new DataGridViewRow();
                tmpCell.Style.BackColor = Color.LightGray;
                tmpCell.Value = (i - NullX).ToString();
                tmpRow.Cells.AddRange(tmpCell);
                this.dataGridView4.Rows.Add(tmpRow);
            }           

            // Считываем значения в матрицы
            Array mat = Array.CreateInstance(typeof(Double), this.dataGridView3.RowCount - 1, this.dataGridView3.ColumnCount - 2);
            for (int i = 0; i <= this.dataGridView3.RowCount - 2; i++)
            {                
                for (int j = 1; j <= this.dataGridView3.ColumnCount - 2; j++)
                {
                    if (this.dataGridView3.Rows[i].Cells[j].Value.ToString() == "-")
                    {
                        mat.SetValue(100500, i, j - 1);
                    }
                    else
                    {
                        mat.SetValue(Convert.ToDouble(this.dataGridView3.Rows[i].Cells[j].Value), i, j - 1);
                    }
                }                
            }

            Array matDown = Array.CreateInstance(typeof(Double), this.dataGridView3.RowCount - 1, this.dataGridView3.ColumnCount - 2);
            for (int i = mat.GetLowerBound(0); i <= mat.GetUpperBound(0); i++)
            {
                for (int j = mat.GetLowerBound(1); j <= mat.GetUpperBound(1); j++)
                {
                    if (Convert.ToDouble(mat.GetValue(i, j)) == 100500)
                    {
                        matDown.SetValue(100500, i, j);
                    }
                    else
                    {
                        matDown.SetValue(Convert.ToDouble(mat.GetValue(i, j)) * Convert.ToDouble(this.dataGridView4.Rows[i].Cells[0].Value), i, j);
                    }
                }
            }

            Array matUp = Array.CreateInstance(typeof(Double), this.dataGridView3.RowCount - 1, this.dataGridView3.ColumnCount - 2);
            for (int i = mat.GetLowerBound(0); i <= mat.GetUpperBound(0); i++)
            {
                for (int j = mat.GetLowerBound(1); j <= mat.GetUpperBound(1); j++)
                {
                    if (Convert.ToDouble(mat.GetValue(i, j)) == 100500)
                    {
                        matUp.SetValue(100500, i, j);
                    }
                    else
                    {
                        matUp.SetValue(Convert.ToDouble(mat.GetValue(i, j)) * Convert.ToDouble(this.dataGridView4.Columns[j + 1].HeaderText), i, j);
                    }
                }
            }

            // Выводим расчетную матрицу
            for (int i = 0; i <= this.dataGridView4.RowCount - 1; i++)
            {                
                for (int j = 1; j <= this.dataGridView4.ColumnCount - 1; j++)
                {
                    if (Convert.ToDouble(mat.GetValue(i, j - 1)) == 100500)
                    {
                        dataGridView4.Rows[i].Cells[j].Value = "-";
                    }
                    else
                    {
                        dataGridView4.Rows[i].Cells[j].Value = matDown.GetValue(i, j - 1) + "\\" + mat.GetValue(i, j - 1) + "\\" + matUp.GetValue(i, j - 1);
                    }
                }                
            }

            // Дополнительные данные
            this.dataGridView4.Columns.Add("ColumnMu", "mu");
            this.dataGridView4.Columns.Add("ColumnMuiui", "mui*ui");
            this.dataGridView4.Columns.Add("ColumnMuiui2", "mui*ui^2");
            this.dataGridView4.Columns.Add("ColumnUiE", "ui*E(mij)*vj");

            tmpCell = new DataGridViewTextBoxCell();
            tmpRow = new DataGridViewRow();
            tmpCell.Style.BackColor = Color.LightGray;
            tmpCell.Value = "mv";
            tmpRow.Cells.AddRange(tmpCell);
            this.dataGridView4.Rows.Add(tmpRow);

            tmpCell = new DataGridViewTextBoxCell();
            tmpRow = new DataGridViewRow();
            tmpCell.Style.BackColor = Color.LightGray;
            tmpCell.Value = "mvj*vj";
            tmpRow.Cells.AddRange(tmpCell);
            this.dataGridView4.Rows.Add(tmpRow);

            tmpCell = new DataGridViewTextBoxCell();
            tmpRow = new DataGridViewRow();
            tmpCell.Style.BackColor = Color.LightGray;
            tmpCell.Value = "mvj*vj^2";
            tmpRow.Cells.AddRange(tmpCell);
            this.dataGridView4.Rows.Add(tmpRow);

            tmpCell = new DataGridViewTextBoxCell();
            tmpRow = new DataGridViewRow();
            tmpCell.Style.BackColor = Color.LightGray;
            tmpCell.Value = "vj*E(mij)*ui";
            tmpRow.Cells.AddRange(tmpCell);
            this.dataGridView4.Rows.Add(tmpRow);

            Int32 tmp = 0;
            // mv    
            for (int j = 1; j <= this.dataGridView3.ColumnCount - 1; j++)
            {
                tmp = 0;
                for (int i = 0; i <= this.dataGridView3.RowCount - 2; i++)
                {
                    if (this.dataGridView3.Rows[i].Cells[j].Value.ToString() != "-")
                    {
                        tmp += Convert.ToInt32(this.dataGridView3.Rows[i].Cells[j].Value);
                    }
                }
                this.dataGridView4.Rows[dataGridView3.RowCount - 1].Cells[j].Value = tmp;
            }    
            // mu                               
            for (int i = 0; i <= this.dataGridView3.RowCount - 1; i++)
            {
                tmp = 0;
                for (int j = 1; j <= this.dataGridView3.ColumnCount - 2; j++)
                {
                    if (this.dataGridView3.Rows[i].Cells[j].Value.ToString() != "-")
                    {
                        tmp += Convert.ToInt32(this.dataGridView3.Rows[i].Cells[j].Value);
                    }
                }
                this.dataGridView4.Rows[i].Cells[dataGridView3.ColumnCount - 1].Value = tmp;
            }
            // mui*ui
            for (int i = 0; i <= this.dataGridView4.RowCount - 5; i++)
            {
                this.dataGridView4.Rows[i].Cells[dataGridView4.ColumnCount - 3].Value = Convert.ToDouble(this.dataGridView4.Rows[i].Cells[0].Value) * Convert.ToDouble(this.dataGridView4.Rows[i].Cells[dataGridView4.ColumnCount - 4].Value);
            }
            // mvj*vj
            for (int i = 1; i <= this.dataGridView4.ColumnCount - 5; i++)
            {
                this.dataGridView4.Rows[this.dataGridView4.RowCount - 3].Cells[i].Value = Convert.ToDouble(this.dataGridView4.Columns[i].HeaderText) * Convert.ToDouble(this.dataGridView4.Rows[this.dataGridView4.RowCount - 4].Cells[i].Value);
            }
            // mui*ui^2
            for (int i = 0; i <= this.dataGridView4.RowCount - 5; i++)
            {
                this.dataGridView4.Rows[i].Cells[dataGridView4.ColumnCount - 2].Value = Convert.ToDouble(this.dataGridView4.Rows[i].Cells[0].Value) * Convert.ToDouble(this.dataGridView4.Rows[i].Cells[0].Value) * Convert.ToDouble(this.dataGridView4.Rows[i].Cells[dataGridView4.ColumnCount - 4].Value);
            }
            // mvj*vj^2
            for (int i = 1; i <= this.dataGridView4.ColumnCount - 5; i++)
            {
                this.dataGridView4.Rows[this.dataGridView4.RowCount - 2].Cells[i].Value = Convert.ToDouble(this.dataGridView4.Columns[i].HeaderText) * Convert.ToDouble(this.dataGridView4.Columns[i].HeaderText) * Convert.ToDouble(this.dataGridView4.Rows[this.dataGridView4.RowCount - 4].Cells[i].Value);
            }
            // ui*E(mij)*vj
            Double Sum = 0;
            for (int i = mat.GetLowerBound(0); i <= mat.GetUpperBound(0); i++)
            {
                Sum = 0;
                for (int j = mat.GetLowerBound(1); j <= mat.GetUpperBound(1); j++)
                {
                    if (Convert.ToDouble(matUp.GetValue(i, j)) != 100500)                    
                    {
                        Sum += Convert.ToDouble(matUp.GetValue(i, j));
                    }
                }
                this.dataGridView4.Rows[i].Cells[this.dataGridView4.ColumnCount - 1].Value = Sum * Convert.ToDouble(this.dataGridView4.Rows[i].Cells[0].Value);
            }
            // vj*E(mij)*ui
            for (int i = mat.GetLowerBound(1); i <= mat.GetUpperBound(1); i++)
            {
                Sum = 0;
                for (int j = mat.GetLowerBound(0); j <= mat.GetUpperBound(0); j++)
                {
                    if (Convert.ToDouble(matDown.GetValue(j, i)) != 100500)
                    {
                        Sum += Convert.ToDouble(matDown.GetValue(j, i));
                    }
                }
                this.dataGridView4.Rows[this.dataGridView4.RowCount - 1].Cells[i + 1].Value = Sum * Convert.ToDouble(this.dataGridView4.Columns[i + 1].HeaderText);
            }
            // Подсчитаем суммы
            Sum = 0;
            for (int i = 1; i <= this.dataGridView4.ColumnCount - 5; i++)
            {
                Sum += Convert.ToDouble(this.dataGridView4.Rows[this.dataGridView4.RowCount - 3].Cells[i].Value);
            }
            this.dataGridView4.Rows[this.dataGridView4.RowCount - 3].Cells[this.dataGridView4.ColumnCount - 4].Value = Sum;

            Sum = 0;
            for (int i = 1; i <= this.dataGridView4.ColumnCount - 5; i++)
            {
                Sum += Convert.ToDouble(this.dataGridView4.Rows[this.dataGridView4.RowCount - 2].Cells[i].Value);
            }
            this.dataGridView4.Rows[this.dataGridView4.RowCount - 2].Cells[this.dataGridView4.ColumnCount - 4].Value = Sum;

            Sum = 0;
            for (int i = 1; i <= this.dataGridView4.ColumnCount - 5; i++)
            {
                Sum += Convert.ToDouble(this.dataGridView4.Rows[this.dataGridView4.RowCount - 1].Cells[i].Value);
            }
            this.dataGridView4.Rows[this.dataGridView4.RowCount - 1].Cells[this.dataGridView4.ColumnCount - 4].Value = Sum;

            Sum = 0;
            for (int i = 0; i <= this.dataGridView4.RowCount - 5; i++)
            {
                Sum += Convert.ToDouble(this.dataGridView4.Rows[i].Cells[this.dataGridView4.ColumnCount - 3].Value);
            }
            this.dataGridView4.Rows[this.dataGridView4.RowCount - 4].Cells[this.dataGridView4.ColumnCount - 3].Value = Sum;

            Sum = 0;
            for (int i = 0; i <= this.dataGridView4.RowCount - 5; i++)
            {
                Sum += Convert.ToDouble(this.dataGridView4.Rows[i].Cells[this.dataGridView4.ColumnCount - 2].Value);
            }
            this.dataGridView4.Rows[this.dataGridView4.RowCount - 4].Cells[this.dataGridView4.ColumnCount - 2].Value = Sum;

            Sum = 0;
            for (int i = 0; i <= this.dataGridView4.RowCount - 5; i++)
            {
                Sum += Convert.ToDouble(this.dataGridView4.Rows[i].Cells[this.dataGridView4.ColumnCount - 1].Value);
            }
            this.dataGridView4.Rows[this.dataGridView4.RowCount - 4].Cells[this.dataGridView4.ColumnCount - 1].Value = Sum;
            // Вычисление по формулам
            Double U, V, U2, V2, du, dv, r;

            U = Convert.ToDouble(this.dataGridView4.Rows[this.dataGridView4.RowCount - 4].Cells[this.dataGridView4.ColumnCount - 3].Value) / N;
            textBox5.Text = U.ToString();
            V = Convert.ToDouble(this.dataGridView4.Rows[this.dataGridView4.RowCount - 3].Cells[this.dataGridView4.ColumnCount - 4].Value) / N;
            textBox6.Text = V.ToString();
            U2 = Convert.ToDouble(this.dataGridView4.Rows[this.dataGridView4.RowCount - 4].Cells[this.dataGridView4.ColumnCount - 2].Value) / N;
            textBox7.Text = U2.ToString();
            V2 = Convert.ToDouble(this.dataGridView4.Rows[this.dataGridView4.RowCount - 2].Cells[this.dataGridView4.ColumnCount - 4].Value) / N;
            textBox8.Text = V2.ToString();
            du = Math.Sqrt(U2 - U * U);
            textBox9.Text = du.ToString();
            dv = Math.Sqrt(V2 - V * V);
            textBox10.Text = dv.ToString();
            r = (Convert.ToDouble(this.dataGridView4.Rows[this.dataGridView4.RowCount - 4].Cells[this.dataGridView4.ColumnCount - 1].Value) - N * U * V) / (N * du * dv);
            textBox11.Text = r.ToString();

            // Уравнение регрессий
            Double X, Y;

            X = U * Hx + C1;
            Y = V * Hy + C2;
            textBox18.Text = X.ToString();
            textBox17.Text = Y.ToString();            

            Double Pxy, Pyx;

            Pyx = r * Hy / Hx * dv / du;
            Pxy = r * Hx / Hy * du / dv;
            textBox16.Text = Pyx.ToString();
            textBox15.Text = Pxy.ToString();

            String yx, xy;
            yx = "y(x) = " + Math.Round(Pyx, 2).ToString() + "x - " + Math.Round(Pyx * X + Y, 2).ToString();
            xy = "x(y) = " + Math.Round(Pxy, 2).ToString() + "y - " + Math.Round(Pxy * Y + X, 2).ToString();
            textBox14.Text = yx;
            textBox13.Text = xy;

            int x1, x2, y1, y2;
            PaintEventArgs pea = new PaintEventArgs(this.panel1.CreateGraphics(), this.panel1.ClientRectangle);
            Graphics g = pea.Graphics;
            Pen pen = new Pen(Color.Red, 2);
            x1 = 0;
            y1 = (int)(Pyx * 0 - Pyx * X + Y);
            x2 = 100;
            y2 = (int)(Pyx * 100 - Pyx * X + Y);
            g.DrawLine(pen, x1 + 50, y1, x2 + 50, y2);

            pen = new Pen(Color.Blue, 2);
            x1 = (int)(Pxy * 0 - Pxy * Y + X);
            y1 = 0;
            x2 = (int)(Pxy * 100 - Pxy * Y + X);
            y2 = 100;
            g.DrawLine(pen, x1 + 50, y1, x2 + 50, y2);            
        }

        private void button2_Click(object sender, EventArgs e)
        {

        }
    }
}
