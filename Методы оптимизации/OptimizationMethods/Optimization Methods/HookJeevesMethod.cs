using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Optimization_Methods
{
    public partial class HookJeevesMethod : Form
    {
        public HookJeevesMethod()
        {
            InitializeComponent();
        }

        private void HookJeevesButton_Click(object sender, EventArgs e)
        {
            OutBox.Text = string.Empty;

            double eps = Convert.ToDouble(EpsilonBox.Text);  // Точность вычислений
            double step = Convert.ToDouble(StepBox.Text);  // Начальный шаг
            // Начальное приближение
            double x = Convert.ToDouble(x0Box.Text);
            double y = Convert.ToDouble(y0Box.Text);
            double y0 = FunctionClass.Function2(x, y);

            int IterCount = 0;            
            double fx;

            double lenght, y1, y2, y3, x1n, x2n, x1nn, x2nn;
            int fl = 0;  
            lenght = 1;
            
            do
            {
                fx = FunctionClass.Function2(x, y);
                OutBox.Text += "x = " + Math.Round(x, 6).ToString() + "   y = " + Math.Round(y, 6).ToString() + "   f(x, y) = " + Math.Round(fx, 6).ToString() + "\r\n";

                fl = 0;
                y1 = FunctionClass.Function2(x + step, y);
                if (y1 < y0)
                    x1n = x + step;
                else
                {
                    y1 = FunctionClass.Function2(x - step, y);
                    if (y1 < y0)
                        x1n = x - step;
                    else
                    {
                        x1n = x;
                        y1 = y0;
                    }
                }
                y2 = FunctionClass.Function2(x1n, y + step);
                if (y2 < y1)
                    x2n = y + step;
                else
                {
                    y2 = FunctionClass.Function2(x1n, y - step);
                    if (y2 < y1)
                        x2n = y - step;
                    else
                    {
                        x2n = y;
                        y2 = y1;
                    }
                }
                if ((x1n == x) && (x2n == y))
                {
                    if (step > eps)
                    {
                        fl = 1;
                        step = step / 2;
                    }
                }
                else
                {
                    fl = 1;
                    do
                    {
                        x1nn = x1n + lenght * (x1n - x);
                        x2nn = x2n + lenght * (x2n - y);
                        y3 = FunctionClass.Function2(x1nn, x2nn);
                        x = x1nn;
                        y = x2nn;
                        lenght = lenght * 0.5;
                    } while (y2 < y3);

                    IterCount++;                    
                    y0 = y3;
                }
            } while (fl == 1);

            fx = FunctionClass.Function2(x, y);
            MinXBox.Text = x.ToString();
            MinYBox.Text = y.ToString();
            MinFBox.Text = fx.ToString();            
            IterCountBox.Text = IterCount.ToString();  
        }        
    }
}
