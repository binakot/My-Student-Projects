using System;
using System.Collections;
using System.Collections.Generic;
using System.Drawing;
using System.Windows.Forms;
using System.IO;
using System.Drawing.Imaging;
using System.Runtime.InteropServices;

namespace simpleOCR
{
    public partial class TptGenerateForm : Form
    {
        Font font;
        List<Template> tptList;

        public TptGenerateForm()
        {
            InitializeComponent();
        }

        public TptGenerateForm(List<Template> tptList)
        {
            this.tptList = tptList;
            InitializeComponent();

            font = new Font("Arial", 14);          
        }

        private void button2_Click(object sender, EventArgs e)
        {
            GenerateTamplates(tbChars.Text, font);
            this.Close();
        }

        public void GenerateTamplates(string chars, Font fnt)
        {
            Bitmap bmp = new Bitmap(40 + (int)fnt.SizeInPoints, 40 + (int)fnt.SizeInPoints);
            fnt = new Font(fnt.FontFamily, fnt.SizeInPoints, fnt.Style);
            Graphics gr = Graphics.FromImage(bmp);
            
            for (int pos = 0; pos < chars.Length; pos++)
            {
                gr.Clear(Color.White);
                gr.DrawString(chars[pos].ToString(), fnt, Brushes.Black, 0, 0);

                Rectangle rct = ImageProcess.GetBorder(bmp);

                Bitmap tmp = ImageProcess.GetRegion(bmp, new Rectangle(rct.X, rct.Y, rct.Width, rct.Height));
                tmp = ImageProcess.SetSize(tmp, 0, 0, 16, 16);
                tmp = ImageProcess.Binarization(tmp, 100);

                string name;
                if (chars[pos] == chars.ToUpper()[pos])
                    name = "ImgB " + chars[pos];
                else
                    name = "ImgS " + chars[pos];
                
                tptList.Add(new Template(tmp, chars[pos]));                       
            }            
        }        
    }
}
