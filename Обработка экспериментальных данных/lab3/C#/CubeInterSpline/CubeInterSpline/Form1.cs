using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace CubeInterSpline
{
    public partial class Form1 : Form
    {
        // Сплайн
        static CubicSpline Spline = new CubicSpline();
        // Массивы узлов функции
        //public double[] x = { 0, Math.PI / 4.0, 2 * Math.PI / 4.0, 3 * Math.PI / 4.0, 4 * Math.PI / 4.0, 5 * Math.PI / 4.0, 6 * Math.PI / 4.0, 7 * Math.PI / 4.0, 8 * Math.PI / 4.0 };
        //public double[] y = { Math.Sin(0), Math.Sin(Math.PI / 4.0), Math.Sin(2 * Math.PI / 4.0), Math.Sin(3 * Math.PI / 4.0), Math.Sin(4 * Math.PI / 4.0), Math.Sin(5 * Math.PI / 4.0), Math.Sin(6 * Math.PI / 4.0), Math.Sin(7 * Math.PI / 4.0), Math.Sin(8 * Math.PI / 4.0) };
        public double[] x = { 0, 1, 2, 3, 4, 5, 6, 7, 8 };
        public double[] y = { 0.14, 0.99, 0.99, -1.0, 0.18, 0.22, 0.99, 0.66, 0.11 };
        // Количество интервалов
        public int n = 9;
        // Переменные и массивы для вывода сплайнов
        public static double tmpX, tmpY;
        public double[] X = new double[1000];
        public double[] Y = new double[1000];

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // Строим сплайн
            Spline.BuildSpline(x, y, n);            
            // Формируем массив для вывода
            // Шаг 0.01, интервал [0; 2*PI], 6.28 / 0.01 = 628 точек для вывода
            tmpX = 0;            
            for (int i = 0; i <= 628; i++)
            {
                X[i] = tmpX;
                Y[i] = Spline.Func(tmpX);
                tmpX += 0.01;
            }            
        }

        private void Form1_Paint(object sender, PaintEventArgs e)
        {
            Graphics gr = e.Graphics;
            Pen pen = new Pen(Color.Black, 1);
            gr.DrawLine(pen, 0, 300, 800, 300);
            gr.DrawLine(pen, 10, 0, 10, 600);
            pen = new Pen(Color.Green, 2);
            // Отмечаем интервалы интерполирования (2*PI - 0) / 8 = PI/4 = 3.14/4 = 0.785 = 79 пикселей
            for (int i = 0; i < n; i++)
            {
                gr.DrawLine(pen, i * 79 + 10, 295, i * 79 + 10, 305);
            }
            // Рисуем синусоиду
            pen = new Pen(Color.Blue, 1);
            for (int i = 0; i <= 628; i++)
            {
                //gr.DrawRectangle(pen, Convert.ToInt32(X[i] * 100) + 10, Convert.ToInt32(Math.Sin(X[i]) * 200) + 300, 1, 1);                
            }
            for (int i = 0; i < 8; i++)
            {
                gr.DrawRectangle(pen, Convert.ToInt32(x[i] * 100) + 10, Convert.ToInt32(y[i] * 200) + 300, 5, 5);  
            }
            // Рисуем сплайны
            pen = new Pen(Color.Red, 1);
            for (int i = 0; i <= 628; i++ )
               gr.DrawRectangle(pen, Convert.ToInt32(X[i]*100) + 10, Convert.ToInt32(Y[i]*200) + 300, 1, 1);
            gr.Dispose();
        }   
    }
}
