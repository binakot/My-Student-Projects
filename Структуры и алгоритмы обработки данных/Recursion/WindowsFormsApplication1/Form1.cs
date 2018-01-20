using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        public Int64 Fact(Int64 N)
        {
            if (N == 0) return 1;
            return N * Fact(N - 1);
        }

        public Double BigFact(Int64 N)
        {
            return Math.Pow(2 * Math.PI * N, 0.5) * Math.Pow(N / Math.E, N);            
        }

        public Double FactModM(Int64 N, Int64 M)
        {
            if (N <= 12)
                return Fact(N) % M;
            else
                return BigFact(N) % M;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Int64 N, M;

            N = Convert.ToInt64(textBox1.Text);
            M = Convert.ToInt64(textBox2.Text);
            textBox3.Text = Math.Round(FactModM(N, M)).ToString();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            long CurTime = 0, MaxTime = 0;            
            Int64 Nmax = 0, M = Convert.ToInt64(textBox2.Text);

            for (Int64 i = 0; i < Math.Pow(10, 6); i++)
            {
                long start = DateTime.Now.Ticks;
                FactModM(i, M);
                long end = DateTime.Now.Ticks;
                CurTime = end - start;
                if (MaxTime < CurTime)
                {
                    MaxTime = CurTime;
                    Nmax = i;
                } 
            }
            textBox4.Text = MaxTime.ToString();
            textBox5.Text = Nmax.ToString();
        }
    }
}


