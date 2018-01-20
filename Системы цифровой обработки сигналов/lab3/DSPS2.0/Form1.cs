using System;
using System.Windows.Forms;

namespace DSPS2._0
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            SendForm sendForm = new SendForm();
            sendForm.vFuncs.Add(CheckCheckBox(checkBox1, textBox1)); 
            sendForm.vFuncs.Add(CheckCheckBox(checkBox2, textBox2));
            sendForm.vFuncs.Add(CheckCheckBox(checkBox3, textBox3));
            if (checkBox4.Checked)
            {
                sendForm.i = GetFromTextBox(textBox4.Text);
                if (sendForm.i * 20 >= Convert.ToInt32(textBox5.Text))
                    sendForm.j = GetFromTextBox(textBox5.Text);
                else
                    sendForm.j = sendForm.i * 20;
                sendForm.k = GetFromTextBox(textBox6.Text);
            }
            else
            {
                sendForm.i = sendForm.j = -1;
                sendForm.k = 1;
            }
            sendForm.R = GetFromTextBoxD(textBox7.Text);
            sendForm.C = GetFromTextBoxD(textBox8.Text);

            Form2 graphicForm = new Form2(sendForm);
            graphicForm.Show();
        }

        private int GetFromTextBox(string tb)
        {
            if (tb != "")
                return Convert.ToInt32(tb);
            else
                return -1;
        }

        private double GetFromTextBoxD(string tb)
        {
            if (tb != "")
                return Convert.ToDouble(tb.Replace('.',','));
            else
                return -1;
        }

        private string CheckCheckBox(CheckBox cb, TextBox tb)
        {
            if (cb.Checked)
                return tb.Text;
            else
                return "";
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox1.Checked)
                textBox1.Enabled = true;
            else
                textBox1.Enabled = false;
        }

        private void checkBox2_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox2.Checked)
                textBox2.Enabled = true;
            else
                textBox2.Enabled = false;
        }

        private void checkBox3_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox3.Checked)
                textBox3.Enabled = true;
            else
                textBox3.Enabled = false;
        }

        private void checkBox4_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox4.Checked)
            {
                textBox4.Enabled = true;
                textBox5.Enabled = true;
                textBox6.Enabled = true;
            }
            else
            {
                textBox4.Enabled = false;
                textBox5.Enabled = false;
                textBox6.Enabled = false;
            }
            
        }
    }
}
