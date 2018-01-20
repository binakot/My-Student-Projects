using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace method_amper_volt
{
    public partial class Ampermeter : Form
    {
        public Ampermeter()
        {
            InitializeComponent();
        }

        private void Ampermeter_Load(object sender, EventArgs e)
        {
            richTextBox1.Text = "- Размер лицевой панели: 80х80 мм \n" +
                                "- Вырез в щите: Ø77,5 мм \n" +
                                "- Класс точности: 1,5 или 2,5 \n" +
                                "- Вес: не более 0,2 кг \n" +
                                "- Температура: -50 … +60 град С \n";
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (comboBox1.SelectedItem.ToString())
            {
                case "М42300":
                    textBox1.Text = "0";
                    textBox2.Text = "15";
                    richTextBox1.Text = "- Размер лицевой панели: 80х80 мм \n" +
                                        "- Вырез в щите: Ø77,5 мм \n" +
                                        "- Класс точности: 1,5 или 2,5 \n" +
                                        "- Вес: не более 0,2 кг \n" +
                                        "- Температура: -50 … +60 град С \n";
                    break;
                case "М4264М":
                    textBox1.Text = "0";
                    textBox2.Text = "20";
                    richTextBox1.Text = "- Размер лицевой панели: 120х120 мм \n" +
                                        "- Вырез в щите: 112х112 мм \n" +
                                        "- Класс точности: 1,5 или 2,5 \n" +
                                        "- Вес: не более 0,35 кг \n" +
                                        "- Температура: -40 … +50 град С \n";
                    break;
                case "М42201":
                    textBox1.Text = "0";
                    textBox2.Text = "10";
                    richTextBox1.Text = "- Размер лицевой панели: 74х26 мм \n" +
                                        "- Вырез в щите: 60,5х24,5 мм \n" +
                                        "- Класс точности: 1,5 или 2,5 \n" +
                                        "- Вес: не более 0,2 кг \n" +
                                        "- Температура: -50 … +60 град С \n" +
                                        "- Степень защиты корпуса: IP50, степень защиты токоведущих выводов: IP00 \n";
                    break;
            }

            Data.AMin = Convert.ToDouble(textBox1.Text);
            Data.AMax = Convert.ToDouble(textBox2.Text);    
        }
    }
}
