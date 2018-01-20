using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace InterNetInformer
{
    public partial class StartForm : Form
    {
        public StartForm()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            NetStatForm form = new NetStatForm();
            form.ShowDialog();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            NetResForm form = new NetResForm();
            form.ShowDialog();
        }
    }
}
