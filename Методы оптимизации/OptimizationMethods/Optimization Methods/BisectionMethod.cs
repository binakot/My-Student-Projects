using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace Optimization_Methods
{
    public partial class BisectionMethod : Form
    { 
        public BisectionMethod()
        {
            InitializeComponent();
        }

        private void BisectionMethodButton_Click(object sender, EventArgs e)
        {
            double a = Convert.ToDouble(LeftBorderBox.Text);
            double b = Convert.ToDouble(RightBorderBox.Text);
            double eps = Convert.ToDouble(AccuracyBox.Text);
            string func = FunctionBox.Text;    
            string log = string.Empty;

            ResultBox.Text = Bisection(out log, a, b, eps).ToString();
            LogTextBox.Text = log;
        }

        private double Bisection(out string log, double leftBorder, double rightBorder, double accuracy)
        {
            log = "Метод половинного деления:\r\n\r\n" +
                  "Входные данные:\r\n" +
                  "     Левая граница a = " + leftBorder + "\r\n" +
                  "     Правая граница b = " + rightBorder + "\r\n" +
                  "     Точность eps = " + accuracy + "\r\n\r\n" +
                  "Итерации:\r\n\r\n";            

            double x1 = leftBorder + (rightBorder - leftBorder) / 4;
            double xm = (leftBorder + rightBorder) / 2;
            double x2 = rightBorder - (rightBorder - leftBorder) / 4;

            double y1 = FunctionClass.Function1(x1);
            double ym = FunctionClass.Function1(xm);
            double y2 = FunctionClass.Function1(x2);

            log += "a = " + leftBorder + " " + "b = " + rightBorder + " " + "xm = " + xm + " " + "x1 = " + x1 + " " + "x2 = " + x2 + "\r\n";
            log += "F(a) = " + FunctionClass.Function1(leftBorder) + " " + "F(b) = " + FunctionClass.Function1(rightBorder) + " " + "F(xm) = " + ym + " " + "F(x1) = " + y1 + " " + "F(x2) = " + y2 + "\r\n\r\n";

            int i = 0;

            while (Math.Abs(rightBorder - leftBorder) > accuracy)
            {
                i++;

                if ((y1 > ym) && (ym < y2))
                {
                    log += "# " + i + " y1 > ym && ym < y2\r\n";

                    leftBorder = x1;
                    rightBorder = x2;

                    log += "a = " + leftBorder + " " + "b = " + rightBorder + "\r\n";

                    x1 = leftBorder + (rightBorder - leftBorder) / 4;
                    x2 = rightBorder - (rightBorder - leftBorder) / 4;

                    log += "x1 = " + x1 + " " + "x2 = " + x2 + "\r\n";
                }
                else if ((y1 > ym) && (ym > y2))
                {
                    log += "# " + i + " y1 > ym && ym > y2\r\n";

                    leftBorder = xm;

                    log += "a = " + leftBorder + "\r\n";

                    x1 = leftBorder + (rightBorder - leftBorder) / 4;
                    x2 = rightBorder - (rightBorder - leftBorder) / 4;
                    xm = (leftBorder + rightBorder) / 2;

                    log += "x1 = " + x1 + " " + "xm = " + xm + " " + "x2 = " + x2 + "\r\n";

                    ym = FunctionClass.Function1(xm);
                }
                else if ((y1 < ym) && (ym < y2))
                {
                    log += "# " + i + " y1 < ym && ym < y2\r\n";

                    rightBorder = xm;

                    log += "b = " + rightBorder + "\r\n";

                    x1 = leftBorder + (rightBorder - leftBorder) / 4;
                    x2 = rightBorder - (rightBorder - leftBorder) / 4;
                    xm = (leftBorder + rightBorder) / 2;

                    log += "x1 = " + x1 + " " + "xm = " + xm + " " + "x2 = " + x2 + "\r\n";

                    ym = FunctionClass.Function1(xm);
                }

                y1 = FunctionClass.Function1(x1);
                y2 = FunctionClass.Function1(x2);

                log += "y1 = " + y1 + " " + "ym = " + ym + " " + "y2 = " + y2 + "\r\n";
                log += "xm = " + xm + "\r\n\r\n";                
            }

            return xm;
        }
    }
}
