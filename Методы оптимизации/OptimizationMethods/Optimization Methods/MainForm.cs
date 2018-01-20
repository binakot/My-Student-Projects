using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace Optimization_Methods
{
    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();
        }

        // Метод половинного деления
        private void button1_Click(object sender, EventArgs e)
        {
            BisectionMethod form = new BisectionMethod();
            form.Show();
        }

        // Метод золотого сечения
        private void button2_Click(object sender, EventArgs e)
        {
            GoldenSectionMethod form = new GoldenSectionMethod();
            form.Show();
        }

        // Построение линий уровня для функций двух переменных
        private void button3_Click(object sender, EventArgs e)
        {
            LevelConstruction form = new LevelConstruction();
            form.Show();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Gauss form = new Gauss();
            form.Show();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            HookJeevesMethod form = new HookJeevesMethod();
            form.Show();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            Cauchy form = new Cauchy();
            form.Show();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            Newton form = new Newton();
            form.Show();
        }     

    }
}
