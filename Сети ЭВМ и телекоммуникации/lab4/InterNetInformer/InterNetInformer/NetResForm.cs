using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Reflection;

namespace InterNetInformer
{
    public partial class NetResForm : Form
    {
        public NetResForm()
        {
            InitializeComponent();
        }

        private void BrowserButton_Click(object sender, EventArgs e)
        {
            FolderBrowserDialog objFolderDialog = new FolderBrowserDialog();
            PathBox.Text = GetNetworkFolders(objFolderDialog);
        }

        public static string GetNetworkFolders(FolderBrowserDialog oFolderBrowserDialog)
        {
            Type type = oFolderBrowserDialog.GetType();
            FieldInfo fieldInfo = type.GetField("rootFolder", BindingFlags.NonPublic | BindingFlags.Instance);
            fieldInfo.SetValue(oFolderBrowserDialog, (Environment.SpecialFolder)18);    
            if (oFolderBrowserDialog.ShowDialog() == DialogResult.OK)
            {
                return oFolderBrowserDialog.SelectedPath;
            }
            else
            {
                return "";
            }
        }        
    }
}
