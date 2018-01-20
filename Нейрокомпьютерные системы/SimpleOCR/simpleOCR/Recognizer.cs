using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Drawing;

namespace simpleOCR
{
    class Recognizer
    {
        public List<Template> tptList;
        public Bitmap image;

        public Recognizer(List<Template> list)
        {
            tptList = new List<Template>(list);
        }

        public Char Recognize(Bitmap img)
        {
            Rectangle rct = ImageProcess.GetBorder(img);
            img = ImageProcess.GetRegion(img, new Rectangle(rct.X, rct.Y, rct.Width, rct.Height));
            img = ImageProcess.SetSize(img, 0, 0, 16, 16);
            img = ImageProcess.Binarization(img, 10);
            img.Save(@"Images" + "\\img.bmp", System.Drawing.Imaging.ImageFormat.Bmp);

            int maxSim = 0, sim, index = 0; ;
            for (int i = 0; i < tptList.Count; i++)
            {
                sim = Comparator(tptList[i].image, img);
                if (sim > maxSim)
                {
                    maxSim = sim;
                    index = i;
                }
            }

            return tptList[index].value;
        }

        public int Comparator(Bitmap img1, Bitmap img2)
        {
            int res = 0;

            for (int i = 0; i < img1.Height - 1; i++ )
                for (int j = 0; j < img1.Width - 1; j++)
                {
                    if (img1.GetPixel(i, j) == img2.GetPixel(i, j))
                        res++;
                }

            return res;
        }            
    }
}
