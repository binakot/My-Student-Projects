using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace NeuralNetworks
{  
    public partial class MainForm : Form
    {       
        NeuralNW NET;  // Нейронная сеть
        String path = "";  // Путь к данным сети
        bool run = false;  // Флаг работы сети       

        public MainForm()
        {
            InitializeComponent();
        }

        #region Функции

        // Создать нейронную сеть
        public void CreateNW(int SizeX, int[] Layers)
        {
            NET = new NeuralNW(SizeX, Layers);
            path = "";
            txtLogs.AppendText("Создана полносвязная сеть:\r\n");
            txtLogs.AppendText("Число входов: " + Convert.ToString(SizeX) + "\r\n");
            txtLogs.AppendText("Число выходов: " + Convert.ToString(Layers[Layers.Count() - 1]) + "\r\n");
            txtLogs.AppendText("Число скрытых слоёв: " + Convert.ToString(Layers.Count() - 1) + "\r\n");

            for (int i = 0; i < Layers.Count() - 1; i++)
            {
                txtLogs.AppendText("Нейронов в " + Convert.ToString(i + 1) + " скрытом слое: " + Convert.ToString(Layers[i]) + "\r\n");
            }
        }

        #endregion
        
        #region Виджеты

        // Указать путь к обучающей выборке
        private void BrowseEducationFolderButton_Click(object sender, EventArgs e)
        {
            folderBrowserDialog1.ShowDialog();
            txtDir.Text = folderBrowserDialog1.SelectedPath;
        }

        // Обучение
        private void LearnButton_Click(object sender, EventArgs e)
        {
            if (NET == null)
            {
                txtLogs.AppendText("Не создана сеть!\r\n");
                return;
            }
            txtLogs.AppendText("Запущен процесс обучения\r\n");

            String strFileIn, strFileOut, strFile;

            // Очищаем список в обучающей выборке
            txtLernFiles.Text = "";
            FileInfo[] fInfo = new DirectoryInfo(txtDir.Text).GetFiles("*.in.txt");
            foreach (FileInfo f in fInfo)
            {
                // Загружаем список файлов
                strFileIn = f.FullName;
                strFile = strFileIn.Remove(strFileIn.Length - 7);
                strFileOut = strFile + ".out.txt";

                if (File.Exists(strFileOut) && File.Exists(strFileIn))
                {
                    txtLernFiles.AppendText(strFile + "\r\n");
                }
            }

            if (txtLernFiles.Lines.Count() > 0)
                txtLogs.AppendText("Загружена обучающая выборка\r\n");
            else
            {
                txtLogs.AppendText("Обучающая выборка не найдена\r\n");
                return;
            }

            int currPos = 0;
            double kErr = 1E256;
            double kErrNorm = Convert.ToDouble(txtKErr.Text);
            double kLern = Convert.ToDouble(txtKLern.Text);

            double[] X = new double[NET.GetX];
            double[] Y = new double[NET.GetY];
            String[] currFile;

            LearnButton.Enabled = false;
            StopButton.Enabled = true;
            run = true;
            while (kErr > kErrNorm)
            {
                kErr = 0;
                for (currPos = 0; currPos < txtLernFiles.Lines.Count() - 1; currPos++)
                {
                    // Загружаем обучающую пару
                    try
                    {
                        // Загружаем текущий входной файл
                        currFile = File.ReadAllLines(txtLernFiles.Lines[currPos] + ".in.txt");

                        for (int i = 0; i < NET.GetX; i++)
                            X[i] = Convert.ToDouble(currFile[i]);

                        // Загружаем текущий выходной файл
                        currFile = File.ReadAllLines(txtLernFiles.Lines[currPos] + ".out.txt");

                        for (int i = 0; i < NET.GetY; i++)
                            Y[i] = Convert.ToDouble(currFile[i]);
                    }
                    finally
                    { 
                    }

                    // Обучаем текущую пару
                    kErr += NET.LernNW(X, Y, kLern);

                    Application.DoEvents();

                    if (!run)
                        return;
                }
                txtLogs.AppendText("Текущая ошибка: " + Convert.ToString(kErr) + "\r\n");
            }
            txtLogs.AppendText("Обучение завершено!\r\n");

            LearnButton.Enabled = true;
            StopButton.Enabled = false;
            run = false;
        }

        // Остановить обучение
        private void StopButton_Click(object sender, EventArgs e)
        {
            LearnButton.Enabled = true;
            StopButton.Enabled = false;
            run = false;
            txtLogs.AppendText("Обучение остановлено пользователем\r\n");
        }    

        // Открыть файл для тестирования
        private void OpenTestFileButton_Click(object sender, EventArgs e)
        {
            if (NET == null)
            {
                txtLogs.AppendText("Не создана сеть!\r\n");
                return;
            }

            openFileDialog2.ShowDialog();

            String strFile = openFileDialog2.FileName;

            if (!File.Exists(strFile))
                return;

            double[] X = new double[NET.GetX];
            double[] Y;
            String[] currFile;

            InputVectorBox.Text = "";
            OutputVectorBox.Text = "";

            // Загружаем текущий входной файл
            currFile = File.ReadAllLines(strFile);
            InputVectorBox.Lines = currFile;
            txtLogs.AppendText("Загружен файл:\r\n" + Convert.ToString(strFile) + "\r\n");

            for (int i = 0; i < NET.GetX; i++)
            {
                X[i] = Convert.ToDouble(currFile[i]);
            }

            NET.NetOUT(X, out Y);

            for (int i = 0; i < NET.GetY; i++)
            {
                OutputVectorBox.AppendText(string.Format("{0:F4}\r\n", Y[i]));                
            }
        }

        // Тестирование
        private void TestButton_Click(object sender, EventArgs e)
        {
            if (NET == null)
            {
                txtLogs.AppendText("Не создана сеть!\r\n");
                return;
            }

            double[] X = new double[NET.GetX];
            double[] Y;

            OutputVectorBox.Text = "";

            // Загружаем текущий входной файл

            for (int i = 0; i < NET.GetX; i++)
            {
                X[i] = Convert.ToDouble(InputVectorBox.Lines[i]);
            }

            NET.NetOUT(X, out Y);

            for (int i = 0; i < NET.GetY; i++)
            {
                OutputVectorBox.AppendText(string.Format("{0:F4}\r\n", Y[i]));
            }
        }

        #endregion

        #region Файловое меню

        private void выходToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void нейроннуюСетьToolStripMenuItem_Click(object sender, EventArgs e)
        {
            NWCreateForm f = new NWCreateForm();

            if (f.ShowDialog() == DialogResult.OK)
            {
                CreateNW(f.getSizeX, f.getLayers);
            }
        }

        private void обучающуюВыборкуToolStripMenuItem_Click(object sender, EventArgs e)
        {
            DataCreateForm f = new DataCreateForm();
            f.ShowDialog();
        }

        #endregion                
    }
}
