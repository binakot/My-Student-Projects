using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace method_amper_volt
{
    public partial class CurrentSource : Form
    {
        public CurrentSource()
        {
            InitializeComponent();
        }

        private void CurrentSource_Load(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (comboBox1.SelectedItem.ToString())
            {
                case "APS3005Si":
                    textBox1.Text = "0";
                    textBox2.Text = "30";
                    textBox3.Text = "0";
                    textBox4.Text = "5";
                    break;
                case "Источники питания Б5-46":
                    textBox1.Text = "0,01";
                    textBox2.Text = "9,99";
                    textBox3.Text = "0,01";
                    textBox4.Text = "4,99";
                    break;
                case "Источники питания Б5-47":
                    textBox1.Text = "0,1";
                    textBox2.Text = "29,9";
                    textBox3.Text = "0,11";
                    textBox4.Text = "2,99";
                    break;
                case "Источники питания Б5-48":
                    textBox1.Text = "0,1";
                    textBox2.Text = "49,9";
                    textBox3.Text = "0,01";
                    textBox4.Text = "1,99";
                    break;
                case "Sorensen SG":
                    textBox1.Text = "40";
                    textBox2.Text = "600";
                    textBox3.Text = "8";
                    textBox4.Text = "2500";
                    break;
                case "Sorensen XFR ":
                    textBox1.Text = "0";
                    textBox2.Text = "600";
                    textBox3.Text = "0";
                    textBox4.Text = "300";
                    break;
                case "Sorensen DHP":
                    textBox1.Text = "5";
                    textBox2.Text = "50";
                    textBox3.Text = "133";
                    textBox4.Text = "3000";
                    break;
                case "Sorensen XHR":
                    textBox1.Text = "7,5";
                    textBox2.Text = "600";
                    textBox3.Text = "1,7";
                    textBox4.Text = "130";
                    break;
            }

            Data.EvMin = Convert.ToDouble(textBox1.Text);
            Data.EvMax = Convert.ToDouble(textBox2.Text);
            Data.EaMin = Convert.ToDouble(textBox3.Text);
            Data.EaMax = Convert.ToDouble(textBox4.Text);
        }
    }
}
