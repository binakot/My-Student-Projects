using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace simpleOCR
{
    public partial class mainForm : Form
    {
        Recognizer recogniser;
        Bitmap image;
        int oldX, oldY;
        Point oldSize;
        bool msDown;

        public mainForm()
        {
            InitializeComponent();            
        }

        private void GenerateBtn_Click(object sender, EventArgs e)
        {
            List<Template> tptList = new List<Template>();
            new TptGenerateForm(tptList).ShowDialog();
            recogniser = new Recognizer(tptList);

            image = new Bitmap(pictureBox.Width, pictureBox.Height);

            using (var g = Graphics.FromImage(image))
                g.Clear(Color.White);

            pictureBox.Image = image;
        }

        private void AnalizeBtn_Click(object sender, EventArgs e)
        {
            image = (Bitmap)pictureBox.Image;
            textBox.Text = recogniser.Recognize(image).ToString();
        }

        private void ClearBtn_Click(object sender, EventArgs e)
        {
            pictureBox.Image = null;

            using (var g = Graphics.FromImage(image))
                g.Clear(Color.White);            
        }

        private void pictureBox_MouseDown(object sender, MouseEventArgs e)
        {
            oldX = e.X;
            oldY = e.Y;
            msDown = true;

            pictureBox.Image = image;
        }

        private void pictureBox_MouseMove(object sender, MouseEventArgs e)
        {
            if (msDown)
            {
                Pen pen = new Pen(Color.Black, 25);

                Graphics g = Graphics.FromImage(image);               
                g.DrawEllipse(pen, e.X, e.Y, 3, 3);
                oldX = e.X;
                oldY = e.Y;

                pictureBox.Image = image;
            }
        }

        private void pictureBox_MouseUp(object sender, MouseEventArgs e)
        {
            msDown = false;
        }

        private void mainForm_Load(object sender, EventArgs e)
        {

        }
    }
}
