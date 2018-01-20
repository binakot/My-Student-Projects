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
    public partial class Gauss : Form
    {
        public Gauss()
        {
            InitializeComponent();
        }

        private void GaussButton_Click(object sender, EventArgs e)
        {
            OutBox.Text = string.Empty;

            double eps = Convert.ToDouble(EpsilonBox.Text);  // Точность вычислений
            double step = Convert.ToDouble(StepBox.Text);  // Начальный шаг
            // Начальное приближение
            double x = Convert.ToDouble(x0Box.Text);
            double y = Convert.ToDouble(y0Box.Text);
            
            int IterCount = 0;
            double fx, prevX, prevY, curX = x, curY = y;
            double leftBorder, rightBorder;
            double x1, xm, x2;
            double y1, ym, y2;
            double z1, zm, z2;

            do
            {
                IterCount++;

                prevX = curX;
                prevY = curY;

                // По 1 координате
                leftBorder = prevX - step;
                rightBorder = prevX + step;

                x1 = leftBorder + (rightBorder - leftBorder) / 4;
                xm = (leftBorder + rightBorder) / 2;
                x2 = rightBorder - (rightBorder - leftBorder) / 4;

                z1 = FunctionClass.Function2(x1, prevY);
                zm = FunctionClass.Function2(xm, prevY);
                z2 = FunctionClass.Function2(x2, prevY);

                while (Math.Abs(rightBorder - leftBorder) > eps)
                {
                    if ((z1 > zm) && (zm < z2))
                    {
                        leftBorder = x1;
                        rightBorder = x2;

                        x1 = leftBorder + (rightBorder - leftBorder) / 4;
                        x2 = rightBorder - (rightBorder - leftBorder) / 4;
                    }
                    else if ((z1 > zm) && (zm > z2))
                    {
                        leftBorder = xm;

                        x1 = leftBorder + (rightBorder - leftBorder) / 4;
                        x2 = rightBorder - (rightBorder - leftBorder) / 4;
                        xm = (leftBorder + rightBorder) / 2;

                        zm = FunctionClass.Function2(xm, prevY);
                    }
                    else if ((z1 < zm) && (zm < z2))
                    {
                        rightBorder = xm;

                        x1 = leftBorder + (rightBorder - leftBorder) / 4;
                        x2 = rightBorder - (rightBorder - leftBorder) / 4;
                        xm = (leftBorder + rightBorder) / 2;

                        zm = FunctionClass.Function2(xm, prevY);
                    }

                    z1 = FunctionClass.Function2(x1, prevY);
                    z2 = FunctionClass.Function2(x2, prevY);
                }

                curX = (leftBorder + rightBorder) / 2;

                // По 2 координате
                leftBorder = prevY - step;
                rightBorder = prevY + step;

                y1 = leftBorder + (rightBorder - leftBorder) / 4;
                ym = (leftBorder + rightBorder) / 2;
                y2 = rightBorder - (rightBorder - leftBorder) / 4;

                z1 = FunctionClass.Function2(curX, y1);
                zm = FunctionClass.Function2(curX, ym);
                z2 = FunctionClass.Function2(curX, y2);

                while (Math.Abs(rightBorder - leftBorder) > eps)
                {
                    if ((z1 > zm) && (zm < z2))
                    {
                        leftBorder = y1;
                        rightBorder = y2;

                        y1 = leftBorder + (rightBorder - leftBorder) / 4;
                        y2 = rightBorder - (rightBorder - leftBorder) / 4;
                    }
                    else if ((z1 > zm) && (zm > z2))
                    {
                        leftBorder = ym;

                        y1 = leftBorder + (rightBorder - leftBorder) / 4;
                        y2 = rightBorder - (rightBorder - leftBorder) / 4;
                        ym = (leftBorder + rightBorder) / 2;

                        zm = FunctionClass.Function2(curX, ym);
                    }
                    else if ((z1 < zm) && (zm < z2))
                    {
                        rightBorder = ym;

                        y1 = leftBorder + (rightBorder - leftBorder) / 4;
                        y2 = rightBorder - (rightBorder - leftBorder) / 4;
                        ym = (leftBorder + rightBorder) / 2;

                        zm = FunctionClass.Function2(curX, ym);
                    }

                    z1 = FunctionClass.Function2(curX, y1);
                    z2 = FunctionClass.Function2(curX, y2);
                }

                curY = (leftBorder + rightBorder) / 2;
            } 
            while (Math.Abs(FunctionClass.Function2(curX, curY) - FunctionClass.Function2(prevX, prevY)) > eps);           

            fx = FunctionClass.Function2(curX, curY);
            MinXBox.Text = curX.ToString();
            MinYBox.Text = curY.ToString();
            MinFBox.Text = fx.ToString();
            IterCountBox.Text = IterCount.ToString();  
        }       
    }
}
