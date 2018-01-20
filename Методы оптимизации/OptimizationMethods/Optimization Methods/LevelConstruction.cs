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
    public partial class LevelConstruction : Form
    {
        private Bitmap bitmap;        

        public LevelConstruction()
        {
            InitializeComponent();            
        }

        private void LevelConstruction_Load(object sender, EventArgs e)
        {
            bitmap = new Bitmap(GraphBox.Width, GraphBox.Height);
        }       

        private void BuildButton_Click(object sender, EventArgs e)
        {
            // Границы вычисления функции по осям X и Y
            double minX = Convert.ToDouble(MinXBox.Text);
            double maxX = Convert.ToDouble(MaxXBox.Text);
            double minY = Convert.ToDouble(MinYBox.Text);
            double maxY = Convert.ToDouble(MaxYBox.Text);
            // Масштаб
            double intervalX = maxX - minX;
            double intervalY = maxY - minY;
            double zoomX = intervalX / bitmap.Width;  // 1 пиксель : 1 ед.измерения оси X
            double zoomY = intervalY / bitmap.Height;  // 1 пиксель : 1 ед.измерения оси Y   
            double eps = Convert.ToDouble(EpsilonBox.Text);  // Точность        
            int levelCount = Convert.ToInt32(LevelBox.Text);  // Количество линий уровня
            // Уровни      
            int countX = Convert.ToInt32(bitmap.Width);
            int countY = Convert.ToInt32(bitmap.Height);
            double[,] values = new double[countX, countY];  // Сетка функции
            double[] levels = new double[levelCount];  // Уровни функции
            for (int i = 0; i < bitmap.Width; i++)
            {
                for (int j = 0; j < bitmap.Height; j++)
                {
                    double x = minX + i * zoomX;
                    double y = minY + j * zoomY;
                    double z = FunctionClass.Function2(x, y);

                    values[i, j] = z;
                }
            }
            double minValue = values[0, 0];  // Локальный минимум функции
            double maxValue = values[0, 0];  // Локальный максимум функции
            for (int i = 0; i < values.GetLength(0); i++)
            {
                for (int j = 0; j < values.GetLength(1); j++)
                {
                    if (values[i, j] < minValue)
                        minValue = values[i, j];

                    if (values[i, j] > maxValue)
                        maxValue = values[i, j];
                }
            }
            int levelStepX = bitmap.Width / levelCount / 2;
            int levelStepY = bitmap.Height / levelCount / 2;   
            for (int i = 0; i < levelCount; i++)
            {
                levels[i] = values[i * levelStepX, i * levelStepY];                
                   
            }
            // Рисуем линии уровней
            ProgressBar.Value = 0;
            ProgressBar.Maximum = bitmap.Width * bitmap.Height * levels.Length;

            for (int i = 0; i < bitmap.Width; i++)
            {
                for (int j = 0; j < bitmap.Height; j++)
                {
                    for (int k = 0; k < levels.Length; k++)
                    {
                        double x = minX + i * zoomX;
                        double y = minY + j * zoomY;
                        double z = FunctionClass.Function2(x, y);

                        if (z >= levels[k] - eps && z <= levels[k] + eps)
                        {
                            int c = (int)(255 * Math.Abs(z - levels[k]) / eps);
                            DrawPoint(i, bitmap.Height - j - 1, Color.FromArgb(c, c, c));
                        }

                        ProgressBar.Value++;
                    }
                }
            }
        }

        private void ClearButton_Click(object sender, EventArgs e)
        {
            bitmap = new Bitmap(GraphBox.Width, GraphBox.Height);
            GraphBox.Image = (Image)bitmap;

            ProgressBar.Value = 0;
        }

        private void DrawPoint(int x, int y, Color color)
        {
            bitmap.SetPixel(x, y, color);
            GraphBox.Image = (Image)bitmap;
        }   
    }
}
