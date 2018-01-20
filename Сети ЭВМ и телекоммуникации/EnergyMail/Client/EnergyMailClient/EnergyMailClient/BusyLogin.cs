using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace EnergyMailClient
{
    public partial class BusyLogin : Form
    {
        public BusyLogin()
        {
            InitializeComponent();
        }

        private void OkBtn_Click(object sender, EventArgs e)
        {
            User.newLogin = NewLoginBox.Text;
            User.flag = "reply";
            Close();
        }

        private void CancelBtn_Click(object sender, EventArgs e)
        {
            User.flag = "cancel";
            Close();
        }           
    }
}
