using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace method_amper_volt
{
    public partial class Voltmeter : Form
    {
        public Voltmeter()
        {
            InitializeComponent();
        }

        private void Voltmeter_Load(object sender, EventArgs e)
        {
            richTextBox1.Text = "- Класс точности: 1,5. \n" +
                                "- Номинальное напряжение: 0-100 В. \n" +
                                "- Потребляемая мощность: 3,5 ВА. \n" +
                                "- Степень защиты: IP 52. \n" +
                                "- Габариты (ВхШхГ): 96х96х75 мм. \n";    
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (comboBox1.SelectedItem.ToString())
            {
                case "SE 16061":
                    textBox1.Text = "0";
                    textBox2.Text = "100";
                    richTextBox1.Text = "- Класс точности: 1,5. \n" +
                                        "- Номинальное напряжение: 0-100 В. \n" +
                                        "- Потребляемая мощность: 3,5 ВА. \n" +
                                        "- Степень защиты: IP 52. \n" +
                                        "- Габариты (ВхШхГ): 96х96х75 мм. \n";
                    break;
                case "SE 16005":
                    textBox1.Text = "0";
                    textBox2.Text = "500";
                    richTextBox1.Text = "- Класс точности: 1,5. \n" +
                                        "- Номинальное напряжение: 0-500 В. \n" +
                                        "- Потребляемая мощность: 3 ВА. \n" +
                                        "- Степень защиты: IP 52. \n" +
                                        "- Габариты (ВхШхГ): 72х72х75 мм. \n";
                    break;
                case "С509":
                    textBox1.Text = "0";
                    textBox2.Text = "1000";
                    richTextBox1.Text = "- Класс точности: 0,5. \n" +
                                        "- Номинальное напряжение: 0-1000 В. \n" +
                                        "- Габариты (ВхШхГ): 205(±1,45)х290(±1,6)х135(±2,0)мм. \n";
                    break;
            }

            Data.VMin = Convert.ToDouble(textBox1.Text);
            Data.VMax = Convert.ToDouble(textBox2.Text);           
        }
    }
}
