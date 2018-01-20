using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Drawing;

namespace simpleOCR
{
    public class Template
    {
        public Bitmap image;
        public Char value;

        public Template(Bitmap img, Char value)
        {
            this.value = value;
            this.image = new Bitmap(img);

            image = CreateTemplate(img);
            image.Save(@"Images" + "\\" + value + ".bmp", System.Drawing.Imaging.ImageFormat.Bmp);
        }

        private Bitmap CreateTemplate(Bitmap img)
        {
            Bitmap result = null;

            try
            {
                result = new Bitmap(16, 16);
                Graphics g = Graphics.FromImage(result);
                g.Clear(Color.White);
                g.DrawImage(img, 0, 0, 16, 16);
            }
            catch
            {

            }

            return result;
        }

    }
}
