using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.IO;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace NeuralNetworks
{
    public partial class HelpForm : Form
    {
        public HelpForm()
        {
            InitializeComponent();
        }

        private void Form3_Load(object sender, EventArgs e)
        {
            String path = Path.GetDirectoryName(Application.ExecutablePath) + "\\help.mht";

            webBrowser1.Navigate(path);
        }        
    }
}
