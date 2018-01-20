using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Cryptography
{
    public partial class EDSForm : Form
    {
        private RSA rsaMethod = new RSA();  // Метод RSA

        public EDSForm()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string key1, key2, log;
            int TotalSum;

            ChangeBox.Text = rsaMethod.Encode(InputBox.Text, out key1, out key2, out log, out TotalSum);
            KeyBox1.Text = key1; 
            KeyBox2.Text = key2;
            TSBox1.Text = TotalSum.ToString();
            
            LogForm form = new LogForm(log);
            form.Show();
        }

        private void DecodeSpy_Click(object sender, EventArgs e)
        {
            string log;
            int TotalSum;

            ChangeBox.Text = rsaMethod.Decode(ChangeBox.Text, KeyBox1.Text, KeyBox2.Text, out log, out TotalSum);
            TSBox2.Text = TotalSum.ToString();

            LogForm form = new LogForm(log);
            form.Show();
        }

        private void ChangeButton_Click(object sender, EventArgs e)
        {
            OutputBox.Text = ChangeBox.Text;
        }

        private void CheckButton_Click(object sender, EventArgs e)
        {
            string log;
            int TotalSum;

            OutputBox.Text = rsaMethod.Decode(OutputBox.Text, KeyBox1.Text, KeyBox2.Text, out log, out TotalSum);
            TSBox2.Text = TotalSum.ToString();

            LogForm form = new LogForm(log);
            form.Show();

            if (TSBox1.Text == TSBox2.Text)
                MessageBox.Show("Сообщение не изменилось");
            else
                MessageBox.Show("Сообщение изменилось");
        }        
    }
}
