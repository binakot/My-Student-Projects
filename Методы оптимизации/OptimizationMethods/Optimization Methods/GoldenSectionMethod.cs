using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace Optimization_Methods
{
    public partial class GoldenSectionMethod : Form
    {
        public GoldenSectionMethod()
        {
            InitializeComponent();
        }

        private void GoldenSectionMethodButton_Click(object sender, EventArgs e)
        {
            double a = Convert.ToDouble(LeftBorderBox.Text);
            double b = Convert.ToDouble(RightBorderBox.Text);
            double eps = Convert.ToDouble(AccuracyBox.Text);
            string func = FunctionBox.Text;    
            string log = string.Empty;

            ResultBox.Text = GoldenSection(out log, a, b, eps).ToString();
            LogTextBox.Text = log;
        }

        private double GoldenSection(out string log, double leftBorder, double rightBorder, double accuracy)
        {
            log = "Метод золотого сечения:\r\n\r\n" +
                  "Входные данные:\r\n" +
                  "     Левая граница a = " + leftBorder + "\r\n" +
                  "     Правая граница b = " + rightBorder + "\r\n" +
                  "     Точность eps = " + accuracy + "\r\n\r\n" +
                  "Итерации:\r\n\r\n";

            double tau = (-1 + Math.Sqrt(5)) / 2.0;

            double x1 = leftBorder + (rightBorder - leftBorder) * tau;
            double x2 = rightBorder - (rightBorder - leftBorder) * tau;
            double xm = (leftBorder + rightBorder) / 2;

            double y1 = FunctionClass.Function1(x1);
            double y2 = FunctionClass.Function1(x2);
            double ym = FunctionClass.Function1(xm);

            log += "a = " + leftBorder + " " + "b = " + rightBorder + " " + "xm = " + xm + " " + "x1 = " + x1 + " " + "x2 = " + x2 + "\r\n";
            log += "F(a) = " + FunctionClass.Function1(leftBorder) + " " + "F(b) = " + FunctionClass.Function1(rightBorder) + " " + "F(xm) = " + ym + " " + "F(x1) = " + y1 + " " + "F(x2) = " + y2 + "\r\n\r\n";

            int i = 0;

            while (Math.Abs(rightBorder - leftBorder) > accuracy)
            {
                i++;

                if ((y1 < y2))
                {
                    log += "# " + i + " y1 < y2\r\n";

                    leftBorder = x2;
                    x2 = x1;
                    x1 = leftBorder + (rightBorder - leftBorder) * tau;

                    log += "x1 = " + x1 + "\r\n";
                    log += "x2 = " + x2 + "\r\n";
                }
                else if ((y1 > y2))
                {
                    log += "# " + i + " y1 > y2\r\n";

                    rightBorder = x1;
                    x1 = x2;
                    x2 = rightBorder - (rightBorder - leftBorder) * tau;

                    log += "x1 = " + x1 + "\r\n";
                    log += "x2 = " + x2 + "\r\n";
                }

                y1 = FunctionClass.Function1(x1);
                y2 = FunctionClass.Function1(x2);

                xm = (leftBorder + rightBorder) / 2;
                ym = FunctionClass.Function1(xm);

                log += "# " + i + "   " + xm + "\r\n\r\n";                
            }

            return xm;
        }
    }
}
