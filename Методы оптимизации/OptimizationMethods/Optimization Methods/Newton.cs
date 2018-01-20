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
    public partial class Newton : Form
    {
        double eps;  // Условие остонова (точность)

        public Newton()
        {
            InitializeComponent();
        }

        private void NewtonButton_Click(object sender, EventArgs e)
        {
            OutBox.Text = string.Empty;

            // Шаг 1
            int k = 0;  // Счетчик итераций
            double x0, y0;  // Начальное приближение            
            double a = 1;  // Шаг для модифицированного метода 

            x0 = Convert.ToDouble(x0Box.Text);
            y0 = Convert.ToDouble(y0Box.Text);
            eps = Convert.ToDouble(EpsilonBox.Text);
            //a = Convert.ToDouble(StepBox.Text);

            double x = x0, y = y0;  // Текущая точка
            double[] grad = new double[2];  // Градиент
            double [,] matrix = new double[2, 2];  // Матрица Гессе
            double[,] invertMatrix = new double[2, 2];  // Обратная матрица Гессе           
            double[] p = new double[2];  // Направление спуска
            double[] curPoint = new double[2]; // Текущая точка
            double[] nextPoint = new double[2];  // Следущая точка 

            calculate:

            OutBox.Text += "Итерация № " + k.ToString() + "\r\n" +
                           "Текущая точка (" + x + ", " + y + ")\r\n" +
                           "Значение функции в точке " + FunctionClass.Function2(x, y) + "\r\n";

            // Вычисляем градиент
            grad = GetGrad(x, y);
            OutBox.Text += "Градиент\r\n (" + grad[0] + ", " + grad[1] + ")\r\n";
                        
            // Вычисляем матрицу Гессе
            matrix = GetHesse(x, y);
            OutBox.Text += "Матрица Гессе\r\n" +
                           "| " + matrix[0, 0] + " | " + matrix[0, 1] + " |\r\n" +
                           "| " + matrix[1, 0] + " | " + matrix[1, 1] + " |\r\n";
            // Шаг 2
            // Определяем обратную матрицу
            invertMatrix = InvertMatrix(matrix);
            if (invertMatrix == null)
                return;
            OutBox.Text += "Обратная матрица Гессе\r\n" +
                          "| " + invertMatrix[0, 0] + " | " + invertMatrix[0, 1] + " |\r\n" +
                          "| " + invertMatrix[1, 0] + " | " + invertMatrix[1, 1] + " |\r\n";            

            // Шаг 3
            // Определяем направление спуска
            p = GetDirect(grad, invertMatrix);
            OutBox.Text += "Направление спуска\r\n (" + p[0] + ", " + p[1] + ")\r\n";

            // Шаг 4
            // Определяем следующую точку
            curPoint[0] = x; 
            curPoint[1] = y;
            //a = GoldenSection(curPoint, eps, -10, 10, p);
            nextPoint = GetNextPoint(curPoint, a, p);
            OutBox.Text += "Новая точка (" + nextPoint[0] + ", " + nextPoint[1] + ")\r\n";

            // Шаг 5
            // Вычисление в новой точке градиента
            grad = GetGrad(nextPoint[0], nextPoint[1]);

            // Шаг 6
            // Если точность не достигнута, то продолжаем итерации   
            x = nextPoint[0];
            y = nextPoint[1];

            if ((Math.Sqrt(grad[0] * grad[0] + grad[1] * grad[1]) > eps && Math.Abs(FunctionClass.Function2(curPoint[0], curPoint[1]) - FunctionClass.Function2(nextPoint[0], nextPoint[1])) > eps))
            {
                k++;
                OutBox.Text += "________________________________\r\n";
                goto calculate;                
            }

            double f = FunctionClass.Function2(x, y);

            OutBox.Text += "*************************************\r\n" +
                           "Минимум функции равен " + f + "\r\n" +
                           "в точке (" + x + ", " + y + ")\r\n";

            MinXBox.Text = x.ToString();
            MinYBox.Text = y.ToString();
            MinFBox.Text = f.ToString();
            IterCountBox.Text = (k + 1).ToString();
        }

        public double GetDfDx(double _x, double _y)
        {
            return (FunctionClass.Function2(_x + Math.Pow(eps, 2), _y) - FunctionClass.Function2(_x, _y)) / Math.Pow(eps, 2);
        }

        public double GetDfDy(double _x, double _y)
        {
            return (FunctionClass.Function2(_x, _y + Math.Pow(eps, 2)) - FunctionClass.Function2(_x, _y)) / Math.Pow(eps, 2);
        }

        public double GetD2fDx2(double _x, double _y)
        {
            return (GetDfDx(_x + Math.Pow(eps, 2), _y) - GetDfDx(_x, _y)) / Math.Pow(eps, 2);
        }

        public double GetD2fDy2(double _x, double _y)
        {
            return (GetDfDy(_x, _y + Math.Pow(eps, 2)) - GetDfDy(_x, _y)) / Math.Pow(eps, 2);
        }

        public double GetD2fDxDy(double _x, double _y)
        {
            return (GetDfDx(_x, _y + Math.Pow(eps, 2)) - GetDfDx(_x, _y)) / Math.Pow(eps, 2);
        }

        public double GetD2fDyDx(double _x, double _y)
        {
            return (GetDfDy(_x + Math.Pow(eps, 2), _y) - GetDfDy(_x, _y)) / Math.Pow(eps, 2);
        }

        // Вычислить градиент функции в точке
        public double[] GetGrad(double _x, double _y)
        {
            double[] grad = new double[2];

            grad[0] = GetDfDx(_x, _y);
            grad[1] = GetDfDy(_x, _y);

            //grad[0] = 2 * _x;  // df/dx
            //grad[1] = 2 * _y;  // df/dy

            //grad[0] = 4 * Math.Pow(_x, 3) - 42 * _x - 14 + 4 * _x * _y + 2 * Math.Pow(_y, 2);
            //grad[1] = 4 * Math.Pow(_y, 3) - 26 * _y - 22 + 4 * _x * _y + 2 * Math.Pow(_x, 2);

            return grad;
        }

        // Вычислить матрицу Гессе функции в точке
        public double[,] GetHesse(double _x, double _y)
        {
            double[,] matrix = new double[2, 2];

            matrix[0, 0] = GetD2fDx2(_x, _y);  // d2f/dx2
            matrix[0, 1] = GetD2fDxDy(_x, _y);  // d2f/dxdy
            matrix[1, 0] = GetD2fDyDx(_x, _y);  // d2f/dydx
            matrix[1, 1] = GetD2fDy2(_x, _y);  // d2f/dy2

            //matrix[0, 0] = 2;  // d2f/dx2
            //matrix[0, 1] = 0;  // d2f/dxdy
            //matrix[1, 0] = 0;  // d2f/dydx
            //matrix[1, 1] = 2;  // d2f/dy2

            //matrix[0, 0] = 12 * Math.Pow(_x, 2) - 42 + 4 * _y;
            //matrix[0, 1] = 4 * _x + 4 * _y;
            //matrix[1, 0] = 12 * Math.Pow(_y, 2) - 26 + 4 * _x;
            //matrix[1, 1] = 4 * _x + 4 * _y;

            return matrix;
        }

        // Нахождение обратной матрицы
        public double[,] InvertMatrix(double[,] _matrix)
        {
            double[,] result = new double[2, 2];

            double det = _matrix[0, 0] * _matrix[1, 1] - _matrix[0, 1] * _matrix[1, 0];  // Определитель матрицы

            if (det == 0)
            {
                MessageBox.Show("Опеределитель матрицы Гессе равен 0");
                return null;
            }

            result[0, 0] = 1.0 / det * _matrix[0, 0];
            result[0, 1] = 1.0 / det * _matrix[0, 1];
            result[1, 0] = 1.0 / det * _matrix[1, 0];
            result[1, 1] = 1.0 / det * _matrix[1, 1];

            return result;
        }

        // Перемножение градиента на обратную матрицу
        public double[] GetDirect(double[] _grad, double[,] _invertMatrix)
        {
            double[] result = new double[2];

            result[0] = - 1.0f * (_grad[0] * _invertMatrix[0, 0] + _grad[1] * _invertMatrix[0, 1]);
            result[1] = - 1.0f * (_grad[0] * _invertMatrix[1, 0] + _grad[1] * _invertMatrix[1, 1]);

            return result;
        }

        public double[] GetNextPoint(double[] _curPoint, double _a, double[] _direct)
        {
            double[] result = new double[2];

            result[0] = _curPoint[0] + _a * _direct[0];
            result[1] = _curPoint[1] + _a * _direct[1];

            return result;
        }

        public double GoldenSection(double[] X, double eps, double left, double right, double[] p)
        {
            double a = left, b = right, t, x1, x2, F1, F2;
            int i = 0;

            t = 0.618;

            x1 = b - (b - a) * t;
            x2 = a + (b - a) * t;

            F1 = FunctionClass.Function2(X[0] + p[0], X[1] + p[1]);
            F2 = FunctionClass.Function2(X[0] + p[0], X[1] + p[1]);

            while (true)
            {
                i++;

                if (F1 <= F2)
                {
                    b = x2;
                    x2 = x1;
                    F2 = F1;
                    x1 = b - (b - a) * t;
                    F1 = FunctionClass.Function2(X[0] + p[0], X[1] + p[1]);
                }
                else
                {
                    a = x1;
                    x1 = x2;
                    F1 = F2;
                    x2 = a + (b - a) * t;
                    F2 = FunctionClass.Function2(X[0] + p[0], X[1] + p[1]);
                }

                if ((b - a) < eps) break;
            }

            x1 = (a + b) / 2;

            if (x1 == left)
            {
                GoldenSection(X, eps, x1 - right + left, x1, p);
            }
            else if (x1 == right)
            {
                GoldenSection(X, eps, x1, x1 + right - left, p);
            }

            return x1;
        }        
    }
}
