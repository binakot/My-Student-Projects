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
    public partial class Cauchy : Form
    {
        double leftBorder;
        double rightBorder;

        public Cauchy()
        {
            InitializeComponent();
        }

        private void CauchyButton_Click(object sender, EventArgs e)
        {
            leftBorder = Convert.ToDouble(LeftBorderBox.Text);
            rightBorder = Convert.ToDouble(RightBorderBox.Text);
            double[] x = new Double[2];
            x.SetValue(Convert.ToDouble(x0Box.Text), 0);
            x.SetValue(Convert.ToDouble(x1Box.Text), 1);
            double eps = Convert.ToDouble(EpsilonBox.Text);
            double h = Convert.ToDouble(StepBox.Text);
            OutBox.Clear();
            OutBox.AppendText(Grad(x, eps, h));       
        }

        // Метод Коши (Наискорейший градиентный спуск)
        private string Grad(double[] x0, double eps, double h)
        {
            // 1 шаг
            string result = "";
            double[] x = new double[x0.Length], grad = new double[x0.Length];
            double deltaX = 0;
            Int32 index = 0;
            x0.CopyTo(x, 0);

            result += "Начальная точка:\r\n";
            for (Int32 i = 0; i < x0.Length; i++)
                result += "x[" + i + "]=" + x0[i] + "\r\n";
            result += "F(x[0], x[1]) = " + FunctionClass.Function3(x0) + "\r\n\r\n";

            do
            {
                index++;

                // 2 шаг
                result += "Вычисление градиенты: \r\n";
                for (Int32 i = 0; i < x.Length; i++)
                {
                    grad[i] = GetdF(x0, i, eps);
                    result += grad[i] + "\r\n";
                }

                // 3 шаг отпадает, т.к. нет ограничений на кол-во итераций

                // 4 шаг
                h = GoldenSection(x, eps, leftBorder, rightBorder);
                result += "Шаг: " + h + "\r\n";

                // 5 шаг
                for (Int32 i = 0; i < x.Length; i++)
                    x[i] = x0[i] - h * GetdF(x0, i, eps);

                result += "\r\nНовая точка: \r\n";
                for (Int32 i = 0; i < x.Length; i++)
                {
                    result += "x[" + i + "] = " + x[i] + "\r\n";
                    deltaX = Math.Pow(x[i] - x0[i], 2);
                }

                result += "F(x[0], x[1]) = " + FunctionClass.Function3(x) + "\r\n\r\n";
                x.CopyTo(x0, 0);
            }
            // 6 шаг
            while (Math.Sqrt(Math.Abs(deltaX)) > eps);


            result += "Минимум:\r\n";
            for (Int32 i = 0; i < x.Length; i++)
                result += "x[" + i + "] = " + x[i] + "\r\n";
            result += "Значение: " + FunctionClass.Function3(x);

            MinXBox.Text = x[0].ToString();
            MinYBox.Text = x[1].ToString();
            MinFBox.Text = FunctionClass.Function3(x).ToString();
            IterCountBox.Text = index.ToString();

            return result;
        }

        private double GetdF(Double[] V, Int32 Index, double accuracy)
        {
            double[] temp = new double[V.Length];           

            for (Int32 i = 0; i < V.Length; i++)
                if (i == Index)
                    temp.SetValue(V[i] + accuracy, i);
                else
                    temp.SetValue(V[i], i);

            return (FunctionClass.Function3(temp) - FunctionClass.Function3(V)) / accuracy;
        }   

        private double dF(double[] x, double h, double eps)
        {
            double[] x1 = new double[10];
            x.CopyTo(x1, 0);

            for (int i = 0; i < x.Length; i++)
            {
                x1[i] = x[i] - h * GetdF(x, i, eps);
            }

            return FunctionClass.Function3(x1);
        }

        public double GoldenSection(double[] X, double eps, double left, double right)
        {
            double a = left, b = right, t, x1, x2, F1, F2;
            int i = 0;

            t = 0.618;

            x1 = b - (b - a) * t;
            x2 = a + (b - a) * t;

            F1 = dF(X, x1, eps);
            F2 = dF(X, x2, eps);

            while (true)
            {
                i++;

                if (F1 <= F2)
                {
                    b = x2;
                    x2 = x1;
                    F2 = F1;
                    x1 = b - (b - a) * t;
                    F1 = dF(X, x1, eps);
                }
                else
                {
                    a = x1;
                    x1 = x2;
                    F1 = F2;
                    x2 = a + (b - a) * t;
                    F2 = dF(X, x2, eps);
                }

                if ((b - a) < eps) break;
            }

            x1 = (a + b) / 2;

            if (x1 == left)
            {
                GoldenSection(X, eps, x1 - right + left, x1);
            }
            else if (x1 == right)
            {
                GoldenSection(X, eps, x1, x1 + right - left);
            }

            return x1;
        }        
    }
}
