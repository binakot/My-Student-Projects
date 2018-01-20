using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace BlottGame
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void условияИгрыToolStripMenuItem_Click(object sender, EventArgs e)
        {
            String str = "  Две воюющие армии ведут борьбу за два пункта. Первая армия\r\n" + 
                         "под командованием полковника Блотто состоит из четырёх (m = 4)\r\n" +
                         "полков;  вторая под командованием капитана Киже состоит из\r\n" + 
                         "трёх  (n = 3)  полков. Армия,  которая посылает больше полков на\r\n" + 
                         "тот или иной пункт, занимает его и уничтожает все направленные\r\n" + 
                         "на этот пункт силы противоположной стороны, получая единицу,\r\n" + 
                         "как за занятый пункт,   так и за каждый уничтоженный полк\r\n" + 
                         "противника. Полковник Блотто  (и капитан Киже) должен решить,\r\n" + 
                         "как распределить силы, чтобы выиграть как можно больше очков.\r\n";

            MessageBox.Show(str,"Правила игры");
        }

        private void условияИгрыToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            String str = "В игре учавствуют 2 игрока\r\n" +
                         "  N = {Блотто, Киже} - множество игроков\r\n" +
                         "Чистые стратегии полковника Блотто:\r\n" +
                         "  X1 = {(4,0),(3,1),(2,2),(1,3),(0,4)}\r\n" +
                         "Чистые стратегии капитана Киже:\r\n" +
                         "  X2 = {(3,0),(2,1),(1,2),(0,3)}\r\n";

            MessageBox.Show(str, "Условия игры");
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            DataGridViewCell firstCell = new DataGridViewTextBoxCell();
            DataGridViewCell secondCell = new DataGridViewTextBoxCell();
            DataGridViewCell thirdCell = new DataGridViewTextBoxCell();
            DataGridViewCell fourthCell = new DataGridViewTextBoxCell();
            DataGridViewCell fifthCell = new DataGridViewTextBoxCell();            
            DataGridViewRow row = new DataGridViewRow();
            firstCell.Value = "(4, 0)";
            secondCell.Value = "4";
            thirdCell.Value = "2";
            fourthCell.Value = "1";
            fifthCell.Value = "0";
            row.Cells.AddRange(firstCell, secondCell, thirdCell, fourthCell, fifthCell);
            this.dataGridView1.Rows.Add(row);

            firstCell = new DataGridViewTextBoxCell();
            secondCell = new DataGridViewTextBoxCell();
            thirdCell = new DataGridViewTextBoxCell();
            fourthCell = new DataGridViewTextBoxCell();
            fifthCell = new DataGridViewTextBoxCell();       
            row = new DataGridViewRow();
            firstCell.Value = "(3, 1)";
            secondCell.Value = "1";
            thirdCell.Value = "3";
            fourthCell.Value = "0";
            fifthCell.Value = "-1";
            row.Cells.AddRange(firstCell, secondCell, thirdCell, fourthCell, fifthCell);
            this.dataGridView1.Rows.Add(row);
            
            firstCell = new DataGridViewTextBoxCell();
            secondCell = new DataGridViewTextBoxCell();
            thirdCell = new DataGridViewTextBoxCell();
            fourthCell = new DataGridViewTextBoxCell();
            fifthCell = new DataGridViewTextBoxCell();  
            row = new DataGridViewRow();
            firstCell.Value = "(2, 2)";
            secondCell.Value = "-2";
            thirdCell.Value = "2";
            fourthCell.Value = "2";
            fifthCell.Value = "-2";
            row.Cells.AddRange(firstCell, secondCell, thirdCell, fourthCell, fifthCell);
            this.dataGridView1.Rows.Add(row);

            firstCell = new DataGridViewTextBoxCell();
            secondCell = new DataGridViewTextBoxCell();
            thirdCell = new DataGridViewTextBoxCell();
            fourthCell = new DataGridViewTextBoxCell();
            fifthCell = new DataGridViewTextBoxCell();  
            row = new DataGridViewRow();
            firstCell.Value = "(1, 3)";
            secondCell.Value = "-1";
            thirdCell.Value = "0";
            fourthCell.Value = "3";
            fifthCell.Value = "1";
            row.Cells.AddRange(firstCell, secondCell, thirdCell, fourthCell, fifthCell);
            this.dataGridView1.Rows.Add(row);

            firstCell = new DataGridViewTextBoxCell();
            secondCell = new DataGridViewTextBoxCell();
            thirdCell = new DataGridViewTextBoxCell();
            fourthCell = new DataGridViewTextBoxCell();
            fifthCell = new DataGridViewTextBoxCell();  
            row = new DataGridViewRow();
            firstCell.Value = "(0, 4)";
            secondCell.Value = "0";
            thirdCell.Value = "1";
            fourthCell.Value = "2";
            fifthCell.Value = "4";
            row.Cells.AddRange(firstCell, secondCell, thirdCell, fourthCell, fifthCell);
            this.dataGridView1.Rows.Add(row);  
        }

        private void button1_Click(object sender, EventArgs e)
        {
            button1.Enabled = false;
            button2.Enabled = true;

            int MinSum = 100, tmp, index = 0;
            for (int i = 0; i < 5; i++)
            {
                tmp = Convert.ToInt32(this.dataGridView1.Rows[i].Cells[1].Value) + Convert.ToInt32(this.dataGridView1.Rows[i].Cells[2].Value) + Convert.ToInt32(this.dataGridView1.Rows[i].Cells[3].Value) + Convert.ToInt32(this.dataGridView1.Rows[i].Cells[4].Value);
                if (tmp < MinSum)
                {
                    MinSum = tmp;
                    index = i;
                }
            }
           
            this.dataGridView1.Rows[index].Cells[1].Value = "0";
            this.dataGridView1.Rows[index].Cells[2].Value = "0";
            this.dataGridView1.Rows[index].Cells[3].Value = "0";
            this.dataGridView1.Rows[index].Cells[4].Value = "0";
        }

        private void button2_Click(object sender, EventArgs e)
        {
            button2.Enabled = false;
            button3.Enabled = true;
            
            textBox1.Text = "4";
            textBox2.Text = "2";
            textBox3.Text = "1";
            textBox4.Text = "3";

            textBox5.Text = "1";
            textBox6.Text = "0";
            textBox7.Text = "0";
            textBox8.Text = "-1";

            textBox9.Text = "-1";
            textBox10.Text = "0";
            textBox11.Text = "0";
            textBox12.Text = "1";

            textBox13.Text = "3";
            textBox14.Text = "1";
            textBox15.Text = "2";
            textBox16.Text = "4";
        }

        private void button3_Click(object sender, EventArgs e)
        {
            button3.Enabled = false;
            button4.Enabled = true;

            textBox17.Text = "4";
            textBox18.Text = "2";
            textBox19.Text = "1";
            textBox20.Text = "3";
        }

        private void button4_Click(object sender, EventArgs e)
        {
            button4.Enabled = false;

            Double a11 = Convert.ToDouble(textBox17.Text),
                 a12 = Convert.ToDouble(textBox18.Text),
                 a21 = Convert.ToDouble(textBox19.Text),
                 a22 = Convert.ToDouble(textBox20.Text);

            Double E = (a22 - a21) / (a11 - a12 - a21 + a22),                 
                   N = (a22 - a12) / (a11 - a12 - a21 + a22),                 
                   V = (a11*a22 - a12*a21) / (a11 - a12 - a21 + a22);

            textBox21.Text = E.ToString();
            textBox22.Text = "(" + E.ToString() + ", " + Convert.ToString(1.0 - E) + ")";

            textBox23.Text = N.ToString();
            textBox24.Text = "(" + N.ToString() + ", " + Convert.ToString(1.0 - N) + ")";

            textBox25.Text = V.ToString();
        }
    }
}
