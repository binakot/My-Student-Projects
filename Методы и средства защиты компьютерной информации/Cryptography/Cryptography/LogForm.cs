using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace Cryptography
{
    public partial class LogForm : Form
    {
        public LogForm(string log)
        {
            InitializeComponent();
            LogBox.Text = log;
        }        
    }
}
